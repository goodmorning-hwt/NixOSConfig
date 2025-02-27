{ confi, pkgs, ... }:

{

  home.packages = with pkgs; [
    # emacs
    ripgrep
    # optional dependencies
    coreutils # basic GNU utilities
    fd
    #    clana
    pandoc
    emacs-all-the-icons-fonts
    aspell
    aspellDicts.en
    cmigemo
    ispell
    #    cmake
    libtool
    libvterm
    fasd

    # == nixos layer ==
    nixfmt-rfc-style

  ];

  programs.emacs = {
    enable = true;
    # package = pkgs.emacs;
    package = pkgs.emacs30-pgtk;
  };

  # home.file.".spacemacs".source = ./spacemacs.el;

  /* The reason why I finally commentized this line and decided not to use nix to manage my .spacemacs
     but backing up the .spacemacs in nix is that
     I change my .spacemacs too often and using nix makes the procedure a little bit more tedious.
  */

}
