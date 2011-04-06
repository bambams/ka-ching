use strict;
use warnings;

package Castopulence::Ka_ching;

use Data::Dumper;
use DBI;
use Exporter;

use constant {
    DB_FILE_NAME => 'db',
    DEFAULT_PASS => 'ka_ching',
    DEFAULT_USER => 'ka_ching',
    DIR_NAME => '.ka_ching'
};

our @EXPORT_OK = qw(
        get_ka_ching_dir
        get_ka_ching_db_file_path);
our %EXPORT_TAGS = ( ALL => \@EXPORT_OK );
our @ISA = qw(Exporter);

sub new
{
    my ($class, $user, $pass) = shift;
    my $K = {};
    bless $K, $class;
    my $defaults = get_ka_ching_defaults();
    my $dbh = DBI->connect(
            "dbi:SQLite:dbname=".get_ka_ching_db_file_path(),
            $user || $defaults->{user},
            $pass || $defaults->{pass});
}

sub get_ka_ching_defaults
{
    return { user => DEFAULT_USER, pass => DEFAULT_PASS };
}

sub get_ka_ching_dir
{
    return "$ENV{HOME}/".DIR_NAME;
}

sub get_ka_ching_db_file_path
{
    return get_ka_ching_dir()."/".DB_FILE_NAME;
}

1;

