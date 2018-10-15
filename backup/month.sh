#!/bin/bash
#
# General routine for the rsyncing your data monthly.
#

if [ "$SRC" == "" ]; then
    echo "error: backup source path must be specified"; exit 1
fi

if [ "$DST" == "" ]; then
    echo "error: backup destination path must be specified"; exit 1
fi

backup=/tmp/$(date +%Y%m%d).tar.gz

function rsync_files () {
    rsync -arv --delete $backup $DST
}

function compress_files () {
    set +e

    tar --warning=no-file-changed -zcvf $backup $SRC

    local errno=$?

    if [ "$errno" != "1" ] && [ "$errno" != "0" ]; then
        exit $errno
    fi

    set -e
}

function cleanup () {
    rm -rf $backup
}

set -xe

trap cleanup EXIT
compress_files
rsync_files
