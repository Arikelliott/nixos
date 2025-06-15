{ pkgs, ... }:

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

	# - Niri
	programs.niri.enable = true; # Enable Niri.

	# - Disable xterm -
	services.xserver.desktopManager.xterm.enable = false;

	# - XDG Portal Settings -
	xdg.portal = {
		enable = true;
		wlr.enable = true;
		extraPortals = (with pkgs; [
			xdg-desktop-portal-gtk
			kdePackages.xdg-desktop-portal-kde
			xdg-desktop-portal-gnome
		]);
	};
	# - Policy Kit -
	services.gnome.gnome-keyring.enable = true;
	security.polkit.enable = true;
	qt.enable = true;

	environment.systemPackages = with pkgs; [
		xwayland-satellite
	];

}
