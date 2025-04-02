#!/bin/bash

# Path to the new wallpaper
NEW_WALLPAPER="$1"

# Set the new wallpaper using swww
swww img "$NEW_WALLPAPER" && wal -i "$NEW_WALLPAPER"

#creating sys link
ln -sf $NEW_WALLPAPER ~/.config/hypr/dynwall/current_wallpaper.png


# Update Hyprlock configuration
HYPRLOCK_CONFIG="/home/phinixr/.config/hypr/hyprlock.conf"
sed -i "s|^\(path = \).*|\1$NEW_WALLPAPER|" "$HYPRLOCK_CONFIG"

# Reload Hyprlock to apply the new background
pkill -USR2 hyprlock
