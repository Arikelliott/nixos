{ inputs, pkgs, lib, ... }:

{
	programs.zsh = {
		enable = true;
	};

	# Import p10k and theme.
	home.file = {
	 #   ".config/powerlevel10k" = {
		# 	enable = true;
		# 	source = ./powerlevel10k;
		# 	# recursive = true;
		# };
		# ".config/p10k.zsh" = {
		#     enable = true;
		# 	source = ./.p10k.zsh;
		# };
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
