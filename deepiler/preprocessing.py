import os
from typing import Generator

import tensorflow as tf

from ast_builder import extract_ast


class Tokenizer(object):
    def __init__(self):
        pass
    
    def load_dataset(self, *args, **kwargs) -> Generator:
        raise NotImplementedError()

    def preprocess_dataset(self, *args, **kwargs) -> Generator:
        raise NotImplementedError()

    def postprocess_prediction(
        self,
        c_code: str,
    ) -> str:
        """Apply preprocessing on the raw assembly code.
        Mainly apply space between tokens in order to isolate them.
        """

        def postprocess_c(c_code: str) -> str:
            tokens = ['=', '(', ')', ';', ',']
            for tok in tokens:
                c_code = c_code.replace(f' {tok}', tok)
                c_code = c_code.replace(f'{tok} ', tok)
            return c_code

        return postprocess_c(c_code)

    def tokenize(
        self,
        dataset: Generator,
    ) -> tf.data.Dataset:
        """Tokenizes `dataset` using keras Tokenizer.
        """
        raw_data_asm, raw_data_c = list(zip(*dataset))
        raw_data_asm, raw_data_c = list(raw_data_asm), list(raw_data_c)

        raw_data_c_in = ['<start> ' + data for data in raw_data_c]
        raw_data_c_out = [data + ' <end>' for data in raw_data_c]

        """## Tokenization"""

        self.asm_tokenizer = tf.keras.preprocessing.text.Tokenizer(filters='')
        self.asm_tokenizer.fit_on_texts(raw_data_asm)
        self.data_asm = self.asm_tokenizer.texts_to_sequences(raw_data_asm)
        self.data_asm = tf.keras.preprocessing.sequence.pad_sequences(self.data_asm, padding='post')

        self.c_tokenizer = tf.keras.preprocessing.text.Tokenizer(filters='')
        self.c_tokenizer.fit_on_texts(raw_data_c_in)
        self.c_tokenizer.fit_on_texts(raw_data_c_out)
        self.data_c_in = self.c_tokenizer.texts_to_sequences(raw_data_c_in)
        self.data_c_in = tf.keras.preprocessing.sequence.pad_sequences(self.data_c_in, padding='post')

        self.data_c_out = self.c_tokenizer.texts_to_sequences(raw_data_c_out)
        self.data_c_out = tf.keras.preprocessing.sequence.pad_sequences(self.data_c_out,padding='post')

        self.c_tokenizer.get_config()
        ds = tf.data.Dataset.from_tensor_slices((self.data_asm, self.data_c_in, self.data_c_out))

        self.max_length = max(len(self.data_asm[0]), len(self.data_c_in[0]))
        return ds

    def disass_c_files(
        in_path: str,
        dest_path: str,
    ):
        """
        Disassemble c files and create associated files containing
        assembly code.

        Arguments:
        --------
        in_path: str
            path to the directory containing the c files to disassemble.
        dest_path: str
            destination path to create all the disassembled files.
        """
        if not os.path.isdir(dest_path):
            print(f'warning: {dest_path} dir already exists, asm files are replaced.')

        for f in os.listdir(in_path):
            f_path = f'{in_path}/{f}'
            disass_cmd = f'gcc -S -o {os.path.join(dest_path, f.split(".")[0])}.s {f_path}'
            os.system(disass_cmd)


class MipsTokenizer(Tokenizer):
    def __init__(self):
        super(MipsTokenizer, self).__init__()

    def load_dataset(
        self,
        x_dir: str,
        y_dir: str,
        is_train: bool,
        nb_files: int,
        train_eval_ratio: str=0.9,
    ) -> Generator:
        """Open all the files in `x_dir` and `y_dir` and compute the ast 
        for the files in x_dir (the mips asm files). Then the ast of the asm
        and the raw C code is yielded.
        """
        self.nb_files = nb_files
        self.train_eval_ratio = train_eval_ratio
        eval_threshold = nb_files * train_eval_ratio

        for i in range(nb_files):
            if (is_train and i < eval_threshold) or (not is_train and i >= eval_threshold):
                x_path = os.path.join(x_dir, f'rd_{i}.s')
                y_path = os.path.join(y_dir, f'rd_{i}.cc')
                c_code = open(y_path).read()
                ast_str = extract_ast(x_path)

                yield ast_str, c_code

    def preprocess_dataset(
        self,
        dataset: Generator,
    ) -> Generator:
        """Apply preprocessing on the raw assembly code.
        Mainly apply space between tokens in order to isolate them.
        """

        def preprocess_c(c_code: str) -> str:
            tokens = ['=', '(', ')', ';', ',']
            for tok in tokens:
                c_code = c_code.replace(tok, f' {tok} ')
            return c_code

        for (x, y) in dataset:
            y = preprocess_c(y)
            yield (x, y)


class RawCodeTokenizer(Tokenizer):
    def __init__(self):
        super(RawCodeTokenizer, self).__init__()

    def load_dataset(
        self,
        x_dir: str,
        y_dir: str,
        is_train: bool,
        nb_files: int,
        train_eval_ratio: str=0.9,
    ) -> Generator:
        """Open all the files in `x_dir` and `y_dir` and yield their
        content as a Generator of tuples.
        """
        self.nb_files = nb_files
        self.train_eval_ratio = train_eval_ratio
        in_out_files = list(zip(sorted(os.listdir(x_dir)), sorted(os.listdir(y_dir))))
        eval_threshold = len(in_out_files) * train_eval_ratio

        for i, (x, y) in enumerate(zip(sorted(os.listdir(x_dir)), sorted(os.listdir(y_dir)))):
            if (is_train and i < eval_threshold) or (not is_train and i >= eval_threshold):
                f_x = open(x_dir + '/' + x, 'r').read()
                f_y = open(y_dir + '/' + y, 'r').read()

                yield (f_x, f_y)

    def preprocess_dataset(
        self,
        dataset: Generator,
    ) -> Generator:
        """Apply preprocessing on the raw assembly code.
        Mainly apply space between tokens in order to isolate them.
        """

        def preprocess_asm(asm_code: str) -> str:
            spaced_brackets = asm_code.replace('(', ' ( ')
            spaced_brackets = spaced_brackets.replace(')', ' ) ')
            spaced_commas = spaced_brackets.replace(',', ' , ')
            return spaced_commas

        def preprocess_c(c_code: str) -> str:
            spaced_equals   = c_code.replace('=', ' = ')
            spaced_brackets = spaced_equals.replace('(', ' ( ')
            spaced_brackets = spaced_brackets.replace(')', ' ) ')
            spaced_semicol = spaced_brackets.replace(';', ' ; ')
            return spaced_semicol

        for (x, y) in dataset:
            x = preprocess_asm(x)
            y = preprocess_c(y)
            yield (x, y)
