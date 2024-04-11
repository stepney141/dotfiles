#!/bin/bash

list=(
  "Mirroring eDP" "xrandr --output eDP --primary --auto --rotate normal"
  "HDMI"          "xrandr --output eDP --primary --auto --rotate normal --output HDMI-A-0 --auto --above eDP"
  "Type-C No1"    "xrandr --output eDP --primary --auto --rotate normal --output DisplayPort-0 --auto --above eDP"
  "Type-C No2"    "xrandr --output eDP --primary --auto --rotate normal --output DisplayPort-1 --auto --above eDP"
)

if selected="$(for (( i=0; i<=$((${#list[@]}/2-1)); i++ )) { echo "${list[($i+1)*2-2]}"; } | rofi -dmenu -i -format i)"; then
  [[ "$selected" -ge 0 ]] && eval "${list[($selected+1)*2-1]}"
fi

