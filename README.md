# README

## How I work
This config works both on my VM (VM Fusion, with 16GB ram and 12 cores), and my laptop (rmbp2018, 13 inch).

## Caution
I'm sorry that I can't find a very nix way to install spacemacs and lunarvim. Thus, in this config, spacemacs and lunarvim is installed through standard way. Luckily, Both spacemacs and lunarvim use a declarative way to store the config file, making it not very ugly.

## Overview:
Input Method: ibus-rime
Editor: Emacs (spacemacs), Neovim(lunarvim)
DE: KDE
shell: zsh
terminal: konsole
VPN Client: clash


## Get Started
1. Install nixOS
2. Install home manager (Please refer to the Home Manager Manual. I prefer the Standalone installation way).
3. clone the repository to `~/.dotfiles`
3. run these shell command
```shell
cd ~/.dotfiles
git add .
sudo nixos-rebuild switch --flake ~/.dotfiles#goodmorninghwt"
home-manager switch --flake ~/.dotfiles"
```
4. install [Spacemacs](https://www.spacemacs.org)
5. install [lunarvim](https://www.lunarvim.org)
6. Have fun!
