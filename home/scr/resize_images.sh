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
for dir in ${1}/*
do
	for file in ${dir}/*
	do
    	if [ -f "${file}" ]
    	then
	   ext="${file##*.}"
	   folder=$(dirname "${file}")
	   filename=$(basename "${file}")
	   filename=${filename%.*}
	   echo "in: $folder $filename $ext"
	convert "$folder/$filename.$ext"  -resize 192x192 "$folder/$filename-icon.$ext"
    fi
	done	
done
