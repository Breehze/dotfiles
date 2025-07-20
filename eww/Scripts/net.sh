#!/bin/bash

INTERVAL=5   # seconds between checks

get_status() {
    # check if we can reach the Internet
    if ip route get 1.1.1.1 >/dev/null 2>&1; then
        # get the interface being used for default route
        iface=$(ip route get 1.1.1.1 | awk '{for(i=1;i<=NF;i++) if ($i=="dev") print $(i+1); exit}')
        
        # check if it's Wi-Fi or Ethernet
        if iw dev 2>/dev/null | grep -q "^Interface $iface"; then
            echo "󰤨  $iface"
        else
            echo "󰈁 $iface"
        fi
    else
        echo "󰤭 "
    fi
}

while true; do
    status=$(get_status)
    echo "$status"
    sleep "$INTERVAL"
done

