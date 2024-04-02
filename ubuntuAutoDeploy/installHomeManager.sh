#!/bin/bash
#o
# Install home-manager (Standalone installation)
echo "Installing home-manager..."
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

echo "Configuration completed successfully!"


