#!/usr/bin/perl

my $filename = $ARGV[0];
my @data = ();
my $data = 0;
my @tcol0 = ();
my @tcol1 = ();
my @col0 = ();
my @col1 = ();
my $tcol0 = 0;
my $tcol1 = 0;
my $total = 0;
print "filename is $filename\n";

open(IN,"$filename") || die "$filename can't be opened";

while (<IN>){

# split data into separate arrays
  chomp;
 # print "data = $_\n";
  @data = split(' ',$_);
  $data = @data;
  push (@tcol0,$data[0]);
  push (@tcol1,$data[1]);
}

@col0 = sort(@tcol0);
my $col0 = @col0;

@col1 = sort(@tcol1);
my $col1 = @col1;
for ( my $i=0; $i<$col0 ; $i++)
{
  if ( $col0[$i] > $col1[$i])
  {
    $total = $total + ( $col0[$i] - $col1[$i]);
  }
  elsif ($col0[$i] < $col1[$i])
  {
   $total = $total + ( $col1[$i] - $col0[$i]); 
  }
}

print "total = $total\n";

# Sort both arrays
# Calculate the difference between cells
# add up the total difference
# print out result