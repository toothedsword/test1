#!/usr/local/bin/perl
use PDL;
use PDL::NiceSlice;
use PDL::Math;
use PDL::Graphics2D;
use PDL::Graphics::TriD;

my $a = pdl([1..10]);
print $a,"\n";

$a(1:3) .= 0;

print $a,"\n";

imag3d [SURF2D,bessj0(rvals(zeroes(50,50))/2)];
