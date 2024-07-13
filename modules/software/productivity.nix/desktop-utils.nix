{ config, pkgs, ... }:

{

	environment.systemPackages = with pkgs; [

	baobab # Like WinDirStat. GTK graphical file usage viewer.
	font-manager # Font viewing app.
	gucharmap # GNOME character map viewer.
	galculator # GTK Calculator.
	kdiff3 # Diff and merge up to 3 files or directories at once.
	meld # GTK diff and merge tool.
	remmina # Remote desktop client.

	];

}