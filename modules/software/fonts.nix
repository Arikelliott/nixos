{ config, pkgs, ... }:

{

fonts.fonts = with pkgs; [

	noto-fonts # Google's universal font.
	font-awesome # scalable vector icon font.
	nerdfonts # Giant nerd font package.
	jetbrains-mono
	# corefonts # Microsoft's TTF core fonts for the web.
	materia-theme # Materia GTK theme.
	material-icons # Google's Material icons.
	papirus-icon-theme

];

}