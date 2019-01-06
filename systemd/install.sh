#!/bin/bash

set -xe

dir=~/.config/systemd/user
mkdir -p $dir

services=(
    rdm.service
    mbsync.service
    msmtpctl.service
    backup_day.service
    backup_week.service
)

timers=(mbsync.timer msmtpctl.timer backup_day.timer backup_week.timer)
sockets=(rdm.socket)

known_units=("${services[@]}" "${timers[@]}" "${sockets[@]}")
active_units=("${timers[@]}" "${sockets[@]}")

for unit in "${known_units[@]}"
do
    if [ -f "$dir/$unit" ]; then
        systemctl --user stop $unit
        systemctl --user disable $unit
    fi

    ln -s -f $(pwd)/systemd/$unit $dir/$unit
done

systemctl --user daemon-reload

for unit in "${active_units[@]}"
do
    systemctl --user enable $unit
    systemctl --user start $unit
done
