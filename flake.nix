{
	description = "A very basic flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
		nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nixvim = {
			url = "github:nix-community/nixvim/nixos-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
        };
		quickshell = {
			# add ?ref=<tag> to track a tag
			url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
			inputs.nixpkgs.follows = "nixpkgs-unstable"; # Needs to follow Unstable
		};
	};

	outputs = inputs @ { self, nixpkgs, nixpkgs-unstable, home-manager, ... }: # Figure out what the "inputs@" bit does. Seems to work the same as without?
	let
	system = "x86_64-linux";
	overlay-unstable = final: prev: {
		unstable = import nixpkgs-unstable {
		inherit system;
		config.allowUnfree = true;
		};

	};
	in {
		nixosConfigurations = {

			# Linode server.
			agrew = nixpkgs.lib.nixosSystem {
				inherit system;
		specialArgs = { inherit inputs; };
		modules = [
			({ ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
			./hosts/agrew
					home-manager.nixosModules.home-manager
				];
			};

			# Gateway laptop.
			forrester = nixpkgs.lib.nixosSystem {
				inherit system;
		specialArgs = { inherit inputs; };
		modules = [
			({ ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
					./hosts/forrester
					home-manager.nixosModules.home-manager
				];
			};

			# Dell laptop.
			savannah = nixpkgs.lib.nixosSystem {
				inherit system;
		specialArgs = { inherit inputs; };
		modules = [
			({ ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
					./hosts/savannah
					home-manager.nixosModules.home-manager
				];
			};

			# Dell Optiplex server.
			shetland = nixpkgs.lib.nixosSystem {
				inherit system;
		specialArgs = { inherit inputs; };
		modules = [
			({ ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
					./hosts/shetland
					home-manager.nixosModules.home-manager
				];
			};

			# Main desktop PC.
			silvana = nixpkgs.lib.nixosSystem {
				inherit system;
		specialArgs = { inherit inputs; };
		modules = [
			({ ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
					./hosts/silvana
					home-manager.nixosModules.home-manager
				];
			};
		};
	};
}
