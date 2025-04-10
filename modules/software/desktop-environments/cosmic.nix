{ config, pkgs, ... }:

{

    imports = [

		# - Import configs exclusive to this host
		    ./icons.nix
        ./themes.nix

    ];

    # - Xserver -
    services.xserver.enable = true; # Enable X11 windowing system.

    services.displayManager.cosmic-greeter.enable = true;

    services.desktopManager.cosmic.enable = true;



    environment.systemPackages = with pkgs; [
		xorg.xhost # Server access control program for X. (May be needed for Gparted?)
		gparted # GUI disk partitioning tool.
		kitty # My preferred terminal program.
		# dunst # Standalone notificatin manager for WMs.
		# grim # Wayland screenshot utility.
		# hyprshot # hyprland screenshot utility.
		# scrot # Another screen capture utility.
		# slurp # Wayland region selector utility.
		# wf-recorder # Wayland screen recorder.
		# hyprpicker # Wayland color picker.
		swww # Fancy Wayland wallpaper setter and daemon.
		waypaper # GUI frontend for swww.
		loupe # GUI Image Viewer.
        # lxappearance # Doesn't work on Wayland at all
		nwg-look # Wayland alternative to lxappearance.
		nemo-with-extensions # Nemo file explorer
		nemo-fileroller
		# rofi-wayland # Wayland fork of Rofi app launcher.
		# waybar # Wayland bar.
		wlr-randr # Wayland xrandr clone.
		wshowkeys # Shows keys being pressed (Wayland session only).
		# libsForQt5.polkit-kde-agent # KDE polkit agent.
		lxqt.lxqt-policykit # LXQT polkit agent.
		pwvucontrol # Pipewire volume control interface.
		pywal # Color scheme generator/switcher.
		stow # Symlink/dotfiles manager.

	];

}
