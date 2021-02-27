# ~/.profile
# Executed by the command interpreter for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.

# Determine which OS, Device and Hardware you are running
uOSOut="$(uname -s)"
uDeviceOut="$(uname -o)"
uHardwareOut="$(uname -m)"

# Follow the following rules to determine what to load
case "${uOSOut}" in
    Linux*)     os=Linux;;
    #Darwin*)    os=Mac;;
    CYGWIN*)    os=Win;;
    MINGW*)     os=Win;;
    Windows*)   os=Win;;
    *)          os="UNKNOWN:${uOSOut}"
esac
#echo ${os}

case "${uDeviceOut}" in
    GNU/Linux*) device=Linux;;
    Android*)   device=Android;;
    CYGWIN*)    device=Win;;
    MINGW*)     device=Win;;
    *)          device="UNKNOWN:${uDeviceOut}"
esac
#echo ${device}

case "${uHardwareOut}" in
    x86_64*)    arch=x64;;
    i686-pc*)   arch=x86;;
    aarc64*)    arch=aarch64;;
    *)          arch="UNKNOWN:${uHardwareOut}"
esac
#echo ${arch}


# # if running bash
# if [ -n "$BASH_VERSION" ]; then
#     # include .bashrc if it exists
#     if [ -f "$HOME/.bashrc" ]; then
# 	. "$HOME/.bashrc"
#     fi
# fi

# dotfiles that need to be transferred
dots=(aliases bashrc env exports extra functions inputrc path)
helpers=(dir_colors)

# Start Loading External dotfiles
# First top level OS files
for file in "${dots[@]}"; do
    # delete currrent

    # then strt os, machine architecture
    # look for file
    # set to home
	[ -r ".$file" ] && [ -f ".$file" ] && source ".$file";
done;
unset file;

# # Then Machine Level Files
# for file in ~/.{aliases,exports,extra,functions,inputrc,path}; do
# 	[ -r "$file" ] && [ -f "$file" ] && source "$file";
# done;
# unset file;

# # Lastly Architecture Level Files
# for file in ~/.{aliases,exports,extra,functions,inputrc,path}; do
# 	[ -r "$file" ] && [ -f "$file" ] && source "$file";
# done;
# unset file;


# Pureline
source ~/ext/pureline/pureline ~/.prompt.sh
