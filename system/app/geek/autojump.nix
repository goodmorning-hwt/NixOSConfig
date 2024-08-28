{config, pkgs, ...}:

{
	home.packages = with pkgs; [
    autojump
	];

	programs.autojump = {
		enable = true;
	};


}
