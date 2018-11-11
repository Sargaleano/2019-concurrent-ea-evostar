#!/usr/bin/env perl6

use v6;

use JSON::Fast;

sub MAIN( $file ) {
    my $content =  $file.IO.slurp;
    $content ~~ s:g/\} . \{/\},\n\{/;
    my @data = from-json('[' ~ $content ~ ']');
    say @data.elems;
    say to-json([{ a => 2, c=> 3},{ a => 4, c=> 5}]);
    say @data[0];
}
