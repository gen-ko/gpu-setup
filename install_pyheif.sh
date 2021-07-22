#!/bin/bash

# Usage:
# curl https://raw.githubusercontent.com/gen-ko/gpu-setup/main/install_pyheif.sh | bash -s <prefix> 
# The library libheif will be installed on <prefix>/libheif, make sure to include <prefix>/libheif/libs in $LD_LIBRARY_PATH

TMP_DIR=/tmp/libheif-download
PREFIX=$1

rm -rf ${TMP_DIR} && \
mkdir -p ${TMP_DIR} && \
pushd ${TMP_DIR} && \
git clone --single-branch --branch release-1.4 https://github.com/strukturag/libheif.git libheif && \
pushd libheif && \
git checkout f22f9a62e6063237db182e5064f83be92f156b85 && \
./autogen.sh && \
./configure --prefix=${PREFIX}/libheif && \
make -j`nproc` && \
make -j`nproc` install && \
popd && \
popd && \
rm -rf ${TMP_DIR} && \
CPATH=${PREFIX}/libheif/include:${CPATH} \
LIBRARY_PATH=${PREFIX}/libheif/lib:${LIBRARY_PATH} \
LD_LIBRARY_PATH=${PREFIX}/libheif/lib:${LD_LIBRARY_PATH} \
pip install 'git+https://github.com/carsales/pyheif.git@8d03e0bf6dde6aa0317471792d698a30502f9e1d'
