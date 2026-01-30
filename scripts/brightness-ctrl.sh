#!/bin/bash

bar_color="#FFFFFC"

function get_brightness() {
  brightnessctl get --percentage
}

function show_brightness_notif() {
  brightness=$(get_brightness)
  if [[ $brightness -le 25 ]]; then
    icon="󰃞 "
  elif [[ $brightness -le 50 ]]; then
    icon="󰃟 "
  elif [[ $brightness -le 75 ]]; then
    icon="󰃝 "
  else
    icon="󰃠 "
  fi

  dunstify --timeout=1000 --replace=696969 -u low "${icon} Brightness: ${brightness}%" -h int:value:${brightness} -h string:hlcolor:${bar_color}
}

case $1 in
  up)
    brightnessctl set +5%
    ;;
  down)
    brightnessctl set 5%-
    ;;
esac

show_brightness_notif

