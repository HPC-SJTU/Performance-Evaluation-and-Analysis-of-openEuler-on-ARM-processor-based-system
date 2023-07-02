#!/bin/bash

#SBATCH --job-name=osu_bcast
#SBATCH --partition=arm128c256g
#SBATCH --output=./result/collective12.out
#SBATCH --error=./log/collective12.err
#SBATCH -n 1536
#SBATCH --ntasks-per-node=128
#SBATCH --exclusive

ulimit -l unlimited
ulimit -s unlimited

cd /lustre/home/acct-hpc/hpclzy/centos/osu_gnu_openmpi/libexec/osu-micro-benchmarks/mpi/collective
source ~/centos/gnu.sh                                                          

mpirun -n 1536 osu_bcast
mpirun -n 1536 osu_allgather
mpirun -n 1536 osu_allreduce
mpirun -n 1536 osu_scatter
mpirun -n 1536 osu_reduce
