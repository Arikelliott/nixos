{ pkgs, ... }:

{

    services.displayManager.sddm = {
        enable = true;
	package = pkgs.kdePackages.sddm;
        wayland.enable = true;
        autoNumlock = true;
#        theme = "${pkgs.sddm-astronaut}/share/sddm/themes/sddm-astronaut-theme";
#        theme = "sddm-astronaut-theme";
	theme = "chili";

    };
    services.displayManager.defaultSession = "hyprland";

    environment.systemPackages = with pkgs; [
        sddm-sugar-dark # broken currently, will need to manually add and edit the package
        sddm-astronaut #
        sddm-chili-theme

        libsForQt5.sddm
    ];

}
