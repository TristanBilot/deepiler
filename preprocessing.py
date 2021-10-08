import os
import re
from typing import Generator

def load_dataset(
    x_dir: str,
    y_dir: str,
    is_train: bool,
    train_eval_ratio: str=0.7
) -> Generator:
    in_out_files = list(zip(sorted(os.listdir(x_dir)), sorted(os.listdir(y_dir))))
    eval_threshold = len(in_out_files) * train_eval_ratio

    for i, (x, y) in enumerate(in_out_files):
        if (is_train and i < eval_threshold) or (not is_train and i >= eval_threshold):
            f_x = open(x_dir + '/' + x, 'r').read()
            f_y = open(y_dir + '/' + y, 'r').read()
            yield (f_x, f_y)
            

def disass_c_files(
    in_path: str,
    dest_path: str
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
    dataset: Generator
) -> Generator:
    def preprocess_asm(asm_str: str) -> str:
        asm_str = open('data/disass_src/rd_9472.s', 'r').read()

        # -72(%rbp) => -72 ( %rbp )
        spaced_brackets = re.sub(r"\)(?!\s)(?!$)"," )", re.sub(r"(?<!^)(?<!\s)\("," ( ", asm_str))

        # %rax, %xmm0 => %rax , %xmm0
        spaced_commas = spaced_brackets.replace(',', ' ,')

        # %xmm0 , -72 ( %rbp) => %xmm0 , -72 ( %rbp )
        spaced_rbp = spaced_commas.replace('%rbp)', '%rbp )')
        return spaced_rbp

    for (x, y) in dataset:
        x = preprocess_asm(x)
        yield (x, y)
