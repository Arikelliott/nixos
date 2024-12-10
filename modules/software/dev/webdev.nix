{ pkgs, ... }:

{

	environment.systemPackages = with pkgs; [
		hugo
	    # jekyll # Static site generator engine
    ];

}
