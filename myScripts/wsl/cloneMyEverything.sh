#!/bin/bash


ssh -T git@github.com

cd ~

git clone git@github.com:goodmorning-hwt/NixOSConfig.git
gis clone git@github.com:goodmorning-hwt/.spacemacs.d.git

mv NixOSConfig/ .dotfiles

