{ config, pkgs, inputs, ...}:

{

	programs.thunar.enable = true;
	programs.thunar.plugins = with pkgs.xfce; [ thunar-archive-plugin thunar-volman thunar-media-tags-plugin ];

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
		waypaper # GUI frontend for swww.
		loupe # GUI Image Viewer.
		# lxappearance # Doesn't work on Wayland at all
		nwg-look # Wayland alternative to lxappearance.
		# nemo-with-extensions # Nemo file explorer
		# nemo-fileroller
		# nautilus
		# nautilus-open-any-terminal
		rofi-wayland # Wayland fork of Rofi app launcher.
		waybar # Wayland bar.
		wlr-randr # Wayland xrandr clone.
		wshowkeys # Shows keys being pressed (Wayland session only).
		# libsForQt5.polkit-kde-agent # KDE polkit agent.
		lxqt.lxqt-policykit # LXQT polkit agent.
		pwvucontrol # Pipewire volume control interface.
		better-control # General purpose GTK control panel.
		mission-center # GTK Task Manager style system monitir.
		pywal # Color scheme generator/switcher.
		stow # Symlink/dotfiles manager.
		ags # GTK Widget making utility.
		eww # Elkowar's wacky widgets.
		xdg-desktop-portal-hyprland
		mako # Lightweight Wayland notification daemon.
		inputs.quickshell.packages.${pkgs.system}.default # Quickshell, a Qt-based shell/widget maker

	];

}
