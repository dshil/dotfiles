#! /bin/bash

set -xe

function setup_chrome () {
    dnf install -y fedora-workstation-repositories
    dnf config-manager --set-enabled google-chrome
    dnf install -y google-chrome-stable
}

function setup_terminal () {
    dnf install -y rxvt-unicode-256color terminus-fonts
}

function setup_toolchain () {
    dnf install -y git gitk make cmake autoconf gcc-c++ vim-X11 python3-pip
}

function setup_i3 () {
    dnf install -y lightdm i3 i3lock
}

function setup_utils () {
    dnf install -y sxiv mupdf ack ctags weechat abook graphviz
}

function setup_remmina() {
    dnf copr enable -y hubbitus/remmina-next
    dnf install -y remmina
}

setup_chrome
setup_terminal
setup_toolchain
setup_i3
setup_utils
setup_remmina
