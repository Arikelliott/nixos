{ pkgs, ... }:

{

	environment.systemPackages = with pkgs; [
		poetry # Python dependency manager
		python313 # Python 3.13
    ];

}
