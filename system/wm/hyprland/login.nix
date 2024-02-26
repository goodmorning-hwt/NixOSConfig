{confi, pkgs, ...}:

{

	home.packages = with pkgs; [
    pipewire
    
	];

  programs.wofi = {
    enable = true;
    package = wofi;
     
  };

  programs.emacs = {
    enable = true;
  };

}
