{ pkgs, ... }:

{

	programs.zsh.enable = true; # Enable zsh.
	users.defaultUserShell = pkgs.zsh; # Set zsh as default shell.
	environment.pathsToLink = [ "/share/zsh" ];

	environment.systemPackages = [
	pkgs.zsh-powerlevel10k
	];

}
