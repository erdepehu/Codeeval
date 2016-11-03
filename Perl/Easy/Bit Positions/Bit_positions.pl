use strict;
use warnings;
open(INFILE, "<", $ARGV[0] );

while (<INFILE>) {
	unless(/^ *$/){
		main(chomp $_);
	} 
}

sub main{
	my @numbers= split /,/;
	my $bit1 = $numbers[1] - 1;
	my $bit2 = $numbers[2] - 1;
    my @bits = dec2bin($numbers[0]); 
	
	if($bits[$bit1] == $bits[$bit2]){
		print "true\n";
	}else{
		print "false\n";
	} 
}

sub dec2bin{
	my @bits;
	my $dec = shift;
	while ($dec || ! @bits) {
		push @bits, $dec & 1;
		$dec >>= 1;
	}
	return @bits;
}

#Output must be:
#true
#false