#! /usr/bin/env bash

# A script to shorten the Nix Rebuild command.
#
# Must be run from the Nix repo directory's top folder and include a flake.

# Input needed from user:
# $1 - Get the name of the host configuration to be used (e.g. hosts/silvana)
# $2 - Get the kind of rebuild you'd like to do (e.g. switch, boot, etc.)

sudo nixos-rebuild $2 --flake "./#$1"
