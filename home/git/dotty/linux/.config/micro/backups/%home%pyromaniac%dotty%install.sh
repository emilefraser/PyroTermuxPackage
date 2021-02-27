#!/bin/bash

# TODO: CHANGE THIS TO DYNAMICALLY GET PATH
myhome="/mnt/c/Users/efras/AppData/Local/Packages/KaliLinux.54290C8133FEE_ey8k8hqnwqnmg/LocalState/rootfs/home/pyromaniac"
currentpath=$(echo $PWD)

# Check configuration of current machine
echo "Checking Machine Configuration..."
echo "OUPUTS CONFIGURATION"

# Clears all dotfiles currently in $HOME
echo "Clearing dotfiles from current HOME"

# Moves down Config copying files to root
echo "Copying files from your Operating System Node..."

$OS=linux
$HW=linux

$os_path="$currentpath/$OS"
for dotfile in $currentpath/$OS/*
do
    # copy each dotfile one for one
    # check if its a file first
    if [ -f "$(dotfile)" ]
    then
        cp $f $myhome
        
done
 