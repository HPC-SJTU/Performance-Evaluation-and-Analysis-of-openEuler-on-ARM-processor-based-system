#!/bin/bash
#SBATCH --job-name=osu
#SBATCH --partition=arm128c256g
#SBATCH -n 2
#SBATCH --ntasks-per-node=1
#SBATCH --exclusive
#SBATCH --output=./result/pt2pt.out
#SBATCH --error=./log/pt2pt.err

ulimit -l unlimited
ulimit -s unlimited

cd /lustre/home/acct-hpc/hpclzy/centos/osu_gnu_openmpi/libexec/osu-micro-benchmarks/mpi/pt2pt
source ~/centos/gnu.sh

mpirun   osu_latency
mpirun   osu_bw
