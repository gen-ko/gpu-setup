#!/bin/bash

# Usage:
# curl https://raw.githubusercontent.com/gen-ko/gpu-setup/main/install_cuda-11.2.sh | bash -s <prefix>

CUDA_VERSION=11.2
TMP_DIR=/tmp/cuda-download-${CUDA_VERSION}
PREFIX=$1

mkdir -p ${TMP_DIR} && \
pushd ${TMP_DIR} && \
wget https://developer.download.nvidia.com/compute/cuda/11.2.1/local_installers/cuda_11.2.1_460.32.03_linux.run && \
bash cuda_11.2.1_460.32.03_linux.run --silent --toolkit --installpath=${PREFIX}/cuda-${CUDA_VERSION} && \
popd && \
rm -rf ${TMP_DIR}
