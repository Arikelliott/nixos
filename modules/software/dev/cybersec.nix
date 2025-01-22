{ pkgs, ... }:

{

environment.systemPackages = with pkgs; [
    john
    ciscoPacketTracer8
];

}
