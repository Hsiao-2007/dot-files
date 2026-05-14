#!/bin/bash

if ! test -f /tmp/clock; then
	touch /tmp/clock
	echo "off" > /tmp/clock
fi
if [[ $(cat /tmp/clock) == "off" ]]; then
	echo "Going on"
	# Get correct window rules!
	hyprctl dispatch 'hl.dsp.exec_cmd("kitty --execute peaclock --config-dir ~/.config/peaclock/",  { border_size = 0, float = true, center = true, workspace = "special",size = {"monitor_w/1.25", "monitor_h/2"}, no_initial_focus = true})'
	echo on > /tmp/clock
else
	echo "Turning off"
	killall peaclock
	echo off > /tmp/clock
fi
