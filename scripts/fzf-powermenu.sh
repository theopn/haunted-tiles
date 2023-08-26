#!/bin/bash

#
# Script to execute power related actions using fzf
#
# @requires Bash 4.0 >=  (associative array)
# @requires fzf          (select interface)
#

# I can use ${!POWEROPT_HASH[@]}, but order gets messsed up if I do that
POWEROPT=("  shutdown" " 󰜉 reboot" "  lock" " 󰤄 suspend" " 󰗼 logout")
declare -A POWEROPT_HASH
POWEROPT_HASH=(
  #[" 󰗼 logout"]=$exit_wm \ --> Call the function directly later
  ["  lock"]="swaylock" \
  [" 󰤄 suspend"]="systemctl suspend" \
  [" 󰜉 reboot"]="systemctl reboot" \
  ["  shutdown"]="systemctl poweroff" \
)

function exit_wm() {
  case "$DESKTOP_SESSION" in
    "i3") i3-msg exit
    ;;
    "sway") swaymsg exit
    ;;
    *) notify-send "Current WM is not supported for logout"
    ;;
  esac
}

# Function to prompt user for confirmation
# Use this function as follow:
#   ans=$(confirm_selection $user_selected_action)
#   [[ "$ans" =~ .yes ]] && exec $user_selected_action
# $1: Command you are confirming (for display purpose)
function confirm_selection() {
  opt=('  yes' ' 󰜺 no')
  printf "%s\n" "${opt[@]}" | fzf --reverse --no-info --cycle --header="Confirm $1"
}

# Function to prompt user for power menu option selection
# Call for confirmation if poweroff or reboot is selected
function power_menu_selection() {
  header="Uptime: $(uptime -p | sed -e 's/up //g')"
  selected=$(printf "%s\n" "${POWEROPT[@]}" | fzf --reverse --border=rounded --no-info --cycle --header="$header")
  selectde_opt=${POWEROPT_HASH[$selected]}
  case "$selected" in
    "  shutdown"|" 󰜉 reboot") ans=$(confirm_selection $selected)
      [[ "$ans" =~ .yes ]] && exec $selectde_opt
    ;;
    " 󰗼 logout") ans=$(confirm_selection $selected)
      [[ "$ans" =~ .yes ]] && exit_wm
    ;;
    "  lock"|" 󰤄 suspend") exec $selectde_opt
    ;;
    *) echo "No option was selected :("
    ;;
  esac
}


power_menu_selection

