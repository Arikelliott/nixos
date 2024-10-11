{ config, pkgs, ... }:

{

  networking.usePredictableInterfaceNames = false;

  networking.useDHCP = false; # Disable DHCP globally as we will not need it.
  # required for ssh?
  networking.interfaces.eth0.useDHCP = true;

  environment.systemPackages = with pkgs; [
    inetutils
    mtr
    sysstat
  ];

}