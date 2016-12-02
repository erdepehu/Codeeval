use strict;
use warnings;
use Data::Dumper;
my $filelike  = 'Remove_characters.txt';
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
	my ($text,$regexp);
	if(/(.+)\,\s([a-z]+)/){
		$text   = $1;
		$regexp = $2;
	}	
    my @characters = split('',$regexp);
    foreach my $char(@characters){
    	$text =~ s/$char//;
    }
    return $text;
}

