use strict;
use warnings;
my $filelike  = 'bit_pos.txt';
my $flag = 0;
open my $fh, '<', $filelike or die $!;
while (<$fh>) {
	unless(/^ *$/){
		print main(chomp $_) . "\n";
	} 
}
close $fh or die $!;

sub main{
	my ($base,$comp) = split/,/;
	my $mult;	
	$mult = $comp;
    while ($base > $comp) {
        $comp += $mult;
    }
    return $comp;
}