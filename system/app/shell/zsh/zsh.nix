{config, pkgs, ...}:
let
  myAliases = {
    ll = "ls -l";
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
    lv="lvim";
    o="open";
    "o."="open .";
    gcc151="gcc -O2 -Werror -Wall -Wextra -Wconversion -Wno-unused-result -Wvla -pedantic -std=c11";
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
	];

  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
        { name = "sindresorhus/pure"; tags = [ as:theme depth:1 ]; } # Installations with additional options. For the list of options, please refer to Zplug README.
        { name = "plugins/sudo"; tags = [ from:oh-my-zsh ]; }
        { name = "zsh-users/zsh-syntax-highlighting";}
        { name = "history-substring-search";}
      ];
    };
  };
}
