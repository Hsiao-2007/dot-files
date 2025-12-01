#!/bin/bash
WALLPAPER_CHOICE=`cat /tmp/wallpaper_choice.txt`
if [[ "$WALLPAPER_CHOICE" == "BEACH" ]]; then
	hyprctl hyprpaper wallpaper ", $XDG_PICTURES_DIR/Wallpapers/RainyWallpaper.png"
	echo "Using RAIN wallpaper.."
	echo "RAIN" > /tmp/wallpaper_choice.txt
elif [[ "$WALLPAPER_CHOICE" == "RAIN" ]]; then
	hyprctl hyprpaper wallpaper ", $XDG_PICTURES_DIR/Wallpapers/SnowyWallpaper.png"
	echo "Using SNOW wallpaper.."
	echo "SNOW" > /tmp/wallpaper_choice.txt
elif [[ "$WALLPAPER_CHOICE" == "SNOW" ]]; then
	hyprctl hyprpaper wallpaper ", $XDG_PICTURES_DIR/Wallpapers/EvaWallpaper.jpg"
	echo "Using EVA wallpaper.."
	echo "EVA" > /tmp/wallpaper_choice.txt 
elif [[ "$WALLPAPER_CHOICE" == "EVA" ]]; then
	hyprctl hyprpaper wallpaper ", $XDG_PICTURES_DIR/Wallpapers/Unit01Wallpaper.png"
	echo "Using UNIT01 wallpaper.."
	echo "UNIT01" > /tmp/wallpaper_choice.txt
elif [[ "$WALLPAPER_CHOICE" == "UNIT01" ]]; then
	hyprctl hyprpaper wallpaper ", $XDG_PICTURES_DIR/Wallpapers/BeachWallpaper.jpg"
	echo "Using BEACH wallpaper.."
	echo "BEACH" > /tmp/wallpaper_choice.txt
else
	hyprctl hyprpaper wallpaper ", $XDG_PICTURES_DIR/Wallpapers/BeachWallpaper.jpg"
	echo "Using DEFAULT wallpaper.."
	echo "BEACH" > /tmp/wallpaper_choice.txt
fi
  
