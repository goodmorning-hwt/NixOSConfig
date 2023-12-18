{config, pkgs, ...}:

{
	home.packages = with pkgs; [
	];


	
	home.file.".config/ibus/rime" = {
		source = ../rime/rime; 
		recursive = true; 
	};
  
}
