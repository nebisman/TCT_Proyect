import pytct
pytct.init("save_dir", overwrite=True)
delta = [
    (0,11,1),
    (1,10,0),
    (1,12,2),
    (2,14,3),
    (2,13,0),
    (0,15,4)
]
Qm = [0,1]
pytct.create("model", 5, delta, Qm)
pytct.supcon("sup", "model","model")
pytct.printdes("prueba", "model")