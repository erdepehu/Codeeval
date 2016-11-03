use strict;
use warnings;

my $filelike  = 'shortest_rep.txt';
open my $fh, '<', $filelike or die $!;
while (<$fh>) {
	unless(/^ *$/){
		print main(chomp $_) . "\n";
	} 
}
close $fh or die $!;

sub main{
    my $string;
	if( /^(.+?)(\1+)(.*)$/ ){
		$string = $1;
	}else{
		$string = $_;
	};
	return length $string;
}




