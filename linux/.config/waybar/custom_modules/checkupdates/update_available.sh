#!/usr/bin/env bash

UPDATE_FILE="$HOME/.cache/waybar-updates"
CHECK_SCRIPT="$HOME/.config/waybar/custom_modules/checkupdates/number-updates.sh"

"$CHECK_SCRIPT"

count=$(grep -c . "$UPDATE_FILE")

if [[ "$count" -eq 0 ]]; then
  notify-send "System is up to date"
  exit 0
fi

while true; do
  choice=$(
    rofi -dmenu \
      -p "System Updates" \
      -mesg "$count packages available" <<EOF
Review
Update all
Cancel
EOF
  )

  case "$choice" in
  Review)
    ghostty -e nvim -R "$UPDATE_FILE"
    ;;

  "Update all")
    ghostty -e sudo pacman -Syu

    # Re-run check-updates.sh and refresh Waybar.
    pkill -RTMIN+8 waybar
    break
    ;;

  Cancel | "")
    break
    ;;
  esac
done
