#!/bin/bash


chmod +x *.sh

# Define the directory containing the .sh files
SCRIPTS_DIR="./."

# List of scripts to execute
SCRIPTS=(
		"installFlathub.sh"
		"installFcitx5.sh"
		"installSpacemacs.sh"
		"installV2raya.sh"
		"setAutoStart.sh"
		"installNixPackageManager.sh"
		"setGnome.sh"

)

# Change directory to the scripts directory
cd "$SCRIPTS_DIR"

# Execute each script
for script in "${SCRIPTS[@]}"; do
    echo "Executing $script..."
    if [ -x "$script" ]; then
        "./$script"
    else
        echo "Error: $script is not executable."
    fi
done

echo "Please Open A New Shell and run 'bash exec2.sh'."
