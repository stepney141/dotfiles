#!/bin/bash
# rofi_system_dmenu.sh / JennyM 2017 malkalech.com

list=(
  ##  Lock  ##
  "Lock Screen"  "i3exit lock"
  "Logout"       "i3exit logout"
  "Switch User"  "i3exit switch_user"
  ##  Power ##
  "Reboot"       "systemctl reboot"
  "Suspend"      "systemctl suspend"
  "Hibernate"    "systemctl hibernate"
  "Shutdown"     "systemctl shutdown"
  "Hybrid Sleep" "systemctl hybrid-sleep" # suspend-to-both
)

if selected="$(for (( i=0; i<=$((${#list[@]}/2-1)); i++ )) { echo "${list[($i+1)*2-2]}"; } | rofi -dmenu -i -format i)"; then
  [[ "$selected" -ge 0 ]] && eval "${list[($selected+1)*2-1]}"
fi

