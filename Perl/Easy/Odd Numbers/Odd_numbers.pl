use strict;

&even();

sub even
{
  my @array = (0..100);
  
  foreach my $number(@array)
  {
   if($number % 2 == 1)
    {
      print $number . "\n";
    }
  }
}