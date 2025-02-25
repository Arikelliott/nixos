{ inputs, config, pkgs, ... }:

{

	programs.tmux.extraConfig = ''
		# # Default pane border
		# set -g pane-border-style fg=blue

		# # Active pane border
		# set -g pane-active-border-style fg=yellow

		# # Status bar colors
		# set -g status-style bg=color8,fg=color7

		# [ -n tmux show -gqv "$1" ] && tmux show -gqv "$1" || echo "$2"

		# tmux set-option -gq "$1" "$2"

		bob='echo "joe"'

		set-option -g status-right "$bob"
	'';

}
