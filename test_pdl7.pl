#!/usr/bin/env perl
#===============================================================================
#
#         FILE: test_pdl7.pl
#
#        USAGE: ./test_pdl7.pl  
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
#      CREATED: 10/22/2019 01:08:13 PM
#     REVISION: ---
#===============================================================================

use strict;

package Hubba;

sub new {
 my($pck)=@_;

 bless {}, $pck;
}

# no bubba-method defined here

package main;

# create new instance
my $h = new Hubba;

# add entry to symbol-table
*Hubba::bubba = sub { print "bubba" };

# call new method via old instance
$h->bubba;

