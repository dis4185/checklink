sudo iptables  -D INPUT -i eth0 -p tcp --dport 2004 -j DROP
sudo iptables  -A INPUT -i eth0 -p tcp --dport 2004 -j DROP