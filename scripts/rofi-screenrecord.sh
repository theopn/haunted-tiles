#!/bin/bash

# Options
stop=' stop recording'
area='󰩭 area'
screen='󰹑 screen'

function run_rofi_selection() {
  echo -e "$stop\n$area\n$screen" | rofi -dmenu -p "Screenrecording mode: " -mesg "Save path: ~/Pictures"
}

function main() {
  chosen="$(run_rofi_selection)"
  case $chosen in
    $stop)
      killall -s SIGINT wf-recorder
    ;;
    $area)
      wf-recorder --audio -f ~/Pictures/record-$(date +"%Y-%m-%d--%H-%M-%S.mp4") -g "$(slurp)"
    ;;
    $screen)
      wf-recorder --audio -f ~/Pictures/record-$(date +"%Y-%m-%d--%H-%M-%S.mp4")
    ;;
  esac
}

main
