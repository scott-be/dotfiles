# dotfiles


## using this repo
This repo is separated into three folders:

1. general/
2. osx/
3. linux/

The osx folder holds dotfiles for OS X, The linux folder holds dotfiles for Linux and the general folder holds dotfiles common to both systems.

Files in each folder are unhidden (without a dot prefix) to make them easier to work with in Finder/Nautilus

## using the script
* Run `dotfiles/make.sh` and enter the 1 for Mac or 2 for Linux. 
* The script will loop each folder (the general folder plus the osx folder if you selected OSX or linux folder if you selected Linux) and create symlinks in your home directory.
