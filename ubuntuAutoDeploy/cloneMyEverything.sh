#!/bin/bash


ssh -T git@github.com

cd ~

git clone git@github.com:goodmorning-hwt/NixOSConfig.git
git clone git@github.com:goodmorning-hwt/.spacemacs.d.git
git clone git@github.com:goodmorning-hwt/ubuntu-i3-config.git

mv NixOSConfig/ .dotfiles
cd ./.dotfiles/ubuntuAutoDeploy

bash exec.sh
