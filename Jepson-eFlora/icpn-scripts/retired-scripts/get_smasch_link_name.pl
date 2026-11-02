#!/usr/bin/perl
use BerkeleyDB;
push(@INC,"/usr/local/web/ucjeps_data/ucjeps_data/cgi");
require("cgi-lib.pl");
tie(%consort, "BerkeleyDB::Hash", -Filename=>"/usr/local/web/ucjeps_data/ucjeps_data/CDL_DBM", -Flags=>DB_RDONLY)|| die "$!";
	print &PrintHeader;
while(($aid,$entry)=each(%consort)){
($tid=$entry)=~s/	.*//;
print "$tid\n" unless $seen{$tid}++;
}
