{config, pkgs, ...}:

{
	home.packages = with pkgs; [
		joshuto
	];



	programs.joshuto = {
		enable = true;
	};

	
  home.file.".config/joshuto/keymap.toml".source = ./config/keymap.toml; 
	/*
	Cheat Sheet:
	rename: cw
	new shell:   :shell zsh
	*/

  
}
