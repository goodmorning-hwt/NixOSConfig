#!/bin/bash

# Define the list of packages to install
packages=(

    warp-terminal
    synology-drive
    sunloginclient
    # Add more packages here
)

# Update the apt package index
sudo apt update

# Install or update packages
for package in "${packages[@]}"; do
    if dpkg -s "$package" &> /dev/null; then
        echo "$package is already installed, updating..."
        sudo apt install --only-upgrade -y "$package"
    else
        echo "$package is not installed, installing..."
        sudo apt install -y "$package"
    fi
done

