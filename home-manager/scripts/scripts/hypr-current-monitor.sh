#!/usr/bin/env bash

# Script for Hyprland to find and output the current monitor

# Run your command and store the output in a variable
output=$(hyprctl monitors)

# Use grep to find the line number with "focused: yes"
focused_line=$(echo "$output" | grep -n "focused: yes" | sed 's/:.*//')

# Get the monitor name line
monitor_line=$(echo "$output" | head -n $focused_line | tac | grep -m 1 "Monitor")

# Get the name of the monitor
monitor_name=$(echo "$monitor_line" | sed 's/.*Monitor \(.*\) (ID.*/\1/')

# Print the monitor name
echo "$monitor_name"
