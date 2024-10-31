{

    programs.rofi = {
        enable = true;
        package = rofi-wayland;
        # cycle = true; # Something about cycling through results. Default is null, but true/false are also options.


	xdg.configFile.".config/rofi/theme.rasi" = {
		enable = true;
		text = ''

		'';
	};

}
