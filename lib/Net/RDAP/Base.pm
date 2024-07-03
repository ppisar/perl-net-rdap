package Net::RDAP::Base;
use Net::RDAP::Event;
use Net::RDAP::ID;
use Net::RDAP::Link;
use Net::RDAP::Notice;
use Net::RDAP::Object::Autnum;
use Net::RDAP::Object::Domain;
use Net::RDAP::Object::Entity;
use Net::RDAP::Object::IPNetwork;
use Net::RDAP::Object::Nameserver;
use Net::RDAP::Remark;
use strict;

#
# Constructor method. Expects a hashref as an argument.
#
sub new {
    my ($package, $args, $document_url) = @_;
    my %self = %{$args};

    $self{_document_url} = $document_url if ($document_url);

    return bless(\%self, $package);
}

#
# returns a URI object corresponding to URL of the document this object appears
# in.
#
sub document_url {
    my $self = shift;

    my $url = $self->{_document_url};

    return ($url->isa('URI') ? $url : URI->new($url)) if ($url);
}

#
# Returns a (potentially empty) array of <$class> objects
# generated from the hashrefs in C<$ref>, which is
# expected to be a reference to an array.
#
# This should not be used directly.
#
sub objects {
    my ($self, $class, $ref) = @_;

    my @list;

    my $document_url = $self->document_url;

    if (defined($ref) && 'ARRAY' eq ref($ref)) {
        foreach my $item (@{$ref}) {
            push(@list, $class->new($item, $document_url));
        }
    }

    return @list;
}

=pod

=head1 NAME

Net::RDAP::Base - base module for some L<Net::RDAP>:: modules.

=head1 DESCRIPTION

You don't use C<Net::RDAP::Base> directly, instead, various other
modules extend it.

=head1 METHODS

=head2 Language

    $lang = $object->lang;

Returns the language identifier for this object, or C<undef>.

=cut

sub lang { $_[0]->{'lang'} }

=pod

=head2 Links

    @links = $object->links;

Returns a (potentially empty) array of L<Net::RDAP::Link> objects.

=cut

sub links { $_[0]->objects('Net::RDAP::Link', $_[0]->{'links'}) }

=pod

=head2 "Self" Link

    $self = $object->self;

Returns a L<Net::RDAP::Link> object corresponding to the C<self>
link of this object (if one is available).

=cut

sub self { (grep { 'self' eq $_->rel } $_[0]->links)[0] }

=pod

=head1 C<TO_JSON()>

C<Net::RDAP::Base> provides a C<TO_JSON()> so that any RDAP object can be
serialized back into JSON if your JSON serializer (L<JSON>, L<JSON::XS>, etc)
is configured with the C<convert_blessed> option.

=cut

sub TO_JSON {
    my $self = shift;
    my %hash = %{$self};

    delete($hash{_document_url});

    return \%hash;
}

=pod

=head1 COPYRIGHT

Copyright 2018-2023 CentralNic Ltd, 2024 Gavin Brown. All rights reserved.

=head1 LICENSE

Permission to use, copy, modify, and distribute this software and its
documentation for any purpose and without fee is hereby granted,
provided that the above copyright notice appear in all copies and that
both that copyright notice and this permission notice appear in
supporting documentation, and that the name of the author not be used
in advertising or publicity pertaining to distribution of the software
without specific prior written permission.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

=cut

1;
