#!/bin/bash

# Backup directory
backup_dir="$HOME/.dotfiles/ubuntuAutoDeploy/backUpFiles"

# Check if backup directory exists
if [ ! -d "$backup_dir" ]; the
    mkdir -p "$backup_dir"
    exit 1
fi

# Create backup directory if it doesn't exist
mkdir -p "$backup_dir"

# Backup GNOME Shell extensions
extension_dir="$HOME/.local/share/gnome-shell/extensions"
cp -r "$extension_dir" "$backup_dir"

echo "GNOME Shell extensions Backup completed."

# Backup GNOME Shell settings using dconf
dconf dump /org/gnome/shell/ > "$backup_dir/gnome_shell_settings_backup.txt"

echo "GNOME Shell settings Backup completed."

#!/bin/bash


# Backup Ubuntu settings using dconf
dconf dump / > "$backup_dir/ubuntu_settings_backup.txt"

echo "Ubuntu settings backup completed."

