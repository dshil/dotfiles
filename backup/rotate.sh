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

ls -tp $SRC \
    | grep -v '/$' \
    | tail -n +$(expr $MAXENTRYNUM + 1) \
    | xargs --no-run-if-empty rm
