#/bin/bash

set -xe

swapfile=/swap/file
swapdir=/swap

mkdir -p $swapdir

if [ ! -f $swapfile ]; then
    touch $swapfile

    dd if=/dev/zero of=$swapfile bs=1GB count=14
    chmod 0600 $swapfile
fi

mkswap $swapfile
swapon $swapfile
