{ config, pkgs, ... }:

{

    services.printing.enable = true; # Enable CUPS to print documents.
    services.printing.drivers = with pkgs; [ # Printer packages to include:
        gutenprint
        hplip
        splix
    ];

    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

}
