use strict;
use warnings;

my @coins = qw( 5 3 1 );
my $filelike  = 'Minimum_coins.txt';

open my $fh, '<', $filelike or die $!;
while (<$fh>) {
	unless(/^ *$/){
		print main(chomp $_);
		print "\n";
	}
}
close $fh or die $!;

sub main{
	my $num = $_;
	my $a   = 0;
	my $mod = 0;
	if($num%$coins[0]==0){
		$a = $num/$coins[0];
		return $a;
	}else{
		$a += int($num/$coins[0]);
		$mod = $num%$coins[0];
		if($mod%$coins[1]==0){
			$a += $mod/$coins[1];
			return $a;
		}else{
			$a += int($mod/$coins[1]);
			$mod = $mod%$coins[1];
			$a += $mod/$coins[2];
			return $a;
		}
	}	
}

