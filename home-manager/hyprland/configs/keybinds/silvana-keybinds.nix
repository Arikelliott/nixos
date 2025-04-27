{

	wayland.windowManager.hyprland.settings.bind = [

			# Volume controls
			"$mainMod, F12, exec, wpctl set-volume @DEFAULT_SINK@ 5%+"
			"$mainMod, F11, exec, wpctl set-volume @DEFAULT_SINK@ 5%-"
			"$mainMod, F10, exec, wpctl set-mute @DEFAULT_SINK@ toggle"

			# Take screenshot
			"$mainMod, Print, exec, sh scripts/screenshot.sh"

	];

}
