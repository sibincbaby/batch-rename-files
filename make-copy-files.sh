#!/bin/bash

# Function to duplicate a file
duplicate_file() {
    original_file=$1
    num_copies=$2

    # Get the file extension
    extension="${original_file##*.}"
    
    # Get the file name without extension
    filename="${original_file%.*}"

    # Create copies
    for ((i=1; i<=num_copies; i++)); do
        cp "$original_file" "${filename}_${i}.${extension}"
    done

    echo "Duplicated $num_copies copies of $original_file."
}

# List files in the script folder in ascending order
files_in_folder=$(ls -1 | sort)

# Display files with serial numbers for selection
echo "Available files in the script folder:"
echo "$files_in_folder" | cat -n
echo

# Prompt for the file serial number
read -p "Enter the serial number to choose a file: " serial_number

# Get the selected file based on the serial number
selected_file=$(echo "$files_in_folder" | sed -n "${serial_number}p")

# Check if the selected file exists
if [ -e "$selected_file" ]; then
    # Prompt for the number of copies
    read -p "Enter the number of copies to make (1-1000): " num_copies

    # Check if the number of copies is within the limit (1-1000)
    if ((num_copies >= 1 && num_copies <= 1000)); then
        # Call the function to duplicate the file
        duplicate_file "$selected_file" "$num_copies"
    else
        echo "Error: Please enter a number between 1 and 1000."
    fi
else
    echo "Error: Invalid serial number or file not found."
fi

