#! /usr/bin/env bash

# A script to shorten the Nix Rebuild command.
# nixremote.sh will build a config locally and install to a remote machine.
#
# Must be run from the Nix repo directory's top folder and include a flake.

# Input needed from user:
# $1 - Get the name of the host configuration to be used (e.g. hosts/silvana)
# $2 - Get the kind of rebuild you'd like to do (e.g. switch, boot, etc.)
# $3 - Get the [hostname@ip-address] you're sending it to



sudo nixos-rebuild $2 --flake "./#$1" --target-host $3 --use-remote-sudo
