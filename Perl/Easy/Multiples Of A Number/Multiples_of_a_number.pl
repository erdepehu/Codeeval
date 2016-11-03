use warnings;
open(INFILE, "<", $ARGV[0] );

while (<INFILE>) {
	unless(/^ *$/){
		print main(chomp $_) . "\n";
	} 
}

sub main{
	my ($base,$comp) = split/,/;
	my $mult;	
	$mult = $comp;
    while ($base > $comp) {
        $comp += $mult;
    }
    return $comp;
}