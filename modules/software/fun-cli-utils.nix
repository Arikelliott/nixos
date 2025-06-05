{ config, pkgs, ... }:

{

	environment.systemPackages = (with pkgs; [

	feh # A light-weight image viewer.
	figlet # Generate ASCII word art.
	gallery-dl # Download images galleries from image hosting sites.
	ytfzf # Find, download, and watch Youtube videos from the terminal.
	glow # Utility for rendering Markdown in the terminal.
	neofetch # System info fetcher and snowflake displayer.
	cool-retro-term # An overly-fancy terminal emulator.
	spotdl # Spotify music downloader.
	onthespot # Spotify GUI music downloader.
	id3v2 # Music metadata viewing and editing tool.

	])

	++

	(with pkgs.unstable; [
		yt-dlp # Youtube/video downloader, youtube-dl fork.
	]);


}
