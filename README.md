# README

## How I work
This config works both on my VM (VM Fusion, with 16GB ram and 12 cores), and my laptop (rmbp2018, 13 inch).

## Caution
I'm sorry that I can't find a very nix way to install spacemacs. Thus, in this config, spacemacs is installed through standard way. Luckily, Both spacemacs and lunarvim use a declarative way to store the config file, making it not very ugly.

## Overview:
Input Method: ibus-rime
Editor: Emacs (spacemacs), Vim
DE: KDE
shell: zsh
terminal: konsole
VPN Client: clash


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

### Install on Arch (I am only introducing my habbit)
1. Install Arch (The script [ArchInstall](https://github.com/archlinux/archinstall) is recommanded.)

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
