{config, pkgs, ...}:

{
	home.packages = with pkgs; [
	# My Hyperland Packages
	  lazygit
		joshuto
	];

	programs.lazygit = {
		enable = true;
	};


	programs.joshuto = {
		enable = true;
		theme = {
		};
	};

	

  
}
