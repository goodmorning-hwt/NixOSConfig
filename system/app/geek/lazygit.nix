{config, pkgs, ...}:

{
	home.packages = with pkgs; [
		git
		git-lfs
	  lazygit
	];

	programs.lazygit = {
		enable = true;
	};


}
