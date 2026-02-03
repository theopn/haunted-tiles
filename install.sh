#!/usr/bin/env bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
HAUNTED_TILES_DIR=${XDG_CONFIG_HOME}/haunted-tiles

ln -s "${HAUNTED_TILES_DIR}/dunst"      "${XDG_CONFIG_HOME}/dunst"
ln -s "${HAUNTED_TILES_DIR}/rofi"       "${XDG_CONFIG_HOME}/rofi"
ln -s "${HAUNTED_TILES_DIR}/sway"       "${XDG_CONFIG_HOME}/sway"
ln -s "${HAUNTED_TILES_DIR}/swayidle"   "${XDG_CONFIG_HOME}/swayidle"
ln -s "${HAUNTED_TILES_DIR}/swaylock"   "${XDG_CONFIG_HOME}/swaylock"
ln -s "${HAUNTED_TILES_DIR}/waybar"     "${XDG_CONFIG_HOME}/waybar"
ln -s "${HAUNTED_TILES_DIR}/gammastep"  "${XDG_CONFIG_HOME}/gammastep"

mkdir -p ~/.local/bin
for f in "${HAUNTED_TILES_DIR}/scripts/*"; do
  ln -s $f ~/.local/bin/
done

echo "Done!"
