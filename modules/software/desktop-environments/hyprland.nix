{ pkgs, inputs, ... }:

{

	imports = [
		# - Import configs exclusive to this host
		./icons.nix
		./themes.nix
		./wayland-wm-utils.nix
	];

	# - Xserver -
	services.xserver.enable = true; # Enable X11 windowing system.
	services.xserver.displayManager = { # Disable LightDM default when no other display manager is enabled.
	lightdm.enable = false;
	};

	# - Hyprland
	programs.hyprland.enable = true; # Enable Hyprland.

	# - Enable UWSM Support https://wiki.hyprland.org/Useful-Utilities/Systemd-start/
	programs.uwsm.enable = true;
	programs.hyprland.withUWSM = true;
	services.displayManager.defaultSession = "hyprland-uwsm";

	# - Disable xterm -
	services.xserver.desktopManager.xterm.enable = false;

	# - XDG Portal Settings -
	xdg.portal = {
	enable = true;
	wlr.enable = true;
	extraPortals = (with pkgs; [
		xdg-desktop-portal-gtk
	 	kdePackages.xdg-desktop-portal-kde
	]);
	};
	# - Policy Kit -
	security.polkit.enable = true;
	qt.enable = true;

}
