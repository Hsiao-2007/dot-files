#!/bin/bash

if ! test -f /tmp/cava; then
	touch /tmp/cava
	echo "off" > /tmp/cava
fi
if [[ $(cat /tmp/cava) == "off" ]]; then
	echo "Going on"
	# Get correct window rules!
	hyprctl dispatch exec \
	"[bordersize 0; float; center; workspace special; silent; size 80% 50%] kitty --execute cava"
	echo on > /tmp/cava
else
	echo "Turning off"
	hyprctl dispatch killwindow "title:cava"
	echo off > /tmp/cava
fi
