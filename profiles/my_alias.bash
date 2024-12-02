# Aliases
alias ..='cd ..'
alias bloat='nix path-info -Sh /run/current-system'
alias cleanup='sudo nix-collect-garbage --delete-older-than 7d'
alias doom='~/.emacs.d/bin/doom'
alias gcc151='gcc -O2 -Werror -Wall -Wextra -Wconversion -Wno-unused-result -Wvla -pedantic -std=c11'
alias hms='cd ~/.dotfiles && git add -A && home-manager switch --flake ~/.dotfiles'
alias ip='curl cip.cc'
alias jst='joshuto'
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
alias v='export http_proxy=http://127.0.0.1:20171;export https_proxy=http://127.0.0.1:20171'
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
alias emc='emacsclient -nw'
alias kem='emacsclient -e "(kill-emacs)"'
alias ems='emacs --daemon'
alias vhr='source ~/limx_rl/DrEureka-pointfoot/venv/bin/activate'
alias rgc='rebos gen commmit'
alias rgb='rebos gen current build'
alias venv='source ./venv/bin/activate'
alias cda='conda deactivate'
alias ca='conda activate'
alias psg='ps aux | grep '
alias pdf2ppm='pdftoppm'
alias arch='ssh -p 52213 hwt@arch.imhwt.site'
alias ubt='ssh -p 52212 hwt_ubuntu@ubt.imhwt.site'
alias zrn_dom='ssh -p 48222 mr482@192.168.31.47'
alias zrn_wsl='ssh -p 48222 mr482@$host_ip'
alias cm='cmake -S . -B build && cmake --build build'
alias gctest='function _gctest() { git commit --allow-empty -m "test($1): joj"; }; _gctest'
alias \;s='ls'

jojsubmit() {
  git commit --allow-empty -m"joj. $@"
  git push
}
alias joj-submit=jojsubmit
alias js=jojsubmit
alias gcmsg='git add . && git cz c'
alias vg='valgrind --leak-check=full '
alias p2ssh='ssh 522370910172@111.186.59.59'
alias p2sshk='kitty +kitten ssh 522370910172@111.186.59.59'

c() {
  "$@" | wl-copy
}

e() {
  "$@" >explorer.exe
}
