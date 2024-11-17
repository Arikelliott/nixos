#!/usr/bin/env bash

# Get current monitor name
current_monitor=$(sh /home/arik/dotfiles/scripts/hypr-current-monitor.sh)

# Get current monitor info
# monitor_info=$(hyprctl monitors | grep -m 1 -A 1 $current_monitor | tail -1 | sed 's/^[[:space:]]*//g')

# Get current monitor x and y coordinates
monitor_coords=$(hyprctl monitors | grep -m 1 -A 1 $current_monitor | tail -1 | sed 's/.*at \(.*\)/\1/')

# Convert to separate x and y coordinate values
xcoord=$(echo "$monitor_coords" | sed 's/\(.*\)x.*/\1/')
ycoord=$(echo "$monitor_coords" | sed 's/.*x\(.*\)/\1/')

# Get hyprctl cursorpos values and separate into x and y
cursorpos=$(hyprctl cursorpos)
xpos=$(echo "$cursorpos" | sed 's/\(.*\),.*/\1/')
ypos=$(echo "$cursorpos" | sed 's/.*, \(.*\)/\1/')

# Subtract monitor x/y coordinates from cursorpos x/y coordinates
xnewpos=$(($xpos - $xcoord))
ynewpos=$(($ypos - $ycoord))

# Recombine and reformat
echo "$xnewpos, $ynewpos"