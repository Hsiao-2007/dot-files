#!/bin/bash
if [[ "$USER" == "root" ]]; then
	echo "Please don't run this as root"
else
	whereis fastfetch
	if [[ "$?" -eq 0]]; then
		echo "Backing up existing config..."
		mv ~/.config/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc.bak
		echo -e "Old config exists in config.jsonc.bak\nCopying this cool config to ~/.config/fastfetch/..."
		cp config.jsonc ~/.config/fastfetch/
	else
		echo "Please install fastfetch first!"
		exit 1
	fi
fi
