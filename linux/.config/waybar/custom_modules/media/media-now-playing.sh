#!/usr/bin/env bash

zscroll -l 20 \
  --delay 0.3 \
  --match-command "playerctl status" \
  --match-text "Playing" "--scroll 1" \
  --match-text "Paused" "--scroll 0" \
  --update-check true \
  "playerctl metadata --format '{{title}}'" 2>/dev/null

wait
