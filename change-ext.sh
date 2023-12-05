#!/bin/bash

# # Navigate to the folder containing the PDF files
# cd "$(dirname "$0")"

# # Change all .pdf extensions to .PDF
# for file in *.pdf; do
#     mv -- "$file" "${file%.pdf}.PDF"
# done

# echo "File extensions changed from .pdf to .PDF"

#!/bin/bash

#!/bin/bash

# Navigate to the folder containing the files
cd "$(dirname "$0")"

# Ask the user for the desired file extension
read -p "Enter the desired file extension (e.g., .pdf, .PDF, .png, .jpeg, .JPEG, etc.): " user_extension

# Change all file extensions to the user's choice
for file in *"$user_extension"; do
    new_name="${file%$user_extension}$user_extension"
    mv -- "$file" "$new_name"
done

echo "File extensions changed to $user_extension"
