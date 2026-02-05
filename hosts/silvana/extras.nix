{ pkgs, ... }:

{

	# -------- DESKTOP ENVIRONMENT --------
	imports = [
		../../modules/sddm-astronaut.nix # Import SDDM with Astronaut theme
		../../modules/sleek-grub-theme.nix # Import GRUB theme
		../../modules/hyprland.nix # Enable Hyprland WM
		../../modules/fonts.nix # Add default fonts
		../../modules/neovim.nix # Enable Neovim
		../../modules/mpd.nix # Enable Music Player Daemon
		./vfio-config.nix # VFIO stuff
	];

	# - GNOME -
	services.xserver.enable = true;
	services.desktopManager.gnome.enable = true;
	# Disable certain preinstalled software
	services.gnome.games.enable = false;
	# services.gnome.core-developer-tools.enable = false;
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
	programs.steam = {
		enable = true;
		remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
		dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
	};

	# -------- UTILITIES --------
	services.gvfs.enable = true; # Mount, trash, and other functionalities
	services.tumbler.enable = true; # Thumbnail support for images

	# - Docker -
	users.extraGroups.docker.members = [ "arik" ]; # List user accounts with Docker access.
	virtualisation.docker.enable = true; # Enable docker.

	# - Ollama - (NEEDS DOCKER)
	virtualisation = {
		oci-containers.backend = "docker";
		oci-containers.containers = { # List all containers and options to run.
			ollama = { # Run Ollama container.
				image = "ollama/ollama:rocm";
				volumes = [
					"ollama:/root/.ollama"
				];
				ports = [
					"11434:11434"
				];
				extraOptions = [
					"--device=/dev/kfd"
					"--device=/dev/dri"
				];
			};
			open-webui = { # Run WebUI for Ollama.
				hostname = "open-webui";
				image = "ghcr.io/open-webui/open-webui:latest";
				volumes = [
					"open-webui:/app/backend/data"
				];
				ports = [
					"3000:8080"
				];
				extraOptions = [
					"--add-host=host.docker.internal:host-gateway"
				];
			};
		};
	};

	# - Tailscale -
	services.tailscale = {
		enable = true;
		useRoutingFeatures = "both";
	};

	# - Jellyfin -
	services.jellyfin = {
		enable = true;
		openFirewall = true;
		user = "arik";
	};

	# - Immich -
	services.immich = {
		enable = true;
		port = 2283;
		accelerationDevices = null;
		openFirewall = true;
		host = "0.0.0.0";
		# mediaLocation = "/home/arik/Pictures/immich";
	};
		

	# - k3b CD Burner -
	security.wrappers = {
		cdrdao = {
			setuid = true;
			owner = "root";
			group = "cdrom";
			permissions = "u+wrx,g+x";
			source = "${pkgs.cdrdao}/bin/cdrdao";
		};
		cdrecord = {
			setuid = true;
			owner = "root";
			group = "cdrom";
			permissions = "u+wrx,g+x";
			source = "${pkgs.cdrtools}/bin/cdrecord";
		};
	};

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

	fileSystems = {
		"/home" = { # Home partition - nvme1n1p1
			device = "/dev/disk/by-uuid/bdee067f-4213-4889-b0c8-f69d4f5f3e7f";
			fsType = "ext4";
			options = ["defaults"]; # Mount options (optional). NOTE: Use square brackets around string.
		};
		"/home/arik/mount/adrive" = { # Mount 1TB HDD drive.
			device = "/dev/disk/by-uuid/aefc0e6c-76c9-462d-b154-861aa982bc4e";
			fsType = "ext4";
			options = ["defaults"];
		};
		"/home/arik/mount/bdrive" = { # Mount 8TB HDD RAID drives.
			device = "/dev/disk/by-uuid/8f196129-06eb-4971-aa9f-c814b242353d";
			fsType = "ext4";
			options = ["defaults"];
		};
		"/home/arik/mount/cdrive" = { # Mount 1TB SSD drive.
		device = "/dev/disk/by-uuid/a030f9c6-c4e4-49e9-a18c-4769e3f3e8ac";
		fsType = "ext4";
		options = ["defaults"];
		};
		# "/home/arik/mount/nas" = { # Mount NAS storage.
		# 	device = "172.234.215.187:/home/arik/mount";
		# 	fsType = "nfs";
		# 	options = [ "x-systemd.automount" "noauto" ]; # Enable lazy mounting. Only mounts when first accessed instead of at boot.
		# };
		# "/home/arik/mount/ddrive" = { # Windows SSD - nvme0n1p4
		# 	device = "/dev/disk/by-uuid/247a2b30-2819-4744-b05a-c68cbc94f431";
		# 	fsType = "ext4";
		# 	options = ["defaults"];
		# };

	};

	# Enable Software RAID (DO NOT REMOVE!!!)
	boot.swraid = {
		enable = true;
		mdadmConf = "MAILADDR nobody@nowhere";
	};

	# - Enable Swap File -
	swapDevices = [ {
		device = "/var/lib/swapfile";
		size = 32*1024;
	} ];

	# - Graphics Support -
	hardware.amdgpu.opencl.enable = true; # Enable OpenCL support

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

	# - RGB -
	# ckb-next
	# hardware.ckb-next.enable = true; # Enable ckb-next daemon.
	# OpenRGB
	services.hardware.openrgb.enable = true; # Enable OpenRGB daemon and other options.
	# services.hardware.openrgb.motherboard = "amd"; # Ensure it's using AMD modules (should be automatically though).

	# - OpenTabletDriver -
	hardware.opentabletdriver.enable = true; # Enable OpenTabletDriver.

	# - APC UPS Daemon -
	services.apcupsd.enable = true;




	# -------- PACKAGES --------
	environment.systemPackages = (with pkgs; [

		# Install syncthing
		syncthing

		# Install bluetooth manager GUI
		blueman

		kitty # My default terminal.
		cool-retro-term # An overly-fancy terminal emulator.

		firefox
		keepassxc # KeePassXC password manager.
		kpcli # KeePass CLI utility.

		# GPU utilities
		radeontop # AMDGPU utilization tool.
		amdgpu_top # AMD GPU CLI monitoring tool.
		lact # AMDGPU GUI software. *****
		vulkan-tools # Utils for Vulkan

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

		# CREATIVE TOOLS
		audacity # Audio editing suite.
		lmms # Linux music production software.
		# openutau # Open-source UTAU alternative.
		# libsForQt5.kdenlive # KDE's video editor.
		# ft2-clone # Fasttracker II clone.
		# furnace # Chiptune tracker.
		# goattracker # Commodore 64 tracker.
		# klystrack # C64/Amiga/NES tracker.
		blender-hip # HIP/ROCm version of Blender?
		# blender # 3D Modeling software.
		gimp3 # Raster editing program.
		inkscape # Vector illustration program.
		krita # Photo editing and painting program.
		# calf # Open source audio plugins for musicians.
		# easyeffects # PipeWire audio effects.
		# davinci-resolve # Video editing program.
		# davinci-resolve-studio # Paid version of DaVinci. Doesn't include H264/265 support, convert with ffmpeg. https://wiki.nixos.org/wiki/DaVinci_Resolve#Cannot_import_video_file
		ffmpeg # Audio and video tool.
		ffmpegthumbnailer # Generates thumbnails of images and video for file browsers, etc.
		# helvum # GTK Patchbay for PipeWire.
		mpv # Media player.
		rmpc # TUI Music Player
		# obs-studio # Video recording software.
		# strawberry # Music player app.
		# cura # Slicer for 3D printing.
		freecad-wayland # Open-source CAD software.
		# openscad # Programmatic CAD software.
		# love # Love2D, a 2D game engine that used Lua scripting.
		libresprite # Pixel art software, FOSS fork of aseprite.
		blockbench # 3D modeling software (for Minecraft mainly)

		# SOCIAL
		vesktop # Modded discord desktop client.

		# GAMES
		prismlauncher # Minecraft instance manager.
		mangohud # Game stat overlay software.
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
		kdePackages.k3b # for k3b CD Burner.
		jellyfin
		jellyfin-web
		jellyfin-ffmpeg


		# --- GNOME EXTENSIONS ---

	])

	++

	(with pkgs.unstable; [

		yt-dlp # Youtube/video downloader, youtube-dl fork.

	]);

}
