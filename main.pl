#!/usr/bin/perl

use strict;
use warnings;
use Getopt::Long;

sub usage{
    print "perl main.pl [options]\n";
    print "\t-o <output file>; default \"baseCounter.csv\"";
    print "\t-d <date>; default is timestamp of output file\n"; 
}

my $record = "baseCounter.csv";
my $mtime = (stat $record)[9]; 

GetOptions ("d=s" => \$date,
            "o=s" => \$record           
            )
    or usage("Incorrect options.");
#TODO convert date to mtime and overwrite mtime



#my $mtime1 = (stat "clic_thePLAN.txt")[9]; 
#my $mtime2 = (stat "blabdsds")[9];
#
#print "clic_thePLAN was made at: $mtime1\n";
#print "blabdsds was made at: $mtime2\n";
