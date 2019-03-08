#!/bin/bash

set -xe

sysdir=/usr/lib/systemd/system

systemctl --system stop    pwmfrequency@0x7a107a1
systemctl --system disable pwmfrequency@0x7a107a1

sudo rm -rf $sysdir/pwmfrequency@.service
sudo cp $(pwd)/systemd/pwmfrequency@.service $sysdir

systemctl --system daemon-reload
systemctl --system enable pwmfrequency@0x7a107a1
systemctl --system start  pwmfrequency@0x7a107a1
