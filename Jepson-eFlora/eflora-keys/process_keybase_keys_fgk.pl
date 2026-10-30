
#open (FAM, ">keybase/keybase_keys_families_processed.txt");
#open (GEN, ">keybase/keybase_keys_genera_processed.txt");
#open (SPE, ">keybase/keybase_keys_species_processed.txt");
#open (GGR, ">keybase/keybase_keys_genus_groups_processed.txt");
#open (FGR, ">keybase/keybase_keys_family_groups_processed.txt");
#open (UNA, ">keybase/keybase_keys_unabridged_processed.txt");
#open (KGR, ">keybase/keybase_keys_key_to_groups_processed.txt");
open (FGK, ">keybase/keybase_family_group_keys_processed.txt");

$/="\n\n";
#OPEN THE RAW FILE
$treatments="keybase/keybase_family_group_keys.txt";
open(IN,$treatments) || die;
#STORE THE FILE IN AN ARRAY, ONE PARAGRAPH PER ELEMENT
@all_pars=(<IN>);


	foreach $j (0 .. $#all_pars){		

#family group key problem names:
#NITRARIACEAE this should be Nitrariaceae {Peganum harmala}
#FABACEAE (Papilionoideae) this should be Fabaceae Group 3
#Papaveraceae (papaveroideae) this should be just Papaveraceae in KeyBase
#Papaveraceae (fumarioideae) this should be just Papaveraceae in KeyBase
#Ranunculaceae (actaea, consolida) this should be just Ranunculaceae in KeyBase

$all_pars[$j] =~ s/\(<i>/(/g;
$all_pars[$j] =~ s/<.i>\)/)/g;

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

#these are monotypic genera that we want links to species not genus, but the family is not monotypic
#AIZOACEAE {Sesuvium}	VERBATIM NAME:AIZOACEAE SesuviumSesuvium {Sesuvium verrucosum}
#AIZOACEAE {Trianthema}	VERBATIM NAME:AIZOACEAE TrianthemaTrianthema {Trianthema portulacastrum}
#change monotypic genera where the key ends in a genus and that genus is monotypic
#print "Before: $all_pars[$j]\n";
$all_pars[$j] =~ s/\{Acalypha\}/{Acalypha californica}/;
$all_pars[$j] =~ s/\{Achillea\}/{Achillea millefolium}/;
$all_pars[$j] =~ s/\{Achyrachaena\}/{Achyrachaena mollis}/;
$all_pars[$j] =~ s/\{Achyronychia\}/{Achyronychia cooperi}/;
$all_pars[$j] =~ s/\{Acourtia\}/{Acourtia microcephala}/;
$all_pars[$j] =~ s/\{Acroptilon\}/{Acroptilon repens}/;
$all_pars[$j] =~ s/\{Actaea\}/{Actaea rubra}/;
$all_pars[$j] =~ s/\{Adenocaulon\}/{Adenocaulon bicolor}/;
$all_pars[$j] =~ s/\{Adolphia\}/{Adolphia californica}/;
$all_pars[$j] =~ s/\{Adonis\}/{Adonis aestivalis}/;
$all_pars[$j] =~ s/\{Aeschynomene\}/{Aeschynomene rudis}/;
$all_pars[$j] =~ s/\{Aesculus\}/{Aesculus californica}/;
$all_pars[$j] =~ s/\{Agrostemma\}/{Agrostemma githago var. githago}/;
$all_pars[$j] =~ s/\{Ailanthus\}/{Ailanthus altissima}/;
$all_pars[$j] =~ s/\{Alcea\}/{Alcea rosea}/;
$all_pars[$j] =~ s/\{Alhagi\}/{Alhagi maurorum}/;
$all_pars[$j] =~ s/\{Allenrolfea\}/{Allenrolfea occidentalis}/;
$all_pars[$j] =~ s/\{Alyogyne\}/{Alyogyne huegelii}/; #missed by David in 2015
$all_pars[$j] =~ s/\{Allotropa\}/{Allotropa virgata}/;
$all_pars[$j] =~ s/\{Almutaster\}/{Almutaster pauciflorus}/;
$all_pars[$j] =~ s/\{Aloysia\}/{Aloysia wrightii}/;
$all_pars[$j] =~ s/\{Amaryllis\}/{Amaryllis belladonna}/;
$all_pars[$j] =~ s/\{Amauriopsis\}/{Amauriopsis dissecta}/;
$all_pars[$j] =~ s/\{Amblyopappus\}/{Amblyopappus pusillus}/;
$all_pars[$j] =~ s/\{Ammophila\}/{Ammophila arenaria}/;
$all_pars[$j] =~ s/\{Ammoselinum\}/{Ammoselinum giganteum}/;
$all_pars[$j] =~ s/\{Amphiscirpus\}/{Amphiscirpus nevadensis}/;
$all_pars[$j] =~ s/\{Amsonia\}/{Amsonia tomentosa}/;
$all_pars[$j] =~ s/\{Anaphalis\}/{Anaphalis margaritacea}/;
$all_pars[$j] =~ s/\{Androstephium\}/{Androstephium breviflorum}/;
$all_pars[$j] =~ s/\{Anelsonia\}/{Anelsonia eurycarpa}/;
$all_pars[$j] =~ s/\{Anethum\}/{Anethum graveolens}/;
$all_pars[$j] =~ s/\{Anisocoma\}/{Anisocoma acaulis}/;
$all_pars[$j] =~ s/\{Anisodontea\}/{Anisodontea capensis}/; #missed by David in 2015
$all_pars[$j] =~ s/\{Anthriscus\}/{Anthriscus caucalis}/;
$all_pars[$j] =~ s/\{Anulocaulis\}/{Anulocaulis annulatus}/;
$all_pars[$j] =~ s/\{Aphanes\}/{Aphanes occidentalis}/;
$all_pars[$j] =~ s/\{Aphanisma\}/{Aphanisma blitoides}/;
$all_pars[$j] =~ s/\{Apiastrum\}/{Apiastrum angustifolium}/;
$all_pars[$j] =~ s/\{Aptenia\}/{Aptenia cordifolia}/;
$all_pars[$j] =~ s/\{Arabidopsis\}/{Arabidopsis thaliana}/;
$all_pars[$j] =~ s/\{Aralia\}/{Aralia californica}/;
$all_pars[$j] =~ s/\{Araujia\}/{Araujia sericifera}/;
$all_pars[$j] =~ s/\{Arbutus\}/{Arbutus menziesii}/;
$all_pars[$j] =~ s/\{Arctomecon\}/{Arctomecon merriamii}/;
$all_pars[$j] =~ s/\{Arctotis\}/{Arctotis venusta}/;
$all_pars[$j] =~ s/\{Argyranthemum\}/{Argyranthemum foeniculaceum}/;
$all_pars[$j] =~ s/\{Aristocapsa\}/{Aristocapsa insignis}/;
$all_pars[$j] =~ s/\{Aristolochia\}/{Aristolochia californica}/;
$all_pars[$j] =~ s/\{Armeria\}/{Armeria maritima subsp. californica}/;
$all_pars[$j] =~ s/\{Armoracia\}/{Armoracia rusticana}/;
$all_pars[$j] =~ s/\{Arrhenatherum\}/{Arrhenatherum elatius}/;
$all_pars[$j] =~ s/\{Arthrocnemum\}/{Arthrocnemum subterminale}/;
$all_pars[$j] =~ s/\{Aruncus\}/{Aruncus dioicus var. acuminatus}/;
$all_pars[$j] =~ s/\{Arundo\}/{Arundo donax}/;
$all_pars[$j] =~ s/\{Asperugo\}/{Asperugo procumbens}/;
$all_pars[$j] =~ s/\{Asphodelus\}/{Asphodelus fistulosus}/;
$all_pars[$j] =~ s/\{Astrolepis\}/{Astrolepis cochisensis}/;
$all_pars[$j] =~ s/\{Asyneuma\}/{Asyneuma prenanthoides}/;
$all_pars[$j] =~ s/\{Atrichoseris\}/{Atrichoseris platyphylla}/;
$all_pars[$j] =~ s/\{Aubrieta\}/{Aubrieta deltoidea}/;
$all_pars[$j] =~ s/\{Avicennia\}/{Avicennia marina var. australasica}/;
$all_pars[$j] =~ s/\{Ayenia\}/{Ayenia compacta}/;
$all_pars[$j] =~ s/\{Bahia\}/{Bahia neomexicana}/;
$all_pars[$j] =~ s/\{Bassia\}/{Bassia hyssopifolia}/;
$all_pars[$j] =~ s/\{Bebbia\}/{Bebbia juncea var. aspera}/;
$all_pars[$j] =~ s/\{Beckmannia\}/{Beckmannia syzigachne}/;
$all_pars[$j] =~ s/\{Bellardia\}/{Bellardia trixago}/;
$all_pars[$j] =~ s/\{Bellis\}/{Bellis perennis}/;
$all_pars[$j] =~ s/\{Benitoa\}/{Benitoa occidentalis}/;
$all_pars[$j] =~ s/\{Bensoniella\}/{Bensoniella oregona}/;
$all_pars[$j] =~ s/\{Bergerocactus\}/{Bergerocactus emoryi}/;
$all_pars[$j] =~ s/\{Bergia\}/{Bergia texana}/;
$all_pars[$j] =~ s/\{Bernardia\}/{Bernardia incana}/;
$all_pars[$j] =~ s/\{Berteroa\}/{Berteroa incana}/;
$all_pars[$j] =~ s/\{Berula\}/{Berula erecta}/;
$all_pars[$j] =~ s/\{Beta\}/{Beta vulgaris subsp. maritima}/;
$all_pars[$j] =~ s/\{Billardiera\}/{Billardiera heterophylla}/;
$all_pars[$j] =~ s/\{Bistorta\}/{Bistorta bistortoides}/;
$all_pars[$j] =~ s/\{Bituminaria\}/{Bituminaria bituminosa}/;
$all_pars[$j] =~ s/\{Blechnum\}/{Blechnum spicant}/;
$all_pars[$j] =~ s/\{Blepharidachne\}/{Blepharidachne kingii}/;
$all_pars[$j] =~ s/\{Blepharipappus\}/{Blepharipappus scaber}/;
$all_pars[$j] =~ s/\{Boehmeria\}/{Boehmeria cylindrica}/;
$all_pars[$j] =~ s/\{Bolandra\}/{Bolandra californica}/;
$all_pars[$j] =~ s/\{Borago\}/{Borago officinalis}/;
$all_pars[$j] =~ s/\{Botrypus\}/{Botrypus virginianus}/;
$all_pars[$j] =~ s/\{Bowlesia\}/{Bowlesia incana}/;
$all_pars[$j] =~ s/\{Brandegea\}/{Brandegea bigelovii}/;
$all_pars[$j] =~ s/\{Brasenia\}/{Brasenia schreberi}/;
$all_pars[$j] =~ s/\{Bulbine\}/{Bulbine semibarbata}/;
$all_pars[$j] =~ s/\{Bulbostylis\}/{Bulbostylis capillaris}/;
$all_pars[$j] =~ s/\{Cabomba\}/{Cabomba caroliniana}/;
$all_pars[$j] =~ s/\{Cacaliopsis\}/{Cacaliopsis nardosmia}/;
$all_pars[$j] =~ s/\{Caesalpinioideae\}/{Cercis}/;
$all_pars[$j] =~ s/\{Calia\}/{Calia secundiflora}/;
$all_pars[$j] =~ s/\{California\}/{California macrophylla}/;
$all_pars[$j] =~ s/\{Calliandra\}/{Calliandra eriophylla}/;
$all_pars[$j] =~ s/\{Callitropsis\}/{Callitropsis nootkatensis}/;
$all_pars[$j] =~ s/\{Calocedrus\}/{Calocedrus decurrens}/;
$all_pars[$j] =~ s/\{Calypso\}/{Calypso bulbosa var. occidentalis}/;
$all_pars[$j] =~ s/\{Camelina\}/{Camelina microcarpa}/;
$all_pars[$j] =~ s/\{Campsis\}/{Campsis radicans}/; #missed by David in 2015
$all_pars[$j] =~ s/\{Canbya\}/{Canbya candida}/;
$all_pars[$j] =~ s/\{Cannabis\}/{Cannabis sativa}/;
$all_pars[$j] =~ s/\{Capsella\}/{Capsella bursa-pastoris}/;
$all_pars[$j] =~ s/\{Cardionema\}/{Cardionema ramosissimum}/;
$all_pars[$j] =~ s/\{Carlowrightia\}/{Carlowrightia arizonica}/;
$all_pars[$j] =~ s/\{Carlquistia\}/{Carlquistia muirii}/;
$all_pars[$j] =~ s/\{Carnegiea\}/{Carnegiea gigantea}/;
$all_pars[$j] =~ s/\{Carpenteria\}/{Carpenteria californica}/;
$all_pars[$j] =~ s/\{Carrichtera\}/{Carrichtera annua}/;
$all_pars[$j] =~ s/\{Carsonia\}/{Carsonia sparsifolia}/;
$all_pars[$j] =~ s/\{Carya\}/{Carya illinoinensis}/;
$all_pars[$j] =~ s/\{Cascadia\}/{Cascadia nuttallii}/;
$all_pars[$j] =~ s/\{Cassiope\}/{Cassiope mertensiana}/;
$all_pars[$j] =~ s/\{Castela\}/{Castela emoryi}/;
$all_pars[$j] =~ s/\{Centranthus\}/{Centranthus ruber}/;
$all_pars[$j] =~ s/\{Centrostegia\}/{Centrostegia thurberi}/;
$all_pars[$j] =~ s/\{Cephalanthera\}/{Cephalanthera austiniae}/;
$all_pars[$j] =~ s/\{Cephalanthus\}/{Cephalanthus occidentalis}/;
$all_pars[$j] =~ s/\{Cercis\}/{Cercis occidentalis}/;
$all_pars[$j] =~ s/\{Chaetadelpha\}/{Chaetadelpha wheeleri}/;
$all_pars[$j] =~ s/\{Chaetopappa\}/{Chaetopappa ericoides}/;
$all_pars[$j] =~ s/\{Chamaebatiaria\}/{Chamaebatiaria millefolium}/;
$all_pars[$j] =~ s/\{Chamaecyparis\}/{Chamaecyparis lawsoniana}/;
$all_pars[$j] =~ s/\{Chamaemelum\}/{Chamaemelum fuscatum}/;
$all_pars[$j] =~ s/\{Chamelaucium\}/{Chamelaucium uncinatum}/;
$all_pars[$j] =~ s/\{Chasmanthe\}/{Chasmanthe floribunda}/;
$all_pars[$j] =~ s/\{Chilopsis\}/{Chilopsis linearis subsp. arcuata}/;
$all_pars[$j] =~ s/\{Chloracantha\}/{Chloracantha spinosa var. spinosa}/;
$all_pars[$j] =~ s/\{Chondrilla\}/{Chondrilla juncea}/;
$all_pars[$j] =~ s/\{Chorispora\}/{Chorispora tenella}/;
$all_pars[$j] =~ s/\{Chrysanthemoides\}/{Chrysanthemoides monilifera subsp. monilifera}/;
$all_pars[$j] =~ s/\{Chrysosplenium\}/{Chrysosplenium glechomifolium}/;
$all_pars[$j] =~ s/\{Chylismiella\}/{Chylismiella pterosperma}/;
$all_pars[$j] =~ s/\{Cicendia\}/{Cicendia quadrangularis}/;
$all_pars[$j] =~ s/\{Cichorium\}/{Cichorium intybus}/;
$all_pars[$j] =~ s/\{Circaea\}/{Circaea alpina subsp. pacifica}/;
$all_pars[$j] =~ s/\{Cissus\}/{Cissus antarctica}/;
$all_pars[$j] =~ s/\{Citrullus\}/{Citrullus lanatus var. citroides}/;
$all_pars[$j] =~ s/\{Cladium\}/{Cladium californicum}/;
$all_pars[$j] =~ s/\{Cneoridium\}/{Cneoridium dumosum}/;
$all_pars[$j] =~ s/\{Cochlearia\}/{Cochlearia groenlandica}/;
$all_pars[$j] =~ s/\{Coleogyne\}/{Coleogyne ramosissima}/;
$all_pars[$j] =~ s/\{Colubrina\}/{Colubrina californica}/;
$all_pars[$j] =~ s/\{Colutea\}/{Colutea arborescens}/;
$all_pars[$j] =~ s/\{Comarum\}/{Comarum palustre}/;
$all_pars[$j] =~ s/\{Comastoma\}/{Comastoma tenellum}/;
$all_pars[$j] =~ s/\{Commelina\}/{Commelina benghalensis}/;
$all_pars[$j] =~ s/\{Condalia\}/{Condalia globosa var. pubescens}/;
$all_pars[$j] =~ s/\{Condea\}/{Condea emoryi}/;
$all_pars[$j] =~ s/\{Conicosia\}/{Conicosia pugioniformis}/;
$all_pars[$j] =~ s/\{Conioselinum\}/{Conioselinum pacificum}/;
$all_pars[$j] =~ s/\{Conium\}/{Conium maculatum}/;
$all_pars[$j] =~ s/\{Conringia\}/{Conringia orientalis}/;
$all_pars[$j] =~ s/\{Consolida\}/{Consolida ajacis}/;
$all_pars[$j] =~ s/\{Constancea\}/{Constancea nevinii}/;
$all_pars[$j] =~ s/\{Coprosma\}/{Coprosma repens}/;
$all_pars[$j] =~ s/\{Coptis\}/{Coptis laciniata}/;
$all_pars[$j] =~ s/\{Corethrogyne\}/{Corethrogyne filaginifolia}/;
$all_pars[$j] =~ s/\{Coriandrum\}/{Coriandrum sativum}/;
$all_pars[$j] =~ s/\{Corispermum\}/{Corispermum americanum var. americanum}/;
$all_pars[$j] =~ s/\{Corylus\}/{Corylus cornuta subsp. californica}/;
$all_pars[$j] =~ s/\{Cota\}/{Cota tinctoria}/;
$all_pars[$j] =~ s/\{Cotyledon\}/{Cotyledon orbiculata var. oblonga}/;
$all_pars[$j] =~ s/\{Cressa\}/{Cressa truxillensis}/;
$all_pars[$j] =~ s/\{Crocidium\}/{Crocidium multicaule}/;
$all_pars[$j] =~ s/\{Crocosmia\}/{Crocosmia &times;crocosmiiflora}/; #changed to a html times sign to fix the bad link to eflora
$all_pars[$j] =~ s/\{Crucianella\}/{Crucianella angustifolia}/;
$all_pars[$j] =~ s/\{Crupina\}/{Crupina vulgaris}/;
$all_pars[$j] =~ s/\{Cuniculotinus\}/{Cuniculotinus gramineus}/;
$all_pars[$j] =~ s/\{Cycloloma\}/{Cycloloma atriplicifolium}/;
$all_pars[$j] =~ s/\{Cyclospermum\}/{Cyclospermum leptophyllum}/;
$all_pars[$j] =~ s/\{Cymbalaria\}/{Cymbalaria muralis}/;
$all_pars[$j] =~ s/\{Cynodon\}/{Cynodon dactylon}/;
$all_pars[$j] =~ s/\{Cypselea\}/{Cypselea humifusa}/;
$all_pars[$j] =~ s/\{Cyrtomium\}/{Cyrtomium falcatum}/;
$all_pars[$j] =~ s/\{Cystopteris\}/{Cystopteris fragilis}/;
$all_pars[$j] =~ s/\{Dactylis\}/{Dactylis glomerata}/;
$all_pars[$j] =~ s/\{Dactyloctenium\}/{Dactyloctenium aegyptium}/;
$all_pars[$j] =~ s/\{Damasonium\}/{Damasonium californicum}/;
$all_pars[$j] =~ s/\{Darlingtonia\}/{Darlingtonia californica}/;
$all_pars[$j] =~ s/\{Darmera\}/{Darmera peltata}/;
$all_pars[$j] =~ s/\{Dasiphora\}/{Dasiphora fruticosa}/;
$all_pars[$j] =~ s/\{Dasyochloa\}/{Dasyochloa pulchella}/;
$all_pars[$j] =~ s/\{Dedeckera\}/{Dedeckera eurekensis}/;
$all_pars[$j] =~ s/\{Delairea\}/{Delairea odorata}/;
$all_pars[$j] =~ s/\{Delosperma\}/{Delosperma litorale}/;
$all_pars[$j] =~ s/\{Desmazeria\}/{Desmazeria rigida}/;
$all_pars[$j] =~ s/\{Dicoria\}/{Dicoria canescens}/;
$all_pars[$j] =~ s/\{Dicranostegia\}/{Dicranostegia orcuttiana}/;
$all_pars[$j] =~ s/\{Digitalis\}/{Digitalis purpurea}/;
$all_pars[$j] =~ s/\{Dimeresia\}/{Dimeresia howellii}/;
$all_pars[$j] =~ s/\{Diodia\}/{Diodia teres}/;
$all_pars[$j] =~ s/\{Dissanthelium\}/{Dissanthelium californicum}/;
$all_pars[$j] =~ s/\{Dittrichia\}/{Dittrichia graveolens}/;
$all_pars[$j] =~ s/\{Dodecahema\}/{Dodecahema leptoceras}/;
$all_pars[$j] =~ s/\{Dopatrium\}/{Dopatrium junceum}/;
$all_pars[$j] =~ s/\{Draperia\}/{Draperia systyla}/;
$all_pars[$j] =~ s/\{Drosanthemum\}/{Drosanthemum floribundum}/;
$all_pars[$j] =~ s/\{Duchesnea\}/{Duchesnea indica var. indica}/;
$all_pars[$j] =~ s/\{Dulichium\}/{Dulichium arundinaceum var. arundinaceum}/;
$all_pars[$j] =~ s/\{Dyssodia\}/{Dyssodia papposa}/;
$all_pars[$j] =~ s/\{Eastwoodia\}/{Eastwoodia elegans}/;
$all_pars[$j] =~ s/\{Eatonella\}/{Eatonella nivea}/;
$all_pars[$j] =~ s/\{Echinocactus\}/{Echinocactus polycephalus var. polycephalus}/;
$all_pars[$j] =~ s/\{Echinodorus\}/{Echinodorus berteroi}/;
$all_pars[$j] =~ s/\{Echinops\}/{Echinops sphaerocephalus}/;
$all_pars[$j] =~ s/\{Eclipta\}/{Eclipta prostrata}/;
$all_pars[$j] =~ s/\{Egeria\}/{Egeria densa}/;
$all_pars[$j] =~ s/\{Eichhornia\}/{Eichhornia crassipes}/;
$all_pars[$j] =~ s/\{Elaeagnus\}/{Elaeagnus angustifolia}/;
$all_pars[$j] =~ s/\{Empetrum\}/{Empetrum nigrum}/;
$all_pars[$j] =~ s/\{Enneapogon\}/{Enneapogon desvauxii}/;
$all_pars[$j] =~ s/\{Erica\}/{Erica lusitanica}/;
$all_pars[$j] =~ s/\{Erioneuron\}/{Erioneuron pilosum}/;
$all_pars[$j] =~ s/\{Eriophorum\}/{Eriophorum gracile}/;
$all_pars[$j] =~ s/\{Erucastrum\}/{Erucastrum gallicum}/;
$all_pars[$j] =~ s/\{Euclidium\}/{Euclidium syriacum}/;
$all_pars[$j] =~ s/\{Eulobus\}/{Eulobus californicus}/;
$all_pars[$j] =~ s/\{Eustoma\}/{Eustoma exaltatum subsp. exaltatum}/;
$all_pars[$j] =~ s/\{Euthamia\}/{Euthamia occidentalis}/;
$all_pars[$j] =~ s/\{Fallugia\}/{Fallugia paradoxa}/;
$all_pars[$j] =~ s/\{Fendlerella\}/{Fendlerella utahensis}/;
$all_pars[$j] =~ s/\{Ficus\}/{Ficus carica}/;
$all_pars[$j] =~ s/\{Filago\}/{Filago pyramidata var. pyramidata}/;
$all_pars[$j] =~ s/\{Flaveria\}/{Flaveria trinervia}/;
$all_pars[$j] =~ s/\{Floerkea\}/{Floerkea proserpinacoides}/;
$all_pars[$j] =~ s/\{Foeniculum\}/{Foeniculum vulgare}/;
$all_pars[$j] =~ s/\{Forestiera\}/{Forestiera pubescens}/;
$all_pars[$j] =~ s/\{Freesia\}/{Freesia leichtlinii subsp. alba}/; #missed by David in 2015
$all_pars[$j] =~ s/\{Galinsoga\}/{Galinsoga parviflora var. parviflora}/;
$all_pars[$j] =~ s/\{Gambelia\}/{Gambelia speciosa}/;
$all_pars[$j] =~ s/\{Gastridium\}/{Gastridium phleoides}/;
$all_pars[$j] =~ s/\{Gaudinia\}/{Gaudinia fragilis}/;
$all_pars[$j] =~ s/\{Gazania\}/{Gazania linearis}/;
$all_pars[$j] =~ s/\{Gentianella\}/{Gentianella amarella subsp. acuta}/;
$all_pars[$j] =~ s/\{Gilmania\}/{Gilmania luteola}/;
$all_pars[$j] =~ s/\{Glaucium\}/{Glaucium flavum}/;
$all_pars[$j] =~ s/\{Glaux\}/{Glaux maritima}/;
$all_pars[$j] =~ s/\{Glechoma\}/{Glechoma hederacea}/;
$all_pars[$j] =~ s/\{Gleditsia\}/{Gleditsia triacanthos}/;
$all_pars[$j] =~ s/\{Glehnia\}/{Glehnia littoralis subsp. leiocarpa}/;
$all_pars[$j] =~ s/\{Gnaphalium\}/{Gnaphalium palustre}/;
$all_pars[$j] =~ s/\{Goodmania\}/{Goodmania luteola}/;
$all_pars[$j] =~ s/\{Goodyera\}/{Goodyera oblongifolia}/;
$all_pars[$j] =~ s/\{Gossypium\}/{Gossypium hirsutum}/; #missed by David in 2015
$all_pars[$j] =~ s/\{Grayia\}/{Grayia spinosa}/;
$all_pars[$j] =~ s/\{Guilleminea\}/{Guilleminea densa var. aggregata}/;
$all_pars[$j] =~ s/\{Gymnosteris\}/{Gymnosteris parvula}/;
$all_pars[$j] =~ s/\{Hainardia\}/{Hainardia cylindrica}/;
$all_pars[$j] =~ s/\{Halimodendron\}/{Halimodendron halodendron}/;
$all_pars[$j] =~ s/\{Halimolobos\}/{Halimolobos jaegeri}/;
$all_pars[$j] =~ s/\{Halogeton\}/{Halogeton glomeratus}/;
$all_pars[$j] =~ s/\{Harpagonella\}/{Harpagonella palmeri}/;
$all_pars[$j] =~ s/\{Hecastocleis\}/{Hecastocleis shockleyi}/;
$all_pars[$j] =~ s/\{Hedypnois\}/{Hedypnois rhagadioloides}/;
$all_pars[$j] =~ s/\{Helichrysum\}/{Helichrysum petiolare}/;
$all_pars[$j] =~ s/\{Heliomeris\}/{Heliomeris multiflora var. nevadensis}/;
$all_pars[$j] =~ s/\{Helminthotheca\}/{Helminthotheca echioides}/;
$all_pars[$j] =~ s/\{Hemieva\}/{Hemieva ranunculifolia}/;
$all_pars[$j] =~ s/\{Hemitomes\}/{Hemitomes congestum}/;
$all_pars[$j] =~ s/\{Hemizonella\}/{Hemizonella minima}/;
$all_pars[$j] =~ s/\{Heracleum\}/{Heracleum maximum}/;
$all_pars[$j] =~ s/\{Herissantia\}/{Herissantia crispa}/;
$all_pars[$j] =~ s/\{Hesperidanthus\}/{Hesperidanthus jaegeri}/;
$all_pars[$j] =~ s/\{Hesperis\}/{Hesperis matronalis}/;
$all_pars[$j] =~ s/\{Hesperocallis\}/{Hesperocallis undulata}/;
$all_pars[$j] =~ s/\{Hesperocnide\}/{Hesperocnide tenella}/;
$all_pars[$j] =~ s/\{Hesperomecon\}/{Hesperomecon linearis}/;
$all_pars[$j] =~ s/\{Hesperoyucca\}/{Hesperoyucca whipplei}/;
$all_pars[$j] =~ s/\{Heteranthemis\}/{Heteranthemis viscidihirta}/;
$all_pars[$j] =~ s/\{Heterocodon\}/{Heterocodon rariflorum}/;
$all_pars[$j] =~ s/\{Heteromeles\}/{Heteromeles arbutifolia}/;
$all_pars[$j] =~ s/\{Heteropogon\}/{Heteropogon contortus}/;
$all_pars[$j] =~ s/\{Hippuris\}/{Hippuris vulgaris}/;
$all_pars[$j] =~ s/\{Hirschfeldia\}/{Hirschfeldia incana}/;
$all_pars[$j] =~ s/\{Hollisteria\}/{Hollisteria lanata}/;
$all_pars[$j] =~ s/\{Holmgrenanthe\}/{Holmgrenanthe petrophila}/;
$all_pars[$j] =~ s/\{Holosteum\}/{Holosteum umbellatum subsp. umbellatum}/;
$all_pars[$j] =~ s/\{Holozonia\}/{Holozonia filipes}/;
$all_pars[$j] =~ s/\{Hornungia\}/{Hornungia procumbens}/;
$all_pars[$j] =~ s/\{Howellanthus\}/{Howellanthus dalesianus}/;
$all_pars[$j] =~ s/\{Howellia\}/{Howellia aquatilis}/;
$all_pars[$j] =~ s/\{Humulus\}/{Humulus lupulus}/;
$all_pars[$j] =~ s/\{Hydrilla\}/{Hydrilla verticillata}/;
$all_pars[$j] =~ s/\{Hyparrhenia\}/{Hyparrhenia hirta}/;
$all_pars[$j] =~ s/\{Iberis\}/{Iberis umbellata}/;
$all_pars[$j] =~ s/\{Idahoa\}/{Idahoa scapigera}/;
$all_pars[$j] =~ s/\{Imperata\}/{Imperata brevifolia}/;
$all_pars[$j] =~ s/\{Ionactis\}/{Ionactis alpina}/;
$all_pars[$j] =~ s/\{Ipheion\}/{Ipheion uniflorum}/;
$all_pars[$j] =~ s/\{Isatis\}/{Isatis tinctoria}/;
$all_pars[$j] =~ s/\{Ixia\}/{Ixia maculata}/; #missed by David in 2015
$all_pars[$j] =~ s/\{Jacaranda\}/{Jacaranda mimosifolia}/; #missed by David in 2015
$all_pars[$j] =~ s/\{Jamesia\}/{Jamesia americana var. rosea}/;
$all_pars[$j] =~ s/\{Jaumea\}/{Jaumea carnosa}/;
$all_pars[$j] =~ s/\{Johanneshowellia\}/{Johanneshowellia puberula}/;
$all_pars[$j] =~ s/\{Justicia\}/{Justicia californica}/;
$all_pars[$j] =~ s/\{Kalmia\}/{Kalmia polifolia}/;
$all_pars[$j] =~ s/\{Kelloggia\}/{Kelloggia galioides}/;
$all_pars[$j] =~ s/\{Kniphofia\}/{Kniphofia uvaria}/;
$all_pars[$j] =~ s/\{Kobresia\}/{Kobresia myosuroides}/;
$all_pars[$j] =~ s/\{Krascheninnikovia\}/{Krascheninnikovia lanata}/;
$all_pars[$j] =~ s/\{Kyhosia\}/{Kyhosia bolanderi}/;
$all_pars[$j] =~ s/\{Kyllinga\}/{Kyllinga brevifolia}/;
$all_pars[$j] =~ s/\{Ladeania\}/{Ladeania lanceolata}/;
$all_pars[$j] =~ s/\{Laennecia\}/{Laennecia coulteri}/;
$all_pars[$j] =~ s/\{Lagunaria\}/{Lagunaria patersonia}/;
$all_pars[$j] =~ s/\{Lagurus\}/{Lagurus ovatus}/;
$all_pars[$j] =~ s/\{Lamarckia\}/{Lamarckia aurea}/;
$all_pars[$j] =~ s/\{Lamiastrum\}/{Lamiastrum galeobdolon}/;
$all_pars[$j] =~ s/\{Landoltia\}/{Landoltia punctata}/;
$all_pars[$j] =~ s/\{Lapsana\}/{Lapsana communis}/;
$all_pars[$j] =~ s/\{Larrea\}/{Larrea tridentata}/;
$all_pars[$j] =~ s/\{Lasiospermum\}/{Lasiospermum bipinnatum}/;
$all_pars[$j] =~ s/\{Lastarriaea\}/{Lastarriaea coriacea}/;
$all_pars[$j] =~ s/\{Lathrocasis\}/{Lathrocasis tenerrima}/;
$all_pars[$j] =~ s/\{Leersia\}/{Leersia oryzoides}/;
$all_pars[$j] =~ s/\{Legenere\}/{Legenere limosa}/;
$all_pars[$j] =~ s/\{Lens\}/{Lens culinaris}/;
$all_pars[$j] =~ s/\{Leptospermum\}/{Leptospermum laevigatum}/;
$all_pars[$j] =~ s/\{Leucocrinum\}/{Leucocrinum montanum}/;
$all_pars[$j] =~ s/\{Leucojum\}/{Leucojum aestivum}/;
$all_pars[$j] =~ s/\{Leucothoe\}/{Leucothoe davisiae}/;
$all_pars[$j] =~ s/\{Libertia\}/{Libertia formosa}/; #missed by David in 2015
$all_pars[$j] =~ s/\{Limnobium\}/{Limnobium spongia}/;
$all_pars[$j] =~ s/\{Lindernia\}/{Lindernia dubia}/;
$all_pars[$j] =~ s/\{Lobularia\}/{Lobularia maritima}/;
$all_pars[$j] =~ s/\{Lobularia\}/{Lobularia}/;
$all_pars[$j] =~ s/\{Loeflingia\}/{Loeflingia squarrosa}/;
$all_pars[$j] =~ s/\{Luetkea\}/{Luetkea pectinata}/;
$all_pars[$j] =~ s/\{Luina\}/{Luina hypoleuca}/;
$all_pars[$j] =~ s/\{Luma\}/{Luma apiculata}/;
$all_pars[$j] =~ s/\{Lunaria\}/{Lunaria annua}/;
$all_pars[$j] =~ s/\{Lychnis\}/{Lychnis coronaria}/;
$all_pars[$j] =~ s/\{Lycopodiella\}/{Lycopodiella inundata}/;
$all_pars[$j] =~ s/\{Lycopodium\}/{Lycopodium clavatum}/;
$all_pars[$j] =~ s/\{Lyrocarpa\}/{Lyrocarpa coulteri}/;
$all_pars[$j] =~ s/\{Lysichiton\}/{Lysichiton americanus}/;
$all_pars[$j] =~ s/\{Machaeranthera\}/{Machaeranthera tanacetifolia}/;
$all_pars[$j] =~ s/\{Maclura\}/{Maclura pomifera}/;
$all_pars[$j] =~ s/\{Malaxis\}/{Malaxis monophyllos var. brachypoda}/;
$all_pars[$j] =~ s/\{Malephora\}/{Malephora crocea}/;
$all_pars[$j] =~ s/\{Malosma\}/{Malosma laurina}/;
$all_pars[$j] =~ s/\{Malperia\}/{Malperia tenuis}/;
$all_pars[$j] =~ s/\{Malvella\}/{Malvella leprosa}/;
$all_pars[$j] =~ s/\{Marrubium\}/{Marrubium vulgare}/;
$all_pars[$j] =~ s/\{Matelea\}/{Matelea parvifolia}/;
$all_pars[$j] =~ s/\{Matthiola\}/{Matthiola incana}/;
$all_pars[$j] =~ s/\{Maurandella\}/{Maurandella antirrhiniflora}/;
$all_pars[$j] =~ s/\{Mauranthemum\}/{Mauranthemum paludosum}/;
$all_pars[$j] =~ s/\{Maytenus\}/{Maytenus boaria}/;
$all_pars[$j] =~ s/\{Melissa\}/{Melissa officinalis}/;
$all_pars[$j] =~ s/\{Menyanthes\}/{Menyanthes trifoliata}/;
$all_pars[$j] =~ s/\{Menziesia\}/{Menziesia ferruginea}/;
$all_pars[$j] =~ s/\{Mercurialis\}/{Mercurialis annua}/;
$all_pars[$j] =~ s/\{Micromonolepis\}/{Micromonolepis pusilla}/;
$all_pars[$j] =~ s/\{Microsteris\}/{Microsteris gracilis}/;
$all_pars[$j] =~ s/\{Mitellastra\}/{Mitellastra caulescens}/;
$all_pars[$j] =~ s/\{Modiola\}/{Modiola caroliniana}/;
$all_pars[$j] =~ s/\{Moehringia\}/{Moehringia macrophylla}/;
$all_pars[$j] =~ s/\{Moenchia\}/{Moenchia erecta subsp. erecta}/;
$all_pars[$j] =~ s/\{Monarda\}/{Monarda pectinata}/;
$all_pars[$j] =~ s/\{Moneses\}/{Moneses uniflora}/;
$all_pars[$j] =~ s/\{Monochoria\}/{Monochoria vaginalis}/;
$all_pars[$j] =~ s/\{Morella\}/{Morella californica}/;
$all_pars[$j] =~ s/\{Mortonia\}/{Mortonia utahensis}/;
$all_pars[$j] =~ s/\{Morus\}/{Morus alba}/;
$all_pars[$j] =~ s/\{Munroa\}/{Munroa squarrosa}/;
$all_pars[$j] =~ s/\{Munzothamnus\}/{Munzothamnus blairii}/;
$all_pars[$j] =~ s/\{Myoporum\}/{Myoporum laetum}/;
$all_pars[$j] =~ s/\{Myrica\}/{Myrica hartwegii}/;
$all_pars[$j] =~ s/\{Myrtus\}/{Myrtus communis}/;
$all_pars[$j] =~ s/\{Neoholmgrenia\}/{Neoholmgrenia andina}/;
$all_pars[$j] =~ s/\{Neostapfia\}/{Neostapfia colusana}/;
$all_pars[$j] =~ s/\{Nepeta\}/{Nepeta cataria}/;
$all_pars[$j] =~ s/\{Nerium\}/{Nerium oleander}/;
$all_pars[$j] =~ s/\{Nestotus\}/{Nestotus stenophyllus}/;
$all_pars[$j] =~ s/\{Neviusia\}/{Neviusia cliftonii}/;
$all_pars[$j] =~ s/\{Nicandra\}/{Nicandra physalodes}/;
$all_pars[$j] =~ s/\{Nicolletia\}/{Nicolletia occidentalis}/;
$all_pars[$j] =~ s/\{Nothochelone\}/{Nothochelone nemorosa}/;
$all_pars[$j] =~ s/\{Notholaena\}/{Notholaena californica}/;
$all_pars[$j] =~ s/\{Nothoscordum\}/{Nothoscordum gracile}/;
$all_pars[$j] =~ s/\{Nuphar\}/{Nuphar polysepala}/;
$all_pars[$j] =~ s/\{Nuttallanthus\}/{Nuttallanthus texanus}/;
$all_pars[$j] =~ s/\{Nymphoides\}/{Nymphoides peltata}/;
$all_pars[$j] =~ s/\{Oemleria\}/{Oemleria cerasiformis}/;
$all_pars[$j] =~ s/\{Oenanthe\}/{Oenanthe sarmentosa}/;
$all_pars[$j] =~ s/\{Olea\}/{Olea europaea}/;
$all_pars[$j] =~ s/\{Oligomeris\}/{Oligomeris linifolia}/;
$all_pars[$j] =~ s/\{Olneya\}/{Olneya tesota}/;
$all_pars[$j] =~ s/\{Olsynium\}/{Olsynium douglasii var. douglasii}/;
$all_pars[$j] =~ s/\{Oncosiphon\}/{Oncosiphon piluliferum}/;
$all_pars[$j] =~ s/\{Onobrychis\}/{Onobrychis viciifolia}/;
$all_pars[$j] =~ s/\{Ornithostaphylos\}/{Ornithostaphylos oppositifolia}/;
$all_pars[$j] =~ s/\{Orochaenactis\}/{Orochaenactis thysanocarpha}/;
$all_pars[$j] =~ s/\{Orogenia\}/{Orogenia fusiformis}/;
$all_pars[$j] =~ s/\{Orthilia\}/{Orthilia secunda}/;
$all_pars[$j] =~ s/\{Oryctes\}/{Oryctes nevadensis}/;
$all_pars[$j] =~ s/\{Oryza\}/{Oryza sativa}/;
$all_pars[$j] =~ s/\{Osmadenia\}/{Osmadenia tenella}/;
$all_pars[$j] =~ s/\{Ottelia\}/{Ottelia alismoides}/;
$all_pars[$j] =~ s/\{Oxypolis\}/{Oxypolis occidentalis}/;
$all_pars[$j] =~ s/\{Oxyria\}/{Oxyria digyna}/;
$all_pars[$j] =~ s/\{Oxystylis\}/{Oxystylis lutea}/;
$all_pars[$j] =~ s/\{Pallenis\}/{Pallenis maritima}/;
$all_pars[$j] =~ s/\{Pancratium\}/{Pancratium maritimum}/;
$all_pars[$j] =~ s/\{Parthenocissus\}/{Parthenocissus inserta}/;
$all_pars[$j] =~ s/\{Pastinaca\}/{Pastinaca sativa}/;
$all_pars[$j] =~ s/\{Paxistima\}/{Paxistima myrsinites}/;
$all_pars[$j] =~ s/\{Pectis\}/{Pectis papposa var. papposa}/;
$all_pars[$j] =~ s/\{Peltandra\}/{Peltandra virginica}/; #missed by David in 2015
$all_pars[$j] =~ s/\{Peraphyllum\}/{Peraphyllum ramosissimum}/;
$all_pars[$j] =~ s/\{Pericome\}/{Pericome caudata}/;
$all_pars[$j] =~ s/\{Petasites\}/{Petasites frigidus var. palmatus}/;
$all_pars[$j] =~ s/\{Peteria\}/{Peteria thompsoniae}/;
$all_pars[$j] =~ s/\{Petradoria\}/{Petradoria pumila var. pumila}/;
$all_pars[$j] =~ s/\{Petroselinum\}/{Petroselinum crispum}/;
$all_pars[$j] =~ s/\{Petunia\}/{Petunia parviflora}/;
$all_pars[$j] =~ s/\{Peucephyllum\}/{Peucephyllum schottii}/;
$all_pars[$j] =~ s/\{Phalacroseris\}/{Phalacroseris bolanderi}/;
$all_pars[$j] =~ s/\{Phaseolus\}/{Phaseolus filiformis}/;
$all_pars[$j] =~ s/\{Phoenicaulis\}/{Phoenicaulis cheiranthoides}/;
$all_pars[$j] =~ s/\{Phragmites\}/{Phragmites australis}/;
$all_pars[$j] =~ s/\{Phyllostachys\}/{Phyllostachys aurea}/;
$all_pars[$j] =~ s/\{Pilularia\}/{Pilularia americana}/;
$all_pars[$j] =~ s/\{Pinguicula\}/{Pinguicula macroceras}/;
$all_pars[$j] =~ s/\{Pistacia\}/{Pistacia atlantica}/;
$all_pars[$j] =~ s/\{Pistia\}/{Pistia stratiotes}/;
$all_pars[$j] =~ s/\{Pisum\}/{Pisum sativum}/;
$all_pars[$j] =~ s/\{Pityopus\}/{Pityopus californicus}/;
$all_pars[$j] =~ s/\{Planodes\}/{Planodes virginica}/;
$all_pars[$j] =~ s/\{Platystemon\}/{Platystemon californicus}/;
$all_pars[$j] =~ s/\{Plecostachys\}/{Plecostachys serpyllifolia}/;
$all_pars[$j] =~ s/\{Pleiacanthus\}/{Pleiacanthus spinosus}/;
$all_pars[$j] =~ s/\{Pleuricospora\}/{Pleuricospora fimbriolata}/;
$all_pars[$j] =~ s/\{Pleurocoronis\}/{Pleurocoronis pluriseta}/;
$all_pars[$j] =~ s/\{Plumbago\}/{Plumbago auriculata}/;
$all_pars[$j] =~ s/\{Podistera\}/{Podistera nevadensis}/;
$all_pars[$j] =~ s/\{Polanisia\}/{Polanisia dodecandra subsp. trachysperma}/;
$all_pars[$j] =~ s/\{Poliomintha\}/{Poliomintha incana}/;
$all_pars[$j] =~ s/\{Polyctenium\}/{Polyctenium fremontii}/;
$all_pars[$j] =~ s/\{Porterella\}/{Porterella carnosula}/;
$all_pars[$j] =~ s/\{Poteridium\}/{Poteridium annuum}/;
$all_pars[$j] =~ s/\{Poterium\}/{Poterium sanguisorba}/;
$all_pars[$j] =~ s/\{Prenanthella\}/{Prenanthella exigua}/;
$all_pars[$j] =~ s/\{Pseudorontium\}/{Pseudorontium cyathiferum}/;
$all_pars[$j] =~ s/\{Pseudotrillium\}/{Pseudotrillium rivale}/;
$all_pars[$j] =~ s/\{Psilostrophe\}/{Psilostrophe cooperi}/;
$all_pars[$j] =~ s/\{Ptelea\}/{Ptelea crenulata}/;
$all_pars[$j] =~ s/\{Pterocarya\}/{Pterocarya stenoptera}/; #missed by David in 2015
$all_pars[$j] =~ s/\{Pterospora\}/{Pterospora andromedea}/;
$all_pars[$j] =~ s/\{Pterostegia\}/{Pterostegia drymarioides}/;
$all_pars[$j] =~ s/\{Pulicaria\}/{Pulicaria paludosa}/;
$all_pars[$j] =~ s/\{Punica\}/{Punica granatum}/;
$all_pars[$j] =~ s/\{Pycnanthemum\}/{Pycnanthemum californicum}/;
$all_pars[$j] =~ s/\{Pyrus\}/{Pyrus communis}/;
$all_pars[$j] =~ s/\{Rapistrum\}/{Rapistrum rugosum}/;
$all_pars[$j] =~ s/\{Ratibida\}/{Ratibida columnifera}/;
$all_pars[$j] =~ s/\{Rhagadiolus\}/{Rhagadiolus stellatus}/;
$all_pars[$j] =~ s/\{Rhodiola\}/{Rhodiola integrifolia subsp. integrifolia}/;
$all_pars[$j] =~ s/\{Ricinus\}/{Ricinus communis}/;
$all_pars[$j] =~ s/\{Rigiopappus\}/{Rigiopappus leptocladus}/;
$all_pars[$j] =~ s/\{Romulea\}/{Romulea rosea var. australis}/;
$all_pars[$j] =~ s/\{Ruta\}/{Ruta chalepensis}/;
$all_pars[$j] =~ s/\{Saccharum\}/{Saccharum ravennae}/;
$all_pars[$j] =~ s/\{Salpichroa\}/{Salpichroa origanifolia}/;
$all_pars[$j] =~ s/\{Sanguisorba\}/{Sanguisorba officinalis}/;
$all_pars[$j] =~ s/\{Santolina\}/{Santolina chamaecyparissus}/;
$all_pars[$j] =~ s/\{Sanvitalia\}/{Sanvitalia abertii}/;
$all_pars[$j] =~ s/\{Saponaria\}/{Saponaria officinalis}/;
$all_pars[$j] =~ s/\{Sarcodes\}/{Sarcodes sanguinea}/;
$all_pars[$j] =~ s/\{Sarracenia\}/{Sarracenia purpurea}/;
$all_pars[$j] =~ s/\{Saussurea\}/{Saussurea americana}/;
$all_pars[$j] =~ s/\{Saxifragopsis\}/{Saxifragopsis fragarioides}/;
$all_pars[$j] =~ s/\{Scandix\}/{Scandix pecten-veneris}/;
$all_pars[$j] =~ s/\{Sceptridium\}/{Sceptridium multifidum}/;
$all_pars[$j] =~ s/\{Schoenus\}/{Schoenus nigricans}/;
$all_pars[$j] =~ s/\{Scleranthus\}/{Scleranthus annuus subsp. annuus}/;
$all_pars[$j] =~ s/\{Sclerochloa\}/{Sclerochloa dura}/;
$all_pars[$j] =~ s/\{Sclerolinon\}/{Sclerolinon digynum}/;
$all_pars[$j] =~ s/\{Scleropogon\}/{Scleropogon brevifolius}/;
$all_pars[$j] =~ s/\{Scoliopus\}/{Scoliopus bigelovii}/;
$all_pars[$j] =~ s/\{Scolymus\}/{Scolymus hispanicus}/;
$all_pars[$j] =~ s/\{Scopulophila\}/{Scopulophila rixfordii}/;
$all_pars[$j] =~ s/\{Scorzonera\}/{Scorzonera hispanica}/;
$all_pars[$j] =~ s/\{Scribneria\}/{Scribneria bolanderi}/;
$all_pars[$j] =~ s/\{Searsia\}/{Searsia lancea}/;
$all_pars[$j] =~ s/\{Secale\}/{Secale cereale}/;
$all_pars[$j] =~ s/\{Senegalia\}/{Senegalia greggii}/;
$all_pars[$j] =~ s/\{Sequoia\}/{Sequoia sempervirens}/;
$all_pars[$j] =~ s/\{Sequoiadendron\}/{Sequoiadendron giganteum}/;
$all_pars[$j] =~ s/\{Sesuvium\}/{Sesuvium verrucosum}/;
$all_pars[$j] =~ s/\{Sherardia\}/{Sherardia arvensis}/;
$all_pars[$j] =~ s/\{Sibaropsis\}/{Sibaropsis hammittii}/;
$all_pars[$j] =~ s/\{Sibbaldia\}/{Sibbaldia procumbens}/;
$all_pars[$j] =~ s/\{Silybum\}/{Silybum marianum}/;
$all_pars[$j] =~ s/\{Sium\}/{Sium suave}/;
$all_pars[$j] =~ s/\{Smelowskia\}/{Smelowskia ovalis}/;
$all_pars[$j] =~ s/\{Soleirolia\}/{Soleirolia soleirolii}/;
$all_pars[$j] =~ s/\{Soliva\}/{Soliva sessilis}/;
$all_pars[$j] =~ s/\{Spartium\}/{Spartium junceum}/;
$all_pars[$j] =~ s/\{Spergula\}/{Spergula arvensis}/;
$all_pars[$j] =~ s/\{Spermolepis\}/{Spermolepis echinata}/;
$all_pars[$j] =~ s/\{Sphaerophysa\}/{Sphaerophysa salsula}/;
$all_pars[$j] =~ s/\{Sphenopholis\}/{Sphenopholis obtusata}/;
$all_pars[$j] =~ s/\{Sphenosciadium\}/{Sphenosciadium capitellatum}/;
$all_pars[$j] =~ s/\{Spirodela\}/{Spirodela polyrhiza}/;
$all_pars[$j] =~ s/\{Stemodia\}/{Stemodia durantifolia}/;
$all_pars[$j] =~ s/\{Stenanthium\}/{Stenanthium occidentale}/;
$all_pars[$j] =~ s/\{Stenotaphrum\}/{Stenotaphrum secundatum}/;
$all_pars[$j] =~ s/\{Streptanthella\}/{Streptanthella longirostris}/;
$all_pars[$j] =~ s/\{Streptopus\}/{Streptopus amplexifolius var. americanus}/;
$all_pars[$j] =~ s/\{Strigosella\}/{Strigosella africana}/;
$all_pars[$j] =~ s/\{Stutzia\}/{Stutzia covillei}/;
$all_pars[$j] =~ s/\{Swallenia\}/{Swallenia alexandrae}/;
$all_pars[$j] =~ s/\{Swertia\}/{Swertia perennis}/;
$all_pars[$j] =~ s/\{Syagrus\}/{Syagrus romanzoffiana}/;
$all_pars[$j] =~ s/\{Systenotheca\}/{Systenotheca vortriedei}/;
$all_pars[$j] =~ s/\{Syzygium\}/{Syzygium australe}/;
$all_pars[$j] =~ s/\{Taxus\}/{Taxus brevifolia}/;
$all_pars[$j] =~ s/\{Tellima\}/{Tellima grandiflora}/;
$all_pars[$j] =~ s/\{Tetragonia\}/{Tetragonia tetragonoides}/;
$all_pars[$j] =~ s/\{Tetraneuris\}/{Tetraneuris acaulis var. arizonica}/;
$all_pars[$j] =~ s/\{Thamnosma\}/{Thamnosma montana}/;
$all_pars[$j] =~ s/\{Thelesperma\}/{Thelesperma megapotamicum}/;
$all_pars[$j] =~ s/\{Thlaspi\}/{Thlaspi arvense}/;
$all_pars[$j] =~ s/\{Thuja\}/{Thuja plicata}/;
$all_pars[$j] =~ s/\{Tolmiea\}/{Tolmiea diplomenziesii}/;
$all_pars[$j] =~ s/\{Tolpis\}/{Tolpis barbata}/;
$all_pars[$j] =~ s/\{Tonella\}/{Tonella tenella}/;
$all_pars[$j] =~ s/\{Torreya\}/{Torreya californica}/;
$all_pars[$j] =~ s/\{Toxicodendron\}/{Toxicodendron diversilobum}/;
$all_pars[$j] =~ s/\{Tracyina\}/{Tracyina rostrata}/;
$all_pars[$j] =~ s/\{Tragia\}/{Tragia ramosa}/;
$all_pars[$j] =~ s/\{Trautvetteria\}/{Trautvetteria caroliniensis}/;
$all_pars[$j] =~ s/\{Triadica\}/{Triadica sebifera}/;
$all_pars[$j] =~ s/\{Trianthema\}/{Trianthema portulacastrum}/;
$all_pars[$j] =~ s/\{Tribulus\}/{Tribulus terrestris}/;
$all_pars[$j] =~ s/\{Tricardia\}/{Tricardia watsonii}/;
$all_pars[$j] =~ s/\{Trichocoronis\}/{Trichocoronis wrightii var. wrightii}/;
$all_pars[$j] =~ s/\{Trichoptilium\}/{Trichoptilium incisum}/;
$all_pars[$j] =~ s/\{Tripleurospermum\}/{Tripleurospermum inodorum}/;
$all_pars[$j] =~ s/\{Triticum\}/{Triticum aestivum}/;
$all_pars[$j] =~ s/\{Trixis\}/{Trixis californica var. californica}/;
$all_pars[$j] =~ s/\{Tuberaria\}/{Tuberaria guttata}/;
$all_pars[$j] =~ s/\{Tulipa\}/{Tulipa clusiana}/;
$all_pars[$j] =~ s/\{Turritis\}/{Turritis glabra}/;
$all_pars[$j] =~ s/\{Ulex\}/{Ulex europaeus}/;
$all_pars[$j] =~ s/\{Uropappus\}/{Uropappus lindleyi}/;
$all_pars[$j] =~ s/\{Urospermum\}/{Urospermum picroides}/;
$all_pars[$j] =~ s/\{Vaccaria\}/{Vaccaria hispanica}/;
$all_pars[$j] =~ s/\{Vahlodea\}/{Vahlodea atropurpurea}/;
$all_pars[$j] =~ s/\{Velezia\}/{Velezia rigida}/;
$all_pars[$j] =~ s/\{Venegasia\}/{Venegasia carpesioides}/;
$all_pars[$j] =~ s/\{Ventenata\}/{Ventenata dubia}/;
$all_pars[$j] =~ s/\{Viguiera\}/{Viguiera purisimae}/;
$all_pars[$j] =~ s/\{Vinca\}/{Vinca major}/;
$all_pars[$j] =~ s/\{Viscum\}/{Viscum album}/;
$all_pars[$j] =~ s/\{Volutaria\}/{Volutaria muricata}/;
$all_pars[$j] =~ s/\{Whipplea\}/{Whipplea modesta}/;
$all_pars[$j] =~ s/\{Wigandia\}/{Wigandia urens}/;
$all_pars[$j] =~ s/\{Woodwardia\}/{Woodwardia fimbriata}/;
$all_pars[$j] =~ s/\{Xerophyllum\}/{Xerophyllum tenax}/;
$all_pars[$j] =~ s/\{Xylococcus\}/{Xylococcus bicolor}/;
$all_pars[$j] =~ s/\{Yabea\}/{Yabea microcarpa}/;
$all_pars[$j] =~ s/\{Zantedeschia\}/{Zantedeschia aethiopica}/;
$all_pars[$j] =~ s/\{Zygophyllum\}/{Zygophyllum fabago}/;
#print "After: $all_pars[$j]\n";



#change monotypic families where the key ends in a family and that family only has a single genus with multiple species
#print "Before: $all_pars[$j]\n";
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
#print "After: $all_pars[$j]\n";



#change monotypic families where the key ends in a family and that family only has a single genus with a single species
#print "Before: $all_pars[$j]\n";
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
#print "After: $all_pars[$j]\n";



}

#Hydrocotyle (treated in araliaceae)
#Botrychium simplex or b. pumicola (small or shade pls, see couplet 3 to separate the species)
#Botrychium crenulatum(sun plants)
#Galenia==>Galenia {Galenia pubescens} #this needs to link to the eflora page for Aizoaceae since it is a waif-noted name and does not have its own page
#Orogenia {Orogenia fusiformis} #no longer is a valid genus, this is a Lomatium
#Sphenosciadium {Sphenosciadium capitellatum} #same


	print FGK join("\n",@all_pars);


close(IN);
close(FGK);


print <<EOP;
Names converted: $found2
Subtaxa converted: $found3
Grass Names converted: $found4
 TOTAL LINES: $found1

EOP