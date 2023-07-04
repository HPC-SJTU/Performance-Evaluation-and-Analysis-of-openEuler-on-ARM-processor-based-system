#!/bin/bash

#SBATCH --job-name=mpihello
#SBATCH --partition=arm128c256g
#SBATCH --output=1nodes_mg.out
#SBATCH --error=1nodes_mg.err
#SBATCH -n 128
#SBATCH --exclusive
#SBATCH --ntasks-per-node=128

ulimit -s unlimited
ulimit -l unlimited

module load gcc/9.3.0-gcc-4.8.5
source /lustre/home/acct-hpc/hpclzy/centos/gnu.sh
mpirun -n 128   --bind-to core ./mg.D.x


