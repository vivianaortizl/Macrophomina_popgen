#!/usr/bin/perl  
# substr.pl  
use strict; use warnings;  
  
my $seq = "agttcgtcaaattcggtcttaccagcgaggccttgcgctcatacgtcgacctcatcaccg";  
my $first5 = substr($seq, 0, 5);  
my $last10 = substr($seq, length($seq) - 10, 10);  
print "$first5 ... $last10\n";