{ inputs, pkgs, lib, ... }:

{

	wayland.windowManager.hyprland.settings = {
		
		env = [ # Set all environment variables
			"GTK_THEME,Materia-light" # sets GTK theme
			"XCURSOR_SIZE,24" # sets cursor size
			"MOZ_ENABLE_WAYLAND,1" # notifies some stuff that it's running on Wayland

			"GDK_BACKEND,wayland,x11" # GTK: Use wayland if available, fall back to x11 if not.

			"QT_QPA_PLATFORM,wayland;xcb" # QT: Use wayland if available, fall back to x11 if not.
			"QT_QPA_PLATFORMTHEME,qt5ct" # Tells Qt based applications to pick your theme from qt5ct, use with Kvantum.
			"QT_WAYLAND_DISABLE_WINDOWDECORATION,1" # Disables window decorations on Qt applications
			"QT_AUTO_SCREEN_SCALE_FACTOR,1" # Enables automatic scaling, based on the monitor’s pixel

			"XDG_CURRENT_DESKTOP,Hyprland"
			"XDG_SESSION_TYPE,wayland"
			"XDG_SESSION_DESKTOP,Hyprland"

			"HYPRSHOT_DIR,~/Pictures/screenshots" # Set Hyprshot to save to specific directory
		];
	};

}