#~/restore/initial.sh
#!/bin/bash
if [ ! -d ~/restore ]; then
	mkdir ~/restore
fi

# for every restore date folder
sdx=/storage/$(ls /storage | grep -v emulated | grep -v self)
shellx=$sdx/shell
backupx=$shellx/backup
hpath=/data/data/com.termux/files/home

echo "VALUES RETRIEVED"
echo "EtxSD:$sdx"
echo "ShellX:$shellx"
echo "Backupx:$backupx"
echo "hpath:$hpath"

echo "Coying snar file"
cp $backupx/termux.snar ~/restore

# tofo: sort from oldest to youngest
bf=$(ls $backupx/*.tar.gz)
for f in $bf; do
	# termux-20190919_230210.tar.gz
	echo "f:$f"
	fn=$(basename $f)
	fname=${fn:7:8}
	echo "Base filename: $fname"

	echo "Creating ~/restore/$fname"
	if [ ! -d ~/restore/$fname ]; then
		mkdir ~/restore/$fname
	fi

	echo "Extracing $f to ~/restore/$fname/"
	tar -xvf $f -C ~/restore/$fname/
	#echo "Copying ~/restore/$fname/ to ~"
	#cp -r ~/restore/$fname/$path/* ~
	#echo "Deleting ~/restore/$fname/data"
	#rm -f ~/restore/$fname/data
done
	