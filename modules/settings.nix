{ pkgs, ... }:

{

# - NIX STUFF -

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



# - NETWORKING -

	networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain"; # Configure network proxy if necessary
	# - Firewall -
	# Open ports in the firewall.
	# networking.firewall.allowedTCPPorts = [ ... ];
	# networking.firewall.allowedUDPPorts = [ ... ];
	# Or disable the firewall altogether.
	networking.firewall.enable = false;

# - SSH -

	services.openssh.enable = true; # Enable the OpenSSH daemon.
	programs.ssh.enableAskPassword = false; # Disable Askpass (hopefully)
	programs.ssh.startAgent = true;

# - PACKAGE STUFF -

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
		chezmoi # Cross-device dotfile manager.
		nil # Language server for Nix.
		nixd # Other language server for Nix.
		ntfs3g # Add NTFS drivers.

	];

}
