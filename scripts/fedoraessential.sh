#! /bin/bash

set -xe

function setup_chrome () {
    dnf install fedora-workstation-repositories
    dnf config-manager --set-enabled google-chrome
    dnf install google-chrome-stable
}

function setup_terminal () {
    dnf install rxvt-unicode-256color
    dnf install terminus-fonts
}

function setup_toolchain () {
    dnf install git gitk make cmake autoconf gcc-c++
    dnf install vim-x11
}

function setup_i3 () {
    dnf install lightdm
    dnf install i3
    dnf install i3lock
}

function setup_utils () {
    dnf install sxiv mupdf ack ctags weechat
}

function setup_python () {
    dnf install pip3
    pip3 install autopep8
}

setup_chrome
setup_terminal
setup_toolchain
setup_i3
setup_utils
setup_python
