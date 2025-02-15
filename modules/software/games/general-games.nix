{ pkgs, ... }:

{

	programs.steam = {
		enable = true;
		remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
		dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
	};



	environment.systemPackages = with pkgs; [
		prismlauncher # Minecraft instance manager.
		mangohud # Game stat overlay software.
		mindustry-wayland # Mindustry game
		heroic # Heroic game launcher
		# itch # itch.io launcher
	];

}
