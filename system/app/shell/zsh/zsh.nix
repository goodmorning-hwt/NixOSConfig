{config, pkgs, lib, ...}:
let
  myAliases = {
	 j = "z";
	 ubt = "kitty +kitten ssh -p 52212 hwt-ubuntu@ubt.imhwt.site";
	 nas = "kitty +kitten ssh -p 52211 goodmorning_hwt@nas.imhwt.site";
	 limx = "kitty +kitten ssh -p 22 limx@10.192.1.2";
	 kssh = "kitty +kitten ssh";
   kmz = "kitty_margin_zero";
   kmd = "kitty_margin_default";
   kitty_margin_zero = "kitty @ set-spacing padding-left=0 padding-top=0 padding-bottom=0 padding-right=0";
   kitty_margin_default = "kitty @ set-spacing padding-left=default padding-top=default padding-bottom=default padding-right=default";

	 mkdir = "mkdir -p";
    ll = "ls -l";
    ".." = "cd ..";
		hms = "cd ~/.dotfiles && git add -A && home-manager switch --flake ~/.dotfiles";
		switch = " nrs && hms";
		doom = "~/.emacs.d/bin/doom";
    "q" = "exit";
    s = "neofetch";
    wttr="curl wttr.in";
    nv="unset http_proxy; unset https_proxy;"; # 终端设置不翻墙;
    ip="curl cip.cc"; # 查看ip和是否翻墙;
    # la="ls -a";
    ytd="youtube-dl";
    lg="lazygit";
    ra="joshuto";
    jo="joshuto";
    # cat="bat";
    # ll = "ls -l";
    lv="lvim";
    open="xdg-open";
    o="open";
    "o."="open .";
    gcc151="gcc -O2 -Werror -Wall -Wextra -Wconversion -Wno-unused-result -Wvla -pedantic -std=c11";
    cleanup = "sudo nix-collect-garbage --delete-older-than 7d";
    bloat = "nix path-info -Sh /run/current-system";

    l = "eza -lF --time-style=long-iso --icons";
    la = "eza -lah ";
    ls = "eza -h --git --icons --color=auto --group-directories-first -s extension";
    tree = "eza --tree --icons --tree";

    mkcd = "function _mkcd() { mkdir \"$1\" && cd \"$1\" && echo -e \"\\033[1;32m$(pwd)\\033[0m\"; }; _mkcd";

    # cat = "${lib.getExe bat} --style=plain";
    # l = "${lib.getExe exa} -lF --time-style=long-iso --icons";
    # la = "${lib.getExe exa} -lah --tree";
    # ls = "${lib.getExe exa} -h --git --icons --color=auto --group-directories-first -s extension";
    # tree = "${lib.getExe exa} --tree --icons --tree";

  };
in
{

	home.packages = with pkgs; [
    # toys
    gping
    neofetch
		neo-cowsay
    yt-dlp
    bat
    curl
    fzf
    dua
    pokemonsay
    fortune
    glow
		autojump

		# Tools
    eza
    tree
		trashy
    unar
    joshuto
    lazygit
		# gobang
		btop
		thefuck

    sshfs
		z-lua

    # font
    fira-code-nerdfont

    # theme
		starship
	];

  programs.starship = {
    enable = true;
  };

  programs.thefuck = {
    enable = true;
  };

  programs.z-lua = {
    enable = true;
    enableAliases = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
  };

  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
		initExtra = ''
source ~/.dotfiles/profiles/my_alias.bash

# 检查终端大小
if [[ $(tput cols) -ge 80 && $(tput lines) -ge 24 ]]; then
    # neofetch
		fortune | pokemonsay
else
    # 在此处添加您想要执行的其他命令或脚本
    # echo "Terminal size is not large enough for neofetch."
		# pokemonsay "Terminal size is not large enough for neofetch." 
		fortune | pokemonsay
fi


fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

source $HOME/hwt.zshrc
		'';
    zplug = {
      enable = true;
      plugins = [
        { name = "Aloxaf/fzf-tab"; }
        { name = "mafredri/zsh-async"; tags = [ from:github ]; }
        # { name = "sindresorhus/pure"; tags = [ use:pure.zsh from:github as:theme ]; }
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "plugins/sudo"; tags = [ from:oh-my-zsh ]; }
        { name = "zsh-users/zsh-syntax-highlighting";}
        { name = "zsh-users/zsh-history-substring-search";}
        { name = "hlissner/zsh-autopair";}
        { name = "chisui/zsh-nix-shell";}
#         { name = "rupa/z";}
      ];
    };
  };
}
