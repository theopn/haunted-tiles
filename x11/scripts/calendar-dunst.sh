#!/bin/bash

year=$(date +%Y)
# - to produce num without leading 0 which could be interpreted as an octal number
month=$(date +%-m)
case $1 in
  'prev') ((month--));;
  'next') ((month++));;
esac

notify-send "      Calendar" "$(cal $month $year)"
