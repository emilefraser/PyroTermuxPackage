#!/bin/bash  
#HOME="/data/data/com.termux/files/home"
repopath=$HOME/storage/shared/repos/PyroTermux/home
gitlist=$HOME/.gitlist
#folder=$(head -n 1 gitlist)

while read line; do
        if [ -z "${folder}" ]
        then
                folder=$line
                subfolder=${folder//'$HOME'/}
                reposubfolder=$repopath$subfolder
                [[ -d $reposubfolder  ]] || mkdir $reposubfolder
        else    
                if [ -z "${line}" ]
                then
                        folder=""
                else
                        echo "Copying... $reposubfolder"
                       eval "yes | cp -rf $folder/$line $reposubfolder"
                fi
        fi
done < $gitlist

# remove .git subfolder modulea
find $repopath -name '.git' -type d -exec rm -rf {} +
find $repopath -name '.github' -type d -exec rm -rf {} +

# push repo
cd $repopath
cd..
currentdt=$(date +"%Y-%m-%d %T")
git add *
git commit -m "auto commit $currentdt"
git push

