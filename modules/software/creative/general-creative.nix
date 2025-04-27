{ config, pkgs, ... }:

{

environment.systemPackages = with pkgs; [

	audacity # Audio editing suite.
	lmms # Linux music production software.
	openutau # Open-source UTAU alternative.
	libsForQt5.kdenlive # KDE's video editor.
	# ft2-clone # Fasttracker II clone.
	furnace # Chiptune tracker.
	# goattracker # Commodore 64 tracker.
	# klystrack # C64/Amiga/NES tracker.
	blender-hip # HIP/ROCm version of Blender?
	# blender # 3D Modeling software.
	gimp # Raster editing program.
	inkscape # Vector illustration program.
	krita # Photo editing and painting program.
	# calf # Open source audio plugins for musicians.
	# easyeffects # PipeWire audio effects.
	davinci-resolve # Video editing program.
	# davinci-resolve-studio # Paid version of DaVinci. Doesn't include H264/265 support, convert with ffmpeg. https://wiki.nixos.org/wiki/DaVinci_Resolve#Cannot_import_video_file
	ffmpeg # Audio and video tool.
	ffmpegthumbnailer # Generates thumbnails of images and video for file browsers, etc.
	helvum # GTK Patchbay for PipeWire.
	mpv # Media player.
	obs-studio # Video recording software.
	strawberry # Music player app.
	# cura # Slicer for 3D printing.
	freecad-wayland # Open-source CAD software.
	# openscad # Programmatic CAD software.
	love # Love2D, a 2D game engine that used Lua scripting.
	libresprite # Pixel art software, FOSS fork of aseprite.
	blockbench # 3D modeling software (for Minecraft mainly)
	# aseprite # Pixel art software.

];

}
