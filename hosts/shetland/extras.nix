{ pkgs, ... }:

{

	# -------- DESKTOP ENVIRONMENT --------
	imports = [
		../../modules/sleek-grub-theme.nix # Import GRUB theme
		../../modules/neovim.nix # Enable Neovim
	];

	# -------- UTILITIES --------
	services.gvfs.enable = true; # Mount, trash, and other functionalities
	services.tumbler.enable = true; # Thumbnail support for images

	# - Matrix server (Continuwuity) -
	services.matrix-continuwuity = {
		enable = true;
		settings = {
			global = {
				server_name = "matrix.raindropz.net";
				address = "0.0.0.0";
				# database_path = "/var/lib/conduwuit";
				new_user_displayname_suffix = "";
			};
		};
	};


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

	# -------- PACKAGES --------
	environment.systemPackages = (with pkgs; [

		gallery-dl # Download images galleries from image hosting sites.
		glow # Utility for rendering Markdown in the terminal.
		neofetch # System info fetcher and snowflake displayer.
		spotdl # Spotify music downloader.
		id3v2 # Music metadata viewing and editing tool.
		pandoc # General filetype converter (eg. md to html).

		# TEXT EDITORS
		vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.

		# UNSORTED
		cdrtools # CD, DVD, and Blu-Ray burning tools.
		libisoburn # CD burning tool.
		usbutils # Tools for working with USB devices, such as lsusb.
		smartmontools # Hard drive health monitoring tools.
		exfatprogs # exFAT filesystem utilities.
		gvfs # Virtual Filesystem support library

	])

	++

	(with pkgs.unstable; [

		yt-dlp # Youtube/video downloader, youtube-dl fork.

	]);

}
