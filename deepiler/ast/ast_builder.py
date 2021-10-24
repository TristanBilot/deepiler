from deepiler.ast.mips_ast import Graphs_build_mips
from deepiler.ast.x86_ast import Graphs_build_x86

def extract_ast(
    path: str,
    arch: str,
):
    """Builds an AST from mips assembly as a string for mips or x86.
    """
    assert arch in ["mips", "x86"], "Invalid architecture, should be 'mips' or 'x86'"

    graph_build_func =  Graphs_build_mips if arch == "mips" else Graphs_build_x86
    asm_nodes, asm_edges = graph_build_func(path, '')

    ast_str = ""
    for edge in asm_edges:
        ast_str += ' '.join(list(map(lambda x: asm_nodes[x], edge))) + ' '

    if arch == "x86":
        ast = ""
        splitted = ast_str.split()
        for word in splitted:
            if word != "ins_nop":
                ast += word + " "
        ast_str = ast
    
    return ast_str
