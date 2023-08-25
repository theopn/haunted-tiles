#!/bin/bash

bar=~/.config/haunted-tiles/polybar/config.inl

# Kill previous instances of polybar and wait until they are actually killed
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -c $bar -r -q

exit 0

