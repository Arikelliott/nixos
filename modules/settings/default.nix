{ pkgs, ... }:

{

	systemd.enableEmergencyMode = false;

	programs.gnupg.agent = {
		enable = true;
	};

	nix = {
		settings = {
			experimental-features = [ "nix-command" "flakes" ]; # Enable flakes and nix-command.
			warn-dirty = false;
		};
		settings.auto-optimise-store = true;
		gc = {
			automatic = true;
			dates = "weekly";
		};
	};

# - Enable support for unpatched dynamic binaries on NixOS -
	programs.nix-ld.enable = true;

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
		nil # Language server for Nix.

	];

}
