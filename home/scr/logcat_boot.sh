#!/system/bin/sh
{
rm -f /data/media/0/bootlog_last.log
[ -e /data/media/0/bootlog.log ]&&mv /data/media/0/bootlog.log /data/media/0/bootlog_last.log
logcat -f /data/media/0/bootlog.log &
sleep 30
kill %1
exit
} &