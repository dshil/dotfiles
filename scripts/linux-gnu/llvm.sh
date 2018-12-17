#!/bin/bash

set -xe

releaseno=$1

if [ -z "$releaseno" ]; then
    releaseno=RELEASE_700
fi

pushd $HOME
mkdir -p src/compilers
pushd src/compilers
svn co http://llvm.org/svn/llvm-project/llvm/tags/$releaseno/final llvm_$releaseno
pushd llvm_$releaseno/tools
svn co http://llvm.org/svn/llvm-project/cfe/tags/$releaseno/final clang
popd # llvm_$releaseno/tools
popd # src/compilers
popd # $HOME

mkdir -p /tmp/build/compilers
pushd /tmp/build/compilers
mkdir llvm_$releaseno
pushd llvm_$releaseno
cmake -G "Unix Makefiles" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_COMPILER=/usr/bin/gcc \
    -DCMAKE_CXX_COMPILER=/usr/bin/g++ \
    -DCMAKE_ASM_COMPILER=/usr/bin/gcc \
    $HOME/src/compilers/llvm_$releaseno
make -j8
sudo make -j8 install
rm -rf /tmp/build/compilers/llvm_$releaseno
rm -rf $HOME/src/compilers/llvm_$releaseno
popd # llvm_$releaseno
popd # /opt/build/compilers

# Reference:
#  * https://www.vultr.com/docs/how-to-install-llvm-and-clang-on-centos-6
#  * https://sarcasm.github.io/notes/dev/compilation-database.html
