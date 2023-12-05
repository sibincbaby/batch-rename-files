#!/bin/bash

# Ask the user to input comma-separated names
echo "Paste the copied text here.."
read -r user_input

# Check if the user input is empty
if [ -z "$user_input" ]; then
  echo "Error: No names provided."
  exit 1
fi

# Get the list of names provided by the user
IFS=','
read -ra name_array <<< "$user_input"

# Get the list of PDF files in the current folder
mapfile -t pdf_files < <(find . -maxdepth 1 -type f -iname "*.pdf")

# Create a temporary directory
temp_dir=$(mktemp -d)

# Counter for naming files
counter=0

# Loop through each PDF file and rename them safely
for file in "${pdf_files[@]}"; do
  # Get the extension of the file
  extension="${file##*.}"
  
  # Check if the counter exceeds the number of names
  if [ "$counter" -lt "${#name_array[@]}" ]; then
    # Create the new file name with the current counter and the corresponding name
    new_name="${name_array[counter]}.pdf"
    
    # Check if the new name is not empty
    if [ -n "$new_name" ]; then
      # Move the file to the temporary directory
      mv "$file" "$temp_dir/$new_name"
      
      # Check if the move operation was successful
      if [ $? -eq 0 ]; then
        echo "File '$file' renamed to '$new_name'"
        # Increment the counter
        ((counter++))
      else
        echo "Error: Failed to rename file '$file' to '$new_name'"
      fi
    else
      echo "Error: Empty new name for file '$file'!"
    fi
  else
    # If there are more files than names, exit the loop
    break
  fi
done

# Move the files back to the original directory
mv "$temp_dir"/* .

# Remove the temporary directory
rmdir "$temp_dir"

echo "Files renamed successfully!"
