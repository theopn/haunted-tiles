#!/bin/bash

# Options
area_cp=' area (to clipboard)'
area='󰩭 area (save to file)'
window=' window (save to file)'
screen='󰹑 screen (save to file)'
color='󰴱 color picker'

function run_rofi_selection() {
  echo -e "$area_cp\n$area\n$window\n$screen\n$color" | rofi -dmenu -p "Screenshot mode: "
}

function main() {
  chosen="$(run_rofi_selection)"
  case $chosen in
    $area_cp)
      grimshot --notify copy area
    ;;
    $area)
      grimshot --notify save area
    ;;
    $window)
      grimshot --notify save window
    ;;
    $screen)
      grimshot --notify save screen
    ;;
    $color)
      notify-send "$(grim -g "$(slurp -p)" -t ppm - | magick - -format '%[pixel:p{0,0}]' txt:-)"
    ;;
  esac
}

main
