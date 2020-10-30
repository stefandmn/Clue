#!/bin/sh

if [ -f /sys/class/rtc/rtc0/wakealarm ]; then
  logger -t setwakeup.sh "### Setting system wakeup time ###"
  echo 0 > /sys/class/rtc/rtc0/wakealarm
  echo $1 > /sys/class/rtc/rtc0/wakealarm
  logger -t setwakeup.sh "### $(cat /proc/driver/rtc) ###"
fi
