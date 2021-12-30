#!/usr/bin/env bash

while true
do
	POWER_PERCENT=$(cat /sys/class/power_supply/BAT1/capacity)
	if [ ! -z "$POWER_PERCENT" ] && [ "$POWER_PERCENT" -lt 20 ]
	then
		if type beep >/dev/null 2>&1
		then
			beep
		fi
		notify-send "Power below $POWER_PERCENT%" "Connect charging device!"
	fi
	sleep 300
done
