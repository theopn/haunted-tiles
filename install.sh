#!/usr/bin/env bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="~/.config"}
HAUNTED_TILES_DIR=${XDG_CONFIG_HOME}/haunted-tiles

echo "Deploying dunst and Rofi"
ln -s "${HAUNTED_TILES_DIR}/dunst" "${XDG_CONFIG_HOME}/dunst"
ln -s ${HAUNTED_TILES_DIR}/rofi ${XDG_CONFIG_HOME}/rofi

echo "Deploying i3, Polybar, and Picom..."
ln -s ${HAUNTED_TILES_DIR}/i3 ${XDG_CONFIG_HOME}/i3
feh --bg-fill $XDG_CONFIG_HOME/wallpaper.png
ln -s ${HAUNTED_TILES_DIR}/polybar ${XDG_CONFIG_HOME}/polybar
ln -s ${HAUNTED_TILES_DIR}/picom ${XDG_CONFIG_HOME}/picom

echo "Deploying Sway, Swaylock, and Waybar..."
ln -s ${HAUNTED_TILES_DIR}/sway ${XDG_CONFIG_HOME}/sway
ln -s ${HAUNTED_TILES_DIR}/swaylock ${XDG_CONFIG_HOME}/swaylock
ln -s ${HAUNTED_TILES_DIR}/waybar ${XDG_CONFIG_HOME}/waybar

