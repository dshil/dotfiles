#!/bin/bash
#
# General routine for the rsyncing your data weekly and daily.
#

set -xe

if [ "$SRC" == "" ]; then
    echo "error: backup source path must be specified"; exit 1
fi

if [ "$DST" == "" ]; then
    echo "error: backup destination path must be specified"; exit 1
fi

rsync --exclude={.ccache,build,vm} -arv --delete $SRC $DST
