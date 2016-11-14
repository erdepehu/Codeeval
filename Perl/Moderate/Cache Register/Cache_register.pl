use strict;
use warnings;
use Data::Dumper;

my $filelike  = 'Cache_register.txt';
my %cash      = (
	"0.01"    => 'PENNY'       ,
	"0.05"    => 'NICKEL'      ,
	"0.10"     => 'DIME'        ,
	"0.25"    => 'QUARTER'     ,
	"0.50"     => 'HALF DOLLAR' ,
	"1.00"    => 'ONE'         ,
	"2.00"    => 'TWO'         ,
	"5.00"    => 'FIVE'        ,
	"10.00"   => 'TEN'         ,
	"20.00"   => 'TWENTY'      ,
	"50.00"   => 'FIFTY'       ,
	"100.00"  => 'ONE HUNDRED'				
);

open my $fh, '<', $filelike or die $!;
while (<$fh>) {
	unless(/^ *$/){
		main(chomp $_);
	} 
}
close $fh or die $!;

sub main {
	my @coins;
	my ($num1,$num2) = split/;/;
	my $diff = $num2-$num1;
	   $diff = sprintf("%.2f",$diff);
	if($diff<0){
		print "ERROR\n";
	}elsif($diff==0){
		print "ZERO\n";
	}else{
		get_diff($diff);
	}
}

sub get_diff {
	my $diff = $_[0];
	my (@coins,$rounded);	
	LABEL1 : foreach my $coin( sort { $b <=> $a } keys(%cash) ){
		if( ($diff eq $coin) || ( $diff > $coin ) ){
			push(@coins,$cash{$coin});	
			$diff-=$coin;
			$diff = sprintf("%.2f",$diff);
			redo;
		}
	}	
    print join(',',@coins) . "\n";
}


