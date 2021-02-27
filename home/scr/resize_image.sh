#!/bin/bash - 
#===============================================================================
#
#          FILE: resize_image.sh
# 
#         USAGE: ./resize_image.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 04/27/20 21:46
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
file="${1}"
ext="${file##*.}"
           folder=$(dirname "${file}")
           filename=$(basename "${file}" ".$ext")
           filename=${filename%.*}                              echo "in: $folder $filename $ext"
        convert "$folder/$filename.$ext"  -resize 192x192 "$folder/$filename-icon.$ext"
