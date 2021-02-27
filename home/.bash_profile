# ~/.bash_profile: executed by the command interpreter for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.
# if running bash
if [ -n "$BASH_VERSION" ]; then
 # include .bashrc if it exists
  [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
fi

# EF uncommented this 
#PATH=/system/bin:$PATH

# set PATH so it includes user's private bin if it exists
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

# fix tput xterm-256-colors
TERM="xterm"
export TERM