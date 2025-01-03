#!/bin/bash

# This is an install script to install all the components of this directory
if [[ "$USER" != "root" ]]; then
  echo "Run this script as root!"
  exit -1
else
  echo -e "!WARNING!\nThis script will install packagesm clone repos, use systemd, and take a while.\n"
  read -p "Are you sure you want to continue with this script? (y/n): " result
  if [[ "$result" == "y" || "$result" == "Y" ]]; then
    # Run all commands here
    echo "Beginning process"
    # Git install
    echo "Detecting git installation"
    whereis git
    if [[ "$?" -eq "0" ]]; then
        echo "Git found, not forcing install"
    else
        echo "Git not installed, installing git"
        sudo pacman -S git git-delta
    fi
    #TODO: Create import script to extract this data appropriately
    echo "Git config being setup"
    git config --global user.email 147453729+Hsiao-2007@users.noreply.github.com
    git config --global user.name Hsiao-2007
    git config --global credential.helper store
    git config --global merge.tool diff3
    git config --global core.pager delta
    git config --global core.editor nvim
    git config --global interactive.difffilter delta --color-only
    git config --global delta.navigate true
    git config --globaL delta.side-by-side true
    git config --global diff.colormoved default
    git config --global init.defaultbranch main
    echo "Git install complete"
    read -p -s "While this script pauses, please create a github api key to use for the upcoming git pull requests!"
    sleep 5
    #Unset token
    unset token
  else
    echo "Cancelling script..."
    exit -1
  fi
fi
