{ pkgs, ... }:

{

	services.syncthing = {
	enable = true;
	group = "users";
	user = "arik";
	dataDir = "/home/arik/Sync/default";
	configDir = "/home/arik/.config/syncthing";
	};

	environment.systemPackages = with pkgs; [
	syncthing
	];

	# Syncthing ports: 8384 for remote access to GUI
	# 22000 TCP and/or UDP for sync traffic
	# 21027/UDP for discovery
	# source: https://docs.syncthing.net/users/firewall.html
	networking.firewall.allowedTCPPorts = [ 8384 22000 ];
	networking.firewall.allowedUDPPorts = [ 22000 21027 ];

}
