#!/bin/bash

WALLPAPER_DIR="$HOME/.config/sway/wallpaper"
SYMLINK_PATH="$HOME/.config/sway/current_wallpaper"

if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "ERROR: $WALLPAPER_DIR does not exist."
    exit 1
fi

WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -print0 | shuf -z -n 1 | tr -d '\0')

if [ -n "$WALLPAPER" ]; then
    ln -sf "$WALLPAPER" "$SYMLINK_PATH"
    swaymsg "output * bg '$WALLPAPER' fill"
    notify-send "Wallpaper applied" "$(basename "$WALLPAPER")"
else
    echo "No images found in $WALLPAPER_DIR."
    exit 1
fi
