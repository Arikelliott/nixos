{ pkgs, ... }:

{

	# -------- DESKTOP ENVIRONMENT --------
	imports = [
		../../modules/sddm-astronaut.nix # Import SDDM with Astronaut theme
		../../modules/sleek-grub-theme.nix # Import GRUB theme
		../../modules/hyprland.nix # Enable Hyprland WM
		../../modules/fonts.nix # Add default fonts
		../../modules/neovim.nix # Enable Neovim
	];

	# - GNOME -
	services.xserver.enable = true;
	services.desktopManager.gnome.enable = true;
	# Disable certain preinstalled software
	services.gnome.games.enable = false;
	services.gnome.gcr-ssh-agent.enable = false;

	# - Cosmic -
 	services.desktopManager.cosmic = {
 		enable = true;
 		xwayland.enable	= true;
 	};
 	services.system76-scheduler.enable = true;


	# - Install Thunar -
	programs.thunar.enable = true;
	programs.thunar.plugins = with pkgs.xfce; [ thunar-archive-plugin thunar-volman thunar-media-tags-plugin ];

	# -------- GAMES --------

	# - STEAM -
	# programs.steam = {
	# 	enable = true;
	# 	remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
	# 	dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
	# };

	# -------- UTILITIES --------
	services.gvfs.enable = true; # Mount, trash, and other functionalities
	services.tumbler.enable = true; # Thumbnail support for images

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

	# - Touchpad Support -
	services.libinput.enable = true; # Enable touchpad support (enabled default in most desktopManager).

	# - Audio -
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		# If you want to use JACK applications, uncomment this
		#jack.enable = true;
	};

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
	environment.systemPackages = (with pkgs; [

		# Install syncthing
		syncthing

		# Install bluetooth manager GUI
		blueman

		# Install brightness controls
		brightnessctl

		kitty # My default terminal.
		cool-retro-term # An overly-fancy terminal emulator.

		firefox
		keepassxc # KeePassXC password manager.
		kpcli # KeePass CLI utility.

		# Fun terminal utils
		feh # A light-weight image viewer.
		figlet # Generate ASCII word art.
		gallery-dl # Download images galleries from image hosting sites.
		ytfzf # Find, download, and watch Youtube videos from the terminal.
		glow # Utility for rendering Markdown in the terminal.
		neofetch # System info fetcher and snowflake displayer.
		spotdl # Spotify music downloader.
		id3v2 # Music metadata viewing and editing tool.

		# GUI Desktop Utils
		baobab # Like WinDirStat. GTK graphical file usage viewer.
		font-manager # Font viewing app.
		gucharmap # GNOME character map viewer.
		gnome-calculator # GNOME's default calculator app.
		galculator # GTK Calculator.
		kdiff3 # Diff and merge up to 3 files or directories at once.
		meld # GTK diff and merge tool.
		remmina # Remote desktop client.

		# GUI Productivity Software
		chromium
		obsidian # Personal note-taking and thought organizing app.
		# calibre # E-reader
	    # evince # All-purpose document viewer (PDFs, etc.).
	    zathura # another all purpose doc viewer. check Nix options for it.
		hugo # Static website generator.
		pandoc # General filetype converter (eg. md to html).
		libreoffice # LibreOffice
		teams-for-linux # Microsoft Teams
		zoom-us # Video call software
		# hydrus # Image tagging and organizing software for desktop

		# TEXT EDITORS
		vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
		zed-editor # New IDE trying to replace vscodium.
		xfce.mousepad # basic text editor from XFCE.

		# SOCIAL
		vesktop # Modded discord desktop client.

		# GAMES
		prismlauncher # Minecraft instance manager.
		# mangohud # Game stat overlay software.
		# mindustry-wayland # Mindustry game
		# heroic # Heroic game launcher
		# itch # itch.io launcher

		# MUSIC
		spotify


		# UNSORTED
		cdrtools # CD, DVD, and Blu-Ray burning tools.
		libisoburn # CD burning tool.
		# mtools # Utilities to access MS-DOS disks.
		# ntfs3g # NTFS filesystem driver.
		usbutils # Tools for working with USB devices, such as lsusb.
		smartmontools # Hard drive health monitoring tools.
		exfatprogs # exFAT filesystem utilities.
		foomatic-db-engine # A big set of utilities for printing.
		ghostscript # Postscript interpreter for PDFs and stuff.
		# jdk # Java 19, main release of Java on NixOS. May include other Java versions too?
		gvfs # Virtual Filesystem support library
		easytag # GUI ID3 song metadata viewer and editor.


		# --- GNOME EXTENSIONS ---

	])

	++

	(with pkgs.unstable; [

		yt-dlp # Youtube/video downloader, youtube-dl fork.

	]);

}
