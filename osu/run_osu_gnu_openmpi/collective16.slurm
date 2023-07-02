#!/bin/bash

#SBATCH --job-name=osu_bcast
#SBATCH --partition=arm128c256g
#SBATCH --output=./result/collective16.out
#SBATCH --error=./log/collective16.err
#SBATCH -n 2048
#SBATCH --ntasks-per-node=128
#SBATCH --exclusive

ulimit -l unlimited
ulimit -s unlimited

cd /lustre/home/acct-hpc/hpclzy/centos/osu_gnu_openmpi/libexec/osu-micro-benchmarks/mpi/collective
source ~/centos/gnu.sh                                                          

mpirun  -n 2048 osu_bcast
mpirun  -n 2048 osu_allgather
mpirun  -n 2048 osu_allreduce
mpirun  -n 2048 osu_scatter
mpirun  -n 2048 osu_reduce
