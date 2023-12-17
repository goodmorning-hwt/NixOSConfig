{config, pkgs, ...}:

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
		cmigemo
		ispell
	];

  programs.emacs = {
    enable = true;
    package = pkgs.emacs;  # replace with pkgs.emacs-gtk, or a version provided by the community overlay if desired.
  };
	
  home.file.".spacemacs".source = ./spacemacs.el; 
  
}	
