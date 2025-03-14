{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    joshuto
  ];

  programs.joshuto = {
    enable = true;
  };

  home.file.".config/joshuto/keymap.toml".source = ./config/keymap.toml;
  home.file.".config/joshuto/icons.toml".source = ./config/icons.toml;
  home.file.".config/joshuto/joshuto.toml".source = ./config/joshuto.toml;
  home.file.".config/joshuto/bookmarks.toml".source = ./config/bookmarks.toml;
  home.file.".config/joshuto/mimetype.toml".source = ./config/mimetype.toml;
  home.file.".config/joshuto/theme.toml".source = ./config/theme.toml;
  home.file.".config/joshuto/preview_file.sh".source = ./config/preview_file.sh;
  /*
    	Cheat Sheet:
    	rename: cw
    	new shell:   :shell zsh
  */

}
