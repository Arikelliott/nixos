{ config, pkgs, ... }:

{

	environment.systemPackages = with pkgs; [
		adw-gtk3
	];

}
