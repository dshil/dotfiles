#! /bin/bash

set -xe

dir=$(pwd)

ln -sf $dir/vim/vimrc $HOME/.vimrc
ln -sfn $dir/vim $HOME/.vim

# vim:syntax=sh
