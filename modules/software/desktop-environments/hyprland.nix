{ config, pkgs, ... }:

{

    # - Xserver -
    services.xserver.enable = true; # Enable X11 windowing system.

    # - Display Manager -
    # services.displayManager = {
        # sddm = { # Settings for SDDM display manager.
        #   enable = true; # Enable SDDM.
        #   # wayland.enable = true; # Enable experimental Wayland support.
        #   # theme = "sddm-chili-theme"; # Theme to use.
        #   autoNumlock = true; # Enable num lock.
        # };
    #   defaultSession = "hyprland"; # Set pre-selected session when starting display manager.
    # };

    services.xserver.displayManager = { # Disable LightDM default when no other display manager is enabled.
        lightdm.enable = false;
    };

    # - Hyprland
    programs.hyprland.enable = true; # Enable Hyprland.

    # - Policy Kit -
    security.polkit.enable = true;


    # - Disable xterm -
    services.xserver.desktopManager.xterm.enable = false;

    # --- Look up what this does
    # - XDG Portal Settings -
    xdg.portal = {
        enable = true;
        wlr.enable = true;
    };

    environment.systemPackages = with pkgs; [
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
		waypaper # GUI frontend for swww.
		loupe # GUI Image Viewer.
		nwg-look # Wayland alternative to lxappearance.
		cinnamon.nemo-with-extensions # Nemo file explorer
		cinnamon.nemo-fileroller
		rofi-wayland # Wayland fork of Rofi app launcher.
		waybar # Wayland bar.
		wireshark # Packet analyzer.
		wlr-randr # Wayland xrandr clone.
		wshowkeys # Shows keys being pressed (Wayland session only).
		# libsForQt5.polkit-kde-agent # KDE polkit agent.
		lxqt.lxqt-policykit # LXQT polkit agent.
		pwvucontrol # Pipewire volume control interface.
		pywal # Color scheme generator/switcher.
		stow # Symlink/dotfiles manager.
		
	];

}