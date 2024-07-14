{ config, pkgs, ... }:

{

    # - Xserver -
    services.xserver.enable = true; # Enable X11 windowing system.

    services.xserver.displayManager = { # Disable LightDM default when no other display manager is enabled.
        lightdm.enable = false;
    };

    # - BSPWM
	services.xserver.windowManager.bspwm.enable = true; # Enable BSPWM

    # - Policy Kit -
    security.polkit.enable = true;


    # - Disable xterm -
    services.xserver.desktopManager.xterm.enable = false;

    # --- Look up what this does
    # - XDG Portal Settings -
    # xdg.portal = {
    #     enable = true;
    # };

    environment.systemPackages = with pkgs; [
		xorg.xhost # Server access control program for X. (May be needed for Gparted?)
		gparted # GUI disk partitioning tool.
		xfce.xfce4-terminal # My preferred kitty substitute.
		dunst # Standalone notificatin manager for WMs.
		flameshot # screenshotting tool
		loupe # GUI Image Viewer.
		lxappearance # GTK theme GUI.
		nitrogen # X11 wallpaper setter.
		cinnamon.nemo-with-extensions # Nemo file explorer
		cinnamon.nemo-fileroller
		rofi # Rofi app launcher.
		polybar # Wayland bar.
		wireshark # Packet analyzer.
		xorg.xrandr # Xrandr.
		arandr # xrandr GUI frontend.
		lxqt.lxqt-policykit # LXQT polkit agent.
		pwvucontrol # Pipewire volume control interface.
		pywal # Color scheme generator/switcher.
		stow # Symlink/dotfiles manager.
		
	];

}