{ inputs, ... }:

	# My Nixvim config
	# See https://nix-community.github.io/nixvim/24.11/ for more info on configuration

{

	imports = [
		# Import nixvim
		inputs.nixvim.nixosModules.nixvim
		# ./bufferline.nix
	];

	programs.nixvim = {
		enable = true;
		defaultEditor = true;
		colorschemes.catppuccin.enable = true;

		plugins = {
			lualine.enable = true;
			bufferline.enable = true;
			web-devicons.enable = true;



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
	};

}
