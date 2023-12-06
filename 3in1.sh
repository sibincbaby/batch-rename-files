#!/bin/bash

# Function to download script content
download_script() {
    local url="$1"
    if command -v curl &> /dev/null; then
        curl -L "$url"
    elif command -v wget &> /dev/null; then
        wget -qO- "$url"
    else
        echo "Error: Neither 'curl' nor 'wget' commands are available."
        exit 1
    fi
}

# Variables to store script content
SCRIPT1=$(download_script "https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/joinify-connect.sh")
SCRIPT2=$(download_script "https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/change_file_name.sh")
SCRIPT3=$(download_script "https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/change-ext.sh")

# Check if all script variables have values
if [ -z "$SCRIPT1" ] || [ -z "$SCRIPT2" ] || [ -z "$SCRIPT3" ]; then
    echo "Error: Failed to download one or more scripts."
    rm -f "$0"
    exit 1
fi

# Execute scripts directly without writing to files
bash <(echo "$SCRIPT1") &&
bash <(echo "$SCRIPT2") &&
bash <(echo "$SCRIPT3")

# Capture the exit status of the previous commands
status=$?

# Print an error message if the exit status is non-zero
if [ $status -ne 0 ]; then
    echo "Error: Command failed with status $status."
fi

# Remove the script file itself
rm -f "$0"
