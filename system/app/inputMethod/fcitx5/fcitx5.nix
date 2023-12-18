{config, pkgs, ...}:

{
	home.packages = with pkgs; [
	];



	home.file.".config/fcitx5/rime" = {
		source = ../rime;
		recursive = true;
	};

}
