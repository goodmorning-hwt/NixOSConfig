# README

## How I work

This config works both on my wsl (Ubuntu 20.05) and my desktop computer (EndeavourOS).

## Caution

I'm sorry that I can't find a very nix way to install spacemacs. Thus, in this config, spacemacs is installed through standard way. Luckily, Both spacemacs and lunarvim use a declarative way to store the config file, making it not very ugly.

## Overview:

- Input Method: fcitx5-rime
- Editor: Emacs (spacemacs), VSCode
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

### Install on WSL
1. Install Ubuntu

2. Install [Nix(Single-User Installatioin)](https://nixos.org/download)

3. Edit `$HOME/.config/nix/nix.conf` (if the file does not exist, create it)
	```sh
	sudo vim /etc/nix/nix.conf
	```

	add one line:

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

### Install on a desktop(Btw I use Arch)

1. Do the same as you install this on WSL.

2. You need to set your input method and VPN. I really want to find a *nix* way to install them but I failed. Just do not work.

#### Install the Input method

Install `fcitx5` `fcitx-im` `fcitx` `fcitx5-rime` `fcitx5-configtool` `fcitx5-qt` `fcitx5-gtk` `fcitx5-chinese-addons` .

For Japanese Input, install `fcitx5-anthy` or `fcitx5-mozc`. The first one is more lightweight and the second one is made by google.

#### Install the VPN

If you use v2raya, just refer to the official website.

If you use Clash, `clash-nyanpasu` will be a good choice.

## The problems I have met

### Input method not working

because if nix locked the rime config directory, fcitx5-rime can not deploy the config. You need to make Rime config repository an individual repository, instead of managing them by nix.
