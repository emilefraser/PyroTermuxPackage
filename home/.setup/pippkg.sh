#!/bin/bash - 
#===============================================================================
#
#          FILE: pippkg.sh
# 
#         USAGE: ./pippkg.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 02/18/21 23:43
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
pip install --upgrade pip setuptools
pip install --upgrade httpie
pip install -U requests[socks]
pip install requests
pip install ddgr
pip install w3m


