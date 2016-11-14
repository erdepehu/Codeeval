use strict;
use warnings;

my $filelike  = 'Sum_to_zero.txt';
open my $fh, '<', $filelike or die $!;
my $flag = 0;

while (<$fh>) {
	unless(/^ *$/){
		print main(chomp $_);
		print "\n";
	}
}
close $fh or die $!;

sub main{
	my @list  = split /,/;	
	my $count = 0;
	foreach my $i(0..$#list){
		foreach(my $j=$i+1;$j < $#list+1;$j++){
			foreach(my $k=$j+1;$k < $#list+1;$k++){
				foreach(my $l=$k+1;$l < $#list+1;$l++){
					$count += 1 unless($list[$i] + $list[$j] + $list[$k] + $list[$l]) ;
				}
			}
		}
	}
    return $count;
}
