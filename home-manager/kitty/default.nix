{ inputs, pkgs, lib, ... }:

{

    programs.kitty = {
        enable = true;
        font = {
            # package = pkgs.meslo-lgs-nf;
            # name = "Roboto";
            package = pkgs.dejavu_fonts;
            name = "DejaVu Sans";
            size = 10.0;
        };

        settings = {
            window_padding_width = 8;
            confirm_os_window_close = 0;
        };
    };

    imports = [
        ./kitty-color-theme-pywal.nix
        # ./kitty-color-theme.nix
    ];

}