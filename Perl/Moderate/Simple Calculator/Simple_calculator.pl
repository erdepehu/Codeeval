use strict;
use warnings;
use Data::Dumper;

my $filelike  = 'Simple_calculator.txt';
my $precedence = {};

open my $fh, '<', $filelike or die $!;
while (<$fh>) {
	unless(/^ *$/){
		main(chomp $_);
		print "\n";
	}
}
close $fh or die $!;

sub main{
	my $line = $_;
	my @elements = split /$line/;

	if( scalar grep{ /[^\(\)]/ } @elements > 0 ){
		#print "Nincs benne precedencia!!!";
		no_prec($line);
	};   
}

sub no_prec{
	my @n = $_ =~ /(\d+[*\/]\d+)+/;
	print Dumper @n;
}