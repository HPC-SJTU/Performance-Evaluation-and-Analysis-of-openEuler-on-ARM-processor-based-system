#!/bin/bash
#SBATCH --job-name=osu
#SBATCH --partition=arm128c256g
#SBATCH -n 2
#SBATCH --ntasks-per-node=2
#SBATCH --exclusive
#SBATCH --output=./result/pt2pt_inter_socket.out
#SBATCH --error=./log/pt2pt_inter_socket.err

ulimit -l unlimited
ulimit -s unlimited

cd /lustre/home/acct-hpc/hpclzy/centos/osu_gnu_openmpi/libexec/osu-micro-benchmarks/mpi/pt2pt
source ../../gnu.sh

mpirun -n 2   --map-by ppr:2:socket:pe=1   osu_latency
mpirun -n 2   --map-by ppr:2:socket:pe=1   osu_bw
