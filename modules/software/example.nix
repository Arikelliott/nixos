{ config, pkgs, ... }:

# An example of various config things.

{

# Adding both stable and unstable packages.
environment.systemPackages = (with pkgs; [

	chromium

])

++

(with pkgs.unstable; [

	zaz

]);

}
