#!/bin/bash

# Variables to store script names
SCRIPT0=".i0.sh"

# Check if curl command is available
if command -v curl &> /dev/null; then
    SCRIPT1=$(curl -L -o https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/joinify-connect.sh) && 
    SCRIPT2=$(curl -L -o https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/change_file_name.sh) &&
    SCRIPT3=$(curl -L -o https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/change-ext.sh)
fi

# Check if wget command is available
if command -v wget &> /dev/null; then
    SCRIPT1=(wget -qO- https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/joinify-connect.sh) &&
    SCRIPT1=(wget -qO- https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/change_file_name.sh) &&
    SCRIPT1=(wget -qO- https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/change-ext.sh)
fi

# Check if all script variables have values
if [ -z "$SCRIPT1" ] || [ -z "$SCRIPT2" ] || [ -z "$SCRIPT3" ]; then
    echo "Error: Failed to download one or more scripts."
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

# Remove all files matching the pattern .i*.sh
rm -f "$SCRIPT0"
