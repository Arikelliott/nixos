{ config, pkgs, ... }:

{

	environment.systemPackages = with pkgs; [
	materia-theme
	# catppuccin
	catppuccin-gtk
	rose-pine-gtk-theme
	whitesur-gtk-theme
	tokyonight-gtk-theme
	sierra-gtk-theme
	lavanda-gtk-theme
	paper-gtk-theme
	qogir-theme
	nightfox-gtk-theme
	mojave-gtk-theme
	matrix-gtk-theme
	matcha-gtk-theme
	lounge-gtk-theme
	layan-gtk-theme
	kanagawa-gtk-theme
	gruvbox-gtk-theme
	graphite-gtk-theme
	fluent-gtk-theme
	everforest-gtk-theme
	deepin.deepin-gtk-theme
	colloid-gtk-theme
	andromeda-gtk-theme
	adapta-gtk-theme
	];

}
