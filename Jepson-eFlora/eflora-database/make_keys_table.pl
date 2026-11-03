#use strict;
#use warnings;
use lib "../Modules/";
use CCH1;
use POSIX qw(strftime);




#my $load_date = "2023-12-23";
#my $load_date = "2024-02-29";
#my $load_date = "2025-10-29";
#my $load_date = "2026-03-06";
my $load_date = "2026-06-11";

my $todayJD = &get_today;
$todayJD =~ s/ *PDT//;
$todayJD =~ s/ *PST//;

$log_file = 'output/eflora_log'.$todayJD.'.txt';
	open(LOG, '>>', $log_file);



#sqlite3
open(OUT, ">output/load_keys_table.sql") || die;

#mariaDB
open(EF, ">output/load_eflora_keys.sql") || die;


$data_path="../eflora_keys/input";


open(IN, "../Synonymy/input/smasch_taxon_ids.txt") || die;
while(<IN>){
	chomp;
	s/X /&times;/;
next if (m/^#/);
	($code,$name,@residue)=split(/\t/);
	$NAME_TO_CODE{$name}=$code;
	$CODE_TO_NAME{$code}=$name;
	
}
close(IN);


my %k;
open(IN, "../eflora_keys/output/eflora_keys_expanded.html") || die;
while(<IN>){
		s/<\/div><\/span> *\n/<\/div><\/span>/g;
		s/<\/h3>\n<br \/>/<\/h3><br \/>/g;
		#s/ (\d+) px ;/ $1px ;/g;
    chomp;
    my ($k,$v) = (split /\t/,$_);
print "--->$v\n\n";

    if (exists $HASH{$k} ) {
        $HASH{$k}.= $v;
    }
    else{
        $HASH{$k} = $v;
    }    
}
close(IN);

# write output to file so that there is only one line per Taxon ID
open(EXP,">output/eflora_keys_expanded_combined.txt");
while (my ($k,$v) = each %HASH) {
    print EXP "$k\t$v\n";
	++$hash_lines;
}
close(EXP);




#open(IN, $data_path."/text.txt") || die;
open(IN, "output/eflora_keys_expanded_combined.txt") || die;
while(<IN>){
	$tid=$key_text="";
	chomp;
	
	#f01287-01.txt	Agave shawii var. shawii
	($tid,$key_text) = split(/\t/);

#Escaping single quotes for SQL insert
	$key_text =~ s/'/''/g;
	
	
	#this used to be done by get_IJM.pl, 
	#but it is converted here so that PHP does not have to do the conversion
	$key_text=~s|<a href="#(\d+)|<a href="/eflora/eflora_display.php?tid=$1|g;

	#this used to be done by get_IJM.pl, but this does not seem to be a issue anymore.  
	#There does not seem to be any section of
	#the format_for_i script that makes a <sp_list> tag, commented out for now
			#if($entry=~s/<sp_list>(.*)<\/sp_list>//){
			#	@taxa=split(/,/,$1);
			#	foreach(@taxa){
			#	s!.*!<OPTION VALUE="http://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=$&">$NAN{$&}\n!;
			#	}
			#}

	
$taxon = $CODE_TO_NAME{$tid};
$HasKey = "1";
	#single quotes for SQL are added in the print OUT
	if ($tid =~ /\d+/){
#sqlite3
			print OUT "INSERT INTO eflora_keys(TaxonID, ScientificName, HasKey, KeyText)\n";
			print OUT "VALUES(".$tid.", '".$taxon."', '".$HasKey."', '".$key_text."')\n";
			print OUT ";\n\n";


#mariaDB export
		print EF "INSERT INTO eflora_keys(TaxonID, ScientificName, HasKey, KeyText, Updated)\n";
		print EF "VALUES(".$tid.", '".$taxon."', ".$HasKey.", '".$key_text."', '".$load_date."')\n";
		#If the TaxonID in eflora_keys already exists, update selected fields only 
		print EF "ON DUPLICATE KEY UPDATE ScientificName = '".$taxon."', HasKey = ".$HasKey.", KeyText = '".$key_text."', Updated = '".$load_date."'\n";
		print EF ";\n\n";


++$key_count;
	}
	else {
		print "badly formatted or no taxon id: $tid==>$key_text\n";
		print LOG "badly formatted or no taxon id: $tid==>$key_text\n";
	}
}	



print LOG <<EOP;
IJM Keys Sep 2016: 899
IJM Keys Jan 2017: 898
IJM Keys Dec 2017: 898
IJM Keys Jan 2018: 898
IJM Keys Apr 2019: 900
IJM Keys Jan 2020: 901
IJM Keys Jan 2021: 901
IJM Keys Mar 2022: 906
IJM Keys Nov 2023: 906
IJM Keys Feb 2025: 903
IJM Keys Dec 2025: 903
IJM Keys Mar 2026: 900

Current Numer of keys: $key_count
eflora keys expanded combined lines: $hash_lines

EOP

print <<EOP;
IJM Keys Sep 2016: 899
IJM Keys Jan 2017: 898
IJM Keys Dec 2017: 898
IJM Keys Jan 2018: 898
IJM Keys Apr 2019: 900
IJM Keys Jan 2020: 901
IJM Keys Jan 2021: 901
IJM Keys Mar 2022: 906
IJM Keys Nov 2023: 906
IJM Keys Feb 2025: 903
IJM Keys Dec 2025: 903
IJM Keys Mar 2026: 900

Current Numer of keys: $key_count
eflora keys expanded combined lines: $hash_lines

EOP

close(IN);
close(OUT);

sub get_today {
#usage: add the following line before processing records:
#$today_ymd = &CCH::get_today;
#!/usr/local/bin/perl
	my $datestring = strftime "%F %Z", localtime;
	return ($datestring);
}
