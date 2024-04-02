#!/bin/bash

# Install Flatpak
echo "Installing Flatpak..."
sudo apt install flatpak -y

# Add Flatpak official repository
echo "Adding Flatpak official repository..."
sudo add-apt-repository ppa:flatpak/stable -y
sudo apt update

# Install Flatpak again
echo "Installing Flatpak again..."
sudo apt install flatpak -y

# Install GNOME Software Flatpak plugin
echo "Installing GNOME Software Flatpak plugin..."
sudo apt install gnome-software-plugin-flatpak -y

# Add Flathub remote repository
echo "Adding Flathub remote repository..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "Flatpak installation completed"
