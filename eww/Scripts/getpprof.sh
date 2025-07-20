#!/bin/bash

if ! command -v powerprofilesctl >/dev/null 2>&1; then
    echo "⚠️ powerprofilesctl not found. Install power-profiles-daemon."
    exit 1
fi

PROFILE=$(powerprofilesctl get)

case "$PROFILE" in
    performance)
        echo " "
        ;;
    balanced)
        echo " "
        ;;
    power-saver)
        echo " "
        ;;
    *)
        echo "❓ Unknown mode: $PROFILE"
        ;;
esac

