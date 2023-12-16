{config, pkgs, ...}:

{
	home.packages = with pkgs; [
	# My Hyperland Packages
	  lazygit
	];

	programs.lazygit = {
		enable = true;
	};



	

  
}
