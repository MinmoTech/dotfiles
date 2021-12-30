#!/bin/sh

capacity=$(cat /sys/class/power_supply/BAT1/capacity)
status=$(cat /sys/class/power_supply/BAT1/status)
echo "${capacity}%
$status" | xargs notify-send
