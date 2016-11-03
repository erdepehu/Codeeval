use strict;
use warnings;
use Data::Dumper;
my $filelike  = 'numbers2.txt';
open my $fh, '<', $filelike or die $!;
my $flag=0;

while (<$fh>) {
	unless(/^ *$/){
		print main(chomp $_);
		$flag++;
	}
}

sub main{
	my @integers = split/,/;
    my (@nums,$max);
	my $last;
	$max = $integers[0];
	foreach my $i(0..$#integers){
		foreach(my $j=$i+1;$j<$#integers+1;$j++){
			$last = $integers[$i] + $integers[$j] ;
			if($last>$max){
				$max = $last;
			}
		}
	}
	print "\n" if($flag);
	
	if(scalar @integers == 2){
		$max = $integers[0]+$integers[1];
	}
	
	return $max;
}




