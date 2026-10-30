
$smasch_ID_file="/JEPS-master/Jepson-eFlora/synonymy/input/smasch_taxon_ids.txt";
#$ICPN_file="/JEPS-master/Interchange/input/icpn_current.txt";
open(IN, "$smasch_ID_file") || die;
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

	s/=====.*\n.//;


	s/LINK.*FNA.*\n//;
	s/LINK.*Check the California Weed.*\n//;
	s/  +/ /g;
	s/ $//;
	s/ \n/\n/g;
s/(...)Effort: @/$1\nEffort: @/;

	#if(m/^(Admin|Family:)/){
	#	next;
	#}

	if(m/^[A-Z][A-Z][A-Z]/){
		print OUT;
		next;
	}
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
s/\n{\/.*}.*//g;
s/{\/.*?}//g;
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

	next if $. < 17;#defines the header section from the body based on the end line number where the first =========+========= is positioned  


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

	$name = &get_taxon_name($lines[0]);
	
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




	if(m/\n[Pp]roblem:.*/){  #skip Rosatti's personal note lines, not to be included in ICPN, causing errors
		warn "Rosatti note line still present in text file:\n$_\n";
		next;
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
					unless($TID{$cur_name}){
						warn "$.-->no code for $cur_name ==> stripped as $cur_name\n";
						print NOCODE  "no code for $cur_name ==> stripped as $cur_name\n";
					}
				
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
		s/^Current Status: *(pending) (\d+[a-z]?).*/CS: $1_$2/ ||
		s/^Current Status: *tentative (\d+[a-z]?).*/CS: $1_[t]/ ||
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

		s/Current Status: *(pending) (\d+[a-z]?).*/Current Status: $1_$2/;

	print OUT $name."\n";
	print OUT "TAN: ";
	print OUT;
	$lastline=$_;
	}


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


s/Uva-Ursi pechoensis.*/Uva-Ursi pechoensis/;

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


s/^([A-Z][a-z-]+) (\b[-a-z]+) [,A-Za-z\d&;'().\- ]+ (\bsubvar\.|\bsubsp\.|\bvar\.|\bf\.|\bnothosubsp\.) ([a-z-]+) [,A-Za-z\d&;'().\- ]+/$1 $2 $3 $4/ ||
s/^([A-Z][a-z-]+) (\b[-a-z]+) [,A-Za-z\d&;'().\- ]+ (\bsubvar\.|\bsubsp\.|\bvar\.|\bf\.|\bnothosubsp\.) ([-a-z]+)/$1 $2 $3 $4/ ||
s/^([A-Z][a-z-]+) (\b[-a-z]+) (\bsubvar\.|\bsubsp\.|\bvar\.|\bf\.|\bnothosubsp\.) ([-a-z]+) [,A-Za-z\d&;'().\- ]+/$1 $2 $3 $4/ ||
s/^([A-Z][a-z-]+) (\b[-a-z]+) (\bsubvar\.|\bsubsp\.|\bvar\.|\bf\.|\bnothosubsp\.) ([-a-z]+)/$1 $2 $3 $4/ ||
s/^([A-Z][a-z-]+) (\bX [-a-z]+) [,A-Za-z\d&;'().\- ]+/$1 $2/||
s/^([A-Z][a-z-]+) (\bX [-a-z]+)/$1 $2/||
s/^([A-Z][a-z-]+) (\b[-a-z]+) [,A-Za-z\d&;'().\- ]+/$1 $2/||
s/^([A-Z][a-z-]+) (\b[-a-z]+)/$1 $2/||
s/^(X [A-Z][a-z-]+) (\b[-a-z]+) [,A-Za-z\d&;'().\- ]+/$1 $2/||
s/^(X [A-Z][a-z-]+) (\b[-a-z]+)/$1 $2/;
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
