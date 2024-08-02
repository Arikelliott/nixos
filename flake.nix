{
	description = "A very basic flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs @ { self, nixpkgs, home-manager, ... }: # Figure out what the "inputs@" bit does. Seems to work the same as without?
	{
		nixosConfigurations = {
			agrew = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = { inherit inputs; };
				modules = [
					./hosts/agrew
				];
			};

			forrester = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = { inherit inputs; };
				modules = [
					./hosts/forrester
				];
			};

			savannah = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = { inherit inputs; };
				modules = [
					./hosts/savannah
				];
			};

			shetland = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = { inherit inputs; };
				modules = [
					./hosts/shetland
				];
			};

			silvana = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = { inherit inputs; };
				modules = [
					./hosts/silvana
					home-manager.nixosModules.home-manager
				];
			};
		};
	};
}
