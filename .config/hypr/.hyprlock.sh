#!/usr/bin/env bash

set TIMER=3600
grim -o DP-2 -l 0 /tmp/hyprlock_screenshot2.png & # run this command in background
grim -o DP-1 -l 0 /tmp/hyprlock_screenshot1.png & # idem
wait && # wait background commands to finish
hyprlock # so hyprlock will only start when screenshot(s) are done
