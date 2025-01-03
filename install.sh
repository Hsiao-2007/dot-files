#!/bin/bash
#TODO: Create import script to update this script's install proccess!
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
    echo "Installing packages from pacman"
    sudo pacman -S base-devel firefox firefox-pwa git-delta neovim npm gcc cmake ccls samba fastfetch syncthing zsh bat eza wireguard-tools tmux alacritty --noconfirm
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
    echo "While this script pauses, please copy your github key an use it for the next install"
    sleep 5
    # yay install
    git clone https://aur.archlinux.org/yay-bin.git ~/yay-bin && cd ~/yay-bin; makepkg -si
    yay -S spotify spicetify vscodium-bin librewolf-bin ventoy-bin davinci-resolve --noconfirm
    
  else
    echo "Cancelling script..."
    exit -1
  fi
fi
