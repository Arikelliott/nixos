{ pkgs, ... }:

{

    services.displayManager.sddm = {
        enable = true;
        package = pkgs.kdePackages.sddm;
        wayland.enable = true;
        autoNumlock = true;
#        theme = "${pkgs.sddm-astronaut}/share/sddm/themes/sddm-astronaut-theme";
		theme = "sddm-astronaut";
    };
    # services.displayManager.defaultSession = "hyprland";

    environment.systemPackages = with pkgs; [
        sddm-sugar-dark # broken currently, will need to manually add and edit the package
        sddm-astronaut #
        sddm-chili-theme

        libsForQt5.sddm
    ];

}

# Resources for figuring out the stupid theme:
# https://github.com/Zhaith-Izaliel/sddm-sugar-candy-nix
# https://github.com/Zhaith-Izaliel/zhaith-nixos-configuration/blob/5a86b49763bc0be480dfbd5e6dda8d13ce61f57a/modules/system/display-manager.nix#L73
# https://github.com/search?q=repo%3ASly-Harvey%2FNixOS%20sddm&type=code
