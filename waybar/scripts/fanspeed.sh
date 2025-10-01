#!/bin/bash

# Parse CPU fan values
cpu_percent=$(nbfc status | awk '/CPU fan/{f=1} f && /Current Fan Speed/{print $5; exit}')
cpu_steps=$(nbfc status | awk '/CPU fan/{f=1} f && /Fan Speed Steps/{print $5; exit}')
cpu_rpm=$(awk -v p="$cpu_percent" -v s="$cpu_steps" 'BEGIN{printf "%.0f", p/100*s}')

# Parse GPU fan values
gpu_percent=$(nbfc status | awk '/GPU fan/{f=1} f && /Current Fan Speed/{print $5; exit}')
gpu_steps=$(nbfc status | awk '/GPU fan/{f=1} f && /Fan Speed Steps/{print $5; exit}')
gpu_rpm=$(awk -v p="$gpu_percent" -v s="$gpu_steps" 'BEGIN{printf "%.0f", p/100*s}')

# Temperature
temp=$(nbfc status | awk '/Temperature/{print $3; exit}')

# Output JSON for Waybar (properly escaped quotes)
echo "{\"text\": \" ${cpu_rpm} RPM | ${gpu_rpm} RPM\", \"tooltip\": \"Temp: ${temp}°C\", \"class\": \"fanspeed\"}"
