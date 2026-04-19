{
	description = "A very basic flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
		nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nixvim = {
			url = "github:nix-community/nixvim/nixos-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
        };
		noctalia = {
			url = "github:noctalia-dev/noctalia-shell";
			inputs.nixpkgs.follows = "nixpkgs-unstable";
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

			# Main desktop PC.
			silvana = nixpkgs.lib.nixosSystem {
				inherit system;
				specialArgs = { inherit inputs; };
				modules = [
					({ ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
					./hosts/silvana
					home-manager.nixosModules.home-manager
					./noctalia.nix
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
					./noctalia.nix
				];
			};

			# --- RETIRED CONFIGS ---
			# Agrew - Linode server
			# Forrester - old Gateway laptop
			# Shetland - old Dell Optiplex homeserver
		};
	};
}
