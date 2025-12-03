{
  pkgs,
  lib,
  config,
  ...
}: let
  sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "purple_leaves";
    themeConfig = {
    #   AccentColor = "#746385";
      FormPosition = "left";
    #   ForceHideCompletePassword = true;
    };
  };
in {
  environment.systemPackages = [
    sddm-astronaut
  ];

  services = {
    xserver.enable = true;
    displayManager = {
      sddm = {
        wayland.enable = true;
        enable = true;
        package = pkgs.kdePackages.sddm;
        theme = "sddm-astronaut-theme";
        extraPackages = [sddm-astronaut];
      };
      autoLogin = {
        enable = false;
        user = "arik";
      };
    };
  };
}
