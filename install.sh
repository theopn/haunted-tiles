#!/usr/bin/env bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="~/.config"}
HAUNTED_TILES_DIR=${XDG_CONFIG_HOME}/haunted-tiles

read -p "Deploy dotfiles for common utilities? (y/n) > " -n1 -r REPLY
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "Deploying dunst, rofi, ..."
  ln -s ${HAUNTED_TILES_DIR}/dunst ${XDG_CONFIG_HOME}/dunst
  ln -s ${HAUNTED_TILES_DIR}/rofi ${XDG_CONFIG_HOME}/rofi
fi

read -p "Deploy i3 related files? (y/n) > " -n1 -r REPLY
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "Deploying i3, polybar, ..."
  ln -s ${HAUNTED_TILES_DIR}/i3 ${XDG_CONFIG_HOME}/i3
  ln -s ${HAUNTED_TILES_DIR}/polybar ${XDG_CONFIG_HOME}/polybar
  ln -s ${HAUNTED_TILES_DIR}/picom ${XDG_CONFIG_HOME}/picom
fi

read -p "Deploy Sway related files? (y/n) > " -n1 -r REPLY
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "Deploying sway, swaylock, waybar, ..."
  ln -s ${HAUNTED_TILES_DIR}/sway ${XDG_CONFIG_HOME}/sway
  ln -s ${HAUNTED_TILES_DIR}/swaylock ${XDG_CONFIG_HOME}/swaylock
  ln -s ${HAUNTED_TILES_DIR}/waybar ${XDG_CONFIG_HOME}/waybar
  cat <<EOF >> ~/.config/swaybg
# Path must be absolute (no tilde)
output * bg $XDG_CONFIG_HOME/haunted-tiles/assets/naomi-solarsys-draculafied.png fill
EOF
fi

