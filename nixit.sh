#! /usr/bin/env bash

# A script to copy configuration.nix from its user-owned repo to /etc/nixos and run nixos-rebuild with it.
# Must be run from the nixos repo directory's top folder.

# Get input from user
# $1 - Get the name of the host configuration to be used (e.g. hosts/silvana)
# $2 - Get the kind of rebuild you'd like to do (e.g. switch, boot, etc.)

sudo cp ./hosts/$1/configuration.nix /etc/nixos/
sudo nixos-rebuild $2