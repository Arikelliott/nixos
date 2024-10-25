{ config, extraSpecialArgs, ... }:

{
	# Home Manager needs a bit of information about you and the paths it should
	# manage.
	home.username = "root";
	home.homeDirectory = "/root";

	# This value determines the Home Manager release that your configuration is
	# compatible with. This helps avoid breakage when a new Home Manager release
	# introduces backwards incompatible changes.
	#
	# You should not change this value, even if you update Home Manager. If you do
	# want to update the value, then make sure to first check the Home Manager
	# release notes.
	home.stateVersion = "23.11"; # Please read the comment before changing.


	# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;




	imports = [
		# ../../home-manager/kitty
		../../home-manager/shell
		../../home-manager/theme
		../../home-manager/nixtools
	];
}
