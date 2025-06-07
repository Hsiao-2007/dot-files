#!/bin/bash
while true; do
	WALLPAPER_CHOICE=`cat /tmp/wallpaper_choice.txt`
	if [[ "$WALLPAPER_CHOICE" == "BEACH" ]]; then
		echo "{\"text\": \" Sunny Beach\", \"alt\": \"beach\"}"
	elif [[ "$WALLPAPER_CHOICE" == "RAIN" ]]; then
		echo "{\"text\": \" Rainy Glass\", \"alt\": \"rain\"}"
	elif [[ "$WALLPAPER_CHOICE" == "SNOW" ]]; then
		echo "{\"text\": \" Snowy Lake\", \"alt\": \"snow\"}"
	elif [[ "$WALLPAPER_CHOICE" == "EVA" ]]; then
		echo "{\"text\": \" Evangelion Beach\", \"alt\": \"eva\"}"
	else
		echo "{\"text\": \" Wallpaper\", \"alt\": \"default\"}"
	fi
done
