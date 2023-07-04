#!/bin/bash

#SBATCH --job-name=mpihello
#SBATCH --partition=arm128c256g
#SBATCH --output=./result/2.out
#SBATCH --error=./log/2.err
#SBATCH -n 256
#SBATCH --ntasks-per-node=128

ulimit -s unlimited
ulimit -l unlimited

source /lustre/home/acct-hpc/hpclzy/centos/bisheng.sh
cd /lustre/home/acct-hpc/hpclzy/centos/spec_install
. ./shrc
runhpc --config=clang.cfg --action=run --noreportable --tune=base --iteration=2  -ranks=256  small ^632

#mpirun -n 256 /lustre/home/acct-hpc/hpclzy/src/openmpi-4.1.4-gcc/examples/hello_c
