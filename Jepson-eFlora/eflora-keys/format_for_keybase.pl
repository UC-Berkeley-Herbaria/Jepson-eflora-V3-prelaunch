#formatter for eFlora that expects input with expanded abbreviations
use lib "/Users/Shared/Jepson-Master/Jepson-eFlora/Modules/";
use flatten;
use BerkeleyDB;
open (ERR, ">output/keybase_error.txt");


open (OUT, ">input/eflora_keys_for_keybase.txt");

open(IN, "../synonymy/input/smasch_taxon_ids.txt") || die;
local($/)="\n";
while(<IN>){
	chomp;
	($code,$name,@residue)=split(/\t/);

$name=~s/ X / &times;/;
	#$NAME_CODE{$name}=$code;
	#$TNOAN{$name}=$code;
	$NAN{$code}=$name;
	$NAME_TO_CODE{$name}=$code;
	$CODE_TO_NAME{$code}=$name;
}

#	foreach(keys(%NAME_TO_CODE)){
#print <<EOP;
#		name: $_
#		code: $NAME_TO_CODE{$_}
#
#EOP
#	}

#die;


foreach(keys(%NAME_TO_CODE)){
print "$_\n" if m/acutidens/;

#print "$_\n" if m/&times;/;
#print "$_\n";
}
#die;

close(IN);


$file="../eflora_database/input/eflora_treatments.txt";
	undef($/);
	open(IN,$file) || die "couldn't open $file\n";
warn "reading from $file\n";

	$all_lines=<IN>;
		
	@all_pars=split(/\n\n+/,$all_lines);

foreach(@all_pars){

next if m/^#/;
#warn "DUPLINES: $_\n" if $seen_line{$_}++;
next if m/^Admin/;
next if m/^PROOF:/;
next if m/^CAPTION:/;
		
		@lines=split("\n",$_);
		
		s/([0-9])-([0-9])/$1&ndash;$2/g;

#skip Astragalus tephrodes unabridged key lead
next if m/UNABRIDGED KEY LEAD: 29a\. Leaflets > 21/;
next if m/UNABRIDGED KEY LEAD: 29a' Leaflets <= 21/;

s/UNABRIDGED KEY LEAD: //g; 
#delete the unabridged phrase; most of these have been renumbered
#the color change will only show up in the eFlora; 
#unabridged and normals keys are indistriguishable in keybase


#foreach(@all_pars){
###################### KEYS ##########################
		#if( m/^1\./ || m/^UNABRIDGED KEY/ || m/^Group \d+[A-Z]?[.:]/ || m/^Key to Groups/ || m/^Key to Groups Based Primarily on Flowering Material/|| m/^Key to Groups Based on Fruiting Material/|| m/^Key to Pistillate Plants/|| m/^Key to Staminate Plants/|| m/^Key to Vegetative Plants/ || m/^Group \d+ *\n/){
		if( m/^(1\.|UNABRIDGED KEY|Group \d+[A-Z]?[.:]|Key to Groups Based .+|Key to Groups|Key to Pistillate Plants|Key to Staminate Plants|Key to Vegetative Plants|Group \d+[ .:])/){

			$uk="";
			print ERR "$file KEY $&\n\n";
			$exclude=0;
			@lines=split(/\n/);
			$lines[$#lines]="" if $lines[$#lines]=~/^PROOF:/;
			$indent_level=-1;
			
		
				if ($lines[0]=~/Group \d+/ && $lines[1]=~/^[A-Z]/){
					print ERR "KEY $lines[0] $lines[0]\n\n";
					$exclude=1;
					$uk=shift(@lines);
					$uk .= " ";
					$uk .= shift(@lines);
					print ERR "KEY $lines[0] $lines[0]]\n\n";
				}
				if ($lines[0]=~/Key to (Groups|genera|California|pistillate|staminate)/i){
					print ERR "KEY $lines[0]\n\n";
					$exclude=1;
					$uk=shift(@lines);
					print ERR "KEY $lines[0]\n\n";
				}
				if ($lines[0]=~/^Group \d/){
					$exclude=1;
					print ERR "KEY $lines[0]\n\n";
					$uk=shift(@lines);
					print ERR "KEY $lines[0]\n\n";
				}
				if ($lines[0]=~/^SALIX Key/){
					$exclude=1;
					print ERR "KEY $lines[0]\n\n";
					$uk=shift(@lines);
					print ERR "KEY $lines[0]\n\n";
				}


			foreach(@lines[0 .. $#lines]){
				if(m/--[0-9]+\(--[0-9]/ || m/[0-9]--\)[0-9]+--/){
					s/(--[0-9]+\()--([0-9]+)/$1$2/g;
					s/([0-9]+)--\)([0-9]+--)/$1)$2/g;
				}
				s/([0-9])-([0-9])/$1&ndash;$2/;
				s/---/&mdash;/g;
				s/\.+[-_]*>/--&gt;/g;
				s/-->/--&gt;/g;



#foreach(@all_pars){
#if( m/^1\./ ||
#foreach(@lines[0 .. $#lines]){
		
		
		if(m!--&gt; *(\d*)([A-Z]). ([a-z-]+) (nothosubsp\.|subsp\.|var\.) ([a-z-]+)!){
			$key_species=$3;
			$key_rank=$4;
			$key_infra=$5;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species $key_rank $key_infra"} || "C1";
			++$C1a;
				if($goto_code eq "C1"){
					print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
					++$C1;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			s!--&gt; *(\d*)([A-Z]). ([a-z-]+) (nothosubsp\.|subsp\.|var\.) ([a-z-]+) *!\t$key_name\tVERBATIM NAME:$1 $2. $3 $4 $5!;
			print ERR qq{1 $key_genus $key_species $key_rank $key_infra code=$goto_code\n\n};
		}
		#1' Ann; lvs narrowly elliptic to ovate or obovate.....-> [P. ruderale var. macrocephalum]
		elsif(m!--&gt; *(\d*)\[([A-Z]). ([a-z-]+) (nothosubsp\.|subsp\.|var\.) ([a-z-]+)\]!){
			$key_species=$3;
			$key_rank=$4;
			$key_infra=$5;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species $key_rank $key_infra"} || "C2";
			++$C2a;
				if($goto_code eq "C2"){
					print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
					++$C2;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			s!--&gt; *(\d*)\[([A-Z]). ([a-z-]+) (nothosubsp\.|subsp\.|var\.) ([a-z-]+)\]!\t$key_name\tVERBATIM NAME:$1 [$2. $3 $4 $5]!;
			print ERR qq{2 $key_genus $key_species $key_rank $key_infra code=$goto_code\n\n};
		}
		elsif( m!--&gt; *(most )([A-Z]). ([&;a-z-]+)!){#none match this pattern as of Oct 2019
			$key_species=$3;
			$goto_code=$NAME_TO_CODE{"$key_genus $key_species"} || "C3";
			++$C3a;
				if($goto_code eq "C3"){
					print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
					++$C3;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			print ERR qq{3 $key_genus $key_species code=$goto_code\n\n};
			s!--&gt; *(most )([A-Z]). ([&;a-z-]+) *!\t$key_name\tVERBATIM NAME:$1 $2. $3!;
		}
		elsif( m!--&gt; *(\d*)([A-Z]). ([&;a-z-]+)!){
			$key_species=$3;
			$goto_code=$NAME_TO_CODE{"$key_genus $key_species"} || "C4";
			++$C4a;
				if($goto_code eq "C4"){
					print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
					++$C4;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			print ERR qq{4 $key_genus $key_species code=$goto_code\n\n};
			s!--&gt; *(\d*)([A-Z]). ([&;a-z-]+) *!\t$key_name\tVERBATIM NAME:$1 $2. $3!;
		}
		elsif(m!--&gt; *(\d*)([A-Z][A-Z]+) ?(.*)!){
			$key_genus=ucfirst(lc($2));
			$goto_code= $NAME_TO_CODE{$key_genus} || "C5";
			++$C5a;
				if($goto_code eq "C5"){
					print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
					++$C5;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			print ERR qq{5 $key_genus code=$goto_code\n\n};
			s!--&gt; *(\d*)([A-Z][A-Z]+) ?(.*) *!\t$key_name\tVERBATIM NAME:$2 $3!;
		}
		elsif(m!--&gt; *\[(\d*)([A-Z][A-Z]+)\] *(.*)!){
			$key_genus=ucfirst(lc($2));
			$goto_code=$NAME_TO_CODE{$key_genus} || "C6";
			++$C6a;
				if($goto_code eq "C6"){
					print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
					++$C6;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			print ERR qq{6 $key_genus code=$goto_code\n\n};
			s!--&gt; *\[(\d*)([A-Z][A-Z]+)\] *(.*) *!\t$key_name\tVERBATIM NAME:[$2] $3!;
		}
		elsif(m!--&gt; *(nothosubsp\.|subsp\.|var\.) ([a-z-]+)!){
			$key_rank=$1;
			$key_infra=$2;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species $key_rank $key_infra"} || "C7";
			++$C7a;
				if($goto_code eq "C7"){
					print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
					++$C7;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			print ERR qq{7 $key_genus $key_species $key_rank $key_infra code=$goto_code\n\n};
			s!--&gt; *(nothosubsp\.|subsp\.|var\.) ([a-z-]+) *!\t$key_name\tVERBATIM NAME:$1 $2!;
		}
		elsif(m!--&gt; *\[(nothosubsp\.|subsp\.|var\.) ([a-z-]+)\]!){
			$key_rank=$1;
			$key_infra=$2;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species $key_rank $key_infra"} || "C8";
			++$C8a;
				if($goto_code eq "C8"){
					print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
					++$C8;
				}
			$key_name = $CODE_TO_NAME{$goto_code};			
			print ERR qq{8 $key_genus $key_species $key_rank $key_infra code=$goto_code\n\n};
			s!--&gt; *\[(nothosubsp\.|subsp\.|var\.) ([a-z-]+\]) *!\t$key_name\tVERBATIM NAME:[$1 $2]!;
		}
		elsif( m!--&gt; *\[(\d*)([A-Z]). ([&;a-z-]+)\]!){
			$key_species=$3;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species"} || "C9";
			++$C9a;
				if($goto_code eq "C9"){
					print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
					++$C9;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			print ERR qq{9 $key_genus $key_species code=$goto_code\n\n};
			s!--&gt; *\[(\d*)([A-Z]). ([&;a-z-]+)\]!\t$key_name\tVERBATIM NAME:$1 [$2. $3]!;
		}
		elsif( m!--&gt; *\[(\d*)([A-Z]). ([&;a-z-]+);.*\]!){#none match this pattern as of Oct 2019
			$key_species=$3;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species"} || "C10";
		++$C10a;
				if($goto_code eq "C10"){
					print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
					++$C10;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			print ERR qq{10 $key_genus $key_species code=$goto_code\n\n};
			s!--&gt; *\[(\d*)([A-Z]). ([&;a-z-]+)(;.*)\]!\t$key_name\tVERBATIM NAME:$1 [$2. $3$4]!;
		}
		elsif(m!--&gt; *\[(\d*)([A-Z][a-z]+).*\]!){
			$key_genus=ucfirst(lc($2));
			$goto_code=$NAME_TO_CODE{$key_genus} || "C11";
		++$C11a;
				if($goto_code eq "C11"){
					print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
					++$C11;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			print ERR qq{11 $key_genus code=$goto_code\n\n};
			s!--&gt; *\[(\d*)([A-Z][a-z]+)(.*\]) *!\t$key_name\tVERBATIM NAME:[$2$3!;
		}
		elsif(m!--&gt; *(\d*)([A-Z][a-z]+) ([^ ]+) *\(.*!){
			$key_genus=ucfirst(lc($2));
			$key_species=$3;
		++$C12a;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species"} || "C12";
				if($goto_code eq "C12"){
					print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
					++$C12;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			print ERR qq{12 $key_genus code=$goto_code\n\n};
			s!--&gt; *(\d*)([A-Z][a-z]+)(.*)(\(.*) *!\t$key_name\tVERBATIM NAME:$2$3$4!;
		}
		#1. Fl radial; calyx, corolla gen inconspicuous; petals free or fused, lobes not overlapped in bud; stamens 5--many, often long-exserted; lf 2-pinnate (simple in alien _Acacia_).....-> Group 1: Mimosoideae
		elsif( m!--&gt; *Group (\d+[A-Z]*)(: )(.+)!m){
			#$group=$1;
			$key_name="Group ".$1;
			#print qq{FOUND >$family $key_name< code=$group\n\n};
					++$G3;
			print ERR qq{G1 $key_name\n\n};
			s!--&gt; *(Group \d+[A-Z]*): ([A-Z][a-z]+)(.+) *!\t$key_name\tVERBATIM NAME:Group $1: $2 $3!;
		}
		elsif(m!--&gt; *(Group) (\d+[A-Z]*)$!m){
			#print qq{FOUND >$family $1 $2 < code=$group\n\n};
					++$G;
			$key_name = "$1 $2";
			print ERR qq{G1 $key_name\n\n};
			s!--&gt; *(Group) (\d+[A-Z]*) *!\t$key_name\tVERBATIM NAME:$1 $2!;
		}
		elsif(m!--&gt; *(Group) (\d+[A-Z]*)(,.+)$!m){
			#print qq{FOUND >$family $1 $2$3 < code=$group\n\n};
					++$G2;
			$key_name = "$1 $2$3";
			print ERR qq{G1 $key_name\n\n};
			s!--&gt; *(Group) (\d+[A-Z]*)(,.+) *!\t$key_name\tVERBATIM NAME:$1 $2$3!;
		}
		elsif(m!--&gt; *(\d*)([A-Z][a-z]+) ([a-z]+) (var\.|subsp\.) ([a-z]+)(.*)!){
			$key_genus=ucfirst(lc($2));
			$target="$2 $3 $4 $5";
			$goto_code= $NAME_TO_CODE{$target} || "C13";
		++$C13a;
				if($goto_code eq "C13"){
					print qq{ERROR >$key_genus $target< code=$goto_code\n\n};
					++$C13;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			print ERR qq{13 $target code=$goto_code==>$_\n\n};
			s!--&gt; *(\d*)([A-Z][a-z]+) ([a-z]+)(.*) *!\t$key_name\tVERBATIM NAME:$2 $3$4!;
		}
		elsif(m!--&gt; *(\d*)([A-Z][a-z]+) ([a-z]+)(.*)!){
			$key_genus=ucfirst(lc($2));
			$target="$2 $3";
			$goto_code= $NAME_TO_CODE{$target} || "C14";
		++$C14a;
				if($goto_code eq "C14"){
					print qq{ERROR >$key_genus $target< code=$goto_code\n\n};
					++$C14;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			print ERR qq{14 $target code=$goto_code $_\n\n};
			s!--&gt; *(\d*)([A-Z][a-z]+ [a-z]+)(.*) *!\t$key_name\tVERBATIM NAME:$2$3!;
			#12b Elymus multisetus code=24122 <a href="#ALE33.">33'</a><a name="ALE33'"> </a> Per; spikelets 2(3--4) per node --&gt; Elymus multisetus
		}
		elsif(m!--&gt; *(\d*)([A-Z][a-z]+)(.*)!){#none match this pattern as of Oct 2019
			$key_genus=ucfirst(lc($2));
			$goto_code= $NAME_TO_CODE{$key_genus} || "C15";
		++$C15a;
				if($goto_code eq "C15"){
					print qq{ERROR >$key_genus $target< code=$goto_code\n\n};
					++$C15;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			print ERR qq{15 $key_genus code=$goto_code\n\n};
			s!--&gt; *(\d*)([A-Z][a-z]+)(.*) *!\t$key_name\tVERBATIM NAME:$2$3!;
		}

		#13. Pinnae fan-shaped, texture delicate, deep green; outer margins finely toothed or crenate; occurring in or very near saturated substrate .....-> sun forms of B. crenulatum(2), see also lead 9
		#6. Trophophore and sporophore joined well below mid-lf, gen at ground level.....-> small or shade pls of _Botrychium simplex_(2) or _Botrychium pumicola_(2), see lead 3 for separation of taxa
		#<a href="#AO6'">6.</a><a name="AO6."> </a> Trophophore and sporophore joined well below mid-lf, gen at ground level--&gt; small or shade pls of _Botrychium simplex_(2) or _Botrychium pumicola_(2), see lead 3 for separation of taxa
		elsif( m!--&gt;.*_[A-Z]. [&;a-z-]+_!){
			++$C16;
		
			if (m/--&gt; *(.+)_; *_G\. pyrenaicum_\]/){
				s!--&gt; (.+)_([A-Z]). ([&;a-z-]+).+!!;
				++$C16a;
#3. Mericarp without basal callus --&gt; [<i>G. palmatum</i>; <i>G. pyrenaicum</i>]
				$key_species=$3;
				$goto_code= $NAME_TO_CODE{"$key_genus $key_species"} || "C16aa";
				if($goto_code eq "C16aa"){
					print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
					++$C16aa;
				}
			}#this precedes an unabridged key that parses these two out, leaving this in causes problems with formatting
			elsif (m/--&gt; (.+)(geniculata)(, including _A. ovata_)(.+)/){
				$key_species=$2;
				$goto_code= $NAME_TO_CODE{"$key_genus $key_species"} || "C16b";
				if($goto_code eq "C16b"){
					print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
					++$C16b;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			print ERR qq{16b $key_genus $key_species code=$goto_code\n\n};
			s!--&gt; (.*)_([A-Z])\. ([&;a-z-]+)_!\t$key_name\tVERBATIM NAME:$1 $2. $3!;
			}#this parses the to the wrong name, and no longer has a valid link in the eFlora
			else{
				if( m!--&gt;(.*)_([A-Z]\. )([&;a-z-]+)_!){
					$key_species=$3;
					$goto_code= $NAME_TO_CODE{"$key_genus $key_species"} || "C16c";
						if($goto_code eq "C16c"){
							print qq{ERROR >$key_genus $key_species< code=$goto_code\n\n};
							++$C16;
						}
					$key_name = $CODE_TO_NAME{$goto_code};
					print ERR qq{16c $key_genus $key_species code=$goto_code\n\n};
					s!--&gt; (.*)_([A-Z])\. ([&;a-z-]+)_!\t$key_name\tVERBATIM NAME:$1 $2. $3!;
				}
			}
		}
		elsif( m!--&gt; (see couplet \d+)!){#--&gt; see couplet 5
			s!--&gt; (.*)! .....&nbsp;$1!;
		++$C18a;
		}
		elsif( m!--&gt; (\[E\. farinosa &times;)(.+)$!m){
			$target = "Encelia fariosa &times; frutescens";
			s!--&gt; *(.*)!\t$target\tVERBATIM NAME:$1$2!;
		++$C17a;
		}
		elsif( m!--&gt; .*see .*lead \d!){
			s!--&gt; *(.*)! .....&nbsp;$1!;#none match this pattern as of Oct 2019
		++$C18a;
		}
		elsif( m!--&gt; (\(see )_([A-Z][a-z ]+)_(.+)$!m){
			$target=$2;
			$goto_code= $NAME_TO_CODE{$target} || "C19";
				if($goto_code eq "C19"){
					print qq{ERROR >$target< code=$goto_code\n\n};
					++$C19;
				}
			$key_name = $CODE_TO_NAME{$goto_code};
			s!--&gt; (\(see )_(.+)_(.+) *!\t$key_name $1$3\tVERBATIM NAME:$1<i>$2</i>$3!;
		++$C19a;
		#43. Corolla 24&ndash;30 mm; anther sacs 1.2&ndash;1.6 mm; main upper leaves 45&ndash;90 mm &ndash; common hybrid  .....&nbsp;(see <i>Penstemon centranthifolius</i> description)
		}
		else{
			print ERR "ERROR==>$_ \n\n" if m/--&gt;/;
			#print "PROBLEM?  $_\n";
		++$remain;
		}
		
#foreach(@all_pars){
#if( m/^1\./ ||
#foreach(@lines[0 .. $#lines]){
		
		if(m/--[0-9]+\(--[0-9]/ || m/[0-9]--\)[0-9]+--/){
			s/(--[0-9]+\()--([0-9]+)/$1$2/g;
			s/([0-9]+)--\)([0-9]+--)/$1)$2/g;
		}
		s/--([^&])/&ndash;$1/g;
		s|\+/-|&plusmn;|g;
		s|\+-|&plusmn;|g;
		s/ > or =/ &ge;/g;
		s/^UNABRIDGED KEY LEAD: //;
		
#foreach(@all_pars){
#if( m/^1\./ ||
#foreach(@lines[0 .. $#lines]){

		
		s/([A-Za-z])_([A-Za-z])/$1&95;$2/g;
		while(s/_/<i>/){
			s/_/<\/i>/;
		}

		s/\.\.+&nbsp; +/.....&nbsp;/;
	}#foreach(@lines[0 .. $#lines]){


	$keybase=join("\n",@lines);

	
#foreach(@all_pars){
#if( m/^1\./ ||

	s/  +/ /g;

$key_name = $CODE_TO_NAME{$name_anchor};

		foreach($uk){
			while(s/_/<i>/){
				s/_/<\/i>/;
			}
			s/---/&mdash;/g;
			s/--/&ndash;/g;
			s|\+-|&plusmn;|g;
		}
				my @keyvalues = split('\n', $keybase);

#this creates a split version of this file, with all lines of a key in a format with fields ready to be formatted for a SQL database
					#foreach my $k (@keyvalues) {
					#	#print "$k: $keyvalues{$k}\n";
					#	print OUT2 $name_anchor."\t".$uk."\t".$key_name."\t".$k."\n";
					#}

	if(length($uk) > 2){
		print OUT $uk."\n";
		print ERR "KEY: $name_anchor\n\n";
	}
	else{
		print ERR "KEY: $name_anchor\n\n";
		print OUT $key_name."\t".$name_anchor."\t".$TJM2_author."\t".$revision_number."\t".$revision_date."\n".$keybase."\n##########END OF KEY\n";
	}


	#next;
}#if( m/^1\./ ||
######################################################END OF KEY SECTION

######################################################BEGIN PROCESS FIELDS

		

#foreach(@all_pars){
#The /m modifier allows you to use those anchors to represent the beginning and end of a line, respectively.
#The /m modifier is similar to the /s modifier. 
#You can think of /s as "single line" in that it changes the meaning of the character class shortcut . (the period symbol)
# so that it matches any character on a single line and does not run on to the next line.

		if(m/^([A-Z]+ACEAE) \(([A-Z][a-z]+)\)$/ms){
			$family = ucfirst(lc($1));
			$key_genus=$1;
			$key_genus=ucfirst(lc($key_genus));

			if($NAME_TO_CODE{$key_genus}){
				$name_anchor = $NAME_TO_CODE{$key_genus};
#print "2\n" if $name_anchor==76377;
			}			
			else {
				print ERR "FAMILY 1: $key_genus not found in lists\n\n";
			}
		}#if(s|^([A-Z]+ACEAE)

		if(m/^([A-Z]+ACEAE)$/ms){
			$family = ucfirst(lc($1));
			$key_genus=$1;
			$key_genus=ucfirst(lc($key_genus));

			if($NAME_TO_CODE{$key_genus}){
				$name_anchor = $NAME_TO_CODE{$key_genus};
#print "2\n" if $name_anchor==76377;
			}			
			else {
				print ERR "FAMILY 2: $key_genus not found in lists\n\n";
			}
		}#if(s|^([A-Z]+ACEAE)



		
		if(m/^([A-Z]+)$/ms){
			$key_genus=$1;
			$key_genus=ucfirst(lc($key_genus));
			
			if($NAME_TO_CODE{$key_genus}){
				$name_anchor = $NAME_TO_CODE{$key_genus};
#print "4\n" if $name_anchor==76377;
			}

		}


			if(m/UNABRIDGED\n([A-Z-]+)\n(COMMON|TJM|HABIT)/){
				$key_genus=$1;
				$key_genus=ucfirst(lc($key_genus));
			
				if($NAME_TO_CODE{$key_genus}){
					$name_anchor = $NAME_TO_CODE{$key_genus};
#print "4\n" if $name_anchor==76377;
				}

			}


		if(m/(NATIVE|NATURALIZED)\n([A-Z]+) ([a-z]+)/ms){
			$key_genus=$2;
			$key_species=$3;
			$key_genus=ucfirst(lc($key_genus));
			
		}

		if (m/TJM15X AUTHOR: *(.+)/){
			$TJM2_author = "$1"; 
		}
		elsif (m/TJM14X AUTHOR: *(.+)/){
			$TJM2_author = "$1"; 
		}
		elsif (m/TJM13X AUTHOR: *(.+)/){
			$TJM2_author = "$1"; 
		}
		elsif (m/TJM12X AUTHOR: *(.+)/){
			$TJM2_author = "$1"; 
		}
		elsif (m/TJM11X AUTHOR: *(.+)/){
			$TJM2_author = "$1"; 
		}
		elsif (m/TJM10X AUTHOR: *(.+)/){
			$TJM2_author = "$1"; 
		}
		elsif (m/TJM9X AUTHOR: *(.+)/){
			$TJM2_author = "$1"; 
		}
		elsif (m/TJM8X AUTHOR: *(.+)/){
			$TJM2_author = "$1"; 
		}
		elsif (m/TJM7X AUTHOR: *(.+)/){
			$TJM2_author = "$1"; 
		}
		elsif (m/TJM6X AUTHOR: *(.+)/){
			$TJM2_author = "$1"; 
		}
		elsif (m/TJM5X AUTHOR: *(.+)/){
			$TJM2_author = "$1"; 
		}
		elsif (m/TJM4X AUTHOR: *(.+)/){
			$TJM2_author = "$1"; 
		}
		elsif (m/TJMXXX AUTHOR: *(.+)/){
			$TJM2_author = "$1"; 
		}
		elsif (m/TJMXX AUTHOR: *(.+)/){
			$TJM2_author = "$1"; 
		}
		elsif (m/TJMX AUTHOR: *(.+)/){
			$TJM2_author = "$1"; 
		}
		elsif($par =~/TJM2 AUTHOR: *(.+)/){
			$TJM2_author = "$1"; 
		}
		else{
			$TJM2_author = "Bruce G. Baldwin, Scientific Editor";
		}


	if (m/TJM15X AUTHOR:/){
		$revision_number = "Revision 15";
	}
	elsif (m/TJM14X AUTHOR:/){
		$revision_number = "Revision 14";
	}
	elsif (m/TJM13X AUTHOR:/){
		$revision_number = "Revision 13";
	}
	elsif (m/TJM12X AUTHOR:/){
		$revision_number = "Revision 12";
	}
	elsif (m/TJM11X AUTHOR:/){
		$revision_number = "Revision 11";
	}
	elsif (m/TJM10X AUTHOR:/){
		$revision_number = "Revision 10";
	}
	elsif (m/TJM9X AUTHOR:/){
		$revision_number = "Revision 9";
	}
	elsif (m/TJM8X AUTHOR:/){
		$revision_number = "Revision 8";
	}
	elsif (m/TJM7X AUTHOR:/){
		$revision_number = "Revision 7";
	}
	elsif (m/TJM6X AUTHOR:/){
		$revision_number = "Revision 6";
	}
	elsif (m/TJM5X AUTHOR:/){
		$revision_number = "Revision 5";
	}
	elsif (m/TJM4X AUTHOR:/){
		$revision_number = "Revision 4";
	}
	elsif (m/TJMXXX AUTHOR:/){
		$revision_number = "Revision 3";
	}
	elsif (m/TJMXX AUTHOR:/){
		$revision_number = "Revision 2";
	}
	elsif (m/TJMX AUTHOR:/){
		$revision_number = "Revision 1";
	}
	else {
		$revision_number = "TJM2 Hardcover, 2nd Edition";
	}


	if (m/TJM15X AUTHOR: .*/){
		$revision_date = "2027";
	}
	elsif (m/TJM14X AUTHOR: .*/){
		$revision_date = "2026";
	}
	elsif (m/TJM13X AUTHOR: .*/){
		$revision_date = "2025";
	}
	elsif (m/TJM12X AUTHOR: .*/){
		$revision_date = "2023";
	}
	elsif (m/TJM11X AUTHOR: .*/){
		$revision_date = "2022";
	}
	elsif (m/TJM10X AUTHOR: .*/){
		$revision_date = "2022";
	}
	elsif (m/TJM9X AUTHOR: .*/){
		$revision_date = "2021";
	}
	elsif (m/TJM8X AUTHOR: .*/){
		$revision_date = "2020";
	}
	elsif (m/TJM7X AUTHOR: .*/){
		$revision_date = "2019";
	}
	elsif (m/TJM6X AUTHOR: .*/){
		$revision_date = "2018";
	}
	elsif (m/TJM5X AUTHOR: .*/){
		$revision_date = "2017";
	}
	elsif (m/TJM4X AUTHOR: .*/){
		$revision_date = "2016";
	}
	elsif (m/TJMXXX AUTHOR: .*/){
		$revision_date = "2015";
	}
	elsif (m/TJMXX AUTHOR: .*/){
		$revision_date = "2014";
	}
	elsif (m/TJMX AUTHOR: .*/){
		$revision_date = "2013";
	}
	elsif (m/TJM2 AUTHOR: .*/){
		$revision_date = "2012";
	}
	else {
		$revision_date = "2012";
	}


#foreach(@all_pars){
############GET infra name for links
		if(m/^([A-Z][A-Z]+) +([a-z-]+).*(var\.|nothosubsp\.|subsp\.) ([a-z-]+) *\n/m){
#SAGITTARIA montevidensis Cham. & Schltdl. subsp. calycina
			$key_species=$2;
			$name_link=ucfirst(lc("$1 $2 $3 $4"));
#print "1 NL $name_link\n";

			if($NAME_TO_CODE{$name_link}){
				$name_anchor = $NAME_TO_CODE{$name_link};
#print "6\n" if $name_anchor==76377;
			}
			else{
				print ERR "INFRA NAME LINK 1. NO $name_link in SMASCH TAXON IDS\n\n";
				$name_link= "flabba0";
			}
#print "$name_link\n";
		}#if(m/^([A-Z][A-Z]+) +
		
		
		
#foreach(@all_pars){
############GET hybrid name for links
		elsif(m|^([A-Z][A-Z]+) +(&times;[a-z-]+) *\n|m){
			$trinomial="$1 $2";
#print "flabba $trinomial\n";
			$epithet=$2;
			$name_link=ucfirst(lc($trinomial));
#print "2 NL $name_link\n";
			
				if($NAME_TO_CODE{$name_link}){
					$name_anchor = $NAME_TO_CODE{$name_link};
				}#if($NAME_TO_CODE
				else{
					print ERR "HYBRID NAME LINK 2. NO $name_link in SMASCH TAXON IDS\n\n";
					$name_link= "flabba1";
				}
		}#elsif(m|^([A-Z][A-Z]+)

#foreach(@all_pars){
############GET name for links
		elsif(m|^([A-Z][A-Z]+) +([a-z-]+) *\n|m){
			$trinomial="$1 $2";
			$key_species=$2;
#print "flabba $trinomial\n";
			$epithet=$2;
			$name_link=ucfirst(lc($trinomial));
#			$name_link=~s/ x / X /;
#print "2 NL $name_link\n";

				if($NAME_TO_CODE{$name_link}){
					$name_anchor = $NAME_TO_CODE{$name_link};
#print "8\n" if $name_anchor==76377;
				}
				else{
					print ERR "1. NO NAME_TO_CODE ${name_link}<\n\n";
					#die "Missing name in NAME_TO_CODE: $name_link. Terminating load\n";
					$name_link= "flabba2";
				}

		}#elsif(m|^([A-Z][A-Z]+)
		else{
		#print "END OF LINES==>>>$_\n";
		}
		
#foreach(@all_pars){

			if(m/--[0-9]+\(--[0-9]/ || m/[0-9]--\)[0-9]+--/){
				s/(--[0-9]+\()--([0-9]+)/$1$2/g;
				s/([0-9]+)--\)([0-9]+--)/$1)$2/g;
			}

		s/([0-9])-([0-9])/$1&ndash;$2/;

		while(s/_/<i>/){
			s/_/<\/i>/;
		}




######end of field processing



}#foreach(@all_pars){


print <<EOP;
C1 Names FOUND: $C1a
C2 Names FOUND: $C2a
C3 Names FOUND: $C3a
C4 Names FOUND: $C4a
C5 Names FOUND: $C5a
C6 Names FOUND: $C6a
C7 Names FOUND: $C7a
C8 Names FOUND: $C8a
C9 Names FOUND: $C9a
C10 Names FOUND: $C10a
C11 Names FOUND: $C11a
C12 Names FOUND: $C12a
C13 Names FOUND: $C13a
C14 Names FOUND: $C14a
C15 Names FOUND: $C15a
C16 Names FOUND: $C16
C16a Names FOUND: $C16a
C17 Names FOUND: $C17a
C18 Names FOUND: $C18a
C19 Names FOUND: $C19a


Problem C1 Names: $C1
Problem C2 Names: $C2
Problem C3 Names: $C3
Problem C4 Names: $C4
Problem C5 Names: $C5
Problem C6 Names: $C6
Problem C7 Names: $C7
Problem C8 Names: $C8
Problem C9 Names: $C9
Problem C10 Names: $C10
Problem C11 Names: $C11
Problem C12 Names: $C12
Problem C13 Names: $C13
Problem C14 Names: $C14
Problem C15 Names: $C15
Problem C16a Names: $C16aa
Problem C16b Names: $C16b
Problem C16c Names: $C16c
Problem C19 Names: $C19

Other Names(1): $C17
Other Names(2): $C18
Other Names(3): $C19

Key Group Names Found(1): $G
Key Group Names Found(2): $G2
Key Group Names Found(2): $G3

Error Key Names: $remain
EOP

