#!/bin/bash

# https://github.com/polybar/polybar/wiki

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

echo "---" | tee -a /tmp/polybar.log

# https://github.com/polybar/polybar/issues/763
for m in $(polybar --list-monitors | cut -d":" -f1); do
  if [ $m == 'eDP-1' ]; then
    MONITOR=$m polybar --reload main 2>&1 | tee -a /tmp/polybar.log & disown
  else
    MONITOR=$m polybar --reload secondary 2>&1 | tee -a /tmp/polybar.log & disown
  fi
done

