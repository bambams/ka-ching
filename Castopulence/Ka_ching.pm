use strict;
use warnings;

package Castopulence::Ka_ching;

use Data::Dumper;
use Exporter;

our @EXPORT_OK = qw(
        get_ka_ching_dir
        get_ka_ching_db_file_path);
our %EXPORT_TAGS = ( ALL => \@EXPORT_OK );
our @ISA = qw(Exporter);

sub get_ka_ching_dir
{
    return "$ENV{HOME}/.ka_ching";
}

sub get_ka_ching_db_file_path
{
    return get_ka_ching_dir()."/db";
}

1;

