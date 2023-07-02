#!/bin/bash

#SBATCH --job-name=osu_bcast
#SBATCH --partition=arm128c256g
#SBATCH --output=./result/collective1.out
#SBATCH --error=./log/collective1.err
#SBATCH -n 128
#SBATCH --ntasks-per-node=128
#SBATCH --exclusive

ulimit -l unlimited
ulimit -s unlimited

cd /lustre/home/acct-hpc/hpclzy/centos/osu_gnu_openmpi/libexec/osu-micro-benchmarks/mpi/collective
source ~/centos/gnu.sh                                                          

mpirun -n 128 osu_bcast
mpirun -n 128 osu_allgather
mpirun -n 128 osu_allreduce
mpirun -n 128 osu_scatter
mpirun -n 128 osu_reduce
