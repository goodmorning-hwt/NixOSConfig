# README

## How I work
This config works both on my VM (NixOS on VM Fusion, with 16GB ram and 12 cores), and my laptop (Arch on rmbp2018, 13 inch).

## Caution
I'm sorry that I can't find a very nix way to install spacemacs. Thus, in this config, spacemacs is installed through standard way. Luckily, Both spacemacs and lunarvim use a declarative way to store the config file, making it not very ugly.

## Overview:
- Input Method: ibus-rime
- Editor: Emacs (spacemacs), Vim
- DE: KDE(Nix OS)
- shell: zsh
- terminal: Kitty
- VPN Client: v2raya


## Get Started

### Install On nixOS
1. Install nixOS

2. Install home manager (Please refer to the Home Manager Manual. I prefer the Standalone installation way). Attention: if `nix-shell '<home-manager>' -A install` echos a `not found` error, you may reboot the system and reexecute the command.

3. clone the repository to `~/.dotfiles`

4. run these shell command
```shell
cd ~/.dotfiles
git add .
sudo nixos-rebuild switch --flake ~/.dotfiles#goodmorninghwt
home-manager switch --flake ~/.dotfiles"
```

5. install [Spacemacs](https://www.spacemacs.org)

6. Have fun!

### Install on Ubuntu(I use wsl)
1. Install Ubuntu

2. Install [Nix(Single-User Installatioin)](https://nixos.org/download)

3. Edit `$HOME/.config/nix/nix.conf` (if the file does not exist, create it)
	```sh
	sudo vim /etc/nix/nix.conf
	```

	add one line:
	```conf
	experimental-fetures = nix-command flakes
	```
4. install asdf 
I use asdf to manage my development environment
use `asdf.sh` in my `myScript` Directory.

5. install [rebos](https://gitlab.com/Oglo12/rebos/)

```sh
cargo install rebos
rebos setup
# if you have cloned my rebos config
rebos gen current build
```


### Install on Arch (I am only introducing my habbit)
1. Install Arch (The script [ArchInstall](https://github.com/archlinux/archinstall) is recommanded).

2. Install hyprland from [hyprdots](https://github.com/prasanthrangan/hyprdots)

3. Install [Nix(Multi-User Installatioin)](https://nixos.org/download)

4. Edit `/etc/nix/nix.conf`
```sh
sudo vim /etc/nix/nix.conf
```

add one line:
```conf
experimental-fetures = nix-command flakes
```

5. Install [Home-Manager(Standalone installation)](https://nix-community.github.io/home-manager/)
If error happens you can reboot your machine and try again.

6. Clone this repository and install the config.
```sh
git clone git@github.com:goodmorning-hwt/NixOSConfig.git ~/.dotfiles
cd ~/.dotfiles && git add -A && home-manager switch --flake ~/.dotfiles.
```

### V2raya

wget -qO - https://apt.v2raya.org/key/public-key.asc | sudo tee /etc/apt/keyrings/v2raya.asc
echo "deb [signed-by=/etc/apt/keyrings/v2raya.asc] https://apt.v2raya.org/ v2raya main" | sudo tee /etc/apt/sources.list.d/v2raya.list
sudo apt update
sudo apt install v2raya v2ray ## you can install xray package instead of if you want



