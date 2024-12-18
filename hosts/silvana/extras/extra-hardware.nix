{ ... }:

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
  fileSystems."/home" = { # Home partition - nvme1n1p1
    device = "/dev/disk/by-uuid/bdee067f-4213-4889-b0c8-f69d4f5f3e7f";
    fsType = "ext4";
    options = ["defaults"]; # Mount options (optional). NOTE: Use square brackets around string.
  };

  fileSystems."/home/arik/mount/adrive" = { # Mount 1TB HDD drive.
    device = "/dev/disk/by-uuid/aefc0e6c-76c9-462d-b154-861aa982bc4e";
    fsType = "ext4";
    options = ["defaults"];
  };

  fileSystems."/home/arik/mount/bdrive" = { # Mount 8TB HDD RAID drives.
    device = "/dev/disk/by-uuid/8f196129-06eb-4971-aa9f-c814b242353d";
    fsType = "ext4";
    options = ["defaults"];
  };

  boot.swraid.enable = true;


#  fileSystems."/home/arik/mount/cdrive" = { # Mount media drive.
#    device = "/dev/disk/by-uuid/5f1af9c5-135b-4d34-8801-25193480ea32";
#    fsType = "ext4";
#    options = ["defaults"];
#  };

  # fileSystems."/home/arik/mount/nas" = { # Mount NAS storage.
  #   device = "172.234.215.187:/home/arik/mount";
  #   fsType = "nfs";
  #   options = [ "x-systemd.automount" "noauto" ]; # Enable lazy mounting. Only mounts when first accessed instead of at boot.
  # };

#  fileSystems."/home/arik/mount/ddrive" = { # Windows SSD - nvme0n1p4
#    device = "/dev/disk/by-uuid/247a2b30-2819-4744-b05a-c68cbc94f431";
#    fsType = "ext4";
#    options = ["defaults"];
#  };


# - Enable Swap File -
  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 32*1024;
  } ];

# - Enable OpenCL support -
    hardware.amdgpu.opencl.enable = true;
}
