{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ccls
    gdb
    gdbgui
    libclang
  ];

}
