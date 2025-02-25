{config, pkgs, ...}:
let
  myAliases = {
	 mkdir = "mkdir -p";
    ll = "ls -l";
    ".." = "cd ..";
		ra = "joshuto";
		lg = "lazygit";
		update_spacemacs_dotfile = "cd ~/.dotfiles/system/app/editor/spacemacs && trash spacemacs.el.bk && mv ./spacemacs.el ./spacemacs.el.bk && cp ~/.spacemacs ~/.dotfiles/system/app/editor/spacemacs/spacemacs.el";
		# switch = "update_spacemacs_dotfile && nrs && hms";
		switch = " nrs && hms";
		doom = "~/.emacs.d/bin/doom";

		zip280 = "parent_folder=$(basename \"$(pwd)\"); zip -r \"\${parent_folder}.zip\" *.cpp *.h";

  };
in
{

  # programs.bash = {
  #   enable = true;
  #   shellAliases = myAliases;
  # };

  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
  };


}
