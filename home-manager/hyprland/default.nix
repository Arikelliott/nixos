{ config, inputs, pkgs, lib, ... }:

    # - - - - - - - - - - - - - - - - - - - - - - - - -
    #   _   _                  _                 _
    #  | | | |_   _ _ __  _ __| | __ _ _ __   __| |
    #  | |_| | | | | '_ \| '__| |/ _` | '_ \ / _` |
    #  |  _  | |_| | |_) | |  | | (_| | | | | (_| |
    #  |_| |_|\__, | .__/|_|  |_|\__,_|_| |_|\__,_|
    #        |___/|_|
    # - - - - - - - - - - - - - - - - - - - - - - - - -
    #
    # Arik's Hyprland config
    # Git repo: https://github.com/Arikelliott/nixos
    # Figlet fonts: default, smslant.flf
    # Built using Hyprland https://hyprland.org/
    #
    # - - - - - - - - - - - - - - - - - - - - - - - - -


{

    # - - - - - - - - - - - - - - - - - - - - - - - - -
    #

    # wayland.windowManager.hyprland.extraConfig = ""; # Extra configuration lines to add to ‘~/.config/hypr/hyprland.conf’.


    #
    #
    # - - - - - - - - - - - - - - - - - - - - - - - - -

    wayland.windowManager.hyprland = {
		enable = true; # Configure Hyprland with home-manager
		systemd = {
		    enable = true; # Enable systemd service I guess?
			# enableXdgAutostart = true; # Whether to enable autostart of applications using systemd-xdg-autostart-generator(8).
		};
		xwayland.enable = true; # Enable XWayland
		# plugins = [ ];
	};



    # - - - - - - - - - - - - - - - - - - - - - - - - -
    #   _______  ________________  __  ___  _   _____   ___  ____
    #  / ___/ / / / __/_  __/ __ \/  |/  / | | / / _ | / _ \/ __/
    # / /__/ /_/ /\ \  / / / /_/ / /|_/ /  | |/ / __ |/ , _/\ \
    # \___/\____/___/ /_/  \____/_/  /_/   |___/_/ |_/_/|_/___/
    #
    # Custom variables to use later
    # How to use custom variables: http://wiki.hyprland.org/Configuring/Keywords/#defining-variables
    #
    # - - - - - - - - - - - - - - - - - - - - - - - - -

    wayland.windowManager.hyprland.settings = {
		"$mainMod" = "SUPER";
	};



	# - - - - - - - - - - - - - - - - - - - - - - - - -
    #    ___  ___________  __   _____  ______
    #   / _ \/  _/ __/ _ \/ /  / _ \ \/ / __/
    #  / // // /_\ \/ ___/ /__/ __ |\  /\ \
    # /____/___/___/_/  /____/_/ |_|/_/___/
    #
    # Sets display set up, similar to xrandr
    # See https://wiki.hyprland.org/Configuring/Monitors/ for more info
    # use wlr-randr to get display info
    #
    # - - - - - - - - - - - - - - - - - - - - - - - - -

    wayland.windowManager.hyprland.settings = {
        "monitor" = ",preferred,auto,auto"; # Set default if no config is provided
    };

    # ! Import monitor config with individual host home.nix files !
    # Important for later: https://github.com/TheMaxMur/NixOS-Configuration/blob/master/home/modules/hyprland/monitors/default.nix
    # ^ Might let us import a single file and change settings based on variables,
    # also a good reference for how to set it up.



    # - - - - - - - - - - - - - - - - - - - - - - - - -
    #    _____  ___________
    #   / __/ |/_/ __/ ___/
    #  / _/_>  </ _// /__
    # /___/_/|_/___/\___/
    #
    # Executes any programs, scripts, etc. that should be autostarted
    # See https://wiki.hyprland.org/Configuring/Dispatchers/#list-of-dispatchers for more info
    # also https://wiki.hyprland.org/Configuring/Keywords/#executing
    #
    # - - - - - - - - - - - - - - - - - - - - - - - - -

    wayland.windowManager.hyprland.settings = {
		# Executes any programs, scripts, etc. that should be autostarted

		# EXEC-ONCE: RUN THESE ONLY AT STARTUP
		exec-once = [
			"waybar" # top bar
			"dunst" # notification daemon
			"swww init" # Wayland wallpaper setter/animator https://github.com/Horus645/swww
			"lxqt-policykit-agent" # KDE polkit software (recommended by Vaxry), handles authentication. https://wiki.archlinux.org/title/Polkit
			"ckb-next -b" # starts ckb-next corsair mouse software
			# "sh ~/dotfiles/rgb/rgb.sh off" # Autoruns RGB (currently defaults to "off")
		];

		# EXEC: RUN THESE EVERY HYPRLAND RELOAD
		# exec = [
		#
		# ];
	};


    # - - - - - - - - - - - - - - - - - - - - - - - - -
    #    _____  ___   __
    #   / __/ |/ / | / /
    #  / _//    /| |/ /
    # /___/_/|_/ |___/
    #
    # Sets environment variables as needed
    # See https://wiki.hyprland.org/Configuring/Environment-variables/ for more info
    #
    # - - - - - - - - - - - - - - - - - - - - - - - - -

    home.sessionVariables = {
        # EDITOR = "emacs";
        GTK_THEME = "Materia-light"; # sets GTK theme
		XCURSOR_SIZE = "24"; # sets cursor size
		MOZ_ENABLE_WAYLAND = "1"; # notifies some stuff that it's running on Wayland

		GDK_BACKEND = "wayland,x11"; # GTK: Use wayland if available, fall back to x11 if not.

		QT_QPA_PLATFORM = "wayland;xcb"; # QT: Use wayland if available, fall back to x11 if not.
		QT_QPA_PLATFORMTHEME = "qt5ct"; # Tells Qt based applications to pick your theme from qt5ct, use with Kvantum.
		QT_WAYLAND_DISABLE_WINDOWDECORATION = "1"; # Disables window decorations on Qt applications
		QT_AUTO_SCREEN_SCALE_FACTOR = "1"; # Enables automatic scaling, based on the monitor’s pixel

		XDG_CURRENT_DESKTOP = "Hyprland";
		XDG_SESSION_TYPE = "wayland";
		XDG_SESSION_DESKTOP = "Hyprland";

		HYPRSHOT_DIR = "~/Pictures/screenshots"; # Set Hyprshot to save to specific directory
    };


    # - - - - - - - - - - - - - - - - - - - - - - - - -
    #    ___  _____   ___________________
    #   / _ \/ __/ | / /  _/ ___/ __/ __/
    #  / // / _/ | |/ // // /__/ _/_\ \
    # /____/___/ |___/___/\___/___/___/
    #
    # Configure input, gestures, and custom devices
    # See the following pages:
    # - http://wiki.hyprland.org/Configuring/Variables/#input
    # - https://wiki.hyprland.org/Configuring/Variables/#gestures
    # - https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs
    #
    # - - - - - - - - - - - - - - - - - - - - - - - - -

    # Split into multiple per-device configs linked to in home.nix later?
    # imports = [
	# 	./configs/devices.nix # Import devices configs
	# ];

	# Input

	wayland.windowManager.hyprland.settings = {
        input = {
            kb_layout = "us";
            # kb_variant = "";
            # kb_model = "";
            # kb_options = "";
            # kb_rules = "";
            numlock_by_default = "true";
            follow_mouse = "1";
            touchpad = {
                natural_scroll = "false";
            };
            sensitivity = "0"; # -1.0 - 1.0, 0 means no modification.
        };
        gestures = { # Gestures
            # See https://wiki.hyprland.org/Configuring/Variables/ for more
            workspace_swipe = "false";
        };
    };


    # - - - - - - - - - - - - - - - - - - - - - - - - -
    #  _   _____   ___  _______   ___  __   ________
    # | | / / _ | / _ \/  _/ _ | / _ )/ /  / __/ __/
    # | |/ / __ |/ , _// // __ |/ _  / /__/ _/_\ \
    # |___/_/ |_/_/|_/___/_/ |_/____/____/___/___/
    #
    # Configure all variables
    # See http://wiki.hyprland.org/Configuring/Variables/ for more info
    #
    # - DOES NOT INCLUDE CERTAIN VARIABLES -
    #
    # - - - - - - - - - - - - - - - - - - - - - - - - -

    wayland.windowManager.hyprland.settings = {

		general = {
			gaps_in = "5";
			gaps_out = "10";
			border_size = "2";
			"col.active_border" = "rgba(94e2d5ff) rgba(74c7ecee) 45deg";
			"col.inactive_border" = "rgba(181825ff)";
			layout = "dwindle";
		};

		dwindle = {
			pseudotile = "true";
			preserve_split = "true";
		};

		decoration = {
			rounding = "0";
			blur = {
				enabled = "yes";
				size = "6";
				passes = "3";
				new_optimizations = "on";
				ignore_opacity = "on";
				xray = "false";
			};
			drop_shadow = "true";
			shadow_range = "40";
			shadow_render_power = "4";
			"col.shadow" = "rgba(00000044)";
		};

		animations = {
       		enabled = "true";
			bezier = [
				"myBezier, 0, 1, 0, 1"
				"linear, 0, 0, 0, 0"
			];
			animation = [
				"windows, 1, 7, myBezier, slide"
				"windowsOut, 1, 7, default, slide"
				"border, 1, 10, default"
				"borderangle, 1, 20, linear, loop"
				"fade, 1, 7, default"
				"fadeIn, 1, 10, myBezier"
				"fadeOut, 1, 10, myBezier"
				"workspaces, 1, 6, myBezier, slide"
			];
		};

		master = {
			# See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
			new_status = "master";
		};

		misc = {
			disable_hyprland_logo = "true"; # Turns off Hyprland wallpapers
			disable_splash_rendering = "true";
			vrr = "1"; # Variable Refresh Rate. 0 - off, 1 - on, 2 - fullscreen only
		};

		debug = {
			disable_logs = "false";
			enable_stdout_logs = "true";
		};
	};


    # - - - - - - - - - - - - - - - - - - - - - - - - -
    #    __ ________  _____  _____  _____  ____
    #   / //_/ __/\ \/ / _ )/  _/ |/ / _ \/ __/
    #  / ,< / _/   \  / _  |/ //    / // /\ \
    # /_/|_/___/   /_/____/___/_/|_/____/___/
    #
    # Creates all keybinds
    # See https://wiki.hyprland.org/Configuring/Binds/ for more info
    #
    # - - - - - - - - - - - - - - - - - - - - - - - - -

    wayland.windowManager.hyprland.settings = {
		# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more

		bind = [
			"$mainMod, Q, killactive,"
			"$mainMod SHIFT, E, exit,"
			"$mainMod, T, togglefloating,"
			"$mainMod, F, fullscreen,"
			"$mainMod, Space, exec, sh /home/arik/dotfiles/rofi/.config/rofi/launcher/run.sh # Opens Rofi on Windows+Space"
			"$mainMod, P, pseudo, # dwindle"

			# Volume controls
			",XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
			",XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
			",XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle"

			# Move focus with mainMod + arrow keys
			"$mainMod, left, workspace, r-1"
			"$mainMod, right, workspace, r+1"
			"$mainMod, up, togglesplit"
			"$mainMod, down, layoutmsg, swapsplit"

			# Switch workspaces with mainMod + [0-9]
			"$mainMod, 1, workspace, 1"
			"$mainMod, 2, workspace, 2"
			"$mainMod, 3, workspace, 3"
			"$mainMod, 4, workspace, 4"
			"$mainMod, 5, workspace, 5"
			"$mainMod, 6, workspace, 6"
			"$mainMod, 7, workspace, 7"
			"$mainMod, 8, workspace, 8"
			"$mainMod, 9, workspace, 9"
			"$mainMod, 0, workspace, 10"

			# Move active window to a workspace with mainMod + SHIFT + [0-9]
			"$mainMod SHIFT, 1, movetoworkspacesilent, 1"
			"$mainMod SHIFT, 2, movetoworkspacesilent, 2"
			"$mainMod SHIFT, 3, movetoworkspacesilent, 3"
			"$mainMod SHIFT, 4, movetoworkspacesilent, 4"
			"$mainMod SHIFT, 5, movetoworkspacesilent, 5"
			"$mainMod SHIFT, 6, movetoworkspacesilent, 6"
			"$mainMod SHIFT, 7, movetoworkspacesilent, 7"
			"$mainMod SHIFT, 8, movetoworkspacesilent, 8"
			"$mainMod SHIFT, 9, movetoworkspacesilent, 9"
			"$mainMod SHIFT, 0, movetoworkspacesilent, 10"

			# Switch workspaces with mainMod + [0-9]
			"$mainMod, KP_End, workspace, 1"
			"$mainMod, KP_Down, workspace, 2"
			"$mainMod, KP_Next, workspace, 3"
			"$mainMod, KP_Left, workspace, 4"
			"$mainMod, KP_Begin, workspace, 5"
			"$mainMod, KP_Right, workspace, 6"
			"$mainMod, KP_Home, workspace, 7"
			"$mainMod, KP_Up, workspace, 8"
			"$mainMod, KP_Prior, workspace, 9"
			"$mainMod, KP_Insert, workspace, 10"

			# Move active window to a workspace with mainMod + SHIFT + [0-9]
			"$mainMod SHIFT, KP_End, movetoworkspacesilent, 1"
			"$mainMod SHIFT, KP_Down, movetoworkspacesilent, 2"
			"$mainMod SHIFT, KP_Next, movetoworkspacesilent, 3"
			"$mainMod SHIFT, KP_Left, movetoworkspacesilent, 4"
			"$mainMod SHIFT, KP_Begin, movetoworkspacesilent, 5"
			"$mainMod SHIFT, KP_Right, movetoworkspacesilent, 6"
			"$mainMod SHIFT, KP_Home, movetoworkspacesilent, 7"
			"$mainMod SHIFT, KP_Up, movetoworkspacesilent, 8"
			"$mainMod SHIFT, KP_Prior, movetoworkspacesilent, 9"
			"$mainMod SHIFT, KP_Insert, movetoworkspacesilent, 10"

			# KP_End,KP_Down,KP_Next,KP_Left,KP_Begin,KP_Right,KP_Home,KP_Up,KP_Prior,KP_Insert

			# Scroll through existing workspaces with mainMod + scroll
			"$mainMod, mouse_down, workspace, e+1"
			"$mainMod, mouse_up, workspace, e-1"

			# Set random wallpaper
			"$mainMod, W, exec, sh scripts/random-wall-setter.sh"
			# Pick random wallpaper directory with Rofi
			"$mainMod SHIFT, W, exec, sh scripts/set-wallpaper-dir.sh"

			# For creating incompatibility with Windows LinkedIn keybind (see https://invent.kde.org/plasma/plasma-desktop/-/merge_requests/1731)
			"$mainMod SHIFT CTRL ALT, L, exec, sh scripts/linus-keybind.sh"

			"$mainMod, G, exec, sh scripts/open-gparted.sh"

			# Take screenshot
			"$mainMod, Print, exec, sh scripts/screenshot.sh"

			# Enable or disable displays
			"$mainMod SHIFT, P, exec, sh ~/dotfiles/scripts/hypr-monitor-reset.sh"

			"$mainMod CTRL, P, exec, sh ~/dotfiles/scripts/set-wallpaper-dir.sh"
		];

		bindm = [
    		# Move/resize windows with mainMod + LMB/RMB and dragging
    		"$mainMod, mouse:272, movewindow"
    		"$mainMod, mouse:273, resizewindow"
        ];
	};


    # - - - - - - - - - - - - - - - - - - - - - - - - -
    #  _      _______  _____  ____ _      __  ___  __  ____   ________
    # | | /| / /  _/ |/ / _ \/ __ \ | /| / / / _ \/ / / / /  / __/ __/
    # | |/ |/ // //    / // / /_/ / |/ |/ / / , _/ /_/ / /__/ _/_\ \
    # |__/|__/___/_/|_/____/\____/|__/|__/ /_/|_|\____/____/___/___/
    #
    # Configure custom window rules (e.g. make certain apps floating by default)
    # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more info
    #
    # - - - - - - - - - - - - - - - - - - - - - - - - -

    wayland.windowManager.hyprland.settings = {
        # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
        windowrule = [
            # "float, ^(org.gnome.Calculator)$"
            "float, org.gnome.Calculator" # both of these work, dunno what the regex does
            "float, org.kde.polkit-kde-authentication-agent-1"
            "float,class:^(thunar)$,title:^(File Operation Progress)$"
        ];
        # Make the Steam dropdown menus work properly
        windowrulev2 = [
            # "stayfocused, title:^()$,class:^(steam)$"
            # "minsize 1 1, title:^()$,class:^(steam)$"
        ];
        # Some things are layers, not windows. Rofi for example. They have different limits
        # http://wiki.hyprland.org/Configuring/Window-Rules/#layer-rules for more info
        # https://www.reddit.com/r/hyprland/comments/163if0n/comment/jy2zjmq/?utm_source=share&utm_medium=web2x&context=3
        layerrule = [
            "blur, rofi"
            # "blur, waybar"
        ];
    };


    # - - - - - - - - - - - - - - - - - - - - - - - - -
    #  ________ ________  ___________
    # /_  __/ // / __/  |/  / __/ __/
    #  / / / _  / _// /|_/ / _/_\ \
    # /_/ /_//_/___/_/  /_/___/___/
    #
    # Placeholder for future theme support
    #
    # - - - - - - - - - - - - - - - - - - - - - - - - -



}
