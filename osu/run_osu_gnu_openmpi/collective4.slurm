#!/bin/bash

#SBATCH --job-name=osu_bcast
#SBATCH --partition=arm128c256g
#SBATCH --output=./result/collective4.out
#SBATCH --error=./log/collective4.err
#SBATCH -n 512
#SBATCH --ntasks-per-node=128
#SBATCH --exclusive

ulimit -l unlimited
ulimit -s unlimited

cd /lustre/home/acct-hpc/hpclzy/centos/osu_gnu_openmpi/libexec/osu-micro-benchmarks/mpi/collective
source ~/centos/gnu.sh                                                          

mpirun -n 512 osu_bcast
mpirun -n 512 osu_allgather
mpirun -n 512 osu_allreduce
mpirun -n 512 osu_scatter
mpirun -n 512 osu_reduce
