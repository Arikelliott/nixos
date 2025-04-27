{ config, pkgs, ... }:

{
	# - Xserver -
	services.xserver.enable = true; # Enable X11 windowing system.
	services.displayManager.cosmic = {
		enable = true;
		xwayland.enable = true;
	};
}
