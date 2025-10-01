#!/bin/bash

# Get current profile
current=$(powerprofilesctl get)

# Determine next profile
case "$current" in
    "performance")
        next="power-saver"
        ;;
    "balanced")
        next="performance"
        ;;
    "power-saver")
        next="balanced"
        ;;
    *)
        next="balanced"
        ;;
esac

# Set the next profile
powerprofilesctl set "$next"

# Optional: notify user
#notify-send "Power Profile" "Switched to $next"
