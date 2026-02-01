#!/bin/bash

options="󰌾 Lock\n󰤄 Suspend\n󰍃 Logout\n󰒲 Hibernate\n󰐥 Shutdown\n󰜉 Reboot"

chosen=$(echo -e "$options" | rofi -dmenu \
    -i \
    -p "Power Menu" \
    -theme-str 'window { width: 300px; height: 400px; }')

confirm() {
    echo -e "No\nYes" | rofi -dmenu -i -p "Are you sure?"
}

case "$chosen" in
    "󰐥 Shutdown")
        [[ "$(confirm)" == "Yes" ]] && systemctl poweroff
        ;;
    "󰜉 Reboot")
        [[ "$(confirm)" == "Yes" ]] && systemctl reboot
        ;;
    "󰌾 Lock")
        hyprlock
        ;;
    "󰤄 Suspend")
        [[ "$(confirm)" == "Yes" ]] && systemctl suspend
        ;;
    "󰍃 Logout")
        [[ "$(confirm)" == "Yes" ]] && hyprctl dispatch exit
        ;;
    "󰒲 Hibernate")
        [[ "$(confirm)" == "Yes" ]] && systemctl hibernate
        ;;
esac
