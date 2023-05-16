#!/bin/bash
# store the pkgs list  
sudo apt list --installed | awk -F/ -v ORS=" " 'NR>1 {print $1}' > pkgs
# Read the file line by line
IFS=' ' 
read -ra values <<< $(cat pkgs)
for element in "${values[@]}"; do
    sudo apt install -y $element
done
