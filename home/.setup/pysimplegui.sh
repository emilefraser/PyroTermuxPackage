#!/bin/bash - 
#===============================================================================
#
#          FILE: pysimplegui.sh
# 
#         USAGE: ./pysimplegui.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 05/01/20 18:41
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
pkg install python
pip3 install pysimplegui
pip3 install pysimpleguiweb

