{ pkgs, ... }:

{

	networking.firewall = {
		allowedTCPPorts = [ 5201 ];
	};

	environment.systemPackages = with pkgs; [
		# clpeak # openCL benchmarking tool
		iperf3d
		iperf
	];

}
