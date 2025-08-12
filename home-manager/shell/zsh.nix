{ pkgs, ... }:

{
	programs.zsh = {
		enable = true;
		dotDir = ".config/zsh"; # Where zsh configs are stored
		# zprof.enable = true; # Runs at the beginning of a zsh session and prints out the time it takes for .zshrc commands to start

	enableCompletion = true; # Not exactly sure what this does honestly. Tab autocomplete seems to work with it set to false.
	autosuggestion = { # zsh autosuggestions
		enable = true;
		# highlight = ""; # Custom styles for autosuggestion highlighting. See zshzle(1) for syntax
		strategy = [ "history" "completion" ]; # Strategy is the style of autocomplete. Options are "history”, “completion”, “match_prev_cmd”, run in order.
	};
	syntaxHighlighting = { # Enable colored syntax highlighting for zsh commands
		enable = true;
		# List of highlighter types: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md[1]
		highlighters = [ "brackets" "pattern" "regexp" "cursor" "root" "line" ];
		patterns = {
		"rm -rf *" = "fg=white,bold,bg=red";
		};
	};
	# Environment variables to start session with:
	envExtra = ''
		# PATH="$PATH:/home/arik/.local/share/gem/ruby/3.0.0/bin"
		PATH="$PATH:/home/arik/.local/bin/"
	'';
	history = {
		append = true; # Adds new commands in history to list instead of overwriting?
		# expireDuplicatesFirst = true; # Removes duplicate entries before non-duplicates
		# exteneded = true; # Adds timestamps to history file
		ignoreAllDups = true; # Deletes old commands that are duplicates of new ones
		# ignorePatterns = [ "ll *" "l *" ]; # Enter shell patterns that will be ignored
		# ignoreSpace = false; # Ignore if the first character of a command is a space
		path = "$ZDOTDIR/.zsh_history"; # Where history file is stored
		# save = 10000; # Number of lines to save
		# size = 10000; # Number of lines to keep
		# share = false; # Share history between multiple zsh sessions
	};
	historySubstringSearch.enable = true; # Search for part of a previous command by typing a pattern and searching for commands with that pattern

	# Commands to add into .zshrc
	initContent = ''
		eval "$(starship init zsh)"

			# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
		#	exec tmux attach
		# fi

		autoload -Uz +X compinit && compinit

			## case insensitive path-completion
			zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
			zstyle ':completion:*' menu select
	'';

	# Commands added to .zprofile and .zlogout that run when starting or quitting a zsh session
	# profileExtra = "";
	# logoutExtra = "":

	# All your typical aliases
	shellAliases = {
		cbonsai = "cbonsai -li --time=0.5";
		cp = "cp -i";
		df = "df -H";
		free = "free -m";
		ranger = "ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd \"$LASTDIR\"";
		ls = "eza -A";
		lso = "eza -A --oneline";
		ll = "eza -Al";
		cat = "bat --theme=base16";
		lz = "lazygit";
		nixdev = "nix develop --command zsh";
		hyprland = "Hyprland";
		rm = "rm -I";
	};

	# Aliases that substitute any part of a command
	shellGlobalAliases = {
	};
	};

	imports = [
		./terminal-support.nix # Support for non-standard terminals
		./kitty-term-support.nix # Support for kitty specifically
	];
}
