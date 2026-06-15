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

	# - Import Home Manager files
	home-manager = {
		backupFileExtension = "hmbackup";
		useGlobalPkgs = true;
		useUserPackages = true;
		extraSpecialArgs = { inherit inputs; };
		users = {
			arik = {
				home.username = "arik";
				home.homeDirectory = "/home/arik";
				home.stateVersion = "23.11"; # Home Manager release your system is compatible with. Don't change except on fresh install!!!
				programs.home-manager.enable = true; # Let Home Manager install and manage itself.
				imports = [
					../../home-manager/kitty
					../../home-manager/shell
					../../home-manager/scripts
					../../home-manager/nixtools
					../../home-manager/git
					../../home-manager/hyprland
					../../home-manager/hyprland/configs/displays/silvana1.nix
					../../home-manager/hyprland/configs/extra/silvana-extra.nix
					../../home-manager/hyprland/configs/keybinds/silvana-keybinds.nix
					../../home-manager/default-envvars.nix
				];
				# home.sessionVariables = {
				# 	CUPCAKE = "fred";
				# };
			};
			anyara = {
				home.username = "anyara";
				home.homeDirectory = "/home/anyara";
				home.stateVersion = "23.11"; # Home Manager release your system is compatible with. Don't change except on fresh install!!!
				programs.home-manager.enable = true; # Let Home Manager install and manage itself.
				imports = [
					../../home-manager/kitty
					../../home-manager/shell
					../../home-manager/nixtools
					../../home-manager/default-envvars.nix
				];
				# home.sessionVariables = {
				# 	CUPCAKE = "fred";
				# };
			};
			root = {
				home.username = "root";
				home.homeDirectory = "/root";
				home.stateVersion = "23.11"; # Home Manager release your system is compatible with. Don't change except on fresh install!!!
				programs.home-manager.enable = true; # Let Home Manager install and manage itself.
				imports = [
					../../home-manager/shell
					../../home-manager/nixtools
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
