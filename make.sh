#!/bin/bash

# Set the script basedir
DIR="$( cd "$( dirname "$0" )" && pwd )" 

# Choose the OS - this will tell the script what folder to copy
echo "Choose OS:"
echo " [1] OS X"
echo " [2] Linux"
read -p "> " input

# Validate input
if [ "$input" -eq "1" -o "$input" -eq "2" ]; then

	# Link files in the general folder
	echo "Linking general folder:"
		for file in $DIR/general/*; do
			echo " [X] Linking ${file##*/}..."
			ln -sf "$file" "$HOME/.${file##*/}"
		done
	echo "...done"

	if [ "$input" -eq "1" ]; then
		# Link files in the Mac folder
		echo "Linking Mac Folder:"
		for file in $DIR/mac/*; do
			echo " [X] Linking ${file##*/}..."
			ln -sf "$file" "$HOME/.${file##*/}"
		done
		echo "...done"
	else
		# Link files in the Linux folder
		echo "Linking Linux Folder:"
		for file in $DIR/linux/*; do
			echo " [X] Linking ${file##*/}..."
			ln -sf "$file" "$HOME/.${file##*/}"
		done
		echo "...done"
	fi

else
	echo "$input is not an option"
fi