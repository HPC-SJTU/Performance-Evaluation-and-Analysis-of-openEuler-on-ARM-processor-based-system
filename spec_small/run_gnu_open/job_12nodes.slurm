#!/bin/bash

#SBATCH --job-name=mpihello
#SBATCH --partition=arm128c256g
#SBATCH --output=./result/12.out
#SBATCH --error=./log/12.err
#SBATCH -n 1536
#SBATCH --ntasks-per-node=128
#SBATCH --exclusive
ulimit -s unlimited
ulimit -l unlimited

module load gcc/9.3.0-gcc-4.8.5
source /lustre/home/acct-hpc/hpclzy/centos/gnu.sh
cd /lustre/home/acct-hpc/hpclzy/centos/spec_install
. ./shrc
runhpc --config=arm.cfg --action=run --noreportable --tune=base  --iterations=2 -I -ranks=1536 small ^632

