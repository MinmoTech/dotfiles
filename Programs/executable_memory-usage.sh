#!/bin/sh

free | grep Mem | awk '{print $3/$2 * 100.0}' | xargs -d '\n' notify-send
