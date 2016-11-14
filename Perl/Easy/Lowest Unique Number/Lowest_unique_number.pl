use strict;
use warnings;
open(INFILE, "<", $ARGV[0] );

while(my $line = <INFILE>) {
    next if($line =~ m/^\s$/);    
    chomp $line ; 
    my @prev = split( ' ', $line );    
    my %seen    = ();
    my %deleted = ();
    my $lowest;
        
    foreach my $cnt( 0 .. $#prev ){
        if(!$seen{ $prev[$cnt] } and !$deleted{ $prev[$cnt] } ){
                $seen{ $prev[$cnt] }++;
        }else{
		delete $seen{ $prev[$cnt] };  
		$deleted{ $prev[$cnt] }++;
        }
    }      
    $lowest = [ sort { $a <=> $b } grep{ $_ }keys %seen ] ->[0];
    if($lowest eq undef){
	print "0";
    }else{
	    foreach my $cnt( 0.. $#prev){
		if($prev[$cnt] == $lowest ){
			print $cnt + 1;
			last;
		}
	    }		
    }

    print "\n";
}
close(INFILE);