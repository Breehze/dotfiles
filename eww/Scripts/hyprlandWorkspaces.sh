#!/bin/bash

workspaces() {
    # (function code from before)
    command -v hyprctl >/dev/null || { echo "hyprctl not found."; return 1; }
    command -v jq >/dev/null || { echo "jq not found."; return 1; }

    declare -A ws_icons
    ws_icons[1]="I"
    ws_icons[2]="II"
    ws_icons[3]="III"
    ws_icons[4]="IV"
    ws_icons[5]="V"
    ws_icons[6]="VI"
    ws_icons[7]="VII"
    ws_icons[8]="VIII"
    ws_icons[9]="IX"
    ws_icons[10]="X"

    local default_icon="❓"

    local focused_ws
    focused_ws=$(hyprctl activeworkspace -j | jq -r '.id')

    local workspace_ids
    workspace_ids=$(hyprctl workspaces -j | jq -r 'sort_by(.id) | .[].id')

    local output=""

    for ws_id in $workspace_ids; do
        local icon="${ws_icons[$ws_id]:-$default_icon}"

        if [[ "$ws_id" == "$focused_ws" ]]; then
            icon="[$icon]"
        fi

        output+="$icon "
    done

    echo "$output"
}

# Infinite loop calling the function every 5 seconds
while true; do
    workspaces
    sleep 0.1
done

