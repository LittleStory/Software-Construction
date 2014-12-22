print "x = ";     my $x   = <>;
print "eps = ";   my $eps = <>;
print "N = ";     my $n   = <>;
my $yPrev = 4.0;
for (my $i = 0; $i < $n; $i++) {
     my $yCur = ($x - $yPrev ** 3) / 60;
     if (abs( $yPrev - $yCur ) < $eps) {
         $yPrev = $yCur;
         last;
     }
     $yPrev = $yCur;
}
print "y = ", $yPrev;
