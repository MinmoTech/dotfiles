#!/bin/sh

libinput-gestures-setup stop && libinput-gestures-setup start
SCREEN="HDMI-0"
xsetwacom set "Wacom Bamboo 16FG 4x5 Pen eraser" MapToOutput $SCREEN &
xsetwacom set "Wacom Bamboo 16FG 4x5 Pen stylus" MapToOutput $SCREEN &
# xsetwacom set "Wacom Bamboo 16FG 4x5 Pen stylus" Touch off &

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
# xsetwacom set "Wacom Intuos Pro M (WL) Finger touch" Touch off &
