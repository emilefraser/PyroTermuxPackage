# shell options
###############################                                                
##### CORE SHELL OPTIONS ######                                                
###############################                                                
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
shopt -s nocaseglob        # case insensitive globbing

###############################                                                       |
############ STYLE ############                                                       |
###############################                                                       |
# Power Pure Line                                                                  
source ~/gh/pureline/pureline ~/.pureline.conf                                     
                                                                                    |
                                                                                    |
###############################                                                
######## WELCOME SCREEN #######                                                
###############################                                                
clear                                                                         
figlet -f small Pyromaniac                                                         
echo


 # Dir Colours                                                                      |
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)                         
                                                                                   
# fix tput xterm-256-colors                                                        
TERM="xterm"                                                                       
export TERM

###################################                                                |39 47 ######## WELCOME SCREEN ###########                                                
###################################
clear
figlet -f small Pyromaniac                                                         
echo

l