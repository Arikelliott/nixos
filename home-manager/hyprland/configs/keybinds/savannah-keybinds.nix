{

	wayland.windowManager.hyprland.settings.bind = [
			"$mainMod, XF86MonBrightnessDown, exec, brightnessctl set 10%-"
			"$mainMod, XF86MonBrightnessUp, exec, brightnessctl set +10%"
			", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_SINK@ 5%+"
			", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_SINK@ 5%-"
			", XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"
	];

}
