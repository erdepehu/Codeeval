use strict;
use warnings;
my $filelike  = 'query_board.txt';
my $flag = 0;
open my $fh, '<', $filelike or die $!;

my @hash = ();

while (<$fh>) {
	unless(/^ *$/){
		main(chomp $_);
		$flag++;
	} 
}
close $fh or die $!;
my @query = get_default();

sub main{
	if(/SetCol\s(\d+)\s(\d+)/){
		setcol($1,$2);
	}elsif(/SetRow\s(\d+)\s(\d+)/){
		setrow($1,$2);
	}elsif(/QueryCol\s(\d+)/){
		print getsum_col($1) . "\n";
	}elsif(/QueryRow\s(\d+)/){
		print getsum_row($1) . "\n";
	}
}

sub setcol{
	my $column = $_[0] ;
	my $value  = $_[1] ;
	
	foreach my $i(0..255){
		$query[$i][$column]=$value;
	}
}

sub setrow{
	my $row   = $_[0] ;
	my $value = $_[1] ;
	
	foreach my $i(0..255){
		$query[$row][$i]=$value;
	} 	
}

sub getsum_col{
	my ($col,$sum)  = ($_[0],0);
	foreach my $i(0..255){
		$sum += $query[$i][$col];
	}
    return $sum;	
}

sub getsum_row{
	my ($row,$sum)  = ($_[0],0);
	
	print \@query;
	<>;
	foreach my $j(0..255){
		$sum += $query[$row][$j];
	}	
    return $sum;	
}

sub get_default{
    my @array;
	foreach my $i(0..255){
		foreach my $j(0..255){
			$array[$i][$j]=0;
		}
	}
	return @array;
}


