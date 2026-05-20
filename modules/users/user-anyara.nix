{ pkgs, ... }:

{

users.users.anyara = {
	isNormalUser = true;
	initialPassword = "pw123";
	extraGroups = [ "wheel" "cdrom" "wireshark" ]; # Enable ‘sudo’ for the user using "wheel" group.
	uid=1003; # Set User ID

	packages = (with pkgs; [
		nautilus
		nautilus-open-any-terminal
		sushi
		chromium
	]);
};

nix.settings.trusted-users = [
	"root"
	"anyara"
	"@wheel"
];

}
