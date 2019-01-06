#!/bin/bash
#
# Preparation scripts for DWM backups.
set -xe

SRC_DIR=$(pwd)/backup
BACKUP_DIR=~/backup
ME=$(whoami)

sudo chmod +x $SRC_DIR/dayweek.sh $SRC_DIR/rotate.sh
sudo chown $ME:$ME $BACKUP_DIR

ln -s -f $SRC_DIR/dayweek.sh ~/bin/dayweekbackup
ln -s -f $SRC_DIR/rotate.sh ~/bin/rotatebackup
