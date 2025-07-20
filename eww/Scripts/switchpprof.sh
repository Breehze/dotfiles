#!/bin/bash

profiles=(performance balanced power-saver)

current=$(powerprofilesctl get)

for i in "${!profiles[@]}"; do
    if [[ "${profiles[$i]}" == "$current" ]]; then
        current_index=$i
        break
    fi
done

next_index=$(( (current_index + 1) % ${#profiles[@]} ))
next_profile="${profiles[$next_index]}"

powerprofilesctl set "$next_profile"
