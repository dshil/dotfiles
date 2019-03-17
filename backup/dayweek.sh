#!/bin/bash
#
# General routine for rsyncing your data.
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
DST=$DST/$OSID/$(whoami)/$TYPE
DATE=$(date "+%Y-%m-%d-%H%M%S")

mkdir -p $DST

rsync -axrv --delete --link-dest=$DST/latest \
    $SRC $DST/processing-$DATE \
    && pushd $DST \
    && mv processing-$DATE $DATE \
    && ln -s -f $DATE latest \
    && popd # $DST
