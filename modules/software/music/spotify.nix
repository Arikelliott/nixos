{ pkgs, inputs, ... }:

{

    # services.spotifyd.enable = true; # Enable Spotify daemon.
	# environment.systemPackages = with pkgs; [
	#   spotify
	# ];

    imports = [
      inputs.spicetify-nix.nixosModules.default
    ];

    programs.spicetify = 
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;
      theme = spicePkgs.themes.text;

      colorScheme = "RosePineMoon";
    };
}
