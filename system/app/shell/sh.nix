{config, pkgs, ...}:
let
  myAliases = {
    ll = "ls -l";
    ".." = "cd ..";
		ra = "joshuto";
		lg = "lazygit";
		nrs = "sudo nixos-rebuild switch --flake ~/.dotfiles#goodmorninghwt";
		hms = "home-manager switch --flake ~/.dotfiles";
		switch = "git add ~/.dotfiles && nrs && hms";
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
