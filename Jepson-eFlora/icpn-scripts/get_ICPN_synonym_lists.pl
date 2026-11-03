

my $data_file="../CCHV2/data_files/G_T_F";

#need to clean up the missing spaces between : and test in lines in ICPN that are causing parsing problems, see Cylindropuntia chuckwallensis, Current Status line

#open(ADD, ">>../Jepson-eFlora/synonymy/output/taxon_synonyms_noTID.txt") || die; 

open(ACC, ">output/CCH2_ICPN_accepted_list.csv") || die;

open(AUTH, ">output/IJM_name_list_authors.txt") || die;

open(CCH, ">output/CCH2_EFLORA_list.txt") || die; #file for adding links to CCH2 taxon pages

open(CONV, ">>../Jepson-eFlora/synonymy/output/taxon_synonyms_converted.txt") || die;

#short list from all sources
open(OUT, ">output/ICPN_tax_syns_short.txt") || die; #synonyms file with only those names with an accepted name line in ICPN_current

open(OUT2, ">output/IJM_name_list.txt") || die;  #this file is used in various places needed a name list from ICPN or ICPN designated Families, used to be used in the generation of KML maps and added to eFlora directory
open(OUT3, ">output/ICPN_status_list.txt") || die;
open(OUT4, ">output/ICPN_tax_syns_list.txt") || die;
#open(OUT5, ">output/ICPN_TJM2_synonym_list.txt") || die;
#open(OUT6, ">output/ICPN_TJM_synonym_list.txt") || die;

open(OUT7, ">output/ICPN_eFlora_URL_list.txt") || die;

open(NAT, ">output/ICPN_nativity.txt") || die;

open(EXC, ">output/ICPN_status_or_accepted_problems.txt") || die;


#cumulative problem file from all sources
open(PROB, ">../Jepson-eFlora/synonymy/output/taxon_synonyms_conversion_problem.txt") || die; 

open(SYN, ">output/CCH2_ICPN_synonym_list.txt") || die;

open(SYNADD, ">output/CCH2_ICPN_synonym_list.csv") || die;

open(UNC, ">output/ICPN_unresolved_list.txt") || die; #all of these taxa have no accepted names in the entry and cannot be assigned one


print ACC "family,parent,rankname,sciname,source\n";
print AUTH "#taxon_name_NOAUTH\tICPN_name_with_AUTH\n";
print CCH "taxon_ID_accepted\ttaxon_name\tEflora_accepted_name_url\n";
print OUT "#taxon_name\tICPN_accepted\n";
print NAT "#taxon_name\tICPN_nativity\n";
print EXC "#taxon_name\tstatus_exception\n";
print OUT3 "#taxon_ID\ttaxon_name\tICPN_accepted\tstatus_short\tICPN_FULL_status_line\n";
print OUT4 "#taxon_name\tICPN_accepted\tstatus_short\tICPN_FULL_status_line\n";
#print OUT5 "#ICPN_accepted\tTJM2_synonym_line\n";
#print OUT6 "#ICPN_accepted\tTJM_synonym_line\n";
print PROB "#ICPN_name\tICPN_accepted\tstatus\n";
print SYN "family,parent,sciname,rankname,acceptedstr,source\n";
print SYNADD "family,parent,sciname,rankname,acceptedstr,source\n";


open(IN, "../Jepson-eFlora/synonymy/input/smasch_taxon_ids.txt") || die;
while(<IN>){
	chomp;
	s/saponaria X Aloe/saponaria &times; Aloe/;
	s/X /&times;/;
	($smasch_code,$smasch_name)=split(/\t/);
	$TID{$smasch_name}=$smasch_code;
	$TNOAN{$smasch_code}=$smasch_name;
}
close(IN);


open(IN,"../Jepson-eFlora/eflora_keys/output/accepted_names.out") || die;
#LN	nativity	family	genus	species	species_author	infraspecific_rank	infraspecific_epithet	infraspecific_author	name_minus_authors	name_plus_authors	expanded_name	synonyms	common	TJM1/TJM2	major_clade	endemicity

while(<IN>){
	chomp;
next if (m/^#/);
	($LN,$nativity, $family, $genus, $species, $species_author, $infraspecific_rank, $infraspecific_epithet, $infraspecific_author, $name_minus_authors, $name_plus_authors, $expanded_name, $synonyms, $common, $TJM1_TJM2, $major_clade, $endemicity)=split(/\t/);
		#$name_minus_authors =~ s/&times;/X /;
		#$genus =~ s/&times;/X /;
		#$species =~ s/&times;/X /;
		$FAM{$name_minus_authors}=ucfirst(lc($family));
		$NAT{$name_minus_authors}=$nativity;
		
		$GEN{$name_minus_authors}=$genus;
		$SPE{$name_minus_authors}=$species;
		$RAN{$name_minus_authors}=$infraspecific_rank;
		$INF{$name_minus_authors}=$infraspecific_epithet;
		$EF_ACC{$name_minus_authors}++;
		

my $url = "https://ucjeps.berkeley.edu/eflora/eflora_display.php?name=";


	if ( (length $genus) && ($species eq '') && ($infraspecific_rank eq '')  && ($infraspecific_epithet eq '') ){
		print OUT7 $name_minus_authors."\t".$url.$genus."\n";
		$seenEF{$name_minus_authors}++;
	}
	elsif ( (length $genus) && (length $species) && ($infraspecific_rank eq '')  && ($infraspecific_epithet eq '') ){
		print OUT7 $name_minus_authors."\t".$url.$genus."+".$species."\n";
		++$count;
		$seenEF{$name_minus_authors}++;
	}
	elsif ( (length $genus) && (length $species) && (length $infraspecific_rank)  && (length $infraspecific_epithet) ){
		print OUT7 $name_minus_authors."\t".$url.$genus."+".$species."+".$infraspecific_epithet."\n";
		++$count;
		$seenEF{$name_minus_authors}++;
	}
	elsif ( (length $genus) && (length $species) && ($infraspecific_rank eq '')  && (length $infraspecific_epithet) ){
		print OUT7 "BAD URL==>".$url.$genus."+".$species."+".$infraspecific_rank."+".$infraspecific_epithet."\n";
		++$problem;
	}	
	elsif ( (length $genus) && (length $species) && (length $infraspecific_rank)  && ($infraspecific_epithet eq '') ){
		print OUT7 "BAD URL==>".$url.$genus."+".$species."+".$infraspecific_rank."+".$infraspecific_epithet."\n";
		++$problem;
	}




}
close(IN);



$/=""; #this function indicates the record delimiter. In this case, an empty line
my %OLD;
my %ACC;
my %ICPN;



open(IN, "input/CPN_out.in") || die; #for checking the processed ICPN text file
#open(IN, "input/icpn_current.txt") || die; #for checking the raw ICPN text file
#open(IN, "output/CPN_out.txt") || die; #for checking the processed ICPN text file

while(<IN>){


     next if m/^#/; #skip lines that are commented out
     next if m/^\.?Admin/;	#skip lines that start with Admin
     next if m/ZZZZeee End/;
     next if m/^As of 3 Jul 2008/;
     next if m/^=======/;

	my $ICPN_family = &get_family($_);
	my $taxon_name = &get_taxon_name($_);
	#$taxon_name = &get_ICPN_name($_);
	my $taxauth_name = &get_TAN_name($_);
	#my $accepted = &get_accepted($_);
	my $full_accepted = &get_accepted_all($_);
	my $summary_brief = &get_summary_brief($_);
		
	my $TJM2_synonyms = &get_syns_TJM2($_);
	my $TJM_synonyms = &get_syns_TJM($_);

	my $status = &get_status($_);
	my $status_short = "NULL";
	my $nativity = "NULL";


		if ($status =~ m/^1, accepted name/){
			$status_short = "NATIVE; ACCEPTED in ICPN";
			$nativity = "NATIVE (ICPN)";
			#'1' => 'accepted name for taxon native to CA',
		}
		elsif ($status =~ m/^ *1a, taxonomic/){
			$status_short = "NATIVE; SYNONYM in ICPN";
			$nativity = "NATIVE (ICPN)";
			#'1a' => 'taxonomic or nomenclatural synonym for taxon native to CA',
		}
		elsif ($status =~ m/^ *1b, unpublished/){
			$status_short = "NATIVE; UNPUBLISHED, INVALID, ILLEGITIMATE, OR REJECTED IN ICPN";
			$nativity = "NATIVE (ICPN)";
			#'1b' => 'unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA',
		}
		elsif ($status =~ m/^ *2, accepted name/){
			$status_short = "NATURALIZED; ACCEPTED in ICPN";
			$nativity = "NATURALIZED (ICPN)";
			#'2' => 'accepted name for taxon naturalized in CA',
		}
		elsif ($status =~ m/^2a, taxonomic/){
			$status_short = "NATURALIZED; SYNONYM in ICPN";
			$nativity = "NATURALIZED (ICPN)";
			#'2a' => 'taxonomic or nomenclatural synonym for taxon naturalized in CA',
		}
		elsif ($status =~ m/^2b, unpublished/){
			$status_short = "NATURALIZED; UNPUBLISHED, INVALID, ILLEGITIMATE, or REJECTED in ICPN";
			$nativity = "NATURALIZED (ICPN)";
			#'2b' => 'unpublished, invalidly published, illegitimate, or rejected name for taxon naturalized in CA',
		}
		elsif ($status =~ m/^3, accepted/){
			$status_short = "WAIF, NOT NATURALIZED; ACCEPTED in ICPN";
			$nativity = "WAIF (ICPN)";
			#'3' => 'accepted name for taxon occurring in CA only as a waif and/or garden escape, not naturalized',
		}
		elsif ($status =~ m/^3a, taxonomic/){
			$status_short = "WAIF, NOT NATURALIZED; SYNONYM in ICPN";
			$nativity = "WAIF (ICPN)";
			#'3a' => 'taxonomic or nomenclatural synonym for taxon occurring in CA only as a waif and/or garden escape, not naturalized',
		}
		elsif ($status =~ m/^3b, unpublished/){
			$status_short = "WAIF, NOT NATURALIZED; UNPUBLISHED, INVALID, ILLEGITIMATE, or REJECTED in ICPN";
			$nativity = "WAIF (ICPN)";
			#'3b'  => 'unpublished, invalidly published, illegitimate, or rejected name for for taxon occurring in CA only as a waif and/or garden escape, not naturalized',
		}
		elsif ($status =~ m/^4, accepted/){
			$status_short = "AGRICULTURAL, GARDEN, OR URBAN WEED; ACCEPTED in ICPN";
			$nativity = "AGRICULTURAL, GARDEN, OR URBAN WEED (ICPN)";
			#'4' => 'accepted name for taxon occurring in CA only as agricultural or garden weed',
		}
		elsif ($status =~ m/^4a, taxonomic/){
			$status_short = "AGRICULTURAL, GARDEN, OR URBAN WEED; SYNONYM in ICPN";
			$nativity = "AGRICULTURAL, GARDEN, OR URBAN WEED (ICPN)";
			#'4a' => 'taxonomic or nomenclatural synonym for taxon occurring in CA only as agricultural or garden weed',
		}
		elsif ($status =~ m/^4b, unpublished/){
			$status_short = "AGRICULTURAL, GARDEN, OR URBAN WEED; UNPUBLISHED, INVALID, ILLEGITIMATE, or REJECTED in ICPN";
			$nativity = "AGRICULTURAL, GARDEN, OR URBAN WEED (ICPN)";
			#'4b' => 'unpublished, invalidly published, illegitimate, or rejected name for taxon occurring in CA only as agricultural or garden weed',
		}		
		elsif ($status =~ m/^5, accepted/){
			$status_short = "GREENHOUSE WEED, NOT NATURALIZED; ACCEPTED in ICPN";
			$nativity = "GREENHOUSE WEED (ICPN)";
			#'5' => 'accepted name for taxon occurring in CA only as greenhouse weed',
		}
		elsif ($status =~ m/^5a, taxonomic/){
			$status_short = "GREENHOUSE WEED, NOT NATURALIZED; SYNONYM in ICPN";
			$nativity = "GREENHOUSE WEED (ICPN)";
			#'5a' => 'taxonomic or nomenclatural synonym for taxon occurring in CA only as greenhouse weed',
		}
		elsif ($status =~ m/^6, accepted/){
			$status_short = "EXTIRPATED, NATIVE OR NATURALIZED; ACCEPTED in ICPN";
			$nativity = "EXTIRPATED, NATIVE OR NATURALIZED (ICPN)";
			#'6' => 'accepted name for taxon extirpated in CA',
		}
		elsif ($status =~ m/^6a, taxonomic/){
			$status_short = "EXTIRPATED, NATIVE OR NATURALIZED; SYNONYM in ICPN";
			$nativity = "EXTIRPATED, NATIVE OR NATURALIZED (ICPN)";
			#'6a' => 'taxonomic or nomenclatural synonym for taxon extirpated in CA',
		}
		elsif ($status =~ m/^7, accepted/){
			$status_short = "EXTINCT, NATIVE; ACCEPTED in ICPN";
			$nativity = "EXTINCT, NATIVE (ICPN)";
			#'7' => 'accepted name for taxon extinct',
		}
		elsif ($status =~ m/^7a, taxonomic/){
			$status_short = "EXTINCT, NATIVE; SYNONYM in ICPN";
			$nativity = "EXTINCT, NATIVE (ICPN)";
			#'7a' => 'taxonomic or nomenclatural synonym for taxon extinct',
		}
		elsif ($status =~ m/^8, accepted/){
			$status_short = "EXCLUDED, NOT IN CALIFORNIA; ACCEPTED in ICPN";
			$nativity = "NOT DOCUMENTED FROM CALIFORNIA (ICPN)";
			#'8' => 'accepted name for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)',
		}
		elsif ($status =~ m/^8a, taxonomic/){
			$status_short = "EXCLUDED, NOT IN CALIFORNIA; SYNONYM in ICPN";			
			$nativity = "NOT DOCUMENTED FROM CALIFORNIA (ICPN)";
			#'8a' => 'taxonomic or nomenclatural synonym for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)',
		}
		elsif ($status =~ m/^8b, unpublished/){
			$status_short = "EXCLUDED, NOT IN CALIFORNIA; UNPUBLISHED, INVALID, ILLEGITIMATE, or REJECTED in ICPN";
			$nativity = "NOT DOCUMENTED FROM CALIFORNIA (ICPN)";
			#'8b' => 'unpublished, invalidly published, illegitimate, or rejected name for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)',
		}
		elsif ($status =~ m/^9, accepted/){
			$status_short = "CULTIVATED; ACCEPTED in ICPN";
			$nativity = "CULTIVATED (ICPN)";
			#'9' => 'accepted name for plant occurring in CA only under cultivation (e.g., as crop, ornamental, or experimental plant)',
		}
		elsif ($status =~ m/^9a, taxonomic/){
			$status_short = "CULTIVATED; SYNONYM in ICPN";			
			$nativity = "CULTIVATED (ICPN)";
			#'9a' => 'taxonomic or nomenclatural synonym for plant occurring in CA only under cultivation (e.g., as crop, ornamental, or experimental plant)',
		}
		elsif ($status =~ m/^9b, unpublished/){
			$status_short = "CULTIVATED; UNPUBLISHED, INVALID, ILLEGITIMATE, or REJECTED in ICPN";			
			$nativity = "CULTIVATED (ICPN)";
			#'9b' => 'unpublished, invalidly published, illegitimate, or rejected name for plant occurring in CA only under cultivation (e.g., as crop, ornamental, or experimental plant)',
		}	
		elsif ($status =~ m/^10, accepted/){
			$status_short = "FERTILE HYBRID (hybrid form of name); ACCEPTED in ICPN; not in eFlora";
			$nativity = "FERTILE HYBRID (ICPN)";
			#'10' => 'accepted name for taxonomically recognized and/or fertile hybrid; hybrid form of name',
		}
		elsif ($status =~ m/^10a, accepted/){
			$status_short = "FERTILE HYBRID (non-hybrid form of name); ACCEPTED in ICPN; not in eFlora";			
			$nativity = "FERTILE HYBRID (ICPN)";
			#'10a' => 'accepted name for taxonomically recognized and/or fertile hybrid; non-hybrid form of name',
		}
		elsif ($status =~ m/^10b, taxonomic/){
			$status_short = "FERTILE HYBRID (hybrid form of name); SYNONYM in ICPN; not in eFlora";			
			$nativity = "FERTILE HYBRID (ICPN)";
			#'10b' => 'taxonomic or nomenclatural synonym for taxonomically recognized and/or fertile hybrid; hybrid form of name',
		}
		elsif ($status =~ m/^10bb, unpublished/){
			$status_short = "FERTILE HYBRID (hybrid form of name); UNPUBLISHED, INVALID, ILLEGITIMATE, or REJECTED in ICPN";			
			$nativity = "FERTILE HYBRID (ICPN)";
			#'10bb' => 'unpublished, invalidly published, illegitimate, or rejected name for taxonomically recognized and/or fertile hybrid; hybrid form of name',
		}
		elsif ($status =~ m/^10c, taxonomic/){
			$status_short = "FERTILE HYBRID (non-hybrid form of name); SYNONYM in ICPN";			
			$nativity = "FERTILE HYBRID (ICPN)";
			#'10c' => 'taxonomic or nomenclatural synonym for taxonomically recognized and/or fertile hybrid; non-hybrid form of name',
		}
		elsif ($status =~ m/^11, accepted/){
			$status_short = "STERILE HYBRID (hybrid form of name); ACCEPTED NAME EXCLUDED in ICPN (not recognized and/or sterile hybrid); not in eFlora";			
			$nativity = "STERILE HYBRID (ICPN)";
			#'11' => 'accepted name for taxonomically not recognized and/or sterile hybrid; hybrid form of name',
		}
		elsif ($status =~ m/^11, taxonomic/){#there are two forms of phrases for status 11
			$status_short = "STERILE HYBRID (hybrid form of name); ACCEPTED NAME EXCLUDED in ICPN (not recognized and/or sterile hybrid); not in eFlora";			
			$nativity = "STERILE HYBRID (ICPN)";
			#'11' => '11, taxonomically not recognized and/or sterile hybrid (hybrid form of name)',
		}
		elsif ($status =~ m/^11a, accepted/){#there are two forms of phrases for status 11a
			$status_short = "STERILE HYBRID (non-hybrid form of name); ACCEPTED NAME EXCLUDED in ICPN (not recognized and/or sterile hybrid); not in eFlora";
			$nativity = "STERILE HYBRID (ICPN)";
			#'11a' => 'accepted name for taxonomically not recognized and/or sterile hybrid; non-hybrid form of name',
		}
		elsif ($status =~ m/^11a, taxonomic/){#there are two forms of phrases for status 11a
			$status_short = "STERILE HYBRID (non-hybrid form of name); ACCEPTED NAME EXCLUDED in ICPN (not recognized and/or sterile hybrid); not in eFlora";
			$nativity = "STERILE HYBRID (ICPN)";
			#'11a' => 'taxonomically not recognized and/or sterile hybrid; non-hybrid form of name',
		}
		elsif ($status =~ m/^11b, taxonomic/){
			$status_short = "STERILE HYBRID (hybrid form of name); SYNONYM EXCLUDED in ICPN (not recognized and/or sterile hybrid); not in eFlora";
			$nativity = "STERILE HYBRID (ICPN)";
			#'11b' => 'taxonomic or nomenclatural synonym for taxonomically not recognized and/or sterile hybrid (hybrid form of name)'
		}
		elsif ($status =~ m/^11bb, unpublished/){
			$status_short = "STERILE HYBRID (non-hybrid form of name); UNPUBLISHED, INVALID, ILLEGITIMATE, or REJECTED in ICPN; not in eFlora";
			$nativity = "STERILE HYBRID (ICPN)";
			#'11bb'=> 'unpublished, invalidly published, illegitimate, or rejected name for taxonomically not recognized and/or sterile hybrid (hybrid form of name)',
		}
		elsif ($status =~ m/^11c, taxonomic/){
			$status_short = "STERILE HYBRID (non-hybrid form of name); SYNONYM EXCLUDED in ICPN (not recognized and/or sterile hybrid); not in eFlora";
			$nativity = "STERILE HYBRID (ICPN)";
			#'11c' => 'taxonomic or nomenclatural synonym for taxonomically not recognized and/or sterile hybrid (non-hybrid form of name)',
		}
		elsif ($status =~ m/^12, quadrinomial/){
			$status_short = "QUADRINOMIAL, EXCLUDED; trinomial treated as SYNONYM in ICPN";			
			$nativity = "NULL";
			#'12' => 'quadrinomial treated as trinomial elsewhere in this list',
		}			
		elsif ($status =~ m/^13, represents/){
			$status_short = "ORTH. VAR. (spelling or rank correction); SYNONYM in ICPN";			
			$nativity = "NULL";
			#'13' => 'represents correction or possible correction only in spelling or rank and treated elsewhere in this list',
		}			
		elsif ($status =~ m/^14, orthographic/){
			$status_short = "ORTH. VAR.; SYNONYM in ICPN";			
			$nativity = "NULL";
			#'14' => 'orthographic variant of name treated elsewhere in this list',
		}
		elsif ($status =~ m/^15,/){
			$status_short = "GENUS NAME in ICPN";			
			$nativity = "NULL";
			#'15' => 'genus name',
		}
		elsif ($status =~ m/^16,/){
			$status_short = "FAMILY NAME, ICPN";			
			$nativity = "NULL";
			#'16' => 'family name',
		}
		elsif ($status =~ m/^17, unpublished/){
			$status_short = "UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; UNPUBLISHED, INVALID, ILLEGITIMATE, or REJECTED in ICPN";			
			$nativity = "NATIVE OR NATURALIZED";
			#'17' => 'unpublished, invalidly published, illegitimate, or rejected name for taxon of unknown or uncertain status with respect to the flora of CA',
		}
		elsif ($status =~ m/^18, /){
			$status_short = "VALID NAME FOR UNPLACED TAXON OF UNCERTAIN STATUS with respect to the flora of CA";
			$nativity = "NATIVE OR NATURALIZED";
		}
		elsif ($status =~ m/^18a, /){
			$status_short = "VALID SYNONYM FOR UNPLACED TAXON OF UNCERTAIN STATUS with respect to the flora of CA";
			$nativity = "NATIVE OR NATURALIZED";
		}
		elsif ($status =~ m/^tentative 1,/){
			$status_short = "NATIVE, possibly new to CA; ACCEPTED NAME TENTATIVE in ICPN";
			$nativity = "NATIVE";
			#'1_t' => 'accepted name for taxon native to CA (tentative)',
		}
		elsif ($status =~ m/^tentative 1a,/){
			$status_short = "NATIVE; possible new synonym for already accepted taxon, SYNONYM TENTATIVE in ICPN";
			$nativity = "NATIVE";
			#'1a_t' => 'taxonomic or nomenclatural synonym for taxon native to CA (tentative)',
		}
		elsif ($status =~ m/^tentative 1b,/){
			$status_short = "NATIVE; possibly UNPUBLISHED, INVALID, ILLEGITIMATE, or REJECTED in ICPN (TENTATIVE)";
			$nativity = "NATIVE";
			#'1b_t' => 'unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA (tentative)',
		}
		elsif ($status =~ m/^tentative 2,/){
			$status_short = "NATURALIZED, persistence in CA unknown; ACCEPTED NAME TENTATIVE in ICPN";
			$nativity = "NATURALIZED";
			#'2_t' => 'accepted name for taxon naturalized in CA (tentative)',
		}
		elsif ($status =~ m/^tentative 2a,/){
			$status_short = "NATURALIZED, persistence in CA unknown; SYNONYM TENTATIVE in ICPN";
			$nativity = "NATURALIZED";
			#'2a_t' => 'taxonomic or nomenclatural synonym for taxon naturalized in CA (tentative)',
		}
		elsif ($status =~ m/^tentative 2b,/){
			$status_short = "NATURALIZED, persistence in CA unknown; possibly UNPUBLISHED, INVALID, ILLEGITIMATE, or REJECTED in ICPN (TENTATIVE)";
			$nativity = "NATURALIZED";
			#'2b_t' => 'unpublished, invalidly published, illegitimate, or rejected name for taxon naturalized in CA (tentative)',
		}
		elsif ($status =~ m/^tentative 3,/){
			$status_short = "WAIF, persistence in CA unknown; ACCEPTED NAME TENTATIVE in ICPN";
			$nativity = "WAIF";
			#'3_t' => 'accepted name for taxon occurring in CA only as a waif and/or garden escape, not naturalized (tentative)',
		}
		elsif ($status =~ m/^tentative 3a,/){
			$status_short = "WAIF, persistence in CA unknown; SYNONYM TENTATIVE in ICPN";
			$nativity = "WAIF";
			#'3a_t' => 'taxonomic or nomenclatural synonym for taxon occurring in CA only as a waif and/or garden escape, not naturalized (tentative)',
		}
		elsif ($status =~ m/^tentative 4,/){
			$status_short = "AGRICULTURAL, GARDEN, OR URBAN WEED, persistence in CA unknown; ACCEPTED NAME TENTATIVE in ICPN";
			$nativity = "AGRICULTURAL, GARDEN, OR URBAN WEED";
			#'4_t' => 'accepted name for taxon occurring in CA only as agricultural or garden weed (tentative)',
		}
		elsif ($status =~ m/^tentative 4a,/){
			$status_short = "AGRICULTURAL, GARDEN, OR URBAN WEED, persistence in CA unknown; SYNONYM TENTATIVE in ICPN";
			$nativity = "AGRICULTURAL, GARDEN, OR URBAN WEED";
			#'4a_t' => 'taxonomic or nomenclatural synonym for taxon occurring in CA only as agricultural or garden weed (tentative)',
		}
		elsif ($status =~ m/^tentative 4b,/){
			$status_short = "AGRICULTURAL, GARDEN, OR URBAN WEED, persistence in CA unknown; possibly UNPUBLISHED, INVALID, ILLEGITIMATE, or REJECTED in ICPN (TENTATIVE)";
			$nativity = "AGRICULTURAL, GARDEN, OR URBAN WEED";
			#'4b_t' => 'unpublished, invalidly published, illegitimate, or rejected name for taxon occurring in CA only as agricultural or garden weed (tentative)',
		}
		elsif ($status =~ m/^tentative 5,/){
			$status_short = "GREENHOUSE WEED, possibly not naturalized IN CA; ACCEPTED NAME TENTATIVE in ICPN";
			$nativity = "GREENHOUSE WEED";
			#'5_t' => 'accepted name for taxon occurring in CA only as greenhouse weed (tentative)',
		}
		elsif ($status =~ m/^tentative 5a,/){
			$status_short = "GREENHOUSE WEED, possibly not naturalized IN CA; SYNONYM TENTATIVE in ICPN";
			$nativity = "GREENHOUSE WEED";
			#'5a_t' => 'taxonomic or nomenclatural synonym for taxon occurring in CA only as greenhouse weed (tentative)',
		}
		elsif ($status =~ m/^tentative 6,/){
			$status_short = "possibly EXTIRPATED, status in CA unknown; ACCEPTED NAME TENTATIVE in ICPN";
			$nativity = "EXTIRPATED";
			#'6_t' => 'accepted name for taxon extirpated in CA (tentative)',
		}
		elsif ($status =~ m/^tentative 6a,/){
			$status_short = "possibly EXTIRPATED, status in CA unknown; SYNONYM TENTATIVE in ICPN";
			$nativity = "EXTIRPATED";
			#'6a_t' => 'taxonomic or nomenclatural synonym for taxon extirpated in CA (tentative)',
		}
		elsif ($status =~ m/^tentative 7, accepted/){
			$status_short = "EXTINCT, NATIVE; ACCEPTED NAME TENTATIVE in ICPN";
			$nativity = "NATIVE, EXTINCT";
			#'7_t' => 'accepted name for taxon extinct (tentative)',
		}
		elsif ($status =~ m/^tentative 7a, taxonomic/){
			$status_short = "EXTINCT, NATIVE; SYNONYM TENTATIVE in ICPN";
			$nativity = "NATIVE, EXTINCT";
			#'7a_t' => 'taxonomic or nomenclatural synonym for taxon extinct (tentative)',
		}
		elsif ($status =~ m/^tentative 8,/){
			$status_short = "possibly NOT IN CALIFORNIA; ACCEPTED NAME TENTATIVE in ICPN";
			$nativity = "UNRESOLVED, possibly NOT IN CALIFORNIA (ICPN)";
			#'8_t' => 'accepted name for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions) (tentative)',
		}
		elsif ($status =~ m/^tentative 8a,/){
			$status_short = "possibly NOT IN CALIFORNIA; SYNONYM TENTATIVE in ICPN";
			$nativity = "UNRESOLVED, possibly NOT IN CALIFORNIA (ICPN)";
			#'8a_t' => 'taxonomic or nomenclatural synonym for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions) (tentative)',
		}
		elsif ($status =~ m/^tentative 8b,/){
			$status_short = "possibly NOT IN CALIFORNIA; possibly UNPUBLISHED, INVALID, ILLEGITIMATE, or REJECTED in ICPN (TENTATIVE)";
			$nativity = "UNRESOLVED, possibly NOT IN CALIFORNIA (ICPN)";
			#'8b_t' => 'unpublished, invalidly published, illegitimate, or rejected name for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions) (tentative)',
		}
		elsif ($status =~ m/^tentative 9,/){
			$status_short = "CULTIVATED, possibly NOT IN CALIFORNIA; ACCEPTED NAME TENTATIVE in ICPN";
			$nativity = "CULTIVATED, possibly NOT IN CALIFORNIA (ICPN)";
			#'9_t' => 'accepted name for plant occurring in CA only under cultivation (e.g., as crop, ornamental, or experimental plant) (tentative)',
		}
		elsif ($status =~ m/^9b, unpublished/){
			$status_short = "CULTIVATED; UNPUBLISHED, INVALID, ILLEGITIMATE, or REJECTED in ICPN";			
			$nativity = "CULTIVATED, possibly NOT IN CALIFORNIA (ICPN)";
			#'9b' => 'unpublished, invalidly published, illegitimate, or rejected name for plant occurring in CA only under cultivation (e.g., as crop, ornamental, or experimental plant)',
		}
		elsif ($status =~ m/^tentative 9a,/){
			$status_short = "CULTIVATED, possibly NOT IN CALIFORNIA; SYNONYM TENTATIVE in ICPN";
			$nativity = "CULTIVATED, possibly NOT IN CALIFORNIA (ICPN)";
			#'9a_t' => 'taxonomic or nomenclatural synonym for plant occurring in CA only under cultivation (e.g., as crop, ornamental, or experimental plant) (tentative)',
		}
		elsif ($status =~ m/^tentative 9b,/){
			$status_short = "possibly NOT IN CALIFORNIA; possibly REJECTED, SYNONYM TENTATIVE in ICPN";
			$nativity = "CULTIVATED, possibly NOT IN CALIFORNIA (ICPN)";
			#'9b_t' => 'unpublished, invalidly published, illegitimate, or rejected name for plant occurring in CA only under cultivation (e.g., as crop, ornamental, or experimental plant) (tentative)',
		}
		elsif ($status =~ m/^tentative 10,/){
			$status_short = "FERTILE HYBRID (hybrid form of name); ACCEPTED NAME TENTATIVE in ICPN, not in eFlora";
			$nativity = "FERTILE HYBRID, UNRESOLVED, possibly NOT IN CALIFORNIA (ICPN)";
			#'10_t' => 'accepted name for taxonomically recognized and/or fertile hybrid; hybrid form of name (tentative)',
		}
		elsif ($status =~ m/^tentative 10a,/){
			$status_short = "FERTILE HYBRID (non-hybrid form of name); ACCEPTED NAME TENTATIVE in ICPN, not in eFlora";
			$nativity = "FERTILE HYBRID, UNRESOLVED, possibly NOT IN CALIFORNIA (ICPN)";
			#'10a_t' => 'accepted name for taxonomically recognized and/or fertile hybrid; non-hybrid form of name (tentative)',
		}
		elsif ($status =~ m/^tentative 10b,/){
			$status_short = "FERTILE HYBRID (hybrid form of name); SYNONYM TENTATIVE in ICPN, not in eFlora";
			$nativity = "FERTILE HYBRID, UNRESOLVED, possibly NOT IN CALIFORNIA (ICPN)";
			#'10b_t' => 'taxonomic or nomenclatural synonym for taxonomically recognized and/or fertile hybrid; hybrid form of name (tentative)',
		}
		elsif ($status =~ m/^tentative 10c,/){
			$status_short = "FERTILE HYBRID (non-hybrid form of name); SYNONYM TENTATIVE in ICPN, not in eFlora";
			$nativity = "FERTILE HYBRID, UNRESOLVED, possibly NOT IN CALIFORNIA (ICPN)";
			#'10c_t' => 'taxonomic or nomenclatural synonym for taxonomically recognized and/or fertile hybrid; non-hybrid form of name (tentative)',
		}
		elsif ($status =~ m/^tentative 11,/){
			$status_short = "STERILE HYBRID (hybrid form of name); ACCEPTED NAME TENTATIVE in ICPN (not recognized and/or sterile hybrid); not in eFlora";			
			$nativity = "STERILE HYBRID, UNRESOLVED, possibly NOT IN CALIFORNIA (ICPN)";
			#'11_t' => 'accepted name for taxonomically not recognized and/or sterile hybrid; hybrid form of name (tentative)',
		}
		elsif ($status =~ m/^tentative 11a,/){
			$status_short = "STERILE HYBRID (non-hybrid form of name); ACCEPTED NAME TENTATIVE in ICPN (not recognized and/or sterile hybrid); not in eFlora";
			$nativity = "STERILE HYBRID, UNRESOLVED, possibly NOT IN CALIFORNIA (ICPN)";
			#'11a_t' => 'accepted name for taxonomically not recognized and/or sterile hybrid; non-hybrid form of name (tentative)',
		}
		elsif ($status =~ m/^tentative 14,/){
			$status_short = "ORTH. VAR.; SYNONYM in ICPN";			
			$nativity = "UNRESOLVED, possibly NOT IN CALIFORNIA (ICPN)";
			#'14_t' => 'orthographic variant of name treated elsewhere in this list (tentative)',
		}
		elsif ($status =~ m/^pending 1,/){
			$status_short = "NATIVE, possibly new to CA; ACCEPTED NAME PENDING in ICPN";
			$nativity = "NATIVE, possibly NEW TO CALIFORNIA (ICPN)";
			#'1_p' => 'accepted name for taxon native to CA (pending)',
		}
		elsif ($status =~ m/^pending 1a,/){
			$status_short = "NATIVE; possible new synonym for already accepted taxon, SYNONYM PENDING in ICPN";
			$nativity = "NATIVE, possible new synonym for CALIFORNIA (ICPN)";
			#'1a_p' => 'taxonomic or nomenclatural synonym for taxon native to CA (pending)',
		}
		elsif ($status =~ m/^pending 1b,/){
			$status_short = "NATIVE; possibly UNPUBLISHED, INVALID, ILLEGITIMATE, or REJECTED in ICPN (PENDING)";
			$nativity = "NATIVE, possibly NEW TO CALIFORNIA (ICPN)";
			#'1b_p' => 'unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA (pending)',
		}
		elsif ($status =~ m/^pending 2,/){
			$status_short = "NATURALIZED; ACCEPTED NAME PENDING in ICPN";
			$nativity = "NATURALIZED, possibly NOT IN CALIFORNIA (ICPN)";
			#'2_p' => 'accepted name for taxon naturalized in CA (pending)',
		}
		elsif ($status =~ m/^pending 2a,/){
			$status_short = "NATURALIZED; SYNONYM PENDING in ICPN";
			$nativity = "NATURALIZED, possibly NOT IN CALIFORNIA (ICPN)";
			#'2a_p' => 'taxonomic or nomenclatural synonym for taxon naturalized in CA (pending)',
		}
		elsif ($status =~ m/^pending 8,/){
			$status_short = "possibly NOT IN CALIFORNIA; ACCEPTED NAME PENDING in ICPN";
			$nativity = "UNRESOLVED, possibly NOT IN CALIFORNIA (ICPN)";
			#'8_p' =>'accepted name for taxon not occurring in CA (pending erroneous reports, misapplication of names, misidentifications, other exclusions)',
		}
		elsif ($status =~ m/^uncertain$/){#this is here only for Rubus bifrons
			$status_short = "NATURALIZED; UNRESOLVED, possibly NOT IN CALIFORNIA; accepted name needs taxonomic resolution in ICPN";
			$nativity = "UNRESOLVED, possibly NOT IN CALIFORNIA (ICPN)";
			#'uncertain' => 'Current Status uncertain with respect to the flora of CA',
		}
		elsif ($status =~ m/^unresolved .possibly naturalized.$/){
			$status_short = "UNRESOLVED, possibly NATURALIZED, persistence in CA unknown; ACCEPTED NAME UNRESOLVED in ICPN";
			$nativity = "UNRESOLVED, possibly NOT NATURALIZED IN CALIFORNIA (ICPN)";
			#'unresolved (possibly naturalized)' => 'Current Status not yet established (possibly naturalized)'
		}
		elsif ($status =~ m/^to be determined/){
			$status_short = "UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN";
			$nativity = "UNRESOLVED, possibly NOT NATIVE OR NATURALIZED IN CALIFORNIA (ICPN)";
		}
		elsif ($status =~ m/^unresolved *$/){
			$status_short = "UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN";
			$nativity = "UNRESOLVED, possibly NOT NATIVE OR NATURALIZED IN CALIFORNIA (ICPN)";
			#'unresolved' => 'Current Status not yet established',
		}
		elsif ($status =~ m/^$/){
			$nativity = "NULL";
			$status_short = "";
			print "PROBLEM STATUS==>NULL-->$_\n"
		}
		else{
				$nativity = "NULL";
				print "PROBLEM STATUS==>$status==>$_\n" unless $seen{$status}++;
				$status_short = "ICPN ENTRY PROBLEM, problem name";
		}



$TJM2_synonyms =~ s/^X /&times;/;
$TJM2_synonyms =~ s/ X / &times;/g;
#$TJM2_synonyms =~ s/&times;/X /;
$TJM2_synonyms =~ s/&[^t][a-z]+;//g;
$TJM2_synonyms =~ s/; documentation/ /g;
#$TJM_synonyms =~ s/&times;/X /;
$TJM_synonyms =~ s/&[^t][a-z]+;//g;
$TJM_synonyms =~ s/; documentation/ /g;
$TJM_synonyms =~ s/ X / &times;/g;
$TJM_synonyms =~ s/^X /&times;/;

$full_accepted =~ s/^X /&times;/;
$full_accepted =~ s/ X / &times;/;
#$full_accepted =~ s/&times;/X /;
#$full_accepted =~ s/circumscissa\./circumscissa/;#delete a punctuation error
#$accepted =~ s/circumscissa\./circumscissa/;#delete a punctuation error
#$taxon_name =~ s/&times;/X /;
$taxon_name =~ s/^X /&times;/;
$taxon_name =~ s/ X / &times;/;


#$full_accepted =~ s/^\.//; #delete placeholder period before first line for full accepted names

#fix some anomalies in the taxon name that is not being eliminated by strip name
#skip unpublished names and log them as unresolved
#$taxon_name =~ s/ ined. \[Question mark.+//; 
#$taxon_name =~ s/ ined.+$//;


 ++$total_lines;


#$taxon_name =~ s/Betula occidentalis Hook\. f\. inopina Jeps./Betula occidentalis f\. inopina/;

$taxauth_name =~ s/^\.//; 

$taxauth_name =~ s/^X /&times;/;
$taxauth_name =~ s/ X / &times;/g;

#$taxauth_name =~ s/&times;/X /;
#$taxauth_name =~ s/&times;/X /;
#my $name = &strip_name_EF($taxon_name);

my $name = $taxon_name;

#my $acc = &strip_name_EF($accepted);
my $full_accepted_NOAUTH = &strip_name_EF($full_accepted);

	#if ($name =~ m/Ursi pechoensis$/i){#fix a problem with strip_name
	#	$name = "Uva-ursi pechoensis";
	#}

#all of these do not have any entry in the Current Name line
	if ($full_accepted =~ m/^(NULL|NONE| *)$/){
		$full_accepted = $full_accepted_NOAUTH = "NONE NEED FIX";
		
	}


#fix problem names

#.Aloe saponaria (Aiton) Haw. &times; Aloe striata Haw.
	#if ($name =~ m/^Aloe saponaria$/){
	#	$name = "Aloe saponaria &times; Aloe striata";
	#	$full_accepted_NOAUTH = "Aloe &times;schoenlandii";
	#}	
	
	
#synonyms
#theoretically, anything in the TJM or JFP lines should be in the eFlora, but this needs to be checked
#this file is not parsed yet, but perhaps it should as some names in it may no longer be on the eFlora
		#if($TJM2_synonyms !~ m/^( *|NULL)$/i){
#print "TJM2 SYNS==>$TJM2_synonyms\n" unless $seen{$TJM2_synonyms}++;
#print "TJM2 SYNS==>$status\n" unless $seen{$status}++;
#print "$status\t$name\t$full_accepted_NOAUTH\t$TJM2_synonyms\n";
#print OUT5 "$full_accepted_NOAUTH\t$TJM2_synonyms\n";
		#}
#Jepson Manual synonym line
#this is parsed by mod_TJM_nomsyn_file.pl
		#if($TJM_synonyms !~ m/^( *|NULL)$/i){

			#$TJM_synonyms =~ s/Opuntia rhodantha K\. Schum\., Opuntia xanthostemma/Opuntia rhodantha K. Schum.; Opuntia xanthostemma/; #fix a comma that is supposed to be a ';' that is interfering with parsing
			#if($TJM_synonyms =~ m/Atriplex canescens var. laciniata Parish a form of both/){
			#	$TJM_synonyms = "Atriplex canescens var. laciniata";
			#}
#print "TJM SYNS==>$TJM_synonyms\n" unless $seen{$TJM_synonyms}++;
#print "TJM2 SYNS==>$status\n" unless $seen{$status}++;
			#print OUT6 "$full_accepted_NOAUTH\t$TJM_synonyms\n";
#print "TJM SYNS==>$status\n" unless $seen{$status}++;
		#}






#family genus parsing
	if ($FAM{$name}){#get eflora family name	
		$family=$FAM{$name};
		$family = ucfirst(lc($family));
	}
	elsif (length($ICPN_family)){ #then use ICPN family
		$family = ucfirst(lc($ICPN_family));
	}
	else{

		if( ($family eq "" ) || ($family eq "TBD" ) ){
			if($genus =~ m/^NONE NEED FIX$/){  
				$family = "NEEDFAMILY";
			}
			elsif($genus =~ m/^(Mackaya)$/){  
				$family = "Acanthaceae";
			}
			elsif($genus =~ m/^(Lophotocarpus)$/){  
				$family = "Alismataceae";
			}
			elsif($genus =~ m/^(Alstroemeria)$/){  
				$family = "Alstroemeriaceae";
			}
			elsif($genus =~ m/^(Cyathula|Achyranthes|Gomphrena)$/){  
				$family = "Amaranthaceae";
			}
			elsif($genus =~ m/^(Clivia|Hymenocallis)$/){  
				$family = "Amaryllidaceae";
			}
			elsif($genus =~ m/^(Lithrea|Styphonia)$/){  
				$family = "Anacardiaceae";
			}
			elsif($genus =~ m/^(Asimina)$/){  
				$family = "Annonaceae";
			}
			elsif($genus =~ m/^(Cnidium|Chaerophyllum|Dahliaphyllum)$/){  
				$family = "Apiaceae";
			}
			elsif($genus =~ m/^(Periploca|Mandevilla|Ceropegia|Tabernaemontana|Mandevilla|Acerates|Beaumontia)$/){  
				$family = "Apocynaceae";
			}
			elsif($genus =~ m/^(Arisaema|Philodendron|Dieffenbachia|Alocasia)$/){  
				$family = "Araceae";
			}
			elsif($genus =~ m/^(Chamaerops|Livistona)$/){  
				$family = "Arecaceae";
			}
			elsif($genus =~ m/^(Acanthopanax)$/){  
				$family = "Araliaceae";
			}
			elsif($genus =~ m/^(Polygonatum|Hesperaloe|Schoenolirion|Manfreda|Hyacinthus|Convallaria|Ruscus)$/){  
				$family = "Asparagaceae";
			}
			elsif($genus =~ m/^(Dianella)$/){  
				$family = "Asphodelaceae";
			}
			elsif($genus =~ m/^(Phyllitis)$/){  
				$family = "Aspleniaceae";
			}
			elsif($genus =~ m/^(Diplazium)$/){  
				$family = "Athyriaceae";
			}
			elsif($genus =~ m/^(Baeria|Crassocephalum|Evax|Elephantopus|Inula|Serratula|Heleniastrum|Pericallis|Tussilago|Dahlia|Kuhnia|Stevia|Adenothamnus)$/){  
				$family = "Asteraceae";
			}
			elsif($genus =~ m/^(Burrielia|Coreocarpus|Railliardia|Bigelowia|Eremiastrum|Tuckermannia|Apargidium|Linosyris)$/){  
				$family = "Asteraceae";
			}
			elsif($genus =~ m/^(Mulgedium)$/){  
				$family = "Asteraceae";
			}			
			elsif($genus =~ m/^(Epimedium)$/){  
				$family = "Berberidaceae";
			}
			elsif($genus =~ m/^(Crucihimalaya)$/){  
				$family = "Brassicaceae";
			}
			elsif($genus =~ m/^(Chitalpa|Clytostoma|Distictis|Campsis|Catalpa|Jacaranda|Phaedranthus)$/){  
				$family = "Bignoniaceae";
			}
			elsif($genus =~ m/^(Allocarya|Ellisia|Krynitzkia|Howellanthus|Wigandia|Ehretia|Pulmonaria)$/){  
				$family = "Boraginaceae";
			}
			elsif($genus =~ m/^(Epiphyllum|Cleistocactus|Disocactus|Hylocereus|Machaerocereus|Myrtillocactus)$/){  
				$family = "Cactaceae";
			}
			elsif($genus =~ m/^(Cereus)$/){  
				$family = "Cactaceae";
			}
			elsif($genus =~ m/^(Diervilla|Kolkwitzia)$/){  
				$family = "Caprifoliaceae";
			}
			elsif($genus =~ m/^(Drymaria)$/){  
				$family = "Caryophyllaceae";
			}
			elsif($genus =~ m/^(Jovellana)$/){  
				$family = "Calceolariaceae";
			}
			elsif($genus =~ m/^(Lozanella)$/){  
				$family = "Cannabaceae";
			}
			elsif($genus =~ m/^(Dysphania|Micromonolepis|Stutzia)$/){  
				$family = "Chenopodiaceae";
			}
			elsif($genus =~ m/^(Clethra)$/){  
				$family = "Clethraceae";
			}
			elsif($genus =~ m/^(Terminalia)$/){  
				$family = "Combretaceae";
			}
			elsif($genus =~ m/^(Pharbitis|Mina|Turbina|Evolvulus)$/){  
				$family = "Convolvulaceae";
			}
			elsif($genus =~ m/^(Hasseanthus)$/){  
				$family = "Crassulaceae";
			}
			elsif($genus =~ m/^(Echinocystis|Trichosanthes)$/){  
				$family = "Cucurbitaceae";
			}
			elsif($genus =~ m/^(Weinmannia|Cunonia)$/){  
				$family = "Cunoniaceae";
			}
			elsif($genus =~ m/^(Chamaecyparis|Biota|Libocedrus|Athrotaxis|Glyptostrobus|Austrocedrus)$/){  
				$family = "Cupressaceae";
			}
			elsif($genus =~ m/^(Alsophila)$/){  
				$family = "Cyatheaceae";
			}
			elsif($genus =~ m/^(Daphniphyllum)$/){  
				$family = "Daphniphyllaceae";
			}
			elsif($genus =~ m/^(Lophosoria)$/){  
				$family = "Dicksoniaceae";
			}
			elsif($genus =~ m/^Microlepia$/){  
				$family = "Dennstaedtiaceae";
			}
			elsif($genus =~ m/^(Uva-Ursi|Uva-ursi)$/){  
				$family = "Ericaceae";
			}
			elsif($genus =~ m/^Adelia$/){  
				$family = "Euphorbiaceae";
			}
			elsif($genus =~ m/^([A-Z][a-z]+aceae)$/){  #fill in family for dets to family
				$family = $1;
			}
			else{#fix some unique variants with genus homonyms that have conflicting families
				if ($name =~ m/^Hymenolepis parviflora/){
					$family = "Asteraceae";
				}
				elsif ($name =~ m/^Heyderia decurrens/){
					$family = "Cupressaceae";
				}
				elsif ($name =~ m/^Dondia taxifolia/){
					$family = "Amaranthaceae";
				}

				else{
					
					print "$key MISSING (1) $family==>Family name for GENUS_ACC:$name\n";
					$family = "";
				}
			}
		}
		else{
			print "$key unexpected FAMILY, NOT MISSING (9) $family==>Family name for GENUS_ACC:$genus  NAME:$name\n";
		}
	}

		if ($full_accepted_NOAUTH =~ m/^([A-Z][a-z-]+) [a-z-]+/){
			$genus = $1;
		}
		elsif ($full_accepted_NOAUTH =~ m/^(&times;[A-Z][a-z-]+) [a-z-]+/){
			$genus = $1;
		}
		elsif ($full_accepted_NOAUTH =~ m/^([A-Z][a-z-]+) [&times;]* ?[a-z-]+/){
			$genus = $1;
		}
		elsif ($full_accepted_NOAUTH =~ m/^NONE|NULL|Unresolved/i){
			$genus = "";
		}
		else{
			print "MISSING (2) $genus==>name for GENUS:$full_accepted_NOAUTH==>$_\n";
			#print "MISSING (2) $genus==>name for GENUS:$full_accepted_NOAUTHn";
		}



 if ($status !~ m/(12, |14, |15, |16, )/){

#if ($status =~ m/8, /){
#print "$name\n\n";
#}

		$status_exception = "NULL";



	
#fix some specific cases where the ICPN accepted name conflicts with the eFlora accepted name, 
#Tom needs to be made aware of these
			
			

#Arabis cognata	Arabis davidsonii var. davidsonii	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Arabis cognata$/) && ($full_accepted_NOAUTH =~ m/Arabis davidsonii/)){
				$full_accepted_NOAUTH = "Boechera davidsonii";
			}

#Arabis juniperina	Arabis dispar	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Arabis juniperina$/) && ($full_accepted_NOAUTH =~ m/Arabis dispar/)){
				$full_accepted_NOAUTH = "Boechera dispar";
			}

#Arabis bruceae	Arabis holboellii var. retrofracta	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Arabis bruceae$/) && ($full_accepted_NOAUTH =~ m/Arabis holboellii/)){
				$full_accepted_NOAUTH = "Boechera retrofracta";
			}

#Cordylanthus carnulosus	Cordylanthus palmatus
			if (($name =~ m/^Cordylanthus carnulosus$/) && ($full_accepted_NOAUTH =~ m/Cordylanthus/)){
				$full_accepted_NOAUTH = "Chloropyron palmatum";
			}

#Allocarya diffusa	Plagiobothrys reticulatus
			if (($name =~ m/^Allocarya diffusa$/) && ($full_accepted_NOAUTH =~ m/Plagiobothrys ret/)){
				$full_accepted_NOAUTH = "Plagiobothrys diffusus";
			}

#Arabis platysperma var. imparata	Arabis platysperma var. howellii
			if (($name =~ m/^Arabis platysperma var. imparata$/) && ($full_accepted_NOAUTH =~ m/Arabis/)){
				$full_accepted_NOAUTH = "Boechera howellii";
			}

#Arabis platyloba	Arabis platysperma var. howellii
			if (($name =~ m/^Arabis platyloba$/) && ($full_accepted_NOAUTH =~ m/Arabis/)){
				$full_accepted_NOAUTH = "Boechera howellii";
			}

#Arabis oligantha	Arabis platysperma
			if (($name =~ m/^Arabis oligantha$/) && ($full_accepted_NOAUTH =~ m/Arabis/)){
				$full_accepted_NOAUTH = "Boechera platysperma";
			}

#Arabis conferta	Arabis platysperma	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Arabis conferta$/) && ($full_accepted_NOAUTH =~ m/Arabis/)){
				$full_accepted_NOAUTH = "Boechera platysperma";
			}

#Arabis pulchra var. viridis	Arabis perennans
			if (($name =~ m/^Arabis pulchra var. viridis$/) && ($full_accepted_NOAUTH =~ m/(Arabis|Boechera p)/)){
				$full_accepted_NOAUTH = "Boechera xylopoda";
			}

#Arabis polytricha Greene	Arabis sparsiflora var. subvillosa
			if (($name =~ m/^Arabis polytricha$/) && ($full_accepted_NOAUTH =~ m/Arabis/)){
				$full_accepted_NOAUTH = "Boechera pauciflora";
			}

#Arabis inamoena	Arabis repanda var. greenei
			if (($name =~ m/^Arabis inamoena$/) && ($full_accepted_NOAUTH =~ m/Arabis/)){
				$full_accepted_NOAUTH = "Boechera repanda";
			}

#Arabis trichopoda	Arabis pulchra var. gracilis	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Arabis pulchra var. gracilis$/) && ($full_accepted_NOAUTH =~ m/Arabis/)){
				$full_accepted_NOAUTH = "Boechera xylopoda";
			}
			
#Arabis trichopoda	Arabis pulchra var. gracilis	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Arabis trichopoda$/) && ($full_accepted_NOAUTH =~ m/Arabis/)){
				$full_accepted_NOAUTH = "Boechera xylopoda";
			}

#Adenostegia palmata	Cordylanthus palmatus	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Adenostegia palmata$/) && ($full_accepted_NOAUTH =~ m/Cordylanthus/)){
				$full_accepted_NOAUTH = "Chloropyron palmatum";
			}

#Arnica bruceae	Arnica chamissonis subsp. foliosa	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Arnica bruceae$/) && ($full_accepted_NOAUTH =~ m/Arnica chamissonis subsp/)){
				$full_accepted_NOAUTH = "Arnica chamissonis";
			}

#Astragalus monoensis var. ravenii	Astragalus monoensis	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Astragalus monoensis var\. ravenii$/) && ($full_accepted_NOAUTH =~ m/Astragalus monoensis/)){
				$full_accepted_NOAUTH = "Astragalus ravenii";
			}

#Koeleria phleoides	Koeleria gerardii	NATURALIZED, SYNONYM ICPN	2a, taxonomic or nomenclatural synonym for taxon naturalized in CA
			if (($name =~ m/^Koeleria phleoides$/) && ($full_accepted_NOAUTH =~ m/Koeleria gerardii/)){
				$full_accepted_NOAUTH = "Koeleria gerardi";
			}

#Rostraria cristata	Koeleria gerardii	NATURALIZED, SYNONYM ICPN	2a, taxonomic or nomenclatural synonym for taxon naturalized in CA
			if (($name =~ m/^Rostraria cristata$/) && ($full_accepted_NOAUTH =~ m/Koeleria gerardii/)){
				$full_accepted_NOAUTH = "Koeleria gerardi";
			}


#Aster invenustus	Aster chilensis	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Aster invenustus$/) && ($full_accepted_NOAUTH =~ m/Aster /)){
				$full_accepted_NOAUTH = "Symphyotrichum chilense";
			}

#Brachyactis ciliata var. carnosula	Aster frondosus	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Brachyactis ciliata var\. carnosula$/) && ($full_accepted_NOAUTH =~ m/Aster /)){
				$full_accepted_NOAUTH = "Symphyotrichum frondosum";
			}

#Aster ensatus	Aster lanceolatus subsp. hesperius	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Aster ensatus$/) && ($full_accepted_NOAUTH =~ m/Aster /)){
				$full_accepted_NOAUTH = "Symphyotrichum frondosum";
			}

#Aster fremontii var. parishii	Aster occidentalis	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Aster fremontii var\. parishii$/) && ($full_accepted_NOAUTH =~ m/Aster /)){
				$full_accepted_NOAUTH = "Symphyotrichum spathulatum var. spathulatum";
			}

#Atriplex erecticaulis	Atriplex cordulata	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Atriplex erecticaulis$/) && ($full_accepted_NOAUTH =~ m/^Atriplex cordulata$/)){
				$full_accepted_NOAUTH = "Atriplex cordulata var. erecticaulis";
			}

#Atriplex orbicularis	Atriplex lentiformis subsp. lentiformis	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Atriplex orbicularis$/) && ($full_accepted_NOAUTH =~ m/Atriplex lentiformis subsp/)){
				$full_accepted_NOAUTH = "Atriplex lentiformis";
			}

#Bromus rigidus	Bromus rigidus	EXCLUDED, NOT IN CALIFORNIA	8, accepted name for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
			if (($name =~ m/^Bromus rigidus$/) && ($full_accepted_NOAUTH =~ m/Bromus rigidus/)){
				$full_accepted_NOAUTH = "Bromus diandrus";
			}#this is a TJM1  synonymy not updated to the TJM2 synonymy for eFlora

#Guilleminea densa	Guilleminea densa	NATURALIZED ICPN	2, accepted name for taxon naturalized in CA
			if (($name =~ m/^Guilleminea densa$/) && ($full_accepted_NOAUTH =~ m/^Guilleminea densa$/)){
				$full_accepted_NOAUTH = "Guilleminea densa var. aggregata";
			}#this is a TJM1  synonymy not updated to the TJM2 synonymy for eFlora, Guilleminea densa is 2 naturliazed while Guilleminea densa var. aggregata is a 3 waif

#Ipomopsis inconspicua	Gilia millefoliata	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Ipomopsis inconspicua$/) && ($full_accepted_NOAUTH =~ m/Gilia mill/)){
				$full_accepted_NOAUTH = "Gilia inconspicua";
			}#this is a TJM1  synonymy not updated to the TJM2 synonymy for eFlora, Gilia inconspicua and Gilia millefoliata are both accepted names




#Calamintha chandleri	Satureja chandleri	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Calamintha chandleri$/) && ($full_accepted_NOAUTH =~ m/Satureja /)){
				$full_accepted_NOAUTH = "Clinopodium chandleri";
			}

#Oenothera scapoidea var. aurantiaca	Camissonia claviformis subsp. aurantiaca	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Oenothera scapoidea var\. aurantiaca$/) && ($full_accepted_NOAUTH =~ m/Camissonia /)){
				$full_accepted_NOAUTH = "Chylismia claviformis subsp. aurantiaca";
			}

#Oenothera scapoidea var. purpurascens	Camissonia claviformis subsp. integrior	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Oenothera scapoidea var\. purpurascens$/) && ($full_accepted_NOAUTH =~ m/Camissonia /)){
				$full_accepted_NOAUTH = "Chylismia claviformis subsp. integrior";
			}

#Oenothera scapoidea var. seorsa	Oenothera scapoidea var. seorsa	EXCLUDED, SYNONYM, possibly NOT IN CALIFORNIA, ICPN	tentative 8a, taxonomic or nomenclatural synonym for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
			if (($name =~ m/^Oenothera scapoidea var\. seorsa$/) && ($full_accepted_NOAUTH =~ m/(Camissonia |Oenothera )/)){
				$full_accepted_NOAUTH = "Chylismia scapoidea var. seorsa";
			}

#Camissonia hirtella	Camissoniopsis hirtella	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#Oenothera bistorta var. reedii	Camissonia hirtella	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Oenothera bistorta var\. reedii$/) && ($full_accepted_NOAUTH =~ m/(Camissonia |Oenothera )/)){
				$full_accepted_NOAUTH = "Camissoniopsis hirtella";
			}

#Camissonia hirtella	Camissoniopsis hirtella	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#Sphaerostigma bistortum var. reedii	Camissonia hirtella	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Sphaerostigma bistortum var\. reedii$/) && ($full_accepted_NOAUTH =~ m/(Camissonia |Oenothera )/)){
				$full_accepted_NOAUTH = "Camissoniopsis hirtella";
			}


#Oenothera contorta var. epilobioides	Oenothera dentata	EXCLUDED NOT IN CALIFORNIA, SYNONYM	8a, taxonomic or nomenclatural synonym for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
#Oenothera contorta var. strigulosa	Camissonia strigulosa	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Oenothera contorta var\. epilobioides$/) && ($full_accepted_NOAUTH =~ m/(Camissonia |Oenothera )/)){
				$full_accepted_NOAUTH = "Camissonia strigulosa";
			}

#Oenothera dentata var. campestris	Camissonia campestris	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Oenothera dentata var\. campestris$/) && ($full_accepted_NOAUTH =~ m/(Camissonia |Oenothera )/)){
				$full_accepted_NOAUTH = "Camissonia campestris subsp. campestris";
			}


#Carex albida	Carex lemmonii	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#Carex sonomensis	Carex albida	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Carex sonomensis$/) && ($full_accepted_NOAUTH =~ m/Carex alb/)){
				$full_accepted_NOAUTH = "Carex lemmonii";
			}

#carex parryana hallii	carex parryana unica	carex hallii
#Carex parryana var. hallii	Carex parryana var. unica	EXCLUDED NOT IN CALIFORNIA, SYNONYM	8a, taxonomic or nomenclatural synonym for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
#Carex parryana var. unica	Carex parryana var. unica	EXCLUDED, NOT IN CALIFORNIA	8, accepted name for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
			if (($name =~ m/^Carex parryana var\. hallii$/) && ($full_accepted_NOAUTH =~ m/Carex parryana/)){
				$full_accepted_NOAUTH = "Carex hallii";
			}
			if (($name =~ m/^Carex parryana var\. unica$/) && ($full_accepted_NOAUTH =~ m/Carex parryana/)){
				$full_accepted_NOAUTH = "Carex hallii";
			}

#Carex hallii	Carex idahoa	EXCLUDED NOT IN CALIFORNIA, SYNONYM	8a, taxonomic or nomenclatural synonym for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
#Carex parryana var. unica is listed as accepted name of Carex parryana var. hallii, so the basionym Carex hallii should have the same accepted name, not Carex idahoa. These two records contradict one another.
#Carex hallii is the accepted name for these two varieties of C. parryana in FNA, all three of which are still not found in CA.
			if (($name =~ m/^Carex hallii$/) && ($full_accepted_NOAUTH =~ m/Carex ida/)){
				$full_accepted_NOAUTH = "Carex hallii";
			}

#Carex ovalis	Carex leporina	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#Carex tracyi	Carex ovalis	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Carex tracyi$/) && ($full_accepted_NOAUTH =~ m/Carex ova/)){
				$full_accepted_NOAUTH = "Carex leporina";
			}


#Streptanthus procerus	Guillenia flavescens	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Guillenia flavescens	Caulanthus flavescens	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Streptanthus procerus$/) && ($full_accepted_NOAUTH =~ m/Guillenia /)){
				$full_accepted_NOAUTH = "Caulanthus flavescens";
			}


#Microsisymbrium lasiophyllum var. integrifolium	Guillenia lasiophylla	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Guillenia lasiophylla	Caulanthus lasiophyllus	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Microsisymbrium lasiophyllum var\. integrifolium$/) && ($full_accepted_NOAUTH =~ m/Guillenia /)){
				$full_accepted_NOAUTH = "Caulanthus lasiophyllus";
			}

#Chamaesyce aureola	Chamaesyce melanadenia	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Chamaesyce melanadenia	Euphorbia melanadenia	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Chamaesyce aureola$/) && ($full_accepted_NOAUTH =~ m/Chamaesyce /)){
				$full_accepted_NOAUTH = "Euphorbia melanadenia";
			}



#Euphorbia occidentalis	Chamaesyce serpyllifolia	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Euphorbia serpillifolia
			if (($name =~ m/^Euphorbia occidentalis$/) && ($full_accepted_NOAUTH =~ m/Chamaesyce /)){
				$full_accepted_NOAUTH = "Euphorbia serpillifolia";
			}

#Chamaesyce humistrata	Chamaesyce humistrata	EXCLUDED, NOT IN CALIFORNIA	8, accepted name for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
#Euphorbia humistrata
			if (($name =~ m/^Chamaesyce humistrata$/) && ($full_accepted_NOAUTH =~ m/Chamaesyce /)){
				$full_accepted_NOAUTH = "Euphorbia humistrata";
			}

#Cordylanthus mollis var. viridis	Cordylanthus mollis	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Cordylanthus mollis	Chloropyron molle	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Cordylanthus mollis var\. viridis$/) && ($full_accepted_NOAUTH =~ m/Cordylanthus /)){
				$full_accepted_NOAUTH = "Chloropyron molle subsp. molle";
			}

#Linosyris ceruminosus	Chrysothamnus nauseosus subsp. ceruminosus	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Linosyris ceruminosus$/) && ($full_accepted_NOAUTH =~ m/Chrysothamnus /)){
				$full_accepted_NOAUTH = "Ericameria nauseosa var. ceruminosa";
			}




#Aster inornatus	Machaeranthera canescens var. shastensis	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Aster inornatus$/) && ($full_accepted_NOAUTH =~ m/Machaeranthera canescens/)){
				$full_accepted_NOAUTH = "Dieteria canescens var. shastensis";
			}

#Mimulus bolanderi var. brachydontus	Mimulus bolanderi	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Mimulus bolanderi var\. brachydontus$/) && ($full_accepted_NOAUTH =~ m/Mimulus /)){
				$full_accepted_NOAUTH = "Diplacus bolanderi";
			}

#Dodecatheon glastifolium	Dodecatheon conjugens	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Dodecatheon glastifolium$/) && ($full_accepted_NOAUTH =~ m/Dodecatheon /)){
				$full_accepted_NOAUTH = "Primula conjugens";
			}

#Potentilla glandulosa subsp. ashlandica	Potentilla glandulosa subsp. ashlandica	EXCLUDED, NOT IN CALIFORNIA	8, accepted name for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
#Drymocallis ashlandica
			if (($name =~ m/^Potentilla glandulosa subsp\. ashlandica$/) && ($full_accepted_NOAUTH =~ m/Potentilla /)){
				$full_accepted_NOAUTH = "Drymocallis ashlandica";
			}

#Elymus divergens	Elymus glaucus subsp. jepsonii	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Elymus divergens$/) && ($full_accepted_NOAUTH =~ m/Elymus glaucus subsp\. jep/)){
				$full_accepted_NOAUTH = "Elymus glaucus subsp. glaucus";
			}

#Cryptantha pumila	Cryptantha torreyana	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Cryptantha pumila$/) && ($full_accepted_NOAUTH =~ m/^Cryptantha torreyana$/)){
				$full_accepted_NOAUTH = "Cryptantha torreyana var. pumila";
			}


#Ericameria nauseosa var. arta	Chrysothamnus nauseosus subsp. consimilis	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Ericameria nauseosa var\. arta$/) && ($full_accepted_NOAUTH =~ m/Chrysothamnus /)){
				$full_accepted_NOAUTH = "Ericameria nauseosa var. oreophila";
			}

#Erigeron inornatus var. reductus	Erigeron reductus	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Erigeron inornatus var\. reductus$/) && ($full_accepted_NOAUTH =~ m/^Erigeron reductus$/)){
				$full_accepted_NOAUTH = "Erigeron reductus var. reductus";
			}

#Mimulus floribundus var. subulatus	Mimulus floribundus	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#Mimulus floribundus	Erythranthe floribunda	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Mimulus floribundus var\. subulatus$/) && ($full_accepted_NOAUTH =~ m/Mimulus /)){
				$full_accepted_NOAUTH = "Erythranthe floribunda";
			}

#Rhamnus californica var. viridula	Rhamnus rubra	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Rhamnus californica var\. viridula$/) && ($full_accepted_NOAUTH =~ m/Rhamnus /)){
				$full_accepted_NOAUTH = "Frangula californica subsp. cuspidata";
			}


#Gilia bolanderi	Linanthus bolanderi	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Linanthus bolanderi	Leptosiphon bolanderi	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Gilia bolanderi$/) && ($full_accepted_NOAUTH =~ m/Linanthus /)){
				$full_accepted_NOAUTH = "Leptosiphon bolanderi";
			}

#Gilia subalpina	Gilia capillaris	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Gilia capillaris	Navarretia capillaris	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Gilia subalpina$/) && ($full_accepted_NOAUTH =~ m/Gilia /)){
				$full_accepted_NOAUTH = "Navarretia capillaris";
			}

#Linanthus harknessii subsp. condensatus	Leptosiphon harknessii	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#Linanthus harknessii	Leptosiphon harknessii	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#Gilia harknessii	Linanthus harknessii	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Gilia harknessii$/) && ($full_accepted_NOAUTH =~ m/Linanthus /)){
				$full_accepted_NOAUTH = "Leptosiphon harknessii";
			}

#Linanthus lemmonii	Leptosiphon lemmonii	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#Gilia lemmonii	Linanthus lemmonii	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Gilia lemmonii$/) && ($full_accepted_NOAUTH =~ m/Linanthus /)){
				$full_accepted_NOAUTH = "Leptosiphon lemmonii";
			}

#Gilia pharnaceoides	Linanthus liniflorus	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Linanthus liniflorus	Leptosiphon liniflorus	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Gilia pharnaceoides$/) && ($full_accepted_NOAUTH =~ m/Linanthus /)){
				$full_accepted_NOAUTH = "Leptosiphon liniflorus";
			}

#Gilia tularensis	Linanthus oblanceolatus	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Linanthus oblanceolatus	Leptosiphon oblanceolatus	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Gilia tularensis$/) && ($full_accepted_NOAUTH =~ m/Linanthus /)){
				$full_accepted_NOAUTH = "Leptosiphon oblanceolatus";
			}

#Gilia oblanceolata var. culbertsonii	Linanthus oblanceolatus	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Gilia oblanceolata var\. culbertsonii$/) && ($full_accepted_NOAUTH =~ m/Linanthus /)){
				$full_accepted_NOAUTH = "Leptosiphon oblanceolatus";
			}

#Gilia rattanii	Linanthus rattanii	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Linanthus rattanii	Leptosiphon rattanii	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Gilia rattanii$/) && ($full_accepted_NOAUTH =~ m/Linanthus /)){
				$full_accepted_NOAUTH = "Leptosiphon rattanii";
			}

#Linanthus floribundus subsp. hallii	Leptosiphon floribundus subsp. hallii	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#Siphonella floribunda var. hallii	Linanthus floribundus subsp. hallii	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Siphonella floribunda var\. hallii$/) && ($full_accepted_NOAUTH =~ m/Linanthus /)){
				$full_accepted_NOAUTH = "Leptosiphon floribundus subsp. hallii";
			}

#Gilia collina var. grantii	Gilia splendens subsp. grantii	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Gilia splendens subsp. grantii	Saltugilia splendens subsp. grantii	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Gilia collina var\. grantii$/) && ($full_accepted_NOAUTH =~ m/Gilia /)){
				$full_accepted_NOAUTH = "Saltugilia splendens subsp. grantii";
			}

#Gaillardia amara	Helenium amarum	NATURALIZED, SYNONYM ICPN	2a, taxonomic or nomenclatural synonym for taxon naturalized in CA
			if (($name =~ m/^Gaillardia amara$/) && ($full_accepted_NOAUTH =~ m/^Helenium amarum$/)){
				$full_accepted_NOAUTH = "Helenium amarum var. amarum";
			}

#Heuchera lithophila	Heuchera rubescens var. glandulosa	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Heuchera rubescens var. glandulosa	Heuchera rubescens	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Heuchera lithophila$/) && ($full_accepted_NOAUTH =~ m/Heuchera rubescens var/)){
				$full_accepted_NOAUTH = "Heuchera rubescens";
			}


#Hordeum vulgare var. trifurcatum	Hordeum vulgare var. trifurcatum	WAIF, SYNONYM, ICPN	3a, taxonomic or nomenclatural synonym for taxon occurring in CA only as a waif and/or garden escape, not naturalized
#Hordeum vulgare	Hordeum vulgare	WAIF, ICPN, not in eFlora	3, accepted name for taxon occurring in CA only as a waif and/or garden escape, not naturalized
			if (($name =~ m/^Hordeum vulgare var\. trifurcatum$/) && ($full_accepted_NOAUTH =~ m/Hordeum vulgare var/)){
				$full_accepted_NOAUTH = "Hordeum vulgare";
			}
			
#Hordeum vulgare var. vulgare	Hordeum vulgare var. vulgare	WAIF, SYNONYM, ICPN	3a, taxonomic or nomenclatural synonym for taxon occurring in CA only as a waif and/or garden escape, not naturalized
#Hordeum vulgare	Hordeum vulgare	WAIF, ICPN, not in eFlora	3, accepted name for taxon occurring in CA only as a waif and/or garden escape, not naturalized
			if (($name =~ m/^Hordeum vulgare var\. vulgare$/) && ($full_accepted_NOAUTH =~ m/Hordeum vulgare var/)){
				$full_accepted_NOAUTH = "Hordeum vulgare";
			}

#Potentilla kelloggii	Horkelia cuneata subsp. sericea	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Horkelia cuneata var. sericea	Horkelia cuneata var. sericea	NATIVE ICPN	1, accepted name for taxon native to CA
			if (($name =~ m/^Potentilla kelloggii$/) && ($full_accepted_NOAUTH =~ m/Horkelia cuneata subs/)){
				$full_accepted_NOAUTH = "Horkelia cuneata var. sericea";
			}

#Potentilla lindleyi var. lepida	Horkelia cuneata subsp. cuneata	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Horkelia cuneata var. cuneata	Horkelia cuneata var. cuneata	NATIVE ICPN	1, accepted name for taxon native to CA
			if (($name =~ m/^Potentilla lindleyi var\. lepida$/) && ($full_accepted_NOAUTH =~ m/Horkelia cuneata subs/)){
				$full_accepted_NOAUTH = "Horkelia cuneata var. cuneata";
			}

#Juncus obtusatus	Juncus covillei var. obtusatus	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Juncus covillei var. obtusatus	Juncus covillei	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Juncus obtusatus$/) && ($full_accepted_NOAUTH =~ m/Juncus covillei var/)){
				$full_accepted_NOAUTH = "Juncus covillei";
			}

#Lemmonia californica	Nama californicum	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Nama californica	Nama californica	NATIVE ICPN	1, accepted name for taxon native to CA
			if (($name =~ m/^Lemmonia californica$/) && ($full_accepted_NOAUTH =~ m/Nama californicum/)){
				$full_accepted_NOAUTH = "Nama californica";
			}

#Lepidium acutidens var. cornigerum	Lepidium dictyotum var. acutidens	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Lepidium dictyotum var. acutidens	Lepidium acutidens	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Lepidium acutidens var\. cornigerum$/) && ($full_accepted_NOAUTH =~ m/Lepidium dictyotum var/)){
				$full_accepted_NOAUTH = "Lepidium acutidens";
			}

#Lepidium bernardinum	Lepidium virginicum var. pubescens	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Lepidium virginicum var. pubescens	Lepidium virginicum subsp. menziesii	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Lepidium bernardinum$/) && ($full_accepted_NOAUTH =~ m/Lepidium virginicum var/)){
				$full_accepted_NOAUTH = "Lepidium virginicum subsp. menziesii";
			}

#Lessingia lemmonii	Lessingia lemmonii	NATIVE ICPN	1, accepted name for taxon native to CA
#Lessingia lemmonii var. lemmonii	Lessingia glandulifera var. glandulifera	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Lessingia lemmonii$/) && ($full_accepted_NOAUTH =~ m/Lessingia lemmonii/)){
				$full_accepted_NOAUTH = "Lessingia glandulifera";
			}


#Saviniona dendroidea	Lavatera assurgentiflora subsp. assurgentiflora	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Lavatera assurgentiflora subsp. assurgentiflora	Malva assurgentiflora	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Saviniona dendroidea$/) && ($full_accepted_NOAUTH =~ m/Lavatera /)){
				$full_accepted_NOAUTH = "Malva assurgentiflora";
			}

#Mesoreanthus vimineus	Streptanthus barbiger	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Mesoreanthus vimineus is the basionym of Streptanthus vimineus; ICPN entry not updated to final eFlora accepted name?
			if (($name =~ m/^Mesoreanthus vimineus$/) && ($full_accepted_NOAUTH =~ m/Streptanthus bar/)){
				$full_accepted_NOAUTH = "Streptanthus vimineus";
			}

#Carex adusta var. congesta	Carex multicostata	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Carex adusta var\. congesta$/) && ($full_accepted_NOAUTH =~ m/Carex multicostata/)){
				$full_accepted_NOAUTH = "Carex pachycarpa";
			}#Tropicos states Carex adusta var. congesta is a synonym of Carex pachycarpa; Carex pachycarpa used to be a synonym of Carex multicostata in the eFlora

#Lycurus setosus	Lycurus setosus	EXCLUDED, NOT IN CALIFORNIA	8, accepted name for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
#the eflora has Lycurus setosus as a synonym of Muhlenbergia alopecuroides, so it is misclassified as 8, accepted name for taxon not occurring in CA  in ICPN, should be 1a?
			if (($name =~ m/^Lycurus setosus$/) && ($full_accepted_NOAUTH =~ m/Lycurus/)){
				$full_accepted_NOAUTH = "Muhlenbergia alopecuroides";
			}
			
#Allionia brandegei	Mirabilis pumila	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Mirabilis pumila	Mirabilis albida	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Allionia brandege/) && ($full_accepted_NOAUTH =~ m/Mirabilis pu/)){
				$full_accepted_NOAUTH = "Mirabilis albida";
			}

#Thlaspi glaucum var. hesperium	Thlaspi montanum var. montanum	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Thlaspi montanum var. montanum	Noccaea fendleri subsp. glauca	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Thlaspi glaucum var\. hesperium$/) && ($full_accepted_NOAUTH =~ m/Thlaspi /)){
				$full_accepted_NOAUTH = "Noccaea fendleri subsp. glauca";
			}


#Opuntia littoralis var. vaseyi	Opuntia X vaseyi	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Opuntia littoralis var\. vaseyi$/) && ($full_accepted_NOAUTH =~ m/Opuntia/)){
				$full_accepted_NOAUTH = "Opuntia vaseyi";
			}

#Opuntia littoralis var. austrocalifornica	Opuntia X vaseyi
			if (($name =~ m/^Opuntia littoralis var\. austrocalifornica$/) && ($full_accepted_NOAUTH =~ m/Opuntia/)){
				$full_accepted_NOAUTH = "Opuntia vaseyi";
			}

#Opuntia acanthocarpa var. coloradensis	Cylindropuntia acanthocarpa var. coloradensis	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#Cylindropuntia acanthocarpa var. coloradensis	Cylindropuntia acanthocarpa var. acanthocarpa	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Opuntia acanthocarpa var\. coloradensis$/) && ($full_accepted_NOAUTH =~ m/Cylindropuntia acanthocarpa var\. col/)){
				$full_accepted_NOAUTH = "Cylindropuntia acanthocarpa var. acanthocarpa";
			}

#Senecio pseudaureus var. pseudaureus	Packera pseudaurea var. pseudaurea	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#Senecio pseudaureus	Packera pseudaurea	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#Senecio pauciflorus var. jucundulus	Senecio pseudaureus	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Senecio pauciflorus var\. jucundulus$/) && ($full_accepted_NOAUTH =~ m/Senecio /)){
				$full_accepted_NOAUTH = "Packera pseudaurea var. pseudaurea";
			}


#Packera cymbalarioides	Packera streptanthifolia	EXCLUDED NATIVE, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#Senecio cymbalarioides	Packera subnuda var. subnuda	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Packera cymbalarioides$/) && ($full_accepted_NOAUTH =~ m/Packera strep/)){
				$full_accepted_NOAUTH = "Packera subnuda var. subnuda";
			}

#Phacelia dasyphylla	Phacelia hastata subsp. compacta	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Phacelia hastata subsp. compacta	Phacelia hastata var. compacta	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Phacelia dasyphylla$/) && ($full_accepted_NOAUTH =~ m/Phacelia hastata sub/)){
				$full_accepted_NOAUTH = "Phacelia hastata var. compacta";
			}

#Phacelia oreopola subsp. simulans	Phacelia hastata subsp. hastata	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Phacelia hastata subsp. hastata	Phacelia hastata var. hastata	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Phacelia oreopola subsp\. simulans$/) && ($full_accepted_NOAUTH =~ m/Phacelia hastata sub/)){
				$full_accepted_NOAUTH = "Phacelia hastata var. hastata";
			}

#Phacelia californica f. vinctens	Phacelia heterophylla subsp. virgata	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Phacelia heterophylla subsp. virgata	Phacelia heterophylla var. virgata	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Phacelia californica f\. vinctens$/) && ($full_accepted_NOAUTH =~ m/Phacelia heterophylla sub/)){
				$full_accepted_NOAUTH = "Phacelia heterophylla var. virgata";
			}

#Phacelia douglasii var. cryptantha	Phacelia douglasii	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#this name is a synonym of Phacelia stellaris in the eFlora; ICPN needs updated
			if (($name =~ m/^Phacelia douglasii var\. cryptantha$/) && ($full_accepted_NOAUTH =~ m/Phacelia dou/)){
				$full_accepted_NOAUTH = "Phacelia stellaris";
			}


#Plectritis davyana	Plectritis ciliosa subsp. insignis	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Plectritis ciliosa subsp. insignis	Plectritis ciliosa	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Plectritis davyana$/) && ($full_accepted_NOAUTH =~ m/Plectritis ciliosa sub/)){
				$full_accepted_NOAUTH = "Plectritis ciliosa";
			}

#Phacelia magellanica subsp. barbata	Phacelia imbricata subsp. patula	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Phacelia imbricata subsp. patula	Phacelia imbricata var. patula	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Phacelia magellanica subsp\. barbata$/) && ($full_accepted_NOAUTH =~ m/Phacelia imbricata sub/)){
				$full_accepted_NOAUTH = "Phacelia imbricata var. patula";
			}

#Potentilla plattensis var. leucophylla	Potentilla drummondii subsp. breweri	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Potentilla drummondii subsp. breweri	Potentilla breweri	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Potentilla plattensis var\. leucophylla$/) && ($full_accepted_NOAUTH =~ m/Potentilla drummondii/)){
				$full_accepted_NOAUTH = "Potentilla breweri";
			}

#Ledum glandulosum var. australe	Ledum glandulosum	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Ledum glandulosum	Rhododendron columbianum	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Ledum glandulosum var\. australe$/) && ($full_accepted_NOAUTH =~ m/Ledum glandulosum/)){
				$full_accepted_NOAUTH = "Rhododendron columbianum";
			}

#Rorippa curvipes var. truncata	Rorippa curvipes	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#Radicula sinuata var. truncata	Rorippa curvipes var. truncata	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Radicula sinuata var\. truncata$/) && ($full_accepted_NOAUTH =~ m/Rorippa curvipes va/)){
				$full_accepted_NOAUTH = "Rorippa curvipes";
			}

#Rorippa curvisiliqua var. occidentalis	Rorippa curvisiliqua	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#Rorippa multicaulis	Rorippa curvisiliqua var. occidentalis	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Rorippa multicaulis$/) && ($full_accepted_NOAUTH =~ m/Rorippa curvisiliqua var/)){
				$full_accepted_NOAUTH = "Rorippa curvisiliqua";
			}

#Scirpus tenuis	Eleocharis tenuis	WAIF, SYNONYM, ICPN	3a, taxonomic or nomenclatural synonym for taxon occurring in CA only as a waif and/or garden escape, not naturalized
#eflora accepted name is Eleocharis tenuis var. tenuis and conflixts with ICPN which is just Eleocharis tenuis; no species page in eFlora either.
			if (($name =~ m/^Scirpus tenuis$/) && ($full_accepted_NOAUTH =~ m/Eleocharis tenuis$/)){
				$full_accepted_NOAUTH = "Eleocharis tenuis var. tenuis";
			}

#Silene scouleri subsp. grandis	Silene scouleri subsp. scouleri	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#Silene scouleri var. pacifica	Silene scouleri subsp. grandis	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Silene scouleri var\. pacifica$/) && ($full_accepted_NOAUTH =~ m/Silene scouleri subsp\. g/)){
				$full_accepted_NOAUTH = "Silene scouleri subsp. scouleri";
			}

#Streptanthus orbiculatus	Streptanthus tortuosus var. orbiculatus	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Streptanthus tortuosus var. orbiculatus	Streptanthus tortuosus	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Streptanthus orbiculatus$/) && ($full_accepted_NOAUTH =~ m/Streptanthus tortuosus var/)){
				$full_accepted_NOAUTH = "Streptanthus tortuosus";
			}

#Streptanthus suffrutescens	Streptanthus tortuosus var. suffrutescens	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Streptanthus tortuosus var. suffrutescens	Streptanthus tortuosus	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Streptanthus suffrutescens$/) && ($full_accepted_NOAUTH =~ m/Streptanthus tortuosus var/)){
				$full_accepted_NOAUTH = "Streptanthus tortuosus";
			}


#Trifolium pseudo-albopurpureum	Trifolium albopurpureum var. albopurpureum	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Trifolium albopurpureum var. albopurpureum	Trifolium albopurpureum	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Trifolium pseudo-albopurpureum$/) && ($full_accepted_NOAUTH =~ m/Trifolium albopurpureum var/)){
				$full_accepted_NOAUTH = "Trifolium albopurpureum";
			}

#Trifolium columbinum var. argillorum	Trifolium albopurpureum var. albopurpureum	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Trifolium albopurpureum var. albopurpureum	Trifolium albopurpureum	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Trifolium columbinum var\. argillorum$/) && ($full_accepted_NOAUTH =~ m/Trifolium albopurpureum var/)){
				$full_accepted_NOAUTH = "Trifolium albopurpureum";
			}

#Trifolium helleri	Trifolium albopurpureum var. albopurpureum	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Trifolium helleri$/) && ($full_accepted_NOAUTH =~ m/Trifolium albopurpureum var/)){
				$full_accepted_NOAUTH = "Trifolium albopurpureum";
			}

#Trifolium petrophilum	Trifolium albopurpureum subsp. columbinum	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#the basionym for this name would be Trifolium columbinum, which is an accepted name in the eFlora now, so this follows that this name would be a synonym
#subsp. columbinum is still not published
			if (($name =~ m/^Trifolium petrophilum$/) && ($full_accepted_NOAUTH =~ m/Trifolium albopurpureum subsp\. columbinum/)){
				$full_accepted_NOAUTH = "Trifolium columbinum";
			}

#Taraxacum laevigatum	Taraxacum laevigatum	EXCLUDED, NOT IN CALIFORNIA	8, accepted name for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
#Taraxacum is not labeled as a misapplied or excluded accepted name in the eflora, it is listed as a synonym of Taraxacum officinale and misapplied to Taraxacum erythrospermum
			if (($name =~ m/^Taraxacum laevigatum$/) && ($full_accepted_NOAUTH =~ m/Taraxacum laevigatum/)){
				$full_accepted_NOAUTH = "Taraxacum officinale";
			}

#Bahia neomexicana	Picradeniopsis multiflora	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#Schkuhria multiflora var. multiflora	Bahia neomexicana	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#Schkuhria multiflora	Bahia neomexicana	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Schkuhria multiflora var\. multiflora$/) && ($full_accepted_NOAUTH =~ m/Bahia /)){
				$full_accepted_NOAUTH = "Picradeniopsis multiflora";
			}			
			
			if (($name =~ m/^Schkuhria multiflora$/) && ($full_accepted_NOAUTH =~ m/Bahia /)){
				$full_accepted_NOAUTH = "Picradeniopsis multiflora";
			}

#Amauriopsis dissecta	Hymenothrix dissecta	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#Bahia dissecta	Amauriopsis dissecta	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Bahia dissecta$/) && ($full_accepted_NOAUTH =~ m/Amauriopsis /)){
				$full_accepted_NOAUTH = "Hymenothrix dissecta";
			}

#Machaeranthera montana	Machaeranthera canescens var. canescens	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Machaeranthera canescens var. canescens	Dieteria canescens var. canescens	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Machaeranthera montana$/) && ($full_accepted_NOAUTH =~ m/Machaeranthera /)){
				$full_accepted_NOAUTH = "Dieteria canescens var. canescens";
			}

#Scirpus tuberosus	Scirpus tuberosus	EXCLUDED, NOT IN CALIFORNIA	8, accepted name for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
#though excluded, the name outside California is no longer in Scirpus, changing this to the Bolboschoenus synonym so that it is not conflicting anymore 
			if (($name =~ m/^Scirpus tuberosus$/) && ($full_accepted_NOAUTH =~ m/Scirpus /)){
				$full_accepted_NOAUTH = "Bolboschoenus tuberosus";
			}


#Rumex salicifolius var. mexicanus	Rumex salicifolius var. mexicanus	EXCLUDED, NOT IN CALIFORNIA	8, accepted name for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
#This conflicts with the other ICPN records and with the eFlora, as in accordance with the FNA treatment, this is not an accepted name anymore.  It should be Rumex mexicanus
			if (($name =~ m/^Rumex salicifolius var\. mexicanus$/) && ($full_accepted_NOAUTH =~ m/Rumex salic/)){
				$full_accepted_NOAUTH = "Rumex mexicanus";
			}

#Danthonia pilosa	Danthonia pilosa	EXCLUDED, NOT IN CALIFORNIA	8, accepted name for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
#Rytidosperma pilosum	Danthonia pilosa	EXCLUDED NOT IN CALIFORNIA, SYNONYM	8a, taxonomic or nomenclatural synonym for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
#Danthonia pilosa as accepted name conflicts with the eFlora; it should be Rytidosperma pilosa as accepted name
			if (($name =~ m/^Rytidosperma pilosum$/) && ($full_accepted_NOAUTH =~ m/Danthonia /)){
				$full_accepted_NOAUTH = "Rytidosperma pilosum";
			}
			if (($name =~ m/^Danthonia pilosa$/) && ($full_accepted_NOAUTH =~ m/Danthonia /)){
				$full_accepted_NOAUTH = "Rytidosperma pilosum";
			}


#Luzula fastigiata	Luzula parviflora	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Luzula fastigiata is the basionym of the accepted name Luzula parviflora subsp. fastigiata
#therefore the accepted name line for Luzula fastigiata should be that name, not just Luzula parviflora
			#if (($name =~ m/^Luzula fastigiata$/) && ($full_accepted_NOAUTH =~ m/^Luzula parviflora$/)){
			#	$full_accepted_NOAUTH = "Luzula parviflora subsp. fastigiata";
			#}#this one is no longer wrong after Luzula revision in 2023

#fix problem entries that still have an old accepted name, not the current Eflora one, make a note to Tom about these
	#if ($name =~ m/^Centaurea repens$/){
	#	$full_accepted_NOAUTH = "Rhaponticum repens";#
	#}#718	Centaurea repens	Acroptilon repens	NATURALIZED, SYNONYM ICPN	2a, taxonomic or nomenclatural synonym for taxon naturalized in CA

	#if ($name =~ m/^Dichelostemma pulchellum var\. pulchellum$/){
	#	$full_accepted_NOAUTH = "Dipterostemon capitatus subsp. capitatus";#
	#}#22848	Dichelostemma pulchellum var. pulchellum	Dichelostemma capitatum	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA

	#if ($name =~ m/^Dichelostemma pulchellum$/){
	#	$full_accepted_NOAUTH = "Dipterostemon capitatus";#
	#}#22848	Dichelostemma pulchellum	Dichelostemma capitatum	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
	
	if ($name =~ m/^Bromus luzonensis$/){
		$full_accepted_NOAUTH = "Bromus sitchensis var. marginatus";#
	}#82220	Bromus luzonensis	Bromus carinatus var. marginatus	NATIVE, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
	if ($name =~ m/^Bromus carinatus var\. carinatus$/){
		$full_accepted_NOAUTH = "Bromus sitchensis var. carinatus";#
	}#71544	Bromus carinatus var. carinatus	Bromus carinatus var. carinatus	NATIVE ICPN	1, accepted name for taxon native to CA
	if ($name =~ m/^Bromus carinatus var\. marginatus$/){
		$full_accepted_NOAUTH = "Bromus sitchensis var. marginatus";#
	}#82220	Bromus carinatus var. marginatus	Bromus carinatus var. marginatus	NATIVE ICPN	1, accepted name for taxon native to CA


	if ($name =~ m/^Lotus wrightii$/){
		$full_accepted_NOAUTH = "Acmispon argyraeus";#not Lotus argyraeus as in ICPN
	}#Lotus wrightii	Lotus argyraeus	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA

	if ($name =~ m/^Lotus scoparius var. perplexans$/){
		$full_accepted_NOAUTH = "Acmispon glaber var. glaber";#not Lotus scoparius as in ICPN
	}#Lotus scoparius var. perplexans	Lotus scoparius	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA

	if ($name =~ m/^Hosackia argophylla var. decora$/){
		$full_accepted_NOAUTH = "Acmispon argophyllus var. argophyllus";#not Lotus nevadensis as in ICPN
	}#Hosackia argophylla var. decora	Lotus nevadensis	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Lotus argophyllus var. decorus is listed as synonym of Acmispon argophyllus Brouillet var. argophyllus in ICPN


	if ($name =~ m/^Lotus douglasii var. congestus$/){
		$full_accepted_NOAUTH = "Acmispon nevadensis var. nevadensis";#not Lotus nevadensis var. nevadensis as in ICPN
	}#Lotus douglasii var. congestus	Lotus nevadensis var. nevadensis	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA

	if ($name =~ m/^Lotus hirtellus$/){
		$full_accepted_NOAUTH = "Acmispon strigosus";#not Lotus strigosus as in ICPN
	}#Lotus hirtellus	Lotus strigosus	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA

	if ($name =~ m/^Ampelodesmos mauritanicus$/){
		$full_accepted_NOAUTH = "Stipa mauritanica";#not Ampelodesmos mauritanicus not an accepted name in EFLORA but it is accepted in ICPN still
	}#Ampelodesmos mauritanicus	Ampelodesmos mauritanicus	NATURALIZED ICPN	2, accepted name for taxon naturalized in CA
#Stipa mauritanica	Stipa mauritanica	NATURALIZED ICPN	2, accepted name for taxon naturalized in CA


#Cupressus arizonica	Cupressus arizonica	EXCLUDED, NOT IN CALIFORNIA	8, accepted name for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
			if ($name =~ m/^Cupressus arizonica$/){
				$full_accepted_NOAUTH = "Hesperocyparis arizonica";#not Cupressus arizonica not an accepted name following the genus delimitation in eFlora, this is done here to eliminate synonymy conflict
			}

#Cupressus arizonica subsp. arizonica	Cupressus arizonica subsp. arizonica	EXCLUDED, NOT IN CALIFORNIA	8, accepted name for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
			if ($name =~ m/^Cupressus arizonica subsp\. arizonica$/){
				$full_accepted_NOAUTH = "Hesperocyparis arizonica";#not Cupressus arizonica not an accepted name following the genus delimitation in eFlora, this is done here to eliminate synonymy conflict
			}
			
#fix other names that do not have a current name line, but are marked as synonyms or rejected name

			if (($name =~ m/^Achnatherum papposum$/) && ($status =~ m/3b, /i)){
				$name = "Jarava plumosa";
				$full_accepted_NOAUTH = "Stipa plumosa";
			}

			if (($name =~ m/^Arabis fernaldiana$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Boechera fernaldiana";
			}

			if (($name =~ m/^Argyrochosma limitanea var\. limitanea$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Argyrochosma limitanea subsp. limitanea";
			}


#fix some specific cases where the ICPN name does not have a name in Current Name line
			#if (($name =~ m/^Andersonglossum occidentale$/)  && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/)){#fix a problem name that does not yet have an valid current name line
			#	$full_accepted_NOAUTH = "Cynoglossum occidentale";
			#	$genus = "Andersonglossum";
			#}


#fix one problem name that the name in ICPN is not published, possible error
		if ($name =~ m/^Acacia farnesiana var. minuta$/){
			$name = "Acacia farnesiana subsp. minuta";
			$full_accepted_NOAUTH = "Vachellia farnesiana var. minuta";
			$genus = "Acacia";
		}

#fix some specific cases where the ICPN SYNONYM or REJECTED name does not have a Current Name line



			if (($name =~ m/^Cassiope mertensiana subsp\. californica$/) && ($status =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Cassiope mertensiana";
				$status_exception = "Current Status 'unresolved' in ICPN and Current Name conflicts with EFLORA, Current Name in EFLORA used as replacement";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}

			if (($name =~ m/^Cassiope mertensiana subsp\. ciliolata$/) && ($status =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Cassiope mertensiana";
				$status_exception = "Current Status 'unresolved' in ICPN and Current Name conflicts with EFLORA, Current Name in EFLORA used as replacement";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}

			if (($name =~ m/^Cassiope mertensiana subsp\. mertensiana$/) && ($status =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Cassiope mertensiana";
				$status_exception = "Current Status 'unresolved' in ICPN and Current Name conflicts with EFLORA, Current Name in EFLORA used as replacement";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}

			if (($name =~ m/^Cassiope mertensiana var\. mertensiana$/) && ($status =~ m/nomenclatural synonym/i)){
				$full_accepted_NOAUTH = "Cassiope mertensiana";
				$status_exception = "Current Name line 'unresolved' in ICPN, but suggested in comments"
			}


			if (($name =~ m/^Cornus greenei$/) && ($status =~ m/nomenclatural synonym/i)){
				$full_accepted_NOAUTH = "Cornus sericea subsp. sericea";
				$status_exception = "Current Name line missing in ICPN, but suggested in comments";
			}

			if (($name =~ m/^Grindelia procera$/) && ($status =~ m/tentative 1a/i)){
				$full_accepted_NOAUTH = "Grindelia camporum";
				$status_exception = " Source only from SMASCH, Current Status not recently updated in ICPN, and Current Name conflicts with EFLORA, Current Name in EFLORA used as replacement";
			}

			if (($name =~ m/^Grindelia rubricaulis$/) && ($status =~ m/tentative 1a, taxonomic/i)){
				$full_accepted_NOAUTH = "Grindelia hirsutula";
				$status_exception = "Current Name as Grindelia hirsutula var. hirsutula in ICPN, but subtaxa not recognized in EFLORA";
				#add one additional record, this taxon is split into two subtaxa, adding the typical one here
				print OUT "Grindelia hirsutula var. hirsutula\tGrindelia hirsutula\n";
				print OUT4 "Grindelia hirsutula var. hirsutula\tGrindelia hirsutula\t".$status_short."\t".$status."\n";

			}
			if (($name =~ m/^Grindelia rubricaulis f\. pubescens$/) && ($status =~ m/tentative 1a, taxonomic/i)){
				$full_accepted_NOAUTH = "Grindelia hirsutula";
				$status_exception = "Current Name as Grindelia (without a species epithet) in ICPN";
			}
			if (($name =~ m/^Grindelia rubricaulis var\. interioris$/) && ($status =~ m/tentative 1a, taxonomic/i)){
				$full_accepted_NOAUTH = "Grindelia camporum";
				$status_exception = "Current Name as Grindelia hirsutula var. davyi in ICPN, but the current name for that 'var. davyi' is Grindelia camporum in EFLORA";
			}


			if (($name =~ m/^Lathyrus bijugatus$/) && ($status =~ m/nomenclatural synonym/i)){
				$full_accepted_NOAUTH = "Lathyrus lanszwertii var. lanszwertii";
				$status_exception = " SYNONYM, EXCLUDED in ICPN and EFLORA, NOT IN CALIFORNIA, Current Name line 'unresolved' in ICPN";
				#add one additional record, this taxon is split into two subtaxa, adding the typical one here
				print OUT "Lathyrus bijugatus var. bijugatus\tLathyrus lanszwertii var. lanszwertii\n";
				print OUT4 "Lathyrus bijugatus var. bijugatus\tLathyrus lanszwertii var. lanszwertii\t".$status_short."\t".$status_exception."\n";
			}


			if (($name =~ m/^Limonium ramosissimum subsp\. provinciale$/) && ($status =~ m/^unresolved/i)){
				$full_accepted_NOAUTH = "Limonium ramosissimum";
				$status_exception = "Current Name line 'unresolved' in ICPN; subtaxa not recognzed in eFlora, but status of Limonium ramosissimum is NATURALIZED";
				$status_short = "EXCLUDED, NATURALIZED, possibly NOT IN CALIFORNIA, subtaxon name needs taxonomic resolution ICPN";
			}



			if (($name =~ m/^Lupinus lyallii var\. villosus$/) && ($status =~ m/nomenclatural synonym/i)){
				$full_accepted_NOAUTH = "Lupinus lepidus var. lobbii";
				$status_exception = "Current Name line 'unresolved' in ICPN, but suggested in comments";
			}



			if (($name =~ m/^Lupinus polyphyllus var\. grandifolius$/) && ($status =~ m/^(unresolved|NONE|NULL|1a,)/i)){
				$full_accepted_NOAUTH = "Lupinus polyphyllus var\. polyphyllus";
				$status_exception = "Current Status 'unresolved' in ICPN and Current Name conflicts with EFLORA, Current Name in EFLORA used as replacement";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}

			if (($name =~ m/^Lupinus tidestromii var\. layneae$/) && ($status =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Lupinus tidestromii";
				$status_exception = "Current Status 'unresolved' in ICPN and Current Name conflicts with EFLORA, Current Name in EFLORA used as replacement";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}

			if (($name =~ m/^Lupinus tidestromii var\. tidestromii$/) && ($status =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Lupinus tidestromii";
				$status_exception = "Current Status 'unresolved' in ICPN and Current Name conflicts with EFLORA, Current Name in EFLORA used as replacement";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}

			if (($name =~ m/^Lupinus sparsiflorus var\. inopinatus$/) && ($status =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Lupinus sparsiflorus";
				$status_exception = "Current Status 'unresolved' in ICPN and Current Name conflicts with EFLORA, Current Name in EFLORA used as replacement";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}

			if (($name =~ m/^Lupinus sparsiflorus subsp\. inopinatus$/) && ($status =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Lupinus sparsiflorus";
				$status_exception = "Current Status 'unresolved' in ICPN and Current Name conflicts with EFLORA, Current Name in EFLORA used as replacement";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}

			if (($name =~ m/^Lupinus sparsiflorus subsp\. mohavensis$/) && ($status =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Lupinus sparsiflorus";
				$status_exception = "Current status 'unresolved' in ICPN, Current Name in EFLORA used as replacement";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
				print OUT4 "Lupinus sparsiflorus var\. mohavensis\tLupinus sparsiflorus\t".$status_short."\t".$status."\n";
				print OUT "Lupinus sparsiflorus var\. mohavensis\tLupinus sparsiflorus\n";
			}

			if (($name =~ m/^Lupinus sparsiflorus subsp\. pondii$/) && ($status =~ m/8, |unresolved|NONE|NULL/i)){
				$full_accepted_NOAUTH = "Lupinus sparsiflorus";
				$status_exception = " last revised in 2002 when subtaxa within Lupinus sparsiflorus were recognized; as an accepted name, this conflicts now with the EFLORA, since this species no longer has subtaxa";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
				print OUT4 "Lupinus sparsiflorus var\. pondii\tLupinus sparsiflorus\t".$status_short."\t".$status."\n";
				print OUT "Lupinus sparsiflorus var\. pondii\tLupinus sparsiflorus\n";
			}

			if (($name =~ m/^Lupinus sparsiflorus subsp\. sparsiflorus$/) && ($status =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Lupinus sparsiflorus";
				$status_exception = "Current Status 'unresolved' in ICPN and Current Name conflicts with EFLORA, Current Name in EFLORA used as replacement";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}

#Monarda punctata subsp. punctata	Monarda punctata subsp. punctata	EXCLUDED, NOT IN CALIFORNIA	8, accepted name for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
			if (($name =~ m/^Monarda punctata subsp\. punctata$/) && ($status =~ m/ 8, accepted name/i)){
				$full_accepted_NOAUTH = "Monarda punctata var. punctata";
				$status_exception = " Monarda punctata subsp. punctata is accepted in ICPN, but Monarda punctata var. punctata is also accepted";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}

			if (($name =~ m/^Phacelia heterosepala$/) && ($status =~ m/nomenclatural synonym/i)){
				$full_accepted_NOAUTH = "Phacelia cicutaria";
				$status_exception = "Current Name line 'unresolved' in ICPN, Current Name in EFLORA used as replacement";
			}

			if (($name =~ m/^Quercus dunnii$/) && ($full_accepted_NOAUTH =~ m/ 1b,/i)){
				$full_accepted_NOAUTH = "Quercus palmeri";
				$status_exception = " missing Current Name line, but the comments state that Quercus palmeri is the accepted name in ICPN and EFLORA";
			}


#fix problem entries from TJM names that are homonyms that have conflict cross-generic synonym

#fix the problem with the Leptosiphon aureus Nutt. line

$name =~ s/^Leptosiphon aureus \(?Nutt.+$/Leptosiphon aureus (Nutt.) of various auth. non Benth./g;

#Festuca rigida	Festuca rigida	AGRICULTURAL, GARDEN, OR URBAN WEED, ICPN	4, accepted name for taxon occurring in CA only as an agricultural, garden, or urban weed
#			if (($name =~ m/^Festuca rigida$/) && ($full_accepted_NOAUTH =~ m/Festuca rigida/)){
#				$full_accepted_NOAUTH = "unresolved";
#			}
	next if $name =~ m/^Festuca rigida \(L.+$/;
#do not activate these, just make sure the homonym Festuca rigida (L.) Raspail is excluded from lists

#ICPN is Nasturtium dictyotum Greene, which is a synonym for Rorippa palustris; conflicts with Nasturtium dictyotum (A. Gray) Kuntze which is a synonym of Lepidium dictyotum A. Gray
	next if $name =~ m/^Nasturtium dictyotum Greene/;



		
#########FIX SOME NOMEN REJ. NAMES with problem accepted name lines

		#1b
			#these do not have problems with accepted name lines
			#Funastrum cynanchoides subsp\. heterophyllum; Eryngium globosum var\. medium
			#Asplenium trichomanes-ramosum; Deinandra ramosissima
			#Erigeron acris subsp\. debilis; Erigeron greenei;Gnaphalium bicolor
			#Gnaphalium collinum; Hymenoclea salsola var\. patula; Microseris laciniata var. siskiyouensis
			#Pseudognaphalium bicolor; Amsinckia menziesii var\. intermedia;Achnatherum lemmonii var\. lemmonii
			#Achnatherum lemmonii var\. pubescens;Aristida ternipes var\. hamulosa;Athyrium alpestre
			#Athyrium alpestre var\. americanum;Ceanothus arboreus var\. glabra;Ceanothus velutinus var\. hookeri
			#Ceanothus &times;arcuatus;Cuscuta vivipara;Diplacus longiflorus subsp\. lompocensis
			#Dodecatheon pulchellum subsp\. monanthum;Eriogonum hooveri;Eriogonum nudum var\. oblanceolatum
			#Eriogonum nudum var\. pineum;Eriogonum saltutorium;Eriogonum umbellatum var\. nelsonii
			#Erysimum capitatum subsp\. angustatum;Erysimum capitatum subsp\. capitatum;Erysimum capitatum subsp\. lompocense
			#Erysimum capitatum subsp\. perenne;Erysimum insulare subsp\. suffrutescens;Erysimum insulare var\. grandifolium
			#Erysimum menziesii subsp\. concinnum;Erysimum menziesii subsp\. eurekense;Erysimum menziesii subsp\. menziesii
			#Erysimum menziesii subsp\. yadonii;Fritillaria affinis var\. affinis;Fritillaria affinis var\. tristulis
			#Fritillaria lanceolata var\. tristulis;Guillenia lemmonii;Hutchinsia procumbens;Juncus effusus var\. australis
			#Lupinus andersonii var\. mariposanus; Malva assurgentiflora subsp. glabra;Malva dendromorpha
			#Mulgedium pulchellum;Orobanche cooperi subsp\. latiloba;Packera cymbalarioides;Packera streptanthifolia var\. rubricaulis
			#Plagiobothrys chorisianus var\. undulatus;Plagiobothrys myosotoides subsp\. verrucosus;Potamogeton filiformis subsp\. alpinus
			#Pseudobahia bahiifolia var\. pinnatifida;Quercus celata;Rubus ursinus var\. typicus
			#Salix lasiolepis var\. tracyi;
		#2b
			#Senna eremophila;Alyssum minus;Chamaesyce dendroides;Plantago indica;Plantago psyllium
			#Bromus hordeaceus subsp\. molliformis;Rosa eglanteria
		#3b
			#Ziziphus jujuba,Grindelia papposa
		#4b
			#Achnatherum papposum

				#skip these names since they are unpublished names without a current name field
				#not currently accepted in EFLORA

#fix some specific cases where the ICPN accepted name conflicts with the eFlora accepted name, Tom needs to be made aware of these
			#if ($name =~ m/^Triteleia versicolor$/){
			#	$full_accepted_NOAUTH = "Triteleia &times;versicolor";#not Triteleia versicolor as in ICPN
			#} #as written, the synonymy is coming up as both Triteleia versicolor and Triteleia X versicolor as accepted names

#.Arabis platysperma A. Gray var. platysperma	Current Name: Boechera elkoensis Windham & Al-Shehbaz; Boechera platysperma (A. Gray) Al-Shehbaz
			if (($name =~ m/^Arabis platysperma var\. platysperma$/) && ($full_accepted_NOAUTH =~ m/Boechera elkoensis/i)){
				$full_accepted_NOAUTH = "Boechera platysperma";
			}

#.Arabis platysperma	Current Name: Boechera elkoensis Windham & Al-Shehbaz; Boechera platysperma (A. Gray) Al-Shehbaz
			if (($name =~ m/^Arabis platysperma$/) && ($full_accepted_NOAUTH =~ m/Boechera elkoensis/i)){
				$full_accepted_NOAUTH = "Boechera platysperma";
			}


#Eryngium globosum	Eryngium spinosepalum	NATIVE; UNPUBLISHED, INVALID, ILLEGITIMATE, OR REJECTED IN ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
			if ($name =~ m/^(Eryngium globosum)$/){
				$full_accepted_NOAUTH = "Eryngium spinosepalum";
				#add one additional record, this taxon is split into two subtaxa, adding the species here, which is missing in ICPN
			}

			if (($name =~ m/^Amsinckia sancti-nicolai$/) && ($status =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Amsinckia spectabilis var. spectabilis";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}

#Eriogonum apiculatum var. apiculatum; Current Status: 1, accepted name for taxon native to CA
			if (($name =~ m/^Eriogonum apiculatum var\. apiculatum$/) && ($status =~ m/ 1, accepted/i)){
				$full_accepted_NOAUTH = "Eriogonum apiculatum";
				$status_exception = " Eriogonum apiculatum var. apiculatum is accepted in ICPN, but Eriogonum apiculatum is accepted in the eFlora without infrataxa";
				$status = "unresolved taxonomic or nomenclatural synonym of an EFLORA accepted name";
			}

#Packera cymbalarioides
			if (($name =~ m/^Packera cymbalarioides$/) && ($status =~ m/ 1b,/i)){
				$full_accepted_NOAUTH = "Packera subnuda var. subnuda";
				$status_exception = " Packera subnuda var. susubnuda is accepted in EFLORA and Senecio cymbalarioides is listed as a synonym; Packera streptanthifolia is the accepted name in ICPN, which contradicts the EFLORA synonymy";
			}
			
#these accepted names are still Eucephalus breweri in ICPN
			#if (($name =~ m/^Aster breweri$/) && ($full_accepted_NOAUTH =~ m/NONE|NULL|Eucephalus/)){
			#	$full_accepted_NOAUTH = "Doellingeria breweri";
			#}
			#if (($name =~ m/^Aster breweri var\. breweri$/) && ($full_accepted_NOAUTH =~ m/NONE|NULL|Eucephalus/)){
			#	$full_accepted_NOAUTH = "Doellingeria breweri";
			#}
			#if (($name =~ m/^Aster breweri var\. multibracteata$/) && ($full_accepted_NOAUTH =~ m/NONE|NULL|Eucephalus/)){
			#	$full_accepted_NOAUTH = "Doellingeria breweri";
			#}
			
#these are unresolved names that have problematic current status line text
#Rubus bifrons is the only taxon marked as this in ICPN
			if (($name =~ m/^Rubus bifrons$/) && ($status =~ m/^uncertain/i)){
				$full_accepted_NOAUTH = "Rubus bifrons";
				$status_exception = "EXCLUDED, Current Status 'uncertain'; Current Name unresolved, possible addition, possible new name for taxon treated in TJM2";
			}

#fix one problem name that the name in ICPN is not published, possible error
		#if ($name =~ m/^Acacia farnesiana var. minuta$/){
		#	$name = "Acacia farnesiana subsp. minuta";
		#	$full_accepted_NOAUTH = "Vachellia farnesiana var. minuta";
		#	$genus = "Acacia";
		#}


#Assign specimens without a current name line a consistent placeholder
	if ($full_accepted_NOAUTH =~ m/^(NONE|NULL| *)$/){
			$full_accepted_NOAUTH = "NONE NEED FIX";
	}


#These do not have any possible mentioned accepted names in ICPN or eFlora; mostly unpublished names
#	Allium serpentinum	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Arctostaphylos trinitensis	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Aster eastwoodiae	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Atriplex natrophila	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Botrychium simplex var. fontanum	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Bromus emarginatus	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	2b, unpublished, invalidly published, illegitimate, or rejected name for taxon naturalized in CA
#	Calochortus clavatus var. arcuatus	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Carex gianonei	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Cassiope mertensiana var. mertensiana	Unresolved	NATURALIZED, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#	Caulanthus heterophyllus var. pseudosimulans	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Caulanthus sierrae	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Chenopodium album var. striatum	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	2b, unpublished, invalidly published, illegitimate, or rejected name for taxon naturalized in CA
#	Consolida ambigua	NULL (EXCLUDED SYNONYM in ICPN without entry in Current Name)	EXCLUDED NOT IN CALIFORNIA, SYNONYM	8a, taxonomic or nomenclatural synonym for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
#	Cryptantha circumscissa var. hispida	Cryptantha circumscissa var. circumscissa.	NATURALIZED, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#	Eriogonum apiculatum var. galbinum	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Eriogonum diabolis	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Eriogonum sarmentosum	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Festuca howellii	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Fraxinus trifoliata	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Geranium homeanum	NULL (EXCLUDED SYNONYM in ICPN without entry in Current Name)	EXCLUDED NOT IN CALIFORNIA, SYNONYM	8a, taxonomic or nomenclatural synonym for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
#	Gilia sabulosa	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Hesperolinon serpentinum	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Ischaemum leersioides	NULL (EXCLUDED SYNONYM in ICPN without entry in Current Name)	EXCLUDED NOT IN CALIFORNIA, SYNONYM	8a, taxonomic or nomenclatural synonym for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
#	Isoetes tenella	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Lathyrus bijugatus	Unresolved	EXCLUDED NOT IN CALIFORNIA, SYNONYM	8a, taxonomic or nomenclatural synonym for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
#	Lemna minor var. obscura	NULL (EXCLUDED SYNONYM in ICPN without entry in Current Name)	EXCLUDED NOT IN CALIFORNIA, SYNONYM	8a, taxonomic or nomenclatural synonym for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
#	Limonium arborescens	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	2b, unpublished, invalidly published, illegitimate, or rejected name for taxon naturalized in CA
#	Listera cordata var. cordata	NONE	NATURALIZED, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#	Lotus sylvestris	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Lupinus fulcratus var. undulatus	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Lupinus lyallii var. villosus	Unresolved	NATURALIZED, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#	Lupinus shastensis	Unresolved	EXCLUDED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA, accepted name needs taxonomic resolution ICPN	unresolved
#	Lupinus sparsiflorus var. inopinatus	Unresolved	EXCLUDED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA, accepted name needs taxonomic resolution ICPN	unresolved
#	Lupinus sparsiflorus var. sparsiflorus	NONE	NATURALIZED, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#	Lupinus succulentus var. layneae	Unresolved	EXCLUDED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA, accepted name needs taxonomic resolution ICPN	unresolved
#	Malva rotundifolia	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	2b, unpublished, invalidly published, illegitimate, or rejected name for taxon naturalized in CA
#	Marsdenia carterae	NULL (EXCLUDED SYNONYM in ICPN without entry in Current Name)	EXCLUDED NOT IN CALIFORNIA, SYNONYM	8a, taxonomic or nomenclatural synonym for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
#	Mentzelia arenaria	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Mentzelia deserticola	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Microsteris gracilis subsp. humilior	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Monardella diaboli	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Nama arizonica	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Packera buekii	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Pentagramma triangularis subsp. semipallida	Pentagramma triangularis subsp. triangularis.	EXCLUDED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA, accepted name needs taxonomic resolution ICPN	unresolved
#	Phacelia cicutaria var. heliophila	Unresolved [probably Phacelia vallis-mortae J. W. Voss or Phacelia vallis-mortae J. W. Voss var. heliophila (J. F. Macbr.) J. W. Voss]	NATURALIZED, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#	Phacelia heterosepala	Unresolved [possibly Phacelia cicutaria Greene or Phacelia cicutaria Greene var. heterosepala (Greene) J. T. Howell or Phacelia hispida (A. Gray) A. Gray var. heterosepala (Greene) J. W. Voss or Phacelia hispida (A. Gray) A. Gray subvar. heterosepala (Greene) Brand.]	NATURALIZED, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#	Phlox rhizomata	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Pseudognaphalium viscosum	NULL (EXCLUDED SYNONYM in ICPN without entry in Current Name)	EXCLUDED NOT IN CALIFORNIA, SYNONYM	8a, taxonomic or nomenclatural synonym for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
#	Quercus dunnii	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Ranunculus californicus var. gratus	Ranunculus californicus var. californicus.	NATURALIZED, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#	Salvia X palmeri	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Sarracenia rubra	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	2b, unpublished, invalidly published, illegitimate, or rejected name for taxon naturalized in CA
#	Selaginella arizonica subsp. eremophila	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Setaria gracilis	NONE	NATURALIZED, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#	Solanum nitidibaccatum	NONE	NATURALIZED, SYNONYM ICPN	2a, taxonomic or nomenclatural synonym for taxon naturalized in CA
#	Syrmatium niveum	Unresolved	NATURALIZED, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#	Trifolium albopurpureum subsp. columbinum	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Trifolium variegatum var. pusillum	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#	Trifolium variegatum var. subsalinum	NONE	EXCLUDED NATURALIZED, REJECTED NAME ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA



#these names are unresolved names that have problematic current name line that contradicts the accept name in EFLORA


#Achnatherum eminens
			if (($name =~ m/^Achnatherum eminens$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Stipa eminens";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}

#Abies concolor var. concolor	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Abies concolor var. concolor$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Abies concolor";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
				$status_exception = "Current Name changed from unresolved to eFlora terminal taxon";
			}
#Abies concolor var. lowiana	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Abies concolor var. lowiana$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Abies concolor";
				$status_exception = "Current Name changed from unresolved to eFlora terminal taxon";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Abies lowiana	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Abies lowiana$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Abies concolor";
				$status_exception = "Current Name changed from unresolved to eFlora terminal taxon";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Achnatherum &times;bloomeri	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Achnatherum &times;bloomeri$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Stipa &times;bloomeri";
				$status_exception = "Current Name changed from unresolved to eFlora terminal taxon";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Acrachne racemosa	NONE NEED FIX	UNRESOLVED, possibly NATURALIZED, persistence in CA unknown; ACCEPTED NAME UNRESOLVED in ICPN	unresolved (possibly naturalized)
			if (($name =~ m/^Acrachne racemosa$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Acrachne racemosa";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}

#Acrolasia micrantha var. stricta
			if (($name =~ m/^Acrolasia micrantha var\. stricta$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Mentzelia micrantha";
				$status_exception = "Current Name changed from unresolved to eFlora terminal taxon";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
			if (($name =~ m/^Acrolasia micrantha var\. micrantha$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Mentzelia micrantha";
				$status_exception = "Current Name changed from unresolved to eFlora terminal taxon";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Acrolasia tridentata	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Acrolasia tridentata$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Mentzelia tridentata";
				$status_exception = "Current Name changed from unresolved to eFlora terminal taxon";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Aegopogon cenchroides
			if (($name =~ m/^Aegopogon cenchroides$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Aegopogon cenchroides";
				$status_exception = "Current Name changed from unresolved to itself";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Agropogon littoralis	NONE NEED FIX	STERILE HYBRID (non-hybrid form of name); UNPUBLISHED, INVALID, ILLEGITIMATE, or REJECTED in ICPN; not in eFlora	11bb, unpublished, invalidly published, illegitimate, or rejected name for taxonomically not recognized and/or sterile hybrid (hybrid form of name)
			if (($name =~ m/^Agropogon littoralis$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "&times;Agropogon littoralis";
				$status_exception = "Current Name changed from unresolved to eFlora terminal taxon";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}

#Agropyron saxicola	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Agropyron saxicola$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Elymus &times;saxicola";
				$status_exception = "Current Name changed from unresolved to the accepted name discussed in eFlora in comments";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Elymus &times;saxicola
			if (($name =~ m/^Elymus &times;saxicola$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Elymus &times;saxicola";
				$status_exception = "Current Name changed from unresolved to itself";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Agropyron saundersii	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Agropyron saundersii$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Elymus &times;saundersii";
				$status_exception = "Current Name changed from unresolved to the accepted name discussed in eFlora in comments";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Agrositanion saundersii	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Agrositanion saundersii$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Elymus &times;saxicola";
				$status_exception = "Current Name changed from unresolved to the accepted name discussed in eFlora in comments";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Elymus &times;saundersii
			if (($name =~ m/^Elymus &times;saundersii$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Elymus &times;saundersii";
				$status_exception = "Current Status 'unresolved' in ICPN and missing Current Name line";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}

#Agropyron fragile	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Agropyron fragile$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Agropyron fragile";
				$status_exception = "Current Name changed from unresolved to itself";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Agrostis perennans	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Agrostis perennans$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Agrostis perennans";
				$status_exception = "Current Name changed from unresolved to the accepted name discussed in eFlora in comments";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Aira caryophyllea var. cupaniana	NONE	EXTIRPATED, SYNONYM ICPN	6a, taxonomic or nomenclatural synonym for taxon extirpated in CA
			if (($name =~ m/^Aira caryophyllea var\. cupaniana$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Aira cupaniana";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Allium cepa var\. cepa
			if (($name =~ m/^Allium cepa var\. cepa$/)  && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/)){#fix a problem name that does not yet have an valid current name line
				$full_accepted_NOAUTH = "Allium cepa";
				$genus = "Allium";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Allolepis texana	NONE NEED FIX	UNRESOLVED, possibly NATURALIZED, persistence in CA unknown; ACCEPTED NAME UNRESOLVED in ICPN	unresolved (possibly naturalized)
			if (($name =~ m/^Allolepis texana$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Allolepis texana";
				$status_exception = "Current Name changed from unresolved to itself";
				$status = "unresolved (possibly naturalized) taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Alyssum desertorum var. himalayensis
			if (($name =~ m/^Alyssum desertorum var. himalayensis$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Alyssum desertorum";
				$status_exception = "Current Name changed from unresolved to the terminal taxon in the eFlora; spelling in TROPICOS is now 'himalayense'";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Alyssum desertorum var. desertorum
			if (($name =~ m/^Alyssum desertorum var. desertorum$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Alyssum desertorum";
				$status_exception = "Current Name changed from unresolved to the terminal taxon in the eFlora";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Amaranthus gracilis	NONE NEED FIX	ICPN_SYNS==>UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN
#Amaranthus viridis
			if (($name =~ m/^Amaranthus gracilis$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Amaranthus viridis";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Ambrosia bipinnatifida	NONE NEED FIX	ICPN_SYNS==>UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN
#Ambrosia camphorata
			if (($name =~ m/^Ambrosia bipinnatifida$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Ambrosia camphorata";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}

#	Amelanchier utahensis subsp. utahensis	Unresolved	NATURALIZED, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Amelanchier utahensis subsp\. utahensis$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Amelanchier utahensis";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#	Amelanchier utahensis subsp. covillei	Unresolved	NATURALIZED, SYNONYM ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Amelanchier utahensis subsp\. covillei$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Amelanchier utahensis";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Ammophila breviligulata	NONE NEED FIX	ICPN_SYNS==>UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN
#Calamagrostis breviligulata
			if (($name =~ m/^Ammophila breviligulata$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Ammophila breviligulata";
				$status_short = "unresolved";
				$status = "unresolved ICPN or EFLORA name";
			}
#Apium graveolens var. dulce	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Apium graveolens var\. dulce$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Apium graveolens";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Arctostaphylos patula var. incarnata	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Arctostaphylos patula var\. incarnata$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Arctostaphylos patula";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Argyrochosma limitanea var\. limitanea
			if (($name =~ m/^Argyrochosma limitanea var\. limitanea$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Argyrochosma limitanea subsp. limitanea";
				$status_exception = "Current Status 'unresolved' in ICPN and missing Current Name line, but the comments state that Argyrochosma limitanea is the accepted name in ICPN, Argyrochosma limitanea subsp. limitanea is the terminal taxon in EFLORA";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Arnica cordifolia var. pumila	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Arnica cordifolia var\. pumila$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Arnica cordifolia";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Arnica cordifolia var. cordifolia	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Arnica cordifolia var\. cordifolia$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Arnica cordifolia";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Arnica chamissonis var. andina	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Arnica chamissonis var\. andina$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Arnica chamissonis";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}

#Aster laevis	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Aster laevis$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Symphyotrichum laeve";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA";
			}
#Symphyotrichum laeve is in ICPN, so the current name line for Aster laevis should be this

#Astragalus gambelianus var. elmeri	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Astragalus gambelianus var\. elmeri$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Astragalus gambelianus";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA";
			}
#Astragalus gambelianus var. gambelianus	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Astragalus gambelianus var\. gambelianus$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Astragalus gambelianus";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA";
			}
#Atriplex canescens var. angustifolia	NONE NEED FIX	ICPN_SYNS==>UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN
#Atriplex canescens var. canescens
			if (($name =~ m/^Atriplex canescens var\. angustifolia$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Atriplex canescens var. canescens";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Atriplex lentiformis subsp. breweri	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Atriplex lentiformis subsp\. breweri$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Atriplex lentiformis";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA";
			}
#Atriplex lentiformis subsp. lentiformis	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Atriplex lentiformis subsp\. lentiformis$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Atriplex lentiformis";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Atriplex breweri	Atriplex lentiformis subsp. lentiformis	NATIVE, SYNONYM ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
			if (($name =~ m/^Atriplex breweri$/) && ($full_accepted_NOAUTH =~ m/Atriplex lentiformis subsp/)){
				$full_accepted_NOAUTH = "Atriplex lentiformis";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Audibertia stachyoides var. revoluta	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Audibertia stachyoides var\. revoluta$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Salvia mellifera";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Axonopus affinis	NONE NEED FIX	ICPN_SYNS==>UNRESOLVED, possibly NATURALIZED, persistence in CA unknown; ACCEPTED NAME UNRESOLVED in ICPN
#Axonopus fissifolius	NONE NEED FIX	ICPN_SYNS==>UNRESOLVED, possibly NATURALIZED, persistence in CA unknown; ACCEPTED NAME UNRESOLVED in ICPN
			if (($name =~ m/^Axonopus affinis$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Axonopus fissifolius";
				$status_short = "unresolved";
				$status = "possibly NATURALIZED, persistence in CA unknown; unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
			if (($name =~ m/^Axonopus fissifolius$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Axonopus fissifolius";
				$status_short = "unresolved";
				$status = "possibly NATURALIZED, persistence in CA unknown; unresolved ICPN or EFLORA accepted name";
			}
#Balsamorhiza &times;terebinthacea	NONE NEED FIX	ICPN_SYNS==>UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN
			if (($name =~ m/^Balsamorhiza &times;terebinthacea$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Balsamorhiza &times;terebinthacea";
				$status_short = "unresolved";
				$status = "unresolved hybrid ICPN or EFLORA name";
			}

#Balsamorhiza hookeri var. lagocephala	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Balsamorhiza hookeri var\. lagocephala$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Balsamorhiza hookeri";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Beckwithia austiniae	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Beckwithia austiniae$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Ranunculus andersonii";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Bidens bigelovii	NONE NEED FIX	ICPN_SYNS==>UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN
			if (($name =~ m/^Bidens bigelovii$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Bidens bigelovii";
				$status_short = "unresolved";
				$status = "unresolved ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA";
			}
#Bidens bipinnata	NONE NEED FIX	ICPN_SYNS==>UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN
			if (($name =~ m/^Bidens bipinnata$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Bidens bipinnata";
				$status_short = "unresolved";
				$status = "unresolved ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA";
			}
#Boisduvalia densiflora var. montana
#Boisduvalia densiflora var. montana	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Boisduvalia densiflora var\. montana$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Epilobium densiflorum";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Bothriochloa exaristata	NONE NEED FIX	ICPN_SYNS==>UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN
			if (($name =~ m/^Bothriochloa exaristata$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Bothriochloa exaristata";
				$status_short = "unresolved";
				$status = "unresolved ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA";
			}
#Bouteloua curtipendula var. caespitosa	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Bouteloua curtipendula var\. caespitosa$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Bouteloua curtipendula";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Bouteloua curtipendula var. curtipendula	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Bouteloua curtipendula var\. curtipendula$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Bouteloua curtipendula";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Brachypodium phoenicoides	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Brachypodium phoenicoides$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Brachypodium phoenicoides";
				$status_short = "unresolved";
				$status = "possibly NATURALIZED, persistence in CA unknown; unresolved ICPN or EFLORA accepted name";
			}
#Brickellia californica var. jepsonii	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Brickellia californica var\. jepsonii$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Brickellia californica";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Brickellia californica var. californica	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Brickellia californica var\. californica$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Brickellia californica";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Bromus hordeaceus subsp. divaricatus	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Bromus hordeaceus subsp\. divaricatus$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Bromus hordeaceus";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Cactus radiosus	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Cactus radiosus$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Coryphantha vivipara";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Calochortus albus	Calochortus albus	NATIVE; ACCEPTED in ICPN	1, accepted name for taxon native to CA
#Calochortus albus var. albus	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Calochortus albus var\. albus$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Calochortus albus";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Calochortus albus var. rubellus	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Calochortus albus var\. rubellus$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Calochortus albus";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Calochortus clavatus var\. arcuatus
			if (($name =~ m/^Calochortus clavatus var\. arcuatus$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Calochortus clavatus var. gracilis";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Consolida ambigua	NULL (EXCLUDED SYNONYM in ICPN without entry in Current Name)	EXCLUDED NOT IN CALIFORNIA, SYNONYM	8a, taxonomic or nomenclatural synonym for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
			if (($name =~ m/^Consolida ambigua$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Delphinium ambiguum";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Citrullus colocynthis var\. lanatus
			if (($name =~ m/^Citrullus colocynthis var\. lanatus$/) && ($full_accepted_NOAUTH =~ m/^Citrullus lanatus/i)){
				$full_accepted_NOAUTH = "Citrullus lanatus var. citroides";
				$status_exception = "Current Name stated as Citrullus lanatus var. lanatus, but this name is included in the EFLORA as a synonym of Citrullus lanatus var. citroides";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Cryptantha racemosa var. lignosa	Cryptantha racemosa	ICPN_SYNS==>NATIVE; possible new synonym for already accepted taxon, SYNONYM TENTATIVE in ICPN
			if (($name =~ m/^Cryptantha racemosa var\. lignosa$/) && ($full_accepted_NOAUTH =~ m/^Cryptantha racemosa/i)){
				$full_accepted_NOAUTH = "Johnstonella racemosa";
				$status_exception = "Current Name stated as Cryptantha racemosa, but this name is included in the EFLORA as a synonym of Johnstonella racemosa";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}



#START
#Dudleya goldmanii	Dudleya cymosa subsp. pumila	EFLORA==>EFLORA synonym
#Dudleya goldmanii	Dudleya lanceolata	ICPN_SYNS==>NATIVE; possible new synonym for already accepted taxon, SYNONYM TENTATIVE in ICPN
			if (($name =~ m/^#Dudleya goldmanii$/) && ($full_accepted_NOAUTH =~ m/^Dudleya lanceolata/i)){
				$full_accepted_NOAUTH = "Dudleya cymosa subsp. pumila";
				$status_exception = "Current Name stated as Dudleya lanceolata, but this name is included in the EFLORA as a synonym of Dudleya cymosa subsp. pumila";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Elymus &times;hansenii	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Elymus &times;hansenii$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Elymus &times;hansenii";
				$status_exception = "Current Name changed from unresolved to itself";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Sitanion hansenii
			if (($name =~ m/^Sitanion hansenii$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Elymus &times;hansenii";
				$status_exception = "Current Status 'unresolved' in ICPN and missing Current Name line";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Festuca howellii
			if (($name =~ m/^Festuca howellii$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Festuca elmeri";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Fraxinus trifoliata
			if (($name =~ m/^Fraxinus trifoliata$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Fraxinus parryi";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Gilia grinnellii
			if (($name =~ m/^Gilia grinnellii$/) && ($full_accepted_NOAUTH =~ m/^Gilia cana/i)){
				$full_accepted_NOAUTH = "Gilia cana subsp. cana";
				$status_exception = "Current Status 'unresolved' in ICPN and Current Name conflicts with EFLORA, Gilia cana is not a terminal taxon in the EFLORA and cannot be the accepted name in ICPN";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}

#varieties of quadrinomial names that now have an accepted name in eFlora but an accepted name lines are "unresolved"
#.Heterotheca sessiliflora (Nutt.) Shinners var. bolanderioides Semple
			if (($name =~ m/^Heterotheca sessiliflora var\. bolanderioides$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Heterotheca sessiliflora subsp. echioides";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#.Heterotheca sessiliflora (Nutt.) Shinners var. camphorata (Eastw.) Semple
			if (($name =~ m/^Heterotheca sessiliflora var\. camphorata$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Heterotheca sessiliflora subsp. echioides";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#.Heterotheca sessiliflora (Nutt.) Shinners var. sanjacintensis Semple
			if (($name =~ m/^Heterotheca sessiliflora var\. sanjacintensis$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Heterotheca sessiliflora subsp. fastigiata";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Juncus balticus var. eremicus	Juncus balticus	NATIVE; possible new synonym for already accepted taxon, SYNONYM TENTATIVE in ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#the current name is not the terminal taxon in the eFlora
			if (($name =~ m/^Juncus balticus var\. eremicus$/) && ($full_accepted_NOAUTH =~ m/^Juncus balticus$/i)){
				$full_accepted_NOAUTH = "Juncus balticus subsp. ater";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Juncus balticus var. vallicola	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if (($name =~ m/^Juncus balticus var\. vallicola$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Juncus balticus subsp. ater";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Leptosiphon aureus
			if (($name =~ m/^Leptosiphon aureus \(Nu/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Leptosiphon chrysanthus";
				$genus = "Leptosiphon";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Listera cordata var\. cordata
			if (($name =~ m/^Listera cordata var\. cordata$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Listera cordata";
				$genus = "Listera";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Lupinus adsurgens var. lilacinus
			if ($name =~ m/^(Lupinus adsurgens var\. lilacinus)$/){
				$full_accepted_NOAUTH = "Lupinus adsurgens";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
	#Lupinus adsurgens var. undulatus
			if ($name =~ m/^(Lupinus adsurgens var\. undulatus)$/){
				$full_accepted_NOAUTH = "Lupinus adsurgens";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#.Lupinus arizonicus (S. Watson) S. Watson var. barbatulus (Thornber ex C. P. Sm.) I. M. Johnst.
			if (($name =~ m/^Lupinus arizonicus var\. barbatulus$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Lupinus arizonicus";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Lupinus fulcratus var\. undulatus
			if ($name =~ m/^(Lupinus fulcratus var\. undulatus)$/){
				$full_accepted_NOAUTH = "Lupinus adsurgens";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Lupinus leucophyllus Douglas ex Lindl. var. leucophyllus
			if (($name =~ m/^Lupinus leucophyllus var\. leucophyllus$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Lupinus leucophyllus";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#.Lupinus lyallii A. Gray var. villosus Jeps.
			if (($name =~ m/^Lupinus lyallii var\. villosus$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Lupinus lepidus var. lobbii";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Lupinus sparsiflorus var\. sparsiflorus
			if (($name =~ m/^Lupinus sparsiflorus var\. sparsiflorus$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Lupinus sparsiflorus";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Malva assurgentiflora subsp. assurgentiflora
			if ($name =~ m/^(Malva assurgentiflora subsp\. assurgentiflora)$/){
				$full_accepted_NOAUTH = "Malva assurgentiflora";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Mimulus aurantiacus subsp. lompocensis	NONE	EXCLUDED, HYBRID SYNONYM, ICPN, not in eFlora	11c, taxonomic or nomenclatural synonym for taxonomically not recognized and/or sterile hybrid (non-hybrid form of name)
			if ($name =~ m/^Mimulus aurantiacus subsp\. lompocensis$/){
				$full_accepted_NOAUTH = "Diplacus &times;lompocensis";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Packera buekii
			if (($name =~ m/^Packera buekii$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Packera subnuda var. subnuda";
				$status_exception = "Current Status 'unresolved' in ICPN and missing Current Name line, but the comments state that Packera subnuda is the accepted name in ICPN, Packera subnuda var. subnuda is the terminal taxon in EFLORA";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Phacelia cicutaria var\. heliophila
			if (($name =~ m/^Phacelia cicutaria var\. heliophila$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Phacelia vallis-mortae";
				$genus = "Phacelia";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Phacelia douglasii (Benth.) Torr. var. douglasii
			if (($name =~ m/^Phacelia douglasii var\. douglasii$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Phacelia douglasii";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Pogogyne douglasii subsp\. minor
			if (($name =~ m/^Pogogyne douglasii subsp\. minor$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Pogogyne douglasii";
				$genus = "Pogogyne";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Orobanche ludoviciana var. cooperi
			if ($name =~ m/^(Orobanche ludoviciana var. cooperi)$/){
				$full_accepted_NOAUTH = "Aphyllon cooperi";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Orobanche ludoviciana	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if ($name =~ m/^(Orobanche ludoviciana)$/){
				$full_accepted_NOAUTH = "Aphyllon ludovicianum";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Orobanche ludoviciana var. arenosa	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
			if ($name =~ m/^(Orobanche ludoviciana var. arenosa)$/){
				$full_accepted_NOAUTH = "Aphyllon ludovicianum";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}
#Syrmatium niveum
			if (($name =~ m/^Syrmatium niveum$/) && ($full_accepted_NOAUTH =~ m/^(unresolved|NONE|NULL)/i)){
				$full_accepted_NOAUTH = "Acmispon argophyllus var. niveus";
				$genus = "Syrmatium";
				$status_short = "unresolved";
				$status = "unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
			}

#this taxon is mentioned in Current Names of records that are still CAT 8 accepted themselves, 
#i.e. Anagallis foemina Mill.

#all of the rest of the NONE NEED FIX names should have the accepted name equal to name
#fix the unresolved names by assigning them the name variable only of there is not Current Name line
#the subset of these that have conflicts are fixed in the section above
	if ($full_accepted_NOAUTH =~ m/^(NONE, NEED FIX|NULL| *)$/){
		$full_accepted_NOAUTH = $name;

		if ($status =~ m/^unresolved$/i){
			$status_short = "unresolved";
			$status = "unresolved ICPN accepted name or synonym; possibly NOT IN CALIFORNIA";
		}
		elsif ($status =~ m/^unresolved \(possibly naturalized\)$/i){
			$status_short = "unresolved (possibly naturalized)";
			$status = "unresolved ICPN accepted name or synonym (possibly naturalized); possibly NOT IN CALIFORNIA";
		}
	}


		if ($name =~ m/^([A-Z][a-z-]+) [a-z-]+ ?/){
			$genus = $1;
		}
		elsif ($name =~ m/^([A-Z][a-z-]+)$/){
			$genus = $1;
		}
		elsif ($name =~ m/^(&times;[A-Z][a-z-]+) [a-z-]+/){
			$genus = $1;
		}
		elsif ($name =~ m/^([A-Z][a-z-]+) &times; ?[a-z-]+/){
			$genus = $1;
		}
		elsif ($name =~ m/^([A-Z][a-z-]+[A-Z][a-z-]+) ?/){#Uva-Ursi pechoensis compensate for this odd variant genus
			$genus = $1;
		}
		else{
			print "MISSING (3) $genus==>name for GENUS:$name==>$_\n";
			#print "MISSING (3) $genus==>name for GENUS:$name\n";
			$genus = "";
		}


		if ($name =~ m/ subsp. /){
			$CCHrank = "Subspecies";
		}
		elsif ($name =~ m/ var. /){
			$CCHrank = "Variety";
		}
		elsif ($name =~ m/ nothosubsp. /){
			$genus = $CCHrank = "Nothosubspecies";
		}
		elsif ($name =~ m/( f. | subvar. )/){#skip formae and subvar, may skip some filial names at this point, but this is a nominal omission
			$accepted_NOAUTH = $taxauth_name = $genus = $CCHrank = "";
		}
		elsif ($name =~ m/^([A-Z][a-z-]+) [a-z-]+ .+$/){
			$CCHrank = "Species";
		}
		elsif ($name =~ m/^([A-Z][a-z-]+) [a-z-]+$/){
			$CCHrank = "Species";
		}
		elsif ($name =~ m/^([A-Z][a-z-]+) &times; ?[a-z-]+ .+$/){
			$CCHrank = "Species";
		}
		elsif ($name =~ m/^([A-Z][a-z-]+) &times; ?[a-z-]+$/){
			$CCHrank = "Species";
		}
		elsif ($name =~ m/^(&times;[A-Z][a-z-]+) [a-z-]+$/){
			$CCHrank = "Species";
		}
		elsif ($name =~ m/^(&times;[A-Z][a-z-]+) [a-z-]+ .+/){
			$CCHrank = "Species";
		}
		elsif ($name =~ m/^[A-Z][a-z-]+[A-Z][a-z-]+ [a-z-] ?.*/){
			$CCHrank = "Species";
		}
		else{
			print "PROBLEM RANK (2)==>$name\n";
			$accepted_NOAUTH = $taxauth_name = $genus = $CCHrank = "";
		}

				foreach ($taxauth_name){ #ICPN has some inconsistencies like authors on genus names and other notations that cause problems with strip name, fix these
					#these show up only as a warning in terminal
					s/, illeg\.?//; #delete illegitimate phrase entered into Synonym line
					s/, ined\.?//; #delete ined phrase entered into Synonym line
					s/, orth\.? var\.?//; #delete orthographic phrase entered into Synonym line
					s/, nom\.? nud\.?//; #delete nomen nudum phrase entered into Synonym line
					s/, of pre-2004 California authors, non / /;
					s/( of authors|auct\.? non )/ /;
					s/, pro sp\.?//;
					s/  +/ /;
					s/ +$//;
					s/^ +//;
				}

			print NAT $name."\t".$nativity."\n";

			print OUT2 $full_accepted_NOAUTH."\t".$family."\n";
			print AUTH $name."\t".$taxauth_name."\n";
				$full_accepted =~ s/^([A-Z][a-z-]+) ([-a-z]+) .* (nothosubsp.|subsp\.|var\.) ([-a-z]+.*)/$1 $2 $3 $4/;
				print ACC $family.",".$genus.",\"".$full_accepted."\",".$CCHrank.",Jepson eFlora-TJM2-ICPN\n";

my $accepted_NOAUTH = $full_accepted_NOAUTH;

				if($EF_ACC{$accepted_NOAUTH}){
					print CCH $TID{$accepted_NOAUTH}."\t".$name."\t/eflora/eflora_display.php?tid=".$TID{$accepted_NOAUTH}."\n";
				}

			if ($accepted_NOAUTH =~ m/^$name$/){
				$CCHrank = $genus = $taxauth_name = $accepted_NOAUTH = "";
			}
			elsif ($accepted_NOAUTH =~ m/^NULL|NONE|uncertain|unresolve/){
				$CCHrank = $genus = $taxauth_name = $accepted_NOAUTH = "";
			}
			elsif ($accepted_NOAUTH =~ m/^$/){
				$CCHrank = $genus = $taxauth_name = $accepted_NOAUTH = "";
			}
			else{
			
				$taxauth_name =~ s/^([A-Z][a-z-]+) ([-a-z]+) .* (nothosubsp.|subsp\.|var\.) ([-a-z]+.*)/$1 $2 $3 $4/;
			
				print SYN $family."\t".$genus."\t".$taxauth_name."\t".$CCHrank."\t".$accepted_NOAUTH."\tJepson eFlora-TJM2-ICPN\n";
				print SYNADD $family.",".$genus.",\"".$taxauth_name."\",".$CCHrank.",".$accepted_NOAUTH.",Jepson eFlora-TJM2\n";
			}

		if ($status =~ m/^(uncertain|unresolved)$/i){
			print UNC "$name\t$full_accepted_NOAUTH\t$status_short\t$status\n";
			print OUT4 "$name\t$full_accepted_NOAUTH\t$status_short\t$status\n";
			print OUT "$name\t$full_accepted_NOAUTH\n";
			print OUT3 $TID{$name}."\t".$name."\t".$full_accepted_NOAUTH."\t".$status_short."\t".$status."\n";
			print EXC $name."\t".$status_exception."\n";
		}	  
		else{  
			  print OUT4 "$name\t$full_accepted_NOAUTH\t$status_short\t$status\n";
			  print OUT "$name\t$full_accepted_NOAUTH\n";
			  print OUT3 $TID{$name}."\t".$name."\t".$full_accepted_NOAUTH."\t".$status_short."\t".$status."\n";
			  print EXC $name."\t".$status_exception."\n";
		}

		if ($full_accepted =~ m/^(NONE|NULL| *)$/i){
			print PROB "NO_ACCEPTED_NAME\t$name\t$full_accepted\t$status_short\t$status\n";
		}


	#you dont want the status for the accepted name, you want the status for the name itself
	#the following is an error
	#print OUT3 $TID{$full_accepted_NOAUTH}."\t".$name."\t".$full_accepted_NOAUTH."\t".$status_short."\t".$status."\n";

 }
 else {
#print "$name==>problem name\n";
#print "$status\n\n";
 }


my $url = "https://ucjeps.berkeley.edu/eflora/eflora_display.php?name=";

my $efname = $EF_ACC{$name};
	foreach ($name){
		next if $full_accepted_NOAUTH =~ m/^NONE/;
			unless ($seenEF{$name}){
				if ($EF_ACC{$full_accepted_NOAUTH}){
					$full_accepted_NOAUTH =~ s/ (var\.|subsp\.) /+/;
					$full_accepted_NOAUTH =~ s/ /+/;
			
					print OUT7 $name."\t".$url.$full_accepted_NOAUTH."\n";
				}
			}
	}


}

#addendum to ICPN - not in ICPN
##Achnatherum &times;bloomeri	Stipa &times;bloomeri	unresolved	unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name
##Achnatherum bloomeri
#				print OUT "Achnatherum bloomeri\tStipa &times;bloomeri\n";
#				print OUT4 "Achnatherum bloomeri\tStipa &times;bloomeri\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Stiporyzopsis bloomeri
#				print OUT "Stiporyzopsis bloomeri\tStipa &times;bloomeri\n";
#				print OUT4 "Stiporyzopsis bloomeri\tStipa &times;bloomeri\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##&times;Stiporyzopsis bloomeri
#				print OUT "&times;Stiporyzopsis bloomeri\tStipa &times;bloomeri\n";
#				print OUT4 "&times;Stiporyzopsis bloomeri\tStipa &times;bloomeri\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Stipa bloomeri	
#				print OUT "Stipa bloomeri\tStipa &times;bloomeri\n";
#				print OUT4 "Stipa bloomeri\tStipa &times;bloomeri\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Acrachne racemosa	NONE NEED FIX	UNRESOLVED, possibly NATURALIZED, persistence in CA unknown; ACCEPTED NAME UNRESOLVED in ICPN	unresolved (possibly naturalized)
##Eleusine racemosa
#				print OUT "Eleusine racemosa\tAcrachne racemosa\n";
#				print OUT4 "Eleusine racemosa\tAcrachne racemosa\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Agropyron fragile	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
##Agropyron fragile var. fragile
#				print OUT "Agropyron fragile var. fragile\tAgropyron fragile\n";
#				print OUT4 "Agropyron fragile var. fragile\tAgropyron fragile\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Agropyron fragile var. sibiricum (Willd.) Tzvelev
#				print OUT "Agropyron fragile var. sibiricum\tAgropyron fragile\n";
#				print OUT4 "Agropyron fragile var. sibiricum\tAgropyron fragile\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Agropyron fragile subsp. sibiricum (Willd.) Tzvelev
#				print OUT "Agropyron fragile subsp. sibiricum\tAgropyron fragile\n";
#				print OUT4 "Agropyron fragile subsp. sibiricum\tAgropyron fragile\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Agropyron sibiricum (Willd.) P.Beauv.
#				print OUT "Agropyron sibiricum\tAgropyron fragile\n";
#				print OUT4 "Agropyron sibiricum\tAgropyron fragile\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Agropyron cristatum subsp. sibiricum (Willd.) Á.Löve
#				print OUT "Agropyron cristatum subsp. sibiricum\tAgropyron fragile\n";
#				print OUT4 "Agropyron cristatum subsp. sibiricum\tAgropyron fragile\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Agropyron cristatum var. sibiricum
#				print OUT "Agropyron cristatum var. sibiricum\tAgropyron fragile\n";
#				print OUT4 "Agropyron cristatum var. sibiricum\tAgropyron fragile\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Agropyron cristatum var. fragile (Roth) Dorn
#				print OUT "Agropyron cristatum var. fragile\tAgropyron fragile\n";
#				print OUT4 "Agropyron cristatum var. fragile\tAgropyron fragile\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Agropyron cristatum subsp. fragile
#				print OUT "Agropyron cristatum subsp. fragile\tAgropyron fragile\n";
#				print OUT4 "Agropyron cristatum subsp. fragile\tAgropyron fragile\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Triticum fragile Roth
#				print OUT "Triticum fragile\tAgropyron fragile\n";
#				print OUT4 "Triticum fragile\tAgropyron fragile\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Alyssum desertorum var. himalayense
#				print OUT "Alyssum desertorum var. himalayense\tAlyssum desertorum\n";
#				print OUT4 "Alyssum desertorum var. himalayense\tAlyssum desertorum\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Ambrosia camphorata
#				print OUT "Ambrosia camphorata\tAmbrosia camphorata\n";
#				print OUT4 "Ambrosia camphorata\tAmbrosia camphorata\tunresolved\tunresolved, name needs taxonomic resolution in ICPN, possibly NOT IN CALIFORNIA\n";
##Apium graveolens var. graveolens
#				print OUT "Apium graveolens var. graveolens\tApium graveolens\n";
#				print OUT4 "Apium graveolens var. graveolens\tApium graveolens\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Arnica chamissonis var. chamissonis
#				print OUT "Arnica chamissonis var. chamissonis\tArnica chamissonis\n";
#				print OUT4 "Arnica chamissonis var. chamissonis\tArnica chamissonis\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Arnica chamissonis subsp. chamissonis
#				print OUT "Arnica chamissonis subsp. chamissonis\tArnica chamissonis\n";
#				print OUT4 "Arnica chamissonis subsp. chamissonis\tArnica chamissonis\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Atriplex lentiformis var. breweri
#				print OUT "Atriplex lentiformis var. breweri\tAtriplex lentiformis\n";
#				print OUT4 "Atriplex lentiformis var. breweri\tAtriplex lentiformis\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Audibertia stachyoides
#				print OUT "Audibertia stachyoides\tSalvia mellifera\n";
#				print OUT4 "Audibertia stachyoides\tSalvia mellifera\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Audibertia stachyoides var. stachyoides
#				print OUT "Audibertia stachyoides var. stachyoides\tSalvia mellifera\n";
#				print OUT4 "Audibertia stachyoides var. stachyoides\tSalvia mellifera\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Salvia mellifera var. revoluta
#				print OUT "Salvia mellifera var. revoluta\tSalvia mellifera\n";
#				print OUT4 "Salvia mellifera var. revoluta\tSalvia mellifera\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Salvia mellifera var. mellifera
#				print OUT "Salvia mellifera var. mellifera\tSalvia mellifera\n";
#				print OUT4 "Salvia mellifera var. mellifera\tSalvia mellifera\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Salvia mellifera subsp. revoluta
#				print OUT "Salvia mellifera subsp. revoluta\tSalvia mellifera\n";
#				print OUT4 "Salvia mellifera subsp. revoluta\tSalvia mellifera\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Salvia mellifera subsp. mellifera
#				print OUT "Salvia mellifera subsp. mellifera\tSalvia mellifera\n";
#				print OUT4 "Salvia mellifera subsp. mellifera\tSalvia mellifera\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Balsamorhiza hookeri var. incana
#				print OUT "Balsamorhiza hookeri var. incana\tBalsamorhiza incana\n";
#				print OUT4 "Balsamorhiza hookeri var. incana\tBalsamorhiza incana\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA\n";
##Balsamorhiza hookeri var. hookeri
#				print OUT "Balsamorhiza hookeri var. hookeri\tBalsamorhiza hookeri\n";
#				print OUT4 "Balsamorhiza hookeri var. hookeri\tBalsamorhiza hookeri\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Boisduvalia densiflora var. densiflora
#				print OUT "Boisduvalia densiflora var. densiflora\tEpilobium densiflorum\n";
#				print OUT4 "Boisduvalia densiflora var. densiflora\tEpilobium densiflorum\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Boisduvalia densiflora
#				print OUT "Boisduvalia densiflora\tEpilobium densiflorum\n";
#				print OUT4 "Boisduvalia densiflora\tEpilobium densiflorum\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Boisduvalia glabella	Epilobium campestre	EFLORA==>EFLORA synonym
##Boisduvalia glabella var. campestris	Epilobium campestre	CCH synonym
#				print OUT "Boisduvalia glabella var. glabella\tEpilobium campestre\n";
#				print OUT4 "Boisduvalia glabella var. glabella\tEpilobium campestre\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Bolboschoenus maritimus var. maritimus
#				print OUT "Bolboschoenus maritimus var. maritimus\tBolboschoenus maritimus subsp. maritimus\n";
#				print OUT4 "Bolboschoenus maritimus var. maritimus\tBolboschoenus maritimus subsp. maritimus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA\n";
##Bolboschoenus maritimus subsp. maritimus
#				print OUT "Bolboschoenus maritimus subsp. maritimus\tBolboschoenus maritimus subsp. maritimus\n";
#				print OUT4 "Bolboschoenus maritimus subsp. maritimus\tBolboschoenus maritimus subsp. maritimus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA\n";
##Bothriochloa ischaemum var. songarica	Bothriochloa ischaemum	NATURALIZED; SYNONYM in ICPN	2a, taxonomic or nomenclatural synonym for taxon naturalized in CA
#				print OUT "Bothriochloa ischaemum var. ischaemum\tBothriochloa ischaemum\n";
#				print OUT4 "Bothriochloa ischaemum var. ischaemum\tBothriochloa ischaemum\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Bothriochloa laguroides subsp. torreyana	Bothriochloa laguroides subsp. torreyana	NATURALIZED; ACCEPTED in ICPN	2, accepted name for taxon naturalized in CA
##Bothriochloa laguroides var. laguroides
#				print OUT "Bothriochloa laguroides var. laguroides\tBothriochloa laguroides subsp. laguroides\n";
#				print OUT4 "Bothriochloa laguroides var. laguroides\tBothriochloa laguroides subsp. laguroides\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA\n";
##Bothriochloa laguroides subsp. laguroides
#				print OUT "Bothriochloa laguroides subsp. laguroides\tBothriochloa laguroides subsp. laguroides\n";
#				print OUT4 "Bothriochloa laguroides subsp. laguroides\tBothriochloa laguroides subsp. laguroides\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA\n";
##Bothriochloa laguroides var. torreyana
#				print OUT "Bothriochloa laguroides var. torreyana\tBothriochloa laguroides subsp. torreyana\n";
#				print OUT4 "Bothriochloa laguroides var. torreyana\tBothriochloa laguroides subsp. torreyana\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Bothriochloa saccharoides var. saccharoides
#				print OUT "Bothriochloa saccharoides var. saccharoides\tBothriochloa saccharoides\n";
#				print OUT4 "Bothriochloa saccharoides var. saccharoides\tBothriochloa saccharoidese\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA\n";
##Botrychium boreale
#				print OUT "Botrychium boreale\tBotrychium boreale\n";
#				print OUT4 "Botrychium boreale\tBotrychium boreale\tunresolved\tunresolved ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA\n";
#				print OUT "Botrychium boreale subsp. boreale\tBotrychium boreale\n";
#				print OUT4 "Botrychium boreale subsp. boreale\tBotrychium boreale\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA\n";
#				print OUT "Botrychium boreale var. boreale\tBotrychium boreale\n";
#				print OUT4 "Botrychium boreale var. boreale\tBotrychium boreale\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA\n";
##Botrychium multifidum subsp. silaifolium	Sceptridium multifidum	EFLORA==>EFLORA synonym
#				print OUT "Botrychium multifidum subsp. multifidum\tSceptridium multifidum\n";
#				print OUT4 "Botrychium multifidum subsp. multifidum\tSceptridium multifidum\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Botrychium lunaria	Botrychium lunaria	ICPN_SYNS==>NATIVE; ACCEPTED in ICPN
#				print OUT "Botrychium lunaria var. lunaria\tBotrychium lunaria\n";
#				print OUT4 "Botrychium lunaria var. lunaria\tBotrychium lunaria\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Botrychium multifidum var. silaifolium	Sceptridium multifidum	CCH synonym
#				print OUT "Botrychium multifidum var. multifidum\tSceptridium multifidum\n";
#				print OUT4 "Botrychium multifidum var. multifidum\tSceptridium multifidum\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Boykinia elata	Boykinia occidentalis	EFLORA==>EFLORA synonym
#				print OUT "Boykinia elata var. elata\tBoykinia occidentalis\n";
#				print OUT4 "Boykinia elata var. elata\tBoykinia occidentalis\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Boussingaultia gracilis var. pseudobaselloides	Anredera cordifolia	EFLORA==>EFLORA synonym
#				print OUT "Boussingaultia gracilis var. gracilis\tAnredera cordifolia\n";
#				print OUT4 "Boussingaultia gracilis var. gracilis\tAnredera cordifolia\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Brachyactis ciliata var. carnosula	Symphyotrichum frondosum	ICPN_SYNS==>NATIVE; possible new synonym for already accepted taxon, SYNONYM TENTATIVE in ICPN
#				print OUT "Brachyactis ciliata\tSymphyotrichum ciliatum\n";
#				print OUT4 "Brachyactis ciliata\tSymphyotrichum ciliatum\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA\n";
#				print OUT "Brachyactis ciliata var. ciliata\tSymphyotrichum ciliatum\n";
#				print OUT4 "Brachyactis ciliata var. ciliata\tSymphyotrichum ciliatum\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA\n";
#				print OUT "Symphyotrichum ciliatum\tSymphyotrichum ciliatum\n";
#				print OUT4 "Symphyotrichum ciliatum\tSymphyotrichum ciliatum\tunresolved\tunresolved ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA\n";
##Brachypodium phoenicoides	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
##Bromus phoenicoides
#				print OUT "Bromus phoenicoides\tBrachypodium phoenicoides\n";
#				print OUT4 "Bromus phoenicoides\tBrachypodium phoenicoides\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Festuca phoenicoides
#				print OUT "Festuca phoenicoides\tBrachypodium phoenicoides\n";
#				print OUT4 "Festuca phoenicoides\tBrachypodium phoenicoides\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Schedonorus phoenicoides
#				print OUT "Schedonorus phoenicoides\tBrachypodium phoenicoides\n";
#				print OUT4 "Schedonorus phoenicoides\tBrachypodium phoenicoides\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Brassica barrelieri subsp. tournefortii	Brassica tournefortii	CCH synonym
#				print OUT "Brassica barrelieri\tBrassica barrelieri\n";
#				print OUT4 "Brassica barrelieri\tBrassica barrelieri\tunresolved\tpossibly NATURALIZED, persistence in CA unknown; unresolved ICPN or EFLORA accepted name";
#				print OUT "Brassica barrelieri subsp. barrelieri\tBrassica barrelieri\n";
#				print OUT4 "Brassica barrelieri subsp. barrelieri\tBrassica barrelieri\tunresolved\tpossibly NATURALIZED, persistence in CA unknown; unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name";
##Brassica campestris var. campestris	Brassica rapa	CCH synonym
#				print OUT "Brassica campestris subsp. campestris\tBrassica rapa\n";
#				print OUT4 "Brassica campestris subsp. campestris\tBrassica rapa\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Brassica kaber	Sinapis arvensis	EFLORA==>EFLORA synonym unabridged
##Brassica kaber var. pinnatifida	Sinapis arvensis	NIEF TJM1993 synonym, ICPN or EFLORA accepted name
#				print OUT "Brassica kaber var. kaber\tSinapis arvensis\n";
#				print OUT4 "Brassica kaber var. kaber\tSinapis arvensis\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Brassica sativa
#				print OUT "Brassica sativa\tBrassica rapa\n";
#				print OUT4 "Brassica sativa\tBrassica rapa\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Brassica sativa var. sativa	Brassica rapa	CCH synonym
#				print OUT "Brassica sativa var. sativa\tBrassica rapa\n";
#				print OUT4 "Brassica sativa var. sativa\tBrassica rapa\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Brassica sativa subsp. sativa	Brassica rapa	CCH synonym
#				print OUT "Brassica sativa subsp. sativa\tBrassica rapa\n";
#				print OUT4 "Brassica sativa subsp. sativa\tBrassica rapa\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Brickellia microphylla subsp. microphylla	Brickellia microphylla var. microphylla	EFLORA==>EFLORA accepted
#				print OUT "Brickellia microphylla subsp. microphylla\tBrickellia microphylla var. microphylla\n";
#				print OUT4 "Brickellia microphylla subsp. microphylla\tBrickellia microphylla var. microphylla\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Brickellia oblongifolia	Brickellia oblongifolia	NATIVE; ACCEPTED in ICPN	1, accepted name for taxon native to CA
##Brickellia oblongifolia var. oblongifolia
#				print OUT "Brickellia oblongifolia var. oblongifolia\tBrickellia oblongifolia var. oblongifolia\n";
#				print OUT4 "Brickellia oblongifolia var. oblongifolia\tBrickellia oblongifolia var. oblongifolia\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA\n";
##Brickellia oblongifolia subsp. oblongifolia
#				print OUT "Brickellia oblongifolia subsp. oblongifolia\tBrickellia oblongifolia var. oblongifolia\n";
#				print OUT4 "Brickellia oblongifolia subsp. oblongifolia\tBrickellia oblongifolia var. oblongifolia\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA\n";
##Brickellia watsonii	Brickellia microphylla var. microphylla	ICPN_SYNS==>NATIVE; SYNONYM in ICPN
#				print OUT "Brickellia watsonii\tBrickellia microphylla var. microphylla\n";
#				print OUT4 "Brickellia watsonii\tBrickellia microphylla var. microphylla\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Brickellia wrightii var. tenera	Brickellia californica	EFLORA==>EFLORA synonym
#				print OUT "Brickellia wrightii var. tenera\tBrickellia californica\n";
#				print OUT4 "Brickellia wrightii var. tenera\tBrickellia californica\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
#				print OUT "Brickellia wrightii var. reniformis\tBrickellia californica\n";
#				print OUT4 "Brickellia wrightii var. reniformis\tBrickellia californica\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
#				print OUT "Brickellia wrightii var. wrightii\tBrickellia californica\n";
#				print OUT4 "Brickellia wrightii var. wrightii\tBrickellia californica\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
#				print OUT "Brickellia wrightii\tBrickellia californica\n";
#				print OUT4 "Brickellia wrightii\tBrickellia californica\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Brodiaea capitata var. insularis	Dipterostemon capitatus subsp. capitatus	EFLORA==>EFLORA synonym
##Brodiaea capitata var. capitata
#				print OUT "Brodiaea capitata var. capitata\tDipterostemon capitatus subsp. capitatus\n";
#				print OUT4 "Brodiaea capitata var. capitata\tDipterostemon capitatus subsp. capitatus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Brodiaea crocea var. modesta	Triteleia crocea	EFLORA==>EFLORA synonym
##Brodiaea crocea var. crocea
#				print OUT "Brodiaea crocea var. crocea\tTriteleia crocea\n";
#				print OUT4 "Brodiaea crocea var. crocea\tTriteleia crocea\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Brodiaea douglasii var. howellii	Triteleia grandiflora	EFLORA==>EFLORA synonym
##Brodiaea douglasii
##Brodiaea douglasii var. douglasii
#				print OUT "Brodiaea douglasii\tTriteleia grandiflora\n";
#				print OUT4 "Brodiaea douglasii\tTriteleia grandiflora\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
#				print OUT "Brodiaea douglasii var. douglasii\tTriteleia grandiflora\n";
#				print OUT4 "Brodiaea douglasii var. douglasii\tTriteleia grandiflora\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Brodiaea filifolia	Brodiaea filifolia	ICPN_SYNS==>NATIVE; ACCEPTED in ICPN
##Brodiaea filifolia var. orcuttii	Brodiaea orcuttii	EFLORA==>EFLORA synonym
#				print OUT "Brodiaea filifolia var. filifolia\tBrodiaea filifolia\n";
#				print OUT4 "Brodiaea filifolia var. filifolia\tBrodiaea filifolia\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
#				#Brodiaea elegans subsp. elegans	Brodiaea elegans subsp. elegans	NATIVE; ACCEPTED in ICPN	1, accepted name for taxon native to CA
##Brodiaea elegans var. elegans
#				print OUT "Brodiaea elegans var. elegans\tBrodiaea elegans subsp. elegans\n";
#				print OUT4 "Brodiaea elegans var. elegans\tBrodiaea elegans subsp. elegans\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Brodiaea grandiflora	Triteleia grandiflora	EFLORA==>EFLORA synonym, illeg.
##Brodiaea grandiflora var. brachypoda	Dichelostemma multiflorum	EFLORA==>EFLORA synonym
#				print OUT "Brodiaea grandiflora var. grandiflora\tTriteleia grandiflora\n";
#				print OUT4 "Brodiaea grandiflora var. grandiflora\tTriteleia grandiflora\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Brodiaea hyacinthina	Triteleia hyacinthina	EFLORA==>EFLORA synonym
##Brodiaea hyacinthina var. lactea	Triteleia hyacinthina	EFLORA==>EFLORA synonym
#				print OUT "Brodiaea hyacinthina var. hyacinthina\tTriteleia hyacinthina\n";
#				print OUT4 "Brodiaea hyacinthina var. hyacinthina\tTriteleia hyacinthina\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Brodiaea ixioides	Triteleia ixioides	CCH synonym
##Brodiaea ixioides var. scabra	Triteleia ixioides subsp. scabra	EFLORA==>EFLORA synonym
#				print OUT "Brodiaea ixioides var. ixioides\tTriteleia ixioides subsp. ixioides\n";
#				print OUT4 "Brodiaea ixioides var. ixioides\tTriteleia ixioides subsp. ixioides\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Brodiaea lactea var. lilacina	Triteleia hyacinthina	EFLORA==>EFLORA synonym
#				print OUT "Brodiaea lactea var. lactea\tTriteleia hyacinthina\n";
#				print OUT4 "Brodiaea lactea var. lactea\tTriteleia hyacinthina\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Brodiaea laxa	Triteleia laxa	EFLORA==>EFLORA synonym
##Brodiaea laxa var. candida	Triteleia laxa	EFLORA==>EFLORA synonym
#				print OUT "Brodiaea laxa var. laxa\tTriteleia laxa\n";
#				print OUT4 "Brodiaea laxa var. laxa\tTriteleia laxa\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Brodiaea lutea	Triteleia ixioides subsp. ixioides	EFLORA==>EFLORA synonym
#				print OUT "Brodiaea lutea var. lutea\tTriteleia ixioides subsp. ixioides\n";
#				print OUT4 "Brodiaea lutea var. lutea\tTriteleia ixioides subsp. ixioides\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Brodiaea minor	Brodiaea minor	ICPN_SYNS==>NATIVE; ACCEPTED in ICPN
##Brodiaea minor var. nana	Brodiaea nana	CCH synonym
#				print OUT "Brodiaea minor var. minor\tBrodiaea minor\n";
#				print OUT4 "Brodiaea minor var. minor\tBrodiaea minor\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Brodiaea pulchella	Dipterostemon capitatus	EFLORA==>EFLORA synonym
##Brodiaea pulchella var. pauciflora	Dipterostemon capitatus subsp. pauciflorus	CCH synonym
#				print OUT "Brodiaea pulchella var. pulchella\tDipterostemon capitatus subsp. capitatus\n";
#				print OUT4 "Brodiaea pulchella var. pulchella\tDipterostemon capitatus subsp. capitatus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Brodiaea scabra	Triteleia ixioides subsp. scabra	EFLORA==>EFLORA synonym
##Brodiaea scabra var. anilina	Triteleia ixioides subsp. anilina	EFLORA==>EFLORA synonym
#				print OUT "Brodiaea scabra var. scabra\tTriteleia ixioides subsp. scabra\n";
#				print OUT4 "Brodiaea scabra var. scabra\tTriteleia ixioides subsp. scabra\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Brodiaea synandra var. insignis	Brodiaea insignis	ICPN_SYNS==>NATIVE; SYNONYM in ICPN
#				print OUT "Brodiaea synandra\tBrodiaea leptandra\n";
#				print OUT4 "Brodiaea synandra\tBrodiaea leptandra\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
#				print OUT "Brodiaea synandra var. synandra\tBrodiaea leptandra\n";
#				print OUT4 "Brodiaea synandra var. synandra\tBrodiaea leptandra\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Brodiaea terrestris subsp. terrestris	Brodiaea terrestris subsp. terrestris	ICPN_SYNS==>NATIVE; ACCEPTED in ICPN
##Brodiaea terrestris var. kernensis	Brodiaea terrestris subsp. kernensis	CCH synonym
#				print OUT "Brodiaea terrestris var. terrestris\tBrodiaea terrestris subsp. terrestris\n";
#				print OUT4 "Brodiaea terrestris var. terrestris\tBrodiaea terrestris subsp. terrestris\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Bromidium hygrometricum var. tandilense	Agrostis tandilensis	CCH synonym
#				print OUT "Bromidium hygrometricum var. hygrometricum\tAgrostis hygrometrica\n";
#				print OUT4 "Bromidium hygrometricum var. hygrometricum\tAgrostis hygrometrica\tunresolved\tunresolved taxonomic or nomenclatural synonym; possibly NOT IN CALIFORNIA\n";
#				print OUT "Bromidium hygrometricum\tAgrostis hygrometrica\n";
#				print OUT4 "Bromidium hygrometricum\tAgrostis hygrometrica\tunresolved\tunresolved taxonomic or nomenclatural synonym; possibly NOT IN CALIFORNIA\n";
##Bromus alopecuros	Bromus alopecuros	ICPN_SYNS==>EXCLUDED, NOT IN CALIFORNIA; ACCEPTED in ICPN
##Bromus alopecuros subsp. caroli-henrici	Bromus caroli-henrici	CCH synonym
#				print OUT "Bromus alopecuros subsp. alopecuros\tBromus alopecuros\n";
#				print OUT4 "Bromus alopecuros subsp. alopecuros\tBromus alopecuros\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Bromus erectus	Bromus erectus	ICPN_SYNS==>EXCLUDED, NOT IN CALIFORNIA; ACCEPTED in ICPN
##Bromus erectus var. arvensis	Bromus arvensis	CCH synonym
#				print OUT "Bromus erectus var. erectus\tBromus erectus\n";
#				print OUT4 "Bromus alopecuros var. erectus\tBromus erectus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Bromus gussonii var. rigidus	Bromus diandrus	CCH synonym
#				print OUT "Bromus gussonii var. gussonii\tBromus diandrus\n";
#				print OUT4 "Bromus gussonii var. gussonii\tBromus diandrus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
#				print OUT "Bromus gussonii\tBromus diandrus\n";
#				print OUT4 "Bromus gussonii\tBromus diandrus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Bromus hookeri var. ciliatus	Bromus ciliatus	CCH synonym
##Bromus hookeri var. marginatus	Bromus sitchensis var. marginatus	CCH synonym
#				print OUT "Bromus hookeri var. hookeri\tBromus ciliatus\n";
#				print OUT4 "Bromus hookeri var. hookeri\tBromus ciliatus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
#				print OUT "Bromus hookeri\tBromus ciliatus\n";
#				print OUT4 "Bromus hookeri\tBromus ciliatus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Bromus hordeaceus subsp. hordeaceus	Bromus hordeaceus	ICPN_SYNS==>NATURALIZED; SYNONYM in ICPN
##Bromus hordeaceus var. mollis	Bromus hordeaceus	CCH synonym
#				print OUT "Bromus hordeaceus var. hordeaceus\tBromus hordeaceus\n";
#				print OUT4 "Bromus hordeaceus var. hordeaceus\tBromus hordeaceus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Bromus kalmii
#				print OUT "Bromus kalmii\tBromus kalmii\n";
#				print OUT4 "Bromus kalmii\tBromus kalmii\tunresolved\tunresolved ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA\n";
#				print OUT "Bromus kalmii var. kalmii\tBromus kalmii\n";
#				print OUT4 "Bromus kalmii var. kalmii\tBromus kalmii\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA\n";
##Bromus marginatus	Bromus sitchensis var. marginatus	NATIVE; SYNONYM in ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
##Bromus marginatus var. marginatus
#				print OUT "Bromus marginatus var. marginatus\tBromus sitchensis var. marginatus\n";
#				print OUT4 "Bromus marginatus var. marginatus\tBromus sitchensis var. marginatus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Bromus mollis	Bromus hordeaceus	EFLORA==>EFLORA synonym
#				print OUT "Bromus mollis var. mollis\tBromus hordeaceus\n";
#				print OUT4 "Bromus mollis var. mollis\tBromus hordeaceus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
#				print OUT "Bromus mollis subsp. mollis\tBromus hordeaceus\n";
#				print OUT4 "Bromus mollis subsp. mollis\tBromus hordeaceus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Bromus mutabilis var. commutatus	Bromus commutatus	CCH synonym
#				print OUT "Bromus mutabilis\tBromus secalinus\n";
#				print OUT4 "Bromus mutabilis\tBromus secalinus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
#				print OUT "Bromus mutabilis var. mutabilis\tBromus secalinus\n";
#				print OUT4 "Bromus mutabilis var. mutabilis\tBromus secalinus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Bromus purgans var. ciliatus	Bromus ciliatus	CCH synonym
##Bromus purgans var. vulgaris	Bromus vulgaris	CCH synonym
#				print OUT "Bromus purgans var. purgans\tBromus kalmii\n";
#				print OUT4 "Bromus purgans var. purgans\tBromus kalmii\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA\n";
#				print OUT "Bromus purgans\tBromus kalmii\n";
#				print OUT4 "Bromus purgans\tBromus kalmii\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA\n";
##Bromus porteri	Bromus porteri	NATIVE; ACCEPTED in ICPN	1, accepted name for taxon native to CA
##Bromus porteri var. porteri
#				print OUT "Bromus porteri var. porteri\tBromus porteri\n";
#				print OUT4 "Bromus porteri var. porteri\tBromus porteri\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Bromus racemosus	Bromus racemosus	ICPN_SYNS==>NATURALIZED; ACCEPTED in ICPN
##Bromus racemosus subsp. commutatus	Bromus commutatus	CCH synonym
##Bromus racemosus var. commutatus	Bromus commutatus	CCH synonym
#				print OUT "Bromus racemosus var. racemosus\tBromus racemosus\n";
#				print OUT4 "Bromus racemosus var. racemosus\tBromus racemosus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
#				print OUT "Bromus racemosus subsp. racemosus\tBromus racemosus\n";
#				print OUT4 "Bromus racemosus subsp. racemosus\tBromus racemosus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Bromus rubens	Bromus rubens	ICPN_SYNS==>NATURALIZED; ACCEPTED in ICPN
##Bromus rubens var. rigidus	Bromus diandrus	CCH synonym
#				print OUT "Bromus rubens var. rubens\tBromus rubens\n";
#				print OUT4 "Bromus rubens var. rubens\tBromus rubens\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Bromus scoparius	Bromus scoparius	ICPN_SYNS==>EXCLUDED, NOT IN CALIFORNIA; ACCEPTED in ICPN
##Bromus scoparius var. rubens	Bromus rubens	CCH synonym
#				print OUT "Bromus scoparius var. scoparius\tBromus scoparius\n";
#				print OUT4 "Bromus scoparius var. scoparius\tBromus scoparius\tunresolved EXCLUDED\tunresolved EXCLUDED; unresolved taxonomic or nomenclatural synonym for an ICPN accepted name NOT IN CALIFORNIA\n";
##Bromus secalinus	Bromus secalinus	ICPN_SYNS==>NATURALIZED; ACCEPTED in ICPN
##Bromus secalinus subsp. commutatus	Bromus commutatus	CCH synonym
##Bromus secalinus var. hordeaceus	Bromus hordeaceus	CCH synonym
#				print OUT "Bromus secalinus var. secalinus\tBromus secalinus\n";
#				print OUT4 "Bromus secalinus var. secalinus\tBromus secalinus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
#				print OUT "Bromus secalinus subsp. secalinus\tBromus secalinus\n";
#				print OUT4 "Bromus secalinus subsp. secalinus\tBromus secalinus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Bromus villosus var. rigidus	Bromus diandrus	CCH synonym
#				print OUT "Bromus villosus var. villosus\tBromus madritensis\n";
#				print OUT4 "Bromus villosus var. villosus\tBromus madritensis\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
#				print OUT "Bromus villosus\tBromus madritensis\n";
#				print OUT4 "Bromus villosus\tBromus madritensis\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Bryonia cretica	Bryonia cretica	ICPN_SYNS==>EXCLUDED, NOT IN CALIFORNIA; ACCEPTED in ICPN
##Bryonia cretica subsp. dioica	Bryonia dioica	CCH synonym
#				print OUT "Bryonia cretica subsp. cretica\tBryonia cretica\n";
#				print OUT4 "Bryonia cretica subsp. cretica\tBryonia cretica\tunresolved EXCLUDED\tunresolved EXCLUDED; unresolved taxonomic or nomenclatural synonym for an ICPN accepted name NOT IN CALIFORNIA\n";
##Buda media	Spergularia media var. media	TAX_SYNS synonym
##Buda media var. marina	Spergularia marina	CCH synonym
#				print OUT "Buda media var. media\tSpergularia media var. media\n";
#				print OUT4 "Buda media var. media\tSpergularia media var. media\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Buddleja marrubiifolia var. utahensis	Buddleja utahensis	CCH synonym
#				print OUT "Buddleja marrubiifolia var. marrubiifolia\tBuddleja marrubiifolia\n";
#				print OUT4 "Buddleja marrubiifolia var. marrubiifolia\tBuddleja marrubiifolia\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA\n";
#				print OUT "Buddleja marrubiifolia\tBuddleja marrubiifolia\n";
#				print OUT4 "Buddleja marrubiifolia\tBuddleja marrubiifolia\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA\n";
##Burrielia chrysostoma var. macrantha	Lasthenia californica subsp. macrantha	CCH synonym
##Lasthenia californica subsp. californica
#				print OUT "Burrielia chrysostoma var. chrysostoma\tLasthenia californica subsp. californica\n";
#				print OUT4 "Burrielia chrysostoma var. chrysostoma\tLasthenia californica subsp. californica\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
#				print OUT "Burrielia chrysostoma\tLasthenia californica\n";
#				print OUT4 "Burrielia chrysostoma\tLasthenia californica\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Cactus radiosus	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
#				print OUT "Cactus radiosus var. radiosus\tCoryphantha vivipara var. vivipara\n";
#				print OUT4 "Cactus radiosus var. radiosus\tCoryphantha vivipara var. vivipara\tunresolved EXCLUDED\tunresolved EXCLUDED; unresolved taxonomic or nomenclatural synonym for an ICPN accepted name NOT IN CALIFORNIA\n";
#				print OUT "Escobaria vivipara var. vivipara\tCoryphantha vivipara var. vivipara\n";
#				print OUT4 "Escobaria vivipara var. vivipara\tCoryphantha vivipara var. vivipara\tunresolved EXCLUDED\tunresolved EXCLUDED; unresolved taxonomic or nomenclatural synonym for an ICPN accepted name NOT IN CALIFORNIA\n";
#				print OUT "Coryphantha vivipara var. vivipara\tCoryphantha vivipara var. vivipara\n";
#				print OUT4 "Coryphantha vivipara var. vivipara\tCoryphantha vivipara var. vivipara\tunresolved EXCLUDED\tunresolved EXCLUDED; unresolved ICPN accepted name NOT IN CALIFORNIA\n";
##Cakile lanceolata subsp. edentula	Cakile edentula	CCH synonym
##Cakile lanceolata var. edentula	Cakile edentula	CCH synonym
#				print OUT "Cakile lanceolata var. lanceolata\tCakile lanceolata\n";
#				print OUT4 "Cakile lanceolata var. lanceolata\tCakile lanceolata\tunresolved EXCLUDED\tunresolved EXCLUDED; unresolved taxonomic or nomenclatural synonym for an ICPN accepted name NOT IN CALIFORNIA\n";
#				print OUT "Cakile lanceolata subsp. lanceolata\tCakile lanceolata\n";
#				print OUT4 "Cakile lanceolata subsp. lanceolata\tCakile lanceolata\tunresolved EXCLUDED\tunresolved EXCLUDED; unresolved taxonomic or nomenclatural synonym for an ICPN accepted name NOT IN CALIFORNIA\n";
#				print OUT "Cakile lanceolata\tCakile lanceolata\n";
#				print OUT4 "Cakile lanceolata\tCakile lanceolata\tunresolved EXCLUDED\tunresolved EXCLUDED; unresolved taxonomic or nomenclatural synonym for an ICPN accepted name NOT IN CALIFORNIA\n";
##Calamagrostis arundinacea var. purpurascens	Calamagrostis purpurascens	CCH synonym
##Calamagrostis arundinacea	Calamagrostis arundinacea
#				print OUT "Calamagrostis arundinacea\tCalamagrostis arundinacea\n";
#				print OUT4 "Calamagrostis arundinacea\tCalamagrostis arundinacea\tunresolved EXCLUDED\tunresolved EXCLUDED; unresolved ICPN accepted name NOT IN CALIFORNIA\n";
##Calamagrostis arundinacea var. arundinacea	Calamagrostis arundinacea
#				print OUT "Calamagrostis arundinacea var. arundinacea\tCalamagrostis arundinacea\n";
#				print OUT4 "Calamagrostis arundinacea var. arundinacea\tCalamagrostis arundinacea\tunresolved EXCLUDED\tunresolved EXCLUDED; unresolved ICPN accepted name NOT IN CALIFORNIA\n";
##Calamagrostis canadensis subsp. langsdorffii	Calamagrostis canadensis var. langsdorffii	CCH synonym
##Calamagrostis canadensis var. canadensis	Calamagrostis canadensis var. canadensis	EFLORA==>EFLORA accepted
#				print OUT "Calamagrostis canadensis subsp. langsdorffii\tCalamagrostis canadensis var. langsdorffii\n";
#				print OUT4 "Calamagrostis canadensis subsp. langsdorffii\tCalamagrostis canadensis var. langsdorffii\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Calamagrostis canadensis subsp. canadensis
#				print OUT "Calamagrostis canadensis subsp. canadensis\tCalamagrostis canadensis var. canadensis\n";
#				print OUT4 "Calamagrostis canadensis subsp. canadensis\tCalamagrostis canadensis var. canadensis\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Calamagrostis lactea	NONE NEED FIX	UNRESOLVED, NATIVE OR NATURALIZED, possibly NOT IN CALIFORNIA; ACCEPTED NAME UNRESOLVED in ICPN	unresolved
#				print OUT "Calamagrostis lactea\tCalamagrostis canadensis var. canadensis\n";
#				print OUT4 "Calamagrostis lactea\tCalamagrostis canadensis var. canadensis\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Calamagrostis neglecta subsp. inexpansa	Calamagrostis stricta subsp. inexpansa	CCH synonym
##Calamagrostis neglecta subsp. stricta	Calamagrostis stricta	CCH synonym
#				print OUT "Calamagrostis neglecta subsp. stricta\tCalamagrostis stricta subsp. stricta\n";
#				print OUT4 "Calamagrostis neglecta subsp. stricta\tCalamagrostis stricta subsp. stricta\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Calamagrostis neglecta var. stricta	Calamagrostis stricta	CCH synonym
#				print OUT "Calamagrostis neglecta var. stricta\tCalamagrostis stricta subsp. stricta\n";
#				print OUT4 "Calamagrostis neglecta var. stricta\tCalamagrostis stricta subsp. stricta\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Calamagrostis neglecta var. neglecta
##Calamagrostis neglecta subsp. neglecta
#				print OUT "Calamagrostis neglecta var. neglecta\tCalamagrostis stricta subsp. stricta\n";
#				print OUT4 "Calamagrostis neglecta var. neglecta\tCalamagrostis stricta subsp. stricta\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
#				print OUT "Calamagrostis neglecta subsp. neglecta\tCalamagrostis stricta subsp. stricta\n";
#				print OUT4 "Calamagrostis neglecta subsp. neglecta\tCalamagrostis stricta subsp. stricta\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Calamagrostis sylvatica var. longifolia	Calamagrostis foliosa	NATIVE; SYNONYM in ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
##Calamagrostis sylvatica	Calamagrostis arundinacea
##Calamagrostis sylvatica var. sylvatica	Calamagrostis arundinacea
#				print OUT "Calamagrostis sylvatica\tCalamagrostis arundinacea\n";
#				print OUT4 "Calamagrostis sylvatica var. sylvatica\tCalamagrostis arundinacea\tunresolved EXCLUDED\tunresolved EXCLUDED; unresolved ICPN accepted name NOT IN CALIFORNIA\n";
##Calamintha sylvatica subsp. sylvatica\tClinopodium menthifolium subsp. menthifolium
##Calamintha sylvatica\tClinopodium menthifolium subsp. menthifolium
##Clinopodium menthifolium subsp. menthifolium\tClinopodium menthifolium subsp. menthifolium
#				print OUT "Clinopodium menthifolium subsp. menthifolium\tClinopodium menthifolium subsp. menthifolium\n";
#				print OUT4 "Clinopodium menthifolium subsp. menthifolium\tClinopodium menthifolium subsp. menthifolium\tunresolved EXCLUDED\tunresolved EXCLUDED; unresolved ICPN accepted name NOT IN CALIFORNIA\n";
#				print OUT "Calamintha sylvatica\tClinopodium menthifolium subsp. menthifolium\n";
#				print OUT4 "Calamintha sylvatica\tClinopodium menthifolium subsp. menthifolium\tunresolved EXCLUDED\tunresolved EXCLUDED; unresolved synonym of ICPN accepted name NOT IN CALIFORNIA\n";
#				print OUT "Calamintha sylvatica subsp. sylvatica\tClinopodium menthifolium subsp. menthifolium\n";
#				print OUT4 "Calamintha sylvatica subsp. sylvatica\tClinopodium menthifolium subsp. menthifolium\tunresolved EXCLUDED\tunresolved EXCLUDED; unresolved synonym of ICPN accepted name NOT IN CALIFORNIA\n";
##Clinopodium nepeta \tClinopodium nepeta
##Clinopodium nepeta subsp. nepeta\tClinopodium nepeta subsp. nepeta
#				print OUT "Clinopodium nepeta\tClinopodium nepeta\n";
#				print OUT4 "Clinopodium nepeta\tClinopodium nepeta\tunresolved EXCLUDED\tunresolved EXCLUDED; unresolved ICPN accepted name NOT IN CALIFORNIA\n";
#				print OUT "Clinopodium nepeta subsp. nepeta\tClinopodium nepeta subsp. nepeta\n";
#				print OUT4 "Clinopodium nepeta subsp. nepeta\tClinopodium nepeta subsp. nepeta\tunresolved EXCLUDED\tunresolved EXCLUDED; unresolved ICPN accepted name NOT IN CALIFORNIA\n";
##Calandrinia menziesii	Calandrinia menziesii	ICPN_SYNS==>NATIVE; ACCEPTED in ICPN
##Calandrinia menziesii var. macrocarpa	Calandrinia breweri	EFLORA==>EFLORA synonym
#				print OUT "Calandrinia menziesii var. menziesii\tCalandrinia menziesii\n";
#				print OUT4 "Calandrinia menziesii var. menziesii\tCalandrinia menziesii\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Calliprora ixioides var. lugens	Triteleia lugens	CCH synonym
#				print OUT "Calliprora ixioides var. lugens\tTriteleia lugens\n";
#				print OUT4 "Calliprora ixioides var. lugens\tTriteleia lugens\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Calliprora ixioides	Triteleia ixioides	CCH synonym
#				print OUT "Calliprora ixioides\tTriteleia ixioides\n";
#				print OUT4 "Calliprora ixioides\tTriteleia ixioides\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Calliprora ixioides var. ixioides
#				print OUT "Calliprora ixioides var. ixioides\tTriteleia ixioides subsp. ixioides\n";
#				print OUT4 "Calliprora ixioides var. ixioides\tTriteleia ixioides subsp. ixioides\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Calliprora scabra	Triteleia ixioides subsp. scabra	EFLORA==>EFLORA synonym
##Calliprora scabra var. anilina	Triteleia ixioides subsp. anilina	EFLORA==>EFLORA synonym
##Calliprora scabra var. scabra
#				print OUT "Calliprora scabra var. scabra\tTriteleia ixioides subsp. scabra\n";
#				print OUT4 "Calliprora scabra var. scabra\tTriteleia ixioides subsp. scabra\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Callitriche marginata	Callitriche marginata	ICPN_SYNS==>NATIVE; ACCEPTED in ICPN
##Callitriche marginata var. longipedunculata	Callitriche longipedunculata	CCH synonym
#				print OUT "Callitriche marginata var. longipedunculata\tCallitriche longipedunculata\n";
#				print OUT4 "Callitriche marginata var. longipedunculata\tCallitriche longipedunculata\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Callitriche palustris	Callitriche palustris	ICPN_SYNS==>NATIVE; ACCEPTED in ICPN
##Callitriche palustris subsp. stagnalis	Callitriche stagnalis	CCH synonym
#				print OUT "Callitriche palustris subsp. stagnalis\tCallitriche stagnalis\n";
#				print OUT4 "Callitriche palustris subsp. stagnalis\tCallitriche stagnalis\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Callitriche palustris var. bolanderi	Callitriche heterophylla var. bolanderi	CCH synonym
#				print OUT "Callitriche palustris var. bolanderi\tCallitriche heterophylla var. bolanderi\n";
#				print OUT4 "Callitriche palustris var. bolanderi\tCallitriche heterophylla var. bolanderi\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Callitriche palustris var. palustris\tCallitriche palustris
#				print OUT "Callitriche palustris var. palustris\tCallitriche palustris\n";
#				print OUT4 "Callitriche palustris var. palustris\tCallitriche palustris\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Callitriche palustris subsp. palustris\tCallitriche palustris
#				print OUT "Callitriche palustris subsp. palustris\tCallitriche palustris\n";
#				print OUT4 "Callitriche palustris subsp. palustris\tCallitriche palustris\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Caltha leptosepala	Caltha leptosepala	NATIVE; ACCEPTED in ICPN	1, accepted name for taxon native to CA
#				print OUT "Caltha leptosepala var. leptosepala\tCaltha leptosepala\n";
#				print OUT4 "Caltha leptosepala var. leptosepala\tCaltha leptosepala\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
#				print OUT "Caltha leptosepala subsp. leptosepala\tCaltha leptosepala\n";
#				print OUT4 "Caltha leptosepala subsp. leptosepala\tCaltha leptosepala\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Calycadenia multiglandulosa subsp. robusta	Calycadenia multiglandulosa	NATIVE; SYNONYM in ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#				print OUT "Calycadenia multiglandulosa subsp. multiglandulosa\tCalycadenia multiglandulosa\n";
#				print OUT4 "Calycadenia multiglandulosa subsp. multiglandulosa\tCalycadenia multiglandulosa\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Calycoseris wrightii var. californica	Calycoseris wrightii	NATIVE; possible new synonym for already accepted taxon, SYNONYM TENTATIVE in ICPN	tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#				print OUT "Calycoseris wrightii var. wrightii\tCalycoseris wrightii\n";
#				print OUT4 "Calycoseris wrightii var. wrightii\tCalycoseris wrightii\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Calystegia atriplicifolia subsp. buttensis	Calystegia atriplicifolia subsp. buttensis	NATIVE; ACCEPTED in ICPN	1, accepted name for taxon native to CA
#				print OUT "Calystegia atriplicifolia subsp. atriplicifolia\tCalystegia atriplicifolia subsp. atriplicifolia\n";
#				print OUT4 "Calystegia atriplicifolia subsp. atriplicifolia\tCalystegia atriplicifolia subsp. atriplicifolia\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Camassia quamash subsp. quamash	Camassia quamash subsp. quamash	ICPN_SYNS==>EXCLUDED, NOT IN CALIFORNIA; ACCEPTED in ICPN
#		print OUT "Camassia quamash var. quamash\tCamassia quamash subsp. quamash\n";
#		print OUT4 "Camassia quamash var. quamash\tCamassia quamash subsp. quamash\tunresolved, EXCLUDED\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA EXCLUDED accepted name; NOT IN CALIFORNIA\n";
##Camelina sativa subsp. microcarpa	Camelina microcarpa	CCH synonym
#		print OUT "Camelina sativa subsp. sativa\tCamelina microcarpa\n";
#		print OUT "Camelina sativa subsp. sativa\tCamelina microcarpa\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
#		print OUT "Camelina sativa\tCamelina microcarpa\n";
#		print OUT4 "Camelina sativa\tCamelina microcarpa\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Camelina sylvestris subsp. microcarpa	Camelina microcarpa	CCH synonym
#		print OUT "Camelina sylvestris subsp. sylvestris\tCamelina microcarpa\n";
#		print OUT4 "Camelina sylvestris subsp. sylvestris\tCamelina microcarpa\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
#		print OUT "Camelina sylvestris\tCamelina microcarpa\n";
#		print OUT4 "Camelina sylvestris\tCamelina microcarpa\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Camissonia claviformis subsp. claviformis	Chylismia claviformis subsp. claviformis	ICPN synonym
#		print OUT "Camissonia claviformis var. claviformis\tChylismia claviformis subsp. claviformis\n";
#		print OUT4 "Camissonia claviformis var. claviformis\tChylismia claviformis subsp. claviformis\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Camissonia contorta	Camissonia contorta	ICPN_SYNS==>NATIVE; ACCEPTED in ICPN
##Camissonia contorta var. pubens	Camissonia pubens	CCH synonym
#		print OUT "Camissonia contorta var. contorta\tCamissonia contorta\n";
#		print OUT4 "Camissonia contorta var. contorta\tCamissonia contorta\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Camissonia guadalupensis	Camissoniopsis guadalupensis	ICPN_SYNS==>NATIVE; SYNONYM in ICPN
##Camissonia guadalupensis subsp. clementina	Camissoniopsis guadalupensis subsp. clementina	CCH synonym
#		print OUT "Camissonia guadalupensis subsp. guadalupensis\tCamissoniopsis guadalupensis subsp. guadalupensis\n";
#		print OUT4 "Camissonia guadalupensis subsp. guadalupensis\tCamissoniopsis guadalupensis subsp. guadalupensis\tunresolved, EXCLUDED\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA EXCLUDED accepted name; NOT IN CALIFORNIA\n";
#		print OUT "Camissoniopsis guadalupensis subsp. guadalupensis\tCamissoniopsis guadalupensis subsp. guadalupensis\n";
#		print OUT4 "Camissoniopsis guadalupensis subsp. guadalupensis\tCamissoniopsis guadalupensis subsp. guadalupensis\tunresolved, EXCLUDED\tunresolved ICPN or EFLORA EXCLUDED accepted name; NOT IN CALIFORNIA\n";
##Camissonia kernensis subsp. kernensis	Camissonia kernensis subsp. kernensis	ICPN_SYNS==>NATIVE; ACCEPTED in ICPN
#		print OUT "Camissonia kernensis var. kernensis\tCamissonia kernensis subsp. kernensis\n";
#		print OUT4 "Camissonia kernensis var. kernensis\tCamissonia kernensis subsp. kernensis\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Camissonia walkeri var. tortilis	Chylismia walkeri subsp. tortilis	CCH synonym
#		print OUT "Camissonia walkeri var. walkeri\tChylismia walkeri subsp. walkeri\n";
#		print OUT4 "Camissonia walkeri var. walkeri\tChylismia walkeri subsp. walkeri\tunresolved, EXCLUDED\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA EXCLUDED accepted name; NOT IN CALIFORNIA\n";
#		print OUT "Camissonia walkeri subsp. walkeri\tChylismia walkeri subsp. walkeri\n";
#		print OUT4 "Camissonia walkeri subsp. walkeri\tChylismia walkeri subsp. walkeri\tunresolved, EXCLUDED\tunresolved an ICPN or EFLORA EXCLUDED accepted name; NOT IN CALIFORNIA\n";
#		print OUT "Chylismia walkeri subsp. walkeri\tChylismia walkeri subsp. walkeri\n";
#		print OUT4 "Chylismia walkeri subsp. walkeri\tChylismia walkeri subsp. walkeri\tunresolved, EXCLUDED\tunresolved ICPN or EFLORA EXCLUDED accepted name; NOT IN CALIFORNIA\n";
##Campanula angustiflora	Campanula angustiflora	ICPN_SYNS==>NATIVE; ACCEPTED in ICPN
##Campanula angustiflora var. exilis	Campanula griffinii	EFLORA==>EFLORA synonym
#		print OUT "Campanula angustiflora var. angustiflora\tCampanula angustiflora\n";
#		print OUT4 "Campanula angustiflora var. angustiflora\tCampanula angustiflora\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
#
#
##Cardamine flexosa	Cardamine flexuosa	ICPN_SYNS==>NATURALIZED; ACCEPTED NAME PENDING in ICPN
##Cardamine flexuosa subsp. pensylvanica	Cardamine pensylvanica	CCH synonym
#			print OUT "Cardamine flexuosa subsp. flexuosa\tCardamine flexuosa\n";
#			print OUT4 "Cardamine flexuosa subsp. flexuosa\tCardamine flexuosa\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Cardamine hirsuta	Cardamine hirsuta	ICPN_SYNS==>NATURALIZED; ACCEPTED in ICPN
##Cardamine hirsuta subsp. oligosperma	Cardamine oligosperma	CCH synonym
##Cardamine hirsuta var. pensylvanica	Cardamine pensylvanica	CCH synonym
#			print OUT "Cardamine hirsuta subsp. hirsuta\tCardamine hirsuta\n";
#			print OUT4 "Cardamine hirsuta subsp. hirsuta\tCardamine hirsuta\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
#			print OUT "Cardamine hirsuta var. hirsuta\tCardamine hirsuta\n";
#			print OUT4 "Cardamine hirsuta var. hirsuta\tCardamine hirsuta\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Cardamine globosa var. sphaerocarpa	Rorippa sphaerocarpa	CCH synonym
#			print OUT "Cardamine globosa var. globosa\tRorippa globosa\n";
#			print OUT4 "Cardamine globosa var. globosa\tRorippa globosa\tunresolved, EXCLUDED\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA EXCLUDED accepted name; NOT IN CALIFORNIA\n";
#
#
#
##Eryngium globosum var. globosum	Eryngium spinosepalum	NATIVE; UNPUBLISHED, INVALID, ILLEGITIMATE, OR REJECTED IN ICPN	1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#				print OUT "Eryngium globosum var. globosum\tEryngium spinosepalum\n";
#				print OUT4 "Eryngium globosum var. globosum\tEryngium spinosepalum\tNATIVE; UNPUBLISHED, INVALID, ILLEGITIMATE, OR REJECTED IN ICPN\t1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA\n";
##Juncus balticus subsp. vallicola
#				print OUT "Juncus balticus subsp. vallicola\tJuncus balticus subsp. ater\n";
#				print OUT4 "Juncus balticus subsp. vallicola\tJuncus balticus subsp. ater\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Juncus vallicola
#				print OUT "Juncus vallicola\tJuncus balticus subsp. ater\n";
#				print OUT4 "Juncus vallicola\tJuncus balticus subsp. ater\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Juncus ater
#				print OUT "Juncus ater\tJuncus balticus subsp. ater\n";
#				print OUT4 "Juncus ater\tJuncus balticus subsp. ater\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Juncus arcticus subsp. ater
#				print OUT "Juncus arcticus subsp. ater\tJuncus balticus subsp. ater\n";
#				print OUT4 "Juncus arcticus subsp. ater\tJuncus balticus subsp. ater\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Juncus arcticus subsp. balticus
#				print OUT "Juncus arcticus subsp. balticus\tJuncus balticus subsp. ater\n";
#				print OUT4 "Juncus arcticus subsp. balticus\tJuncus balticus subsp. ater\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Juncus arcticus var. montanus
#				print OUT "Juncus arcticus var. montanus\tJuncus balticus subsp. ater\n";
#				print OUT4 "Juncus arcticus var. montanus\tJuncus balticus subsp. ater\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Juncus arcticus subsp. arcticus
#				print OUT "Juncus arcticus subsp. arcticus\tJuncus arcticus subsp. arcticus\n";
#				print OUT4 "Juncus arcticus subsp. arcticus\tJuncus arcticus subsp. arcticus\tunresolved\tunresolved ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA\n";
##Juncus arcticus var. arcticus
#				print OUT "Juncus arcticus var. arcticus\tJuncus arcticus subsp. arcticus\n";
#				print OUT4 "Juncus arcticus var. arcticus\tJuncus arcticus subsp. arcticus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA\n";
##Juncus balticus subsp. balticus
#				print OUT "Juncus balticus subsp. balticus\tJuncus balticus subsp. balticus\n";
#				print OUT4 "Juncus balticus subsp. balticus\tJuncus balticus subsp. balticus\tunresolved\tunresolved ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA\n";
##Juncus balticus var. balticus
#				print OUT "Juncus balticus var. balticus\tJuncus balticus subsp. balticus\n";
#				print OUT4 "Juncus balticus var. balticus\tJuncus balticus subsp. balticus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name; possibly NOT IN CALIFORNIA\n";
##Juncus balticus var. mexicanus
#				print OUT "Juncus balticus var. mexicanus\tJuncus mexicanus\n";
#				print OUT4 "Juncus balticus var. mexicanus\tJuncus mexicanus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Juncus bolanderi var. bolanderi
#				print OUT "Juncus bolanderi var. bolanderi\tJuncus bolanderi\n";
#				print OUT4 "Juncus bolanderi var. bolanderi\tJuncus bolanderi\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Juncus bufonius subsp. bufonius
#				print OUT "Juncus bufonius subsp. bufonius\tJuncus bufonius var. bufonius\n";
#				print OUT4 "Juncus bufonius subsp. bufonius\tJuncus bufonius var. bufonius\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Juncus communis
#				print OUT "Juncus communis\tJuncus effusus\n";
#				print OUT4 "Juncus communis\tJuncus effusus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Juncus communis var. communis 
#				print OUT "Juncus communis var. communis\tJuncus effusus subsp. effusus\n";
#				print OUT4 "Juncus communis var. communis\tJuncus effusus subsp. effusus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Juncus communis subsp. communis
#				print OUT "Juncus communis subsp. communis\tJuncus effusus subsp. effusus\n";
#				print OUT4 "Juncus communis subsp. communis\tJuncus effusus subsp. effusus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Juncus conglomeratus
#				print OUT "Juncus conglomeratus\tJuncus effusus\n";
#				print OUT4 "Juncus conglomeratus\tJuncus effusus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Juncus conglomeratus var. conglomeratus
#				print OUT "Juncus conglomeratus var. conglomeratus\tJuncus effusus subsp. effusus\n";
#				print OUT4 "Juncus conglomeratus var. conglomeratus\tJuncus effusus subsp. effusus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Juncus conglomeratus subsp. conglomeratus 				
#				print OUT "Juncus conglomeratus subsp. conglomeratus\tJuncus effusus subsp. effusus\n";
#				print OUT4 "Juncus conglomeratus subsp. conglomeratus\tJuncus effusus subsp. effusus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Juncus effusus var. conglomeratus
#				print OUT "Juncus effusus var. conglomeratus\tJuncus effusus subsp. effusus\n";
#				print OUT4 "Juncus effusus var. conglomeratus\tJuncus effusus subsp. effusus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Juncus effusus subsp. conglomeratus
#				print OUT "Juncus effusus subsp. conglomeratus\tJuncus effusus subsp. effusus\n";
#				print OUT4 "Juncus effusus subsp. conglomeratus\tJuncus effusus subsp. effusus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Juncus effusus var. effusus
#				print OUT "Juncus effusus var. effusus\tJuncus effusus subsp. effusus\n";
#				print OUT4 "Juncus effusus var. effusus\tJuncus effusus subsp. effusus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Juncus laevis var. laevis
#				print OUT "Juncus laevis var. laevis\tJuncus effusus subsp. effusus\n";
#				print OUT4 "Juncus laevis var. laevis\tJuncus effusus subsp. effusus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Juncus drummondii var. drummondii
#				print OUT "Juncus drummondii var. drummondii\tJuncus drummondii\n";
#				print OUT4 "Juncus drummondii var. drummondii\tJuncus drummondii\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Juncus interior var. interior
#				print OUT "Juncus interior var. interior\tJuncus interior\n";
#				print OUT4 "Juncus interior var. interior\tJuncus interior\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Juncus lesueurii var. lesueurii	orthographic variant
#				print OUT "Juncus lesueurii var. lesueurii\tJuncus lescurii\n";
#				print OUT4 "Juncus lesueurii var. lesueurii\tJuncus lescurii\tunresolved\tunresolved taxonomic or nomenclatural synonym (orthographic variant) of an ICPN or EFLORA accepted name\n";
##Juncus leseurii var. leseurii	orthographic variant
#				print OUT "Juncus leseurii var. leseurii\tJuncus lescurii\n";
#				print OUT4 "Juncus leseurii var. leseurii\tJuncus lescurii\tunresolved\tunresolved taxonomic or nomenclatural synonym (orthographic variant) of an ICPN or EFLORA accepted name\n";
##Juncus lescurii var. lescurii
#				print OUT "Juncus lescurii var. lescurii\tJuncus lescurii\n";
#				print OUT4 "Juncus lescurii var. lescurii\tJuncus lescurii\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Juncus triformis var. triformis
#				print OUT "Juncus triformis var. triformis\tJuncus triformis\n";
#				print OUT4 "Juncus triformis var. triformis\tJuncus triformis\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Juncus xiphioides var. xiphioides
#				print OUT "Juncus xiphioides var. xiphioides\tJuncus xiphioides\n";
#				print OUT4 "Juncus xiphioides var. xiphioides\tJuncus xiphioides\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Lupinus mariposanus
#				print OUT "Lupinus mariposanus\tLupinus adsurgens\n";
#				print OUT4 "Lupinus mariposanus\tLupinus adsurgens\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Lupinus fulcratus var\. fulcratus
#				print OUT "Lupinus fulcratus var. fulcratus\tLupinus fulcratus\n";
#				print OUT4 "Lupinus fulcratus var. fulcratus\tLupinus fulcratus\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Senecio cymbalarioides	Packera subnuda var. subnuda	NATIVE; SYNONYM in ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#				print OUT "Senecio cymbalarioides subsp. cymbalarioides\tPackera subnuda var. subnuda\n";
#				print OUT4 "Senecio cymbalarioides subsp. cymbalarioides\tPackera subnuda var. subnuda\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
#				print OUT "Senecio cymbalarioides var. cymbalarioides\tPackera subnuda var. subnuda\n";
#				print OUT4 "Senecio cymbalarioides var. cymbalarioides\tPackera subnuda var. subnuda\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Stipa eminens
#				print OUT "Stipa eminens\tStipa eminens\n";
#				print OUT4 "Stipa eminens\tStipa eminens\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Stipa eminens var. eminens
#				print OUT "Stipa eminens var. eminens\tStipa eminens\n";
#				print OUT4 "Stipa eminens var. eminens\tStipa eminens\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Stipa eminens subsp. eminens
#				print OUT "Stipa eminens subsp. eminens\tStipa eminens\n";
#				print OUT4 "Stipa eminens subsp. eminens\tStipa eminens\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Stipa eminens var. andersonii
#				print OUT "Stipa eminens var. andersonii\tStipa lepida\n";
#				print OUT4 "Stipa eminens var. andersonii\tStipa lepida\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Stipa eminens subsp. andersonii
#				print OUT "Stipa eminens subsp. andersonii\tStipa lepida\n";
#				print OUT4 "Stipa eminens subsp. andersonii\tStipa lepida\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Stipa lepida var. andersonii
#				print OUT "Stipa lepida var. andersonii\tStipa cernua\n";
#				print OUT4 "Stipa lepida var. andersonii\tStipa cernua\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
##Stipa lepida var. lepida
#				print OUT "Stipa lepida var. lepida\tStipa lepida\n";
#				print OUT4 "Stipa lepida var. lepida\tStipa lepida\tunresolved\tunresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name\n";
#

print "TOTAL PUBLISHED ICPN NAMES: $total_lines\n\n";
print "TOTAL INED NAMES skipped: $ined\n\n";



close (IN);
close (OUT);
close (OUT2);
close (OUT3);
close (OUT4);
close (OUT5);
close (OUT6);


#unresolved	unresolved taxonomic or nomenclatural synonym of an ICPN or EFLORA accepted name
#NATIVE; SYNONYM in ICPN	1a, taxonomic or nomenclatural synonym for taxon native to CA
#NATURALIZED; SYNONYM in ICPN	2a, taxonomic or nomenclatural synonym for taxon naturalized in CA
#NATIVE; ACCEPTED in ICPN	1, accepted name for taxon native to CA
#NATURALIZED; ACCEPTED in ICPN	2, accepted name for taxon naturalized in CA


sub get_family {
		my $par = shift;
		@lines=split(/\n/,$par);

		if( $lines[2]=~/Family: ?([A-Z]+)/){ #if the first line starts with...
    	return $1; #the name is the contents of the first line
        
		}
		elsif( $lines[3]=~/Family: ?([A-Z]+)/){ #if the first line starts with...
    	return $1; #the name is the contents of the first line
		}
		elsif( $lines[4]=~/Family: ?([A-Z]+)/){ #if the first line starts with...
    	return $1; #the name is the contents of the first line
		}
		else {
			if($par =~ m/(Family: ?[A-Z]+)/){
				#return $1;
				print "Problem Family line:==>$_\n\n";
				return "NULL";
			}
			else{
				return "NULL";
			}
		}
}

sub get_taxon_name {
    my $par = shift; #each paragraph is separated by a blank line
    @lines=split(/\n/,$par); #the array of lines within a paragraph are values separated by a new line
    if( $lines[0] =~ m/\R(&times;[A-Z][a-z-]+ .+)/){ #if the first line starts with...
    	return $1; #the name is the contents of the first line
        
    }
    elsif( $lines[0] =~ m/\R([A-Z][a-z-]+ .+)/){ #if the first line starts with...
    	return $1; #the name is the contents of the first line
        
    }
    elsif( $lines[0] =~ m/([A-Z][a-z-]+ .+)/){ #if the first line starts with...
    	return $1; #the name is the contents of the first line
        
    }
	else{
		return "Problem TNOAN Name==>$lines[0]";
		print "Problem TNOAN Name==>$lines[0]\n\n";
	}
}

sub get_TAN_name {
    my $par = shift; #each paragraph is separated by a blank line
	if($par =~ m/\RTAN: (.+)/){ #if the first line starts with...
    	return $1; #the name is the contents of the TAN line
        
    }
	else{
		return "Problem TAN Name==>$lines[0]";
		print "Problem TAN Name==>$lines[0]\n\n";
	}
}

sub get_ICPN_name {
		my $par = shift;
		@lines=split(/\n/,$par);
		if($lines[0] =~ m/^\.([A-Z].+)/){
			
			return $1; #the name is the contents after the period
		}
		elsif($lines[0] =~ m/^\.(&times;[A-Z].+)/){
			return $1; #the name is the contents after the period
		}
		else{
			return "Problem ICPN name";
			print "Problem ICPN Name==>$lines[0]\n\n";
		}
}


sub get_summary_brief {
		my $par = shift;
		if($par =~ m/\RSummary: ([A-Za-z ]+),/){
			return $1; #the name is the contents of the SUMMARY line
		}
		else {
			if($par =~ m/Summary: ([A-Za-z ]+, .+)/){
				#return $1;
				print "Problem SUMMARY line:==>$1\n\n";
				return "NULL";
			}
			else{
				return "NULL";
			}
		}
}

sub get_status {
		my $par = shift;
		if($par =~ m/\RCurrent Status: (.+)/m){
			return $1;
		}
		else {
			if($par =~ m/Current Status Authority: to be determined/){
				return "to be determined";
			}
			elsif($par =~ m/Current Status/){
				#return $1;
				print "Problem Current Status line:==>$_\n\n";
				return "NULL";
			}
			else{
				return "NULL";
			}
		}
}

sub get_accepted {
		my $par = shift;
		if($par =~ m/\RCurrent Name: (.+)/){
			return $1; 
		}
		elsif($par =~ m/\RCurrent Status: 8.+accepted name/){
			$accepted = "NOT IN CA";
		}
		elsif($par =~ m/\RCurrent Status: .+accepted name/){
			$accepted = "ICPN accepted";
		}
		elsif($par =~ m/\RCurrent Status: .+sterile hybrid/){
			$accepted = "sterile hybrid";
		}
		elsif($par =~ m/\RCurrent Status: .+fertile hybrid/){
			$accepted = "fertile hybrid";
		}
		else{
			$accepted = "Problem Current NAME line:==>$_\n\n";
		}
}

sub get_accepted_all {
		my $par = shift;
		if($par =~ m/\RCurrent Status: [1-9], accepted name/){
			if($par =~ m/\RCurrent Name: (.+)/){
				return "$1 --> accepted name with Current Name line";
			}
			else{
				return $lines[0];
			}
		}
		elsif($par =~ m/\RCurrent Status: 18,/){
			if($par =~ m/\RCurrent Name: (.+)/){
				return "$1 --> accepted name with Current Name line";
			}
			else{
				return $lines[0];
			}
		}
#Current Status: 8, accepted name for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
		elsif($par =~ m/\RCurrent Status: ?[12345679][ab],/){
			if($par =~ m/\RCurrent Name: (.+)/){
				return $1; #the name is the contents of the last Current Name line, if present
			}
			else{
				#return $lines[0];
				return "$lines[0] (SYNONYM in ICPN without entry in Current Name)";
			}
		}
		elsif($par =~ m/\RCurrent Status: ?8a,/){
#Current Status: 8a, taxonomic or nomenclatural synonym for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
			if($par =~ m/\RCurrent Name: (.+)/){
				return $1; #the name is the contents of the last Current Name line, if present
			}
			else{
				return $lines[0]; #some 8a names do not have a Current Name line, so return line 0
			}
		}
		elsif($par =~ m/\RCurrent Status: ?8b,/){
			if($par =~ m/\RCurrent Name: (.+)/){
				return $1; #the name is the contents of the last Current Name line, if present
			}
			else{
				return $lines[0]; #some 8b names do not have a Current Name line, so return line 0
			}
		}
		elsif($par =~ m/\RCurrent Status: ?10a?,/){
			if($par =~ m/\RCurrent Name: (.+)/){
				return $1; #the name is the contents of the last Current Name line, if present
			}
			else{
				return $lines[0];
			}
#Current Status: 10, accepted name for taxonomically recognized and/or fertile hybrid; hybrid form of name
#Current Status: 10a, accepted name for taxonomically recognized and/or fertile hybrid; non-hybrid form of name
		}
		elsif($par =~ m/\RCurrent Status: ?11,/){
			if($par =~ m/\RCurrent Name: (.+)/){
				return $1; #the name is the contents of the last Current Name line, if present
			}
			else{
				return $lines[0];
			}

#Current Status: 11, taxonomically not recognized and/or sterile hybrid; hybrid form of name
		}
		elsif($par =~ m/\RCurrent Status: ?10[bc],/){
			if($par =~ m/\RCurrent Name: (.+)/){
				return $1; #the name is the contents of the last Current Name line, if present
			}
			else{
				return $lines[0];
			}
		}
#Current Status: 10b, taxononomic or nomenclatural synonym for taxonomically recognized and/or fertile hybrid; hybrid form of name
#Current Status: 10c, taxonomic or nomenclatural synonym for taxonomically recognized and/or fertile hybrid; non-hybrid form of name
		elsif($par =~ m/\RCurrent Status: ?10bb,/){
			if($par =~ m/\RCurrent Name: (.+)/){
				return $1; #the name is the contents of the last Current Name line, if present
			}
			else{
				return $lines[0];
			}
		}
#Current Status: 10bb, unpublished, invalidly published, illegitimate, or rejected name for taxonomically recognized and/or fertile hybrid; hybrid form of name
		elsif($par =~ m/\RCurrent Status: ?11[bc],/){
			if($par =~ m/\RCurrent Name: (.+)/){
				return $1; #the name is the contents of the last Current Name line, if present
			}
			else{
				return $lines[0];
			}
		}
		elsif($par =~ m/\RCurrent Status: ?11bb,/){
			if($par =~ m/\RCurrent Name: (.+)/){
				return $1; #the name is the contents of the last Current Name line, if present
			}
			else{
				return $lines[0];
			}
		}
		elsif($par =~ m/\RCurrent Status: ?13,/){
			if($par =~ m/\RCurrent Name: (.+)/){
				return $1; #the name is the contents of the last Current Name line, if present
			}
			else{
				return $lines[0];
			}
		}
		elsif($par =~ m/\RCurrent Status: ?14,/){
			if($par =~ m/\RCurrent Name: (.+)/){
				return $1; #the name is the contents of the last Current Name line, if present
			}
			else{
				return $lines[0];
			}
		}
		elsif($par =~ m/\RCurrent Status: ?17,/){
			if($par =~ m/\RCurrent Name: (.+)/){
				return $1; #the name is the contents of the last Current Name line, if present
			}
			else{
				return $lines[0];
			}
		}
#not sure there are any 13
#Current Status: 13, represents correction or possible correction only in spelling or rank and treated elsewhere in this checklist
		elsif($par =~ m/\RCurrent Status: ?18a,/){
			if($par =~ m/\RCurrent Name: (.+)/){
				return $1; #the name is the contents of the last Current Name line, if present
			}
			else{
				return $lines[0];
			}

#Current Status: 11, taxonomically not recognized and/or sterile hybrid; hybrid form of name
		}
		elsif($par =~ m/\RCurrent Status: ?tentative/i){
			if($par =~ m/\RCurrent Name: ?(.+)/){
				return $1; #the name is the contents of the last Current Name line, if present
			}
			elsif($par =~ m/\RCurrent Name \(T\): ?(.+)/){
				return $1; #the name is the contents of the last Current Name line, if present
			}
			else{
				return $lines[0];
				#return "NULL (EXCLUDED SYNONYM in ICPN without entry in Current Name)";
			}
		}
		elsif($par =~ m/\RCurrent Status: ?pending/i){
			return $lines[0];
		}
		else{
			return "NONE";
		}
}


sub get_accepted_strip {
		my $par = shift;
		@lines=split(/\n/,$par); #the array of lines within a paragraph are values separated by a new line
		if($par=~/\R(Current Name:) ([A-Z].+)/){
			$taxon_acc = $2;
			
		}
		elsif($par=~/Current Status.+accepted name/){
			$taxon_acc = $lines[0];
		}
		else{
			$taxon_acc = "Current status or name missing: $lines[0]";
			print "MISSING status or current name:==>($lines[0])$_\n\n";
		}

		
	if ($taxon_acc =~ m/Encelia farinosa A\. Gray ex Torr\.( X | &times;) ?E/){ #the spontaneous hybrid is kluged because there is only one and it's awkward
		$full_accepted_NOAUTH = "Encelia farinosa &times; frutescens";
	}
	elsif ($taxon_acc =~ /([A-Z]+) ([a-z-]+) (.+) (var\.|subsp\.) ([a-z-]+)$/){ #if it is an infra with an author inserted (that's the ".+")

		$genus = ucfirst(lc($1));
		$species = $2;
		$species_author = $3;
		$infra_rank = $4;
		$infra_epithet = $5;
		$taxon_acc=ucfirst(lc($taxon_acc));
		$taxon_acc=&strip_name_EF($taxon_acc);
	
		if ($species eq $infra_epithet){ #if it is an autonym, inserted author goes after specific epithet, and there is no $taxon_author
			$full_accepted_NOAUTH = "$genus $species $infra_rank $infra_epithet";
		
		}
		else { #else the inserted author stays after the specific epithet, and the $taxon_author goes at the end
			$full_accepted_NOAUTH = "$genus $species $infra_rank $infra_epithet";
		}
	}
	elsif ($taxon_acc =~ /([A-Z]+) ([a-z-]+) (var\.|subsp\.) ([a-z-]+)$/){ #if it is an infra without an author in the name

		$genus = ucfirst(lc($1));
		$species = $2;
		$infra_rank = $3;
		$infra_epithet = $4;
		$taxon_acc=ucfirst(lc($taxon_acc));
	
		if ($species eq $infra_epithet){ #if it is an autonym, author goes after specific epithet
			$full_accepted_NOAUTH = "$genus $species $infra_rank $infra_epithet";
		}
		else { #otherwise the author goes at the end
			$full_accepted_NOAUTH = "$genus $species $infra_rank $infra_epithet";
		}
	}
	else { #The rest should be family, genus, or binomial species treatments
		s/\.//;
		$taxon_acc=ucfirst(lc($taxon_acc));
		$taxon_acc=&strip_name_EF($taxon_acc);
		$full_accepted_NOAUTH = $taxon_acc;
	
	}


}

sub get_syns_TJM2 {
		my $par = shift; 
		if($par =~ m/(\R)Current JFP synonyms: *([\(A-Z].+)/){
			return $2;
		}
		elsif($par =~ m/(\R)TJM2 synonyms: *([\(A-Z].+)/){
			return $2;
		}
		else {
			if($par =~ m/TJM2 synonyms: *([\(A-Za-z ]+.+)/){
				#return $1;
				print "Problem TJM2 synonyms line:==>$1\n\n";
				return "NULL";
			}
			elsif($par =~ m/Current JFP synonyms: *([\(A-Za-z ]+.+)/){
				#return $1;
				print "Problem JFP synonyms line:==>$1\n\n";
				return "NULL";
			}
			else{
				return "NULL";
			}
		}
}
sub get_syns_TJM {
		my $par = shift;
		if($par =~ m/(\R)TJM synonyms: *([\(A-Z].+)/){
			return $2;
		}
		else {
			if($par =~ m/TJM synonyms/){
				#return $1;
				print "Problem TJM synonyms line:==>$_\n\n";
				return "NULL";
			}
			else{
				return "NULL";
			}
		}
}



#Current Status: 1, accepted name for taxon native to CA
#Current Status: 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Current Status: 1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
#Current Status: 2, accepted name for taxon naturalized in CA
#Current Status: 2a, taxonomic or nomenclatural synonym for taxon naturalized in CA
#Current Status: 2b, unpublished, invalidly published, illegitimate, or rejected name for taxon naturalized in CA

#B. In CA but not in CA Flora (escaped from or persistent beyond cultivation but not naturalized in CA, or occurring in cultivation in CA but only as a weed, without deliberate human fostering)

#Current Status: 3, accepted name for taxon occurring in CA only as a waif and/or garden escape, not naturalized
#Current Status: 3a, taxonomic or nomenclatural synonym for taxon occurring in CA only as a waif and/or garden escape, not naturalized
#Current Status: 3b, unpublished, invalidly published, illegitimate, or rejected name for for taxon occurring in CA only as a waif and/or garden escape, not naturalized
#Current Status: 4, accepted name for taxon occurring in CA only as an agricultural, garden, or urban weed
#Current Status: 4a, taxonomic or nomenclatural synonym for taxon occurring in CA only as an agricultural, garden, or urban weed - tr (no records)
#Current Status: 4b, unpublished, invalidly published, illegitimate, or rejected name for taxon occurring in CA only as an agricultural, garden, or urban weed
#Current Status: 5, accepted name for taxon occurring in CA only as greenhouse weed - tr (no records)
#Current Status: 5a, taxonomic or nomenclatural synonym for taxon occurring in CA only as greenhouse weed - tr (no records)

#C. Not in CA or in CA only in cultivation, under deliberate human fostering (extirpation intentional or not, of native or alien taxa)

#Current Status: 6, accepted name for taxon extirpated in CA
#Current Status: 6a, taxonomic or nomenclatural synonym for taxon extirpated in CA
#Current Status: 7, accepted name for taxon extinct
#Current Status: 7a, taxonomic or nomenclatural synonym for taxon extinct
#Current Status: 8, accepted name for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
#Current Status: 8a, taxonomic or nomenclatural synonym for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
#Current Status: 8b, unpublished, invalidly published, illegitimate, or rejected name for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
#Current Status: 9, accepted name for plant occurring in CA only under cultivation (e.g., as crop, ornamental, or experimental plant)
#Current Status: 9a, taxonomic or nomenclatural synonym for plant occurring in CA only under cultivation (e.g., as crop, ornamental, or experimental plant)

#D. Special Categories

#Current Status: 10, accepted name for taxonomically recognized and/or fertile hybrid; hybrid form of name
#Current Status: 10a, accepted name for taxonomically recognized and/or fertile hybrid; non-hybrid form of name
#Current Status: 10b, taxononomic or nomenclatural synonym for taxonomically recognized and/or fertile hybrid; hybrid form of name
#Current Status: 10bb, unpublished, invalidly published, illegitimate, or rejected name for taxonomically recognized and/or fertile hybrid; hybrid form of name
#Current Status: 10c, taxonomic or nomenclatural synonym for taxonomically recognized and/or fertile hybrid; non-hybrid form of name
#Current Status: 11, taxonomically not recognized and/or sterile hybrid; hybrid form of name
#Current Status: 11a, taxonomically not recognized and/or sterile hybrid; non-hybrid form of name
#Current Status: 12, quadrinomial treated as trinomial elsewhere in this checklist
#Current Status: 13, represents correction or possible correction only in spelling or rank and treated elsewhere in this checklist
#Current Status: 14, orthographic variant of name treated elsewhere in this checklist
#Current Status: 15, genus name
#Current Status: 16, family name
#Current Status: 17, unpublished, invalidly published, illegitimate, or rejected name for taxon of unknown or uncertain status with respect to the flora of California

sub strip_name_EF{
local($_) = @_;

s/Á/A/g;
s/"//g;
s/\?//g;


s/  +/ /g;
s/^ +//;
s/ +$//;

#fix some special character problems
s/(<#e9>|<#f6>)//g;
s/(â|ä|á)/a/g;
s/(é|è|ë|ê)/e/g;
s/í/i/g;
s/(ń|ñ)/n/g;
s/(ô|ó|ö)/o/g;
s/(ü|ú)/u/g;

#Lotus argophyllus (A. Gray) Greene var. ornithopus (Greene) Ottley X L. dendroideus (Greene) Greene var. traskiae (Noddin) Isely
if(m/^Lotus argophyllus \(A\. Gray\) Greene var\. ornithopus \(Greene\) Ottley( X | &times;) ?L\. /){
	warn "Hybrid problem\t$_";
	#&log_change ("TAXON CCH.pm: Hybrid problem\t$scientificName\t$id\n");
}

if(m/^Fragaria ?.* ?ananassa Duchesne var. cuneifolia ?.*/){
	s/^Fragaria ?.* ?ananassa Duchesne var. cuneifolia ?.*/Fragaria &times;ananassa var. cuneifolia/;
	warn "Hybrid modified\t$_";
	#&log_change ("TAXON CCH.pm: Hybrid modified\t$scientificName\t$id\n");
}	




s/, pro sp\.//g;
s/L\. F\. Hend./Hend./g;
s/S\. F\. Blake/Blake/g;
s/J\. F\. Macbr\./Macbr./g;
#encelioides (Cav.) Benth. & Hook. f. ex A. Gray subsp. exauriculata
s/Hook\. f\. ex A\. Gray/Hook. filius ex A. Gray/i;

#add additional 'filial' authorities at this point so they parse correctly, JAA
s/Ait\. f\./Ait. filius/g;
s/Backh\. f\./Backh. filius/g;
s/Baker f\./Baker filius/g;
s/Bakh\. f\./Bakh. filius/g;
s/Balf\. f\./Balf. filius/g;
s/Burm\. f\./Burm. filius/g;
s/Brunner,? f\./Brunner filius/g;
s/Celakovsky f\./L.F. Celak./g;
s/Delar\. f\./Delar. filius/g;
s/Forst\. f\./Forst. filius/g;
s/Gaertn\. f\./Gaertn. filius/g;
s/Gagnaire f\./Gagnaire filius/g;
s/Haage f\./Haage filius/g;
s/Haller f\./Haller filius/g;
s/Hallier f\./Hallier filius/g;
s/Harr\. f\./Harr. filius/g;
s/Hedw\. f\./Hedw. filius/g;
s/Hirats\. f\./Hirats. filius/g;
s/Hook\. f\./Hook. filius/g;
s/Hooker f\./Hooker filius/g; #some people dont abbreviate Hooker
s/Jacq\. f\./Jacq. filius/g;
s/Kickx f\./Kickx filius/g;
s/Kampm\. f\./Kampm. filius/g;
s/Keng f\./Keng filius/g;
s/Klokov f\./Klokov filius/g;
#s/L\. f\. sulcat/f. sulcat/g;

s/L\. f\. var./L. filius var./g;
s/L\. f\. subsp./L. filius subsp./g;
s/L\. f\./L. filius/g;
s/L\. *filius azure/L. f. azure/g; #fix special cases where L. f. is a forma name not filius, Anagallis arvensis L. f. azurea Hyl.
s/L\. *filius vine/L. f. vine/g; #fix special cases where L. f. is a forma name not filius, Allium vineale L. f. vineale
s/L\. *filius comp/L. f. comp/g; #fix special cases where L. f. is a forma name not filius, Allium vineale L. f. compactum L.
s/L\. *filius tome/L. f. tome/g; #fix special cases where L. f. is a forma name not filius, Acer rubrum L. f. tomemtosum L. 
s/L\. *filius sang/L. f. sang/g; #fix special cases where L. f. is a forma name not filius, Acer negundo L. f. sanguineum L. Martin
s/L\. *filius masc/L. f. masc/g; #fix special cases where L. f. is a forma name not filius, Orchis morio L. f. mascula L.
s/L\. *filius lute/L. f. lute/g; #fix special cases where L. f. is a forma name not filius, Ophrys insectifera L. f. luteomarginata L. Lewis
s/L\. *filius micr/L. f. micr/g; #fix special cases where L. f. is a forma name not filius, Jasminum humile L. f. microphyllum L.C. Chia
s/L\. *filius sask/L. f. sask/g; #fix special cases where L. f. is a forma name not filius, Carex capillaris L. f. saskatschewana (Boeckeler) L.H. Bailey
s/L\. *filius negl/L. f. negl/g; #fix special cases where L. f. is a forma name not filius, Celtis occidentalis L. f. neglecta L.
s/L\. *filius duri/L. f. duri/g; #fix special cases where L. f. is a forma name not filius, Eryngium campestre L. f. duriberum L.
s/L\. *filius glab/L. f. glab/g; #fix special cases where L. f. is a forma name not filius, Dioscorea villosa L. f. glabrata L.
s/L\. *filius prae/L. f. prae/g; #fix special cases where L. f. is a forma name not filius, Silphium trifoliatum L. f. praecisum L.M. Perry
s/L\. *filius pinn/L. f. pinn/g; #fix special cases where L. f. is a forma name not filius, Quercus alba L. f. pinntifida L.
s/L\. *filius sulc/L. f. sulc/g; #fix special cases where L. f. is a forma name not filius, Zostera marina L. f. sulcatifolia Setchell
s/L\. *filius pinn/L. f. vill/g; #fix special cases where L. f. is a forma name not filius, Cardiospermum corindum L. f. villosum (Mill.) Radlk
s/Lestib\. f\./Lestib. filius/g;
s/Lindb\. f\./Lindb. filius/g;
s/Lindm\. f\./Lindm. filius/g;
s/Luer f\./Luer filius/g;
s/Michx\. f\./F. Michx./g;
s/Michaux f\./F. Michx./g;
s/Occhioni f\./Occhioni filius/g;
s/Pearsall f\./Pearsall filius/g;
s/Phil\. f\./Phil. filius/g;
s/Rchb\. f\./Rchb. filius/g;
s/Rech\. f\./Rech. filius/g;
s/Rehb\. f\./Rehb. filius/g;
s/Reichenb\. f\./Reichenb. filius/g;
s/Reichenbach f\./Reichenbach filius/g;
s/Scheuchzer f\./Scheuchzer filius/g;
s/Schultes f\./Schultes filius/g;
s/Schult\. f\./Schult. filius/g;
s/Wallr\. f\./Wallr. filius/g;
s/Wendl\. f\./Wendl. filius/g;

s/&times;/×/g;
#$_=ucfirst(lc($_));
$_=ucfirst($_);
s/,//g; #delete stray commas


s/^([A-Z][A-Za-z-]+) \b([-a-z]+) .* \b(subvar\.|subsp\.|var\.|f\.|nothosubsp\.) \b([-a-z]+) .*/$1 $2 $3 $4/ ||
s/^([A-Z][A-Za-z-]+) \b([-a-z]+) .* \b(subvar\.|subsp\.|var\.|f\.|nothosubsp\.) \b([-a-z]+)/$1 $2 $3 $4/ ||
s/^([A-Z][A-Za-z-]+) \b([-a-z]+) \b(subvar\.|subsp\.|var\.|f\.|nothosubsp\.) \b([-a-z]+) .*/$1 $2 $3 $4/ ||
s/^([A-Z][A-Za-z-]+) \b([-a-z]+) \b(subvar\.|subsp\.|var\.|f\.|nothosubsp\.) \b([-a-z]+)/$1 $2 $3 $4/ ||
s/^([A-Z][A-Za-z-]+) ×([-a-z]+) .+/$1 &times;$2/||
s/^([A-Z][A-Za-z-]+) ×([-a-z]+)/$1 &times;$2/||
s/^([A-Z][A-Za-z-]+) ×([-a-z]+) .+/$1 &times;$2/||
s/^([A-Z][A-Za-z-]+) ×([-a-z]+)/$1 &times;$2/||
s/^([A-Z][A-Za-z-]+) ([-a-z]+) .+/$1 $2/||
s/^([A-Z][A-Za-z-]+) ([-a-z]+)/$1 $2/||
s/^([A-Z][A-Za-z-]+) ([-a-z]+)/$1 $2/||
s/^×([A-Z][a-z-]+) ([-a-z]+) (.+)/&times;$1 $2/||
s/^×([A-Z][a-z-]+) ([-a-z]+)/&times;$1 $2/||
s/  +/ /;
s/ +$//;


#print "$_ \n";
$_;
}



