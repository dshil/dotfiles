# !/bin/bash

brew install sdl --with-x11

export CFLAGS="-I/opt/X11/include"
export CXXFLAGS="-I/opt/X11/include"
export LDFLAGS="-L/opt/X11/lib -lX11"

dir=$(pwd)
cd $HOME/src/bochs

make dist-clean

./configure \
            --enable-all-optimizations \
            --enable-cpu-level=6 \
            --enable-x86-64 \
            --enable-vmx=2 \
            --enable-pci \
            --enable-usb \
            --enable-usb-ohci \
            --enable-debugger \
            --enable-disasm \
            --disable-debugger-gui \
            --with-x11 \
            --prefix=$HOME/opt/bochs

make
make install

export BXSHARE="$HOME/opt/bochs/share/bochs"
export PATH="$PATH:$HOME/opt/bochs/bin"

cd $dir
