#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "Usage: set-wallpaper <image path>"
  exit 1
fi

ASSETS_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/theo-niri-assets"
mkdir -p "$ASSETS_DIR"
WALLPAPER="$ASSETS_DIR/wallpaper.png"
LOCKSCREEN="$ASSETS_DIR/lockscreen.png"

# Back up existing wallpaper
if [ -f "$WALLPAPER" ]; then
  TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
  cp "$WALLPAPER" "$ASSETS_DIR/wallpaper-$TIMESTAMP.png"
fi

# Convert to change it to PNG
magick "$1" "$WALLPAPER"

# Generate lockscreen image with imagemagick and Nerdfont lock icon
magick "$WALLPAPER"                       \
  -blur 0x8 -fill black -colorize 40%     \
  -font "ProggyClean-Nerd-Font" -pointsize 180 -fill white -gravity center -annotate +0+0 "" \
  "$LOCKSCREEN"

# Respawn swaybg (|| true for in case it failed to kill)
pkill swaybg || true
swaybg --mode fill --image "$WALLPAPER" > /dev/null 2>&1 & disown

dunstify -u low -i "$WALLPAPER" "Wallpaper & lockscreen updated"

