#!/bin/bash


ssh -T git@github.com

cd ~

mkdir -p ~/.config/rebos
git clone git@github.com:goodmorning-hwt/NixOSConfig.git ~/.dotfiles
git clone git@github.com:goodmorning-hwt/.spacemacs.d.git
git clone git@github.com:goodmorning-hwt/rebos_config.git ~/.config/rebos
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d


