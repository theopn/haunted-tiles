#!/bin/bash

HIST_JSON=$(dunstctl history)

function replace_special_char() {
  # replace & < > since Rofi throws Pango error with them
  echo "$1" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g'
}

function get_notif_list() {
  local uptime=$(awk '{print $1}' /proc/uptime)

  echo "$HIST_JSON" | jq -r --arg uptime "$uptime" '
  .data[0][] |
    (($uptime | tonumber) - (.timestamp.data / 1000000)) as $age |
    (
      if $age < 60 then "\($age | floor)s"
      elif $age < 3600 then "\($age / 60 | floor)m"
      elif $age < 86400 then "\($age / 3600 | floor)h"
      else "\($age / 86400 | floor)d"
      end
    )
    as $time |
      "<span size=\"small\">[\($time)]</span> <b>\(.appname.data | @html)</b>: \(.summary.data | @html)"
  '
}

function set_shell_var() {
  echo "$HIST_JSON" | jq -r --argjson idx "$1" '
  .data[0][$idx] |
    "ID=\(.id.data) APP=\(.appname.data | @sh) SUMMARY=\(.summary.data | @sh) BODY=\(.body.data | @sh) URGENCY=\(.urgency.data | @sh)"
  '
}

function main() {

  # -i for case insensitivity
  local idx=$(get_notif_list | rofi -dmenu -p "History" -markup-rows -format i -i)
  # Exit if no selection
  [[ -z "$idx" ]] && exit 0

  # set variables with jq
  eval $(set_shell_var "$idx")

  local msg="<b>App:</b> $(replace_special_char "$APP")
<b>Summary:</b> $(replace_special_char "$SUMMARY")
<b>Urgency:</b> $(replace_special_char "$URGENCY")
$(replace_special_char "$BODY")
  "
  local action=$(echo -e "close\ndelete" | rofi -dmenu -p "Action" -mesg "$msg" -markup-rows -theme-str 'listview {columns: 2; lines: 1;}')

  if [ "$action" == "Delete" ]; then
    dunstctl history-rm "$ID"
  fi
}

main
