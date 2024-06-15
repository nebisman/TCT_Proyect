import pytct



pytct.init("save_dir", overwrite=True)
delta = [
    (0,11,1),
    (1,0,0),
    (1,12,2),
    (2,14,3),
    (2,13,0),
    (0,15,4)
]
Qm = [0,1]
pytct.create("model", 5, delta, Qm)
pytct.supcon("sup", "model","model")
pytct.printdes("prueba", "model")


from graphviz import Digraph

# Definición de estados, transiciones y el diccionario de estados con círculos concéntricos


# Mostrar el grafo en el notebook (si estás usando Jupyter)
dot.view()
