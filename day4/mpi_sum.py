from mpi4py import MPI
import numpy as np
comm = MPI.COMM_WORLD
rank = comm.Get_rank()
len = comm.Get_size()
rsum = []

if rank != 0:
	comm.send(rank, dest = 0)
else
	for nr in range(1,len):
		rsum+= comm.recv(source=nr)
	print(rsum)
