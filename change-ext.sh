#!/bin/bash
# # Navigate to the folder containing the files
#cd "$(dirname "$0")"
# Prompt the user for current and desired file extensions
read -p "Enter the current file extension (e.g., .pdf, .PDF, .png, .jpeg, .JPEG, etc.): " current_extension
read -p "Enter the desired file extension (e.g., .pdf, .PDF, .png, .jpeg, .JPEG, etc.): " user_extension
# Check if the user is trying to change the extension of .sh files
if [ "$current_extension" = ".sh" ]; then
    echo "Error: Changing the extension of .sh files is not allowed."
    exit 1
fi
# Enable nullglob to handle the case when no files match the pattern
shopt -s nullglob

# Check if files with the current extension exist
files=(*"$current_extension")
if [ ${#files[@]} -gt 0 ]; then
    # Iterate through files with the current extension
    for file in "${files[@]}"; do
        # Create the new name by replacing the extension
        new_name="${file%$current_extension}$user_extension"
        
        # Print the new name
        echo "New name of file is => $new_name"
        
        # Rename the file
        mv -- "$file" "$new_name"
    done
else
    echo "No files found with the current extension '$current_extension'."
fi

# Disable nullglob to revert to the default behavior
shopt -u nullglob

echo "File extensions changed to $user_extension"
