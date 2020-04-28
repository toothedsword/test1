#!/home/leon/perl5/5.30.0/bin/perl
#===============================================================================
#
#         FILE: test_pdl3.pl
#
#        USAGE: ./test_pdl3.pl  
#
#  DESCRIPTION: test 
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Liang Peng (...), pengliang@piesat
# ORGANIZATION: ...
#      VERSION: 1.0
#      CREATED: 09/30/2019 10:38:34 AM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;

use PDL;
use PDL::NiceSlice;
use PDL::Math;
use PDL::Graphics2D;
use PDL::Graphics::TriD;
use PDL::IO::HDF5;

use PDL::NetCDF;
use PDL::Char;

use v5.10;

my $a = sequence 10;
say $a;

my $b = $a->dummy(1,10);
$b = sequence(10,10);
say shape $b;
say $b;
$b(5,5:8) .= $a(1:4)->(*1);
say $b;

say $b(5,1:4);
say $a(1:4)->(*1)->(*1);
say $a(1:4)->(*1)->(*1)->xchg(2,1);
say $a(1:4)->dummy(1,1)->dummy(1,1);

say $a(1:4)->shape;
say $a(1:4)->dummy(0,2)->shape;
say $a(1:4)->dummy(0,1)->shape;
say $a(1:4)->(*1)->(*1)->shape;

say $a(1:4)->(*1)->(*1)->clump(3)->shape;
say $a(1:4)->dummy(1,2);#->shape;
say $a(1:4)->dummy(1,2)->dummy(1,2);#->shape;

# read hdf5
my $newfile = new PDL::IO::HDF5("test.hdf");        # create new hdf5 or open existing file.
my @datasets = $newfile->datasets;               # get a list of all datasets in the root '/' group
say $_ for @datasets;
my $dataset2 = $newfile->dataset('CALChannel01');
my %data = %{$dataset2};
say %data;
say $data{name};
say $data{ID};
say $data{parent};
say $dataset2->get;

# read netcdf
my $nc = PDL::NetCDF->new ("test.nc");
my $pdl = $nc->get ('IRLW_VaildWaveLength');
say $pdl;

my $a1 = pdl sequence(3,4,2);
my $b1 = pdl sequence(3,4,2);
$b1 = $b1+1;
say $a1;
say $b1;

my $c1 = $a1 + $b1;
say $c1;

my $d1 = $a1*3;
say $d1;

$d1 = $d1/2;
say $d1;

