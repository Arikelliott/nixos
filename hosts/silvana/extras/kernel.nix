{ config, pkgs, ... }:

{
	#Switch to older Linux kernel temporarily
	boot.kernelPackages = pkgs.linuxPackages_latest;
}
