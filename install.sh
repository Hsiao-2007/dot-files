#!/bin/bash

# This is an install script to install all the components of this directory
if [[ "$USER" != "root" ]]; then
  echo "Run this script as root!"
  exit -1
else
  echo -e "!WARNING!\nThis script will install packages using the arch linux pacman, clone repos, and take a while.\n"
  read -p "Are you sure you want to continue with this script? (y/n): " result
  if [[ "$result" == "y" || "$result" == "Y" ]]; then
    # Run all commands here
    echo "Beginning process"
  else
    echo "Cancelling script..."
    exit -1
  fi
fi
