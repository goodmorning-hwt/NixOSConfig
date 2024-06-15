#!/bin/bash

cd ~/.dotfiles && git add -A && home-manager switch --flake ~/.dotfiles -b backup
