#!/bin/bash

DEFAULT_SINK=$(pactl get-default-sink)

if [[ "$DEFAULT_SINK" == *"bluez"* ]]; then
    echo ""
elif [[ "$DEFAULT_SINK" == *"hdmi"* ]]; then
    echo "   HDMI"
elif [[ "$DEFAULT_SINK" == *"analog"* ]]; then
    echo ""
else
    echo ""
fi
