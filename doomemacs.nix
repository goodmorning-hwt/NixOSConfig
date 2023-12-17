{config, pkgs, ...}:

{
  
	home.packages = with pkgs; [
	# emacs
    ripgrep
    # optional dependencies
    coreutils # basic GNU utilities
    fd
#    clang
	];

  programs.emacs = {
    enable = true;
    package = pkgs.emacs;  # replace with pkgs.emacs-gtk, or a version provided by the community overlay if desired.
  };
  
}
