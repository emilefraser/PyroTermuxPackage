#!/bin/bash
for file in ${1}/*
do
  if [ -f "${file}" ]
  then
    extension="$(<<< "${file}" sed -rn 's/^.*\.(.*)$/\1/p')"
    if [ -n "${extension}" ]
    then
      echo "${1}/${extension}"
      sudo mkdir -p "${1}/${extension}"
      sudo mv "${file}" "${1}/${extension}"
        else
            echo "${1}/unknown"
            sudo mkdir -p "${1}/unknown"
            sudo mv "${file}" "${1}/unknown"
        fi
    fi
done
