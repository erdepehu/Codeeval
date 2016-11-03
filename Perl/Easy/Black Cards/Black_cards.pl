use strict;
use warnings;
use Data::Dumper;
my $filelike  = 'black_card.txt';
my $flag = 0;
open my $fh, '<', $filelike or die $!;
while (<$fh>) {
	unless(/^ *$/){
		print main(chomp $_);
		$flag++;
	} 
}
close $fh or die $!;

sub main{
	my (@players,$number);
    if(/(.+)\s\|\s(\d+)/){
	    $number = $2 -1;
		@players = split / /, $1;
	}
	while (1 < scalar @players) {
		splice(@players, $number % scalar @players, 1);
	}
	print "\n" if $flag;
	return $players[0];
}

