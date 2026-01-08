#!/bin/bash

function get_output() {
  CONNECTED_MONITORS=($(xrandr | grep -w connected | cut -d ' ' -f 1))
  for MONITOR in "${CONNECTED_MONITORS[@]}"; do
    echo "$MONITOR"
  done
}

function select_output() {
  get_output | rofi -dmenu -p "Choose an output"
}

function select_option() {
  echo -e "--left-of\n--right-of\n--above\n--below\n--same-as\n--off" | rofi -dmenu -p "Choose an option"
}

function main() {
  OUTPUT=$(select_output)
  [[ -z $OUTPUT ]] && exit 0
  OPTION=$(select_option)
  [[ -z $OPTION ]] && exit 0

  if [[ "$OPTION" == "--off" ]]; then
    CMD="xrandr --output $OUTPUT --off"
  else
    ANOTHER_OUTPUT=$(select_output)
    [[ -z $ANOTHER_OUTPUT ]] && exit 0
    CMD="xrandr --output $OUTPUT --auto $OPTION $ANOTHER_OUTPUT"
  fi

  CONFIRM=$(echo -e "Yes\nNo" | rofi -dmenu -p "Run the following command?" -mesg "$CMD")
  if [[ "$CONFIRM" == "Yes" ]]; then
    $CMD
    #notify-send "Re-launching Polybar..."
    #/home/theopn/.config/haunted-tiles/scripts/polybar-launch.sh
  fi
}

main

