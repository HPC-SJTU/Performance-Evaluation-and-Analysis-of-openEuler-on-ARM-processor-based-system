# 微基准测试

## Hourglass

### 软件源代码下载
```
git clone https://github.com/IBM/osnoise.git
```

### 编译命令
```
make
```

### 环境配置文件
```
source {path-to-centos-folder}/gnu.sh
source {path-to-openeuler-folder}/gnu.sh
```


### 测试运行
```
./osnoise -c 3.0 -t 50 -x 100 -n 31

```

## OSU
### 软件源代码下载
```
wget http://mvapich.cse.ohio-state.edu/download/mvapich/osu-micro-benchmarks-5.7.1.tgz
tar -xvf osu-micro-benchmarks-5.7.1.tgz
```
### 编译命令
```
cd {path-to-osu-root}
mkdir build_centos
cd build_centos
../configure CC={path-to-openmpi}/bin/mpicc CXX={path-to-openmpi}/bin/mpicxx --prefix=$HOME/tests/centos/osu/osu-centos --build=aarch64-unknown-linux-gnu
make
make install
```
### 环境配置文件
```
source {path-to-centos-folder}/gnu.sh
source {path-to-openeuler-folder}/gnu.sh
```
### 测试运行
```
cd OSU\run_osu_gnu_openmpi
sbatch pt2pt_inter_node.slurm //测试节点间点对点通信
sbatch pt2pt_inter_socket.slurm //测试socker间点对点通信
sbatch pt2pt_in_socket.slurm //测试socket内通信
sbatch collective4.slurm //测试512进程的集合通信
```
# 单节点规模核函数测试

## DGEMM
### 源代码获取及编译
```
git clone https://github.com/wangyichao/KernelBench-ARM.git
cd KernelBench-ARM/gemm/arm
make
```
### 测试运行
```
mpirun -n 128 --bind-to core ./raw_dp 2400 1600 1600
```
## Multi Grid
### 源代码获取及编译
```
wget https://www.nas.nasa.gov/assets/npb/NPB3.4.2.tar.gz
cd NPB3.4.2/NPB3.4-MPI/config
cp make.def.template make.def
#修改config文件
cd ..

cd MG
#编译时需要指定规模
make CLASS=C
```
### 环境配置文件
```
source {path-to-centos-folder}/gnu.sh
source {path-to-openeuler-folder}/gnu.sh
```
### 测试运行
```
cd MultiGrid
sbatch job_1nodes.slurm
```
## FFT
### 源代码获取及编译
过程参考Multi Grid。
### 环境配置文件
```
source {path-to-centos-folder}/gnu.sh
source {path-to-openeuler-folder}/gnu.sh
```
### 测试运行
```
cd FourierTransform
sbatch job_16nodes.slurm
```

# 千核规模应用可扩展性测试

## SPEChpc 2021
### 源代码获取及编译
需要在SPEC官网申请下载：https://www.spec.org/hpc2021/  
SPEChpc2021自带安装脚本，具体编译安装方式可参考官方文档：https://www.spec.org/hpc2021/docs/install-guide-linux.html
### 环境配置文件
```
source {path-to-centos-folder}/gnu.sh
source {path-to-openeuler-folder}/gnu.sh
```
### 测试运行
不同编译器和MPI实现版本的运行脚本在`SPEC_small/run_{bisheng/gnu}_{hmpi/open}`中
## HPL
### 源代码下载及编译
```
wget https://github.com/xianyi/OpenBLAS/archive/refs/tags/v0.3.21.tar.gz
tar -xvf v0.3.21.tar.gz
cd OpenBLAS-0.3.21
make PREFIX=$MYLIB/OpenBLAS-0.3.21 install

LD_LIBRARY_PATH=$MYLIB/OpenBLAS-0.3.21/lib:${LD_LIBRARY_PATH}

get https://netlib.org/benchmark/hpl/hpl-2.3.tar.gz
tar -xvf hpl-2.3.tar.gz
cd hpl-2.3

//从setup文件夹中复制一个新的setup文件（参考：Make.centos）并修改mpi、openblas等路径

make arch=centos
```
### 环境配置文件
```
source {path-to-centos-folder}/gnu.sh
source {path-to-openeuler-folder}/gnu.sh
```
### 测试运行
```
cd HPL
sbatch hpl.slurm
```
## HPCG
### 源代码下载及编译
```
git clone https://github.com/hpcg-benchmark/hpcg.git
//从setup文件夹中复制一个新的setup文件（参考：Make.centos）并修改mpi等路径
mkdir build_centos
cd build_centos
../configure centos
make
```
### 环境配置文件
```
source {path-to-centos-folder}/gnu.sh
source {path-to-openeuler-folder}/gnu.sh
```
### 测试运行
```
cd HPCG
sbatch hpcg.slurm
```

