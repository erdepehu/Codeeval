use warnings;
use strict;
use Data::Dumper;

#\d{3}  3jegyu szamokat listazza ki
#(\d{3})+? elso ilyet 

my $szoveg = "575745";
if ($szoveg=~/(\d{2})/) {
  print "$1\n";
}
if ($szoveg=~/(\d{2})+?/) {
  print "$1\n";
}
if ($szoveg=~/(\d{3})+?/) {
  print "$1\n";
}

if ($szoveg=~/(\d)(\d{4})/) {
  print "$1\n";
  print "$2\n";
}

$szoveg = "12222222";

if ($szoveg=~/(\d{2,4})+?/) {
  print "*" x 30;
  print "$1\n";
}

$szoveg = "12:05:30";
$szoveg =~ m/(\d+):(\d+):(\d+)/;
#my ($hours $minutes $seconds) = ($1, $2, $3);

#print "$hours, $minutes, $seconds\n";

#[a-f] a-f intervallumon belulrol szedje ki
#[^a-f] a-f intervallumon kivulrol szedje ki

print Dumper $szoveg = join('',('a'..'z'));

if ($szoveg=~/(\D+)/) {
  print "$1\n";
}

if ($szoveg=~/([a-f]+)/) {
  print "$1\n";
}

if ($szoveg=~/([^a-f]+)/) {
  print "$1\n";
}

$szoveg .="hun";

if ($szoveg=~/(hun)/) {
  print "$1\n";
}

# Q U A N T I F I E R S

=pod

 /x{0,1}/  same as /x?/

 /x{0,}/  same as /x*/

 /x{1,}/  same as /x+/
 
 Perl has two sets of quantifiers: the maximal
 match quantifiers like *, +, ? (sometimes called greedy)
 and the minimal march quantifies *?, +?, ??, and {}?. 
 The latter are also called lazy quantifiers.
 
=cut
