{ pkgs, ... }:

{

	environment.systemPackages = with pkgs; [
	    clpeak # openCL benchmarking tool
    ];

}
