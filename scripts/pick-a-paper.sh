#!/bin/bash

MONITOR="DP-2"

WALLPAPER_DIR="$HOME/.hick-os/wallpapers"

SELECTED=$(find "$WALLPAPER_DIR" -type f | wofi --dmenu --prompt="Select Wallpaper: ")

[ -z "$SELECTED" ] && exit

hyprctl hyprpaper unload all
hyprctl hyprpaper preload "$SELECTED"
hyprctl hyprpaper wallpaper "$MONITOR,$SELECTED"
