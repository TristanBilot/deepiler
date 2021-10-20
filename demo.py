from deepiler.model import DeepilerModel
from deepiler.preprocessing import MipsTokenizer, RawCodeTokenizer

if __name__ == '__main__':

    # Dataset loading
    c_path = "./data/c_src"
    asm_path = "./data/asm_src"

    tokenizer = MipsTokenizer()
    train_eval_ratio = .9
    nb_files = 10_000
    train_dataset = tokenizer.load_dataset(asm_path, c_path, is_train=True, \
        nb_files=nb_files, train_eval_ratio=train_eval_ratio)

    #  Preprocessing & tokenization 
    dataset = tokenizer.preprocess_dataset(train_dataset)
    dataset = tokenizer.tokenize(dataset)

    batch_size = 32
    dataset = dataset.shuffle(nb_files).batch(batch_size)

    # Model creation & training
    model_size = 128
    model = DeepilerModel(tokenizer, dataset, model_size, asm_path, c_path)
    epochs = 25
    model.train(epochs)

    # Model saving to disk
    model.save('../model_weights')

    # Model loading
    new_model = DeepilerModel(tokenizer, dataset, model_size, asm_path, c_path)
    new_model.load('../model_weights')

    # New prediction
    new_model.predict(is_test_set=True)
