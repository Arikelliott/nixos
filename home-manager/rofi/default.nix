{

    programs.rofi = {
        enable = true;
        package = rofi-wayland;
        # cycle = true; # Something about cycling through results. Default is null, but true/false are also options.

        # Settings to put in config.rasi, formatted Nix-style.
        extraConfig = ''
            lalala
        '';

    };

    home.file = {
            ".config/rasi/theme.rasi" = {
                enable = true;
                source = ./theme.rasi;
            };
    };

	# xdg.configFile.".config/rofi/theme.rasi" = {
	# 	enable = true;
	# 	text = ''

	# 	'';
	# };

}
