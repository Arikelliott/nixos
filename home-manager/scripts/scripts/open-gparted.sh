#!/usr/bin/env bash -> In NixOS it seems we create scripts with this, instead of the usual /bin/bash

# Credit to a random user off Reddit who shared this (account deleted so I don't have his username)

# Allow access to the X server for the current user
xhost +SI:localuser:root
# Run gparted
gparted &
# Wait for gparted to finish
wait $!
# Revoke access to the X server
xhost -SI:localuser:root 