#!/bin/bash

# Usage:
# curl https://raw.githubusercontent.com/gen-ko/gpu-setup/main/install_conda.sh | bash -s <prefix>
# <prefix> should be a non-exist directory like ~/anaconda


TMP_DIR=/tmp/conda-download
PREFIX=$1

mkdir -p ${TMP_DIR}
pushd ${TMP_DIR} && \
wget https://repo.anaconda.com/archive/Anaconda3-2020.11-Linux-x86_64.sh && \
bash Anaconda3-2020.11-Linux-x86_64.sh -b -p ${PREFIX} && \
popd
rm -rf ${TMP_DIR}
