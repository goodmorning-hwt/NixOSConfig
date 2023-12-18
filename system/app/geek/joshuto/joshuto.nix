{config, pkgs, ...}:

{
	home.packages = with pkgs; [
	# My Hyperland Packages
		joshuto
		cargo
		rustc
		xclip
		fzf
		bat
		zoxide
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
