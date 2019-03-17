#!/bin/bash
#
# Keeps your backup directory small.
#
# MAXENTRYNUM determines the maximum number of backups in the provided $SRC
# backup directory.
set -xe

if [ "$SRC" == "" ]; then
    echo "error: backup source path must be specified"; exit 1
fi

find $SRC -maxdepth 1 -type d \
    | sort -M \
    | tail -n $MAXENTRYNUM \
    | xargs --no-run-if-empty rm -rf
