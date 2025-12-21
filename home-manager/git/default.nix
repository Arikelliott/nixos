{ pkgs, ... }:

{

	programs.git.settings = {
		enable = true;
		userName	= "Arikelliott";
		userEmail = "20728146+Arikelliott@users.noreply.github.com";
		aliases = {
			cm = "commit";
			s = "status";
		};
	};

	programs.delta = {
		enable = true;
	};
}
