#!/usr/bin/env perl
#===============================================================================
#
#         FILE: test_pdl4.pl
#
#        USAGE: ./test_pdl4.pl  
#
#  DESCRIPTION: 
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Liang Peng (...), pengliang@piesat
# ORGANIZATION: ...
#      VERSION: 1.0
#      CREATED: 10/21/2019 01:54:08 PM
#     REVISION: ---
#===============================================================================

use v5.10;
use PDL;
use PDL::NiceSlice;
# use PDL::CV qw/rp/;
package PDL::CV;

$a1 = pdl sequence(4,5);
$b1 = pdl sequence(4,5);
$b1 = $b1+1;
say $a1;
say $b1;

$c1 = $a1 + $b1;
say $c1;

$d1 = $a1*3;
say $d1;

$d1 = $d1/2;
say $d1;

$t = pdl sequence(100,5,5);
$d1(0,0:3) .= $t(1:4,0,0)->clump(10)->reshape($d1(0,0:3)->dims);

say $d1;
$d1(0,0:3) .= $t(0,0,1:4)->reshape($d1(0,0:3)->dims);
say $d1;

$d1(0:3,0) .= $t(0,0,1:4)->reshape($d1(0:3,0)->dims);
say $d1;

$d1(0:3,0)->PDL::CV::rp($t(0,0,1:4));
say $d1;

$d1(0,1:4)->rp($t(0,0,1:4));

say $d1;


