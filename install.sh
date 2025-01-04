#!/bin/bash
#TODO: Create import script to update this script's install proccess!
# This is an install script to install all the components of this directory
ERROR_PREFIX="\e[31m\e[1mERROR:\e[0m"
if [[ "$USER" != "root" ]]; then
  echo "$ERROR_PREFIX Run this script as root!"
  exit -1
else
  ls | grep -q 'src' 
  if [[ "$?" -ne "0" ]]; then
    echo -e "$ERROR_PREFIX Please be inside of the git repository when running install.sh, such that ls returns (\e[3mIn no particular order\e[0m)\nsrc\tinstall.sh\tREADME.md\nFollow the instructions on README.md before running again"
    exit -1
  fi
    echo -e "\e[31m\e[1m\!WARNING\!\e[0m \nThis script will install packages, clone repos, use systemd, and do other root related tasks.\n"
  read -p "Are you sure you want to continue with this script? (y/n): " result
  if [[ "$result" == "y" || "$result" == "Y" ]]; then
    echo "Beginning process"
    # Check internet
    ping -n 10 gnu.org
    if [[ "$?" -ne "0" ]]; then
      echo "$ERROR_PREFIX Please correctly configure an internet connection to download any packages or install anything from github!"
      exit -1
    fi
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
    # fastfetch config install
    fastfetch --gen-config
    mv ~/.config/fastfetch/config.jsonc ~/.config/fastfetch/bk.config.jsonc
    cp src/fastfetch/config.jsonc ~/.config/fastfetch/
    # wireguard setup
    cp src/wireguard/Server.conf

    # End
    unset ERROR_PREFIX
  else
    echo "Cancelling script..."
    exit -1
  fi
fi
