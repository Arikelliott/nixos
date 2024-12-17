{ pkgs, ... }:

{

fonts.packages = with pkgs; [

	noto-fonts # Google's universal font.
	font-awesome # scalable vector icon font.
	jetbrains-mono
	corefonts # Microsoft's TTF core fonts for the web.
	helvetica-neue-lt-std # Helvetica Neue Standard
	aileron # Clean sans serif font, sorta similar to Helvetica

	materia-theme # Materia GTK theme.
	material-icons # Google's Material icons.
	papirus-icon-theme

]

++

builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts); # Giant nerd font package.

}
