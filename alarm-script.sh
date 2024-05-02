#!/bin/bash
#check this blog for more details
#https://kasunsiyambalapitiya.medium.com/linux-play-a-warning-sound-when-your-laptop-battery-is-low-4aa23d5b279e
#prerequisites to run cron
#1.sudo apt-get install -y mpg123
#2.sudo apt-get install -y upower
#to add to list of CRONS use :
#crontab -e
#insert this lines to schedule the CRON , this CRON will execute every 5 minutes
#*/5 * * * * bash /home/meliora/alarm-script.sh
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
