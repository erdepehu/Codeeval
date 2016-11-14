use strict;
use warnings;
use Data::Dumper;

my $filelike  = 'Find_a_square.txt';
open my $fh, '<', $filelike or die $!;
while (<$fh>) {
	unless(/^ *$/){
		if( main(chomp $_) ){
			print "true\n";
		}else{
			print "false\n";
		}
	} 
}
close $fh or die $!;

sub main {	
	#    (0,0), (0,1), (1,1), (1,0)  
	
	print $_;
	if ( /^\((-{0,1}\d+)\,(-{0,1}\d+)\)\,\s\((-{0,1}\d+)\,(-{0,1}\d+)\)\,\s\((-{0,1}\d+)\,(-{0,1}\d+)\)\,\s\((-{0,1}\d+)\,(-{0,1}\d+)\)$/ ) {	   
	   my @coord = sort { $a->[0] <=> $b->[0] || $a->[1] <=> $b->[1] } ([$1, $2], [$3, $4], [$5, $6], [$7, $8]);	  
	   return check_square(@coord);
	}	    
}

sub check_square {
	my @coord = @_;
	
################################################## A #######  B ######################## A  ######  C  ######################  B  ######  D  ######################  C  ######  D  ######
	my @dist_from_center = ( GetDistSquared($coord[0], $coord[1]), GetDistSquared($coord[0], $coord[2]), GetDistSquared($coord[1], $coord[3]), GetDistSquared($coord[2], $coord[3]) );
##################################################### A #######  D ######################## C  ######  B  ######
	my @dist_between_points = ( GetDistSquared($coord[0], $coord[3]), GetDistSquared($coord[2], $coord[1]) );
     
    if( ( keys %{{ map {$_, 1} @dist_from_center }} == 1 ) && ( keys %{{ map {$_, 1} @dist_between_points }} == 1 ) ) {
    	return 1;
    } else {
    	return 0;
    }
}

sub GetDistSquared() {
	my @coord = @_;
    my $dx = $coord[0][0] - $coord[1][0];
    my $dy = $coord[0][1] - $coord[1][1];
    my $distance = $dx * $dx + $dy * $dy;
      
    return $distance;
}











#sub check_square{
#	my @coord = @_;
#	my @center = ( ($coord[0]+$coord[2]+$coord[4]+$coord[6])/4, ($coord[1]+$coord[3]+$coord[5]+$coord[7])/4 );
#	my @dist_from_center = ( GetDistSquared(@center[0,1], @coord[0,1]), GetDistSquared(@center[0,1], @coord[2,3]), GetDistSquared(@center[0,1], @coord[4,5]),GetDistSquared(@center[0,1], @coord[6,7])  );
#	my @dist_between_points = ( GetDistSquared(@coord[0,1], @coord[2,3]), GetDistSquared(@coord[2,3], @coord[4,5]), GetDistSquared(@coord[4,5], @coord[6,7]), GetDistSquared(@coord[0,1], @coord[6,7]) );
#
#    if( ( keys %{{ map {$_, 1} @dist_from_center }} == 1 ) && ( keys %{{ map {$_, 1} @dist_between_points }} == 1 ) ) {
#    	return 1;
#    } else {
#    	return 0;
#    }
#}
#
#sub GetDistSquared() {
#	my @coord = @_;
#    my $dx = $coord[0] - $coord[2];
#    my $dy = $coord[1] - $coord[3];
#    my $distance = $dx * $dx + $dy * $dy;
#    return $distance;
#}