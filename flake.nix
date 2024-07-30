{
	description = "A very basic flake";

	inputs = {
		nixpkgs = {
			url = "github:nixos/nixpkgs/nixos-24.05";
		};

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, ... }: {

		nixosConfigurations = {
			agrew = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./hosts/agrew
				];
			};

			forrester = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./hosts/forrester
				];
			};

			savannah = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./hosts/savannah
				];
			};

			shetland = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./hosts/shetland
				];
			};

			silvana = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./hosts/silvana
				];
			};
		};
	};
}
