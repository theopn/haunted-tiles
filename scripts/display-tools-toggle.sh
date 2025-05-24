#!/bin/bash

if [[ $(ps -aux | grep [r]edshift | wc -l) > 0 ]]; then
  redshift -x
  sleep 1
  pkill -USR1 redshift
else
  redshift -x
  pkill -USR1 redshift
  sleep 1
  redshift -P
fi

