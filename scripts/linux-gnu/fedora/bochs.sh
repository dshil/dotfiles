# !/bin/bash

# Installation script is based on: https://wiki.osdev.org/Bochs
# On Fedora you'll probably need the following:
#  GTK: sudo dnf install gtk3-devel
#  SDL2: sudo dnf install SDL2-devel
#  SDL: sudo dnf install SDL-devel
# Check if you have required headers:
#  sudo find /usr -name SDL.h
#  sudo find /usr -name gtk.h

make dist-clean

./configure --enable-smp \
          --enable-cpu-level=6 \
          --enable-all-optimizations \
          --enable-x86-64 \
          --enable-pci \
          --enable-vmx \
          --enable-debugger \
          --enable-disasm \
          --enable-debugger-gui \
          --enable-logging \
          --enable-fpu \
          --enable-3dnow \
          --enable-sb16=dummy \
          --enable-cdrom \
          --enable-x86-debugger \
          --enable-iodebug \
          --disable-plugins \
          --disable-docbook \
          --with-x --with-x11 --with-term --with-sdl

make
sudo make install

export PATH=$PATH:/usr/local/bin/bochs
export BXSHARE=/usr/local/share/bochs
