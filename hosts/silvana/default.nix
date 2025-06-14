# My NixOS Config
# Author: Arik Elliott

{ inputs, ... }:

let
	hostname = "silvana";
in

{

# - Define your hostname -
	networking.hostName = hostname;

# -------- IMPORTS --------

# - Import All Modules -
		imports = [

		# - Import configs exclusive to this host
		./hardware-configuration.nix # Auto-generated hardware-config
		./extras # Manually added configs
		# Includes:

		# - Import General Settings
		../../modules/settings # General settings
		../../modules/settings/networking/default-networking-profile.nix # Basic universal networking settings
		../../modules/localization/timezones/detroit.nix # Set time zone
		../../modules/localization/default-localization-profile.nix # Set language, keyboard, etc.

		# - Import Users
		../../modules/users/user-arik.nix # Add Arik
		../../modules/users/user-access.nix # Add Access
		../../modules/users/service-users/user-restic.nix # Add user account for Restic service

		# - Import Software packages and settings -
		../../modules/hardware/drivers.nix # Install additional hardware drivers.
		../../modules/software/amdgpu-utils.nix # Install AMD graphics utilities
		../../modules/software/bluetooth-profile.nix # Install and enable bluetooth
		../../modules/software/creative/general-creative.nix # Media, makerspace, etc. software
		../../modules/software/cups-printing-profile.nix # Install CUPS printer drivers
		# ../../modules/software/desktop-environments/cosmic.nix # Enable Cosmic desktop environment.
		../../modules/software/desktop-environments/grub-theme.nix # GRUB Theme
		../../modules/software/desktop-environments/gnome.nix # Enable GNOME
		../../modules/software/desktop-environments/hyprland.nix # Enable Hyprland
		../../modules/software/desktop-environments/niri.nix # Enable Niri
		../../modules/software/desktop-environments/sddm # Enable SDDM display manager
		../../modules/software/dev/benchmarking.nix # Benchmarking utils
		../../modules/software/dev/cybersec.nix # Tools for cybersecurity uses.
		../../modules/software/dev/java.nix # Install Java
		../../modules/software/dev/lua.nix # Install lua
		../../modules/software/dev/nixd.nix # Install nixd LSP
		../../modules/software/dev/python.nix # Install Python
		../../modules/software/dev/webdev.nix # Software for web development
		../../modules/software/docker/docker-enable.nix # Install and configure Docker
		../../modules/software/docker/ollama.nix # Install and run Ollama docker container
		../../modules/software/flatpak/flatpak-enable.nix # Install and configure Flatpak
		../../modules/software/fonts.nix # Install default fonts
		../../modules/software/fun-cli-utils.nix # Handy and silly CLI tools
		../../modules/software/games/general-games.nix # Install Steam
		../../modules/software/general-software.nix # General universal software
		../../modules/software/music/k3b.nix # Install K3B KDE music burner
		../../modules/software/music/mpd.nix # Run mpd server
		../../modules/software/music/spotify.nix # Install Spotify
		../../modules/software/networking/networking-utils.nix # Install and configure networking utilities
		../../modules/software/networking/networkmanager.nix # Install NetworkManager
		../../modules/software/opentabletdriver.nix # Install OpenTabletDriver
		../../modules/software/productivity/desktop-utils.nix # GUI admin utilities
		../../modules/software/productivity/general-productivity.nix #
		../../modules/software/productivity/text-editors.nix # Regular text editors
		../../modules/software/social/chat-clients.nix # Discord, IRC, etc.
		../../modules/software/sound-modules/pipewire.nix # Install Pipewire for audio
		../../modules/software/ssh.nix	# Enable SSH
		../../modules/software/system-utils.nix # Sundry utilities
		../../modules/software/zsh.nix # Install and enable ZSH and its extra software

		../../modules/software/neovim

	];

	# - Import Home Manager files
	home-manager = {
		backupFileExtension = "hmbackup";
		useGlobalPkgs = true;
		useUserPackages = true;
		extraSpecialArgs = { inherit inputs; };
		users = {
			arik = {
				# home.hostname = hostname;
				imports = [
					./home.nix
				];
			};
			root = {
				# home.hostname = hostname;
				imports = [
					./root.nix
				];
			};
		};
	};

# -------


# -------- SYSTEM STATE --------

	# Copy the NixOS configuration file and link it from the resulting system
	# (/run/current-system/configuration.nix). This is useful in case you
	# accidentally delete configuration.nix.
	# system.copySystemConfiguration = true;

	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It's perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "25.05"; # Did you read the comment?

}
