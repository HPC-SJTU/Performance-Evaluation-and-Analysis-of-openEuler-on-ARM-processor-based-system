#!/bin/bash

#SBATCH --job-name=arm_hpl
#SBATCH --partition=openeuler
#SBATCH -N 32
#SBATCH --ntasks-per-node=128
#SBATCH --exclusive
#SBATCH --output=hpcg_1.out
#SBATCH --error=hpcg_1.err

export OMP_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
source /lustre/home/acct-hpc/hpclzy/openeuler/gnu.sh

ulimit -s unlimited
ulimit -l unlimited

export problem_size=65536
export run_time_in_seconds=1200
mpirun --bind-to core  -np $SLURM_NTASKS xhpcg
