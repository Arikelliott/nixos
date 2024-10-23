{ pkgs, ... }:

{

environment.systemPackages = with pkgs; [

    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim # Extensible vim fork.
    # vscodium # Fancy GUI IDE.
    zed-editor # New IDE trying to replace vscodium.
    xfce.mousepad # basic text editor from XFCE.

];

}
