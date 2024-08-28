# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# host_ip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")
host_ip=$(echo 172.30.80.1)
export ALL_PROXY="http://$host_ip:7890"
export http_proxy="$host_ip:7890"
export https_proxy="$host_ip:7890"
# ~/proxy.sh set
~/proxy.sh test

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/hwt-wsl-ubuntu/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/hwt-wsl-ubuntu/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/hwt-wsl-ubuntu/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/hwt-wsl-ubuntu/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# >> autojump
[[ -s /home/hwt-wsl-ubuntu/.autojump/etc/profile.d/autojump.sh ]] && source /home/hwt-wsl-ubuntu/.autojump/etc/profile.d/autojump.sh
# << autojump

# >> hwt written for limx >>
conda activate ros-neotic
# conda activate HumanoidRobots
# export PYTHONPATH="/home/hwt-ubuntu/Documents/limxdynamics/limxsdk-for-lowlevel/python3/amd64/:$PYTHONPATH"
# export PYTHONPATH=/opt/ros/neotic/lib/python3/dist-packages:$PYTHONPATH
# << hwt written for limx <<

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
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:/home/hwt-wsl-ubuntu/catkin_ws/src
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/ros/noetic/lib:/usr/local/lib:/usr/lib

source ~/codeSpace/my_scripts/SOURCEME.sh
# <<

# >> hwt write for blurry firefox
export MOZ_ENABLE_WAYLAND=1
# <<


eval "$(starship init bash)"

eval "$(thefuck --alias)"


# >>> fishros initialize >>>
 source /opt/ros/noetic/setup.bash 
# <<< fishros initialize <<<

function lk {
  cd "$(walk "$@")"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.cargo/bin:$PATH"

