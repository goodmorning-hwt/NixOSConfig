{config, pkgs, ...}:

{
	home.packages = with pkgs; [
		git
		vim
	];

  home.file."~/.vimrc".source = ./basic.vim; 
}


