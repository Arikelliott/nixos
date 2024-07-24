{ config, pkgs, ... }:

{

    environment.systemPackages = with pkgs; [
        materia-theme
        catppuccin
        catppuccin-gtk
		
	];

}