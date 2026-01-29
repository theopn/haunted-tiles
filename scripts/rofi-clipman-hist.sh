#!/bin/bash

# Options
show=' show history'
clear=' clear history'

function run_rofi_selection() {
  echo -e "$show\n$clear" | rofi -dmenu -p "Select action: "
}

function main() {
  chosen="$(run_rofi_selection)"
  case $chosen in
    $show)
      clipman pick -t rofi
    ;;
    $clear)
      clipman clear --all
    ;;
  esac
}

main
