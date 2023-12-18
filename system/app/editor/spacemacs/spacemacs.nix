{config, pkgs, ...}:

{

	home.packages = with pkgs; [
	# emacs
    ripgrep
		exa
    # optional dependencies
    coreutils # basic GNU utilities
    fd
#    clana
		pandoc
		emacs-all-the-icons-fonts
		aspell
		cmigemo
		ispell
    cmake
    libtool
    libvterm
	];

  programs.emacs = {
    enable = true;
    package = pkgs.emacs;  # replace with pkgs.emacs-gtk, or a version provided by the community overlay if desired.
  };

  # home.file.".spacemacs".source = ./spacemacs.el;

  /*
  The reason why I finally commentized this line and decided not to use nix to manage my .spacemacs
  but backing up the .spacemacs in nix is that
  I change my .spacemacs too often and using nix makes the procedure a little bit more tedious.
  */ 

}
