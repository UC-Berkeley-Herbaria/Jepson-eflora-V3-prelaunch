
open(IN, "../Jepson-eFlora/synonymy/input/smasch_taxon_ids.txt") || die;
while(<IN>){
	chomp;
	($code,$name,@residue)=split(/\t/);
	$TID{$name}=$code;
	$TNOAN{$code}=$name;
}
close (IN);

open(ERR, ">output/check_sn_error.txt") || die;
open(NOCODE, ">output/check_sn_no_code.txt") || die;


open(OUT, ">output/CPN_out.txt") || die;
open(OUT2, ">output/current_names.txt") || die;

undef ($/);
local($/)="";
foreach(@ARGV){
	$file=$_;
	open(IN,$file) || die "couldn't open $file\n";

while(<IN>){

	#s/=====.*\n.//;
	s/=====.+\n//;

	s/LINK.*FNA.*\n//;
	s/LINK.*Check the California Weed.*\n//;
	s/  +/ /g;
	s/ $//;
	s/ \n/\n/g;
s/(...)Effort: @/$1\nEffort: @/;

	if(m/^(\.Admin|#)/){
		next;
	}


	if(m/Previous JFP synonyms/){
		next;
	}


	#if(m/^[A-Z][A-Z][A-Z]/){
	#	print OUT;
	#	next;
	#}
	
	if(m/Current Status: 13/){
		++$count;
		#print "$count\n";
		next;
	}

	if(m/Current Status: 12/){ #skip quadrinomials since they will not strip correctly
		++$count1;
		print ERR "Quandrinomials found: $count1\n$_\n\n";
		print "Quandrinomials found: $count1\n\n";
		next;
	}

	if (m/\.Anagallis caerulea Lam/){
		print ERR "skipping JFP 8 accepted name 'Anagallis caerulea Lam.' that conflicts with the TJM synonym 'Anagallis caerulea L.'\n";
		warn "4. skipping JFP 8 accepted name 'Anagallis caerulea Lam.' that conflicts with the TJM synonym 'Anagallis caerulea L.'\n";
		next;
	}


	if (m/\.Streptanthus lemmonii Jepson 1920/){ #skip this homonym entry as we can only load a genus species once in this version of the ICPN
		++$count5;
		print ERR "skipping Streptanthus lemmonii Jepson 1920\n";
		warn $count5." skipping Streptanthus lemmonii Jepson 1920\n\n";
		next;
	}

	#if (m/\.Oreocarya nubigena Greene/){ #skip this duplicate entry
		#if (m/Source: SMASCH types table/){

			#++$count5;
			#print ERR "skipping Oreocarya nubigena Greene duplicate\n";
			#warn $count5." skipping Oreocarya nubigena Greene duplicate\n\n";
			#next;
		#}
	#}
#Family: BORAGINACEAE
#Source: SMASCH types table
#Current Status: tentative 1a, taxonomic or nomenclatural synonym for taxon native to CA
#Current Name (T): Cryptantha nubigena

	#if (m/\.Andersonglossum occidentale (A\. Gray) J\.I\. Cohen/){ #skip this duplicate entry
		#if (m/Current Status: 1a/){
		#	++$count5;
		#	print ERR "skipping Andersonglossum occidentale duplicate\n";
		#	warn $count5." skipping Andersonglossum occidentale duplicate\n\n";
		#	next;
		#}
	#}


	if (m/\.Linanthus aureus (Nutt.) Greene/){ #skip this homonym entry
		++$count5;
		print ERR "skipping Linanthus aureus (Nutt.) Greene\n";
		warn $count5." skipping Linanthus aureus (Nutt.) Greene\n\n";
		next;
	}

	if (m/\.Trifolium variegatum Nutt\. phase/){ #skip Trifolium phase names since they will not strip correctly nor will synonymy assign correctly
		++$count2;
		print ERR "skipping Trifolium phase name\n";
		warn $count2." skipping Trifolium phase name\n\n";
		next;
	}

	if(m/(\.Encelia californica &times; ?Encelia farinosa|Aloe saponaria \(Aiton\) Haw\. &times;Aloe striata|Encelia farinosa .+ &times; ?Encelia frutescens|Spartina alterniflora .+ &times; ?Spartina foliosa)/){
		++$count3;
		print ERR "skipping hybrid entry: $1\n";
		warn $count3.". skipping hybrid entry: $1\n\n";
		next;
	}

	if(m/(\.Lotus argophyllus \(A\. Gray\) Greene var\. ornithopus \(Greene\) Ottley &times;L\. dendroideus)/){
		++$count4;
		print ERR "skipping hybrid entry: $1\n";
		warn $count4." skipping hybrid entry: $1\n\n";
		next;
	}

	if(m/(Mimulus end)/){
		print ERR "skipping placeholder $1\n";
		warn "skipping placeholder $1\n";
		next;
	}
	if(m/(Mimulus beginning)/){
		print ERR "skipping placeholder $1\n";
		warn "skipping placeholder $1\n";
		next;
	}

	if(m/(\.Z+e+ End)/){
		print ERR "skipping placeholder $1\n";
		warn "skipping placeholder $1\n";
		next;
	}


	s/^x?\.//; #Get rid of leading periods  -  29 Sep 2006 by CAM
	
#Delete Rosatti's "{/...} lines
s/\n\{\/.*\}.*//g;
s/\{\/.*?\}//g;
s/\nCurrent Status:([^ ])/\nCurrent Status: $1/;

s/(Editorial Comments 2) +/$1: /;
s/Editorial Commens 1/Editorial Comments 1/;
s/ Summary:/Summary:/;
s/\nCurrent Name: *\n/\n/i;
s/\nCurrent Name: *$//i;

s/\342\200\234/"/g;
s/\342\200\235/"/g;
s/\342\200\231/'/g;
s/\342\200\230/'/g;
s/\342\200\246/.../g;
s/\342\200\241/&aacute;/;
s/\357\273\277//;
s/\342\200\223/&ndash;/g;
s/\303\274/&uuml;/g;
s/\303\253/&euml;/g;
s/\303\247/&ccedil;/g;
s/\305\223/&aelig;/g;
s/\305\240/&Scaron;/g;
s/\303\255/&iacute;/g;
s/\305\275/&eacute/;

s/\302\260/&deg;/g;
s/\302\274/1\/4/g;
s/\303\201/&Aacute;/g;
s/\303\211/&Eacute;/g;
s/\303\214/&Iacute;/g;
s/\303\216/&Icirc;/g;
s/\303\226/&Ouml;/g;
s/\303\227/&agrave;/g;
s/\303\240/&aacute;/g;
s/\303\241/&acirc;/g;
s/\303\242/&auml;/g;
s/\303\244/&aelig;/g;
s/\303\246/&ccedil;/g;
s/\303\247/&egrave;/;


s/\303\201/&Aacute;/g;
s/\303\251/&eacute;/g;
s/\303\263/&oacute;/g;
s/\303\250/&egrave;/g;
s/\303\266/&ouml;/g;
s/<#e9>/&eacute;/g;
s/<#fc>/&uuml;/g;
s/\303\241/&aacute;/g;
s/\303\261/&ntilde;/g;
s/\303\262/&ograve;/g;
s/\303\242/&acirc;/g;
s/<#f6>/&ouml;/g;

s/‐/--/g;
s/“/"/g;
s/”/"/g;

	#next if $. < 17;#defines the header section from the body based on the end line number where the first =========+========= is positioned  


#This lines need checked before each new upload as the lines number can change
#The header was parsed as a name and was always throwing errors into the log that did not make sense
#the loop below skips the header and parses only the body text
			@lines=split(/\n/);

############################
	foreach $j (0 .. $#lines){
		if($lines[$j] =~ /^(Family|Author Notes)/){
			print ERR "\nPossible collapsed entries (space or tab on like supposed to be blank?) after $name\n>>>>>>$_\n<<<<<<" unless ($j==1||$j==2||$j==3);
			warn "\nPossible collapsed entries (space or tab on like supposed to be blank?) after $name\n>>>>>>$_\n<<<<<<" unless ($j==1||$j==2||$j==3);
		}
	}

#print "$name\n";


	if($#lines <= 3){
		print ERR "\n\n$.==>Possible bad blank after $name\n$_\n";
		warn "\n\n$.==>Possible bad blank after $name\n$_\n";
		next;
	}


	if ($lines[0] =~ m/^\.Leptosiphon aureus \(Nutt/){
	#this is a work around for this homonym
	#this is the only non-stripped name in the taxon ID file
	#the partial author is needed to distinguish it from Leptosiphon aureus Benth.
		$name = "Leptosiphon aureus Nutt.";
	}
	else{
		$name = &get_taxon_name($lines[0]);
	}
	
	#if($name=~/ subsp\. .*var\. /){
	#	print ERR "skipping quadrinomial $name\n";
	#	#warn "skipping quadrinomial $name\n";
	#	next;
	#}

	#this corrects these names in the output files
	foreach ($name){ #ICPN has some inconsistencies like authors on genus names and other notations that cause problems with strip name, fix these
		#these show up in the check_sn_no_code.txt file
		s/\?//; #git rid of stray question marks in taxon names
		s/Stuckenia B.+rner/Stuckenia/;
		s/,? ined\.?//;
		s/,? illeg\.?//;
		s/alpinus ?\[Question mark removed 2 Apr 2009; see Correspondence 1\]/alpinus/;
		s/Coleogeton \(Rchb\.\) Les & R\. R\. Haynes/Coleogeton/;
		s/Sidotheca Reveal/Sidotheca/;
		s/psychicola ?\[see Correspondence 3\]/psychicola/;
		s/Saltugilia \(V\. E\. Grant\) L\. A\. Johnson/Saltugilia/;
		s/Aliciella Brand/Aliciella/;
		s/Sairocarpus D\. A\. Sutton/Sairocarpus/;
		s/Hesperomecon Greene/Hesperomecon/;
		s/Corallorrhiza Gagnebin/Corallorrhiza/;
		s/Corallorhiza Gagnebin/Corallorhiza/;
		s/Heliconia L\./Heliconia/;
		s/nothosubsp. pratensis.+\d+.+ak\./nothosubsp. pratensis/;
		s/  +/ /;
		s/ +$//;
		s/^ +//;
		
		
		#($name)=m/^([^\s]+)/;
	}


			
	#if($name =~ m/^[xX] ([A-Z][a-z]+ [a-z]+).*/){
		#$name = $1; These are in acceptable now
	#}
	
	if($seen{$name}++){
		print ERR "Second instance: $name\n$_\n";
		warn "Second instance: $name\n$_\n";
	}
	
	
	unless($TID{$name}){
		warn "$.-->no code for $name ==> stripped as ", &strip_name($name), "\n";
		print NOCODE  "no code for ", &strip_name($name), "\t==>\t$name\n";
	}




	if(m/\nProblem:.+/i){  #skip Rosatti's personal note lines, not to be included in ICPN, causing errors
		warn "Rosatti note line still present in text file:\n$_\n";
		#delete this tag line below
	}

	if(m/\nCurrent Status:.*\nCurrent Status:.../ms){
		print ERR "Multiple statuses:\n$_\n";
		warn "Multiple statuses:\n$_\n";
	}

	if(m/TJM, as minor variant of/){
		s/TJM, as minor variant of ([A-Z][a-z][^ ]+ [a-z][^ ]+ (var\.|subsp\.) [a-z]+)/TJM, as minor variant of <sn>$1<\/sn>/ ||
		s/TJM, as minor variant of ([A-Z][a-z][^ ]+ [a-z][a-z-]+)/TJM, as minor variant of <sn>$1<\/sn>/;
	}

			#this generate the text file "current_names.txt" which used to be maintained by hand, but was not updated for years as of 2016 
			#updating by hand caused errors to persist
		unless (m/Current Name: unresolved/){ #do not include taxa with unresolved or unresolved phrases in the current name field
			if (m/(Current Name: )(.+)/){
				$cur_name = $2;
				$cur = $1;
				foreach ($cur_name){ #ICPN has some inconsistencies like authors on genus names and other notations that cause problems with strip name, fix these
					#these show up only as a warning in terminal
					s/\?//; #get rid of stray question marks in taxon names
					s/nothosubsp. pratensis.+\d+.+ak\./nothosubsp. pratensis/;
					#s/&times;/X /;
					s/\[var\. i.?\]//;
					s/\[changed from Silene .+ 16 Jun 2006\.\]//;
					s/\[see Editorial Comments 1 and 2, .+ rare, situation\]//;
					s/\.$//; #get rid of stray periods at the end of the line that are causing errors
					s/  +/ /;
					s/ +$//;
					s/^ +//;
				}
				
				$cur_name = &strip_name($cur_name);
					#unless($TID{$cur_name}){
					#	warn "$.-->no code for $cur_name ==> stripped as $cur_name\n";
					#	print NOCODE  "no code for $cur_name ==> stripped as $cur_name\n";
					#}
				
				print OUT2 $name."\n".$cur.$cur_name."\n\n";
			}
			elsif (m/(Current Name [()Tt]+: )(.+)/){
				$cur_name2 = $2;
				$cur = $1;
				foreach ($cur_name2){ #ICPN has some inconsistencies like authors on genus names and other notations that cause problems with strip name, fix these
					#these show up only as a warning in terminal
					s/\?//; #get rid of stray question marks in taxon names
					s/nothosubsp. pratensis.+\d+.+ak\./nothosubsp. pratensis/;
					#s/&times;/X /;
					s/\[var\. i.?\]//;
					s/\[changed from Silene .+ 16 Jun 2006\.\]//;
					s/\[see Editorial Comments 1 and 2, .+ rare, situation\]//;
					s/\.$//; #get rid of stray periods at the end of the line that are causing errors
					s/  +/ /;
					s/ +$//;
					s/^ +//;
				}
				$cur_name2 = &strip_name($cur_name2);
					unless($TID{$cur_name2}){
						warn "$.-->no code for $cur_name2 ==> stripped as $cur_name2\n";
						print NOCODE  "no code for $cur_name2 ==> stripped as $cur_name2\n";
					}
					
			print OUT2 $name."\n".$cur.$cur_name2."\n\n";
			}
		}

	$open= s/<sn>/<sn>/g;
	$close= s|</sn>|</sn>|g;
	push(@SN, "$name: [SN]  open: $open close $close") unless $open==$close;
	#@words=split(/\s+/);
	#foreach(@words){
		if (m/(.*?)([\200-\377][\200-\377]?)(.*)/){
			s/“/"/g;
			s/”/"/g;
			unless ($seen{$2}++){
				print ERR "\tUNCONVERTED ACCENT: $1 BAD:$2 $3\nFULL TEXT:$_\n";
				#print ERR "\ns/\\x",sprintf("%lx",unpack('U*',$1)),"//g;", " Unconverted accent: $name $_\n";
				warn "UNCONVERTED ACCENT: $1 (BAD:$2) $3\n\nFULL TEXT:$_\n";
				##print join(" ", @words),"\n";
			}
		}
	#}

#Current Status: pending 8, accepted name for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)
	foreach (@lines[1 .. $#lines]){
		next if/^-?done/;
		(s/^Effort: */EF: / ||
		s/^Family: */FA: / ||
		s/^Source: */SR: / ||
		s/^Source ([a-z]) *: */SR$1: / ||
		s/^Summary: */SM: / ||
		s/^Notes on Publication of Name: */POP: / ||
		s/^PAODO?P: */POP: / ||
		s/^DAOPO?P: */POP: / ||
		s/^[PD]OPO[PBC]: */POP: / ||
		s/^[DP]OP: */POP: / ||
		s/^KM citation: */KMC: / ||
		s/^Comments?: */CT: / ||
		s/^Editorial Comments? ([0-9-]+): */CTE$1: / ||
		s/^Assigned to: */AT: / ||
		s/^Assignment date: */AD: / ||
		s/^Current Status Authority: */CSA: / ||
		s/^Current Status: *(\d+[a-z]?).*/CS: $1/ ||
		#s/^Current Status: *(pending) (\d+[a-z]?).*/CS: $1_$2/ ||
		#s/^Current Status: *tentative (\d+[a-z]?).*/CS: $1_[t]/ ||
		s/^Current Status: *(pending .*)/CS: $1/ ||
		s/^Current Status: *(tentative .*)/CS: $1/ ||
		s/^Current Status: */CS: / ||
		s/^Current Status Date: */DD: / ||
		s/^Decision [Dd]ate: */DD: / ||
		s/^Current [Nn]ame: */CN: / ||
			s/^Current [Nn]ame \(T\): /CN_T: /  ||
		s/Correspondence: */CR: / ||
		s/Correspondence ([0-9]+): */CR$1: / ||
		s!^TJM synonyms: *!TSN: ! ||
		s!^TJM2 synonyms: *!TSN2: ! ||
		s!^Current JFP [Ss]ynonyms?: *!JFPS: ! ||
		s!^TJM2 misapplied names?: *!TMN: ! || #this line added to account for new tag
		s!^TJD?M misapplied names?: *!TMN: ! || 
		s!^Current JFP [Mm]isapplied names?: *!JFPMN: ! ||
		s/^Literature: */RL: / ||
		s/^Literature ([a-z]): */RL$1: / ||
		s/^Recent Literature ([a-z]): */RL$1: / ||
		s/^Geography: */GG: / ||
		s/^AN: /AN: /  ||
		s/^Author notes: /AN: /  ||
		s/^Author Notes: /AN: /  ||
		s/^LINK: /LINK: /  ||
		s/^Variant [Ss]pelling: /VS: /  ||
		s/Types Info: */TI: / ||
		s/^Synonyms not explicitly cited in TJM: /SNTJM: /  ||
		s/Synchronization with TJM2:/SNCH:/||
		s/Pending:/PND:/) ||
			s/[pP]roblem:.+// || #try to delete this line, a new tag developed by Tom for his use only
			s/[pP]revious JFP synonyms:.+// || #try to delete this line, a new tag developed by Tom for his use only

		push(@badtag, "$name [tag]: |$_");

	}
	#this corrects these names in the CPN_out.txt file
	foreach ($name){ #ICPN has some inconsistencies like authors on genus names and other notations that cause problems with strip name, fix these
		#these show up in the check_sn_no_code.txt file
		s/Stuckenia B.+rner/Stuckenia/;
	#	s/, ined\.?\??//;
	#	s/alpinus ?\[Question mark removed 2 Apr 2009; see Correspondence 1\]/alpinus/;
	#	s/Coleogeton \(Rchb\.\) Les & R\. R\. Haynes/Coleogeton/;
	#	s/Sidotheca Reveal/Sidotheca/;
	#	s/psychicola ?[see Correspondence 3]/psychicola/;
	#	s/Saltugilia \(V\. E\. Grant\) L\. A\. Johnson/Saltugilia/;
	#	s/Aliciella Brand/Aliciella/;
	#	s/Sairocarpus D\. A\. Sutton/Sairocarpus/;
	#	s/Hesperomecon Greene/Hesperomecon/;
	#	s/Corallorrhiza Gagnebin/Corallorrhiza/;
	#	s/Corallorhiza Gagnebin/Corallorhiza/;
	#	s/Heliconia L\./Heliconia/;
		
		
		
		#($name)=m/^([^\s]+)/;
	}

		#s/Current Status: *(pending) (\d+[a-z]?).*/Current Status: $1_$2/;

	print OUT $name."\n";
	print OUT "TAN: ";
	print OUT;
	$lastline=$_;
	}

#these are not being created properly from the ICPN file for some unknown reason
print OUT <<EOP;

Leptosiphon aureus Nutt.
TAN: Leptosiphon aureus (Nutt.) Benth. ex E. Vilm.
Family: POLEMONIACEAE
Source: added manually by Rosatti
Notes on Publication of Name: from IPNI, Fl. Pleine Terre (ed. 2) 470. 1866
Comments: treated as <sn>Linanthus aureus</sn> (Nutt.) Greene in TJM; author citation uncertain, Leptosiphon aureus (Nutt.) Benth. ex E. Vilm. in IPNI, Leptosiphon aureus (Nutt.) J. M. Porter & L. A. Johnson comb. nov. in Aliso 19(1): 80. 2000 [28 Jul 2000]; since TJM, treated as Leptosiphon aureus (Nutt.) J. M. Porter & L. A. Johnson by J. M. Porter & L. A. Johnson (A Phylogenetic Classification of Polemoniaceae, Aliso 19(1):55-91. 2000)
Correspondence 1: [for Linanthus aureus] 14 May 2003 e-mail from Jeff Greenhouse: Dave Keil, in a 4/25/03 e-mail to M. Wetherwax, states "For Linanthus aureus (TJM p. 842) add WTR (n slope) and pinyon pine-oak-juniper woodland as habitat. We have several collections from the Mt. Pinos area (Fraser State Park, 5 mi w of Lebec, Rodin 5832; Valle Vista CG, Keil 12227; between Lake of the Woods and Fraser Park, Keil 12248). There are SMASCH records from this region as well." Bob Patterson (TJM author for Linanthus), in a 5/8/03 e-mail states "By all means make the changes for subsp. aureus (only). This range 'extension' doesn't surprise me at all. subsp. decorus, however, is a more eastern entity and I doubt that it occurs so far west." DECISION JAG/BGB 5/13/03: add WTR (n slope) to the range and pinyon pine-oak-juniper woodland to the habitat for Linanthus aureus per TJM author
Editorial Comments 1: Correspondence 1 indicates that: according to Dave Keil, WTR (n slope) and pinyon pine-oak-juniper woodland should be added to the geographic range and habitat statement, respectively, for <sn>Linanthus aureus</sn>; however, according to Bob Patterson (TJM author for Linanthus), these changes are to be made only for <sn>Linanthus aureus subsp. aureus</sn>, as <sn>Linanthus aureus subsp. decorus</sn> is a more eastern entity and probably does not occur so far west.
Correspondence 2:  15 Nov 2007 e-mail from Jeff Greenhouse: archived in Eudora mailbox "done ICPN".
Editorial Comments 2:  Correspondence 2 indicates: that Leptosiphon aureus was published well before Porter & Johnson [Aliso 19(1): 80. 2000], in Les Fleurs de Pleine Terre (ed. 2):470--471 (1866); that the only indication of authorship of the publication in 1866 is "Vilmorin-Andrieux et Cie." on the title page; that TL-2 indicates that the director of this company ["Vilmorin-Andrieux et Cie."] in 1866 was Elisa de Vilmorin (E. Vilm.; not in APN but in accordance with principles in APN); that the species name was ascribed to "Benth." but followed by an unattributed description; that although the epithet of Gilia aurea Nutt. (Proceedings of the Academy of Natural Sciences of Philadelphia 4:11. 1848) was adopted by Vilmorin without explicitly citing a basionym, ICBN 2006 Art. 33.3 accepts this as a valid publication of a new combination.  [Therefore, author citation correct as indicated in this Index, 19 Nov 2007.]
Correspondence 3: Treatment and author notes submitted for TJM2 by Robert W. Patterson & Robyn Battaglia
Editorial Comments 3: Correspondence 3 indicates that for TJM2 Linanthus aureus (Nutt.) Greene is to be treated as a syn of Leptosiphon aureus (Nutt.) Benth. ex E. Vilm., with a note stating that a new name may be needed because Leptosiphon aureus might have been used earlier for a different taxon.
Correspondence 4: Treatment and author notes submitted for Revision 9 of the Jepson eFlora
Editorial Comments 4: Correspondence 4 indicates that Leptosiphon aureus (Nutt.) Benth. ex E. Vilm. is an illegitimate name (in that it is a later homonym of Leptosiphon aureus Benth.) and therefore Leptosiphon chrysanthus J.M. Porter & R. Patt. is to be used instead for this taxon.
Summary: probable addition, different genus since TJM; addition, different genus since TJM; rejection, illegitimate name
Current Status: 1b, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA
Current Status Authority: JFP
Current Status Date: 22 Dec 2021
Effort: @; author citation to be checked [resolved]
Current Name: Leptosiphon chrysanthus J.M. Porter & R. Patt.

Leptosiphon acicularis
TAN: Leptosiphon acicularis (Greene) Jeps.
Family: POLEMONIACEAE
Source: Correspondence 1
Correspondence 1: 2 Feb 20004 e-mail from Doreen Smith: Hi Tom, I found the most recent article on the Linanthus/ Leptosiphon androsaceus complex in Madrono vol. 48, No. 2 pp.62-78 by Robyn Battaglia and Robert Patterson.//They give the name " Leptosiphon androsaceus Benth." in their treatment of this section of Linanthus/ Leptosiphon. The other changes of this section of" Linanthus" back to "Leptosiphon" are there too, several of those are in the other databases but this got missed.//Regards, Doreen Smith
Editorial Comments 1: Correspondence 1 indicates that several taxonomic and nomenclatural changes in this group were made by Battaglia & Patterson in Madrono 48:62-78, 2001. [including Linanthus acicularis Greene treated as Leptosiphon acicularis (Greene) Jeps.]
Correspondence 2: 23 Apr 2004 e-mail from Margriet Wetherwax, including copy of e-mail from Wetherwax to Misa Ward: Tom, ICPN has the same Madrono article cited - the 2 cited here are probably more helpful to the general public. Thanks, Margriet//Hi, Misa, The Madrono citation is ok, but the more important papers are//Bell, C.D., and R. Patterson. 2000. Molecular phylogeny and biogeography of Linanthus (Polemoniaceae). Amer. J. Bot. 87(12):1857-1870//Porter, J. Mark, and L.A. Johnson. 2000. A phylogenetic classification of Polemoniaceae. Aliso 19(1): 55-91.//The latter paper moved the various species of Linanthus into Leptosiphon.//The paper that is cited now just uses the Leptodactylon name, the other 2 papers explain why this is being done.//Best, Margriet
Editorial Comments 2: Correspondence 2 cites two other papers of relevance: Bell, C. D., and R. Patterson. 2000. Molecular phylogeny and biogeography of Linanthus (Polemoniaceae). Amer. J. Bot. 87(12):1857-1870; Porter, J. M., and L. A. Johnson. 2000. A phylogenetic classification of Polemoniaceae. Aliso 19(1): 55-91.
Correspondence 3: 1 Dec 2004 e-mail from Misa Ward:
Editorial Comments 3: Correspondence appended verbatim is pertinent to TJM2 account: "Historical occurrences need verification. Does plant occur in CCA Co.? A synonym of Linanthus acicularis in The Jepson Manual. See Pittonia 2:259 (1892) for original description, and School fl. Pacif. Coast 77 (1902) for revised nomenclature."
Correspondence 4: Treatment and author notes submitted for Revision 9 of the Jepson eFlora
Editorial Comments 4: Correspondence 4 indicates that Leptosiphon acicularis (Greene) Jeps. is to be treated as Leptosiphon aureus Benth., which has nomenclatural priority.
Summary: addition, different genus since TJM; rejection, due to nomenclatural priority
Current Status: 1a, taxonomic or nomenclatural synonym for taxon native to CA
Current Status Authority: JFP
Current Status Date: 21 Dec 2021 
Effort: @
Current Name: Leptosiphon aureus Benth.

EOP



}
foreach(sort(@badtag, @SN)){
	print ERR "$_\n" unless m/Version Date:/;
	warn "$_\n" unless m/Version Date:/;
}


sub get_taxon_name {
    my $par = shift; #each paragraph is separated by a blank line
    if( $lines[0] =~ m/(X? ?[A-Z][a-z]+)/){ #if the first line starts with...
    	return &strip_name($lines[0]); #the name is the contents of the first line
    }
	else{
		print ERR "$.-->Bad Taxon Name: $_\n";
		print "$.-->Bad Taxon Name: $_\n";
	}
}

sub strip_name{
	local($_) = @_;
	return unless $_;
#print "SAPONARIA: $_" if m/saponaria/;


s/Uva-Ursi pechoensis.*/Uva-ursi pechoensis/;

if(m/^Fragaria ?.* ?ananassa Duchesne var. cuneifolia ?.*/){
return("Fragaria X ananassa var. cuneifolia");
}

s/&times;/X /;
#s/ ◊ / X /;
#s/([a-z]) ? ([A-Z])/$1 X $2/;
#s/^x ([A-Z][a-z]+ [a-z]+).*/X $1/;
	
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


s/trichocarpa Torr\. & A\. Gray ex Hook\. filius/trichocarpa f./; #fix one forma name that conflict with the filius names above
s/Betula occidentalis Hook. filius inopina Jeps./Betula occidentalis f. inopina/; #fix one forma name that conflict with the filius names above


s/^([A-Z][a-z-]+) ([-a-z]+) [,A-Za-z\d&;'().\- ]+ (subvar\.|subsp\.|var\.|f\.|nothosubsp\.) ([a-z-]+) [,A-Za-z\d&;'().\- ]+/$1 $2 $3 $4/ ||
s/^([A-Z][a-z-]+) ([-a-z]+) [,A-Za-z\d&;'().\- ]+ (subvar\.|subsp\.|var\.|f\.|nothosubsp\.) ([-a-z]+)/$1 $2 $3 $4/ ||
s/^([A-Z][a-z-]+) ([-a-z]+) (subvar\.|subsp\.|var\.|f\.|nothosubsp\.) ([-a-z]+) [,A-Za-z\d&;'().\- ]+/$1 $2 $3 $4/ ||
s/^([A-Z][a-z-]+) ([-a-z]+) (subvar\.|subsp\.|var\.|f\.|nothosubsp\.) ([-a-z]+)/$1 $2 $3 $4/ ||
s/^([A-Z][a-z-]+) (X [-a-z]+) [,A-Za-z\d&;'().\- ]+/$1 $2/||
s/^([A-Z][a-z-]+) (X [-a-z]+)/$1 $2/||
s/^([A-Z][a-z-]+) ([-a-z]+) [,A-Za-z\d&;'().\- ]+/$1 $2/||
s/^([A-Z][a-z-]+) ([-a-z]+)/$1 $2/||
s/^(X [A-Z][a-z-]+) ([-a-z]+) [,A-Za-z\d&;'().\- ]+/$1 $2/||
s/^(X [A-Z][a-z-]+) ([-a-z]+)/$1 $2/;
s/  +/ /;
s/ +$//;
s/^ +//;

#s/^([A-Z][A-Za-z-]+) ([-a-z]+) ?.* (subvar\.|subsp\.|var\.|f\.|nothosubsp\.) ([-a-z]+).*/$1 $2 $3 $4/ ||
#s/^([A-Z][A-Za-z-]+) [×Xx] ([-a-z]+) .+/$1 X $2/||
#s/^([A-Z][A-Za-z-]+) [×Xx] ([-a-z]+)/$1 X $2/||
#s/^([A-Z][A-Za-z-]+) ×([-a-z]+) .+/$1 X $2/||
#s/^([A-Z][A-Za-z-]+) ×([-a-z]+)/$1 X $2/||
#s/^([A-Z][A-Za-z-]+) ([-a-z]+) .+/$1 $2/||
#s/^([A-Z][A-Za-z-]+) ([-a-z]+)/$1 $2/||
#s/^([A-Z][A-Za-z-]+) (X [-a-z]+)/$1 X $2/||
#s/^X ([A-Z][a-z-]+) ([-a-z]+) (.+)/X $1 $2/||
#s/^X ([A-Z][a-z-]+) ([-a-z]+)/X $1 $2/||
#s/^([A-Z][A-Za-z-]+) (.+)/$1/;
#s/  +/ /;
#s/ +$//;

	return ($_);
}
