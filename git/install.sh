#!/bin/bash
if [[ "$USER" == "root" ]]; then
	echo "Please don't run this as root"
else
    whereis git 
    if [[ "$?" -eq "0" ]]; then
        echo "Setting up git config"
        git config --global user.email 147453729+Hsiao-2007@users.noreply.github.com
        git config --global user.name Hsiao2007
        git config --global credential.helper store
        git config --global merge.tool diff3
        git config --global core.pager delta
        git config --global interactive.difffilter delta --color-only
        git config --global delta.navigate true
        git config --globaL delta.side-by-side true
        git config --global diff.colormoved default
        echo "Done! Make a new github key from your account, and setup keepassxc and syncthing to access the account!"
    else
        echo "Install git and git-delta first!"
        exit 1
    fi
fi
