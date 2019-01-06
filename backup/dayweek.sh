#!/bin/bash
#
# General routine for the rsyncing your data weekly and daily.
set -xe

if [ "$SRC" == "" ]; then
    echo "error: backup source path must be specified"; exit 1
fi

if [ "$DST" == "" ]; then
    echo "error: backup destination path must be specified"; exit 1
fi

if [ "$TYPE" == "" ]; then
    echo "error: backup type path must be specified"; exit 1
fi

OSID=$(uname -r)
DST=$DST/$OSID/$TYPE

mkdir -p $DST

rsync --exclude={.ccache,build,vm,backup} -arv --delete $SRC $DST
