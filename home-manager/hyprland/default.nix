{ config, inputs, pkgs, lib, ... }:

{

	wayland.windowManager.hyprland = {
		enable = true; # Configure Hyprland with home-manager
		systemd.enable = true; # Enable systemd service I guess?
		xwayland.enable = true; # Enable XWayland
		settings = {
			"$mainMod" = "SUPER";
		};
	};

	imports = [
		# ./configs/customvars.nix # Empty currently
		./configs/displays/${hostname}.nix # Figure out how to make this customizable
		./configs/exec.nix # Execute scripts and programs at startup
		./configs/env.nix # Set environment variables
		./configs/devices.nix
		./configs/variables.nix # Set Hyprland's "variables" (there's way too many things called variables)
		# ./configs/workspaces.nix # Merge into display configs
		./configs/keybinds.nix
		# ./configs/theme.nix # Split variables off into a separate theme file
	];



}