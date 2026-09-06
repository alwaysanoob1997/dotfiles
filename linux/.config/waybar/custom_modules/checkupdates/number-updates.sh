#!/usr/bin/env bash

UPDATE_FILE="$HOME/.cache/waybar-updates"

mkdir -p "$(dirname "$UPDATE_FILE")"

updates=$(checkupdates)

printf '%s\n' "$updates" >"$UPDATE_FILE"

printf " %s" "$(printf '%s\n' "$updates" | grep -c .)"
