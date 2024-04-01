#!/bin/bash

# Update apt package index
echo "Updating apt package index..."
sudo apt update

# Install dconf-editor, GNOME Tweaks, and GNOME Shell Extensions
echo "Installing dconf-editor, GNOME Tweaks, and GNOME Shell Extensions..."
sudo apt install dconf-editor gnome-tweaks gnome-shell-extensions -y


# Install GNOME Tweaks
echo "Installing GNOME Tweaks..."
sudo apt install gnome-tweaks -y

# Disable GNOME Dash Bar
echo "Disabling GNOME Dash Bar..."
gnome-extensions disable ubuntu-dock@ubuntu.com


# Install Blur my Shell
echo "Installing Blur my Shell..."
sudo apt install gnome-shell-extension-blur-my-shell -y


# Set desktop wallpaper
echo "Setting desktop wallpaper..."
wallpaper_path="$(dirname "$0")/../others/wallpaper/ShiinaTaki.png"
gsettings set org.gnome.desktop.background picture-uri "file://$wallpaper_path"

echo "Installation and configuration completed."

