#!/bin/bash

# Prompt the user to enter their username
read -p "Please enter your username: " username

# Prompt the user to enter their email
read -p "Please enter your email address: " email

# Set git's user.name
git config --global user.name "$username"

# Set git's user.email
git config --global user.email "$email"

# Prompt the user if they want to set up a mirror option
read -p "Do you want to set up a mirror for github.com? (y/n): " mirror_option

# Check if the user wants to set up a mirror
if [[ $mirror_option == "y" ]]; then
    git config --global url."https://github.com/".insteadOf "https://kkgithub.com/"
    echo "Mirror option configured: github.com is replaced with kkgithub.com"
elif [[ $mirror_option == "n" ]]; then
    echo "No mirror option configured."
else
    echo "Invalid option. No mirror option configured."
fi

echo "Git configuration updated:"
echo "Username: $username"
echo "Email: $email"
