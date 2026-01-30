#!/bin/bash

bar_color="#FFFFFF"

function get_volume() {
  pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]{1,3}(?=%)' | head -1
}

function get_mute() {
  pactl get-sink-mute @DEFAULT_SINK@ | grep -Po '(?<=Mute: )(yes|no)'
}


function show_volume_notif() {
  volume=$(get_volume)
  mute=$(get_mute)
  if [[ $volume -eq 0 ]] || [[ $mute == "yes" ]] ; then
    volume_icon="󰖁  MUTED"
  elif [[ $volume -lt 50 ]]; then
    volume_icon="󰖀"
  else
    volume_icon="󰕾"
  fi

  dunstify -i audio-volume-muted-blocking --timeout=1000 --replace=6969 -u low "${volume_icon} Volume: ${volume}%" -h int:value:${volume} -h string:hlcolor:${bar_color}
}

case $1 in
  up)
    pactl set-sink-volume @DEFAULT_SINK@ +5%
    ;;
  down)
    pactl set-sink-volume @DEFAULT_SINK@ -5%
    ;;
  mute)
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    ;;
esac

show_volume_notif

