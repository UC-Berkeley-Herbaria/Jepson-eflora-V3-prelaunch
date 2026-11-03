
my ($remain,$G1,$G2,$G3) = "";
my ($C1a,$C2a,$C3a,$C4a,$C5a,$C6a,$C7a,$C11a,$C12a,$C1,$C2,$C3,$C4,$C5,$C6,$C7,$C10) = "";



open(ERR, ">output/fam_keybase_log.txt") || die;

open (OUT, ">input/eflora_key_to_families_for_keybase.txt");

open(IN, "../Synonymy/input/smasch_taxon_ids.txt") || die;
local($/)="\n";
while(<IN>){
	chomp;
	($code,$name,@residue)=split(/\t/);

$name=~s/ X / &times;/;

	$NAME_TO_CODE{$name}=$code;
	$CODE_TO_NAME{$code}=$name;
}

foreach(keys(%NAME_TO_CODE)){
print "$_\n" if m/acutidens/;

}

$file="input/eflora_family_key.txt";
	undef($/);
	open(IN,$file) || die "couldn't open $file\n";
warn "reading from $file\n";

	$all_lines=<IN>;
		
	@all_pars=split(/\n\n+/,$all_lines);

foreach(@all_pars){


		s/{\/.*?}//g;

next if m/^#/;
warn "DUPLINES: $_\n" if $seen_line{$_}++;
next if m/^Admin/;
next if m/^PROOF:/;
next if m/^CAPTION:/;
next if m/^Key to California/;
next if m/^SCI_ED:/;
next if m/^KEY_PAR:/;

if (s/^GROUP: (.+)/$1/){}

				@lines=split("\n",$_);

		s/([0-9])-([0-9])/$1&ndash;$2/g;

#while(s/_/<i>/){
#s/_/<\/i>/;
#}
#print "$_</p>";

###################### KEYS ##########################
if( m/^(Key To Groups|1\.|Group \d+:)/){

	$uk="";
		print ERR "$file KEY $&\n\n";
		#print "\n\n\n";
			@lines=split(/\n/);
			$lines[$#lines]="" if $lines[$#lines]=~/^PROOF:/;
			
		if ($lines[0]=~/^(Key To Groups)/){
			print ERR "KEY $lines[0]\n\n";
			$uk=shift(@lines);
			print ERR "KEY $lines[0]\n\n";
		}
		if ($lines[0]=~/^(Group) (\d+)/){
			print ERR "KEY $lines[0]\n\n";
			$uk=shift(@lines);
			print ERR "KEY $lines[0]\n\n";
		}
		foreach(@lines[0 .. $#lines]){
			if(m/--[0-9]+\(--[0-9]/ || m/[0-9]--\)[0-9]+--/){
				s/(--[0-9]+\()--([0-9]+)/$1$2/g;
				s/([0-9]+)--\)([0-9]+--)/$1)$2/g;
			}
 #CUPRESSACEAE (_Juniperus_)
 #MYRTACEAE ([_Chamelaucium_])
 ##WOODSIACEAE (_Athyrium filix-femina_ var. _cyclosporum_)

 ##POACEAE (_Poa bulbosa_ subsp. _vivipara_)
  
#Fix lines & links in the key that cannot be converted as written into Keybase

 ##ONAGRACEAE (_Epilobium_, _Neoholmgrenia_)

 ##ALLIACEAE ([_Allium sativum_], _Allium vineale_)
s/head or umbel \.+-> ALLIACEAE \(\[_Allium sativum_\], _Allium vineale_\)/head or umbel (_Allium sativum_ OR _Allium vineale_)\tALLIACEAE {Allium}\tVERBATIM NAME:ALLIACEAE Allium/;
 #ALISMATACEAE or HYDROCHARITACEAE
s/between prominent main veins \.+-> ALISMATACEAE or HYDROCHARITACEAE/between prominent main veins (see also the key to ALISMATACEAE) .....-> HYDROCHARITACEAE/;
 #BRASSICACEAE (_Nasturtium_, _Rorippa_)
s/rounded teeth \.+-> BRASSICACEAE \(_Nasturtium_, _Rorippa_\)/rounded teeth (_Nasturtium_ OR _Rorippa_) .....-> BRASSICACEAE/g;
 #PHRYMACEAE or PLANTAGINACEAE
s/Leaf veins palmate \.+-> PHRYMACEAE or PLANTAGINACEAE/Leaf veins palmate (see also the key to PHRYMACEAE) .....-> PLANTAGINACEAE/;
s/Leaves toothed \.+-> PHRYMACEAE or PLANTAGINACEAE/Leaves toothed (see also the key to PLANTAGINACEAE) .....-> PHRYMACEAE/;
 ##ONAGRACEAE (_Ludwigia_) or PLANTAGINACEAE (_Veronica_) 
s/stems not swollen \.+-> ONAGRACEAE \(_Ludwigia_\) or PLANTAGINACEAE \(_Veronica_\) \(\d\)/stems not swollen (see also _Ludwigia_ ONAGRACEAE) .....-> PLANTAGINACEAE (_Veronica_)/; 
#Fabaceae {Papilionoideae} change to Fabaceae Group 3
s/FABACEAE \(Papilionoideae\)/Fabaceae Group 3/;
s/FABACEAE \(Mimosoideae\)/Fabaceae Group 1/;

#PAPAVERACEAE (Papaveroideae)
s/open flower \.+-> PAPAVERACEAE \(?\d?\)? ?\(Papaveroideae\) \{.+/open flower (Papaveroideae, see PAPAVERACEAE couplet 5) .....-> PAPAVERACEAE/g;
s/milky or colored \.+-> PAPAVERACEAE \(Papaveroideae\) \{.+/milky or colored (Papaveroideae, see PAPAVERACEAE couplet 5) .....-> PAPAVERACEAE/g;
s/flower and fruit \.+-> PAPAVERACEAE \(?\d?\)? ?\(Papaveroideae\) \{.+/flower and fruit (Papaveroideae, see PAPAVERACEAE couplet 5) .....-> PAPAVERACEAE/g;
s/\.+-> PAPAVERACEAE \(Papaveroideae\).*/(Papaveroideae, see PAPAVERACEAE couplet 5) .....-> PAPAVERACEAE/g;
 #PAPAVERACEAE (Fumarioideae)
s/cluster \.+-> PAPAVERACEAE \(Fumarioideae\)/cluster (Fumarioideae, see PAPAVERACEAE couplet 2) .....-> PAPAVERACEAE/g;
 #.....-> CAMPANULACEAE (_Githopsis_, _Heterocodon_, _Triodanis_)
s/spreading \.+-> CAMPANULACEAE \(_Githopsis_, _Heterocodon_, _Triodanis_\)/spreading .....-> CAMPANULACEAE/g;
 #.....-> ONAGRACEAE (_Epilobium_, _Neoholmgrenia_)
s/not separating \.+-> ONAGRACEAE \(_Epilobium_, _Neoholmgrenia_\)/not separating (_Epilobium_ OR _Neoholmgrenia_) .....-> ONAGRACEAE/g;
# .....-> NYCTAGINACEAE (_Acleisanthes_, _Mirabilis albida_)
s/ribbed around fruit \.+-> NYCTAGINACEAE \(_Acleisanthes_, _Mirabilis albida_\)/ribbed around fruit (_Acleisanthes_ OR _Mirabilis albida_) .....-> NYCTAGINACEAE/g;
# .....-> PLANTAGINACEAE (_Antirrhinum_, _Dopatrium_, _Nuttallanthus_)
s/a raceme \.+-> PLANTAGINACEAE \(_Antirrhinum_, _Dopatrium_, _Nuttallanthus_\)/a raceme (_Antirrhinum_, _Dopatrium_, OR _Nuttallanthus_) .....-> PLANTAGINACEAE/g;
# .....-> RANUNCULACEAE (_Actaea_, _Consolida_)
s/a raceme \.+-> RANUNCULACEAE \(_Actaea_, _Consolida_\)/a raceme (_Actaea_ OR _Consolida_) .....-> RANUNCULACEAE/g;

			s/([0-9])-([0-9])/$1&ndash;$2/;
			s/---/&mdash;/g;
			s/\.+[-_]*>/--&gt;/g;
			s/-+>/--&gt;/g;

#WOODSIACEAE (_Athyrium filix-femina_ var. _cyclosporum_)
			if(m!--&gt; +[A-Z]+ACEAE.+_([A-Z][a-z-]+ [a-z-]+)_ (nothosubsp\.|subsp\.|var\.) _([a-z-]+)_!){
				$target = "$1 $2 $3";
#print "$target\n";
				$goto_code= $NAME_TO_CODE{"$target"} || "C1";
				++$C1a;
				if($goto_code eq "C1"){
					#print qq{ERROR >$target< code=$goto_code\n\n};
					++$C1;
				}
			s!--&gt; +([A-Z]+ACEAE).+([A-Z][a-z-]+ [a-z-]+)_ (nothosubsp\.|subsp\.|var\.) _([a-z-]+_)!\t$1 {$2 $3 $4}\tVERBATIM NAME:$1 $2 $3 $4!;
			}
 ##ERANIACEAE (_Pelargonium_) (2) {G24}
 #SAPINDACEAE (_Acer_) {G7,12}
 #RUBIACEAE ([_Coprosma_]) {G9}
			elsif(m!--&gt; [A-Z]+ACEAE \(\[?_([A-Z][a-z-]+)_\]?\) \(?[0-9]*\)? ?\{[0-9G,]+\}!){
				$target = $1;
				$goto_code= $NAME_TO_CODE{"$target"} || "C2";
				++$C2a;
				if($goto_code eq "C2"){
					print qq{ERROR >$target< code=$goto_code\n\n};
					++$C2;
				}
				s!--&gt; ([A-Z]+ACEAE) \(_([A-Z][a-z-]+)_\) \(?[0-9]*\)? ?\{[0-9G,]+\}!\t$1 {$2}\tVERBATIM NAME:$1 $2!;
			}
 #BRASSICACEAE (2) {G2,15,20}
 #GROSSULARIACEAE (2)
			elsif(m!--&gt; \[?([A-Z]+ACEAE)\]? \([0-9]+\) ?\{?[0-9G,]*\}?!){
				$target = ucfirst(lc($1));
				++$C3a;
				$goto_code= $NAME_TO_CODE{"$target"} || "C3";
				if($goto_code eq "C3"){
					print qq{ERROR >$target< code=$goto_code\n\n};
					++$C3;
				}
				s!--&gt; \[?([A-Z]+ACEAE)\]? \([0-9]+\) ?\{?[0-9G,]*\}?!\t$1\tVERBATIM NAME:$1!;
			}
 ##VIOLACEAE {G5,15,20}
			elsif(m!--&gt; ([A-Z]+ACEAE) ?\(?[0-9]*\)? ?\{[0-9G,]+\}!){
				$target = ucfirst(lc($1));
				++$C4a;
				$goto_code= $NAME_TO_CODE{"$target"} || "C4";
				if($goto_code eq "C4"){
					print qq{ERROR >$target< code=$goto_code\n\n};
					++$C4;
				}
				s!--&gt; ([A-Z]+ACEAE) ?\(?[0-9]*\)? ?\{[0-9G,]+\}!\t$1\tVERBATIM NAME:$1!;
			}
#SAPINDACEAE (_Acer glabrum_) {G9}
			elsif(m!--&gt; [A-Z]+ACEAE \(\[?_([A-Z][a-z-]+ [a-z-]+)_\]?\) \(?[0-9]*\)? ?\{[0-9G,]+\}!){
				$target = $1;
				++$C5a;
				$goto_code= $NAME_TO_CODE{"$target"} || "C5";
				if($goto_code eq "C5"){
					print qq{ERROR >$target< code=$goto_code\n\n};
					++$C5;
				}
				s!--&gt; ([A-Z]+ACEAE) \(\[?_([A-Z][a-z-]+ [a-z-]+)_\]?\) \(?[0-9]*\)? ?\{[0-9G,]+\}!\t$1 {$2}\tVERBATIM NAME:$1 $2!;
			}
##EUPHORBIACEAE (_Croton setigerus_)
 ##BALSAMINACEAE ([_Impatiens capensis_])
			elsif(m!--&gt; [A-Z]+ACEAE \(\[?_([A-Z][a-z-]+ [a-z-]+)_!){
				$target = $1;
				++$C6a;
				$goto_code= $NAME_TO_CODE{"$target"} || "C6";
				if($goto_code eq "C6"){
					print qq{ERROR >$target< code=$goto_code\n\n};
					++$C6;
				}
				s!--&gt; ([A-Z]+ACEAE) \(\[?_([A-Z]+[a-z-]+ [a-z-]+)_\]?\)!\t$1 {$2}\tVERBATIM NAME:$1 $2!;
			}
#ALLIACEAE (Allium)
			elsif(m!--&gt; [A-Z]+ACEAE \(\[?_?([A-Z][a-z-]+)_?\]?\)!){
				$target = $1;
				++$C7a;
				$goto_code= $NAME_TO_CODE{"$target"} || "C7";
				if($goto_code eq "C7"){
					print qq{ERROR >$target< code=$goto_code\n\n};
					++$C7;
				}
				s!--&gt; ([A-Z]+ACEAE) \(\[?_([A-Z][a-z-]+)_\]?\)!\t$1 {$2}\tVERBATIM NAME:$1 $2!;
			}
			
	
 #[BASELLACEAE]
			elsif(m!--&gt; \[([A-Z]+ACEAE)\]!){
				$target = $1;
				++$C11a;
				s!--&gt; \[([A-Z]+ACEAE)\]!\t$1\tVERBATIM NAME:$1!;
			}
 #PARNASSIACEAE
			elsif(m!--&gt; ([A-Z]+ACEAE)!){
				$target = $1;
				++$C12a;
				s!--&gt; ([A-Z]+ACEAE)!\t$1\tVERBATIM NAME:$1!;
			}
 #Group 10
			elsif( m!--&gt; (Group) (\d+)!){
				s!--&gt; *(Group) (\d+)!\t$1 $2\tVERBATIM NAME:$1 $2!;
				++$G1;
			}
#Fabaceae Group 10
			elsif( m!--&gt; [A-Z][a-z]+aceae Group \d+!){
				s!--&gt; ([A-Z][a-z]+aceae) (Group \d+)!\t$1 $2\tVERBATIM NAME:$1 $2!;
				++$G2;
			}
			elsif(m!--&gt; (.*_([A-Z]+[a-z-]+)_.*)!){
				print "PROBLEM NAME: $1\n";
			++$C10;
			}
			elsif(!/--&gt; /){
			++$G3;
			}
			else{
				++$remain;
				print "PROBLEM KEY: $_\n";
			}

			if(m/--[0-9]+\(--[0-9]/ || m/[0-9]--\)[0-9]+--/){
				s/(--[0-9]+\()--([0-9]+)/$1$2/g;
				s/([0-9]+)--\)([0-9]+--)/$1)$2/g;
			}
			s/--([^&])/&ndash;$1/g;
			s|\+/-|&plusmn;|g;
			s|\+-|&plusmn;|g;
			s/ > or =/ &ge;/g;
			s/([A-Za-z])_([A-Za-z])/$1&95;$2/g;
			while(s/_/<i>/){
				s/_/<\/i>/;
			}
 			s/&95;/_/g;

		}
		$keybase=join("\n",@lines);

	if(length($uk) > 2){
		print OUT $uk."\n";
	}
	else{

		print OUT $keybase."\n##########END OF KEY\n";
	}

}
#print;
}
######################################################
######################################################

print <<EOP;
C1 Names FOUND: $C1a
C2 Names FOUND: $C2a
C3 Names FOUND: $C3a
C4 Names FOUND: $C4a
C5 Names FOUND: $C5a
C6 Names FOUND: $C6a
C7 Names FOUND: $C7a

C11 Names FOUND: $C11a
C12 Names FOUND: $C12a

Problem C1 Names: $C1
Problem C2 Names: $C2
Problem C3 Names: $C3
Problem C4 Names: $C4
Problem C5 Names: $C5
Problem C6 Names: $C6
Problem C7 Names: $C7

Problem C10 Names: $C10


Key Group Names Found(1): $G1
Key Group Names Found(2): $G2

Other Key Lines, no tag: $G3

Error Key Names: $remain
EOP
