#!/bin/bash

#SBATCH --job-name=mpihello
#SBATCH --partition=arm128c256g
#SBATCH --output=./result/8.out
#SBATCH --error=./log/8.err
#SBATCH -n 1024
#SBATCH --ntasks-per-node=128
#SBATCH --exclusive
ulimit -s unlimited
ulimit -l unlimited

source /lustre/home/acct-hpc/hpclzy/centos/bisheng_hmpi.sh
cd /lustre/home/acct-hpc/hpclzy/centos/spec_install
. ./shrc
runhpc --config=clang.cfg --action=run --noreportable --tune=base  --iterations=6 -I -ranks=1024 small ^632

#mpirun -n 256 /lustre/home/acct-hpc/hpclzy/src/openmpi-4.1.4-gcc/examples/hello_c
