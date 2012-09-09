# This helped more than anything, went through a whole lot of nonsense without much to show for it.
# http://www.stonehenge.com/merlyn/LinuxMag/col45.html

#!/usr/bin/perl
use strict;
use warnings;
use File::Spec;
use File::Find;
use Data::Dumper;


my $path = 'C:\Users\VK\Dropbox\Documents';
my ($volume,$directories,$file) = File::Spec->splitpath( $path );
my $dropbox_dir = File::Spec->catpath($volume,$directories,$file);

my %file_count;
find( sub {
        if (-f $_) {
	    #$file_count{$_}++;
	    push(@{$file_count{$_}}, $File::Find::name);
	    #if ($file_count{$_} > 1) {
            #    print "$file_count{$_}: $File::Find::name\n";
            #}
	}
    }, $dropbox_dir);


for my $key ( keys %file_count ) {
    if ( scalar(@{$file_count{$key}}) > 1 ) {
        foreach ( @{$file_count{$key}} ) {
            print "$_\n";
        }
    }
}

