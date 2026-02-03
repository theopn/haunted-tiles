#!/bin/bash

#
# Revised from https://github.com/adi1090x/rofi/tree/master/files/powermenu
#

# Options
shutdown='   shutdown'
reboot=' 󰜉  reboot'
lock='   lock'
suspend=' 󰤄  suspend'
logout=' 󰗼  logout'
yes='   yes'
no=' 󰜺  no'

# List of commands
shutdown_cmd='systemctl poweroff'
suspend_cmd='systemctl suspend'
reboot_cmd='systemctl reboot'
lock_cmd="loginctl lock-session"

function lock_wm() {
  if [[ "$DESKTOP_SESSION" == "sway" ]] || [[ "$DESKTOP_SESSION" == "niri" ]]; then
    swaylock -f
  elif [[ "$DESKTOP_SESSION" == "i3" ]]; then
    i3lock --ignore-empty-password --show-failed-attempts -c \#282A36 -i $XDG_CONFIG_HOME/lockscreen.png
  else
    loginctl lock-session
  fi
}

function exit_wm() {
  if [[ "$DESKTOP_SESSION" == "sway" ]]; then
    swaymsg exit
  elif [[ "$DESKTOP_SESSION" == "niri" ]]; then
    niri msg action quit
  elif [[ "$DESKTOP_SESSION" == "hyprland" ]]; then
    hyprctl dispatch exit
  elif [[ "$DESKTOP_SESSION" == "i3" ]]; then
    i3-msg exit
  fi
}


# Main menu
function run_rofi_selection() {
  echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi -dmenu -p "Action for $(hostname)" -mesg "Uptime: $(uptime -p | sed -e 's/up //g')"
}

# Confirmation menu
function run_rofi_confirmation() {
  echo -e "$yes\n$no" | rofi  -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 250px;}' \
                              -theme-str 'mainbox {children: [ "message", "listview" ];}' \
                              -theme-str 'listview {columns: 2; lines: 1;}' \
                              -theme-str 'element-text {horizontal-align: 0.5;}' \
                              -theme-str 'textbox {horizontal-align: 0.5;}' \
                              -dmenu \
                              -p 'Confirmation' \
                              -mesg 'Are you Sure?'

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
      lock_wm
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
