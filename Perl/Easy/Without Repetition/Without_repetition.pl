use strict;
use warnings;

my $filelike  = 'without_repet.txt';
open my $fh, '<', $filelike or die $!;
while (<$fh>) {
	unless(/^ *$/){
		main(chomp $_);
	} 
}
close $fh or die $!;

sub main{
    my $line = $_;	
    $line =~ s/(.)\1+/$1/g;
	print $line;
}


