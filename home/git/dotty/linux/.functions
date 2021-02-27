# ~/.functions 
# All functions made available by the bash terminal (mostly onelines)

## Rights
function chs() {
  sudo chmod 777 $1 $2
}

## Directories
function mkd () {
  mkdir -p "$@" && cd "$@"
}

## History
function top10() {
  history | awk '{a[$2]++ } END {
  for(i in a) {
    print a[i] " " i
    }
  }' | sort -rn | head;
}

## Storage
function dirsize() {
  du -shx * .[a-zA-Z0-9_]* 2> /dev/null |   egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
    egrep '^ *[0-9.]*M' /tmp/list
    egrep '^ *[0-9.]*G' /tmp/list
    rm -Rf /tmp/list
}

## Info
function myip() {
    local ip=$(curl http://ifconfig.me/ip)
    echo "My IP:" $ip
}

function netinfo () {
    echo "--------------- Network Information ---------------"
    /system/bin/ifconfig | awk /'inet addr/ {print $2}'
    /system/bin/ifconfig | awk /'Bcast/ {print $3}'
    /system/bin/ifconfig | awk /'inet addr/ {print $4}'
    /system/bin/ifconfig | awk /'HWaddr/ {print $4,$5}'
    echo $(myip)
    echo "---------------------------------------------------"
}

## Find
function f() {
    find . -name "$1" 2>&1 | grep -v 'Permission denied'
}

## Process
function psa () {
    ps aux | grep $1
}