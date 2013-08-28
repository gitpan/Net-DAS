package Net::DAS::EU;
use 5.010;
use strict;
use warnings;

sub register {
    return { 
		tlds => [qw(eu)],
		public => {
				host => 'das.eu',
				port => 4343,
				},
		registrar =>	{
				host => 'das.registry.eu',
				port => 4343,
				},
		dispatch => [\&query, undef],
	};
}

sub query { 
	my $d = shift;
	$d =~ s/.eu.*$//;
	return "get 2.0 " . $d; 
}

1;

=pod

=head1 NAME

Net::DAS::EU - A simple DAS (Domain Availabilty Seach) client, EU extension.

See L<Net::DAS>

=head1 AUTHOR

Michael Holloway <michael@thedarkwinter.com>

=head1 LICENSE

Artistic License

=cut 
