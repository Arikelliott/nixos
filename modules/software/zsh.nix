{ pkgs, ... }:

{

	programs.zsh.enable = true; # Enable zsh.
	users.defaultUserShell = pkgs.zsh; # Set zsh as default shell.
	environment.pathsToLink = [ "/share/zsh" ];
	programs.starship.enable = true;

	environment.systemPackages = [
		pkgs.starship
	];

}
