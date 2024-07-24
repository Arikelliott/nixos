{ config, pkgs, ... }:

{

environment.systemPackages = with pkgs; [

	# discord # The popular chat app for lit gamers. Disabled while testing out vesktop.
    # betterdiscordctl # Discord client modder.
    vesktop # Modded discord desktop client.
    irssi # Terminal-based IRC client.

];

}