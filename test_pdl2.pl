#!/usr/local/bin/perl
use PDL;
use PDL::NiceSlice;
use PDL::Math;
use PDL::Graphics2D;
use PDL::Graphics::TriD;
use PDL::ImageND;

if (0) {
 $size = 25;
 $cz = (xvals zeroes $size+1) / $size;  # interval 0..1
 $cx = sin($cz*12.6);    # Corkscrew
 $cy = cos($cz*12.6);
 line3d [$cx,$cy,$cz];   # Draw a line
}

if (1) {
 imag3d [SURF2D,bessj0(rvals(zeroes(50,50))/2)];
}

if (0) {
  $im = sequence(640,480)/640.0/480.0;
  $im3 = $im->dummy(0,3);
  imagrgb $im3;
}
