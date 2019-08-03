#!/usr/bin/perl

use warnings;
use strict;
use autodie;
use Cwd;
use File::Basename;
use File::Copy;


my $working_directory = Cwd::abs_path(dirname(__FILE__));
my $scripts_path = $working_directory.'/.scripts/';
my $home = $ENV{HOME};
my $destination = "$home/.scripts";
my $my_bin = '/usr/local/bin';


my $fh;
opendir($fh, $scripts_path);
my @scripts = map { $_ = {path => $scripts_path, name => $_} } grep !/^\.\.?$/, readdir($fh); 


mkdir($destination) if (@scripts && !-d $destination);


foreach my $script (@scripts) {
    my $from = $script->{path}.'/'.$script->{name};
    my $to = $destination.'/'.$script->{name};
    if(copy($from, $to)) {
        make_executable($to);
        print "Copied $from -> $to\n";
        create_symbolic_link($to, $my_bin);
    } else {
        print "Failed to Copy $from -> $to  $!\n";
        exit(1);
    }
}

sub make_executable {
    my ($to) = @_;
    my $cmd = "chmod +x $to";
    system($cmd);
}
sub create_symbolic_link {
    my ($target, $link_name) = @_;
    my $cmd = "sudo ln -sfn $target $link_name";
    print "Creating link $cmd\n";
    system($cmd);
}
