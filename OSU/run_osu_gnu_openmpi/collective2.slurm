#!/bin/bash

#SBATCH --job-name=osu_bcast
#SBATCH --partition=arm128c256g
#SBATCH --output=./result/collective2.out
#SBATCH --error=./log/collective2.err
#SBATCH -n 256
#SBATCH --ntasks-per-node=128
#SBATCH --exclusive

ulimit -l unlimited
ulimit -s unlimited

cd /lustre/home/acct-hpc/hpclzy/centos/osu_gnu_openmpi/libexec/osu-micro-benchmarks/mpi/collective
source ~/centos/gnu.sh                                                          

mpirun -n 256 --bind-to core osu_bcast
mpirun -n 256 --bind-to core osu_allgather
mpirun -n 256 --bind-to core osu_allreduce
mpirun -n 256 --bind-to core osu_scatter
mpirun -n 256 --bind-to core osu_reduce
