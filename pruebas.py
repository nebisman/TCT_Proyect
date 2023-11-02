import numpy as np

def normalizacion (V):
  modulo =np.sqrt((V[0]**2)+(V[1]**2))
  normalizacion = (V/modulo)
  return normalizacion

P1 = [2,4]
P2 = [3,2]
N_P1 = normalizacion(P1)
N_P2 = normalizacion(P2)
print(N_P1)
print(P1/np.linalg.norm(P1))