{ config, pkgs, ... }:

{
# -------- BOOTLOADER AND PARTITIONING --------

# - Setup Bootloader -
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

# - Mount Partitions -
#   fileSystems."/home/arik/.mount/nas" = { # Mount NAS storage.
#     device = "smorgasbord-server.lan:/home/arik/mount/nas";
#     fsType = "nfs";
#     options = [ "x-systemd.automount" "noauto" ]; # Enable lazy mounting. Only mounts when first accessed instead of at boot.
#   };


# - Enable Swap File -
  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 8*1024;
  } ];
}