{
	description = "A very basic flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# Add stuff to make Cosmic flake work. https://github.com/lilyinstarlight/nixos-cosmic
		nixpkgs.follows = "nixos-cosmic/nixpkgs"; # NOTE: change "nixpkgs" to "nixpkgs-stable" to use stable NixOS release
    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
	};

	outputs = inputs @ { self, nixpkgs, home-manager, nixos-cosmic, ... }: # Figure out what the "inputs@" bit does. Seems to work the same as without?
	{
		nixosConfigurations = {

			# Linode server.
			agrew = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = { inherit inputs; };
				modules = [
					./hosts/agrew
					home-manager.nixosModules.home-manager
				];
			};

			# Gateway laptop.
			forrester = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = { inherit inputs; };
				modules = [
					./hosts/forrester
					home-manager.nixosModules.home-manager
				];
			};

			# Dell laptop.
			savannah = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = { inherit inputs; };
				modules = [
					./hosts/savannah
					home-manager.nixosModules.home-manager
				];
			};

			# Dell Optiplex server.
			shetland = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = { inherit inputs; };
				modules = [
					./hosts/shetland
					home-manager.nixosModules.home-manager
				];
			};

			# Main desktop PC.
			silvana = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = { inherit inputs; };
				modules = [
					./hosts/silvana
					home-manager.nixosModules.home-manager

            # Begin Cosmic-related stuff
            # {
            #     nix.settings = {
            #         substituters = [ "https://cosmic.cachix.org/" ];
            #         trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
            #     };
            # }
            # nixos-cosmic.nixosModules.default
            # End Cosmic-related stuff

				];
			};
		};
	};
}
