#!/bin/bash

# Define the command to start fcitx5
FCITX_COMMAND="fcitx5"

# Define the command to set xkbmap options
SETXKBMAP_COMMAND="setxkbmap -option caps:swapescape"

# Define the command to start v2raya
V2RAYA_COMMAND="v2raya"

# Directory to store the .desktop files
AUTOSTART_DIR="$HOME/.config/autostart"

# Create the autostart directory if it doesn't exist
mkdir -p "$AUTOSTART_DIR"

# Create .desktop files for each program
cat << EOF > "$AUTOSTART_DIR/fcitx5.desktop"
[Desktop Entry]
Name=Fcitx5
Exec=$FCITX_COMMAND
Type=Application
X-GNOME-Autostart-enabled=true
EOF

cat << EOF > "$AUTOSTART_DIR/setxkbmap.desktop"
[Desktop Entry]
Name=Set xkbmap options
Exec=$SETXKBMAP_COMMAND
Type=Application
X-GNOME-Autostart-enabled=true
EOF

cat << EOF > "$AUTOSTART_DIR/v2raya.desktop"
[Desktop Entry]
Name=V2raya
Exec=$V2RAYA_COMMAND
Type=Application
X-GNOME-Autostart-enabled=true
EOF

echo "Autostart files created successfully."
