open (OUT, ">input/keybase_keys_to_upload.txt");
#open (FORMAT, ">input_files/keybase_keys_formatted.sql");


open(IN, "../synonymy/input/smasch_taxon_ids.txt") || die;
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


$file="../eflora_database/input/keybase_keys_formatted.txt";
	undef($/);
	open(IN,$file) || die "couldn't open $file\n";
warn "reading from $file\n";

	@all_pars=split(/\n\n+/,$all_lines);


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
			#$goto_code=$NAME_CODE{"$key_genus $key_species"} || $TNOAN{"$key_genus $key_species"} || "C6";
			print ERR qq{3 $key_genus $key_species code=$goto_code\n\n};
			s!\.\.+-> *(most )([A-Z]). ([&;a-z-]+)!\t$goto_name!;
		}
		elsif( m!\.\.+-> *(\d*)([A-Z]). ([&;a-z-]+)!){
			$key_species=$3;
			$goto_code=$NAME_TO_CODE{"$key_genus $key_species"} || "C4";
			$goto_name="$key_genus $key_species";
			#$goto_code=$NAME_CODE{"$key_genus $key_species"} || $TNOAN{"$key_genus $key_species"} || "C6";
			if($goto_code eq "C4"){
				print qq{4 >$key_genus $key_species< code=$goto_code\n\n};
				++$C4;
			}
			print ERR qq{4.1 $key_genus $key_species code=$goto_code\n\n};
			s!\.\.+-> *(\d*)([A-Z]). ([&;a-z-]+)!\t$goto_name!;
		}
		elsif(m!\.\.+-> *(\d*)([A-Z][A-Z]+)!){
			#$key_genus=ucfirst(lc($2));
			$goto_code= $NAME_TO_CODE{$key_genus} || "C5";
			$goto_name= $key_genus;
			#$goto_code=$NAME_CODE{$key_genus} || $TNOAN{$key_genus} || "C7";
			print ERR qq{5 $key_genus code=$goto_code\n\n};
			s!\.\.+-> *(\d*)([A-Z][A-Z]+)!\t$goto_name!;
		}
		elsif(m!\.\.+-> *\[(\d*)([A-Z][A-Z]+).*\]!){
			#$key_genus=ucfirst(lc($2));
			$goto_code=$NAME_TO_CODE{$key_genus} || "C6";
			$goto_name= $key_genus;
			print ERR qq{6 $key_genus code=$goto_code\n\n};
			s!\.\.+-> *\[(\d*)([A-Z][A-Z]+)(.*\])!\t$goto_name!;
		}
		elsif(m!\.\.+-> *(nothosubsp\.|subsp\.|var\.) ([a-z-]+)!){
			$key_rank=$1;
			$key_infra=$2;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species $key_rank $key_infra"} || "C7 flabba : $key_genus : $key_species : $key_rank $key_infra";
			$goto_name= "$key_genus $key_species $key_rank $key_infra";
			#$goto_code=$NAME_CODE{"$key_genus $key_species $key_rank $key_infra"} || $TNOAN{"$key_genus $key_species $key_rank $key_infra"} || "flabba : $key_genus : $key_species : $key_rank $key_infra";
			print ERR qq{7 $key_genus $key_species $key_rank $key_infra code=$goto_code\n\n};
			s!\.\.+-> *(nothosubsp\.|subsp\.|var\.) ([a-z-]+)!\t$goto_name!;
		}
		elsif(m!\.\.+-> *\[(nothosubsp\.|subsp\.|var\.) ([a-z-]+)\]!){
			$key_rank=$1;
			$key_infra=$2;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species $key_rank $key_infra"} || "C7a flabba : $key_genus : $key_species : $key_rank $key_infra";
			$goto_name= "$key_genus $key_species $key_rank $key_infra";
			print ERR qq{7a $key_genus $key_species $key_rank $key_infra code=$goto_code\n\n};
			s!\.\.+-> *\[(nothosubsp\.|subsp\.|var\.) ([a-z-]+\])!\t$goto_name!;
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
			#$key_genus=ucfirst(lc($2));
			$goto_code=$NAME_TO_CODE{$key_genus} || "C10";
			$goto_name= $key_genus;
			print ERR qq{10 $key_genus code=$goto_code\n\n};
			s!\.\.+-> *\[(\d*)([A-Z][a-z]+)(.*\])!\t$goto_name!;
		}
		elsif(m!\.\.+-> *(\d*)([A-Z][a-z]+) ([^ ]+) *\(.*!){
			#$key_genus=ucfirst(lc($2));
			$key_species=$3;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species"} || "C11";
			$goto_name= "$key_genus $key_species";
			print ERR qq{11 $key_genus code=$goto_code\n\n};
			s!\.\.+-> *(\d*)([A-Z][a-z]+)(.*)(\(.*)!\t$goto_name!;
		}
		elsif(m!\.\.+-> *(Group) (.*)!){
			$target="$1 $2";
			print ERR qq{12 goto code=$target\n\n};
			s!\.\.+-> *(\d*)([A-Z][a-z]+) (.*)!\t$target!;
		}
		elsif(m!\.\.+-> *(\d*)([A-Z][a-z]+) ([a-z]+) (var\.|subsp\.) ([a-z]+)(.*)!){
			#$key_genus=ucfirst(lc($2));
			$target="$2 $3 $4 $5";
			$goto_name = "$key_genus $target";
			$goto_code= $NAME_TO_CODE{$target} || "C12a";
			print ERR qq{12a $target code=$goto_code   $_\n\n};
			s!\.\.+-> *(\d*)([A-Z][a-z]+) ([a-z]+)(.*)!\t$goto_name!;
		}
		elsif(m!\.\.+-> *(\d*)([A-Z][a-z]+) ([a-z]+)(.*)!){
			#$key_genus=ucfirst(lc($2));
			$target="$2 $3";
			$goto_name = "$key_genus $target";
			$goto_code= $NAME_TO_CODE{$target} || "C12b";
			print ERR qq{12b $target code=$goto_code $_\n\n};
			s!\.\.+-> *(\d*)([A-Z][a-z]+ [a-z]+)!\t$goto_name!;
			print ERR qq{12b $target code=$goto_code $_\n\n};

			#12b Elymus multisetus code=24122 <a href="#ALE33.">33'</a><a name="ALE33'"> </a> Per; spikelets 2(3--4) per node --> Elymus multisetus
		}
		elsif(m!\.\.+-> *(\d*)([A-Z][a-z]+) (.*)!){
			#$key_genus=ucfirst(lc($2));
			$goto_code= $NAME_TO_CODE{$key_genus} || "C2";
			$goto_name = $key_genus;
			print ERR qq{12 $key_genus code=$goto_code\n\n};
			s!\.\.+-> *(\d*)([A-Z][a-z]+)(.*)!\t$goto_name!;
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
			print ERR "$_ C4\n\n" if m/-->/;
			print "$_ C4\n\n" if m/-->/;
			++$end if m/-->/;
		}
		
		
		
		
s/Agropyron$/Agropyron {Agropyron cristatum subsp. pectinatum}/;
s/Ammophila$/Ammophila {Ammophila arenaria}/;
s/Arrhenatherum$/Arrhenatherum {Arrhenatherum elatius}/;
s/Arundo$/Arundo {Arundo donax}/;
s/Beckmannia$/Beckmannia {Beckmannia syzigachne}/;
s/Blepharidachne$/Blepharidachne {Blepharidachne kingii}/;
s/Cynodon$/Cynodon {Cynodon dactylon}/;
s/Dactylis$/Dactylis {Dactylis glomerata}/;
s/Dactyloctenium$/Dactyloctenium {Dactyloctenium aegyptium}/;
s/Dasyochloa$/Dasyochloa {Dasyochloa pulchella}/;
s/Desmazeria$/Desmazeria {Desmazeria rigida}/;
s/Dissanthelium$/Dissanthelium {Dissanthelium californicum}/;
s/Enneapogon$/Enneapogon {Enneapogon desvauxii}/;
s/Erioneuron$/Erioneuron {Erioneuron pilosum}/;
s/Gastridium$/Gastridium {Gastridium phleoides}/;
s/Gaudinia$/Gaudinia {Gaudinia fragilis}/;
s/Hainardia$/Hainardia {Hainardia cylindrica}/;
s/Heteropogon$/Heteropogon {Heteropogon contortus}/;
s/Hyparrhenia$/Hyparrhenia {Hyparrhenia hirta}/;
s/Imperata$/Imperata {Imperata brevifolia}/;
s/Lagurus$/Lagurus {Lagurus ovatus}/;
s/Lamarckia$/Lamarckia {Lamarckia aurea}/;
s/Leersia$/Leersia {Leersia oryzoides}/;
s/Melinis$/Melinis {Melinis repens subsp. repens}/;
s/Munroa$/Munroa {Munroa squarrosa}/;
s/Neostapfia$/Neostapfia {Neostapfia colusana}/;
s/Oryza$/Oryza {Oryza sativa}/;
s/Phragmites$/Phragmites {Phragmites australis}/;
s/Phyllostachys$/Phyllostachys {Phyllostachys aurea}/;
s/Saccharum$/Saccharum {Saccharum ravennae}/;
s/Sclerochloa$/Sclerochloa {Sclerochloa dura}/;
s/Scleropogon$/Scleropogon {Scleropogon brevifolius}/;
s/Scribneria$/Scribneria {Scribneria bolanderi}/;
s/Secale$/Secale {Secale cereale}/;
s/Sphenopholis$/Sphenopholis {Sphenopholis obtusata}/;
s/Stenotaphrum$/Stenotaphrum {Stenotaphrum secundatum}/;
s/Swallenia$/Swallenia {Swallenia alexandrae}/;
s/Tridens$/Tridens {Tridens muticus var. muticus}/;
s/Triticum$/Triticum {Triticum aestivum}/;
s/Vahlodea$/Vahlodea {Vahlodea atropurpurea}/;
s/Ventenata$/Ventenata {Ventenata dubia}/;
s/Zizania$/Zizania {Zizania palustris var. interior}/;
