#!/bin/bash

#SBATCH --job-name=mpihello
#SBATCH --partition=arm128c256g
#SBATCH --output=./result/14.out
#SBATCH --error=./log/14.err
#SBATCH -n 1792
#SBATCH --ntasks-per-node=128
#SBATCH --exclusive
ulimit -s unlimited
ulimit -l unlimited

module load gcc/9.3.0-gcc-4.8.5
source /lustre/home/acct-hpc/hpclzy/centos/gnu_hmpi.sh
cd /lustre/home/acct-hpc/hpclzy/centos/spec_install
. ./shrc
runhpc --config=clang1.cfg --action=run --noreportable --tune=base  --iterations=2 -I -ranks=1792 small ^632

