#!/usr/bin/env bash

# A script for Rofi to set the desired wallpaper directory.

# File paths
wallpaper_master_dir=/home/arik/Pictures/wallpapers/
cache_dir=/home/arik/.cache/personal/

# List all directories in wallpaper folder
wall_dirs=$(ls -d ${wallpaper_master_dir}*/ | sed "s|$wallpaper_master_dir||" | sed 's|/||')

# Run rofi to pick wallpaper directory
rofi_picker=$(echo "$wall_dirs" | rofi -dmenu)

# Write wallpaper directory to cache file
echo "$rofi_picker" > ${cache_dir}wall-dir-cache.txt