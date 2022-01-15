#!/usr/bin/perl
use strict;
my $a = $#ARGV;
print "grep.pl known-good known-bad pattern\n" if $#ARGV != 2;  

my $good = $ARGV[0];
my $bad = $ARGV[1];
my $pattern = $ARGV[2];
# print "good - $good\nbad - $bad\npattern - $pattern\n\n";

my $command = 'cat words';
for my $c (split ('', $good))
{
    $command .= "|grep $c";
}

$command .= "|egrep -v '[$bad]'";
$command .= "|egrep '$pattern'";
print `$command`;