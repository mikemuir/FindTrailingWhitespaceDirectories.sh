#!/bin/bash

# Make sure that the script understands space characters.
IFS=$'\n'

# Use for loop to list all directories, then output each.
for i in $(find . -type d | grep "[[:space:]]\+$"); do echo ${i}; done

exit 0