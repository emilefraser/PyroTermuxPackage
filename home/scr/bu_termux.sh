#!/bin/bash - 
#===============================================================================
#
#          FILE: bu_termux.sh
# 
#         USAGE: ./bu_termux.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 05/01/20 21:35
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
bupath="/sdcard/backups"
buname="termux-backup.tar.gz"

cd /data/data/com.termux/files

#create backup
tar -zcvf "$bupath/$buname" home usr

