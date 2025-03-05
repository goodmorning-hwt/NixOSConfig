{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    clash-nyanpasu
    clash-verge-rev
  ];

  networking.proxy.default = "http://127.0.0.1:7890";
  networking.proxy.noProxy = "127.0.0.1,localhost";
}
