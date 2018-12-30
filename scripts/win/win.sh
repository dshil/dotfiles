#!/bin/bash

set -xe

packages="autoconf,automake,bison,cabextract,doxygen,flex,gcc-g++,gettext-devel,git,gnupg,gperf,make,mintty,nasm,openssh,openssl,patch,perl,python,python3,pkg-config,rsync,unzip,vim,wget,zip,perl-Archive-Zip,perl-Font-TTF,perl-IO-String,fzf,vim-X11,the_silver_searcher,gitk,cmake,subversion"

setup-x86_64.exe -q --packages $packages
