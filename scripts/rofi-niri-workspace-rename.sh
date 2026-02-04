#!/bin/bash

# Options
rename='󰑕 rename'
reset='󰬟 reset'
cancel='󰜺 cancel'

function run_rofi_selection() {
  echo -e "$rename\n$reset\n$cancel" | rofi -dmenu -p ">" -mesg "Changing Current Workspace Name"
}

function get_name() {
  echo "" | rofi -dmenu -p "Enter Workspace Name:" -l 0
}

function main() {
  chosen="$(run_rofi_selection)"
  case $chosen in
    $rename)
      niri msg action set-workspace-name $(get_name)
    ;;
    $reset)
      niri msg action unset-workspace-name
    ;;
  esac
}

main
