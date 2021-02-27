# ~/.bashrc
# For terminal related options and more complex terminal functions


################################################
########### TERMINAL RELATED OPTIONS $##########
################################################
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=50
HISTFILESIZE=2000

# Select SSL LIBRARY
# PYCURL_SSL_LIBRARY=openssl

# try_catch
set -o pipefail
declare -ig __oo__insideTryCatch=0

################################################
########## TERMINAL RELATED FUNCTIONS ##########
################################################

# For the more extensive functions


# Run `dig` and display the most useful info
function digga() {
	dig +nocmd "$1" any +multiline +noall +answer;
}

# Create a data URL from a file
function dataurl() {
	local mimeType=$(file -b --mime-type "$1");
	if [[ $mimeType == text/* ]]; then
		mimeType="${mimeType};charset=utf-8";
	fi
	echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}


 Start an HTTP server from a directory, optionally specifying the port
function server() {
	local port="${1:-8000}";
	sleep 1 && open "http://localhost:${port}/" &
	# Set the default Content-Type to `text/plain` instead of `application/octet-stream`
	# And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
	python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
}

# Start a PHP server from a directory, optionally specifying the port
# (Requires PHP 5.4.0+.)
function phpserver() {
	local port="${1:-4000}";
	local ip=$(ipconfig getifaddr en1);
	sleep 1 && open "http://${ip}:${port}/" &
	php -S "${ip}:${port}";
}


# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
	tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}

################################################
########## Gets direcdtory or filesize##########
################################################
# Determine size of a file or total size of a directory
function fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh;
	else
		local arg=-sh;
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@";
	else
		du $arg .[^.]* ./*;
	fi;
}



#####################################
############ Compression ############
#####################################
function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) 
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.cbr|*.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.cbz|*.epub|*.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *.cpio)      cpio -id < ./"$n"  ;;
            *.cba|*.ace)      unace x ./"$n"      ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}

function compress() {
  ftocompress="${1}"
  fcompressmethod="${2}"

  if [ "$fcompressmethod" -rq  "7z"]; then
    echo "7z todo"
  else 
    echo "tgz compression"
    tar -cvzf $ftocompress.tgz --owner=0 --group=0 $ftocompress
  fi
	
}


# Compare original and gzipped file size
function gz() {
	local origsize=$(wc -c < "$1");
	local gzipsize=$(gzip -c "$1" | wc -c);
	local ratio=$(echo "$gzipsize * 100 / $origsize" | bc -l);
	printf "orig: %d bytes\n" "$origsize";
	printf "gzip: %d bytes (%2.2f%%)\n" "$gzipsize" "$ratio";
}


# Create a .tar.gz archive, using `zopfli`, `pigz` or `gzip` for compression
function targz() {
	local tmpFile="${@%/}.tar";
	tar -cvf "${tmpFile}" --exclude=".DS_Store" "${@}" || return 1;

	size=$(
		stat -f"%z" "${tmpFile}" 2> /dev/null; # macOS `stat`
		stat -c"%s" "${tmpFile}" 2> /dev/null;  # GNU `stat`
	);

	local cmd="";
	if (( size < 52428800 )) && hash zopfli 2> /dev/null; then
		# the .tar file is smaller than 50 MB and Zopfli is available; use it
		cmd="zopfli";
	else
		if hash pigz 2> /dev/null; then
			cmd="pigz";
		else
			cmd="gzip";
		fi;
	fi;

	echo "Compressing .tar ($((size / 1000)) kB) using \`${cmd}\`…";
	"${cmd}" -v "${tmpFile}" || return 1;
	[ -f "${tmpFile}" ] && rm "${tmpFile}";

	zippedSize=$(
		stat -f"%z" "${tmpFile}.gz" 2> /dev/null; # macOS `stat`
		stat -c"%s" "${tmpFile}.gz" 2> /dev/null; # GNU `stat`
	);

	echo "${tmpFile}.gz ($((zippedSize / 1000)) kB) created successfully.";
}



#####################################
############## Backup ###############
#####################################
#function backup() {
	#SDX=$(ls /storage | grep -v emulated | grep -v self)
	#BUSRC=~
	#BUDEST=/storage/$SDX/shell/backup
	#BUDATE=`date '+%Y%m%d_%H%M%S'`
	#BUFILE=termux-$BUDATE.tar.gz
	#BUSNAP=~/termux.snar

#	FILENAME=backup-$TIME.tar.gz
	
#	sudo tar -cvf $BUDEST/$BUFILE -g $BUSNAP $BUSRC
#	sudo cp $BUSNAP $BUDEST   
#}

####################################
########## Error Handling ##########
####################################

# if try-catch is nested, then set +e before so the parent handler doesn't catch us
#alias try="[[ \$__oo__insideTryCatch -gt 0 ]] && set +e;
#           __oo__insideTryCatch+=1; ( set -e;
#          trap \"Exception.Capture \${LINENO}; \" ERR;"
#alias catch=" ); Exception.Extract \$? || "

#Exception.Capture() {
#    local script="${BASH_SOURCE[1]#./}"

    #if [[ ! -f /tmp/stored_exception_source ]]; then
    #    echo "$script" > /tmp/stored_exception_source
    #fi
    #if [[ ! -f /tmp/stored_exception_line ]]; then
    #    echo "$1" > /tmp/stored_exception_line
    #fi
   # return 0
#}

#Exception.Extract() {
#    if [[ $__oo__insideTryCatch -gt 1 ]]
#    then
#        set -e
#    fi

#    __oo__insideTryCatch+=-1

#    __EXCEPTION_CATCH__=( $(Exception.GetLastException) )

#    local retVal=$1
#    if [[ $retVal -gt 0 ]]
#    then
#        # BACKWARDS COMPATIBILE WAY:
#        # export __EXCEPTION_SOURCE__="${__EXCEPTION_CATCH__[(${#__EXCEPTION_CATCH__[@]}-1)]}"
##        # export __EXCEPTION_LINE__="${__EXCEPTION_CATCH__[(${#__EXCEPTION_CATCH__[@]}-2)]}"
#        export __EXCEPTION_SOURCE__="${__EXCEPTION_CATCH__[-1]}"
#        export __EXCEPTION_LINE__="${__EXCEPTION_CATCH__[-2]}"
#        export __EXCEPTION__="${__EXCEPTION_CATCH__[@]:0:(${#__EXCEPTION_CATCH__[@]} - 2)}"
#        return 1 # so that we may continue with a "catch"
#    fi
#}

#Exception.GetLastException() {
#    if [[ -f /tmp/stored_exception ]] && [[ -f /tmp/stored_exception_line ]] && [[ -f /tmp/stored_exception_source ]]
#    then
#        cat /tmp/stored_exception
#        cat /tmp/stored_exception_line
#        cat /tmp/stored_exception_source
#    else
#        echo -e " \n${BASH_LINENO[1]}\n${BASH_SOURCE[2]#./}"
#    fi

#    rm -f /tmp/stored_exception /tmp/stored_exception_line /tmp/stored_exception_source
#    return 0
#}

######################################
########## DEDUBBING OUTPUT ##########
######################################
function debug-h1() {
	thead=$1
	tchar="#"
	tchar_lead=10
	tchar_trail=10
	tline_before=true
	tline_after=true
	tnumlines_before=1
	tnumline_after=1
	tupper=true

 	thead_len=${#thead}
 	#echo $thead
 	#echo $thead_len
 	tnum_above=$(($tchar_lead + 1 + $thead_len + 1 + $tchar_trail))
	tnum_below=$((tnum_above))
 	#echo $tnum_above

 	#for i in $(seq $tnum_above); do echo -n $tchar; done
 	head -c $tnum_above </dev/zero | tr '\0' $tchar
	echo '' 	
 	head -c $tchar_lead </dev/zero | tr '\0' $tchar && \
    echo -n ' ' && \
    echo -n $thead && \
    echo -n ' ' && \
    head -c $tchar_trail </dev/zero | tr '\0' $tchar && \
    echo '' &&
	head -c $tnum_below </dev/zero | tr '\0' $tchar &&
    echo ''
    
}


# Show all the names (CNs and SANs) listed in the SSL certificate
# for a given domain
function getcertnames() {
	if [ -z "${1}" ]; then
		echo "ERROR: No domain specified.";
		return 1;
	fi;

	local domain="${1}";
	echo "Testing ${domain}…";
	echo ""; # newline

	local tmp=$(echo -e "GET / HTTP/1.0\nEOT" \
		| openssl s_client -connect "${domain}:443" -servername "${domain}" 2>&1);

	if [[ "${tmp}" = *"-----BEGIN CERTIFICATE-----"* ]]; then
		local certText=$(echo "${tmp}" \
			| openssl x509 -text -certopt "no_aux, no_header, no_issuer, no_pubkey, \
			no_serial, no_sigdump, no_signame, no_validity, no_version");
		echo "Common Name:";
		echo ""; # newline
		echo "${certText}" | grep "Subject:" | sed -e "s/^.*CN=//" | sed -e "s/\/emailAddress=.*//";
		echo ""; # newline
		echo "Subject Alternative Name(s):";
		echo ""; # newline
		echo "${certText}" | grep -A 1 "Subject Alternative Name:" \
			| sed -e "2s/DNS://g" -e "s/ //g" | tr "," "\n" | tail -n +2;
		return 0;
	else
		echo "ERROR: Certificate not found.";
		return 1;
	fi;
}








