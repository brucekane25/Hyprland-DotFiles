#!/bin/bash

CONF="$HOME/.config/hypr/hyprland.conf"

LINE_DISABLE="monitor=eDP-1,disable"
LINE_AUTO="monitor=eDP-1,auto,auto,1.2"

# Check if disable line is commented
disable_commented=$(grep -E "^#\s*$LINE_DISABLE" "$CONF")

if [ -n "$disable_commented" ]; then
    # Disable eDP → uncomment disable line, comment auto line
    sed -i "s|^#\s*\($LINE_DISABLE\)|\1|" "$CONF"
    sed -i "s|^\($LINE_AUTO\)|#\1|" "$CONF"
    echo "eDP-1 disabled"
else
    # Enable eDP → comment disable line, uncomment auto line
    sed -i "s|^\($LINE_DISABLE\)|#\1|" "$CONF"
    sed -i "s|^#\s*\($LINE_AUTO\)|\1|" "$CONF"
    echo "eDP-1 enabled"
fi

# Force update timestamp to trigger Hyprland reload
touch "$CONF"

# Optional: reload Hyprland immediately
hyprctl reload
