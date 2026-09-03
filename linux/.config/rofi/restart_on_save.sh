#!/bin/bash

rofi -show drun &
while inotifywait -r -e close_write ~/.config/rofi; do
  pkill -x rofi
  rofi -show drun &
done
