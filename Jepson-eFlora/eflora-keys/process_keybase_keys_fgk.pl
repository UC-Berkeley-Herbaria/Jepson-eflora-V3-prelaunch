
use strict;
use warnings;
use autodie; # Automatically handles "die if file not found"
use File::Path qw(make_path); # Needed to create directories automatically

my $found1 = 0;
my $found2 = 0;
my $found3 = 0;
my $found4 = 0;


my $uploadDate = "2026OCT";

my %stats;

my %FOUND;
my $filename = 'input/keybase-file-names.txt';

my $keysfile = 'keybase/upload-'.$uploadDate.'/keys.tsv';

open(my $key_fh,  '>>:utf8', $keysfile);

#print $key_fh "id\tcreated_at\tupdated_at\ttitle\tauthor\tdescription\titem\tspatial\tremarks\tsource_id\tcreated_by\tupdated_by\tkey_file\n";

my $sourcesfile = 'keybase/upload-'.$uploadDate.'/sources.tsv';

open(my $src_fh,  '>>:utf8', $sourcesfile);

#print $src_fh "id\tauthor\tyear\ttitle\tcollection_authors\tcollection_title\tedition\tseries\tvolume\tpart\tpublisher\tplace_of_publication\tpages\turl\n";


open(my $fh, '<:utf8', $filename);

while (my $line = <$fh>) {
    chomp $line;
    
    # Skip empty lines
    next unless $line =~ /\S/;
    
    # Trim whitespace just in case
    $line =~ s/^\s+|\s+$//g;
    
    if ($line =~ m/^key-(\d+)-([^.]+\.tsv)/){
    	my $keyCode=$1;
    	my $keyName=$2;
    	$FOUND{$keyName}=$keyCode;
    }
}
close($fh);

#Family Group Keys
#key-10040-family-group-12.tsv
#key-10041-family-group-23.tsv

#open (FAM, ">keybase/keybase_keys_families_processed.txt");
#open (GEN, ">keybase/keybase_keys_genera_processed.txt");
#open (SPE, ">keybase/keybase_keys_species_processed.txt");
#open (GGR, ">keybase/keybase_keys_genus_groups_processed.txt");
#open (FGR, ">keybase/keybase_keys_family_groups_processed.txt");
#open (UNA, ">keybase/keybase_keys_unabridged_processed.txt");
#open (KGR, ">keybase/keybase_keys_key_to_groups_processed.txt");
open (my $FGK, ">keybase/keybase_family_group_keys_processed.txt");

local $/ = "\n\n";
#OPEN THE RAW FILE
my $treatments="<keybase/keybase_family_group_keys.txt";



	open(IN,$treatments);
#STORE THE FILE IN AN ARRAY, ONE PARAGRAPH PER ELEMENT
	my @all_pars=(<IN>);


	foreach my $j (0 .. $#all_pars){		

#family group key problem names:
#NITRARIACEAE this should be Nitrariaceae {Peganum harmala}
#FABACEAE (Papilionoideae) this should be Fabaceae Group 3
#Papaveraceae (papaveroideae) this should be just Papaveraceae in KeyBase
#Papaveraceae (fumarioideae) this should be just Papaveraceae in KeyBase
#Ranunculaceae (actaea, consolida) this should be just Ranunculaceae in KeyBase

		$all_pars[$j] =~ s/\t([A-Z][A-Z]+ACEAE)( ?.*)\n/\t\L\u$1$2\n/g;

#some cases lead to just a single subtaxon, but in keybase, we want to link to that subtaxon and have a link to the genus key.
#this also capitalizes the first letter of each taxon name in brackets
		if($all_pars[$j] =~ m/\t[A-Z][a-z-]+aceae \([a-z-]+ ?[a-z-]*\)\n/g){
			$all_pars[$j] =~ s/\t([A-Z][a-z-]+aceae) \(([a-z-]+ ?[a-z-]*)\)\n/\t$1 {\u\L$2}\n/g;
		}
		if($all_pars[$j] =~ m/\t[A-Z][a-z-]+aceae \{[a-z-]+ ?[a-z-]*\}\n/g){
			$all_pars[$j] =~ s/\t([A-Z][a-z-]+aceae) \{([a-z-]+ ?[a-z-]*)\}\n/\t$1 {\u\L$2}\n/g;
		}
#there are also some subtaxa in the family keys
		if($all_pars[$j] =~ m/\t[A-Z][a-z-]+aceae \{[a-z-]+ [a-z-]+ (nothosubsp\.|subsp\.|var\.) [a-z-]+<?i?>?\}\n/g){
			$all_pars[$j] =~ s/\t([A-Z][a-z-]+aceae) \{([a-z-]+ [a-z-]+) (nothosubsp\.|subsp\.|var\.) ([a-z-]+)<?i?>?\}\n/\t$1 {\u\L$2 $3 $4}\n/g;
		}
#examples:
#s SnJV	Monolopia congdonii
#pistillate flowers many	Pluchea sericea
#lobed or toothed	Perityle emoryi
#13 mm	Pyrrocoma carthamoides var. cusickii
#opposite	Lasthenia microglossa
#herb with rhizome	Tanacetum bipinnatum
#make first line file names
	$all_pars[$j] =~ s/^([A-Z][a-z]+aceae Group \d+[A-Za-z]*):?.*/$1/;

#these are monotypic genera that we want links to species not genus, but the family is not monotypic
#AIZOACEAE {Sesuvium}	VERBATIM NAME:AIZOACEAE Sesuvium	Sesuvium {Sesuvium verrucosum}
#AIZOACEAE {Trianthema}	VERBATIM NAME:AIZOACEAE Trianthema	Trianthema {Trianthema portulacastrum}
#change monotypic genera where the key ends in a genus and that genus is monotypic
#print "Before: 	$all_pars[$j]\n";	
	
	if ($all_pars[$j] =~ s/\{Acalypha\}/{Acalypha californica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Achillea\}/{Achillea millefolium}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Achyrachaena\}/{Achyrachaena mollis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Achyronychia\}/{Achyronychia cooperi}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Acourtia\}/{Acourtia microcephala}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Acroptilon\}/{Acroptilon repens}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Actaea\}/{Actaea rubra}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Adenocaulon\}/{Adenocaulon bicolor}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Adolphia\}/{Adolphia californica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Adonis\}/{Adonis aestivalis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Aeschynomene\}/{Aeschynomene rudis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Aesculus\}/{Aesculus californica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Agrostemma\}/{Agrostemma githago var. githago}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Ailanthus\}/{Ailanthus altissima}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Alcea\}/{Alcea rosea}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Alhagi\}/{Alhagi maurorum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Allenrolfea\}/{Allenrolfea occidentalis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Alyogyne\}/{Alyogyne huegelii}/) {
		$stats{apodanthaceae_found}++;
	} #missed by David in 2015


	if ($all_pars[$j] =~ s/\{Allotropa\}/{Allotropa virgata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Almutaster\}/{Almutaster pauciflorus}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Aloysia\}/{Aloysia wrightii}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Amaryllis\}/{Amaryllis belladonna}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Amauriopsis\}/{Amauriopsis dissecta}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Amblyopappus\}/{Amblyopappus pusillus}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Ammophila\}/{Ammophila arenaria}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Ammoselinum\}/{Ammoselinum giganteum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Amphiscirpus\}/{Amphiscirpus nevadensis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Amsonia\}/{Amsonia tomentosa}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Anaphalis\}/{Anaphalis margaritacea}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Androstephium\}/{Androstephium breviflorum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Anelsonia\}/{Anelsonia eurycarpa}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Anethum\}/{Anethum graveolens}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Anisocoma\}/{Anisocoma acaulis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Anisodontea\}/{Anisodontea capensis}/) {
		$stats{apodanthaceae_found}++;
	} #missed by David in 2015
	
	if ($all_pars[$j] =~ s/\{Anthriscus\}/{Anthriscus caucalis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Anulocaulis\}/{Anulocaulis annulatus}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Aphanes\}/{Aphanes occidentalis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Aphanisma\}/{Aphanisma blitoides}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Apiastrum\}/{Apiastrum angustifolium}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Aptenia\}/{Aptenia cordifolia}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Arabidopsis\}/{Arabidopsis thaliana}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Aralia\}/{Aralia californica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Araujia\}/{Araujia sericifera}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Arbutus\}/{Arbutus menziesii}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Arctomecon\}/{Arctomecon merriamii}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Arctotis\}/{Arctotis venusta}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Argyranthemum\}/{Argyranthemum foeniculaceum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Aristocapsa\}/{Aristocapsa insignis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Aristolochia\}/{Aristolochia californica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Armeria\}/{Armeria maritima subsp. californica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Armoracia\}/{Armoracia rusticana}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Arrhenatherum\}/{Arrhenatherum elatius}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Arthrocnemum\}/{Arthrocnemum subterminale}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Aruncus\}/{Aruncus dioicus var. acuminatus}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Arundo\}/{Arundo donax}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Asperugo\}/{Asperugo procumbens}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Asphodelus\}/{Asphodelus fistulosus}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Astrolepis\}/{Astrolepis cochisensis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Asyneuma\}/{Asyneuma prenanthoides}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Atrichoseris\}/{Atrichoseris platyphylla}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Aubrieta\}/{Aubrieta deltoidea}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Avicennia\}/{Avicennia marina var. australasica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Ayenia\}/{Ayenia compacta}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Bahia\}/{Bahia neomexicana}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Bassia\}/{Bassia hyssopifolia}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Bebbia\}/{Bebbia juncea var. aspera}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Beckmannia\}/{Beckmannia syzigachne}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Bellardia\}/{Bellardia trixago}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Bellis\}/{Bellis perennis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Benitoa\}/{Benitoa occidentalis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Bensoniella\}/{Bensoniella oregona}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Bergerocactus\}/{Bergerocactus emoryi}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Bergia\}/{Bergia texana}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Bernardia\}/{Bernardia incana}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Berteroa\}/{Berteroa incana}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Berula\}/{Berula erecta}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Beta\}/{Beta vulgaris subsp. maritima}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Billardiera\}/{Billardiera heterophylla}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Bistorta\}/{Bistorta bistortoides}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Bituminaria\}/{Bituminaria bituminosa}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Blechnum\}/{Blechnum spicant}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Blepharidachne\}/{Blepharidachne kingii}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Blepharipappus\}/{Blepharipappus scaber}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Boehmeria\}/{Boehmeria cylindrica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Bolandra\}/{Bolandra californica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Borago\}/{Borago officinalis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Botrypus\}/{Botrypus virginianus}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Bowlesia\}/{Bowlesia incana}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Brandegea\}/{Brandegea bigelovii}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Brasenia\}/{Brasenia schreberi}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Bulbine\}/{Bulbine semibarbata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Bulbostylis\}/{Bulbostylis capillaris}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Cabomba\}/{Cabomba caroliniana}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Cacaliopsis\}/{Cacaliopsis nardosmia}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Caesalpinioideae\}/{Cercis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Calia\}/{Calia secundiflora}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{California\}/{California macrophylla}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Calliandra\}/{Calliandra eriophylla}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Callitropsis\}/{Callitropsis nootkatensis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Calocedrus\}/{Calocedrus decurrens}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Calypso\}/{Calypso bulbosa var. occidentalis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Camelina\}/{Camelina microcarpa}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Campsis\}/{Campsis radicans}/) {
		$stats{apodanthaceae_found}++;
	} #missed by David in 2015
	
	if ($all_pars[$j] =~ s/\{Canbya\}/{Canbya candida}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Cannabis\}/{Cannabis sativa}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Capsella\}/{Capsella bursa-pastoris}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Cardionema\}/{Cardionema ramosissimum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Carlowrightia\}/{Carlowrightia arizonica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Carlquistia\}/{Carlquistia muirii}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Carnegiea\}/{Carnegiea gigantea}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Carpenteria\}/{Carpenteria californica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Carrichtera\}/{Carrichtera annua}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Carsonia\}/{Carsonia sparsifolia}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Carya\}/{Carya illinoinensis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Cascadia\}/{Cascadia nuttallii}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Cassiope\}/{Cassiope mertensiana}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Castela\}/{Castela emoryi}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Centranthus\}/{Centranthus ruber}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Centrostegia\}/{Centrostegia thurberi}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Cephalanthera\}/{Cephalanthera austiniae}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Cephalanthus\}/{Cephalanthus occidentalis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Cercis\}/{Cercis occidentalis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Chaetadelpha\}/{Chaetadelpha wheeleri}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Chaetopappa\}/{Chaetopappa ericoides}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Chamaebatiaria\}/{Chamaebatiaria millefolium}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Chamaecyparis\}/{Chamaecyparis lawsoniana}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Chamaemelum\}/{Chamaemelum fuscatum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Chamelaucium\}/{Chamelaucium uncinatum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Chasmanthe\}/{Chasmanthe floribunda}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Chilopsis\}/{Chilopsis linearis subsp. arcuata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Chloracantha\}/{Chloracantha spinosa var. spinosa}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Chondrilla\}/{Chondrilla juncea}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Chorispora\}/{Chorispora tenella}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Chrysanthemoides\}/{Chrysanthemoides monilifera subsp. monilifera}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Chrysosplenium\}/{Chrysosplenium glechomifolium}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Chylismiella\}/{Chylismiella pterosperma}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Cicendia\}/{Cicendia quadrangularis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Cichorium\}/{Cichorium intybus}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Circaea\}/{Circaea alpina subsp. pacifica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Cissus\}/{Cissus antarctica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Citrullus\}/{Citrullus lanatus var. citroides}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Cladium\}/{Cladium californicum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Cneoridium\}/{Cneoridium dumosum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Cochlearia\}/{Cochlearia groenlandica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Coleogyne\}/{Coleogyne ramosissima}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Colubrina\}/{Colubrina californica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Colutea\}/{Colutea arborescens}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Comarum\}/{Comarum palustre}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Comastoma\}/{Comastoma tenellum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Commelina\}/{Commelina benghalensis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Condalia\}/{Condalia globosa var. pubescens}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Condea\}/{Condea emoryi}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Conicosia\}/{Conicosia pugioniformis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Conioselinum\}/{Conioselinum pacificum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Conium\}/{Conium maculatum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Conringia\}/{Conringia orientalis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Consolida\}/{Consolida ajacis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Constancea\}/{Constancea nevinii}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Coprosma\}/{Coprosma repens}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Coptis\}/{Coptis laciniata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Corethrogyne\}/{Corethrogyne filaginifolia}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Coriandrum\}/{Coriandrum sativum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Corispermum\}/{Corispermum americanum var. americanum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Corylus\}/{Corylus cornuta subsp. californica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Cota\}/{Cota tinctoria}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Cotyledon\}/{Cotyledon orbiculata var. oblonga}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Cressa\}/{Cressa truxillensis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Crocidium\}/{Crocidium multicaule}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Crocosmia\}/{Crocosmia &times;crocosmiiflora}/) {
		$stats{apodanthaceae_found}++;
	} #changed to a html times sign to fix the bad link to eflora
	
	if ($all_pars[$j] =~ s/\{Crucianella\}/{Crucianella angustifolia}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Crupina\}/{Crupina vulgaris}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Cuniculotinus\}/{Cuniculotinus gramineus}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Cycloloma\}/{Cycloloma atriplicifolium}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Cyclospermum\}/{Cyclospermum leptophyllum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Cymbalaria\}/{Cymbalaria muralis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Cynodon\}/{Cynodon dactylon}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Cypselea\}/{Cypselea humifusa}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Cyrtomium\}/{Cyrtomium falcatum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Cystopteris\}/{Cystopteris fragilis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Dactylis\}/{Dactylis glomerata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Dactyloctenium\}/{Dactyloctenium aegyptium}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Damasonium\}/{Damasonium californicum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Darlingtonia\}/{Darlingtonia californica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Darmera\}/{Darmera peltata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Dasiphora\}/{Dasiphora fruticosa}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Dasyochloa\}/{Dasyochloa pulchella}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Dedeckera\}/{Dedeckera eurekensis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Delairea\}/{Delairea odorata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Delosperma\}/{Delosperma litorale}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Desmazeria\}/{Desmazeria rigida}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Dicoria\}/{Dicoria canescens}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Dicranostegia\}/{Dicranostegia orcuttiana}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Digitalis\}/{Digitalis purpurea}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Dimeresia\}/{Dimeresia howellii}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Diodia\}/{Diodia teres}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Dissanthelium\}/{Dissanthelium californicum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Dittrichia\}/{Dittrichia graveolens}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Dodecahema\}/{Dodecahema leptoceras}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Dopatrium\}/{Dopatrium junceum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Draperia\}/{Draperia systyla}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Drosanthemum\}/{Drosanthemum floribundum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Duchesnea\}/{Duchesnea indica var. indica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Dulichium\}/{Dulichium arundinaceum var. arundinaceum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Dyssodia\}/{Dyssodia papposa}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Eastwoodia\}/{Eastwoodia elegans}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Eatonella\}/{Eatonella nivea}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Echinocactus\}/{Echinocactus polycephalus var. polycephalus}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Echinodorus\}/{Echinodorus berteroi}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Echinops\}/{Echinops sphaerocephalus}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Eclipta\}/{Eclipta prostrata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Egeria\}/{Egeria densa}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Eichhornia\}/{Eichhornia crassipes}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Elaeagnus\}/{Elaeagnus angustifolia}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Empetrum\}/{Empetrum nigrum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Enneapogon\}/{Enneapogon desvauxii}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Erica\}/{Erica lusitanica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Erioneuron\}/{Erioneuron pilosum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Eriophorum\}/{Eriophorum gracile}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Erucastrum\}/{Erucastrum gallicum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Euclidium\}/{Euclidium syriacum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Eulobus\}/{Eulobus californicus}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Eustoma\}/{Eustoma exaltatum subsp. exaltatum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Euthamia\}/{Euthamia occidentalis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Fallugia\}/{Fallugia paradoxa}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Fendlerella\}/{Fendlerella utahensis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Ficus\}/{Ficus carica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Filago\}/{Filago pyramidata var. pyramidata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Flaveria\}/{Flaveria trinervia}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Floerkea\}/{Floerkea proserpinacoides}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Foeniculum\}/{Foeniculum vulgare}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Forestiera\}/{Forestiera pubescens}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Freesia\}/{Freesia leichtlinii subsp. alba}/) {
		$stats{apodanthaceae_found}++;
	} #missed by David in 2015
	
	
	if ($all_pars[$j] =~ s/\{Galinsoga\}/{Galinsoga parviflora var. parviflora}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Gambelia\}/{Gambelia speciosa}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Gastridium\}/{Gastridium phleoides}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Gaudinia\}/{Gaudinia fragilis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Gazania\}/{Gazania linearis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Gentianella\}/{Gentianella amarella subsp. acuta}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Gilmania\}/{Gilmania luteola}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Glaucium\}/{Glaucium flavum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Glaux\}/{Glaux maritima}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Glechoma\}/{Glechoma hederacea}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Gleditsia\}/{Gleditsia triacanthos}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Glehnia\}/{Glehnia littoralis subsp. leiocarpa}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Gnaphalium\}/{Gnaphalium palustre}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Goodmania\}/{Goodmania luteola}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Goodyera\}/{Goodyera oblongifolia}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Gossypium\}/{Gossypium hirsutum}/) {
		$stats{apodanthaceae_found}++;
	} #missed by David in 2015
	
	if ($all_pars[$j] =~ s/\{Grayia\}/{Grayia spinosa}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Guilleminea\}/{Guilleminea densa var. aggregata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Gymnosteris\}/{Gymnosteris parvula}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Hainardia\}/{Hainardia cylindrica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Halimodendron\}/{Halimodendron halodendron}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Halimolobos\}/{Halimolobos jaegeri}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Halogeton\}/{Halogeton glomeratus}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Harpagonella\}/{Harpagonella palmeri}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Hecastocleis\}/{Hecastocleis shockleyi}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Hedypnois\}/{Hedypnois rhagadioloides}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Helichrysum\}/{Helichrysum petiolare}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Heliomeris\}/{Heliomeris multiflora var. nevadensis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Helminthotheca\}/{Helminthotheca echioides}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Hemieva\}/{Hemieva ranunculifolia}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Hemitomes\}/{Hemitomes congestum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Hemizonella\}/{Hemizonella minima}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Heracleum\}/{Heracleum maximum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Herissantia\}/{Herissantia crispa}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Hesperidanthus\}/{Hesperidanthus jaegeri}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Hesperis\}/{Hesperis matronalis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Hesperocallis\}/{Hesperocallis undulata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Hesperocnide\}/{Hesperocnide tenella}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Hesperomecon\}/{Hesperomecon linearis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Hesperoyucca\}/{Hesperoyucca whipplei}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Heteranthemis\}/{Heteranthemis viscidihirta}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Heterocodon\}/{Heterocodon rariflorum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Heteromeles\}/{Heteromeles arbutifolia}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Heteropogon\}/{Heteropogon contortus}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Hippuris\}/{Hippuris vulgaris}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Hirschfeldia\}/{Hirschfeldia incana}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Hollisteria\}/{Hollisteria lanata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Holmgrenanthe\}/{Holmgrenanthe petrophila}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Holosteum\}/{Holosteum umbellatum subsp. umbellatum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Holozonia\}/{Holozonia filipes}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Hornungia\}/{Hornungia procumbens}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Howellanthus\}/{Howellanthus dalesianus}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Howellia\}/{Howellia aquatilis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Humulus\}/{Humulus lupulus}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Hydrilla\}/{Hydrilla verticillata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Hyparrhenia\}/{Hyparrhenia hirta}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Iberis\}/{Iberis umbellata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Idahoa\}/{Idahoa scapigera}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Imperata\}/{Imperata brevifolia}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Ionactis\}/{Ionactis alpina}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Ipheion\}/{Ipheion uniflorum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Isatis\}/{Isatis tinctoria}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Ixia\}/{Ixia maculata}/) {
		$stats{apodanthaceae_found}++;
	} #missed by David in 2015
	
	if ($all_pars[$j] =~ s/\{Jacaranda\}/{Jacaranda mimosifolia}/) {
		$stats{apodanthaceae_found}++;
	} #missed by David in 2015

	if ($all_pars[$j] =~ s/\{Jamesia\}/{Jamesia americana var. rosea}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Jaumea\}/{Jaumea carnosa}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Johanneshowellia\}/{Johanneshowellia puberula}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Justicia\}/{Justicia californica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Kalmia\}/{Kalmia polifolia}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Kelloggia\}/{Kelloggia galioides}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Kniphofia\}/{Kniphofia uvaria}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Kobresia\}/{Kobresia myosuroides}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Krascheninnikovia\}/{Krascheninnikovia lanata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Kyhosia\}/{Kyhosia bolanderi}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Kyllinga\}/{Kyllinga brevifolia}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Ladeania\}/{Ladeania lanceolata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Laennecia\}/{Laennecia coulteri}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Lagunaria\}/{Lagunaria patersonia}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Lagurus\}/{Lagurus ovatus}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Lamarckia\}/{Lamarckia aurea}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Lamiastrum\}/{Lamiastrum galeobdolon}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Landoltia\}/{Landoltia punctata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Lapsana\}/{Lapsana communis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Larrea\}/{Larrea tridentata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Lasiospermum\}/{Lasiospermum bipinnatum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Lastarriaea\}/{Lastarriaea coriacea}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Lathrocasis\}/{Lathrocasis tenerrima}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Leersia\}/{Leersia oryzoides}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Legenere\}/{Legenere limosa}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Lens\}/{Lens culinaris}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Leptospermum\}/{Leptospermum laevigatum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Leucocrinum\}/{Leucocrinum montanum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Leucojum\}/{Leucojum aestivum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Leucothoe\}/{Leucothoe davisiae}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Libertia\}/{Libertia formosa}/) {
		$stats{apodanthaceae_found}++;
	} #missed by David in 2015
	
	if ($all_pars[$j] =~ s/\{Limnobium\}/{Limnobium spongia}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Lindernia\}/{Lindernia dubia}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Lobularia\}/{Lobularia maritima}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Lobularia\}/{Lobularia}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Loeflingia\}/{Loeflingia squarrosa}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Luetkea\}/{Luetkea pectinata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Luina\}/{Luina hypoleuca}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Luma\}/{Luma apiculata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Lunaria\}/{Lunaria annua}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Lychnis\}/{Lychnis coronaria}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Lycopodiella\}/{Lycopodiella inundata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Lycopodium\}/{Lycopodium clavatum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Lyrocarpa\}/{Lyrocarpa coulteri}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Lysichiton\}/{Lysichiton americanus}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Machaeranthera\}/{Machaeranthera tanacetifolia}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Maclura\}/{Maclura pomifera}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Malaxis\}/{Malaxis monophyllos var. brachypoda}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Malephora\}/{Malephora crocea}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Malosma\}/{Malosma laurina}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Malperia\}/{Malperia tenuis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Malvella\}/{Malvella leprosa}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Marrubium\}/{Marrubium vulgare}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Matelea\}/{Matelea parvifolia}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Matthiola\}/{Matthiola incana}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Maurandella\}/{Maurandella antirrhiniflora}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Mauranthemum\}/{Mauranthemum paludosum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Maytenus\}/{Maytenus boaria}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Melissa\}/{Melissa officinalis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Menyanthes\}/{Menyanthes trifoliata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Menziesia\}/{Menziesia ferruginea}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Mercurialis\}/{Mercurialis annua}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Micromonolepis\}/{Micromonolepis pusilla}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Microsteris\}/{Microsteris gracilis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Mitellastra\}/{Mitellastra caulescens}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Modiola\}/{Modiola caroliniana}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Moehringia\}/{Moehringia macrophylla}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Moenchia\}/{Moenchia erecta subsp. erecta}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Monarda\}/{Monarda pectinata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Moneses\}/{Moneses uniflora}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Monochoria\}/{Monochoria vaginalis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Morella\}/{Morella californica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Mortonia\}/{Mortonia utahensis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Morus\}/{Morus alba}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Munroa\}/{Munroa squarrosa}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Munzothamnus\}/{Munzothamnus blairii}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Myoporum\}/{Myoporum laetum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Myrica\}/{Myrica hartwegii}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Myrtus\}/{Myrtus communis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Neoholmgrenia\}/{Neoholmgrenia andina}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Neostapfia\}/{Neostapfia colusana}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Nepeta\}/{Nepeta cataria}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Nerium\}/{Nerium oleander}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Nestotus\}/{Nestotus stenophyllus}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Neviusia\}/{Neviusia cliftonii}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Nicandra\}/{Nicandra physalodes}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Nicolletia\}/{Nicolletia occidentalis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Nothochelone\}/{Nothochelone nemorosa}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Notholaena\}/{Notholaena californica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Nothoscordum\}/{Nothoscordum gracile}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Nuphar\}/{Nuphar polysepala}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Nuttallanthus\}/{Nuttallanthus texanus}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Nymphoides\}/{Nymphoides peltata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Oemleria\}/{Oemleria cerasiformis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Oenanthe\}/{Oenanthe sarmentosa}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Olea\}/{Olea europaea}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Oligomeris\}/{Oligomeris linifolia}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Olneya\}/{Olneya tesota}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Olsynium\}/{Olsynium douglasii var. douglasii}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Oncosiphon\}/{Oncosiphon piluliferum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Onobrychis\}/{Onobrychis viciifolia}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Ornithostaphylos\}/{Ornithostaphylos oppositifolia}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Orochaenactis\}/{Orochaenactis thysanocarpha}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Orogenia\}/{Orogenia fusiformis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Orthilia\}/{Orthilia secunda}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Oryctes\}/{Oryctes nevadensis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Oryza\}/{Oryza sativa}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Osmadenia\}/{Osmadenia tenella}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Ottelia\}/{Ottelia alismoides}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Oxypolis\}/{Oxypolis occidentalis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Oxyria\}/{Oxyria digyna}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Oxystylis\}/{Oxystylis lutea}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Pallenis\}/{Pallenis maritima}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Pancratium\}/{Pancratium maritimum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Parthenocissus\}/{Parthenocissus inserta}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Pastinaca\}/{Pastinaca sativa}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Paxistima\}/{Paxistima myrsinites}/) {
		$stats{apodanthaceae_found}++;
	}

	#if ($all_pars[$j] =~ s/\{Pectis\}/{Pectis papposa var. papposa}/) {
	#	$stats{apodanthaceae_found}++;
	#}  #in 2026 there are now two pectis

	if ($all_pars[$j] =~ s/\{Peltandra\}/{Peltandra virginica}/) {
		$stats{apodanthaceae_found}++;
	} #missed by David in 2015
	
	if ($all_pars[$j] =~ s/\{Peraphyllum\}/{Peraphyllum ramosissimum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Pericome\}/{Pericome caudata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Petasites\}/{Petasites frigidus var. palmatus}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Peteria\}/{Peteria thompsoniae}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Petradoria\}/{Petradoria pumila var. pumila}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Petroselinum\}/{Petroselinum crispum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Petunia\}/{Petunia parviflora}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Peucephyllum\}/{Peucephyllum schottii}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Phalacroseris\}/{Phalacroseris bolanderi}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Phaseolus\}/{Phaseolus filiformis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Phoenicaulis\}/{Phoenicaulis cheiranthoides}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Phragmites\}/{Phragmites australis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Phyllostachys\}/{Phyllostachys aurea}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Pilularia\}/{Pilularia americana}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Pinguicula\}/{Pinguicula macroceras}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Pistacia\}/{Pistacia atlantica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Pistia\}/{Pistia stratiotes}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Pisum\}/{Pisum sativum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Pityopus\}/{Pityopus californicus}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Planodes\}/{Planodes virginica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Platystemon\}/{Platystemon californicus}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Plecostachys\}/{Plecostachys serpyllifolia}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Pleiacanthus\}/{Pleiacanthus spinosus}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Pleuricospora\}/{Pleuricospora fimbriolata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Pleurocoronis\}/{Pleurocoronis pluriseta}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Plumbago\}/{Plumbago auriculata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Podistera\}/{Podistera nevadensis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Polanisia\}/{Polanisia dodecandra subsp. trachysperma}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Poliomintha\}/{Poliomintha incana}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Polyctenium\}/{Polyctenium fremontii}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Porterella\}/{Porterella carnosula}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Poteridium\}/{Poteridium annuum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Poterium\}/{Poterium sanguisorba}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Prenanthella\}/{Prenanthella exigua}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Pseudorontium\}/{Pseudorontium cyathiferum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Pseudotrillium\}/{Pseudotrillium rivale}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Psilostrophe\}/{Psilostrophe cooperi}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Ptelea\}/{Ptelea crenulata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Pterocarya\}/{Pterocarya stenoptera}/) {
		$stats{apodanthaceae_found}++;
	} #missed by David in 2015
	
	if ($all_pars[$j] =~ s/\{Pterospora\}/{Pterospora andromedea}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Pterostegia\}/{Pterostegia drymarioides}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Pulicaria\}/{Pulicaria paludosa}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Punica\}/{Punica granatum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Pycnanthemum\}/{Pycnanthemum californicum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Pyrus\}/{Pyrus communis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Rapistrum\}/{Rapistrum rugosum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Ratibida\}/{Ratibida columnifera}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Rhagadiolus\}/{Rhagadiolus stellatus}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Rhodiola\}/{Rhodiola integrifolia subsp. integrifolia}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Ricinus\}/{Ricinus communis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Rigiopappus\}/{Rigiopappus leptocladus}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Romulea\}/{Romulea rosea var. australis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Ruta\}/{Ruta chalepensis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Saccharum\}/{Saccharum ravennae}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Salpichroa\}/{Salpichroa origanifolia}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Sanguisorba\}/{Sanguisorba officinalis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Santolina\}/{Santolina chamaecyparissus}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Sanvitalia\}/{Sanvitalia abertii}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Saponaria\}/{Saponaria officinalis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Sarcodes\}/{Sarcodes sanguinea}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Sarracenia\}/{Sarracenia purpurea}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Saussurea\}/{Saussurea americana}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Saxifragopsis\}/{Saxifragopsis fragarioides}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Scandix\}/{Scandix pecten-veneris}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Sceptridium\}/{Sceptridium multifidum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Schoenus\}/{Schoenus nigricans}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Scleranthus\}/{Scleranthus annuus subsp. annuus}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Sclerochloa\}/{Sclerochloa dura}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Sclerolinon\}/{Sclerolinon digynum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Scleropogon\}/{Scleropogon brevifolius}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Scoliopus\}/{Scoliopus bigelovii}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Scolymus\}/{Scolymus hispanicus}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Scopulophila\}/{Scopulophila rixfordii}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Scorzonera\}/{Scorzonera hispanica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Scribneria\}/{Scribneria bolanderi}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Searsia\}/{Searsia lancea}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Secale\}/{Secale cereale}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Senegalia\}/{Senegalia greggii}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Sequoia\}/{Sequoia sempervirens}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Sequoiadendron\}/{Sequoiadendron giganteum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Sesuvium\}/{Sesuvium verrucosum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Sherardia\}/{Sherardia arvensis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Sibaropsis\}/{Sibaropsis hammittii}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Sibbaldia\}/{Sibbaldia procumbens}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Silybum\}/{Silybum marianum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Sium\}/{Sium suave}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Smelowskia\}/{Smelowskia ovalis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Soleirolia\}/{Soleirolia soleirolii}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Soliva\}/{Soliva sessilis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Spartium\}/{Spartium junceum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Spergula\}/{Spergula arvensis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Spermolepis\}/{Spermolepis echinata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Sphaerophysa\}/{Sphaerophysa salsula}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Sphenopholis\}/{Sphenopholis obtusata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Sphenosciadium\}/{Sphenosciadium capitellatum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Spirodela\}/{Spirodela polyrhiza}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Stemodia\}/{Stemodia durantifolia}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Stenanthium\}/{Stenanthium occidentale}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Stenotaphrum\}/{Stenotaphrum secundatum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Streptanthella\}/{Streptanthella longirostris}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Streptopus\}/{Streptopus amplexifolius var. americanus}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Strigosella\}/{Strigosella africana}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Stutzia\}/{Stutzia covillei}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Swallenia\}/{Swallenia alexandrae}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Swertia\}/{Swertia perennis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Syagrus\}/{Syagrus romanzoffiana}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Systenotheca\}/{Systenotheca vortriedei}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Syzygium\}/{Syzygium australe}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Taxus\}/{Taxus brevifolia}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Tellima\}/{Tellima grandiflora}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Tetragonia\}/{Tetragonia tetragonoides}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Tetraneuris\}/{Tetraneuris acaulis var. arizonica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Thamnosma\}/{Thamnosma montana}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Thelesperma\}/{Thelesperma megapotamicum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Thlaspi\}/{Thlaspi arvense}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Thuja\}/{Thuja plicata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Tolmiea\}/{Tolmiea diplomenziesii}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Tolpis\}/{Tolpis barbata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Tonella\}/{Tonella tenella}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Torreya\}/{Torreya californica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Toxicodendron\}/{Toxicodendron diversilobum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Tracyina\}/{Tracyina rostrata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Tragia\}/{Tragia ramosa}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Trautvetteria\}/{Trautvetteria caroliniensis}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Triadica\}/{Triadica sebifera}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Trianthema\}/{Trianthema portulacastrum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Tribulus\}/{Tribulus terrestris}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Tricardia\}/{Tricardia watsonii}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Trichocoronis\}/{Trichocoronis wrightii var. wrightii}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Trichoptilium\}/{Trichoptilium incisum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Tripleurospermum\}/{Tripleurospermum inodorum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Triticum\}/{Triticum aestivum}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Trixis\}/{Trixis californica var. californica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Tuberaria\}/{Tuberaria guttata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Tulipa\}/{Tulipa clusiana}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Turritis\}/{Turritis glabra}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Ulex\}/{Ulex europaeus}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Uropappus\}/{Uropappus lindleyi}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Urospermum\}/{Urospermum picroides}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Vaccaria\}/{Vaccaria hispanica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Vahlodea\}/{Vahlodea atropurpurea}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Velezia\}/{Velezia rigida}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Venegasia\}/{Venegasia carpesioides}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Ventenata\}/{Ventenata dubia}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Viguiera\}/{Viguiera purisimae}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Vinca\}/{Vinca major}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Viscum\}/{Viscum album}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Volutaria\}/{Volutaria muricata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Whipplea\}/{Whipplea modesta}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Wigandia\}/{Wigandia urens}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Woodwardia\}/{Woodwardia fimbriata}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Xerophyllum\}/{Xerophyllum tenax}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Xylococcus\}/{Xylococcus bicolor}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Yabea\}/{Yabea microcarpa}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Zantedeschia\}/{Zantedeschia aethiopica}/) {
		$stats{apodanthaceae_found}++;
	}

	if ($all_pars[$j] =~ s/\{Zygophyllum\}/{Zygophyllum fabago}/) {
		$stats{apodanthaceae_found}++;
	}

#print "After: 	$all_pars[$j]\n";



#change monotypic families where the key ends in a family and that family only has a single genus with multiple species
#print "Before: 	$all_pars[$j]\n";
	$all_pars[$j] =~ s/\tAspleniaceae\n/\tAspleniaceae {Asplenium}\n/;
	$all_pars[$j] =~ s/\tAzollaceae\n/\tAzollaceae {Azolla}\n/;
	$all_pars[$j] =~ s/\tCornaceae\n/\tCornaceae {Cornus}\n/;
	$all_pars[$j] =~ s/\tDroseraceae\n/\tDroseraceae {Drosera}\n/;
	$all_pars[$j] =~ s/\tEphedraceae\n/\tEphedraceae {Ephedra}\n/;
	$all_pars[$j] =~ s/\tEquisetaceae\n/\tEquisetaceae {Equisetum}\n/;
	$all_pars[$j] =~ s/\tGarryaceae\n/\tGarryaceae {Garrya}\n/;
	$all_pars[$j] =~ s/\tBalsaminaceae\n/\tBalsaminaceae {Impatiens}\n/;
	$all_pars[$j] =~ s/\tKrameriaceae\n/\tKrameriaceae {Krameria}\n/;
	$all_pars[$j] =~ s/\tPassifloraceae\n/\tPassifloraceae {Passiflora}\n/;
	$all_pars[$j] =~ s/\tPolypodiaceae\n/\tPolypodiaceae {Polypodium}\n/;
	$all_pars[$j] =~ s/\tGrossulariaceae\n/\tGrossulariaceae {Ribes}\n/;
	$all_pars[$j] =~ s/\tSalviniaceae\n/\tSalviniaceae {Salvinia}\n/;
	$all_pars[$j] =~ s/\tSelaginellaceae\n/\tSelaginellaceae {Selaginella}\n/;
	$all_pars[$j] =~ s/\tThelypteridaceae\n/\tThelypteridaceae {Thelypteris}\n/;
	$all_pars[$j] =~ s/\tJuncaginaceae\n/\tJuncaginaceae {Triglochin}\n/;
	$all_pars[$j] =~ s/\tViolaceae\n/\tViolaceae {Viola}\n/;
	$all_pars[$j] =~ s/\tSmilacaceae\n/\tSmilacaceae {Smilax}\n/;
	$all_pars[$j] =~ s/\tIsoetaceae\n/\tIsoetaceae {Isoetes}\n/;
	$all_pars[$j] =~ s/\tFrankeniaceae\n/\tFrankeniaceae {Frankenia}\n/;
	$all_pars[$j] =~ s/\tHaloragaceae\n/\tHaloragaceae {Myriophyllum}\n/;
	$all_pars[$j] =~ s/\tHypericaceae\n/\tHypericaceae {Hypericum}\n/;
	$all_pars[$j] =~ s/\tMartyniaceae\n/\tMartyniaceae {Proboscidea}\n/;
	$all_pars[$j] =~ s/\tOxalidaceae\n/\tOxalidaceae {Oxalis}\n/;
	$all_pars[$j] =~ s/\tPaeoniaceae\n/\tPaeoniaceae {Paeonia}\n/;
	$all_pars[$j] =~ s/\tParnassiaceae\n/\tParnassiaceae {Parnassia}\n/;
	$all_pars[$j] =~ s/\tPhytolaccaceae\n/\tPhytolaccaceae {Phytolacca}\n/;
	$all_pars[$j] =~ s/\tPicrodendraceae\n/\tPicrodendraceae {Tetracoccus}\n/;
	$all_pars[$j] =~ s/\tPlatanaceae\n/\tPlatanaceae {Platanus}\n/;
	$all_pars[$j] =~ s/\tPolygalaceae\n/\tPolygalaceae {Polygala}\n/;
	$all_pars[$j] =~ s/\tPortulacaceae\n/\tPortulacaceae {Portulaca}\n/;
	$all_pars[$j] =~ s/\tSarcobataceae\n/\tSarcobataceae {Sarcobatus}\n/;
	$all_pars[$j] =~ s/\tTamaricaceae\n/\tTamaricaceae {Tamarix}\n/;
	$all_pars[$j] =~ s/\tUlmaceae\n/\tUlmaceae {Ulmus}\n/;
	$all_pars[$j] =~ s/\tAsparagaceae\n/\tAsparagaceae {Asparagus}\n/;
	$all_pars[$j] =~ s/\tRuppiaceae\n/\tRuppiaceae {Ruppia}\n/;
#print "After: 	$all_pars[$j]\n";



#change monotypic families where the key ends in a family and that family only has a single genus with a single species
#print "Before: 	$all_pars[$j]\n";
	$all_pars[$j] =~ s/\tApodanthaceae\n/\tApodanthaceae {Pilostyles thurberi}\n/;
	$all_pars[$j] =~ s/\tAponogetonaceae\n/\tAponogetonaceae {Aponogeton distachyos}\n/;
	$all_pars[$j] =~ s/\tAquifoliaceae\n/\tAquifoliaceae {Ilex aquifolium}\n/;
	$all_pars[$j] =~ s/\tBasellaceae\n/\tBasellaceae {Anredera cordifolia}\n/;
	$all_pars[$j] =~ s/\tBataceae\n/\tBataceae {Batis maritima}\n/;
	$all_pars[$j] =~ s/\tBurseraceae\n/\tBurseraceae {Bursera microphylla}\n/;
	$all_pars[$j] =~ s/\tCalycanthaceae\n/\tCalycanthaceae {Calycanthus occidentalis}\n/;
	$all_pars[$j] =~ s/\tCyatheaceae\n/\tCyatheaceae {Sphaeropteris cooperi}\n/;
	$all_pars[$j] =~ s/\tCeratophyllaceae\n/\tCeratophyllaceae {Ceratophyllum demersum}\n/;
	$all_pars[$j] =~ s/\tComandraceae\n/\tComandraceae {Comandra umbellata subsp. californica}\n/;
	$all_pars[$j] =~ s/\tDatiscaceae\n/\tDatiscaceae {Datisca glomerata}\n/;
	$all_pars[$j] =~ s/\tDennstaedtiaceae\n/\tDennstaedtiaceae {Pteridium aquilinum var. pubescens}\n/;
	$all_pars[$j] =~ s/\tFouquieriaceae\n/\tFouquieriaceae {Fouquieria splendens subsp. splendens}\n/;
	$all_pars[$j] =~ s/\tGunneraceae\n/\tGunneraceae {Gunnera tinctoria}\n/;
	$all_pars[$j] =~ s/\tKoeberliniaceae\n/\tKoeberliniaceae {Koeberlinia spinosa var. tenuispina}\n/;
	$all_pars[$j] =~ s/\tLaxmanniaceae\n/\tLaxmanniaceae {Cordyline australis}\n/;
	$all_pars[$j] =~ s/\tLinnaeaceae\n/\tLinnaeaceae {Linnaea borealis var. longiflora}\n/;
	$all_pars[$j] =~ s/\tMeliaceae\n/\tMeliaceae {Melia azedarach}\n/;
	$all_pars[$j] =~ s/\tNartheciaceae\n/\tNartheciaceae {Narthecium californicum}\n/;
	$all_pars[$j] =~ s/\tNitrariaceae\n/\tNitrariaceae {Peganum harmala}\n/;
	$all_pars[$j] =~ s/\tProteaceae\n/\tProteaceae {Grevillea robusta}\n/;
	$all_pars[$j] =~ s/\tSaururaceae\n/\tSaururaceae {Anemopsis californica}\n/;
	$all_pars[$j] =~ s/\tScheuchzeriaceae\n/\tScheuchzeriaceae {Scheuchzeria palustris}\n/;
	$all_pars[$j] =~ s/\tSimmondsiaceae\n/\tSimmondsiaceae {Simmondsia chinensis}\n/;
	$all_pars[$j] =~ s/\tStaphyleaceae\n/\tStaphyleaceae {Staphylea bolanderi}\n/;
	$all_pars[$j] =~ s/\tStyracaceae\n/\tStyracaceae {Styrax redivivus}\n/;
	$all_pars[$j] =~ s/\tTecophilaeaceae\n/\tTecophilaeaceae {Odontostomum hartwegii}\n/;
	$all_pars[$j] =~ s/\tTheophrastaceae\n/\tTheophrastaceae {Samolus parviflorus}\n/;
	$all_pars[$j] =~ s/\tThymelaeaceae\n/\tThymelaeaceae {Dirca occidentalis}\n/;
	$all_pars[$j] =~ s/\tTofieldiaceae\n/\tTofieldiaceae {Triantha occidentalis subsp. occidentalis}\n/;
	$all_pars[$j] =~ s/\tTropaeolaceae\n/\tTropaeolaceae {Tropaeolum majus}\n/;
	$all_pars[$j] =~ s/\tZannichelliaceae\n/\tZannichelliaceae {Zannichellia palustris}\n/;
	$all_pars[$j] =~ s/\tZingiberaceae\n/\tZingiberaceae {Hedychium flavescens}\n/;
#print "After: 	$all_pars[$j]\n";


#Hydrocotyle (treated in araliaceae)
#Botrychium simplex or b. pumicola (small or shade pls, see couplet 3 to separate the species)
#Botrychium crenulatum(sun plants)
#Galenia==>Galenia {Galenia pubescens} #this needs to link to the eflora page for Aizoaceae since it is a waif-noted name and does not have its own page
#Orogenia {Orogenia fusiformis} #no longer is a valid genus, this is a Lomatium
#Sphenosciadium {Sphenosciadium capitellatum} #same

#from	statement	to	shortcut
#1	"Flower bilateral"	2	
#1	"Flower radial"	10	
#2	"Proximal part of calyx with a protruding, hollow spur"	3	
#2	"Proximal part of calyx without a protruding spur, spur 0 or fused to pedicel"	4	
#3	"Leaf not peltate; ovary chambers 5, several-seeded; fruit an exploding capsule"	Balsaminaceae	Impatiens
#3	"Leaf peltate; ovary chambers 3, 1-seeded; fruit breaking into 3 1-seeded mericarps"	Tropaeolaceae	"Tropaeolum majus"
#4	"Filaments of all or all but 1 stamen fused, at least proximally"	5	
#4	"Filaments free (0 or fused in pairs)"	7	



$all_pars[$j] =~ s/\n\n+/\n/;

}


	print $FGK join("\n\n",@all_pars);


# Now join them all with double newlines and print once
# This places \n\n BETWEEN elements, but not after the last one.
	#print FGK join("\n\n", @all_pars), "\n";
	#print $FGK join("\n",@all_pars);


close(IN);
close($FGK);

print "\n\nTotal corrections made: " . ($stats{apodanthaceae_found} // 0) . "\n\n";




# Define paths
my $input_file  = "keybase/keybase_family_group_keys_processed.txt";
my $output_dir  = "keybase/upload-" . $uploadDate;

# Create the output directory if it doesn't already exist
make_path($output_dir) unless -d $output_dir;

# Set input record separator to '' for paragraph mode (blocks separated by blank lines / \n\n)
local $/ = '';

open(my $IN,  "<", $input_file)  or die "Could not open $input_file: $!";
open(my $OUT, ">", "keybase/pre-match-fam") or die "Could not open pre-match-fam: $!";


while ( my $block = <$IN> ) {
    ++$found4;
    print "DEBUG: Read block $found4 (Length: " . length($block) . " chars)\n";


    # Your custom formatting function (assumed to be defined elsewhere in your script)
    $block =~ s/"//g; #interferes with formatting
    
    # Look for Family Group <number> anywhere at the start of the block
	if ( $block =~ m/\b(Family)\s+(Group)\s+(\d+)\b/i ) {
		++$found1;
		my $output_name = lc($1) . "-" . lc($2) . "-" . $3 . ".tsv";

		print " -> MATCHED! Target file: $output_name\n";

		my $title = $1." ".$2." ".$3;
		my $auth = "David J. Keil, as revised by Alan R. Smith and Thomas J. Rosatti to include Cyatheaceae";
		my $desc = "Family key to Group ".$3;
		#key-10040-family-group-12.tsv
		my $url = "https://herbariadb.berkeley.edu/eflora/keys/IJM_key_Group".$3.".php";

    	my $keyCode = $FOUND{$output_name};

		if( ($keyCode !~ m/^\d+$/) || ($keyCode eq "") ){
			++$found3;
			print "==>WARNING: New KEY not found on 2024 Keybase list.\n";
			print "NEW OUTPUT-->".$output_name."\n";
			print "NEW TITLE-->".$title."\n\n";

		} else {
			++$found2;
			my $key_name = "key-".$keyCode."-".$output_name;
			$block =~ s/^Family Group \d+\n/from\tstatement\tto\tshortcut\n/g;
			#remove the title, it is being added to the file name and replace with the table field header

			if ($block =~ m/^Group \d+: (.+)\n/){
				my $add = $1;
				my $temp = $desc;
				$desc = $temp.": ".$add;
			}
			#add the full description, if present

#id	created_at	updated_at	title	author	description	item	spatial	remarks	source_id	created_by	updated_by	key_file
#this needs to be output to the keys.tsv table
#3854	"2015-04-01 17:04:32"	"2019-11-07 10:52:27"	"Key to Family Groups"		"Key to Family Groups"	Equisetopsida	California			dbaxter@berkeley.edu	niels.klazenga@rbg.vic.gov.au	key-3854-key-to-family-groups.tsv
#3863	"2014-09-23 08:43:46"	"2014-09-23 08:43:46"	"Family Group 8"			"Family Group 8"	California			dbaxter@berkeley.edu	dbaxter@berkeley.edu	key-3863-family-group-8.tsv
			print {$key_fh} $keyCode."\t\"2026-10-01 12:12:12\"\t\"2026-10-10 12:12:12\"\t\"" .$title. "\"\t\"" .$auth. "\"\t\"" .$desc. "\"\t\tCalifornia\t\t\tjason_alexander\@berkeley.edu\tjason_alexander\@berkeley.edu\t".$key_name."\n";

#id	author	year	title	collection_authors	collection_title	edition	series	volume	part	publisher	place_of_publication	pages	url
#4040	"J. Robert Haller, Nancy J. Vivrette, & James R. Griffin "	2012	Abies	"Jepson Flora Project (eds.)"	"Jepson eFlora, http://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=10025, accessed on January 07, 2020"								
			print {$src_fh} $keyCode."\t\"" .$auth. "\"\t2026\t\"" .$title. "\"\t\"Jepson Flora Project (eds.)\"\t\"Jepson eFlora\"\t\"Revision 14\"\t\t\t\t\t\"University of California, Berkeley\"\t\t".$url."\n";

			# Clean up leading/trailing newlines if necessary
			$block =~ s/^\n+//g; 
			$block =~ s/\n+$//g;


			close($OUT);
			open($OUT, ">", "$output_dir/$key_name") or die "Could not open $key_name: $!";
		}
	} else {
		print " -> WARNING: ($block) did not match 'Family Group [Number]' pattern.\n";
	}

	    # Process the block line-by-line so headers/descriptions stay intact 
	    # and only actual data lines get formatted by your subroutine.
	    my @lines = split(/^/m, $block); # Split safely by lines keeping linebreaks
	    for my $line (@lines) {
	        if ($line =~ /^\d+\t/) {
	            $line = format_keybase_line($line);
	        }
	        next if $line =~ m/^Group.+/;
	        print $OUT $line;
	    }


}

close($IN);
close($OUT);
print "Done! Read $found4 blocks. Successfully wrote $found1 files to $output_dir/\n";


#Filehandle Fix: Your original code opened my $fh, but read from <IN>. I changed the open to use my $IN and read from my $IN.
#Directory Creation: Added use File::Path qw(make_path); and make_path($output_dir) so Perl automatically creates keybase/upload-2026OCT/ if it doesn't exist, preventing fatal No such file or directory errors when open tries to write to it.
#Undefined Variable: Removed print "$key_name\n"; because $key_name was never defined in your snippet (you likely meant to print $output_name or removed it during debugging).
#Robust Regex: Updated the regex slightly (\b and \s+) to ensure it catches "Family Group [Number]" reliably even if there are slight spacing differences.

print <<EOP;
Keybase Family Group files
Keys with Keybase Code converted: $found2
Keys Unconverted: $found3

TOTAL KEYS: $found1

TOTAL LINES: $found4

EOP

sub format_keybase_line {
    my ($input_line) = @_;

    return $input_line unless $input_line =~ /^\d+\t/;

    chomp($input_line);
    
    $input_line =~ s/([A-Za-z]+) \{([A-Z][A-Za-z]+)/$1\t$2/;
    $input_line =~ s/\}//;
    
    my @fields = split(/\t/, $input_line);

    for my $i (1 .. $#fields) {
        my $val = $fields[$i];
        next unless defined $val;
        
        $val =~ s/^"|"$//g;
        $val =~ s/^\s+|\s+$//g;

        if ($val =~ / /) {
            $val = qq("$val");
        }
        $fields[$i] = $val;
    }

    if (scalar @fields == 3) {
        push(@fields, ""); 
    }

    return join("\t", @fields) . "\n";
}

#Line-by-Line Inside Paragraphs: Instead of sending the whole text block into format_keybase_line (which would instantly bounce it back unmodified because it doesn't start with a number), the script splits each paragraph into individual lines (split(/^/m, $block)).
#Selective Formatting: It checks each line. If it's a data line starting with a number and a tab (1\t...), it runs your formatting rules (adding quotes to fields with spaces, handling brackets, etc.). If it's Family Group 24 or Group 24: Herbs..., it leaves them clean and writes them straight to the .tsv file.
#File Isolation: Each Family Group section safely closes the previous .tsv file and opens a brand new one inside keybase/upload-2026OCT/.
