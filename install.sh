#!/bin/bash

HAUNTED_TILES_DIR=~/.config/haunted-tiles
HT_BAK_DIR=~/haunted-tiles.bak

# Echo $1 in ANSI green
function green_echo() {
  echo -e "\033[0;32m[Haunted Tiles]${1}\033[0m"
}

# Echo $1 in ANSI yellow
function yellow_echo() {
  echo -e "\033[0;33m[Haunted Tiles] ${1}\033[0m"
}

# Echo $1 in ANSI red
function red_echo() {
  echo -e "\033[0;31m[Haunted Tiles] ${1}\033[0m"
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
#
# Prompts user yes/no for the installation of $1
selection_prompt() {
  yellow_echo "Would you like to install $1 related files?"
  read -p "y/n? > " -n1 -r REPLY
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    green_echo "Deploying $1 related files..."
    true
  else
    green_echo "Skipping $1 related files..."
    false
  fi
}

# Attempt to create a symlink for $1 in $2
# If a folder or file exists in $2, move to $HT_BAK_DIR
backup_then_symlink() {
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

  if selection_prompt 'Dunst'; then
    mkdir -p ~/.config/dunst/
    backup_then_symlink ${HAUNTED_TILES_DIR}/dunst/dunstrc ~/.config/dunst/dunstrc
  fi

  if selection_prompt 'Rofi'; then
    mkdir -p ~/.config/rofi/
    backup_then_symlink ${HAUNTED_TILES_DIR}/rofi/config.rasi ~/.config/rofi/config.rasi
  fi

  if selection_prompt 'i3'; then
    mkdir -p ~/.config/i3/
    backup_then_symlink ${HAUNTED_TILES_DIR}/i3/config ~/.config/i3/config
  fi

  feh --bg-fill ~/.config/haunted-tiles/assets/naomi-solarsys-draculafied.png
  echo
  yellow_echo 'Setting wallapaper... Modify ~/.fehbg to change the wallpaper'
  echo

  if selection_prompt 'Polybar'; then
    mkdir -p ~/.config/polybar/
    backup_then_symlink ${HAUNTED_TILES_DIR}/polybar/config.inl ~/.config/polybar/config.inl
  fi

  if selection_prompt 'Sway'; then
    mkdir -p ~/.config/sway/
    backup_then_symlink ${HAUNTED_TILES_DIR}/sway/config ~/.config/sway/config
  fi

  if selection_prompt 'Waybar'; then
    mkdir -p ~/.config/waybar/
    CURRENT_FILES=("config" "style.css")
    for FILE in ${CURRENT_FILES[@]}; do
      backup_then_symlink ${HAUNTED_TILES_DIR}/waybar/${FILE} ~/.config/waybar/${FILE}
    done
  fi

  green_echo "Done!"
}

main

