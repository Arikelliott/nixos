{ pkgs, ... }:

{

    services.spotifyd.enable = true; # Enable Spotify daemon.

	environment.systemPackages = with pkgs; [

    spotify

	];

}
