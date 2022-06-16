#!/bin/bash
echo "Enter directory to search or press enter for default"
read dir
dir="/data/data/com.termux/files"
cd $dir
echo 'How many largest folder needs to find : '
read num
echo "$num largest files : "
du -ha | sort -k1hr | head -n $num
while true; do
    read -p "Do you want to delete any [y/n] :" yn
    case $yn in
        [Yy]* ) echo "Enter directory to delete : "
                read deldir
                rm -rf $deldir; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done