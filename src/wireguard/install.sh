#!/bin/bash
if [[ "$USER" == "root" ]]; then
	whereis wg-quick
	if [[ "$?" -eq 0]]; then
        cp Server.conf ~/
        sudo chmod 400 ~/Server.conf
	else
		echo "Please install wireguard-tools first!"
		exit 1
	fi
else
	    echo "Please run this as root"
fi
