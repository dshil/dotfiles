#/bin/bash

set -xe

swapfile=/swap/file

dd if=/dev/zero of=$swapfile bs=1GB count=14
chmod 0600 $swapfile

mkswap $swapfile
swapon $swapfile
