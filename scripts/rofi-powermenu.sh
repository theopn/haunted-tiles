#!/bin/bash

#
# Revised from https://github.com/adi1090x/rofi/tree/master/files/powermenu
#

# Options
shutdown='  shutdown'
reboot=' 󰜉 reboot'
lock='  lock'
suspend=' 󰤄 suspend'
logout=' 󰗼 logout'
yes='  yes'
no=' 󰜺 no'

# List of commands
shutdown_cmd='systemctl poweroff'
suspend_cmd='systemctl suspend'
reboot_cmd='systemctl reboot'
if [[ "$DESKTOP_SESSION" == "i3" ]]; then
  lock_cmd=~/.config/haunted-tiles/scripts/i3lock.sh
elif [[ "$DESKTOP_SESSION" == "sway" ]]; then
  lock_cmd=~/.config/haunted-tiles/scripts/swaylock.sh
fi

function exit_wm() {
  if [[ "$DESKTOP_SESSION" == "i3" ]]; then
    i3-msg exit
  elif [[ "$DESKTOP_SESSION" == "sway" ]]; then
    swaymsg exit
  fi
}

# Power menu window for rofi
function rofi_selection_window() {
  rofi -dmenu \
    -p "Action for $(hostname)" \
    -mesg "Uptime: $(uptime -p | sed -e 's/up //g')"
}

# Pass variables to rofi dmenu
function run_rofi_selection() {
  echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi_selection_window
}

# Confirmation CMD
function rofi_confirmation_window() {
  rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 250px;}' \
    -theme-str 'mainbox {children: [ "message", "listview" ];}' \
    -theme-str 'listview {columns: 2; lines: 1;}' \
    -theme-str 'element-text {horizontal-align: 0.5;}' \
    -theme-str 'textbox {horizontal-align: 0.5;}' \
    -dmenu \
    -p 'Confirmation' \
    -mesg 'Are you Sure?'
}

# Ask for confirmation
function run_rofi_confirmation() {
  echo -e "$yes\n$no" | rofi_confirmation_window
}

# Execute Command
function confirm_then_run() {
  selected="$(run_rofi_confirmation)"
  if [[ "$selected" == "$yes" ]]; then
    if [[ $1 == '--shutdown' ]]; then
      $shutdown_cmd
    elif [[ $1 == '--reboot' ]]; then
      $reboot_cmd
    elif [[ $1 == '--logout' ]]; then
      exit_wm
    fi
  else
    exit 0
  fi
}

# Actions
function main() {
  chosen="$(run_rofi_selection)"
  case $chosen in
    $lock)
      $lock_cmd # No confirmation
    ;;
    $shutdown)
      confirm_then_run --shutdown
    ;;
    $reboot)
      confirm_then_run --reboot
    ;;
    $suspend)
      $suspend_cmd # No confirmation
    ;;
    $logout)
      confirm_then_run --logout
    ;;
  esac
}

main
