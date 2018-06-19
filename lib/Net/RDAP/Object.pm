package Net::RDAP::Object;
use base qw(Net::RDAP::Base);
use strict;

=pod

=head1 NAME

L<Net::RDAP::Object> - a module representing an RDAP object.

=head1 DESCRIPTION

RDAP responses contain one or more RDAP objects: typically the response
itself corresponds to an RDAP object, but RDAP objects can contain
other RDAP objects (such as the entities and nameservers associated
with a domain name).

L<Net::RDAP::Object> represents such objects, whether top-level or
embedded. It inherits from L<Net::RDAP::Base> so has all the methods
available to that module.

Other methods include:

	$class = $object->class;

Returns a string containing the class name of this object.

=cut

sub class { $_[0]->{'objectClassName'} }

=pod

	$handle = $object->handle;

Returns a string containing the "handle" of the object.

=cut

sub handle { $_[0]->{'handle'} }

=pod

	@status = $object->status;

Returns a (potentially empty) array of state identifiers. The possible
values are defined by bn IANA registry; see:

=over

=item * L<https://www.iana.org/assignments/rdap-json-values/rdap-json-values.xhtml>

=back

=cut

sub status { $_[0]->{'status'} ? @{$_[0]->{'status'}} : () }

=pod

	@remarks = $object->remarks;

Returns a (potentially empty) array of L<Net::RDAP::Remark> objects.

=cut

sub remarks { $_[0]->objects('Net::RDAP::Remark', $_[0]->{'remarks'}) }

=pod

	@events = $object->events;

Returns a (potentially empty) array of L<Net::RDAP::Event> objects.

=cut

sub events { $_[0]->objects('Net::RDAP::Event', $_[0]->{'events'}) }

=pod

	$port43 = $object->port43;

Returns a L<Net::DNS::Domain> object containing the name of the
legacy port-43 whois server for this object.

=cut

sub port43 { $_[0]->{'port43'} }

=pod

	@ids = $object->ids;

Returns a (potentially empty) array of L<Net::RDAP::ID> objects.

=cut

sub ids { $_[0]->objects('Net::RDAP::ID', $_[0]->{'publicIds'}) }

=pod

	@entities = $object->entities;

Returns a (potentially empty) array of L<Net::RDAP::Entity> objects.

=cut

sub entities { $_[0]->objects('Net::RDAP::Entity', $_[0]->{'entities'}) }

=pod

=head1 COPYRIGHT

Copyright 2018 CentralNic Ltd. All rights reserved.

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