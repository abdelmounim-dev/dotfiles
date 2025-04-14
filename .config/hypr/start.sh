#!/usr/bin/env bash


# waybar &
hyprpanel &

wlsunset -l 36.75851497165432 -L 3.235354900705176 &

# dunst 
appimage-run ~/Downloads/stayfree-linux-x86_64.AppImage 

hyprpaper &
# swww-daemon &
#
# swww img ~/Pictures/wallpaper.*
