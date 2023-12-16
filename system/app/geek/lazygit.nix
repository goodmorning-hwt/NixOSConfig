{config, pkgs, ...}:

{
	home.packages = with pkgs; [
		git
	  lazygit
	];

	programs.lazygit = {
		enable = true;
	};

  
}
