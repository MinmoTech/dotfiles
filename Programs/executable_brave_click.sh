#!/bin/sh

test $(hostname) == mobilus && \
	xdotool mousemove 1700 100 click 1 mousemove restore || \
	xdotool mousemove 2300 100 click 1 mousemove restore


