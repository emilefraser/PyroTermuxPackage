#!/bin/bash

fpath=${1}
for f in ${fpath}/*; do


	sudo 7z a "$f.7z" $f -r -sdel
	echo $f
echo ""
done	
