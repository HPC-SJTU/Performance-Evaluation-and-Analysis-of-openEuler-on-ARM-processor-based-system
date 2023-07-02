#!/bin/bash

#SBATCH --job-name=osu_bcast
#SBATCH --partition=arm128c256g
#SBATCH --output=./result/collective18.out
#SBATCH --error=./log/collective18.err
#SBATCH -n 18
#SBATCH --ntasks-per-node=1
#SBATCH --exclusive

ulimit -l unlimited
ulimit -s unlimited

cd /lustre/home/acct-hpc/hpclzy/centos/osu_gnu_openmpi/libexec/osu-micro-benchmarks/mpi/collective
source ~/centos/gnu.sh                                                          

mpirun -n 18 osu_bcast
mpirun -n 18 osu_allgather
mpirun -n 18 osu_allreduce
mpirun -n 18 osu_scatter
mpirun -n 18 osu_reduce
