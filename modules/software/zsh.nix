{ config, pkgs, ... }:

{

    programs.zsh.enable = true; # Enable zsh.
    users.defaultUserShell = pkgs.zsh; # Set zsh as default shell.

}