import os

def load_dataset(in_dir: str, out_dir: str, is_train: bool, train_eval_ratio: str=0.7):
    in_out_files = list(zip(sorted(os.listdir(in_dir)), sorted(os.listdir(out_dir))))
    eval_threshold = len(in_out_files) * train_eval_ratio

    for i, (inp, out) in enumerate(in_out_files):
        if (is_train and i < eval_threshold) or (not is_train and i >= eval_threshold):
            f_inp = open(in_dir + '/' + inp, 'r').read()
            f_out = open(out_dir + '/' + out, 'r').read()
            yield (f_inp, f_out)
            