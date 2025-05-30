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

cat <<EOF >> ${XDG_CONFIG_HOME}/redshift.conf
[redshift]
temp-day=5600
temp-night=3500
gamma=0.8
adjustment-method=randr
location-provider=manual

[manual]
lat=0.0
lon=0.0
EOF

echo "Deploying Sway, Swaylock, and Waybar..."
ln -s ${HAUNTED_TILES_DIR}/sway ${XDG_CONFIG_HOME}/sway
ln -s ${HAUNTED_TILES_DIR}/swaylock ${XDG_CONFIG_HOME}/swaylock
ln -s ${HAUNTED_TILES_DIR}/waybar ${XDG_CONFIG_HOME}/waybar

mkdir -p ${XDG_CONFIG_HOME}/gammastep
cat <<EOF >> ${XDG_CONFIG_HOME}/gammastep/config.ini
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
