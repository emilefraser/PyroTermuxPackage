#~/setup/p00_env.sh
#!/bin/bash

sdx="/storage/466C-6F22"
pshell="$sdx/shell"
pconfig="$pshell/config"
pgh="$pshell/gh"
pscr="$pshell/scr"

echo "### Copying over Configs ###"
if [ ! -d ~/config ]; then
	mkdir ~/config

	#copy over dotfiles
	cp -r $pdotfiles/* ~/config
	for f in $pdotfiles; do
		mv $f {f:1:50};
	done

fi

echo "### Setting up Termux storage ###"
cp ~/config/bashrc ~/.bashrc
cp ~/config/bash_aliases ~/.bash_aliases
cp ~/config/bash_profile  ~/.bash_profile
cp ~/config/hushlogin ~/.hushlogin
cp ~/config/dir_colors ~/.dir_colors
cp ~/config/netrc ~/.netrc
