#!/bin/bash

# Backup directory
backup_dir="$HOME/.dotfiles/ubuntuAutoDeploy"

# Check if backup directory exists
if [ ! -d "$backup_dir" ]; then
    echo "Backup directory not found."
    exit 1
fi

# Check if backup directory exists
if [ ! -d "$backup_dir" ]; then
    echo "Backup directory not found."
    exit 1
fi

# Restore GNOME Shell extensions
extension_dir="$HOME/.local/share/gnome-shell/extensions"
cp -r "$backup_dir/extensions" "$extension_dir"

# Restore GNOME Shell settings using dconf
dconf load /org/gnome/shell/ < "$backup_dir/gnome_shell_settings_backup.txt"

echo "Gnome Backup restored successfully."


# Restore Ubuntu settings using dconf
dconf load / < "$backup_dir/ubuntu_settings_backup.txt"

echo "Ubuntu settings restored successfully."

