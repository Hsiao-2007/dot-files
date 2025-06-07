#!/bin/bash
if [[ "$USER" == "root" ]]; then
	echo "Please don't run this as root"
else
    whereis librewolf
    if [[ "$?" -eq "0" ]]; then
        echo "Making new profile..."
        echo "Creating cache folder for profile"

    else
        echo "Install librewolf first"
        exit 1
    fi
fi
