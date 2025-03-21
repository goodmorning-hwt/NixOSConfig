#!/bin/bash


chmod +x *.sh

# Define the directory containing the .sh files
SCRIPTS_DIR="./."

# List of scripts to execute
SCRIPTS=(
		"installHomeManager.sh"
		"deployNixConfig.sh"

		"installGnomintosh.sh"

		"installV2raya.sh"
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

echo "All scripts executed."
