{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Video Server
    plex

    # Ebook reader
    kavita
    suwayomi-server

    # Download Clien
    transmission
    qbittorrent
  ];

}
