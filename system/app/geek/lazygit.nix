{config, pkgs, ...}:

{
	home.packages = with pkgs; [
		git
		git-lfs
        lazygit
        commitizen
	];

	programs.lazygit = {
		enable = true;
	};


}
