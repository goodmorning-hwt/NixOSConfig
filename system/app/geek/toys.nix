{config, pkgs, ...}:

{
	home.packages = with pkgs; [
		neofetch
		neo-cowsay
	];



}
