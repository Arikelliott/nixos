{ config, pkgs, ... }:

{

fonts.packages = with pkgs; [

	noto-fonts # Google's universal font.
	font-awesome # scalable vector icon font.
	nerdfonts # Giant nerd font package.
	jetbrains-mono
	corefonts # Microsoft's TTF core fonts for the web.
	helvetica-neue-lt-std # Helvetica Neue Standard
	aileron # Clean sans serif font, sorta similar to Helvetica

	materia-theme # Materia GTK theme.
	material-icons # Google's Material icons.
	papirus-icon-theme

];

}