#!/usr/local/bin/perl

use Time::JulianDay;
use PDL;
use PDL::NiceSlice; 
use PDL::FFT;
use PDL::NetCDF;
use DateTime;
use PDL::IO::HDF5;
use Geo::ReadGRIB; 
 
my $t = pdl [1..10];
print "$t\n";
$t(0:3) .= 5;
print "$t\n";

$dt = DateTime->new(
    year       => 2019,
    month      => 2,
    day        => 16,
    hour       => 0,
    minute     => 0,
    second     => 0,
);

$jd = $dt->jd();

# 

