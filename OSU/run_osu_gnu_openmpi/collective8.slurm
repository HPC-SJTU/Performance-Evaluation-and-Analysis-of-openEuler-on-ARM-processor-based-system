#!/bin/bash

#SBATCH --job-name=osu_bcast
#SBATCH --partition=arm128c256g
#SBATCH --output=./result/collective8.out
#SBATCH --error=./log/collective8.err
#SBATCH -n 1024
#SBATCH --ntasks-per-node=128 
#SBATCH --exclusive

ulimit -l unlimited
ulimit -s unlimited

cd /lustre/home/acct-hpc/hpclzy/centos/osu_gnu_openmpi/libexec/osu-micro-benchmarks/mpi/collective
source ~/centos/gnu.sh                                                          

mpirun -n 1024 --bind-to core osu_bcast
mpirun -n 1024 --bind-to core osu_allgather
mpirun -n 1024 --bind-to core osu_allreduce
mpirun -n 1024 --bind-to core osu_scatter
mpirun -n 1024 --bind-to core osu_reduce
