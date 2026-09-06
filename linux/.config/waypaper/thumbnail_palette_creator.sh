#!/bin/bash

WALLPAPER="$1"
CACHE="$HOME/.cache/wallpaper"
THUMB="$CACHE/current-thumb.jpg"

mkdir -p "$CACHE"

# Generate thumbnail asynchronously
(
  TEMP="$CACHE/current-thumb.tmp.jpg"

  ffmpeg -y -i "$WALLPAPER" \
    -vf "scale=800:-1" \
    -q:v 5 \
    "$TEMP" 2>/dev/null

  mv "$TEMP" "$THUMB"
) &

# Continue immediately with Matugen
matugen image "$WALLPAPER" -m dark --source-color-index 0

dunstctl reload
