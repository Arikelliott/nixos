{ config, pkgs, ... }:

{
# -------- BOOTLOADER AND PARTITIONING --------

# - Setup Bootloader -
    # Use the systemd-boot EFI boot loader.
    boot.loader = {
        efi = {
            canTouchEfiVariables = true;
        };
        grub = {
            enable = true;
            efiSupport = true;
            device = "nodev";
            useOSProber = true;
        };
    };

# - Mount Partitions -
    fileSystems."/home/arik/mount" = { # Mount NAS partition.
        device = "/dev/sdb1";
        fsType = "ext4";
        options = ["defaults"]; # Mount options (optional). NOTE: Use square brackets around string.
    };

    services.nfs.server.enable = true;
    services.nfs.server.exports = "
        /home/arik/mount         192.168.50.0/24(rw,fsid=0,no_subtree_check)
    ";
}
