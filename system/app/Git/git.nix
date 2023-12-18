{config, pkgs, ...}:

{
	home.packages = with pkgs; [
	];


	
  home.file.".gitconfig".source = ./.gitconfig; 

  
}
