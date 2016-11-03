use strict;
open(INFILE, "<", $ARGV[0] );

while(my $line = <INFILE>) {
    next if($line =~ m/^\s$/);
    chomp $line;
    my @delta_times = split( ' ', $line );
    my @time_from_array = split( ':', $delta_times[0] );
    my @time_to_array   = split( ':', $delta_times[1] );
    my $sec   = abs ( ($time_from_array[0] * 3600)  + ($time_from_array[1] * 60)  + $time_from_array[2] - ( ($time_to_array[0] * 3600) + ($time_to_array[1] * 60) + $time_to_array[2] )   ) ;
    my $hours = int ( $sec/ (60*60) ) ;
    my $min   = int ( $sec/ 60 )%60   ;
       $sec   = $sec%60               ;
    
    print sprintf("%02d",$hours). ":" . sprintf("%02d",$min) . ":" . sprintf("%02d",$sec);
    print "\n";
}

#Output must be
#A01:14:46
#A09:06:33
#A00:30:22
#A20:45:08
#A00:15:11