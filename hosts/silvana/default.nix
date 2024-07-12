# My NixOS Config
# Author: Arik Elliott

{ config, pkgs, ... }:

{

# - Define your hostname -
  networking.hostName = "silvana";

# -------- IMPORTS --------

# - Import All Modules -
  imports =
    [

      # - Import configs exclusive to this host
      ./hardware-configuration.nix # Auto-generated hardware-config 
      ./extras # Manually added packages
      # Includes:

      # - Import General Settings
      ../../modules/settings/nix-settings.nix # NixOS-specific general settings
      ../../modules/settings/nix-maintenance.nix # NixOS maintenance settings
      ../../modules/settings/general-settings.nix # General Linux system maintenance
      ../../modules/settings/networking/default-networking-profile.nix # Basic universal networking settings
      ../../modules/localization/timezones/detroit.nix # Set time zone
      ../../modules/localization/default-localization-profile.nix # Set language, keyboard, etc.

      # - Import Users
      ../../modules/users/user-arik.nix # Add Arik
      ../../modules/users/service-users/user-restic.nix # Add user account for Restic service

      # - Import Software packages and settings -
      ../../modules/software/desktop-environments/hyprland.nix # Enable Hyprland
      ../../modules/software/networking/networkmanager.nix # Install NetworkManager
      ../../modules/software/networking/networking-utils.nix # Install and configure networking utilities
      ../../modules/software/cups-printing-profile.nix # Install CUPS printer drivers
      ../../modules/software/bluetooth-profile.nix # Install and enable bluetooth
      ../../modules/software/sound-modules/pipewire.nix # Install Pipewire for audio
      ../../modules/software/opentabletdriver.nix # Install OpenTabletDriver
      ../../modules/software/zsh.nix # Install and enable ZSH and its extra software
      ../../modules/software/ssh.nix  # Enable SSH
      ../../modules/software/docker/docker-enable.nix # Install and configure Docker
        ../../modules/software/docker/ollama.nix # Install and run Ollama docker container
      ../../modules/software/flatpak/flatpak-enable.nix # Install and configure Flatpak

    ];

# -------












# - Spotify -

# --- 
  services.spotifyd.enable = true; # Enable Spotify daemon.

# - Steam -

# --- Games Software Module
  programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
};

# - git -

# --- Default Software Module
  programs.git = {
    enable = true; # Enable git
    # userName  = "Arikelliott";
    # userEmail = "arikelliott@protonmail.com";
    config.init.defaultBranch = "main";
    # };
  };

# - Java -
  programs.java.enable = true;

# - Backups -

# --- Restic Software Module/Extra
  # security.wrappers.restic = { # Run restic as non-root special user. Not sure if it's necessary or not?
  #   source = "${pkgs.restic.out}/bin/restic";
  #   owner = "restic";
  #   group = "users";
  #   permissions = "u=rwx,g=,o=";
  #   capabilities = "cap_dac_read_search=+ep";
  # };

  services.restic.backups."general" = {
    repository = "sftp:arik@192.168.1.3:/home/arik/mount/backups";
    paths = [
      "/var/lib"
      "/home/arik"
    ];
    exclude = [
      "/home/arik/.mount/nas"
    ];
   timerConfig = { # Follows systemd-timer rules.
     OnCalendar = "Mon,Wed,Fri *-*-* 7:*:*"; # Every mon/wed/fri at 7am.
     Persistent = true; 
   };
    passwordFile = "/etc/nixos/restic-password";
    initialize = true;
    pruneOpts = [
      "--keep-daily 2"
      "--keep-monthly 2"
    ];
  };


# -------- SYSTEM PACKAGES --------
# Find a list of packages at: https://search.nixos.org/packages?channel=23.11&show=jdk&size=50&sort=relevance&type=packages&query=jdk

# --- General Settings Module
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
    # Cool CLI alt tools: top alternatives, fzf, tree, fd, glow, fetcher?, ripgrep, zoxide, exa, bat, 
    btop # Fancy top-like process viewer.
    gotop # Fancy top-like process viewer.
    htop # Top-like process viewer with a few more features.
    wget # Webpage downloader utility thing.
    tree # Shows contents of directories recursively.
    ranger # TUI file manager.
    # yazi # TUI file manager, maybe more feature-rich than Ranger.
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
    starship # Starship theme for zsh.
    # zsh-powerlevel10k # Powerlevel10k theme for zsh.
    amdgpu_top # AMD GPU CLI monitoring tool.
    # netscanner # Network scanning tool. NOTE: Unstable only currently
    zoxide # A smart cd replacement.
    eza # ls replacement
    bat # cat replacement
    restic # Restic backuo utility.
    tmux # Terminal multiplexer.
    xorg.xhost # Server access control program for X. (May be needed for Gparted?)
    dig

    fish

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
    lua # Lua programming language
    # libsForQt5.polkit-kde-agent # KDE polkit agent.
    lxqt.lxqt-policykit # LXQT polkit agent.
    bottles # User-friendly wrapper for WINE.
    pwvucontrol # Pipewire volume control interface.

# Social:
    # discord # The popular chat app for lit gamers. Disabled while testing out vesktop.
    vesktop # Modded discord desktop client.
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
    keepassxc # KeePassXC password manager.

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
    # corefonts # Microsoft's TTF core fonts for the web.
    materia-theme # Materia GTK theme.
    material-icons # Google's Material icons.
    papirus-icon-theme
  ];



  programs.gnupg.agent = {
    enable = true;
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

