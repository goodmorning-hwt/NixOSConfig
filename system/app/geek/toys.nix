{config, pkgs, ...}:

{
	home.packages = with pkgs; [
		neofetch
		neo-cowsay
    autojump
	];

	programs.autojump = {
		enable = true;
	};


}
