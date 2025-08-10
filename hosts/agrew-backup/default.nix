# My NixOS Config
# Author: Arik Elliott

{ inputs, ... }:

{

# - Define your hostname -
	networking.hostName = "agrew";

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
		# ../../modules/users/user-access.nix # Add Access

		# - Import Software packages and settings -
		../../modules/software/fun-cli-utils.nix # Handy and silly CLI tools
		../../modules/software/general-software.nix # General universal software
		../../modules/software/networking/networking-utils.nix # Install and configure networking utilities
		../../modules/software/networking/networkmanager.nix # Install NetworkManager
		../../modules/software/productivity/text-editors.nix # Regular text editors
		../../modules/software/ssh.nix	# Enable SSH
		# ../../modules/software/zsh.nix # Install and enable ZSH and its extra software
	# ../../modules/software/dev/cockpit.nix # Enable Cockpit server monitoring

	];

# -------


# -------- SYSTEM STATE --------

	# Copy the NixOS configuration file and link it from the resulting system
	# (/run/current-system/configuration.nix). This is useful in case you
	# accidentally delete configuration.nix.
	# system.copySystemConfiguration = true;

	# This option defines the first version of NixOS you have installed on this particular machine,
	# and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
	#
	# Most users should NEVER change this value after the initial install, for any reason,
	# even if you've upgraded your system to a new NixOS release.
	#
	# This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
	# so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
	# to actually do that.
	#
	# This value being lower than the current NixOS release does NOT mean your system is
	# out of date, out of support, or vulnerable.
	#
	# Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
	# and migrated your data accordingly.
	#
	# For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
	system.stateVersion = "24.05"; # Did you read the comment?

}
