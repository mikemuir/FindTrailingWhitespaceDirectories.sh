#!/bin/bash
# Find Trailing Whitespace
# Written by Mike Muir, 4/13/17
# Walt Disney Studios IT

#This script will prompt the end user to enter in the full directory needing to check for any trailing whitespace folders.


#Check for sudo:
if [[ $USER != "root" ]]; then
	echo "This script must be run as root (hint: sudo)"
	exit 1
fi

# Make sure that the script understands space characters.
IFS=$'\n'

# Ask for folder to parse:
echo "Enter the full directory you wish to scrape:"
read directory

# Change directory to the entered directory path:
cd $directory

echo -e "Directory Checked: '$directory'\n\n" >> /Users/Shared/WhitespaceDirectories.txt
# Use grep to locate all files with a space at the end of its name with the Regular Expression
# [[:space:]]\+$
find . -type d -mindepth 1 | while read ffile || test -n "$ffile"; do
	echo $ffile | grep "[[:space:]]\+$" >> /Users/Shared/Whitespace.txt
done

chmod 777 /Users/Shared/Whitespace.txt
echo "All Done!  The list of folders with trailing whitespaces has been saved to /Users/Shared/WhitespaceDirectories.txt"
exit 0