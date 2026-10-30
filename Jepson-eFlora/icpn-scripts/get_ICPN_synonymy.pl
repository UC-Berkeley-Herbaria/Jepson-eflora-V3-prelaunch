#make taxon id hashes
use lib '/Users/Shared/Jepson-Master/Jepson-eFlora/Modules';
use CCH;

open(IN, "synonymy/input/smasch_taxon_ids.txt") || die;
while(<IN>){
	chomp;
	#s/X /&times;/;
	($smasch_code,$smasch_name,@residue)=split(/\t/);
	$TID{$smasch_name}=$smasch_code;
	$TNOAN{$smasch_code}=$smasch_name;
}
close(IN);


my %OLD;
my %ACC;
my %ICPN;

#as such, it needs to be designated after the TID file is processed

open(IN, "input/icpn_current.txt") || die; #for checking the raw ICPN text file
#open(IN, "output/CPN_out.txt") || die; #for checking the processed ICPN text file
open(OUT, ">output/ICPN_tax_syns_short.txt") || die; #synonyms file with only those names with an accepted name line in ICPN_current
#open(OUT2, ">output/IJM_name_list.txt") || die;  #this file is used in the generation of KML Maps, to be copied to IJM_name_list in Eflora KML directory
open(OUT3, ">output/ICPN_status_list.txt") || die;
open(OUT4, ">output/ICPN_tax_syns_list.txt") || die;


print OUT3 "taxon_name\tICPN_accepted\tstatus\n";

print OUT "taxon_name\tICPN_accepted\tstatus note\n";
print OUT4 "taxon_name\tICPN_accepted\tstatus note\n";

while(<IN>){
local $/=""; #this function indicates the record delimiter. In this case, an empty line

     next if m/^#/; #skip lines that are commented out
     next if m/^Admin/;	#skip lines that start with Admin
  		s/&times;/X /;
	#$taxon_name = &get_taxon_name($_);
	$taxon_name = &get_ICPN_name($_);
	my $accepted = &get_accepted($_);
	my $full_accepted = &get_accepted_all($_);
	my $summary_brief = &get_summary_brief($_);
	my $status = &get_status($_);
	
	my $TJM2_synonyms = &get_syns_TJM2($_);
	my $TJM_synonyms = &get_syns_TJM($_);

$full_accepted =~ s/^\.//; #delete placeholder period before first line
$full_accepted =~ s/&times;/X /;
$taxon_name =~ s/&times;/X /;
my $name = &strip_name($taxon_name);
my $acc = &strip_name($accepted);
my $full_accepted_NOAUTH = &strip_name($full_accepted);

if ($status !~ m/(12, |14, |15, |16, )/){

	print OUT3 $TID{$full_accepted_NOAUTH}."\t".$name."\t".$full_accepted_NOAUTH."\t$status\n";

#if ($status =~ m/8, /){
#print "$name\n\n";
#}
	
}
else {
#print "$name==>problem name\n";
#print "$status\n\n";
}
	
if ($status !~ m/(12, |14, |15, |16, )/){

	if ($status !~ m/misidentification|erroneous report|unresolved|pending|invalidly published/){

		if ($name !~ m/^(Grindelia rubricaulis|Grindelia rubricaulis var\. interioris|Setaria gracilis|Cornus greenei|Lupinus lyallii var\. villosus|Lathyrus bijugatus|Cassiope mertensiana var\. mertensiana|Grindelia rubricaulis f\. pubescens|Phacelia heterosepala)$/){
		#skip these names since they are unresolved names that have an incomplete current name line or names not currently accepted in EFLORA

			if (($name =~ m/^Andersonglossum occidentale$/)  && ($accepted =~ m/NONE/)){#fix a problem name that does not yet have an valid current name line
				$full_accepted_NOAUTH = "Cynoglossum occidentale";
			}

			if (($name =~ m/^Phacelia cicutaria var\. heliophila$/) && ($accepted =~ m/unresolved|NONE/)){#skip a problem name that does not yet have an valid current name line
				$full_accepted_NOAUTH = "Phacelia vallis-mortae";
			}

			if (($name =~ m/^Syrmatium niveum$/) && ($accepted =~ m/unresolved|NONE/)){#skip a problem name that does not yet have an valid current name line
				$full_accepted_NOAUTH = "Acmispon argophyllus var. niveus";
			}

			if (($name =~ m/^Lupinus sparsiflorus var. sparsiflorus$/) && ($accepted =~ m/unresolved|NONE/)){#skip a problem name that does not yet have an valid current name line
				$full_accepted_NOAUTH = "Lupinus sparsiflorus";
			}

			if (($name =~ m/^Pogogyne douglasii subsp\. minor$/) && ($accepted =~ m/unresolved|NONE/)){#skip a problem name that does not yet have an valid current name line
				$full_accepted_NOAUTH = "Pogogyne douglasii";
			}

			if (($name =~ m/^Salvia grahamii$/) && ($accepted =~ m/unresolved|NONE/)){#skip a problem name that does not yet have an valid current name line
				$full_accepted_NOAUTH = "Salvia grahamii";
			}

			if (($name =~ m/^Listera cordata var\. cordata$/) && ($accepted =~ m/unresolved|NONE/)){#skip a problem name that does not yet have an valid current name line
				$full_accepted_NOAUTH = "Listera cordata";
			}

			if (($name =~ m/^Amelanchier utahensis subsp\. utahensis$/) && ($accepted =~ m/unresolved|NONE/)){#skip a problem name that does not yet have an valid current name line
				$full_accepted_NOAUTH = "Amelanchier utahensis";
			}

			if (($name =~ m/^Amelanchier utahensis subsp\. covillei$/) && ($accepted =~ m/unresolved|NONE/)){#skip a problem name that does not yet have an valid current name line
				$full_accepted_NOAUTH = "Amelanchier utahensis";
			}
		#these names are unresolved names that have problematic current name lines that contradicts the accept name in EFLORA
			if (($name =~ m/^Lupinus tidestromii var\. layneae$/) && ($status =~ m/unresolved|NONE|NULL/i)){
				$full_accepted_NOAUTH = "Lupinus tidestromii";
			}
			if (($name =~ m/^Lupinus tidestromii var\. tidestromii$/) && ($status =~ m/unresolved|NONE|NULL/i)){
				$full_accepted_NOAUTH = "Lupinus tidestromii";
			}
			if (($name =~ m/^Lupinus sparsiflorus var\. inopinatus$/) && ($status =~ m/unresolved|NONE|NULL/i)){
				$full_accepted_NOAUTH = "Lupinus sparsiflorus";
			}
			if (($name =~ m/^Lupinus sparsiflorus subsp\. inopinatus$/) && ($status =~ m/unresolved|NONE|NULL/i)){
				$full_accepted_NOAUTH = "Lupinus sparsiflorus";
			}
			if (($name =~ m/^Lupinus sparsiflorus subsp\. mohavensis$/) && ($status =~ m/unresolved|NONE|NULL/i)){
				$full_accepted_NOAUTH = "Lupinus sparsiflorus";
			}
			if (($name =~ m/^Lupinus sparsiflorus subsp\. pondii$/) && ($status =~ m/8, |unresolved|NONE|NULL/i)){
				$full_accepted_NOAUTH = "Lupinus sparsiflorus";
			}
			if (($name =~ m/^Lupinus sparsiflorus subsp\. sparsiflorus$/) && ($status =~ m/unresolved|NONE|NULL/i)){
				$full_accepted_NOAUTH = "Lupinus sparsiflorus";
			}
			if (($name =~ m/^Amelanchier utahensis var\. covillei$/) && ($status =~ m/unresolved|NONE|NULL/i)){
				$full_accepted_NOAUTH = "Amelanchier utahensis";
			}
			if (($name =~ m/^Amelanchier utahensis var\. utahensis$/) && ($status =~ m/unresolved|NONE|NULL/i)){
				$full_accepted_NOAUTH = "Amelanchier utahensis";
			}
			if (($name =~ m/^Amelanchier pallida$/) && ($status =~ m/unresolved|NONE|NULL/i)){
				$full_accepted_NOAUTH = "Amelanchier utahensis";
			}
			if (($name =~ m/^Cassiope mertensiana subsp\. californica$/) && ($status =~ m/unresolved|NONE|NULL/i)){
				$full_accepted_NOAUTH = "Cassiope mertensiana";
			}
			if (($name =~ m/^Cassiope mertensiana subsp\. ciliolata$/) && ($status =~ m/unresolved|NONE|NULL/i)){
				$full_accepted_NOAUTH = "Cassiope mertensiana";
			}
			if (($name =~ m/^Cassiope mertensiana subsp\. mertensiana$/) && ($status =~ m/unresolved|NONE|NULL/i)){
				$full_accepted_NOAUTH = "Cassiope mertensiana";
			}
			if (($name =~ m/^Grindelia procera$/) && ($status =~ m/tentative 1a/i)){
				$full_accepted_NOAUTH = "Grindelia camporum";
			}

			#print OUT2 $full_accepted_NOAUTH."\n";
		}	
	}

	if ($status =~ m/misidentification|erroneous report|unresolved|pending|invalidly published/){
		$status_exception = $status;
	}
	else{
		$status_exception = "";
	}

			if (($name =~ m/^Andersonglossum occidentale$/)  && ($accepted =~ m/NONE/)){#fix a problem name that does not yet have an valid current name line
				$full_accepted_NOAUTH = "Cynoglossum occidentale";
			}

			if (($name =~ m/^Phacelia cicutaria var\. heliophila$/) && ($accepted =~ m/unresolved|NONE|NULL/i)){#skip a problem name that does not yet have an valid current name line
				$full_accepted_NOAUTH = "Phacelia vallis-mortae";
			}

			if (($name =~ m/^Syrmatium niveum$/) && ($accepted =~ m/unresolved|NONE|NULL/i)){#skip a problem name that does not yet have an valid current name line
				$full_accepted_NOAUTH = "Acmispon argophyllus var. niveus";
			}

			if (($name =~ m/^Lupinus sparsiflorus var. sparsiflorus$/) && ($accepted =~ m/unresolved|NONE|NULL/i)){#skip a problem name that does not yet have an valid current name line
				$full_accepted_NOAUTH = "Lupinus sparsiflorus";
			}

			if (($name =~ m/^Pogogyne douglasii subsp\. minor$/) && ($accepted =~ m/unresolved|NONE|NULL/i)){#skip a problem name that does not yet have an valid current name line
				$full_accepted_NOAUTH = "Pogogyne douglasii";
			}

			if (($name =~ m/^Salvia grahamii$/) && ($accepted =~ m/uunresolved|NONE|NULL/i)){#skip a problem name that does not yet have an valid current name line
				$full_accepted_NOAUTH = "Salvia grahamii";
			}

			if (($name =~ m/^Listera cordata var\. cordata$/) && ($accepted =~ m/unresolved|NONE|NULL/i)){#skip a problem name that does not yet have an valid current name line
				$full_accepted_NOAUTH = "Listera cordata";
			}

			if (($name =~ m/^Amelanchier utahensis subsp\. utahensis$/) && ($accepted =~ m/unresolved|NONE|NULL/i)){#skip a problem name that does not yet have an valid current name line
				$full_accepted_NOAUTH = "Amelanchier utahensis";
			}

			if (($name =~ m/^Amelanchier utahensis subsp\. covillei$/) && ($accepted =~ m/unresolved|NONE|NULL/i)){#skip a problem name that does not yet have an valid current name line
				$full_accepted_NOAUTH = "Amelanchier utahensis";
			}
		#these names are unresolved names that have problematic current name line that contradicts the accept name in EFLORA
			if (($name =~ m/^Lupinus tidestromii var\. layneae$/) && ($status =~ m/unresolved|NONE|NULL/i)){
				$full_accepted_NOAUTH = "Lupinus tidestromii";
				$status_exception = $status."; Current Status 'unresolved' in ICPN and Current Name conflicts with EFLORA, Current Name in EFLORA used as replacement";
			}
			if (($name =~ m/^Lupinus tidestromii var\. tidestromii$/) && ($status =~ m/unresolved|NONE|NULL/i)){
				$full_accepted_NOAUTH = "Lupinus tidestromii";
				$status_exception = $status."; Current Status 'unresolved' in ICPN and Current Name conflicts with EFLORA, Current Name in EFLORA used as replacement";
			}
			if (($name =~ m/^Lupinus sparsiflorus var\. inopinatus$/) && ($status =~ m/unresolved|NONE|NULL/i)){
				$full_accepted_NOAUTH = "Lupinus sparsiflorus";
				$status_exception = $status."; Current Status 'unresolved' in ICPN and Current Name conflicts with EFLORA, Current Name in EFLORA used as replacement";
			}
			if (($name =~ m/^Lupinus sparsiflorus subsp\. inopinatus$/) && ($status =~ m/unresolved|NONE|NULL/i)){
				$full_accepted_NOAUTH = "Lupinus sparsiflorus";
				$status_exception = $status."; Current Status 'unresolved' in ICPN and Current Name conflicts with EFLORA, Current Name in EFLORA used as replacement";
			}
			if (($name =~ m/^Lupinus sparsiflorus subsp\. mohavensis$/) && ($status =~ m/unresolved|NONE|NULL/i)){
				$full_accepted_NOAUTH = "Lupinus sparsiflorus";
				$status_exception = $status."; Current status 'unresolved' in ICPN, Current Name in EFLORA used as replacement";
			}
			if (($name =~ m/^Lupinus sparsiflorus subsp\. pondii$/) && ($status =~ m/8, |unresolved|NONE|NULL/i)){
				$full_accepted_NOAUTH = "Lupinus sparsiflorus";
				$status_exception = $status."; last revised in 2002 when subtaxa within Lupinus sparsiflorus were recognized; as an accepted name, this conflicts now with the EFLORA, since this species no longer has subtaxa";
				print OUT "Lupinus sparsiflorus var\. pondii\tLupinus sparsiflorus\tSYNONYM, NOT in ICPN and EFLORA, NOT IN CALIFORNIA\n";
			}
			if (($name =~ m/^Lupinus sparsiflorus subsp\. sparsiflorus$/) && ($status =~ m/unresolved|NONE|NULL/i)){
				$full_accepted_NOAUTH = "Lupinus sparsiflorus";
				$status_exception = $status."; Current Status 'unresolved' in ICPN and Current Name conflicts with EFLORA, Current Name in EFLORA used as replacement";
			}
			if (($name =~ m/^Amelanchier utahensis var\. covillei$/) && ($status =~ m/unresolved|NONE|NULL/i)){
				$full_accepted_NOAUTH = "Amelanchier utahensis";
				$status_exception = $status."; Current Status 'unresolved' in ICPN and Current Name conflicts with EFLORA, Current Name in EFLORA used as replacement";
			}
			if (($name =~ m/^Amelanchier utahensis var\. utahensis$/) && ($status =~ m/unresolved|NONE|NULL/i)){
				$full_accepted_NOAUTH = "Amelanchier utahensis";
				$status_exception = $status."; Current Status 'unresolved' in ICPN and Current Name conflicts with EFLORA, Current Name in EFLORA used as replacement";
			}
			if (($name =~ m/^Amelanchier pallida$/) && ($status =~ m/unresolved|NONE|NULL/i)){
				$full_accepted_NOAUTH = "Amelanchier utahensis";
				$status_exception = $status."; Current Status 'unresolved' in ICPN and Current Name conflicts with EFLORA, Current Name in EFLORA used as replacement";
			}
			if (($name =~ m/^Cassiope mertensiana subsp\. californica$/) && ($status =~ m/unresolved|NONE|NULL/i)){
				$full_accepted_NOAUTH = "Cassiope mertensiana";
				$status_exception = $status."; Current Status 'unresolved' in ICPN and Current Name conflicts with EFLORA, Current Name in EFLORA used as replacement";
			}
			if (($name =~ m/^Cassiope mertensiana subsp\. ciliolata$/) && ($status =~ m/unresolved|NONE|NULL/i)){
				$full_accepted_NOAUTH = "Cassiope mertensiana";
				$status_exception = $status."; Current Status 'unresolved' in ICPN and Current Name conflicts with EFLORA, Current Name in EFLORA used as replacement";
			}
			if (($name =~ m/^Cassiope mertensiana subsp\. mertensiana$/) && ($status =~ m/unresolved|NONE|NULL/i)){
				$full_accepted_NOAUTH = "Cassiope mertensiana";
				$status_exception = $status."; Current Status 'unresolved' in ICPN and Current Name conflicts with EFLORA, Current Name in EFLORA used as replacement";
			}
			if (($name =~ m/^Grindelia procera$/) && ($status =~ m/tentative 1a/i)){
				$full_accepted_NOAUTH = "Grindelia camporum";
				$status_exception = $status."; Source only from SMASCH, Current Status not recently updated in ICPN, and Current Name conflicts with EFLORA, Current Name in EFLORA used as replacement";
			}



		#these names are unresolved names that have problematic current name line with more than one taxon name or other text
			if (($name =~ m/^Phacelia heterosepala$/) && ($status =~ m/nomenclatural synonym/)){
				$full_accepted_NOAUTH = "Phacelia cicutaria";
				$status_exception = $status."; Current Name line 'unresolved' in ICPN, Current Name in EFLORA used as replacement";
			}
			if (($name =~ m/^Setaria gracilis$/) && ($status =~ m/nomenclatural synonym/)){
				$full_accepted_NOAUTH = "Setaria parviflora";
				$status_exception = $status."; Current Name line missing in ICPN, but synonym line present in Setaria parviflora";
			}
			if (($name =~ m/^Cornus greenei$/) && ($status =~ m/nomenclatural synonym/)){
				$full_accepted_NOAUTH = "Cornus sericea subsp. sericea";
				$status_exception = $status."; Current Name line missing in ICPN, but suggested in comments";
			}
			if (($name =~ m/^Lupinus lyallii var\. villosus$/) && ($status =~ m/nomenclatural synonym/)){
				$full_accepted_NOAUTH = "Lupinus lepidus var. lobbii";
				$status_exception = $status."; Current Name line 'unresolved' in ICPN, but suggested in comments";
			}
			if (($name =~ m/^Lathyrus bijugatus$/) && ($status =~ m/nomenclatural synonym/)){
				$full_accepted_NOAUTH = "Lathyrus lanszwertii var. lanszwertii";
				$status_exception = $status."; SYNONYM, EXCLUDED in ICPN and EFLORA, NOT IN CALIFORNIA, Current Name line 'unresolved' in ICPN";
				#add one additional record, this taxon is split into two subtaxa, adding the typical one here
				print OUT "Lathyrus bijugatus var. bijugatus\tLathyrus lanszwertii var. lanszwertii\tSYNONYM, NOT in ICPN and EFLORA, NOT IN CALIFORNIA\n";
				print OUT4 "Lathyrus bijugatus var. bijugatus\tLathyrus lanszwertii var. lanszwertii\tSYNONYM, NOT in ICPN and EFLORA, NOT IN CALIFORNIA\n";
			}
			if (($name =~ m/^Cassiope mertensiana var\. mertensiana$/) && ($status =~ m/nomenclatural synonym/)){
				$full_accepted_NOAUTH = "Cassiope mertensiana";
				$status_exception = $status."; Current Name line 'unresolved' in ICPN, but suggested in comments"
			}
			if (($name =~ m/^Grindelia rubricaulis$/) && ($status =~ m/tentative 1a, taxonomic/)){
				$full_accepted_NOAUTH = "Grindelia hirsutula";
				$status_exception = $status."; Current Name as Grindelia hirsutula var. hirsutula in ICPN, but subtaxa not recognized in EFLORA";
			}
			if (($name =~ m/^Grindelia rubricaulis f\. pubescens$/) && ($status =~ m/tentative 1a, taxonomic/)){
				$full_accepted_NOAUTH = "Grindelia hirsutula";
				$status_exception = $status."; Current Name as Grindelia (without a species epithet) in ICPN";
			}
			if (($name =~ m/^Grindelia rubricaulis var\. interioris$/) && ($status =~ m/tentative 1a, taxonomic/)){
				$full_accepted_NOAUTH = "Grindelia camporum";
				$status_exception = $status."; Current Name as Grindelia hirsutula var. davyi in ICPN, but the current name for that 'var. davyi' is Grindelia camporum in EFLORA";
			}
	  
	  print OUT "$name\t$full_accepted_NOAUTH\t$status_exception\n";
	  print OUT4 "$name\t$full_accepted_NOAUTH\t$status_exception\n";
							


}


}
close (IN);
close (OUT);
#close (OUT2);
close (OUT3);


open(IN, "output/ICPN_tax_syns_short.txt") || die;
while(<IN>){
	chomp;
	#s/X /&times;/;
	($i,$iacc,@residue)=split(/\t/);
	$OLD{$i}=$i;

foreach ($i){
print "FOUND $i\n";
}

}
close(IN);

open(IN, "/Users/Shared/Jepson-Master/Jepson-eFlora/eflora_database/output/accepted_name_list.txt") || die;
while(<IN>){
	chomp;
	#s/X /&times;/;
	($e)=split(/\n/);
	$ACC{$e}++;
foreach ($e){
#print "ACCEPTED $e\n";
}

}
close(IN);



open(IN, "input/icpn_current.txt") || die; #for checking the raw ICPN text file
#open(IN, "output/CPN_out.txt") || die; #for checking the processed ICPN text file
open(OUT, ">>output/ICPN_tax_syns_list.txt") || die; #only synonyms specified in the synonyms 

while(<IN>){
local $/="";
     next if m/^#/; #skip lines that are commented out
     next if m/^Admin/;	#skip lines that start with Admin
  
	#$taxon_name = &get_taxon_name($_);
	$taxon_name = &get_ICPN_name($_);
	my $accepted = &get_accepted($_);
	my $full_accepted = &get_accepted_all($_);

	my $TJM2_synonyms = &get_syns_TJM2($_);

$full_accepted =~ s/^\.//; #delete placeholder period before first line
$full_accepted =~ s/&times;/X /;
$taxon_name =~ s/&times;/X /;

my $name = &strip_name($taxon_name);
my $full_accepted_NOAUTH = &strip_name($full_accepted);

		if($TJM2_synonyms){
			#print "$TJM2_synonyms\n";
			$TJM2_synonyms =~ s/E\. (tolmiei Benth.+)M\. (tolmiei.+)/Eunanus $1Mimulus $2/;
			$TJM2_synonyms =~ s/&times;/X /;
			
			$status_new = "synonym from 'Current JFP synonyms' line, NAME NOT in ICPN";
				@syns=split(/; /,$TJM2_synonyms);
						foreach my $TJM2_full (@syns) {
								$TJM2_full =~ s/Carex\. heteroneura/Carex heteroneura/;
								$TJM2_full =~ s/, Modoc cypress//;
								$TJM2_full =~ s/, Siskiyou cypress//;
								$TJM2_full =~ s/virgata Greene var..+bernardina/virgata var. bernardina/;
								$TJM2_full =~ s/Coville forma egena Brand/Coville f. egena Brand/;
								$TJM2_full =~ s/occidentalis forma inopina Jeps/occidentalis f. inopina Jeps/;
								next if($TJM2_full =~ m/see also Landolt/);
								next if($TJM2_full =~ m/Cheva.+not seen by Editor/);
								next if($TJM2_full =~ m/^none$/i);								
								next if($TJM2_full =~ m/^from WW, .*/);#delete a note from the old TJM where the TJM current name does not match the TJM2 current name
								next if($TJM2_full =~ m/(,? nom. superfl|,? comb. superfl|,? nom. ambig|,? inval\.|,? orth\. var|,? in part|,? nom\. nud\.|as used by Munz)/);
										#'as used by Munz' synonyms imply others treat this differently, these are skipped here and treated in other files
								next if($TJM2_full =~ m/(auct\., non|,? nom\. rej|,? ined.|,? illeg| illegitimate|,? nom\. illeg|,? nom. inval)/);
								next if($TJM2_full =~ m/^from WW, .+/);#delete a note from the old TJM where the TJM current name does not match the TJM2 current name
								next if($TJM2_full =~ m/(of pre-1969 California authors|of pre-1989 authors|of pre-2004 California authors|of authors|documentation yet to be seen|documentation not yet seen|documentation probably to follow, at which time this)/);
							my $TJM2_syn = &strip_name($TJM2_full);
$TJM2_syn =~ s/^ +//;
$TJM2_syn =~ s/ +$//;
							#print "FOUND==>$TJM2_syn\n";
							$found = $OLD{$TJM2_syn};
							$accepted = $ACC{$TJM2_syn};
							#print "FOUND==>$found\n" if $found;
							#print "ACCEPTED==>$accepted\n" if $accepted;
								if ($OLD{$TJM2_syn}){
									#print "SKIPPING TJM2 synonym with an ICPN entry==>$TJM2_syn\t$full_accepted_NOAUTH\n";
								}
								elsif ($ACC{$TJM2_syn}){
									#print "SKIPPING PROBLEM TJM2 synonym with an eFlora accepted name entry==>$TJM2_syn\t$full_accepted_NOAUTH\n";
								}
								else{
									print OUT "$TJM2_syn\t$full_accepted_NOAUTH\t$status_new\n" unless $seen{$TJM2_syn};
									#print "TJM2 synonym without an ICPN entry==>$TJM2_syn\t$full_accepted_NOAUTH\n";
								}	
							
						}
		}


}
close (IN);
close (OUT);

#die;

open(IN, "output/ICPN_tax_syns_list.txt") || die;
while(<IN>){
	chomp;
	#s/X /&times;/;
	($jname,$jacc,@residue)=split(/\t/);
	$ICPN{$jname}=$jname;

foreach ($jname){
print "TEST $jname\n";
}


}
close(IN);


open(IN, "input/icpn_current.txt") || die; #for checking the raw ICPN text file
#open(IN, "output/CPN_out.txt") || die; #for checking the processed ICPN text file
open(OUT, ">>output/ICPN_tax_syns_list.txt") || die; #full ICPN synonym list used by yellow flagging

while(<IN>){
local $/="";
     next if m/^#/; #skip lines that are commented out
     next if m/^Admin/;	#skip lines that start with Admin
  
	#$taxon_name = &get_taxon_name($_);
	$taxon_name = &get_ICPN_name($_);
	my $accepted = &get_accepted($_);
	my $full_accepted = &get_accepted_all($_);

	my $TJM_synonyms = &get_syns_TJM($_);

$full_accepted =~ s/^\.//; #delete placeholder period before first line
$full_accepted =~ s/&times;/X /;
$taxon_name =~ s/&times;/X /;

my $name = &strip_name($taxon_name);
my $full_accepted_NOAUTH = &strip_name($full_accepted);

#In old file but not in new, needs resolved:
#Acrachne racemosa       ffffffff07
#Aira caryophyllea var. cupaniana        ffffffff07
#Amphibromus neesii      ffffffff07


#these names have old TJM synonyms that conflict with current TJM synonyms, causing duplicate records in synonym file with a different DIST CODE
	if($name =~m/^(Aloe X schoenlandii|Agave utahensis|Agoseris apargioides var. apargioides|Agoseris apargioides)$/){
		print "before $name==>$TJM_synonyms\n";
		$TJM_synonyms = "";
		print "after $name==>$TJM_synonyms\n";
	}
	elsif($name =~m/^Amsinckia menziesii var. menziesii$/){
		$TJM_synonyms = "Amsinckia micrantha Suksd.";
	}




		if($TJM_synonyms){


			$TJM_synonyms =~ s/&times;/X /;
			#print "$TJM_synonyms\n";

			$TJM_synonyms =~ s/Opuntia rhodantha K\. Schum\., Opuntia xanthostemma/Opuntia rhodantha K. Schum.; Opuntia xanthostemma/; #fix a comma that is supposed to be a ';' that is interfering with parsing
			$status_new = "synonym from 'TJM synonyms' line, NAME NOT in ICPN";
				@syns_tjm=split(/; /,$TJM_synonyms);

						foreach my $TJM_full (@syns_tjm) {

								next if($TJM_full =~ m/^none$/i);
								$TJM_full =~ s/Coville forma egena Brand/Coville f. egena Brand/;
								$TJM_full =~ s/, Modoc cypress//;
								$TJM_full =~ s/, Siskiyou cypress//;
								$TJM_full =~ s/Carex\. heteroneura/Carex heteroneura/;
								$TJM_full =~ s/virgata Greene var..+bernardina/virgata var. bernardina/;
								$TJM_full =~ s/L. arenicola(.+Heller)/Lupinus arenicola$1/; #fix some unexpanded genus names
								$TJM_full =~ s/L. densiflorus var. glareosus(.+ Sm\.)/Lupinus densiflorus var. glareosus$1/;
								$TJM_full =~ s/occidentalis forma inopina Jeps/occidentalis f. inopina Jeps/;
								next if($TJM_full =~ m/see also Landolt/);
								next if($TJM_full =~ m/Cheva.+not seen by Editor/);
								next if($TJM_full =~ m/(,? nom. superfl|,? comb. superfl|,? nom. ambig|,? inval\.|,? orth\. var|,? in part|,? nom\. nud\.|as used by Munz)/);
										#'as used by Munz' synonyms imply others treat this differently, these are skipped here and treated in other files
								next if($TJM_full =~ m/(auct\., non|,? nom\. rej|,? ined.|,? illeg| illegitimate|,? nom\. illeg|,? nom. inval)/);
								next if($TJM_full =~ m/^from WW, .+/);#delete a note from the old TJM where the TJM current name does not match the TJM2 current name
								next if($TJM_full =~ m/(of pre-1969 California authors|of pre-1989 authors|of pre-2004 California authors|of authors|documentation yet to be seen|documentation not yet seen|documentation probably to follow, at which time this)/); #delete another note with an imbedded ';' that is messing up parsing
								next if($TJM_full =~ m/for various phases: Trifolium.+/); #delete the T. variegatum phrase synonymy note
								next if($TJM_full =~ m/Psoralea physodes Hook./); #slip this name, since it will be a duplicate with stripped authors
								next if($TJM_full =~ m/see entry for Lupinus/); #delete another note with an imbedded ';' that is messing up parsing
								next if($TJM_full =~ m/listed under Opuntia.+vaseyi/); #delete another note that is messing up parsing, and it is a duplicate synonym
								next if($TJM_full =~ m/.not in IPNI as of 3/); #delete another note with an imbedded ';' that is messing up parsing


								$TJM_full =~ s/.+(Plantago major L\. var\. pilgeri .+)/$1/; #fix a problematic note before the taxon name
							my $TJM_syn = &strip_name($TJM_full);

$TJM_syn =~ s/^ +//;
$TJM_syn =~ s/ +$//;

							#print "FOUND==>$TJM2_syn\n";
							$found = $OLD{$TJM_syn};
							$accepted = $ACC{$TJM_syn};
							#print "FOUND==>$found\n" if $found;
							#print "ACCEPTED==>$accepted\n" if $accepted;

							#print "FOUND==>$TJM_syn\n";
								if ($OLD{$TJM_syn}){
									#print "SKIPPING TJM synonym with an ICPN entry==>$TJM_syn\t$full_accepted_NOAUTH\n";
									
									
								}
								elsif ($ACC{$TJM_syn}){
									#print "SKIPPING TJM synonym is an accepted name in ICPN==>$TJM_syn\t$full_accepted_NOAUTH\n";
									
								}
								elsif ($ICPN{$TJM_syn}){
									#print "SKIPPING TJM synonym with a TJM2 synonym in ICPN==>$TJM_syn\t$full_accepted_NOAUTH\n";
									
								}
								else{
									next if $TJM_syn =~ m/^(Aloe saponaria)$/;  #
									print OUT "$TJM_syn\t$full_accepted_NOAUTH\t$status_new\n" unless $seen_TJM{$TJM_syn};
									#print "TJM synonym without an ICPN entry==>$TJM_syn\t$full_accepted_NOAUTH\n";
								}	
							
						}
		}


}
#warn "copy IJM_name_list to the data_inputs directory for KML file generation on Annie.";

close (IN);
close (OUT);


sub get_taxon_name {
    my $par = shift; #each paragraph is separated by a blank line
    @lines=split(/\n/,$par); #the array of lines within a paragraph are values separated by a new line
    if( $lines[0]=~/(X? ?[A-Z][a-z-]+ .+)/){ #if the first line starts with...
    	return $1; #the name is the contents of the first line
        
    }
	else{
		return "Problem T Name==>$lines[0]";
		print "Problem T Name==>$lines[0]";
	}
}


sub get_ICPN_name {
		my $par = shift;
		@lines=split(/\n/,$par);
		if($lines[0] =~ m/^\.(.+)/){
			
			return $1; #the name is the contents after the period
		}
		else{
			return "Problem I name";
			print "Problem I Name==>$lines[0]";
		}
}


sub get_summary_brief {
		my $par = shift;
		if($par=~/Summary: ([A-Za-z ]+),/){
			return $1; #the name is the contents of the second line
		}
		else {
			return "NULL";
		}
}

sub get_status {
		my $par = shift;
		if($par=~/Current Status: (.+)/){
			return $1; #the name is the contents of the second line
		}
		else {
			return "NULL";
		}
}

sub get_accepted {
		my $par = shift;
		if($par=~/Current Name: (.+)/){
			return $1; #the name is the contents of the second line
		}
		elsif($par=~/Current Name \(T\): (.+)/){
			return $1; #the name is the contents of the second line
		}
		elsif($par=~/Current Status: 8.+accepted name/){
			$accepted = "NOT IN CA";
		}
		elsif($par=~/Current Status: .+accepted name/){
			$accepted = "ICPN accepted";
		}
		elsif($par=~/Current Status: .+sterile hybrid/){
			$accepted = "sterile hybrid";
		}
		elsif($par=~/Current Status: .+fertile hybrid/){
			$accepted = "fertile hybrid";
		}
		else{
			$accepted = "NONE";
		}
}

sub get_accepted_all {
		my $par = shift;
		if($par=~/\nCurrent Status: 8, accep.+/){#accepted names for plants not in CA
			$full_accepted = $lines[0]."\tEXCLUDED in ICPN and EFLORA, NOT IN CALIFORNIA";
		}
		elsif($par=~/\nCurrent Status: 8a.+/){#accepted names for plants not in CA
			if($par=~/\nCurrent Name: (.+)/){
				$full_accepted = $1."\tSYNONYM, EXCLUDED in ICPN and EFLORA, NOT IN CALIFORNIA"; #the name is the contents of the second line
			}
			else{
				$full_accepted = "NULL (EXCLUDED SYNONYM in ICPN without entry in Current Name)";
			}
		}
		elsif($par=~/\nCurrent Name: (.+)/){
			$full_accepted  = $1; #the name is the contents of the second line
		}
		elsif($par=~/\nCurrent Name \(T\): (.+)/){
			$full_accepted = $1; #the name is the contents of the second line
		}
		elsif($par=~/\nCurrent Status: .+accepted name/){
			$full_accepted = $lines[0];
		}
		elsif($par=~/\nCurrent Status: .+sterile hybrid/){
			$full_accepted = $lines[0];
		}
		elsif($par=~/\nCurrent Status: .+fertile hybrid/){
			$full_accepted = $lines[0];
		}
		elsif($par=~/\nCurrent Status: 3[abc]/){
			$full_accepted = $lines[0];
		}
		elsif($par=~/\nCurrent Status: unresolved/){
			$full_accepted = $lines[0]."\t(UNRESOLVED in ICPN, not in EFLORA)";
		}
		elsif($par=~/\nCurrent Status: .+erroneous reports/){
			$full_accepted = "NULL (EXCLUDED erroneous reports Problem to investigate)";
		}
		else{
			$full_accepted = "NONE";
		}
}


sub get_accepted_strip {
		my $par = shift;
		@lines=split(/\n/,$par); #the array of lines within a paragraph are values separated by a new line
		if($par=~/(Curr.+ame:) ([A-Z].+)/){
			$taxon_acc = $2;
			
		}
		
		elsif($par=~/(Curr.+ame \(T\):) ([A-Z].+)/){
			$taxon_acc = $2; #the name is the contents of the second line
			
		}
		elsif($par=~/Current Status.+accepted name/){
		$taxon_acc = $lines[0];
		}
		else{
		$taxon_acc = "Current status or name missing: $lines[0]";
		}

		
if ($taxon_acc =~ m/Encelia farinosa A. Gray ex Torr. X Encelia frutescens/){ #the spontaneous hybrid is kluged because there is only one and it's awkward
	$full_accepted_NOAUTH = "Encelia farinosa X Encelia frutescens";
}

elsif ($taxon_acc =~ /([A-Z]+) ([a-z-]+) (.+) (var\.|subsp\.) ([a-z-]+)$/){ #if it is an infra with an author inserted (that's the ".+")

	$genus = ucfirst(lc($1));
	$species = $2;
	$species_author = $3;
	$infra_rank = $4;
	$infra_epithet = $5;
	$taxon_acc=ucfirst(lc($taxon_acc));
	$taxon_acc=&strip_name($taxon_acc);
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
	$taxon_acc=&strip_name($taxon_acc);
	$full_accepted_NOAUTH = $taxon_acc;
	
}


}
sub get_syns_TJM2 {
		my $par = shift;
		if($par=~/Current JFP synonyms: ([A-Z].+)\n/){
			$TJM2_synonyms = $1;
		}

}
sub get_syns_TJM {
		my $par = shift;
		if($par=~/TJM synonyms: ([A-Z].+)\n/){
			$TJM_synonyms = $1;
		}

}

#if(m/Current JFP synonyms: (.*)/){
#$syns=$1;
#@syns=split(/; /,$syns);
#}
#elsif(m/TJM synonyms: (.*)/){
#if(m/TJM synonyms: (.*)/){
#$syns=$1;
#push(@syns,split(/; /,$syns));
#@syns=split(/; /,$syns);
#print @syns,"\n";
#}
#if(m/Current Name: (.*)/){
#push(@syns,$1);
#print @syns,"\n";
#}
