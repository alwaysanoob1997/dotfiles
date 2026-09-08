#!/usr/bin/env bash

if [ "$ROFI_RETV" -eq 0 ]; then
  printf '%s\n' \
    "󰐥 Shutdown" \
    "󰜉 Reboot" \
    "󰌾 Lock" \
    "󰍃 Logout"
  exit 0
fi

case "$1" in
"󰌾 Lock")
  hyprlock >/dev/null 2>&1 &
  ;;

"󰍃 Logout")
  hyprctl dispatch 'hl.dsp.exit()'
  ;;

"󰜉 Reboot")
  systemctl reboot >/dev/null 2>&1 &
  ;;

"󰐥 Shutdown")
  systemctl poweroff >/dev/null 2>&1 &
  ;;
esac

exit 0
