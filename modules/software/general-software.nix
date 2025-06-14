# Essential software to install on all systems

{ pkgs, inputs, ... }:

{

	programs.git = {
		enable = true; # Enable git
		config.init.defaultBranch = "main";
	};

	programs.nix-ld.enable = true;
	programs.vim = {
		enable = true;
	};

environment.systemPackages = with pkgs; [

	# CLI software
	gotop # Fancy top-like process viewer.
	htop # Top-like process viewer with a few more features.
	s-tui
	atop
	iftop
	iotop
	nvtopPackages.full
	pkgs.linuxPackages_latest.perf
	wavemon
	wget # Webpage downloader utility thing.
	tree # Shows contents of directories recursively.
	ranger # TUI file manager.
	tldr # Summarizes common commands for CLI utilities.
	lsof # Lists open files and the corresponding processes.
	# screen # Lets you have detachable shell sessions.
	fd # A simple, fast and user-friendly alternative to find.
	lynx # CLI web browser.
	nettools # Network control tools.
	nmap # Network discovery tool.
	netcat-openbsd # Network swiss-army knife.
	traceroute # IP packet route tracer.
	p7zip # 7zip implementation.
	unrar # RAR archive utility.
	unzip # .zip file utility.
	zip # .zip file utility.
	rclone # CLI syncing tool.
	ripgrep # Enhanced alternative to grep, I think.
	zoxide # A smart cd replacement.
	fzf # Fuzzy finder.
	eza # ls replacement
	bat # cat replacement
	tmux # Terminal multiplexer.
	dig
	wev # Get wayland keypresses in terminal
	xdg-ninja # Shell script which checks your $HOME for unwanted files and directories
	rdfind # Utility for finding and removing duplicate files
	wl-clipboard-rs # Wayland clipboard utilities, written in Rust

	# GUI software
	firefox
	keepassxc # KeePassXC password manager.
	kpcli # KeePass CLI utility.

	# git specific software
	gitui
	lazygit
];

}
