{ pkgs, ... }:

{

	services.gvfs.enable = true; # Mount, trash, and other functionalities
	services.tumbler.enable = true; # Thumbnail support for images

	environment.systemPackages = with pkgs; [

	cdrtools # CD, DVD, and Blu-Ray burning tools.
	libisoburn # CD burning tool.
	# mtools # Utilities to access MS-DOS disks.
	# ntfs3g # NTFS filesystem driver.
	usbutils # Tools for working with USB devices, such as lsusb.
	smartmontools # Hard drive health monitoring tools.
	exfatprogs # exFAT filesystem utilities.
	foomatic-db-engine # A big set of utilities for printing.
	ghostscript # Postscript interpreter for PDFs and stuff.
	# jdk # Java 19, main release of Java on NixOS. May include other Java versions too?
	gvfs # Virtual Filesystem support library

	];

}
