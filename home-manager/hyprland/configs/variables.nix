{ inputs, pkgs, lib, ... }:

{

	wayland.windowManager.hyprland.settings = {
		
		general = {
			gaps_in = "5";
			gaps_out = "10";
			border_size = "2";
			"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
			"col.inactive_border" = "rgba(0F0F17aa)";
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

}