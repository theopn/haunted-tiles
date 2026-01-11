#!/usr/bin/env bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
HAUNTED_TILES_DIR=${XDG_CONFIG_HOME}/haunted-tiles

ln -s "${HAUNTED_TILES_DIR}/rofi"       "${XDG_CONFIG_HOME}/rofi"
ln -s "${HAUNTED_TILES_DIR}/sway"       "${XDG_CONFIG_HOME}/sway"
ln -s "${HAUNTED_TILES_DIR}/swaylock"   "${XDG_CONFIG_HOME}/swaylock"
ln -s "${HAUNTED_TILES_DIR}/waybar"     "${XDG_CONFIG_HOME}/waybar"

mkdir -p "${XDG_CONFIG_HOME}/gammastep"
cat <<EOF >> "${XDG_CONFIG_HOME}/gammastep/config.ini"
[general]
temp-day=5600
temp-night=3500
gamma=0.8
adjustment-method=wayland
location-provider=manual

[manual]
lat=0.0
lon=0.0
EOF

mkdir -p ~/.local/bin
for f in "${HAUNTED_TILES_DIR}/scripts/*"; do
  ln -s $f ~/.local/bin/
done

echo "Done!"
