from deepiler.model import DeepilerModel
from deepiler.preprocessing import MipsTokenizer

import argparse

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--model-path")
    parser.add_argument("--train", action="store_true")
    parser.add_argument("--decompile", default=".")

    parser.add_argument("--asm-path", default="./deepiler/data/asm_src")
    parser.add_argument("--c-path", default="./deepiler/data/c_src")
    parser.add_argument("--train-eval-ratio", default=.9, type=float)
    parser.add_argument("--nb-files", default=10_000, type=int)
    parser.add_argument("--batch-size", default=32, type=int)
    parser.add_argument("--model-size", default=128, type=int)
    parser.add_argument("--epochs", default=40, type=int)
    parser.add_argument("--path-to-save-model", default="save")

    args = parser.parse_args()

    if args.train and args.decompile != ".":
        raise argparse.ArgumentError("Please choose train for training or decompile to run the model.")

    if not args.train and args.decompile == ".":
        raise argparse.ArgumentError("Use --decompile with the path to the file to decompile.")

    tokenizer = MipsTokenizer()
    train_dataset = tokenizer.load_dataset(args.asm_path, args.c_path, is_train=True, \
        nb_files=args.nb_files, train_eval_ratio=args.train_eval_ratio)
    dataset = tokenizer.preprocess_dataset(train_dataset)
    dataset = tokenizer.tokenize(dataset)
    dataset = dataset.shuffle(args.nb_files).batch(args.batch_size)
    model = DeepilerModel(tokenizer, dataset, args.model_size, args.asm_path, args.c_path)

    if args.train:
        model.train(args.epochs)
        model.save(args.path_to_save_model)
        print(f"Model saved in {args.path_to_save_model}.")

    if args.decompile:
        model = DeepilerModel(tokenizer, dataset, args.model_size, args.asm_path, args.c_path)
        model.load(args.path_to_save_model)
        prediction = model.predict(args.decompile, verbose=False)
        print(prediction)
