# host_ip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")
host_ip=$(echo 172.30.80.1)
export ALL_PROXY="http://$host_ip:7890"
export http_proxy="$host_ip:7890"
export https_proxy="$host_ip:7890"



# Aliases
alias ..='cd ..'
alias bloat='nix path-info -Sh /run/current-system'
alias cleanup='sudo nix-collect-garbage --delete-older-than 7d'
alias doom='~/.emacs.d/bin/doom'
alias gcc151='gcc -O2 -Werror -Wall -Wextra -Wconversion -Wno-unused-result -Wvla -pedantic -std=c11'
alias hms='cd ~/.dotfiles && git add -A && home-manager switch --flake ~/.dotfiles'
alias ip='curl cip.cc'
alias jo='joshuto'
alias l='eza -lF --time-style=long-iso --icons'
alias la='eza -lah '
alias lg='lazygit'
alias ll='ls -l'
alias ls='eza -h --git --icons --color=auto --group-directories-first -s extension'
alias lv='lvim'
alias mkcd='function _mkcd() { mkdir "$1" && cd "$1" && echo -e "\033[1;32m$(pwd)\033[0m"; }; _mkcd'
alias mkdir='mkdir -p'
alias nrs='cd ~/.dotfiles && git add -A && sudo nixos-rebuild switch --flake ~/.dotfiles#goodmorninghwt'
alias nv='unset ALL_PROXY;unset http_proxy; unset https_proxy;'
alias o='open'
alias o.='open .'
alias q='exit'
alias ra='ranger'
alias s='neofetch'
alias switch=' nrs && hms'
alias tree='eza --tree --icons --tree'
alias update_spacemacs_dotfile='cd ~/.dotfiles/system/app/editor/spacemacs && trash spacemacs.el.bk && mv ./spacemacs.el ./spacemacs.el.bk && cp ~/.spacemacs ~/.dotfiles/system/app/editor/spacemacs/spacemacs.el'
alias v='export http_proxy=socks5://127.0.0.1:20170;export https_proxy=socks5://127.0.0.1:20170'
alias vc='export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:20171 all_proxy=socks5://127.0.0.1:20170'
alias vs='export http_proxy=socks5://127.0.0.1:20170;export https_proxy=socks5://127.0.0.1:20170'
alias wttr='curl wttr.in'
alias x='unar'
alias ytd='youtube-dl'
alias zip280='parent_folder=$(basename "$(pwd)"); zip -r "${parent_folder}.zip" *.cpp *.h Makefile'
alias yf='ssh -p 22 yifei@192.168.1.127'
alias yyf='ssh -p 22 yifei@192.168.1.127'
alias ok='python3 ok --local -q'
alias okq='python3 ok --local -q'
alias em='emacs -nw'
alias vhr='source ~/limx_rl/DrEureka-pointfoot/venv/bin/activate'

# >> lvim
export PATH=/home/hwt-wsl-ubuntu/.local/bin:$PATH
# <<lvim

# >> hwt write for ros
source ~/SynologyDrive/codeSpace/my_scripts/SOURCEME.sh
# <<

# >> hwt write for blurry firefox
export MOZ_ENABLE_WAYLAND=1
# <<





function lk {
  cd "$(walk "$@")"
}

export PATH="$HOME/.cargo/bin:$PATH"

eval "$(starship init bash)"


macchina -t Hydrogen
