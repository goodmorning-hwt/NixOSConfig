{config, pkgs, ...}:

{
	home.packages = with pkgs; [
		git
		git-lfs
        lazygit
        commitizen
			nodePackages.conventional-changelog-cli

	];

	programs.lazygit = {
		enable = true;
	};


}
