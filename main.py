# from trax import layers as tl
# from trax.models.transformer import Transformer
# from trax import optimizers
# from trax.supervised import training

from preprocessing import load_dataset
import angr
import networkx as nx
import matplotlib.pyplot as plt
from angrutils import plot_cfg
 
p = angr.Project('./rd_o', load_options={'auto_load_libs': False})
cfg = p.analyses.CFGFast()
cfg = p.analyses.CFGEmulated(keep_state=True)
print("This is the graph:", cfg.graph.nodes[0])

G = cfg.graph

# subax1 = plt.subplot(121)
# nx.draw(G, with_labels=True, font_weight='bold')
# subax2 = plt.subplot(122)
# nx.draw_shell(G, nlist=[range(5, 10), range(5)], with_labels=True, font_weight='bold')
# plt.show()

main = p.loader.main_object.get_symbol("main")
print(type(main))
# print(len(main))
start_state = p.factory.blank_state(addr=main.rebased_addr)
cfg = p.analyses.CFGEmulated(fail_fast=True, starts=[main.rebased_addr], initial_state=start_state)
plot_cfg(cfg, "ais3_cfg", asminst=True, remove_imports=True, remove_path_terminator=True)  

# train_eval_ratio = 0.7
# nb_samples = 10_000
# train_dataset = load_dataset('data/asm_src', 'data/c_src', is_train=True, train_eval_ratio=train_eval_ratio)
# test_dataset = load_dataset('data/asm_src', 'data/c_src', is_train=False, train_eval_ratio=train_eval_ratio)

# assert len(list(train_dataset)) == int(nb_samples * train_eval_ratio)
# assert len(list(test_dataset)) == int(nb_samples * (1 - train_eval_ratio))

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