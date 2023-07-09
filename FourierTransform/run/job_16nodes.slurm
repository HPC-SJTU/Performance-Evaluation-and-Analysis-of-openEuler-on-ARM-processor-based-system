#!/bin/bash

#SBATCH --job-name=mpihello
#SBATCH --partition=arm128c256g
#SBATCH --output=16nodes_ft.out
#SBATCH --error=16nodes_ft.err
#SBATCH -n 128
#SBATCH --exclusive
#SBATCH --ntasks-per-node=8

ulimit -s unlimited
ulimit -l unlimited

module load gcc/9.3.0-gcc-4.8.5
source /lustre/home/acct-hpc/hpclzy/centos/gnu.sh
mpirun -n 128   --bind-to core ./ft.D.x
