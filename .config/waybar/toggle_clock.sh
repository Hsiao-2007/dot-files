#!/bin/bash

if ! test -f /tmp/clock; then
	touch /tmp/clock
	echo "off" > /tmp/clock
fi
if [[ $(cat /tmp/clock) == "off" ]]; then
	echo "Going on"
	# Get correct window rules!
	hyprctl dispatch exec \
	"[bordersize 0; float; center; workspace special; silent; size 80% 50%] kitty --execute \
	peaclock --config-dir ~/.config/peaclock/"
	echo on > /tmp/clock
else
	echo "Turning off"
	hyprctl dispatch killwindow "title:peaclock"
	echo off > /tmp/clock
fi
