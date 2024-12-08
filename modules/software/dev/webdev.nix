{ pkgs, ... }:

{

	environment.systemPackages = with pkgs; [
	    # ruby_3_4
	    # jekyll # Static site generator engine
    ];

}
