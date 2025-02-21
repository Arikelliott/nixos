{ inputs, pkgs, lib, ... }:

{
    imports = [
	    ./zsh.nix # Activate zsh config
		./zoxide.nix # Support for zoxide integration
		./tmux # tmux settings
	];
}
