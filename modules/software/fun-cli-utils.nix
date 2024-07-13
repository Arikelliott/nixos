{ config, pkgs, ... }:

{

	environment.systemPackages = with pkgs; [
	
	feh # A light-weight image viewer.
    figlet # Generate ASCII word art.
    gallery-dl # Download images galleries from image hosting sites.
    yt-dlp # Youtube/video downloader, youtube-dl fork.
    ytfzf # Find, download, and watch Youtube videos from the terminal.
    glow # Utility for rendering Markdown in the terminal.
    neofetch # System info fetcher and snowflake displayer.

	];

}