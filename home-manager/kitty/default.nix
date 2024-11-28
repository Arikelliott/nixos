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

        themeFile = "Catppuccin-Mocha"; # For manually importing kitty themes
        settings = {
            # blue:
                color4 = "#04a5e5";
                color12 = "#04a5e5";
        };
    };

    # imports = [ # For making custom kitty themes
    #     # ./themes/kitty-color-theme-pywal.nix
    #     ./themes/kitty-color-theme-catppuccin-frappe.nix
    #     # ./themes/kitty-color-theme-nord.nix
    # ];

}
