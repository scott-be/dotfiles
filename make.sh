#!/bin/bash

# Set the script basedir
DIR="$( cd "$( dirname "$0" )" && pwd )" 

# Choose the OS - this will tell the script what folder to copy
ARG=$1
case $ARG in
   "--osx") input='1';;
   "--linux") input='2';;
   *) echo "Choose OS:"
	  echo " [1] OS X"
	  echo " [2] Linux"
	  read -p "> " input
	;;
esac

# Validate input
if [ "$input" -eq "1" -o "$input" -eq "2" ]; then

	# Link files in the general folder
	echo "Linking general folder:"
		for file in $DIR/general/*; do
			# Create symlinks for files in general/
			if [ -f $file  -a ${file##*/} != "README.md" ]; then # Filter for only files and ignore the file README.md
				echo " [X] Linking ${file##*/}..."
				ln -sf "$file" "$HOME/.${file##*/}" # Create symlink
			fi

			# Create symlinks for directories in general/
			if [[ -d $file ]]; then # Filter for only directories
				for file2 in $file/*; do
					echo " [X] Linking files in ${file##*/}/${file2##*/}..."
					mkdir -p $HOME/.config/${file2##*/} # Create DIR if not exist
					ln -sf $file2/* "$HOME/.${file##*/}/${file2##*/}" # Create symlink
				done
			fi
		done
	echo "...done"

	if [ "$input" -eq "1" ]; then
		# Link files in the Mac folder
		echo "Linking Mac Folder:"
		for file in $DIR/osx/*; do

			# Create symlinks for files in osx/
			if [ -f $file  -a ${file##*/} != "README.md" ]; then # Filter for only files and ignore the file README.md
				echo " [X] Linking ${file##*/}..."
				ln -sf "$file" "$HOME/.${file##*/}" # Create symlink
			fi

			# Create symlinks for directories in osx/
			if [[ -d $file ]]; then # Filter for only directories
				for file2 in $file/*; do
					echo " [X] Linking files in ${file##*/}/${file2##*/}..."
					mkdir -p $HOME/.config/${file2##*/} # Create DIR if not exist
					ln -sf $file2/* "$HOME/.${file##*/}/${file2##*/}" # Create symlink
				done
			fi

		done
		echo "...done"
	else
		# Link files in the Linux folder
		echo "Linking Linux Folder:"
		for file in $DIR/linux/*; do

			# Create symlinks for files in linux/
			if [ -f $file  -a ${file##*/} != "README.md" ]; then # Filter for only files and ignore the file README.md
				echo " [X] Linking ${file##*/}..."
				ln -sf "$file" "$HOME/.${file##*/}" # Create symlink
			fi

			# Create symlinks for directories in linux/
			if [[ -d $file ]]; then # Filter for only directories
				for file2 in $file/*; do
                    if  [[ -d $file2 ]]; then # Filter for only directories
    					echo " [X] Linking files in ${file##*/}/${file2##*/}..."
	    				mkdir -p $HOME/.config/${file2##*/} # Create DIR if not exist
		    			ln -sf $file2/* "$HOME/.${file##*/}/${file2##*/}" # Create symlink
                    else
				        echo " [X] Linking ${file2##*/}..."
		    			ln -sf $file2/* "$HOME/.${file##*/}/${file2##*/}" # Create symlink
                    fi
				done
			fi

		done
		echo "...done"
	fi

else
	echo "$input is not an option"
fi