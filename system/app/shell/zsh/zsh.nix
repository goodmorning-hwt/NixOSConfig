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
    la="ls -a";
    x="unar";
    ytd="youtube-dl";
    lg="lazygit";
    ra="joshuto";
    cat="bat";
    ll = "ls -l";
    lv="lvim";
    o="open";
    "o."="open .";
    gcc151="gcc -O2 -Werror -Wall -Wextra -Wconversion -Wno-unused-result -Wvla -pedantic -std=c11";
    cleanup = "sudo nix-collect-garbage --delete-older-than 7d";
    bloat = "nix path-info -Sh /run/current-system";

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
    tree
		trashy
	];

  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
		initExtra = ''
		neofetch
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
