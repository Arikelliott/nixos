{ inputs, config, pkgs, ... }:

{

programs.tmux = {
	enable = true;
	mouse = true;
};

}
