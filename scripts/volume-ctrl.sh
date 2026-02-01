#!/bin/bash

bar_color="#FFFFFF"

function get_volume() {
  # pactl should work in most system with pipewire-pulse, but wpctl is the way to go
  #pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]{1,3}(?=%)' | head -1
  wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}'
}

function get_mute() {
  #pactl get-sink-mute @DEFAULT_SINK@ | grep -Po '(?<=Mute: )(yes|no)'
  wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print ($3 == "[MUTED]" ? "yes" : "no")}'
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

  dunstify --timeout=1000 --replace=6969 -u low "${volume_icon} Volume: ${volume}%" -h int:value:${volume} -h string:hlcolor:${bar_color}
}

case $1 in
  up)
    #pactl set-sink-volume @DEFAULT_SINK@ +5%
    # Limit to 1.0
    wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
    ;;
  down)
    #pactl set-sink-volume @DEFAULT_SINK@ -5%
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    ;;
  mute)
    #pactl set-sink-mute @DEFAULT_SINK@ toggle
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    ;;
esac

show_volume_notif

