{ config, pkgs, ... }:

{

# --- RGB Module ---
    # - ckb-next -
    hardware.ckb-next.enable = true; # Enable ckb-next daemon.

    # - OpenRGB -
    services.hardware.openrgb.enable = true; # Enable OpenRGB daemon and other options.
    # services.hardware.openrgb.motherboard = "amd"; # Ensure it's using AMD modules (should be automatically though).


    environment.systemPackages = with pkgs; [
		# ckb-next # Handles Corsair input devices/RGB/etc.
    ];

}