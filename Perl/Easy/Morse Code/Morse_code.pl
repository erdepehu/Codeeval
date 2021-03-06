use strict;
use warnings;
my %morsecode=(
    '.-'    =>'A',  '-...'  =>'B',  '-.-.'  =>'C',  '-..'   =>'D',
    '.' =>'E',  '..-.'  =>'F',  '--.'   =>'G',  '....'  =>'H',
    '..'    =>'I',  '.---'  =>'J',  '-.-'   =>'K',  '.-..'  =>'L',
    '--'    =>'M',  '-.'    =>'N',  '---'   =>'O',  '.--.'  =>'P',
    '--.-'  =>'Q',  '.-.'   =>'R',  '...'   =>'S',  '-' =>'T',
    '..-'   =>'U',  '...-'  =>'V',  '.--'   =>'W',  '-..-'  =>'X',
    '-.--'  =>'Y',  '--..'  =>'Z',  '.----' =>'1',  '..---' =>'2',
    '...--' =>'3',  '....-' =>'4',  '.....' =>'5',  '-....' =>'6',
    '--...' =>'7',  '---..' =>'8',  '----.' =>'9',  '-----' =>'0',
    '.-.-.-'=>'.',  '--..--'=>',',  '---...'=>':',  '..--..'=>'?',
    '.----.'=>'\'', '-...-' =>'-',  '-..-.' =>'/',  '.-..-.'=>'\"', ''=>' '
);
my @k = keys %morsecode;
my @v = values %morsecode;
my $filelike  = 'morsecode.txt';
open my $fh, '<', $filelike or die $!;
while (<$fh>) {
	unless(/^ *$/){
		print main(chomp $_) . "\n";
	} 
}
sub main{
	my $message = join "", map { $morsecode{$_} // $_ } split / /;
}
