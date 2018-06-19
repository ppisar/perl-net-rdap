package Net::RDAP::Notice;
use base qw(Net::RDAP::Remark);
use strict;

=pod

=head1 NAME

L<Net::RDAP::Notice> - an RDAP notice

=head1 DESCRIPTION

This module represents a notice attached to an RDAP response. Since
notices are identical to remarks (they only differ in their position)
in RDAP responses, this class inherits everything from
L<Net::RDAP::Remark>.

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