#!/bin/bash

#SBATCH --job-name=mpihello
#SBATCH --partition=arm128c256g
#SBATCH --output=./result/2.out
#SBATCH --error=./log/2.err
#SBATCH -n 256
#SBATCH --ntasks-per-node=128

ulimit -s unlimited
ulimit -l unlimited

source /lustre/home/acct-hpc/hpclzy/centos/bisheng_hmpi.sh
cd /lustre/home/acct-hpc/hpclzy/centos/spec_install
. ./shrc
runhpc --config=clang.cfg --action=run --noreportable --tune=base  -ranks=256 small ^632

