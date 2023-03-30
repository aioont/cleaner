#!/bin/bash

# Prompt the user if they want to check free disk space
read -p "Do you want to check free disk space? [y/n]: " answer

case $answer in
    [Yy]* )
        df -H
        ;;
    [Nn]* )
        ;;
    * )
        echo "Please answer yes or no."
        exit 1
        ;;
esac

# Prompt the user to enter the directory to search
read -p "Enter directory to search or press enter for default [/data/data/com.termux/files]: " search_dir

# Use default directory if user doesn't enter anything
if [ -z "$search_dir" ]; then
    search_dir="/data/data/com.termux/files"
fi

# Check if the directory exists
if [ ! -d "$search_dir" ]; then
    echo "Directory $search_dir does not exist"
    exit 1
fi

# Prompt the user for the number of largest folders to find
read -p "How many largest folders need to find: " num

# Find the largest folders
echo "$num largest folders name loading..."
du -ha "$search_dir" | sort -k1hr | head -n "$num"

# Prompt the user if they want to delete any files
while true; do
    read -p "Do you want to delete any files? [y/n]: " answer
    case $answer in
        [Yy]* )
            ls -a "$search_dir"
            read -p "Enter directory or folder or file to delete: " file_to_delete
            rm -rf "$file_to_delete"
            ls -a "$search_dir"
            ;;
        [Nn]* )
            exit
            ;;
        * )
            echo "Please answer yes or no."
            ;;
    esac
done
