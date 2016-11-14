use strict;
use warnings;
my $filelike  = 'Sum_of_integers.txt';
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
        my @integers        = split/,/;
        my $max_so_far      = [sort { $a <=> $b } @integers]->[0];
        my $max_ending_here = 0;
		 

        foreach(@integers){
                $max_ending_here = $max_ending_here + $_;

                if($max_so_far < $max_ending_here){
                        $max_so_far = $max_ending_here;
                }      
                if($max_ending_here < 0){
                        $max_ending_here = 0;
                }
        }

        return $max_so_far;
}

#A L G O R Y T Y H M
#http://code.geeksforgeeks.org/IV8xGF