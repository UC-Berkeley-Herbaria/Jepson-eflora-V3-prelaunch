#!/bin/perl
#use DB_File;
use BerkeleyDB;
use utf8;
%flat_dbm=(
"tid_par" => "flat_dbm_2.txt",
#"jmname_newname" => "flat_dbm_3.txt",
"name_to_code" => "flat_dbm_4.txt",
#"JM_namehash" => "flat_dbm_5.txt",
"capn_db" => "flat_dbm_1.txt",
);
#"JM_treatments_h" => "flat_dbm_6.txt",
system ("tar -v -x -f interchange.tar");

foreach $dbm_file (sort(keys(%flat_dbm))){
unlink($dbm_file);
	#my $filename = "$flat_dbm{$dbm_file}";
	my $filename = "$flat_dbm{$dbm_file}";
open(IN,$filename) || die "couldn't open $filename\n";
	warn "opening $filename, writing to $dbm_file\n";
    	tie %f_contents, "BerkeleyDB::Hash",
                -Filename => $dbm_file,
		-Flags => DB_CREATE
        or die "Cannot open file $filename: $! $BerkeleyDB::Error\n" ;

$/="";
while(<IN>){
s//&eacute;/g;
s//&ntilde;/g;
s//&oacute;/g;
s/ç/&Aring;/g;
s//&ouml;/g;
s//&uum;/g;
s//&aacute;/g;
s//&Oslash;/g;
s//&egrave;/g;
s//&ccedil;/g;
s/¼/&degr;/;
s//&acirc;/g;
s//&auml;/g;
s/Ï/&uacute;/g;
s//&euml;/g;
s/§/X/g;
s/ë/&Icirc;/g;
s/¾/&aelig;/g;
s/à/&aacute;/g;
s//&Eacute;/g;
 s/_/S&iacute;/g;
 s//&iacute;/g;
chomp;
($key, $value)=m/^(.*)\n([^\000]+)/;
$value=~s/<\^>/\n/g;
$f_contents{$key}=$value;
#die;
}
system("chmod 0666 $dbm_file");
untie %f_contents;
}
#"get_JM_treatment.pl" => "JM_parseq.txt",
%cgi_files=(
"LN2C.pl" => "LN2C.txt",
"get_cn2.pl" => "I_common.txt"
);


while(($cgi_file, $cgi_data)= each(%cgi_files)){
local($/)="\n";
warn "modifying copy of $cgi_file using $cgi_data\n";
	@data_buffer=();
	open(CGI_DATA,"$cgi_data") || die "couldn't open $cgi_data for reading\n";
	while(<CGI_DATA>){
		push(@data_buffer,$_) unless m/^[#<]/;
	}
	close(CGI_DATA);
	open(IN,"/usr/local/web/ucjeps_cgi/$cgi_file") || die "can't open $cgi_file for reading\n";
	open(OUT,">$cgi_file") || die "can't open $cgi_file for writing\n";
	while(<IN>){
		print OUT;
		last if m/__END__/;
	}
	print OUT join("",@data_buffer);
	close(IN);
	close(OUT);
system ("chmod +x $cgi_file");
}
warn <<EOP;

copy html files to /interchange
copy get_JM_treatment.pl, LN2C.pl, and  get_cn2.pl to cgi directory
copy capn_db, tid_par, name_to_code to ucjeps_data
EOP
#capn_db => flat_dbm_1,
#tid_par => flat_dbm_2,
#jmname_newname => flat_dbm_3,
#name_to_code => flat_dbm_4,
#JM_treatments_h => flat_dbm_6);
#JM_namehash => flat_dbm_5,);
