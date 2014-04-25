#!/usr/bin/perl

use strict;
use warnings;
use Getopt::Long;
use File::Find;
use Cwd;

my $record = "test/baseCounter.csv";
my $date;
GetOptions ("d=s" => \$date,
            "o=s" => \$record           
            )
    or usage("Incorrect options.");
my $mtime = (stat $record)[9]; 
if($date){} #TODO convert date to mtime and overwrite mtime

my $files_ref = findBcls($mtime); #returns a hash of machine + files
sumAndPrint($files_ref);

sub usage{
    print "perl main.pl [options]\n";
    print "\t-o <output file>; default \"baseCounter.csv\"";
    print "\t-d <date>; default is timestamp of output file\n"; 
}

sub findBcls{
    my $date = shift;
    my %options = ( wanted => \&printBcls,
                    follow => 1, #TODO: follow and preprocess do not work together. Bypass symlinks with /.mounts/labs/prod/archive
                    follow_skip => 2,
                    preprocess => \&checkTimestamp);
    find(\%options, "/oicr/data/archive"); #todo: fix hardcoding
}

sub checkTimestamp{
    my @new;
    foreach (@ARGV){
        my $entry_time = (stat $_)[9];
        if ($entry_time gt $mtime){
            push @new, $_;
            print "pushed $_\n";
        }
    }
    return @new;
}

sub printBcls{
    my $mtime2 = (stat $File::Find::name)[9]; 
    if($File::Find::name =~ /([Dhim][0-9]+)\[0-9a-zA-z]+\/Data\/Intensities\/BaseCalls\/L[0-9]+\/C[0-9]+\.1\/[a-zA-Z0-9_]+\.bcl/ && $mtime2 gt $mtime){
        print "$File::Find::name\n";
    }
}

sub sumAndPrint{
    
}

# /oicr/data/archive/D00353/140103_D00353_0030_AC3A9YACXX/Data/Intensities/BaseCalls/L001/C92.1/test.bcl


