{ config, pkgs, ... }:

{

	environment.systemPackages = with pkgs; [
	
	radeontop # AMDGPU utilization tool.
    amdgpu_top # AMD GPU CLI monitoring tool.
    lact # AMDGPU GUI software. *****

	];

}