{config, pkgs, ...}:

{
	home.packages = with pkgs; [
	librime
	];


	
	# home.file.".config/ibus/rime" = {
#		source = ../rime/rime; 
#		recursive = true; 
#	};
  
}
