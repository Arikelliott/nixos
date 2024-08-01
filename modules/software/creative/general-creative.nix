{ config, pkgs, ... }:

{

environment.systemPackages = with pkgs; [

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
    # calf # Open source audio plugins for musicians.
    # easyeffects # PipeWire audio effects.
    ffmpeg # Audio and video tool.
    ffmpegthumbnailer # Generates thumbnails of images and video for file browsers, etc.
    helvum # GTK Patchbay for PipeWire.
    mpv # Media player.
    obs-studio # Video recording software.
    strawberry # Music player app.
    # cura # Slicer for 3D printing.
    # freecad # Open-source CAD software.
    # openscad # Programmatic CAD software.

];

}