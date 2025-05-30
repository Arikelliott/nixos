# My NixOS Config
# Author: Arik Elliott

{ inputs, ... }:

{

# - Define your hostname -
	networking.hostName = "forrester";

# -------- IMPORTS --------

# - Import All Modules -
		imports = [

		# - Import configs exclusive to this host
		./hardware-configuration.nix # Auto-generated hardware-config
		./extras # Manually added configs
		# Includes:

		# - Import General Settings
		../../modules/settings/nixos-settings.nix # NixOS-specific general settings
		../../modules/settings/nixos-maintenance.nix # NixOS maintenance settings
		../../modules/settings/general-settings.nix # General Linux system maintenance
		../../modules/settings/networking/default-networking-profile.nix # Basic universal networking settings
		../../modules/localization/timezones/detroit.nix # Set time zone
		../../modules/localization/default-localization-profile.nix # Set language, keyboard, etc.

		# - Import Users
		../../modules/users/user-arik.nix # Add Arik
		# ../../modules/users/service-users/user-restic.nix # Add user account for Restic service # CAN ENABLE LATER

		# - Import Software packages and settings -
		../../modules/software/desktop-environments/gnome.nix
		../../modules/software/bluetooth-profile.nix # Install and enable bluetooth
		../../modules/software/cups-printing-profile.nix # Install CUPS printer drivers
		../../modules/software/fonts.nix # Install default fonts
		../../modules/software/fun-cli-utils.nix # Handy and silly CLI tools
		../../modules/software/general-software.nix # General universal software
		../../modules/software/music/spotify.nix # Install Spotify
		../../modules/software/networking/networking-utils.nix # Install and configure networking utilities
		../../modules/software/networking/networkmanager.nix # Install NetworkManager
		../../modules/software/productivity/desktop-utils.nix # GUI admin utilities
		../../modules/software/productivity/general-productivity.nix #
		../../modules/software/productivity/text-editors.nix # Regular text editors
		../../modules/software/social/chat-clients.nix # Discord, IRC, etc.
		../../modules/software/sound-modules/pipewire.nix # Install Pipewire for audio
		../../modules/software/ssh.nix	# Enable SSH
		../../modules/software/system-utils.nix # Sundry utilities
		../../modules/software/touchpad-input.nix
		../../modules/software/zsh.nix # Install and enable ZSH and its extra software

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
		};
		root = {
			# home.hostname = hostname;
			imports = [
				./root.nix
			];
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
	system.stateVersion = "24.05"; # Did you read the comment?

}
