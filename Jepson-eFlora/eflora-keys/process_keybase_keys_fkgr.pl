
#open (FAM, ">keybase/keybase_keys_families_processed.txt");
#open (GEN, ">keybase/keybase_keys_genera_processed.txt");
#open (SPE, ">keybase/keybase_keys_species_processed.txt");
#open (GGR, ">keybase/keybase_keys_genus_groups_processed.txt");
#open (FGR, ">keybase/keybase_keys_family_groups_processed.txt");
#open (UNA, ">keybase/keybase_keys_unabridged_processed.txt");
#open (KGR, ">keybase/keybase_keys_key_to_groups_processed.txt");
#open (FGK, ">keybase/keybase_family_group_keys_processed.txt");
open (FKGR, ">keybase/keybase_family_key_to_groups_processed.txt");


$/="\n\n";
#OPEN THE RAW FILE
$treatments="keybase/keybase_family_key_to_groups.txt";
open(IN,$treatments) || die;
#STORE THE FILE IN AN ARRAY, ONE PARAGRAPH PER ELEMENT
@all_pars=(<IN>);


	foreach $j (0 .. $#all_pars){		

#family group key problem names:
#NITRARIACEAE this should be Nitrariaceae {Peganum harmala}
#FABACEAE (Papilionoideae) this should be Fabaceae Group 3
#Papaveraceae (papaveroideae) this should be just Papaveraceae in KeyBase
#Papaveraceae (fumarioideae) this should be just Papaveraceae in KeyBase
#Ranunculaceae (actaea, consolida) this should be just Ranunculaceae in KeyBase

$all_pars[$j] =~ s/\(<i>/(/g;
$all_pars[$j] =~ s/<.i>\)/)/g;

			$all_pars[$j] =~ s/\t(Group)( ?.*)\n/\tFamily \L\u$1$2\n/g;

$all_pars[$j] =~ s/(if dry remains of flowers are present it may be possible to determine the family of a fruiting specimen under )1' (in this key, but not all fruiting specimens may be identifiable here\])\t1/$1 couplet 7 $2\tCANNOT BE IDENTIFIED/;
$all_pars[$j] =~ s/(terrestrial plants in strictly vegetative condition cannot be identified with this key\])\t3/$1\tCANNOT BE IDENTIFIED/;


$all_pars[$j] =~ s/^([A-Z][a-z]+aceae Group \d+[A-Za-z]*):?.*/$1/;

++$found1;


$all_pars[$j] =~ s/^Key to Family Groups\n//;
$all_pars[$j] =~ s/^Key To Groups\n//;
#remove headers
#Key to Family Groups
#Key To Groups

$all_pars[$j] =~ s/\n\n+/\n/;

}


	print FKGR join("\n",@all_pars);


close(IN);
close(FKGR);


print <<EOP;
Names converted: $found2
Subtaxa converted: $found3
 TOTAL LINES: $found1

EOP