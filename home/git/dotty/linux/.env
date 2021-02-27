# ~/.bash_profile
# Executed by the command interpreter for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.

#######################################
######### CORE SHELL OPTIONS ##########
#######################################
## http://wiki.bash-hackers.org/internals/shell_options
shopt -s cdspell
shopt -s dirspell
shopt -s histappend
shopt -s checkwinsize
shopt -s lithist
shopt -s autocd
shopt -s extglob
shopt -s dotglob
shopt -s globstar
shopt -s nocaseglob         # case insensitive globbing
shopt -s expand_aliases     # for try catch

#######################################
############## COMPLETION #############
#######################################
# Add tab completion for many Bash commands 
if which brew &> /dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then 	
	# Ensure existing Homebrew v1 completions continue to work 	
	export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d";
	source "$(brew --prefix)/etc/profile.d/bash_completion.sh"; 
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion; 
fi;

# Enable tab completion for `g` by marking it as an alias for `git` 
if type _git &> /dev/null; then
 	complete -o default -o nospace -F _git g; 
fi;  

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards 
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;  

# Add tab completion for `defaults read|write NSGlobalDomain` 
# You could just use `-g` instead, but I like being explicit 
complete -W "NSGlobalDomain" defaults;

### Bash Completion ###
#if [ -f /etc/bash_completion ]; then
## enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#if [ -f $PREFIX/etc/bash_completion.d ]; then
#   . $PREFIX/etc/bash_completion.d/git-completion.bash
#   . $PREFIX/etc/bash_completion.d/beet.bash-completion
#   . $PREFIX/etc/bash_completion.d/youtube-dl.bash-completion
#   . $PREFIX/etc/bash_completion.d/git-prompt.sh
#fi


#######################################
############### STYLE #################
#######################################

# Power Pure Line
source ~/ext/pureline/pureline ~/.prompt.conf

# Attaches dircolors
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

# fix tput xterm-256-colors
TERM="xterm"
export TERM


############################################
####### TMUX SESSION CONFIGURATION #########
############################################

#if [[ -n $TMUX ]]; then
 #   if [[ -f .tmux-session-name ]]; then
 #       tmux_session_name=$(cat .tmux-session-name)
 #   else
 #       tmux_session_name="${PWD##*/}"
 #   fi
#    if [[ -d ~/.virtualenvs/"$tmux_session_name" ]]; then
#        workonthis
#    fi
#    if [[ -f ~/.tmux-shells/"$tmux_session_name" ]]; then
#        source ~/.tmux-shells/"$tmux_session_name"
#    fi
#fi