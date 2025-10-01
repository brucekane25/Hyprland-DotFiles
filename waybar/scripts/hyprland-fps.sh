#!/bin/bash

# Path to a file to store the state of the overlay
STATE_FILE="/tmp/hyprland_fps_overlay.state"

# Check if the overlay is currently enabled
if [ -f "$STATE_FILE" ]; then
    # If the state file exists, the overlay is on. Turn it off.
    hyprctl keyword debug:overlay false
    rm "$STATE_FILE"
    echo "{\"text\":\"FPS\", \"tooltip\":\"FPS Overlay: Disabled\"}"
else
    # If the state file does not exist, the overlay is off. Turn it on.
    hyprctl keyword debug:overlay true
    touch "$STATE_FILE"
    echo "{\"text\":\"FPS\", \"tooltip\":\"FPS Overlay: Enabled\", \"class\":\"enabled\"}"
fi
