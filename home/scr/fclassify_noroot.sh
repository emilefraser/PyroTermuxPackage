#!/bin/bash
for file in ${1}/*
do
  if [ -f "${file}" ]
  then
    extension="$(<<< "${file}" sed -rn 's/^.*\.(.*)$/\1/p')"
    if [ -n "${extension}" ]
    then
      echo "${1}/${extension}"
      mkdir -p "${1}/${extension}"
    
      filename="${file##*/}"
      filename_noext="${filename%.*}"
      filename_propose="${1}/${extension}/${filename}"

      #echo "$filename *** filename"
      #echo "$filename_propose *** filepath_propose"
      #echo "$filename_noext *** filename_noext"

      if [ -f "$filename_propose" ]
      then
        echo "$filename_propose EXISTS! Adding _x."
        
        x=1
        while [ $x -le 100 ]
        do
          filename_new="${1}/${extension}/${filename_noext}_${x}.${extension}"
          echo "$filename_new *** filename_new"
          
          if [ -f "$filename_new" ]
          then
            echo "$filename_new EXISTS, x+1."
          else
            echo "Moving $filename to $filename_new"
            mv "${file}" "${filename_new}"
            break
          fi
            
          x=$(( $x + 1 ))
        done

      else
        echo "Moving $filename to $filename_propose"
        mv  "${file}" "${1}/${extension}"
      fi

    else
      #echo $filename
      #echo "${1}/unknown"
      mkdir -p "${1}/unknown"
      echo "Moving $filename to /unknown"
      mv "${file}" "${1}/unknown"


    fi
  fi
done
