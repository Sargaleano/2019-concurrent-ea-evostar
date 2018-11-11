#!/usr/bin/env perl6

use v6;

use JSON::Fast;

for $*ARGFILES -> $file {
    my $content =  $file.IO.slurp;
    $content ~~ s:g/\} . \{/\},\n\{/;
    my @data = from-json('[' ~ $content ~ ']')<>;

    my @experiments;
    my $experiment = -1;
    repeat {
	my $item = @data.shift;
	if ( $item<msg><start-at>:exists ) {
	    $experiment++;
	    @experiments[$experiment]<meta> = $item<msg>;
	} else {
	    @experiments[$experiment]<data>.push:
	    { best => $item<msg><best>,
	      at => $item<time> };
	}
    } while @data.elems;

    say "Threads, Generations, Time";
    for @experiments -> $e {
	my $generations = $e<data>.elems;
	my $duration = DateTime.new($e<data>[*-1]<at>) - DateTime.new($e<meta><start-at>);
	say $e<meta><threads> ~ ", " ~ $generations*$e<meta><population-size>*$e<meta><generations>, $duration";
    }
}
