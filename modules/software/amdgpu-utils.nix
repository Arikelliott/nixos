{ config, pkgs, ... }:

{

	hardware.amdgpu.amdvlk.enable = true;

	environment.systemPackages = with pkgs; [

	radeontop # AMDGPU utilization tool.
	amdgpu_top # AMD GPU CLI monitoring tool.
	lact # AMDGPU GUI software. *****
	vulkan-tools # Utils for Vulkan
	# vulkan-cts # Vulkan conformance tests I guess

	];

}
