#!/bin/bash

set -xe

sysdir=/usr/lib/systemd/system
freq=0x3d103d1

systemctl --system stop    pwmfrequency@$freq
systemctl --system disable pwmfrequency@$freq

sudo rm -rf $sysdir/pwmfrequency@.service
sudo cp $(pwd)/systemd/pwmfrequency@.service $sysdir

systemctl --system daemon-reload
systemctl --system enable pwmfrequency@$freq
systemctl --system start  pwmfrequency@$freq
