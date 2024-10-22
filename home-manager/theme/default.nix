{ config, pkgs, extraSpecialArgs, ... }:

{
    gtk = {
        enable = true;
        theme = {
            package = pkgs.whitesur-gtk-theme;
            name = "WhiteSur-Light";
        };
    };
}
