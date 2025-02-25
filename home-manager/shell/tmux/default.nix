{ inputs, config, pkgs, ... }:

{

programs.tmux = {
	enable = true;
	mouse = true;
	baseIndex = 1;
	clock24 = false;
	newSession = true;
	prefix = "C-Space";
	terminal = "screen-256color";

	plugins = with pkgs; [
		tmuxPlugins.cpu # Shows CPU usage in status bar
		# tmuxPlugins.vim-tmux-navigator # Allows CTRL+hjkl for pane navigation, plus adds vim integration
		# tmuxPlugins.vim-tmux-focus-events # vim integration
		tmuxPlugins.tmux-fzf # Adds fzf integration
		# tmuxPlugins.power-theme # Powerline-style theme, might make my own later


		{
			plugin = tmuxPlugins.resurrect;
			extraConfig = "set -g @resurrect-strategy-nvim 'session'";
		}
		{
			plugin = tmuxPlugins.continuum;
			extraConfig = ''
				set -g @continuum-restore 'on'
				set -g @continuum-save-interval '60' # minutes
			'';
		}
	];

	extraConfig = ''
		# Do shift + r to reload config
		bind R source-file ~/.config/tmux/tmux.conf

		# Bind ctrl + f for launching fuzzy finder
		TMUX_FZF_LAUNCH_KEY="C-f"

		run ~/.config/tmux/tmux-theme.tmux
	'';

};

programs.fzf = {
	enable = true;
	tmux = {
		enableShellIntegration = true;
		shellIntegrationOptions = [ ];
	};
};

# imports = [
# 	./tmux-theme.nix
# ];

home.file = {
	".config/tmux/tmux-theme.tmux" = {
		enable = true;
		source = ./tmux-theme.tmux;
	};
};

}
