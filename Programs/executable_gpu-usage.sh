#!/bin/sh

gpustat | tail -1 | awk -F '|' '{print "Temp, Utilization: "$2; print "Memory:"$3}' | xargs -0 notify-send || \
sudo radeontop -d - -l 1 | tail -1 | awk -F ',' '{print "Usage:"$2; print "VRAM:"$13 }' | xargs -0 notify-send
