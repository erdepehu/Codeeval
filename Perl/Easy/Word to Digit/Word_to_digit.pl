use strict;

open(INFILE, "<", $ARGV[0] );

while(my $line = <INFILE>) {
     my $words = {
	    "zero"  => 0,
        "one"   => 1,
        "two"   => 2,
        "three" => 3,
        "four"  => 4,
        "five"  => 5,
        "six"   => 6,
        "seven" => 7,
        "eight" => 8,
        "nine"  => 9,
    };    
	
    next if($line =~ m/^\s$/);    
	
	my @list = split(';', $line);
	print $words->{ $_ } for (@list);
	print $words->{ $_ } for (split('\n', $list[-1] ));
	print "\n";
}
close(INFILE);