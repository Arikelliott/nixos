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
            ".config/rasi/config.rasi" = {
                enable = true;
                source = ./config.rasi;
            };
    };

	# xdg.configFile.".config/rofi/config.rasi" = {
	# 	enable = true;
	# 	text = ''

	# 	'';
	# };

}
