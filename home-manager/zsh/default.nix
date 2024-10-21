{ inputs, pkgs, lib, ... }:

{
	programs.zsh = {
		enable = true;
		initExtraFirst = ''
            # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
            # Initialization code that may require console input (password prompts, [y/n]
            # confirmations, etc.) must go above this block; everything else may go below.
            if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
            source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
            fi

            # Enable p10k theme
            source ~/.config/powerlevel10k/powerlevel10k.zsh-theme

            # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
            [[ ! -f ~/.config/.p10k.zsh ]] || source ~/.config/.p10k.zsh
        '';
	};

	# Import p10k and theme.
	home.file = {
	   ".config/powerlevel10k" = {
			enable = true;
			source = ./powerlevel10k;
			recursive = true;
		};
		".config/p10k.zsh" = {
		    enable = true;
			source = ./.p10k.zsh;
		};
	};
}

# Things to use:
# syntaxHighlighting - There's a lot of cool stuff under this
# zsh-abbr - short abbreviations that get expanded into full text when you enter them
# shellAliases/shellGlobalAliases - set aliases. Global aliases get set anywhere in a line instead of substituting a command.
# sessionVariables - set variables
# localVariables - defined at top of .zshrc
# plugins - add zsh plugins. Has several extra options
#
#
#
#
# zsh files and their purposes: https://apple.stackexchange.com/questions/388622/zsh-zprofile-zshrc-zlogin-what-goes-where
# profileExtra - .zprofile
# loginExtra - .zlogin
# logoutExtra - .zlogout
# initExtra - .zshrc (also includes other options)
