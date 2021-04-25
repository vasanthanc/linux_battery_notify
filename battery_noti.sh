#!/bin/bash

BATTINFO=`acpi -b`
if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 5 -d " "` < 06:30:00 ]] ; then
    DISPLAY=:0.0 /usr/bin/notify-send -t 10000 -u critical -i "$(pwd)/low-battery-level.svg" "low battery" "$BATTINFO"
fi
