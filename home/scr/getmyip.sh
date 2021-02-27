ip4=$(eval ip -4 addr | grep wlan0 | grep inet | cut -f 1 -d '/')
ip4=${ip4:9}

ip6=$(ifconfig wlan0 | grep inet6)
ip6=${ip6:14 | cut -d '' -f 1}

pubip=${curl ifconfig.me}


echo "ip4: " $ip4
echo "ip6: " $ip6
echo "public ip: " $pubip
