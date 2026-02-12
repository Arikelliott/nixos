# My NixOS Config
# Author: Arik Elliott

{ inputs, config, lib, ... }:

let
	hostname = "savannah";
in

{

# - Define your hostname -
	networking.hostName = hostname;

# -------- IMPORTS --------

# - Import All Modules -
	imports = [

		./hardware-configuration.nix # Auto-generated hardware-config
		./extras.nix # Manually added configs
		../../modules/settings.nix # General settings
		../../modules/general-software.nix
		../../modules/localization/timezones/detroit.nix # Set time zone
		../../modules/localization/default-localization-profile.nix # Set language, keyboard, etc.

		# - Import Users
		../../modules/users/user-arik.nix # Add Arik user.
		../../modules/users/user-anyara.nix # Add Anyara user.

	];

	# - Home Manager
	home-manager = {
		backupFileExtension = "hmbackup";
		useGlobalPkgs = true;
		useUserPackages = true;
		extraSpecialArgs = { inherit inputs; };
		users = {
			arik = {
				# Home Manager needs a bit of information about you and the paths it should
				# manage.
				home.username = "arik";
				home.homeDirectory = "/home/arik";

				# Home Manager release your system is compatible with. Don't change except on fresh install!!!
				home.stateVersion = "23.11";

				home.sessionVariables = {
					# EDITOR = "emacs";
					# CUPCAKE = "fred";
				};

				# Let Home Manager install and manage itself.
				programs.home-manager.enable = true;

				imports = [
				../../home-manager/kitty
				../../home-manager/rofi
				../../home-manager/shell
				../../home-manager/scripts
				../../home-manager/theme
				../../home-manager/nixtools
				../../home-manager/git
				../../home-manager/hyprland
				../../home-manager/hyprland/configs/displays/savannah1.nix
				../../home-manager/hyprland/configs/keybinds/savannah-keybinds.nix
				];
	
					wayland.windowManager.hyprland.settings.general = {
						gaps_in = lib.mkForce "0";
						gaps_out = lib.mkForce "0";
						border_size = lib.mkForce "0";
					};
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
	system.stateVersion = "24.05"; # Did you read the comment?

}
