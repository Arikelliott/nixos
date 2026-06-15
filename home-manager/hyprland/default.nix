{ ... }:

	# - - - - - - - - - - - - - - - - - - - - - - - - -
	#	_	_			_		 _
	#	| | | |_	_ _ __	_ __| | __ _ _ __	__| |
	#	| |_| | | | | '_ \| '__| |/ _` | '_ \ / _` |
	#	|	_	| |_| | |_) | |	| | (_| | | | | (_| |
	#	|_| |_|\__, | .__/|_|	|_|\__,_|_| |_|\__,_|
	#	|___/|_|
	# - - - - - - - - - - - - - - - - - - - - - - - - -
	#
	# Arik's Hyprland config
	# Git repo: https://github.com/Arikelliott/nixos
	# Figlet fonts: default, smslant.flf
	# Built using Hyprland https://hyprland.org/
	#
	# - - - - - - - - - - - - - - - - - - - - - - - - -


{
	wayland.windowManager.hyprland = {
		enable = true; # Configure Hyprland with home-manager
		configType = "hyprlang";
		systemd = {
			enable = true; # Enable systemd service I guess?
		};
		xwayland.enable = true; # Enable XWayland
		# plugins = [ ];
		settings = {
			"$mainMod" = "SUPER";

			# EXEC-ONCE: RUN THESE ONLY AT STARTUP
			exec-once = [
				"lxqt-policykit-agent" # KDE polkit software (recommended by Vaxry), handles authentication. https://wiki.archlinux.org/title/Polkit
				# "ckb-next -b" # starts ckb-next corsair mouse software
				# "sh ~/dotfiles/rgb/rgb.sh off" # Autoruns RGB (currently defaults to "off")
				"wl-paste --type text --watch cliphist store" # Stores only text data
				"wl-paste --type image --watch cliphist store" # Stores only image data
				"noctalia" # run Noctalia on start
			];
			# EXEC: RUN THESE EVERY HYPRLAND RELOAD
			# exec = [
			#
			# ];
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
				workspace_swipe_touch = "false";
			};
			general = {
				gaps_in = "5";
				gaps_out = "10";
				border_size = "2";
				"col.active_border" = "rgba(94e2d5ff) rgba(74c7ecee) 45deg";
				"col.inactive_border" = "rgba(181825ff)";
				layout = "dwindle";
			};
			dwindle = {
				smart_split = "true";
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
				shadow = {
					enabled = "true";
					range = "40";
					render_power = "4";
					color = "rgba(00000044)";
					color_inactive = "rgba(00000044)";
				};
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

			ecosystem = {
				no_donation_nag = "true";
			};
			bind = [
				"$mainMod, Q, killactive,"
				"$mainMod SHIFT, E, exit,"
				"$mainMod, T, togglefloating,"
				"$mainMod, F, fullscreen,"
				"$mainMod, P, pseudo, # dwindle"
				"$mainMod, Space, exec, noctalia msg panel-toggle launcher" # Opens Noctalia launcher
				"$mainMod, Return, exec, kitty"
				"$mainMod SHIFT CTRL ALT, L, exec, sh scripts/linus-keybind.sh" # For creating incompatibility with Windows LinkedIn keybind (see https://invent.kde.org/plasma/plasma-desktop/-/merge_requests/1731)
				"$mainMod, G, exec, sh scripts/open-gparted.sh"
				# Enable or disable displays
				"$mainMod SHIFT, P, exec, sh ~/dotfiles/scripts/hypr-monitor-reset.sh"
				"$mainMod CTRL, P, exec, sh ~/dotfiles/scripts/set-wallpaper-dir.sh"
				# Volume controls
				# ",XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
				# ",XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
				# ",XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle"

				# Move focus with mainMod + arrow keys
				"$mainMod, left, workspace, r-1"
				"$mainMod, right, workspace, r+1"
				"$mainMod, up, layoutmsg, togglesplit"
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

				# Scroll through existing workspaces with mainMod + scroll
				"$mainMod, mouse_down, workspace, e+1"
				"$mainMod, mouse_up, workspace, e-1"
			];

			bindm = [
				# Move/resize windows with mainMod + LMB/RMB and dragging
				"$mainMod, mouse:272, movewindow"
				"$mainMod, mouse:273, resizewindow"
			];

			# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
			windowrule = [
				# "float, ^(org.gnome.Calculator)$"
				# "float, class:org.gnome.Calculator" # both of these work, dunno what the regex does
				# "float, class:org.kde.polkit-kde-authentication-agent-1"
				# "float,class:^(thunar)$,title:^(File Operation Progress)$"
				# "stayfocused, title:^()$,class:^(steam)$"
				# "minsize 1 1, title:^()$,class:^(steam)$"
				# "float, size 30% 30%, class:xdg-desktop-portal-gtk"
				# "float, size 172 502, title:^(Authentication Required)$"
			];
			# Some things are layers, not windows. Rofi for example. They have different limits
			# http://wiki.hyprland.org/Configuring/Window-Rules/#layer-rules for more info
			# https://www.reddit.com/r/hyprland/comments/163if0n/comment/jy2zjmq/?utm_source=share&utm_medium=web2x&context=3
			layerrule = [
				# "blur, rofi"
				# "blur, waybar"
			];
		};
	};
	
	home.sessionVariables = {
		MOZ_ENABLE_WAYLAND = "1"; # notifies some stuff that it's running on Wayland
		GDK_BACKEND = "wayland,x11"; # GTK: Use wayland if available, fall back to x11 if not.
		QT_QPA_PLATFORM = "wayland;xcb"; # QT: Use wayland if available, fall back to x11 if not.
		QT_QPA_PLATFORMTHEME = "qt5ct"; # Tells Qt based applications to pick your theme from qt5ct, use with Kvantum.
		QT_WAYLAND_DISABLE_WINDOWDECORATION = "1"; # Disables window decorations on Qt applications
		QT_AUTO_SCREEN_SCALE_FACTOR = "1"; # Enables automatic scaling, based on the monitor’s pixel
		# XDG_CURRENT_DESKTOP = "Hyprland";
		# XDG_SESSION_TYPE = "wayland";
		# XDG_SESSION_DESKTOP = "Hyprland";
		HYPRSHOT_DIR = "Pictures/screenshots"; # Set Hyprshot to save to specific directory
	};
}
