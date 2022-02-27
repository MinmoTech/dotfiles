#!/bin/sh

unclutter &
# nyrna &
clipmenud &
keynav &
# picom --backend glx --daemon --vsync --no-fading-openclose --use-ewmh-active-win
# picom --backend xr_glx_hybrid --daemon --shadow --vsync --no-fading-openclose --use-ewmh-active-win --vsync-use-glfinish --unredir-if-possible
# picom --backend glx --daemon --vsync --no-fading-openclose --use-ewmh-active-win --vsync-use-glfinish --unredir-if-possible
picom --daemon --no-fading-openclose &
feh --randomize --bg-fill --no-xinerama ~/Pictures/wallpapers/* &
# ~/Programs/notify-low-battery.sh &
# nextcloud &
playerctld daemon &

# ~/Programs/grasp/server/setup --path ~/orgfiles/capture.org

# VBoxClient-all &
# sudo localectl set-x11-keymap us _ altgr-intl ctrl:swapcaps_hyper
# setxkbmap -layout us -variant altgr-intl
/usr/lib/xfce4/notifyd/xfce4-notifyd &
# sudo sh -c 'sysctl -w abi.vsyscall32=0' &
# export GDK_CORE_DEVICE_EVENTS=1

# screen blanks after 2 hours instead of 10 min
# xset s 7200 7200
# rg --files ~/.doom.d/ | entr ~/.emacs.d/bin/doom refresh
# notify-send (.emacs.d/bin/doom doctor | tail -2 | sed 's/\x1b\[[0-9;]*m//g')

# /opt/piavpn/bin/piactl background enable &
# /opt/piavpn/bin/piactl connect &

# ~/Programs/brave_click.py &

# jellyfin-mpv-shim &

SCREEN="HDMI-A-0"
xsetwacom set "Wacom Bamboo 16FG 4x5 Pen eraser" MapToOutput $SCREEN &
xsetwacom set "Wacom Bamboo 16FG 4x5 Pen stylus" MapToOutput $SCREEN &

xsetwacom set "Wacom Intuos Pro M Pen stylus" MapToOutput $SCREEN &
xsetwacom set "Wacom Intuos Pro M Pen eraser" MapToOutput $SCREEN &
xsetwacom set 'Wacom Intuos Pro M Pad pad' 'AbsWheelUp' 'button 0'
xsetwacom set 'Wacom Intuos Pro M Pad pad' 'AbsWheelDown' 'button 0'
xsetwacom set 'Wacom Intuos Pro M Pad pad' 'AbsWheel2Up' 'button 0'
xsetwacom set 'Wacom Intuos Pro M Pad pad' 'AbsWheel2Down' 'button 0'
xsetwacom set 'Wacom Intuos Pro M Pad pad' 'RelWheelUp' 'button 0'
xsetwacom set 'Wacom Intuos Pro M Pad pad' 'RelWheelDown' 'button 0'

xsetwacom set "Wacom Intuos Pro M (WL) Pen stylus" MapToOutput $SCREEN &
xsetwacom set "Wacom Intuos Pro M (WL) Pen eraser" MapToOutput $SCREEN &
xsetwacom set "Wacom Intuos Pro M (WL) Finger touch" Touch off &
# xinput set-float-prop "Wacom Intuos Pro M (WL) Finger touch" "Device Accel Constant Deceleration" 2
sxhkd &
chia start farmer &
sleep 60 && ksnip &
sleep 60 && libinput-gestures-setup start &
pactl load-module module-null-sink media.class=Audio/Sink sink_name=combine channel_map=stereo &
# xfsettingsd &
