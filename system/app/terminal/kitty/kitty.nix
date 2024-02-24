{config, pkgs, ...}:

{
	home.packages = with pkgs; [
		kitty
	  fira-code-nerdfont
	];

	programs.kitty = {
		enable = true;
    font = {
      size = 15;
      name = "FiraCode Nerd Font";
      package = pkgs.fira-code-nerdfont;
    };
    theme = "Tokyo Night Moon";

	};


}
