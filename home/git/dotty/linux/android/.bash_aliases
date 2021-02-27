#  ~/.bash_aliases

alias uu='pkg update && pkg upgrade'
alias auu='apt update && apt upgrade'

### path
alias thome='cd $HOME'
alias tstore='cd ~/storage'
alias tusr='cd $PREFIX'
alias tubin='cd $PREFIX/bin'
alias tulib='cd $PREFIX/lib'
alias tuvar='cd $PREFIX/var'
alias d='cd ~/Downloads' 
alias gh='cd ~/gh'
alias pscr='cd ~/pscr'
alias sd='cd /sdcard'
alias sdx='cd /storage/466C-6F22/'
alias music='cd /sdcard/Music'
alias musicx='cd /storage/466C-6F22/music'

### dir
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ls='ls --color=auto'
alias la='ls -A --color=auto'
alias ll='ls -l --color'
alias lsh='ls -lh --color'
alias lla='ls -lA --color'
alias lsd='ls -d */ --color'
alias lz='ll -rS --color'
alias lx='ll -BX --color'
alias lm='la | more color'
alias l.='ls -d .* --color=auto'
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''
#alias .='pwd'
alias p='pwd'
alias lsfiles='for f in *; do [[ -f "$f" ]] && ls -- "$f"; done' 

### premission bound items
alias mkdir='mkdir -p -v'
alias cp='cp -i'
alias mv='mv -i'
#alias rm='rm -i;'         
alias ln='ln -i'
#alias rf='rm -Rf'
alias move='mv'

### terminal executions
alias cls='clear'
alias e='logout'
alias q='exit'
alias eb='exec bash'
alias t='touch'
alias top='htop'


# git
alias gcl='git clone'
alias gst='clear; git status -s'
alias gcm='git commit -a -m'
alias gre='git remote -v'
alias gpush='git push origin master'
alias gpull='clear; git pull origin master'

# compression
alias untar='tar -xzvf'

# code
alias diff='diff --color=auto'

# python
alias py2='python2'
alias py='python3'
alias py3='python3'
alias pip='pip'
alias pip2='pip2'
alias pip3='pip'
alias ipy='ipython'

### go
alias gg='go get'

### log
alias dmesg='dmesg --color=auto'

### text
alias c='cat'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias nano='nano -m'

# rights
alias chownall='sudo chown u0_a296:u0_a296'
alias chownallr='sudo chown -R u0_a296:u0_a296'
alias chmodall='sudo chmod 777'
alias chmodallr='sudo chmod -R 777'

### online
alias ip='ip -c'
alias curllo='curl LO'

### processes
alias psg='ps -ef | g '
alias j='jobs'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

### history
alias hi='history'
alias hiref='echo -n "Refreshing history... "; hcln; history -c; history -r; echo "done."'
alias hitop='history | awk "{ print $2 }" | sort | uniq -c | sort -rn | head'


## events
alias vdir='vdir --color=auto'
alias watch='watch --color'
alias cower='cower --color=auto'
alias watd='watch -d du --summarize'

# Redirect from busybox version
#alias ps='/system/bin/ps'
#alias pwdx='/system/bin/pwdx'

alias btar='$PREFIX/bin/bsdtar'
alias ar='$PREFIX/bin/ar'
alias arp='$PREFIX/bin/arp'
alias awk='$PREFIX/bin/awk'
alias base64='$PREFIX/bin/base64'
alias basename='$PREFIX/bin/basename'
alias bbconfig='$PREFIX/bin/bbconfig'
alias bunzip2='$PREFIX/bin/bunzip2'
alias bzip2='$PREFIX/bin/bzip2'
alias cal='$PREFIX/bin/cal'
alias cat='$PREFIX/bin/cat'
alias chattr='$PREFIX/bin/chattr'
alias chgrp='$PREFIX/bin/chgrp'
#alias chmod='$PREFIX/bin/chmod'
#alias chown='$PREFIX/bin/chown'
alias chpst='$PREFIX/bin/chpst'
alias chrt='$PREFIX/bin/chrt'
alias cksum='$PREFIX/bin/cksum'
alias clear='$PREFIX/bin/clear'
alias cmp='$PREFIX/bin/cmp'
alias comm='$PREFIX/bin/comm'
alias cp='$PREFIX/bin/cp'
alias cpio='$PREFIX/bin/cpio'
alias crond='$PREFIX/bin/crond'
alias crontab='$PREFIX/bin/crontab'
alias cut='$PREFIX/bin/cut'
alias date='$PREFIX/bin/date'
alias dc='$PREFIX/bin/dc'
alias dd='$PREFIX/bin/dd'
alias diff='$PREFIX/bin/diff'
alias dirname='$PREFIX/bin/dirname'
alias dos2unix='$PREFIX/bin/dos2unix'
alias du='$PREFIX/bin/du'
alias echo='$PREFIX/bin/echo'
alias egrep='$PREFIX/bin/egrep'
alias env='$PREFIX/bin/env'
alias envdir='$PREFIX/bin/envdir'
alias expand='$PREFIX/bin/expand'
alias expr='$PREFIX/bin/expr'
alias false='$PREFIX/bin/false'
alias find='$PREFIX/bin/find'
alias fold='$PREFIX/bin/fold'
alias free='$PREFIX/bin/free'
alias fsync='$PREFIX/bin/fsync'
alias ftpd='$PREFIX/bin/ftpd'
alias ftpget='$PREFIX/bin/ftpget'
alias ftpput='$PREFIX/bin/ftpput'
alias fuser='$PREFIX/bin/fuser'
alias getopt='$PREFIX/bin/getopt'
alias grep='$PREFIX/bin/grep'
alias gunzip='$PREFIX/bin/gunzip'
alias gzip='$PREFIX/bin/gzip'
alias hd='$PREFIX/bin/hd'
alias head='$PREFIX/bin/head'
alias hexdump='$PREFIX/bin/hexdump'
alias hostname='$PREFIX/bin/hostname'
alias httpd='$PREFIX/bin/httpd'
alias id='$PREFIX/bin/id'
alias ifconfig='$PREFIX/bin/ifconfig'
alias inotifyd='$PREFIX/bin/inotifyd'
alias install='$PREFIX/bin/install'
alias iostat='$PREFIX/bin/iostat'
alias ipcalc='$PREFIX/bin/ipcalc'
alias kill='$PREFIX/bin/kill'
alias killall='$PREFIX/bin/killall'
alias less='$PREFIX/bin/less'
alias linux32='$PREFIX/bin/linux32'
alias linux64='$PREFIX/bin/linux64'
alias ln='$PREFIX/bin/ln'
alias ls='$PREFIX/bin/ls'
alias lsattr='$PREFIX/bin/lsattr'
alias lsof='$PREFIX/bin/lsof'
alias lsusb='$PREFIX/bin/lsusb'
alias lzma='$PREFIX/bin/lzma'
alias makemime='$PREFIX/bin/makemime'
alias md5sum='$PREFIX/bin/md5sum'
alias mkdir='$PREFIX/bin/mkdir'
alias mkfifo='$PREFIX/bin/mkfifo'
alias mknod='$PREFIX/bin/mknod'
alias mktemp='$PREFIX/bin/mktemp'
alias more='$PREFIX/bin/more'
alias mpstat='$PREFIX/bin/mpstat'
alias nc='$PREFIX/bin/nc'
alias netstat='$PREFIX/bin/netstat'
alias nice='$PREFIX/bin/nice'
alias nmeter='$PREFIX/bin/nmeter'
alias nohup='$PREFIX/bin/nohup'
alias nproc='$PREFIX/bin/nproc'
alias od='$PREFIX/bin/od'
alias patch='$PREFIX/bin/patch'
alias pgrep='$PREFIX/bin/pgrep'
alias pidof='$PREFIX/bin/pidof'
alias pipe_progress='$PREFIX/bin/pipe_progress'
alias pkill='$PREFIX/bin/pkill'
alias pmap='$PREFIX/bin/pmap'
alias popmaildir='$PREFIX/bin/popmaildir'
alias printenv='$PREFIX/bin/printenv'
alias printf='$PREFIX/bin/printf'
#alias pscan='$PREFIX/bin/pscan'
alias pstree='$PREFIX/bin/pstree'
alias pwd='$PREFIX/bin/pwd'
alias readlink='$PREFIX/bin/readlink'
alias realpath='$PREFIX/bin/realpath'
alias reformime='$PREFIX/bin/reformime'
alias renice='$PREFIX/bin/renice'
alias reset='$PREFIX/bin/reset'
alias resize='$PREFIX/bin/resize'
alias rev='$PREFIX/bin/rev'
alias rmdir='$PREFIX/bin/rmdir'
alias route='$PREFIX/bin/route'
alias run-parts='$PREFIX/bin/run-parts'
alias runsv='$PREFIX/bin/runsv'
alias runsvdir='$PREFIX/bin/runsvdir'
alias rx='$PREFIX/bin/rx'
alias script='$PREFIX/bin/script'
alias scriptreplay='$PREFIX/bin/scriptreplay'
alias sed='$PREFIX/bin/sed'
alias sendmail='$PREFIX/bin/sendmail'
alias seq='$PREFIX/bin/seq'
alias setsid='$PREFIX/bin/setsid'
alias setuidgid='$PREFIX/bin/setuidgid'
alias sha1sum='$PREFIX/bin/sha1sum'
alias sha256sum='$PREFIX/bin/sha256sum'
alias sha3sum='$PREFIX/bin/sha3sum'
alias sha512sum='$PREFIX/bin/sha512sum'
alias shuf='$PREFIX/bin/shuf'
alias sleep='$PREFIX/bin/sleep'
alias smemcap='$PREFIX/bin/smemcap'
alias softlimit='$PREFIX/bin/softlimit'
alias sort='$PREFIX/bin/sort'
alias split='$PREFIX/bin/split'
alias start-stop-daemon='$PREFIX/bin/start-stop-daemon'
alias strings='$PREFIX/bin/strings'
alias stty='$PREFIX/bin/stty'
alias sum='$PREFIX/bin/sum'
alias sv='$PREFIX/bin/sv'
alias svlogd='$PREFIX/bin/svlogd'
alias sync='$PREFIX/bin/sync'
alias sysctl='$PREFIX/bin/sysctl'
alias tac='$PREFIX/bin/tac'
alias tail='$PREFIX/bin/tail'
alias tar='$PREFIX/bin/tar'
#alias tcpsvd='$PREFIX/bin/tcpsvd'
alias tee='$PREFIX/bin/tee'
alias telnet='$PREFIX/bin/telnet'
alias telnetd='$PREFIX/bin/telnetd'
alias test='$PREFIX/bin/test'
alias tftp='$PREFIX/bin/tftp'
alias tftpd='$PREFIX/bin/tftpd'
alias time='$PREFIX/bin/time'
alias timeout='$PREFIX/bin/timeout'
alias touch='$PREFIX/bin/touch'
alias tr='$PREFIX/bin/tr'
alias true='$PREFIX/bin/true'
alias tty='$PREFIX/bin/tty'
alias ttysize='$PREFIX/bin/ttysize'
alias udpsvd='$PREFIX/bin/udpsvd'
alias uname='$PREFIX/bin/uname'
alias uncompress='$PREFIX/bin/uncompress'
alias unexpand='$PREFIX/bin/unexpand'
alias uniq='$PREFIX/bin/uniq'
alias unix2dos='$PREFIX/bin/unix2dos'
alias unlink='$PREFIX/bin/unlink'
alias unlzma='$PREFIX/bin/unlzma'
alias unxz='$PREFIX/bin/unxz'
alias unzip='$PREFIX/bin/unzip'
alias uptime='$PREFIX/bin/uptime'
alias usleep='$PREFIX/bin/usleep'
alias uudecode='$PREFIX/bin/uudecode'
alias uuencode='$PREFIX/bin/uuencode'
alias vi='$PREFIX/bin/vi'
alias watch='$PREFIX/bin/watch'
alias wc='$PREFIX/bin/wc'
alias wget='$PREFIX/bin/wget -c'
alias which='$PREFIX/bin/which'
alias whoami='$PREFIX/bin/whoami'
alias whois='$PREFIX/bin/whois'
alias xargs='$PREFIX/bin/xargs'
alias xz='$PREFIX/bin/xz'
alias yes='$PREFIX/bin/yes'


## super
alias sudo='sudo '
alias sudosu='sudo su '


# storage
alias du='du -h'
alias dus='du --summarize'
alias duS='du -sk * | sort -n'
alias df='df -h'

# mod comms
alias diff='colordiff'             
alias free='free -mlt'
alias more='less'
alias nano='nano -w'
alias ping='ping -c 5'

# history

# online
alias openports='netstat --all --numeric --programs --inet --inet6'
alias pg='ps -Af | grep $1'
alias connections='sudo lsof -n -P -i +c 15'
alias arp-clear='ip -s -s neigh flush all'

# dev
alias pl='perl'

#beets
#alias beet='sudo beet'


# package
# Package control
alias apti='apt-get install'
alias aptr='apt-get remove'
alias aptp='apt-get purge'
alias aptu='apt-get update'
alias aptfi='apt-get -f install'
alias aptse='apt-cache search'
alias aptshh='apt-cache show'
alias aptp='apt-cache policy'
alias aptcl='apt-get clean && apt-get autoclean && apt-get dist-clean && apt-get autoremove'
alias upgrade='apt-get update && apt-get upgrade && apt-get clean'
alias dpi='dpkg -i'
alias dps='dpkg -S'
alias dpc='dpkg -c'
alias dpl='dpkg -l'
alias dplf='dpkg -L'
alias dpr=' dpkg-reconfigure'
alias pkgi='pkg install'
alias pkgup='pkg upgrade'
alias pkgun='pkg uninstall'
alias pkgf='pkg f'
alias pkgr='pkg re'
alias pkgsh='pkg sh'
alias pkgs='pkg se'
alias pkgla='pkg list-a'
alias pkgli='pkg list-i'       

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

# todo
# logina
#alias pilocal='ssh pi@192.168.0.16'

#music












