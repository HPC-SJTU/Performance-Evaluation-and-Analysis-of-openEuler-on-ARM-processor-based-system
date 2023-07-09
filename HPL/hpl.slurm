#!/bin/bash

#SBATCH --job-name=arm_hpl
#SBATCH --partition=openeuler
#SBATCH -N 32
#SBATCH --ntasks-per-node=128
#SBATCH --exclusive
#SBATCH --output=hpl_32.out
#SBATCH --error=hpl_32.err

export OMP_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
source /lustre/home/acct-hpc/hpclzy/openeuler/gnu2.sh

ulimit -s unlimited
ulimit -l unlimited
mpirun --bind-to core  -np 4096  xhpl  
