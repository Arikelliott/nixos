#!/usr/bin/env bash

# Wallpaper directory
wallpaper_master_dir=/home/arik/Pictures/wallpapers/
cache_dir=/home/arik/.cache/personal/wall-dir-cache.txt
cached_dir_name=$(cat $cache_dir)
wallpaper_dir=${wallpaper_master_dir}${cached_dir_name}/

cat $cache_dir

echo "$wallpaper_dir"

# Selects a random wallpaper file
rand_wallpaper=$(ls "$wallpaper_dir" | sort --random-sort | head -1)

echo "$wallpaper_dir$rand_wallpaper"

# Get file output
wallname=$(echo "$wallpaper_dir$rand_wallpaper")

sh /home/arik/dotfiles/scripts/swww-wall.sh $wallname



