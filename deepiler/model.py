import time
import os
from random import randrange

import numpy as np
import tensorflow as tf
from tqdm import tqdm
from nltk.translate.bleu_score import sentence_bleu
from tensorflow.python.data.ops.dataset_ops import BatchDataset

from ast_builder import extract_ast
from preprocessing import Tokenizer


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


class Encoder(tf.keras.Model):
    def __init__(
        self,
        vocab_size: int,
        model_size: int,
        nb_layers: int,
        h: int,
        pes: tf.Tensor,
    ):
        super(Encoder, self).__init__()
        self.model_size = model_size
        self.num_layers = nb_layers
        self.h = h
        self.embedding = tf.keras.layers.Embedding(vocab_size, model_size)
        self.attention = [MultiHeadAttention(model_size, h) for _ in range(nb_layers)]

        self.attention_norm = [tf.keras.layers.BatchNormalization() for _ in range(nb_layers)]

        self.dense_1 = [tf.keras.layers.Dense(512, activation='relu') for _ in range(nb_layers)]
        self.dense_2 = [tf.keras.layers.Dense(model_size) for _ in range(nb_layers)]
        self.ffn_norm = [tf.keras.layers.BatchNormalization() for _ in range(nb_layers)]
        self.pes = pes

    def call(
        self,
        sequence: tf.Tensor,
        padding_mask: tf.Tensor=None,
    ) -> tf.Tensor:
        embed_out = self.embedding(sequence)
        embed_out += self.pes[:sequence.shape[1], :]
        
        sub_in = embed_out
        
        for i in range(self.num_layers):
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
        pes: tf.Tensor,
    ):
        super(Decoder, self).__init__()
        self.model_size = model_size
        self.num_layers = nb_layers
        self.h = h
        self.embedding = tf.keras.layers.Embedding(vocab_size, model_size)
        self.attention_bot = [MultiHeadAttention(model_size, h) for _ in range(nb_layers)]
        self.attention_bot_norm = [tf.keras.layers.BatchNormalization() for _ in range(nb_layers)]
        self.attention_mid = [MultiHeadAttention(model_size, h) for _ in range(nb_layers)]
        self.attention_mid_norm = [tf.keras.layers.BatchNormalization() for _ in range(nb_layers)]
        
        self.dense_1 = [tf.keras.layers.Dense(512, activation='relu') for _ in range(nb_layers)]
        self.dense_2 = [tf.keras.layers.Dense(model_size) for _ in range(nb_layers)]
        self.ffn_norm = [tf.keras.layers.BatchNormalization() for _ in range(nb_layers)]
        
        self.dense = tf.keras.layers.Dense(vocab_size)
        self.pes = pes
        
    def call(
        self,
        sequence: tf.Tensor,
        encoder_output: tf.Tensor,
        padding_mask: tf.Tensor=None,
    ) -> tf.Tensor:
        embed_out = self.embedding(sequence)
        embed_out += self.pes[:sequence.shape[1], :]
        
        bot_sub_in = embed_out
        
        for i in range(self.num_layers):
            seq_len = bot_sub_in.shape[1]
            look_left_only_mask = tf.linalg.band_part(tf.ones((seq_len, seq_len)), -1, 0)
            bot_sub_out = self.attention_bot[i](bot_sub_in, bot_sub_in, look_left_only_mask)
            bot_sub_out = bot_sub_in + bot_sub_out
            bot_sub_out = self.attention_bot_norm[i](bot_sub_out)
            
            mid_sub_in = bot_sub_out

            mid_sub_out = self.attention_mid[i](mid_sub_in, encoder_output, padding_mask)
            mid_sub_out = mid_sub_out + mid_sub_in
            mid_sub_out = self.attention_mid_norm[i](mid_sub_out)

            ffn_in = mid_sub_out

            ffn_out = self.dense_2[i](self.dense_1[i](ffn_in))
            ffn_out = ffn_out + ffn_in
            ffn_out = self.ffn_norm[i](ffn_out)

            bot_sub_in = ffn_out
        
        logits = self.dense(ffn_out)
            
        return logits

class DeepilerModel(object):
    def __init__(
        self,
        tokenizer: Tokenizer,
        dataset: BatchDataset,
        model_size: int,
        asm_path: str,
        c_path: str,
        nb_layers: int=2,
        h: int=2,
    ) -> None:

        asm_vocab_size = len(tokenizer.asm_tokenizer.word_index) + 1
        c_vocab_size = len(tokenizer.c_tokenizer.word_index) + 1
        max_length = tokenizer.max_length

        pes = self._create_pos_embeddings(model_size, max_length)
        self.encoder = Encoder(asm_vocab_size, model_size, nb_layers, h, pes)
        self.decoder = Decoder(c_vocab_size, model_size, nb_layers, h, pes)

        self.dataset = dataset
        self.optimizer = tf.keras.optimizers.Adam()
        self.tokenizer = tokenizer
        self.c_path = c_path
        self.asm_path = asm_path
        self._trained = False
        self._save_model_labels = ["encoder.h5", "decoder.h5"]

        self.bleu_score = None

    def train(
        self,
        epochs: int,
        verbose: bool=True,
        predict: bool=True,
    ):
        """Training loop used to train the decompilation model.
        The gradient descent on each trainable layer is applied here.
        """
        self._trained = True
        start_time = time.time()
        for e in range(epochs):
            tqdm_bar = tqdm(self.dataset.take(-1))
            for batch, (source_code, target_code_in, target_code_out) in enumerate(tqdm_bar):
                loss = self._train_step(source_code, target_code_in,
                                target_code_out)
                if verbose:
                    tqdm_bar.set_description('Epoch {} Loss {:.4f}'.format(e + 1, loss.numpy()))
                
            if verbose:
                if (e + 1) % 2 == 0:
                    end_time = time.time()
                    print('Average elapsed time: {:.2f}s'.format((end_time - start_time) / (e + 1)))
                    
            if predict:
                self.predict(is_test_set=True, verbose=verbose)

    def predict(
        self,
        asm_file=None,
        is_test_set: bool=True,
        use_ast: bool=True,
        verbose: bool=True,
    ) -> str:
        """Runs a prediction on the trained encoder/decoder.
        train() has to be called before.
        Returns C code as a string: the decompiled assmelby code.
        If `asm_file` is set to None, a random sample from test dataset
        is peeked randomly, else the code in `asm_file` is used.
        If `use_ast` true, the ast for the chosen sample is built for the prediction.
        """
        self._check_initialized()

        if asm_file is None:
            n = self.tokenizer.nb_files
            ratio = int(self.tokenizer.train_eval_ratio * n)
            if is_test_set:
                rd = randrange(ratio, n)
            else:
                rd = randrange(0, ratio)
            c = open(os.path.join(self.c_path, f'rd_{rd}.cc'), 'r').read()
            if use_ast:
                asm_ast = extract_ast(os.path.join(self.asm_path, f'rd_{rd}.s'))
                asm_code = asm_ast
            else:
                asm_code = open(os.path.join(self.asm_path, f'rd_{rd}.s'), 'r').read()
        else:
            asm_code = open(asm_file, 'r').read()
        
        test_source_code = self.tokenizer.asm_tokenizer.texts_to_sequences([asm_code])
        asm_output = self.encoder(tf.constant(test_source_code))
        c_input = tf.constant([[self.tokenizer.c_tokenizer.word_index['<start>']]], dtype=tf.int64)

        out_words = []

        while True:
            c_output = self.decoder(c_input, asm_output)

            # pick the word with most probability
            new_word = tf.expand_dims(tf.argmax(c_output, -1)[:, -1], axis=1)
            out_words.append(self.tokenizer.c_tokenizer.index_word[new_word.numpy()[0][0]])
            c_input = tf.concat((c_input, new_word), axis=-1)

            if out_words[-1] == '<end>':
                break

        prediction = self.tokenizer.postprocess_prediction(' '.join(out_words))
        self.bleu_score = self._bleu_score([c], prediction)

        if verbose:
            print('---------- solution ----------')
            print(c)
            print('---------- prediction ----------')
            print(prediction)
            print('---------- BLEU score ----------')
            print(self.bleu_score)

    def save(
        self,
        path: str,
    ):
        """Saves the model to the disk in order to reuse the weights later.
        """
        self._check_initialized()
        if not os.path.exists(path):
            os.makedirs(path, exist_ok=False)
        
        paths = iter(list(map(lambda x: os.path.join(path, x), self._save_model_labels)))
        self.encoder.save_weights(next(paths))
        self.decoder.save_weights(next(paths))
        print('Model saved.')

    def load(
        self,
        path: str,
    ):
        """Loads a model that has been saved to the disk using save().
        """
        self.train(1, verbose=False)

        paths = iter(list(map(lambda x: os.path.join(path, x), self._save_model_labels)))
        self.encoder.load_weights(next(paths))
        self.decoder.load_weights(next(paths))
        print('Model loaded.')

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
            encoder_output = self.encoder(source_code, padding_mask)
            
            decoder_output = self.decoder(target_code_in, encoder_output, padding_mask)

            loss = self._compute_loss(target_code_out, decoder_output)

        variables = self.encoder.trainable_variables + self.decoder.trainable_variables
        gradients = tape.gradient(loss, variables)
        self.optimizer.apply_gradients(zip(gradients, variables))

        return loss

    def _create_pos_embeddings(
        self,
        model_size: int,
        max_length: int,
    ):
        """Creates position embeddings layer.
        """
        def positional_embedding(pos, model_size):
            PE = np.zeros((1, model_size))
            for i in range(model_size):
                if i % 2 == 0:
                    PE[:, i] = np.sin(pos / 10000 ** (i / model_size))
                else:
                    PE[:, i] = np.cos(pos / 10000 ** ((i - 1) / model_size))
            return PE

        pes = []
        for i in range(max_length):
            pes.append(positional_embedding(i, model_size))

        pes = np.concatenate(pes, axis=0)
        pes = tf.constant(pes, dtype=tf.float32)
        return pes

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

    def _bleu_score(
        self,
        x: str,
        y: str,
    ) -> float:
        """Computes the BLEU score between two samples of code.
        https://en.wikipedia.org/wiki/BLEU
        """
        return sentence_bleu(x, y)

    def _check_initialized(self):
        assert self._trained, "Model not trained yet, run train()"
