
use lib "/JEPS-master/Jepson-eFlora/Modules/";
use flatten;

use BerkeleyDB;
open (ERR, ">keybase_log.txt");


my ($C4,$end) = "";

open (OUT, ">input_files/keybase_keys.txt");
#open (FORMAT, ">input_files/keybase_keys_formatted.sql");


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

	$all_lines=<IN>;




	@all_pars=split(/\n\n+/,$all_lines);

	my $taxon_name= &get_taxon_name(@all_pars);


foreach(@all_pars){

next if m/^#/;
warn "$_\n" if $seen_line{$_}++;
next if m/^Admin/;
next if m/^PROOF:/;
next if m/^CAPTION:/;
next if m/ENCELIA farinosa &times; E. frutescens/;

		
		@lines=split("\n",$_);



#harvest genus species combined name for ammending to keys of infra taxa
if ($taxon_name =~ /ENCELIA farinosa &times; E. frutescens/){ #the spontaneous hybrid is kluged because there is only one and it's awkward
	$taxon_name = "Encelia farinosa &times; frutescens";
}
elsif ($taxon_name =~ /VERBESINA encelioides .+/){ #the Hook. f. in authority causes this to choke in strip name
	$taxon_name = "Verbesina encelioides";
}
elsif ($taxon_name =~ /([A-Z]+) ([a-z-]+) (.+) (nothosubsp.|subvar.|var\.|subsp\.) ([a-z-]+)$/){ #if it is an infra with an author inserted (that's the ".+")
	$genus = ucfirst(lc($1));
	$species = $2;
	$taxon_name=ucfirst(lc($genus))." ".$species;
}
elsif ($taxon_name =~ /([A-Z]+) ([a-z-]+) (nothosubsp.|subvar.|var\.|subsp\.) ([a-z-]+)$/){ #if it is an infra without an author in the name, except if we have forma, those should go through strip name below
	$genus = ucfirst(lc($1));
	$species = $2;
	$taxon_name=ucfirst(lc($genus))." ".$species;
}
else { #The rest should be family, genus, or binomial species treatments
	$taxon_name=ucfirst(lc($taxon_name));
}



		if(m/^([A-Z]+ACEAE) \(([A-Z][a-z]+)\)$/ms){
			$key_genus=$1;
			$key_genus=ucfirst(lc($key_genus));

			if($NAME_TO_CODE{$key_genus}){
				$name_anchor = $NAME_TO_CODE{$key_genus};
print "2\n" if $key_genus=~m/Poaceae/;
			}
		}#if(s|^([A-Z]+ACEAE)

		if(m/^([A-Z]+ACEAE)$/ms){
			$key_genus=$1;
			$key_genus=ucfirst(lc($key_genus));

			if($NAME_TO_CODE{$key_genus}){
				$name_anchor = $NAME_TO_CODE{$key_genus};
print "1\n" if $key_genus=~m/Malvaceae/;
			}
		}#if(s|^([A-Z]+ACEAE)

		if(m/^([A-Z]+)$/ms){
		
			$key_genus=$1;
			$key_genus=ucfirst(lc($key_genus));
			
				if($NAME_TO_CODE{$key_genus}){
					$name_anchor = $NAME_TO_CODE{$key_genus};
print "4\n" if $key_genus=~m/Penstemon/;
				}
		}#if(s|^([A-Z]+)$|


#foreach(@all_pars){
#if( m/^1\./ ||
###################### KEYS ##########################
		if( m/^1\./ || m/^UNABRIDGED KEY/ || m/^Group \d+[A-Z]?[.:]/ || m/^Key to Groups/ || m/^Key to Groups Based Primarily on Flowering Material/|| m/^Key to Groups Based on Fruiting Material/|| m/^Key to Pistillate Plants/|| m/^Key to Staminate Plants/|| m/^Key to Vegetative Plants/ || m/^Group \d+ *\n/){
			$uk="";
			print ERR "$file KEY $&\n\n";
			@lines=split(/\n/);
			$lines[$#lines]="" if $lines[$#lines]=~/^PROOF:/;
			
				if ($lines[0]=~m/UNABRIDGED KEY/){
					print "$lines[0]\n";
					$uk=shift(@lines);
					print ERR "UK: $uk\n\n";
					$exclude=1;
				}
				if ($lines[0]=~/(Group \d+)/ && $lines[1]=~/^[A-Z]/){
					print ERR "KEY $lines[0] $lines[0]\n\n";
					$group = $1;
					$uk=shift(@lines);
					$uk .= " ";
					$uk .= shift(@lines);
					print ERR "KEY $lines[0] $lines[0]]\n\n";
				}
				if ($lines[0]=~/(Key to (Groups|genera|California|pistillate|staminate).*)/i){
					print ERR "KEY $lines[0]\n\n";
					$group = $1;
					$uk=shift(@lines);
					print ERR "KEY $lines[0]\n\n";
				}
				if ($lines[0]=~/^(Group \d+)/){
					$group = $1;
					print ERR "KEY $lines[0]\n\n";
					$uk=shift(@lines);
					print ERR "KEY $lines[0]\n\n";
				}
				if ($lines[0]=~/^(SALIX Key.*)/){
					$group = $1;
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
				#s/\.+[-_]*>/--&gt;/g;
				#s/-->/--&gt;/g;

#foreach(@all_pars){
#if( m/^1\./ ||
#foreach(@lines[0 .. $#lines]){

		if(m!\.\.+-> *(\d*)([A-Z]). ([a-z-]+) (nothosubsp\.|subsp\.|var\.) ([a-z-]+)!){
			$key_species=$3;
			$key_rank=$4;
			$key_infra=$5;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species $key_rank $key_infra"} || "C1";
			$goto_name= "$key_genus $key_species $key_rank $key_infra";
			s!\.\.+-> *(\d*)([A-Z]). ([a-z-]+) (nothosubsp\.|subsp\.|var\.) ([a-z-]+)!\t$goto_name!;
			print ERR qq{1 $key_genus $key_species $key_rank $key_infra code=$goto_code\n\n};
		}
		#1' Ann; lvs narrowly elliptic to ovate or obovate.....-> [P. ruderale var. macrocephalum]
		elsif(m!\.\.+-> *(\d*)\[([A-Z]). ([a-z-]+) (nothosubsp\.|subsp\.|var\.) ([a-z-]+)\]!){
			$key_species=$3;
			$key_rank=$4;
			$key_infra=$5;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species $key_rank $key_infra"} || "C2";
			$goto_name="$key_genus $key_species $key_rank $key_infra";
			s!\.\.+-> *(\d*)\[([A-Z]). ([a-z-]+) (nothosubsp\.|subsp\.|var\.) ([a-z-]+)\]!\t$goto_name!;
			print ERR qq{2 $key_genus $key_species $key_rank $key_infra code=$goto_code\n\n};
		}
		elsif( m!\.\.+-> *(most )([A-Z]). ([&;a-z-]+)!){
			$key_species=$3;
			$goto_code=$NAME_TO_CODE{"$key_genus $key_species"} || "C3";
			$goto_name="$key_genus $key_species";
			if($goto_code eq "C3"){
				print qq{3 >$key_genus $key_species< code=$goto_code\n\n};
			}

			print ERR qq{3 $key_genus $key_species code=$goto_code\n\n};
			s!\.\.+-> *(most )([A-Z]). ([&;a-z-]+)!\t$goto_name!;
		}
		elsif( m!\.\.+-> *(\d*)([A-Z]). ([&;a-z-]+)!){
			$key_species=$3;
			$goto_name="$key_genus $key_species";

			#fix an error due to key formatting
					if($goto_name =~ m/Unabridged (triloba|purpurea|indica|hederacea|cairica)/i){
						$key_species=$1;
						$name_anchor=$NAME_TO_CODE{"Ipomoea"};
						$key_name="Ipomoea";
						$goto_name = $key_name." ".$key_species;
					}
			
			$goto_code=$NAME_TO_CODE{$goto_name} || "C4";
			
			if($goto_code eq "C4"){
				print qq{4 >$key_genus $key_species< code=$goto_code\n\n};
				++$C4;
			}
			print ERR qq{4.1 $key_genus $key_species code=$goto_code\n\n};
			s!\.\.+-> *(\d*)([A-Z]). ([&;a-z-]+)!\t$goto_name!;
		}
		elsif(m!\.\.+-> *(\d*)([A-Z][A-Z]+)!){
			#$key_species="";
			$key_name=ucfirst(lc($2));
			$goto_code= $NAME_TO_CODE{$key_name} || "C5";
			#$goto_code=$NAME_CODE{$key_genus} || $TNOAN{$key_genus} || "C7";
			print ERR qq{5 $key_name code=$goto_code\n\n};
			s!\.\.+-> *(\d*)([A-Z][A-Z]+)!\t$key_name!;
		}
		elsif(m!\.\.+-> *\[(\d*)([A-Z][A-Z]+).*\]!){
			$key_species="";
			#$key_genus=ucfirst(lc($2));
			$goto_code=$NAME_TO_CODE{$key_genus} || "C6";
			$goto_name= $key_genus;
			print ERR qq{6 $key_genus code=$goto_code\n\n};
			s!\.\.+-> *\[(\d*)([A-Z][A-Z]+)(.*\])!\t$goto_name!;
		}
		elsif(m!\.\.+-> *(nothosubsp\.|subsp\.|var\.) ([a-z-]+)!){
			$key_rank=$1;
			$key_infra=$2;
			$goto_code= $NAME_TO_CODE{"$taxon_name $key_rank $key_infra"} || "C7 flabba : $key_genus : $key_species : $key_rank $key_infra";
			$insert_name= "$goto_name $key_rank $key_infra";#pass this down from the key couplet above, which has the correct genus species??
			print ERR qq{7 $key_genus $key_species $key_rank $key_infra code=$goto_code\n\n};
			s!\.\.+-> *(nothosubsp\.|subsp\.|var\.) ([a-z-]+)!\t$insert_name!;
		}
		elsif(m!\.\.+-> *\[(nothosubsp\.|subsp\.|var\.) ([a-z-]+)\]!){
			$key_rank=$1;
			$key_infra=$2;
			$goto_code= $NAME_TO_CODE{"$taxon_name $key_rank $key_infra"} || "C7a flabba : $key_genus : $key_species : $key_rank $key_infra";
			$insert_name= "$goto_name $key_rank $key_infra";#pass this down from the key couplet above, which has the correct genus species??
			print ERR qq{7a $key_genus $key_species $key_rank $key_infra code=$goto_code\n\n};
			s!\.\.+-> *\[(nothosubsp\.|subsp\.|var\.) ([a-z-]+\])!\t$insert_name!;
		}
		elsif( m!\.\.+-> *\[(\d*)([A-Z]). ([&;a-z-]+)\]!){
			$key_species=$3;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species"} || "C8";
			$goto_name= "$key_genus $key_species";
			print ERR qq{8 $key_genus $key_species code=$goto_code\n\n};
			s!\.\.+-> *\[(\d*)([A-Z]). ([&;a-z-]+)\]!\t$goto_name!;
		}
		elsif( m!\.\.+-> *\[(\d*)([A-Z]). ([&;a-z-]+);.*\]!){
			$key_species=$3;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species"} || "C9";
			$goto_name= "$key_genus $key_species";
			print ERR qq{9 $key_genus $key_species code=$goto_code\n\n};
			s!\.\.+-> *\[(\d*)([A-Z]). ([&;a-z-]+)(;.*)\]!\t$goto_name!;
		}
		elsif(m!\.\.+-> *\[(\d*)([A-Z][a-z]+).*\]!){
			$key_name=ucfirst(lc($2));
			$goto_code=$NAME_TO_CODE{$key_name} || "C10";
			print ERR qq{10 $key_name code=$goto_code\n\n};
			s!\.\.+-> *\[(\d*)([A-Z][a-z]+)(.*\])!\t$key_name!;
		}
		elsif(m!\.\.+-> *(\d*)([A-Z][a-z]+) ([^ ]+) *\(.*!){
			$key_name=ucfirst(lc($2));
			$key_species=$3;
			$goto_code= $NAME_TO_CODE{"$key_name $key_species"} || "C11";
			$goto_name= "$key_name $key_species";
			print ERR qq{11 $key_genus code=$goto_code\n\n};
			s!\.\.+-> *(\d*)([A-Z][a-z]+)(.*)(\(.*)!\t$goto_name!;
		}
		elsif(m!\.\.+-> *(Group) (.*)!){
			$target="$1 $2";
			print ERR qq{12 goto code=$target\n\n};
			s!\.\.+-> *(\d*)([A-Z][a-z]+) (.*)!\t$target!;
		}
		elsif(m!\.\.+-> *(\d*)([A-Z][a-z]+) ([a-z]+) (var\.|subsp\.) ([a-z]+)(.*)!){
			$key_name=ucfirst(lc($2));
			$target="$2 $3 $4 $5";
			$goto_name = "$key_name $target";
			$goto_code= $NAME_TO_CODE{$target} || "C12a";
			print ERR qq{12a $target code=$goto_code   $_\n\n};
			s!\.\.+-> *(\d*)([A-Z][a-z]+) ([a-z]+)(.*)!\t$goto_name!;
		}
		elsif(m!\.\.+-> *(\d*)([A-Z][a-z]+) ([a-z]+)(.*)!){
			$key_name=ucfirst(lc($2));
			$target="$2 $3";
			$key_species="";
			$goto_name = "$key_name $target";
			$goto_code= $NAME_TO_CODE{$target} || "C12b";
			print ERR qq{12b $goto_name code=$goto_code $_\n\n};
			s!\.\.+-> *(\d*)([A-Z][a-z]+ [a-z]+)!\t$goto_name!;
			

			#12b Elymus multisetus code=24122 <a href="#ALE33.">33'</a><a name="ALE33'"> </a> Per; spikelets 2(3--4) per node --> Elymus multisetus
		}
		elsif(m!\.\.+-> *(\d*)([A-Z][a-z]+) (.*)!){
			$key_name=ucfirst(lc($2));
			$goto_code= $NAME_TO_CODE{$key_name} || "C2";
			print ERR qq{12 $key_genus code=$goto_code\n\n};
			s!\.\.+-> *(\d*)([A-Z][a-z]+)(.*)!\t$key_genus!;
		}

		#13. Pinnae fan-shaped, texture delicate, deep green; outer margins finely toothed or crenate; occurring in or very near saturated substrate .....-> sun forms of B. crenulatum(2), see also lead 9
		#6. Trophophore and sporophore joined well below mid-lf, gen at ground level.....-> small or shade pls of _Botrychium simplex_(2) or _Botrychium pumicola_(2), see lead 3 for separation of taxa
		#<a href="#AO6'">6.</a><a name="AO6."> </a> Trophophore and sporophore joined well below mid-lf, gen at ground level--> small or shade pls of _Botrychium simplex_(2) or _Botrychium pumicola_(2), see lead 3 for separation of taxa
		elsif( m!\.\.+->.*_([A-Z].) ([&;a-z-]+)_!){
			$key_species=$2;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species"} || "C12";
			$goto_name = "$key_genus $key_species";
			#$goto_code=$NAME_CODE{"$key_genus $key_species"} || $TNOAN{"$key_genus $key_species"} || "C12";
			print ERR qq{13 $key_genus $key_species code=$goto_code\n\n};
			s!\.\.+-> (.*)_([A-Z]). ([&;a-z-]+)_!\t$goto_name!;
		}
		#1. Fl radial; calyx, corolla gen inconspicuous; petals free or fused, lobes not overlapped in bud; stamens 5--many, often long-exserted; lf 2-pinnate (simple in alien _Acacia_).....-> Group 1: Mimosoideae
		elsif( m!\.\.+-> *Group \d+: ([^ ]+)!){
			$goto_code=$1;
			s!\.\.+-> *(Group \d+: )([A-Z][a-z]+) *(.*)!\t$1 $2 $3</a>!;
		}
		elsif( m!\.\.+-> \[(.*) &times;(.*)!){
			s!\.\.+-> *(.*)!\t$1!;
		}
		elsif( m!\.\.+-> .*see .*lead \d!){
			s!\.\.+-> *(.*)!\t$1!;
		}
		elsif( m!\.\.+-> .*see _[A-Z]!){
			s!\.\.+-> *(.*)!\t$1!;
		}
		else{
			if (m/-+>/){
				print ERR "KEY ERROR SKIPPED==>$_ C4\n\n";
				print "$_ C4\n\n";
				++$end;
			}
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

		s/\.\.\.\.\.&nbsp; +/.....&nbsp;/;
	}#foreach(@lines[0 .. $#lines]){


	$keybase=join("\n",@lines);

	$newline=join(" ",@lines);

	
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

	if($exclude==1){
		if($keybase){
		print ERR "KEY: $name_anchor\n\n";
		print OUT "\t".$name_anchor."\t".$key_name."\t\n".$keybase."\n##########END OF KEY\n";
		}
		else{
		print ERR "KEY: $name_anchor\n\n";
		print OUT $key_name." ".$group;
		}
		#print FORMAT $name_anchor."\t<blockquote><h3>".$uk."</h3>".$newline."<\/blockquote>\n";
		#$IJM_key{$name_anchor}= "<blockquote><h3>".$uk."</h3>".$_."<\/blockquote>";
	}
	else{
		if($keybase){
		print ERR "KEY: $name_anchor\n\n";
		print OUT "\t".$name_anchor."\t".$key_name."\t\n".$keybase."\n##########END OF KEY\n";
		}
		else{
		print ERR "KEY: $name_anchor\n\n";
		print OUT $key_name." ".$group;
		}
	}
		
		#print FORMAT $name_anchor."\t<blockquote><h3>".$uk."</h3>".$newline."<\/blockquote>\n";
		#$IJM_key{$name_anchor}= "<blockquote><h3>$uk</h3>$_<\/blockquote>";
	#}
	#next;
}#if( m/^1\./ ||
######################################################END OF KEY SECTION



		
}#foreach(@all_pars){


close(ERR);
close(OUT);


print <<EOP;
Problem C4 Names: $C4

Error Key Names: $end
EOP


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
