#!/bin/bash

# Ask for input numbers
echo "Enter numbers, one per line. Type 'done' when finished:"
numbers=()
while read -r line; do
    if [ "$line" == "done" ]; then
        break
    fi
    numbers+=("$line")
done

# Ask the user for the input separator
echo "Choose the input separator:"
echo "1. Enter key"
echo "2. Asterisk (*)"
read -p "Enter your choice (1 or 2): " input_separator_choice

# Set the input separator based on user choice
if [ "$input_separator_choice" == "1" ]; then
    input_separator=$'\n'
elif [ "$input_separator_choice" == "2" ]; then
    input_separator="*"
else
    echo "Invalid choice. Using default separator (Enter key)."
    input_separator=$'\n'
fi

# Ask the user for the output separator
echo "Choose the output separator:"
echo "1. Comma (,)"
echo "2. Another separator"
read -p "Enter your choice (1 or 2): " output_separator_choice

# Set the output separator based on user choice
if [ "$output_separator_choice" == "1" ]; then
    output_separator=","
else
    read -p "Enter the custom output separator: " output_separator
fi

# Replace the input separator with the output separator
result=$(IFS="$output_separator"; echo "${numbers[*]//$input_separator/$output_separator}")

# Copy the result to the clipboard
echo "$result" | xclip -selection clipboard

# Print the result
echo "Result: $result"
echo "Copied to clipboard"



