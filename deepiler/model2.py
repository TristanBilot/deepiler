from typing import List, Tuple
from random import randrange

import tensorflow as tf
import numpy as np
import time
import os
from typing import Generator

from tensorflow.python.data.ops.dataset_ops import BatchDataset

class Tokenizer(object):
    def __init__(self):
        pass
    
    def load_dataset(
        self,
        x_dir: str,
        y_dir: str,
        is_train: bool,
        train_eval_ratio: str=0.7,
    ) -> Generator:
        """Open all the files in `x_dir` and `y_dir` and yield their
        content as a Generator of tuples.
        """
        in_out_files = list(zip(sorted(os.listdir(x_dir)), sorted(os.listdir(y_dir))))
        eval_threshold = len(in_out_files) * train_eval_ratio

        for i, (x, y) in enumerate(zip(sorted(os.listdir(x_dir)), sorted(os.listdir(y_dir)))):
            if (is_train and i < eval_threshold) or (not is_train and i >= eval_threshold):
                f_x = open(x_dir + '/' + x, 'r').read()
                f_y = open(y_dir + '/' + y, 'r').read()
                yield (f_x, f_y)

    def tokenize_datset(
        self,
        dataset: Generator,
    ) -> tf.data.Dataset:
        """Tokenizes `dataset` using keras Tokenizer.
        """
        asm_code, c_code = list(zip(*dataset))
        asm_code, c_code = list(asm_code), list(c_code)
        self.c_code_in = ['<start> ' + data for data in c_code]
        self.c_code_out = [data + ' <end>' for data in c_code]

        self.asm_tokenizer = tf.keras.preprocessing.text.Tokenizer(filters='')
        self.asm_tokenizer.fit_on_texts(asm_code)
        self.asm_data = self.asm_tokenizer.texts_to_sequences(asm_code)
        self.asm_data = tf.keras.preprocessing.sequence.pad_sequences(self.asm_data, padding='post')

        self.c_tokenizer = tf.keras.preprocessing.text.Tokenizer(filters='')
        self.c_tokenizer.fit_on_texts(self.c_code_in)
        self.c_tokenizer.fit_on_texts(self.c_code_out)
        self.c_data_in = self.c_tokenizer.texts_to_sequences(self.c_code_in)
        self.c_data_in = tf.keras.preprocessing.sequence.pad_sequences(self.c_data_in, padding='post')

        self.c_data_out = self.c_tokenizer.texts_to_sequences(self.c_code_out)
        self.c_data_out = tf.keras.preprocessing.sequence.pad_sequences(self.c_data_out, padding='post')
        return tf.data.Dataset.from_tensor_slices((self.asm_data, self.c_data_in, self.c_data_out))

    def tokenize_asm_sentence(
        self,
        asm_sentence: str,
    ) -> List:
        return self.asm_tokenizer.texts_to_sequences([asm_sentence])

    def detokenize_c_sentence(
        self,
        c_sentence: str,
    ) -> str:
        return self.c_tokenizer.index_word[c_sentence]

    def detokenize_asm_sentence(
        self,
        asm_sentence: str,
    ) -> str:
        return self.asm_tokenizer.index_word[asm_sentence]
        
    @property
    def max_length(self):
        self._check_initialized()
        return max(len(self.asm_data[0]), len(self.c_data_in[0]))

    @property
    def asm_vocab_size(self):
        self._check_initialized()
        return len(self.asm_tokenizer.word_index) + 1

    @property
    def c_vocab_size(self):
        self._check_initialized()
        return len(self.c_tokenizer.word_index) + 1

    def _check_initialized(self):
        assert hasattr(self, "asm_data"), "Tokenizer not initialized: use tokenize_datset()"
    

class PositionalEmbedding(object):
    def __init__(
        self,
        model_size: int,
        max_length: int,
    ):
        self._max_length = max_length
        self._model_size = model_size

    def __call__(
        self,
    ) -> tf.Tensor:
        """Builds `max_length` positional embeddings and returns them.
        """
        embeddings = []
        for i in range(self._max_length):
            embed = self._build_embedding(i)
            embeddings.append(embed)

        embeddings = np.concatenate(embeddings, axis=0)
        embeddings = tf.constant(embeddings, dtype=tf.float32)
        return embeddings

    def _build_embedding(
        self,
        pos: int,
    ):
        """Builds one embedding based on the position `pos`.
        Formulas are available here:
        https://kazemnejad.com/blog/transformer_architecture_positional_encoding/
        """
        model_size = self._model_size
        embedding = np.zeros((1, model_size))
        for i in range(model_size):
            if i % 2 == 0:
                embedding[:, i] = np.sin(pos / 10000 ** (i / model_size))
            else:
                embedding[:, i] = np.cos(pos / 10000 ** ((i - 1) / model_size))
        return embedding
        
class Encoder(tf.keras.Model):
    def __init__(
        self,
        vocab_size: int,
        model_size: int,
        nb_layers: int,
        h: int,
        pos_embeddings: tf.Tensor,
    ):
        super(Encoder, self).__init__()
        self.model_size = model_size
        self.nb_layers = nb_layers
        self.h = h
        self.pos_embeddings = pos_embeddings
        self.embedding = tf.keras.layers.Embedding(vocab_size, model_size)
        self.attention = [MultiHeadAttention(model_size, h) for _ in range(nb_layers)]

        self.attention_norm = [tf.keras.layers.BatchNormalization() for _ in range(nb_layers)]

        self.dense_1 = [tf.keras.layers.Dense(512, activation='relu') for _ in range(nb_layers)]
        self.dense_2 = [tf.keras.layers.Dense(model_size) for _ in range(nb_layers)]
        self.ffn_norm = [tf.keras.layers.BatchNormalization() for _ in range(nb_layers)]

    def call(
        self,
        sequence: tf.Tensor,
        padding_mask: tf.Tensor=None,
    ) -> tf.Tensor:
        embed_out = self.embedding(sequence)
        embed_out += self.pos_embeddings[:sequence.shape[1], :]
        
        sub_in = embed_out
        
        for i in range(self.nb_layers):
            sub_out = self.attention[i](sub_in, sub_in, padding_mask)
            sub_out = sub_in + sub_out
            sub_out = self.attention_norm[i](sub_out)
            
            ffn_in = sub_out

            ffn_out = self.dense_2[i](self.dense_1[i](ffn_in))
            ffn_out = ffn_in + ffn_out
            ffn_out = self.ffn_norm[i](ffn_out)

            sub_in = ffn_out
            
        return ffn_out


class Decoder(tf.keras.Model):
    def __init__(
        self,
        vocab_size: int,
        model_size: int,
        nb_layers: int,
        h: int,
        pos_embeddings: tf.Tensor,
    ):
        super(Decoder, self).__init__()
        self.model_size = model_size
        self.nb_layers = nb_layers
        self.h = h
        self.pos_embeddings = pos_embeddings
        self.embedding = tf.keras.layers.Embedding(vocab_size, model_size)
        self.attention_bot = [MultiHeadAttention(model_size, h) for _ in range(nb_layers)]
        self.attention_bot_norm = [tf.keras.layers.BatchNormalization() for _ in range(nb_layers)]
        self.attention_mid = [MultiHeadAttention(model_size, h) for _ in range(nb_layers)]
        self.attention_mid_norm = [tf.keras.layers.BatchNormalization() for _ in range(nb_layers)]
        
        self.dense_1 = [tf.keras.layers.Dense(512, activation='relu') for _ in range(nb_layers)]
        self.dense_2 = [tf.keras.layers.Dense(model_size) for _ in range(nb_layers)]
        self.ffn_norm = [tf.keras.layers.BatchNormalization() for _ in range(nb_layers)]
        
        self.dense = tf.keras.layers.Dense(vocab_size)
        
    def call(
        self,
        sequence: tf.Tensor,
        encoder_output: tf.Tensor,
        padding_mask: tf.Tensor=None,
    ) -> tf.Tensor:
        # Embedding and positional embedding
        embed_out = self.embedding(sequence)
        embed_out += self.pos_embeddings[:sequence.shape[1], :]
        
        bot_sub_in = embed_out
        
        for i in range(self.nb_layers):
            # Bottom multihead sublayer
            seq_len = bot_sub_in.shape[1]
            look_left_only_mask = tf.linalg.band_part(tf.ones((seq_len, seq_len)), -1, 0)
            bot_sub_out = self.attention_bot[i](bot_sub_in, bot_sub_in, look_left_only_mask)
            bot_sub_out = bot_sub_in + bot_sub_out
            bot_sub_out = self.attention_bot_norm[i](bot_sub_out)
            
            # Middle multihead sublayer
            mid_sub_in = bot_sub_out

            mid_sub_out = self.attention_mid[i](mid_sub_in, encoder_output, padding_mask)
            mid_sub_out = mid_sub_out + mid_sub_in
            mid_sub_out = self.attention_mid_norm[i](mid_sub_out)

            # FFN
            ffn_in = mid_sub_out

            ffn_out = self.dense_2[i](self.dense_1[i](ffn_in))
            ffn_out = ffn_out + ffn_in
            ffn_out = self.ffn_norm[i](ffn_out)

            bot_sub_in = ffn_out
        
        logits = self.dense(ffn_out)
        return logits


class MultiHeadAttention(tf.keras.Model):
    """MultiHeadAttention layer, as referred in the paper
    `Attention is all you need`.
    """
    def __init__(
        self,
        model_size: int,
        h: int,
    ):
        super(MultiHeadAttention, self).__init__()
        self.key_size = model_size // h
        self.h = h
        self.wq = tf.keras.layers.Dense(model_size)
        self.wk = tf.keras.layers.Dense(model_size)
        self.wv = tf.keras.layers.Dense(model_size)
        self.wo = tf.keras.layers.Dense(model_size)
    
    def call(
        self,
        decoder_output: tf.Tensor,
        encoder_output: tf.Tensor,
        mask: tf.Tensor=None,
    ) -> tf.Tensor:
        """Forward pass to the multi head attention layer.
        Returns `heads` of shape (batch, decoder_len, model_size)
        """
        query = self.wq(decoder_output)
        key = self.wk(encoder_output)
        value = self.wv(encoder_output)
        
        # Split for multihead attention
        batch_size = query.shape[0]
        query = tf.reshape(query, [batch_size, -1, self.h, self.key_size])
        query = tf.transpose(query, [0, 2, 1, 3])
        key = tf.reshape(key, [batch_size, -1, self.h, self.key_size])
        key = tf.transpose(key, [0, 2, 1, 3])
        value = tf.reshape(value, [batch_size, -1, self.h, self.key_size])
        value = tf.transpose(value, [0, 2, 1, 3])
        
        # Multi head attention formula
        score = tf.matmul(query, key, transpose_b=True) / tf.math.sqrt(tf.dtypes.cast(self.key_size, dtype=tf.float32))
        
        if mask is not None:
            score *= mask
            score = tf.where(tf.equal(score, 0), tf.ones_like(score) * -1e9, score)
        
        alignment = tf.nn.softmax(score, axis=-1)
        context = tf.matmul(alignment, value)
        context = tf.transpose(context, [0, 2, 1, 3])
        context = tf.reshape(context, [batch_size, -1, self.key_size * self.h])
        
        heads = self.wo(context)
        return heads

class DecompilerModel(object):
    def __init__(
        self,
        model_size: int,
        tokenizer: Tokenizer,
        pos_embeddings: tf.Tensor,
        train_dataset: BatchDataset,
        test_dataset: BatchDataset,
    ):
        self._model_size = model_size
        self._tokenizer = tokenizer
        self.pos_embeddings = pos_embeddings
        self._train_dataset = train_dataset
        self._test_dataset = test_dataset
        self._optimizer = tf.keras.optimizers.Adam()
        self._nb_samples = nb_samples

    def predict(
        self,
        asm_code: str=None,
    ) -> str:
        """Runs a prediction on the trained encoder/decoder.
        train() has to be called before.
        Returns C code as a string: the decompiled assmelby code.
        If `asm_code` is set to None, a random sample from test dataset
        is peeked randomly.
        """
        self._check_initialized()
        
        if asm_code is None:
            asm_code, c_code = self._peek_random_sample_code()

        tokenized_asm = self._tokenizer.tokenize_asm_sentence(asm_code)
        asm_output = self._encoder(tf.constant(tokenized_asm))
        c_tokenizer = self._tokenizer.c_tokenizer
        c_input = tf.constant([[c_tokenizer.word_index['<start>']]], dtype=tf.int64)
        
        prediction = ""
        while True:
            c_output = self._decoder(c_input, asm_output)
            new_word = tf.expand_dims(tf.argmax(c_output, -1)[:, -1], axis=1)

            decoded_word = self._tokenizer.detokenize_c_sentence(new_word.numpy()[0][0])
            prediction += decoded_word
            c_input = tf.concat((c_input, new_word), axis=-1)

            if prediction[-1] == '<end>' or len(prediction) >= 14: # MAYBE TRY TO NOT PUT 14
                break
        
        print('------- prediction -------')
        print(prediction)
        print()
        print('------- actual -------')
        print(c_code)

        return prediction


    def train(
        self,
        epochs: int,
        nb_layers: int=2,
        h: int=2,
    ):
        """Training loop used to train the decompilation model.
        The gradient descent on each trainable layer is applied here.
        """
        asm_vocab_size = self._tokenizer.asm_vocab_size
        c_vocab_size = self._tokenizer.c_vocab_size

        self._encoder = Encoder(asm_vocab_size, self._model_size, nb_layers, h, self.pos_embeddings)
        self._decoder = Decoder(c_vocab_size, self._model_size, nb_layers, h, self.pos_embeddings)

        start_time = time.time()
        for e in range(epochs):
            for batch, (source_code, target_code_in, target_code_out) in enumerate(self._train_dataset.take(-1)):
                loss = self._train_step(source_code, target_code_in, target_code_out)

            print('Epoch {} Loss {:.4f}'.format(e + 1, loss.numpy()))

            if (e + 1) % 2 == 0:
                end_time = time.time()
                print('Average elapsed time: {:.2f}s'.format((end_time - start_time) / (e + 1)))
                self.predict()
                # FAIRE DISTANCE DE LEVENSHTEIN

    @tf.function
    def _train_step(
        self,
        source_code: tf.Tensor,
        target_code_in: tf.Tensor,
        target_code_out: tf.Tensor,
    ) -> tf.Tensor:
        """Applies gradient descent on the loss and use Adam optim.
        Returns the loss as a Tensor of dimension 0 (scalar).
        """
        with tf.GradientTape() as tape:
            padding_mask = 1 - tf.cast(tf.equal(source_code, 0), dtype=tf.float32)
            padding_mask = tf.expand_dims(padding_mask, axis=1)
            padding_mask = tf.expand_dims(padding_mask, axis=1)
            encoder_output = self._encoder(source_code, padding_mask)
            decoder_output = self._decoder(target_code_in, encoder_output, padding_mask)

            loss = self._compute_loss(target_code_out, decoder_output)

        variables = self._encoder.trainable_variables + self._decoder.trainable_variables
        gradients = tape.gradient(loss, variables)
        self._optimizer.apply_gradients(zip(gradients, variables))
        return loss

    
    def _compute_loss(
        self,
        x: tf.Tensor,
        y: tf.Tensor,
    ) -> tf.Tensor:
        """Computes the loss between `x` and `y` using SparseCategoricalCrossentropy.
        """
        mask = tf.math.logical_not(tf.math.equal(x, 0))
        mask = tf.cast(mask, dtype=tf.int64)

        crossentropy = tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True)
        loss = crossentropy(x, y, sample_weight=mask)
        return loss


    def _peek_random_sample_code(
        self,
    ) -> Tuple:
        """Returns a randomly selected sample of asm and c code from the dataset.
        The dataset is expected to contain only embeddings, not the code directly.
        """
        rd = randrange(len(self._test_dataset))
        return self._test_dataset[rd]

    def _check_initialized(self):
        assert hasattr(self, "_encoder"), "Model not trained yet, run train()"



if __name__ == '__main__':

    # Load dataset
    c_path = "./data/c_src_small"
    asm_path = "./data/disass_src_small"

    tokenizer = Tokenizer()
    split = .9
    dataset = tokenizer.load_dataset(c_path, asm_path, is_train=True, train_eval_ratio=1)
    test_dataset = tokenizer.load_dataset(c_path, asm_path, is_train=False, train_eval_ratio=split)

    def inverse_tuples(dataset: Generator):
        for (x, y) in dataset:
            yield (y, x)

    dataset = inverse_tuples(dataset)
    test_dataset = inverse_tuples(test_dataset)
    test_dataset = list(test_dataset)

    # Tokenize
    dataset = tokenizer.tokenize_datset(dataset)

    # Batch
    batch_size = 3
    dataset = dataset.shuffle(20).batch(batch_size)
    train_ratio = int(len(dataset) * split)
    train_dataset = dataset.take(train_ratio)

    # Model
    model_size = 128
    max_length = tokenizer.max_length
    pos_embeddings = PositionalEmbedding(model_size, max_length)()

    nb_samples = len(dataset)
    model = DecompilerModel(model_size, tokenizer, pos_embeddings, train_dataset, test_dataset)
    epochs = 10
    model.train(epochs)
