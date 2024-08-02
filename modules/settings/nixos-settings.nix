{ pkgs, ... }:

{

	nix = {
		settings = {
			experimental-features = [ "nix-command" "flakes" ]; # Enable flakes and nix-command.
			warn-dirty = false;
		};
	};

# - Enable non-free software packages -
	nixpkgs.config.allowUnfreePredicate = _: true;

# - Insecure Package List -
	nixpkgs.config = {
		allowInsecure = true;
		permittedInsecurePackages = [
			"electron-25.9.0"
		];
	};

	environment.systemPackages = with pkgs; [

    home-manager # Install Home Manager.

	];

}