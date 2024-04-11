#!/bin/bash

list=(
  "eDP"           "xrandr --output eDP --primary --auto --rotate normal --output HDMI-A-0 --off --output DisplayPort-0 --off --output DisplayPort-1 --off"
  "HDMI"          "xrandr --output eDP --primary --auto --rotate normal --output HDMI-A-0 --auto --above eDP --output DisplayPort-0 --off --output DisplayPort-1 --off"
  "Type-C No1"    "xrandr --output eDP --primary --auto --rotate normal --output DisplayPort-0 --auto --above eDP --output HDMI-A-0 --off --output DisplayPort-1 --off"
  "Type-C No2"    "xrandr --output eDP --primary --auto --rotate normal --output DisplayPort-1 --auto --above eDP --output HDMI-A-0 --off --output DisplayPort-0 --off "
)

if selected="$(for (( i=0; i<=$((${#list[@]}/2-1)); i++ )) { echo "${list[($i+1)*2-2]}"; } | rofi -dmenu -i -format i)"; then
  [[ "$selected" -ge 0 ]] && eval "${list[($selected+1)*2-1]}"
fi

