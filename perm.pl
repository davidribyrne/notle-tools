#!/usr/bin/perl

use strict;


main();

sub main
{
    my @results = perm("", "-tero", '');
    print(join("\n", @results));
}

sub perm
{
    my ($prefix, $chars, $suffix) = @_;
    # print "${tabs}prefix - $prefix\n${tabs}chars - $chars\n";
    my @chars = split (//, $chars);
    my @values;
    for(my $i = 0; $i < length($chars); $i++)
    {
        my @newChars = @chars;
        my $char = splice(@newChars, $i, 1);
        if ($#newChars > 0)
        {
            # print "${tabs}i - $i\n${tabs}char - $char\n${tabs}newChars - " . join("", @newChars) . "\n";
            my $newChars = join('', @newChars);
            # print "${tabs}results:\n${tabs}" . join ("$tabs\n", @results) . "\n";
            push(@values, perm("$prefix$char", $newChars, $suffix));
        }
        else
        {
            push(@values, "$prefix$char$newChars[0]$suffix");
        }
    }
    # print "${tabs}values:\n${tabs}" . join ("$tabs\n", @values) . "\n";
    return @values;
}