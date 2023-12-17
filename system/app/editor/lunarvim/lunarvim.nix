{config, pkgs, ...}:

{
	home.packages = with pkgs; [
#		lunarvim
		git
		gnumake
		gcc
#		python311Full
#		python311Packages.pip
		nodejs
		neovim
		cargo
	];

}


