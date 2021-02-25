import numpy as np

N = 250

Xn=np.random.randint(0,100, (N,N))

Yn=np.random.randint(0,100, (N,N+1))

resultn=np.matmul(Xn,Yn);

print(resultn)