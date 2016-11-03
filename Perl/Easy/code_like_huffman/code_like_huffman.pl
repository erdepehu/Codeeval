use strict;
use warnings;
use Data::Dumper;

my $filelike  = 'code_like_huffman.txt';
open my $fh, '<', $filelike or die $!;
while (<$fh>) {
	unless(/^ *$/){
		print main(chomp $_) . "\n";
	} 
}
close $fh or die $!;

sub main{
	print Dumper split //;
}
