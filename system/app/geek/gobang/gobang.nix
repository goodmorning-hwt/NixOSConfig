{confi, pkgs, ...}:

{

	home.packages = with pkgs; [
    # gobang
	];


  home.file.".config/gobang/config.toml".source = ./config.toml;

}
