{ inputs, lib, ... }:

# My Nixvim config
# See https://nix-community.github.io/nixvim/24.11/ for more info on configuration

{

	imports = [
		# Import nixvim
		inputs.nixvim.nixosModules.nixvim
	];

	programs.nixvim = {
		enable = true;
		defaultEditor = true;
		colorschemes.catppuccin.enable = true;

		opts = {
			number = true;
			relativenumber = false;
			undofile = true;

			tabstop = 4;
			shiftwidth = 4;
			expandtab = false;
			autoindent = true;
		};

		plugins = {
			lualine.enable = true;
			bufferline.enable = true;
			web-devicons.enable = true;
			nix.enable = true;
			nix-develop.enable = true;
			treesitter.enable = true; # I think it structures file syntax highlighting better?

			# Setup keybinds for oil, telescope, which-key
			oil.enable = true; # Menu for browsing files, etc
			telescope.enable = true; # fuzzy finder search for files and many other things
			which-key.enable = true; # Shows currently used keybinds. Not sure if it works for plugin keybinds

			wilder = {
			# 	# Popup menu for command suggestions (whenever you type :, /, or ?
				enable = true;
			# 	# enable_cmdline_enter = true;
				settings = {
					modes = [
						":"
						"/"
						"?"
					];
				};
				#options = {
				#	renderer = lib.nixvim.mkRaw ''
				#		wilder.popupmenu_renderer()
				#	'';
				#};
			};

			# Pair these together in the future:
			# - zen-mode
			# - twilight

			lsp = {
				enable = true;
				servers = {
					bashls.enable = true;
					cmake.enable = true;
					csharp_ls.enable = true;
					cssls.enable = true;
					dockerls.enable = true;
					html.enable = true;
					htmx.enable = true;
					jsonls.enable = true;
					lua_ls.enable = true;
					markdown_oxide.enable = true;
					nixd.enable = true;
				};
			};
		};
		clipboard = {
			providers.wl-copy.enable = true; # Use wl-copy for wayland and xsel for Xorg
			register = "unnamedplus";
		};
	};

}
