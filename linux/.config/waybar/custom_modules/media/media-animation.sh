#!/usr/bin/env bash

# "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█"

animation_frames=("▂▄▆" "▄▂▆" "▄▆▂" "▆▄▂" "▆▂▄")

while :; do
  status=$(playerctl metadata --format '{{status}}' 2>/dev/null)

  if [[ "$status" == "Playing" ]]; then
    for frame in "${animation_frames[@]}"; do
      printf '{"text":"%s","class":"playing"}\n' "$frame"
      sleep 0.1
    done

  elif [[ "$status" == "Paused" ]]; then
    printf '{"text":"","class":"paused"}\n'
    sleep 0.5

  else
    printf '{"text":"","class":"empty"}\n'
    sleep 0.5
  fi
done
