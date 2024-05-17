# My NixOS Config
# Author: Arik Elliott

{ config, pkgs, ... }:

{

# -------- IMPORTS --------

# - Import Hardware Scan -
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

# - Other Imports -



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
  fileSystems."/home" = { # Mount home partition.
    device = "/dev/nvme1n1p4";
    fsType = "ext4";
    options = ["defaults"]; # Mount options (optional). NOTE: Use square brackets around string.
  };

  fileSystems."/home/arik/.mount/nas" = { # Mount NAS storage.
    device = "smorgasbord-server.lan:/home/arik/mount/nas";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" ]; # Enable lazy mounting. Only mounts when first accessed instead of at boot.
  };

# - Enable Swap File -
  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 16*1024;
  } ];



# -------- USER ACCOUNTS --------
  # Define your user accounts. Don't forget to set a password with ‘passwd’!

  users.users.arik = {
     isNormalUser = true;
     initialPassword = "pw123";
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user using "wheel" group.
   };



# -------- BASIC SYSTEM CONFIGURATION --------

# - NixOS -
  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ]; # Enable flakes and nix-command.
  };

# - Networking -
  networking.hostName = "silvana"; # Define your hostname.
  networking.networkmanager.enable = true;  # Enable NetworkManager
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain"; # Configure network proxy if necessary

# - System Time -
  time.timeZone = "America/Detroit"; # Set your time zone.

# - Keyboard and Localization -
  services.xserver.xkb.layout = "us"; # Configure keymap in X11.

# - Printing -
  services.printing.enable = true; # Enable CUPS to print documents.
  services.printing.drivers = with pkgs; [
    gutenprint
    hplip
    splix
  ];

# - Bluetooth -
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

# - Sound -
  # sound.enable = true; # Enable default ALSA sound.
  # security.rtkit.enable = true; # Enables RealtimeKit service, which handles scheduling?
  # hardware.pulseaudio.enable = true;

  # rtkit is optional but recommended
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

# - Mouse Input -
  # services.xserver.libinput.enable = true; # Enable touchpad support (enabled default in most desktopManager).

# - Drawing Tablets -
  hardware.opentabletdriver.enable = true; # Enable OpenTabletDriver.

# - Shell -
  programs.zsh.enable = true; # Enable zsh.
  users.defaultUserShell = pkgs.zsh; # Set zsh as default shell.

# - SSH -
  services.openssh.enable = true; # Enable the OpenSSH daemon.
  programs.ssh.enableAskPassword = false; # Disable Askpass (hopefully)

# - Firewall -
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

# - Extra Init Commands -
# This is for running shell commands on startup. All commands should be compatible with basic `sh` rather than bash.
  # environment.extraInit = "
  #   unset -v SSH_ASKPASS
  # ";
  # unset -v SSH_ASKPASS - Disables Askpass variable on startup so it won't bring up dialog for git and ssh.



# -------- DESKTOP ENVIRONMENT CONFIGURATION --------

# - Xserver -
  services.xserver.enable = true; # Enable X11 windowing system.

# - Display Manager -
  services.displayManager = {
    # gdm.enable = true; # Enable GNOME Display Manager.
    # lightdm.enable = true; # Enable LightDM.
    sddm = { # Settings for SDDM display manager.
      enable = true; # Enable SDDM.
      # wayland.enable = true; # Enable experimental Wayland support.
      # theme = "sddm-chili-theme"; # Theme to use.
      autoNumlock = true; # Enable num lock.
    };
    defaultSession = "hyprland"; # Set pre-selected session when starting display manager.
  };

# - Desktop Environment List: - 
  # - GNOME # --- Currently disabled!
  # services.xserver.desktopManager.gnome.enable = true; # Enable GNOME.
  # environment.gnome.excludePackages = (with pkgs; [ # GNOME packages to exclude.
  # ]) ++ (with pkgs.gnome; [
  # ]);

  # - Hyprland
  programs.hyprland.enable = true; # Enable Hyprland.

  # - BSPWM
  # services.xserver.windowManager.bspwm.enable = true; # Enable BSPWM

# - Policy Kit -
  security.polkit.enable = true;

# - Disable xterm -
  services.xserver.desktopManager.xterm.enable = false;

# - XDG Portal Settings -
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };



# -------- SYSTEM SERVICES --------
# NOTE: NixOS will install the required packagaes to make a service work even if
# the package isn't specified in the packages list!
# Find a list of services at: https://search.nixos.org/options?channel=23.11&show=jdk&size=50&sort=relevance&type=packages&query=jdk

# - ckb-next -
  hardware.ckb-next.enable = true; # Enable ckb-next daemon.

# - OpenRGB -
  services.hardware.openrgb.enable = true; # Enable OpenRGB daemon and other options.
  # services.hardware.openrgb.motherboard = "amd"; # Ensure it's using AMD modules (should be automatically though).

# - APC UPS Daemon -
  services.apcupsd.enable = true;

# - Docker -
  virtualisation.docker.enable = true; # Enable docker.
  users.extraGroups.docker.members = [ "arik" ]; # List user accounts with Docker access.
  # virtualisation.docker.rootless = { # Make docker run in a rootless mode for security reasons.
  #   enable = true;
  #   setSocketVariable = true;
  # };

# - Flatpak -
  services.flatpak.enable = true; # Enable Flatpak.

# - Spotify -
  services.spotifyd.enable = true; # Enable Spotify daemon.

# - Steam -
  programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
};

# - git -
  programs.git = {
    enable = true; # Enable git
    # userName  = "Arikelliott";
    # userEmail = "arikelliott@protonmail.com";
    config.init.defaultBranch = "main";
    # };
  };

# - Java -
  programs.java.enable = true;



# -------- SYSTEM PACKAGES --------
# Find a list of packages at: https://search.nixos.org/packages?channel=23.11&show=jdk&size=50&sort=relevance&type=packages&query=jdk

# - Enable non-free software packages -
  nixpkgs.config.allowUnfreePredicate = _: true;

# - Insecure Package List -
  nixpkgs.config = {
    allowInsecure = true;
    permittedInsecurePackages = [
      "electron-25.9.0"
    ];
  };


# - System Package List -
  environment.systemPackages = with pkgs; [

# Main CLI Tools:
    btop # Fancy top-like process viewer.
    gotop # Fancy top-like process viewer.
    htop # Top-like process viewer with a few more features.
    wget # Webpage downloader utility thing.
    tree # Shows contents of directories recursively.
    ranger # TUI file manager.
    # yazi # TUI file manager, maybe more feature-rich than Ranger.
    # zoxide # "Smart" cd replacement.
    tldr # Summarizes common commands for CLI utilities.
    lsof # Lists open files and the corresponding processes.
    screen # Lets you have detachable shell sessions.
    fd # A simple, fast and user-friendly alternative to find.
    feh # A light-weight image viewer.
    figlet # Generate ASCII word art.
    gallery-dl # Download images galleries from image hosting sites.
    yt-dlp # Youtube/video downloader, youtube-dl fork.
    ytfzf # Find, download, and watch Youtube videos from the terminal.
    # gifsicle # CLI tool for editing and making GIFs.
    glow # Utility for rendering Markdown in the terminal.
    lynx # CLI web browser.
    # mlocate # Index and search utility.
    neofetch # System info fetcher and snowflake displayer.
    nettools # Network control tools.
    nmap # Network discovery tool.
    netcat-openbsd # Network swiss-army knife.
    traceroute # IP packet route tracer.
    radeontop # AMDGPU utilization tool.
    # lzop # File compression tool.
    p7zip # 7zip implementation.
    unrar # RAR archive utility.
    unzip # .zip file utility.
    zip # .zip file utility.
    pywal # Color scheme generator/switcher.
    rclone # CLI syncing tool.
    ripgrep # Enhanced alternative to grep, I think.
    # ripgrep-all # ripgrep with more features.
    # socat # Some fancy data redirection tool.
    stow # Symlink/dotfiles manager.
    zsh # Z Shell.
    # zsh-powerlevel10k # Powerlevel10k theme for zsh.
    amdgpu_top # AMD GPU CLI monitoring tool.
    # netscanner # Network scanning tool. NOTE: Unstable only currently
    zoxide # A smart cd replacement.

# Admin/Desktop Tools:
    kitty # My preferred terminal program.
    baobab # Like WinDirStat. GTK graphical file usage viewer.
    gparted # GUI disk partitioning tool.
    font-manager # Font viewing app.
    gucharmap # GNOME character map viewer.
    galculator # GTK Calculator.
    grsync # GUI rsync wrapper.
    kdiff3 # Diff and merge up to 3 files or directories at once.
    meld # GTK diff and merge tool.
    lact # AMDGPU GUI software. *****
    dunst # Standalone notificatin manager for WMs.
    grim # Wayland screenshot utility.
    hyprshot # hyprland screenshot utility.
    # grimblast # Replacing hyprshot?
    scrot # Another screen capture utility.
    slurp # Wayland region selector utility.
    wf-recorder # Wayland screen recorder.
    hyprpicker # Wayland color picker.
    swww # Fancy Wayland wallpaper setter and daemon.
    waypaper # GUI frontend for swww.
    loupe # GUI Image Viewer.
    nwg-look # Wayland alternative to lxappearance.
    cinnamon.nemo-with-extensions # Nemo file explorer
    cinnamon.nemo-fileroller
    # xfce.thunar # Thunar file explorer.
    remmina # Remote desktop client.
    rofi-wayland # Wayland fork of Rofi app launcher.
    waybar # Wayland bar.
    wireshark # Packet analyzer.
    wlr-randr # Wayland xrandr clone.
    wshowkeys # Shows keys being pressed (Wayland session only).

# System Utilities:
    cdrtools # CD, DVD, and Blu-Ray burning tools.
    libisoburn # CD burning tool.
    # mtools # Utilities to access MS-DOS disks.
    # ntfs3g # NTFS filesystem driver.
    usbutils # Tools for working with USB devices, such as lsusb.
    smartmontools # Hard drive health monitoring tools.
    ckb-next # Handles Corsair input devices/RGB/etc.
    # exfatprogs # exFAT filesystem utilities.
    foomatic-db-engine # A big set of utilities for printing.
    ghostscript # Postscript interpreter for PDFs and stuff.
    # jdk # Java 19, main release of Java on NixOS. May include other Java versions too?
    libsForQt5.polkit-kde-agent # KDE polkit agent.
    bottles # User-friendly wrapper for WINE.
    pwvucontrol # Pipewire volume control interface.

# Social:
    discord # The popular chat app for lit gamers.
    betterdiscordctl # Discord client modder.
    irssi # Terminal-based IRC client.

# Gaming:
    prismlauncher # Minecraft instance manager.
    mangohud # Game stat overlay software.

# Productivity:
    firefox
    chromium
    obsidian # Personal note-taking and thought organizing app.
    # calibre # E-reader
    # evince # All-purpose document viewer (PDFs, etc.).
    cura # Slicer for 3D printing.
    # freecad # Open-source CAD software.
    # openscad # Programmatic CAD software.
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim # Extensible vim fork.
    vscodium # Fancy GUI IDE.
    xfce.mousepad # basic text editor from XFCE.
    hugo # Static website generator.

# Media:
    audacity # Audio editing suite.
    lmms # Linux music production software.
    libsForQt5.kdenlive # KDE's video editor.
    # ft2-clone # Fasttracker II clone.
    furnace # Chiptune tracker.
    # goattracker # Commodore 64 tracker.
    # klystrack # C64/Amiga/NES tracker.
    blender-hip # HIP/ROCm version of Blender?
    # blender # 3D Modeling software.
    inkscape # Vector illustration program.
    krita # Photo editing and painting program.
    spotify # Want a break from the ads? Try Spotify Premium!
    # calf # Open source audio plugins for musicians.
    # easyeffects # PipeWire audio effects.
    ffmpeg # Audio and video tool.
    ffmpegthumbnailer # Generates thumbnails of images and video for file browsers, etc.
    helvum # GTK Patchbay for PipeWire.
    mpv # Media player.
    obs-studio # Video recording software.
    strawberry # Music player app.

# Fonts and Themes:
    noto-fonts # Google's universal font.
    font-awesome # scalable vector icon font.
    nerdfonts # Giant nerd font package.
    jetbrains-mono
    corefonts # Microsoft's TTF core fonts for the web.
    materia-theme # Materia GTK theme.
    material-icons # Google's Material icons.
    papirus-icon-theme
  ];

# - User Package Lists

  # - Arik's packages
  users.users.arik.packages = with pkgs; [ # Install these packages for this single user.
    # example-package
  ];

# - Other -
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };













# -------- SYSTEM STATE --------

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}

