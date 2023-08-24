#!/bin/bash

# Define var related to 
[[ -z $XDG_CONFIG_HOME ]] && XDG_CONFIG_HOME="$HOME/.config"
HUNTED_TILES_DIR="$XDG_CONFIG_HOME/haunted-tiles"

# Echo $1 in ANSI green
function green_echo() {
  echo -e "\033[0;32m[Hunted-Tiles]${1}\033[0m"
}

# Echo $1 in ANSI red
function red_echo() {
  echo -e "\033[0;31m[Hunted-Tiles] ${1}\033[0m"
}

# Check if this script was executed in $HUNTED_TILES_DIR
# Else, echo an error message and exit
verify_script_dir() {
  script_dir=$( cd -- "$( dirname -- ${BASH_SOURCE[0]} )" &> /dev/null && pwd )
  if [[ "$script_dir" != "$HUNTED_TILES_DIR" ]]; then
    red_echo "Please locate this folder in $HUNTED_TILES_DIR"
    exit 1
  fi
}

# Verify the script directory and make symlinks for config files
main() {
  verify_script_dir

  green_echo "Installing Sway and Waybar configurations..."
  ln -sf ~/.config/haunted-tiles/sway ~/.config/sway
  ln -sf ~/.config/haunted-tiles/waybar ~/.config/waybar
  green_echo "Done!"
}

main

