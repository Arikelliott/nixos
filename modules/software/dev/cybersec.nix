{ pkgs, ... }:

{

programs.wireshark.enable = true;

environment.systemPackages = with pkgs; [
    john
    ciscoPacketTracer8
    wireshark
];

}
