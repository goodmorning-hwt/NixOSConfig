{config, pkgs, ...}:

{
	home.packages = with pkgs; [
		neofetch
		neo-cowsay
    autojump
		foliate
		tdesktop
	];

	programs.autojump = {
		enable = true;
	};


}
