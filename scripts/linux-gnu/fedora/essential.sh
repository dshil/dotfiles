#!/bin/bash

set -xe

function setup_chrome ()
{
    dnf install -y fedora-workstation-repositories
    dnf config-manager --set-enabled google-chrome
    dnf install -y google-chrome-stable
}

function setup_terminal ()
{
    dnf install -y rxvt-unicode-256color terminus-fonts
}

function setup_toolchain ()
{
    dnf install -y git gitk \
                   make cmake autoconf gcc-c++ \
                   vim-X11 python3-pip the_silver_searcher \
                   antiword okular
}

function setup_i3 ()
{
    dnf install -y lightdm i3 i3lock light
}

function setup_utils ()
{
    dnf install -y sxiv mupdf ack ctags weechat abook graphviz
}

function setup_remmina()
{
    dnf copr enable -y hubbitus/remmina-next
    dnf install -y remmina
}

function setup_samba()
{
    dnf install gvfs gvfs-smb sshfs
}

function setup_fonts()
{
    dnf install curl cabextract xorg-x11-font-utils fontconfig
    rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
    fc-cache -fv
}

setup_chrome
setup_terminal
setup_toolchain
setup_i3
setup_utils
setup_remmina
setup_samba
