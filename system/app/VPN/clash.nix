{config, pkgs, ...}:

{
	home.packages = with pkgs; [
	  # clash-verge	
	  clash-nyanpasu
	];

	# programs.clash-verge = {
	# 	enable = true;
	# 	autoStart = true;
	# };

  
}
