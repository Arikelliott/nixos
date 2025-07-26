{
imports =
	[
	./extra-hardware.nix
	./rgb.nix
	./apc-ups.nix
	./restic-backups.nix
	./vfio-config.nix
	./syncthing.nix

	#Adding to test stability
	./kernel.nix
	];
}
