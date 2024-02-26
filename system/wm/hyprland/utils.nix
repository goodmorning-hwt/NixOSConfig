{confi, pkgs, ...}:

{

	home.packages = with pkgs; [
    pipewire
    
	];

  programs.wofi = {
    enable = true;
    package = wofi;
    # setting = ;
    # style = ;
     
  };

  programs.emacs = {
    enable = true;
    # package = pkgs.emacs;  # replace with pkgs.emacs-gtk, or a version provided by the community overlay if desired.
    package = pkgs.emacs29-gtk3;  # replace with pkgs.emacs-gtk, or a version provided by the community overlay if desired.
  };

}
