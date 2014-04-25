use Time::Local;
use Pod::Usage;

GetOptions (
    \%opts,
    "help|?",      # User is requesting help.
    "man",         # Man page.
    "date=s",
    "time=s",
    "record=s"
    )
    or pod2usage(64);

pod2usage(1) if $opts{'help'};
pod2usage( -exitstatus => 0, -verbose => 2 ) if $opts{'man'};

if(!opts{'date'})
{
    pod2usage(1);
}

my @date = split('-', opts{'date'});

#convert date to mtime and overwrite mtime
if(opts{'time'})
{
    my @time = split(':', opts{'time'});
    $mtime = timelocal($time[2],$time[1],$time[0],$date[2],$date[1]-1,$date[0]);
}
else
{
    $mtime = timelocal(0,0,0,$date[2],$date[1]-1,$date[0]);
}

__END__

=head1 NAME

BaseCounter.pl - Counts The Number of Bases Sequenced Today

=head1 SYNOPSIS

B<BaseCounter.pl> [B<--help>] [B<--man>] [B<--date>] [B<--time>] 

=head1 OPTIONS

=over 8

=item B<--help>

Print a brief help message and exit.

=item B<--man>

Displays the manual page.

=item B<--date>

Required. Specify a reference date.

=item B<--time>
 
Optional. Specify a reference time.

=cut
