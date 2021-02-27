#!/bin/bash - 
#===============================================================================
#
#          FILE: countfiles.sh
# 
#         USAGE: ./countfiles.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 04/13/20 12:55
#      REVISION:  ---
#===============================================================================

set -o nounset                              

folder=${1}

for i in $folder/* $folder/.* ; do 
    echo -n $i": " ; 
    (sudo find "$i" -type f | wc -l) ; 
done


