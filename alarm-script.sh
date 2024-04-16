#!/bin/bash
# You need to export this environment variable in order to play sound from cron
export XDG_RUNTIME_DIR="/run/user/1000"
currentBatteryPercentage=$(upower -i /org/freedesktop/UPower/devices/DisplayDevice | grep "percentage" | awk '{print $2}')
currentBatteryPercentage=${currentBatteryPercentage/\%/}
currentBatteryState=$(upower -i /org/freedesktop/UPower/devices/DisplayDevice | grep "state" | awk '{print $2}')
if [ $currentBatteryPercentage -lt 20 ] && [ $currentBatteryState == "discharging" ]
then
mpg123 /home/meliora/alarm-sound.mp3 -l 2
fi
#to view CRON logs
#grep CRON /var/log/syslog
