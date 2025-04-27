{ pkgs, ... }:

{

	environment.systemPackages = with pkgs; [
		hugo
		# jekyll # Static site generator engine
	];

	# services.httpd = {
	# 	enable = true;

	#		virtualHosts."ariklego" = {
	#			listenAddresses = [
	#			"127.0.0.1"
	#			];
	#		documentRoot = "/home/arik/Documents/repos/ariklego.com/index.html";
	#		};
	# };

}
