# host_ip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")
# host_ip=$(echo 172.30.80.1)
# export ALL_PROXY="http://$host_ip:7890"
# export http_proxy="http://$host_ip:7890"
# export https_proxy="http://$host_ip:7890"

# Aliases

source ~/.dotfiles/profiles/my_alias.bash

# >> lvim
export PATH=/home/hwt-wsl-ubuntu/.local/bin:$PATH
# <<lvim

# >> hwt write for ros
source ~/SynologyDrive/codeSpace/my_scripts/SOURCEME.sh
# <<

# >> hwt write for blurry firefox
export MOZ_ENABLE_WAYLAND=1
# <<

export PATH="$HOME/.cargo/bin:$PATH"

eval "$(starship init bash)"

macchina -t Hydrogen

export EDITOR="vim"
export VISUAL="vim"

check_synology_drive(){
    if ! pgrep "cloud-drive-ui" > /dev/null; then
        echo "Starting Synoloy Drive..."
        synology-drive > /dev/null 2>&1 &
    else
        :

    fi

}

check_synology_drive
