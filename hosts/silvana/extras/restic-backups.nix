{ config, pkgs, ... }:

{

	environment.systemPackages = with pkgs; [
		restic
	];
	
	
	
	# security.wrappers.restic = { # Run restic as non-root special user. Not sure if it's necessary or not?
	#   source = "${pkgs.restic.out}/bin/restic";
	#   owner = "restic";
	#   group = "users";
	#   permissions = "u=rwx,g=,o=";
	#	capabilities = "cap_dac_read_search=+ep";
	# };

	services.restic.backups."general" = {
		# IMPORTANT NOTE: Restic runs as root by default.
		# If it's not working, try doing ssh keys for root to the nas
		repository = "sftp:arik@192.168.50.3:/home/arik/mount/backups";
		paths = [
			"/var/lib"
			"/home/arik"
		];
		exclude = [
			"/home/arik/.mount/nas"
		];
		timerConfig = { # Follows systemd-timer rules.
			OnCalendar = "Mon,Wed,Fri *-*-* 7:*:*"; # Every mon/wed/fri at 7am.
			Persistent = true; 
		};
		passwordFile = "/etc/nixos/restic-password";
		initialize = true;
		pruneOpts = [
			"--keep-daily 2"
			"--keep-monthly 2"
		];
	};

}