{config, pkgs, lib, ...}:
let
  myAliases = {
    "q" = "exit";
    ".." = "cd ..";
    s = "neofetch";
    wttr="curl wttr.in";
    vs="export http_proxy=socks5://127.0.0.1:20170;export https_proxy=socks5://127.0.0.1:20170"; # 终端设置翻墙（走shadowsocks);
    v="export http_proxy=socks5://127.0.0.1:20170;export https_proxy=socks5://127.0.0.1:20170"; # 终端设置翻墙（走v2raya);
    vc="export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:20171 all_proxy=socks5://127.0.0.1:20170"; # 终端设置翻墙(走ClashX);
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
    youtube-dl
    autojump
    bat
    curl
    fzf
    dua
		pokemonsay
		fortune

		# Tools
    eza
    tree
		trashy
    unar
    joshuto
    lazygit
		# gobang
		btop

    # font
    fira-code-nerdfont

    # theme
		starship
	];

  programs.starship = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
		initExtra = ''

export GOPATH=$HOME/Documents/SynologyDrive/ItsMyGo
export PATH=$PATH$GOPATH/bin


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

if [[ $(hostname) = "hwt-virtual-machine" ]]; then
  source /opt/ros/humble/setup.zsh
	export PYTHONPATH=~/naoqi/pynaoqi-python2.7-2.8.6.23-linux64-20191127_152327/lib/python2.7/site-packages:$PYTHONPATH 

  # >>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$('/home/goodmorninghwt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/home/goodmorninghwt/miniconda3/etc/profile.d/conda.sh" ]; then
          . "/home/goodmorninghwt/miniconda3/etc/profile.d/conda.sh"
      else
          export PATH="/home/goodmorninghwt/miniconda3/bin:$PATH"
      fi
  fi
  unset __conda_setup
  # <<< conda initialize <<<
fi

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
      ];
    };
  };
}
