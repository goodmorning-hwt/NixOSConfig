{config, pkgs, lib, ...}:
let
  myAliases = {
    ".." = "cd ..";
    s = "neofetch";
    wttr="curl wttr.in";
    v="export http_proxy=socks5://127.0.0.1:1086;export https_proxy=socks5://127.0.0.1:1086"; # 终端设置翻墙（走shadowsocks);
    vc="export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890"; # 终端设置翻墙(走ClashX);
    nv="unset http_proxy; unset https_proxy;"; # 终端设置不翻墙;
    ip="curl cip.cc"; # 查看ip和是否翻墙;
    # la="ls -a";
    x="unar";
    ytd="youtube-dl";
    lg="lazygit";
    ra="joshuto";
    jo="joshuto";
    # cat="bat";
    # ll = "ls -l";
    lv="lvim";
    o="open";
    "o."="open .";
    gcc151="gcc -O2 -Werror -Wall -Wextra -Wconversion -Wno-unused-result -Wvla -pedantic -std=c11";
    cleanup = "sudo nix-collect-garbage --delete-older-than 7d";
    bloat = "nix path-info -Sh /run/current-system";

    l = "eza -lF --time-style=long-iso --icons";
    la = "eza -lah --tree";
    ls = "eza -h --git --icons --color=auto --group-directories-first -s extension";
    tree = "eza --tree --icons --tree";

    # cat = "${lib.getExe bat} --style=plain";
    # l = "${lib.getExe exa} -lF --time-style=long-iso --icons";
    # la = "${lib.getExe exa} -lah --tree";
    # ls = "${lib.getExe exa} -h --git --icons --color=auto --group-directories-first -s extension";
    # tree = "${lib.getExe exa} --tree --icons --tree";
  };
in
{

	home.packages = with pkgs; [
		neofetch
		neo-cowsay
    youtube-dl
    bat
    curl
    lazygit
    joshuto
    fzf
    eza
    tree
		trashy
    unar
	];

  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
		initExtra = ''
		neofetch
fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

		'';
    zplug = {
      enable = true;
      plugins = [
        { name = "Aloxaf/fzf-tab"; }
        { name = "mafredri/zsh-async"; tags = [ from:github ]; }
        { name = "sindresorhus/pure"; tags = [ use:pure.zsh from:github as:theme ]; }
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "plugins/sudo"; tags = [ from:oh-my-zsh ]; }
        { name = "zsh-users/zsh-syntax-highlighting";}
        { name = "zsh-users/zsh-history-substring-search";}
        { name = "hlissner/zsh-autopair";}
        { name = "chisui/zsh-nix-shell";}
      ];
    };
  };
}
