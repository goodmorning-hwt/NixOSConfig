{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
  	texliveFull
  	texlab



  ];

}
