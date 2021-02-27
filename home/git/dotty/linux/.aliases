#  ~/.aliases
# All aliasses used by bash for all ENVIRONMENTS

#######################################
############# DIRECTORIES #############
#######################################

### directories and lists
alias home='cd $HOME'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ls='ls --color=auto'
alias la='ls -A --color=auto'
alias ll='ls -l --color=auto'
alias lsh='ls -lh --color=auto'
alias lla='ls -lA --color=auto'
alias lsd='ls -d */ --color=auto'
alias lz='ll -rS --color=auto'
alias lx='ll -BX --color=auto'
alias lm='la | more color=auto'
alias l.='ls -d .* --color=auto'
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''
alias p='pwd'

### premission bound items
alias mkdir='mkdir -p -v'
alias cp='cp -i'
alias mv='mv -i'         
alias ln='ln -i'
alias move='mv'

# rights
alias chmodall='sudo chmod 777'
alias chmodallr='sudo chmod -R 777'

# Privileged access
if [ $UID -ne 0 ]; then
    alias sudo='sudo '
    alias scat='sudo cat'
    alias svim='sudo vim'
    alias root='sudo su'
    alias reboot='sudo reboot'
    alias halt='sudo halt'
    alias netcfg='sudo netcfg2'
fi        

#################################################
################# Text Outputs ##################
#################################################
alias c='cat'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias nano='nano -m'

###############################################
############# Terminal Executions #############
###############################################
alias cls='clear'
alias e='logout'
alias q='exit'
alias eb='exec bash'
alias t='touch'
alias top='htop'


###############################################
################ Git Commands #################
###############################################
alias gcl='git clone'
alias gst='clear; git status -s'
alias gcm='git commit -a -m'
alias gre='git remote -v'
alias gpush='git push origin master'
alias gpull='clear; git pull origin master'

###############################################
################ Compressions #################
###############################################
alias untar='tar -xzvf'

###############################################
################# Devlopment ##################
###############################################
alias diff='diff --color=auto'

# python
alias py2='python2'
alias py='python3'
alias py3='python3'
alias pip='pip'
alias pip2='pip2'
alias pip3='pip'
alias ipy='ipython'

# perl
alias pl='perl'

### go
alias gg='go get'

### log
alias dmesg='dmesg --color=auto'

###############################################
################### Online ####################
###############################################

### online
alias ip='ip -c'
alias curllo='curl LO'
alias openports='netstat --all --numeric --programs --inet --inet6'
alias pg='ps -Af | grep $1'
alias connections='sudo lsof -n -P -i +c 15'
alias arp-clear='ip -s -s neigh flush all'
alias pilocal='ssh pi@192.168.0.16'

##################################################
################### Processes ####################
##################################################

### processes
alias psg='ps -ef | g '
alias j='jobs'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

##################################################
#################### History #####################
##################################################

### history
alias hi='history'
alias hiref='echo -n "Refreshing history... "; hcln; history -c; history -r; echo "done."'
alias hitop='history | awk "{ print $2 }" | sort | uniq -c | sort -rn | head'


##################################################
#################### History #####################
##################################################
## events
alias vdir='vdir --color=auto'
alias watch='watch --color'
alias cower='cower --color=auto'
alias watd='watch -d du --summarize'


##################################################
#################### History #####################
##################################################
# Redirects


##################################################
#################### Storage #####################
##################################################
alias du='du -h'
alias dus='du --summarize'
alias duS='du -sk * | sort -n'
alias df='df -h'

##################################################
###################### Text ######################
##################################################
alias diff='colordiff'             
alias free='free -mlt'
alias more='less'
alias nano='nano -w'
alias ping='ping -c 5'


###################################################
###################### Other ######################
###################################################
#alias beet='sudo beet'

