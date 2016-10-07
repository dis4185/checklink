# checklink

Required perl libs:
<pre>
apt-get install liblog-any-perl
apt-get install liblog-any-adapter-perl
apt-get install libyaml-perl
apt-get install make
perl -MCPAN -e 'install Log::Any::Adapter::Screen'
perl -MCPAN -e 'install Net::Ping::External'
</pre>

Memo:
sudo visudo
<pre>
# Cmnd alias specification
Cmnd_Alias IPTABLES_CMDS = /sbin/iptables

#To the end of fole
user_name ALL=(ALL) NOPASSWD: IPTABLES_CMDS
</pre>

