{ inputs, pkgs, lib, ... }:

{

	programs.kitty = {
	enable = true;
	font = {
		# package = pkgs.meslo-lgs-nf;
		# name = "Roboto";
		# package = pkgs.dejavu_fonts;
		# name = "DejaVuSansM Nerd Font";
		package = pkgs.jetbrains-mono;
		name = "JetBrainsMonoNL NF";
		size = 10.0;
	};

	settings = {
		window_padding_width = 8;
		confirm_os_window_close = 0;
		cursor_trail = 3;
		cursor_trail_decay = "0.1 0.4";
	};

	themeFile = "Catppuccin-Mocha"; # For manually importing kitty themes
	settings = {
		# blue:
		color4 = "#3B83F7";
		color12 = "#146AF5";
	};
	};

	# imports = [ # For making custom kitty themes
	#	# ./themes/kitty-color-theme-pywal.nix
	#	./themes/kitty-color-theme-catppuccin-frappe.nix
	#	# ./themes/kitty-color-theme-nord.nix
	# ];

}
