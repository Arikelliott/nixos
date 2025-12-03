{ pkgs, inputs, ... }:

{

	imports = [
		# - Import configs exclusive to this host
		./icons.nix
		./themes.nix
	];

	# - Xserver -
	services.xserver.enable = true; # Enable X11 windowing system.
	services.xserver.displayManager = {
		# Disable LightDM default when no other display manager is enabled.
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

	# - Packages -
	environment.systemPackages = with pkgs; [
		kdePackages.ark # Graphical file archival tool
		xorg.xhost # Server access control program for X. (May be needed for Gparted?)
		gparted # GUI disk partitioning tool.
		kitty # My preferred terminal program.
		dunst # Standalone notificatin manager for WMs.
		grim # Wayland screenshot utility.
		hyprshot # hyprland screenshot utility.
		scrot # Another screen capture utility.
		slurp # Wayland region selector utility.
		wf-recorder # Wayland screen recorder.
		hyprpicker # Wayland color picker.
		swww # Fancy Wayland wallpaper setter and daemon.
		nwg-look # Wayland alternative to lxappearance.
		rofi-wayland # Wayland fork of Rofi app launcher.
		waybar # Wayland bar.
		wlr-randr # Wayland xrandr clone.
		wshowkeys # Shows keys being pressed (Wayland session only).
		lxqt.lxqt-policykit # LXQT polkit agent.
		pwvucontrol # Pipewire volume control interface.
		better-control # General purpose GTK control panel.
		mission-center # GTK Task Manager style system monitir.
		pywal # Color scheme generator/switcher.
		xdg-desktop-portal-hyprland
		mako # Lightweight Wayland notification daemon.
		inputs.quickshell.packages.${pkgs.system}.default # Quickshell, a Qt-based shell/widget maker
	];

}
