#!/bin/bash - 
#===============================================================================
#
#          FILE: pyrossh.sh
# 
#         USAGE: ./pyrossh.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 02/07/21 00:31
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

# ssh-keygen -t rsa -b 2048
# ssh-copy-id id@server
sshpass -p 'EmFr_Oct25'  ssh 'efraser25@gmail.com'@10.0.0.4

