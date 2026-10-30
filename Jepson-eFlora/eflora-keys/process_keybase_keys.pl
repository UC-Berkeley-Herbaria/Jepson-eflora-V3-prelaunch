
#open (FAM, ">keybase/keybase_keys_families_processed.txt");
#open (GEN, ">keybase/keybase_keys_genera_processed.txt");
#open (SPE, ">keybase/keybase_keys_species_processed.txt");
#open (GGR, ">keybase/keybase_keys_genus_groups_processed.txt");
open (FGR, ">keybase/keybase_keys_family_groups_processed.txt");
#open (UNA, ">keybase/keybase_keys_unabridged_processed.txt");
#open (KGR, ">keybase/keybase_keys_key_to_groups_processed.txt");

$/="\n\n";
#OPEN THE RAW FILE
$treatments="/JEPS-master/Jepson-eFlora/eflora_keys/keybase/keybase_keys_family_groups.txt";
open(IN,$treatments) || die;
#STORE THE FILE IN AN ARRAY, ONE PARAGRAPH PER ELEMENT
@all_pars=(<IN>);


my @found2=grep(/\t[A-Z][a-z-]+ [a-z-]+\n/g,@all_pars);

	foreach $j (0 .. $#all_pars){		

#family group key problem names:
#NITRARIACEAE this should be Nitrariaceae {Peganum harmala}
#FABACEAE (Papilionoideae) this should be Fabaceae Group 3
#Papaveraceae (papaveroideae) this should be just Papaveraceae in KeyBase
#Papaveraceae (fumarioideae) this should be just Papaveraceae in KeyBase
#Ranunculaceae (actaea, consolida) this should be just Ranunculaceae in KeyBase
#in this case, the key was changed in an errata in 2013, but the old 2012 version was the only one added to keybase.
#The version in keybase is the 2012 version that key to separate Actea & Consolida and Nitrariaceae into 3 separate lines



#correct some special cases where the genus key never gets linked in KeyBase
#Each one only contains two or three species, but they are identified to species within the Asteraceae key, instead of just to genus like most other cases.
#They still have a separate key for the genus.
#As a result, the genus keys do not get nested in the KeyBase tree structure


#now we want to change the all of the ones that have genus and species to the above format genus {genus species}
#this is something we only want to do in the Family and Family Group keys because the end points in these keys should lead
#to the genus keys.
#some cases lead to just a single species, but in keybase, we want to link to that taxon and have a link to the genus key.

		if($all_pars[$j] =~ m/\t[A-Z][a-z-]+ [a-z-]+\n/g){
			$all_pars[$j] =~ s/\t([A-Z][a-z-]+) ([a-z-]+)\n/\t$1 {$1 $2}\n/g;
			++$found2;


			$gen[$j] = $1;
			$spe[$j] = $2;

		}

#some cases lead to just a single subtaxon, but in keybase, we want to link to that subtaxon and have a link to the genus key.
		if($all_pars[$j] =~ m/\t[A-Z][a-z-]+ [a-z-]+ (var\.|subsp\.) [a-z-]+\n/g){
			$all_pars[$j] =~ s/\t([A-Z][a-z-]+) ([a-z-]+) (var\.|subsp\.) ([a-z-]+)\n/\t$1 {$1 $2 $3 $4}\n/g;



			$gen = $1;
			$spe = $2;
			$sub = $4;
			$name3=$gen.$spe.$sub;
				foreach ($name3){
					++$found3;
				}
		}





++$found1;
#examples:
#s SnJV	Monolopia congdonii
#pistillate flowers many	Pluchea sericea
#lobed or toothed	Perityle emoryi
#13 mm	Pyrrocoma carthamoides var. cusickii
#opposite	Lasthenia microglossa
#herb with rhizome	Tanacetum bipinnatum
#make first line file names
$all_pars[$j] =~ s/^([A-Z][a-z]+aceae Group \d+[A-Za-z]*):?.*/$1/;


$all_pars[$j] =~ s/\tDigitaria californica var. californica\n/\tDigitaria {Digitaria californica var. californica}\n/;


#second line is key title
	if ($all_pars[$j] =~ m/\t(Agropyron|Ammophila|Arrhenatherum|Arundo|Beckmannia|Blepharidachne|Cynodon|Dactylis|Dactyloctenium|Dasyochloa|Desmazeria|Dissanthelium|Enneapogon|Erioneuron|Gastridium|Gaudinia|Hainardia|Heteropogon|Hyparrhenia|Imperata|Lagurus|Lamarckia|Leersia|Melinis|Munroa|Neostapfia|Oryza|Phragmites|Phyllostachys|Saccharum|Sclerochloa|Scleropogon|Scribneria|Secale|Sphenopholis|Stenotaphrum|Swallenia|Tridens|Triticum|Vahlodea|Ventenata|Zizania)\n/){

	#print "Before: $all_pars[$j]\n";

#make additional specific line changes, these are genera with only a single species
$all_pars[$j] =~ s/\tAgropyron\n/\tAgropyron {Agropyron cristatum subsp. pectinatum}\n/;
$all_pars[$j] =~ s/\tAmmophila\n/\tAmmophila {Ammophila arenaria}\n/;
$all_pars[$j] =~ s/\tArrhenatherum\n/\tArrhenatherum {Arrhenatherum elatius}\n/;
$all_pars[$j] =~ s/\tArundo\n/\tArundo {Arundo donax}\n/;
$all_pars[$j] =~ s/\tBeckmannia\n/\tBeckmannia {Beckmannia syzigachne}\n/;
$all_pars[$j] =~ s/\tBlepharidachne\n/\tBlepharidachne {Blepharidachne kingii}\n/;
$all_pars[$j] =~ s/\tCynodon\n/\tCynodon {Cynodon dactylon}\n/;
$all_pars[$j] =~ s/\tDactylis\n/\tDactylis {Dactylis glomerata}\n/;
$all_pars[$j] =~ s/\tDactyloctenium\n/\tDactyloctenium {Dactyloctenium aegyptium}\n/;
$all_pars[$j] =~ s/\tDasyochloa\n/\tDasyochloa {Dasyochloa pulchella}\n/;
$all_pars[$j] =~ s/\tDesmazeria\n/\tDesmazeria {Desmazeria rigida}\n/;
$all_pars[$j] =~ s/\tDissanthelium\n/\tDissanthelium {Dissanthelium californicum}\n/;
$all_pars[$j] =~ s/\tEnneapogon\n/\tEnneapogon {Enneapogon desvauxii}\n/;
$all_pars[$j] =~ s/\tErioneuron\n/\tErioneuron {Erioneuron pilosum}\n/;
$all_pars[$j] =~ s/\tGastridium\n/\tGastridium {Gastridium phleoides}\n/;
$all_pars[$j] =~ s/\tGaudinia\n/\tGaudinia {Gaudinia fragilis}\n/;
$all_pars[$j] =~ s/\tHainardia\n/\tHainardia {Hainardia cylindrica}\n/;
$all_pars[$j] =~ s/\tHeteropogon\n/\tHeteropogon {Heteropogon contortus}\n/;
$all_pars[$j] =~ s/\tHyparrhenia\n/\tHyparrhenia {Hyparrhenia hirta}\n/;
$all_pars[$j] =~ s/\tImperata\n/\tImperata {Imperata brevifolia}\n/;
$all_pars[$j] =~ s/\tLagurus\n/\tLagurus {Lagurus ovatus}\n/;
$all_pars[$j] =~ s/\tLamarckia\n/\tLamarckia {Lamarckia aurea}\n/;
$all_pars[$j] =~ s/\tLeersia\n/\tLeersia {Leersia oryzoides}\n/;
$all_pars[$j] =~ s/\tMelinis\n/\tMelinis {Melinis repens subsp. repens}\n/;
$all_pars[$j] =~ s/\tMunroa\n/\tMunroa {Munroa squarrosa}\n/;
$all_pars[$j] =~ s/\tNeostapfia\n/\tNeostapfia {Neostapfia colusana}\n/;
$all_pars[$j] =~ s/\tOryza\n/\tOryza {Oryza sativa}\n/;
$all_pars[$j] =~ s/\tPhragmites\n/\tPhragmites {Phragmites australis}\n/;
$all_pars[$j] =~ s/\tPhyllostachys\n/\tPhyllostachys {Phyllostachys aurea}\n/;
$all_pars[$j] =~ s/\tSaccharum\n/\tSaccharum {Saccharum ravennae}\n/;
$all_pars[$j] =~ s/\tSclerochloa\n/\tSclerochloa {Sclerochloa dura}\n/;
$all_pars[$j] =~ s/\tScleropogon\n/\tScleropogon {Scleropogon brevifolius}\n/;
$all_pars[$j] =~ s/\tScribneria\n/\tScribneria {Scribneria bolanderi}\n/;
$all_pars[$j] =~ s/\tSecale\n/\tSecale {Secale cereale}\n/;
$all_pars[$j] =~ s/\tSphenopholis\n/\tSphenopholis {Sphenopholis obtusata}\n/;
$all_pars[$j] =~ s/\tStenotaphrum\n/\tStenotaphrum {Stenotaphrum secundatum}\n/;
$all_pars[$j] =~ s/\tSwallenia\n/\tSwallenia {Swallenia alexandrae}\n/;
$all_pars[$j] =~ s/\tTridens\n/\tTridens {Tridens muticus var. muticus}\n/;
$all_pars[$j] =~ s/\tTriticum\n/\tTriticum {Triticum aestivum}\n/;
$all_pars[$j] =~ s/\tVahlodea\n/\tVahlodea {Vahlodea atropurpurea}\n/;
$all_pars[$j] =~ s/\tVentenata\n/\tVentenata {Ventenata dubia}\n/;
$all_pars[$j] =~ s/\tZizania\n/\tZizania {Zizania palustris var. interior}\n/;

	#print "After: $all_pars[$j]\n";
	}



	if ($all_pars[$j] =~ m/\t(Achillea|Achyrachaena|Acourtia|Acroptilon|Adenocaulon|Almutaster|Amauriopsis|Amblyopappus|Anaphalis|Anisocoma|Arctotis|Argyranthemum|Atrichoseris|Bahia|Bebbia|Bellis|Benitoa|Blepharipappus|Cacaliopsis|Carlquistia|Chaetadelpha|Chaetopappa|Chamaemelum|Chloracantha|Chondrilla|Chrysanthemoides|Cichorium|Constancea|Corethrogyne|Cota|Crocidium|Crupina|Cuniculotinus|Delairea|Dicoria|Dimeresia|Dittrichia|Dyssodia|Eastwoodia|Eatonella|Echinops|Eclipta|Euthamia|Filago|Flaveria|Galinsoga|Gazania|Gnaphalium|Hecastocleis|Hedypnois|Helichrysum|Heliomeris|Helminthotheca|Hemizonella|Heteranthemis|Holozonia|Ionactis|Jaumea|Kyhosia|Laennecia|Lapsana|Lasiospermum|Luina|Machaeranthera|Malperia|Mauranthemum|Munzothamnus|Nestotus|Nicolletia|Oncosiphon|Orochaenactis|Osmadenia|Pectis|Pericome|Petasites|Petradoria|Peucephyllum|Phalacroseris|Plecostachys|Pleiacanthus|Pleurocoronis|Prenanthella|Psilostrophe|Pulicaria|Ratibida|Rhagadiolus|Rigiopappus|Santolina|Sanvitalia|Saussurea|Scolymus|Scorzonera|Silybum|Soliva|Tetraneuris|Thelesperma|Tolpis|Tracyina|Trichocoronis|Trichoptilium|Tripleurospermum|Trixis|Uropappus|Urospermum|Venegasia|Viguiera|Volutaria)\n/){

	}


}

	print FGR join("\n",@all_pars);


close(IN);
close(FGRO);


print <<EOP;
Names converted: $found2
Subtaxa converted: $found3
Grass Names converted: $found4
 TOTAL LINES: $found1

EOP