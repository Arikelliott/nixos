{

	nix = {
		settings.experimental-features = [ "nix-command" "flakes" ]; # Enable flakes and nix-command.
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

}