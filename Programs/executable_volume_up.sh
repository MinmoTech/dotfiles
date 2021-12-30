#!/bin/sh
CURRENTVOLUME=$(pulsemixer --get-volume | fex '1')

if [ "$CURRENTVOLUME" -lt 85 ]; then
    pulsemixer --change-volume +5
fi
