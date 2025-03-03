{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    clash-nyanpasu
    clash-verge-rev
  ];
}
