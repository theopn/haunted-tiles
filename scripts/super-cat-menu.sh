#!/bin/bash

#
# Script to execute power related actions using fzf
#
# @requires Bash 4.0 >=  (associative array)
# @requires fzf          (select interface)
#

stuff=('󰖨 Toggle Gammastep' ' Toggle Do Not Disturb' ' Weather')

header="󰝚 $(~/.config/haunted-tiles/scripts/spotify.py)
C-c to exit
 "

selected=$(printf "%s\n" "${stuff[@]}" | fzf \
  --reverse \
  --border=rounded \
  --no-info \
  --cycle \
  --header="$header")

[ -z "$selected" ] && exit 0

  case "$selected" in
    *"Do Not Disturb") ~/.config/haunted-tiles/scripts/dunst-toggle.sh
      ;;
    *"Gammastep") ~/.config/haunted-tiles/scripts/display-tools-toggle.sh gammastep
      ;;
    *"Weather") ~/.config/haunted-tiles/scripts/weather.sh
      ;;
    *) notify-send "Bug in the script"
    ;;
  esac

exit 0

