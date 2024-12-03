{ pkgs, ... }:

{

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

	];

}
