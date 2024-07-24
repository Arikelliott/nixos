{ config, pkgs, ... }:

{

	environment.systemPackages = with pkgs; [
		lua # Lua programming language
    ];

}