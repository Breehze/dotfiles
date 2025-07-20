#!/bin/bash
vol=$(pactl get-sink-volume "$(pactl get-default-sink)" \
  | grep -oP '\d+(?=%)' | head -n1 | tr -d -c '0-9')

printf "%.1f\n" "$vol"

