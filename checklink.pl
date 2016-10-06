#!/usr/bin/perl
use strict;
use warnings;
#use Net::Ping;
use Net::Ping::External qw(ping);
#sudo perl -MCPAN -e 'install Net::Ping::External'
use Log::Any qw($log);
#sudo apt-get install liblog-any-perl
#use Log::Any::Adapter ('Stdout');
use Log::Any::Adapter;
#sudo apt-get install make
#sudo perl -MCPAN -e 'install Log::Any::Adapter::Screen'

#sudo apt-get install liblog-any-adapter-perl
use YAML::XS 'LoadFile';
#sudo apt-get install libyaml-perl
#use Config::YAML;
#sudo apt-get install libconfig-yaml-perl

Log::Any::Adapter->set('Screen',
      min_level => 'debug', # default is 'warning'
      #colors    => { trace => 'bold yellow on_gray', ... }, # customize colors
      use_color => 1, # force color even when not interactive
      stderr    => 0, # print to STDOUT instead of the default STDERR
     # formatter => sub { "LOG: $_[1]" }, # default none
 );

#use Log::Any::Adapter ('File', '/path/to/file.log');
#my $config = YAML::LoadFile('config.yaml');
my $config = LoadFile('config.yaml');

while (1)
{
#$log->info();
	if(cheklink($config->{remotehost1}) || cheklink($config->{remotehost2}))
	 {
	 $log->info("Link OK");
	 system("sh linkup.sh");
	 }
	else
		{$log->warn("Link is down\n");
		system("sh linkdown.sh");
		}
	sleep $config->{timeout};
}

sub cheklink {
my $h_name = shift;
$log->info("Pinging $h_name....");
my $pong = ping (host => $h_name);
if ($pong) { return 1;}#OK
else {
  $log->err("Remote host unreachable");
  return 0; 
  } 
}
