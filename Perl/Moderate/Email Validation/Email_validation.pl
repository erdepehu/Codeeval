use strict;
use warnings;
open(INFILE, "<", $ARGV[0] );

while (<INFILE>) {
	unless(/^ *$/){
		main(chomp $_);
	} 
}

sub main{
    if (/[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+/) 
    { 
        print "true\n"; 
    } else{
        print "false\n";    
    }
}