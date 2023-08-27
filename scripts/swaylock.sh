#!/bin/sh

LOCK_SCREEN=~/.config/haunted-tiles/assets/naomi-solarsys-draculafied-lockscreen.png

lock() {
  if [ -e $LOCK_SCREEN ]
  then
    swaylock -i $LOCK_SCREEN
  else
    swaylock -c '#282A36'
  fi
}

lock

exit 0

