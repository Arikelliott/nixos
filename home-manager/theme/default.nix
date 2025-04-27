{ config, pkgs, extraSpecialArgs, ... }:

{
	gtk = {
	enable = true;
	font = {
		name = "Futura Bk";
		size = 11;
	};
	iconTheme = {
		package = pkgs.whitesur-icon-theme;
		name = "WhiteSur";
	};
	theme = {
		package = pkgs.lavanda-gtk-theme;
		name = "Lavanda-Sea";
	};
	};
}
