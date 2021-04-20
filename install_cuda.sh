#!/bin/bash

# Usage:
# curl https://raw.githubusercontent.com/gen-ko/gpu-setup/main/install_cuda.sh | bash -s <prefix> <cuda-version>
# works with CentOS7/8 | Debian 10 | Fedora 33 | OpenSUSE 15 | RHEL 7/8 | SLES 15 | Ubuntu 20.04/18.04/16.04 | WSL-Ubuntu 2.0
CUDA_VERSION=${2:-11.2}
echo "CUDA_VERSION:${CUDA_VERSION}"
TMP_DIR=/tmp/cuda-download-${CUDA_VERSION}
PREFIX=$1

declare -A CUDA_VERSION_MAP
declare -A CUDA_RUNFILE_MAP

CUDA_VERSION_MAP['11.2']=https://developer.download.nvidia.com/compute/cuda/11.2.1/local_installers/cuda_11.2.1_460.32.03_linux.run
CUDA_VERSION_MAP['11.1']=https://developer.download.nvidia.com/compute/cuda/11.1.0/local_installers/cuda_11.1.0_455.23.05_linux.run

CUDA_RUNFILE_MAP['11.2']=cuda_11.2.1_460.32.03_linux.run
CUDA_RUNFILE_MAP['11.1']=cuda_11.1.0_455.23.05_linux.run

mkdir -p ${TMP_DIR} && \
pushd ${TMP_DIR} && \
wget $CUDA_VERSION_MAP[$CUDA_VERSION] && \
bash $CUDA_RUNFILE_MAP[$CUDA_VERSION] --silent --toolkit --installpath=${PREFIX}/cuda-${CUDA_VERSION} && \
popd && \
rm -rf ${TMP_DIR}
