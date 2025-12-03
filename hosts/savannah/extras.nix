{ pkgs, ... }:

{

	# -------- DESKTOP ENVIRONMENT --------
	imports = [
		../../modules/sddm-astronaut.nix # Import SDDM with Astronaut theme
		../../modules/sleek-grub-theme.nix # Import GRUB theme
		../../modules/hyprland.nix # Enable Hyprland WM
	];

	# - Install Thunar -
	programs.thunar.enable = true;
	programs.thunar.plugins = with pkgs.xfce; [ thunar-archive-plugin thunar-volman thunar-media-tags-plugin ];

	# -------- GAMES --------


	# -------- SYNCTHING --------
	services.syncthing = {
		enable = true;
		group = "users";
		user = "arik";
		dataDir = "/home/arik/Sync/default";
		configDir = "/home/arik/.config/syncthing";
	};

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

	# - Enable Bluetooth -
	hardware.bluetooth.enable = true; # enables support for Bluetooth
	hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

	# - Printing -
	services.printing.enable = true; # Enable CUPS to print documents.
	services.printing.drivers = with pkgs; [ # Printer packages to include:
		gutenprint
		hplip
		splix
	];
	services.avahi = {
		enable = true;
		nssmdns4 = true;
		openFirewall = true;
	};




	# -------- PACKAGES --------
	environment.systemPackages = with pkgs; [

		# Install syncthing
		syncthing

		# Install bluetooth manager GUI
		blueman

		# Install brightness controls
		brightnessctl

		kitty # Terminal

	];

}
