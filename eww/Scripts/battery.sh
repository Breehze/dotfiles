#!/bin/bash

# Poll every N seconds
INTERVAL=10  # seconds

# Choose icon based on percentage & charging
get_icon() {
  local perc=$1
  local status=$2
  if [ "$status" = "charging" ]; then
    echo "󰂄" 
  elif [ "$perc" -ge 95 ]; then
    echo "󰁹"
  elif [ "$perc" -ge 80 ]; then
    echo "󰂂"
  elif [ "$perc" -ge 60 ]; then
    echo "󰂀"
  elif [ "$perc" -ge 40 ]; then
    echo "󰁽"
  elif [ "$perc" -ge 20 ]; then
    echo "󰁻"
  else
    echo "󰁺"
  fi
}

get_battery() {
  battery_path=$(upower -e | grep BAT | head -n1)
  if [ -z "$battery_path" ]; then
    echo "Battery not found"
    exit 1
  fi

  perc=$(upower -i "$battery_path" | awk '/percentage:/ {print $2}' | tr -d '%')
  status=$(upower -i "$battery_path" | awk '/state:/ {print $2}')
  icon=$(get_icon "$perc" "$status")
  echo "$icon ${perc}%"
}

# Loop forever & update eww
while true; do
    get_battery
    sleep "$INTERVAL"
done

