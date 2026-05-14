#!/bin/bash

if ! test -f /tmp/cava; then
	touch /tmp/cava
	echo "off" > /tmp/cava
fi
if [[ $(cat /tmp/cava) == "off" ]]; then
	echo "Going on"
	# Get correct window rules!
	hyprctl dispatch 'hl.dsp.exec_cmd("kitty --execute cava", { border_size = 0, float = true, center = true, workspace = "special",size = {"monitor_w/1.25", "monitor_h/2"}, no_initial_focus = true})'
	echo on > /tmp/cava
else
	echo "Turning off"
	killall cava
	echo off > /tmp/cava
fi
