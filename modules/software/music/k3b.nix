{ config, lib, pkgs, ... }:

{

	# disabledModules = [ "services/programs/k3b.nix" ];

	# imports = [
	# 	<nixos-unstable/nixos/modules/services/programs/k3b.nix>
	# ];

	# programs.k3b.enable = true;

	security.wrappers = {
      cdrdao = {
        setuid = true;
        owner = "root";
        group = "cdrom";
        permissions = "u+wrx,g+x";
        source = "${pkgs.cdrdao}/bin/cdrdao";
      };
      cdrecord = {
        setuid = true;
        owner = "root";
        group = "cdrom";
        permissions = "u+wrx,g+x";
        source = "${pkgs.cdrtools}/bin/cdrecord";
      };
    };

	environment.systemPackages = with pkgs.unstable; [
		kdePackages.k3b
	];

}
