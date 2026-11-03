#!/usr/bin/perl


#use warnings;
use strict;
use POSIX qw(strftime);

my (%NAME_TO_CODE, %CODE_TO_NAME,$total,$null, $genID);

#my $load_date = "2026-03-06";
my $load_date = "2026-06-11";


my $todayJD = &get_today;
$todayJD =~ s/ *PDT//;
$todayJD =~ s/ *PST//;

my $log_file = 'output/eflora_log'.$todayJD.'.txt';
	open(LOG, '>>', $log_file);

#mariaDB
open(EF, ">output/load_eflora_taxonomy.sql") || die;


####make the IJM_sequence files used for the second part 
#this used to be created with format_for_i and added to the IJM.hash file

open(IN, "../Synonymy/input/smasch_taxon_ids.txt") || die;

while(<IN>){
	chomp;
	
	my ($code,$name)=split(/\t/);

$name=~s/ X / &times;/;

	$NAME_TO_CODE{$name}=$code;
	$CODE_TO_NAME{$code}=$name;

		print "$name==>$code\n" if (m/\tEncelia/);


}

#0	13	Isoetaceae	Isoetaceae	
#1	9464	Isoetes	Isoetaceae	
#2	29370	Isoetes bolanderi	Isoetaceae	
#3	29379	Isoetes echinospora	Isoetaceae	
close(IN);

my ($spec,$infra,$specID,$infID);

open(IN, "output/accepted_name_list.txt") || die;
while(<IN>){
	chomp;
	
	my ($sortID,$tid,$name,$family,$genus)=split(/\t/);

	my $genID=$NAME_TO_CODE{$genus};
	my $famID=$NAME_TO_CODE{$family};
	
	if ($name =~ m/^.+aceae$/){
		$specID = "NULL";
		$genID = "NULL";
		$infID = "NULL";
		$spec = "NULL";
		$infra = "NULL";
		$genus = "NULL";

	}
	elsif ($name =~ m/^[A-Za-z-]+$/){
		$specID = "NULL";
		$infID = "NULL";
		$spec = "NULL";
		$infra = "NULL";
	}
	elsif ($name =~ m/^[A-Za-z-]+ [a-z&;-]+$/){
		$specID = $tid;
		$spec = $name;
		$infID = "NULL";
		$infra = "NULL";
	}
	elsif ($name =~ m/^([A-Za-z-]+ [a-z&;-]+) (nothosubsp\.|subsp\.|var\.) (.+)$/){
		$spec = $1;
		$specID = $NAME_TO_CODE{$spec};
		$infID = $tid;
		$infra = $name;

	} else {
		print "BAD NAME-->".$name."\n";
	}
	

		#print "\n\n$genus==>$genID\n\n" if $genus =~ m/^Encel/;

	if ($family !~ /^NULL$/){
		$family = "'$family'";
	}

	if ($genus !~ /^NULL$/){
		$genus = "'$genus'";
	}

	if ($spec !~ /^NULL$/){
		$spec = "'$spec'";
	}

	if ($infra !~ /^NULL$/){
		$infra = "'$infra'";
	}


	if ($specID !~ /^(\d+)$/){
		$specID = "NULL";
	}

	if ($genID !~ /^(\d+)$/){
		$genID = "NULL";
	}

	if ($famID !~ /^(\d+)$/){
		$famID = "NULL";
	}
	
	if ($infID !~ /^(\d+)$/){
		$infID = "NULL";
	}

	if ($sortID =~ /^(\d+)$/){
#mariaDB export
		print EF "INSERT INTO eflora_taxonomy(sortID, TaxonID, familyName, genusName, speciesName, infraName, FamilyID, GenusID, SpeciesID, InfraID, Updated)\n";
		print EF "VALUES(".$sortID.", ".$tid.", ".$family.", ".$genus.", ".$spec.", ".$infra.", ".$famID.", ".$genID.", ".$specID.", ".$infID.", '".$load_date."')\n";
		#If the TaxonID in eflora_synonymy already exists, update selected fields only 
		print EF "ON DUPLICATE KEY UPDATE sortID = ".$sortID.", familyName = ".$family.", genusName = ".$genus.", speciesName = ".$spec.", infraName = ".$infra.", FamilyID = ".$famID.", GenusID = ".$genID.", SpeciesID = ".$specID.", InfraID = ".$infID.", Updated = '".$load_date."'\n";
		print EF ";\n\n";
	}




}

#mariaDB export
		print EF "INSERT INTO eflora_taxonomy(sortID, TaxonID, FamilyID, GenusID, SpeciesID, Updated)\n";
		print EF "VALUES(1356, 100435, 28, 423, 100435, '".$load_date."')\n";
		#If the TaxonID in eflora_synonymy already exists, update selected fields only 
		print EF "ON DUPLICATE KEY UPDATE sortID = 1356, FamilyID = 28, GenusID = 423, SpeciesID = 100435, Updated = '".$load_date."'\n";
		print EF ";\n\n";

close(IN);
close(EF);

open(OUT, ">output/load_taxonomy_table.sql") || die;

my ($TaxonID, $FamilyID, $GenusID, $SpeciesID, $one, $two, $three, $four);

open(IN, "/Users/Shared/Jepson-Master/Jepson-eFlora/eflora_keys/output/IJM_sequence.txt") || die;
while(<IN>){
	chomp;
	
	my ($lines) = split(/\t/);
	++$total;
	#As the sequence file comes directly out of the make_eflora_keys.sh parser (specifically format_for_i.pl), 
	#each line ends with a comma and a space. These are manually clipped off when the sequence 
	#is copied to the END of the old search script (search_IJM.pl), 
	#so you might need to put them back on in IJM_sequence.txt to make this script work
	
	#since format_for_i.pl is a very confusing script, instead of tackling it to handle unnamed hybrids
	#I am adding a kluge at the end of this script to handle the one and only unnamed hybrid in the flora
	
	#THIS IS THE OLD WAY AND I HAVE AN ALTERNATE WAY NOW IN CASE format_for_i is completely retired
	#18, 						Family
	#18, 9037, 					Genus
	#18, 9037, 15910, 			Species 1
	#18, 9037, 15946, 			Species 2
	#18, 9037, 15946, 55231, 	Infra in Species 2
	#18, 9037, 15946, 55233, 	Infra in Species 2

	if ($lines =~ /^(\d+), $/){
		$FamilyID = "NULL";
		$GenusID = "NULL";
		$SpeciesID = "NULL";
		$TaxonID = $1;
		++$one;
	}
	elsif ($lines =~ /^(\d+), (\d+), $/){
		$FamilyID = $1;
		$GenusID = "NULL";
		$SpeciesID = "NULL";
		$TaxonID = $2;
		++$two;
	}
	elsif ($lines =~ /^(\d+), (\d+), (\d+), $/){
		$FamilyID = $1;
		$GenusID = $2;
		$SpeciesID = "NULL";
		$TaxonID = $3;
		++$three;
	}
	elsif ($lines =~ /^(\d+), (\d+), (\d+), (\d+), $/){
		$FamilyID = $1;
		$GenusID = $2;
		$SpeciesID = $3;
		$TaxonID = $4;
		++$four;
	}
	else {
		$TaxonID = $FamilyID = $GenusID = $SpeciesID = "";
		++$null;
	}

}


#find where the sort value for this is


print LOG <<EOP;
BEGIN EFLORA TAXONOMY STATS

TOTAL LINES: $total

Lines with one TID: $one
Lines with two TID's: $two
Lines with three TID's: $three
Lines with four TID's: $four

Lines with no TID's: $null

END EFLORA TAXONOMY STATS
EOP

print <<EOP;
TOTAL LINES: $total

Lines with one TID: $one
Lines with two TID's: $two
Lines with three TID's: $three
Lines with four TID's: $four

Lines with no TID's: $null

END EFLORA TAXONOMY STATS
EOP

close (EF);
close (IN);

sub get_today {
#usage: add the following line before processing records:
#$today_ymd = &CCH::get_today;
#!/usr/local/bin/perl
	my $datestring = strftime "%F %Z", localtime;
	return ($datestring);
}