{config, pkgs, ...}:

{
	home.packages = with pkgs; [
	  clash-verge	
	];

	programs.clash-verge = {
		enable = true;
		autoStart = true;
	};

  
}
