{ pkgs, ... }:

{

	boot.loader.grub.theme = pkgs.sleek-grub-theme;

	environment.systemPackages = with pkgs; [
		sleek-grub-theme
	];

}
