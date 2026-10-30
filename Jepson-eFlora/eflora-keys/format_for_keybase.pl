#formatter for eFlora that expects input with expanded abbreviations
use lib "/JEPS-master/Jepson-eFlora/Modules/";
use flatten;

use BerkeleyDB;
open (ERR, ">keybase_error.txt");

$genus_link="AA";

open (OUT, ">input_files/keybase_keys.txt");
open (FORMAT, ">input_files/keybase_keys_formatted.txt");


open(IN, "/JEPS-master/Jepson-eFlora/synonymy/input/smasch_taxon_ids.txt") || die;
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

#print "$_\n" if m/&times;/;
#print "$_\n";
}
#die;

close(IN);


$file="/JEPS-master/Jepson-eFlora/eflora_database/input_files/eflora_treatments.txt";
	undef($/);
	open(IN,$file) || die "couldn't open $file\n";
warn "reading from $file\n";

while(<IN>){
     next if m/^#/; #skip lines that are commented out
     next if m/^Admin/;	#skip lines that start with Admin

#Escaping single quotes for SQL insert
	s/'/''/g;


if(m/([A-Z]+ACEAE)/){ #when it encounters a CAPS string ending in ACEAE
$family=$1; #that word is assigned to $family (until it gets reassigned)
}


	my $taxon_name= &get_taxon_name($_);
	my $key_group=&get_key_group($_);

if ($taxon_name =~ /ENCELIA farinosa &times; E. frutescens/){ #the spontaneous hybrid is kluged because there is only one and it's awkward
	$taxon_name = "Encelia farinosa &times; Encelia frutescens";
	$full_formatted_display_name = "<i>Encelia farinosa</i> &times; <i>Encelia frutescens</i>";
}
elsif ($taxon_name =~ /VERBESINA encelioides .+/){ #the Hook. f. in authority causes this to choke in strip name
	$taxon_name = "Verbesina encelioides subsp. exauriculata";
	$full_formatted_display_name = "<i>Verbesina encelioides</i> (Cav.) Benth. & Hook. f. ex A. Gray subsp. <i>exauriculata</i>";
}
elsif ($taxon_name =~ /([A-Z]+) ([a-z-]+) (.+) (nothosubsp.|subvar.|var\.|subsp\.) ([a-z-]+)$/){ #if it is an infra with an author inserted (that's the ".+")
	$genus = ucfirst(lc($1));
	$species = $2;
	$species_author = $3;
	$infra_rank = $4;
	$infra_epithet = $5;
	$taxon_name=ucfirst(lc($taxon_name));
	$taxon_name=&strip_name($taxon_name);
#print "$taxon_name\n";
	if ($species eq $infra_epithet){ #if it is an autonym, inserted author goes after specific epithet, and there is no $taxon_author, except if we have forma, those should go through strip name below
		$full_formatted_display_name = "<i>$genus $species</i> $species_author $infra_rank <i>$infra_epithet</i>";
	}
	else { #else the inserted author stays after the specific epithet, and the $taxon_author goes at the end
		$full_formatted_display_name = "<i>$genus $species</i> $species_author $infra_rank <i>$infra_epithet</i> $taxon_author";
	}
}
elsif ($taxon_name =~ /([A-Z]+) ([a-z-]+) (nothosubsp.|subvar.|var\.|subsp\.) ([a-z-]+)$/){ #if it is an infra without an author in the name, except if we have forma, those should go through strip name below
	$genus = ucfirst(lc($1));
	$species = $2;
	$infra_rank = $3;
	$infra_epithet = $4;
	$taxon_name=ucfirst(lc($taxon_name));
	if ($species eq $infra_epithet){ #if it is an autonym, author goes after specific epithet
		$full_formatted_display_name = "<i>$genus $species</i> $taxon_author $infra_rank <i>$infra_epithet</i>";
	}
	else { #otherwise the author goes at the end
		$full_formatted_display_name = "<i>$genus $species</i> $infra_rank <i>$infra_epithet</i> $taxon_author";
	}
}
else { #The rest should be family, genus, or binomial species treatments
	$taxon_name=ucfirst(lc($taxon_name));
	$taxon_name=&strip_name($taxon_name);
	if ($taxon_author eq "NULL"){
		$full_formatted_display_name = "<i>$taxon_name</i>";
	}
	else {
		$full_formatted_display_name = "<i>$taxon_name</i> $taxon_author";
	}
}

$family=ucfirst(lc($family));

#Some families have alternate names in parens, e.g. "Asteraceae (Compositae)"
#first, make sure the alternate name is capitalized correctly
if ($taxon_name =~ /([A-Za-z]+) \((.*)\)/){ #can't have the parens as part of $2, otherwise the ucfirst function will target the open paren
	$taxon_name = $1 . " " . "(" . ucfirst($2) . ")"; 
}

$name_for_matching = $taxon_name;
foreach ($name_for_matching){
	s/ \(.*\)//;
	s/&times; ([A-Z])/&times;$1/;
}

$taxon_id=$TNOAN{$name_for_matching};
next unless $taxon_id;
















	$all_lines=$_;
	#$all_lines=<IN>;
		
	@all_pars=split(/\n\n+/,$all_lines);

@lines = @all_pars;

foreach(@all_pars){

next if m/^#/;
warn "$_\n" if $seen_line{$_}++;
next if m/^Admin/;
next if m/^PROOF:/;
next if m/^CAPTION:/;

		$nds=$hc="";
		
		#@lines=split("\n",$_);


#foreach(@all_pars){

###################### KEYS ##########################
		if( m/^1\./ || m/^UNABRIDGED KEY/ || m/^Group \d+[A-Z]?[.:]/ || m/^Key to Groups/ || m/^Key to Groups Based Primarily on Flowering Material/|| m/^Key to Groups Based on Fruiting Material/|| m/^Key to Pistillate Plants/|| m/^Key to Staminate Plants/|| m/^Key to Vegetative Plants/ || m/^Group \d+ *\n/){
			$uk="";
			print ERR "$file KEY $&\n\n";
			$exclude = 1;

	if(m/^(.*ACEAE)/){
		$family=$1;
		if($key_number-$i == 1){
			$modified_key=&mod_key($family, $paragraphs[$key_number]);
			$family=ucfirst(lc($family));
			print "Genera of $family\n$modified_key\n\n"; 
# Commented out because I want it to recognize the family keys, but not print them
		}
	}
#RECOGNIZE GENUS PARAGRAPHS
	elsif(m/^([A-Z-]+)\n/ &! m/^(WAIF|UNABRIDGED|NATURALIZED|NATIVE)\n/){
		$genus=ucfirst(lc($1));
		if($key_number-$i == 1){
			$modified_key=&mod_key($genus, $paragraphs[$key_number]);
			print "Species of $genus\n$modified_key\n\n";
#GENERA ASSOCIATED WITH KEYS ARE REMEMBERED
			$target_URL{$genus}="GO TO GENUS KEY";
		}
	}
#RECOGNIZE KEY TO GROUPS PARAGRAPHS
	elsif(m/^Key to .*/){
		$genus=ucfirst(lc($1));
		if($key_number-$i == 1){
			$modified_key=&mod_key($genus, $paragraphs[$key_number]);
			print "KEY TO GROUPS FOR $genus\n$modified_key\n\n";
		$target_URL{$genus}="GO TO GENUS KEY";
		}
	}
#RECOGNIZE GROUP KEY PARAGRAPHS
	elsif(m/^(Group.*)/){
		$genus=ucfirst(lc($1));
		if($key_number-$i == 1){
			$modified_key=&mod_key($genus, $paragraphs[$key_number]);
			print "GROUP KEY FOR $genus\n$modified_key\n\n";
		$target_URL{$genus}="GO TO GENUS KEY";
		}
	}



}


}#foreach(@all_pars){







sub mod_key {
	my $genus = shift;
	my $key = shift;
	
			@lines=split(/\n/);
			$lines[$#lines]="" if $lines[$#lines]=~/^PROOF:/;
			
				if ($lines[0]=~m/UNABRIDGED KEY/){
					print "$lines[0]\n";
					#$uk=shift(@lines);
					#print ERR "UK: $uk\n\n";
					#$exclude=1;
				}
				if ($lines[0]=~/Group \d+/ && $lines[1]=~/^[A-Z]/){
					print ERR "KEY $lines[0] $lines[0]\n\n";
					$uk=shift(@lines);
					$uk .= " ";
					$uk .= shift(@lines);
					print ERR "KEY $lines[0] $lines[0]]\n\n";
				}
				if ($lines[0]=~/Key to (Groups|genera|California|pistillate|staminate)/i){
					print ERR "KEY $lines[0]\n\n";
					$uk=shift(@lines);
					print ERR "KEY $lines[0]\n\n";
				}
				if ($lines[0]=~/^Group \d/){
					print ERR "KEY $lines[0]\n\n";
					$uk=shift(@lines);
					print ERR "KEY $lines[0]\n\n";
				}
				if ($lines[0]=~/^SALIX Key/){
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
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species $key_rank $key_infra"} || "C4";
			s!--&gt; *(\d*)([A-Z]). ([a-z-]+) (nothosubsp\.|subsp\.|var\.) ([a-z-]+)!.....->$1 $2. $3 $4 $5!;
			#print ERR qq{1 $key_genus $key_species $key_rank $key_infra code=$goto_code\n\n};
		}
		#1' Ann; lvs narrowly elliptic to ovate or obovate.....-> [P. ruderale var. macrocephalum]
		elsif(m!--&gt; *(\d*)\[([A-Z]). ([a-z-]+) (nothosubsp\.|subsp\.|var\.) ([a-z-]+)\]!){
			$key_species=$3;
			$key_rank=$4;
			$key_infra=$5;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species $key_rank $key_infra"} || "C5";
			s!--&gt; *(\d*)\[([A-Z]). ([a-z-]+) (nothosubsp\.|subsp\.|var\.) ([a-z-]+)\]!.....->$1 [$2. $3 $4 $5]!;
			#print ERR qq{2 $key_genus $key_species $key_rank $key_infra code=$goto_code\n\n};
		}
		elsif( m!--&gt; *(most )([A-Z]). ([&;a-z-]+)!){
			$key_species=$3;
			$goto_code=$NAME_TO_CODE{"$key_genus $key_species"} || "C6";
			if($goto_code eq "C6"){
				print qq{3 >$key_genus $key_species< code=$goto_code\n\n};
			}
			print ERR qq{3 $key_genus $key_species code=$goto_code\n\n};
			s!--&gt; *(most )([A-Z]). ([&;a-z-]+)!.....->$1 $2. $3!;
		}
		elsif( m!--&gt; *(\d*)([A-Z]). ([&;a-z-]+)!){
			$key_species=$3;
			$goto_code=$NAME_TO_CODE{"$key_genus $key_species"} || "C6b";
			if($goto_code eq "C6"){
				print qq{3.1 >$key_genus $key_species< code=$goto_code\n\n};
				#die;
			}
			print ERR qq{3.1 $key_genus $key_species code=$goto_code\n\n};
			s!--&gt; *(\d*)([A-Z]). ([&;a-z-]+)!.....->$1 $2. $3!;
		}
		elsif(m!--&gt; *(\d*)([A-Z][A-Z]+)!){
			$key_genus=ucfirst(lc($2));
			$goto_code= $NAME_TO_CODE{$key_genus} || "C7";
			print ERR qq{4 $key_genus code=$goto_code\n\n};
			s!--&gt; *(\d*)([A-Z][A-Z]+)!.....->$1 $2!;
		}
		elsif(m!--&gt; *\[(\d*)([A-Z][A-Z]+).*\]!){
			$key_genus=ucfirst(lc($2));
			$goto_code=$NAME_TO_CODE{$key_genus} || "C8";
			#$goto_code=$NAME_CODE{$key_genus} || $TNOAN{$key_genus} || "C8";
			print ERR qq{5 $key_genus code=$goto_code\n\n};
			s!--&gt; *\[(\d*)([A-Z][A-Z]+)(.*)\]!.....->$2$3!;
		}
		elsif(m!--&gt; *(nothosubsp\.|subsp\.|var\.) ([a-z-]+)!){
			$key_rank=$1;
			$key_infra=$2;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species $key_rank $key_infra"} || "flabba : $key_genus : $key_species : $key_rank $key_infra";
			print ERR qq{6 $key_genus $key_species $key_rank $key_infra code=$goto_code\n\n};
			s!--&gt; *(nothosubsp\.|subsp\.|var\.) ([a-z-]+)!.....->$1 $2! ;
		}
		elsif(m!--&gt; *\[(nothosubsp\.|subsp\.|var\.) ([a-z-]+)\]!){
			$key_rank=$1;
			$key_infra=$2;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species $key_rank $key_infra"} || "flabba : $key_genus : $key_species : $key_rank $key_infra";
			print ERR qq{7 $key_genus $key_species $key_rank $key_infra code=$goto_code\n\n};
			s!--&gt; *\[(nothosubsp\.|subsp\.|var\.) ([a-z-]+\])!.....->$1 $2! ;
		}
		elsif( m!--&gt; *\[(\d*)([A-Z]). ([&;a-z-]+)\]!){
			$key_species=$3;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species"} || "C9";
			print ERR qq{8 $key_genus $key_species code=$goto_code\n\n};
			s!--&gt; *\[(\d*)([A-Z]). ([&;a-z-]+)\]!.....->$1 [$2. $3]!;
		}
		elsif( m!--&gt; *\[(\d*)([A-Z]). ([&;a-z-]+);.*\]!){
			$key_species=$3;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species"} || "C10";
			print ERR qq{9 $key_genus $key_species code=$goto_code\n\n};
			s!--&gt; *\[(\d*)([A-Z]). ([&;a-z-]+)(;.*)\]!.....->$1 [$2. $3$4]!;
		}
		elsif(m!--&gt; *\[(\d*)([A-Z][a-z]+).*\]!){
			$key_genus=ucfirst(lc($2));
			$goto_code=$NAME_TO_CODE{$key_genus} || "C11a";
			print ERR qq{10 $key_genus code=$goto_code\n\n};
			s!--&gt; *\[(\d*)([A-Z][a-z]+)(.*)\]!.....->$2$3!;
		}
		elsif(m!--&gt; *(\d*)([A-Z][a-z]+) ([^ ]+) *\(.*!){
			$key_genus=ucfirst(lc($2));
			$key_species=$3;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species"} || "C11";
			print ERR qq{11 $key_genus code=$goto_code\n\n};
			s!--&gt; *(\d*)([A-Z][a-z]+)(.*)(\(.*)!.....->$2$3$4!;
		}
		elsif(m!--&gt; *(Group) (.*)!){
			print ERR qq{12 $key_genus code=$goto_code\n\n};
			s!--&gt; *(\d*)([A-Z][a-z]+) (.*)!.....->$2 $3!;
		}
		elsif(m!--&gt; *(\d*)([A-Z][a-z]+) ([a-z]+) (var\.|subsp\.) ([a-z]+)(.*)!){
			$key_genus=ucfirst(lc($2));
			$target="$2 $3 $4 $5";
			$goto_code= $NAME_TO_CODE{$target} || "C2a";
			print ERR qq{12a $target code=$goto_code   $_\n\n};
			s!--&gt; *(\d*)([A-Z][a-z]+) ([a-z]+)(.*)!.....->$2 $3$4!;
		}
		elsif(m!--&gt; *(\d*)([A-Z][a-z]+) ([a-z]+)(.*)!){
			$key_genus=ucfirst(lc($2));
			$target="$2 $3";
			$goto_code= $NAME_TO_CODE{$target} || "C2b";
			print ERR qq{12b $target code=$goto_code $_\n\n};
			s!--&gt; *(\d*)([A-Z][a-z]+ [a-z]+)!.....->$2!;
			print ERR qq{12b $target code=$goto_code $_\n\n};

			#12b Elymus multisetus code=24122 <a href="#ALE33.">33'</a><a name="ALE33'"> </a> Per; spikelets 2(3--4) per node --&gt; Elymus multisetus
		}
		elsif(m!--&gt; *(\d*)([A-Z][a-z]+) (.*)!){
			$key_genus=ucfirst(lc($2));
			$goto_code= $NAME_TO_CODE{$key_genus} || "C2";
			print ERR qq{12 $key_genus code=$goto_code\n\n};
			s!--&gt; *(\d*)([A-Z][a-z]+)(.*)!.....->$2$3!;
		}

		#13. Pinnae fan-shaped, texture delicate, deep green; outer margins finely toothed or crenate; occurring in or very near saturated substrate .....-> sun forms of B. crenulatum(2), see also lead 9
		#6. Trophophore and sporophore joined well below mid-lf, gen at ground level.....-> small or shade pls of _Botrychium simplex_(2) or _Botrychium pumicola_(2), see lead 3 for separation of taxa
		#<a href="#AO6'">6.</a><a name="AO6."> </a> Trophophore and sporophore joined well below mid-lf, gen at ground level--&gt; small or shade pls of _Botrychium simplex_(2) or _Botrychium pumicola_(2), see lead 3 for separation of taxa
		elsif( m!--&gt;.*_([A-Z].) ([&;a-z-]+)_!){
			$key_species=$2;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species"} || "C12";
			#$goto_code=$NAME_CODE{"$key_genus $key_species"} || $TNOAN{"$key_genus $key_species"} || "C12";
			print ERR qq{13 $key_genus $key_species code=$goto_code\n\n};
			s!--&gt; (.*)_([A-Z]). ([&;a-z-]+)_!.....->$1 $2. $3!;
		}
		#1. Fl radial; calyx, corolla gen inconspicuous; petals free or fused, lobes not overlapped in bud; stamens 5--many, often long-exserted; lf 2-pinnate (simple in alien _Acacia_).....-> Group 1: Mimosoideae
		elsif( m!--&gt; *Group \d+: ([^ ]+)!){
			$goto_code=$1;
			s!--&gt; *(Group \d+: )([A-Z][a-z]+) *(.*)!.....->$1 $2 $3!;
		}
		elsif( m!--&gt; \[(.*) &times;(.*)!){
			s!--&gt; *(.*)!.....->$1!;
		}
		elsif( m!--&gt; .*see .*lead \d!){
			s!--&gt; *(.*)!.....->$1!;
		}
		elsif( m!--&gt; .*see _[A-Z]!){
			s!--&gt; *(.*)!.....->$1!;
		}
		else{
			print ERR "$_ C4\n\n" if m/--&gt;/;
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


#foreach(@all_pars){
#if( m/^1\./ ||
#foreach(@lines[0 .. $#lines]){

		
		s/([A-Za-z])_([A-Za-z])/$1&95;$2/g;
		while(s/_/<i>/){
			s/_/<\/i>/;
		}

		#s/\.\.\.\.\.&nbsp; +/.....&nbsp;/;
	}#foreach(@lines[0 .. $#lines]){

my @key_lines = @lines;

	#$keybase=join("\n",@lines);

########format key for keybase
	#my @key_lines =split(/\n/,$keybase);
	#my $keybase=join("\n",@lines);
	foreach $j (0 .. $#lines){

	$lines[$j] =~s/UNABRIDGED KEY LEAD: //;
	
#RECOGNIZE LINES WITH TARGETS
		if($lines[$j] =~s/ *\.\.+-> *(.*)/\t\1/){
			$target=$1;
			$target=~s/[\[\]]//g;
#ABBREVIATED GENUS NAMES ARE EXPANDED
			$target=~s/[A-Z]\./$key_genus/;
#GENUS NAMES ARE LOWERCASED
			$target=ucfirst(lc($target));
#BARE VARIETAL NAMES ARE CLOTHED
			if($target=~s/(subsp\.|Var\.|F\.)/\L$1/i){
				$target="$key_genus $key_species $target";
			}
			else{
				$species = $target;
			}
			$target=~s/ *\(\d+\) *//;
			if($target_URL{$target}){
				$target = "$target_URL{$target} FOR $target";
			}
			$lines[$j] =~s/^(\d+[a-zA-Z]?)[.'](.*)\t.*/$1\t$2\t$target/;
		}
		else{
#ASSUME THAT THE LINE FOLLOWING A LINE WITHOUT A TARGET IS THE SUCCESSOR, #USE ITS NUMBER AS THE TARGET
			($next_key_number=$lines[$j+1]) =~s/^(\d+[a-z]?)[.'].*/$1/;
			$lines[$j] =~s/^(\d+[a-z]?)[.'](.*)/$1\t$2\t$next_key_number/;
		}
	}


	$newline=join(" ",@key_lines);

	
	######join key back 
	#$keybase=join("\n",sort {$a <=> $b}(@lines));
	$keybase=join("\n",@lines);
#foreach(@all_pars){
#if( m/^1\./ ||

	s/  +/ /g;


	if($exclude==1){
		print ERR "KEY: $name_anchor\n\n";
		print OUT $name_link."\t".$name_anchor."\t==><blockquote>".$uk."\n".$keybase."\n";
		print FORMAT $name_link."\t".$name_anchor."\t".$uk."</h3>".$newline."\n";
	}
	else{
		foreach($uk){
			while(s/_/<i>/){
				s/_/<\/i>/;
			}
			s/---/&mdash;/g;
			s/--/&ndash;/g;
			s|\+-|&plusmn;|g;
			s/Group (\d+[A-Z]?)/Group $1/;
		}
		print ERR "KEY: $name_anchor\n\n";
		print OUT $name_anchor."==><blockquote><h3>".$uk."\n".$keybase."\n";
		print FORMAT $name_anchor."\t".$uk."<h3>".$newline."\n";
	}
	#next;
}#if( m/^1\./ ||
######################################################END OF KEY SECTION


		

#foreach(@all_pars){


		if(/([A-Z]+ACEAE) \(([A-Z][a-z]+)\)$/){
			$key_genus=$1;
			$key_genus=ucfirst(lc($key_genus));

			if($NAME_TO_CODE{$key_genus}){
				$name_anchor = $NAME_TO_CODE{$key_genus};
#print "2\n" if $name_anchor==76377;
				if($key_genus=~/aceae\b/){
					$last_family=$name_anchor;
$last_genus="";
				}
				else{
					$last_genus=$name_anchor;
#$last_species="";
				}
			}			
			else {
				print ERR "$key_genus not found in lists\n\n";
			}
		}#if(s|^([A-Z]+ACEAE)
		
		if(/^([A-Z]+)$/ms){
			$key_genus=$1;
			$key_genus=ucfirst(lc($key_genus));
			
			if($NAME_TO_CODE{$key_genus}){
				$name_anchor = $NAME_TO_CODE{$key_genus};
#print "4\n" if $name_anchor==76377;
				if($key_genus=~/aceae\b/){
					$last_family=$name_anchor;
$last_genus="";
				}
				else{
					$last_genus=$name_anchor;
#$last_species="";
				}
			}
			else {
				print ERR "$key_genus not found in lists\n\n";
			}
		}#if(s|^([A-Z]+)$|



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
					unless($name_link=~/\b(subsp\.|var\.|f\.)\b/){
						$last_species=$name_anchor;
					}
				print ERR "1. NO $name_link: >$NAME_TO_CODE{$name_link}<\n\n";
			}
			else{
				print ERR "2. NO $name_link\n\n";
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
					unless($name_link=~/\b(subsp\.|var\.|f\.)\b/){
						$last_species=$name_anchor;
					}
					
				}#if($NAME_TO_CODE
				else{
					if($name_link=~/Quercus x/i){
						warn "NAME_LINK==>$name_link\n";
					}
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
			$name_link=~s/ x / X /;
#print "2 NL $name_link\n";

				if($NAME_TO_CODE{$name_link}){
					$name_anchor = $NAME_TO_CODE{$name_link};
#print "8\n" if $name_anchor==76377;
					unless($name_link=~/\b(subsp\.|var\.|f\.)\b/){
						$last_species=$name_anchor;
					}

				$name_link= <<EOP;
<a href="/cgi-bin/get_cpn.pl?$NAME_TO_CODE{$name_link}">[Online Interchange]</a>
EOP
#print "3 NA $name_anchor\n";
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
############
		if(m/$trinomial .* $epithet/ && $trinomial && $epithet){
			s/\n(TAXON AUTHOR.*)//;
			#print "BEGIN: >$trinomial< >$epithet< $1\n$_\n";
		}
		
		if(s|^(([A-Z])[A-Z]+) (([a-z-]+).*)|<center><font size="4"><b>$2. $3</b></font>|m || s|^(([A-Z])[A-Z]+) ((&times;[a-z-]+).*)|<center><font size="4"><b>$2. $3</b></font>|m){

			if(m!^<center><font size="4"><b>([A-Z].) ([^ ]+) (nothosubsp\.|subsp\.|var\.|f\.) \2!m){
#print "1: $&\n";
			#if(m!^([A-Z]+) ([^ ]+) (subsp\.|var\.|f\.) \2!m){
				if(s!\nTAXON AUTHOR: *(.*)!!){
					$taxaut=$1;
					s!([A-Z]\.) ([^ ]+) (nothosubsp\.|subsp\.|var\.|f\.) \2!$1 $2</b> $taxaut $3 <b>$2!;
				}
				else{
					#print "$_\n";
					s!([A-Z]\.) ([^ ]+) (nothosubsp\.|subsp\.|var\.|f\.) \2!$1 $2</b> $3 <b>$2!;
					#print "$_\n";
				}

			}#if(m!^<center><font size="4"
			else{
				#print "flabba2 $_";
				s!(<center><font size="4"><b>[A-Z]\. [a-z-]+)(.*(nothosubsp\.|subsp\.|var\.|f\.)) (.*)</b>!$1</b>$2 <b>$4</b>! ||
				s!(<center.*) (nothosubsp\.|subsp\.|var\.|f\.) ([^ ]+)!$1</b> $2 <b>$3!;
				#print "2: $&\n";
			}
		}#if(s|^(([A-Z])[A-Z]+)

}#foreach(@all_pars){

sub get_taxon_name {
    my $par = shift; #each paragraph is separated by a blank line
    @lines=split(/\n/,$par); #the array of lines within a paragraph are values separated by a new line
#    if( $lines[0]=~/^(NATIVE|NATURALIZED)/){ #if the first line starts with...
#        return $lines[1]; #the name is the contents of the second line
#    }
    if( $lines[0]=~/^WAIF/){ #if the first line starts with...
        return $lines[1]; #the name is what's on the second line
    }
	elsif($lines[1]=~/^(POSSIBLY IN CA|CULTIVATED|WAIF|EXTIRPATED|HISTORICAL|SPONTANEOUS|AGRICULTURAL|GARDEN|URBAN)/){
        return $lines[2]; #elsif the second line starts with any of the above values, the name is what's on the third line
    }
    elsif( $lines[0]=~/^(NATIVE|NATURALIZED)/){ #if the first line starts with...
        return $lines[1]; #the name is the contents of the second line
    }
    elsif($lines[0]=~/^UNABRIDGED/){ #elsif the first line starts contains "UNABRIDGED"
        return $lines[1]; #the name is what's on the second line
    }
    elsif( $lines[0]=~/^[A-Z][A-Z][A-Z]/){ #elsif the first line starts with three capital letters...
        return $lines[0] #the name is what's on the first line
    }
    else{ #otherwise...
        return "NULL"; #don't return anything for that paragraph
    }
}

sub get_key_group { #Key Group comes at the end of the common name. If no common name, it's at the end of the taxon author
	my $par = shift;
	if($par=~/\HCOMMON NAME: *(.+) \((Group.+)\)/){
			return "\'$2\'";
		}
	elsif($par=~/\HTAXON AUTHOR: *(.+) \((Group.+)\)/){
			return "\'$2\'";
		}
	else{
		return "NULL";
	}
}


sub strip_name{
local($_) = @_;


s/"//g;
$_=ucfirst($_);

s/  +/ /g;
s/^ +//;
s/ +$//;


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



s/,//g; #delete stray commas
s/^([A-Z][A-Za-z-]+) (\b[-a-z]+) [\w&;'().\- ]+ (\bsubvar\.|\bsubsp\.|\bvar\.|\bf\.|\bnothosubsp\.) (\b[a-z-]+) [\w&;'().\- ]+/$1 $2 $3 $4/ ||
s/^([A-Z][A-Za-z-]+) (\b[-a-z]+) [\w&;'().\- ]+ (\bsubvar\.|\bsubsp\.|\bvar\.|\bf\.|\bnothosubsp\.) ([-a-z]+)/$1 $2 $3 $4/ ||
s/^([A-Z][A-Za-z-]+) (\b[-a-z]+) (\bsubvar\.|\bsubsp\.|\bvar\.|\bf\.|\bnothosubsp\.) ([-a-z]+) [\w&;'().\- ]+/$1 $2 $3 $4/ ||
s/^([A-Z][A-Za-z-]+) (\b[-a-z]+) (\bsubvar\.|\bsubsp\.|\bvar\.|\bf\.|\bnothosubsp\.) ([-a-z]+)/$1 $2 $3 $4/ ||
s/^([A-Z][A-Za-z-]+) (\b&times;)([-a-z]+) [\w&;'().\- ]+/$1 $2$3/||
s/^([A-Z][A-Za-z-]+) (\b&times;)([-a-z]+)/$1 $2$3/||
s/^([A-Z][A-Za-z-]+) (\b[-a-z]+) [\w&;'().\- ]+/$1 $2/||
s/^([A-Z][A-Za-z-]+) (\b[-a-z]+)/$1 $2/||
s/^(&times;)([A-Z]?[A-Za-z-]+) (\b[-a-z]+) [\w&;'().\- ]+/$1$2 $3/||
s/^(&times;)([A-Z]?[A-Za-z-]+) (\b[-a-z]+)/$1$2 $3/;
s/ +/ /;
s/ +$//;
s/^ +//;


#print "$_ \n";
$_;
}
