import os
from typing import Generator
# import trax
import numpy as np
import itertools
from tokenizers import ByteLevelBPETokenizer
from pathlib import Path

from tokenizers.implementations.bert_wordpiece import BertWordPieceTokenizer

def load_dataset(
    x_dir: str,
    y_dir: str,
    is_train: bool,
    train_eval_ratio: str=0.7,
) -> Generator:
    in_out_files = list(zip(sorted(os.listdir(x_dir)), sorted(os.listdir(y_dir))))
    eval_threshold = len(in_out_files) * train_eval_ratio

    for i, (x, y) in enumerate(zip(sorted(os.listdir(x_dir)), sorted(os.listdir(y_dir)))):
        if i == 200:
            break
        if (is_train and i < eval_threshold) or (not is_train and i >= eval_threshold):
            f_x = open(x_dir + '/' + x, 'r').read()
            f_y = open(y_dir + '/' + y, 'r').read()
            yield (f_x, f_y)
            

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


def preprocess_dataset(
    dataset: Generator,
) -> Generator:
    """Apply preprocessing on the raw assembly code.
    Mainly apply space between tokens in order to isolate them.
    """

    def preprocess_asm(asm_code: str) -> str:
        # -72(%rbp) => -72 ( %rbp )
        # spaced_brackets = re.sub(r"\)(?!\s)(?!$)"," )", re.sub(r"(?<!^)(?<!\s)\("," ( ", asm_code))
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


class Tokenizer(object):
    def __init__(
        self,
        dataset: Generator,
    ):
        """This class is used to convert code samples as string
        to array of integers and vice versa.
        The neural network is only fed with numbers, that's why we
        have to tokenize the code as integers.
        """
        self._dataset = list(dataset)
        self._EOS = 1


    def build_vocabulary(
        self,
        vocab_dir: str,
        vocab_file: str,
    ):
        self._vocab_dir = vocab_dir
        self._vocab_file = vocab_file
        vocab = set()
        for (x, y) in self._dataset:
            # Build the vocabulary using a set.
            for (word_x, word_y) in list(itertools.zip_longest(x.split(), y.split())):
                if word_x != None:
                    vocab.add(word_x)
                if word_y != None:
                    vocab.add(word_y)

        vocab.add('<pad>_')
        vocab.add('<EOS>_')
        print(vocab)
        # Create the vocabulary file and write the set inside.
        with open(os.path.join(self._vocab_dir, self._vocab_file), 'w+') as vocab_file:
            vocab_file.write('\n'.join(vocab))


    def tokenize_dataset(
        self,
        vocabulary_file_path: str,
    ) -> Generator:
        """Creates the vocabulary file in the path given in the constructor.
        Adds an End Of Sentence (EOS) token to each sample and
        use trax.data.tokenize to convert the code in an array of integers.
        """ 
        paths = [str(x) for x in Path("./data/c_src_small").glob("**/*.cc")]
        tokenizer = BertWordPieceTokenizer()
        tokenizer.train(files=paths, vocab_size=52_000, min_frequency=2,
        special_tokens=[
            "<s>",
            "<pad>",
            "</s>",
            "<unk>",
            "<mask>",
        ])
        tokenizer.save_model(".", "vocabulary")
        print(tokenizer.encode("int main {return 0;}").tokens)
        # print(len(self._dataset))
        # tokenized_dataset = trax.data.tokenize(
        #     iter(self._dataset), vocab_file=self._vocab_file, vocab_dir=self._vocab_dir)
        
        # for (x, y) in tokenized_dataset:
        #     # Yield the same tokens but with EOS at the end.
        #     yield (list(x) + [self._EOS], list(y) + [self._EOS])
        

    # def tokenize(
    #     self,
    #     asm_code: str,
    # ) -> np.ndarray:
    #     """Converts code as string to an array on integers.
    #     """
    #     inputs =  next(trax.data.tokenize(
    #         iter([asm_code]), vocab_file=self._vocab_file, vocab_dir=self._vocab_dir))
    #     inputs = list(inputs) + [self._EOS]
        
    #     # Adding the batch dimension to the front of the shape
    #     batch_inputs = np.reshape(np.array(inputs), [1, -1])
    #     return batch_inputs


    # def detokenize(
    #     self,
    #     integers: np.ndarray,
    # ) -> str:
    #     """Converts the array of ints to an array of chars (string).
    #     """
    #     # Remove the dimensions of size 1
    #     integers = list(np.squeeze(integers))
        
    #     # Remove the EOS to decode only the original tokens
    #     if self._EOS in integers:
    #         integers = integers[:integers.index(self._EOS)] 
    #     return trax.data.detokenize(
    #         integers, vocab_file=self._vocab_file, vocab_dir=self._vocab_dir)
