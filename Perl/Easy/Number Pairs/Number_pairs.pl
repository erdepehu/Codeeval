use strict;
use warnings;
use Data::Dumper;

my $filelike  = 'numbers.txt';
open my $fh, '<', $filelike or die $!;
while (<$fh>) {
	unless(/^ *$/){
		main(chomp $_);
	} 
}
close $fh or die $!;

sub main{
	my ($core, $number) = split /;/;
	my @numbers = split(/,/,$core);
	my $flag    = 0;		
	my @unique  = get_unique(@numbers);			
	
	foreach my $i(0..$#numbers){
		foreach(my $j=$i+1;$j < $#numbers+1;$j++){
			if ( check_sum($numbers[$i],$numbers[$j],$number) && ( scalar grep(/$numbers[$j]/,@unique) )   ) {
					#2.mo pair kiiratasa pontos vesszo nelkul, meg egy pontos vesszo csak akkor a kiiras elejre ha a flag erteke !0
					$flag++;
					print join( ",", sort { $a <=> $b } ($numbers[$i],$numbers[$j])) . ";";
					#1.mo array be pairek, kivul join ba print
				}elsif ( check_sum($numbers[$i],$numbers[$j],$number) ) {
					print "\n";
				}
			}
	}
	unless ($flag) {
		print "NULL\n";
	}else{
		print "\n";
	}
}

sub check_sum(){
	if ($_[0] + $_[1] == $_[2]) {		
		return 1;
	}else{
		return 0;
	};
}

sub get_unique{
	my %hash = ();
	my ($hash,@ret);
	foreach (@_) {
		$hash{$_} = 0 unless (exists($hash{$_}));
		$hash{$_}++;
	}
	foreach (keys(%hash)) {
		push(@ret, $_) if $hash{$_} == 1;
	}
	return @ret;
}



