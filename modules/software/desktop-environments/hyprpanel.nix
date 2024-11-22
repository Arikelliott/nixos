{ config, pkgs, ... }:

{

    environment.systemPackages = with pkgs; [
        pipewire
        libgtop
        bluez
        bluez-tools
        wl-clipboard
        dart-sass
        brightnessctl
        networkmanager
        gnome-bluetooth_1_0
        python313
        gpustat
        pywal16
        power-profiles-daemon
        grimblast
        gpu-screen-recorder
        hyprpicker
        hyprsunset
        hypridle
        btop
        matugen
        swww
    ];

}
