use strict;
use warnings;
use Data::Dumper;

my $filelike  = 'Repeated_substring.txt';
open my $fh, '<', $filelike or die $!;
while (<$fh>) {
	unless(/^ *$/){
		print main(chomp $_);
		print "\n";
	} 
}
close $fh or die $!;

sub main{
    my $line = unspace($_);
    my %hash=();
    my $flag = 0;
    for my $a ( 1 .. length ( $line ) ) {
    	for my $b ( 1 .. ( length ( $line ) + 1 - $a )  ) {
        	my $out = substr ( $line, $a - 1, $b );
        	my $count = () = $line =~ /$out/g;
            if($count>1&&$b>1){
            	push( @{ $hash{$b} }, $out);
            	$flag++;
            }
        }
    }
    if($flag){
    	return $hash{[sort keys %hash]->[-1]}->[0];
    }else{
    	return "NONE";
    }
}

sub unspace {
    my @stringer = @_ ? @_ : $_;
    $_ = join( '', split(' ')) for @stringer;
    return wantarray ? @stringer : "@stringer";
}


