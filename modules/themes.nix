{ config, pkgs, ... }:

{

	environment.systemPackages = with pkgs; [
		# GTK themes
		adw-gtk3
		# Icon themes
		whitesur-icon-theme
		papirus-folders
		papirus-icon-theme
		papirus-maia-icon-theme
	];

}
