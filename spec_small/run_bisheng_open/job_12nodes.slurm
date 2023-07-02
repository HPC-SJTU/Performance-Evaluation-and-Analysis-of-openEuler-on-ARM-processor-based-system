#!/bin/bash

#SBATCH --job-name=mpihello
#SBATCH --partition=arm128c256g
#SBATCH --output=./result/16.out
#SBATCH --error=./log/16.err
#SBATCH -n 1536
#SBATCH --ntasks-per-node=128
#SBATCH --exclusive
ulimit -s unlimited
ulimit -l unlimited

source /lustre/home/acct-hpc/hpclzy/centos/bisheng.sh
cd /lustre/home/acct-hpc/hpclzy/centos/spec_install
. ./shrc
runhpc --config=clang.cfg --action=run --noreportable -I --tune=base  -ranks=1536 small ^632

