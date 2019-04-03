#!/bin/bash

set -xe

sudo dnf config-manager --set-enabled google-chrome
sudo dnf copr enable flatcap/neomutt

sudo dnf install -y fedora-workstation-repositories \
    google-chrome-stable \
    rxvt-unicode-256color terminus-fonts \
    git gitk svn make cmake autoconf gcc-c++ \
    vim-X11 python3-pip the_silver_searcher htop \
    antiword okular acpid xss-lock davfs2 \
    lightdm i3 i3lock light \
    sxiv mupdf ack ctags weechat abook graphviz \
    gvfs gvfs-smb sshfs curl cabextract xorg-x11-font-utils fontconfig \
    isync msmtp ripmime w3m urlscan gnupg dnf-plugins-core neomutt \
    notmuch perl perl-String-ShellQuote perl-Mail-Box perl-MailTools

fc-cache -fv
