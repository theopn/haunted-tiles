#!/bin/bash

# Define var related to 
HAUNTED_TILES_DIR=~/.config/haunted-tiles
HT_BAK_DIR=~/haunted-tiles.bak

# Echo $1 in ANSI green
function green_echo() {
  echo -e "\033[0;32m[Hunted-Tiles]${1}\033[0m"
}

# Echo $1 in ANSI yellow
function yellow_echo() {
  echo -e "\033[0;31m[Hunted-Tiles] ${1}\033[0m"
}

# Echo $1 in ANSI red
function red_echo() {
  echo -e "\033[0;31m[Hunted-Tiles] ${1}\033[0m"
}

# Check if this script was executed in $HAUNTED_TILES_DIR
# Else, echo an error message and exit
verify_script_dir() {
  script_dir=$( cd -- "$( dirname -- ${BASH_SOURCE[0]} )" &> /dev/null && pwd )
  if [[ "$script_dir" != "$HAUNTED_TILES_DIR" ]]; then
    red_echo "Please locate this folder in $HAUNTED_TILES_DIR"
    exit 1
  fi
}

# Attempt to create a symlink for $1 in $2
# If a folder or file exists in $2, move to $HT_BAK_DIR
function backup_then_symlink() {
  if [[ -e $2 ]]; then
    yellow_echo "Existing $2 will be moved to $HT_BAK_DIR"
    mkdir -p $HT_BAK_DIR
    mv $2 $HT_BAK_DIR/
  fi
  green_echo "Creating symlink for $1 at $2..."
  ln -s $1 $2
}

# Verify the script directory and make symlinks for config files
main() {
  verify_script_dir

  green_echo "Installing common utility configurations..."
  backup_then_symlink "$HAUNTED_TILES_DIR/dunst" "$XDG_CONFIG_HOME/dunst"
  backup_then_symlink "$HAUNTED_TILES_DIR/rofi" "$XDG_CONFIG_HOME/rofi"
  green_echo "Done!"

  green_echo "Installing i3 and Polybar configurations..."
  backup_then_symlink "$HAUNTED_TILES_DIR/i3" "$XDG_CONFIG_HOME/i3"
  backup_then_symlink "$HAUNTED_TILES_DIR/polybar" "$XDG_CONFIG_HOME/polybar"
  green_echo "Done!"

  green_echo "Installing Sway and Waybar configurations..."
  backup_then_symlink "$HAUNTED_TILES_DIR/sway" "$XDG_CONFIG_HOME/sway"
  backup_then_symlink "$HAUNTED_TILES_DIR/waybar" "$XDG_CONFIG_HOME/waybar"
  green_echo "Done!"
}

main

