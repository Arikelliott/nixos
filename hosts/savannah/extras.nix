{ pkgs, ... }:

{

	# -------- SYNCTHING --------
	services.syncthing = {
		enable = true;
		group = "users";
		user = "arik";
		dataDir = "/home/arik/Sync/default";
		configDir = "/home/arik/.config/syncthing";
	};
	environment.systemPackages = with pkgs; [
		syncthing
	];
	# Syncthing ports: 8384 for remote access to GUI
	# 22000 TCP and/or UDP for sync traffic
	# 21027/UDP for discovery
	# source: https://docs.syncthing.net/users/firewall.html
	networking.firewall.allowedTCPPorts = [ 8384 22000 ];
	networking.firewall.allowedUDPPorts = [ 22000 21027 ];

	# -------- HARDWARE --------
	# - Setup Bootloader -
	boot.loader = {
		efi = {
			canTouchEfiVariables = true; # Whether the installation process is allowed to modify EFI boot variables.
		};
		grub = { # Enable GRUB as bootloader.
			enable = true;
			efiSupport = true;
			device = "nodev";
			useOSProber = true;
		};
	};
	# - Enable Swap File -
	swapDevices = [ {
		device = "/var/lib/swapfile";
		size = 8*1024;
	} ];

}
