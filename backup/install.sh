#!/bin/bash
#
# Preparation scripts for DWM backups.
#
# To automate backups add the following to your crontab:
#
# sudo crontab -e
#
# 0 6 1 * * DST=/backup/fedora28/month SRC=/backup/fedora28/day monthbackup
# 0 7 1 * * SRC=/backup/fedora28/month MAXENTRYNUM=5 rotatebackup
# 0 8 * * * DST=/backup/fedora28/day SRC=/home/dshil dayweekbackup
# 0 9 * * 5 DST=/backup/fedora28/week SRC=/home/dshil dayweekbackup

set -xe

chmod +x dayweek.sh month.sh rotate.sh

ln -s -f $(pwd)/dayweek.sh /usr/bin/dayweekbackup
ln -s -f $(pwd)/month.sh /usr/bin/monthbackup
ln -s -f $(pwd)/rotate.sh /usr/bin/rotatebackup
