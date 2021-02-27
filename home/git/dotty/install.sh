#!/bin/bash

# TODO: CHANGE THIS TO DYNAMICALLY GET PATH
#myhome="/mnt/c/Users/efras/AppData/Local/Packages/KaliLinux.54290C8133FEE_ey8k8hqnwqnmg/LocalState/rootfs/home/pyromaniac"
myhome=$HOME
currentpath=$(echo $PWD)

echo "CHECK IF NECCESSARY APPSNINSTALLED"
if ! type "$git" > /dev/null; then
  pkg install git
fi



# Check configuration of current machine
echo "Checking Machine Configuration..."
echo "OUPUTS CONFIGURATION"

# Clears all dotfiles currently in $HOME
echo "Clearing dotfiles from current HOME"
find $myhome -maxdepth 1 -name ".*" -exec rm {} ';'

# Moves down Config copying files to root
echo "Copying files for your Operating System Node..."

OS=linux
HW=linux

os_path="$currentpath/$OS"
os_dots=$(find $os_path -maxdepth 1 name=".*" | grep "./.")

for dotfile in $os_dots
do
    # copy each dotfile one for one
    # check if its a file first
    if [ -f "$(dotfile)" ]
    then
        cp $f $myhome
    else
        cp $f $myhome -r
    fi
done
 
# will now copy device specific items
# overwrite more general with more specificnsettings
hw_path="$currentpath/$HW"                     
hw_dots=$(find $os_path -maxdepth 1 name=".*" | grep "./")                                       

for dotfile in $os_dots do                   

# write to orig file (apPemd)              
# check if its a file first
if [ -f "$(dotfile)" ]                       
then
        cat $dotfile >> $myhome/$dotfile
fi                                    
done

AARCH="aarch64"
aarch_path=$hw_path/$AARCH


# lastly arch specificz
