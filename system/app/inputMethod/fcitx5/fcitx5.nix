{config, pkgs, ...}:

{
	home.packages = with pkgs; [
	];



	home.file.".config/fcitx5/rime" = {
		source = ../rime/rime;
		recursive = true;
	};

	home.file.".local/share/fcitx5/rime" = {
		source = ../rime/rime;
		recursive = true;
	};
}
