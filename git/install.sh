#! /bin/bash

set -xe

dir=$(pwd)

ln -sf $dir/git/config ~/.gitconfig
ln -snf $dir/git/template ~/.git_template

git config --global init.templatedir '~/.git_template'

if [[ "$OSTYPE" == "cygwin" ]]; then
    git config --global core.preloadindex true
    git config --global core.fscache true
    git config --global gc.auto 256
fi

# vim:syntax=sh
