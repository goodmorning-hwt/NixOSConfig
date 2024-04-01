#!/bin/bash

cd ~/Downloads

# Clone or download the repository to your local machine
git clone https://github.com/jothi-prasath/gnomintosh.git

# Navigate to the cloned repository directory
cd gnomintosh

# Run the main installation script
./main.sh

echo "Gnomintosh theme installation complete."
echo "Note: By default, wallpapers are installed in the Pictures folder in your home directory."
