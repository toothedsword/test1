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

use PDL;
use PDL::NiceSlice;
use PDL::CV;

use Shell;

@file = find('./ -name "*.f"');
print for @file;
print $#file;

@cat = Shell::cat('./pdl_call_c_f_v0.1/src/fib1.f');
print for @cat;

$d = sequence(4,5);
$t = pdl sequence(100,5,5);
$d(0,1:4)->PDL::CV::r($t(0,0,1:4));

$r = local ? PDL::CV::r;
$d(0,1:4)->$r($t(0,0,1:4));

print $d,"\n";
