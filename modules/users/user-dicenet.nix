{

users.users.dicenet = {
	isNormalUser = true;
	initialPassword = "pw123";
	extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user using "wheel" group.
	uid=1002; # Set User ID
};

nix.settings.trusted-users = [
	"root"
	"dicenet"
	"@wheel"
];

}
