#! /bin/bash

set -xe

dir=$(pwd)

ln -sf $dir/git/config ~/.gitconfig

if [[ "$OSTYPE" == "cygwin" ]]; then
    git config --global core.preloadindex true
    git config --global core.fscache true
    git config --global gc.auto 256
fi
