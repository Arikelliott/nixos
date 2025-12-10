{

users.users.anyara = {
	isNormalUser = true;
	initialPassword = "pw123";
	extraGroups = [ "wheel" "cdrom" "wireshark" ]; # Enable ‘sudo’ for the user using "wheel" group.
	uid=1000; # Set User ID
};

nix.settings.trusted-users = [
	"root"
	"anyara"
	"@wheel"
];

}
