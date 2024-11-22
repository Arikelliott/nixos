{ pkgs, ... }:

{

  services.syncthing = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    syncthing
  ];

}
