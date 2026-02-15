#!/bin/bash

on_action=' Pause Notification'
off_action=' Resume Notification'

current=' You are being disturbed'
toggle="$on_action"
if [[ $(dunstctl is-paused) == 'true' ]]; then
  current=" You are missing out on $(dunstctl count waiting) notifications"
  toggle="$off_action"
fi

action=$(echo -e "$toggle" | rofi -dmenu \
  -theme-str 'window {height: 150px; width: 400px;}' \
  -theme-str 'mainbox {children: [ "message", "listview" ];}' \
  -theme-str 'listview {columns: 1;}' \
  -theme-str 'element-text {horizontal-align: 0.5;}' \
  -theme-str 'textbox {horizontal-align: 0.5;}' \
  -mesg "$current")

if [[ "$action" == "$on_action" ]]; then
  dunstctl set-paused true
elif [[ "$action" == "$off_action" ]]; then
  dunstctl set-paused false
fi
