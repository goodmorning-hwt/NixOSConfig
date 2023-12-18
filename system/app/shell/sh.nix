{config, pkgs, ...}:
let
  myAliases = {
    ll = "ls -l";
    ".." = "cd ..";
		ra = "joshuto";
		lg = "lazygit";
		nrs = "cd ~/.dotfiles && git add -A && sudo nixos-rebuild switch --flake ~/.dotfiles#goodmorninghwt";
		hms = "cd ~/.dotfiles && git add -A && home-manager switch --flake ~/.dotfiles";
		switch = "nrs && hms";
		doom = "~/.emacs.d/bin/doom";

  };
in
{
  
  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };

  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
  };

  
}
