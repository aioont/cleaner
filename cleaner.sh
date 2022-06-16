#!/bin/bash
echo "Enter directory to search or press enter for default"
dir="/data/data/com.termux/files"
read dir
cd $dir
echo 'How many largest folder needs to find : '
read num
echo "$num largest files name loading ... : "
du -ha | sort -k1hr | head -n $num
while :
do
  read -p "Do you want to delete any [y/n] :" yn
  case $yn in
        [Yy]* ) ls -a;
                echo "Enter directory or folder or file to delete : "
                read deldir
                rm -rf $deldir;
                ls -a;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done