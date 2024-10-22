#! /usr/bin/env bash

# A script to install configuration.nix from the current
# Must be run from the nixos repo directory's top folder.

# Get input from user
# $1 - Get the name of the host configuration to be used (e.g. hosts/silvana)
# $2 - Get the kind of rebuild you'd like to do (e.g. switch, boot, etc.)
# $3 - Get the [hostname@ip-address] you're sending it to



sudo nixos-rebuild $2 --flake "/home/arik/Documents/repos/nixos#$1" --target-host $3 --use-remote-sudo
