# from trax import layers as tl
# from trax.models.transformer import Transformer
# from trax import optimizers
# from trax.supervised import training

from preprocessing import Tokenizer, load_dataset, disass_c_files, preprocess_dataset

# disass_c_files('data/c_src', 'data/disass_src')


# p = angr.Project('./rd_o', load_options={'auto_load_libs': False})
# cfg = p.analyses.CFGFast()
# cfg = p.analyses.CFGEmulated(keep_state=True)
# print("This is the graph:", cfg.graph.nodes)

# G = cfg.graph
# main = p.loader.main_object.get_symbol("main")
# start_state = p.factory.blank_state(addr=main.rebased_addr)
# cfg = p.analyses.CFGEmulated(fail_fast=True, starts=[main.rebased_addr], initial_state=start_state)
# plot_cfg(cfg, "graph", asminst=True, remove_imports=True, remove_path_terminator=True)  



# Dataset building
train_eval_ratio = 0.7
nb_samples = 10_000
train_dataset = load_dataset('data/disass_src_small', 'data/c_src_small', is_train=True, train_eval_ratio=train_eval_ratio)
test_dataset = load_dataset('data/disass_src_small', 'data/c_src_small', is_train=False, train_eval_ratio=train_eval_ratio)
# print(next(train_dataset))

# assert len(list(train_dataset)) == int(nb_samples * train_eval_ratio)
# assert len(list(test_dataset)) == int(nb_samples * (1 - train_eval_ratio))
# Preprocessing
train_dataset = preprocess_dataset(train_dataset)
test_dataset = preprocess_dataset(test_dataset)

# print(next(train_dataset))
# for line in next(train_dataset)[0].split():
#     print(line)
#     print()

tokenizer = Tokenizer(train_dataset)
# tokenizer.build_vocabulary('data/', 'vocab_file.txt')
tokenized_dataset = tokenizer.tokenize_dataset('./vocabulary')
# print(next(tokenized_dataset))




# # Create a Transformer model.
# # Pre-trained model config in gs://trax-ml/models/translation/ende_wmt32k.gin
# model = Transformer(
#     input_vocab_size=33300,
#     d_model=512, d_ff=2048,
#     n_heads=8,
#     n_encoder_layers=6,
#     n_decoder_layers=6,
#     max_len=2048,
#     mode='predict')

# # Training task.
# train_task = training.TrainTask(
#     labeled_data=train_batches_stream,
#     loss_layer=tl.WeightedCategoryCrossEntropy(),
#     optimizer=optimizers.Adam(0.01),
#     n_steps_per_checkpoint=500,
# )


# # Tokenize a sentence.
# sentence = 'It is nice to learn new things today!'
# tokenized = list(trax.data.tokenize(iter([sentence]),  # Operates on streams.
#                                     vocab_dir='gs://trax-ml/vocabs/',
#                                     vocab_file='ende_32k.subword'))[0]

# # Decode from the Transformer.
# tokenized = tokenized[None, :]  # Add batch dimension.
# tokenized_translation = trax.supervised.decoding.autoregressive_sample(
#     model, tokenized, temperature=0.0)  # Higher temperature: more diverse results.

# # De-tokenize,
# tokenized_translation = tokenized_translation[0][:-1]  # Remove batch and EOS.
# translation = trax.data.detokenize(tokenized_translation,
#                                    vocab_dir='gs://trax-ml/vocabs/',
#                                    vocab_file='ende_32k.subword')
# print(translation)