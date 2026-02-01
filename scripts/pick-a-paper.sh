#!/bin/bash

# Main (center) monitor
#
# TODO: Define my other monitors in case I want to use in le future.
MONITOR="DP-2"

# The directory storing all my wallpapers
WALLPAPER_DIR="$HOME/.hick-os/wallpapers"

# Use wofi launcher to display a list of all wallpapers and select one.
SELECTED=$(find "$WALLPAPER_DIR" -type f | wofi --dmenu --prompt="Select Wallpaper: ")
[ -z "$SELECTED" ] && exit

# Update the current wallpaper for the main monitor.
#
# TODO: Think about how to best handle my other monitors.
hyprctl hyprpaper wallpaper "$MONITOR, $SELECTED, cover"
