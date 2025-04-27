{

	users.extraGroups.docker.members = [ "arik" ]; # List user accounts with Docker access.
	virtualisation = {
	docker.enable = true; # Enable docker.
	# docker.rootless = { # Make docker run in a rootless mode for security reasons.
	#	enable = true;
	#	setSocketVariable = true;
	# };
	};

}