#!/bin/bash

# Do we have gum installed? 

if ! command -v gum &> /dev/null; then
    echo "A simple script to choose metrics collected on a server"
    echo "Please install gum to use this script"
    echo "See https://github.com/charmbracelet/gum for details"
    exit 1
fi

metrics=(
    "CPU model"
    "RAM size"
    "Storage size"
    "OS"
    "Uptime"
    "CPUs load"
    "Load Average"
    "Free Memory"
    "Swap size"
    "Swap Usage"
    "Sensors data"
)

file="./chosen_metrics.txt"

# Use gum to create a UI for selection
chosen_metrics=$(gum choose --no-limit --header "Select which server metrics to collect:" --cursor-prefix "(_) " --selected-prefix "(*) " --unselected-prefix "( ) " "${metrics[@]}")

# Check if the user made a selection
if [[ -z "$chosen_metrics" ]]; then
    echo "No metrics selected"
    exit 1
fi

echo The amount of chosen items: "$chosen_metrics" | wc -l

# Output the selected parameters
echo "Following metrics were selected:"
echo "$chosen_metrics"
echo "$chosen_metrics" > $file
echo "Selected metrics saved to \"$(realpath $file)\" file"
