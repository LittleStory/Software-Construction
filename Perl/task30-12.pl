print "N = ";
my $n = <>;
my $sum = 0;
for (my $i = 1, my $prod = 1; $i <= $n; $i++, $sum += $prod, $prod = 1) {
    for (my $j = 2; $j <= $n; $j++){
        $prod *= log($i) / log($j);
    }
}
print "y(", $n + 0, ") = $sum";