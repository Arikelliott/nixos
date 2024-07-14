{ config, pkgs, ... }:

{
# -------- BOOTLOADER AND PARTITIONING --------

# - Setup Bootloader -
  boot.loader = {
	  efi = {
	    canTouchEfiVariables = true; # Whether the installation process is allowed to modify EFI boot variables.
	  };
	  grub = { # Enable GRUB as bootloader.
	     enable = true;
	     efiSupport = true;
	     device = "nodev";
       useOSProber = true;
	  };
  };

# - Mount Partitions -
  fileSystems."/home/arik/.mount/nas" = { # Mount NAS storage.
    device = "smorgasbord-server.lan:/home/arik/mount/nas";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" ]; # Enable lazy mounting. Only mounts when first accessed instead of at boot.
  };


# - Enable Swap File -
  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 8*1024;
  } ];
}