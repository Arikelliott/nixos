{ inputs, pkgs, lib, ... }:

{

	wayland.windowManager.hyprland.settings = {
		# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more

		bind = [
			"$mainMod, Q, killactive,"
			"$mainMod SHIFT, E, exit,"
			"# $mainMod, E, exec, dolphin"
			"$mainMod, T, togglefloating,"
			"$mainMod, F, fullscreen,"
			"# bindr = $mainMod, Super_L, exec, sh /home/arik/dotfiles/rofi/.config/rofi/launcher/run.sh # Sets Windows key to open Rofi on press-release"
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

			# Move/resize windows with mainMod + LMB/RMB and dragging
			"bindm = $mainMod, mouse:272, movewindow"
			"bindm = $mainMod, mouse:273, resizewindow"

			# Set random wallpaper
			"$mainMod, W, exec, sh /home/arik/dotfiles/scripts/random-wall-setter.sh"
			# Pick random wallpaper directory with Rofi
			"$mainMod SHIFT, W, exec, sh /home/arik/dotfiles/scripts/set-wallpaper-dir.sh"

			# For creating incompatibility with Windows LinkedIn keybind (see https://invent.kde.org/plasma/plasma-desktop/-/merge_requests/1731)
			"$mainMod SHIFT CTRL ALT, L, exec, sh /home/arik/dotfiles/scripts/linus-keybind.sh"

			"$mainMod, G, exec, sh /home/arik/dotfiles/scripts/open-gparted.sh"

			# Take screenshot
			"$mainMod, Print, exec, sh /home/arik/dotfiles/scripts/screenshot.sh"

			# Enable or disable displays
			"$mainMod SHIFT, P, exec, sh ~/dotfiles/scripts/hypr-monitor-reset.sh"

			"$mainMod CTRL, P, exec, sh ~/dotfiles/scripts/set-wallpaper-dir.sh"
		];
	};

}