#!/usr/bin/perl

#use warnings;
#use strict;

use POSIX qw(strftime);

my $filedate="2026JUN22";

open(IN, "../Jepson-eFlora/Synonymy/input/smasch_taxon_ids.txt") || die;
while(<IN>){
	chomp;
	($code,$name,@residue)=split(/\t/);

$name =~ s/^X /&times;/;
$name =~ s/ X / &times;/;

	$NAME_TO_CODE{$name}=$code;
	$CODE_TO_NAME{$code}=$name;
}
close (IN);

open(ERR, ">output/check_sn_error.txt") || die;
open(NOCODE, ">output/check_sn_no_code.txt") || die;

open(OUTX, ">output/CPN_out.txt") || die;
open(OUT, ">input/CPN_out.in") || die;
open(OUT2, ">input/current_names-".$filedate.".txt") || die;

undef ($/);
local($/)="";
foreach(@ARGV){
	$file=$_;
	open(IN,$file) || die "couldn't open $file\n";

while(<IN>){

	#s/=====.*\n.//;
	#s/=====.+\n//;

	s/LINK.*FNA.*\n//;
	s/LINK.*Check the California Weed.*\n//;
	s/  +/ /g;
	s/ $//;
	s/ \n/\n/g;
	
	s/\n\#.+\n//i;

s/(...)Effort:.*\n/$1\n/;

	if(m/^(\.Admin)/){
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

	if (m/\.Atriplex glauca \(L\./){
		++$count5;
		print ERR "skipping homonym name 'Atriplex glauca (L.) Crantz' that conflicts with the Atriplex glauca L.'\n";
		warn $count5." skipping Atriplex glauca (L.) Crantz\n\n";
		next;
	}

	if (m/\.Anagallis caerulea Lam/){
		++$count5;
		print ERR "skipping JFP 8 accepted name 'Anagallis caerulea Lam.' that conflicts with the TJM synonym 'Anagallis caerulea L.'\n";
		warn $count5." skipping Anagallis caerulea Lam\n\n";
		next;
	}

	if (m/\.Poa tenuifolia Buckley/){
		++$count5;
		print ERR "skipping Poa tenuifolia Buckley\n";
		warn $count5." skipping Poa tenuifolia Buckley\n\n";
		next;
	}

	if (m/\.Streptanthus lemmonii Jepson 1920/){ #skip this homonym entry as we can only load a genus species once in this version of the ICPN
		++$count5;
		print ERR "skipping Streptanthus lemmonii Jepson 1920\n";
		warn $count5." skipping Streptanthus lemmonii Jepson 1920\n\n";
		next;
	}

	if (m/\.Layia erubescens D\. *D\. Keck/){ #skip this homonym entry as we can only load a genus species once in this version of the ICPN
		++$count5;
		print ERR "skipping Layia erubescens D. D. Keck\n";
		warn $count5." skipping Layia erubescens D. D. Keck\n\n";
		next;
	}

	if (m/\.Senecio bicolor \(Willd\.\) Tod\./){ #skip this homonym entry as we can only load a genus species once in this version of the ICPN
		++$count5;
		print ERR "skipping Senecio bicolor (Willd.) Tod.\n";
		warn $count5." skipping Senecio bicolor (Willd.) Tod.\n\n";
		next;
	}

	if (m/\.Linanthus aureus \(Nutt\.\) Greene/){ #skip this homonym entry
		++$count5;
		print ERR "skipping Linanthus aureus (Nutt.) Greene\n";
		warn $count5." skipping Linanthus aureus (Nutt.) Greene\n\n";
		next;
	}

	if (m/\.Leptosiphon aureus \(Nutt\.\) Benth\. ex E\. Vilm\./){ #skip this homonym entry
		++$count5;
		print ERR "skipping Linanthus aureus (Nutt.) Benth. ex E. Vilm.\n";
		warn $count5." skipping Linanthus aureus (Nutt.) Benth. ex E. Vilm.\n\n";
		next;
	}

	if (m/\.Leptosiphon aureus \(Nutt\.\) of various/){ #skip this homonym entry
		++$count5;
		print ERR "skipping Linanthus aureus (Nutt.) of various authors\n";
		warn $count5." skipping Linanthus aureus (Nutt.) of various authors\n\n";
		next;
	}

	if (m/\.Nasturtium dictyotum Greene/){ #skip this homonym entry
		++$count5;
		print ERR "skipping Nasturtium dictyotum Greene\n";
		warn $count5." skipping Nasturtium dictyotum Greene\n\n";
		next;
	}


	if (m/\.Amsinckia longifolia Suks/){ #skip this homonym entry
		++$count5;
		print ERR "skipping Amsinckia longifolia Suksd.\n";
		warn $count5." skipping Amsinckia longifolia Suksd.\n\n";
		next;
	}

	if (m/\.Nama arizonica J\. *D\. Bacon/){ #skip this homonym entry
		++$count5;
		print ERR "skipping Nama arizonica J. D. Bacon\n";
		warn $count5." skipping Nama arizonica J. D. Bacon\n\n";
		next;
	}


	if (m/\.Trifolium variegatum Nutt\. phase/){ #skip Trifolium phase names since they will not strip correctly nor will synonymy assign correctly
		++$count2;
		print ERR "skipping Trifolium phase name\n";
		warn $count2." skipping skipping Trifolium phase name\n\n";
		next;
	}

	if(m/(\.Spartina alterniflora &times; Spartina foliosa)/){
		++$count4;
		print ERR "skipping hybrid entry: $1\n";
		warn $count4." skipping hybrid entry: $1\n\n";
		next;
	}

	if(m/(\.Sporobolus alterniflorus &times; Sporobolus foliosus)/){
		++$count4;
		print ERR "skipping hybrid entry: $1\n";
		warn $count4." skipping hybrid entry: $1\n\n";
		next;
	}
	
	if(m/(\.Encelia californica &times; ?Encelia farinosa|Aloe saponaria \(Aiton\) Haw\. &times;Aloe striata|Encelia farinosa .+ &times; ?Encelia frutescens|Spartina alterniflora .+ &times; ?Spartina foliosa)/){
		++$count3;
		print ERR "skipping hybrid entry: $1\n";
		warn $count3.". skipping hybrid entry: $1\n\n";
		next;
	}

	if(m/(\.Fragaria &times;ananassa Duchesne var\. cuneifolia)/){
		++$count4;
		print ERR "skipping hybrid entry: $1\n";
		warn $count4." skipping hybrid entry: $1\n\n";
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

	if(m/(===+\+===+.*)/){
		print ERR "skipping LINE BREAK $1\n";
		warn "LINE BREAK $1\n";
		next;
	}

	
#Delete Rosatti's "{/...} lines
s/\n\{\/.*\}.*//g;
s/\{\/.*?\}//g;
s/\nCurrent Status:([^ ])/\nCurrent Status: $1/;

s/(Editorial Comments 2) +/$1: /;
s/Editorial Commens 1/Editorial Comments 1/;
s/ Summary:/Summary:/;
s/\nCurrent Name: *\n/\n/i;
s/\nCurrent Name: *$//i;

s/\nPrevious JFP misapplied names:.+\n//i;

s/\n\#.+\n//i;

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

	if($#lines > 1){
		if ($lines[0] =~ m/^\d+$/){
			print  "\n\n$.==>($lines[0]) BAD NUMERICAL Taxon NAME\n$_\n";
		}
		elsif ( ($lines[0] =~ m/^\.&times;[A-Za-z-]+/) || ($lines[0] =~ m/^\.[A-Z][a-z][a-z-]+$/) || ($lines[0] =~ m/^\.[A-Z][a-z][a-z-]+ .+/) ){
			#print  "\n\n$.==>($lines[0]) NAME PASSED\n$_\n";
			++$GOOD;
		}
		else{
			print "$.==>($lines[0]) BAD Taxon NAME\n$_\n";
		}
	}
	else{
		print ERR "\n\n$.==>Possible bad orphaned entry\n$_\n";
		warn "\n\n$.==>Possible bad blank\n$_\n";
		#if an entry has two lines or less it may be a fragment
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
		s/^\.//; #Get rid of leading periods  -  29 Sep 2006 by CAM
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
		if(m/(Family: TBD)/){
			print ERR "skipping DUP SYNONYM from CDL 2018 $1\n";
			++$DUPA;
			next;
		}
		else{
			print ERR "Second instance: $name\n$_\n";
			warn "Second instance: $name\n$_\n";
			++$DUP;
		}

	}
	
	$strip = &strip_name($name);
	
	unless($NAME_TO_CODE{$strip}){
		warn "$.-->no code for $name ==> stripped as ".$strip."\n";
		print NOCODE  "\t".$strip."\tno code\n";
	}

	my $auth = &get_author($name);

	if($auth eq ""){
			unless (m/(Status: [1-9]b,|Status: 15,|Status: 16,|Status: 17,)/){
				print NOCODE  $auth."\t".$name."\tno author\n";
					unless (m/Status: to be determined/){
			
					warn "1. $auth-->no auth for $name ==> stripped as ".$strip."\n";
					}
				
			}
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
		#unless (m/Current Name: unresolved/){ #do not include taxa with unresolved or unresolved phrases in the current name field
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
				
				$cur_strip = &strip_name($cur_name);
					unless($NAME_TO_CODE{$cur_strip}){
						warn "CURRENT NAME ERROR, no code for ".$cur_name."\n";
						print NOCODE  "\t".$cur_strip."\tno code\n";
					}
				
				print OUT2 $name."\t".$cur.$cur_name."\n";
			}
			#elsif (m/(Current Name [()Tt]+: )(.+)/){
			#	$cur_name2 = $2;
			#	$cur = $1;
			#	foreach ($cur_name2){ #ICPN has some inconsistencies like authors on genus names and other notations that cause problems with strip name, fix these
			#		#these show up only as a warning in terminal
			#		s/\?//; #get rid of stray question marks in taxon names
			#		s/nothosubsp. pratensis.+\d+.+ak\./nothosubsp. pratensis/;
			#		#s/&times;/X /;
			#		s/\[var\. i.?\]//;
			#		s/\[changed from Silene .+ 16 Jun 2006\.\]//;
			#		s/\[see Editorial Comments 1 and 2, .+ rare, situation\]//;
			#		s/\.$//; #get rid of stray periods at the end of the line that are causing errors
			#		s/  +/ /;
			#		s/ +$//;
			#		s/^ +//;
			#	}
			#	$cur_name2 = &strip_name($cur_name2);
			#		unless($TID{$cur_name2}){
			#			warn "$.-->no code for $cur_name2 ==> stripped as $cur_name2\n";
			#			print NOCODE  "no code for $cur_name2 ==> stripped as $cur_name2\n";
			#		}
					
			#print OUT2 $name."\n".$cur.$cur_name2."\n\n";
			#}
		#}

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
		#next if/^-?done/;

		#s/^Source ([a-z]) *: */SR$1: / ||
		#s/^PAODO?P: */POP: / ||
		#s/^DAOPO?P: */POP: / ||
		#s/^[PD]OPO[PBC]: */POP: / ||
		#s/^[DP]OP: */POP: / ||
		#s/^Assigned to: */AT: / ||
		#s/^Assignment date: */AD: / ||
		#s/^Decision [Dd]ate: */DD: / ||
		#	s/^Current [Nn]ame \(T\): /CN_T: /  ||
		
		(s/Geography: */SKIP-GEO: / ||
		s/LINK: */SKIP-LINK: / ||
		s/Variant [Ss]pelling: */SKIP-VS: / ||
		s/Effort: */SKIP-EFFORT: / ||
		s/AN: */SKIP-AN: / ||
		s/Synchronization with TJM2: */SKIP-SYNC: / ||
		s/Pending: */SKIP-PEND: / ||
		s/[pP]roblem: */SKIP-PROB: / ||
		s/[pP]revious JFP synonyms: */SKIP-PREVSYN: / ||
		s/Synonyms not explicitly cited in TJM: */SKIP-PREVSYNCIT: / ||
		s/Family: */FAM: / ||
		s/Source: */SOURCE: / ||
		s/Source ([a-z]): */SOURCE-$1: / ||
		#s/Summary: */SUM: / ||
		s/Notes on Publication of Name: */PUBNOTE: / ||
		#s/KM citation: */KMC: / ||
		s/Comments: */CT: / ||
		s/Editorial Comments? ([0-9-]+): */Editorial Comments$1: / ||
		s/Current Status Authority: */CurrentStatusAuthority: / ||
		s/Current Status: /STATUS: / ||
		s/Current Status Date: */CurrentStatusDate: / ||
		s/Current [Nn]ame: */CurrentName: / ||
		s/Correspondence: */Correspondence: / ||
		s/Correspondence ([0-9]+): */Correspondence$1: / ||
		#s/TJM synonyms: */TSYN: / ||
		#s/TJM2 synonyms: */T2SYN: / ||
		s/Current JFP [Ss]ynonyms?: */Current JFP Synonyms: / ||
		s/TJM2 misapplied names?: */TJM2 misapplied names: / || #this line added to account for new tag
		s/TJM misapplied names?: */TJM misapplied names: / || 
		s/Current JFP [Mm]isapplied names?: */Current JFP misapplied names: / ||
		#s/Literature: */RL: / ||
		#s/Literature ([a-z]): */RL$1: / ||
		#s/Recent Literature ([a-z]): */RL$1: / ||
		s/Author [Nn]otes: /Author Notes: /  ||
		#s/Author Notes: /AN: /  ||
		#s/Types Info: */TYPES: /) ||



		push(@badtag, "$name [tag]: |$_");

	}


		my $lastline = "CurrentName: ".$cur_strip;
		if ($lines[-1] =~ m/CurrentName: .+/){
			$lines[-1] = $lastline;
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

#skip these problems records,
#they are re-added as corrected entries below
next if ($name =~ m/(Leptosiphon acicularis|Leptosiphon aureus|Linanthus acicularis|Linanthus aureus)/);


		print OUTX "\n\nTNOAN: ".$strip."|";
		print OUTX "TAN: ".$name."|AUTH: ".$auth."|";
			for (my $i = 1; $i < scalar @lines; $i++) {
    			print OUTX $lines[$i]."|";
			}

		$_ =~ s/^\.//;

		print OUT "\n\n\nTNOAN: ".$strip."\n";
		print OUT "TAN: ".$name."\nAUTH: ".$auth."\n";
			for (my $i = 1; $i < scalar @lines; $i++) {
    			print OUT $lines[$i]."\n";
			}

		#print OUT;
		#$lastline=$_;


	}



#these are not being created properly from the ICPN file due to major errors in the ICPN file
print OUT <<EOP;

TNOAN: Spartina alterniflora &times; foliosa
TAN: Spartina alterniflora Loisel. &times; Spartina foliosa Trin.
Author Notes: both = APN
Family: POACEAE
Source: Correspondence 1
Correspondence 1: 13 Jan 2004 e-mail from Jeff Greenhouse: Work by Debra R. Ayres, Donald R. Strong, and Peter Baye published in Madrono 50:209--213 (2003) documents the rampant spread of the aggressive hybrids of Spartina foliosa with the introduced species Spartina alterniflora within San Francisco Bay. They conclude "Spartina foliosa is in immediate danger of extirpation in San Francisco Bay, and perhaps beyond". DECISION JAG/BGB 1/13/04: hybridization with Spartina foliosa threatens survival of Spartina foliosa wherever the hybrids establish themselves
Editorial Comments 1: Correspondence 1 indicates that Debra R. Ayres, Donald R. Strong, and Peter Baye (Madrono 50:209--213. 2003) document the rampant spread of the aggressive hybrids of Spartina foliosa with the introduced species Spartina alterniflora within San Francisco Bay, concluding that "Spartina foliosa is in immediate danger of extirpation in San Francisco Bay, and perhaps beyond".
Summary: addition, for evidently unnamed hybrid
Current Status: 10a, accepted name for taxonomically recognized and/or fertile hybrid (non-hybrid form of name)
Current Status Authority: Jeffrey A. Greenhouse, as Collection Research Specialist, JFP, and Bruce G. Baldwin, as Editor, JFP
Current Status Date: 26 Jan 2004

TNOAN: Aloe maculata &times; striata
TAN: Aloe maculata All. &times;Aloe striata Haw.
Family: ASPHODELACEAE (genus previously included in Liliaceae)
Source: TJM
Comments: not native according to TJM
Correspondence 1: 20 Nov 2003 e-mail from Jeff Greenhouse: Walter C. Holmes and Heather L. White, in FNANM 26:412 (2002), indicate that this hybrid formula has been named Aloe &times;schonlandii by Baker in Gard Chron. Ser. III. 33:430 (1902). They report it as firmly established and spreading vegetatively in the vicinity of La Jolla, San Diego Co. The original spelling of the epithet by Baker was sch&ouml;nlandi for "Dr. Schonland, at Grahamstown". The reference is to Selmar Sch&ouml;nland who, at some point, dropped the umlaut from his name (see TL-2 5:289. 1985). Since the honoree did at some time use an umlaut and the original published spelling of the epithet used the umlaut, that could not be considered a typographical or orthographical error. Art. 60 in ICBN 2000 (St. Louis Code) requires retention of the original spelling with standardizations (transcription of the &ouml; to oe, and correction of the termination to ii) yielding schoenlandii as the correct epithet. DECISION JAG/BGB 11/18/03: probable acceptance of Aloe &times;schoenlandii to replace the hybrid formula used in TJM pending decision of TJM2 Author
Editorial Comments 1: Correspondence 1 indicates that, according to Walter C. Holmes and Heather L. White (FNANM 26:412.2002), this hybrid has been named Aloe &times;schonlandii by Baker in Gard Chron. Ser. III. 33:430 (1902), and is firmly established and spreading vegetatively in the vicinity of La Jolla, San Diego Co. According to Correspondence 1, the original spelling of the epithet by Baker was "sch&ouml;nlandi", for "Dr. Schonland, at Grahamstown", in reference to Selmar Sch&ouml;nland who, at some point, dropped the umlaut from his name (see TL-2 5:289. 1985). Nevertheless, since the honoree did at one time use an umlaut and since the original published spelling of the epithet used the umlaut, such a spelling cannot be considered a typographical or orthographical error to be corrected. Rather, Art. 60 in ICBN 2000 (St. Louis Code) requires retention of the original spelling with standardizations (transcription of the &ouml; to oe, and correction of the termination to ii) yielding schoenlandii as the correct epithet. [The FNA treatment also indicates that the "plants are apparently sterile and propagate only vegetatively".]
Correspondence 2: Treatment and author notes submitted for TJM2 by Dale W. McNeal
Editorial Comments 2: Correspondence 2 indicates that for TJM2 Aloe &times;schoenlandii Baker is to be used for this taxonomically recognized, evidently fertile, naturalized hybrid.
Summary: possible rejection, in favor of hybrid form of name; rejection, in favor of hybrid form of name
Current Status: 10a, accepted name for taxonomically recognized and/or fertile hybrid (non-hybrid form of name)
Current Status Authority: TJM2
Current Status Date: 10 Jun 2010
Current Name: Aloe &times;schoenlandii Baker


TNOAN: Aloe saponaria &times; striata
TAN: Aloe saponaria (Aiton) Haw. &times; Aloe striata Haw.
Family: ASPHODELACEAE (genus previously included in Liliaceae)
Source: TJM
Comments: not native according to TJM
Correspondence 1: 20 Nov 2003 e-mail from Jeff Greenhouse: Walter C. Holmes and Heather L. White, in FNANM 26:412 (2002), indicate that this hybrid formula has been named Aloe &times;schonlandii by Baker in Gard Chron. Ser. III. 33:430 (1902). They report it as firmly established and spreading vegetatively in the vicinity of La Jolla, San Diego Co. The original spelling of the epithet by Baker was sch&ouml;nlandi for "Dr. Schonland, at Grahamstown". The reference is to Selmar Sch&ouml;nland who, at some point, dropped the umlaut from his name (see TL-2 5:289. 1985). Since the honoree did at some time use an umlaut and the original published spelling of the epithet used the umlaut, that could not be considered a typographical or orthographical error. Art. 60 in ICBN 2000 (St. Louis Code) requires retention of the original spelling with standardizations (transcription of the &ouml; to oe, and correction of the termination to ii) yielding schoenlandii as the correct epithet. DECISION JAG/BGB 11/18/03: probable acceptance of Aloe &times;schoenlandii to replace the hybrid formula used in TJM pending decision of TJM2 Author
Editorial Comments 1: Correspondence 1 indicates that, according to Walter C. Holmes and Heather L. White (FNANM 26:412.2002), this hybrid has been named Aloe &times;schonlandii by Baker in Gard Chron. Ser. III. 33:430 (1902), and is firmly established and spreading vegetatively in the vicinity of La Jolla, San Diego Co. According to Correspondence 1, the original spelling of the epithet by Baker was "sch&ouml;nlandi", for "Dr. Schonland, at Grahamstown", in reference to Selmar Sch&ouml;nland who, at some point, dropped the umlaut from his name (see TL-2 5:289. 1985). Nevertheless, since the honoree did at one time use an umlaut and since the original published spelling of the epithet used the umlaut, such a spelling cannot be considered a typographical or orthographical error to be corrected. Rather, Art. 60 in ICBN 2000 (St. Louis Code) requires retention of the original spelling with standardizations (transcription of the &ouml; to oe, and correction of the termination to ii) yielding schoenlandii as the correct epithet. [The FNA treatment also indicates that the "plants are apparently sterile and propagate only vegetatively".]
Correspondence 2: Treatment and author notes submitted for TJM2 by Dale W. McNeal
Editorial Comments 2: Correspondence 2 indicates that for TJM2 Aloe &times;schoenlandii Baker is to be used for this taxonomically recognized, evidently fertile, naturalized hybrid.
Summary: possible rejection, in favor of hybrid form of name; rejection, in favor of hybrid form of name
Current Status: 10a, accepted name for taxonomically recognized and/or fertile hybrid (non-hybrid form of name)
Current Status Authority: TJM2
Current Status Date: 10 Jun 2010
Current Name: Aloe &times;schoenlandii Baker


TNOAN: Encelia farinosa &times; frutescens
TAN: Encelia farinosa A. Gray ex Torr. &times; Encelia frutescens (A. Gray) A. Gray
Family: ASTERACEAE
Source: TJM
Comments: according to TJM, "many herbarium specimens of 'E. virginensis' are these; both parents native to CA
TJM synonyms: Encelia farinosa var. phenicodonta (S. F. Blake) I. M. Johnst.
Correspondence 1: Treatment and author notes submitted for TJM2
Editorial Comments 1: Correspondence 1 indicates that for TJM2 Encelia farinosa &times; E. frutescens is to be partially treated [included in the key, but with description only online].
Current Status: 10a, accepted name for taxonomically recognized and/or fertile hybrid (non-hybrid form of name)
Current Status Authority: TJM

TNOAN: Encelia californica &times; farinosa
TAN: Encelia californica Nutt. &times; Encelia farinosa A. Gray ex Torr
Family: ASTERACEAE
Source: Simpson, M. G., and J. P. Rebman, 1996. Checklist of the Vascular Plants of San Diego County. 3rd edition. SDSU Herbarium Press, San Diego, CA; added manually by Rosatti
Comments: stability, fertility not specified in Simpson & Rebman, 1996, possibly unknown.
Correspondence 1: 24 Jan 2003 e-mail from Curtis Clark: Hybrid is fertile.
Editorial Comments 1: Correspondence 1 indicates that, according to Curtis Clark, TJM author of Encelia, this hybrid is fertile.
Correspondence 2: Treatment and author notes submitted for TJM2
Editorial Comments 2: Correspondence 2 indicates that for TJM2 Encelia farinosa &times; E. frutescens is to be partially treated [included in the key, but with description only online], with no mention of Encelia californica &times;Encelia farinosa.
Summary: addition, for evidently unnamed hybrid
Current Status: tentative 10a, accepted name for taxonomically recognized and/or fertile hybrid (non-hybrid form of name)
Current Status Authority:
Current Status Date: 24 Jan 2003

TNOAN: Leptosiphon aureus
TAN: Leptosiphon aureus Benth.
AUTH: Benth.
Family: POLEMONIACEAE
Source: Correspondence 1
Correspondence 1: Treatment and author notes submitted for Revision 9 of the Jepson eFlora
Editorial Comments 1: Correspondence 1 indicates that Leptosiphon acicularis (Greene) Jeps. is to be treated as Leptosiphon aureus Benth., which has nomenclatural priority.
Summary: addition, due to nomenclatural priority
Current Status: 1, accepted name for taxon native to CA
Current Status Authority: JFP
Current Status Date: 21 Dec 2021 

TNOAN: Leptosiphon aureus (Nutt.) of various auth. non Benth.
TAN: Leptosiphon aureus (Nutt.) Benth. ex E. Vilm.
AUTH: (Nutt.) of various auth. non Benth.
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
Current Name: Leptosiphon chrysanthus

TNOAN: Leptosiphon acicularis
TAN: Leptosiphon acicularis (Greene) Jeps.
AUTH: (Greene) Jeps.
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
Current Name: Leptosiphon aureus

TNOAN: Linanthus acicularis
TAN: Linanthus acicularis Greene
AUTH: Greene
Family: POLEMONIACEAE
Source: TJM
Correspondence 1: 2 Feb 20004 e-mail from Doreen Smith: Hi Tom, I found the most recent article on the Linanthus/ Leptosiphon androsaceus complex in Madrono vol. 48, No. 2 pp.62-78 by Robyn Battaglia and Robert Patterson.//They give the name " Leptosiphon androsaceus Benth." in their treatment of this section of Linanthus/ Leptosiphon. The other changes of this section of" Linanthus" back to "Leptosiphon" are there too, several of those are in the other databases but this got missed.//Regards, Doreen Smith
Editorial Comments 1: Correspondence 1 indicates that several taxonomic and nomenclatural changes in this group were made by Battaglia & Patterson in Madrono 48:62-78, 2001. [including Linanthus acicularis Greene treated as Leptosiphon acicularis (Greene) Jeps.]
Correspondence 2: 23 Apr 2004 e-mail from Margriet Wetherwax, including copy of e-mail from Wetherwax to Misa Ward: Tom, ICPN has the same Madrono article cited - the 2 cited here are probably more helpful to the general public. Thanks, Margriet//Hi, Misa, The Madrono citation is ok, but the more important papers are//Bell, C.D., and R. Patterson. 2000. Molecular phylogeny and biogeography of Linanthus (Polemoniaceae). Amer. J. Bot. 87(12):1857-1870//Porter, J. Mark, and L.A. Johnson. 2000. A phylogenetic classification of Polemoniaceae. Aliso 19(1): 55-91.//The latter paper moved the various species of Linanthus into Leptosiphon.//The paper that is cited now just uses the Leptodactylon name, the other 2 papers explain why this is being done.//Best, Margriet
Editorial Comments 2: Correspondence 2 cites two other papers of relevance: Bell, C. D., and R. Patterson. 2000. Molecular phylogeny and biogeography of Linanthus (Polemoniaceae). Amer. J. Bot. 87(12):1857-1870; Porter, J. M., and L. A. Johnson. 2000. A phylogenetic classification of Polemoniaceae. Aliso 19(1): 55-91.
Summary: rejection, different genus since TJM
Current Status: 1a, taxonomic or nomenclatural synonym for taxon native to CA
Current Status Authority: Robert W. Patterson, as Author, JFP
Current Status Date: 19 Feb 2004
Current Name: Leptosiphon aureus

TNOAN: Linanthus aureus subsp. aureus
TAN: Linanthus aureus (Nutt.) Greene subsp. aureus
AUTH: (Nutt.) Greene
Family: POLEMONIACEAE
Source: TJM
Comments: since TJM, treated as <sn>Leptosiphon aureus subsp. aureus</sn> by J. M. Porter & L. A. Johnson (A Phylogenetic Classification of Polemoniaceae, Aliso 19(1):55-91. 2000)
Correspondence 1: 14 May 2003 e-mail from Jeff Greenhouse: Dave Keil, in a 4/25/03 e-mail to M. Wetherwax, states "For Linanthus aureus (TJM p. 842) add WTR (n slope) and pinyon pine-oak-juniper woodland as habitat. We have several collections from the Mt. Pinos area (Fraser State Park, 5 mi w of Lebec, Rodin 5832; Valle Vista CG, Keil 12227; between Lake of the Woods and Fraser Park, Keil 12248). There are SMASCH records from this region as well." Bob Patterson (TJM author for Linanthus), in a 5/8/03 e-mail states "By all means make the changes for subsp. aureus (only). This range 'extension' doesn't surprise me at all. subsp. decorus, however, is a more eastern entity and I doubt that it occurs so far west." DECISION JAG/BGB 5/13/03: add WTR (n slope) to the range and pinyon pine-oak-juniper woodland to the habitat for Linanthus aureus subsp. aureus per TJM author
Editorial Comments 1: Correspondence 1 indicates that: according to Dave Keil, WTR (n slope) and pinyon pine-oak-juniper woodland should be added to the geographic range and habitat statement, respectively, for Linanthus aureus; however, according to Bob Patterson (TJM author for Linanthus), these changes are to be made only for Linanthus aureus subsp. aureus, as Linanthus aureus subsp. decorus is a more eastern entity and probably does not occur so far west.
Correspondence 2: Treatment and author notes submitted for TJM2 by Robert W. Patterson & Robyn Battaglia
Editorial Comments 2: Correspondence 2 indicates that for TJM2 Linanthus aureus (Nutt.) Greene subsp. aureus is to be treated as a syn of Leptosiphon aureus (Nutt.) Benth. ex E. Vilm. subsp. aureus.
Summary: probable rejection, different genus since TJM; rejection, different genus since TJM
Current Status: 1a, taxonomic or nomenclatural synonym for taxon native to CA
Current Status Authority: TJM2
Current Status Date: 18 Dec 2007
Current Name: Leptosiphon chrysanthus subsp. chrysanthus

TNOAN: Linanthus aureus subsp. decorus
TAN: Linanthus aureus subsp. decorus (A. Gray) H. Mason
AUTH: (A. Gray) H. Mason
Family: POLEMONIACEAE
Source: TJM
Comments: since TJM, treated as <sn>Leptosiphon aureus subsp. decorus</sn> by J. M. Porter & L. A. Johnson (A Phylogenetic Classification of Polemoniaceae, Aliso 19(1):55-91. 2000)
Correspondence 1: 14 May 2003 e-mail from Jeff Greenhouse: Dave Keil, in a 4/25/03 e-mail to M. Wetherwax, states "For Linanthus aureus (TJM p. 842) add WTR (n slope) and pinyon pine-oak-juniper woodland as habitat. We have several collections from the Mt. Pinos area (Fraser State Park, 5 mi w of Lebec, Rodin 5832; Valle Vista CG, Keil 12227; between Lake of the Woods and Fraser Park, Keil 12248). There are SMASCH records from this region as well." Bob Patterson (TJM author for Linanthus), in a 5/8/03 e-mail states "By all means make the changes for subsp. aureus (only). This range 'extension' doesn't surprise me at all. subsp. decorus, however, is a more eastern entity and I doubt that it occurs so far west." DECISION JAG/BGB 5/13/03: add WTR (n slope) to the range and pinyon pine-oak-juniper woodland to the habitat for Linanthus aureus per TJM author
Editorial Comments 1: Correspondence 1 indicates that: according to Dave Keil, WTR (n slope) and pinyon pine-oak-juniper woodland should be added to the geographic range and habitat statement, respectively, for Linanthus aureus; however, according to Bob Patterson (TJM author for Linanthus), these changes are to be made only for Linanthus aureus subsp. aureus, as Linanthus aureus subsp. decorus is a more eastern entity and probably does not occur so far west.
Correspondence 2: Treatment and author notes submitted for TJM2 by Robert W. Patterson & Robyn Battaglia
Editorial Comments 2: Correspondence 2 indicates that for TJM2 Linanthus aureus subsp. decorus (A. Gray) H. Mason is to be treated as a syn of Leptosiphon aureus (Nutt.) Benth. ex E. Vilm. subsp. decorus (A. Gray) J. M. Porter & L. A. Johnson.
Summary: probable rejection, different genus since TJM; rejection, different genus since TJM
Current Status: 1a, taxonomic or nomenclatural synonym for taxon native to CA
Current Status Authority: TJM2
Current Status Date: 18 Dec 2007
Current Name: Leptosiphon chrysanthus subsp. decorus

TNOAN: Linanthus aureus
TAN: Linanthus aureus (Nutt.) Greene
AUTH: (Nutt.) Greene
Family: POLEMONIACEAE
Source: TJM
Comments: since TJM, treated as <sn>Leptosiphon aureus</sn> by J. M. Porter & L. A. Johnson (A Phylogenetic Classification of Polemoniaceae, Aliso 19(1):55-91. 2000)
Correspondence 1: 14 May 2003 e-mail from Jeff Greenhouse: Dave Keil, in a 4/25/03 e-mail to M. Wetherwax, states "For Linanthus aureus (TJM p. 842) add WTR (n slope) and pinyon pine-oak-juniper woodland as habitat. We have several collections from the Mt. Pinos area (Fraser State Park, 5 mi w of Lebec, Rodin 5832; Valle Vista CG, Keil 12227; between Lake of the Woods and Fraser Park, Keil 12248). There are SMASCH records from this region as well." Bob Patterson (TJM author for Linanthus), in a 5/8/03 e-mail states "By all means make the changes for subsp. aureus (only). This range 'extension' doesn't surprise me at all. subsp. decorus, however, is a more eastern entity and I doubt that it occurs so far west." DECISION JAG/BGB 5/13/03: add WTR (n slope) to the range and pinyon pine-oak-juniper woodland to the habitat for Linanthus aureus per TJM author
Editorial Comments 1: Correspondence 1 indicates that: according to Dave Keil, WTR (n slope) and pinyon pine-oak-juniper woodland should be added to the geographic range and habitat statement, respectively, for Linanthus aureus; however, according to Bob Patterson (TJM author for Linanthus), these changes are to be made only for Linanthus aureus subsp. aureus, as Linanthus aureus subsp. decorus is a more eastern entity and probably does not occur so far west.
Correspondence 2: Treatment and author notes submitted for TJM2 by Robert W. Patterson & Robyn Battaglia
Editorial Comments 2: Correspondence 2 indicates that for TJM2 Linanthus aureus (Nutt.) Greene is to be treated as a syn of Leptosiphon aureus (Nutt.) Benth. ex E. Vilm..
Summary: probable rejection, different genus since TJM; rejection, different genus since TJM
Current Status: 1a, taxonomic or nomenclatural synonym for taxon native to CA
Current Status Authority: TJM2
Current Status Date: 18 Dec 2007
Current Name: Leptosiphon chrysanthus




EOP



}
foreach(sort(@badtag, @SN)){
	print ERR "$_\n" unless m/Version Date:/;
	warn "$_\n" unless m/Version Date:/;
}


print <<EOP;

TAXON ENTRIES PASSED: $GOOD

EOP

sub get_taxon_name {
    my $par = shift; #each paragraph is separated by a blank line
    if( $lines[0] =~ m/(X? ?[A-Z][a-z]+)/){ #if the first line starts with...
    	return $lines[0]; #the name is the contents of the first line
    }
	else{
		print ERR "$.-->Bad Taxon Name: $_\n";
		print "$.-->Bad Taxon Name: $_\n";
	}
}

sub get_author {
    my ($input) = @_;
    return "" unless defined $input && $input =~ /\S/;

    # 1. Preliminary Cleanup
    my $auth = $input;
    $auth =~ s/ [Xx×] / &times;/g;
    $auth =~ s/\s+/ /g;
    $auth =~ s/^\s+|\s+$//g;
    # Note: Don't delete commas yet if you want to keep "L., ex Gray" 
    # but for author-only extraction, removing them is usually fine.
    $auth =~ s/,//g; 

    # 2. Standardize Ranks
    $auth =~ s/ (?:subsp|ssp)\.? / subsp. /ig;
    $auth =~ s/ (?:forma|form|fo|f)\.? / f. /ig; # Care with f. vs Hook f.
    $auth =~ s/ (?:var|v)\.? / var. /ig;

    # Protect (Nutt.) Benth. & Hook. f. ex W. H. Brewer (and similar) so it isn't confused with rank f.
    $auth =~ s/Hook\. f\. ex/Hook. filius ex/ig;

    # 3. Handle Placeholder names
    return "" if $auth =~ /^(?:sp|spp|undet|indet)\b/i;
    $auth =~ s/ (?:sp|spp|undet|indet)\b.*$//i;

    # 4. REGEX DEFINITIONS
    # Genus: Uppercase start
    my $G    = qr/[A-Z][A-Za-z-]+/;
    # Epithet: lowercase
    my $E    = qr/[a-z-]+/;
    # Rank: standardized markers
    my $R    = qr/(?:subvar\.|subsp\.|var\.|f\.|nothosubsp\.)/;
    # Hybrid: 
    my $X    = qr/&times;/;
    # Authority: This is the tricky part. 
    # It usually starts with a capital letter, a parenthesis, or &
    my $A    = qr/(?:[\(A-Z&].*)/; 

    # 5. MATCHING HIERARCHY
    
    # CASE A: Infraspecifics (Genus + Species + [SpeciesAuth] + Rank + InfraEpithet + [InfraAuth])
    # Matches: "Abies magnifica A. Murray var. magnifica L."
    # Matches: "Abies magnifica var. magnifica L."
    if ($auth =~ /^$G\s+$E(?:\s+(.+?))?\s+$R\s+$E(?:\s+(.+))?$/) {
        my $sp_auth = $1 || "";
        my $infra_auth = $2 || "";
        # Usually, "get_author" for an infra-taxon returns the infra-author
        return $infra_auth ne "" ? $infra_auth : $sp_auth;
    }

    # CASE B: Hybrids (Genus + &times;species + Auth)
    if ($auth =~ /^$G\s+$X$E\s+(.+)$/) {
        return $1;
    }

    # CASE C: Nothogenus (&times;Genus + species + Auth)
    if ($auth =~ /^$X$G\s+$E\s+(.+)$/) {
        return $1;
    }

    # CASE D: Standard Binomial (Genus + Species + Authority)
    if ($auth =~ /^$G\s+$E\s+(.+)$/) {
        return $1;
    }

    # CASE E: Genus only
    if ($auth =~ /^$G$/) {
        return "";
    }

    return ""; # If no author found, return empty


#Key Improvements Made:
#
#Variable Scope: Replaced $name with $auth (or the internal $input).
#Greediness Control: Used (.+?) (non-greedy) for the Species Authority and (.+) (greedy) for the trailing Infraspecific Authority. This allows the regex to "stop" when it sees a rank like var. or subsp..
#Hook. f. Protection: Your "filius" swap was good, but ensure it handles the trailing period correctly so it doesn't get caught by the $R (rank) regex.
#Rank Matching: I improved the rank regex to ensure it doesn't accidentally capture the species epithet.
#Hierarchy Logic:
#
#In a string like Abies magnifica A. Murray var. magnifica L., the species author is A. Murray and the infra author is L..
#The code now captures both. I set it to return the $infra_auth if it exists, as that is standard for CCH (Consortium of California Herbaria) style data parsing.
#
#Testing Examples:
#
#"Quercus agrifolia Née" $\rightarrow$ Returns "Née"
#"Abies magnifica var. magnifica L." $\rightarrow$ Returns "L."
#"Iris &times;thompsonii H.C. Foster" $\rightarrow$ Returns "H.C. Foster"
#"Encelioides (Cav.) Benth. & Hook. filius ex A. Gray subsp. exauriculata" $\rightarrow$ Returns "" (since there is no author provided after the subspecies epithet). If you want the species author in that case, the logic return $infra_auth ne "" ? $infra_auth : $sp_auth; handles it.
#
}

sub strip_name {
    my ($name) = @_;

#print "SAPONARIA: $_" if m/saponaria/;


s/Uva-Ursi pechoensis.*/Uva-ursi pechoensis/;

if(m/^Fragaria ?.* ?ananassa Duchesne var. cuneifolia ?.*/){
return("Fragaria X ananassa var. cuneifolia");
next;
}

if(m/^Leptosiphon aureus \(Nutt\.\) Benth\. ex E\. Vilm\.$/){
return("Leptosiphon aureus (Nutt.) of various auth. non Benth.");
next;
}

#The original CCH.pm strip name routine was difficult to maintain.
#To streamline this logic, we should move away from the "strip noise" approach and toward a "capture the core components" approach.
#The original code is difficult to maintain because it uses a long chain of s/// || s///:
#s/^([A-Z][A-Za-z-]+) ([-a-z]+) ?.* (subvar\.|subsp\.|var\.|f\.|nothosubsp\.) ([-a-z]+).*/$1 $2 $3 $4/ ||
#s/^([A-Z][A-Za-z-]+) (&times;)([-a-z]+) .+/$1 $2$3/||
#s/^([A-Z][A-Za-z-]+) (&times;)([-a-z]+)/$1 $2$3/||
#s/^([A-Z][A-Za-z-]+) ([-a-z]+) .+/$1 $2/||
#s/^([A-Z][A-Za-z-]+) ([-a-z]+)/$1 $2/||
#s/^(&times;)([A-Z][a-z-]+) ([-a-z]+) (.+)/$1$2 $3/||
#s/^(&times;)([A-Z][a-z-]+) ([-a-z]+)/$1$2 $3/;

#If one regex matches, the rest are skipped, which can lead to "partial strips."
#This is the improved strip_name subroutine. 
#It consolidates the patterns into a hierarchy: it looks for the most complex name first (infraspecifics), then hybrids, then simple binomials.

    # Return an empty string if input is undefined or just whitespace
    return "" unless defined $name && $name =~ /\S/;

# 1. Basic Safety & Whitespace
    #Preliminary cleanup: remove internal double spaces and trim
	$name =~ s/ [Xx×] / &times;/g;# Ensure entity consistency
    $name =~ s/\s+/ /g;
    $name =~ s/^\s+|\s+$//g;
    $name =~ s/,//g; #delete stray commas

    # 2. Standardize Ranks (Prevents mismatching 'ssp' vs 'subsp.')
    $name =~ s/ (?:subsp|ssp)\.? / subsp. /ig;
    $name =~ s/ (?:forma|form|fo)\.? / f. /ig;
    $name =~ s/ var / var. /ig;

	#Verbesina encelioides (Cav.) Benth. & Hook. f. ex A. Gray subsp. exauriculata
	#Rhus integrifolia (Nutt.) Benth. & Hook. f. ex W. H. Brewer & S. Watson
	#this does not parse correctly, gets confused with forma "f."
	$name =~ s/Hook\. f\. ex /Hook. filius ex /i;

    # 3. Handle Placeholder names (sp., undet., etc.)
    # If the name is just "Carex sp.", we want to return just "Carex"
    $name =~ s/ (?:sp|spp|undet|indet)\b.*$//i;



    # 4. CORE TAXONOMIC CAPTURE HIERARCHY
    # We define the parts:
    my $G    = qr/([A-Z][A-Za-z-]+)/;                        # Genus
    my $E    = qr/([-a-z]+)/;                                 # Epithet (species or infra)
    my $R    = qr/(subvar\.|subsp\.|var\.|f\.|nothosubsp\.)/; # Rank
    my $X    = qr/(&times;)/;                                 # Hybrid symbol
    my $AUTH = qr/[\w&;'().\- ]+/;                            # Catch-all for Authority/Noise

    # CASE A: Infraspecifics (Genus + Species + [Auth] + Rank + InfraEpithet)
    # Matches: "Abies magnifica [A. Murray] var. magnifica [L.]"
    if ($name =~ /^$G $E $AUTH $R $E/o || $name =~ /^$G $E $R $E/o) {
        return "$1 $2 $3 $4";
    }

    # CASE B: Hybrids with Nothospecies marker (Genus + &times;species)
    # Matches: "Iris &times;thompsonii [H.C. Foster]"
    if ($name =~ /^$G $X$E/o) {
        return "$1 $2$3";
    }

    # CASE C: Nothogenus (&times;Genus + species)
    # Matches: "&times;Agrohordeum macounii"
    if ($name =~ /^$X$G $E/o) {
        return "$1$2 $3";
    }

    # CASE D: Standard Binomial (Genus + Species + [Authority])
    # Matches: "Quercus agrifolia [Née]"
    if ($name =~ /^$G $E/o) {
        return "$1 $2";
    }

    # CASE E: Genus only (Genus + [Noise])
    if ($name =~ /^$G/o) {
        return $1;
    }

    # If no patterns match, return trimmed original
    return $name;

}

sub get_today {
#usage: add the following line before processing records:
#$today_ymd = &CCH::get_today;
#!/usr/local/bin/perl
	my $datestring = strftime "%F %Z", localtime;
	return ($datestring);
}
