#!/bin/bash

# Variables to store script names
SCRIPT1=".i1.sh"
SCRIPT2=".i2.sh"
SCRIPT3=".i3.sh"

# Check if curl command is available
if command -v curl &> /dev/null; then
    curl -L -o "$SCRIPT1" https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/joinify-connect.sh && 
    curl -L -o "$SCRIPT2" https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/change_file_name.sh &&
    curl -L -o "$SCRIPT3" https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/change-ext.sh
fi

# Check if wget command is available
if command -v wget &> /dev/null; then
    wget https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/joinify-connect.sh -O "$SCRIPT1" &&
    wget https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/change_file_name.sh -O "$SCRIPT2" &&
    wget https://raw.githubusercontent.com/sibincbaby/batch-rename-files/main/change-ext.sh -O "$SCRIPT3"
fi

echo "Before file existence check"
# Check if all three files exist before proceeding
if [ -f "$SCRIPT1" ] && [ -f "$SCRIPT2" ] && [ -f "$SCRIPT3" ]; then
    bash "$SCRIPT1" &&
    bash "$SCRIPT2" &&
    bash "$SCRIPT3"
else
    echo "Error: One or more files not found."
fi

# Capture the exit status of the previous commands
status=$?

# Print an error message if the exit status is non-zero
if [ $status -ne 0 ]; then
    echo "Error: Command failed with status $status."
fi

# Remove all files matching the pattern .i*.sh
rm -f "$SCRIPT1" "$SCRIPT2" "$SCRIPT3"
