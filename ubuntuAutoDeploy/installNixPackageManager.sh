#!/bin/bash

# Check if curl is installed
if ! [ -x "$(command -v curl)" ]; then
    echo 'curl is not installed, attempting to install...'

    # Install curl using apt (assuming the system is based on apt)
    sudo apt update
    sudo apt install curl -y

    # Check again if installation was successful
    if [ -x "$(command -v curl)" ]; then
        echo 'curl has been successfully installed'
    else
        echo 'Unable to install curl, please install manually'
        exit 1
    fi
else
    echo 'curl is already installed'
fi




# Install nix (Multi-User Installation)
echo "Installing nix..."
sh <(curl -L https://nixos.org/nix/install) --daemon

# Modify /etc/nix/nix.conf
echo "Modifying /etc/nix/nix.conf..."
# sudo sed -i '/^#*experimental-features/s/^#*/experimental-features = nix-command flakes/' /etc/nix/nix.conf
sudo sh -c 'echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf'

