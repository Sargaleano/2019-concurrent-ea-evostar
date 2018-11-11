#!/usr/bin/env perl6

use v6;

use JSON::Fast;

sub MAIN( $file ) {
    my $content =  $file.IO.slurp;
    $content ~~ s:g/\} . \{/\},\n\{/;
    my @data = from-json('[' ~ $content ~ ']');
    say @data.perl;
    say @data[0];
}
