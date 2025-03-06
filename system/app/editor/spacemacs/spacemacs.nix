{ config, pkgs, ... }:

{
  # fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    # nerdfonts._0xproto
    ripgrep
    coreutils # basic GNU utilities
    fd
    cmake
    pandoc
    emacs-all-the-icons-fonts
    aspell
    aspellDicts.en
    cmigemo
    ispell
    libtool
    libvterm
    fasd

    # == nodejs ==
    nodejs
    nodePackages.npm

    # == nixos layer ==
    nixfmt-rfc-style
    nixd

  ];

  programs.emacs = {
    enable = true;
    # package = pkgs.emacs;
    package = pkgs.emacs30-pgtk;
  };

  # home.file.".spacemacs".source = ./spacemacs.el;

  /*
    The reason why I finally commentized this line and decided not to use nix to manage my .spacemacs
    but backing up the .spacemacs in nix is that
    I change my .spacemacs too often and using nix makes the procedure a little bit more tedious.
  */

}
