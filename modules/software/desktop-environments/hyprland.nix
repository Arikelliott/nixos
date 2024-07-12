{

    # - Xserver -
    services.xserver.enable = true; # Enable X11 windowing system.

    # - Display Manager -
    # services.displayManager = {
        # sddm = { # Settings for SDDM display manager.
        #   enable = true; # Enable SDDM.
        #   # wayland.enable = true; # Enable experimental Wayland support.
        #   # theme = "sddm-chili-theme"; # Theme to use.
        #   autoNumlock = true; # Enable num lock.
        # };
    #   defaultSession = "hyprland"; # Set pre-selected session when starting display manager.
    # };

    services.xserver.displayManager = { # Disable LightDM default when no other display manager is enabled.
        lightdm.enable = false;
    };

    # - Hyprland
    programs.hyprland.enable = true; # Enable Hyprland.

    # - Policy Kit -
    security.polkit.enable = true;


    # - Disable xterm -
    services.xserver.desktopManager.xterm.enable = false;

    # --- Look up what this does
    # - XDG Portal Settings -
    xdg.portal = {
        enable = true;
        wlr.enable = true;
    };

}