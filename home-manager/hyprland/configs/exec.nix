{ inputs, pkgs, lib, ... }:

{

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

}