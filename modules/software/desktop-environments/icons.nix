{ config, pkgs, ... }:

{

	environment.systemPackages = with pkgs; [
	papirus-folders
	papirus-icon-theme
	papirus-maia-icon-theme
	whitesur-icon-theme
	vimix-icon-theme
	rose-pine-icon-theme
	material-icons
	material-symbols
	adwaita-icon-theme

	];

}
