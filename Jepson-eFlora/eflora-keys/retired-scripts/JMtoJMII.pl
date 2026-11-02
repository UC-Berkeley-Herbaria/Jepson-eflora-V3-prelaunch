#!/usr/bin/perl
#use Text::Soundex;
use BerkeleyDB;
use CGI;
$query = new CGI;                        # create new CGI object

if($query->param('FAM')){
	$fam=1;

%GTF=(
"Abies","PINACEAE", "Abronia","NYCTAGINACEAE", "Abutilon","MALVACEAE", "Acacia","FABACEAE", "Acaena","ROSACEAE", "Acalypha","EUPHORBIACEAE",
"Acamptopappus","ASTERACEAE", "Acanthomintha","LAMIACEAE", "Acanthoscyphus","POLYGONACEAE", "Acer","SAPINDACEAE", "Achillea","ASTERACEAE",
"Achlys","BERBERIDACEAE", "Achyrachaena","ASTERACEAE", "Achyronychia","CARYOPHYLLACEAE", "Acleisanthes","NYCTAGINACEAE", "Acmispon","FABACEAE",
"Aconitum","RANUNCULACEAE", "Aconogonon","POLYGONACEAE", "Acourtia","ASTERACEAE", "Acroptilon","ASTERACEAE", "Actaea","RANUNCULACEAE",
"Adenocaulon","ASTERACEAE", "Adenophyllum","ASTERACEAE", "Adenostoma","ROSACEAE", "Adiantum","PTERIDACEAE", "Adolphia","RHAMNACEAE",
"Adonis","RANUNCULACEAE", "Aegilops","POACEAE", "Aeonium","CRASSULACEAE", "Aeschynomene","FABACEAE", "Aesculus","SAPINDACEAE",
"Agastache","LAMIACEAE", "Agave","AGAVACEAE", "Ageratina","ASTERACEAE", "Agoseris","ASTERACEAE", "Agrimonia","ROSACEAE", "Agropyron","POACEAE",
"Agrostemma","CARYOPHYLLACEAE", "Agrostis","POACEAE", "Ailanthus","SIMAROUBACEAE", "Aira","POACEAE", "Albizia","FABACEAE", "Alcea","MALVACEAE",
"Alhagi","FABACEAE", "Aliciella","POLEMONIACEAE", "Alisma","ALISMATACEAE", "Allenrolfea","CHENOPODIACEAE", "Allionia","NYCTAGINACEAE", "Allium","ALLIACEAE",
"Allophyllum","POLEMONIACEAE", "Allotropa","ERICACEAE", "Almutaster","ASTERACEAE", "Alnus","BETULACEAE", "Aloe","ASPHODELACEAE", "Alopecurus","POACEAE",
"Aloysia","VERBENACEAE", "Alternanthera","AMARANTHACEAE", "Alyogyne","MALVACEAE", "Alyssum","BRASSICACEAE", "Amaranthus","AMARANTHACEAE", "Amaryllis","AMARYLLIDACEAE",
"Amauriopsis","ASTERACEAE", "Amblyopappus","ASTERACEAE", "Ambrosia","ASTERACEAE", "Amelanchier","ROSACEAE", "Ammannia","LYTHRACEAE", "Ammi","APIACEAE",
"Ammophila","POACEAE", "Ammoselinum","APIACEAE", "Amorpha","FABACEAE", "Amphipappus","ASTERACEAE", "Amphiscirpus","CYPERACEAE", "Amsinckia","BORAGINACEAE",
"Amsonia","APOCYNACEAE", "Anagallis","MYRSINACEAE", "Anaphalis","ASTERACEAE", "Anchusa","BORAGINACEAE", "Ancistrocarphus","ASTERACEAE", "Andropogon","POACEAE",
"Androsace","PRIMULACEAE", "Androstephium","THEMIDACEAE", "Anelsonia","BRASSICACEAE", "Anemone","RANUNCULACEAE", "Anemopsis","SAURURACEAE", "Anethum","APIACEAE",
"Angelica","APIACEAE", "Anisocarpus","ASTERACEAE", "Anisocoma","ASTERACEAE", "Anisodontea","MALVACEAE", "Anoda","MALVACEAE", "Anredera","BASELLACEAE",
"Antennaria","ASTERACEAE", "Anthemis","ASTERACEAE", "Anthoxanthum","POACEAE", "Anthriscus","APIACEAE", "Antirrhinum","PLANTAGINACEAE", "Anulocaulis","NYCTAGINACEAE",
"Apera","POACEAE", "Aphanes","ROSACEAE", "Aphanisma","CHENOPODIACEAE", "Apiastrum","APIACEAE", "Apium","APIACEAE", "Apocynum","APOCYNACEAE",
"Aponogeton","APONOGETONACEAE", "Aptenia","AIZOACEAE", "Aquilegia","RANUNCULACEAE", "Arabidopsis","BRASSICACEAE", "Arabis","BRASSICACEAE", "Aralia","ARALIACEAE",
"Araujia","APOCYNACEAE", "Arbutus","ERICACEAE", "Arceuthobium","VISCACEAE", "Arctium","ASTERACEAE", "Arctomecon","PAPAVERACEAE", "Arctostaphylos","ERICACEAE",
"Arctotheca","ASTERACEAE", "Arctotis","ASTERACEAE", "Arenaria","CARYOPHYLLACEAE", "Argemone","PAPAVERACEAE", "Argyranthemum","ASTERACEAE", "Argyrochosma","PTERIDACEAE",
"Arida","ASTERACEAE", "Aristida","POACEAE", "Aristocapsa","POLYGONACEAE", "Aristolochia","ARISTOLOCHIACEAE", "Armeria","PLUMBAGINACEAE", "Armoracia","BRASSICACEAE",
"Arnica","ASTERACEAE", "Arrhenatherum","POACEAE", "Artemisia","ASTERACEAE", "Arthrocnemum","CHENOPODIACEAE", "Arum","ARACEAE", "Aruncus","ROSACEAE",
"Arundo","POACEAE", "Asarum","ARISTOLOCHIACEAE", "Asclepias","APOCYNACEAE", "Asparagus","ASPARAGACEAE", "Asperugo","BORAGINACEAE", "Asphodelus","ASPHODELACEAE",
"Aspidotis","PTERIDACEAE", "Asplenium","ASPLENIACEAE", "Astragalus","FABACEAE", "Astrolepis","PTERIDACEAE", "Asyneuma","CAMPANULACEAE", "Athyrium","WOODSIACEAE",
"Athysanus","BRASSICACEAE", "Atrichoseris","ASTERACEAE", "Atriplex","CHENOPODIACEAE", "Aubrieta","BRASSICACEAE", "Avena","POACEAE", "Avicennia","ACANTHACEAE",
"Ayenia","MALVACEAE", "Azolla","AZOLLACEAE", "Baccharis","ASTERACEAE", "Bacopa","PLANTAGINACEAE", "Bahia","ASTERACEAE", "Bahiopsis","ASTERACEAE",
"Baileya","ASTERACEAE", "Balsamorhiza","ASTERACEAE", "Barbarea","BRASSICACEAE", "Bassia","CHENOPODIACEAE", "Batis","BATACEAE", "Bebbia","ASTERACEAE",
"Beckmannia","POACEAE", "Bellardia","OROBANCHACEAE", "Bellis","ASTERACEAE", "Benitoa","ASTERACEAE", "Bensoniella","SAXIFRAGACEAE", "Berberis","BERBERIDACEAE",
"Bergerocactus","CACTACEAE", "Bergia","ELATINACEAE", "Bernardia","EUPHORBIACEAE", "Berteroa","BRASSICACEAE", "Berula","APIACEAE", "Beta","CHENOPODIACEAE",
"Betula","BETULACEAE", "Bidens","ASTERACEAE", "Billardiera","PITTOSPORACEAE", "Bistorta","POLYGONACEAE", "Bituminaria","FABACEAE", "Blechnum","BLECHNACEAE",
"Blennosperma","ASTERACEAE", "Blepharidachne","POACEAE", "Blepharipappus","ASTERACEAE", "Blepharizonia","ASTERACEAE", "Bloomeria","THEMIDACEAE", "Boechera","BRASSICACEAE",
"Boehmeria","URTICACEAE", "Boerhavia","NYCTAGINACEAE", "Bolandra","SAXIFRAGACEAE", "Bolboschoenus","CYPERACEAE", "Borago","BORAGINACEAE", "Bothriochloa","POACEAE",
"Botrychium","OPHIOGLOSSACEAE", "Botrypus","OPHIOGLOSSACEAE", "Bouteloua","POACEAE", "Bowlesia","APIACEAE", "Boykinia","SAXIFRAGACEAE", "Brachypodium","POACEAE",
"Brandegea","CUCURBITACEAE", "Brasenia","CABOMBACEAE", "Brassica","BRASSICACEAE", "Brickellia","ASTERACEAE", "Briza","POACEAE", "Brodiaea","THEMIDACEAE",
"Bromus","POACEAE", "Buddleja","SCROPHULARIACEAE", "Bulbine","ASPHODELACEAE", "Bulbostylis","CYPERACEAE", "Bursera","BURSERACEAE", "Cabomba","CABOMBACEAE",
"Cacaliopsis","ASTERACEAE", "Caesalpinia","FABACEAE", "Cakile","BRASSICACEAE", "Calamagrostis","POACEAE", "Calandrinia","MONTIACEAE", "Calendula","ASTERACEAE",
"Calia","FABACEAE", "California","GERANIACEAE", "Calliandra","FABACEAE", "Callitriche","PLANTAGINACEAE", "Callitropsis","CUPRESSACEAE", "Calocedrus","CUPRESSACEAE",
"Calochortus","LILIACEAE", "Caltha","RANUNCULACEAE", "Calycadenia","ASTERACEAE", "Calycanthus","CALYCANTHACEAE", "Calycoseris","ASTERACEAE", "Calypso","ORCHIDACEAE",
"Calyptridium","MONTIACEAE", "Calystegia","CONVOLVULACEAE", "Camassia","AGAVACEAE", "Camelina","BRASSICACEAE", "Camissonia","ONAGRACEAE", "Camissoniopsis","ONAGRACEAE",
"Campanula","CAMPANULACEAE", "Campsis","BIGNONIACEAE", "Canbya","PAPAVERACEAE", "Cannabis","CANNABACEAE", "Capsella","BRASSICACEAE", "Cardamine","BRASSICACEAE",
"Cardionema","CARYOPHYLLACEAE", "Carduus","ASTERACEAE", "Carex","CYPERACEAE", "Carlowrightia","ACANTHACEAE", "Carlquistia","ASTERACEAE", "Carnegiea","CACTACEAE",
"Carpenteria","HYDRANGEACEAE", "Carpobrotus","AIZOACEAE", "Carrichtera","BRASSICACEAE", "Carsonia","CLEOMACEAE", "Carthamus","ASTERACEAE", "Carya","JUGLANDACEAE",
"Cascadia","SAXIFRAGACEAE", "Cassiope","ERICACEAE", "Castela","SIMAROUBACEAE", "Castilleja","OROBANCHACEAE", "Catalpa","BIGNONIACEAE", "Catharanthus","APOCYNACEAE",
"Caulanthus","BRASSICACEAE", "Ceanothus","RHAMNACEAE", "Celtis","CANNABACEAE", "Cenchrus","POACEAE", "Centaurea","ASTERACEAE", "Centaurium","GENTIANACEAE",
"Centranthus","VALERIANACEAE", "Centromadia","ASTERACEAE", "Centrostegia","POLYGONACEAE", "Cephalanthera","ORCHIDACEAE", "Cephalanthus","RUBIACEAE", "Cerastium","CARYOPHYLLACEAE",
"Ceratophyllum","CERATOPHYLLACEAE", "Cercis","FABACEAE", "Cercocarpus","ROSACEAE", "Cestrum","SOLANACEAE", "Chaenactis","ASTERACEAE", "Chaetadelpha","ASTERACEAE",
"Chaetopappa","ASTERACEAE", "Chamaebatia","ROSACEAE", "Chamaebatiaria","ROSACEAE", "Chamaecyparis","CUPRESSACEAE", "Chamaemelum","ASTERACEAE", "Chamaesaracha","SOLANACEAE",
"Chamaesyce","EUPHORBIACEAE", "Chamelaucium","MYRTACEAE", "Chamerion","ONAGRACEAE", "Chasmanthe","IRIDACEAE", "Cheilanthes","PTERIDACEAE", "Chenopodium","CHENOPODIACEAE",
"Chilopsis","BIGNONIACEAE", "Chimaphila","ERICACEAE", "Chloracantha","ASTERACEAE", "Chloris","POACEAE", "Chlorogalum","AGAVACEAE", "Chloropyron","OROBANCHACEAE",
"Chondrilla","ASTERACEAE", "Chorispora","BRASSICACEAE", "Chorizanthe","POLYGONACEAE", "Chrysanthemoides","ASTERACEAE", "Chrysolepis","FAGACEAE", "Chrysosplenium","SAXIFRAGACEAE",
"Chrysothamnus","ASTERACEAE", "Chylismia","ONAGRACEAE", "Chylismiella","ONAGRACEAE", "Cicendia","GENTIANACEAE", "Cichorium","ASTERACEAE", "Cicuta","APIACEAE",
"Cinna","POACEAE", "Cinnamomum","LAURACEAE", "Circaea","ONAGRACEAE", "Cirsium","ASTERACEAE", "Cissus","VITACEAE", "Cistanthe","MONTIACEAE",
"Cistus","CISTACEAE", "Citrullus","CUCURBITACEAE", "Cladium","CYPERACEAE", "Clarkia","ONAGRACEAE", "Claytonia","MONTIACEAE", "Clematis","RANUNCULACEAE",
"Cleomella","CLEOMACEAE", "Clinopodium","LAMIACEAE", "Clintonia","LILIACEAE", "Cneoridium","RUTACEAE", "Cochlearia","BRASSICACEAE", "Coincya","BRASSICACEAE",
"Coleogyne","ROSACEAE", "Collinsia","PLANTAGINACEAE", "Collomia","POLEMONIACEAE", "Colubrina","RHAMNACEAE", "Colutea","FABACEAE", "Comandra","COMANDRACEAE",
"Comarostaphylis","ERICACEAE", "Comarum","ROSACEAE", "Comastoma","GENTIANACEAE", "Commelina","COMMELINACEAE", "Condalia","RHAMNACEAE", "Conicosia","AIZOACEAE",
"Conioselinum","APIACEAE", "Conium","APIACEAE", "Conringia","BRASSICACEAE", "Consolida","RANUNCULACEAE", "Constancea","ASTERACEAE", "Convolvulus","CONVOLVULACEAE",
"Coprosma","RUBIACEAE", "Coptis","RANUNCULACEAE", "Corallorhiza","ORCHIDACEAE", "Cordylanthus","OROBANCHACEAE", "Cordyline","LAXMANNIACEAE", "Coreopsis","ASTERACEAE",
"Corethrogyne","ASTERACEAE", "Coriandrum","APIACEAE", "Corispermum","CHENOPODIACEAE", "Cornus","CORNACEAE", "Coronilla","FABACEAE", "Cortaderia","POACEAE",
"Corydalis","PAPAVERACEAE", "Corylus","BETULACEAE", "Coryphantha","CACTACEAE", "Cosmos","ASTERACEAE", "Cota","ASTERACEAE", "Cotoneaster","ROSACEAE",
"Cotula","ASTERACEAE", "Cotyledon","CRASSULACEAE", "Crassula","CRASSULACEAE", "Crataegus","ROSACEAE", "Crepis","ASTERACEAE", "Cressa","CONVOLVULACEAE",
"Crocidium","ASTERACEAE", "Crossosoma","CROSSOSOMATACEAE", "Croton","EUPHORBIACEAE", "Crucianella","RUBIACEAE", "Crupina","ASTERACEAE", "Crypsis","POACEAE",
"Cryptantha","BORAGINACEAE", "Cryptogramma","PTERIDACEAE", "Cucumis","CUCURBITACEAE", "Cucurbita","CUCURBITACEAE", "Cuniculotinus","ASTERACEAE", "Cuscuta","CONVOLVULACEAE",
"Cusickiella","BRASSICACEAE", "Cycladenia","APOCYNACEAE", "Cycloloma","CHENOPODIACEAE", "Cyclospermum","APIACEAE", "Cylindropuntia","CACTACEAE", "Cymbalaria","PLANTAGINACEAE",
"Cymopterus","APIACEAE", "Cynara","ASTERACEAE", "Cynodon","POACEAE", "Cynoglossum","BORAGINACEAE", "Cynosurus","POACEAE", "Cyperus","CYPERACEAE",
"Cypripedium","ORCHIDACEAE", "Cypselea","AIZOACEAE", "Cyrtomium","DRYOPTERIDACEAE", "Cystopteris","WOODSIACEAE", "Cytisus","FABACEAE",
"Dactylis","POACEAE",
"Dactyloctenium","POACEAE",
"Dalea","FABACEAE",
"Damasonium","ALISMATACEAE",
"Danthonia","POACEAE",
"Darlingtonia","SARRACENIACEAE",
"Darmera","SAXIFRAGACEAE",
"Dasiphora","ROSACEAE",
"Dasyochloa","POACEAE",
"Datisca","DATISCACEAE",
"Datura","SOLANACEAE",
"Daucus","APIACEAE",
"Dedeckera","POLYGONACEAE",
"Deinandra","ASTERACEAE",
"Delairea","ASTERACEAE",
"Delosperma","AIZOACEAE",
"Delphinium","RANUNCULACEAE",
"Dendromecon","PAPAVERACEAE",
"Deschampsia","POACEAE",
"Descurainia","BRASSICACEAE",
"Desmazeria","POACEAE",
"Dianthus","CARYOPHYLLACEAE",
"Dicentra","PAPAVERACEAE",
"Dichelostemma","THEMIDACEAE",
"Dichondra","CONVOLVULACEAE",
"Dicoria","ASTERACEAE",
"Dicranostegia","OROBANCHACEAE",
"Dieteria","ASTERACEAE",
"Digitalis","PLANTAGINACEAE",
"Digitaria","POACEAE",
"Dimeresia","ASTERACEAE",
"Dimorphotheca","ASTERACEAE",
"Diodia","RUBIACEAE",
"Diplotaxis","BRASSICACEAE",
"Dipsacus","DIPSACACEAE",
"Dirca","THYMELAEACEAE",
"Dissanthelium","POACEAE",
"Distichlis","POACEAE",
"Ditaxis","EUPHORBIACEAE",
"Dithyrea","BRASSICACEAE",
"Dittrichia","ASTERACEAE",
"Dodecahema","POLYGONACEAE",
"Dodecatheon","PRIMULACEAE",
"Dopatrium","PLANTAGINACEAE",
"Downingia","CAMPANULACEAE",
"Draba","BRASSICACEAE",
"Draperia","BORAGINACEAE",
"Drosanthemum","AIZOACEAE",
"Drosera","DROSERACEAE",
"Drymocallis","ROSACEAE",
"Dryopteris","DRYOPTERIDACEAE",
"Duchesnea","ROSACEAE",
"Dudleya","CRASSULACEAE",
"Dulichium","CYPERACEAE",
"Dysphania","CHENOPODIACEAE",
"Dyssodia","ASTERACEAE",
"Eastwoodia","ASTERACEAE",
"Eatonella","ASTERACEAE",
"Echinocactus","CACTACEAE",
"Echinocereus","CACTACEAE",
"Echinochloa","POACEAE",
"Echinodorus","ALISMATACEAE",
"Echinops","ASTERACEAE",
"Echium","BORAGINACEAE",
"Eclipta","ASTERACEAE",
"Egeria","HYDROCHARITACEAE",
"Ehrendorferia","PAPAVERACEAE",
"Ehrharta","POACEAE",
"Eichhornia","PONTEDERIACEAE",
"Elaeagnus","ELAEAGNACEAE",
"Elatine","ELATINACEAE",
"Eleocharis","CYPERACEAE",
"Eleusine","POACEAE",
"Elodea","HYDROCHARITACEAE",
"Elymus","POACEAE",
"Emex","POLYGONACEAE",
"Emmenanthe","BORAGINACEAE",
"Empetrum","ERICACEAE",
"Encelia","ASTERACEAE",
"Enceliopsis","ASTERACEAE",
"Enemion","RANUNCULACEAE",
"Enneapogon","POACEAE",
"Ephedra","EPHEDRACEAE",
"Epilobium","ONAGRACEAE",
"Epipactis","ORCHIDACEAE",
"Equisetum","EQUISETACEAE",
"Eragrostis","POACEAE",
"Eremalche","MALVACEAE",
"Eremogone","CARYOPHYLLACEAE",
"Eremothera","ONAGRACEAE",
"Eriastrum","POLEMONIACEAE",
"Erica","ERICACEAE",
"Ericameria","ASTERACEAE",
"Erigeron","ASTERACEAE",
"Eriobotrya","ROSACEAE",
"Eriochloa","POACEAE",
"Eriodictyon","BORAGINACEAE",
"Eriogonum","POLYGONACEAE",
"Erioneuron","POACEAE",
"Eriophorum","CYPERACEAE",
"Eriophyllum","ASTERACEAE",
"Erodium","GERANIACEAE",
"Eruca","BRASSICACEAE",
"Erucastrum","BRASSICACEAE",
"Eryngium","APIACEAE",
"Erysimum","BRASSICACEAE",
"Erythronium","LILIACEAE",
"Eschscholzia","PAPAVERACEAE",
"Eucalyptus","MYRTACEAE",
"Eucephalus","ASTERACEAE",
"Euchiton","ASTERACEAE",
"Euclidium","BRASSICACEAE",
"Eucnide","LOASACEAE",
"Eucrypta","BORAGINACEAE",
"Eulobus","ONAGRACEAE",
"Euonymus","CELASTRACEAE",
"Euphorbia","EUPHORBIACEAE",
"Euphrosyne","ASTERACEAE",
"Eurybia","ASTERACEAE",
"Eustoma","GENTIANACEAE",
"Euthamia","ASTERACEAE",
"Fagonia","ZYGOPHYLLACEAE",
"Fallopia","POLYGONACEAE",
"Fallugia","ROSACEAE",
"Fendlerella","HYDRANGEACEAE",
"Ferocactus","CACTACEAE",
"Festuca","POACEAE",
"Ficus","MORACEAE",
"Filago","ASTERACEAE",
"Fimbristylis","CYPERACEAE",
"Flaveria","ASTERACEAE",
"Floerkea","LIMNANTHACEAE",
"Foeniculum","APIACEAE",
"Forestiera","OLEACEAE",
"Fouquieria","FOUQUIERIACEAE",
"Fragaria","ROSACEAE",
"Frangula","RHAMNACEAE",
"Frankenia","FRANKENIACEAE",
"Frasera","GENTIANACEAE",
"Fraxinus","OLEACEAE",
"Freesia","IRIDACEAE",
"Fremontodendron","MALVACEAE",
"Fritillaria","LILIACEAE",
"Fumaria","PAPAVERACEAE",
"Funastrum","APOCYNACEAE",
"Gaillardia","ASTERACEAE",
"Galinsoga","ASTERACEAE",
"Galium","RUBIACEAE",
"Gambelia","PLANTAGINACEAE",
"Gamochaeta","ASTERACEAE",
"Garrya","GARRYACEAE",
"Gastridium","POACEAE",
"Gaudinia","POACEAE",
"Gaultheria","ERICACEAE",
"Gayophytum","ONAGRACEAE",
"Gazania","ASTERACEAE",
"Genista","FABACEAE",
"Gentiana","GENTIANACEAE",
"Gentianella","GENTIANACEAE",
"Gentianopsis","GENTIANACEAE",
"Geraea","ASTERACEAE",
"Geranium","GERANIACEAE",
"Geum","ROSACEAE",
"Gilia","POLEMONIACEAE",
"Gilmania","POLYGONACEAE",
"Githopsis","CAMPANULACEAE",
"Glaucium","PAPAVERACEAE",
"Glaux","MYRSINACEAE",
"Glebionis","ASTERACEAE",
"Glechoma","LAMIACEAE",
"Gleditsia","FABACEAE",
"Glehnia","APIACEAE",
"Glinus","MOLLUGINACEAE",
"Glossopetalon","CROSSOSOMATACEAE",
"Glyceria","POACEAE",
"Glycyrrhiza","FABACEAE",
"Glyptopleura","ASTERACEAE",
"Gnaphalium","ASTERACEAE",
"Goodmania","POLYGONACEAE",
"Goodyera","ORCHIDACEAE",
"Gossypium","MALVACEAE",
"Gratiola","PLANTAGINACEAE",
"Grayia","CHENOPODIACEAE",
"Grevillea","PROTEACEAE",
"Grindelia","ASTERACEAE",
"Grusonia","CACTACEAE",
"Guilleminea","AMARANTHACEAE",
"Gunnera","GUNNERACEAE",
"Gutierrezia","ASTERACEAE",
"Gymnosteris","POLEMONIACEAE",
"Gypsophila","CARYOPHYLLACEAE",
"Hackelia","BORAGINACEAE",
"Hainardia","POACEAE",
"Halimodendron","FABACEAE",
"Halimolobos","BRASSICACEAE",
"Halogeton","CHENOPODIACEAE",
"Harmonia","ASTERACEAE",
"Harpagonella","BORAGINACEAE",
"Hastingsia","AGAVACEAE",
"Hazardia","ASTERACEAE",
"Hecastocleis","ASTERACEAE",
"Hedeoma","LAMIACEAE",
"Hedera","ARALIACEAE",
"Hedychium","ZINGIBERACEAE",
"Hedypnois","ASTERACEAE",
"Helenium","ASTERACEAE",
"Helianthella","ASTERACEAE",
"Helianthemum","CISTACEAE",
"Helianthus","ASTERACEAE",
"Helichrysum","ASTERACEAE",
"Heliomeris","ASTERACEAE",
"Heliotropium","BORAGINACEAE",
"Helminthotheca","ASTERACEAE",
"Hemieva","SAXIFRAGACEAE",
"Hemitomes","ERICACEAE",
"Hemizonella","ASTERACEAE",
"Hemizonia","ASTERACEAE",
"Heracleum","APIACEAE",
"Herissantia","MALVACEAE",
"Herniaria","CARYOPHYLLACEAE",
"Hesperevax","ASTERACEAE",
"Hesperidanthus","BRASSICACEAE",
"Hesperis","BRASSICACEAE",
"Hesperocallis","AGAVACEAE",
"Hesperochiron","BORAGINACEAE",
"Hesperocnide","URTICACEAE",
"Hesperocyparis","CUPRESSACEAE",
"Hesperolinon","LINACEAE",
"Hesperomecon","PAPAVERACEAE",
"Hesperoyucca","AGAVACEAE",
"Heteranthemis","ASTERACEAE",
"Heteranthera","PONTEDERIACEAE",
"Heterocodon","CAMPANULACEAE",
"Heteromeles","ROSACEAE",
"Heteropogon","POACEAE",
"Heterotheca","ASTERACEAE",
"Heuchera","SAXIFRAGACEAE",
"Hibiscus","MALVACEAE",
"Hieracium","ASTERACEAE",
"Hilaria","POACEAE",
"Hippuris","PLANTAGINACEAE",
"Hirschfeldia","BRASSICACEAE",
"Hoffmannseggia","FABACEAE",
"Hoita","FABACEAE",
"Holcus","POACEAE",
"Hollisteria","POLYGONACEAE",
"Holmgrenanthe","PLANTAGINACEAE",
"Holocarpha","ASTERACEAE",
"Holodiscus","ROSACEAE",
"Holosteum","CARYOPHYLLACEAE",
"Holozonia","ASTERACEAE",
"Hordeum","POACEAE",
"Horkelia","ROSACEAE",
"Horkeliella","ROSACEAE",
"Hornungia","BRASSICACEAE",
"Horsfordia","MALVACEAE",
"Hosackia","FABACEAE",
"Howellia","CAMPANULACEAE",
"Hulsea","ASTERACEAE",
"Humulus","CANNABACEAE",
"Hydrilla","HYDROCHARITACEAE",
"Hydrocotyle","ARALIACEAE",
"Hydrophyllum","BORAGINACEAE",
"Hymenopappus","ASTERACEAE",
"Hymenothrix","ASTERACEAE",
"Hymenoxys","ASTERACEAE",
"Hyparrhenia","POACEAE",
"Hypericum","HYPERICACEAE",
"Hypochaeris","ASTERACEAE",
"Hyptis","LAMIACEAE",
"Iberis","BRASSICACEAE",
"Idahoa","BRASSICACEAE",
"Ilex","AQUIFOLIACEAE",
"Iliamna","MALVACEAE",
"Impatiens","BALSAMINACEAE",
"Imperata","POACEAE",
"Ionactis","ASTERACEAE",
"Ipheion","ALLIACEAE",
"Ipomoea","CONVOLVULACEAE",
"Ipomopsis","POLEMONIACEAE",
"Iris","IRIDACEAE",
"Isatis","BRASSICACEAE",
"Isocoma","ASTERACEAE",
"Isoetes","ISOETACEAE",
"Isolepis","CYPERACEAE",
"Iva","ASTERACEAE",
"Ivesia","ROSACEAE",
"Ixia","IRIDACEAE",
"Jacaranda","BIGNONIACEAE",
"Jamesia","HYDRANGEACEAE",
"Jaumea","ASTERACEAE",
"Jensia","ASTERACEAE",
"Jepsonia","SAXIFRAGACEAE",
"Johanneshowellia","POLYGONACEAE",
"Juglans","JUGLANDACEAE",
"Juncus","JUNCACEAE",
"Juniperus","CUPRESSACEAE",
"Justicia","ACANTHACEAE",
"Kallstroemia","ZYGOPHYLLACEAE",
"Kalmia","ERICACEAE",
"Keckiella","PLANTAGINACEAE",
"Kelloggia","RUBIACEAE",
"Kickxia","PLANTAGINACEAE",
"Kniphofia","ASPHODELACEAE",
"Kobresia","CYPERACEAE",
"Kochia","CHENOPODIACEAE",
"Koeberlinia","KOEBERLINIACEAE",
"Koeleria","POACEAE",
"Kopsiopsis","OROBANCHACEAE",
"Krameria","KRAMERIACEAE",
"Krascheninnikovia","CHENOPODIACEAE",
"Kyhosia","ASTERACEAE",
"Kyllinga","CYPERACEAE",
"Lactuca","ASTERACEAE",
"Ladeania","FABACEAE",
"Laennecia","ASTERACEAE",
"Lagophylla","ASTERACEAE",
"Lagunaria","MALVACEAE",
"Lagurus","POACEAE",
"Lamarckia","POACEAE",
"Lamiastrum","LAMIACEAE",
"Lamium","LAMIACEAE",
"Landoltia","ARACEAE",
"Langloisia","POLEMONIACEAE",
"Lantana","VERBENACEAE",
"Lappula","BORAGINACEAE",
"Lapsana","ASTERACEAE",
"Larrea","ZYGOPHYLLACEAE",
"Lasiospermum","ASTERACEAE",
"Lastarriaea","POLYGONACEAE",
"Lasthenia","ASTERACEAE",
"Lathrocasis","POLEMONIACEAE",
"Lathyrus","FABACEAE",
"Laurus","LAURACEAE",
"Lavatera","MALVACEAE",
"Layia","ASTERACEAE",
"Leersia","POACEAE",
"Legenere","CAMPANULACEAE",
"Lemna","ARACEAE",
"Lens","FABACEAE",
"Leontodon","ASTERACEAE",
"Lepechinia","LAMIACEAE",
"Lepidium","BRASSICACEAE",
"Lepidospartum","ASTERACEAE",
"Leptochloa","POACEAE",
"Leptosiphon","POLEMONIACEAE",
"Leptospermum","MYRTACEAE",
"Leptosyne","ASTERACEAE",
"Lessingia","ASTERACEAE",
"Leucanthemum","ASTERACEAE",
"Leucocrinum","AGAVACEAE",
"Leucojum","AMARYLLIDACEAE",
"Leucothoe","ERICACEAE",
"Lewisia","MONTIACEAE",
"Libertia","IRIDACEAE",
"Ligusticum","APIACEAE",
"Ligustrum","OLEACEAE",
"Lilaeopsis","APIACEAE",
"Lilium","LILIACEAE",
"Limnanthes","LIMNANTHACEAE",
"Limnobium","HYDROCHARITACEAE",
"Limonium","PLUMBAGINACEAE",
"Limosella","SCROPHULARIACEAE",
"Linanthus","POLEMONIACEAE",
"Linaria","PLANTAGINACEAE",
"Lindernia","PLANTAGINACEAE",
"Linnaea","LINNAEACEAE",
"Linum","LINACEAE",
"Lipocarpha","CYPERACEAE",
"Listera","ORCHIDACEAE",
"Lithophragma","SAXIFRAGACEAE",
"Lithospermum","BORAGINACEAE",
"Lobelia","CAMPANULACEAE",
"Lobularia","BRASSICACEAE",
"Loeflingia","CARYOPHYLLACEAE",
"Loeseliastrum","POLEMONIACEAE",
"Logfia","ASTERACEAE",
"Lomatium","APIACEAE",
"Lonicera","CAPRIFOLIACEAE",
"Lotus","FABACEAE",
"Ludwigia","ONAGRACEAE",
"Luetkea","ROSACEAE",
"Luina","ASTERACEAE",
"Luma","MYRTACEAE",
"Lunaria","BRASSICACEAE",
"Lupinus","FABACEAE",
"Luzula","JUNCACEAE",
"Lychnis","CARYOPHYLLACEAE",
"Lycium","SOLANACEAE",
"Lycopersicon","SOLANACEAE",
"Lycopodiella","LYCOPODIACEAE",
"Lycopodium","LYCOPODIACEAE",
"Lycopus","LAMIACEAE",
"Lyonothamnus","ROSACEAE",
"Lyrocarpa","BRASSICACEAE",
"Lysichiton","ARACEAE",
"Lysimachia","MYRSINACEAE",
"Lythrum","LYTHRACEAE",
"Machaeranthera","ASTERACEAE",
"Maclura","MORACEAE",
"Madia","ASTERACEAE",
"Maianthemum","RUSCACEAE",
"Malacothamnus","MALVACEAE",
"Malacothrix","ASTERACEAE",
"Malaxis","ORCHIDACEAE",
"Malephora","AIZOACEAE",
"Malosma","ANACARDIACEAE",
"Malperia","ASTERACEAE",
"Malus","ROSACEAE",
"Malva","MALVACEAE",
"Malvella","MALVACEAE",
"Mammillaria","CACTACEAE",
"Marah","CUCURBITACEAE",
"Marina","FABACEAE",
"Marrubium","LAMIACEAE",
"Marsilea","MARSILEACEAE",
"Matelea","APOCYNACEAE",
"Matricaria","ASTERACEAE",
"Matthiola","BRASSICACEAE",
"Maurandella","PLANTAGINACEAE",
"Mauranthemum","ASTERACEAE",
"Maytenus","CELASTRACEAE",
"Meconella","PAPAVERACEAE",
"Medicago","FABACEAE",
"Melaleuca","MYRTACEAE",
"Melia","MELIACEAE",
"Melica","POACEAE",
"Melilotus","FABACEAE",
"Melinis","POACEAE",
"Melissa","LAMIACEAE",
"Menodora","OLEACEAE",
"Mentha","LAMIACEAE",
"Mentzelia","LOASACEAE",
"Menyanthes","MENYANTHACEAE",
"Menziesia","ERICACEAE",
"Mercurialis","EUPHORBIACEAE",
"Mertensia","BORAGINACEAE",
"Mesembryanthemum","AIZOACEAE",
"Micranthes","SAXIFRAGACEAE",
"Micromonolepis","CHENOPODIACEAE",
"Micropus","ASTERACEAE",
"Microseris","ASTERACEAE",
"Microsteris","POLEMONIACEAE",
"Mimulus","PHRYMACEAE",
"Minuartia","CARYOPHYLLACEAE",
"Mirabilis","NYCTAGINACEAE",
"Mitellastra","SAXIFRAGACEAE",
"Modiola","MALVACEAE",
"Moehringia","CARYOPHYLLACEAE",
"Moenchia","CARYOPHYLLACEAE",
"Mohavea","PLANTAGINACEAE",
"Mollugo","MOLLUGINACEAE",
"Moluccella","LAMIACEAE",
"Monarda","LAMIACEAE",
"Monardella","LAMIACEAE",
"Moneses","ERICACEAE",
"Monochoria","PONTEDERIACEAE",
"Monolepis","CHENOPODIACEAE",
"Monolopia","ASTERACEAE",
"Monoptilon","ASTERACEAE",
"Monotropa","ERICACEAE",
"Montia","MONTIACEAE",
"Morella","MYRICACEAE",
"Mortonia","CELASTRACEAE",
"Morus","MORACEAE",
"Mucronea","POLYGONACEAE",
"Muehlenbeckia","POLYGONACEAE",
"Muhlenbergia","POACEAE",
"Muilla","THEMIDACEAE",
"Munroa","POACEAE",
"Munzothamnus","ASTERACEAE",
"Myoporum","SCROPHULARIACEAE",
"Myosotis","BORAGINACEAE",
"Myosurus","RANUNCULACEAE",
"Myrica","MYRICACEAE",
"Myriophyllum","HALORAGACEAE",
"Myrtus","MYRTACEAE",
"Najas","HYDROCHARITACEAE",
"Nama","BORAGINACEAE",
"Narcissus","AMARYLLIDACEAE",
"Narthecium","NARTHECIACEAE",
"Nasturtium","BRASSICACEAE",
"Navarretia","POLEMONIACEAE",
"Nemacaulis","POLYGONACEAE",
"Nemacladus","CAMPANULACEAE",
"Nemophila","BORAGINACEAE",
"Neoholmgrenia","ONAGRACEAE",
"Neostapfia","POACEAE",
"Nepeta","LAMIACEAE",
"Nerium","APOCYNACEAE",
"Nestotus","ASTERACEAE",
"Neviusia","ROSACEAE",
"Nicandra","SOLANACEAE",
"Nicolletia","ASTERACEAE",
"Nicotiana","SOLANACEAE",
"Nitrophila","AMARANTHACEAE",
"Noccaea","BRASSICACEAE",
"Nolina","RUSCACEAE",
"Nothocalais","ASTERACEAE",
"Nothochelone","PLANTAGINACEAE",
"Notholaena","PTERIDACEAE",
"Notholithocarpus","FAGACEAE",
"Nothoscordum","ALLIACEAE",
"Nuphar","NYMPHAEACEAE",
"Nuttallanthus","PLANTAGINACEAE",
"Nymphaea","NYMPHAEACEAE",
"Nymphoides","MENYANTHACEAE",
"Odontostomum","TECOPHILAEACEAE",
"Oemleria","ROSACEAE",
"Oenanthe","APIACEAE",
"Oenothera","ONAGRACEAE",
"Olea","OLEACEAE",
"Oligomeris","RESEDACEAE",
"Olneya","FABACEAE",
"Olsynium","IRIDACEAE",
"Oncosiphon","ASTERACEAE",
"Onobrychis","FABACEAE",
"Onopordum","ASTERACEAE",
"Ophioglossum","OPHIOGLOSSACEAE",
"Opuntia","CACTACEAE",
"Orcuttia","POACEAE",
"Oreonana","APIACEAE",
"Oreostemma","ASTERACEAE",
"Origanum","LAMIACEAE",
"Ornithopus","FABACEAE",
"Ornithostaphylos","ERICACEAE",
"Orobanche","OROBANCHACEAE",
"Orochaenactis","ASTERACEAE",
"Orogenia","APIACEAE",
"Orthilia","ERICACEAE",
"Orthocarpus","OROBANCHACEAE",
"Oryctes","SOLANACEAE",
"Oryza","POACEAE",
"Osmadenia","ASTERACEAE",
"Osmorhiza","APIACEAE",
"Ottelia","HYDROCHARITACEAE",
"Oxalis","OXALIDACEAE",
"Oxypolis","APIACEAE",
"Oxyria","POLYGONACEAE",
"Oxystylis","CLEOMACEAE",
"Oxytheca","POLYGONACEAE",
"Oxytropis","FABACEAE",
"Ozomelis","SAXIFRAGACEAE",
"Packera","ASTERACEAE",
"Paeonia","PAEONIACEAE",
"Palafoxia","ASTERACEAE",
"Pancratium","AMARYLLIDACEAE",
"Panicum","POACEAE",
"Papaver","PAPAVERACEAE",
"Parapholis","POACEAE",
"Parentucellia","OROBANCHACEAE",
"Parietaria","URTICACEAE",
"Parkinsonia","FABACEAE",
"Parnassia","PARNASSIACEAE",
"Paronychia","CARYOPHYLLACEAE",
"Parthenocissus","VITACEAE",
"Paspalum","POACEAE",
"Passiflora","PASSIFLORACEAE",
"Pastinaca","APIACEAE",
"Paxistima","CELASTRACEAE",
"Pectiantia","SAXIFRAGACEAE",
"Pectis","ASTERACEAE",
"Pectocarya","BORAGINACEAE",
"Pedicularis","OROBANCHACEAE",
"Pediomelum","FABACEAE",
"Peganum","NITRARIACEAE",
"Pelargonium","GERANIACEAE",
"Pellaea","PTERIDACEAE",
"Peltandra","ARACEAE",
"Pennisetum","POACEAE",
"Penstemon","PLANTAGINACEAE",
"Pentachaeta","ASTERACEAE",
"Pentagramma","PTERIDACEAE",
"Peraphyllum","ROSACEAE",
"Pericome","ASTERACEAE",
"Perideridia","APIACEAE",
"Peritoma","CLEOMACEAE",
"Perityle","ASTERACEAE",
"Persea","LAURACEAE",
"Persicaria","POLYGONACEAE",
"Petalonyx","LOASACEAE",
"Petasites","ASTERACEAE",
"Peteria","FABACEAE",
"Petradoria","ASTERACEAE",
"Petrophytum","ROSACEAE",
"Petrorhagia","CARYOPHYLLACEAE",
"Petroselinum","APIACEAE",
"Petunia","SOLANACEAE",
"Peucephyllum","ASTERACEAE",
"Phacelia","BORAGINACEAE",
"Phalacroseris","ASTERACEAE",
"Phalaris","POACEAE",
"Phaseolus","FABACEAE",
"Philadelphus","HYDRANGEACEAE",
"Phleum","POACEAE",
"Phlox","POLEMONIACEAE",
"Phoenicaulis","BRASSICACEAE",
"Phoenix","ARECACEAE",
"Pholisma","BORAGINACEAE",
"Pholistoma","BORAGINACEAE",
"Phoradendron","VISCACEAE",
"Phragmites","POACEAE",
"Phyla","VERBENACEAE",
"Phyllodoce","ERICACEAE",
"Phyllospadix","ZOSTERACEAE",
"Phyllostachys","POACEAE",
"Physalis","SOLANACEAE",
"Physaria","BRASSICACEAE",
"Physocarpus","ROSACEAE",
"Phytolacca","PHYTOLACCACEAE",
"Picea","PINACEAE",
"Pickeringia","FABACEAE",
"Pilostyles","APODANTHACEAE",
"Pilularia","MARSILEACEAE",
"Pinguicula","LENTIBULARIACEAE",
"Pinus","PINACEAE",
"Piperia","ORCHIDACEAE",
"Pistacia","ANACARDIACEAE",
"Pistia","ARACEAE",
"Pisum","FABACEAE",
"Pittosporum","PITTOSPORACEAE",
"Pityopus","ERICACEAE",
"Plagiobothrys","BORAGINACEAE",
"Planodes","BRASSICACEAE",
"Plantago","PLANTAGINACEAE",
"Platanthera","ORCHIDACEAE",
"Platanus","PLATANACEAE",
"Platystemon","PAPAVERACEAE",
"Plecostachys","ASTERACEAE",
"Plectritis","VALERIANACEAE",
"Pleiacanthus","ASTERACEAE",
"Pleuricospora","ERICACEAE",
"Pleurocoronis","ASTERACEAE",
"Pleuropogon","POACEAE",
"Pluchea","ASTERACEAE",
"Plumbago","PLUMBAGINACEAE",
"Poa","POACEAE",
"Podistera","APIACEAE",
"Pogogyne","LAMIACEAE",
"Polanisia","CLEOMACEAE",
"Polemonium","POLEMONIACEAE",
"Poliomintha","LAMIACEAE",
"Polycarpon","CARYOPHYLLACEAE",
"Polyctenium","BRASSICACEAE",
"Polygala","POLYGALACEAE",
"Polygonum","POLYGONACEAE",
"Polypodium","POLYPODIACEAE",
"Polypogon","POACEAE",
"Polystichum","DRYOPTERIDACEAE",
"Populus","SALICACEAE",
"Porophyllum","ASTERACEAE",
"Porterella","CAMPANULACEAE",
"Portulaca","PORTULACACEAE",
"Potamogeton","POTAMOGETONACEAE",
"Potentilla","ROSACEAE",
"Poteridium","ROSACEAE",
"Poterium","ROSACEAE",
"Prenanthella","ASTERACEAE",
"Primula","PRIMULACEAE",
"Proboscidea","MARTYNIACEAE",
"Prosartes","LILIACEAE",
"Prosopis","FABACEAE",
"Prunella","LAMIACEAE",
"Prunus","ROSACEAE",
"Psathyrotes","ASTERACEAE",
"Pseudobahia","ASTERACEAE",
"Pseudognaphalium","ASTERACEAE",
"Pseudorontium","PLANTAGINACEAE",
"Pseudostellaria","CARYOPHYLLACEAE",
"Pseudotrillium","MELANTHIACEAE",
"Pseudotsuga","PINACEAE",
"Psilocarphus","ASTERACEAE",
"Psilostrophe","ASTERACEAE",
"Psorothamnus","FABACEAE",
"Ptelea","RUTACEAE",
"Pteridium","DENNSTAEDTIACEAE",
"Pteris","PTERIDACEAE",
"Pterocarya","JUGLANDACEAE",
"Pterospora","ERICACEAE",
"Pterostegia","POLYGONACEAE",
"Puccinellia","POACEAE",
"Pulicaria","ASTERACEAE",
"Punica","LYTHRACEAE",
"Purshia","ROSACEAE",
"Pycnanthemum","LAMIACEAE",
"Pyracantha","ROSACEAE",
"Pyrola","ERICACEAE",
"Pyrrocoma","ASTERACEAE",
"Pyrus","ROSACEAE",
"Quercus","FAGACEAE",
"Rafinesquia","ASTERACEAE",
"Raillardella","ASTERACEAE",
"Ranunculus","RANUNCULACEAE",
"Raphanus","BRASSICACEAE",
"Rapistrum","BRASSICACEAE",
"Ratibida","ASTERACEAE",
"Reseda","RESEDACEAE",
"Rhagadiolus","ASTERACEAE",
"Rhamnus","RHAMNACEAE",
"Rhodiola","CRASSULACEAE",
"Rhododendron","ERICACEAE",
"Rhus","ANACARDIACEAE",
"Rhynchospora","CYPERACEAE",
"Ribes","GROSSULARIACEAE",
"Ricinus","EUPHORBIACEAE",
"Rigiopappus","ASTERACEAE",
"Robinia","FABACEAE",
"Romanzoffia","BORAGINACEAE",
"Romneya","PAPAVERACEAE",
"Romulea","IRIDACEAE",
"Rorippa","BRASSICACEAE",
"Rosa","ROSACEAE",
"Rotala","LYTHRACEAE",
"Rubus","ROSACEAE",
"Rudbeckia","ASTERACEAE",
"Rumex","POLYGONACEAE",
"Rupertia","FABACEAE",
"Ruppia","RUPPIACEAE",
"Ruta","RUTACEAE",
"Rytidosperma","POACEAE",
"Saccharum","POACEAE",
"Sagina","CARYOPHYLLACEAE",
"Sagittaria","ALISMATACEAE",
"Salicornia","CHENOPODIACEAE",
"Salix","SALICACEAE",
"Salpichroa","SOLANACEAE",
"Salsola","CHENOPODIACEAE",
"Saltugilia","POLEMONIACEAE",
"Salvia","LAMIACEAE",
"Salvinia","SALVINIACEAE",
"Sambucus","ADOXACEAE",
"Samolus","THEOPHRASTACEAE",
"Sanguisorba","ROSACEAE",
"Sanicula","APIACEAE",
"Santolina","ASTERACEAE",
"Sanvitalia","ASTERACEAE",
"Saponaria","CARYOPHYLLACEAE",
"Sarcobatus","SARCOBATACEAE",
"Sarcodes","ERICACEAE",
"Sarracenia","SARRACENIACEAE",
"Saussurea","ASTERACEAE",
"Saxifraga","SAXIFRAGACEAE",
"Saxifragopsis","SAXIFRAGACEAE",
"Scabiosa","DIPSACACEAE",
"Scandix","APIACEAE",
"Sceptridium","OPHIOGLOSSACEAE",
"Scheuchzeria","SCHEUCHZERIACEAE",
"Schinus","ANACARDIACEAE",
"Schismus","POACEAE",
"Schoenoplectus","CYPERACEAE",
"Schoenus","CYPERACEAE",
"Scirpus","CYPERACEAE",
"Scleranthus","CARYOPHYLLACEAE",
"Sclerocactus","CACTACEAE",
"Sclerochloa","POACEAE",
"Sclerolinon","LINACEAE",
"Scleropogon","POACEAE",
"Scoliopus","LILIACEAE",
"Scolymus","ASTERACEAE",
"Scopulophila","CARYOPHYLLACEAE",
"Scorzonera","ASTERACEAE",
"Scribneria","POACEAE",
"Scrophularia","SCROPHULARIACEAE",
"Scutellaria","LAMIACEAE",
"Searsia","ANACARDIACEAE",
"Secale","POACEAE",
"Sedella","CRASSULACEAE",
"Sedum","CRASSULACEAE",
"Selaginella","SELAGINELLACEAE",
"Senecio","ASTERACEAE",
"Senegalia","FABACEAE",
"Senna","FABACEAE",
"Sequoia","CUPRESSACEAE",
"Sequoiadendron","CUPRESSACEAE",
"Sericocarpus","ASTERACEAE",
"Sesbania","FABACEAE",
"Sesuvium","AIZOACEAE",
"Setaria","POACEAE",
"Shepherdia","ELAEAGNACEAE",
"Sherardia","RUBIACEAE",
"Sibara","BRASSICACEAE",
"Sibaropsis","BRASSICACEAE",
"Sibbaldia","ROSACEAE",
"Sida","MALVACEAE",
"Sidalcea","MALVACEAE",
"Sidotheca","POLYGONACEAE",
"Silene","CARYOPHYLLACEAE",
"Silybum","ASTERACEAE",
"Simmondsia","SIMMONDSIACEAE",
"Sinapis","BRASSICACEAE",
"Sisymbrium","BRASSICACEAE",
"Sisyrinchium","IRIDACEAE",
"Sium","APIACEAE",
"Smelowskia","BRASSICACEAE",
"Smilax","SMILACACEAE",
"Solanum","SOLANACEAE",
"Soleirolia","URTICACEAE",
"Solidago","ASTERACEAE",
"Soliva","ASTERACEAE",
"Sonchus","ASTERACEAE",
"Sorbus","ROSACEAE",
"Sorghum","POACEAE",
"Sparaxis","IRIDACEAE",
"Sparganium","TYPHACEAE",
"Spartina","POACEAE",
"Spartium","FABACEAE",
"Spergula","CARYOPHYLLACEAE",
"Spergularia","CARYOPHYLLACEAE",
"Spermolepis","APIACEAE",
"Sphaeralcea","MALVACEAE",
"Sphaeromeria","ASTERACEAE",
"Sphaerophysa","FABACEAE",
"Sphenopholis","POACEAE",
"Sphenosciadium","APIACEAE",
"Spiraea","ROSACEAE",
"Spiranthes","ORCHIDACEAE",
"Spirodela","ARACEAE",
"Sporobolus","POACEAE",
"Stachys","LAMIACEAE",
"Stanleya","BRASSICACEAE",
"Staphylea","STAPHYLEACEAE",
"Stebbinsoseris","ASTERACEAE",
"Stellaria","CARYOPHYLLACEAE",
"Stemodia","PLANTAGINACEAE",
"Stenanthium","MELANTHIACEAE",
"Stenotaphrum","POACEAE",
"Stenotus","ASTERACEAE",
"Stephanomeria","ASTERACEAE",
"Stillingia","EUPHORBIACEAE",
"Stipa","POACEAE",
"Streptanthella","BRASSICACEAE",
"Streptanthus","BRASSICACEAE",
"Streptopus","LILIACEAE",
"Strigosella","BRASSICACEAE",
"Stuckenia","POTAMOGETONACEAE",
"Stylocline","ASTERACEAE",
"Styrax","STYRACACEAE",
"Suaeda","CHENOPODIACEAE",
"Subularia","BRASSICACEAE",
"Swallenia","POACEAE",
"Swertia","GENTIANACEAE",
"Syagrus","ARECACEAE",
"Symphoricarpos","CAPRIFOLIACEAE",
"Symphyotrichum","ASTERACEAE",
"Symphytum","BORAGINACEAE",
"Synthyris","PLANTAGINACEAE",
"Syntrichopappus","ASTERACEAE",
"Systenotheca","POLYGONACEAE",
"Syzygium","MYRTACEAE",
"Tagetes","ASTERACEAE",
"Tamarix","TAMARICACEAE",
"Tanacetum","ASTERACEAE",
"Taraxacum","ASTERACEAE",
"Taraxia","ONAGRACEAE",
"Tauschia","APIACEAE",
"Taxus","TAXACEAE",
"Teesdalia","BRASSICACEAE",
"Tellima","SAXIFRAGACEAE",
"Tetracoccus","PICRODENDRACEAE",
"Tetradymia","ASTERACEAE",
"Tetragonia","AIZOACEAE",
"Tetraneuris","ASTERACEAE",
"Tetrapteron","ONAGRACEAE",
"Teucrium","LAMIACEAE",
"Thalictrum","RANUNCULACEAE",
"Thamnosma","RUTACEAE",
"Thelesperma","ASTERACEAE",
"Thelypodium","BRASSICACEAE",
"Thelypteris","THELYPTERIDACEAE",
"Thermopsis","FABACEAE",
"Thlaspi","BRASSICACEAE",
"Thuja","CUPRESSACEAE",
"Thymophylla","ASTERACEAE",
"Thysanocarpus","BRASSICACEAE",
"Tiarella","SAXIFRAGACEAE",
"Tidestromia","AMARANTHACEAE",
"Tiquilia","BORAGINACEAE",
"Tolmiea","SAXIFRAGACEAE",
"Tolpis","ASTERACEAE",
"Tonella","PLANTAGINACEAE",
"Tonestus","ASTERACEAE",
"Torilis","APIACEAE",
"Torreya","TAXACEAE",
"Torreyochloa","POACEAE",
"Townsendia","ASTERACEAE",
"Toxicodendron","ANACARDIACEAE",
"Toxicoscordion","MELANTHIACEAE",
"Tracyina","ASTERACEAE",
"Tradescantia","COMMELINACEAE",
"Tragia","EUPHORBIACEAE",
"Tragopogon","ASTERACEAE",
"Transberingia","BRASSICACEAE",
"Trautvetteria","RANUNCULACEAE",
"Triadica","EUPHORBIACEAE",
"Triantha","TOFIELDIACEAE",
"Trianthema","AIZOACEAE",
"Tribulus","ZYGOPHYLLACEAE",
"Tricardia","BORAGINACEAE",
"Trichocoronis","ASTERACEAE",
"Trichophorum","CYPERACEAE",
"Trichoptilium","ASTERACEAE",
"Trichostema","LAMIACEAE",
"Tridens","POACEAE",
"Trientalis","MYRSINACEAE",
"Trifolium","FABACEAE",
"Triglochin","JUNCAGINACEAE",
"Trillium","MELANTHIACEAE",
"Triodanis","CAMPANULACEAE",
"Triphysaria","OROBANCHACEAE",
"Tripleurospermum","ASTERACEAE",
"Tripterocalyx","NYCTAGINACEAE",
"Trisetum","POACEAE",
"Triteleia","THEMIDACEAE",
"Triticum","POACEAE",
"Trixis","ASTERACEAE",
"Tropaeolum","TROPAEOLACEAE",
"Tropidocarpum","BRASSICACEAE",
"Tsuga","PINACEAE",
"Tuberaria","CISTACEAE",
"Tuctoria","POACEAE",
"Tulipa","LILIACEAE",
"Turritis","BRASSICACEAE",
"Typha","TYPHACEAE",
"Ulex","FABACEAE",
"Ulmus","ULMACEAE",
"Umbellularia","LAURACEAE",
"Uropappus","ASTERACEAE",
"Urospermum","ASTERACEAE",
"Urtica","URTICACEAE",
"Utricularia","LENTIBULARIACEAE",
"Vaccaria","CARYOPHYLLACEAE",
"Vaccinium","ERICACEAE",
"Vachellia","FABACEAE",
"Vahlodea","POACEAE",
"Valeriana","VALERIANACEAE",
"Valerianella","VALERIANACEAE",
"Vancouveria","BERBERIDACEAE",
"Velezia","CARYOPHYLLACEAE",
"Venegasia","ASTERACEAE",
"Ventenata","POACEAE",
"Veratrum","MELANTHIACEAE",
"Verbascum","SCROPHULARIACEAE",
"Verbena","VERBENACEAE",
"Verbesina","ASTERACEAE",
"Veronica","PLANTAGINACEAE",
"Viburnum","ADOXACEAE",
"Vicia","FABACEAE",
"Viguiera","ASTERACEAE",
"Vinca","APOCYNACEAE",
"Viola","VIOLACEAE",
"Viscum","VISCACEAE",
"Vitis","VITACEAE",
"Volutaria","ASTERACEAE",
"Washingtonia","ARECACEAE",
"Watsonia","IRIDACEAE",
"Whipplea","HYDRANGEACEAE",
"Wislizenia","CLEOMACEAE",
"Wolffia","ARACEAE",
"Wolffiella","ARACEAE",
"Woodsia","WOODSIACEAE",
"Woodwardia","BLECHNACEAE",
"Wyethia","ASTERACEAE",
"Xanthisma","ASTERACEAE",
"Xanthium","ASTERACEAE",
"Xerophyllum","MELANTHIACEAE",
"Xylococcus","ERICACEAE",
"Xylorhiza","ASTERACEAE",
"Yabea","APIACEAE",
"Yucca","AGAVACEAE",
"Zannichellia","ZANNICHELLIACEAE",
"Zantedeschia","ARACEAE",
"Zeltnera","GENTIANACEAE",
"Zizania","POACEAE",
"Ziziphus","RHAMNACEAE",
"Zostera","ZOSTERACEAE",
"Zygophyllum","ZYGOPHYLLACEAE",
);
}
if($query->param('NOAUTHORS')){
	$noauts=$query->param('NOAUTHORS');
}
if($query->param('NAMELIST')){
	$NL=($query->param('NAMELIST'));
	@NL=split(/[\n\r]+/,$NL);
	@pruned_NL=grep(/^['A-Za-z. -]+$/,@NL);
	print $query->header;                    # create the HTTP header
		print <<EOP;
<html>
<head>
<title>
UCJEPS: JM II names
</title>
<link href="http://ucjeps.berkeley.edu/interchange/style_interchange.css" rel="stylesheet" type="text/css" />

<Meta Name="keywords" Content="UC Berkeley Herbarium,
Jepson Herbarium,
Jepson Manual,
plant nomenclature,
plant systematics,
California plant names,
plant names
">
		
</head>
<body>
<table bgcolor="#f0f0f0" align="left" width="100%">
<TR>
<TD>
<font size=3>
&nbsp;
&nbsp;
<strong>
<a href="/jepson_flora_project.html">Jepson&nbsp;Flora Project</a>: <a href="/interchange/index.html">Jepson Interchange</a>

</strong>
&nbsp;
&nbsp;
</font>
</td>
</tr>
</table>
<br>&nbsp;
<H2 align="center">
JEPSON MANUAL (1993) to JEPSON MANUAL, Second Edition (2012)
<br>
<a href="http://ucjeps.berkeley.edu/interchange/JMtoJMII.html">Dynamic Concordance</a>
		</h2>
<blockquote class="bodyText">
<blockquote class="bodyText">
If the name that you entered is a name that is accepted in the Second Edition, the same name (with authors, by default) will be returned.
<br>
If the name corresponds to a synonym or spelling variant in the Second Edition,
the accepted name (with authors) will be returned.  If a name is not recognized
(<em>Quercus argofolia</em> in the examples) as being in the 1993 edition,
"Not found" will be returned.
<br>
If all the consonants in a name are recognized (<em>Quercus agrofolia</em> in the examples), a guess will be attempted.
<P>
N.B.: if a name from 1993 (for example, <em>Hemizonia increscens</em>) pertains to more than one name in the Second Edition, a list of names separated by semicolons will be returned. This happens a lot for species that contain many varieties and subspecies. &middot;&middot;&middot; If you wish to use the underlying name pairs, or make bulk substitutions in a spreadsheet, <a href="http://ucjeps.berkeley.edu/interchange/93212.txt">see this perl script</a>.
</blockquote>

</blockquote>

EOP
	if(@pruned_NL){
		while(<DATA>){
next unless s/^JM[12]: //;
			chomp;
			if(($one,$two)=m/^(.*)\t(.*)/){
				$JMII{$one}=$two;
				$full=$two;
				if($noauts){
					@mults=split(/; /,$two);
foreach(@mults){
$_=&strip_name($_);
}
					$JMII{$one}=join("; ", @mults);
					$full=$JMII{$one};
				}
				($soundex= $one)=~s/[aeiou]*//g;
		$soundex=~s/[ms]$//;
				$JM_soundex{$soundex}=$full;
			}
		}
	if($fam){
		print <<EOP;
	<table cellpadding=5>
	<tr><th>Name to be checked</th><th>Name adopted in TJM (2012)</th><th>Family</th></tr>
EOP
	}
else{
	print <<EOP;
	<table cellpadding=5>
	<tr><th>Name to be checked</th><th>Name adopted in TJM (2012)</th></tr>
EOP
}
	foreach(@pruned_NL){
	s/subsp /subsp. /;
	s/ ssp\.? / subsp. /;
	s/ var\.? / var. /;
	s/ *$//;
s/  +/ /g;
s/ X / &times;/;
next if m/^ *$/;
	if($JMII{$_}){
		($sought=$_)=~s/&times;/X /;
		if($fam){
			($genus=$JMII{$_})=~s/ .*//;
			$gtf=$GTF{$genus};
			print "<tr><td>$sought </td><td> $JMII{$_}</td><td>$gtf</td></tr>\n";
		}
		else{
			print "<tr><td>$sought </td><td> $JMII{$_}</td></tr>\n";
		}
	}
	else{
		($soundex= $_)=~s/[aeiou]*//g;
		$soundex=~s/[ms]$//;
		if($JM_soundex{$soundex}){
			($sought=$_)=~s/&times;/X /;
			if($fam){
				($genus=$JM_soundex{$soundex})=~s/ .*//;
				$gtf=$GTF{$genus};
				print "<tr bgcolor=\"#f0f0f0\"><td>$sought </td><td>  may be  $JM_soundex{\"$soundex\"}</td><td>$gtf</td></tr>\n";
			}
			else{
				print "<tr bgcolor=\"#f0f0f0\"><td>$sought </td><td> may be  $JM_soundex{\"$soundex\"}</td></tr>\n";
			}
		}
		else{
			($sought=$_)=~s/&times;/X /;
			if($fam){
				print "<tr bgcolor=\"#f0f0f0\"><td>$sought </td><td> Not found</td><td></td></tr>\n";
			}
			else{
				print "<tr bgcolor=\"#f0f0f0\"><td>$sought </td><td> Not found</td></tr>\n";
			}
		}
	}
}
	print <<EOP;
	</table>
EOP
}
else{
print "I don't see that you entered any names.";
}
	}
else{
	print $query->header;                    # create the HTTP header
		print <<EOP;
		<html>
		<head>
		<title>
		UCJEPS: JM II names
		</title>
		<Meta Name="keywords" Content="UC Berkeley Herbarium,
		Jepson Herbarium,
		taxonomy of California plants,
		Jepson Manual,
		plant distribution,
		Jepson bioregions,
		plant taxonomy resources,
		plant nomenclature,
		plant systematics,
		California flora,
		California floristics,
		California plant names,
		plant names
		">
		
		</head>
		<body>
		<table bgcolor="#f0f0f0" align="left" width="100%">
		<TR>
		<TD>
		<font size=3>
		&nbsp;
		&nbsp;
		<strong>
		<a href="/jepson_flora_project.html">Jepson&nbsp;Flora Project</a>: <a href="/interchange/index.html">Jepson Interchange</a>
		
		</strong>
		&nbsp;
		&nbsp;
		</font>
		</td>
		</tr>
		</table>
		<br>&nbsp;
		<H2 align="center">
		JEPSON MANUAL (1993) to JEPSON MANUAL II
<br>
<a href="http://ucjeps.berkeley.edu/interchange/JMtoJMII.html">Dynamic Concordance</a>
		</h2>
I don't see that you entered any names.
EOP
}
sub strip_name{
local($_) = @_;
s/^([A-Z][-a-z]+) (X?[-a-z]+).*(subsp\.|ssp\.|var\.|f\.) ([-a-z]+).*/$1 $2 $3 $4/ ||
s/^([A-Z][a-z]+) ([-a-z]+).*/$1 $2/ ||
s/^([A-Z][a-z]+) &times;([-a-z]+).*/$1 &times;$2/;
s/ssp\./subsp./;
return ($_);
}

__END__
JM1: Abies amabilis	Abies amabilis J. Forbes
JM1: Abies bracteata	Abies bracteata (D. Don) A. Poit.
JM1: Abies concolor	Abies concolor (Gordon & Glend.) Hildebr.
JM1: Abies grandis	Abies grandis (D. Don) Lindl.
JM2: Abies lasiocarpa	Abies lasiocarpa (Hook.) Nutt.
JM1: Abies lasiocarpa var. lasiocarpa	Abies lasiocarpa (Hook.) Nutt. var. lasiocarpa
JMS: Abies lowiana	Abies concolor (Gordon & Glend.) Hildebr.
JM1: Abies magnifica	Abies magnifica A. Murray bis
JM1: Abies magnifica var. magnifica	Abies magnifica A. Murray bis var. magnifica
JM1: Abies magnifica var. shastensis	Abies magnifica var. shastensis Lemmon
JM1: Abies procera	Abies procera Rehder
JM1: Abronia alpina	Abronia alpina Brandegee
JM1: Abronia gracilis	excluded (misidentification)
JM1: Abronia latifolia	Abronia latifolia Eschsch.
JM1: Abronia maritima	Abronia maritima S. Watson
JM2: Abronia nana	Abronia nana S. Watson
JM1: Abronia nana subsp. covillei	Abronia nana S. Watson var. covillei (Heimerl) Munz
JM2: Abronia nana var. covillei	Abronia nana S. Watson var. covillei (Heimerl) Munz
JM1: Abronia pogonantha	Abronia pogonantha Heimerl
JM1: Abronia turbinata	Abronia turbinata S. Watson
JM1: Abronia umbellata	Abronia umbellata Lam.
JMS: Abronia umbellata subsp. alba	Abronia umbellata Lam.
JM1: Abronia umbellata subsp. breviflora	Abronia umbellata var. breviflora (Standl.) L.A. Galloway
JMS: Abronia umbellata subsp. platyphylla	Abronia umbellata Lam.
JM1: Abronia umbellata subsp. umbellata	Abronia umbellata Lam. var. umbellata
JMS: Abronia umbellata subsp. variabilis	Abronia umbellata Lam.
JM2: Abronia umbellata var. breviflora	Abronia umbellata var. breviflora (Standl.) L.A. Galloway
JM2: Abronia umbellata var. umbellata	Abronia umbellata Lam. var. umbellata
JM1: Abronia villosa	Abronia villosa S. Watson
JM1: Abronia villosa var. aurita	Abronia villosa var. aurita (Abrams) Jeps.
JM1: Abronia villosa var. villosa	Abronia villosa S. Watson var. villosa
JM1: Abutilon palmeri	Abutilon palmeri A. Gray
JM1: Abutilon parvulum	Abutilon parvulum A. Gray
JM1: Abutilon theophrasti	Abutilon theophrasti Medik.
JMS: Acacia armata	Acacia paradoxa DC.
JM1: Acacia baileyana	Acacia baileyana F. Muell.
JM1: Acacia cyclops	Acacia cyclops G. Don
JM1: Acacia dealbata	Acacia dealbata Link
JM2: Acacia decurrens	Acacia decurrens Willd.
JMS: Acacia decurrens var. dealbata	Acacia dealbata Link
JM1: Acacia elata	excluded
JMS: Acacia farnesiana	Vachellia farnesiana (L.) Wight & Arn.
JMS: Acacia farnesiana subsp. minuta	Vachellia farnesiana var. minuta (M.E. Jones) Seigler & Ebinger
JM1: Acacia farnesiana var. farnesiana	Vachellia farnesiana (L.) Wight & Arn. var. farnesiana
JM1: Acacia greggii	Senegalia greggii (A. Gray) Britton & Rose
JM1: Acacia longifolia	Acacia longifolia (Andrews) Willd.
JM2: Acacia mearnsii	Acacia mearnsii De Wild.
JM1: Acacia melanoxylon	Acacia melanoxylon R. Br.
JMS: Acacia minuta	Vachellia farnesiana var. minuta (M.E. Jones) Seigler & Ebinger
JM1: Acacia paradoxa	Acacia paradoxa DC.
JM2: Acacia podalyriifolia	Acacia podalyriifolia G. Don
JM1: Acacia pycnantha	Acacia pycnantha Benth.
JM2: Acacia redolens	Acacia redolens Maslin
JM1: Acacia retinodes	Acacia retinodes Schltdl.
JM2: Acacia saligna	Acacia saligna (Labill.) H.L. Wendl.
JM1: Acacia verticillata	Acacia verticillata (L'H&eacute;r.) Willd.
JMS: Acaena anserinifolia	Acaena novae-zelandiae Kirk
JM1: Acaena novae-zelandiae	Acaena novae-zelandiae Kirk
JM2: Acaena pallida	Acaena pallida (Kirk) Allan
JM2: Acaena pinnatifida	Acaena pinnatifida Ruiz & Pav.
JM1: Acaena pinnatifida var. californica	Acaena pinnatifida Ruiz & Pav. var. californica (Bitter) Jeps.
JM1: Acalypha californica	Acalypha californica Benth.
JM1: Acamptopappus shockleyi	Acamptopappus shockleyi A. Gray
JM1: Acamptopappus sphaerocephalus	Acamptopappus sphaerocephalus (Harv. & A. Gray) A. Gray
JM1: Acamptopappus sphaerocephalus var. hirtellus	Acamptopappus sphaerocephalus var. hirtellus S.F. Blake
JM1: Acamptopappus sphaerocephalus var. sphaerocephalus	Acamptopappus sphaerocephalus (Harv. & A. Gray) A. Gray var. sphaerocephalus
JM1: Acanthomintha duttonii	Acanthomintha duttonii (Abrams) Jokerst
JM1: Acanthomintha ilicifolia	Acanthomintha ilicifolia (A. Gray) A. Gray
JM1: Acanthomintha lanceolata	Acanthomintha lanceolata Curran
JM1: Acanthomintha obovata	Acanthomintha obovata Jeps.; Acanthomintha duttonii (Abrams) Jokerst
JM1: Acanthomintha obovata subsp. cordata	Acanthomintha obovata subsp. cordata Jokerst
JMS: Acanthomintha obovata subsp. duttonii	Acanthomintha duttonii (Abrams) Jokerst
JM1: Acanthomintha obovata subsp. obovata	Acanthomintha obovata Jeps. subsp. obovata
JM2: Acanthoscyphus parishii	Acanthoscyphus parishii (Parry) Small
JM2: Acanthoscyphus parishii var. abramsii	Acanthoscyphus parishii var. abramsii (E.A. McGregor) Reveal
JM2: Acanthoscyphus parishii var. cienegensis	Acanthoscyphus parishii var. cienegensis (Ertter) Reveal
JM2: Acanthoscyphus parishii var. goodmaniana	Acanthoscyphus parishii var. goodmaniana (Ertter) Reveal
JM2: Acer campestre	Acer campestre L.
JM1: Acer circinatum	Acer circinatum Pursh
JM1: Acer glabrum	Acer glabrum Torr.
JM1: Acer glabrum var. diffusum	Acer glabrum var. diffusum (Greene) Smiley
JM2: Acer glabrum var. glabrum	Acer glabrum Torr. var. glabrum
JM1: Acer glabrum var. greenei	Acer glabrum Torr. var. glabrum
JM1: Acer glabrum var. torreyi	Acer glabrum Torr. var. glabrum
JM1: Acer macrophyllum	Acer macrophyllum Pursh
JM2: Acer negundo	Acer negundo L.
JMS: Acer negundo var. arizonicum	Acer negundo L.
JM1: Acer negundo var. californicum	Acer negundo L.
JMS: Acer negundo var. interius	Acer negundo L.
JM2: Acer saccharinum	Acer saccharinum L.
JM1: Achillea millefolium	Achillea millefolium L.
JM1: Achlys californica	Achlys californica I. Fukuda & H.G. Baker
JM2: Achlys triphylla	Achlys triphylla (Sm.) DC.
JM1: Achlys triphylla subsp. triphylla	Achlys triphylla (Sm.) DC. subsp. triphylla
JM1: Achnatherum aridum	Stipa arida M.E. Jones
JM1: Achnatherum brachychaetum	Stipa brachychaeta Godr.
JM1: Achnatherum coronatum	Stipa coronata Thurb.
JM1: Achnatherum diegoense	Stipa diegoensis Swallen
JM1: Achnatherum hymenoides	Stipa hymenoides Roem. & Schult.
JM1: Achnatherum latiglume	Stipa latiglumis Swallen
JM1: Achnatherum lemmonii	Stipa lemmonii (Vasey) Scribn.
JM1: Achnatherum lemmonii subsp. lemmonii	Stipa lemmonii (Vasey) Scribn. var. lemmonii
JMS: Achnatherum lemmonii subsp. pubescens	Stipa lemmonii var. pubescens Crampton
JM1: Achnatherum lettermanii	Stipa lettermanii Vasey
JMS: Achnatherum nelsonii	Stipa nelsonii Scribn.
JM1: Achnatherum nelsonii subsp. dorei	Stipa nelsonii Scribn. var. dorei (Barkworth & J.R. Maze) Dorn
JM1: Achnatherum nevadense	Stipa nevadensis B.L. Johnson
JM1: Achnatherum occidentale	Stipa occidentalis S. Watson
JM1: Achnatherum occidentale subsp. californicum	Stipa occidentalis var. californica (Merr. & Burtt Davy) C.L. Hitchc.
JM1: Achnatherum occidentale subsp. occidentale	Stipa occidentalis S. Watson var. occidentalis
JM1: Achnatherum occidentale subsp. pubescens	Stipa occidentalis var. pubescens (Vasey) J.R. Maze et al.
JM1: Achnatherum parishii	Stipa parishii Vasey var. parishii
JMS: Achnatherum parishii subsp. parishii	Stipa parishii Vasey var. parishii
JMS: Achnatherum parishii var. parishii	Stipa parishii Vasey var. parishii
JM1: Achnatherum pinetorum	Stipa pinetorum M.E. Jones
JM1: Achnatherum speciosum	Stipa speciosa Trin. & Rupr.
JM1: Achnatherum stillmanii	Stipa stillmanii Bol.
JM1: Achnatherum thurberianum	Stipa thurberiana Piper
JM1: Achnatherum webberi	Stipa webberi (Thurb.) B.L. Johnson
JM1: Achrachne racemosa	excluded
JM1: Achyrachaena mollis	Achyrachaena mollis Schauer
JMS: Achyranthes lanuginosa	Tidestromia lanuginosa (Nutt.) Standl.
JM1: Achyronychia cooperi	Achyronychia cooperi Torr. & A. Gray
JM1: Acleisanthes longiflora	Acleisanthes longiflora A. Gray
JM2: Acleisanthes nevadensis	Acleisanthes nevadensis (Standl.) B.L. Turner
JM2: Acmispon americanus	Acmispon americanus (Nutt.) Rydb.
JM2: Acmispon americanus var. americanus	Acmispon americanus (Nutt.) Rydb. var. americanus
JM2: Acmispon argophyllus	Acmispon argophyllus (A. Gray) Brouillet
JM2: Acmispon argophyllus var. adsurgens	Acmispon argophyllus var. adsurgens (Dunkle) Brouillet
JM2: Acmispon argophyllus var. argenteus	Acmispon argophyllus var. argenteus (Dunkle) Brouillet
JM2: Acmispon argophyllus var. argophyllus	Acmispon argophyllus (A. Gray) Brouillet var. argophyllus
JM2: Acmispon argophyllus var. fremontii	Acmispon argophyllus var. fremontii (A. Gray) Brouillet
JM2: Acmispon argophyllus var. niveus	Acmispon argophyllus var. niveus (Greene) Brouillet
JM2: Acmispon argyraeus	Acmispon argyraeus (Greene) Brouillet
JM2: Acmispon argyraeus var. argyraeus	Acmispon argyraeus (Greene) Brouillet var. argyraeus
JM2: Acmispon argyraeus var. multicaulis	Acmispon argyraeus var. multicaulis (Ottley) Brouillet
JM2: Acmispon argyraeus var. notitius	Acmispon argyraeus var. notitius (Isely) Brouillet
JM2: Acmispon brachycarpus	Acmispon brachycarpus (Benth.) D.D. Sokoloff
JM2: Acmispon cytisoides	Acmispon cytisoides (Benth.) Brouillet
JM2: Acmispon dendroideus	Acmispon dendroideus (Greene) Brouillet
JM2: Acmispon dendroideus var. dendroideus	Acmispon dendroideus (Greene) Brouillet var. dendroideus
JM2: Acmispon dendroideus var. traskiae	Acmispon dendroideus var. traskiae (Abrams) Brouillet
JM2: Acmispon dendroideus var. veatchii	Acmispon dendroideus var. veatchii (Greene) Brouillet
JM2: Acmispon denticulatus	Acmispon denticulatus (Drew) D.D. Sokoloff
JM2: Acmispon glaber	Acmispon glaber (Vogel) Brouillet
JM2: Acmispon glaber var. brevialatus	Acmispon glaber var. brevialatus (Ottley) Brouillet
JM2: Acmispon glaber var. glaber	Acmispon glaber (Vogel) Brouillet var. glaber
JM2: Acmispon grandiflorus	Acmispon grandiflorus (Benth.) Brouillet
JM2: Acmispon grandiflorus var. grandiflorus	Acmispon grandiflorus (Benth.) Brouillet var. grandiflorus
JM2: Acmispon grandiflorus var. macranthus	Acmispon grandiflorus var. macranthus (Greene) Brouillet
JM2: Acmispon haydonii	Acmispon haydonii (Orcutt) Brouillet
JM2: Acmispon heermannii	Acmispon heermannii (Durand & Hilg.) Brouillet
JM2: Acmispon heermannii var. heermannii	Acmispon heermannii (Durand & Hilg.) Brouillet var. heermannii
JM2: Acmispon heermannii var. orbicularis	Acmispon heermannii var. orbicularis (A. Gray) Brouillet
JM2: Acmispon junceus	Acmispon junceus (Benth.) Brouillet
JM2: Acmispon junceus var. biolettii	Acmispon junceus var. biolettii (Greene) Brouillet
JM2: Acmispon junceus var. junceus	Acmispon junceus (Benth.) Brouillet var. junceus
JM2: Acmispon maritimus	Acmispon maritimus (Nutt.) D.D. Sokoloff
JM2: Acmispon maritimus var. brevivexillus	Acmispon maritimus var. brevivexillus (Ottley) Brouillet
JM2: Acmispon maritimus var. maritimus	Acmispon maritimus (Nutt.) D.D. Sokoloff var. maritimus
JM2: Acmispon micranthus	Acmispon micranthus (Torr. & A. Gray) Brouillet
JM2: Acmispon nevadensis	Acmispon nevadensis (S. Watson) Brouillet
JM2: Acmispon nevadensis var. davidsonii	Acmispon nevadensis var. davidsonii (Greene) Brouillet
JM2: Acmispon nevadensis var. nevadensis	Acmispon nevadensis (S. Watson) Brouillet var. nevadensis
JM2: Acmispon parviflorus	Acmispon parviflorus (Benth.) D.D. Sokoloff
JM2: Acmispon procumbens	Acmispon procumbens (Greene) Brouillet
JM2: Acmispon procumbens var. jepsonii	Acmispon procumbens var. jepsonii (Ottley) Brouillet
JM2: Acmispon procumbens var. procumbens	Acmispon procumbens (Greene) Brouillet var. procumbens
JM2: Acmispon prostratus	Acmispon prostratus (Torr. & A. Gray) Brouillet
JM2: Acmispon rigidus	Acmispon rigidus (Benth.) Brouillet
JM2: Acmispon rubriflorus	Acmispon rubriflorus (H. Sharsm.) D.D. Sokoloff
JM2: Acmispon strigosus	Acmispon strigosus (Nutt.) Brouillet
JM2: Acmispon wrangelianus	Acmispon wrangelianus (Fisch. & C.A. Mey.) D.D. Sokoloff
JM1: Aconitum columbianum	Aconitum columbianum Nutt.
JM2: Aconitum columbianum subsp. columbianum	Aconitum columbianum Nutt. subsp. columbianum
JM2: Aconitum columbianum subsp. viviparum	Aconitum columbianum subsp. viviparum (Greene) Brink
JM2: Aconogonon davisiae	Aconogonon davisiae (A. Gray) Soj&aacute;k
JMS: Aconogonon davisiae var. glabrum	Aconogonon davisiae (A. Gray) Soj&aacute;k
JM2: Aconogonon newberryi	Aconogonon newberryi (Small) Soj&aacute;k
JM2: Aconogonon phytolaccifolium	Aconogonon phytolaccifolium (Small) Rydb.
JMS: Aconogonon phytolaccifolium var. glabrum	Aconogonon phytolaccifolium (Small) Rydb.
JM1: Acorus calamus	excluded (historical waif)
JM1: Acourtia microcephala	Acourtia microcephala DC.
JM1: Acroptilon repens	Acroptilon repens (L.) DC.
JM1: Actaea rubra	Actaea rubra (Aiton) Willd.
JM1: Adenocaulon bicolor	Adenocaulon bicolor Hook.
JM1: Adenophyllum cooperi	Adenophyllum cooperi (A. Gray) Strother
JM1: Adenophyllum porophylloides	Adenophyllum porophylloides (A. Gray) Strother
JM1: Adenostoma fasciculatum	Adenostoma fasciculatum Hook. & Arn.
JM2: Adenostoma fasciculatum var. fasciculatum	Adenostoma fasciculatum Hook. & Arn. var. fasciculatum
JM2: Adenostoma fasciculatum var. obtusifolium	Adenostoma fasciculatum var. obtusifolium S. Watson
JM2: Adenostoma fasciculatum var. prostratum	Adenostoma fasciculatum var. prostratum Dunkle
JM1: Adenostoma sparsifolium	Adenostoma sparsifolium Torr.
JM1: Adiantum aleuticum	Adiantum aleuticum (Rupr.) C.A. Paris
JM1: Adiantum capillus-veneris	Adiantum capillus-veneris L.
JM1: Adiantum jordanii	Adiantum jordanii M&uuml;ll. Hal.
JM1: Adolphia californica	Adolphia californica S. Watson
JM1: Adonis aestivalis	Adonis aestivalis L.
JM1: Aegilops cylindrica	Aegilops cylindrica Host
JM2: Aegilops geniculata	Aegilops geniculata Roth
JM2: Aegilops neglecta	Aegilops neglecta Bertol.
JM1: Aegilops ovata	Aegilops geniculata Roth
JMS: Aegilops triaristata	Aegilops neglecta Bertol.
JM1: Aegilops triuncialis	Aegilops triuncialis L.
JM2: Aeonium arboreum	Aeonium arboreum (L.) Webb & Berthel.
JM1: Aeonium arboreum var. arboreum	Aeonium arboreum (L.) Webb & Berthel. var. arboreum
JM1: Aeonium haworthii	Aeonium haworthii Webb & Berthel.
JM1: Aeschynomene rudis	Aeschynomene rudis Benth.
JM1: Aesculus californica	Aesculus californica (Spach) Nutt.
JMS: Agastache glaucifolia	Agastache urticifolia (Benth.) Kuntze
JM1: Agastache parvifolia	Agastache parvifolia Eastw.
JM1: Agastache urticifolia	Agastache urticifolia (Benth.) Kuntze
JM1: Agave deserti	Agave deserti Engelm.
JMS: Agave deserti subsp. simplex	Agave deserti var. simplex (Gentry) W.C. Hodgs. & Reveal
JM2: Agave deserti var. deserti	Agave deserti Engelm. var. deserti
JM2: Agave deserti var. simplex	Agave deserti var. simplex (Gentry) W.C. Hodgs. & Reveal
JM1: Agave shawii	Agave shawii Engelm.
JM2: Agave shawii var. shawii	Agave shawii Engelm. var. shawii
JM1: Agave utahensis	Agave utahensis Engelm.
JM2: Agave utahensis var. eborispina	Agave utahensis var. eborispina (Hester) Breitung
JM2: Agave utahensis var. nevadensis	Agave utahensis var. nevadensis Greenm. & Roush
JM1: Ageratina adenophora	Ageratina adenophora (Spreng.) R.M. King & H. Rob.
JM1: Ageratina herbacea	Ageratina herbacea (A. Gray) R.M. King & H. Rob.
JM1: Ageratina occidentalis	Ageratina occidentalis (Hook.) R.M. King & H. Rob.
JM1: Ageratina shastensis	Ageratina shastensis (D.W. Taylor & Stebbins) R.M. King & H. Rob.
JMS: Agnorhiza bolanderi	Wyethia bolanderi (A. Gray) W.A. Weber
JMS: Agnorhiza elata	Wyethia elata H.M. Hall
JMS: Agnorhiza invenusta	Wyethia invenusta (Greene) W.A. Weber
JMS: Agnorhiza ovata	Wyethia ovata Torr. & A. Gray
JMS: Agnorhiza reticulata	Wyethia reticulata Greene
JM2: Agoseris &times;dasycarpa	Agoseris &times;dasycarpa Greene
JM2: Agoseris &times;elata	Agoseris &times;elata (Nutt.) Greene
JM1: Agoseris apargioides	Agoseris apargioides (Less.) Greene
JMS: Agoseris apargioides subsp. maritima	Agoseris apargioides var. maritima (E. Sheld.) G.I. Baird
JM1: Agoseris apargioides var. apargioides	Agoseris apargioides (Less.) Greene var. apargioides
JM1: Agoseris apargioides var. eastwoodiae	Agoseris apargioides var. eastwoodiae (Fedde) Munz
JM2: Agoseris apargioides var. maritima	Agoseris apargioides var. maritima (E. Sheld.) G.I. Baird
JM1: Agoseris aurantiaca	Agoseris aurantiaca (Hook.) Greene
JM2: Agoseris aurantiaca var. aurantiaca	Agoseris aurantiaca (Hook.) Greene var. aurantiaca
JMS: Agoseris californica	Agoseris heterophylla var. cryptopleura Greene
JMS: Agoseris cinerea	Agoseris grandiflora (Nutt.) Greene var. grandiflora
JMS: Agoseris decumbens	Agoseris &times;dasycarpa Greene
JMS: Agoseris eastwoodiae	Agoseris apargioides var. eastwoodiae (Fedde) Munz
JM1: Agoseris elata	Agoseris &times;elata (Nutt.) Greene
JM1: Agoseris glauca	Agoseris glauca (Pursh) Raf.; Agoseris monticola Greene; Agoseris parviflora (Nutt.) D. Dietr.
JMS: Agoseris glauca var. dasycephala	Agoseris monticola Greene
JM1: Agoseris glauca var. glauca	Agoseris glauca (Pursh) Raf. var. glauca
JM1: Agoseris glauca var. laciniata	Agoseris parviflora (Nutt.) D. Dietr.
JM1: Agoseris glauca var. monticola	Agoseris monticola Greene
JMS: Agoseris gracilens	Agoseris aurantiaca (Hook.) Greene var. aurantiaca
JM1: Agoseris grandiflora	Agoseris grandiflora (Nutt.) Greene; Agoseris &times;elata (Nutt.) Greene
JM2: Agoseris grandiflora var. grandiflora	Agoseris grandiflora (Nutt.) Greene var. grandiflora
JMS: Agoseris grandiflora var. laciniata	Agoseris &times;elata (Nutt.) Greene
JM2: Agoseris grandiflora var. leptophylla	Agoseris grandiflora var. leptophylla G.I. Baird
JMS: Agoseris greenei	Agoseris aurantiaca (Hook.) Greene var. aurantiaca
JM1: Agoseris heterophylla	Agoseris heterophylla (Nutt.) Greene
JMS: Agoseris heterophylla var. californica	Agoseris heterophylla var. cryptopleura Greene
JMS: Agoseris heterophylla var. crenulata	Agoseris heterophylla var. cryptopleura Greene
JM2: Agoseris heterophylla var. cryptopleura	Agoseris heterophylla var. cryptopleura Greene
JM2: Agoseris heterophylla var. heterophylla	Agoseris heterophylla (Nutt.) Greene var. heterophylla
JMS: Agoseris heterophylla var. turgida	Agoseris heterophylla var. cryptopleura Greene
JM2: Agoseris hirsuta	Agoseris hirsuta (Hook.) Greene
JMS: Agoseris intermedia	Agoseris grandiflora (Nutt.) Greene var. grandiflora
JMS: Agoseris laciniata	Agoseris &times;elata (Nutt.) Greene
JMS: Agoseris lackschewitzii	Agoseris aurantiaca (Hook.) Greene var. aurantiaca
JMS: Agoseris longula	Agoseris glauca (Pursh) Raf. var. glauca
JMS: Agoseris major	Agoseris heterophylla var. cryptopleura Greene
JMS: Agoseris maritima	Agoseris apargioides var. eastwoodiae (Fedde) Munz; Agoseris apargioides var. maritima (E. Sheld.) G.I. Baird
JMS: Agoseris marshallii	Agoseris grandiflora (Nutt.) Greene var. grandiflora
JM2: Agoseris monticola	Agoseris monticola Greene
JMS: Agoseris obtusifolia	Agoseris grandiflora (Nutt.) Greene var. grandiflora
JM2: Agoseris parviflora	Agoseris parviflora (Nutt.) D. Dietr.
JMS: Agoseris plebeia	Agoseris grandiflora (Nutt.) Greene var. grandiflora
JM1: Agoseris retrorsa	Agoseris retrorsa (Benth.) Greene
JMS: Agoseris tenuifolia	Agoseris &times;elata (Nutt.) Greene
JM1: Agrimonia gryposepala	Agrimonia gryposepala Wallr.
JM2: Agrimonia striata	Agrimonia striata Michx.
JM2: Agropyron cristatum	Agropyron cristatum (L.) Gaertn.
JMS: Agropyron cristatum subsp. desertorum	Agropyron cristatum (L.) Gaertn. subsp. pectinatum (M. Bieb.) Tzvelev
JM2: Agropyron cristatum subsp. pectinatum	Agropyron cristatum (L.) Gaertn. subsp. pectinatum (M. Bieb.) Tzvelev
JMS: Agropyron dasystachyum	Elymus lanceolatus (Scribn. & J.G. Sm.) Gould subsp. lanceolatus
JM1: Agropyron desertorum	Agropyron cristatum (L.) Gaertn. subsp. pectinatum (M. Bieb.) Tzvelev
JMS: Agropyron elongatum	Elymus ponticus (Podp.) N. Snow
JMS: Agropyron intermedium	Elymus hispidus (Opiz) Melderis
JMS: Agropyron parishii	Elymus stebbinsii Gould
JMS: Agropyron pringlei	Elymus sierrae Gould
JMS: Agropyron repens	Elymus repens (L.) Gould
JMS: Agropyron riparium	Elymus lanceolatus (Scribn. & J.G. Sm.) Gould subsp. lanceolatus
JMS: Agropyron saxicola	Elymus spicatus (Pursh) Gould
JMS: Agropyron scribneri	Elymus scribneri (Vasey) M.E. Jones
JMS: Agropyron smithii	Elymus smithii (Rydb.) Gould
JMS: Agropyron spicatum	Elymus spicatus (Pursh) Gould
JMS: Agropyron trichophorum	Elymus hispidus (Opiz) Melderis
JM1: Agrostemma githago	Agrostemma githago L.
JM2: Agrostemma githago var. githago	Agrostemma githago L. var. githago
JMS: Agrostis alba	Agrostis gigantea Roth
JMS: Agrostis alba var. alba	Agrostis stolonifera L.
JMS: Agrostis alba var. palustris	Agrostis stolonifera L.
JMS: Agrostis ampla	Agrostis exarata Trin.
JMS: Agrostis aristiglumis	Agrostis microphylla Steud.
JM1: Agrostis avenacea	Agrostis avenacea J.F. Gmel.
JM1: Agrostis blasdalei	Agrostis blasdalei Hitchc.
JMS: Agrostis blasdalei var. marinensis	Agrostis blasdalei Hitchc.
JMS: Agrostis californica	Agrostis densiflora Vasey
JM1: Agrostis capillaris	Agrostis capillaris L.
JMS: Agrostis clivicola	Agrostis densiflora Vasey
JMS: Agrostis clivicola var. punta-reyesensis	Agrostis densiflora Vasey
JM1: Agrostis densiflora	Agrostis densiflora Vasey
JMS: Agrostis diegoensis	Agrostis pallens Trin.
JM1: Agrostis elliottiana	Agrostis elliottiana Schult.
JM1: Agrostis exarata	Agrostis exarata Trin.
JMS: Agrostis exarata var. monolepis	Agrostis exarata Trin.
JMS: Agrostis exigua	Agrostis elliottiana Schult.
JMS: Agrostis filiformis	Agrostis avenacea J.F. Gmel.
JM1: Agrostis gigantea	Agrostis gigantea Roth
JM1: Agrostis hallii	Agrostis hallii Vasey
JM1: Agrostis hendersonii	Agrostis hendersonii Hitchc.
JM1: Agrostis hooveri	Agrostis hooveri Swallen
JM1: Agrostis humilis	Agrostis humilis Vasey
JM1: Agrostis idahoensis	Agrostis idahoensis Nash
JMS: Agrostis kennedyana	Agrostis tandilensis (Kuntze) Parodi
JMS: Agrostis lepida	Agrostis pallens Trin.
JMS: Agrostis longiligula	Agrostis exarata Trin.
JMS: Agrostis longiligula var. australis	Agrostis exarata Trin.
JM1: Agrostis microphylla	Agrostis microphylla Steud.; Agrostis hendersonii Hitchc.
JMS: Agrostis microphylla var. hendersonii	Agrostis hendersonii Hitchc.
JMS: Agrostis microphylla var. intermedia	Agrostis microphylla Steud.
JM1: Agrostis oregonensis	Agrostis oregonensis Vasey
JM1: Agrostis pallens	Agrostis pallens Trin.
JM1: Agrostis scabra	Agrostis scabra Willd.
JMS: Agrostis scabra var. geminata	Agrostis scabra Willd.
JM1: Agrostis semiverticillata	Polypogon viridis (Gouan) Breistr.
JM1: Agrostis stolonifera	Agrostis stolonifera L.
JM1: Agrostis tandilensis	Agrostis tandilensis (Kuntze) Parodi
JMS: Agrostis tenuis	Agrostis capillaris L.; Agrostis idahoensis Nash
JM1: Agrostis thurberiana	Agrostis humilis Vasey
JM1: Agrostis variabilis	Agrostis variabilis Rydb.
JMS: Agrostis viridis	Polypogon viridis (Gouan) Breistr.
JM1: Ailanthus altissima	Ailanthus altissima (Mill.) Swingle
JM1: Aira caryophyllea	Aira caryophyllea L.
JM2: Aira elegans	Aira elegans Roem. & Schult.
JM1: Aira elegantissima	Aira elegans Roem. & Schult.
JM1: Aira praecox	Aira praecox L.
JM2: Albizia julibrissin	Albizia julibrissin Durazz.
JM1: Albizia lophantha	Albizia lophantha (Willd.) Benth.
JM1: Alcea rosea	Alcea rosea L.
JM2: Alhagi maurorum	Alhagi maurorum Medik.
JM1: Alhagi pseudalhagi	Alhagi maurorum Medik.
JM2: Aliciella humillima	Aliciella humillima (Brand) J.M. Porter
JM2: Aliciella hutchinsifolia	Aliciella hutchinsifolia (Rydb.) J.M. Porter
JM2: Aliciella latifolia	Aliciella latifolia (S. Watson) J.M. Porter
JM2: Aliciella latifolia subsp. latifolia	Aliciella latifolia (S. Watson) J.M. Porter subsp. latifolia
JM2: Aliciella leptomeria	Aliciella leptomeria (A. Gray) J.M. Porter
JM2: Aliciella lottiae	Aliciella lottiae (A.G. Day) J.M. Porter
JM2: Aliciella micromeria	Aliciella micromeria (A. Gray) J.M. Porter
JM2: Aliciella monoensis	Aliciella monoensis J.M. Porter
JM2: Aliciella ripleyi	Aliciella ripleyi (Barneby) J.M. Porter
JMS: Aliciella subacaulis	Aliciella monoensis J.M. Porter
JM2: Aliciella triodon	Aliciella triodon (Eastw.) Brand
JMS: Alisma geyeri	Alisma gramineum Lej.
JM1: Alisma gramineum	Alisma gramineum Lej.
JM1: Alisma lanceolatum	Alisma lanceolatum With.
JM1: Alisma plantago-aquatica	Alisma triviale Pursh
JMS: Alisma subcordatum	Alisma triviale Pursh
JM2: Alisma triviale	Alisma triviale Pursh
JM1: Allenrolfea occidentalis	Allenrolfea occidentalis (S. Watson) Kuntze
JM1: Allionia incarnata	Allionia incarnata L.
JM2: Allionia incarnata var. incarnata	Allionia incarnata L. var. incarnata
JMS: Allionia incarnata var. nudata	Allionia incarnata L. var. incarnata
JM2: Allionia incarnata var. villosa	Allionia incarnata var. villosa (Standl.) Munz
JM1: Allium abramsii	Allium abramsii (Traub) McNeal
JM1: Allium acuminatum	Allium acuminatum Hook.
JM1: Allium amplectens	Allium amplectens Torr.
JM1: Allium anceps	Allium anceps Kellogg
JM1: Allium atrorubens	Allium atrorubens S. Watson
JM1: Allium atrorubens var. atrorubens	Allium atrorubens S. Watson var. atrorubens
JM1: Allium atrorubens var. cristatum	Allium atrorubens var. cristatum (S. Watson) McNeal
JM2: Allium bisceptrum	Allium bisceptrum S. Watson
JM1: Allium bisceptrum var. bisceptrum	Allium bisceptrum S. Watson
JM1: Allium bolanderi	Allium bolanderi S. Watson
JM1: Allium bolanderi var. bolanderi	Allium bolanderi S. Watson var. bolanderi
JM1: Allium bolanderi var. mirabile	Allium bolanderi var. mirabile (L.F. Hend.) McNeal
JM1: Allium burlewii	Allium burlewii Davidson
JM1: Allium campanulatum	Allium campanulatum S. Watson
JM2: Allium cepa	Allium cepa L.
JM1: Allium cratericola	Allium cratericola Eastw.
JM1: Allium crispum	Allium crispum Greene
JMS: Allium croceum	Bloomeria crocea (Torr.) Coville
JM1: Allium denticulatum	Allium denticulatum (Traub) McNeal
JM1: Allium diabloense	Allium diabolense (Traub) McNeal
JM2: Allium diabolense	Allium diabolense (Traub) McNeal
JM1: Allium dichlamydeum	Allium dichlamydeum Greene
JM1: Allium falcifolium	Allium falcifolium Hook. & Arn.
JM1: Allium fimbriatum	Allium fimbriatum S. Watson; Allium parryi S. Watson
JMS: Allium fimbriatum subsp. parryi	Allium parryi S. Watson
JM1: Allium fimbriatum var. fimbriatum	Allium fimbriatum S. Watson var. fimbriatum
JM1: Allium fimbriatum var. mohavense	Allium fimbriatum var. mohavense Jeps.
JM1: Allium fimbriatum var. purdyi	Allium fimbriatum var. purdyi (Eastw.) McNeal
JM1: Allium haematochiton	Allium haematochiton S. Watson
JM1: Allium hickmanii	Allium hickmanii Eastw.
JM1: Allium hoffmanii	Allium hoffmanii Traub
JM1: Allium howellii	Allium howellii Eastw.
JM1: Allium howellii var. clokeyi	Allium howellii var. clokeyi Traub
JM1: Allium howellii var. howellii	Allium howellii Eastw. var. howellii
JM1: Allium howellii var. sanbenitense	Allium howellii var. sanbenitense (Traub) McNeal & T.D. Jacobsen
JM1: Allium hyalinum	Allium hyalinum Curran
JM1: Allium jepsonii	Allium jepsonii (Traub) S.S. Denison & McNeal
JM1: Allium lacunosum	Allium lacunosum S. Watson
JM1: Allium lacunosum var. davisiae	Allium lacunosum var. davisiae (M.E. Jones) McNeal & Ownbey
JM2: Allium lacunosum var. kernense	Allium lacunosum var. kernense McNeal & Ownbey
JM1: Allium lacunosum var. kernensis	Allium lacunosum var. kernense McNeal & Ownbey
JM1: Allium lacunosum var. lacunosum	Allium lacunosum S. Watson var. lacunosum
JM1: Allium lacunosum var. micranthum	Allium lacunosum var. micranthum Eastw.
JM1: Allium lemmonii	Allium lemmonii S. Watson
JM2: Allium marvinii	Allium marvinii Davidson
JM1: Allium membranaceum	Allium membranaceum Traub
JM1: Allium monticola	Allium monticola Davidson
JM1: Allium munzii	Allium munzii (Traub) McNeal
JM1: Allium neapolitanum	Allium neapolitanum Cirillo
JM1: Allium nevadense	Allium nevadense S. Watson
JM1: Allium obtusum	Allium obtusum Lemmon
JM1: Allium obtusum var. conspicuum	Allium obtusum var. conspicuum Mortola & McNeal
JM1: Allium obtusum var. obtusum	Allium obtusum Lemmon var. obtusum
JM2: Allium paniculatum	Allium paniculatum L.
JM1: Allium paniculatum var. paniculatum	Allium paniculatum L. var. paniculatum
JM1: Allium parishii	Allium parishii S. Watson
JM1: Allium parryi	Allium parryi S. Watson
JM1: Allium parvum	Allium parvum Kellogg
JM1: Allium peninsulare	Allium peninsulare Greene
JM1: Allium peninsulare var. franciscanum	Allium peninsulare var. franciscanum McNeal & Ownbey
JM1: Allium peninsulare var. peninsulare	Allium peninsulare Greene var. peninsulare
JM1: Allium platycaule	Allium platycaule S. Watson
JM1: Allium praecox	Allium praecox Brandegee
JM1: Allium punctum	Allium punctum L.F. Hend.
JM1: Allium sanbornii	Allium sanbornii Alph. Wood
JM1: Allium sanbornii var. congdonii	Allium sanbornii var. congdonii Jeps.
JM1: Allium sanbornii var. sanbornii	Allium sanbornii Alph. Wood var. sanbornii
JM2: Allium sativum	Allium sativum L.
JM1: Allium serra	Allium serra McNeal & Ownbey
JMS: Allium serratum	Allium serra McNeal & Ownbey
JM1: Allium sharsmithae	Allium sharsmithiae (Traub) McNeal
JM2: Allium sharsmithiae	Allium sharsmithiae (Traub) McNeal
JM1: Allium shevockii	Allium shevockii McNeal
JM1: Allium siskiyouense	Allium siskiyouense Traub
JM2: Allium tolmiei	Allium tolmiei Baker
JM1: Allium tolmiei var. tolmiei	Allium tolmiei Baker var. tolmiei
JM1: Allium tribracteatum	Allium tribracteatum Torr.
JM1: Allium triquetrum	Allium triquetrum L.
JM1: Allium tuolumnense	Allium tuolumnense (Traub) S.S. Denison & McNeal
JM1: Allium unifolium	Allium unifolium Kellogg
JM1: Allium validum	Allium validum S. Watson
JM1: Allium vineale	Allium vineale L.
JM1: Allium yosemitense	Allium yosemitense Eastw.
JM1: Allophyllum divaricatum	Allophyllum divaricatum (Nutt.) A.D. Grant & V.E. Grant
JM1: Allophyllum gilioides	Allophyllum gilioides (Benth.) A.D. Grant & V.E. Grant
JM1: Allophyllum gilioides subsp. gilioides	Allophyllum gilioides (Benth.) A.D. Grant & V.E. Grant subsp. gilioides
JM1: Allophyllum gilioides subsp. violaceum	Allophyllum gilioides subsp. violaceum (A. Heller) A.G. Day
JM1: Allophyllum glutinosum	Allophyllum glutinosum (Benth.) A.D. Grant & V.E. Grant
JM1: Allophyllum integrifolium	Allophyllum integrifolium (Brand) A.D. Grant & V.E. Grant
JM1: Allotropa virgata	Allotropa virgata Torr. & A. Gray
JM2: Almutaster pauciflorus	Almutaster pauciflorus (Nutt.) &Aacute;. L&ouml;ve & D. L&ouml;ve
JM2: Alnus cordata	Alnus cordata (Loisel.) Duby
JMS: Alnus fruticosa	Alnus viridis (Chaix) Lam. & DC. subsp. fruticosa (Rupr.) Nyman
JM2: Alnus incana	Alnus incana (L.) Moench
JM1: Alnus incana subsp. tenuifolia	Alnus incana (L.) Moench subsp. tenuifolia (Nutt.) Breitung
JM1: Alnus rhombifolia	Alnus rhombifolia Nutt.
JM1: Alnus rubra	Alnus rubra Bong.
JMS: Alnus sinuata	Alnus viridis (Chaix) Lam. & DC. subsp. sinuata (Regel) &Aacute;. L&ouml;ve & D. L&ouml;ve
JM2: Alnus viridis	Alnus viridis (Chaix) Lam. & DC.
JM2: Alnus viridis subsp. fruticosa	Alnus viridis (Chaix) Lam. & DC. subsp. fruticosa (Rupr.) Nyman
JM1: Alnus viridis subsp. sinuata	Alnus viridis (Chaix) Lam. & DC. subsp. sinuata (Regel) &Aacute;. L&ouml;ve & D. L&ouml;ve
JM2: Aloe &times;schoenlandii	Aloe &times;schoenlandii Baker
JM2: Aloe maculata	Aloe maculata All.
JM1: Aloe saponaria	Aloe &times;schoenlandii Baker; Aloe maculata All.
JMS: Aloe striata	Aloe &times;schoenlandii Baker
JM1: Alopecurus aequalis	Alopecurus aequalis Sobol.
JM2: Alopecurus aequalis var. aequalis	Alopecurus aequalis Sobol. var. aequalis
JM2: Alopecurus aequalis var. sonomensis	Alopecurus aequalis var. sonomensis P. Rubtzov
JMS: Alopecurus aristulatus	Alopecurus aequalis Sobol. var. aequalis
JMS: Alopecurus californicus	Alopecurus saccatus Vasey
JM1: Alopecurus carolinianus	Alopecurus carolinianus Walter
JM1: Alopecurus geniculatus	Alopecurus geniculatus L.
JMS: Alopecurus howellii	Alopecurus saccatus Vasey
JM1: Alopecurus myosuroides	Alopecurus myosuroides Huds.
JMS: Alopecurus pallescens	Alopecurus geniculatus L.
JM1: Alopecurus pratensis	Alopecurus pratensis L.
JM1: Alopecurus saccatus	Alopecurus saccatus Vasey
JM1: Aloysia wrightii	Aloysia wrightii (Torr.) Abrams
JM1: Alternanthera caracasana	Alternanthera caracasana Kunth
JMS: Alternanthera lanuginosa	Tidestromia lanuginosa (Nutt.) Standl.
JMS: Alternanthera peploides	Alternanthera caracasana Kunth
JM1: Alternanthera philoxeroides	Alternanthera philoxeroides (Mart.) Griseb.
JMS: Alternanthera pungens	Alternanthera caracasana Kunth
JMS: Alternanthera repens	Alternanthera caracasana Kunth
JM2: Alyogyne huegelii	Alyogyne huegelii (Endl.) Fryxell
JM1: Alyssum alyssoides	Alyssum alyssoides (L.) L.
JM1: Alyssum desertorum	Alyssum desertorum Stapf
JMS: Alyssum minus	Alyssum simplex Rudolphi
JM1: Alyssum minus subsp. micranthum	Alyssum simplex Rudolphi
JMS: Alyssum minus var. micranthum	Alyssum simplex Rudolphi
JM2: Alyssum simplex	Alyssum simplex Rudolphi
JM1: Alyssum strigosum	misappl. to Alyssum simplex
JM1: Amaranthus albus	Amaranthus albus L.
JM1: Amaranthus arenicola	Amaranthus arenicola I.M. Johnst.
JM1: Amaranthus blitoides	Amaranthus blitoides S. Watson
JM2: Amaranthus blitum	Amaranthus blitum L.
JM2: Amaranthus blitum subsp. emarginatus	Amaranthus blitum L. subsp. emarginatus (Uline & W.L. Bray) Carretero et al.
JMS: Amaranthus bouchonii	Amaranthus powellii S. Watson
JM1: Amaranthus californicus	Amaranthus californicus (Moq.) S. Watson
JM1: Amaranthus caudatus	Amaranthus caudatus L.
JM1: Amaranthus cruentus	Amaranthus cruentus L.
JM1: Amaranthus deflexus	Amaranthus deflexus L.
JMS: Amaranthus emarginatus	Amaranthus blitum L. subsp. emarginatus (Uline & W.L. Bray) Carretero et al.
JM1: Amaranthus fimbriatus	Amaranthus fimbriatus (Torr.) S. Watson
JMS: Amaranthus graecizans	Amaranthus albus L.
JM1: Amaranthus hybridus	Amaranthus hybridus L.
JM2: Amaranthus hypochondriacus	Amaranthus hypochondriacus L.
JM1: Amaranthus palmeri	Amaranthus palmeri S. Watson
JM1: Amaranthus powellii	Amaranthus powellii S. Watson
JMS: Amaranthus powellii subsp. bouchonii	Amaranthus powellii S. Watson
JM1: Amaranthus retroflexus	Amaranthus retroflexus L.
JMS: Amaranthus rudis	Amaranthus tuberculatus (Moq.) J.D. Sauer var. rudis (J.D. Sauer) Costea & Tardif
JM1: Amaranthus spinosus	Amaranthus spinosus L.
JM1: Amaranthus torreyi	Amaranthus torreyi (A. Gray) S. Watson
JM2: Amaranthus tuberculatus	Amaranthus tuberculatus (Moq.) J.D. Sauer
JM2: Amaranthus tuberculatus var. rudis	Amaranthus tuberculatus (Moq.) J.D. Sauer var. rudis (J.D. Sauer) Costea & Tardif
JM2: Amaranthus viridis	Amaranthus viridis L.
JM1: Amaranthus watsonii	Amaranthus watsonii Standl.
JM2: Amaryllis belladonna	Amaryllis belladonna L.
JM2: Amauriopsis dissecta	Amauriopsis dissecta (A. Gray) Rydb.
JM1: Amblyopappus pusillus	Amblyopappus pusillus Hook. & Arn.
JM2: Ambrosia &times;platyspina	Ambrosia &times;platyspina (Seaman) Strother & B.G. Baldwin
JM1: Ambrosia acanthicarpa	Ambrosia acanthicarpa Hook.
JM1: Ambrosia ambrosioides	Ambrosia ambrosioides (Cav.) W.W. Payne
JM1: Ambrosia artemisiifolia	Ambrosia artemisiifolia L.
JM1: Ambrosia chamissonis	Ambrosia chamissonis (Less.) Greene
JM1: Ambrosia chenopodiifolia	Ambrosia chenopodiifolia (Benth.) W.W. Payne
JM1: Ambrosia confertiflora	Ambrosia confertiflora DC.
JM1: Ambrosia dumosa	Ambrosia dumosa (A. Gray) W.W. Payne
JM1: Ambrosia eriocentra	Ambrosia eriocentra (A. Gray) W.W. Payne
JM1: Ambrosia ilicifolia	Ambrosia ilicifolia (A. Gray) W.W. Payne
JM2: Ambrosia monogyra	Ambrosia monogyra (Torr. & A. Gray) Strother & B.G. Baldwin
JM1: Ambrosia psilostachya	Ambrosia psilostachya DC.
JM1: Ambrosia pumila	Ambrosia pumila (Nutt.) A. Gray
JM2: Ambrosia salsola	Ambrosia salsola (Torr. & A. Gray) Strother & B.G. Baldwin
JMS: Ambrosia salsola var. fasciculata	Ambrosia salsola (Torr. & A. Gray) Strother & B.G. Baldwin var. salsola
JM2: Ambrosia salsola var. pentalepis	Ambrosia salsola var. pentalepis (Rydb.) Strother & B.G. Baldwin
JM2: Ambrosia salsola var. salsola	Ambrosia salsola (Torr. & A. Gray) Strother & B.G. Baldwin var. salsola
JM1: Ambrosia trifida	Ambrosia trifida L.
JM1: Amelanchier alnifolia	Amelanchier alnifolia (Nutt.) M. Roem.
JM1: Amelanchier alnifolia var. pumila	Amelanchier alnifolia var. pumila (Torr. & A. Gray) C.K. Schneid.
JM1: Amelanchier alnifolia var. semiintegrifolia	Amelanchier alnifolia var. semiintegrifolia (Hook.) C.L. Hitchc.
JMS: Amelanchier florida	Amelanchier alnifolia var. semiintegrifolia (Hook.) C.L. Hitchc.
JMS: Amelanchier pumila	Amelanchier alnifolia var. pumila (Torr. & A. Gray) C.K. Schneid.
JM1: Amelanchier utahensis	Amelanchier utahensis Koehne
JMS: Amelichloa brachychaeta	Stipa brachychaeta Godr.
JM1: Ammannia coccinea	Ammannia coccinea Rottb.
JM1: Ammannia robusta	Ammannia robusta Heer & Regel
JM1: Ammi majus	Ammi majus L.
JM1: Ammi visnaga	Ammi visnaga (L.) Lam.
JM1: Ammophila arenaria	Ammophila arenaria (L.) Link
JM1: Ammoselinum giganteum	Ammoselinum giganteum J.M. Coult. & Rose
JM1: Amorpha californica	Amorpha californica Nutt.
JM1: Amorpha californica var. californica	Amorpha californica Nutt. var. californica
JM1: Amorpha californica var. napensis	Amorpha californica var. napensis Jeps.
JM1: Amorpha fruticosa	Amorpha fruticosa L.
JM1: Ampelodesmos mauritanica	Stipa mauritanica (Poir.) Columbus & J.P. Sm.
JMS: Ampelodesmos mauritanicus	Stipa mauritanica (Poir.) Columbus & J.P. Sm.
JM1: Amphipappus fremontii	Amphipappus fremontii Torr. & A. Gray
JM1: Amphipappus fremontii var. fremontii	Amphipappus fremontii Torr. & A. Gray var. fremontii Torr. & A. Gray
JM1: Amphipappus fremontii var. spinosus	Amphipappus fremontii var. spinosus (Nelson) Ced. Porter
JM2: Amphiscirpus nevadensis	Amphiscirpus nevadensis (S. Watson) Oteng-Yeb.
JM1: Amsinckia douglasiana	Amsinckia douglasiana A. DC.
JM1: Amsinckia eastwoodiae	Amsinckia eastwoodiae J.F. Macbr.
JM2: Amsinckia furcata	Amsinckia furcata Suksd.
JM1: Amsinckia grandiflora	Amsinckia grandiflora (A. Gray) Greene
JMS: Amsinckia helleri	Amsinckia retrorsa Suksd.
JM2: Amsinckia intermedia	Amsinckia intermedia Fisch. & C.A. Mey.
JM1: Amsinckia lunaris	Amsinckia lunaris J.F. Macbr.
JM1: Amsinckia lycopsoides	Amsinckia lycopsoides Lehm.
JM1: Amsinckia menziesii	Amsinckia menziesii (Lehm.) A. Nelson & J.F. Macbr.; Amsinckia intermedia Fisch. & C.A. Mey.
JM1: Amsinckia menziesii var. intermedia	Amsinckia intermedia Fisch. & C.A. Mey.
JM1: Amsinckia menziesii var. menziesii	Amsinckia menziesii (Lehm.) A. Nelson & J.F. Macbr.
JMS: Amsinckia micrantha	Amsinckia menziesii (Lehm.) A. Nelson & J.F. Macbr.
JMS: Amsinckia parviflora	Amsinckia retrorsa Suksd.
JM2: Amsinckia retrorsa	Amsinckia retrorsa Suksd.
JM1: Amsinckia spectabilis	Amsinckia spectabilis Fisch. & C.A. Mey.
JM1: Amsinckia spectabilis var. microcarpa	Amsinckia spectabilis var. microcarpa (Greene) Jeps. & Hoover
JMS: Amsinckia spectabilis var. sancti-nicolai	Amsinckia spectabilis Fisch. & C.A. Mey. var. spectabilis
JM1: Amsinckia spectabilis var. spectabilis	Amsinckia spectabilis Fisch. & C.A. Mey. var. spectabilis
JMS: Amsinckia spectabilis-nicolai	Amsinckia spectabilis Fisch. & C.A. Mey.
JM1: Amsinckia tessellata	Amsinckia tessellata A. Gray
JM1: Amsinckia tessellata var. gloriosa	Amsinckia tessellata var. gloriosa (Suksd.) Hoover
JM1: Amsinckia tessellata var. tessellata	Amsinckia tessellata A. Gray var. tessellata
JM1: Amsinckia vernicosa	Amsinckia vernicosa Hook. & Arn.
JM1: Amsinckia vernicosa var. furcata	Amsinckia furcata Suksd.
JM1: Amsinckia vernicosa var. vernicosa	Amsinckia vernicosa Hook. & Arn.
JM1: Amsonia tomentosa	Amsonia tomentosa Torr. & Fr&eacute;m.
JM1: Anagallis arvensis	Anagallis arvensis L.
JMS: Anagallis arvensis subsp. arvensis	Anagallis arvensis L.
JMS: Anagallis arvensis subsp. foemina	Anagallis arvensis L.
JMS: Anagallis arvensis var. caerulea	Anagallis arvensis L.
JMS: Anagallis caerulea	Anagallis arvensis L.
JMS: Anagallis foemina	Anagallis arvensis L.
JMS: Anagallis linifolia	Anagallis monelli L.
JM2: Anagallis minima	Anagallis minima (L.) E.H.L. Krause
JM2: Anagallis monelli	Anagallis monelli L.
JM1: Anaphalis margaritacea	Anaphalis margaritacea (L.) Benth.
JM1: Anchusa arvensis	excluded
JM1: Anchusa azurea	Anchusa azurea Mill.
JM1: Anchusa officinalis	Anchusa officinalis L.
JM1: Ancistrocarphus filagineus	Ancistrocarphus filagineus A. Gray
JM2: Ancistrocarphus keilii	Ancistrocarphus keilii Morefield
JMS: Andropogon barbinodis	Bothriochloa barbinodis (Lag.) Herter
JM2: Andropogon glomeratus	Andropogon glomeratus (Walter) Britton et al.
JM2: Andropogon glomeratus var. scabriglumis	Andropogon glomeratus (Walter) Britton et al. var. scabriglumis C.S. Campb.
JMS: Andropogon ischaemum	Bothriochloa ischaemum (L.) Keng
JMS: Andropogon torreyanus	Bothriochloa laguroides (DC.) Herter subsp. torreyana (Steud.) Allred & Gould
JM2: Andropogon virginicus	Andropogon virginicus L.
JM1: Andropogon virginicus var. virginicus	Andropogon virginicus L. var. virginicus
JM2: Androsace elongata	Androsace elongata L.
JM1: Androsace elongata subsp. acuta	Androsace elongata L. subsp. acuta (Greene) G.T. Robbins
JM1: Androsace filiformis	Androsace filiformis Retz.
JM2: Androsace occidentalis	Androsace occidentalis Pursh
JM1: Androsace occidentalis var. simplex	Androsace occidentalis Pursh
JM2: Androsace septentrionalis	Androsace septentrionalis L.
JMS: Androsace septentrionalis subsp. puberulenta	Androsace septentrionalis L.
JM1: Androsace septentrionalis subsp. subumbellata	Androsace septentrionalis L.
JM1: Androstephium breviflorum	Androstephium breviflorum S. Watson
JM1: Anelsonia eurycarpa	Anelsonia eurycarpa (A. Gray) J.F. Macbr. & Payson
JM1: Anemone deltoidea	Anemone deltoidea Hook.
JM1: Anemone drummondii	Anemone drummondii S. Watson
JM2: Anemone drummondii var. drummondii	Anemone drummondii S. Watson var. drummondii
JM2: Anemone grayi	Anemone grayi Behr & Kellogg
JM2: Anemone lyallii	Anemone lyallii Britton
JM1: Anemone multifida	Anemone multifida Poir.
JM2: Anemone multifida var. multifida	Anemone multifida Poir. var. multifida
JM1: Anemone occidentalis	Anemone occidentalis S. Watson
JM1: Anemone oregana	Anemone oregana A. Gray
JM2: Anemone oregana var. oregana	Anemone oregana A. Gray var. oregana
JM1: Anemone tuberosa	Anemone tuberosa Rydb.
JM1: Anemopsis californica	Anemopsis californica (Nutt.) Hook. & Arn.
JM1: Anethum graveolens	Anethum graveolens L.
JM1: Angelica arguta	Angelica arguta Nutt.
JM1: Angelica breweri	Angelica breweri A. Gray
JM1: Angelica californica	Angelica californica Jeps.
JM1: Angelica callii	Angelica callii Mathias & Constance
JM1: Angelica genuflexa	Angelica genuflexa Nutt.
JM1: Angelica hendersonii	Angelica hendersonii J.M. Coult. & Rose
JM1: Angelica kingii	Angelica kingii (S. Watson) J.M. Coult. & Rose
JM1: Angelica lineariloba	Angelica lineariloba A. Gray
JMS: Angelica lineariloba var. culbertsonii	Angelica lineariloba A. Gray
JM1: Angelica lucida	Angelica lucida L.
JM1: Angelica tomentosa	Angelica tomentosa S. Watson; Angelica californica Jeps.; Angelica hendersonii J.M. Coult. & Rose
JMS: Angelica tomentosa var. californica	Angelica californica Jeps.
JMS: Angelica tomentosa var. hendersoni	Angelica hendersonii J.M. Coult. & Rose
JM2: Anisocarpus madioides	Anisocarpus madioides Nutt.
JM2: Anisocarpus scabridus	Anisocarpus scabridus (Eastw.) B.G. Baldwin
JM1: Anisocoma acaulis	Anisocoma acaulis Torr. & A. Gray
JM2: Anisodontea capensis	Anisodontea capensis (L.) D.M. Bates
JM1: Anoda cristata	Anoda cristata (L.) Schltdl.
JM2: Anoda pentaschista	Anoda pentaschista A. Gray
JM1: Anredera cordifolia	Anredera cordifolia (Ten.) Steenis
JM1: Antennaria argentea	Antennaria argentea Benth.
JM1: Antennaria corymbosa	Antennaria corymbosa E.E. Nelson
JM1: Antennaria dimorpha	Antennaria dimorpha (Nutt.) Torr. & A. Gray
JMS: Antennaria dioica	Antennaria umbrinella Rydb.
JMS: Antennaria dioica var. kernensis	Antennaria umbrinella Rydb.
JM1: Antennaria flagellaris	Antennaria flagellaris (A. Gray) A. Gray
JM1: Antennaria geyeri	Antennaria geyeri A. Gray
JM2: Antennaria howellii	Antennaria howellii Greene
JM1: Antennaria howellii subsp. howellii	Antennaria howellii Greene subsp. howellii
JM1: Antennaria luzuloides	Antennaria luzuloides Torr. & A. Gray
JM2: Antennaria luzuloides subsp. aberrans	Antennaria luzuloides subsp. aberrans (E.E. Nelson) R.J. Bayer & Stebbins
JM2: Antennaria luzuloides subsp. luzuloides	Antennaria luzuloides Torr. & A. Gray subsp. luzuloides
JM1: Antennaria marginata	Antennaria marginata Greene
JM1: Antennaria media	Antennaria media Greene
JMS: Antennaria media subsp. ciliata	Antennaria pulchella Greene
JMS: Antennaria media subsp. pulchella	Antennaria pulchella Greene
JMS: Antennaria microcephala	Antennaria luzuloides subsp. aberrans (E.E. Nelson) R.J. Bayer & Stebbins
JM2: Antennaria microphylla	Antennaria microphylla Rydb.
JM1: Antennaria pulchella	Antennaria pulchella Greene
JMS: Antennaria pyramidata	Antennaria luzuloides subsp. aberrans (E.E. Nelson) R.J. Bayer & Stebbins
JM1: Antennaria racemosa	Antennaria racemosa Hook.
JM1: Antennaria rosea	Antennaria rosea Greene
JM1: Antennaria rosea subsp. confinis	Antennaria rosea subsp. confinis (Greene) R.J. Bayer
JM1: Antennaria rosea subsp. rosea	Antennaria rosea Greene subsp. rosea
JMS: Antennaria scabra	Antennaria pulchella Greene
JM1: Antennaria suffrutescens	Antennaria suffrutescens Greene
JM1: Antennaria umbrinella	Antennaria umbrinella Rydb.
JM1: Anthemis arvensis	Anthemis arvensis L.
JMS: Anthemis arvensis var. agrestis	Anthemis arvensis L.
JM1: Anthemis cotula	Anthemis cotula L.
JMS: Anthemis foetida	Anthemis cotula L.
JM1: Anthemis tinctoria	Cota tinctoria (L.) Guss.
JM1: Anthoxanthum aristatum	Anthoxanthum aristatum Boiss.
JM2: Anthoxanthum aristatum subsp. aristatum	Anthoxanthum aristatum Boiss. subsp. aristatum
JM2: Anthoxanthum nitens	Anthoxanthum nitens (Weber) Y. Schouten & Veldkamp
JM2: Anthoxanthum nitens subsp. nitens	Anthoxanthum nitens (Weber) Y. Schouten & Veldkamp subsp. nitens
JM2: Anthoxanthum occidentale	Anthoxanthum occidentale (Buckley) Veldkamp
JM1: Anthoxanthum odoratum	Anthoxanthum odoratum L.
JM1: Anthriscus caucalis	Anthriscus caucalis M. Bieb.
JMS: Anthriscus scandicina	Anthriscus caucalis M. Bieb.
JMS: Antirrhinum breweri	Antirrhinum vexillocalyculatum subsp. breweri (A. Gray) D.M. Thomps.
JMS: Antirrhinum confertiflorum	Mohavea confertiflora (A. DC.) A. Heller
JM1: Antirrhinum cornutum	Antirrhinum cornutum Benth.
JMS: Antirrhinum cornutum var. leptaleum	Antirrhinum leptaleum A. Gray
JM1: Antirrhinum coulterianum	Antirrhinum coulterianum A. DC.
JM1: Antirrhinum cyathiferum	Pseudorontium cyathiferum (Benth.) Rothm.
JM1: Antirrhinum filipes	Antirrhinum filipes A. Gray
JMS: Antirrhinum glandulosum	Antirrhinum multiflorum Pennell
JM1: Antirrhinum kelloggii	Antirrhinum kelloggii Greene
JM1: Antirrhinum kingii	Antirrhinum kingii S. Watson
JM1: Antirrhinum leptaleum	Antirrhinum leptaleum A. Gray
JM1: Antirrhinum majus	Antirrhinum majus L.
JM1: Antirrhinum multiflorum	Antirrhinum multiflorum Pennell
JM1: Antirrhinum nuttallianum	Antirrhinum nuttallianum A. DC.
JM1: Antirrhinum nuttallianum subsp. nuttallianum	Antirrhinum nuttallianum A. DC. subsp. nuttallianum
JM1: Antirrhinum nuttallianum subsp. subsessile	Antirrhinum nuttallianum subsp. subsessile (A. Gray) D.M. Thomps.
JM1: Antirrhinum orontium	Antirrhinum orontium L.
JM1: Antirrhinum ovatum	Antirrhinum ovatum Eastw.
JM1: Antirrhinum subcordatum	Antirrhinum subcordatum A. Gray
JM1: Antirrhinum vexillo-calyculatum	Antirrhinum vexillocalyculatum Kellogg
JM1: Antirrhinum vexillo-calyculatum subsp. breweri	Antirrhinum vexillocalyculatum subsp. breweri (A. Gray) D.M. Thomps.
JM1: Antirrhinum vexillo-calyculatum subsp. intermedium	Antirrhinum vexillocalyculatum subsp. intermedium D.M. Thomps.
JM1: Antirrhinum vexillo-calyculatum subsp. vexillo-calyculatum	Antirrhinum vexillocalyculatum Kellogg subsp. vexillocalyculatum
JM2: Antirrhinum vexillocalyculatum	Antirrhinum vexillocalyculatum Kellogg
JM2: Antirrhinum vexillocalyculatum subsp. breweri	Antirrhinum vexillocalyculatum subsp. breweri (A. Gray) D.M. Thomps.
JM2: Antirrhinum vexillocalyculatum subsp. intermedium	Antirrhinum vexillocalyculatum subsp. intermedium D.M. Thomps.
JM2: Antirrhinum vexillocalyculatum subsp. vexillocalyculatum	Antirrhinum vexillocalyculatum Kellogg subsp. vexillocalyculatum
JM1: Antirrhinum virga	Antirrhinum virga A. Gray
JM1: Anulocaulis annulatus	Anulocaulis annulatus (Coville) Standl.
JM1: Apera interrupta	Apera interrupta (L.) P. Beauv.
JM1: Apera spica-venti	Apera spica-venti (L.) P. Beauv.
JMS: Apetlorhamnus alnifolia	Rhamnus alnifolia L'H&eacute;r.
JM1: Aphanes occidentalis	Aphanes occidentalis (Nutt.) Rydb.
JM1: Aphanisma blitoides	Aphanisma blitoides Moq.
JM1: Apiastrum angustifolium	Apiastrum angustifolium Nutt.
JM1: Apium graveolens	Apium graveolens L.
JMS: Apium leptophyllum	Cyclospermum leptophyllum (Pers.) Britton & P. Wilson
JM1: Apium nodiflorum	Apium nodiflorum (L.) Lag.
JM1: Apocynum androsaemifolium	Apocynum androsaemifolium L.
JM1: Apocynum cannabinum	Apocynum cannabinum L.
JM1: Aponogeton distachyon	Aponogeton distachyos L. f.
JM2: Aponogeton distachyos	Aponogeton distachyos L. f.
JM1: Aptenia cordifolia	Aptenia cordifolia (L. f.) Schwantes
JM1: Aquilegia eximia	Aquilegia eximia Planch.
JM1: Aquilegia formosa	Aquilegia formosa DC.
JMS: Aquilegia formosa f. anomala	Aquilegia formosa DC.
JMS: Aquilegia formosa var. hypolasia	Aquilegia formosa DC.
JMS: Aquilegia formosa var. pauciflora	Aquilegia formosa DC.
JMS: Aquilegia formosa var. truncata	Aquilegia formosa DC.
JM1: Aquilegia pubescens	Aquilegia pubescens Coville
JM2: Aquilegia shockleyi	Aquilegia shockleyi Eastw.
JM1: Arabidopsis thaliana	Arabidopsis thaliana (L.) Heynh.
JM1: Arabis &times;divaricarpa	Boechera divaricarpa (A. Nelson) &Aacute;. L&ouml;ve & D. L&ouml;ve
JM1: Arabis aculeolata	excluded
JMS: Arabis arcuata	Boechera rubicundula (Jeps.) Windham & Al-Shehbaz
JMS: Arabis arcuata var. rubicundula	Boechera rubicundula (Jeps.) Windham & Al-Shehbaz
JM1: Arabis blepharophylla	Arabis blepharophylla Hook. & Arn.
JMS: Arabis blepharophylla var. mcdonaldiana	Arabis mcdonaldiana Eastw.
JM1: Arabis bodiensis	Boechera bodiensis (Rollins) Al-Shehbaz
JM1: Arabis breweri	Boechera breweri (S. Watson) Al-Shehbaz; Boechera peirsonii Windham & Al-Shehbaz
JM1: Arabis breweri var. austiniae	Boechera breweri subsp. shastaensis Windham & Al-Shehbaz
JM1: Arabis breweri var. breweri	Boechera breweri (S. Watson) Al-Shehbaz subsp. breweri
JM1: Arabis breweri var. pecuniaria	Boechera peirsonii Windham & Al-Shehbaz
JM1: Arabis cobrensis	Boechera cobrensis (M.E. Jones) Dorn
JM1: Arabis constancei	Boechera constancei (Rollins) Al-Shehbaz
JM1: Arabis davidsonii	Boechera davidsonii (Greene) N.H. Holmgren
JM1: Arabis dispar	Boechera dispar (M.E. Jones) Al-Shehbaz
JMS: Arabis divaricarpa	Boechera divaricarpa (A. Nelson) &Aacute;. L&ouml;ve & D. L&ouml;ve
JMS: Arabis divaricarpa var. interposita	Boechera acutina (Greene) Windham & Al-Shehbaz
JM1: Arabis drummondii	Boechera stricta (Graham) Al-Shehbaz
JM2: Arabis eschscholtziana	Arabis eschscholtziana Ledeb.
JMS: Arabis fernaldiana	Boechera evadens Windham & Al-Shehbaz
JM1: Arabis fernaldiana var. stylosa	Boechera evadens Windham & Al-Shehbaz
JM1: Arabis glabra	Turritis glabra L.
JM1: Arabis glabra var. furcatipilis	Turritis glabra L.
JM1: Arabis glabra var. glabra	Turritis glabra L.
JM1: Arabis glaucovalvula	Boechera glaucovalvula (M.E. Jones) Al-Shehbaz
JMS: Arabis hirshbergiae	Boechera johnstonii (Munz) Al-Shehbaz
JM1: Arabis hirsuta	Arabis pycnocarpa M. Hopkins; Arabis eschscholtziana Ledeb.
JMS: Arabis hirsuta subsp. pycnocarpa	Arabis pycnocarpa M. Hopkins var. pycnocarpa
JMS: Arabis hirsuta var. eschscholtziana	Arabis eschscholtziana Ledeb.
JM1: Arabis hirsuta var. glabrata	Arabis eschscholtziana Ledeb.
JM1: Arabis hirsuta var. pycnocarpa	Arabis pycnocarpa M. Hopkins var. pycnocarpa
JM1: Arabis hoffmannii	Boechera hoffmannii (Munz) Al-Shehbaz
JM1: Arabis holboellii	Boechera pendulocarpa (A. Nelson) Windham & Al-Shehbaz; Boechera pinetorum (Tidestr.) Windham & Al-Shehbaz; Boechera retrofracta (Graham) &Aacute;. L&ouml;ve & D. L&ouml;ve
JM1: Arabis holboellii var. pendulocarpa	Boechera pendulocarpa (A. Nelson) Windham & Al-Shehbaz
JM1: Arabis holboellii var. pinetorum	Boechera pinetorum (Tidestr.) Windham & Al-Shehbaz
JM1: Arabis holboellii var. retrofracta	Boechera retrofracta (Graham) &Aacute;. L&ouml;ve & D. L&ouml;ve
JM1: Arabis inyoensis	Boechera inyoensis (Rollins) Al-Shehbaz
JM1: Arabis johnstonii	Boechera johnstonii (Munz) Al-Shehbaz
JMS: Arabis koehleri	Boechera koehleri (Howell) Al-Shehbaz
JM1: Arabis koehleri var. stipitata	Boechera koehleri (Howell) Al-Shehbaz
JM1: Arabis lemmonii	Boechera depauperata (A. Nelson & P.B. Kenn.) Windham & Al-Shehbaz; Boechera lemmonii (S. Watson) W.A. Weber
JM1: Arabis lemmonii var. depauperata	Boechera depauperata (A. Nelson & P.B. Kenn.) Windham & Al-Shehbaz
JM1: Arabis lemmonii var. lemmonii	Boechera lemmonii (S. Watson) W.A. Weber
JM1: Arabis lyallii	Boechera lyallii (S. Watson) Dorn; Boechera paupercula (Greene) Windham & Al-Shehbaz
JM1: Arabis lyallii var. lyallii	Boechera lyallii (S. Watson) Dorn
JM1: Arabis lyallii var. nubigena	Boechera paupercula (Greene) Windham & Al-Shehbaz
JM1: Arabis macdonaldiana	Arabis mcdonaldiana Eastw.
JM2: Arabis mcdonaldiana	Arabis mcdonaldiana Eastw.
JMS: Arabis microphylla	Boechera paupercula (Greene) Windham & Al-Shehbaz
JM1: Arabis microphylla var. microphylla	Boechera paupercula (Greene) Windham & Al-Shehbaz
JM1: Arabis modesta	Arabis modesta Rollins
JM1: Arabis oregana	Arabis oregana Rollins
JM1: Arabis parishii	Boechera parishii (S. Watson) Al-Shehbaz
JMS: Arabis pendulina	Boechera pendulina (Greene) W.A. Weber
JMS: Arabis pendulocarpa	Boechera pendulocarpa (A. Nelson) Windham & Al-Shehbaz
JM1: Arabis perennans	Boechera perennans (S. Watson) W.A. Weber
JM1: Arabis pinzlae	Boechera pinzliae (Rollins) Al-Shehbaz
JM1: Arabis pinzliae	Boechera pinzliae (Rollins) Al-Shehbaz
JM1: Arabis platysperma	Boechera platysperma (A. Gray) Al-Shehbaz; Boechera howellii (S. Watson) Windham & Al-Shehbaz; Boechera elkoensis Windham & Al-Shehbaz
JM1: Arabis platysperma var. howellii	Boechera howellii (S. Watson) Windham & Al-Shehbaz
JM1: Arabis platysperma var. platysperma	Boechera elkoensis Windham & Al-Shehbaz
JMS: Arabis pratincola	Boechera pratincola (Greene) Windham & Al-Shehbaz
JM1: Arabis puberula	Boechera puberula (Nutt.) Dorn
JM1: Arabis pulchra	Boechera pulchra (S. Watson) W.A. Weber; Boechera xylopoda Windham & Al-Shehbaz; Boechera lincolnensis Windham & Al-Shehbaz
JM1: Arabis pulchra var. gracilis	Boechera xylopoda Windham & Al-Shehbaz
JM1: Arabis pulchra var. munciensis	Boechera lincolnensis Windham & Al-Shehbaz
JM1: Arabis pulchra var. pulchra	Boechera pulchra (S. Watson) W.A. Weber
JM2: Arabis pycnocarpa	Arabis pycnocarpa M. Hopkins
JM2: Arabis pycnocarpa var. pycnocarpa	Arabis pycnocarpa M. Hopkins var. pycnocarpa
JM1: Arabis pygmaea	Boechera pygmaea (Rollins) Al-Shehbaz
JMS: Arabis rectissima	Boechera rectissima (Greene) Al-Shehbaz
JM1: Arabis rectissima var. rectissima	Boechera rectissima (Greene) Al-Shehbaz
JM1: Arabis repanda	Boechera repanda (S. Watson) Al-Shehbaz
JM1: Arabis repanda var. greenei	Boechera repanda (S. Watson) Al-Shehbaz
JM1: Arabis repanda var. repanda	Boechera repanda (S. Watson) Al-Shehbaz
JMS: Arabis retrofracta	Boechera retrofracta (Graham) &Aacute;. L&ouml;ve & D. L&ouml;ve
JMS: Arabis rigidissima	Boechera rigidissima (Rollins) Al-Shehbaz
JM1: Arabis rigidissima var. rigidissima	Boechera rigidissima (Rollins) Al-Shehbaz
JM1: Arabis rollei	Boechera rollei (Rollins) Al-Shehbaz
JMS: Arabis serpentinicola	Arabis mcdonaldiana Eastw.
JM1: Arabis shockleyi	Boechera shockleyi (Munz) Dorn
JM1: Arabis sparsiflora	Boechera sparsiflora (Nutt.) Dorn; Boechera arcuata (Nutt.) Windham & Al-Shehbaz; Boechera californica (Rollins) Windham & Al-Shehbaz; Boechera pauciflora (Nutt.) Windham & Al-Shehbaz
JM1: Arabis sparsiflora var. arcuata	Boechera arcuata (Nutt.) Windham & Al-Shehbaz
JM1: Arabis sparsiflora var. californica	Boechera californica (Rollins) Windham & Al-Shehbaz
JM1: Arabis sparsiflora var. sparsiflora	Boechera sparsiflora (Nutt.) Dorn
JM1: Arabis sparsiflora var. subvillosa	Boechera pauciflora (Nutt.) Windham & Al-Shehbaz
JM1: Arabis subpinnatifida	Boechera subpinnatifida (S. Watson) Al-Shehbaz
JM1: Arabis suffrutescens	Boechera suffrutescens (S. Watson) Dorn
JM1: Arabis suffrutescens var. horizontalis	excluded
JM1: Arabis suffrutescens var. suffrutescens	Boechera suffrutescens (S. Watson) Dorn
JM1: Arabis tiehmii	Boechera tiehmii (Rollins) Al-Shehbaz
JM1: Aralia californica	Aralia californica S. Watson
JM1: Araujia sericifera	Araujia sericifera Brot.
JM1: Arbutus menziesii	Arbutus menziesii Pursh
JM1: Arceuthobium abietinum	Arceuthobium campylopodum Engelm.
JM1: Arceuthobium americanum	Arceuthobium americanum Engelm.
JM1: Arceuthobium californicum	Arceuthobium campylopodum Engelm.
JM1: Arceuthobium campylopodum	Arceuthobium campylopodum Engelm.
JM1: Arceuthobium cyanocarpum	Arceuthobium campylopodum Engelm.
JM1: Arceuthobium divaricatum	Arceuthobium campylopodum Engelm.
JM1: Arceuthobium douglasii	Arceuthobium douglasii Engelm.
JM1: Arceuthobium littorum	Arceuthobium campylopodum Engelm.
JMS: Arceuthobium monticola	Arceuthobium campylopodum Engelm.
JM1: Arceuthobium occidentale	Arceuthobium campylopodum Engelm.
JMS: Arceuthobium siskiyouense	Arceuthobium campylopodum Engelm.
JM1: Arceuthobium tsugense	Arceuthobium campylopodum Engelm.
JMS: Arceuthobium tsugense subsp. contortae	Arceuthobium campylopodum Engelm.
JM1: Arceuthobium tsugense subsp. mertensianae	Arceuthobium campylopodum Engelm.
JM1: Arceuthobium tsugense subsp. tsugense	Arceuthobium campylopodum Engelm.
JM1: Arctium lappa	Arctium lappa L.
JM1: Arctium minus	Arctium minus (Hill) Bernh.
JM1: Arctomecon merriamii	Arctomecon merriamii Coville
JMS: Arctostaphylos &times;knightii	Arctostaphylos nevadensis subsp. knightii (Gankin & W.R. Hildreth) P.V. Wells
JMS: Arctostaphylos &times;pacifica	Arctostaphylos pacifica Roof
JM1: Arctostaphylos andersonii	Arctostaphylos andersonii A. Gray
JM1: Arctostaphylos auriculata	Arctostaphylos auriculata Eastw.
JM1: Arctostaphylos bakeri	Arctostaphylos bakeri Eastw.
JM1: Arctostaphylos bakeri subsp. bakeri	Arctostaphylos bakeri Eastw. subsp. bakeri
JM1: Arctostaphylos bakeri subsp. sublaevis	Arctostaphylos bakeri subsp. sublaevis P.V. Wells
JM1: Arctostaphylos canescens	Arctostaphylos canescens Eastw.
JM1: Arctostaphylos canescens subsp. canescens	Arctostaphylos canescens Eastw. subsp. canescens
JM1: Arctostaphylos canescens subsp. sonomensis	Arctostaphylos canescens subsp. sonomensis (Eastw.) P.V. Wells
JM1: Arctostaphylos catalinae	Arctostaphylos catalinae P.V. Wells
JM1: Arctostaphylos columbiana	Arctostaphylos columbiana Piper
JMS: Arctostaphylos columbiana f. tracyi	Arctostaphylos columbiana Piper
JM1: Arctostaphylos confertiflora	Arctostaphylos confertiflora Eastw.
JM2: Arctostaphylos crustacea	Arctostaphylos crustacea Eastw.
JM2: Arctostaphylos crustacea subsp. crinita	Arctostaphylos crustacea subsp. crinita (J.E. Adams) V.T. Parker et al.
JM2: Arctostaphylos crustacea subsp. crustacea	Arctostaphylos crustacea Eastw. subsp. crustacea
JM2: Arctostaphylos crustacea subsp. eastwoodiana	Arctostaphylos crustacea subsp. eastwoodiana (P.V. Wells) V.T. Parker et al.
JM2: Arctostaphylos crustacea subsp. insulicola	Arctostaphylos crustacea subsp. insulicola (P.V. Wells) V.T. Parker et al.
JM2: Arctostaphylos crustacea subsp. rosei	Arctostaphylos crustacea subsp. rosei (Eastw.) V.T. Parker et al.
JM2: Arctostaphylos crustacea subsp. subcordata	Arctostaphylos crustacea subsp. subcordata (Eastw.) V.T. Parker et al.
JM1: Arctostaphylos cruzensis	Arctostaphylos cruzensis Roof
JM1: Arctostaphylos densiflora	Arctostaphylos densiflora M.S. Baker
JM1: Arctostaphylos edmundsii	Arctostaphylos edmundsii J.T. Howell
JM2: Arctostaphylos franciscana	Arctostaphylos franciscana Eastw.
JM2: Arctostaphylos gabilanensis	Arctostaphylos gabilanensis V.T. Parker & M.C. Vasey
JM1: Arctostaphylos gabrielensis	Arctostaphylos glandulosa subsp. gabrielensis (P.V. Wells) J.E. Keeley et al.
JM1: Arctostaphylos glandulosa	Arctostaphylos glandulosa Eastw.
JMS: Arctostaphylos glandulosa f. cushingiana	Arctostaphylos glandulosa subsp. cushingiana (Eastw.) J.E. Keeley et al.
JM1: Arctostaphylos glandulosa subsp. adamsii	Arctostaphylos glandulosa subsp. adamsii (Munz) Munz
JM1: Arctostaphylos glandulosa subsp. crassifolia	Arctostaphylos glandulosa subsp. crassifolia (Jeps.) P.V. Wells
JM2: Arctostaphylos glandulosa subsp. cushingiana	Arctostaphylos glandulosa subsp. cushingiana (Eastw.) J.E. Keeley et al.
JM2: Arctostaphylos glandulosa subsp. gabrielensis	Arctostaphylos glandulosa subsp. gabrielensis (P.V. Wells) J.E. Keeley et al.
JM1: Arctostaphylos glandulosa subsp. glandulosa	Arctostaphylos glandulosa Eastw. subsp. glandulosa
JM1: Arctostaphylos glandulosa subsp. glaucomollis	Arctostaphylos glandulosa subsp. mollis (J.E. Adams) P.V. Wells
JM2: Arctostaphylos glandulosa subsp. howellii	Arctostaphylos glandulosa subsp. howellii (Eastw.) P.V. Wells
JM2: Arctostaphylos glandulosa subsp. leucophylla	Arctostaphylos glandulosa subsp. leucophylla J.E. Keeley et al.
JM1: Arctostaphylos glandulosa subsp. mollis	Arctostaphylos glandulosa subsp. mollis (J.E. Adams) P.V. Wells
JM1: Arctostaphylos glandulosa subsp. zacaensis	Arctostaphylos glandulosa Eastw. subsp. glandulosa
JM1: Arctostaphylos glauca	Arctostaphylos glauca Lindl.
JM1: Arctostaphylos glutinosa	Arctostaphylos glutinosa B. Schreib.
JM1: Arctostaphylos hispidula	Arctostaphylos hispidula Howell
JM1: Arctostaphylos hookeri	Arctostaphylos hookeri G. Don; Arctostaphylos montana Eastw.; Arctostaphylos franciscana Eastw.
JM1: Arctostaphylos hookeri subsp. franciscana	Arctostaphylos franciscana Eastw.
JM1: Arctostaphylos hookeri subsp. hearstiorum	Arctostaphylos hookeri subsp. hearstiorum (Hoover & Roof) P.V. Wells
JM1: Arctostaphylos hookeri subsp. hookeri	Arctostaphylos hookeri G. Don subsp. hookeri
JM1: Arctostaphylos hookeri subsp. montana	Arctostaphylos montana Eastw. subsp. montana
JM1: Arctostaphylos hookeri subsp. ravenii	Arctostaphylos montana subsp. ravenii (P.V. Wells) V.T. Parker et al.
JM1: Arctostaphylos hooveri	Arctostaphylos hooveri P.V. Wells
JM1: Arctostaphylos imbricata	Arctostaphylos imbricata Eastw.
JM1: Arctostaphylos insularis	Arctostaphylos insularis Parry
JM2: Arctostaphylos klamathensis	Arctostaphylos klamathensis S.W. Edwards et al.
JM1: Arctostaphylos luciana	Arctostaphylos luciana P.V. Wells
JM1: Arctostaphylos malloryi	Arctostaphylos malloryi (W. Knight & Gankin) P.V. Wells
JM1: Arctostaphylos manzanita	Arctostaphylos manzanita Parry
JM1: Arctostaphylos manzanita subsp. elegans	Arctostaphylos manzanita subsp. elegans (Jeps.) P.V. Wells
JM1: Arctostaphylos manzanita subsp. glaucescens	Arctostaphylos manzanita subsp. glaucescens P.V. Wells
JM1: Arctostaphylos manzanita subsp. laevigata	Arctostaphylos manzanita subsp. laevigata (Eastw.) Munz
JM1: Arctostaphylos manzanita subsp. manzanita	Arctostaphylos manzanita Parry subsp. manzanita
JM1: Arctostaphylos manzanita subsp. roofii	Arctostaphylos manzanita subsp. roofii (Gankin) P.V. Wells
JM1: Arctostaphylos manzanita subsp. wieslanderi	Arctostaphylos manzanita subsp. wieslanderi P.V. Wells
JM1: Arctostaphylos mendocinoensis	Arctostaphylos nummularia subsp. mendocinoensis (P.V. Wells) V.T. Parker et al.
JM1: Arctostaphylos mewukka	Arctostaphylos mewukka Merriam
JM1: Arctostaphylos mewukka subsp. mewukka	Arctostaphylos mewukka Merriam subsp. mewukka
JM1: Arctostaphylos mewukka subsp. truei	Arctostaphylos mewukka subsp. truei (W. Knight) P.V. Wells
JM2: Arctostaphylos montana	Arctostaphylos montana Eastw.
JM2: Arctostaphylos montana subsp. montana	Arctostaphylos montana Eastw. subsp. montana
JM2: Arctostaphylos montana subsp. ravenii	Arctostaphylos montana subsp. ravenii (P.V. Wells) V.T. Parker et al.
JM1: Arctostaphylos montaraensis	Arctostaphylos montaraensis Roof
JM1: Arctostaphylos montereyensis	Arctostaphylos montereyensis Hoover
JM1: Arctostaphylos morroensis	Arctostaphylos morroensis Wiesl. & B. Schreib.
JM1: Arctostaphylos myrtifolia	Arctostaphylos myrtifolia Parry
JM1: Arctostaphylos nevadensis	Arctostaphylos nevadensis A. Gray
JM2: Arctostaphylos nevadensis subsp. knightii	Arctostaphylos nevadensis subsp. knightii (Gankin & W.R. Hildreth) P.V. Wells
JM2: Arctostaphylos nevadensis subsp. nevadensis	Arctostaphylos nevadensis A. Gray subsp. nevadensis
JM1: Arctostaphylos nissenana	Arctostaphylos nissenana Merriam
JM1: Arctostaphylos nortensis	Arctostaphylos nortensis (P.V. Wells) P.V. Wells
JM1: Arctostaphylos nummularia	Arctostaphylos nummularia A. Gray; Arctostaphylos sensitiva Jeps.
JM2: Arctostaphylos nummularia subsp. mendocinoensis	Arctostaphylos nummularia subsp. mendocinoensis (P.V. Wells) V.T. Parker et al.
JM2: Arctostaphylos nummularia subsp. nummularia	Arctostaphylos nummularia A. Gray subsp. nummularia
JMS: Arctostaphylos nummularia var. sensitiva	Arctostaphylos sensitiva Jeps.
JM1: Arctostaphylos obispoensis	Arctostaphylos obispoensis Eastw.
JM2: Arctostaphylos ohloneana	Arctostaphylos ohloneana M.C. Vasey & V.T. Parker
JM1: Arctostaphylos osoensis	Arctostaphylos osoensis P.V. Wells
JM1: Arctostaphylos otayensis	Arctostaphylos otayensis Wiesl. & B. Schreib.
JM2: Arctostaphylos pacifica	Arctostaphylos pacifica Roof
JM1: Arctostaphylos pajaroensis	Arctostaphylos pajaroensis (J.E. Adams) J.E. Adams
JM1: Arctostaphylos pallida	Arctostaphylos pallida Eastw.
JM1: Arctostaphylos parryana	Arctostaphylos parryana Lemmon
JM2: Arctostaphylos parryana subsp. desertica	Arctostaphylos parryana subsp. desertica J.E. Keeley et al.
JM2: Arctostaphylos parryana subsp. parryana	Arctostaphylos parryana Lemmon subsp. parryana
JM2: Arctostaphylos parryana subsp. tumescens	Arctostaphylos parryana subsp. tumescens J.E. Keeley et al.
JM1: Arctostaphylos patula	Arctostaphylos patula Greene
JM1: Arctostaphylos pechoensis	Arctostaphylos pechoensis (Abrams) Eastw.
JM1: Arctostaphylos pilosula	Arctostaphylos pilosula Jeps. & Wiesl.
JMS: Arctostaphylos pilosula subsp. pismoensis	Arctostaphylos pilosula Jeps. & Wiesl.
JM2: Arctostaphylos pringlei	Arctostaphylos pringlei Parry
JM1: Arctostaphylos pringlei subsp. drupacea	Arctostaphylos pringlei Parry subsp. drupacea (Parry) P.V. Wells
JM1: Arctostaphylos pumila	Arctostaphylos pumila Nutt.
JM1: Arctostaphylos pungens	Arctostaphylos pungens Kunth
JM1: Arctostaphylos purissima	Arctostaphylos purissima P.V. Wells
JM2: Arctostaphylos rainbowensis	Arctostaphylos rainbowensis J.E. Keeley & Massihi
JM1: Arctostaphylos refugioensis	Arctostaphylos refugioensis Gankin
JM1: Arctostaphylos regismontana	Arctostaphylos regismontana Eastw.
JM1: Arctostaphylos rudis	Arctostaphylos rudis Jeps. & Wiesl.
JM2: Arctostaphylos sensitiva	Arctostaphylos sensitiva Jeps.
JM1: Arctostaphylos silvicola	Arctostaphylos silvicola Jeps. & Wiesl.
JM1: Arctostaphylos stanfordiana	Arctostaphylos stanfordiana Parry
JM1: Arctostaphylos stanfordiana subsp. decumbens	Arctostaphylos stanfordiana subsp. decumbens (P.V. Wells) P.V. Wells
JM1: Arctostaphylos stanfordiana subsp. raichei	Arctostaphylos stanfordiana subsp. raichei W. Knight
JM1: Arctostaphylos stanfordiana subsp. stanfordiana	Arctostaphylos stanfordiana Parry subsp. stanfordiana
JM1: Arctostaphylos tomentosa	Arctostaphylos crustacea Eastw.; Arctostaphylos tomentosa (Pursh) Lindl.
JM1: Arctostaphylos tomentosa subsp. bracteosa	Arctostaphylos tomentosa subsp. bracteosa (DC.) J.E. Adams
JM1: Arctostaphylos tomentosa subsp. crinita	Arctostaphylos crustacea subsp. crinita (J.E. Adams) V.T. Parker et al.
JM1: Arctostaphylos tomentosa subsp. crustacea	Arctostaphylos crustacea Eastw. subsp. crustacea
JM1: Arctostaphylos tomentosa subsp. daciticola	Arctostaphylos tomentosa subsp. daciticola P.V. Wells
JM1: Arctostaphylos tomentosa subsp. eastwoodiana	Arctostaphylos crustacea subsp. eastwoodiana (P.V. Wells) V.T. Parker et al.
JM2: Arctostaphylos tomentosa subsp. hebeclada	Arctostaphylos tomentosa subsp. hebeclada (DC.) V.T. Parker et al.
JM1: Arctostaphylos tomentosa subsp. insulicola	Arctostaphylos crustacea subsp. insulicola (P.V. Wells) V.T. Parker et al.
JM1: Arctostaphylos tomentosa subsp. rosei	Arctostaphylos crustacea subsp. rosei (Eastw.) V.T. Parker et al.
JM1: Arctostaphylos tomentosa subsp. subcordata	Arctostaphylos crustacea subsp. subcordata (Eastw.) V.T. Parker et al.
JM1: Arctostaphylos tomentosa subsp. tomentosa	Arctostaphylos tomentosa (Pursh) Lindl. subsp. tomentosa
JMS: Arctostaphylos tomentosa var. hebeclada	Arctostaphylos tomentosa subsp. hebeclada (DC.) V.T. Parker et al.
JM1: Arctostaphylos uva-ursi	Arctostaphylos uva-ursi (L.) Spreng.
JMS: Arctostaphylos uva-ursi f. adenotricha	Arctostaphylos uva-ursi (L.) Spreng.
JMS: Arctostaphylos uva-ursi f. coactilis	Arctostaphylos uva-ursi (L.) Spreng.
JM1: Arctostaphylos virgata	Arctostaphylos virgata Eastw.
JM1: Arctostaphylos viridissima	Arctostaphylos viridissima (Eastw.) McMinn
JM1: Arctostaphylos viscida	Arctostaphylos viscida Parry
JM1: Arctostaphylos viscida subsp. mariposa	Arctostaphylos viscida subsp. mariposa (Dudley) P.V. Wells
JM1: Arctostaphylos viscida subsp. pulchella	Arctostaphylos viscida subsp. pulchella (Howell) P.V. Wells
JM1: Arctostaphylos viscida subsp. viscida	Arctostaphylos viscida Parry subsp. viscida
JM1: Arctostaphylos wellsii	Arctostaphylos pilosula Jeps. & Wiesl.
JM1: Arctotheca calendula	Arctotheca calendula (L.) Levyns; Arctotheca prostrata (Salisb.) Britten
JM2: Arctotheca prostrata	Arctotheca prostrata (Salisb.) Britten
JM1: Arctotis stoechadifolia	Arctotis venusta Norl.
JM2: Arctotis venusta	Arctotis venusta Norl.
JM1: Arenaria aculeata	Eremogone aculeata (S. Watson) Ikonn.
JMS: Arenaria confusa	Arenaria lanuginosa (Michx.) Rohrb. var. saxosa (A. Gray) Zarucchi et al.
JM1: Arenaria congesta	Eremogone congesta (Nutt.) Ikonn.
JM1: Arenaria congesta var. charlestonensis	Eremogone congesta var. charlestonensis (Maguire) R.L. Hartm. & Rabeler
JM1: Arenaria congesta var. congesta	Eremogone congesta (Nutt.) Ikonn. var. congesta
JM1: Arenaria congesta var. crassula	Eremogone congesta var. crassula (Maguire) R.L. Hartm. & Rabeler
JM1: Arenaria congesta var. simulans	Eremogone congesta var. simulans (Maguire) R.L. Hartm. & Rabeler
JM1: Arenaria congesta var. subcongesta	Eremogone congesta var. subcongesta (S. Watson) R.L. Hartm. & Rabeler
JM1: Arenaria congesta var. suffrutescens	Eremogone congesta var. suffrutescens (A. Gray) R.L. Hartm. & Rabeler
JMS: Arenaria kingii	Eremogone kingii (S. Watson) Ikonn.
JMS: Arenaria kingii subsp. compacta	Eremogone kingii (S. Watson) Ikonn. var. glabrescens (S. Watson) Dorn
JM1: Arenaria kingii var. glabrescens	Eremogone kingii (S. Watson) Ikonn. var. glabrescens (S. Watson) Dorn
JM2: Arenaria lanuginosa	Arenaria lanuginosa (Michx.) Rohrb.
JM1: Arenaria lanuginosa subsp. saxosa	Arenaria lanuginosa (Michx.) Rohrb. var. saxosa (A. Gray) Zarucchi et al.
JM2: Arenaria lanuginosa var. saxosa	Arenaria lanuginosa (Michx.) Rohrb. var. saxosa (A. Gray) Zarucchi et al.
JM1: Arenaria macradenia	Eremogone macradenia (S. Watson) Ikonn.; Eremogone ferrisiae (Abrams) R.L. Hartm. & Rabeler; Eremogone ferrisiae (Abrams) R.L. Hartm. & Rabeler
JM1: Arenaria macradenia subsp. ferrisiae	Eremogone ferrisiae (Abrams) R.L. Hartm. & Rabeler
JM1: Arenaria macradenia var. arcuifolia	Eremogone macradenia var. arcuifolia (Maguire) R.L. Hartm. & Rabeler
JM1: Arenaria macradenia var. kuschei	Eremogone macradenia var. arcuifolia (Maguire) R.L. Hartm. & Rabeler
JM1: Arenaria macradenia var. macradenia	Eremogone macradenia (S. Watson) Ikonn. var. macradenia
JM1: Arenaria paludicola	Arenaria paludicola B.L. Rob.
JM2: Arenaria serpyllifolia	Arenaria serpyllifolia L.
JM1: Arenaria serpyllifolia subsp. serpyllifolia	Arenaria serpyllifolia L. var. serpyllifolia
JM2: Arenaria serpyllifolia var. serpyllifolia	Arenaria serpyllifolia L. var. serpyllifolia
JM1: Arenaria ursina	Eremogone ursina (B.L. Rob.) Ikonn.
JM1: Argemone corymbosa	Argemone corymbosa Greene
JM1: Argemone munita	Argemone munita Durand & Hilg.
JMS: Argemone munita subsp. argentea	Argemone munita Durand & Hilg.
JMS: Argemone munita subsp. robusta	Argemone munita Durand & Hilg.
JMS: Argemone munita subsp. rotundata	Argemone munita Durand & Hilg.
JM1: Argyranthemum foeniculaceum	Argyranthemum foeniculaceum (Willd.) Sch. Bip.
JM1: Argyrochosma jonesii	Argyrochosma jonesii (Maxon) Windham
JM2: Argyrochosma limitanea	Argyrochosma limitanea (Maxon) Windham
JM2: Argyrochosma limitanea subsp. limitanea	Argyrochosma limitanea (Maxon) Windham subsp. limitanea
JM1: Argyrochosma limitanea var. limitanea	Argyrochosma limitanea (Maxon) Windham subsp. limitanea
JM2: Arida arizonica	Arida arizonica (R.C. Jacks. & R.R. Johnson) D.R. Morgan & R.L. Hartm.
JM2: Arida carnosa	Arida carnosa (A. Gray) D.R. Morgan & R.L. Hartm.
JM1: Aristida adscensionis	Aristida adscensionis L.
JM2: Aristida californica	Aristida californica Thurb.
JM1: Aristida californica var. californica	Aristida californica Thurb.
JM2: Aristida dichotoma	Aristida dichotoma Michx.
JM1: Aristida divaricata	Aristida divaricata Willd.
JMS: Aristida fendleriana	Aristida purpurea var. fendleriana (Steud.) Vasey
JMS: Aristida glauca	Aristida purpurea var. nealleyi (Vasey) Allred
JMS: Aristida hamulosa	Aristida ternipes Cav. var. gentilis (Henrard) Allred
JMS: Aristida longiseta	Aristida purpurea var. longiseta (Steud.) Vasey
JM1: Aristida oligantha	Aristida oligantha Michx.
JMS: Aristida parishii	Aristida purpurea var. parishii (Hitchc.) Allred
JM1: Aristida purpurea	Aristida purpurea Nutt.
JM1: Aristida purpurea var. fendleriana	Aristida purpurea var. fendleriana (Steud.) Vasey
JM1: Aristida purpurea var. longiseta	Aristida purpurea var. longiseta (Steud.) Vasey
JM1: Aristida purpurea var. nealleyi	Aristida purpurea var. nealleyi (Vasey) Allred
JM1: Aristida purpurea var. parishii	Aristida purpurea var. parishii (Hitchc.) Allred
JM1: Aristida purpurea var. purpurea	Aristida purpurea Nutt. var. purpurea
JMS: Aristida purpurea var. robusta	Aristida purpurea var. longiseta (Steud.) Vasey
JM1: Aristida purpurea var. wrightii	Aristida purpurea var. wrightii (Nash) Allred
JM2: Aristida ternipes	Aristida ternipes Cav.
JM2: Aristida ternipes var. gentilis	Aristida ternipes Cav. var. gentilis (Henrard) Allred
JM1: Aristida ternipes var. hamulosa	Aristida ternipes Cav. var. gentilis (Henrard) Allred
JMS: Aristida wrightii	Aristida purpurea var. wrightii (Nash) Allred
JM1: Aristocapsa insignis	Aristocapsa insignis (Curran) Reveal & Hardham
JM1: Aristolochia californica	Aristolochia californica Torr.
JM2: Armeria maritima	Armeria maritima (Mill.) Willd.
JM1: Armeria maritima subsp. californica	Armeria maritima (Mill.) Willd. subsp. californica (Boiss.) A.E. Porsild
JMS: Armeria maritima var. californica	Armeria maritima (Mill.) Willd. subsp. californica (Boiss.) A.E. Porsild
JM2: Armoracia rusticana	Armoracia rusticana P. Gaertn. et al.
JM1: Arnica amplexicaulis	Arnica lanceolata Nutt. subsp. prima (Maguire) Strother & S.J. Wolf
JM1: Arnica cernua	Arnica cernua Howell
JM2: Arnica chamissonis	Arnica chamissonis Less.
JM1: Arnica chamissonis subsp. foliosa	Arnica chamissonis Less.
JM1: Arnica cordifolia	Arnica cordifolia Hook.
JM2: Arnica dealbata	Arnica dealbata (A. Gray) B.G. Baldwin
JM1: Arnica discoidea	Arnica discoidea Benth.
JM1: Arnica diversifolia	Arnica ovata Greene
JM1: Arnica fulgens	Arnica fulgens Pursh
JM2: Arnica lanceolata	Arnica lanceolata Nutt.
JM2: Arnica lanceolata subsp. prima	Arnica lanceolata Nutt. subsp. prima (Maguire) Strother & S.J. Wolf
JM1: Arnica latifolia	Arnica latifolia Bong.
JM1: Arnica longifolia	Arnica longifolia D.C. Eaton
JM1: Arnica mollis	Arnica mollis Hook.
JM1: Arnica nevadensis	Arnica nevadensis A. Gray
JM2: Arnica ovata	Arnica ovata Greene
JM1: Arnica parryi	Arnica parryi A. Gray
JMS: Arnica parryi subsp. parryi	Arnica parryi A. Gray
JMS: Arnica sonnei	Arnica parryi A. Gray
JM1: Arnica sororia	Arnica sororia Greene
JM1: Arnica spathulata	Arnica spathulata Greene
JM1: Arnica tomentella	Arnica nevadensis A. Gray
JM1: Arnica venosa	Arnica venosa H.M. Hall
JM1: Arnica viscosa	Arnica viscosa A. Gray
JM1: Arrhenatherum elatius	Arrhenatherum elatius (L.) J. Presl & C. Presl
JMS: Arrhenatherum elatius subsp. bulbosum	Arrhenatherum elatius (L.) J. Presl & C. Presl
JMS: Arrhenatherum elatius var. biaristatum	Arrhenatherum elatius (L.) J. Presl & C. Presl
JM1: Artemisia annua	Artemisia annua L.
JM1: Artemisia arbuscula	Artemisia arbuscula Nutt.; Artemisia nova A. Nelson
JM1: Artemisia arbuscula subsp. arbuscula	Artemisia arbuscula Nutt. subsp. arbuscula
JM2: Artemisia arbuscula subsp. longiloba	Artemisia arbuscula subsp. longiloba (Osterh.) L.M. Shultz
JMS: Artemisia arbuscula subsp. nova	Artemisia nova A. Nelson
JM1: Artemisia arbuscula subsp. thermopola	excluded
JM1: Artemisia biennis	Artemisia biennis Willd.
JM1: Artemisia bigelovii	Artemisia bigelovii A. Gray
JM2: Artemisia borealis	Artemisia borealis Pall.
JM2: Artemisia borealis subsp. borealis	Artemisia borealis Pall. subsp. borealis
JM1: Artemisia californica	Artemisia californica Less.
JMS: Artemisia californica var. insularis	Artemisia nesiotica P.H. Raven
JMS: Artemisia campestris	Artemisia borealis Pall.
JM1: Artemisia campestris subsp. borealis	Artemisia borealis Pall. subsp. borealis
JM2: Artemisia cana	Artemisia cana Pursh
JM1: Artemisia cana subsp. bolanderi	Artemisia cana Pursh subsp. bolanderi (A. Gray) G.H. Ward
JM1: Artemisia douglasiana	Artemisia douglasiana Besser
JM1: Artemisia dracunculus	Artemisia dracunculus L.
JM1: Artemisia ludoviciana	Artemisia ludoviciana Nutt.
JM1: Artemisia ludoviciana subsp. albula	Artemisia ludoviciana subsp. albula (Wooton) D.D. Keck
JM1: Artemisia ludoviciana subsp. candicans	Artemisia ludoviciana subsp. candicans (Rydb.) D.D. Keck
JM1: Artemisia ludoviciana subsp. incompta	Artemisia ludoviciana subsp. incompta (Nutt.) D.D. Keck
JM1: Artemisia ludoviciana subsp. ludoviciana	Artemisia ludoviciana Nutt. subsp. ludoviciana
JM1: Artemisia michauxiana	Artemisia michauxiana Besser
JM1: Artemisia nesiotica	Artemisia nesiotica P.H. Raven
JM2: Artemisia norvegica	Artemisia norvegica Fr.
JM1: Artemisia norvegica subsp. saxatilis	Artemisia norvegica Fr. subsp. saxatilis (Besser) H.M. Hall & Clem.
JM1: Artemisia nova	Artemisia nova A. Nelson
JM1: Artemisia palmeri	Artemisia palmeri A. Gray
JMS: Artemisia petrophila	Artemisia bigelovii A. Gray
JM1: Artemisia pycnocephala	Artemisia pycnocephala (Less.) DC.
JM1: Artemisia rothrockii	Artemisia rothrockii A. Gray
JM1: Artemisia spiciformis	Artemisia spiciformis Osterh.
JM1: Artemisia spinescens	Artemisia spinescens D.C. Eaton
JM1: Artemisia suksdorfii	Artemisia suksdorfii Piper
JM1: Artemisia tridentata	Artemisia tridentata Nutt.; Artemisia cana Pursh
JMS: Artemisia tridentata subsp. bolanderi	Artemisia cana Pursh subsp. bolanderi (A. Gray) G.H. Ward
JM1: Artemisia tridentata subsp. parishii	Artemisia tridentata subsp. parishii (A. Gray) H.M. Hall & Clem.
JM1: Artemisia tridentata subsp. tridentata	Artemisia tridentata Nutt. subsp. tridentata
JM1: Artemisia tridentata subsp. vaseyana	Artemisia tridentata subsp. vaseyana (Rydb.) Beetle
JM1: Artemisia tridentata subsp. wyomingensis	Artemisia tridentata subsp. wyomingensis Beetle & A.L. Young
JM2: Arthrocnemum subterminale	Arthrocnemum subterminale (Parish) Standl.
JM1: Arum italicum	Arum italicum Mill.
JM2: Arum palaestinum	Arum palaestinum Boiss.
JM2: Aruncus dioicus	Aruncus dioicus (Walter) Fernald
JM2: Aruncus dioicus var. acuminatus	Aruncus dioicus (Walter) Fernald var. acuminatus (Rydb.) H. Hara
JM1: Aruncus dioicus var. pubescens	Aruncus dioicus (Walter) Fernald var. acuminatus (Rydb.) H. Hara
JM1: Arundo donax	Arundo donax L.
JM1: Asarum caudatum	Asarum caudatum Lindl.
JM1: Asarum hartwegii	Asarum hartwegii S. Watson
JM1: Asarum lemmonii	Asarum lemmonii S. Watson
JM1: Asarum marmoratum	Asarum marmoratum Piper
JM1: Asclepias albicans	Asclepias albicans S. Watson
JM2: Asclepias asperula	Asclepias asperula (Decne.) Woodson
JM1: Asclepias asperula subsp. asperula	Asclepias asperula (Decne.) Woodson subsp. asperula
JM1: Asclepias californica	Asclepias californica Greene
JMS: Asclepias californica subsp. californica	Asclepias californica Greene
JMS: Asclepias californica subsp. greenei	Asclepias californica Greene
JM1: Asclepias cordifolia	Asclepias cordifolia (Benth.) Jeps.
JM1: Asclepias cryptoceras	Asclepias cryptoceras S. Watson
JMS: Asclepias cryptoceras subsp. davisii	Asclepias cryptoceras S. Watson
JM1: Asclepias curassavica	Asclepias curassavica L.
JM1: Asclepias eriocarpa	Asclepias eriocarpa Benth.
JM1: Asclepias erosa	Asclepias erosa Torr.
JM1: Asclepias fascicularis	Asclepias fascicularis Decne.
JM2: Asclepias fruticosa	Asclepias fruticosa L.
JM2: Asclepias latifolia	Asclepias latifolia (Torr.) Raf.
JM1: Asclepias linaria	Asclepias linaria Cav.
JM1: Asclepias nyctaginifolia	Asclepias nyctaginifolia A. Gray
JM1: Asclepias solanoana	Asclepias solanoana Woodson
JM1: Asclepias speciosa	Asclepias speciosa Torr.
JM1: Asclepias subulata	Asclepias subulata Decne.
JM1: Asclepias vestita	Asclepias vestita Hook. & Arn.
JMS: Asclepias vestita var. parishii	Asclepias vestita Hook. & Arn.
JM2: Asparagus aethiopicus	Asparagus aethiopicus L.
JM1: Asparagus asparagoides	Asparagus asparagoides (L.) Druce
JMS: Asparagus densiflorus	Asparagus aethiopicus L.
JM2: Asparagus officinalis	Asparagus officinalis L.
JM1: Asparagus officinalis subsp. officinalis	Asparagus officinalis L. subsp. officinalis
JM2: Asparagus setaceus	Asparagus setaceus (Kunth) Jessop
JM1: Asperugo procumbens	Asperugo procumbens L.
JM1: Asphodelus fistulosus	Asphodelus fistulosus L.
JM1: Aspidotis californica	Aspidotis californica (Hook.) Copel.
JM1: Aspidotis carlotta-halliae	Aspidotis carlotta-halliae (W.H. Wagner & E.F. Gilbert) Lellinger
JM1: Aspidotis densa	Aspidotis densa (Brack.) Lellinger
JM1: Asplenium septentrionale	Asplenium septentrionale (L.) Hoffm.
JM2: Asplenium trichomanes	Asplenium trichomanes L.
JM1: Asplenium trichomanes subsp. trichomanes	Asplenium trichomanes L. subsp. trichomanes
JM1: Asplenium trichomanes-ramosum	Asplenium viride Huds.
JM1: Asplenium vespertinum	Asplenium vespertinum Maxon
JM2: Asplenium viride	Asplenium viride Huds.
JMS: Aster alpigenus	Oreostemma alpigenum (Torr. & A. Gray) Greene
JM1: Aster alpigenus var. andersonii	Oreostemma alpigenum (Torr. & A. Gray) Greene var. andersonii (A. Gray) G.L. Nesom
JM1: Aster ascendens	Symphyotrichum ascendens (Lindl.) G.L. Nesom
JMS: Aster ascendens var. parryi	Symphyotrichum foliaceum var. parryi (D.C. Eaton) G.L. Nesom
JMS: Aster bahamensis	Symphyotrichum subulatum var. elongatum (A.G. Jones & Lowry) S.D. Sundb.
JM1: Aster bernardinus	Symphyotrichum defoliatum (Parish) G.L. Nesom
JM1: Aster breweri	Eucephalus breweri (A. Gray) G.L. Nesom
JM1: Aster brickellioides	Eucephalus tomentellus (Greene) Greene
JMS: Aster brickellioides var. glabratus	Eucephalus glabratus (Greene) Greene
JM1: Aster campestris	Symphyotrichum campestre (Nutt.) G.L. Nesom
JM1: Aster chilensis	Symphyotrichum chilense (Nees) G.L. Nesom; Symphyotrichum ascendens (Lindl.) G.L. Nesom; Symphyotrichum defoliatum (Parish) G.L. Nesom; Symphyotrichum lentum (Greene) G.L. Nesom
JMS: Aster chilensis subsp. ascendens	Symphyotrichum ascendens (Lindl.) G.L. Nesom
JMS: Aster chilensis var. bernardinus	Symphyotrichum defoliatum (Parish) G.L. Nesom
JMS: Aster chilensis var. lentus	Symphyotrichum lentum (Greene) G.L. Nesom
JMS: Aster chilensis var. sonomensis	Symphyotrichum lentum (Greene) G.L. Nesom
JM1: Aster eatonii	Symphyotrichum bracteolatum (Nutt.) G.L. Nesom
JM1: Aster engelmannii	Eucephalus engelmannii (D.C. Eaton) Greene
JM1: Aster foliaceus	Symphyotrichum foliaceum (DC.) G.L. Nesom; Symphyotrichum hendersonii (Fernald) G.L. Nesom
JMS: Aster foliaceus var. apricus	Symphyotrichum foliaceum var. apricum (A. Gray) G.L. Nesom
JM1: Aster foliaceus var. lyallii	Symphyotrichum hendersonii (Fernald) G.L. Nesom
JM1: Aster foliaceus var. parryi	Symphyotrichum foliaceum var. parryi (D.C. Eaton) G.L. Nesom
JM1: Aster frondosus	Symphyotrichum frondosum (Nutt.) G.L. Nesom
JM1: Aster greatae	Symphyotrichum greatae (Parish) G.L. Nesom
JMS: Aster hendersonii	Symphyotrichum hendersonii (Fernald) G.L. Nesom
JMS: Aster hesperius	Symphyotrichum lanceolatum (Willd.) G.L. Nesom var. hesperium (A. Gray) G.L. Nesom
JM1: Aster integrifolius	Eurybia integrifolia (Nutt.) G.L. Nesom
JMS: Aster lanceolatus	Symphyotrichum lanceolatum (Willd.) G.L. Nesom
JM1: Aster lanceolatus subsp. hesperius	Symphyotrichum lanceolatum (Willd.) G.L. Nesom var. hesperium (A. Gray) G.L. Nesom
JM1: Aster ledophyllus	excluded
JMS: Aster ledophyllus var. covillei	Eucephalus ledophyllus (A. Gray) Greene var. covillei (Greene) G.L. Nesom
JM1: Aster lentus	Symphyotrichum lentum (Greene) G.L. Nesom
JM1: Aster occidentalis	Symphyotrichum spathulatum (Lindl.) G.L. Nesom
JMS: Aster occidentalis var. delectabilis	Symphyotrichum spathulatum (Lindl.) G.L. Nesom var. spathulatum
JMS: Aster occidentalis var. intermedius	Symphyotrichum spathulatum var. intermedium (A. Gray) G.L. Nesom
JM1: Aster occidentalis var. occidentalis	Symphyotrichum spathulatum (Lindl.) G.L. Nesom var. spathulatum
JMS: Aster occidentalis var. parishii	Symphyotrichum spathulatum (Lindl.) G.L. Nesom var. spathulatum
JM1: Aster occidentalis var. yosemitanus	Symphyotrichum spathulatum var. yosemitanum (A. Gray) G.L. Nesom
JM1: Aster oregonensis	Sericocarpus oregonensis subsp. oregonensis; Sericocarpus oregonensis subsp. californicus; Sericocarpus oregonensis Nutt.
JMS: Aster oregonensis subsp. californicus	Sericocarpus oregonensis subsp. californicus (Durand) Ferris
JMS: Aster oregonensis subsp. oregonensis	Sericocarpus oregonensis Nutt. subsp. oregonensis
JMS: Aster paludicola	Symphyotrichum spathulatum var. yosemitanum (A. Gray) G.L. Nesom
JM1: Aster pauciflorus	Almutaster pauciflorus (Nutt.) &Aacute;. L&ouml;ve & D. L&ouml;ve
JM1: Aster peirsonii	Oreostemma peirsonii (Sharsm.) G.L. Nesom
JM1: Aster radulinus	Eurybia radulina (A. Gray) G.L. Nesom
JM1: Aster scopulorum	Ionactis alpina (Nutt.) Greene
JMS: Aster sibiricus	Eurybia merita (A. Nelson) G.L. Nesom
JMS: Aster sibiricus var. meritus	Eurybia merita (A. Nelson) G.L. Nesom
JMS: Aster siskiyouensis	Eucephalus glabratus (Greene) Greene
JMS: Aster spathulatus	Symphyotrichum spathulatum (Lindl.) G.L. Nesom
JMS: Aster spathulatus var. intermedius	Symphyotrichum spathulatum var. intermedium (A. Gray) G.L. Nesom
JMS: Aster squamatum	Symphyotrichum subulatum var. squamatum (Spreng.) S.D. Sundb.
JMS: Aster subspicatus	Symphyotrichum subspicatum (Nees) G.L. Nesom
JMS: Aster subulatus	Symphyotrichum subulatum (Michx.) G.L. Nesom
JMS: Aster subulatus var. cubensis	Symphyotrichum subulatum var. parviflorum (Nees) S.D. Sundb.
JMS: Aster subulatus var. elongatus	Symphyotrichum subulatum var. elongatum (A.G. Jones & Lowry) S.D. Sundb.
JM1: Aster subulatus var. ligulatus	excluded
JMS: Aster vialis	Eucephalus vialis Bradshaw
JM2: Astragalus accidens	Astragalus accidens S. Watson
JM1: Astragalus accidens var. hendersonii	Astragalus accidens S. Watson var. hendersonii (S. Watson) M.E. Jones
JM1: Astragalus acutirostris	Astragalus acutirostris S. Watson
JM1: Astragalus agnicidus	Astragalus agnicidus Barneby
JM1: Astragalus agrestis	Astragalus agrestis G. Don
JM1: Astragalus albens	Astragalus albens Greene
JM2: Astragalus allochrous	Astragalus allochrous A. Gray
JM1: Astragalus allochrous var. playanus	Astragalus allochrous A. Gray var. playanus (M.E. Jones) Isely
JM1: Astragalus andersonii	Astragalus andersonii A. Gray
JM1: Astragalus anxius	Astragalus anxius Meinke & Kaye
JM2: Astragalus argophyllus	Astragalus argophyllus Nutt.
JM1: Astragalus argophyllus var. argophyllus	Astragalus argophyllus Nutt. var. argophyllus
JM1: Astragalus aridus	Astragalus aridus A. Gray
JM1: Astragalus asymmetricus	Astragalus asymmetricus E. Sheld.
JM2: Astragalus atratus	Astragalus atratus S. Watson
JM1: Astragalus atratus var. mensanus	Astragalus atratus S. Watson var. mensanus M.E. Jones
JM1: Astragalus austiniae	Astragalus austiniae Brewer & S. Watson
JM1: Astragalus bernardianus	Astragalus bernardinus M.E. Jones
JM2: Astragalus bernardinus	Astragalus bernardinus M.E. Jones
JM1: Astragalus bicristatus	Astragalus bicristatus A. Gray
JM1: Astragalus bolanderi	Astragalus bolanderi A. Gray
JM1: Astragalus brauntonii	Astragalus brauntonii Parish
JM1: Astragalus breweri	Astragalus breweri A. Gray
JM1: Astragalus californicus	Astragalus californicus (A. Gray) Greene
JM2: Astragalus calycosus	Astragalus calycosus S. Watson
JM1: Astragalus calycosus var. calycosus	Astragalus calycosus S. Watson var. calycosus
JM2: Astragalus canadensis	Astragalus canadensis L.
JM1: Astragalus canadensis var. brevidens	Astragalus canadensis L. var. brevidens (Gand.) Barneby
JM1: Astragalus casei	Astragalus casei A. Gray
JM2: Astragalus cicer	Astragalus cicer L.
JM1: Astragalus cimae	Astragalus cimae M.E. Jones
JM1: Astragalus cimae var. cimae	Astragalus cimae M.E. Jones var. cimae
JM1: Astragalus cimae var. sufflatus	Astragalus cimae var. sufflatus Barneby
JM2: Astragalus claranus	Astragalus claranus Jeps.
JM1: Astragalus clarianus	Astragalus claranus Jeps.
JM1: Astragalus clevelandii	Astragalus clevelandii Greene
JM1: Astragalus coccineus	Astragalus coccineus Brandegee
JM1: Astragalus congdonii	Astragalus congdonii S. Watson
JM1: Astragalus crotalariae	Astragalus crotalariae (Benth.) Torr.
JM1: Astragalus curtipes	Astragalus curtipes A. Gray
JM2: Astragalus curvicarpus	Astragalus curvicarpus (A. Heller) Macbr.
JM1: Astragalus curvicarpus var. curvicarpus	Astragalus curvicarpus (A. Heller) Macbr. var. curvicarpus
JM1: Astragalus deanei	Astragalus deanei (Rydb.) Barneby
JM1: Astragalus didymocarpus	Astragalus didymocarpus Hook. & Arn.
JM1: Astragalus didymocarpus var. didymocarpus	Astragalus didymocarpus Hook. & Arn. var. didymocarpus
JM1: Astragalus didymocarpus var. dispermus	Astragalus didymocarpus var. dispermus (A. Gray) Jeps.
JM1: Astragalus didymocarpus var. milesianus	Astragalus didymocarpus var. milesianus (Rydb.) Jeps.
JM1: Astragalus didymocarpus var. obispoensis	Astragalus didymocarpus var. obispoensis (Rydb.) Jeps.
JM1: Astragalus douglasii	Astragalus douglasii (Torr. & A. Gray) A. Gray
JM1: Astragalus douglasii var. douglasii	Astragalus douglasii (Torr. & A. Gray) A. Gray var. douglasii
JM1: Astragalus douglasii var. parishii	Astragalus douglasii var. parishii (A. Gray) M.E. Jones
JM1: Astragalus douglasii var. perstrictus	Astragalus douglasii var. perstrictus (Rydb.) Munz & McBurney
JM1: Astragalus ertterae	Astragalus ertterae Barneby & Shevock
JM1: Astragalus filipes	Astragalus filipes A. Gray
JM1: Astragalus funereus	Astragalus funereus M.E. Jones
JM1: Astragalus gambelianus	Astragalus gambelianus E. Sheld.
JM2: Astragalus geyeri	Astragalus geyeri A. Gray
JM1: Astragalus geyeri var. geyeri	Astragalus geyeri A. Gray var. geyeri
JM1: Astragalus gibbsii	Astragalus gibbsii Kellogg
JM1: Astragalus gilmanii	Astragalus gilmanii Tidestr.
JM2: Astragalus hornii	Astragalus hornii A. Gray
JM1: Astragalus hornii var. hornii	Astragalus hornii A. Gray var. hornii
JM2: Astragalus insularis	Astragalus insularis Kellogg
JM1: Astragalus insularis var. harwoodii	Astragalus insularis Kellogg var. harwoodii Munz & McBurney
JM1: Astragalus inversus	Astragalus inversus M.E. Jones
JM1: Astragalus inyoensis	Astragalus inyoensis Coville
JM2: Astragalus iodanthus	Astragalus iodanthus S. Watson
JM2: Astragalus iodanthus var. diaphanoides	Astragalus iodanthus var. diaphanoides Barneby
JM1: Astragalus iodanthus var. iodanthus	Astragalus iodanthus S. Watson var. iodanthus
JM1: Astragalus jaegerianus	Astragalus jaegerianus Munz
JM1: Astragalus johannis-howellii	Astragalus johannis-howellii Barneby
JM1: Astragalus kentrophyta	Astragalus kentrophyta A. Gray
JM1: Astragalus kentrophyta var. danaus	Astragalus kentrophyta var. danaus (Barneby) Barneby
JM1: Astragalus kentrophyta var. elatus	Astragalus kentrophyta var. elatus S. Watson
JMS: Astragalus kentrophyta var. implexus	Astragalus kentrophyta var. tegetarius (S. Watson) Dorn
JM1: Astragalus kentrophyta var. tegetarius	Astragalus kentrophyta var. tegetarius (S. Watson) Dorn
JM2: Astragalus kentrophyta var. ungulatus	Astragalus kentrophyta var. ungulatus M.E. Jones
JM1: Astragalus layneae	Astragalus layneae Greene
JM1: Astragalus lemmonii	Astragalus lemmonii A. Gray
JM1: Astragalus lentiformis	Astragalus lentiformis A. Gray
JM1: Astragalus lentiginosus	Astragalus lentiginosus Douglas
JM1: Astragalus lentiginosus var. albifolius	Astragalus lentiginosus var. albifolius M.E. Jones
JM1: Astragalus lentiginosus var. antonius	Astragalus lentiginosus var. antonius Barneby
JM1: Astragalus lentiginosus var. borreganus	Astragalus lentiginosus var. borreganus M.E. Jones
JM2: Astragalus lentiginosus var. chartaceus	Astragalus lentiginosus var. chartaceus M.E. Jones
JM1: Astragalus lentiginosus var. coachellae	Astragalus lentiginosus var. coachellae Barneby
JM1: Astragalus lentiginosus var. floribundus	Astragalus lentiginosus var. floribundus A. Gray
JM1: Astragalus lentiginosus var. fremontii	Astragalus lentiginosus var. fremontii (A. Gray) S. Watson
JM1: Astragalus lentiginosus var. idriensis	Astragalus lentiginosus var. idriensis M.E. Jones
JM1: Astragalus lentiginosus var. ineptus	Astragalus lentiginosus var. ineptus (A. Gray) M.E. Jones
JM1: Astragalus lentiginosus var. kernensis	Astragalus lentiginosus var. kernensis (Jeps.) Barneby
JM1: Astragalus lentiginosus var. lentiginosus	Astragalus lentiginosus Douglas var. lentiginosus
JM1: Astragalus lentiginosus var. micans	Astragalus lentiginosus var. micans Barneby
JM1: Astragalus lentiginosus var. nigricalycis	Astragalus lentiginosus var. nigricalycis M.E. Jones
JM1: Astragalus lentiginosus var. piscinensis	Astragalus lentiginosus var. piscinensis Barneby
JM1: Astragalus lentiginosus var. platyphyllidius	Astragalus lentiginosus var. chartaceus M.E. Jones
JM1: Astragalus lentiginosus var. salinus	Astragalus lentiginosus var. salinus (Howell) Barneby
JM1: Astragalus lentiginosus var. semotus	Astragalus lentiginosus var. semotus Jeps.
JM1: Astragalus lentiginosus var. sesquimetralis	Astragalus lentiginosus var. sesquimetralis (Rydb.) Barneby
JM1: Astragalus lentiginosus var. sierrae	Astragalus lentiginosus var. sierrae M.E. Jones
JM1: Astragalus lentiginosus var. variabilis	Astragalus lentiginosus var. variabilis Barneby
JM1: Astragalus leucolobus	Astragalus leucolobus M.E. Jones
JM1: Astragalus macrodon	Astragalus macrodon (Hook. & Arn.) A. Gray
JM2: Astragalus magdalenae	Astragalus magdalenae Greene
JM1: Astragalus magdalenae var. peirsonii	Astragalus magdalenae Greene var. peirsonii (Munz & McBurney) Barneby
JM1: Astragalus malacus	Astragalus malacus A. Gray
JM1: Astragalus miguelensis	Astragalus miguelensis Greene
JM2: Astragalus minthorniae	Astragalus minthorniae (Rydb.) Jeps.
JM1: Astragalus minthorniae var. villosus	Astragalus minthorniae (Rydb.) Jeps. var. villosus Barneby
JM1: Astragalus mohavensis	Astragalus mohavensis S. Watson
JM1: Astragalus mohavensis var. hemigyrus	Astragalus mohavensis var. hemigyrus (Clokey) Barneby
JM1: Astragalus mohavensis var. mohavensis	Astragalus mohavensis S. Watson var. mohavensis
JM1: Astragalus monoensis	Astragalus monoensis Barneby
JM1: Astragalus nevinii	Astragalus nevinii A. Gray
JM2: Astragalus newberryi	Astragalus newberryi A. Gray
JM1: Astragalus newberryi var. newberryi	Astragalus newberryi A. Gray var. newberryi
JM1: Astragalus nutans	Astragalus nutans M.E. Jones
JM1: Astragalus nuttallianus	Astragalus nuttallianus DC.
JM1: Astragalus nuttallianus var. austrinus	Astragalus nuttallianus var. austrinus (Small) Barneby
JM1: Astragalus nuttallianus var. cedrosensis	Astragalus nuttallianus var. cedrosensis M.E. Jones
JM1: Astragalus nuttallianus var. imperfectus	Astragalus nuttallianus var. imperfectus (Rydb.) Barneby
JM1: Astragalus nuttallii	Astragalus nuttallii (Torr. & A. Gray) J.T. Howell
JM1: Astragalus nuttallii var. nuttallii	Astragalus nuttallii (Torr. & A. Gray) J.T. Howell var. nuttallii
JM1: Astragalus nuttallii var. virgatus	Astragalus nuttallii var. virgatus (A. Gray) Barneby
JM1: Astragalus obscurus	Astragalus obscurus S. Watson
JM1: Astragalus oocarpus	Astragalus oocarpus A. Gray
JM1: Astragalus oophorous	Astragalus oophorus S. Watson
JM1: Astragalus oophorous var. lavinii	Astragalus oophorus var. lavinii Barneby
JM1: Astragalus oophorous var. oophorous	Astragalus oophorus S. Watson var. oophorus
JM2: Astragalus oophorus	Astragalus oophorus S. Watson
JM2: Astragalus oophorus var. lavinii	Astragalus oophorus var. lavinii Barneby
JM2: Astragalus oophorus var. oophorus	Astragalus oophorus S. Watson var. oophorus
JM1: Astragalus oxyphysus	Astragalus oxyphysus A. Gray
JM1: Astragalus pachypus	Astragalus pachypus Greene
JM1: Astragalus pachypus var. jaegeri	Astragalus pachypus var. jaegeri Munz & McBurney
JM1: Astragalus pachypus var. pachypus	Astragalus pachypus Greene var. pachypus
JM1: Astragalus palmeri	Astragalus palmeri A. Gray
JM1: Astragalus panamintensis	Astragalus panamintensis E. Sheld.
JM1: Astragalus pauperculus	Astragalus pauperculus Greene
JM1: Astragalus platytropis	Astragalus platytropis A. Gray
JM1: Astragalus pomonensis	Astragalus pomonensis M.E. Jones
JM1: Astragalus preussii	Astragalus preussii A. Gray
JM1: Astragalus preussii var. laxiflorus	Astragalus preussii var. laxiflorus A. Gray
JM1: Astragalus preussii var. preussii	Astragalus preussii A. Gray var. preussii
JM1: Astragalus pseudiodanthus	Astragalus pseudiodanthus Barneby
JM1: Astragalus pulsiferae	Astragalus pulsiferae A. Gray
JM2: Astragalus pulsiferae var. coronensis	Astragalus pulsiferae var. coronensis S.L. Welsh et al.
JM1: Astragalus pulsiferae var. pulsiferae	Astragalus pulsiferae A. Gray var. pulsiferae
JM1: Astragalus pulsiferae var. suksdorfii	Astragalus pulsiferae var. suksdorfii (Howell) Barneby
JM1: Astragalus purshii	Astragalus purshii Douglas; Astragalus funereus M.E. Jones
JMS: Astragalus purshii var. funereus	Astragalus funereus M.E. Jones
JM1: Astragalus purshii var. lagopinus	Astragalus purshii var. lagopinus (Rydb.) Barneby
JM1: Astragalus purshii var. lectulus	Astragalus purshii var. lectulus (S. Watson) M.E. Jones
JM1: Astragalus purshii var. purshii	Astragalus purshii Douglas var. purshii
JM1: Astragalus purshii var. tinctus	Astragalus purshii var. tinctus M.E. Jones
JM1: Astragalus pycnostachyus	Astragalus pycnostachyus A. Gray
JM1: Astragalus pycnostachyus var. lanosissimus	Astragalus pycnostachyus var. lanosissimus (Rydb.) Munz & McBurney
JM1: Astragalus pycnostachyus var. pycnostachyus	Astragalus pycnostachyus A. Gray var. pycnostachyus
JM1: Astragalus rattanii	Astragalus rattanii A. Gray
JM1: Astragalus rattanii var. jepsonianus	Astragalus rattanii var. jepsonianus Barneby
JM1: Astragalus rattanii var. rattanii	Astragalus rattanii A. Gray var. rattanii
JM1: Astragalus ravenii	Astragalus ravenii Barneby
JM1: Astragalus sabulonum	Astragalus sabulonum A. Gray
JM1: Astragalus sepultipes	Astragalus sepultipes (Barneby) Barneby
JM2: Astragalus serenoi	Astragalus serenoi (Kuntze) E. Sheld.
JM1: Astragalus serenoi var. shockleyi	Astragalus serenoi (Kuntze) E. Sheld. var. shockleyi (M.E. Jones) Barneby
JM1: Astragalus shevockii	Astragalus shevockii Barneby
JM1: Astragalus subvestitus	Astragalus subvestitus (Jeps.) Barneby
JMS: Astragalus tegetarioides	Astragalus anxius Meinke & Kaye
JMS: Astragalus tegetarioides var. anxius	Astragalus anxius Meinke & Kaye
JM1: Astragalus tener	Astragalus tener A. Gray
JM1: Astragalus tener var. ferrisiae	Astragalus tener var. ferrisiae Liston
JM1: Astragalus tener var. tener	Astragalus tener A. Gray var. tener
JM1: Astragalus tener var. titi	Astragalus tener var. titi (Eastw.) Barneby
JM2: Astragalus tephrodes	Astragalus tephrodes A. Gray
JM1: Astragalus tephrodes var. brachylobus	Astragalus tephrodes A. Gray var. brachylobus (A. Gray) Barneby
JM1: Astragalus tidestromii	Astragalus tidestromii (Rydb.) Clokey
JM1: Astragalus traskiae	Astragalus traskiae Eastw.
JM1: Astragalus tricarinatus	Astragalus tricarinatus A. Gray
JM1: Astragalus trichopodus	Astragalus trichopodus (Nutt.) A. Gray
JM1: Astragalus trichopodus var. lonchus	Astragalus trichopodus var. lonchus (M.E. Jones) Barneby
JM1: Astragalus trichopodus var. phoxus	Astragalus trichopodus var. phoxus (M.E. Jones) Barneby
JM1: Astragalus trichopodus var. trichopodus	Astragalus trichopodus (Nutt.) A. Gray var. trichopodus
JM1: Astragalus umbraticus	Astragalus umbraticus E. Sheld.
JMS: Astragalus vaseyi	Astragalus palmeri A. Gray
JM1: Astragalus webberi	Astragalus webberi A. Gray
JM1: Astragalus whitneyi	Astragalus whitneyi A. Gray
JM1: Astragalus whitneyi var. confusus	Astragalus whitneyi var. confusus Barneby
JM1: Astragalus whitneyi var. lenophyllus	Astragalus whitneyi var. lenophyllus (Rydb.) Barneby
JM1: Astragalus whitneyi var. siskiyouensis	Astragalus whitneyi var. siskiyouensis (Rydb.) Barneby
JM1: Astragalus whitneyi var. whitneyi	Astragalus whitneyi A. Gray var. whitneyi
JM1: Astrolepis cochisensis	Astrolepis cochisensis (Goodd.) D.M. Benham & Windham
JM2: Asyneuma prenanthoides	Asyneuma prenanthoides (Durand) McVaugh
JMS: Athyrium alpestre	Athyrium distentifolium Opiz
JM1: Athyrium alpestre var. americanum	Athyrium distentifolium Opiz var. americanum (Butters) Cronquist
JM2: Athyrium distentifolium	Athyrium distentifolium Opiz
JM2: Athyrium distentifolium var. americanum	Athyrium distentifolium Opiz var. americanum (Butters) Cronquist
JM2: Athyrium filix-femina	Athyrium filix-femina (L.) Roth
JMS: Athyrium filix-femina var. californicum	Athyrium filix-femina (L.) Roth var. cyclosorum Rupr.
JM1: Athyrium filix-femina var. cyclosorum	Athyrium filix-femina (L.) Roth var. cyclosorum Rupr.
JM1: Athysanus pusillus	Athysanus pusillus (Hook.) Greene
JM2: Athysanus unilateralis	Athysanus unilateralis (M.E. Jones) Jeps.
JM1: Atrichoseris platyphylla	Atrichoseris platyphylla (A. Gray) A. Gray
JM2: Atriplex amnicola	Atriplex amnicola Paul G. Wilson
JM1: Atriplex argentea	Atriplex argentea Nutt.
JMS: Atriplex argentea subsp. expansa	Atriplex argentea var. expansa (S. Watson) S.L. Welsh & Reveal
JM1: Atriplex argentea var. argentea	Atriplex argentea Nutt. var. argentea
JM2: Atriplex argentea var. expansa	Atriplex argentea var. expansa (S. Watson) S.L. Welsh & Reveal
JM1: Atriplex argentea var. hillmanii	Atriplex argentea var. hillmanii M.E. Jones
JM2: Atriplex argentea var. longitrichoma	Atriplex argentea var. longitrichoma (Stutz et al.) S.L. Welsh
JM1: Atriplex argentea var. mohavensis	Atriplex argentea var. expansa (S. Watson) S.L. Welsh & Reveal
JMS: Atriplex bracteosa	Atriplex serenana Abrams
JM1: Atriplex californica	Atriplex californica Moq.
JM1: Atriplex canescens	Atriplex canescens (Pursh) Nutt.
JM1: Atriplex canescens subsp. canescens	Atriplex canescens (Pursh) Nutt. var. canescens
JM1: Atriplex canescens subsp. linearis	Atriplex canescens var. linearis (S. Watson) Munz
JM2: Atriplex canescens var. canescens	Atriplex canescens (Pursh) Nutt. var. canescens
JM2: Atriplex canescens var. laciniata	Atriplex canescens var. laciniata Parish
JM2: Atriplex canescens var. linearis	Atriplex canescens var. linearis (S. Watson) Munz
JM2: Atriplex canescens var. macilenta	Atriplex canescens var. macilenta Jeps.
JM1: Atriplex confertifolia	Atriplex confertifolia (Torr. & Fr&eacute;m.) S. Watson
JM1: Atriplex cordulata	Atriplex cordulata Jeps.; Atriplex tularensis Coville
JM2: Atriplex cordulata var. cordulata	Atriplex cordulata Jeps. var. cordulata
JM2: Atriplex cordulata var. erecticaulis	Atriplex cordulata var. erecticaulis (Stutz et al.) S.L. Welsh
JMS: Atriplex cordulata var. tularensis	Atriplex tularensis Coville
JM1: Atriplex coronata	Atriplex coronata S. Watson
JM1: Atriplex coronata var. coronata	Atriplex coronata S. Watson var. coronata
JM1: Atriplex coronata var. notatior	Atriplex coronata var. notatior Jeps.
JM2: Atriplex coronata var. vallicola	Atriplex coronata var. vallicola (Hoover) S.L. Welsh
JMS: Atriplex coronata var. verna	Atriplex coronata S. Watson var. coronata
JM1: Atriplex coulteri	Atriplex coulteri (Moq.) D. Dietr.
JM2: Atriplex covillei	Atriplex covillei (Standl.) J.F. Macbr.
JMS: Atriplex curvidens	Atriplex polycarpa (Torr.) S. Watson
JMS: Atriplex davidsonii	Atriplex serenana var. davidsonii (Standl.) Munz
JMS: Atriplex decumbens	Atriplex watsonii Abrams
JM1: Atriplex depressa	Atriplex depressa Jeps.
JM2: Atriplex dioica	Atriplex dioica Raf.
JM1: Atriplex elegans	Atriplex elegans (Moq.) D. Dietr.
JMS: Atriplex elegans subsp. fasciculata	Atriplex elegans var. fasciculata (S. Watson) M.E. Jones
JM1: Atriplex elegans var. elegans	Atriplex elegans (Moq.) D. Dietr. var. elegans
JM1: Atriplex elegans var. fasciculata	Atriplex elegans var. fasciculata (S. Watson) M.E. Jones
JMS: Atriplex erecticaulis	Atriplex cordulata var. erecticaulis (Stutz et al.) S.L. Welsh
JMS: Atriplex expansa	Atriplex argentea var. expansa (S. Watson) S.L. Welsh & Reveal
JMS: Atriplex falcata	Atriplex gardneri (Moq.) D. Dietr. var. falcata (M.E. Jones) S.L. Welsh
JMS: Atriplex fasciculata	Atriplex elegans var. fasciculata (S. Watson) M.E. Jones
JMS: Atriplex flagellaris	Atriplex semibaccata R. Br.
JM1: Atriplex fruticulosa	Atriplex fruticulosa Jeps.
JM2: Atriplex gardneri	Atriplex gardneri (Moq.) D. Dietr.
JM1: Atriplex gardneri var. falcata	Atriplex gardneri (Moq.) D. Dietr. var. falcata (M.E. Jones) S.L. Welsh
JM2: Atriplex glauca	Atriplex glauca L.
JM2: Atriplex gmelinii	Atriplex gmelinii Bong.
JM2: Atriplex gmelinii var. gmelinii	Atriplex gmelinii Bong. var. gmelinii
JMS: Atriplex halimoides	Atriplex lindleyi Moq.
JMS: Atriplex hastata	Atriplex prostrata DC.
JMS: Atriplex hastata subsp. patula	Atriplex patula L.
JMS: Atriplex hastata var. patula	Atriplex patula L.
JM1: Atriplex heterosperma	Atriplex micrantha Ledeb.
JMS: Atriplex hillmanii	Atriplex argentea var. hillmanii M.E. Jones
JM1: Atriplex hortensis	Atriplex hortensis L.
JM1: Atriplex hymenelytra	Atriplex hymenelytra (Torr.) S. Watson
JM2: Atriplex joaquinana	Atriplex joaquinana A. Nelson
JM1: Atriplex joaquiniana	Atriplex joaquinana A. Nelson
JMS: Atriplex johnstonii	Atriplex nummularia Lindl.
JM1: Atriplex lentiformis	Atriplex lentiformis (Torr.) S. Watson; Atriplex torreyi (S. Watson) S. Watson
JM1: Atriplex lentiformis subsp. lentiformis	Atriplex torreyi (S. Watson) S. Watson
JM1: Atriplex lentiformis subsp. torreyi	Atriplex torreyi (S. Watson) S. Watson var. torreyi
JMS: Atriplex lentiformis var. torreyi	Atriplex torreyi (S. Watson) S. Watson var. torreyi
JM1: Atriplex leucophylla	Atriplex leucophylla (Moq.) D. Dietr.
JM1: Atriplex lindleyi	Atriplex lindleyi Moq.
JMS: Atriplex linearis	Atriplex canescens var. linearis (S. Watson) Munz
JMS: Atriplex longitrichoma	Atriplex argentea var. longitrichoma (Stutz et al.) S.L. Welsh
JM2: Atriplex micrantha	Atriplex micrantha Ledeb.
JM1: Atriplex minuscula	Atriplex minuscula Standl.
JMS: Atriplex nitens	Atriplex hortensis L.
JM1: Atriplex nummularia	Atriplex nummularia Lindl.
JMS: Atriplex nuttallii	Atriplex canescens (Pursh) Nutt.
JMS: Atriplex nuttallii var. falcata	Atriplex gardneri (Moq.) D. Dietr. var. falcata (M.E. Jones) S.L. Welsh
JM1: Atriplex pacifica	Atriplex pacifica A. Nelson
JM1: Atriplex parishii	Atriplex parishii S. Watson; Atriplex depressa Jeps.; Atriplex minuscula Standl.; Atriplex persistens Stutz & G.L. Chu; Atriplex subtilis Stutz & G.L. Chu
JMS: Atriplex parishii var. depressa	Atriplex depressa Jeps.
JMS: Atriplex parishii var. minuscula	Atriplex minuscula Standl.
JMS: Atriplex parishii var. persistens	Atriplex persistens Stutz & G.L. Chu
JMS: Atriplex parishii var. subtilis	Atriplex subtilis Stutz & G.L. Chu
JM1: Atriplex parryi	Atriplex parryi S. Watson
JM1: Atriplex patula	Atriplex patula L.; Atriplex prostrata DC.; Atriplex joaquinana A. Nelson; Atriplex gmelinii Bong.; Atriplex dioica Raf.
JMS: Atriplex patula subsp. hastata	Atriplex prostrata DC.
JMS: Atriplex patula subsp. spicata	Atriplex joaquinana A. Nelson
JM1: Atriplex patula var. obtusa	Atriplex gmelinii Bong. var. gmelinii
JM1: Atriplex patula var. patula	Atriplex patula L.
JMS: Atriplex patula var. subspicata	Atriplex dioica Raf.
JM2: Atriplex persistens	Atriplex persistens Stutz & G.L. Chu
JM1: Atriplex phyllostegia	Atriplex covillei (Standl.) J.F. Macbr.
JM1: Atriplex polycarpa	Atriplex polycarpa (Torr.) S. Watson
JM2: Atriplex prostrata	Atriplex prostrata DC.
JM1: Atriplex pusilla	Atriplex pusilla (S. Watson) S. Watson
JMS: Atriplex ramosissima	Atriplex pacifica A. Nelson
JM1: Atriplex rosea	Atriplex rosea L.
JMS: Atriplex saltonensis	Atriplex elegans var. fasciculata (S. Watson) M.E. Jones
JM1: Atriplex semibaccata	Atriplex semibaccata R. Br.
JM1: Atriplex serenana	Atriplex serenana Abrams
JM1: Atriplex serenana var. davidsonii	Atriplex serenana var. davidsonii (Standl.) Munz
JM1: Atriplex serenana var. serenana	Atriplex serenana Abrams var. serenana
JMS: Atriplex spicata	Atriplex joaquinana A. Nelson
JMS: Atriplex spicata var. lagunita	Atriplex joaquinana A. Nelson
JM1: Atriplex spinifera	Atriplex spinifera J.F. Macbr.
JMS: Atriplex subdecumbens	Atriplex truncata (S. Watson) A. Gray
JM1: Atriplex suberecta	Atriplex suberecta I. Verd.
JM1: Atriplex subspicata	Atriplex dioica Raf.
JM2: Atriplex subtilis	Atriplex subtilis Stutz & G.L. Chu
JM2: Atriplex torreyi	Atriplex torreyi (S. Watson) S. Watson
JM2: Atriplex torreyi var. torreyi	Atriplex torreyi (S. Watson) S. Watson var. torreyi
JM1: Atriplex triangularis	Atriplex prostrata DC.
JMS: Atriplex trinervata	Atriplex argentea var. expansa (S. Watson) S.L. Welsh & Reveal
JM1: Atriplex truncata	Atriplex truncata (S. Watson) A. Gray
JMS: Atriplex truncata var. stricta	Atriplex truncata (S. Watson) A. Gray
JM1: Atriplex tularensis	Atriplex tularensis Coville
JM1: Atriplex vallicola	Atriplex coronata var. vallicola (Hoover) S.L. Welsh
JMS: Atriplex verna	Atriplex coronata S. Watson var. coronata
JM1: Atriplex watsonii	Atriplex watsonii Abrams
JM1: Aubrieta deltoidea	Aubrieta deltoidea (L.) DC.
JM1: Avena barbata	Avena barbata Link
JM1: Avena fatua	Avena fatua L.
JMS: Avena fatua var. sativa	Avena sativa L.
JM1: Avena sativa	Avena sativa L.
JM1: Avena sterilis	Avena sterilis L.
JM1: Avena strigosa	misappl. to Avena barbata
JM2: Avicennia marina	Avicennia marina (Forssk.) Vierh.
JM1: Avicennia marina var. resinifera	Avicennia marina (Forssk.) Vierh. var. australasica (Walp.) Moldenke
JM1: Axonopus affinis	excluded
JM1: Ayenia compacta	Ayenia compacta Rose
JM1: Azolla filiculoides	Azolla filiculoides Lam.
JM1: Azolla mexicana	Azolla microphylla Kaulf.
JM2: Azolla microphylla	Azolla microphylla Kaulf.
JM1: Baccharis brachyphylla	Baccharis brachyphylla A. Gray
JM1: Baccharis douglasii	Baccharis glutinosa Pers.
JM1: Baccharis emoryi	Baccharis salicina Torr. & A. Gray
JMS: Baccharis glutinosa	Baccharis glutinosa Pers.; Baccharis salicifolia (Ruiz & Pav.) Pers. subsp. salicifolia
JM2: Baccharis malibuensis	Baccharis malibuensis R.M. Beauch. & Henrickson
JM1: Baccharis pilularis	Baccharis pilularis DC.
JM2: Baccharis pilularis subsp. consanguinea	Baccharis pilularis subsp. consanguinea (DC.) C.B. Wolf
JM2: Baccharis pilularis subsp. pilularis	Baccharis pilularis DC. subsp. pilularis
JMS: Baccharis pilularis var. consanguinea	Baccharis pilularis subsp. consanguinea (DC.) C.B. Wolf
JM1: Baccharis plummerae	Baccharis plummerae A. Gray
JM1: Baccharis plummerae subsp. glabrata	Baccharis plummerae subsp. glabrata Hoover
JM1: Baccharis plummerae subsp. plummerae	Baccharis plummerae A. Gray subsp. plummerae
JM1: Baccharis salicifolia	Baccharis salicifolia (Ruiz & Pav.) Pers.
JM2: Baccharis salicifolia subsp. salicifolia	Baccharis salicifolia (Ruiz & Pav.) Pers. subsp. salicifolia
JM2: Baccharis salicina	Baccharis salicina Torr. & A. Gray
JM1: Baccharis sarothroides	Baccharis sarothroides A. Gray
JMS: Baccharis sarothroides var. pluricephala	Lepidospartum squamatum (A. Gray) A. Gray
JM1: Baccharis sergiloides	Baccharis sergiloides A. Gray
JM1: Baccharis vanessae	Baccharis vanessae R.M. Beauch.
JM1: Bacopa eisenii	Bacopa eisenii (Kellogg) Pennell
JM1: Bacopa monnieri	Bacopa monnieri (L.) Wettst.
JMS: Bacopa nobsiana	Bacopa rotundifolia (Michx.) Wettst.
JM1: Bacopa repens	Bacopa repens (Sw.) Wettst.
JM1: Bacopa rotundifolia	Bacopa rotundifolia (Michx.) Wettst.
JM1: Bahia dissecta	Amauriopsis dissecta (A. Gray) Rydb.
JM2: Bahia neomexicana	Bahia neomexicana (A. Gray) A. Gray
JM2: Bahiopsis laciniata	Bahiopsis laciniata (A. Gray) E.E. Schill. & Panero
JM2: Bahiopsis parishii	Bahiopsis parishii (Greene) E.E. Schill. & Panero
JM2: Bahiopsis reticulata	Bahiopsis reticulata (S. Watson) E.E. Schill. & Panero
JM2: Baileya multiradiata	Baileya multiradiata Torr.
JM1: Baileya multiradiata var. multiradiata	Baileya multiradiata Torr.
JM1: Baileya pauciradiata	Baileya pauciradiata Harv. & A. Gray
JM1: Baileya pleniradiata	Baileya pleniradiata Harv. & A. Gray
JM1: Balsamorhiza deltoidea	Balsamorhiza deltoidea Nutt.
JM1: Balsamorhiza hirsuta	Balsamorhiza hirsuta Nutt.
JM2: Balsamorhiza hookeri	Balsamorhiza hookeri Nutt.
JM1: Balsamorhiza hookeri var. lanata	Balsamorhiza lanata (W.M. Sharp) W.A. Weber
JM2: Balsamorhiza lanata	Balsamorhiza lanata (W.M. Sharp) W.A. Weber
JM1: Balsamorhiza macrolepis	Balsamorhiza macrolepis W.M. Sharp; Balsamorhiza hookeri Nutt.
JM1: Balsamorhiza macrolepis var. macrolepis	Balsamorhiza macrolepis W.M. Sharp
JM1: Balsamorhiza macrolepis var. platylepis	Balsamorhiza hookeri Nutt.
JM1: Balsamorhiza sagittata	Balsamorhiza sagittata (Pursh) Nutt.
JM1: Balsamorhiza sericea	Balsamorhiza sericea W.A. Weber
JM1: Balsamorhiza serrata	Balsamorhiza serrata A. Nelson & J.F. Macbr.
JM1: Barbarea orthoceras	Barbarea orthoceras Ledeb.
JM1: Barbarea verna	Barbarea verna (Mill.) Asch.
JM1: Barbarea vulgaris	Barbarea vulgaris W.T. Aiton
JM1: Bassia hyssopifolia	Bassia hyssopifolia (Pall.) Kuntze
JMS: Bassia scoparia	Kochia scoparia (L.) Schrad.
JMS: Bassia scoparia var. culta	Kochia scoparia (L.) Schrad. subsp. scoparia
JM1: Batis maritima	Batis maritima L.
JMS: Batis vermiculata	Sarcobatus vermiculatus (Hook.) Torr.
JM2: Bebbia juncea	Bebbia juncea (Benth.) Greene
JM1: Bebbia juncea var. aspera	Bebbia juncea (Benth.) Greene var. aspera Greene
JMS: Beckamannia syzigachne subsp. baicalensis	Beckmannia syzigachne (Steud.) Fernald
JM1: Beckmannia syzigachne	Beckmannia syzigachne (Steud.) Fernald
JM1: Bellardia trixago	Bellardia trixago (L.) All.
JM1: Bellis perennis	Bellis perennis L.
JM2: Benitoa occidentalis	Benitoa occidentalis (H.M. Hall) D.D. Keck
JM1: Bensoniella oregona	Bensoniella oregona (Abrams & Bacig.) C.V. Morton
JM1: Berberis aquifolium	Berberis aquifolium Pursh
JM1: Berberis aquifolium var. aquifolium	Berberis aquifolium Pursh var. aquifolium
JM1: Berberis aquifolium var. dictyota	Berberis aquifolium var. dictyota (Jeps.) Jeps.
JM1: Berberis aquifolium var. repens	Berberis aquifolium var. repens (Lindl.) Scoggan
JM2: Berberis darwinii	Berberis darwinii Hook.
JM1: Berberis fremontii	Berberis fremontii Torr.
JM1: Berberis haematocarpa	Berberis haematocarpa Wooton
JM2: Berberis harrisoniana	Berberis harrisoniana Kearney & Peebles
JM2: Berberis higginsiae	Berberis higginsiae Munz
JM1: Berberis nervosa	Berberis nervosa Pursh
JM1: Berberis nevinii	Berberis nevinii A. Gray
JM1: Berberis pinnata	Berberis pinnata Lag.
JM1: Berberis pinnata subsp. insularis	Berberis pinnata subsp. insularis Munz
JM1: Berberis pinnata subsp. pinnata	Berberis pinnata Lag. subsp. pinnata
JMS: Berberis piperiana	Berberis aquifolium Pursh var. aquifolium
JMS: Berberis repens	Berberis aquifolium var. repens (Lindl.) Scoggan
JM2: Berberis vulgaris	Berberis vulgaris L.
JM1: Bergerocactus emoryi	Bergerocactus emoryi (Engelm.) Britton & Rose
JM1: Bergia texana	Bergia texana (Hook.) Walp.
JM1: Bernardia myricifolia	Bernardia incana C.V. Morton
JM2: Berteroa incana	Berteroa incana (L.) DC.
JM1: Berula erecta	Berula erecta (Huds.) Coville
JM1: Beta vulgaris	excluded
JM2: Beta vulgaris subsp. maritima	Beta vulgaris L. subsp. maritima (L.) Arcang.
JM1: Betula glandulosa	Betula glandulosa Michx.
JM1: Betula occidentalis	Betula occidentalis Hook.
JMS: Betula viridis	Alnus viridis (Chaix) Lam. & DC.
JM2: Bidens cernua	Bidens cernua L.
JM1: Bidens cernua var. cernua	Bidens cernua L.
JM1: Bidens frondosa	Bidens frondosa L.
JM2: Bidens laevis	Bidens laevis (L.) Britton et al.
JM2: Bidens pilosa	Bidens pilosa L.
JM1: Bidens pilosa var. pilosa	Bidens pilosa L.
JM1: Bidens tripartita	Bidens tripartita L.
JM1: Bidens vulgata	Bidens vulgata Greene
JM2: Billardiera heterophylla	Billardiera heterophylla (Lindl.) L.W. Cayzer & Crisp
JMS: Biolettia riparia	Trichocoronis wrightii (Torr. & A. Gray) A. Gray var. wrightii
JM2: Bistorta bistortoides	Bistorta bistortoides (Pursh) Small
JM2: Bituminaria bituminosa	Bituminaria bituminosa (L.) C.H. Stirt.
JM1: Blechnum spicant	Blechnum spicant (L.) Roth
JM1: Blennosperma bakeri	Blennosperma bakeri Heiser
JM1: Blennosperma nanum	Blennosperma nanum (Hook.) S.F. Blake
JM1: Blennosperma nanum var. nanum	Blennosperma nanum (Hook.) S.F. Blake var. nanum
JM1: Blennosperma nanum var. robustum	Blennosperma nanum var. robustum J.T. Howell
JM1: Blepharidachne kingii	Blepharidachne kingii (S. Watson) Hack.
JM1: Blepharipappus scaber	Blepharipappus scaber Hook.
JM2: Blepharizonia laxa	Blepharizonia laxa Greene
JM1: Blepharizonia plumosa	Blepharizonia plumosa (Kellogg) Greene; Blepharizonia laxa Greene
JM1: Blepharizonia plumosa subsp. plumosa	Blepharizonia plumosa (Kellogg) Greene
JM1: Blepharizonia plumosa subsp. viscida	Blepharizonia laxa Greene
JM2: Bloomeria clevelandii	Bloomeria clevelandii S. Watson
JM1: Bloomeria crocea	Bloomeria crocea (Torr.) Coville
JM2: Bloomeria crocea var. aurea	Bloomeria crocea var. aurea (Kellogg) J.W. Ingram
JM2: Bloomeria crocea var. crocea	Bloomeria crocea (Torr.) Coville var. crocea
JM2: Bloomeria crocea var. montana	Bloomeria crocea var. montana (Greene) J.W. Ingram
JM1: Bloomeria humilis	Bloomeria humilis Hoover
JM2: Boechera acutina	Boechera acutina (Greene) Windham & Al-Shehbaz
JM2: Boechera arcuata	Boechera arcuata (Nutt.) Windham & Al-Shehbaz
JM2: Boechera bodiensis	Boechera bodiensis (Rollins) Al-Shehbaz
JM2: Boechera breweri	Boechera breweri (S. Watson) Al-Shehbaz
JM2: Boechera breweri subsp. breweri	Boechera breweri (S. Watson) Al-Shehbaz subsp. breweri
JM2: Boechera breweri subsp. shastaensis	Boechera breweri subsp. shastaensis Windham & Al-Shehbaz
JM2: Boechera calderi	Boechera calderi (G.A. Mulligan) Windham & Al-Shehbaz
JM2: Boechera californica	Boechera californica (Rollins) Windham & Al-Shehbaz
JM2: Boechera cobrensis	Boechera cobrensis (M.E. Jones) Dorn
JM2: Boechera constancei	Boechera constancei (Rollins) Al-Shehbaz
JM2: Boechera covillei	Boechera covillei (Greene) Windham & Al-Shehbaz
JM2: Boechera davidsonii	Boechera davidsonii (Greene) N.H. Holmgren
JMS: Boechera demissa	Boechera pendulina (Greene) W.A. Weber
JMS: Boechera demissa var. pendulina	Boechera pendulina (Greene) W.A. Weber
JM2: Boechera depauperata	Boechera depauperata (A. Nelson & P.B. Kenn.) Windham & Al-Shehbaz
JM2: Boechera dispar	Boechera dispar (M.E. Jones) Al-Shehbaz
JM2: Boechera divaricarpa	Boechera divaricarpa (A. Nelson) &Aacute;. L&ouml;ve & D. L&ouml;ve
JM2: Boechera elkoensis	Boechera elkoensis Windham & Al-Shehbaz
JM2: Boechera evadens	Boechera evadens Windham & Al-Shehbaz
JM2: Boechera glaucovalvula	Boechera glaucovalvula (M.E. Jones) Al-Shehbaz
JMS: Boechera hirshbergiae	Boechera johnstonii (Munz) Al-Shehbaz
JM2: Boechera hoffmannii	Boechera hoffmannii (Munz) Al-Shehbaz
JMS: Boechera holboellii	Boechera pendulocarpa (A. Nelson) Windham & Al-Shehbaz
JMS: Boechera holboellii var. pendulocarpa	Boechera pendulocarpa (A. Nelson) Windham & Al-Shehbaz
JM2: Boechera howellii	Boechera howellii (S. Watson) Windham & Al-Shehbaz
JM2: Boechera inyoensis	Boechera inyoensis (Rollins) Al-Shehbaz
JM2: Boechera johnstonii	Boechera johnstonii (Munz) Al-Shehbaz
JM2: Boechera koehleri	Boechera koehleri (Howell) Al-Shehbaz
JM2: Boechera lemmonii	Boechera lemmonii (S. Watson) W.A. Weber
JM2: Boechera lincolnensis	Boechera lincolnensis Windham & Al-Shehbaz
JM2: Boechera lyallii	Boechera lyallii (S. Watson) Dorn
JM2: Boechera parishii	Boechera parishii (S. Watson) Al-Shehbaz
JM2: Boechera pauciflora	Boechera pauciflora (Nutt.) Windham & Al-Shehbaz
JM2: Boechera paupercula	Boechera paupercula (Greene) Windham & Al-Shehbaz
JM2: Boechera peirsonii	Boechera peirsonii Windham & Al-Shehbaz
JM2: Boechera pendulina	Boechera pendulina (Greene) W.A. Weber
JM2: Boechera pendulocarpa	Boechera pendulocarpa (A. Nelson) Windham & Al-Shehbaz
JM2: Boechera perennans	Boechera perennans (S. Watson) W.A. Weber
JM2: Boechera pinetorum	Boechera pinetorum (Tidestr.) Windham & Al-Shehbaz
JM2: Boechera pinzliae	Boechera pinzliae (Rollins) Al-Shehbaz
JM2: Boechera platysperma	Boechera platysperma (A. Gray) Al-Shehbaz
JM2: Boechera pratincola	Boechera pratincola (Greene) Windham & Al-Shehbaz
JM2: Boechera puberula	Boechera puberula (Nutt.) Dorn
JM2: Boechera pulchra	Boechera pulchra (S. Watson) W.A. Weber
JM2: Boechera pygmaea	Boechera pygmaea (Rollins) Al-Shehbaz
JM2: Boechera rectissima	Boechera rectissima (Greene) Al-Shehbaz
JM2: Boechera repanda	Boechera repanda (S. Watson) Al-Shehbaz
JM2: Boechera retrofracta	Boechera retrofracta (Graham) &Aacute;. L&ouml;ve & D. L&ouml;ve
JM2: Boechera rigidissima	Boechera rigidissima (Rollins) Al-Shehbaz
JM2: Boechera rollei	Boechera rollei (Rollins) Al-Shehbaz
JM2: Boechera rubicundula	Boechera rubicundula (Jeps.) Windham & Al-Shehbaz
JMS: Boechera selbyi	Boechera inyoensis (Rollins) Al-Shehbaz
JMS: Boechera selbyi var. inyoensis	Boechera inyoensis (Rollins) Al-Shehbaz
JM2: Boechera serpenticola	Boechera serpenticola Windham & Al-Shehbaz
JM2: Boechera shevockii	Boechera shevockii Windham & Al-Shehbaz
JM2: Boechera shockleyi	Boechera shockleyi (Munz) Dorn
JM2: Boechera sparsiflora	Boechera sparsiflora (Nutt.) Dorn
JM2: Boechera stricta	Boechera stricta (Graham) Al-Shehbaz
JM2: Boechera subpinnatifida	Boechera subpinnatifida (S. Watson) Al-Shehbaz
JM2: Boechera suffrutescens	Boechera suffrutescens (S. Watson) Dorn
JM2: Boechera tiehmii	Boechera tiehmii (Rollins) Al-Shehbaz
JM2: Boechera tularensis	Boechera tularensis Windham & Al-Shehbaz
JMS: Boechera ultra-alsa	Boechera ultraalsa Windham & Al-Shehbaz
JM2: Boechera ultraalsa	Boechera ultraalsa Windham & Al-Shehbaz
JM2: Boechera xylopoda	Boechera xylopoda Windham & Al-Shehbaz
JM2: Boechera yorkii	Boechera yorkii S. Boyd
JM2: Boehmeria cylindrica	Boehmeria cylindrica (L.) Sw.
JM1: Boehmeria nivea	Boehmeria cylindrica (L.) Sw.
JM1: Boerhavia coccinea	Boerhavia coccinea Mill.
JM1: Boerhavia coulteri	Boerhavia coulteri (Hook. f.) S. Watson var. palmeri (S. Watson) Spellenb.
JM2: Boerhavia coulteri var. palmeri	Boerhavia coulteri (Hook. f.) S. Watson var. palmeri (S. Watson) Spellenb.
JM2: Boerhavia diffusa	Boerhavia diffusa L.
JM1: Boerhavia intermedia	Boerhavia triquetra S. Watson var. intermedia (M.E. Jones) Spellenb.
JM1: Boerhavia triquetra	misappl. to Boerhavia triquetra var. intermedia
JM2: Boerhavia triquetra var. intermedia	Boerhavia triquetra S. Watson var. intermedia (M.E. Jones) Spellenb.
JM1: Boerhavia wrightii	Boerhavia wrightii A. Gray
JMS: Boisduvalia cleistogama	Epilobium cleistogamum (Curran) Hoch & P.H. Raven
JMS: Boisduvalia densiflora	Epilobium densiflorum (Lindl.) Hoch & P.H. Raven
JMS: Boisduvalia densiflora var. pallescens	Epilobium densiflorum (Lindl.) Hoch & P.H. Raven
JMS: Boisduvalia densiflora var. salicina	Epilobium densiflorum (Lindl.) Hoch & P.H. Raven
JMS: Boisduvalia glabella	Epilobium campestre (Jeps.) Hoch & W.L. Wagner
JMS: Boisduvalia glabella var. campestris	Epilobium campestre (Jeps.) Hoch & W.L. Wagner
JMS: Boisduvalia macrantha	Epilobium pallidum (Eastw.) Hoch & P.H. Raven
JMS: Boisduvalia pallida	Epilobium pallidum (Eastw.) Hoch & P.H. Raven
JMS: Boisduvalia stricta	Epilobium torreyi (S. Watson) Hoch & P.H. Raven
JMS: Boisduvalia torreyi	Epilobium torreyi (S. Watson) Hoch & P.H. Raven
JM1: Bolandra californica	Bolandra californica A. Gray
JM2: Bolboschoenus fluviatilis	Bolboschoenus fluviatilis (Torr.) Soj&aacute;k
JM2: Bolboschoenus glaucus	Bolboschoenus glaucus (Lam.) S.G. Sm.
JM2: Bolboschoenus maritimus	Bolboschoenus maritimus (L.) Palla
JM2: Bolboschoenus maritimus subsp. paludosus	Bolboschoenus maritimus (L.) Palla subsp. paludosus (A. Nelson) T. Koyama
JM2: Bolboschoenus robustus	Bolboschoenus robustus (Pursh) Soj&aacute;k
JM1: Borago officinalis	Borago officinalis L.
JM1: Boschniakia hookeri	Kopsiopsis hookeri (Walp.) Govaerts
JM1: Boschniakia strobilacea	Kopsiopsis strobilacea (A. Gray) Beck
JM1: Bothriochloa barbinodis	Bothriochloa barbinodis (Lag.) Herter
JM2: Bothriochloa ischaemum	Bothriochloa ischaemum (L.) Keng
JM1: Bothriochloa ischaemum var. songarica	Bothriochloa ischaemum (L.) Keng
JM2: Bothriochloa laguroides	Bothriochloa laguroides (DC.) Herter
JM1: Bothriochloa laguroides subsp. torreyana	Bothriochloa laguroides (DC.) Herter subsp. torreyana (Steud.) Allred & Gould
JM1: Botrychium ascendens	Botrychium ascendens W.H. Wagner
JMS: Botrychium boreale	Botrychium pinnatum H. St. John
JMS: Botrychium boreale subsp. obtusilobum	Botrychium pinnatum H. St. John
JM1: Botrychium crenulatum	Botrychium crenulatum W.H. Wagner
JM2: Botrychium lineare	Botrychium lineare W.H. Wagner
JM1: Botrychium lunaria	Botrychium lunaria (L.) Sw.
JMS: Botrychium lunaria var. minganense	Botrychium minganense Vict.
JM1: Botrychium minganense	Botrychium minganense Vict.
JM1: Botrychium montanum	Botrychium montanum W.H. Wagner
JM1: Botrychium multifidum	Sceptridium multifidum (S.G. Gmel.) Tagawa
JMS: Botrychium multifidum subsp. californicum	Sceptridium multifidum (S.G. Gmel.) Tagawa
JMS: Botrychium multifidum subsp. coulteri	Sceptridium multifidum (S.G. Gmel.) Tagawa
JMS: Botrychium multifidum subsp. silaifolium	Sceptridium multifidum (S.G. Gmel.) Tagawa
JM2: Botrychium paradoxum	Botrychium paradoxum W.H. Wagner
JM1: Botrychium pinnatum	Botrychium pinnatum H. St. John
JM2: Botrychium pumicola	Botrychium pumicola Underw.
JM1: Botrychium simplex	Botrychium simplex E. Hitchc.
JM2: Botrychium simplex var. compositum	Botrychium simplex var. compositum (Lasch) Milde
JM2: Botrychium simplex var. simplex	Botrychium simplex var. simplex
JM2: Botrychium tunux	Botrychium tunux Stensvold & Farrar
JMS: Botrychium virginianum	Botrypus virginianus (L.) Michx.
JM2: Botrychium yaaxudakeit	Botrychium yaaxudakeit Stensvold & Farrar
JM2: Botrypus virginianus	Botrypus virginianus (L.) Michx.
JMS: Boussingaultia cordifolia	Anredera cordifolia (Ten.) Steenis
JMS: Boussingaultia gracilis	Anredera cordifolia (Ten.) Steenis
JMS: Boussingaultia gracilis var. pseudobaselloides	Anredera cordifolia (Ten.) Steenis
JM2: Bouteloua aristidoides	Bouteloua aristidoides (Kunth) Griseb.
JM1: Bouteloua aristidoides var. aristidoides	Bouteloua aristidoides (Kunth) Griseb. var. aristidoides
JM2: Bouteloua barbata	Bouteloua barbata Lag.
JM1: Bouteloua barbata var. barbata	Bouteloua barbata Lag. var. barbata
JM1: Bouteloua curtipendula	Bouteloua curtipendula (Michx.) Torr.
JM1: Bouteloua eriopoda	Bouteloua eriopoda (Torr.) Torr.
JM1: Bouteloua gracilis	Bouteloua gracilis (Kunth) Griffiths
JM1: Bouteloua trifida	Bouteloua trifida S. Watson
JM1: Bowlesia incana	Bowlesia incana Ruiz & Pav.
JM1: Boykinia major	Boykinia major A. Gray
JM1: Boykinia occidentalis	Boykinia occidentalis Torr. & A. Gray
JM1: Boykinia rotundifolia	Boykinia rotundifolia A. Gray
JM1: Brachypodium distachyon	Brachypodium distachyon (L.) P. Beauv.
JM1: Brachypodium pinnatum	Brachypodium pinnatum (L.) P. Beauv.
JM2: Brachypodium sylvaticum	Brachypodium sylvaticum (Huds.) P. Beauv.
JM1: Brandegea bigelovii	Brandegea bigelovii (S. Watson) Cogn.
JMS: Brasenia peltata	Brasenia schreberi J.F. Gmel.
JMS: Brasenia purpurea	Brasenia schreberi J.F. Gmel.
JM1: Brasenia schreberi	Brasenia schreberi J.F. Gmel.
JMS: Brassica alba	Sinapis alba L.
JMS: Brassica campestris	Brassica rapa L.
JM1: Brassica fruticulosa	Brassica fruticulosa Cirillo
JMS: Brassica geniculata	Hirschfeldia incana (L.) Lagr.-Fossat
JMS: Brassica hirta	Sinapis alba L.
JM1: Brassica juncea	Brassica juncea (L.) Czern.
JMS: Brassica kaber	Sinapis arvensis L.
JM1: Brassica napus	Brassica napus L.
JM1: Brassica nigra	Brassica nigra (L.) W.D.J. Koch
JM2: Brassica oleracea	Brassica oleracea L.
JM1: Brassica rapa	Brassica rapa L.
JM1: Brassica tournefortii	Brassica tournefortii Gouan
JMS: Brayulinea densa	Guilleminea densa (Willd.) Moq. var. aggregata Uline & W.L. Bray
JM1: Brickellia arguta	Brickellia atractyloides var. arguta (B.L. Rob.) Jeps.
JM1: Brickellia arguta var. arguta	Brickellia atractyloides var. arguta (B.L. Rob.) Jeps.
JM1: Brickellia arguta var. odontolepis	Brickellia atractyloides A. Gray var. odontolepis (B.L. Rob.) Jeps.
JM1: Brickellia atractyloides	Brickellia atractyloides A. Gray
JM2: Brickellia atractyloides var. arguta	Brickellia atractyloides var. arguta (B.L. Rob.) Jeps.
JM2: Brickellia atractyloides var. atractyloides	Brickellia atractyloides A. Gray var. atractyloides A. Gray
JM2: Brickellia atractyloides var. odontolepis	Brickellia atractyloides A. Gray var. odontolepis (B.L. Rob.) Jeps.
JM1: Brickellia californica	Brickellia californica (Torr. & A. Gray) A. Gray; Brickellia desertorum Coville
JMS: Brickellia californica var. desertorum	Brickellia desertorum Coville
JMS: Brickellia californica var. tenera	Brickellia californica (Torr. & A. Gray) A. Gray
JM1: Brickellia desertorum	Brickellia desertorum Coville
JM1: Brickellia frutescens	Brickellia frutescens A. Gray
JM1: Brickellia grandiflora	Brickellia grandiflora (Hook.) Nutt.
JMS: Brickellia grayana	Brickellia microphylla (Nutt.) A. Gray var. microphylla
JM1: Brickellia greenei	Brickellia greenei A. Gray
JM1: Brickellia incana	Brickellia incana A. Gray
JM1: Brickellia knappiana	Brickellia knappiana Drew
JMS: Brickellia linifolia	Brickellia oblongifolia Nutt. var. linifolia (D.C. Eaton) B.L. Rob.
JM1: Brickellia longifolia	Brickellia longifolia S. Watson
JM2: Brickellia longifolia var. longifolia	Brickellia longifolia S. Watson var. longifolia
JM2: Brickellia longifolia var. multiflora	Brickellia longifolia var. multiflora (Kellogg) Cronquist
JM1: Brickellia microphylla	Brickellia microphylla (Nutt.) A. Gray
JMS: Brickellia microphylla subsp. scabra	Brickellia microphylla var. scabra A. Gray
JM2: Brickellia microphylla var. microphylla	Brickellia microphylla (Nutt.) A. Gray var. microphylla
JM2: Brickellia microphylla var. scabra	Brickellia microphylla var. scabra A. Gray
JMS: Brickellia microphylla var. watsonii	Brickellia microphylla (Nutt.) A. Gray var. microphylla
JM1: Brickellia multiflora	Brickellia longifolia var. multiflora (Kellogg) Cronquist
JM1: Brickellia nevinii	Brickellia nevinii A. Gray
JM2: Brickellia oblongifolia	Brickellia oblongifolia Nutt.
JMS: Brickellia oblongifolia subsp. linifolia	Brickellia oblongifolia Nutt. var. linifolia (D.C. Eaton) B.L. Rob.
JM1: Brickellia oblongifolia var. linifolia	Brickellia oblongifolia Nutt. var. linifolia (D.C. Eaton) B.L. Rob.
JMS: Brickellia scabra	Brickellia microphylla var. scabra A. Gray
JMS: Brickellia tenera	Brickellia californica (Torr. & A. Gray) A. Gray
JM1: Brickellia watsonii	Brickellia microphylla (Nutt.) A. Gray var. microphylla
JMS: Brickellia wrightii	Brickellia californica (Torr. & A. Gray) A. Gray
JMS: Brickellia wrightii var. tenera	Brickellia californica (Torr. & A. Gray) A. Gray
JM1: Briza maxima	Briza maxima L.
JM1: Briza minor	Briza minor L.
JM1: Brodiaea appendiculata	Brodiaea appendiculata Hoover
JM1: Brodiaea californica	Brodiaea californica Lindl.; Brodiaea leptandra (Greene) Baker
JM1: Brodiaea californica var. californica	Brodiaea californica Lindl.
JM1: Brodiaea californica var. leptandra	Brodiaea leptandra (Greene) Baker
JM1: Brodiaea coronaria	Brodiaea coronaria (Salisb.) Engl.; Brodiaea rosea (Greene) Baker
JM1: Brodiaea coronaria subsp. coronaria	Brodiaea coronaria (Salisb.) Engl.
JM1: Brodiaea coronaria subsp. rosea	Brodiaea rosea (Greene) Baker
JM1: Brodiaea elegans	Brodiaea elegans Hoover
JM1: Brodiaea elegans subsp. elegans	Brodiaea elegans Hoover subsp. elegans
JM1: Brodiaea elegans subsp. hooveri	excluded
JM1: Brodiaea filifolia	Brodiaea filifolia S. Watson
JM1: Brodiaea insignis	Brodiaea insignis (Jeps.) T.F. Niehaus
JM1: Brodiaea jolonensis	Brodiaea jolonensis Eastw.
JM1: Brodiaea kinkiensis	Brodiaea kinkiensis T.F. Niehaus
JM2: Brodiaea leptandra	Brodiaea leptandra (Greene) Baker
JM1: Brodiaea minor	Brodiaea minor (Benth.) S. Watson
JM2: Brodiaea nana	Brodiaea nana Hoover
JM1: Brodiaea orcuttii	Brodiaea orcuttii (Greene) Baker
JM1: Brodiaea pallida	Brodiaea pallida Hoover
JM1: Brodiaea purdyi	Brodiaea minor (Benth.) S. Watson
JM2: Brodiaea rosea	Brodiaea rosea (Greene) Baker
JM2: Brodiaea santarosae	Brodiaea santarosae T.J. Chester et al.
JM2: Brodiaea sierrae	Brodiaea sierrae R.E. Preston
JM1: Brodiaea stellaris	Brodiaea stellaris S. Watson
JM1: Brodiaea terrestris	Brodiaea terrestris Kellogg
JM1: Brodiaea terrestris subsp. kernensis	Brodiaea terrestris subsp. kernensis (Hoover) T.F. Niehaus
JM1: Brodiaea terrestris subsp. terrestris	Brodiaea terrestris Kellogg subsp. terrestris
JMS: Bromidium tandilense	Agrostis tandilensis (Kuntze) Parodi
JM1: Bromus alopecuros	Bromus caroli-henrici Greuter
JM1: Bromus anomalus	Bromus porteri (J.M. Coult.) Nash
JM1: Bromus arenarius	Bromus arenarius Labill.
JM1: Bromus arizonicus	Bromus arizonicus (Shear) Stebbins
JM2: Bromus arvensis	Bromus arvensis L.
JM2: Bromus berteroanus	Bromus berteroanus Colla
JMS: Bromus breviaristatus	Bromus carinatus var. marginatus (Steud.) Barkworth & Anderton
JM1: Bromus briziformis	Bromus briziformis Fisch. & C.A. Mey.
JM1: Bromus carinatus	Bromus carinatus Hook. & Arn.; Bromus maritimus (Piper) Hitchc.
JM1: Bromus carinatus var. carinatus	Bromus carinatus var. carinatus
JM2: Bromus carinatus var. marginatus	Bromus carinatus var. marginatus (Steud.) Barkworth & Anderton
JM1: Bromus carinatus var. maritimus	Bromus maritimus (Piper) Hitchc.
JM2: Bromus caroli-henrici	Bromus caroli-henrici Greuter
JM1: Bromus catharticus	Bromus catharticus Vahl
JM2: Bromus catharticus var. catharticus	Bromus catharticus var. catharticus
JM2: Bromus catharticus var. elatus	Bromus catharticus var. elatus (E. Desv.) Planchuelo
JM1: Bromus ciliatus	Bromus ciliatus L.
JMS: Bromus ciliatus var. richardsonii	Bromus richardsonii Link
JM2: Bromus commutatus	Bromus commutatus Schrad.
JM1: Bromus diandrus	Bromus diandrus Roth
JMS: Bromus diandrus var. rigidus	Bromus diandrus Roth
JM1: Bromus grandis	Bromus grandis (Shear) Hitchc.
JM2: Bromus hallii	Bromus hallii (Hitchc.) Saarela & P.M. Peterson
JM1: Bromus hordeaceus	Bromus hordeaceus L.
JMS: Bromus hordeaceus subsp. divaricatus	Bromus hordeaceus L.
JMS: Bromus hordeaceus subsp. molliformis	Bromus hordeaceus L.
JMS: Bromus hordeaceus subsp. thominei	Bromus hordeaceus L.
JM2: Bromus inermis	Bromus inermis Leyss.
JM1: Bromus inermis subsp. inermis	Bromus inermis Leyss.
JM1: Bromus japonicus	Bromus japonicus Thunb.
JM1: Bromus laevipes	Bromus laevipes Shear
JMS: Bromus luzonensis	Bromus carinatus var. marginatus (Steud.) Barkworth & Anderton
JM1: Bromus madritensis	Bromus madritensis L.
JM1: Bromus madritensis subsp. madritensis	Bromus madritensis subsp. madritensis
JM1: Bromus madritensis subsp. rubens	Bromus madritensis subsp. rubens (L.) Husn.
JMS: Bromus marginatus	Bromus carinatus var. marginatus (Steud.) Barkworth & Anderton
JM2: Bromus maritimus	Bromus maritimus (Piper) Hitchc.
JMS: Bromus mollis	Bromus hordeaceus L.
JM1: Bromus orcuttianus	Bromus orcuttianus Vasey
JMS: Bromus orcuttianus var. hallii	Bromus hallii (Hitchc.) Saarela & P.M. Peterson
JM2: Bromus polyanthus	Bromus polyanthus Shear
JMS: Bromus polyanthus var. paniculatus	Bromus polyanthus Shear
JM2: Bromus porteri	Bromus porteri (J.M. Coult.) Nash
JMS: Bromus porteri var. assimilis	Bromus grandis (Shear) Hitchc.
JM2: Bromus pseudolaevipes	Bromus pseudolaevipes Wagnon
JM2: Bromus racemosus	Bromus racemosus L.
JM2: Bromus richardsonii	Bromus richardsonii Link
JMS: Bromus rigidus	Bromus diandrus Roth
JMS: Bromus rubens	Bromus madritensis subsp. rubens (L.) Husn.
JM1: Bromus secalinus	Bromus secalinus L.
JM2: Bromus sitchensis	Bromus sitchensis Trin.
JM2: Bromus squarrosus	Bromus squarrosus L.
JM1: Bromus stamineus	Bromus catharticus var. elatus (E. Desv.) Planchuelo
JM1: Bromus sterilis	Bromus sterilis L.
JMS: Bromus subvelutinus	Bromus carinatus var. marginatus (Steud.) Barkworth & Anderton
JM1: Bromus suksdorfii	Bromus suksdorfii Vasey
JM1: Bromus tectorum	Bromus tectorum L.
JMS: Bromus tectorum var. glabratus	Bromus tectorum L.
JM1: Bromus trinii	Bromus arizonicus; Bromus berteroanus
JMS: Bromus trinii var. excelsus	Bromus arizonicus (Shear) Stebbins
JMS: Bromus trinii var. trinii	Bromus berteroanus Colla
JM1: Bromus vulgaris	Bromus vulgaris (Hook.) Shear
JM1: Bryonia dioica	excluded
JM1: Buddleja davidii	Buddleja davidii Franch.
JM1: Buddleja saligna	Buddleja saligna Willd.
JM1: Buddleja utahensis	Buddleja utahensis Coville
JM2: Bulbine semibarbata	Bulbine semibarbata (R. Br.) Haw.
JMS: Bulbostylis californica	Brickellia californica (Torr. & A. Gray) A. Gray
JM1: Bulbostylis capillaris	Bulbostylis capillaris (L.) C.B. Clarke
JMS: Bulbostylis microphylla	Brickellia microphylla (Nutt.) A. Gray var. microphylla
JM1: Bupleurum lancifolium	excluded
JM1: Bursera microphylla	Bursera microphylla A. Gray
JM2: Cabomba caroliniana	Cabomba caroliniana A. Gray
JMS: Cabomba peltata	Brasenia schreberi J.F. Gmel.
JM1: Cacaliopsis nardosmia	Cacaliopsis nardosmia (A. Gray) A. Gray
JM1: Caesalpinia gilliesii	Caesalpinia gilliesii (Hook.) D. Dietr.
JM1: Caesalpinia spinosa	Caesalpinia spinosa (Molina) Kuntze
JM1: Caesalpinia virgata	Hoffmannseggia microphylla Torr.
JM1: Cakile edentula	Cakile edentula (Bigelow) Hook.
JMS: Cakile edentula subsp. californica	Cakile edentula (Bigelow) Hook.
JM1: Cakile maritima	Cakile maritima Scop.
JM1: Calamagrostis bolanderi	Calamagrostis bolanderi Thurb.
JM1: Calamagrostis breweri	Calamagrostis breweri Thurb.
JM1: Calamagrostis canadensis	Calamagrostis canadensis (Michx.) P. Beauv.
JM2: Calamagrostis canadensis var. canadensis	Calamagrostis canadensis (Michx.) P. Beauv. var. canadensis
JM2: Calamagrostis canadensis var. langsdorfii	Calamagrostis canadensis (Michx.) P. Beauv. var. langsdorfii (Link) Inman
JMS: Calamagrostis canadensis var. scabra	Calamagrostis canadensis (Michx.) P. Beauv. var. langsdorfii (Link) Inman
JMS: Calamagrostis crassiglumis	Calamagrostis stricta subsp. inexpansa (A. Gray) C.W. Greene
JMS: Calamagrostis densa	Calamagrostis koelerioides Vasey
JM1: Calamagrostis foliosa	Calamagrostis foliosa Kearney
JMS: Calamagrostis inexpansa	Calamagrostis stricta subsp. inexpansa (A. Gray) C.W. Greene
JM1: Calamagrostis koelerioides	Calamagrostis koelerioides Vasey
JM2: Calamagrostis muiriana	Calamagrostis muiriana B.L. Wilson & Sami Gray
JM1: Calamagrostis nutkaensis	Calamagrostis nutkaensis (J. Presl) Steud.
JM1: Calamagrostis ophitidis	Calamagrostis ophitidis (J.T. Howell) Nygren
JM1: Calamagrostis purpurascens	Calamagrostis purpurascens R. Br.
JM1: Calamagrostis rubescens	Calamagrostis rubescens Buckley
JM1: Calamagrostis stricta	Calamagrostis stricta (Timm) Koeler
JM1: Calamagrostis stricta subsp. inexpansa	Calamagrostis stricta subsp. inexpansa (A. Gray) C.W. Greene
JM1: Calamagrostis stricta subsp. stricta	Calamagrostis stricta (Timm) Koeler subsp. stricta
JMS: Calamagrostis sylvatica	Calamagrostis foliosa Kearney
JMS: Calamagrostis sylvatica var. longifolia	Calamagrostis foliosa Kearney
JMS: Calamintha chandleri	Clinopodium chandleri (Brandegee) P.D. Cantino & Wagstaff
JM1: Calandrinia ambigua	Cistanthe ambigua (S. Watson) Hershk.
JM1: Calandrinia breweri	Calandrinia breweri S. Watson
JM1: Calandrinia ciliata	Calandrinia ciliata (Ruiz & Pav.) DC.
JM1: Calandrinia maritima	Cistanthe maritima (Nutt.) Hershk.
JM1: Calendula arvensis	Calendula arvensis L.
JMS: Calendula fruticosa	Dimorphotheca fruticosa (L.) DC.
JM1: Calendula officinalis	Calendula officinalis L.
JM2: Calia secundiflora	Calia secundiflora (Ortega) Yakovlev
JMS: Calibrachoa parviflora	Petunia parviflora Juss.
JM2: California macrophylla	California macrophylla (Hook. & Arn.) J.J. Aldasoro et al.
JM1: Calliandra eriophylla	Calliandra eriophylla Benth.
JMS: Calligonum canescens	Atriplex canescens (Pursh) Nutt.
JM2: Callitriche fassettii	Callitriche fassettii Schotsman
JM1: Callitriche hermaphroditica	Callitriche fassettii Schotsman
JM1: Callitriche heterophylla	Callitriche heterophylla Pursh
JMS: Callitriche heterophylla subsp. bolanderi	Callitriche heterophylla var. bolanderi (Hegelm.) Fassett
JM1: Callitriche heterophylla var. bolanderi	Callitriche heterophylla var. bolanderi (Hegelm.) Fassett
JM1: Callitriche heterophylla var. heterophylla	Callitriche heterophylla Pursh var. heterophylla
JM2: Callitriche longipedunculata	Callitriche longipedunculata Morong
JM1: Callitriche marginata	Callitriche marginata Torr.
JM2: Callitriche palustris	Callitriche palustris L.
JM1: Callitriche stagnalis	Callitriche stagnalis Scop.
JM1: Callitriche trochlearis	Callitriche trochlearis Fassett
JM1: Callitriche verna	Callitriche palustris L.
JMS: Callitropsis abramsiana	Hesperocyparis abramsiana (C.B. Wolf) Bartel
JMS: Callitropsis arizonica	Hesperocyparis stephensonii (C.B. Wolf) Bartel
JMS: Callitropsis bakeri	Hesperocyparis bakeri (Jeps.) Bartel
JMS: Callitropsis forbesii	Hesperocyparis forbesii (Jeps.) Bartel
JMS: Callitropsis goveniana	Hesperocyparis goveniana (Gordon) Bartel
JMS: Callitropsis macnabiana	Hesperocyparis macnabiana (A. Murray bis) Bartel
JMS: Callitropsis macrocarpa	Hesperocyparis macrocarpa (Hartw.) Bartel
JMS: Callitropsis nevadensis	Hesperocyparis nevadensis (Abrams) Bartel
JM2: Callitropsis nootkatensis	Callitropsis nootkatensis (D. Don) D.P. Little
JMS: Callitropsis pygmaea	Hesperocyparis pygmaea (Lemmon) Bartel
JMS: Callitropsis sargentii	Hesperocyparis sargentii (Jeps.) Bartel
JMS: Callitropsis stephensonii	Hesperocyparis stephensonii (C.B. Wolf) Bartel
JM1: Calocedrus decurrens	Calocedrus decurrens (Torr.) Florin
JM1: Calochortus albus	Calochortus albus (Benth.) Benth.
JM1: Calochortus amabilis	Calochortus amabilis Purdy
JM1: Calochortus amoenus	Calochortus amoenus Greene
JM1: Calochortus argillosus	Calochortus argillosus (Hoover) Zebell & P.L. Fiedl.
JM1: Calochortus bruneaunis	Calochortus bruneaunis A. Nelson & J.F. Macbr.
JM1: Calochortus catalinae	Calochortus catalinae S. Watson
JM1: Calochortus clavatus	Calochortus clavatus S. Watson
JM1: Calochortus clavatus subsp. clavatus	Calochortus clavatus S. Watson var. clavatus
JM1: Calochortus clavatus subsp. pallidus	Calochortus clavatus var. pallidus (Hoover) P.L. Fiedl. & Zebell
JM1: Calochortus clavatus subsp. recurvifolius	Calochortus clavatus var. recurvifolius (Hoover) P.L. Fiedl. & Zebell
JM1: Calochortus clavatus var. avius	Calochortus clavatus var. avius Jeps.
JM2: Calochortus clavatus var. clavatus	Calochortus clavatus S. Watson var. clavatus
JM1: Calochortus clavatus var. gracilis	Calochortus clavatus var. gracilis Ownbey
JM2: Calochortus clavatus var. pallidus	Calochortus clavatus var. pallidus (Hoover) P.L. Fiedl. & Zebell
JM2: Calochortus clavatus var. recurvifolius	Calochortus clavatus var. recurvifolius (Hoover) P.L. Fiedl. & Zebell
JM1: Calochortus coeruleus	Calochortus coeruleus (Kellogg) S. Watson
JMS: Calochortus coeruleus var. westonii	Calochortus westonii Eastw.
JM1: Calochortus concolor	Calochortus concolor (Baker) Purdy
JM1: Calochortus dunnii	Calochortus dunnii Purdy
JM1: Calochortus elegans	Calochortus elegans Pursh
JMS: Calochortus elegans var. nanus	Calochortus elegans Pursh
JM1: Calochortus excavatus	Calochortus excavatus Greene
JM2: Calochortus fimbriatus	Calochortus fimbriatus H.P. McDonald
JM1: Calochortus flexuosus	Calochortus flexuosus S. Watson
JM1: Calochortus greenei	Calochortus greenei S. Watson
JM1: Calochortus invenustus	Calochortus invenustus Greene
JM1: Calochortus kennedyi	Calochortus kennedyi Porter
JM1: Calochortus kennedyi var. kennedyi	Calochortus kennedyi Porter var. kennedyi
JM1: Calochortus kennedyi var. munzii	Calochortus kennedyi var. munzii Jeps.
JM1: Calochortus leichtlinii	Calochortus leichtlinii Hook. f.
JM2: Calochortus longebarbatus	Calochortus longebarbatus S. Watson
JM1: Calochortus longebarbatus var. longebarbatus	Calochortus longebarbatus S. Watson var. longebarbatus
JM1: Calochortus luteus	Calochortus luteus Lindl.
JM1: Calochortus macrocarpus	Calochortus macrocarpus Douglas
JM1: Calochortus minimus	Calochortus minimus Ownbey
JM1: Calochortus monanthus	Calochortus monanthus Ownbey
JM1: Calochortus monophyllus	Calochortus monophyllus (Lindl.) Lem.
JM1: Calochortus nudus	Calochortus nudus S. Watson
JM1: Calochortus obispoensis	Calochortus obispoensis Lemmon
JM1: Calochortus palmeri	Calochortus palmeri S. Watson
JM1: Calochortus palmeri var. munzii	Calochortus palmeri var. munzii Ownbey
JM1: Calochortus palmeri var. palmeri	Calochortus palmeri S. Watson var. palmeri
JM1: Calochortus panamintensis	Calochortus panamintensis (Ownbey) Reveal
JM1: Calochortus persistens	Calochortus persistens Ownbey
JM1: Calochortus plummerae	Calochortus plummerae Greene
JM1: Calochortus pulchellus	Calochortus pulchellus (Benth.) Alph. Wood
JM1: Calochortus raichei	Calochortus raichei Farwig & V. Girard
JM1: Calochortus simulans	Calochortus simulans (Hoover) Munz
JM1: Calochortus splendens	Calochortus splendens Benth.
JM1: Calochortus striatus	Calochortus striatus Parish
JM1: Calochortus superbus	Calochortus superbus J.T. Howell
JM2: Calochortus syntrophus	Calochortus syntrophus Callahan
JM1: Calochortus tiburonensis	Calochortus tiburonensis A.J. Hill
JM1: Calochortus tolmiei	Calochortus tolmiei Hook. & Arn.
JM1: Calochortus umbellatus	Calochortus umbellatus Alph. Wood
JM1: Calochortus uniflorus	Calochortus uniflorus Hook. & Arn.
JM1: Calochortus venustus	Calochortus venustus Benth.
JM1: Calochortus vestae	Calochortus vestae Purdy
JM1: Calochortus weedii	Calochortus weedii Alph. Wood; Calochortus fimbriatus H.P. McDonald
JM1: Calochortus weedii var. intermedius	Calochortus weedii var. intermedius Ownbey
JM1: Calochortus weedii var. vestus	Calochortus fimbriatus H.P. McDonald
JM1: Calochortus weedii var. weedii	Calochortus weedii Alph. Wood var. weedii
JM1: Calochortus westonii	Calochortus westonii Eastw.
JM2: Caltha leptosepala	Caltha leptosepala DC.
JM1: Caltha leptosepala var. biflora	Caltha leptosepala DC.
JM2: Caltha palustris	Caltha palustris L.
JM1: Calycadenia fremontii	Calycadenia fremontii A. Gray
JMS: Calycadenia hispida	Calycadenia multiglandulosa DC.
JMS: Calycadenia hispida subsp. reducta	Calycadenia multiglandulosa DC.
JM1: Calycadenia hooveri	Calycadenia hooveri G.D. Carr
JM2: Calycadenia micrantha	Calycadenia micrantha R.L. Carr & G.D. Carr
JM1: Calycadenia mollis	Calycadenia mollis A. Gray
JM1: Calycadenia multiglandulosa	Calycadenia multiglandulosa DC.
JMS: Calycadenia multiglandulosa subsp. bicolor	Calycadenia multiglandulosa DC.
JMS: Calycadenia multiglandulosa subsp. cephalotes	Calycadenia multiglandulosa DC.
JM1: Calycadenia oppositifolia	Calycadenia oppositifolia (Greene) Greene
JM1: Calycadenia pauciflora	Calycadenia pauciflora A. Gray
JM1: Calycadenia spicata	Calycadenia spicata (Greene) Greene
JMS: Calycadenia tenella	Osmadenia tenella Nutt.
JM1: Calycadenia truncata	Calycadenia truncata DC.; Calycadenia micrantha R.L. Carr & G.D. Carr
JMS: Calycadenia truncata subsp. microcephala	Calycadenia micrantha R.L. Carr & G.D. Carr
JMS: Calycadenia truncata subsp. scabrella	Calycadenia truncata DC.
JM1: Calycadenia villosa	Calycadenia villosa DC.
JM1: Calycanthus occidentalis	Calycanthus occidentalis Hook. & Arn.
JM1: Calycoseris parryi	Calycoseris parryi A. Gray
JM1: Calycoseris wrightii	Calycoseris wrightii A. Gray
JM1: Calypso bulbosa	Calypso bulbosa (L.) Oakes var. occidentalis (Holz.) B. Boivin
JM2: Calypso bulbosa var. occidentalis	Calypso bulbosa (L.) Oakes var. occidentalis (Holz.) B. Boivin
JM1: Calyptridium monandrum	Calyptridium monandrum Nutt.
JM1: Calyptridium monospermum	Calyptridium monospermum Greene
JM1: Calyptridium parryi	Calyptridium parryi A. Gray
JM2: Calyptridium parryi var. arizonicum	Calyptridium parryi var. arizonicum J.T. Howell
JM1: Calyptridium parryi var. hesseae	Calyptridium parryi var. hesseae J.H. Thomas
JM1: Calyptridium parryi var. nevadense	Calyptridium parryi var. nevadense J.T. Howell
JM1: Calyptridium parryi var. parryi	Calyptridium parryi A. Gray var. parryi
JM1: Calyptridium pulchellum	Calyptridium pulchellum (Eastw.) Hoover
JM1: Calyptridium pygmaeum	Calyptridium pygmaeum Rydb.
JM1: Calyptridium quadripetalum	Calyptridium quadripetalum S. Watson
JM1: Calyptridium roseum	Calyptridium roseum S. Watson
JM1: Calyptridium umbellatum	Calyptridium umbellatum (Torr.) Greene
JMS: Calyptridium umbellatum var. caudiciferum	Calyptridium umbellatum (Torr.) Greene
JM2: Calystegia atriplicifolia	Calystegia atriplicifolia Hallier f.
JM1: Calystegia atriplicifolia subsp. buttensis	Calystegia atriplicifolia Hallier f. subsp. buttensis Brummitt
JM1: Calystegia collina	Calystegia collina (Greene) Brummitt
JM1: Calystegia collina subsp. collina	Calystegia collina (Greene) Brummitt subsp. collina
JM1: Calystegia collina subsp. oxyphylla	Calystegia collina subsp. oxyphylla Brummitt
JM1: Calystegia collina subsp. tridactylosa	Calystegia collina subsp. tridactylosa (Eastw.) Brummitt
JM1: Calystegia collina subsp. venusta	Calystegia collina subsp. venusta Brummitt
JM1: Calystegia longipes	Calystegia longipes (S. Watson) Brummitt
JM1: Calystegia macrostegia	Calystegia macrostegia (Greene) Brummitt
JM1: Calystegia macrostegia subsp. amplissima	Calystegia macrostegia subsp. amplissima Brummitt
JM1: Calystegia macrostegia subsp. arida	Calystegia macrostegia subsp. arida (Greene) Brummitt
JM1: Calystegia macrostegia subsp. cyclostegia	Calystegia macrostegia subsp. cyclostegia (House) Brummitt
JM1: Calystegia macrostegia subsp. intermedia	Calystegia macrostegia subsp. intermedia (Abrams) Brummitt
JM1: Calystegia macrostegia subsp. macrostegia	Calystegia macrostegia (Greene) Brummitt subsp. macrostegia
JM1: Calystegia macrostegia subsp. tenuifolia	Calystegia macrostegia subsp. tenuifolia (Abrams) Brummitt
JM1: Calystegia malacophylla	Calystegia malacophylla (Greene) Munz
JM1: Calystegia malacophylla subsp. malacophylla	Calystegia malacophylla (Greene) Munz subsp. malacophylla
JM1: Calystegia malacophylla subsp. pedicellata	Calystegia malacophylla subsp. pedicellata (Jeps.) Munz
JM1: Calystegia occidentalis	Calystegia occidentalis (A. Gray) Brummitt
JM1: Calystegia occidentalis subsp. fulcrata	Calystegia occidentalis subsp. fulcrata (A. Gray) Brummitt
JM1: Calystegia occidentalis subsp. occidentalis	Calystegia occidentalis (A. Gray) Brummitt subsp. occidentalis
JM1: Calystegia peirsonii	Calystegia peirsonii (Abrams) Brummitt
JM1: Calystegia purpurata	Calystegia purpurata (Greene) Brummitt
JM1: Calystegia purpurata subsp. purpurata	Calystegia purpurata (Greene) Brummitt subsp. purpurata
JM1: Calystegia purpurata subsp. saxicola	Calystegia purpurata subsp. saxicola (Eastw.) Brummitt
JM1: Calystegia sepium	Calystegia sepium (L.) R. Br.
JM1: Calystegia sepium subsp. binghamiae	Calystegia sepium subsp. binghamiae (Greene) Brummitt
JM1: Calystegia sepium subsp. limnophila	Calystegia sepium subsp. limnophila (Greene) Brummitt
JM2: Calystegia silvatica	Calystegia silvatica (Kit.) Griseb.
JM2: Calystegia silvatica subsp. disjuncta	Calystegia silvatica (Kit.) Griseb. subsp. disjuncta Brummitt
JM1: Calystegia soldanella	Calystegia soldanella (L.) R. Br.
JM1: Calystegia stebbinsii	Calystegia stebbinsii Brummitt
JM1: Calystegia subacaulis	Calystegia subacaulis Hook. & Arn.
JM1: Calystegia subacaulis subsp. episcopalis	Calystegia subacaulis subsp. episcopalis Brummitt
JM1: Calystegia subacaulis subsp. subacaulis	Calystegia subacaulis Hook. & Arn. subsp. subacaulis
JM2: Camassia leichtlinii	Camassia leichtlinii (Baker) S. Watson
JM2: Camassia leichtlinii subsp. suksdorfii	Camassia leichtlinii (Baker) S. Watson subsp. suksdorfii (Greenm.) Gould
JM1: Camassia quamash	Camassia quamash (Pursh) Greene; Camassia leichtlinii (Baker) S. Watson
JM1: Camassia quamash subsp. breviflora	Camassia quamash (Pursh) Greene subsp. breviflora Gould
JMS: Camassia quamash subsp. linearis	Camassia quamash (Pursh) Greene subsp. breviflora Gould
JM1: Camassia quamash subsp. quamash	Camassia leichtlinii (Baker) S. Watson subsp. suksdorfii (Greenm.) Gould
JM1: Camelina microcarpa	Camelina microcarpa DC.
JM1: Camissonia andina	Neoholmgrenia andina (Nutt.) W.L. Wagner & Hoch
JM1: Camissonia arenaria	Chylismia arenaria A. Nelson
JM1: Camissonia benitensis	Camissonia benitensis P.H. Raven
JM1: Camissonia bistorta	Camissoniopsis bistorta (Torr. & A. Gray) W.L. Wagner & Hoch
JM1: Camissonia boothii	Eremothera boothii (Douglas) W.L. Wagner & Hoch
JM1: Camissonia boothii subsp. alyssoides	Eremothera boothii subsp. alyssoides (Hook. & Arn.) W.L. Wagner & Hoch
JM1: Camissonia boothii subsp. boothii	Eremothera boothii (Douglas) W.L. Wagner & Hoch subsp. boothii
JM1: Camissonia boothii subsp. condensata	Eremothera boothii subsp. condensata (Munz) W.L. Wagner & Hoch
JM1: Camissonia boothii subsp. decorticans	Eremothera boothii subsp. decorticans (Hook. & Arn.) W.L. Wagner & Hoch
JM1: Camissonia boothii subsp. desertorum	Eremothera boothii subsp. desertorum (Munz) W.L. Wagner & Hoch
JM1: Camissonia boothii subsp. intermedia	Eremothera boothii subsp. intermedia (Munz) W.L. Wagner & Hoch
JM1: Camissonia brevipes	Chylismia brevipes (A. Gray) Small
JM1: Camissonia brevipes subsp. arizonica	Chylismia brevipes subsp. arizonica (P.H. Raven) W.L. Wagner & Hoch
JM1: Camissonia brevipes subsp. brevipes	Chylismia brevipes (A. Gray) Small subsp. brevipes
JM1: Camissonia brevipes subsp. pallidula	Chylismia brevipes subsp. pallidula (Munz) W.L. Wagner & Hoch
JM1: Camissonia californica	Eulobus californicus Torr. & A. Gray
JM1: Camissonia campestris	Camissonia campestris (Greene) P.H. Raven
JM1: Camissonia campestris subsp. campestris	Camissonia campestris (Greene) P.H. Raven subsp. campestris
JM1: Camissonia campestris subsp. obispoensis	Camissonia campestris subsp. obispoensis P.H. Raven
JM1: Camissonia cardiophylla	Chylismia cardiophylla (Torr.) Small
JM1: Camissonia cardiophylla subsp. cardiophylla	Chylismia cardiophylla (Torr.) Small subsp. cardiophylla
JM1: Camissonia cardiophylla subsp. robusta	Chylismia cardiophylla subsp. robusta (P.H. Raven) W.L. Wagner & Hoch
JM1: Camissonia chamaenerioides	Eremothera chamaenerioides (A. Gray) W.L. Wagner & Hoch
JM1: Camissonia cheiranthifolia	Camissoniopsis cheiranthifolia (Spreng.) W.L. Wagner & Hoch
JM1: Camissonia cheiranthifolia subsp. cheiranthifolia	Camissoniopsis cheiranthifolia (Spreng.) W.L. Wagner & Hoch subsp. cheiranthifolia
JM1: Camissonia cheiranthifolia subsp. suffruticosa	Camissoniopsis cheiranthifolia subsp. suffruticosa (S. Watson) W.L. Wagner & Hoch
JM1: Camissonia claviformis	Chylismia claviformis (Torr. & Fr&eacute;m.) A. Heller
JM1: Camissonia claviformis subsp. aurantiaca	Chylismia claviformis subsp. aurantiaca (Munz) W.L. Wagner & Hoch
JM1: Camissonia claviformis subsp. claviformis	Chylismia claviformis (Torr. & Fr&eacute;m.) A. Heller subsp. claviformis
JM1: Camissonia claviformis subsp. cruciformis	Chylismia claviformis subsp. cruciformis (Kellogg) W.L. Wagner & Hoch
JM1: Camissonia claviformis subsp. funerea	Chylismia claviformis subsp. funerea (P.H. Raven) W.L. Wagner & Hoch
JM1: Camissonia claviformis subsp. integrior	Chylismia claviformis subsp. integrior (P.H. Raven) W.L. Wagner & Hoch
JM1: Camissonia claviformis subsp. lancifolia	Chylismia claviformis subsp. lancifolia (A. Heller) W.L. Wagner & Hoch
JM1: Camissonia claviformis subsp. peirsonii	Chylismia claviformis subsp. peirsonii (Munz) W.L. Wagner & Hoch
JM1: Camissonia claviformis subsp. yumae	Chylismia claviformis subsp. yumae (P.H. Raven) W.L. Wagner & Hoch
JM1: Camissonia confusa	Camissoniopsis confusa (P.H. Raven) W.L. Wagner & Hoch
JM1: Camissonia contorta	Camissonia contorta (Douglas) Kearney
JM1: Camissonia graciliflora	Tetrapteron graciliflorum (Hook. & Arn.) W.L. Wagner & Hoch
JMS: Camissonia guadalupensis	Camissoniopsis guadalupensis (S. Watson) W.L. Wagner & Hoch
JM1: Camissonia guadalupensis subsp. clementina	Camissoniopsis guadalupensis (S. Watson) W.L. Wagner & Hoch subsp. clementina (P.H. Raven) W.L. Wagner & Hoch
JM1: Camissonia hardhamiae	Camissoniopsis hardhamiae (P.H. Raven) W.L. Wagner & Hoch
JM1: Camissonia heterochroma	Chylismia heterochroma (S. Watson) Small
JM1: Camissonia hirtella	Camissoniopsis hirtella (Greene) W.L. Wagner & Hoch
JM1: Camissonia ignota	Camissoniopsis ignota (Jeps.) W.L. Wagner & Hoch
JM1: Camissonia integrifolia	Camissonia integrifolia P.H. Raven
JM1: Camissonia intermedia	Camissoniopsis intermedia (P.H. Raven) W.L. Wagner & Hoch
JM1: Camissonia kernensis	Camissonia kernensis (Munz) P.H. Raven
JM1: Camissonia kernensis subsp. gilmanii	Camissonia kernensis subsp. gilmanii (Munz) P.H. Raven
JM1: Camissonia kernensis subsp. kernensis	Camissonia kernensis (Munz) P.H. Raven subsp. kernensis
JM1: Camissonia lacustris	Camissonia lacustris P.H. Raven
JM1: Camissonia lewisii	Camissoniopsis lewisii (P.H. Raven) W.L. Wagner & Hoch
JM1: Camissonia luciae	Camissoniopsis luciae (P.H. Raven) W.L. Wagner & Hoch
JM1: Camissonia micrantha	Camissoniopsis micrantha (Spreng.) W.L. Wagner & Hoch
JM1: Camissonia minor	Eremothera minor (A. Nelson) W.L. Wagner & Hoch
JM1: Camissonia munzii	Chylismia munzii (P.H. Raven) W.L. Wagner & Hoch
JM1: Camissonia ovata	Taraxia ovata (Torr. & A. Gray) Small
JM1: Camissonia pallida	Camissoniopsis pallida (Abrams) W.L. Wagner & Hoch
JM1: Camissonia pallida subsp. hallii	Camissoniopsis pallida subsp. hallii (Davidson) W.L. Wagner & Hoch
JM1: Camissonia pallida subsp. pallida	Camissoniopsis pallida (Abrams) W.L. Wagner & Hoch subsp. pallida
JM1: Camissonia palmeri	Tetrapteron palmeri (S. Watson) W.L. Wagner & Hoch
JM1: Camissonia parvula	Camissonia parvula (Torr. & A. Gray) P.H. Raven
JM1: Camissonia pterosperma	Chylismiella pterosperma (S. Watson) W.L. Wagner & Hoch
JM1: Camissonia pubens	Camissonia pubens (S. Watson) P.H. Raven
JM1: Camissonia pusilla	Camissonia pusilla P.H. Raven
JM1: Camissonia refracta	Eremothera refracta (S. Watson) W.L. Wagner & Hoch
JM1: Camissonia robusta	Camissoniopsis robusta (P.H. Raven) W.L. Wagner & Hoch
JM1: Camissonia sierrae	Camissonia sierrae P.H. Raven
JM1: Camissonia sierrae subsp. alticola	Camissonia sierrae subsp. alticola P.H. Raven
JM1: Camissonia sierrae subsp. sierrae	Camissonia sierrae P.H. Raven subsp. sierrae
JM1: Camissonia strigulosa	Camissonia strigulosa (Fisch. & C.A. Mey.) P.H. Raven
JM1: Camissonia subacaulis	Taraxia subacaulis (Pursh) Rydb.
JM1: Camissonia tanacetifolia	Taraxia tanacetifolia (Torr. & A. Gray) Piper
JM1: Camissonia tanacetifolia subsp. quadriperforata	Taraxia tanacetifolia (Torr. & A. Gray) Piper
JM1: Camissonia tanacetifolia subsp. tanacetifolia	Taraxia tanacetifolia (Torr. & A. Gray) Piper
JMS: Camissonia walkeri	Chylismia walkeri A. Nelson
JM1: Camissonia walkeri subsp. tortilis	Chylismia walkeri A. Nelson subsp. tortilis (Jeps.) W.L. Wagner & Hoch
JM2: Camissoniopsis bistorta	Camissoniopsis bistorta (Torr. & A. Gray) W.L. Wagner & Hoch
JM2: Camissoniopsis cheiranthifolia	Camissoniopsis cheiranthifolia (Spreng.) W.L. Wagner & Hoch
JM2: Camissoniopsis cheiranthifolia subsp. cheiranthifolia	Camissoniopsis cheiranthifolia (Spreng.) W.L. Wagner & Hoch subsp. cheiranthifolia
JM2: Camissoniopsis cheiranthifolia subsp. suffruticosa	Camissoniopsis cheiranthifolia subsp. suffruticosa (S. Watson) W.L. Wagner & Hoch
JM2: Camissoniopsis confusa	Camissoniopsis confusa (P.H. Raven) W.L. Wagner & Hoch
JM2: Camissoniopsis guadalupensis	Camissoniopsis guadalupensis (S. Watson) W.L. Wagner & Hoch
JM2: Camissoniopsis guadalupensis subsp. clementina	Camissoniopsis guadalupensis (S. Watson) W.L. Wagner & Hoch subsp. clementina (P.H. Raven) W.L. Wagner & Hoch
JM2: Camissoniopsis hardhamiae	Camissoniopsis hardhamiae (P.H. Raven) W.L. Wagner & Hoch
JM2: Camissoniopsis hirtella	Camissoniopsis hirtella (Greene) W.L. Wagner & Hoch
JM2: Camissoniopsis ignota	Camissoniopsis ignota (Jeps.) W.L. Wagner & Hoch
JM2: Camissoniopsis intermedia	Camissoniopsis intermedia (P.H. Raven) W.L. Wagner & Hoch
JM2: Camissoniopsis lewisii	Camissoniopsis lewisii (P.H. Raven) W.L. Wagner & Hoch
JM2: Camissoniopsis luciae	Camissoniopsis luciae (P.H. Raven) W.L. Wagner & Hoch
JM2: Camissoniopsis micrantha	Camissoniopsis micrantha (Spreng.) W.L. Wagner & Hoch
JM2: Camissoniopsis pallida	Camissoniopsis pallida (Abrams) W.L. Wagner & Hoch
JM2: Camissoniopsis pallida subsp. hallii	Camissoniopsis pallida subsp. hallii (Davidson) W.L. Wagner & Hoch
JM2: Camissoniopsis pallida subsp. pallida	Camissoniopsis pallida (Abrams) W.L. Wagner & Hoch subsp. pallida
JM2: Camissoniopsis robusta	Camissoniopsis robusta (P.H. Raven) W.L. Wagner & Hoch
JM1: Campanula angustiflora	Campanula angustiflora Eastw.
JM1: Campanula californica	Campanula californica (Kellogg) A. Heller
JM1: Campanula exigua	Campanula exigua Rattan
JM1: Campanula griffinii	Campanula griffinii Morin
JM1: Campanula prenanthoides	Asyneuma prenanthoides (Durand) McVaugh
JM1: Campanula rotundifolia	Campanula rotundifolia L.
JM1: Campanula scabrella	Campanula scabrella Engelm.
JM1: Campanula scouleri	Campanula scouleri A. DC.
JM1: Campanula sharsmithiae	Campanula sharsmithiae Morin
JM1: Campanula shetleri	Campanula shetleri Heckard
JM1: Campanula wilkinsiana	Campanula wilkinsiana Greene
JM2: Campsis radicans	Campsis radicans (L.) Bureau
JM1: Canbya candida	Canbya candida A. Gray
JMS: Cannabis indica	Cannabis sativa L.
JM1: Cannabis sativa	Cannabis sativa L.
JM1: Capsella bursa-pastoris	Capsella bursa-pastoris (L.) Medik.
JM1: Caragana arborescens	excluded
JM1: Cardamine angulata	Cardamine angulata Hook.
JM2: Cardamine bellidifolia	Cardamine bellidifolia L.
JM1: Cardamine bellidifolia var. pachyphylla	Cardamine bellidifolia L.
JM1: Cardamine breweri	Cardamine breweri S. Watson
JM1: Cardamine breweri var. breweri	Cardamine breweri S. Watson
JM1: Cardamine breweri var. orbicularis	Cardamine breweri S. Watson
JM1: Cardamine californica	Cardamine californica (Nutt.) Greene
JM1: Cardamine californica var. californica	Cardamine californica (Nutt.) Greene
JM1: Cardamine californica var. cardiophylla	Cardamine californica (Nutt.) Greene
JM1: Cardamine californica var. cuneata	Cardamine californica (Nutt.) Greene
JM1: Cardamine californica var. integrifolia	Cardamine californica (Nutt.) Greene
JM1: Cardamine californica var. sinuata	Cardamine californica (Nutt.) Greene
JM2: Cardamine cordifolia	Cardamine cordifolia A. Gray
JM1: Cardamine cordifolia var. lyallii	Cardamine cordifolia A. Gray
JMS: Cardamine gambelii	Nasturtium gambelii (S. Watson) O.E. Schulz
JMS: Cardamine gemmata	Cardamine nuttallii Greene
JM1: Cardamine hirsuta	Cardamine hirsuta L.
JMS: Cardamine lyallii	Cardamine cordifolia A. Gray
JM1: Cardamine nuttallii	Cardamine nuttallii Greene
JM1: Cardamine nuttallii var. covilleana	Cardamine nuttallii Greene
JM1: Cardamine nuttallii var. dissecta	Cardamine nuttallii Greene
JM1: Cardamine nuttallii var. gemmata	Cardamine nuttallii Greene
JM1: Cardamine nuttallii var. nuttallii	Cardamine nuttallii Greene
JM1: Cardamine occidentalis	Cardamine occidentalis (S. Watson) Howell
JM1: Cardamine oligosperma	Cardamine oligosperma Nutt.
JM1: Cardamine pachystigma	Cardamine pachystigma (S. Watson) Rollins; Cardamine californica (Nutt.) Greene
JM1: Cardamine pachystigma var. dissectifolia	Cardamine californica (Nutt.) Greene
JM1: Cardamine pachystigma var. pachystigma	Cardamine pachystigma (S. Watson) Rollins
JM1: Cardamine pensylvanica	Cardamine pensylvanica Willd.
JMS: Cardamine pulcherrima	Cardamine nuttallii Greene
JMS: Cardamine pulcherrima var. tenella	Cardamine nuttallii Greene
JMS: Cardamine tenella	Cardamine nuttallii Greene
JMS: Cardamine tenella var. dissecta	Cardamine nuttallii Greene
JM1: Cardaria chalepensis	Lepidium chalepense L.
JM1: Cardaria draba	Lepidium draba L.
JMS: Cardaria draba subsp. chalepensis	Lepidium chalepense L.
JM1: Cardaria pubescens	Lepidium appelianum Al-Shehbaz
JMS: Cardaria pubescens var. elongata	Lepidium appelianum Al-Shehbaz
JM1: Cardionema ramosissimum	Cardionema ramosissimum (Weinm.) A. Nelson & J.F. Macbr.
JM1: Carduus acanthoides	Carduus acanthoides L.
JM2: Carduus acanthoides subsp. acanthoides	Carduus acanthoides L. subsp. acanthoides
JM1: Carduus nutans	Carduus nutans L.
JM1: Carduus pycnocephalus	Carduus pycnocephalus L.
JM2: Carduus pycnocephalus subsp. pycnocephalus	Carduus pycnocephalus L. subsp. pycnocephalus
JM1: Carduus tenuiflorus	Carduus tenuiflorus Curtis
JM1: Carex abrupta	Carex abrupta Mack.
JM1: Carex albida	Carex lemmonii W. Boott
JM1: Carex albonigra	Carex albonigra Mack.
JM1: Carex alma	Carex alma L.H. Bailey
JM1: Carex amplectens	Carex fracta Mack.
JM1: Carex amplifolia	Carex amplifolia Boott
JM1: Carex angustata	Carex angustata Boott
JM1: Carex aquatilis	Carex aquatilis Wahlenb.
JM1: Carex aquatilis var. aquatilis	Carex aquatilis Wahlenb. var. aquatilis
JM1: Carex aquatilis var. dives	Carex aquatilis var. dives (T. Holm) K&uuml;k.
JM1: Carex arcta	Carex arcta Boott
JM1: Carex atherodes	Carex atherodes Spreng.
JM1: Carex athrostachya	Carex athrostachya Olney
JM1: Carex aurea	Carex aurea Nutt.
JM1: Carex barbarae	Carex barbarae Dewey
JMS: Carex bella	Carex heteroneura W. Boott
JM1: Carex bolanderi	Carex bolanderi Olney
JM1: Carex brainerdii	Carex brainerdii Mack.
JM1: Carex brevicaulis	Carex brevicaulis Mack.
JM2: Carex breweri	Carex breweri Boott
JM1: Carex breweri var. breweri	Carex breweri Boott
JMS: Carex brunnescens	Carex laeviculmis Meinsh.
JM1: Carex buxbaumii	Carex buxbaumii Wahlenb.
JM1: Carex californica	Carex californica L.H. Bailey
JM1: Carex canescens	Carex canescens L.
JM2: Carex canescens subsp. canescens	Carex canescens L. subsp. canescens
JM1: Carex capitata	Carex capitata L.
JM1: Carex cephalophora	misappl. to Carex mesochorea
JM1: Carex comosa	Carex comosa Boott
JM1: Carex concinnoides	Carex concinnoides Mack.
JM1: Carex congdonii	Carex congdonii L.H. Bailey
JMS: Carex constanceana	Carex davyi Mack.
JM1: Carex cusickii	Carex cusickii Piper & Beattie
JM1: Carex davyi	Carex davyi Mack.
JM2: Carex deflexa	Carex deflexa Hornem.
JM2: Carex deflexa var. boottii	Carex deflexa Hornem. var. boottii L.H. Bailey
JM1: Carex densa	Carex densa (L.H. Bailey) L.H. Bailey
JMS: Carex deweyana	Carex leptopoda Mack.
JM1: Carex deweyana subsp. leptopoda	Carex leptopoda Mack.
JM1: Carex diandra	Carex diandra Schrank
JM1: Carex disperma	Carex disperma Dewey
JM2: Carex divulsa	Carex divulsa Stokes
JM2: Carex divulsa subsp. divulsa	Carex divulsa Stokes subsp. divulsa
JM1: Carex douglasii	Carex douglasii Boott
JM1: Carex dudleyi	Carex densa (L.H. Bailey) L.H. Bailey
JM2: Carex duriuscula	Carex duriuscula C.A. Mey.
JMS: Carex eastwoodiana	Carex tahoensis Smiley
JM1: Carex echinata	Carex echinata Murray
JM1: Carex echinata subsp. echinata	Carex echinata Murray subsp. echinata
JM1: Carex echinata subsp. phyllomanica	Carex echinata subsp. phyllomanica (W. Boott) Reznicek
JM1: Carex eleocharis	Carex duriuscula C.A. Mey.
JMS: Carex epapillosa	Carex heteroneura W. Boott
JM2: Carex exsiccata	Carex exsiccata L.H. Bailey
JM1: Carex feta	Carex feta L.H. Bailey
JM1: Carex filifolia	Carex filifolia Nutt.
JM1: Carex filifolia var. erostrata	Carex filifolia var. erostrata K&uuml;k.
JM1: Carex filifolia var. filifolia	Carex filifolia var. filifolia
JM1: Carex fissuricola	Carex fissuricola Mack.
JM1: Carex fracta	Carex fracta Mack.
JM1: Carex garberi	Carex hassei L.H. Bailey
JMS: Carex geophila	Carex rossii Boott
JM1: Carex geyeri	Carex geyeri Boott
JM1: Carex gigas	Carex scabriuscula Mack.
JM1: Carex globosa	Carex globosa Boott
JM1: Carex gracilior	Carex gracilior Mack.
JM1: Carex gynodynama	Carex gynodynama Olney
JM1: Carex halliana	Carex halliana L.H. Bailey
JM1: Carex harfordii	Carex harfordii Mack.
JM1: Carex hassei	Carex hassei L.H. Bailey
JM1: Carex haydeniana	Carex haydeniana Olney
JM1: Carex helleri	Carex helleri Mack.
JM1: Carex hendersonii	Carex hendersonii L.H. Bailey
JM1: Carex heteroneura	Carex heteroneura W. Boott
JM1: Carex heteroneura var. epapillosa	Carex heteroneura W. Boott
JM1: Carex heteroneura var. heteroneura	Carex heteroneura W. Boott
JM1: Carex hirtissima	Carex hirtissima W. Boott
JM1: Carex hoodii	Carex hoodii Boott
JM2: Carex hystericina	Carex hystericina Willd.
JM1: Carex hystricina	Carex hystericina Willd.
JM2: Carex idahoa	Carex idahoa L.H. Bailey
JM1: Carex illota	Carex illota L.H. Bailey
JM2: Carex incurviformis	Carex incurviformis Mack.
JM1: Carex incurviformis var. danaensis	Carex incurviformis Mack.
JM2: Carex infirminervia	Carex infirminervia Naczi
JMS: Carex inflata	Carex vesicaria L.
JM2: Carex inops	Carex inops L.H. Bailey
JM1: Carex inops subsp. inops	Carex inops L.H. Bailey subsp. inops
JM1: Carex integra	Carex integra Mack.
JM1: Carex interior	Carex interior L.H. Bailey
JM2: Carex inversa	Carex inversa R. Br.
JM1: Carex jonesii	Carex jonesii L.H. Bailey
JM2: Carex klamathensis	Carex klamathensis B.L. Wilson & Janeway
JM1: Carex laeviculmis	Carex laeviculmis Meinsh.
JM1: Carex lanuginosa	Carex pellita Willd.
JM1: Carex lasiocarpa	Carex lasiocarpa Ehrh.
JM1: Carex leavenworthii	Carex leavenworthii Dewey
JM1: Carex lemmonii	Carex lemmonii W. Boott
JM1: Carex lenticularis	Carex lenticularis Michx.
JM1: Carex lenticularis var. impressa	Carex lenticularis var. impressa (L.H. Bailey) L.A. Standl.
JM1: Carex lenticularis var. limnophila	Carex lenticularis var. limnophila (T. Holm) Cronquist
JM1: Carex lenticularis var. lipocarpa	Carex lenticularis var. lipocarpa (T. Holm) L.A. Standl.
JM2: Carex leporina	Carex leporina L.
JM1: Carex leporinella	Carex leporinella Mack.
JM1: Carex leptalea	Carex leptalea Wahlenb.
JM2: Carex leptopoda	Carex leptopoda Mack.
JM1: Carex limosa	Carex limosa L.
JM1: Carex livida	Carex livida (Wahlenb.) Willd.
JM2: Carex longii	Carex longii Mack.
JM1: Carex luzulifolia	Carex luzulifolia W. Boott
JM1: Carex luzulina	Carex luzulina Olney
JM1: Carex luzulina var. ablata	Carex luzulina Olney
JM1: Carex luzulina var. luzulina	Carex luzulina Olney
JM1: Carex lyngbyei	Carex lyngbyei Hornem.
JM1: Carex mariposana	Carex mariposana Mack.
JM1: Carex mendocinensis	Carex mendocinensis W. Boott
JM1: Carex mertensii	Carex mertensii Bong.
JMS: Carex micropoda	Carex subnigricans Stacey
JM1: Carex microptera	Carex microptera Mack.
JM1: Carex molesta	excluded
JM1: Carex multicaulis	Carex multicaulis L.H. Bailey
JM1: Carex multicostata	Carex multicostata Mack.
JM1: Carex nebrascensis	Carex nebrascensis Dewey
JM1: Carex nervina	Carex nervina L.H. Bailey
JM1: Carex neurophora	Carex neurophora Mack.
JM1: Carex nigricans	Carex nigricans C.A. Mey.
JM1: Carex norvegica	Carex stevenii (T. Holm) Kalela
JM1: Carex nudata	Carex nudata W. Boott
JM1: Carex obispoensis	Carex obispoensis Stacey
JM1: Carex obnupta	Carex obnupta L.H. Bailey
JM1: Carex occidentalis	Carex occidentalis L.H. Bailey
JM1: Carex ovalis	Carex leporina L.
JM2: Carex pachycarpa	Carex pachycarpa Mack.
JM1: Carex pachystachya	Carex pachystachya Steud.
JM1: Carex pansa	Carex pansa L.H. Bailey
JMS: Carex parryana	Carex idahoa L.H. Bailey
JM1: Carex parryana var. hallii	Carex idahoa L.H. Bailey
JM2: Carex pellita	Carex pellita Willd.
JM2: Carex pendula	Carex pendula Huds.
JM1: Carex petasata	Carex petasata Dewey
JM1: Carex phaeocephala	Carex phaeocephala Piper
JMS: Carex phaeocephala f. eastwoodiana	Carex tahoensis Smiley
JM1: Carex praeceptorum	Carex praeceptorum Mack.
JM1: Carex praegracilis	Carex praegracilis W. Boott
JM1: Carex praticola	Carex praticola Rydb.
JM1: Carex preslii	Carex preslii Steud.
JM1: Carex proposita	Carex proposita Mack.
JMS: Carex pyrenaica	Carex subnigricans Stacey
JM1: Carex raynoldsii	Carex raynoldsii Dewey
JMS: Carex retroflexa	Carex texensis (L.H. Bailey) L.H. Bailey
JM1: Carex retroflexa var. texensis	Carex texensis (L.H. Bailey) L.H. Bailey
JM1: Carex rossii	Carex rossii Boott
JMS: Carex rostrata	Carex utriculata Boott
JM1: Carex saliniformis	Carex saliniformis Mack.
JM1: Carex sartwelliana	Carex sartwelliana Olney
JM2: Carex scabriuscula	Carex scabriuscula Mack.
JM1: Carex schottii	Carex schottii Dewey
JM2: Carex scirpoidea	Carex scirpoidea Michx.
JM2: Carex scirpoidea subsp. pseudoscirpoidea	Carex scirpoidea Michx. subsp. pseudoscirpoidea (Rydb.) D.A. Dunlop
JM1: Carex scirpoidea var. pseudoscirpoidea	Carex scirpoidea Michx. subsp. pseudoscirpoidea (Rydb.) D.A. Dunlop
JM1: Carex scoparia	Carex scoparia Willd.
JM2: Carex scoparia var. scoparia	Carex scoparia Willd. var. scoparia
JM2: Carex scopulorum	Carex scopulorum T. Holm
JM1: Carex scopulorum var. bracteosa	Carex scopulorum T. Holm var. bracteosa (L.H. Bailey) F.J. Herm.
JM1: Carex senta	Carex senta Boott
JM2: Carex serpenticola	Carex serpenticola Zika
JM1: Carex serratodens	Carex serratodens W. Boott
JM1: Carex sheldonii	Carex sheldonii Mack.
JM1: Carex simulata	Carex simulata Mack.
JM1: Carex specifica	Carex specifica L.H. Bailey
JM1: Carex spectabilis	Carex spectabilis Dewey
JM1: Carex spissa	Carex spissa L.H. Bailey
JM2: Carex stevenii	Carex stevenii (T. Holm) Kalela
JM2: Carex stipata	Carex stipata Willd.
JM1: Carex stipata var. stipata	Carex stipata Willd. var. stipata
JM1: Carex straminiformis	Carex straminiformis L.H. Bailey
JM1: Carex subbracteata	Carex subbracteata Mack.
JM1: Carex subfusca	Carex subfusca W. Boott
JM1: Carex subnigricans	Carex subnigricans Stacey
JM1: Carex tahoensis	Carex tahoensis Smiley
JM2: Carex texensis	Carex texensis (L.H. Bailey) L.H. Bailey
JM1: Carex tiogana	Carex tiogana D.W. Taylor & J.D. Mastrog.
JM1: Carex tompkinsii	Carex tompkinsii J.T. Howell
JM1: Carex triquetra	Carex triquetra Boott
JM1: Carex tumulicola	Carex tumulicola Mack.
JM1: Carex unilateralis	Carex unilateralis Mack.
JM1: Carex utriculata	Carex utriculata Boott
JM1: Carex vallicola	Carex vallicola Dewey
JM1: Carex vernacula	Carex vernacula L.H. Bailey
JM1: Carex vesicaria	Carex vesicaria L.; Carex exsiccata L.H. Bailey
JM1: Carex vesicaria var. major	Carex exsiccata L.H. Bailey
JM1: Carex vesicaria var. vesicaria	Carex vesicaria L.
JM2: Carex viridula	Carex viridula Michx.
JM2: Carex viridula subsp. viridula	Carex viridula Michx. subsp. viridula
JM1: Carex viridula var. viridula	Carex viridula Michx. subsp. viridula
JM1: Carex vulpinoidea	Carex vulpinoidea Michx.
JM1: Carex whitneyi	Carex whitneyi Olney
JM1: Carlowrightia arizonica	Carlowrightia arizonica A. Gray
JM2: Carlquistia muirii	Carlquistia muirii (A. Gray) B.G. Baldwin
JM1: Carnegiea gigantea	Carnegiea gigantea (Engelm.) Britton & Rose
JMS: Caroxylon vermiculatum	Salsola damascena Botsch.
JM1: Carpenteria californica	Carpenteria californica Torr.
JM1: Carpobrotus chilensis	Carpobrotus chilensis (Molina) N.E. Br.
JM1: Carpobrotus edulis	Carpobrotus edulis (L.) N.E. Br.
JM2: Carrichtera annua	Carrichtera annua (L.) DC.
JM2: Carsonia sparsifolia	Carsonia sparsifolia (S. Watson) Greene
JM1: Carthamus baeticus	Carthamus creticus L.
JM2: Carthamus creticus	Carthamus creticus L.
JM1: Carthamus lanatus	Carthamus lanatus L.
JM1: Carthamus leucocaulos	Carthamus leucocaulos Sibth. & Sm.
JM1: Carthamus tinctorius	Carthamus tinctorius L.
JM2: Carya illinoinensis	Carya illinoinensis (Wangenh.) K. Koch
JM2: Cascadia nuttallii	Cascadia nuttallii (Small) A.M. Johnson
JMS: Cassia artemisioides	Senna artemisioides (DC.) Randell
JMS: Cassia didymobothrya	Senna didymobotrya (Fresen.) H.S. Irwin & Barneby
JMS: Cassia marilandica	Senna marilandica (L.) Link
JM1: Cassiope mertensiana	Cassiope mertensiana (Bong.) G. Don
JM1: Castela emoryi	Castela emoryi (A. Gray) Moran & Felger
JM1: Castilleja affinis	Castilleja affinis Hook. & Arn.
JM1: Castilleja affinis subsp. affinis	Castilleja affinis Hook. & Arn. subsp. affinis
JM1: Castilleja affinis subsp. litoralis	Castilleja affinis subsp. litoralis (Pennell) T.I. Chuang & Heckard
JM1: Castilleja affinis subsp. neglecta	Castilleja affinis subsp. neglecta (Zeile) T.I. Chuang & Heckard
JM1: Castilleja ambigua	Castilleja ambigua Hook. & Arn.
JM1: Castilleja ambigua subsp. ambigua	Castilleja ambigua Hook. & Arn. subsp. ambigua
JM1: Castilleja ambigua subsp. humboldtiensis	Castilleja ambigua subsp. humboldtiensis (D.D. Keck) T.I. Chuang & Heckard
JM1: Castilleja ambigua subsp. insalutata	Castilleja ambigua subsp. insalutata (Jeps.) T.I. Chuang & Heckard
JM1: Castilleja angustifolia	Castilleja chromosa A. Nelson
JM1: Castilleja applegatei	Castilleja applegatei Fernald
JM1: Castilleja applegatei subsp. disticha	Castilleja applegatei subsp. disticha (Eastw.) T.I. Chuang & Heckard
JM1: Castilleja applegatei subsp. martinii	Castilleja applegatei subsp. martinii (Abrams) T.I. Chuang & Heckard
JM1: Castilleja applegatei subsp. pallida	Castilleja applegatei subsp. pallida (Eastw.) T.I. Chuang & Heckard
JM1: Castilleja applegatei subsp. pinetorum	Castilleja applegatei subsp. pinetorum (Fernald) T.I. Chuang & Heckard
JM1: Castilleja arachnoidea	Castilleja arachnoidea Greenm.; Castilleja schizotricha Greenm.
JMS: Castilleja arachnoidea subsp. schizotricha	Castilleja schizotricha Greenm.
JMS: Castilleja arachnoidea subsp. shastensis	Castilleja arachnoidea Greenm.
JM1: Castilleja attenuata	Castilleja attenuata (A. Gray) T.I. Chuang & Heckard
JM2: Castilleja brevilobata	Castilleja brevilobata Piper
JM1: Castilleja brevistyla	Castilleja brevistyla (Hoover) T.I. Chuang & Heckard
JMS: Castilleja breweri	Castilleja applegatei
JMS: Castilleja breweri var. pallida	Castilleja applegatei subsp. pallida (Eastw.) T.I. Chuang & Heckard
JM1: Castilleja campestris	Castilleja campestris (Benth.) T.I. Chuang & Heckard
JM1: Castilleja campestris subsp. campestris	Castilleja campestris (Benth.) T.I. Chuang & Heckard subsp. campestris
JM1: Castilleja campestris subsp. succulenta	Castilleja campestris subsp. succulenta (Hoover) T.I. Chuang & Heckard
JM2: Castilleja chromosa	Castilleja chromosa A. Nelson
JM1: Castilleja chrymactis	excluded
JM1: Castilleja cinerea	Castilleja cinerea A. Gray
JMS: Castilleja culbertsonii	Castilleja lemmonii A. Gray
JM1: Castilleja densiflora	Castilleja densiflora (Benth.) T.I. Chuang & Heckard
JM1: Castilleja densiflora subsp. densiflora	Castilleja densiflora (Benth.) T.I. Chuang & Heckard subsp. densiflora
JM1: Castilleja densiflora subsp. gracilis	Castilleja densiflora subsp. gracilis (Benth.) T.I. Chuang & Heckard
JM1: Castilleja densiflora subsp. obispoensis	Castilleja densiflora subsp. obispoensis (D.D. Keck) T.I. Chuang & Heckard
JMS: Castilleja disticha	Castilleja applegatei subsp. disticha (Eastw.) T.I. Chuang & Heckard
JMS: Castilleja elata	Castilleja miniata subsp. elata (Piper) Munz
JMS: Castilleja exilis	Castilleja minor (A. Gray) A. Gray subsp. minor
JM1: Castilleja exserta	Castilleja exserta (A. Heller) T.I. Chuang & Heckard
JM1: Castilleja exserta subsp. exserta	Castilleja exserta (A. Heller) T.I. Chuang & Heckard subsp. exserta
JM1: Castilleja exserta subsp. latifolia	Castilleja exserta subsp. latifolia (S. Watson) T.I. Chuang & Heckard
JM1: Castilleja exserta subsp. venusta	Castilleja exserta subsp. venusta (A. Heller) T.I. Chuang & Heckard
JM1: Castilleja foliolosa	Castilleja foliolosa Hook. & Arn.
JMS: Castilleja franciscana	Castilleja subinclusa subsp. franciscana (Pennell) T.I. Chuang & Heckard
JM2: Castilleja gleasoni	Castilleja gleasoni Elmer
JM1: Castilleja grisea	Castilleja grisea Dunkle
JMS: Castilleja hispida	Castilleja brevilobata Piper
JM1: Castilleja hispida subsp. brevilobata	Castilleja brevilobata Piper
JM2: Castilleja hololeuca	Castilleja hololeuca Greene
JMS: Castilleja hololeuca subsp. grisea	Castilleja grisea Dunkle
JMS: Castilleja jepsonii	Castilleja subinclusa Greene subsp. subinclusa
JM1: Castilleja lacera	Castilleja lacera (Benth.) T.I. Chuang & Heckard
JMS: Castilleja lanata	Castilleja hololeuca Greene
JM1: Castilleja lanata subsp. hololeuca	Castilleja hololeuca Greene
JM1: Castilleja lasiorhyncha	Castilleja lasiorhyncha (A. Gray) T.I. Chuang & Heckard
JM1: Castilleja latifolia	Castilleja latifolia Hook. & Arn.
JMS: Castilleja latifolia subsp. mendocinensis	Castilleja mendocinensis (Eastw.) Pennell
JM1: Castilleja lemmonii	Castilleja lemmonii A. Gray
JM1: Castilleja linariifolia	Castilleja linariifolia Benth.
JM1: Castilleja lineariloba	Castilleja lineariloba (Benth.) T.I. Chuang & Heckard
JMS: Castilleja litoralis	Castilleja affinis subsp. litoralis (Pennell) T.I. Chuang & Heckard
JMS: Castilleja martinii	Castilleja applegatei
JMS: Castilleja martinii var. clokeyi	Castilleja applegatei subsp. martinii (Abrams) T.I. Chuang & Heckard
JM1: Castilleja mendocinensis	Castilleja mendocinensis (Eastw.) Pennell
JM1: Castilleja miniata	Castilleja miniata Hook.
JM1: Castilleja miniata subsp. elata	Castilleja miniata subsp. elata (Piper) Munz
JM1: Castilleja miniata subsp. miniata	Castilleja miniata Hook. subsp. miniata
JM1: Castilleja minor	Castilleja minor (A. Gray) A. Gray
JM1: Castilleja minor subsp. minor	Castilleja minor (A. Gray) A. Gray subsp. minor
JM1: Castilleja minor subsp. spiralis	Castilleja minor subsp. spiralis (Jeps.) T.I. Chuang & Heckard
JM1: Castilleja mollis	Castilleja mollis Pennell
JM2: Castilleja montigena	Castilleja montigena Heckard
JM1: Castilleja nana	Castilleja nana Eastw.
JMS: Castilleja neglecta	Castilleja affinis subsp. neglecta (Zeile) T.I. Chuang & Heckard
JMS: Castilleja oblongifolia	Castilleja miniata Hook. subsp. miniata
JM1: Castilleja parviflora	Castilleja peirsonii Eastw.
JM2: Castilleja peirsonii	Castilleja peirsonii Eastw.
JM1: Castilleja pilosa	Castilleja pilosa (S. Watson) Rydb.
JMS: Castilleja pilosa subsp. jussellii	Castilleja pilosa (S. Watson) Rydb.
JM1: Castilleja plagiotoma	Castilleja plagiotoma A. Gray
JM1: Castilleja praeterita	Castilleja praeterita Heckard & Bacig.
JM1: Castilleja pruinosa	Castilleja gleasoni Elmer; Castilleja pruinosa Fernald
JMS: Castilleja psittacina	Castilleja pilosa (S. Watson) Rydb.
JMS: Castilleja roseana	Castilleja applegatei subsp. martinii (Abrams) T.I. Chuang & Heckard
JM1: Castilleja rubicundula	Castilleja rubicundula (Jeps.) T.I. Chuang & Heckard
JM1: Castilleja rubicundula subsp. lithospermoides	Castilleja rubicundula subsp. lithospermoides (Benth.) T.I. Chuang & Heckard
JM1: Castilleja rubicundula subsp. rubicundula	Castilleja rubicundula (Jeps.) T.I. Chuang & Heckard subsp. rubicundula
JM1: Castilleja schizotricha	Castilleja schizotricha Greenm.
JMS: Castilleja stenantha	Castilleja minor subsp. spiralis (Jeps.) T.I. Chuang & Heckard
JMS: Castilleja stenantha subsp. spiralis	Castilleja minor subsp. spiralis (Jeps.) T.I. Chuang & Heckard
JM1: Castilleja subinclusa	Castilleja subinclusa Greene
JM1: Castilleja subinclusa subsp. franciscana	Castilleja subinclusa subsp. franciscana (Pennell) T.I. Chuang & Heckard
JM1: Castilleja subinclusa subsp. subinclusa	Castilleja subinclusa Greene subsp. subinclusa
JM1: Castilleja tenuis	Castilleja tenuis (A. Heller) T.I. Chuang & Heckard
JM1: Castilleja wightii	Castilleja wightii Elmer
JM2: Catalpa bignonioides	Catalpa bignonioides Walter
JM2: Catalpa speciosa	Catalpa speciosa (Warder) Engelm.
JM1: Catharanthus roseus	Catharanthus roseus (L.) G. Don
JMS: Caucalis microcarpa	Yabea microcarpa (Hook. & Arn.) Koso-Pol.
JM1: Caulanthus amplexicaulis	Caulanthus amplexicaulis S. Watson
JM1: Caulanthus amplexicaulis var. amplexicaulis	Caulanthus amplexicaulis S. Watson
JM1: Caulanthus amplexicaulis var. barbarae	Caulanthus amplexicaulis S. Watson
JM2: Caulanthus anceps	Caulanthus anceps Payson
JM1: Caulanthus californicus	Caulanthus californicus (S. Watson) Payson
JM1: Caulanthus cooperi	Caulanthus cooperi (S. Watson) Payson
JM1: Caulanthus coulteri	Caulanthus coulteri S. Watson; Caulanthus lemmonii S. Watson
JM1: Caulanthus coulteri var. coulteri	Caulanthus coulteri S. Watson
JM1: Caulanthus coulteri var. lemmonii	Caulanthus lemmonii S. Watson
JM1: Caulanthus crassicaulis	Caulanthus crassicaulis (Torr.) S. Watson
JM1: Caulanthus crassicaulis var. crassicaulis	Caulanthus crassicaulis (Torr.) S. Watson
JM1: Caulanthus crassicaulis var. glaber	Caulanthus crassicaulis (Torr.) S. Watson
JM2: Caulanthus flavescens	Caulanthus flavescens (Hook.) Payson
JMS: Caulanthus glaber	Caulanthus crassicaulis (Torr.) S. Watson
JM1: Caulanthus glaucus	Caulanthus glaucus S. Watson
JM1: Caulanthus hallii	Caulanthus hallii Payson
JM1: Caulanthus heterophyllus	Caulanthus heterophyllus (Nutt.) Payson
JM1: Caulanthus heterophyllus var. heterophyllus	Caulanthus heterophyllus (Nutt.) Payson
JM1: Caulanthus heterophyllus var. pseudosimulans	Caulanthus heterophyllus (Nutt.) Payson
JM1: Caulanthus inflatus	Caulanthus inflatus S. Watson
JM2: Caulanthus lasiophyllus	Caulanthus lasiophyllus (Hook. & Arn.) Payson
JMS: Caulanthus lasiophyllus var. inalienus	Caulanthus lasiophyllus (Hook. & Arn.) Payson
JMS: Caulanthus lasiophyllus var. rigidus	Caulanthus lasiophyllus (Hook. & Arn.) Payson
JMS: Caulanthus lasiophyllus var. utahensis	Caulanthus lasiophyllus (Hook. & Arn.) Payson
JM2: Caulanthus lemmonii	Caulanthus lemmonii S. Watson
JM1: Caulanthus major	Caulanthus major (M.E. Jones) Payson
JM1: Caulanthus major var. major	Caulanthus major (M.E. Jones) Payson
JM1: Caulanthus major var. nevadensis	Caulanthus major (M.E. Jones) Payson
JM1: Caulanthus pilosus	Caulanthus pilosus S. Watson
JM1: Caulanthus simulans	Caulanthus simulans Payson
JMS: Caulanthus stenocarpus	Caulanthus heterophyllus (Nutt.) Payson
JM1: Caulostramina jaegeri	Hesperidanthus jaegeri (Rollins) Al-Shehbaz
JM1: Ceanothus arboreus	Ceanothus arboreus Greene
JMS: Ceanothus arboreus var. glaber	Ceanothus arboreus Greene
JM2: Ceanothus arcuatus	Ceanothus arcuatus McMinn
JM1: Ceanothus confusus	Ceanothus confusus J.T. Howell
JM1: Ceanothus cordulatus	Ceanothus cordulatus Kellogg
JM1: Ceanothus crassifolius	Ceanothus crassifolius Torr.
JM2: Ceanothus crassifolius var. crassifolius	Ceanothus crassifolius Torr. var. crassifolius
JM2: Ceanothus crassifolius var. planus	Ceanothus crassifolius var. planus Abrams
JM1: Ceanothus cuneatus	Ceanothus cuneatus Nutt.; Ceanothus rigidus Nutt.
JM1: Ceanothus cuneatus var. cuneatus	Ceanothus cuneatus Nutt. var. cuneatus
JM1: Ceanothus cuneatus var. fascicularis	Ceanothus cuneatus var. fascicularis (McMinn) Hoover
JM2: Ceanothus cuneatus var. ramulosus	Ceanothus cuneatus var. ramulosus Greene
JM1: Ceanothus cuneatus var. rigidus	Ceanothus rigidus Nutt.
JM1: Ceanothus cyaneus	Ceanothus cyaneus Eastw.
JM1: Ceanothus dentatus	Ceanothus dentatus Torr. & A. Gray
JM1: Ceanothus divergens	Ceanothus divergens Parry
JM1: Ceanothus diversifolius	Ceanothus diversifolius Kellogg
JM1: Ceanothus ferrisae	Ceanothus ferrisiae McMinn
JM2: Ceanothus ferrisiae	Ceanothus ferrisiae McMinn
JM1: Ceanothus foliosus	Ceanothus foliosus Parry
JM1: Ceanothus foliosus var. foliosus	Ceanothus foliosus Parry var. foliosus
JM1: Ceanothus foliosus var. medius	Ceanothus foliosus var. medius McMinn
JM1: Ceanothus foliosus var. vineatus	Ceanothus foliosus var. vineatus McMinn
JM1: Ceanothus fresnensis	Ceanothus fresnensis Abrams
JM1: Ceanothus gloriosus	Ceanothus gloriosus J.T. Howell
JM1: Ceanothus gloriosus var. exaltatus	Ceanothus gloriosus var. exaltatus J.T. Howell
JM1: Ceanothus gloriosus var. gloriosus	Ceanothus gloriosus J.T. Howell var. gloriosus
JM1: Ceanothus gloriosus var. porrectus	Ceanothus gloriosus var. porrectus J.T. Howell
JM1: Ceanothus greggii	Ceanothus perplexans Trel.; Ceanothus vestitus Greene
JM1: Ceanothus greggii var. perplexans	Ceanothus perplexans Trel.
JM1: Ceanothus greggii var. vestitus	Ceanothus vestitus Greene
JM1: Ceanothus griseus	Ceanothus thyrsiflorus var. griseus Trel.
JM1: Ceanothus hearstiorum	Ceanothus hearstiorum Hoover & Roof
JM1: Ceanothus impressus	Ceanothus impressus Trel.
JM2: Ceanothus impressus var. impressus	Ceanothus impressus Trel. var. impressus
JM2: Ceanothus impressus var. nipomensis	Ceanothus impressus var. nipomensis McMinn
JM1: Ceanothus incanus	Ceanothus incanus Torr. & A. Gray
JM1: Ceanothus integerrimus	Ceanothus integerrimus Hook. & Arn.
JMS: Ceanothus integerrimus var. californicus	Ceanothus integerrimus var. macrothyrsus (Torr.) G.T. Benson
JM2: Ceanothus integerrimus var. integerrimus	Ceanothus integerrimus Hook. & Arn. var. integerrimus
JM2: Ceanothus integerrimus var. macrothyrsus	Ceanothus integerrimus var. macrothyrsus (Torr.) G.T. Benson
JMS: Ceanothus integerrimus var. puberulus	Ceanothus integerrimus var. macrothyrsus (Torr.) G.T. Benson
JM1: Ceanothus jepsonii	Ceanothus jepsonii Greene
JM1: Ceanothus jepsonii var. albiflorus	Ceanothus jepsonii Greene
JM1: Ceanothus jepsonii var. jepsonii	Ceanothus jepsonii Greene
JM1: Ceanothus lemmonii	Ceanothus lemmonii Parry
JM1: Ceanothus leucodermis	Ceanothus leucodermis Greene
JM1: Ceanothus maritimus	Ceanothus maritimus Hoover
JM1: Ceanothus masonii	Ceanothus masonii McMinn
JM1: Ceanothus megacarpus	Ceanothus megacarpus Nutt.
JM1: Ceanothus megacarpus var. insularis	Ceanothus megacarpus var. insularis (Eastw.) Munz
JM1: Ceanothus megacarpus var. megacarpus	Ceanothus megacarpus Nutt. var. megacarpus
JMS: Ceanothus megacarpus var. pendulus	Ceanothus megacarpus Nutt. var. megacarpus
JM1: Ceanothus oliganthus	Ceanothus oliganthus Nutt.
JM1: Ceanothus oliganthus var. oliganthus	Ceanothus oliganthus Nutt. var. oliganthus
JM2: Ceanothus oliganthus var. orcuttii	Ceanothus oliganthus var. orcuttii (Parry) Jeps.
JM1: Ceanothus oliganthus var. sorediatus	Ceanothus oliganthus var. sorediatus (Hook. & Arn.) Hoover
JM2: Ceanothus ophiochilus	Ceanothus ophiochilus S. Boyd et al.
JM2: Ceanothus otayensis	Ceanothus otayensis McMinn
JM1: Ceanothus palmeri	Ceanothus palmeri Trel.
JM1: Ceanothus papillosus	Ceanothus papillosus Torr. & A. Gray
JM1: Ceanothus papillosus var. papillosus	Ceanothus papillosus Torr. & A. Gray
JM1: Ceanothus papillosus var. roweanus	Ceanothus papillosus Torr. & A. Gray
JM1: Ceanothus parryi	Ceanothus parryi Trel.
JM1: Ceanothus parvifolius	Ceanothus parvifolius (S. Watson) Trel.
JM2: Ceanothus perplexans	Ceanothus perplexans Trel.
JM1: Ceanothus pinetorum	Ceanothus pinetorum Coville
JM1: Ceanothus prostratus	Ceanothus prostratus Benth.
JM2: Ceanothus prostratus var. occidentalis	Ceanothus prostratus var. occidentalis McMinn
JM2: Ceanothus prostratus var. prostratus	Ceanothus prostratus Benth. var. prostratus
JM1: Ceanothus pumilus	Ceanothus pumilus Greene
JM1: Ceanothus purpureus	Ceanothus purpureus Jeps.
JM2: Ceanothus rigidus	Ceanothus rigidus Nutt.
JM1: Ceanothus roderickii	Ceanothus roderickii W. Knight
JM1: Ceanothus sanguineus	Ceanothus sanguineus Pursh
JM1: Ceanothus sonomensis	Ceanothus sonomensis J.T. Howell
JM1: Ceanothus spinosus	Ceanothus spinosus Nutt.
JM1: Ceanothus thyrsiflorus	Ceanothus thyrsiflorus Eschsch.
JM2: Ceanothus thyrsiflorus var. griseus	Ceanothus thyrsiflorus var. griseus Trel.
JMS: Ceanothus thyrsiflorus var. repens	Ceanothus thyrsiflorus Eschsch. var. thyrsiflorus
JM2: Ceanothus thyrsiflorus var. thyrsiflorus	Ceanothus thyrsiflorus Eschsch. var. thyrsiflorus
JM1: Ceanothus tomentosus	Ceanothus tomentosus Parry
JMS: Ceanothus tomentosus var. olivaceus	Ceanothus tomentosus Parry
JM1: Ceanothus velutinus	Ceanothus velutinus Douglas
JM1: Ceanothus velutinus var. hookeri	Ceanothus velutinus Douglas
JMS: Ceanothus velutinus var. laevigatus	Ceanothus velutinus Douglas
JM1: Ceanothus velutinus var. velutinus	Ceanothus velutinus Douglas
JM1: Ceanothus verrucosus	Ceanothus verrucosus Nutt.
JM2: Ceanothus vestitus	Ceanothus vestitus Greene
JM2: Celtis australis	Celtis australis L.
JM1: Celtis reticulata	Celtis reticulata Torr.
JM2: Celtis sinensis	Celtis sinensis Pers.
JM1: Cenchrus ciliaris	Pennisetum ciliare (L.) Link
JM1: Cenchrus echinatus	Cenchrus echinatus L.
JM1: Cenchrus spinifex	Cenchrus incertus M.A. Curtis
JM2: Cenchrus incertus	Cenchrus incertus M.A. Curtis
JM1: Cenchrus longispinus	Cenchrus longispinus (Hack.) Fernald
JMS: Cenchrus pauciflorus	Cenchrus incertus M.A. Curtis
JMS: Centaurea &times;moncktonii	Centaurea jacea nothosubsp. pratensis (W.D.J. Koch) &Ccaron;elak.
JMS: Centaurea &times;pratensis	Centaurea jacea nothosubsp. pratensis (W.D.J. Koch) &Ccaron;elak.
JM2: Centaurea benedicta	Centaurea benedicta (L.) L.
JM1: Centaurea calcitrapa	Centaurea calcitrapa L.
JM2: Centaurea cineraria	Centaurea cineraria L.
JM1: Centaurea cyanus	Centaurea cyanus L.
JM1: Centaurea diffusa	Centaurea diffusa Lam.
JM1: Centaurea diluta	Centaurea diluta Aiton
JM1: Centaurea iberica	Centaurea iberica Spreng.
JM2: Centaurea jacea	Centaurea jacea L.
JM2: Centaurea jacea nothosubsp. pratensis	Centaurea jacea nothosubsp. pratensis (W.D.J. Koch) &Ccaron;elak.
JM2: Centaurea jacea subsp. jacea	Centaurea jacea L. subsp. jacea
JM2: Centaurea jacea subsp. nigra	Centaurea jacea subsp. nigra (L.) Bonnier & Layens
JM1: Centaurea maculosa	Centaurea stoebe L. subsp. micranthos (Gugler) Hayek
JM1: Centaurea melitensis	Centaurea melitensis L.
JMS: Centaurea muricata	Volutaria muricata (L.) Maire
JM1: Centaurea nigra	Centaurea jacea subsp. nigra (L.) Bonnier & Layens
JM2: Centaurea pouzinii	Centaurea pouzinii DC.
JM1: Centaurea solstitialis	Centaurea solstitialis L.
JM1: Centaurea squarrosa	Centaurea virgata Lam. subsp. squarrosa (Boiss.) Gugler
JM2: Centaurea stoebe	Centaurea stoebe L.
JM2: Centaurea stoebe subsp. micranthos	Centaurea stoebe L. subsp. micranthos (Gugler) Hayek
JM1: Centaurea sulphurea	Centaurea sulphurea Willd.
JM2: Centaurea virgata	Centaurea virgata Lam.
JM2: Centaurea virgata subsp. squarrosa	Centaurea virgata Lam. subsp. squarrosa (Boiss.) Gugler
JMS: Centaurium arizonicum	Zeltnera arizonica (A. Gray) G. Mans.
JM1: Centaurium calycosum	excluded
JM1: Centaurium davyi	Zeltnera davyi (Jeps.) G. Mans.
JM1: Centaurium erythraea	Centaurium erythraea Rafn
JM1: Centaurium exaltatum	Zeltnera exaltata (Griseb.) G. Mans.; Zeltnera namophila (Reveal et al.) G. Mans.
JMS: Centaurium floribundum	Centaurium tenuiflorum (Hoffmanns. & Link) Janch.
JM1: Centaurium muehlenbergii	Centaurium tenuiflorum (Hoffmanns. & Link) Janch.; Zeltnera muehlenbergii (Griseb.) G. Mans.
JMS: Centaurium namophilum	Zeltnera namophila (Reveal et al.) G. Mans.
JM2: Centaurium pulchellum	Centaurium pulchellum (Sw.) Hand.-Mazz. et al.
JM2: Centaurium tenuiflorum	Centaurium tenuiflorum (Hoffmanns. & Link) Janch.
JM1: Centaurium trichanthum	Zeltnera trichantha (Griseb.) G. Mans.
JM1: Centaurium venustum	Zeltnera venusta (A. Gray) G. Mans.
JMS: Centaurium venustum subsp. abramsii	Zeltnera venusta (A. Gray) G. Mans.
JM1: Centranthus ruber	Centranthus ruber (L.) DC.
JM2: Centromadia fitchii	Centromadia fitchii (A. Gray) Greene
JM2: Centromadia parryi	Centromadia parryi (Greene) Greene
JM2: Centromadia parryi subsp. australis	Centromadia parryi subsp. australis (D.D. Keck) B.G. Baldwin
JM2: Centromadia parryi subsp. congdonii	Centromadia parryi subsp. congdonii (B.L. Rob. & Greenm.) B.G. Baldwin
JM2: Centromadia parryi subsp. parryi	Centromadia parryi (Greene) Greene subsp. parryi
JM2: Centromadia parryi subsp. rudis	Centromadia parryi subsp. rudis (Greene) B.G. Baldwin
JM2: Centromadia pungens	Centromadia pungens (Hook. & Arn.) Greene
JM2: Centromadia pungens subsp. laevis	Centromadia pungens subsp. laevis (D.D. Keck) B.G. Baldwin
JMS: Centromadia pungens subsp. maritima	Centromadia pungens (Hook. & Arn.) Greene subsp. pungens
JM2: Centromadia pungens subsp. pungens	Centromadia pungens (Hook. & Arn.) Greene subsp. pungens
JMS: Centromadia pungens subsp. septentrionalis	Centromadia pungens (Hook. & Arn.) Greene subsp. pungens
JM1: Centrostegia thurberi	Centrostegia thurberi A. Gray
JM1: Centunculus minimus	Anagallis minima (L.) E.H.L. Krause
JM1: Cephalanthera austiniae	Cephalanthera austiniae (A. Gray) A. Heller
JM2: Cephalanthus occidentalis	Cephalanthus occidentalis L.
JM1: Cephalanthus occidentalis var. californicus	Cephalanthus occidentalis L.
JMS: Cephalophora decurrens	Helenium puberulum DC.
JM1: Cerastium arvense	misappl. to Cerastium arvense subsp. strictum; Cerastium viride A. Heller
JM2: Cerastium arvense subsp. strictum	Cerastium arvense L. subsp. strictum Gaudin
JMS: Cerastium arvense var. maximum	Cerastium viride A. Heller
JM2: Cerastium beeringianum	Cerastium beeringianum Cham. & Schltdl.
JMS: Cerastium beeringianum subsp. earlei	Cerastium beeringianum Cham. & Schltdl.
JM1: Cerastium beeringianum var. capillare	Cerastium beeringianum Cham. & Schltdl.
JM1: Cerastium dichotomum	Cerastium dichotomum L.
JM2: Cerastium diffusum	Cerastium diffusum Pers.
JM2: Cerastium fontanum	Cerastium fontanum Baumg.
JM1: Cerastium fontanum subsp. vulgare	Cerastium fontanum Baumg. subsp. vulgare (Hartm.) Greuter & Burdet
JM1: Cerastium glomeratum	Cerastium glomeratum Thuill.
JMS: Cerastium tetrandrum	Cerastium diffusum Pers.
JM2: Cerastium viride	Cerastium viride A. Heller
JMS: Ceratoides lanata	Krascheninnikovia lanata (Pursh) A. Meeuse & A. Smit
JM1: Ceratophyllum demersum	Ceratophyllum demersum L.
JMS: Cercidium floridum	Parkinsonia florida (A. Gray) S. Watson
JM1: Cercidium floridum subsp. floridum	Parkinsonia florida (A. Gray) S. Watson
JM1: Cercidium microphyllum	Parkinsonia microphylla Torr.
JM1: Cercis occidentalis	Cercis occidentalis A. Gray
JMS: Cercis orbiculata	Cercis occidentalis A. Gray
JM1: Cercocarpus betuloides	Cercocarpus betuloides Nutt.
JMS: Cercocarpus betuloides subsp. blancheae	Cercocarpus betuloides var. blancheae (C.K. Schneid.) Little
JM1: Cercocarpus betuloides var. betuloides	Cercocarpus betuloides Nutt. var. betuloides
JM1: Cercocarpus betuloides var. blancheae	Cercocarpus betuloides var. blancheae (C.K. Schneid.) Little
JM1: Cercocarpus betuloides var. macrourus	Cercocarpus betuloides var. macrourus (Rydb.) Jeps.
JM1: Cercocarpus intricatus	Cercocarpus ledifolius var. intricatus (S. Watson) M.E. Jones
JM1: Cercocarpus ledifolius	Cercocarpus ledifolius Nutt.
JM1: Cercocarpus ledifolius var. intermontanus	Cercocarpus ledifolius var. intermontanus N.H. Holmgren
JM2: Cercocarpus ledifolius var. intricatus	Cercocarpus ledifolius var. intricatus (S. Watson) M.E. Jones
JM1: Cercocarpus ledifolius var. ledifolius	Cercocarpus ledifolius Nutt. var. ledifolius
JM1: Cercocarpus minutiflorus	Cercocarpus minutiflorus Abrams
JM1: Cercocarpus traskiae	Cercocarpus traskiae Eastw.
JMS: Cereus emoryi	Bergerocactus emoryi (Engelm.) Britton & Rose
JMS: Cereus giganteus	Carnegiea gigantea (Engelm.) Britton & Rose
JM2: Cestrum elegans	Cestrum elegans (Brongn.) Schltdl.
JM1: Cestrum fasciculatum	Cestrum elegans (Brongn.) Schltdl.
JM2: Cestrum nocturnum	Cestrum nocturnum L.
JM2: Cestrum parqui	Cestrum parqui L'H&eacute;r.
JM1: Chaenactis alpigena	Chaenactis alpigena Sharsm.
JM1: Chaenactis artemisiifolia	Chaenactis artemisiifolia (Harv. & A. Gray) A. Gray
JM1: Chaenactis carphoclinia	Chaenactis carphoclinia A. Gray
JM1: Chaenactis carphoclinia var. carphoclinia	Chaenactis carphoclinia A. Gray var. carphoclinia
JM1: Chaenactis carphoclinia var. peirsonii	Chaenactis carphoclinia var. peirsonii (Jeps.) Munz
JM1: Chaenactis douglasii	Chaenactis douglasii (Hook.) Hook. & Arn.
JM1: Chaenactis douglasii var. alpina	Chaenactis douglasii var. alpina A. Gray
JM1: Chaenactis douglasii var. douglasii	Chaenactis douglasii (Hook.) Hook. & Arn. var. douglasii
JM1: Chaenactis fremontii	Chaenactis fremontii A. Gray
JMS: Chaenactis gillespiei	Chaenactis stevioides Hook. & Arn.
JM1: Chaenactis glabriuscula	Chaenactis glabriuscula DC.
JM1: Chaenactis glabriuscula var. glabriuscula	Chaenactis glabriuscula DC. var. glabriuscula
JM1: Chaenactis glabriuscula var. heterocarpha	Chaenactis glabriuscula var. heterocarpha (Torr. & A. Gray) H.M. Hall
JM1: Chaenactis glabriuscula var. lanosa	Chaenactis glabriuscula var. lanosa (DC.) H.M. Hall
JM1: Chaenactis glabriuscula var. megacephala	Chaenactis glabriuscula var. megacephala A. Gray
JM1: Chaenactis glabriuscula var. orcuttiana	Chaenactis glabriuscula var. orcuttiana (Greene) H.M. Hall
JM1: Chaenactis macrantha	Chaenactis macrantha D.C. Eaton
JM1: Chaenactis nevadensis	Chaenactis nevadensis (Kellogg) A. Gray
JM1: Chaenactis parishii	Chaenactis parishii A. Gray
JM1: Chaenactis santolinoides	Chaenactis santolinoides Greene
JM1: Chaenactis stevioides	Chaenactis stevioides Hook. & Arn.
JMS: Chaenactis stevioides var. thornberi	Chaenactis stevioides Hook. & Arn.
JM1: Chaenactis suffrutescens	Chaenactis suffrutescens A. Gray
JM1: Chaenactis xantiana	Chaenactis xantiana A. Gray
JM1: Chaetadelpha wheeleri	Chaetadelpha wheeleri S. Watson
JM1: Chaetopappa ericoides	Chaetopappa ericoides (Torr.) G.L. Nesom
JM1: Chamaebatia australis	Chamaebatia australis (Brandegee) Abrams
JM1: Chamaebatia foliolosa	Chamaebatia foliolosa Benth.
JM1: Chamaebatiaria millefolium	Chamaebatiaria millefolium (Torr.) Maxim.
JM2: Chamaecyparis lawsoniana	Chamaecyparis lawsoniana (A. Murray bis) Parl.
JMS: Chamaecyparis nootkatensis	Callitropsis nootkatensis (D. Don) D.P. Little
JM1: Chamaecytisus proliferus	Cytisus proliferus L. f.
JMS: Chamaemelum arvense	Anthemis arvensis L.
JMS: Chamaemelum cotula	Anthemis cotula L.
JMS: Chamaemelum foetidum	Anthemis cotula L.
JM1: Chamaemelum fuscatum	Chamaemelum fuscatum (Brot.) Vasc.
JM1: Chamaemelum nobile	excluded
JM1: Chamaesaracha coronopus	Chamaesaracha coronopus (Dunal) A. Gray
JM1: Chamaesaracha nana	Chamaesaracha nana (A. Gray) A. Gray
JM1: Chamaesyce abramsiana	Chamaesyce abramsiana (L.C. Wheeler) Koutnik
JM1: Chamaesyce albomarginata	Chamaesyce albomarginata (Torr. & A. Gray) Small
JM1: Chamaesyce arizonica	Chamaesyce arizonica (Engelm.) Arthur
JM1: Chamaesyce fendleri	Chamaesyce fendleri (Torr. & A. Gray) Small
JM1: Chamaesyce glyptosperma	Chamaesyce glyptosperma (Engelm.) Small
JM1: Chamaesyce hooveri	Chamaesyce hooveri (L.C. Wheeler) Koutnik
JM1: Chamaesyce maculata	Chamaesyce maculata (L.) Small
JM1: Chamaesyce melanadenia	Chamaesyce melanadenia (Torr.) Millsp.
JM1: Chamaesyce micromera	Chamaesyce micromera (Boiss.) Wooton & Standl.
JM1: Chamaesyce nutans	Chamaesyce nutans (Lag.) Small
JM1: Chamaesyce ocellata	Chamaesyce ocellata (Durand & Hilg.) Millsp.
JM1: Chamaesyce ocellata subsp. arenicola	Chamaesyce ocellata subsp. arenicola (Parish) Thorne
JM1: Chamaesyce ocellata subsp. ocellata	Chamaesyce ocellata (Durand & Hilg.) Millsp. subsp. ocellata
JM1: Chamaesyce ocellata subsp. rattanii	Chamaesyce ocellata subsp. rattanii (S. Watson) Koutnik
JM1: Chamaesyce parishii	Chamaesyce parishii (Greene) Millsp.
JM1: Chamaesyce parryi	Chamaesyce parryi (Engelm.) Rydb.
JM1: Chamaesyce pediculifera	Chamaesyce pediculifera (Engelm.) Rose & Standl.
JM1: Chamaesyce platysperma	Chamaesyce platysperma (Engelm.) Shinners
JM1: Chamaesyce polycarpa	Chamaesyce polycarpa (Benth.) Millsp.
JM1: Chamaesyce prostrata	Chamaesyce prostrata (Aiton) Small
JM1: Chamaesyce revoluta	Chamaesyce revoluta (Engelm.) Small
JM1: Chamaesyce serpens	Chamaesyce serpens (Kunth) Small
JM1: Chamaesyce serpyllifolia	Chamaesyce serpyllifolia (Pers.) Small
JM1: Chamaesyce serpyllifolia subsp. hirtula	Chamaesyce serpyllifolia subsp. hirtula (S. Watson) Koutnik
JM1: Chamaesyce serpyllifolia subsp. serpyllifolia	Chamaesyce serpyllifolia (Pers.) Small subsp. serpyllifolia
JM1: Chamaesyce setiloba	Chamaesyce setiloba (Engelm.) Parish
JM1: Chamaesyce vallis-mortae	Chamaesyce vallis-mortae Millsp.
JM2: Chamelaucium uncinatum	Chamelaucium uncinatum Schauer
JM2: Chamerion angustifolium	Chamerion angustifolium (L.) Holub
JM2: Chamerion angustifolium subsp. circumvagum	Chamerion angustifolium (L.) Holub subsp. circumvagum (Mosquin) Hoch
JM2: Chamerion latifolium	Chamerion latifolium (L.) Holub
JM1: Chamomilla occidentalis	Matricaria occidentalis Greene
JM1: Chamomilla suaveolens	Matricaria discoidea DC.
JM1: Chasmanthe floribunda	Chasmanthe floribunda (Salisb.) N.E. Br.
JM1: Cheilanthes clevelandii	Cheilanthes clevelandii D.C. Eaton
JM1: Cheilanthes cooperae	Cheilanthes cooperae D.C. Eaton
JM1: Cheilanthes covillei	Cheilanthes covillei Maxon
JM1: Cheilanthes feei	Cheilanthes feei T. Moore
JM1: Cheilanthes gracillima	Cheilanthes gracillima D.C. Eaton
JM1: Cheilanthes intertexta	Cheilanthes intertexta (Maxon) Maxon
JM1: Cheilanthes newberryi	Cheilanthes newberryi (D.C. Eaton) Domin
JM1: Cheilanthes parryi	Cheilanthes parryi (D.C. Eaton) Domin
JM1: Cheilanthes viscida	Cheilanthes viscida Davenp.
JM1: Cheilanthes wootonii	Cheilanthes wootonii Maxon
JMS: Chelone nemorosa	Nothochelone nemorosa (Lindl.) Straw
JM1: Chenopodium album	Chenopodium album L.
JM1: Chenopodium ambrosioides	Dysphania ambrosioides (L.) Mosyakin & Clemants; Dysphania anthelmintica (L.) Mosyakin & Clemants; Dysphania chilensis (Schrad.) Mosyakin & Clemants
JMS: Chenopodium ambrosioides var. anthelminticum	Dysphania anthelmintica (L.) Mosyakin & Clemants
JMS: Chenopodium ambrosioides var. suffruticosum	Dysphania ambrosioides (L.) Mosyakin & Clemants
JMS: Chenopodium ambrosioides var. vagans	Dysphania chilensis (Schrad.) Mosyakin & Clemants
JMS: Chenopodium anthelminticum	Dysphania anthelmintica (L.) Mosyakin & Clemants
JM1: Chenopodium atrovirens	Chenopodium atrovirens Rydb.
JM1: Chenopodium berlandieri	Chenopodium berlandieri Moq.
JM2: Chenopodium berlandieri var. sinuatum	Chenopodium berlandieri var. sinuatum (Murr) Wahl
JM2: Chenopodium berlandieri var. zschackei	Chenopodium berlandieri var. zschackei (Murr) Graebn.
JM1: Chenopodium botrys	Dysphania botrys (L.) Mosyakin & Clemants
JM1: Chenopodium californicum	Chenopodium californicum (S. Watson) S. Watson
JM2: Chenopodium capitatum	Chenopodium capitatum (L.) Ambrosi
JM2: Chenopodium capitatum var. capitatum	Chenopodium capitatum (L.) Ambrosi var. capitatum
JM2: Chenopodium capitatum var. parvicapitatum	Chenopodium capitatum var. parvicapitatum S.L. Welsh
JMS: Chenopodium carnosulum	Chenopodium littoreum Benet-Pierce & M.G. Simpson
JM1: Chenopodium carnosulum var. patagonicum	Chenopodium littoreum Benet-Pierce & M.G. Simpson
JM1: Chenopodium chenopodioides	Chenopodium chenopodioides (L.) Aellen
JM1: Chenopodium desiccatum	Chenopodium desiccatum A. Nelson
JMS: Chenopodium desiccatum var. leptophylloides	Chenopodium pratericola Rydb.
JM1: Chenopodium foliosum	Chenopodium foliosum (Moench) Asch.
JM1: Chenopodium fremontii	Chenopodium fremontii S. Watson
JMS: Chenopodium fremontii var. incanum	Chenopodium incanum (S. Watson) A. Heller var. occidentale D.J. Crawford
JMS: Chenopodium gigantospermum	Chenopodium simplex (Torr.) Raf.
JM1: Chenopodium glaucum	misappl. to Chenopodium glaucum var. salinum
JM2: Chenopodium glaucum var. salinum	Chenopodium glaucum L. var. salinum (Standl.) B. Boivin
JM1: Chenopodium hians	Chenopodium hians Standl.
JM2: Chenopodium incanum	Chenopodium incanum (S. Watson) A. Heller
JM1: Chenopodium incanum var. occidentale	Chenopodium incanum (S. Watson) A. Heller var. occidentale D.J. Crawford
JM1: Chenopodium incognitum	Chenopodium hians Standl.
JM1: Chenopodium leptophyllum	Chenopodium leptophyllum (Moq.) S. Watson
JM2: Chenopodium littoreum	Chenopodium littoreum Benet-Pierce & M.G. Simpson
JM2: Chenopodium macrospermum	Chenopodium macrospermum Hook. f.
JMS: Chenopodium macrospermum var. farinosum	Chenopodium macrospermum Hook. f.
JM1: Chenopodium macrospermum var. halophilum	Chenopodium macrospermum Hook. f.
JM1: Chenopodium missouriense	Chenopodium missouriense Aellen
JM1: Chenopodium multifidum	Dysphania multifida (L.) Mosyakin & Clemants
JM1: Chenopodium murale	Chenopodium murale L.
JM1: Chenopodium nevadense	Chenopodium nevadense Standl.
JMS: Chenopodium overi	Chenopodium capitatum var. parvicapitatum S.L. Welsh
JM2: Chenopodium polyspermum	Chenopodium polyspermum L.
JM2: Chenopodium polyspermum var. acutifolium	Chenopodium polyspermum L. var. acutifolium (Sm.) Gaudin
JM1: Chenopodium pratericola	Chenopodium pratericola Rydb.
JM1: Chenopodium pumilio	Dysphania pumilio (R. Br.) Mosyakin & Clemants
JM1: Chenopodium rubrum	Chenopodium rubrum L.
JM2: Chenopodium rubrum var. humile	Chenopodium rubrum var. humile (Hook.) S. Watson
JM2: Chenopodium rubrum var. rubrum	Chenopodium rubrum L var. rubrum
JM1: Chenopodium simplex	Chenopodium simplex (Torr.) Raf.
JMS: Chenopodium spinosum	Grayia spinosa (Hook.) Moq.
JM2: Chenopodium strictum	Chenopodium strictum Roth
JM1: Chenopodium strictum var. glaucophyllum	Chenopodium strictum Roth var. glaucophyllum (Aellen) Wahl
JMS: Chenopodium subspicatum	Atriplex dioica Raf.
JM1: Chenopodium vulvaria	Chenopodium vulvaria L.
JM2: Chenopodium watsonii	Chenopodium watsonii A. Nelson
JM2: Chilopsis linearis	Chilopsis linearis (Cav.) Sweet
JM1: Chilopsis linearis subsp. arcuata	Chilopsis linearis (Cav.) Sweet subsp. arcuata (Fosberg) Henrickson
JM1: Chimaphila menziesii	Chimaphila menziesii (D. Don) Spreng.
JM1: Chimaphila umbellata	Chimaphila umbellata (L.) W.P.C. Barton
JM2: Chloracantha spinosa	Chloracantha spinosa (Benth.) G.L. Nesom
JM1: Chloracantha spinosa var. spinosa	Chloracantha spinosa (Benth.) G.L. Nesom var. spinosa
JM1: Chloris gayana	Chloris gayana Kunth
JM1: Chloris truncata	Chloris truncata R. Br.
JM1: Chloris verticillata	Chloris verticillata Nutt.
JM1: Chloris virgata	Chloris virgata Sw.
JM1: Chlorogalum angustifolium	Chlorogalum angustifolium Kellogg
JM1: Chlorogalum grandiflorum	Chlorogalum grandiflorum Hoover
JM1: Chlorogalum parviflorum	Chlorogalum parviflorum S. Watson
JM1: Chlorogalum pomeridianum	Chlorogalum pomeridianum (DC.) Kunth
JM1: Chlorogalum pomeridianum var. divaricatum	Chlorogalum pomeridianum var. divaricatum (Lindl.) Hoover
JM1: Chlorogalum pomeridianum var. minus	Chlorogalum pomeridianum var. minus Hoover
JM1: Chlorogalum pomeridianum var. pomeridianum	Chlorogalum pomeridianum (DC.) Kunth var. pomeridianum
JM1: Chlorogalum purpureum	Chlorogalum purpureum Brandegee
JM1: Chlorogalum purpureum var. purpureum	Chlorogalum purpureum Brandegee var. purpureum
JM1: Chlorogalum purpureum var. reductum	Chlorogalum purpureum var. reductum Hoover
JM2: Chloropyron maritimum	Chloropyron maritimum (Benth.) A. Heller
JM2: Chloropyron maritimum subsp. canescens	Chloropyron maritimum (Benth.) A. Heller subsp. canescens (A. Gray) Tank & J.M. Egger
JM2: Chloropyron maritimum subsp. maritimum	Chloropyron maritimum (Benth.) A. Heller subsp. maritimum
JM2: Chloropyron maritimum subsp. palustre	Chloropyron maritimum (Benth.) A. Heller subsp. palustre (Behr) Tank & J.M. Egger
JM2: Chloropyron molle	Chloropyron molle (A. Gray) A. Heller
JM2: Chloropyron molle subsp. hispidum	Chloropyron molle (A. Gray) A. Heller subsp. hispidum (Pennell) Tank & J.M. Egger
JM2: Chloropyron molle subsp. molle	Chloropyron molle (A. Gray) A. Heller subsp. molle
JM2: Chloropyron palmatum	Chloropyron palmatum (Ferris) Tank & J.M. Egger
JM2: Chloropyron tecopense	Chloropyron tecopense (Munz & J.C. Roos) Tank & J.M. Egger
JM1: Chondrilla juncea	Chondrilla juncea L.
JMS: Chorisiva nevadensis	Euphrosyne nevadensis (M.E. Jones) Panero
JM1: Chorispora tenella	Chorispora tenella (Pall.) DC.
JM1: Chorizanthe angustifolia	Chorizanthe angustifolia Nutt.
JM1: Chorizanthe biloba	Chorizanthe biloba Goodman
JM1: Chorizanthe biloba var. biloba	Chorizanthe biloba var. biloba
JM1: Chorizanthe biloba var. immemora	Chorizanthe biloba var. immemora Reveal & Hardham
JM1: Chorizanthe blakleyi	Chorizanthe blakleyi Hardham
JM1: Chorizanthe brevicornu	Chorizanthe brevicornu Torr.
JM1: Chorizanthe brevicornu var. brevicornu	Chorizanthe brevicornu var. brevicornu
JM1: Chorizanthe brevicornu var. spathulata	Chorizanthe brevicornu var. spathulata (Rydb.) C.L. Hitchc.
JM1: Chorizanthe breweri	Chorizanthe breweri S. Watson
JM1: Chorizanthe clevelandii	Chorizanthe clevelandii Parry
JM1: Chorizanthe corrugata	Chorizanthe corrugata (Torr.) Torr. & A. Gray
JM1: Chorizanthe cuspidata	Chorizanthe cuspidata S. Watson
JM2: Chorizanthe cuspidata var. cuspidata	Chorizanthe cuspidata var. cuspidata
JM2: Chorizanthe cuspidata var. villosa	Chorizanthe cuspidata var. villosa (Eastw.) Munz
JM1: Chorizanthe diffusa	Chorizanthe diffusa Benth.
JM1: Chorizanthe douglasii	Chorizanthe douglasii Benth.
JM1: Chorizanthe fimbriata	Chorizanthe fimbriata Nutt.
JM1: Chorizanthe fimbriata var. fimbriata	Chorizanthe fimbriata var. fimbriata
JM1: Chorizanthe fimbriata var. laciniata	Chorizanthe fimbriata var. laciniata (Torr.) Jeps.
JM1: Chorizanthe howellii	Chorizanthe howellii Goodman
JM1: Chorizanthe leptotheca	Chorizanthe leptotheca Goodman
JM1: Chorizanthe membranacea	Chorizanthe membranacea Benth.
JM1: Chorizanthe obovata	Chorizanthe obovata Goodman
JM1: Chorizanthe orcuttiana	Chorizanthe orcuttiana Parry
JM1: Chorizanthe palmeri	Chorizanthe palmeri S. Watson
JM1: Chorizanthe parryi	Chorizanthe parryi S. Watson
JM1: Chorizanthe parryi var. fernandina	Chorizanthe parryi var. fernandina (S. Watson) Jeps.
JM1: Chorizanthe parryi var. parryi	Chorizanthe parryi var. parryi
JM1: Chorizanthe polygonoides	Chorizanthe polygonoides Torr. & A. Gray
JM1: Chorizanthe polygonoides var. longispina	Chorizanthe polygonoides var. longispina (Goodman) Munz
JM1: Chorizanthe polygonoides var. polygonoides	Chorizanthe polygonoides var. polygonoides
JM1: Chorizanthe procumbens	Chorizanthe procumbens Nutt.
JM1: Chorizanthe pungens	Chorizanthe pungens Benth.
JM2: Chorizanthe pungens var. hartwegiana	Chorizanthe pungens var. hartwegiana Reveal & Hardham
JM2: Chorizanthe pungens var. pungens	Chorizanthe pungens var. pungens
JM1: Chorizanthe rectispina	Chorizanthe rectispina Goodman
JM1: Chorizanthe rigida	Chorizanthe rigida (Torr.) Torr. & A. Gray
JM1: Chorizanthe robusta	Chorizanthe robusta Parry
JM2: Chorizanthe robusta var. hartwegii	Chorizanthe robusta var. hartwegii (Benth.) Reveal & Rand. Morgan
JM2: Chorizanthe robusta var. robusta	Chorizanthe robusta var. robusta
JM1: Chorizanthe spinosa	Chorizanthe spinosa S. Watson
JM1: Chorizanthe staticoides	Chorizanthe staticoides Benth.
JM1: Chorizanthe stellulata	Chorizanthe stellulata Benth.
JM1: Chorizanthe uniaristata	Chorizanthe uniaristata Torr. & A. Gray
JM1: Chorizanthe valida	Chorizanthe valida S. Watson
JM1: Chorizanthe ventricosa	Chorizanthe ventricosa Goodman
JM1: Chorizanthe watsonii	Chorizanthe watsonii Torr. & A. Gray
JM1: Chorizanthe wheeleri	Chorizanthe wheeleri S. Watson
JM1: Chorizanthe xanti	Chorizanthe xanti S. Watson
JM1: Chorizanthe xanti var. leucotheca	Chorizanthe xanti var. leucotheca Goodman
JM1: Chorizanthe xanti var. xanti	Chorizanthe xanti var. xanti
JM2: Chrysanthemoides monilifera	Chrysanthemoides monilifera (L.) Norl.
JM2: Chrysanthemoides monilifera subsp. monilifera	Chrysanthemoides monilifera (L.) Norl. subsp. monilifera
JM1: Chrysanthemum carinatum	excluded
JM1: Chrysanthemum coronarium	Glebionis coronaria (L.) Spach
JM1: Chrysanthemum segetum	Glebionis segetum (L.) Fourr.
JM1: Chrysolepis chrysophylla	Chrysolepis chrysophylla (Hook.) Hjelmq.
JM1: Chrysolepis chrysophylla var. chrysophylla	Chrysolepis chrysophylla (Hook.) Hjelmq. var. chrysophylla
JM1: Chrysolepis chrysophylla var. minor	Chrysolepis chrysophylla var. minor (Benth.) Munz
JM1: Chrysolepis sempervirens	Chrysolepis sempervirens (Kellogg) Hjelmq.
JM1: Chrysosplenium glechomifolium	Chrysosplenium glechomifolium Nutt.
JM1: Chrysothamnus albidus	Ericameria albida (A. Gray) L.C. Anderson
JM1: Chrysothamnus depressus	Chrysothamnus depressus Nutt.
JM1: Chrysothamnus gramineus	Cuniculotinus gramineus (H.M. Hall) Urbatsch et al.
JM1: Chrysothamnus greenei	Chrysothamnus greenei (A. Gray) Greene
JM1: Chrysothamnus humilis	Chrysothamnus humilis Greene
JM1: Chrysothamnus nauseosus	Ericameria nauseosa (Pall.) G.L. Nesom & G.I. Baird
JM1: Chrysothamnus nauseosus subsp. albicaulis	Ericameria nauseosa var. speciosa (Nutt.) G.L. Nesom & G.I. Baird
JM1: Chrysothamnus nauseosus subsp. bernardinus	Ericameria nauseosa var. bernardina (H.M. Hall) G.L. Nesom & G.I. Baird
JM1: Chrysothamnus nauseosus subsp. ceruminosus	Ericameria nauseosa var. ceruminosa (Durand & Hilg.) G.L. Nesom & G.I. Baird
JM1: Chrysothamnus nauseosus subsp. consimilis	Ericameria nauseosa var. oreophila (A. Nelson) G.L. Nesom & G.I. Baird
JMS: Chrysothamnus nauseosus subsp. gnaphalodes	Ericameria nauseosa var. hololeuca (A. Gray) G.L. Nesom & G.I. Baird
JM1: Chrysothamnus nauseosus subsp. hololeucus	Ericameria nauseosa var. hololeuca (A. Gray) G.L. Nesom & G.I. Baird
JM1: Chrysothamnus nauseosus subsp. leiospermus	Ericameria nauseosa var. leiosperma (A. Gray) G.L. Nesom & G.I. Baird
JM1: Chrysothamnus nauseosus subsp. mohavensis	Ericameria nauseosa var. mohavensis (Greene) G.L. Nesom & G.I. Baird
JM1: Chrysothamnus nauseosus subsp. washoensis	Ericameria nauseosa var. washoensis (L.C. Anderson) G.L. Nesom & G.I. Baird
JMS: Chrysothamnus nauseosus var. viridulus	Ericameria nauseosa var. oreophila (A. Nelson) G.L. Nesom & G.I. Baird
JM1: Chrysothamnus paniculatus	Ericameria paniculata (A. Gray) Rydb.
JM1: Chrysothamnus parryi	Ericameria parryi
JM1: Chrysothamnus parryi subsp. asper	Ericameria parryi var. aspera (Greene) G.L. Nesom & G.I. Baird
JM1: Chrysothamnus parryi subsp. imulus	Ericameria parryi var. imula (H.M. Hall & Clem.) G.L. Nesom & G.I. Baird
JM1: Chrysothamnus parryi subsp. latior	Ericameria parryi var. latior (H.M. Hall & Clem.) G.L. Nesom & G.I. Baird
JM1: Chrysothamnus parryi subsp. monocephalus	Ericameria parryi var. monocephala (A. Nelson & P.B. Kenn.) G.L. Nesom & G.I. Baird
JM1: Chrysothamnus parryi subsp. nevadensis	Ericameria parryi var. nevadensis (A. Gray) G.L. Nesom & G.I. Baird
JM1: Chrysothamnus parryi subsp. vulcanicus	Ericameria parryi var. vulcanica (Greene) G.L. Nesom & G.I. Baird
JM1: Chrysothamnus teretifolius	Ericameria teretifolia (Durand & Hilg.) Jeps.
JM1: Chrysothamnus viscidiflorus	Chrysothamnus viscidiflorus (Hook.) Nutt.; Chrysothamnus humilis Greene
JM1: Chrysothamnus viscidiflorus subsp. axillaris	Chrysothamnus viscidiflorus subsp. axillaris (D.D. Keck) L.C. Anderson
JMS: Chrysothamnus viscidiflorus subsp. humilis	Chrysothamnus humilis Greene
JM1: Chrysothamnus viscidiflorus subsp. lanceolatus	Chrysothamnus viscidiflorus subsp. lanceolatus (Nutt.) H.M. Hall & Clem.
JMS: Chrysothamnus viscidiflorus subsp. latifolius	Chrysothamnus viscidiflorus (Hook.) Nutt. subsp. viscidiflorus
JM1: Chrysothamnus viscidiflorus subsp. puberulus	Chrysothamnus viscidiflorus subsp. puberulus (D.C. Eaton) H.M. Hall & Clem.
JMS: Chrysothamnus viscidiflorus subsp. pumilus	Chrysothamnus viscidiflorus (Hook.) Nutt. subsp. viscidiflorus
JMS: Chrysothamnus viscidiflorus subsp. stenophyllus	Chrysothamnus viscidiflorus (Hook.) Nutt. subsp. viscidiflorus
JM1: Chrysothamnus viscidiflorus subsp. viscidiflorus	Chrysothamnus viscidiflorus (Hook.) Nutt. subsp. viscidiflorus
JM2: Chylismia arenaria	Chylismia arenaria A. Nelson
JM2: Chylismia brevipes	Chylismia brevipes (A. Gray) Small
JM2: Chylismia brevipes subsp. arizonica	Chylismia brevipes subsp. arizonica (P.H. Raven) W.L. Wagner & Hoch
JM2: Chylismia brevipes subsp. brevipes	Chylismia brevipes (A. Gray) Small subsp. brevipes
JM2: Chylismia brevipes subsp. pallidula	Chylismia brevipes subsp. pallidula (Munz) W.L. Wagner & Hoch
JM2: Chylismia cardiophylla	Chylismia cardiophylla (Torr.) Small
JM2: Chylismia cardiophylla subsp. cardiophylla	Chylismia cardiophylla (Torr.) Small subsp. cardiophylla
JM2: Chylismia cardiophylla subsp. robusta	Chylismia cardiophylla subsp. robusta (P.H. Raven) W.L. Wagner & Hoch
JM2: Chylismia claviformis	Chylismia claviformis (Torr. & Fr&eacute;m.) A. Heller
JM2: Chylismia claviformis subsp. aurantiaca	Chylismia claviformis subsp. aurantiaca (Munz) W.L. Wagner & Hoch
JM2: Chylismia claviformis subsp. claviformis	Chylismia claviformis (Torr. & Fr&eacute;m.) A. Heller subsp. claviformis
JM2: Chylismia claviformis subsp. cruciformis	Chylismia claviformis subsp. cruciformis (Kellogg) W.L. Wagner & Hoch
JM2: Chylismia claviformis subsp. funerea	Chylismia claviformis subsp. funerea (P.H. Raven) W.L. Wagner & Hoch
JM2: Chylismia claviformis subsp. integrior	Chylismia claviformis subsp. integrior (P.H. Raven) W.L. Wagner & Hoch
JM2: Chylismia claviformis subsp. lancifolia	Chylismia claviformis subsp. lancifolia (A. Heller) W.L. Wagner & Hoch
JM2: Chylismia claviformis subsp. peirsonii	Chylismia claviformis subsp. peirsonii (Munz) W.L. Wagner & Hoch
JM2: Chylismia claviformis subsp. yumae	Chylismia claviformis subsp. yumae (P.H. Raven) W.L. Wagner & Hoch
JM2: Chylismia heterochroma	Chylismia heterochroma (S. Watson) Small
JM2: Chylismia munzii	Chylismia munzii (P.H. Raven) W.L. Wagner & Hoch
JM2: Chylismia walkeri	Chylismia walkeri A. Nelson
JM2: Chylismia walkeri subsp. tortilis	Chylismia walkeri A. Nelson subsp. tortilis (Jeps.) W.L. Wagner & Hoch
JM2: Chylismiella pterosperma	Chylismiella pterosperma (S. Watson) W.L. Wagner & Hoch
JM1: Cicendia quadrangularis	Cicendia quadrangularis (Lam.) Griseb.
JM1: Cichorium endiva	excluded
JM1: Cichorium intybus	Cichorium intybus L.
JM1: Ciclospermum leptophyllum	Cyclospermum leptophyllum (Pers.) Britton & P. Wilson
JMS: Cicuta bolanderi	Cicuta maculata var. bolanderi (S. Watson) G.A. Mulligan
JM1: Cicuta douglasii	Cicuta douglasii (DC.) J.M. Coult. & Rose
JM1: Cicuta maculata	Cicuta maculata L.
JM1: Cicuta maculata var. angustifolia	Cicuta maculata var. angustifolia Hook.
JM1: Cicuta maculata var. bolanderi	Cicuta maculata var. bolanderi (S. Watson) G.A. Mulligan
JMS: Cicuta occidentalis	Cicuta maculata var. angustifolia Hook.
JMS: Cicuta valida	Cicuta maculata var. angustifolia Hook.
JM1: Cinna bolanderi	Cinna bolanderi Scribn.
JM1: Cinna latifolia	Cinna latifolia (G&ouml;pp.) Griseb.
JM2: Cinnamomum camphora	Cinnamomum camphora (L.) J. Presl
JM2: Circaea alpina	Circaea alpina L.
JM1: Circaea alpina subsp. pacifica	Circaea alpina L. subsp. pacifica (Asch. & Magnus) P.H. Raven
JMS: Cirsium acanthodontum	Cirsium remotifolium var. rivulare Jeps.
JMS: Cirsium amblylepis	Cirsium remotifolium var. odontolepis Petr.
JM1: Cirsium andersonii	Cirsium andersonii (A. Gray) Petr.
JM1: Cirsium andrewsii	Cirsium andrewsii (A. Gray) Jeps.
JM1: Cirsium arizonicum	Cirsium arizonicum (A. Gray) Petr.
JM2: Cirsium arizonicum var. arizonicum	Cirsium arizonicum (A. Gray) Petr. var. arizonicum
JM2: Cirsium arizonicum var. tenuisectum	Cirsium arizonicum var. tenuisectum D.J. Keil
JM1: Cirsium arvense	Cirsium arvense (L.) Scop.
JM1: Cirsium brevistylum	Cirsium brevistylum Cronquist
JMS: Cirsium callilepis	Cirsium remotifolium var. odontolepis Petr.
JMS: Cirsium callilepis var. pseudocarlinioides	Cirsium remotifolium var. odontolepis Petr.
JM2: Cirsium canescens	Cirsium canescens Nutt.
JM1: Cirsium canovirens	Cirsium cymosum var. canovirens (Rydb.) D.J. Keil; Cirsium inamoenum (Greene) D.J. Keil var. inamoenum
JM1: Cirsium ciliolatum	Cirsium ciliolatum (L.F. Hend.) J.T. Howell
JMS: Cirsium coulteri	Cirsium occidentale var. coulteri (Harv. & A. Gray) Jeps.
JM1: Cirsium crassicaule	Cirsium crassicaule (Greene) Jeps.
JM1: Cirsium cymosum	Cirsium cymosum (Greene) J.T. Howell
JM2: Cirsium cymosum var. canovirens	Cirsium cymosum var. canovirens (Rydb.) D.J. Keil
JM2: Cirsium cymosum var. cymosum	Cirsium cymosum (Greene) J.T. Howell var. cymosum
JM1: Cirsium douglasii	Cirsium douglasii DC.
JM1: Cirsium douglasii var. breweri	Cirsium douglasii var. breweri (A. Gray) D.J. Keil & C.E. Turner
JM1: Cirsium douglasii var. douglasii	Cirsium douglasii DC. var. douglasii
JM1: Cirsium fontinale	Cirsium fontinale (Greene) Jeps.
JM1: Cirsium fontinale var. campylon	Cirsium fontinale var. campylon (H. Sharsm.) D.J. Keil & C.E. Turner
JM1: Cirsium fontinale var. fontinale	Cirsium fontinale (Greene) Jeps. var. fontinale
JM1: Cirsium fontinale var. obispoense	Cirsium fontinale var. obispoense J.T. Howell
JM1: Cirsium hydrophilum	Cirsium hydrophilum (Greene) Jeps.
JM1: Cirsium hydrophilum var. hydrophilum	Cirsium hydrophilum (Greene) Jeps. var. hydrophilum
JM1: Cirsium hydrophilum var. vaseyi	Cirsium hydrophilum var. vaseyi (A. Gray) J.T. Howell
JM2: Cirsium inamoenum	Cirsium inamoenum (Greene) D.J. Keil
JM2: Cirsium inamoenum var. inamoenum	Cirsium inamoenum (Greene) D.J. Keil var. inamoenum
JM1: Cirsium loncholepis	Cirsium scariosum var. loncholepis (Petr.) D.J. Keil
JMS: Cirsium mendocinum	Cirsium andrewsii (A. Gray) Jeps.
JM1: Cirsium mohavense	Cirsium mohavense (Greene) Petr.
JM1: Cirsium neomexicanum	Cirsium neomexicanum A. Gray
JM1: Cirsium nidulum	Cirsium arizonicum var. tenuisectum D.J. Keil
JM1: Cirsium occidentale	Cirsium occidentale (Nutt.) Jeps.
JM1: Cirsium occidentale var. californicum	Cirsium occidentale var. californicum (A. Gray) D.J. Keil & C.E. Turner
JM1: Cirsium occidentale var. candidissimum	Cirsium occidentale var. candidissimum (Greene) J.F. Macbr.
JM1: Cirsium occidentale var. compactum	Cirsium occidentale var. compactum Hoover
JM2: Cirsium occidentale var. coulteri	Cirsium occidentale var. coulteri (Harv. & A. Gray) Jeps.
JM2: Cirsium occidentale var. lucianum	Cirsium occidentale var. lucianum D.J. Keil
JM1: Cirsium occidentale var. occidentale	Cirsium occidentale (Nutt.) Jeps. var. occidentale
JM1: Cirsium occidentale var. venustum	Cirsium occidentale var. venustum (Greene) Jeps.
JM1: Cirsium ochrocentrum	Cirsium ochrocentrum A. Gray
JM2: Cirsium ochrocentrum var. ochrocentrum	Cirsium ochrocentrum A. Gray var. ochrocentrum
JM2: Cirsium praeteriens	Cirsium praeteriens J.F. Macbr.
JM1: Cirsium quercetorum	Cirsium quercetorum (A. Gray) Jeps.
JM1: Cirsium remotifolium	Cirsium remotifolium (Hook.) DC.
JM2: Cirsium remotifolium var. odontolepis	Cirsium remotifolium var. odontolepis Petr.
JM2: Cirsium remotifolium var. remotifolium	Cirsium remotifolium (Hook.) DC. var. remotifolium
JM2: Cirsium remotifolium var. rivulare	Cirsium remotifolium var. rivulare Jeps.
JM1: Cirsium rhothophilum	Cirsium rhothophilum S.F. Blake
JM1: Cirsium scariosum	Cirsium scariosum Nutt.
JM2: Cirsium scariosum var. americanum	Cirsium scariosum var. americanum (A. Gray) D.J. Keil
JMS: Cirsium scariosum var. citrinum	Cirsium scariosum var. citrinum (Petr.) D.J. Keil; Cirsium scariosum var. loncholepis (Petr.) D.J. Keil
JM2: Cirsium scariosum var. congdonii	Cirsium scariosum var. congdonii (R.J. Moore & Frankton) D.J. Keil
JM2: Cirsium scariosum var. loncholepis	Cirsium scariosum var. loncholepis (Petr.) D.J. Keil
JM2: Cirsium scariosum var. robustum	Cirsium scariosum var. robustum D.J. Keil
JM2: Cirsium scariosum var. scariosum	Cirsium scariosum Nutt. var. scariosum
JMS: Cirsium subniveum	Cirsium inamoenum (Greene) D.J. Keil var. inamoenum
JMS: Cirsium tioganum	Cirsium scariosum var. congdonii (R.J. Moore & Frankton) D.J. Keil
JM1: Cirsium undulatum	Cirsium canescens Nutt.; Cirsium undulatum (Nutt.) Spreng.
JMS: Cirsium utahense	Cirsium inamoenum (Greene) D.J. Keil var. inamoenum; Cirsium neomexicanum A. Gray
JMS: Cirsium virginense	Cirsium mohavense (Greene) Petr.
JM1: Cirsium vulgare	Cirsium vulgare (Savi) Ten.
JM2: Cissus antarctica	Cissus antarctica Venten.
JM2: Cistanthe ambigua	Cistanthe ambigua (S. Watson) Hershk.
JM2: Cistanthe maritima	Cistanthe maritima (Nutt.) Hershk.
JMS: Cistanthe monandra	Calyptridium monandrum Nutt.
JMS: Cistanthe monosperma	Calyptridium monospermum Greene
JMS: Cistanthe parryi	Calyptridium parryi A. Gray
JMS: Cistanthe parryi var. arizonica	Calyptridium parryi var. arizonicum J.T. Howell
JMS: Cistanthe parryi var. hesseae	Calyptridium parryi var. hesseae J.H. Thomas
JMS: Cistanthe parryi var. nevadensis	Calyptridium parryi var. nevadense J.T. Howell
JMS: Cistanthe pulchella	Calyptridium pulchellum (Eastw.) Hoover
JMS: Cistanthe pygmaea	Calyptridium pygmaeum Rydb.
JMS: Cistanthe quadripetala	Calyptridium quadripetalum S. Watson
JMS: Cistanthe rosea	Calyptridium roseum S. Watson
JMS: Cistanthe umbellata	Calyptridium umbellatum (Torr.) Greene
JM1: Cistus creticus	Cistus incanus L.
JM2: Cistus incanus	Cistus incanus L.
JMS: Cistus incanus subsp. corsicus	Cistus incanus L.
JM1: Cistus ladanifer	Cistus ladanifer L.
JM1: Cistus monspeliensis	Cistus monspeliensis L.
JM2: Cistus psilosepalus	Cistus psilosepalus Sweet
JM1: Cistus salvifolius	Cistus salviifolius L.
JM2: Cistus salviifolius	Cistus salviifolius L.
JMS: Cistus villosus	Cistus incanus L.
JMS: Citrullus colocynthis	Citrullus lanatus (Thunb.) Matsum. & Nakai
JM1: Citrullus colocynthis var. lanatus	Citrullus lanatus (Thunb.) Matsum. & Nakai var. citroides (L.H. Bailey) Mansf.
JM2: Citrullus lanatus	Citrullus lanatus (Thunb.) Matsum. & Nakai
JM2: Citrullus lanatus var. citroides	Citrullus lanatus (Thunb.) Matsum. & Nakai var. citroides (L.H. Bailey) Mansf.
JMS: Citrullus vulgaris	Citrullus lanatus (Thunb.) Matsum. & Nakai var. citroides (L.H. Bailey) Mansf.
JM1: Cladium californicum	Cladium californicum (S. Watson) O'Neill
JM1: Clarkia affinis	Clarkia affinis H. Lewis & M. Lewis
JM1: Clarkia amoena	Clarkia amoena (Lehm.) A. Nelson & J.F. Macbr.
JM1: Clarkia amoena subsp. amoena	Clarkia amoena (Lehm.) A. Nelson & J.F. Macbr. subsp. amoena
JM1: Clarkia amoena subsp. huntiana	Clarkia amoena subsp. huntiana (Jeps.) H. Lewis & M. Lewis
JM1: Clarkia amoena subsp. whitneyi	Clarkia amoena subsp. whitneyi (A. Gray) H. Lewis & M. Lewis
JM1: Clarkia arcuata	Clarkia arcuata (Kellogg) A. Nelson & J.F. Macbr.
JM1: Clarkia australis	Clarkia australis E. Small
JM1: Clarkia biloba	Clarkia biloba (Durand) A. Nelson & J.F. Macbr.
JM1: Clarkia biloba subsp. australis	Clarkia biloba subsp. australis H. Lewis & M. Lewis
JM1: Clarkia biloba subsp. biloba	Clarkia biloba (Durand) A. Nelson & J.F. Macbr. subsp. biloba
JM1: Clarkia biloba subsp. brandegeae	Clarkia biloba subsp. brandegeeae (Jeps.) H. Lewis & M. Lewis
JM2: Clarkia biloba subsp. brandegeeae	Clarkia biloba subsp. brandegeeae (Jeps.) H. Lewis & M. Lewis
JM1: Clarkia borealis	Clarkia borealis E. Small
JM1: Clarkia borealis subsp. arida	Clarkia borealis subsp. arida E. Small
JM1: Clarkia borealis subsp. borealis	Clarkia borealis E. Small subsp. borealis
JM1: Clarkia bottae	Clarkia bottae (Spach) H. Lewis & M. Lewis; Clarkia lewisii P.H. Raven & D.R. Parn.
JM1: Clarkia breweri	Clarkia breweri (A. Gray) Greene
JMS: Clarkia calientensis	Clarkia tembloriensis subsp. calientensis (Vasek) K.E. Hols.
JM1: Clarkia concinna	Clarkia concinna (Fisch. & C.A. Mey.) Greene
JM1: Clarkia concinna subsp. automixa	Clarkia concinna subsp. automixa R.N. Bowman
JM1: Clarkia concinna subsp. concinna	Clarkia concinna (Fisch. & C.A. Mey.) Greene subsp. concinna
JM1: Clarkia concinna subsp. raichei	Clarkia concinna subsp. raichei G.A. Allen et al.
JM1: Clarkia cylindrica	Clarkia cylindrica (Jeps.) H. Lewis & M. Lewis
JM1: Clarkia cylindrica subsp. clavicarpa	Clarkia cylindrica subsp. clavicarpa W.S. Davis
JM1: Clarkia cylindrica subsp. cylindrica	Clarkia cylindrica (Jeps.) H. Lewis & M. Lewis subsp. cylindrica
JM1: Clarkia davyi	Clarkia davyi (Jeps.) H. Lewis & M. Lewis
JMS: Clarkia deflexa	Clarkia bottae (Spach) H. Lewis & M. Lewis
JM1: Clarkia delicata	Clarkia delicata (Abrams) A. Nelson & J.F. Macbr.
JM1: Clarkia dudleyana	Clarkia dudleyana (Abrams) J.F. Macbr.
JM1: Clarkia epilobioides	Clarkia epilobioides (Torr. & A. Gray) A. Nelson & J.F. Macbr.
JM1: Clarkia exilis	Clarkia exilis H. Lewis & Vasek
JM1: Clarkia franciscana	Clarkia franciscana H. Lewis & P.H. Raven
JM1: Clarkia gracilis	Clarkia gracilis (Piper) A. Nelson & J.F. Macbr.
JM1: Clarkia gracilis subsp. albicaulis	Clarkia gracilis subsp. albicaulis (Jeps.) H. Lewis & M. Lewis
JM1: Clarkia gracilis subsp. gracilis	Clarkia gracilis (Piper) A. Nelson & J.F. Macbr. subsp. gracilis
JM1: Clarkia gracilis subsp. sonomensis	Clarkia gracilis subsp. sonomensis (C.L. Hitchc.) H. Lewis & M. Lewis
JM1: Clarkia gracilis subsp. tracyi	Clarkia gracilis subsp. tracyi (Jeps.) Abdel-Hameed & R. Snow
JM1: Clarkia heterandra	Clarkia heterandra (Torr.) H. Lewis & P.H. Raven
JM1: Clarkia imbricata	Clarkia imbricata H. Lewis & M. Lewis
JM1: Clarkia jolonensis	Clarkia jolonensis D.R. Parn.
JM1: Clarkia lassenensis	Clarkia lassenensis (Eastw.) H. Lewis & M. Lewis
JM1: Clarkia lewisii	Clarkia lewisii P.H. Raven & D.R. Parn.
JM1: Clarkia lingulata	Clarkia lingulata H. Lewis & M. Lewis
JM1: Clarkia mildrediae	Clarkia mildrediae (A. Heller) H. Lewis & M. Lewis
JM2: Clarkia mildrediae subsp. lutescens	Clarkia mildrediae subsp. lutescens Gottlieb & Janeway
JM2: Clarkia mildrediae subsp. mildrediae	Clarkia mildrediae (A. Heller) H. Lewis & M. Lewis subsp. mildrediae
JM1: Clarkia modesta	Clarkia modesta Jeps.
JM1: Clarkia mosquinii	Clarkia mosquinii E. Small
JM1: Clarkia mosquinii subsp. mosquinii	Clarkia mosquinii E. Small
JMS: Clarkia mosquinii subsp. xerophila	Clarkia mosquinii E. Small
JM1: Clarkia mosquinii subsp. xerophylla	Clarkia mosquinii E. Small
JMS: Clarkia nitens	Clarkia speciosa subsp. nitens (H. Lewis & M. Lewis) H. Lewis & P.H. Raven
JM1: Clarkia prostrata	Clarkia prostrata H. Lewis & M. Lewis
JM1: Clarkia purpurea	Clarkia purpurea (Curtis) A. Nelson & J.F. Macbr.
JM1: Clarkia purpurea subsp. purpurea	Clarkia purpurea (Curtis) A. Nelson & J.F. Macbr. subsp. purpurea
JM1: Clarkia purpurea subsp. quadrivulnera	Clarkia purpurea subsp. quadrivulnera (Lindl.) H. Lewis & M. Lewis
JM1: Clarkia purpurea subsp. viminea	Clarkia purpurea subsp. viminea (Hook.) H. Lewis & M. Lewis
JM1: Clarkia rhomboidea	Clarkia rhomboidea Douglas
JM1: Clarkia rostrata	Clarkia rostrata W.S. Davis
JM1: Clarkia rubicunda	Clarkia rubicunda (Lindl.) H. Lewis & M. Lewis
JMS: Clarkia rubicunda subsp. blasdalei	Clarkia rubicunda (Lindl.) H. Lewis & M. Lewis
JM1: Clarkia similis	Clarkia similis H. Lewis & W.R. Ernst
JM1: Clarkia speciosa	Clarkia speciosa H. Lewis & M. Lewis
JM1: Clarkia speciosa subsp. immaculata	Clarkia speciosa subsp. immaculata H. Lewis & M. Lewis
JM1: Clarkia speciosa subsp. nitens	Clarkia speciosa subsp. nitens (H. Lewis & M. Lewis) H. Lewis & P.H. Raven
JM1: Clarkia speciosa subsp. polyantha	Clarkia speciosa subsp. polyantha H. Lewis & M. Lewis
JM1: Clarkia speciosa subsp. speciosa	Clarkia speciosa H. Lewis & M. Lewis subsp. speciosa
JM1: Clarkia springvillensis	Clarkia springvillensis Vasek
JM1: Clarkia stellata	Clarkia stellata Mosquin
JM1: Clarkia tembloriensis	Clarkia tembloriensis Vasek
JM1: Clarkia tembloriensis subsp. calientensis	Clarkia tembloriensis subsp. calientensis (Vasek) K.E. Hols.
JM1: Clarkia tembloriensis subsp. tembloriensis	Clarkia tembloriensis Vasek subsp. tembloriensis
JM1: Clarkia unguiculata	Clarkia unguiculata Lindl.
JM1: Clarkia virgata	Clarkia virgata Greene
JM1: Clarkia williamsonii	Clarkia williamsonii (Durand & Hilg.) H. Lewis & M. Lewis
JMS: Clarkia williamsonii f. incerta	Clarkia williamsonii (Durand & Hilg.) H. Lewis & M. Lewis
JM1: Clarkia xantiana	Clarkia xantiana A. Gray
JM1: Clarkia xantiana subsp. parviflora	Clarkia xantiana subsp. parviflora (Eastw.) H. Lewis & P.H. Raven
JM1: Clarkia xantiana subsp. xantiana	Clarkia xantiana A. Gray subsp. xantiana
JM1: Claytonia cordifolia	Claytonia cordifolia S. Watson
JM1: Claytonia exigua	Claytonia exigua Torr. & A. Gray
JM1: Claytonia exigua subsp. exigua	Claytonia exigua Torr. & A. Gray subsp. exigua
JM1: Claytonia exigua subsp. glauca	Claytonia exigua subsp. glauca (Torr. & A. Gray) John M. Mill. & K.L. Chambers
JM1: Claytonia gypsophiloides	Claytonia gypsophiloides Fisch. & C.A. Mey.
JM1: Claytonia lanceolata	Claytonia lanceolata Pursh
JMS: Claytonia lanceolata var. peirsonii	Claytonia lanceolata Pursh
JM1: Claytonia megarhiza	Claytonia megarhiza (A. Gray) S. Watson
JM1: Claytonia nevadensis	Claytonia nevadensis S. Watson
JM1: Claytonia palustris	Claytonia palustris Swanson & Kelley
JM1: Claytonia parviflora	Claytonia parviflora Hook.
JM1: Claytonia parviflora subsp. grandiflora	Claytonia parviflora subsp. grandiflora John M. Mill. & K.L. Chambers
JM1: Claytonia parviflora subsp. parviflora	Claytonia parviflora Hook. subsp. parviflora; Claytonia parviflora subsp. utahensis (Rydb.) John M. Mill. & K.L. Chambers
JM2: Claytonia parviflora subsp. utahensis	Claytonia parviflora subsp. utahensis (Rydb.) John M. Mill. & K.L. Chambers
JM1: Claytonia parviflora subsp. viridis	Claytonia parviflora subsp. viridis (Davidson) John M. Mill. & K.L. Chambers
JM1: Claytonia perfoliata	Claytonia perfoliata Willd.
JM2: Claytonia perfoliata subsp. intermontana	Claytonia perfoliata subsp. intermontana John M. Mill. & K.L. Chambers
JM1: Claytonia perfoliata subsp. mexicana	Claytonia perfoliata subsp. mexicana (Rydb.) John M. Mill. & K.L. Chambers
JM1: Claytonia perfoliata subsp. perfoliata	Claytonia perfoliata Willd. subsp. perfoliata; Claytonia perfoliata subsp. intermontana John M. Mill. & K.L. Chambers
JM1: Claytonia rubra	Claytonia rubra (Howell) Tidestr.
JM1: Claytonia rubra subsp. depressa	Claytonia rubra subsp. depressa (A. Gray) John M. Mill. & K.L. Chambers
JM1: Claytonia rubra subsp. rubra	Claytonia rubra (Howell) Tidestr. subsp. rubra
JM1: Claytonia saxosa	Claytonia saxosa Brandegee
JM1: Claytonia sibirica	Claytonia sibirica L.
JM1: Claytonia umbellata	Claytonia umbellata S. Watson
JM1: Claytonia washingtoniana	Claytonia washingtoniana (Suksd.) Suksd.
JM1: Clematis lasiantha	Clematis lasiantha Nutt.
JM1: Clematis ligusticifolia	Clematis ligusticifolia Nutt.
JM1: Clematis pauciflora	Clematis pauciflora Nutt.
JM1: Cleome lutea	Peritoma lutea (Hook.) Raf.
JM1: Cleome platycarpa	Peritoma platycarpa (Torr.) H.H. Iltis
JM1: Cleome serrulata	Peritoma serrulata (Pursh) DC.
JM1: Cleome sparsifolia	Carsonia sparsifolia (S. Watson) Greene
JM1: Cleomella brevipes	Cleomella brevipes S. Watson
JM2: Cleomella hillmanii	Cleomella hillmanii A. Nelson
JM2: Cleomella hillmanii var. hillmanii	Cleomella hillmanii A. Nelson var. hillmanii
JM1: Cleomella obtusifolia	Cleomella obtusifolia Torr. & Fr&eacute;m.
JM1: Cleomella parviflora	Cleomella parviflora A. Gray
JM1: Cleomella plocasperma	Cleomella plocasperma S. Watson
JMS: Cleomella plocasperma var. mojavensis	Cleomella plocasperma S. Watson
JMS: Cleomella plocasperma var. stricta	Cleomella plocasperma S. Watson
JM2: Clinopodium chandleri	Clinopodium chandleri (Brandegee) P.D. Cantino & Wagstaff
JM2: Clinopodium douglasii	Clinopodium douglasii (Benth.) Kuntze
JM2: Clinopodium mimuloides	Clinopodium mimuloides (Benth.) Kuntze
JM1: Clintonia andrewsiana	Clintonia andrewsiana Torr.
JM1: Clintonia uniflora	Clintonia uniflora (Schult. & Schult. f.) Kunth
JM1: Cneoridium dumosum	Cneoridium dumosum (Torr. & A. Gray) Baill.
JM1: Cnicus benedictus	Centaurea benedicta (L.) L.
JM2: Cochlearia groenlandica	Cochlearia groenlandica L.
JMS: Cochlearia officinalis	Cochlearia groenlandica L.
JMS: Cochlearia officinalis subsp. arctica	Cochlearia groenlandica L.
JM1: Cochlearia officinalis var. arctica	Cochlearia groenlandica L.
JM2: Coincya monensis	Coincya monensis (L.) Greuter & Burdet
JM2: Coincya monensis subsp. recurvata	Coincya monensis (L.) Greuter & Burdet subsp. recurvata (All.) Leadlay
JMS: Coldenia canescens	Tiquilia canescens (DC.) A.T. Richardson
JMS: Coleogeton filiformis	Stuckenia filiformis (Pers.) B&ouml;rner
JMS: Coleogeton filiformis subsp. alpinus	Stuckenia filiformis (Pers.) B&ouml;rner subsp. alpina (Blytt) R.R. Haynes et al.
JMS: Coleogeton pectinatus	Stuckenia pectinata (L.) B&ouml;rner
JMS: Coleogeton striatus	Stuckenia striata (Ruiz & Pav.) Holub
JM1: Coleogyne ramosissima	Coleogyne ramosissima Torr.
JMS: Coleosanthus argutus	Brickellia atractyloides var. arguta (B.L. Rob.) Jeps.
JMS: Coleosanthus californicus	Brickellia californica (Torr. & A. Gray) A. Gray
JMS: Coleosanthus desertorum	Brickellia desertorum Coville
JMS: Coleosanthus frutescens	Brickellia frutescens A. Gray
JMS: Coleosanthus grandiflorus	Brickellia grandiflora (Hook.) Nutt.
JMS: Coleosanthus greenei	Brickellia greenei A. Gray
JMS: Coleosanthus incanus	Brickellia incana A. Gray
JMS: Coleosanthus knappianus	Brickellia knappiana Drew
JMS: Coleosanthus linifolius	Brickellia oblongifolia Nutt. var. linifolia (D.C. Eaton) B.L. Rob.
JMS: Coleosanthus longifolius	Brickellia longifolia S. Watson
JMS: Coleosanthus microphyllus	Brickellia microphylla (Nutt.) A. Gray var. microphylla
JMS: Coleosanthus nevinii	Brickellia nevinii A. Gray
JMS: Coleosanthus oblongifolius	Brickellia oblongifolia Nutt.
JMS: Coleosanthus oblongifolius var. linifolius	Brickellia oblongifolia Nutt. var. linifolia (D.C. Eaton) B.L. Rob.
JMS: Coleosanthus scaber	Brickellia microphylla var. scabra A. Gray
JMS: Coleosanthus tener	Brickellia californica (Torr. & A. Gray) A. Gray
JM2: Collinsia antonina	Collinsia antonina Hardham
JM1: Collinsia bartsiifolia	Collinsia bartsiifolia Benth.
JM1: Collinsia bartsiifolia var. bartsiifolia	Collinsia bartsiifolia Benth. var. bartsiifolia
JM1: Collinsia bartsiifolia var. davidsonii	Collinsia bartsiifolia var. davidsonii (Parish) Newsom; Collinsia bartsiifolia var. stricta (Greene) Newsom
JM2: Collinsia bartsiifolia var. stricta	Collinsia bartsiifolia var. stricta (Greene) Newsom
JM1: Collinsia callosa	Collinsia callosa Parish
JM1: Collinsia childii	Collinsia childii A. Gray
JM1: Collinsia concolor	Collinsia concolor Greene
JM1: Collinsia corymbosa	Collinsia corymbosa Herder
JM1: Collinsia grandiflora	Collinsia grandiflora Lindl.
JM1: Collinsia greenei	Collinsia greenei A. Gray
JM1: Collinsia heterophylla	Collinsia heterophylla Graham
JM2: Collinsia heterophylla var. austromontana	Collinsia heterophylla var. austromontana (Newsom) Munz
JM2: Collinsia heterophylla var. heterophylla	Collinsia heterophylla Graham var. heterophylla
JM1: Collinsia linearis	Collinsia linearis A. Gray
JM1: Collinsia multicolor	Collinsia multicolor Lindl. & Paxton
JM1: Collinsia parryi	Collinsia antonina Hardham; Collinsia parryi A. Gray
JM1: Collinsia parviflora	Collinsia parviflora Lindl.
JM1: Collinsia rattanii	Collinsia rattanii A. Gray
JM1: Collinsia sparsiflora	Collinsia sparsiflora Fisch. & C.A. Mey.
JM1: Collinsia sparsiflora var. arvensis	misappl. to Collinsia sparsiflora var. sparsiflora
JM1: Collinsia sparsiflora var. collina	Collinsia sparsiflora var. collina (Jeps.) Newsom
JM1: Collinsia sparsiflora var. sparsiflora	Collinsia sparsiflora Fisch. & C.A. Mey. var. sparsiflora
JM1: Collinsia tinctoria	Collinsia tinctoria Benth.
JM1: Collinsia torreyi	Collinsia torreyi A. Gray
JM1: Collinsia torreyi var. brevicarinata	Collinsia torreyi var. brevicarinata Newsom
JM1: Collinsia torreyi var. latifolia	Collinsia torreyi var. latifolia Newsom
JM1: Collinsia torreyi var. torreyi	Collinsia torreyi A. Gray var. torreyi
JM1: Collinsia torreyi var. wrightii	Collinsia torreyi var. wrightii (S. Watson) I.M. Johnst.
JM1: Collomia diversifolia	Collomia diversifolia Greene
JM1: Collomia grandiflora	Collomia grandiflora Lindl.
JM1: Collomia heterophylla	Collomia heterophylla Hook.
JM1: Collomia larsenii	Collomia larsenii (A. Gray) Payson
JM1: Collomia linearis	Collomia linearis Nutt.
JM1: Collomia rawsoniana	Collomia rawsoniana Greene
JM2: Collomia tenella	Collomia tenella A. Gray
JM1: Collomia tinctoria	Collomia tinctoria Kellogg
JM1: Collomia tracyi	Collomia tracyi H. Mason
JM1: Colubrina californica	Colubrina californica I.M. Johnst.
JM1: Colutea arborescens	Colutea arborescens L.
JM2: Comandra umbellata	Comandra umbellata (L.) Nutt.
JM1: Comandra umbellata subsp. californica	Comandra umbellata (L.) Nutt. subsp. californica (Rydb.) Piehl
JM1: Comarostaphylis diversifolia	Comarostaphylis diversifolia (Parry) Greene
JM1: Comarostaphylis diversifolia subsp. diversifolia	Comarostaphylis diversifolia (Parry) Greene subsp. diversifolia
JM1: Comarostaphylis diversifolia subsp. planifolia	Comarostaphylis diversifolia subsp. planifolia (Jeps.) G.D. Wallace
JM2: Comarum palustre	Comarum palustre L.
JM2: Comastoma tenellum	Comastoma tenellum (Rottb.) Toyok.
JMS: Comastoma tenellum var. tenellum	Comastoma tenellum (Rottb.) Toyok.
JM1: Commelina benghalensis	Commelina benghalensis L.
JM1: Condalia globosa var. pubescens	Condalia globosa I.M. Johnst. var. pubescens I.M. Johnst.
JMS: Condalia lycioides var. canescens	Ziziphus obtusifolia (Torr. & A. Gray) A. Gray var. canescens (A. Gray) M.C. Johnst.
JMS: Condalia parryi	Ziziphus parryi Torr. var. parryi
JM1: Conicosia pugioniformis	Conicosia pugioniformis (L.) N.E. Br.
JMS: Conioselinum chinense	Conioselinum pacificum (S. Watson) J.M. Coult. & Rose
JM1: Conioselinum pacificum	Conioselinum pacificum (S. Watson) J.M. Coult. & Rose
JM1: Conium maculatum	Conium maculatum L.
JM1: Conringia orientalis	Conringia orientalis (L.) Dumort.
JM2: Consolida ajacis	Consolida ajacis (L.) Schur
JM1: Consolida ambigua	Consolida ajacis (L.) Schur
JM2: Constancea nevinii	Constancea nevinii (A. Gray) B.G. Baldwin
JM1: Convolvulus althaeoides	Convolvulus althaeoides L.
JM1: Convolvulus arvensis	Convolvulus arvensis L.
JMS: Convolvulus collinus	Calystegia collina (Greene) Brummitt
JMS: Convolvulus malacophyllus	Calystegia collina (Greene) Brummitt
JMS: Convolvulus malacophyllus subsp. collinus	Calystegia collina (Greene) Brummitt
JM1: Convolvulus simulans	Convolvulus simulans L.M. Perry
JM2: Convolvulus tricolor	Convolvulus tricolor L.
JM1: Conyza bilbaoana	Erigeron sumatrensis Retz.
JM1: Conyza bonariensis	Erigeron bonariensis L.
JM1: Conyza canadensis	Erigeron canadensis L.
JM1: Conyza coulteri	Laennecia coulteri (A. Gray) G.L. Nesom
JM1: Conyza floribunda	Erigeron sumatrensis Retz.
JMS: Conyza squamata	Symphyotrichum subulatum var. squamatum (Spreng.) S.D. Sundb.
JMS: Conyza sumatrensis	Erigeron sumatrensis Retz.
JM2: Coprosma repens	Coprosma repens A. Rich.
JM1: Coptis laciniata	Coptis laciniata A. Gray
JM1: Corallorhiza maculata	Corallorhiza maculata (Raf.) Raf.
JM2: Corallorhiza maculata var. maculata	Corallorhiza maculata (Raf.) Raf. var. maculata
JM2: Corallorhiza maculata var. occidentalis	Corallorhiza maculata var. occidentalis (Lindl.) Ames
JM1: Corallorhiza mertensiana	Corallorhiza mertensiana Bong.
JM1: Corallorhiza striata	Corallorhiza striata Lindl.
JMS: Corallorhiza striata var. vreelandii	Corallorhiza striata Lindl.
JM1: Corallorhiza trifida	Corallorhiza trifida Ch&acirc;tel.
JMS: Cordylanthus bernardinus	Cordylanthus eremicus (Coville & C.V. Morton) Munz subsp. eremicus
JM1: Cordylanthus capitatus	Cordylanthus capitatus Benth.
JM1: Cordylanthus eremicus	Cordylanthus eremicus (Coville & C.V. Morton) Munz
JM1: Cordylanthus eremicus subsp. eremicus	Cordylanthus eremicus (Coville & C.V. Morton) Munz subsp. eremicus
JM1: Cordylanthus eremicus subsp. kernensis	Cordylanthus eremicus subsp. kernensis T.I. Chuang & Heckard
JMS: Cordylanthus ferrisianus	Cordylanthus rigidus (Benth.) Jeps. subsp. rigidus
JMS: Cordylanthus filifolius	Cordylanthus rigidus (Benth.) Jeps. subsp. setigerus T.I. Chuang & Heckard
JMS: Cordylanthus hansenii	Cordylanthus pilosus A. Gray subsp. hansenii (Ferris) T.I. Chuang & Heckard
JMS: Cordylanthus helleri	Cordylanthus kingii S. Watson subsp. helleri (Ferris) T.I. Chuang & Heckard
JM2: Cordylanthus kingii	Cordylanthus kingii S. Watson
JM1: Cordylanthus kingii subsp. helleri	Cordylanthus kingii S. Watson subsp. helleri (Ferris) T.I. Chuang & Heckard
JMS: Cordylanthus littoralis	Cordylanthus rigidus (Benth.) Jeps.; Cordylanthus rigidus (Benth.) Jeps. subsp. littoralis (Ferris) T.I. Chuang & Heckard
JMS: Cordylanthus littoralis subsp. platycephalus	Cordylanthus rigidus (Benth.) Jeps. subsp. rigidus
JM1: Cordylanthus maritimus	Chloropyron maritimum (Benth.) A. Heller
JM1: Cordylanthus maritimus subsp. canescens	Chloropyron maritimum (Benth.) A. Heller subsp. canescens (A. Gray) Tank & J.M. Egger
JM1: Cordylanthus maritimus subsp. maritimus	Chloropyron maritimum (Benth.) A. Heller subsp. maritimum
JM1: Cordylanthus maritimus subsp. palustris	Chloropyron maritimum (Benth.) A. Heller subsp. palustre (Behr) Tank & J.M. Egger
JM1: Cordylanthus mollis	Chloropyron molle (A. Gray) A. Heller
JM1: Cordylanthus mollis subsp. hispidus	Chloropyron molle (A. Gray) A. Heller subsp. hispidum (Pennell) Tank & J.M. Egger
JM1: Cordylanthus mollis subsp. mollis	Chloropyron molle (A. Gray) A. Heller subsp. molle
JM1: Cordylanthus nevinii	Cordylanthus nevinii A. Gray
JM1: Cordylanthus nidularius	Cordylanthus nidularius J.T. Howell
JM1: Cordylanthus orcuttianus	Dicranostegia orcuttiana (A. Gray) Pennell
JMS: Cordylanthus pallescens	Cordylanthus tenuis A. Gray subsp. pallescens (Pennell) T.I. Chuang & Heckard
JM1: Cordylanthus palmatus	Chloropyron palmatum (Ferris) Tank & J.M. Egger
JM1: Cordylanthus parviflorus	Cordylanthus parviflorus (Ferris) Wiggins
JM1: Cordylanthus pilosus	Cordylanthus pilosus A. Gray; Cordylanthus tenuis A. Gray
JMS: Cordylanthus pilosus subsp. bolanderi	Cordylanthus tenuis A. Gray subsp. tenuis
JMS: Cordylanthus pilosus subsp. diffusus	Cordylanthus pilosus A. Gray subsp. pilosus
JM1: Cordylanthus pilosus subsp. hansenii	Cordylanthus pilosus A. Gray subsp. hansenii (Ferris) T.I. Chuang & Heckard
JM1: Cordylanthus pilosus subsp. pilosus	Cordylanthus pilosus A. Gray subsp. pilosus
JM1: Cordylanthus pilosus subsp. trifidus	Cordylanthus pilosus subsp. trifidus (B.L. Rob. & Greenm.) T.I. Chuang & Heckard
JM1: Cordylanthus pringlei	Cordylanthus pringlei A. Gray
JM1: Cordylanthus ramosus	Cordylanthus eremicus (Coville & C.V. Morton) Munz; Cordylanthus ramosus Benth.
JMS: Cordylanthus ramosus subsp. eremicus	Cordylanthus eremicus (Coville & C.V. Morton) Munz subsp. eremicus
JMS: Cordylanthus ramosus subsp. setosus	Cordylanthus ramosus Benth.
JM1: Cordylanthus rigidus	Cordylanthus rigidus (Benth.) Jeps.
JM1: Cordylanthus rigidus subsp. brevibracteatus	Cordylanthus rigidus (Benth.) Jeps. subsp. brevibracteatus (A. Gray) Munz
JM1: Cordylanthus rigidus subsp. littoralis	Cordylanthus rigidus (Benth.) Jeps. subsp. littoralis (Ferris) T.I. Chuang & Heckard
JM1: Cordylanthus rigidus subsp. rigidus	Cordylanthus rigidus (Benth.) Jeps. subsp. rigidus
JM1: Cordylanthus rigidus subsp. setigerus	Cordylanthus rigidus (Benth.) Jeps. subsp. setigerus T.I. Chuang & Heckard
JM1: Cordylanthus tecopensis	Chloropyron tecopense (Munz & J.C. Roos) Tank & J.M. Egger
JM1: Cordylanthus tenuis	Cordylanthus tenuis A. Gray
JM1: Cordylanthus tenuis subsp. barbatus	Cordylanthus tenuis A. Gray subsp. barbatus T.I. Chuang & Heckard
JM1: Cordylanthus tenuis subsp. brunneus	Cordylanthus tenuis A. Gray subsp. brunneus (Jeps.) Munz
JM1: Cordylanthus tenuis subsp. capillaris	Cordylanthus tenuis A. Gray subsp. capillaris (Pennell) T.I. Chuang & Heckard
JM1: Cordylanthus tenuis subsp. pallescens	Cordylanthus tenuis A. Gray subsp. pallescens (Pennell) T.I. Chuang & Heckard
JM1: Cordylanthus tenuis subsp. tenuis	Cordylanthus tenuis A. Gray subsp. tenuis
JM1: Cordylanthus tenuis subsp. viscidus	Cordylanthus tenuis A. Gray subsp. viscidus (Howell) T.I. Chuang & Heckard
JMS: Cordylanthus viscidus	Cordylanthus tenuis A. Gray subsp. viscidus (Howell) T.I. Chuang & Heckard
JM2: Cordyline australis	Cordyline australis (G. Forst.) Endl.
JM1: Coreopsis bigelovii	Leptosyne bigelovii (A. Gray) A. Gray
JMS: Coreopsis californica	Leptosyne californica Nutt.
JM1: Coreopsis californica var. californica	Leptosyne californica Nutt.
JM1: Coreopsis calliopsidea	Leptosyne calliopsidea (DC.) A. Gray
JM1: Coreopsis douglasii	Leptosyne douglasii DC.
JM1: Coreopsis gigantea	Leptosyne gigantea Kellogg
JM1: Coreopsis hamiltonii	Leptosyne hamiltonii Elmer
JM1: Coreopsis lanceolata	Coreopsis lanceolata L.
JM1: Coreopsis maritima	Leptosyne maritima (Nutt.) A. Gray
JM1: Coreopsis stillmanii	Leptosyne stillmanii A. Gray
JM1: Coreopsis tinctoria	Coreopsis tinctoria Nutt.
JM1: Coreopsis wrightii	excluded
JM2: Corethrogyne filaginifolia	Corethrogyne filaginifolia (Hook. & Arn.) Nutt.
JM1: Coriandrum sativum	Coriandrum sativum L.
JM2: Corispermum americanum	Corispermum americanum (Nutt.) Nutt.
JM2: Corispermum americanum var. americanum	Corispermum americanum (Nutt.) Nutt. var. americanum
JM1: Corispermum hyssopifolium	Corispermum americanum (Nutt.) Nutt. var. americanum
JMS: Corispermum hyssopifolium var. americanum	Corispermum americanum (Nutt.) Nutt. var. americanum
JM1: Cornus canadensis	Cornus canadensis L.
JM1: Cornus glabrata	Cornus glabrata Benth.
JM1: Cornus nuttallii	Cornus nuttallii Audubon
JMS: Cornus occidentalis	Cornus sericea subsp. occidentalis (Torr. & A. Gray) Fosberg
JM1: Cornus sericea	Cornus sericea L.
JM1: Cornus sericea subsp. occidentalis	Cornus sericea subsp. occidentalis (Torr. & A. Gray) Fosberg
JM1: Cornus sericea subsp. sericea	Cornus sericea L. subsp. sericea
JM1: Cornus sessilis	Cornus sessilis Torr.
JM2: Coronilla valentina	Coronilla valentina L.
JM2: Coronilla valentina subsp. glauca	Coronilla valentina L. subsp. glauca (L.) Batt.
JM2: Coronilla varia	Coronilla varia L.
JM1: Coronopus didymus	Lepidium didymum L.
JM1: Coronopus squamatus	Lepidium coronopus (L.) Al-Shehbaz
JM1: Cortaderia jubata	Cortaderia jubata (Lemoine) Stapf
JM1: Cortaderia selloana	Cortaderia selloana (Schult. & Schult. f.) Asch. & Graebn.
JM1: Corydalis aurea	Corydalis aurea Willd.
JM2: Corydalis caseana	Corydalis caseana A. Gray
JM1: Corydalis caseana subsp. caseana	Corydalis caseana A. Gray subsp. caseana
JM2: Corylus cornuta	Corylus cornuta Marshall
JM2: Corylus cornuta subsp. californica	Corylus cornuta Marshall subsp. californica (A. DC.) E. Murray
JM1: Corylus cornuta var. californica	Corylus cornuta Marshall subsp. californica (A. DC.) E. Murray
JM2: Coryphantha alversonii	Coryphantha alversonii (J.M. Coult.) Orcutt
JM2: Coryphantha chlorantha	Coryphantha chlorantha (Engelm.) Britton & Rose
JMS: Coryphantha deserti	Coryphantha chlorantha (Engelm.) Britton & Rose
JMS: Coryphantha vivipara	Coryphantha alversonii (J.M. Coult.) Orcutt; Coryphantha chlorantha (Engelm.) Britton & Rose; Coryphantha vivipara (Nutt.) Britton & Rose
JMS: Coryphantha vivipara var. alversonii	Coryphantha alversonii (J.M. Coult.) Orcutt
JMS: Coryphantha vivipara var. deserti	Coryphantha chlorantha (Engelm.) Britton & Rose
JM2: Coryphantha vivipara var. rosea	Coryphantha vivipara (Nutt.) Britton & Rose var. rosea (Clokey) L.D. Benson
JM1: Cosmos bipinnatus	Cosmos bipinnatus Cav.
JM1: Cosmos sulphureus	Cosmos sulphureus Cav.
JM2: Cota tinctoria	Cota tinctoria (L.) Guss.
JM1: Cotoneaster franchetii	Cotoneaster franchetii Bois
JM2: Cotoneaster frigidus	Cotoneaster frigidus Lindl.
JM2: Cotoneaster hodjingensis	Cotoneaster hodjingensis G. Klotz
JM2: Cotoneaster horizontalis	Cotoneaster horizontalis Decne.
JM2: Cotoneaster integrifolius	Cotoneaster integrifolius (Roxb.) G. Klotz
JM2: Cotoneaster lacteus	Cotoneaster lacteus W.W. Sm.
JMS: Cotoneaster microphyllus	Cotoneaster integrifolius (Roxb.) G. Klotz
JM1: Cotoneaster pannosa	Cotoneaster pannosus Franch.
JM2: Cotoneaster pannosus	Cotoneaster pannosus Franch.
JM2: Cotoneaster simonsii	Cotoneaster simonsii Baker
JM1: Cotula australis	Cotula australis (Spreng.) Hook. f.
JM1: Cotula coronopifolia	Cotula coronopifolia L.
JM2: Cotyledon orbiculata	Cotyledon orbiculata L.
JM1: Cotyledon orbiculata var. oblonga	Cotyledon orbiculata L. var. oblonga (Haw.) DC.
JM1: Crassula aquatica	Crassula aquatica (L.) Sch&ouml;nl.
JMS: Crassula argentea	Crassula ovata (Mill.) Druce
JM2: Crassula colligata	Crassula colligata Toelken
JM2: Crassula colligata subsp. lamprosperma	Crassula colligata Toelken subsp. lamprosperma Toelken
JM1: Crassula connata	Crassula connata (Ruiz & Pav.) A. Berger
JMS: Crassula connata var. connata	Crassula connata (Ruiz & Pav.) A. Berger
JMS: Crassula connata var. erectoides	Crassula connata (Ruiz & Pav.) A. Berger
JMS: Crassula connata var. eremica	Crassula connata (Ruiz & Pav.) A. Berger
JMS: Crassula connata var. subsimplex	Crassula connata (Ruiz & Pav.) A. Berger
JM2: Crassula multicava	Crassula multicava Lem.
JM2: Crassula multicava subsp. multicava	Crassula multicava Lem. subsp. multicava
JM2: Crassula ovata	Crassula ovata (Mill.) Druce
JMS: Crassula saginoides	Crassula aquatica (L.) Sch&ouml;nl.
JM1: Crassula solieri	Crassula solieri (Gay) F. Meigen
JM2: Crassula tetragona	Crassula tetragona L.
JM1: Crassula tillaea	Crassula tillaea Lest.-Garl.
JM2: Crataegus castlegarensis	Crataegus castlegarensis J.B. Phipps & O'Kennon
JMS: Crataegus columbiana	Crataegus douglasii Lindl.
JM1: Crataegus douglasii	Crataegus douglasii Lindl.
JM2: Crataegus gaylussacia	Crataegus gaylussacia A. Heller
JM2: Crataegus monogyna	Crataegus monogyna Jacq.
JM1: Crataegus suksdorfii	Crataegus gaylussacia A. Heller
JM1: Crepis acuminata	Crepis acuminata Nutt.
JM1: Crepis bakeri	Crepis bakeri Greene
JM2: Crepis bakeri subsp. bakeri	Crepis bakeri Greene subsp. bakeri
JM2: Crepis bakeri subsp. cusickii	Crepis bakeri subsp. cusickii (Eastw.) Babc. & Stebbins
JM2: Crepis bakeri subsp. idahoensis	Crepis bakeri subsp. idahoensis Babc. & Stebbins
JM1: Crepis bursifolia	Crepis bursifolia L.
JM1: Crepis capillaris	Crepis capillaris (L.) Wallr.
JM1: Crepis intermedia	Crepis intermedia A. Gray
JM1: Crepis modocensis	Crepis modocensis Greene
JM2: Crepis modocensis subsp. modocensis	Crepis modocensis Greene subsp. modocensis
JM2: Crepis modocensis subsp. subacaulis	Crepis modocensis subsp. subacaulis (Kellogg) Babc. & Stebbins
JM1: Crepis monticola	Crepis monticola Coville
JM1: Crepis nana	Crepis nana Richardson
JMS: Crepis nana var. ramosa	Crepis nana Richardson
JM1: Crepis occidentalis	Crepis occidentalis Nutt.
JM2: Crepis occidentalis subsp. conjuncta	Crepis occidentalis subsp. conjuncta Babc. & Stebbins
JM2: Crepis occidentalis subsp. costata	Crepis occidentalis subsp. costata (A. Gray) Babc. & Stebbins
JM2: Crepis occidentalis subsp. occidentalis	Crepis occidentalis Nutt. subsp. occidentalis
JM2: Crepis occidentalis subsp. pumila	Crepis occidentalis subsp. pumila (Rydb.) Babc. & Stebbins
JM1: Crepis pleurocarpa	Crepis pleurocarpa A. Gray
JM1: Crepis runcinata	Crepis runcinata (E. James) Torr. & A. Gray
JM1: Crepis runcinata subsp. andersonii	Crepis runcinata subsp. andersonii (A. Gray) Babc. & Stebbins
JM1: Crepis runcinata subsp. hallii	Crepis runcinata subsp. hallii Babc. & Stebbins
JMS: Crepis runcinata var. andersonii	Crepis runcinata subsp. andersonii (A. Gray) Babc. & Stebbins
JM1: Crepis setosa	Crepis setosa Haller f.
JM2: Crepis tectorum	Crepis tectorum L.
JM2: Crepis vesicaria	Crepis vesicaria L.
JM1: Crepis vesicaria subsp. taraxacifolia	Crepis vesicaria L. subsp. taraxacifolia (Thuill.) Thell.
JM1: Cressa truxillensis	Cressa truxillensis Kunth
JMS: Creusa tetragona	Crassula tetragona L.
JM1: Crocidium multicaule	Crocidium multicaule Hook.
JM2: Crocosmia &times;crocosmiiflora	Crocosmia &times;crocosmiiflora (Lemoine) N.E. Br.
JM1: Crossosoma bigelovii	Crossosoma bigelovii S. Watson
JM1: Crossosoma californicum	Crossosoma californicum Nutt.
JM1: Croton californicus	Croton californicus M&uuml;ll. Arg.
JMS: Croton californicus var. mohavensis	Croton californicus M&uuml;ll. Arg.
JMS: Croton californicus var. tenuis	Croton californicus M&uuml;ll. Arg.
JM2: Croton setiger	Croton setiger Hook.
JM1: Croton wigginsii	Croton wigginsii L.C. Wheeler
JM1: Crucianella angustifolia	Crucianella angustifolia L.
JM1: Crupina vulgaris	Crupina vulgaris Cass.
JM1: Crypsis alopecuroides	Crypsis alopecuroides (Piller & Mitterp.) Schrad.
JMS: Crypsis niliacea	Crypsis vaginiflora (Forssk.) Opiz
JM1: Crypsis schoenoides	Crypsis schoenoides (L.) Lam.
JM1: Crypsis vaginiflora	Crypsis vaginiflora (Forssk.) Opiz
JM1: Cryptantha affinis	Cryptantha affinis (A. Gray) Greene
JM1: Cryptantha ambigua	Cryptantha ambigua (A. Gray) Greene
JM1: Cryptantha angustifolia	Cryptantha angustifolia (Torr.) Greene
JM1: Cryptantha barbigera	Cryptantha barbigera (A. Gray) Greene
JM2: Cryptantha barbigera var. barbigera	Cryptantha barbigera (A. Gray) Greene var. barbigera
JM2: Cryptantha barbigera var. fergusoniae	Cryptantha barbigera var. fergusoniae J.F. Macbr.
JM2: Cryptantha celosioides	Cryptantha celosioides (Eastw.) Payson
JM2: Cryptantha cinerea	Cryptantha cinerea (Greene) Cronquist
JM1: Cryptantha cinerea var. abortiva	Cryptantha cinerea (Greene) Cronquist var. abortiva (Greene) Cronquist
JM1: Cryptantha circumscissa	Cryptantha circumscissa (Hook. & Arn.) I.M. Johnst.
JM2: Cryptantha circumscissa var. circumscissa	Cryptantha circumscissa (Hook. & Arn.) I.M. Johnst. var. circumscissa
JMS: Cryptantha circumscissa var. hispida	Cryptantha circumscissa (Hook. & Arn.) I.M. Johnst. var. circumscissa
JM2: Cryptantha circumscissa var. rosulata	Cryptantha circumscissa var. rosulata J.T. Howell
JM1: Cryptantha clevelandii	Cryptantha clevelandii Greene; Cryptantha dissita I.M. Johnst.
JM2: Cryptantha clevelandii var. clevelandii	Cryptantha clevelandii Greene var. clevelandii
JMS: Cryptantha clevelandii var. dissita	Cryptantha dissita I.M. Johnst.
JM2: Cryptantha clevelandii var. florosa	Cryptantha clevelandii var. florosa I.M. Johnst.
JM1: Cryptantha clokeyi	Cryptantha clokeyi I.M. Johnst.
JM1: Cryptantha confertiflora	Cryptantha confertiflora (Greene) Payson
JM2: Cryptantha corollata	Cryptantha corollata (I.M. Johnst.) I.M. Johnst.
JM1: Cryptantha costata	Cryptantha costata Brandegee
JM1: Cryptantha crinita	Cryptantha crinita Greene
JM1: Cryptantha crymophila	Cryptantha crymophila I.M. Johnst.
JM1: Cryptantha decipiens	Cryptantha decipiens (M.E. Jones) A. Heller; Cryptantha rattanii Greene
JM2: Cryptantha dissita	Cryptantha dissita I.M. Johnst.
JM1: Cryptantha dumetorum	Cryptantha dumetorum (A. Gray) Greene
JM1: Cryptantha echinella	Cryptantha echinella Greene
JM1: Cryptantha excavata	Cryptantha excavata Brandegee
JM2: Cryptantha fendleri	Cryptantha fendleri (A. Gray) Greene
JM1: Cryptantha flaccida	Cryptantha flaccida (Lehm.) Greene
JM1: Cryptantha flavoculata	Cryptantha flavoculata (A. Nelson) Payson
JM1: Cryptantha ganderi	Cryptantha ganderi I.M. Johnst.
JM1: Cryptantha glomeriflora	Cryptantha glomeriflora Greene
JM1: Cryptantha gracilis	Cryptantha gracilis Osterh.
JM1: Cryptantha hispidula	Cryptantha hispidula Brand
JM2: Cryptantha hoffmannii	Cryptantha hoffmannii I.M. Johnst.
JM1: Cryptantha holoptera	Cryptantha holoptera (A. Gray) J.F. Macbr.
JM1: Cryptantha hooveri	Cryptantha hooveri I.M. Johnst.
JM1: Cryptantha humilis	Cryptantha humilis (A. Gray) Payson
JM2: Cryptantha inaequata	Cryptantha inaequata I.M. Johnst.
JM1: Cryptantha incana	Cryptantha incana Greene
JM1: Cryptantha intermedia	Cryptantha intermedia (A. Gray) Greene
JM2: Cryptantha intermedia var. hendersonii	Cryptantha intermedia var. hendersonii (A. Nelson) Jeps. & Hoover
JM2: Cryptantha intermedia var. intermedia	Cryptantha intermedia (A. Gray) Greene var. intermedia
JM1: Cryptantha leiocarpa	Cryptantha leiocarpa (Fisch. & C.A. Mey.) Greene
JM1: Cryptantha mariposae	Cryptantha mariposae I.M. Johnst.
JM1: Cryptantha maritima	Cryptantha maritima (Greene) Greene
JM1: Cryptantha micrantha	Cryptantha micrantha (Torr.) I.M. Johnst.
JM2: Cryptantha micrantha var. lepida	Cryptantha micrantha var. lepida (A. Gray) I.M. Johnst.
JM2: Cryptantha micrantha var. micrantha	Cryptantha micrantha (Torr.) I.M. Johnst. var. micrantha
JM1: Cryptantha micromeres	Cryptantha micromeres (A. Gray) Greene
JM1: Cryptantha microstachys	Cryptantha microstachys (A. Gray) Greene
JM1: Cryptantha milobakeri	Cryptantha milobakeri I.M. Johnst.
JM1: Cryptantha mohavensis	Cryptantha mohavensis (Greene) Greene
JM1: Cryptantha muricata	Cryptantha muricata (Hook. & Arn.) A. Nelson & J.F. Macbr.
JM2: Cryptantha muricata var. denticulata	Cryptantha muricata var. denticulata (Greene) I.M. Johnst.
JM2: Cryptantha muricata var. jonesii	Cryptantha muricata var. jonesii (A. Gray) I.M. Johnst.
JM2: Cryptantha muricata var. muricata	Cryptantha muricata (Hook. & Arn.) A. Nelson & J.F. Macbr. var. muricata
JM1: Cryptantha nemaclada	Cryptantha nemaclada Greene
JM1: Cryptantha nevadensis	Cryptantha nevadensis A. Nelson & P.B. Kenn.
JM2: Cryptantha nevadensis var. nevadensis	Cryptantha nevadensis A. Nelson & P.B. Kenn. var. nevadensis
JM2: Cryptantha nevadensis var. rigida	Cryptantha nevadensis var. rigida I.M. Johnst.
JM1: Cryptantha nubigena	Cryptantha nubigena (Greene) Payson
JM1: Cryptantha oxygona	Cryptantha oxygona (A. Gray) Greene
JM1: Cryptantha pterocarya	Cryptantha pterocarya (Torr.) Greene
JM2: Cryptantha pterocarya var. cycloptera	Cryptantha pterocarya var. cycloptera (Greene) J.F. Macbr.
JM2: Cryptantha pterocarya var. pterocarya	Cryptantha pterocarya (Torr.) Greene var. pterocarya
JM2: Cryptantha pterocarya var. purpusii	Cryptantha pterocarya var. purpusii Jeps.
JM1: Cryptantha racemosa	Cryptantha racemosa (A. Gray) Greene
JM2: Cryptantha rattanii	Cryptantha rattanii Greene
JM1: Cryptantha recurvata	Cryptantha recurvata Coville
JM1: Cryptantha roosiorum	Cryptantha roosiorum Munz
JM2: Cryptantha rostellata	Cryptantha rostellata (Greene) Greene
JM2: Cryptantha schoolcraftii	Cryptantha schoolcraftii Tiehm
JM2: Cryptantha scoparia	Cryptantha scoparia A. Nelson
JM2: Cryptantha similis	Cryptantha similis K. Mathew & P.H. Raven
JM1: Cryptantha simulans	Cryptantha simulans Greene
JM1: Cryptantha sobolifera	excluded
JM2: Cryptantha sparsiflora	Cryptantha sparsiflora (Greene) Greene
JM2: Cryptantha spithamaea	Cryptantha spithamaea I.M. Johnst.
JM2: Cryptantha subretusa	Cryptantha subretusa I.M. Johnst.
JM1: Cryptantha torreyana	Cryptantha torreyana (A. Gray) Greene
JM2: Cryptantha torreyana var. pumila	Cryptantha torreyana var. pumila (A. Heller) I.M. Johnst.
JM2: Cryptantha torreyana var. torreyana	Cryptantha torreyana (A. Gray) Greene var. torreyana
JM1: Cryptantha traskiae	Cryptantha traskiae I.M. Johnst.
JM1: Cryptantha tumulosa	Cryptantha tumulosa (Payson) Payson
JM1: Cryptantha utahensis	Cryptantha utahensis (A. Gray) Greene
JM1: Cryptantha virginensis	Cryptantha virginensis (M.E. Jones) Payson
JM1: Cryptantha watsonii	Cryptantha watsonii (A. Gray) Greene
JM1: Cryptogramma acrostichoides	Cryptogramma acrostichoides R. Br.
JM1: Cryptogramma cascadensis	Cryptogramma cascadensis E.R. Alverson
JM2: Cucumis melo	Cucumis melo L.
JM1: Cucumis melo var. dudaim	Cucumis melo L. var. dudaim (L.) Naudin
JM1: Cucumis myriocarpus	Cucumis myriocarpus Naudin
JMS: Cucurbita californica	Cucurbita palmata S. Watson
JM1: Cucurbita digitata	Cucurbita digitata A. Gray
JM1: Cucurbita foetidissima	Cucurbita foetidissima Kunth
JM1: Cucurbita palmata	Cucurbita palmata S. Watson
JM2: Cucurbita pepo	Cucurbita pepo L.
JM2: Cucurbita pepo var. pepo	Cucurbita pepo L. var. pepo
JM2: Cuniculotinus gramineus	Cuniculotinus gramineus (H.M. Hall) Urbatsch et al.
JM1: Cupressus abramsiana	Hesperocyparis abramsiana (C.B. Wolf) Bartel
JMS: Cupressus abramsiana subsp. butanoensis	Hesperocyparis abramsiana var. butanoensis (Silba) Bartel & R.P. Adams
JMS: Cupressus abramsiana subsp. locatellii	Hesperocyparis abramsiana (C.B. Wolf) Bartel
JMS: Cupressus abramsiana subsp. neolomondensis	Hesperocyparis abramsiana (C.B. Wolf) Bartel
JMS: Cupressus abramsiana subsp. opleri	Hesperocyparis abramsiana (C.B. Wolf) Bartel
JM1: Cupressus arizonica	Hesperocyparis stephensonii (C.B. Wolf) Bartel; Hesperocyparis nevadensis (Abrams) Bartel
JM1: Cupressus arizonica subsp. arizonica	Hesperocyparis stephensonii (C.B. Wolf) Bartel
JM1: Cupressus arizonica subsp. nevadensis	Hesperocyparis nevadensis (Abrams) Bartel
JMS: Cupressus arizonica var. glabra	Hesperocyparis stephensonii (C.B. Wolf) Bartel
JM1: Cupressus bakeri	Hesperocyparis bakeri (Jeps.) Bartel
JM1: Cupressus forbesii	Hesperocyparis forbesii (Jeps.) Bartel
JM1: Cupressus goveniana	Hesperocyparis goveniana (Gordon) Bartel; Hesperocyparis pygmaea (Lemmon) Bartel
JM1: Cupressus goveniana subsp. goveniana	Hesperocyparis goveniana (Gordon) Bartel
JM1: Cupressus goveniana subsp. pigmaea	Hesperocyparis pygmaea (Lemmon) Bartel
JMS: Cupressus goveniana subsp. pygmaea	Hesperocyparis pygmaea (Lemmon) Bartel
JMS: Cupressus goveniana var. pygmaea	Hesperocyparis pygmaea (Lemmon) Bartel
JMS: Cupressus guadalupensis	Hesperocyparis forbesii (Jeps.) Bartel
JMS: Cupressus guadalupensis var. forbesii	Hesperocyparis forbesii (Jeps.) Bartel
JM1: Cupressus lawsoniana	Chamaecyparis lawsoniana (A. Murray bis) Parl.
JM1: Cupressus macnabiana	Hesperocyparis macnabiana (A. Murray bis) Bartel
JMS: Cupressus macnabiana var. nevadensis	Hesperocyparis nevadensis (Abrams) Bartel
JM1: Cupressus macrocarpa	Hesperocyparis macrocarpa (Hartw.) Bartel
JM1: Cupressus nootkatensis	Callitropsis nootkatensis (D. Don) D.P. Little
JM1: Cupressus sargentii	Hesperocyparis sargentii (Jeps.) Bartel
JMS: Cupressus stephensonii	Hesperocyparis stephensonii (C.B. Wolf) Bartel
JM1: Cuscuta approximata	Cuscuta approximata Bab.
JMS: Cuscuta approximata var. urceolata	Cuscuta approximata Bab.
JM2: Cuscuta brachycalyx	Cuscuta brachycalyx (Yunck.) Yunck.
JMS: Cuscuta brachycalyx var. apodanthera	Cuscuta brachycalyx (Yunck.) Yunck.
JM1: Cuscuta californica	Cuscuta californica Hook. & Arn.; Cuscuta occidentalis Millsp.
JM1: Cuscuta californica var. apiculata	Cuscuta californica var. apiculata Engelm.
JM1: Cuscuta californica var. breviflora	Cuscuta occidentalis Millsp.
JM1: Cuscuta californica var. californica	Cuscuta californica Hook. & Arn. var. californica
JM1: Cuscuta californica var. papillosa	Cuscuta californica var. papillosa Yunck.
JM2: Cuscuta campestris	Cuscuta campestris Yunck.
JM1: Cuscuta cephalanthi	Cuscuta cephalanthi Engelm.
JMS: Cuscuta cupulata	Cuscuta approximata Bab.
JM1: Cuscuta denticulata	Cuscuta denticulata Engelm.
JMS: Cuscuta hispidula	Cuscuta indecora Choisy var. indecora
JM1: Cuscuta howelliana	Cuscuta howelliana P. Rubtzov
JM1: Cuscuta indecora	Cuscuta indecora Choisy
JMS: Cuscuta indecora var. bifida	Cuscuta indecora Choisy var. indecora
JM1: Cuscuta indecora var. indecora	Cuscuta indecora Choisy var. indecora
JM1: Cuscuta indecora var. neuropetala	Cuscuta indecora Choisy var. indecora
JM2: Cuscuta japonica	Cuscuta japonica Choisy
JM2: Cuscuta japonica var. formosana	Cuscuta japonica Choisy var. formosana (Hayata) Yunck.
JM2: Cuscuta jepsonii	Cuscuta jepsonii Yunck.
JM2: Cuscuta nevadensis	Cuscuta nevadensis I.M. Johnst.
JM2: Cuscuta obtusiflora	Cuscuta obtusiflora Kunth
JM2: Cuscuta obtusiflora var. glandulosa	Cuscuta obtusiflora Kunth var. glandulosa Engelm.
JM2: Cuscuta occidentalis	Cuscuta occidentalis Millsp.
JM2: Cuscuta pacifica	Cuscuta pacifica Costea & M. Wright
JM2: Cuscuta pacifica var. pacifica	Cuscuta pacifica Costea & M. Wright var. pacifica
JM2: Cuscuta pacifica var. papillata	Cuscuta pacifica var. papillata (Yunck.) Costea & M. Wright
JM1: Cuscuta pentagona	excluded
JMS: Cuscuta pentagona var. calycina	Cuscuta campestris Yunck.
JM2: Cuscuta reflexa	Cuscuta reflexa Roxb.
JM1: Cuscuta salina	Cuscuta pacifica Costea & M. Wright; Cuscuta salina Engelm.; Cuscuta suksdorfii Yunck.; Cuscuta nevadensis I.M. Johnst.
JMS: Cuscuta salina var. acuminata	Cuscuta suksdorfii Yunck.
JMS: Cuscuta salina var. apoda	Cuscuta nevadensis I.M. Johnst.
JM1: Cuscuta salina var. major	Cuscuta pacifica Costea & M. Wright var. pacifica
JM1: Cuscuta salina var. papillata	Cuscuta pacifica var. papillata (Yunck.) Costea & M. Wright
JM1: Cuscuta salina var. salina	Cuscuta salina Engelm.
JM2: Cuscuta suaveolens	Cuscuta suaveolens Ser.
JM1: Cuscuta subinclusa	Cuscuta pacifica Costea & M. Wright; Cuscuta subinclusa Durand & Hilg.
JMS: Cuscuta subinclusa var. abbreviata	Cuscuta pacifica Costea & M. Wright var. pacifica
JM2: Cuscuta suksdorfii	Cuscuta suksdorfii Yunck.
JMS: Cuscuta suksdorfii var. subpedicellata	Cuscuta suksdorfii Yunck.
JM2: Cuscuta veatchii	Cuscuta veatchii Brandegee
JMS: Cuscuta veatchii var. apoda	Cuscuta nevadensis I.M. Johnst.
JMS: Cuscuta vivipara	Cuscuta nevadensis I.M. Johnst.
JM1: Cusickiella douglasii	Cusickiella douglasii (A. Gray) Rollins
JM1: Cusickiella quadricostata	Cusickiella quadricostata (Rollins) Rollins
JMS: Cyanopsis muricata	Volutaria muricata (L.) Maire
JM1: Cycladenia humilis	Cycladenia humilis Benth.
JM1: Cycladenia humilis var. humilis	Cycladenia humilis Benth. var. humilis
JM2: Cycladenia humilis var. jonesii	Cycladenia humilis var. jonesii (Eastw.) S.L. Welsh & N.D. Atwood
JM1: Cycladenia humilis var. venusta	Cycladenia humilis var. venusta (Eastw.) Munz
JM1: Cycloloma atriplicifolium	Cycloloma atriplicifolium (Spreng.) J.M. Coult.
JM2: Cyclospermum leptophyllum	Cyclospermum leptophyllum (Pers.) Britton & P. Wilson
JM2: Cylindropuntia &times;fosbergii	Cylindropuntia &times;fosbergii (C.B. Wolf) Rebman et al.
JM2: Cylindropuntia acanthocarpa	Cylindropuntia acanthocarpa (Engelm. & J.M. Bigelow) F.M. Knuth
JM2: Cylindropuntia acanthocarpa var. coloradensis	Cylindropuntia acanthocarpa (Engelm. & J.M. Bigelow) F.M. Knuth var. coloradensis (L.D. Benson) Pinkava
JM2: Cylindropuntia bigelovii	Cylindropuntia bigelovii (Engelm.) F.M. Knuth
JM2: Cylindropuntia californica	Cylindropuntia californica (Torr. & A. Gray) F.M. Knuth
JM2: Cylindropuntia californica var. californica	Cylindropuntia californica (Torr. & A. Gray) F.M. Knuth var. californica
JM2: Cylindropuntia californica var. parkeri	Cylindropuntia californica var. parkeri (J.M. Coult.) Pinkava
JM2: Cylindropuntia echinocarpa	Cylindropuntia echinocarpa (Engelm. & J.M. Bigelow) F.M. Knuth
JM2: Cylindropuntia ganderi	Cylindropuntia ganderi (C.B. Wolf) Rebman & Pinkava
JM2: Cylindropuntia munzii	Cylindropuntia munzii (C.B. Wolf) Backeb.
JM2: Cylindropuntia prolifera	Cylindropuntia prolifera (Engelm.) F.M. Knuth
JM2: Cylindropuntia ramosissima	Cylindropuntia ramosissima (Engelm.) F.M. Knuth
JM2: Cylindropuntia wolfii	Cylindropuntia wolfii (L.D. Benson) M.A. Baker
JM2: Cymbalaria muralis	Cymbalaria muralis P. Gaertn. et al.
JM1: Cymopterus aboriginum	Cymopterus aboriginum M.E. Jones
JM1: Cymopterus cinerarius	Cymopterus cinerarius A. Gray
JM1: Cymopterus deserticola	Cymopterus deserticola Brandegee
JM1: Cymopterus gilmanii	Cymopterus gilmanii C.V. Morton
JM1: Cymopterus globosus	Cymopterus globosus (S. Watson) S. Watson
JM1: Cymopterus multinervatus	Cymopterus multinervatus (J.M. Coult. & Rose) Tidestr.
JM1: Cymopterus panamintensis	Cymopterus panamintensis J.M. Coult. & Rose
JM1: Cymopterus panamintensis var. acutifolius	Cymopterus panamintensis var. acutifolius (J.M. Coult. & Rose) Munz
JM1: Cymopterus panamintensis var. panamintensis	Cymopterus panamintensis J.M. Coult. & Rose var. panamintensis
JM1: Cymopterus purpurascens	Cymopterus purpurascens (A. Gray) M.E. Jones
JM1: Cymopterus ripleyi	Cymopterus ripleyi Barneby
JMS: Cymopterus ripleyi var. saniculoides	Cymopterus ripleyi Barneby
JM1: Cymopterus terebinthinus	Cymopterus terebinthinus (Hook.) Torr. & A. Gray
JM1: Cymopterus terebinthinus var. californicus	Cymopterus terebinthinus var. californicus (J.M. Coult. & Rose) Jeps.
JM1: Cymopterus terebinthinus var. petraeus	Cymopterus terebinthinus var. petraeus (M.E. Jones) Goodrich
JM1: Cynanchum utahense	Funastrum utahense (Engelm.) Liede & Meve
JM1: Cynara cardunculus	Cynara cardunculus L.
JM2: Cynara cardunculus subsp. cardunculus	Cynara cardunculus L. subsp. cardunculus
JM2: Cynara cardunculus subsp. flavescens	Cynara cardunculus L. subsp. flavescens Wiklund
JM1: Cynara scolymus	Cynara cardunculus L. subsp. cardunculus
JM1: Cynodon dactylon	Cynodon dactylon (L.) Pers.
JM1: Cynodon plectostachyus	excluded
JM1: Cynodon transvalensis	excluded
JM1: Cynoglossum grande	Cynoglossum grande Lehm.
JM1: Cynoglossum occidentale	Cynoglossum occidentale A. Gray
JM1: Cynoglossum officinale	Cynoglossum officinale L.
JM1: Cynosurus cristatus	Cynosurus cristatus L.
JM1: Cynosurus echinatus	Cynosurus echinatus L.
JM1: Cyperus acuminatus	Cyperus acuminatus Torr. & Hook.
JM1: Cyperus bipartitus	Cyperus bipartitus Torr.
JM1: Cyperus difformis	Cyperus difformis L.
JM1: Cyperus eragrostis	Cyperus eragrostis Lam.
JM1: Cyperus erythrorhizos	Cyperus erythrorhizos Muhl.
JM1: Cyperus esculentus	Cyperus esculentus L.
JM2: Cyperus esculentus var. heermannii	Cyperus esculentus L. var. heermannii (Buckley) Britton
JM2: Cyperus esculentus var. leptostachyus	Cyperus esculentus L. var. leptostachyus Boeck.
JM2: Cyperus esculentus var. macrostachyus	Cyperus esculentus L. var. macrostachyus Boeck.
JM2: Cyperus flavescens	Cyperus flavescens L.
JM2: Cyperus flavicomus	Cyperus flavicomus Michx.
JM1: Cyperus fuscus	Cyperus fuscus L.
JM1: Cyperus involucratus	Cyperus involucratus Rottb.
JM2: Cyperus iria	Cyperus iria L.
JM1: Cyperus laevigatus	Cyperus laevigatus L.
JM1: Cyperus ligularis	excluded
JM1: Cyperus niger	Cyperus niger Ruiz & Pav.
JM1: Cyperus odoratus	Cyperus odoratus L.
JM1: Cyperus parishii	Cyperus parishii Britton
JM1: Cyperus rotundus	Cyperus rotundus L.
JM1: Cyperus squarrosus	Cyperus squarrosus L.
JM1: Cyperus strigosus	Cyperus strigosus L.
JMS: Cyperus tenellus	Isolepis levynsiana Muasya & D.A. Simpson
JM1: Cypripedium californicum	Cypripedium californicum A. Gray
JM1: Cypripedium fasciculatum	Cypripedium fasciculatum Kellogg
JM1: Cypripedium montanum	Cypripedium montanum Lindl.
JM2: Cypripedium parviflorum	Cypripedium parviflorum Salisb.
JM2: Cypripedium parviflorum var. makasin	Cypripedium parviflorum Salisb. var. makasin (Farw.) Sheviak
JM1: Cypselea humifusa	Cypselea humifusa Turpin
JM1: Cyrtomium falcatum	Cyrtomium falcatum (L. f.) C. Presl
JM1: Cystopteris fragilis	Cystopteris fragilis (L.) Bernh.
JM1: Cytisus multiflorus	Cytisus multiflorus (L'H&eacute;r.) Sweet
JM2: Cytisus proliferus	Cytisus proliferus L. f.
JM1: Cytisus scoparius	Cytisus scoparius (L.) Link
JM1: Cytisus striatus	Cytisus striatus (Hill) Rothm.
JM1: Dactylis glomerata	Dactylis glomerata L.
JM1: Dactyloctenium aegyptium	Dactyloctenium aegyptium (L.) Willd.
JM1: Dalea mollis	Dalea mollis Benth.
JM1: Dalea mollissima	Dalea mollissima (Rydb.) Munz
JM1: Dalea ornata	Dalea ornata (Hook.) Eaton & J. Wright
JMS: Dalea polydenia	Psorothamnus polydenius (Torr.) Rydb.
JM1: Dalea searlsiae	Dalea searlsiae (A. Gray) Barneby
JM1: Damasonium californicum	Damasonium californicum Benth.
JM1: Danthonia californica	Danthonia californica Bol.
JM1: Danthonia californica var. americana	Danthonia californica Bol.
JM1: Danthonia californica var. californica	Danthonia californica Bol.
JM2: Danthonia decumbens	Danthonia decumbens (L.) DC.
JM1: Danthonia intermedia	Danthonia intermedia Vasey
JM2: Danthonia intermedia subsp. intermedia	Danthonia intermedia Vasey subsp. intermedia
JM1: Danthonia pilosa	Rytidosperma penicillatum (Labill.) Connor & Edgar
JM1: Danthonia unispicata	Danthonia unispicata (Thurb.) Vasey
JM1: Darlingtonia californica	Darlingtonia californica Torr.
JM1: Darmera peltata	Darmera peltata (Benth.) Voss
JM2: Dasiphora fruticosa	Dasiphora fruticosa (L.) Rydb.
JM2: Dasyochloa pulchella	Dasyochloa pulchella (Kunth) Rydb.
JM1: Datisca glomerata	Datisca glomerata (C. Presl) Baill.
JM1: Datura discolor	Datura discolor Bernh.
JM1: Datura ferox	Datura ferox L.
JM1: Datura stramonium	Datura stramonium L.
JM1: Datura wrightii	Datura wrightii Regel
JM1: Daucus carota	Daucus carota L.
JM1: Daucus pusillus	Daucus pusillus Michx.
JM1: Dedeckera eurekensis	Dedeckera eurekensis Reveal & J.T. Howell
JM2: Deinandra arida	Deinandra arida (D.D. Keck) B.G. Baldwin
JM2: Deinandra bacigalupii	Deinandra bacigalupii B.G. Baldwin
JM2: Deinandra clementina	Deinandra clementina (Brandegee) B.G. Baldwin
JM2: Deinandra conjugens	Deinandra conjugens (D.D. Keck) B.G. Baldwin
JM2: Deinandra corymbosa	Deinandra corymbosa (DC.) B.G. Baldwin
JMS: Deinandra corymbosa subsp. macrocephala	Deinandra corymbosa (DC.) B.G. Baldwin
JM2: Deinandra fasciculata	Deinandra fasciculata (DC.) Greene
JM2: Deinandra floribunda	Deinandra floribunda (A. Gray) Davidson & Moxley
JM2: Deinandra halliana	Deinandra halliana (D.D. Keck) B.G. Baldwin
JM2: Deinandra increscens	Deinandra increscens (D.D. Keck) B.G. Baldwin; Deinandra paniculata (A. Gray) Davidson & Moxley
JMS: Deinandra increscens subsp. foliosa	Deinandra paniculata (A. Gray) Davidson & Moxley
JM2: Deinandra increscens subsp. increscens	Deinandra increscens (D.D. Keck) B.G. Baldwin subsp. increscens
JM2: Deinandra increscens subsp. villosa	Deinandra increscens subsp. villosa (Tanowitz) B.G. Baldwin
JM2: Deinandra kelloggii	Deinandra kelloggii (Greene) Greene
JM2: Deinandra lobbii	Deinandra lobbii (Greene) Greene
JM2: Deinandra minthornii	Deinandra minthornii (Jeps.) B.G. Baldwin
JM2: Deinandra mohavensis	Deinandra mohavensis (D.D. Keck) B.G. Baldwin
JM2: Deinandra pallida	Deinandra pallida (D.D. Keck) B.G. Baldwin
JM2: Deinandra paniculata	Deinandra paniculata (A. Gray) Davidson & Moxley
JM2: Deinandra pentactis	Deinandra pentactis (D.D. Keck) B.G. Baldwin
JM2: Delairea odorata	Delairea odorata Lem.
JM1: Delosperma litorale	Delosperma litorale (Kensit) L. Bolus
JM1: Delphinium andersonii	Delphinium andersonii A. Gray
JM1: Delphinium antoninum	Delphinium antoninum Eastw.
JM1: Delphinium bakeri	Delphinium bakeri Ewan
JM1: Delphinium californicum	Delphinium californicum Torr. & A. Gray
JM1: Delphinium californicum subsp. californicum	Delphinium californicum Torr. & A. Gray subsp. californicum
JM1: Delphinium californicum subsp. interius	Delphinium californicum subsp. interius (Eastw.) Ewan
JM1: Delphinium cardinale	Delphinium cardinale Hook.
JM1: Delphinium decorum	Delphinium decorum Fisch. & C.A. Mey.
JM1: Delphinium decorum subsp. decorum	Delphinium decorum Fisch. & C.A. Mey. subsp. decorum
JM1: Delphinium decorum subsp. tracyi	Delphinium decorum subsp. tracyi Ewan
JM1: Delphinium depauperatum	Delphinium depauperatum Nutt.
JM1: Delphinium glaucum	Delphinium glaucum S. Watson
JM1: Delphinium gracilentum	Delphinium gracilentum Greene
JM1: Delphinium gypsophilum	Delphinium gypsophilum Ewan
JM1: Delphinium gypsophilum subsp. gypsophilum	Delphinium gypsophilum Ewan
JM1: Delphinium gypsophilum subsp. parviflorum	Delphinium gypsophilum Ewan
JM1: Delphinium hansenii	Delphinium hansenii (Greene) Greene
JM1: Delphinium hansenii subsp. ewanianum	Delphinium hansenii subsp. ewanianum M.J. Warnock
JM1: Delphinium hansenii subsp. hansenii	Delphinium hansenii (Greene) Greene subsp. hansenii
JM1: Delphinium hansenii subsp. kernense	Delphinium hansenii subsp. kernense (Davidson) Ewan
JM1: Delphinium hesperium	Delphinium hesperium A. Gray
JM1: Delphinium hesperium subsp. cuyamacae	Delphinium hesperium subsp. cuyamacae (Abrams) H. Lewis & Epling
JM1: Delphinium hesperium subsp. hesperium	Delphinium hesperium A. Gray subsp. hesperium
JM1: Delphinium hesperium subsp. pallescens	Delphinium hesperium subsp. pallescens (Ewan) H. Lewis & Epling
JM1: Delphinium hutchinsoniae	Delphinium hutchinsoniae Ewan
JM1: Delphinium inopinum	Delphinium inopinum (Jeps.) H. Lewis & Epling
JM1: Delphinium luteum	Delphinium luteum A. Heller
JM1: Delphinium nudicaule	Delphinium nudicaule Torr. & A. Gray
JM1: Delphinium nuttallianum	Delphinium nuttallianum Pritz.
JM1: Delphinium parishii	Delphinium parishii A. Gray
JM1: Delphinium parishii subsp. pallidum	Delphinium parishii subsp. pallidum (Munz) M.J. Warnock
JM1: Delphinium parishii subsp. parishii	Delphinium parishii A. Gray subsp. parishii
JM1: Delphinium parishii subsp. subglobosum	Delphinium parishii subsp. subglobosum (Wiggins) H. Lewis & Epling
JM1: Delphinium parryi	Delphinium parryi A. Gray
JM1: Delphinium parryi subsp. blochmaniae	Delphinium parryi subsp. blochmaniae (Greene) H. Lewis & Epling
JM1: Delphinium parryi subsp. eastwoodiae	Delphinium parryi subsp. eastwoodiae Ewan
JM1: Delphinium parryi subsp. maritimum	Delphinium parryi subsp. maritimum (Davidson) M.J. Warnock
JM1: Delphinium parryi subsp. parryi	Delphinium parryi A. Gray subsp. parryi
JM1: Delphinium parryi subsp. purpureum	Delphinium parryi subsp. purpureum (H. Lewis & Epling) M.J. Warnock
JM1: Delphinium patens	Delphinium patens Benth.
JM1: Delphinium patens subsp. hepaticoideum	Delphinium patens subsp. hepaticoideum Ewan
JM1: Delphinium patens subsp. montanum	Delphinium patens subsp. montanum (Munz) Ewan
JM1: Delphinium patens subsp. patens	Delphinium patens Benth. subsp. patens
JM1: Delphinium polycladon	Delphinium polycladon Eastw.
JM1: Delphinium purpusii	Delphinium purpusii Brandegee
JM1: Delphinium recurvatum	Delphinium recurvatum Greene
JM2: Delphinium scaposum	Delphinium scaposum Greene
JM1: Delphinium stachydeum	Delphinium stachydeum (A. Gray) Tidestr.
JM1: Delphinium trolliifolium	Delphinium trolliifolium A. Gray
JM1: Delphinium uliginosum	Delphinium uliginosum Curran
JM1: Delphinium umbraculorum	Delphinium umbraculorum H. Lewis & Epling
JM1: Delphinium variegatum	Delphinium variegatum Torr. & A. Gray
JM1: Delphinium variegatum subsp. kinkiense	Delphinium variegatum subsp. kinkiense (Munz) M.J. Warnock
JM1: Delphinium variegatum subsp. thornei	Delphinium variegatum subsp. thornei Munz
JM1: Delphinium variegatum subsp. variegatum	Delphinium variegatum Torr. & A. Gray subsp. variegatum
JM1: Dendromecon harfordii	Dendromecon harfordii Kellogg
JMS: Dendromecon harfordii var. rhamnoides	Dendromecon harfordii Kellogg
JM1: Dendromecon rigida	Dendromecon rigida Benth.
JMS: Dendromecon rigida subsp. rhamnoides	Dendromecon harfordii Kellogg
JMS: Dentaria californica	Cardamine californica (Nutt.) Greene
JMS: Dentaria californica var. cardiophylla	Cardamine californica (Nutt.) Greene
JMS: Dentaria californica var. cuneata	Cardamine californica (Nutt.) Greene
JMS: Dentaria californica var. integrifolia	Cardamine californica (Nutt.) Greene
JMS: Dentaria californica var. sinuata	Cardamine californica (Nutt.) Greene
JMS: Dentaria corymbosa	Cardamine pachystigma (S. Watson) Rollins
JMS: Dentaria corymbosa var. grata	Cardamine pachystigma (S. Watson) Rollins
JMS: Dentaria gemmata	Cardamine nuttallii Greene
JMS: Dentaria pachystigma	Cardamine pachystigma (S. Watson) Rollins
JMS: Dentaria pachystigma var. dissectifolia	Cardamine californica (Nutt.) Greene
JMS: Dentaria tenella	Cardamine nuttallii Greene
JMS: Dentaria tenella var. palmata	Cardamine nuttallii Greene
JM1: Deschampsia atropurpurea	Vahlodea atropurpurea (Wahlenb.) Hartm.
JMS: Deschampsia beringensis	Deschampsia cespitosa subsp. beringensis (Hult&eacute;n) W.E. Lawr.
JM1: Deschampsia cespitosa	Deschampsia cespitosa (L.) P. Beauv.
JM2: Deschampsia cespitosa subsp. beringensis	Deschampsia cespitosa subsp. beringensis (Hult&eacute;n) W.E. Lawr.
JM1: Deschampsia cespitosa subsp. cespitosa	Deschampsia cespitosa (L.) P. Beauv. subsp. cespitosa
JM1: Deschampsia cespitosa subsp. holciformis	Deschampsia cespitosa subsp. holciformis (J. Presl) W.E. Lawr.
JM1: Deschampsia danthonioides	Deschampsia danthonioides (Trin.) Munro
JM1: Deschampsia elongata	Deschampsia elongata (Hook.) Munro
JMS: Deschampsia holciformis	Deschampsia cespitosa subsp. holciformis (J. Presl) W.E. Lawr.
JM2: Descurainia adenophora	Descurainia adenophora (Wooton & Standl.) O.E. Schulz
JM1: Descurainia californica	Descurainia californica (A. Gray) O.E. Schulz
JM1: Descurainia incana	Descurainia incana (Fisch. & C.A. Mey.) Dorn
JM1: Descurainia incisa	Descurainia incisa (Engelm.) Britton; Descurainia longipedicellata (E. Fourn.) O.E. Schulz
JM1: Descurainia incisa subsp. filipes	Descurainia longipedicellata (E. Fourn.) O.E. Schulz
JM1: Descurainia incisa subsp. incisa	Descurainia incisa (Engelm.) Britton subsp. incisa
JM2: Descurainia longipedicellata	Descurainia longipedicellata (E. Fourn.) O.E. Schulz
JM2: Descurainia nelsonii	Descurainia nelsonii (Rydb.) Al-Shehbaz & Goodson
JMS: Descurainia obtusa	Descurainia adenophora (Wooton & Standl.) O.E. Schulz
JM1: Descurainia obtusa subsp. adenophora	Descurainia adenophora (Wooton & Standl.) O.E. Schulz
JM1: Descurainia paradisa	Descurainia paradisa (A. Nelson & P.B. Kenn.) O.E. Schulz
JMS: Descurainia paradisa subsp. nevadensis	Descurainia paradisa (A. Nelson & P.B. Kenn.) O.E. Schulz
JM1: Descurainia pinnata	Descurainia pinnata (Walter) Britton; Descurainia longipedicellata (E. Fourn.) O.E. Schulz; Descurainia paradisa (A. Nelson & P.B. Kenn.) O.E. Schulz
JM2: Descurainia pinnata subsp. brachycarpa	Descurainia pinnata subsp. brachycarpa (Richardson) Detling
JMS: Descurainia pinnata subsp. filipes	Descurainia longipedicellata (E. Fourn.) O.E. Schulz
JM1: Descurainia pinnata subsp. glabra	Descurainia pinnata subsp. glabra (Wooton & Standl.) Detling
JM1: Descurainia pinnata subsp. halictorum	Descurainia pinnata (Walter) Britton
JM1: Descurainia pinnata subsp. intermedia	Descurainia pinnata (Walter) Britton
JM1: Descurainia pinnata subsp. menziesii	Descurainia pinnata (Walter) Britton
JM2: Descurainia pinnata subsp. ochroleuca	Descurainia pinnata subsp. ochroleuca (Wooton) Detling
JMS: Descurainia pinnata subsp. paradisa	Descurainia paradisa (A. Nelson & P.B. Kenn.) O.E. Schulz
JMS: Descurainia richardsonii	Descurainia incana (Fisch. & C.A. Mey.) Dorn; Descurainia incisa (Engelm.) Britton
JMS: Descurainia richardsonii subsp. incisa	Descurainia incisa (Engelm.) Britton subsp. incisa
JMS: Descurainia richardsonii subsp. viscosa	Descurainia incana (Fisch. & C.A. Mey.) Dorn
JM1: Descurainia sophia	Descurainia sophia (L.) Prantl
JM1: Desmazeria rigida	Desmazeria rigida (L.) Tutin
JM2: Dianthus armeria	Dianthus armeria L.
JM1: Dianthus armeria subsp. armeria	Dianthus armeria L. subsp. armeria
JM2: Dianthus barbatus	Dianthus barbatus L.
JM1: Dianthus barbatus subsp. barbatus	Dianthus barbatus L. subsp. barbatus
JM2: Dianthus deltoides	Dianthus deltoides L.
JM1: Dianthus deltoides subsp. deltoides	Dianthus deltoides L. subsp. deltoides
JM2: Dianthus plumarius	Dianthus plumarius L.
JM2: Dianthus plumarius subsp. plumarius	Dianthus plumarius L. subsp. plumarius
JM1: Dicentra chrysantha	Ehrendorferia chrysantha (Hook. & Arn.) Rylander
JM1: Dicentra formosa	Dicentra formosa (Haw.) Walp.
JM1: Dicentra nevadensis	Dicentra nevadensis Eastw.
JM1: Dicentra ochroleuca	Ehrendorferia ochroleuca (Engelm.) Fukuhara
JM1: Dicentra pauciflora	Dicentra pauciflora S. Watson
JM1: Dicentra uniflora	Dicentra uniflora Kellogg
JMS: Dichanthelium acuminatum	Panicum acuminatum Sw.
JMS: Dichanthelium acuminatum subsp. fasciculatum	Panicum acuminatum var. fasciculatum (Torr.) Lelong
JMS: Dichanthelium acuminatum subsp. lindheimeri	Panicum acuminatum var. lindheimeri (Nash) Beetle
JMS: Dichanthelium acuminatum subsp. thermale	Panicum acuminatum var. thermale (Bol.) Wipff
JMS: Dichanthelium lanuginosum	Panicum acuminatum
JMS: Dichanthelium lanuginosum var. thermale	Panicum acuminatum var. thermale (Bol.) Wipff
JMS: Dichanthelium oligosanthes	Panicum oligosanthes Schult.
JMS: Dichanthelium oligosanthes subsp. scribnerianum	Panicum oligosanthes Schult. var. scribnerianum (Nash) Fernald
JM1: Dichelostemma capitatum	Dichelostemma capitatum (Benth.) Alph. Wood
JM1: Dichelostemma capitatum subsp. capitatum	Dichelostemma capitatum (Benth.) Alph. Wood subsp. capitatum
JM1: Dichelostemma capitatum subsp. pauciflorum	Dichelostemma capitatum subsp. pauciflorum (Torr.) Keator
JM1: Dichelostemma congestum	Dichelostemma congestum (Sm.) Kunth
JM1: Dichelostemma ida-maia	Dichelostemma ida-maia (Alph. Wood) Greene
JM1: Dichelostemma multiflorum	Dichelostemma multiflorum (Benth.) A. Heller
JM1: Dichelostemma volubile	Dichelostemma volubile (Kellogg) A. Heller
JM1: Dichondra donelliana	Dichondra donelliana Tharp & M.C. Johnst.
JM2: Dichondra micrantha	Dichondra micrantha Urb.
JM1: Dichondra occidentalis	Dichondra occidentalis House
JM1: Dicoria canescens	Dicoria canescens A. Gray
JM2: Dicranostegia orcuttiana	Dicranostegia orcuttiana (A. Gray) Pennell
JM2: Dieteria asteroides	Dieteria asteroides Torr.
JM2: Dieteria asteroides var. asteroides	Dieteria asteroides Torr. var. asteroides
JM2: Dieteria asteroides var. lagunensis	Dieteria asteroides var. lagunensis (D.D. Keck) D.R. Morgan & R.L. Hartm.
JM2: Dieteria canescens	Dieteria canescens (Pursh) Nutt.
JM2: Dieteria canescens var. canescens	Dieteria canescens (Pursh) Nutt. var. canescens
JM2: Dieteria canescens var. incana	Dieteria canescens var. incana (Lindl.) D.R. Morgan & R.L. Hartm.
JM2: Dieteria canescens var. leucanthemifolia	Dieteria canescens var. leucanthemifolia (Greene) D.R. Morgan & R.L. Hartm.
JM2: Dieteria canescens var. shastensis	Dieteria canescens var. shastensis (A. Gray) D.R. Morgan & R.L. Hartm.
JM2: Dieteria canescens var. ziegleri	Dieteria canescens var. ziegleri (Munz) D.R. Morgan & R.L. Hartm.
JM1: Digitalis purpurea	Digitalis purpurea L.
JM2: Digitaria californica	Digitaria californica (Benth.) Henrard
JM2: Digitaria californica var. californica	Digitaria californica (Benth.) Henrard var. californica
JM2: Digitaria ciliaris	Digitaria ciliaris (Retz.) Koeler
JM2: Digitaria ciliaris var. ciliaris	Digitaria ciliaris (Retz.) Koeler var. ciliaris
JM1: Digitaria ischaemum	Digitaria ischaemum (Schreb.) Muhl.
JM1: Digitaria sanguinalis	Digitaria ciliaris (Retz.) Koeler; Digitaria sanguinalis (L.) Scop.
JMS: Digitaria sanguinalis var. ciliaris	Digitaria ciliaris (Retz.) Koeler var. ciliaris
JM1: Dimeresia howellii	Dimeresia howellii A. Gray
JM2: Dimorphotheca ecklonis	Dimorphotheca ecklonis DC.
JM2: Dimorphotheca fruticosa	Dimorphotheca fruticosa (L.) DC.
JM1: Dimorphotheca sinuata	Dimorphotheca sinuata DC.
JM1: Diodia teres	Diodia teres Walter
JMS: Diplacus arachnoideus	Mimulus aurantiacus var. pubescens (Torr.) D.M. Thomps.
JMS: Diplacus calycinus	Mimulus aurantiacus var. pubescens (Torr.) D.M. Thomps.
JMS: Diplacus fasciculatus	Mimulus aurantiacus var. grandiflorus (Lindl.) D.M. Thomps.
JMS: Diplacus grandiflorus	Mimulus aurantiacus var. grandiflorus (Lindl.) D.M. Thomps.
JMS: Diplacus latifolius	Mimulus aurantiacus var. aridus (Abrams) D.M. Thomps.
JMS: Diplacus speciosus	Mimulus aurantiacus var. pubescens (Torr.) D.M. Thomps.
JM1: Diplotaxis muralis	Diplotaxis muralis (L.) DC.
JM1: Diplotaxis tenuifolia	Diplotaxis tenuifolia (L.) DC.
JM1: Dipsacus fullonum	Dipsacus fullonum L.
JM1: Dipsacus sativus	Dipsacus sativus (L.) Honck.
JM1: Dirca occidentalis	Dirca occidentalis A. Gray
JM1: Disporum hookeri	Prosartes hookeri Torr.; Prosartes parvifolia S. Watson
JMS: Disporum hookeri var. parvifolium	Prosartes parvifolia S. Watson
JMS: Disporum hookeri var. trachyandrum	Prosartes hookeri Torr.
JM1: Disporum smithii	Prosartes smithii (Hook.) Utech et al.
JM1: Dissanthelium californicum	Dissanthelium californicum (Nutt.) Benth.
JM2: Distichlis littoralis	Distichlis littoralis (Engelm.) H.L. Bell & Columbus
JM1: Distichlis spicata	Distichlis spicata (L.) Greene
JMS: Distichlis spicata var. divaricata	Distichlis spicata (L.) Greene
JMS: Distichlis spicata var. nana	Distichlis spicata (L.) Greene
JMS: Distichlis spicata var. stolonifera	Distichlis spicata (L.) Greene
JMS: Distichlis spicata var. stricta	Distichlis spicata (L.) Greene
JMS: Ditaxis adenophora	Ditaxis claryana (Jeps.) Webster
JM1: Ditaxis californica	Ditaxis serrata var. californica (Brandegee) V.W. Steinm. & Felger
JM1: Ditaxis clariana	Ditaxis claryana (Jeps.) Webster
JM2: Ditaxis claryana	Ditaxis claryana (Jeps.) Webster
JM1: Ditaxis lanceolata	Ditaxis lanceolata (Benth.) Pax & K. Hoffm.
JM1: Ditaxis neomexicana	Ditaxis neomexicana (M&uuml;ll. Arg.) A. Heller
JM1: Ditaxis serrata	Ditaxis serrata (Torr.) A. Heller
JM2: Ditaxis serrata var. californica	Ditaxis serrata var. californica (Brandegee) V.W. Steinm. & Felger
JM2: Ditaxis serrata var. serrata	Ditaxis serrata (Torr.) A. Heller var. serrata
JM1: Dithyrea californica	Dithyrea californica Harv.
JM1: Dithyrea maritima	Dithyrea maritima (Davidson) Davidson
JM2: Dittrichia graveolens	Dittrichia graveolens (L.) Greuter
JM1: Dodecahema leptoceras	Dodecahema leptoceras (A. Gray) Reveal & Hardham
JM1: Dodecatheon alpinum	Dodecatheon alpinum (A. Gray) Greene
JM1: Dodecatheon clevelandii	Dodecatheon clevelandii Greene
JM1: Dodecatheon clevelandii subsp. clevelandii	Dodecatheon clevelandii Greene subsp. clevelandii
JM1: Dodecatheon clevelandii subsp. insulare	Dodecatheon clevelandii subsp. insulare H.J. Thomps.
JM1: Dodecatheon clevelandii subsp. patulum	Dodecatheon clevelandii subsp. patulum (Kuntze) H.J. Thomps.
JM1: Dodecatheon clevelandii subsp. sanctarum	Dodecatheon clevelandii subsp. sanctarum (Greene) Abrams
JMS: Dodecatheon clevelandii var. gracile	Dodecatheon clevelandii subsp. sanctarum (Greene) Abrams
JMS: Dodecatheon clevelandii var. patulum	Dodecatheon clevelandii subsp. patulum (Kuntze) H.J. Thomps.
JM1: Dodecatheon conjugens	Dodecatheon conjugens Greene
JM1: Dodecatheon hendersonii	Dodecatheon hendersonii A. Gray
JM1: Dodecatheon jeffreyi	Dodecatheon jeffreyi Van Houtte
JM1: Dodecatheon pulchellum	Dodecatheon pulchellum (Raf.) Merr.
JMS: Dodecatheon pulchellum var. monanthum	Dodecatheon pulchellum (Raf.) Merr.
JMS: Dodecatheon pulchellum var. shoshonense	Dodecatheon pulchellum (Raf.) Merr.
JM1: Dodecatheon redolens	Dodecatheon redolens (H.M. Hall) H.J. Thomps.
JM1: Dodecatheon subalpinum	Dodecatheon subalpinum Eastw.
JM1: Dopatrium junceum	Dopatrium junceum (Roxb.) Benth.
JM1: Downingia bacigalupii	Downingia bacigalupii Weiler
JM1: Downingia bella	Downingia bella Hoover
JM1: Downingia bicornuta	Downingia bicornuta A. Gray
JM1: Downingia bicornuta var. bicornuta	Downingia bicornuta A. Gray var. bicornuta
JM1: Downingia bicornuta var. picta	Downingia bicornuta var. picta Hoover
JM1: Downingia concolor	Downingia concolor Greene
JM1: Downingia concolor var. brevior	Downingia concolor var. brevior McVaugh
JM1: Downingia concolor var. concolor	Downingia concolor Greene var. concolor
JM1: Downingia cuspidata	Downingia cuspidata (Greene) Rattan
JM1: Downingia elegans	Downingia elegans (Lindl.) Torr.
JMS: Downingia elegans var. corymbosa	Downingia elegans (Lindl.) Torr.
JM1: Downingia insignis	Downingia insignis Greene
JM1: Downingia laeta	Downingia laeta (Greene) Greene
JM1: Downingia montana	Downingia montana Greene
JM1: Downingia ornatissima	Downingia ornatissima Greene
JM1: Downingia ornatissima var. eximia	Downingia ornatissima var. eximia (Hoover) McVaugh
JM1: Downingia ornatissima var. ornatissima	Downingia ornatissima Greene var. ornatissima
JM1: Downingia pulchella	Downingia pulchella (Lindl.) Torr.
JM2: Downingia pulcherrima	Downingia pulcherrima M. Peck
JM1: Downingia pusilla	Downingia pusilla (A. DC.) Torr.
JM2: Downingia willamettensis	Downingia willamettensis M. Peck
JM1: Downingia yina	Downingia yina Applegate; Downingia pulcherrima M. Peck; Downingia willamettensis M. Peck
JMS: Downingia yina var. major	Downingia pulcherrima M. Peck; Downingia willamettensis M. Peck
JM1: Draba albertina	Draba albertina Greene
JM1: Draba asterophora	Draba asterophora Payson
JM1: Draba asterophora var. asterophora	Draba asterophora Payson
JM1: Draba asterophora var. macrocarpa	Draba asterophora Payson
JM1: Draba aureola	Draba aureola S. Watson
JM1: Draba breweri	Draba breweri S. Watson; Draba cana Rydb.
JMS: Draba breweri var. cana	Draba cana Rydb.
JMS: Draba breweri var. sublaxa	Draba breweri S. Watson
JM1: Draba californica	Draba californica (Jeps.) Rollins & R.A. Price
JM1: Draba cana	Draba cana Rydb.
JM1: Draba carnosula	Draba carnosula O.E. Schulz
JM1: Draba corrugata	Draba corrugata S. Watson; Draba saxosa Davidson
JMS: Draba corrugata f. vestita	Draba corrugata S. Watson
JM1: Draba corrugata var. corrugata	Draba corrugata S. Watson
JM1: Draba corrugata var. saxosa	Draba saxosa Davidson
JMS: Draba crassifolia	Draba albertina Greene
JMS: Draba crassifolia var. albertina	Draba albertina Greene
JMS: Draba crassifolia var. nevadensis	Draba albertina Greene
JM1: Draba cruciata	Draba cruciata Payson
JMS: Draba cruciata var. integrifolia	Draba sharsmithii Rollins & R.A. Price
JM1: Draba cuneifolia	Draba cuneifolia Torr. & A. Gray; Draba californica (Jeps.) Rollins & R.A. Price
JMS: Draba cuneifolia var. californica	Draba californica (Jeps.) Rollins & R.A. Price
JMS: Draba cuneifolia var. cuneifolia	Draba cuneifolia Torr. & A. Gray
JMS: Draba cuneifolia var. integrifolia	Draba cuneifolia Torr. & A. Gray
JMS: Draba cuneifolia var. sonorae	Draba cuneifolia Torr. & A. Gray
JM1: Draba densifolia	Draba densifolia Nutt.
JMS: Draba douglasii	Cusickiella douglasii (A. Gray) Rollins
JMS: Draba douglasii var. crockeri	Cusickiella douglasii (A. Gray) Rollins
JMS: Draba eurycarpa	Anelsonia eurycarpa (A. Gray) J.F. Macbr. & Payson
JM1: Draba howellii	Draba howellii S. Watson
JMS: Draba howellii var. carnosula	Draba carnosula O.E. Schulz
JM1: Draba incrassata	Draba incrassata (Rollins) Rollins & R.A. Price
JM2: Draba lemmonii	Draba lemmonii S. Watson; Draba longisquamosa O.E. Schulz
JMS: Draba lemmonii var. incrassata	Draba incrassata (Rollins) Rollins & R.A. Price
JM1: Draba lemmonii var. lemmonii	Draba longisquamosa O.E. Schulz
JM2: Draba lonchocarpa	Draba lonchocarpa Rydb.
JM1: Draba lonchocarpa var. lonchocarpa	Draba lonchocarpa Rydb.
JM2: Draba longisquamosa	Draba longisquamosa O.E. Schulz
JM1: Draba monoensis	Draba monoensis Rollins & R.A. Price
JM1: Draba nemorosa	Draba nemorosa L.
JMS: Draba nivalis	Draba lonchocarpa Rydb.
JMS: Draba nivalis var. elongata	Draba lonchocarpa Rydb.
JM2: Draba novolympica	Draba novolympica Payson & H. St. John
JM2: Draba oligosperma	Draba oligosperma Hook.; Draba densifolia Nutt.
JM1: Draba oligosperma var. oligosperma	Draba oligosperma Hook.
JMS: Draba oligosperma var. pectinata	Draba densifolia Nutt.
JMS: Draba paysonii	Draba novolympica Payson & H. St. John
JM1: Draba paysonii var. treleasei	Draba novolympica Payson & H. St. John
JM1: Draba praealta	Draba praealta Greene
JM1: Draba pterosperma	Draba pterosperma Payson
JMS: Draba quadricostata	Cusickiella quadricostata (Rollins) Rollins
JM1: Draba reptans	Draba reptans (Lam.) Fernald
JM2: Draba saxosa	Draba saxosa Davidson
JM1: Draba sharsmithii	Draba sharsmithii Rollins & R.A. Price
JM1: Draba sierrae	Draba sierrae Sharsm.
JMS: Draba stenoloba	Draba albertina Greene
JMS: Draba stenoloba var. nana	Draba albertina Greene
JMS: Draba stenoloba var. ramosa	Draba albertina Greene
JM1: Draba subumbellata	Draba subumbellata Rollins & R.A. Price
JMS: Draba unilateralis	Athysanus unilateralis (M.E. Jones) Jeps.
JM1: Draba verna	Draba verna L.
JMS: Draba vestita	Draba corrugata S. Watson
JM1: Draperia systyla	Draperia systyla (A. Gray) A. Gray
JM1: Drosanthemum floribundum	Drosanthemum floribundum (Haw.) Schwantes
JM1: Drosera anglica	Drosera anglica Huds.
JM1: Drosera rotundifolia	Drosera rotundifolia L.
JM2: Drymocallis cuneifolia	Drymocallis cuneifolia Rydb.
JM2: Drymocallis cuneifolia var. cuneifolia	Drymocallis cuneifolia Rydb. var. cuneifolia
JM2: Drymocallis cuneifolia var. ewanii	Drymocallis cuneifolia var. ewanii (D.D. Keck) Ertter
JM2: Drymocallis glandulosa	Drymocallis glandulosa (Lindl.) Rydb.
JM2: Drymocallis glandulosa var. glandulosa	Drymocallis glandulosa (Lindl.) Rydb. var. glandulosa
JM2: Drymocallis glandulosa var. reflexa	Drymocallis glandulosa var. reflexa (Greene) Ertter
JM2: Drymocallis glandulosa var. viscida	Drymocallis glandulosa var. viscida (Parish) Ertter
JM2: Drymocallis glandulosa var. wrangelliana	Drymocallis glandulosa var. wrangelliana (Fisch. & Av&eacute;-Lall.) Ertter
JM2: Drymocallis hansenii	Drymocallis hansenii (Greene) Rydb.
JM2: Drymocallis lactea	Drymocallis lactea (Greene) Rydb.
JM2: Drymocallis lactea var. austiniae	Drymocallis lactea var. austiniae (Jeps.) Ertter
JM2: Drymocallis lactea var. lactea	Drymocallis lactea (Greene) Rydb. var. lactea
JM2: Drymocallis pseudorupestris	Drymocallis pseudorupestris (Rydb.) Rydb.
JM2: Drymocallis pseudorupestris var. crumiana	Drymocallis pseudorupestris var. crumiana Ertter
JM2: Drymocallis pseudorupestris var. saxicola	Drymocallis pseudorupestris var. saxicola Ertter
JM2: Drymocallis rhomboidea	Drymocallis rhomboidea (Rydb.) Rydb.
JM1: Dryopteris arguta	Dryopteris arguta (Kaulf.) Maxon
JM1: Dryopteris expansa	Dryopteris expansa (C. Presl) Fraser-Jenk. & Jermy
JM1: Dryopteris filix-mas	Dryopteris filix-mas (L.) Schott
JM1: Duchesnea indica	Duchesnea indica (Andrews) Focke
JM2: Duchesnea indica var. indica	Duchesnea indica (Andrews) Focke var. indica
JM1: Dudleya abramsii	Dudleya abramsii Rose; Dudleya cymosa (Lem.) Britten & Rose; Dudleya parva Rose & Davidson
JM1: Dudleya abramsii subsp. abramsii	Dudleya abramsii Rose subsp. abramsii
JM1: Dudleya abramsii subsp. affinis	Dudleya abramsii subsp. affinis K.M. Nakai
JM1: Dudleya abramsii subsp. bettinae	Dudleya abramsii subsp. bettinae (Hoover) Bartel
JM2: Dudleya abramsii subsp. calcicola	Dudleya abramsii subsp. calcicola (Bartel & Shevock) K.M. Nakai
JMS: Dudleya abramsii subsp. costatifolia	Dudleya cymosa subsp. costatifolia Bartel & Shevock
JM1: Dudleya abramsii subsp. murina	Dudleya abramsii subsp. murina (Eastw.) Moran
JM1: Dudleya abramsii subsp. parva	Dudleya parva Rose & Davidson
JM2: Dudleya abramsii subsp. setchellii	Dudleya abramsii subsp. setchellii (Jeps.) Morin
JM2: Dudleya arizonica	Dudleya arizonica Rose
JM2: Dudleya attenuata	Dudleya attenuata (S. Watson) Moran
JM2: Dudleya attenuata subsp. attenuata	Dudleya attenuata (S. Watson) Moran subsp. attenuata
JM1: Dudleya attenuata subsp. orcuttii	Dudleya attenuata (S. Watson) Moran subsp. attenuata
JM1: Dudleya blochmaniae	Dudleya blochmaniae (Eastw.) Moran; Dudleya brevifolia (Moran) Moran
JM1: Dudleya blochmaniae subsp. blochmaniae	Dudleya blochmaniae (Eastw.) Moran subsp. blochmaniae
JM1: Dudleya blochmaniae subsp. brevifolia	Dudleya brevifolia (Moran) Moran
JM1: Dudleya blochmaniae subsp. insularis	Dudleya blochmaniae subsp. insularis (Moran) Moran
JM2: Dudleya brevifolia	Dudleya brevifolia (Moran) Moran
JM1: Dudleya caespitosa	Dudleya caespitosa (Haw.) Britton & Rose
JM1: Dudleya calcicola	Dudleya abramsii subsp. calcicola (Bartel & Shevock) K.M. Nakai
JM1: Dudleya candelabrum	Dudleya candelabrum Rose
JMS: Dudleya cespitosa	Dudleya caespitosa (Haw.) Britton & Rose
JM1: Dudleya cymosa	Dudleya cymosa (Lem.) Britton & Rose
JM2: Dudleya cymosa subsp. agourensis	Dudleya cymosa subsp. agourensis K.M. Nakai
JM1: Dudleya cymosa subsp. costafolia	Dudleya cymosa subsp. costatifolia Bartel & Shevock
JM2: Dudleya cymosa subsp. costatifolia	Dudleya cymosa subsp. costatifolia Bartel & Shevock
JM1: Dudleya cymosa subsp. crebrifolia	Dudleya cymosa subsp. crebrifolia K.M. Nakai & Verity
JM1: Dudleya cymosa subsp. cymosa	Dudleya cymosa (Lem.) Britton & Rose subsp. cymosa
JMS: Dudleya cymosa subsp. gigantea	Dudleya cymosa (Lem.) Britton & Rose subsp. cymosa
JM1: Dudleya cymosa subsp. marcescens	Dudleya cymosa subsp. marcescens Moran
JM1: Dudleya cymosa subsp. ovatifolia	Dudleya cymosa subsp. ovatifolia (Britton) Moran
JM1: Dudleya cymosa subsp. paniculata	Dudleya cymosa subsp. paniculata (Jeps.) K.M. Nakai
JM1: Dudleya cymosa subsp. pumila	Dudleya cymosa subsp. pumila (Rose) K.M. Nakai
JM1: Dudleya densiflora	Dudleya densiflora (Rose) Moran
JM1: Dudleya edulis	Dudleya edulis (Nutt.) Moran
JM1: Dudleya farinosa	Dudleya farinosa (Lindl.) Britton & Rose
JM2: Dudleya gnoma	Dudleya gnoma S.W. McCabe
JM1: Dudleya greenei	Dudleya greenei Rose
JM1: Dudleya hassei	Dudleya virens subsp. hassei (Rose) Moran
JM1: Dudleya lanceolata	Dudleya lanceolata (Nutt.) Britton & Rose
JM1: Dudleya multicaulis	Dudleya multicaulis (Rose) Moran
JM1: Dudleya nesiotica	Dudleya nesiotica (Moran) Moran
JM1: Dudleya palmeri	Dudleya palmeri (S. Watson) Britton & Rose
JM2: Dudleya parva	Dudleya parva Rose & Davidson
JM1: Dudleya pulverulenta	Dudleya pulverulenta (Nutt.) Britton & Rose; Dudleya arizonica Rose
JM1: Dudleya pulverulenta subsp. arizonica	Dudleya arizonica Rose
JM1: Dudleya pulverulenta subsp. pulverulenta	Dudleya pulverulenta (Nutt.) Britton & Rose
JM1: Dudleya saxosa	Dudleya saxosa (M.E. Jones) Britton & Rose
JM1: Dudleya saxosa subsp. aloides	Dudleya saxosa subsp. aloides (Rose) Moran
JM1: Dudleya saxosa subsp. saxosa	Dudleya saxosa (M.E. Jones) Britton & Rose subsp. saxosa
JM1: Dudleya setchellii	Dudleya abramsii subsp. setchellii (Jeps.) Morin
JM1: Dudleya stolonifera	Dudleya stolonifera Moran
JM1: Dudleya traskiae	Dudleya traskiae (Rose) Moran
JM1: Dudleya variegata	Dudleya variegata (S. Watson) Moran
JM1: Dudleya verityi	Dudleya verityi K.M. Nakai
JM1: Dudleya virens	Dudleya virens (Rose) Moran
JM2: Dudleya virens subsp. hassei	Dudleya virens subsp. hassei (Rose) Moran
JM2: Dudleya virens subsp. insularis	Dudleya virens subsp. insularis (Rose) Moran
JM2: Dudleya virens subsp. virens	Dudleya virens (Rose) Moran subsp. virens
JM1: Dudleya viscida	Dudleya viscida (S. Watson) Moran
JMS: Dugaldia grandiflora	Helenium bolanderi A. Gray
JM1: Dugaldia hoopesii	Hymenoxys hoopesii (A. Gray) Bierner
JM1: Dulichium arundinaceum	Dulichium arundinaceum (L.) Britton
JM2: Dulichium arundinaceum var. arundinaceum	Dulichium arundinaceum (L.) Britton var. arundinaceum
JM2: Dysphania ambrosioides	Dysphania ambrosioides (L.) Mosyakin & Clemants
JM2: Dysphania anthelmintica	Dysphania anthelmintica (L.) Mosyakin & Clemants
JM2: Dysphania botrys	Dysphania botrys (L.) Mosyakin & Clemants
JM2: Dysphania chilensis	Dysphania chilensis (Schrad.) Mosyakin & Clemants
JM2: Dysphania multifida	Dysphania multifida (L.) Mosyakin & Clemants
JM2: Dysphania pumilio	Dysphania pumilio (R. Br.) Mosyakin & Clemants
JM1: Dyssodia papposa	Dyssodia papposa (Vent.) Hitchc.
JM1: Eastwoodia elegans	Eastwoodia elegans Brandegee
JMS: Eatonella congdonii	Monolopia congdonii (A. Gray) B.G. Baldwin
JM1: Eatonella nivea	Eatonella nivea (D.C. Eaton) A. Gray
JMS: Echinocactus cylindraceus	Ferocactus cylindraceus (Engelm.) Orcutt
JMS: Echinocactus johnsonii	Sclerocactus johnsonii (Engelm.) N.P. Taylor
JMS: Echinocactus polyancistrus	Sclerocactus polyancistrus (Engelm. & J.M. Bigelow) Britton & Rose
JM2: Echinocactus polycephalus	Echinocactus polycephalus Engelm. & J.M. Bigelow
JM1: Echinocactus polycephalus var. polycephalus	Echinocactus polycephalus Engelm. & J.M. Bigelow var. polycephalus
JM1: Echinocereus engelmannii	Echinocereus engelmannii (Engelm.) Lem.
JM2: Echinocereus mojavensis	Echinocereus mojavensis (Engelm. & J.M. Bigelow) R&uuml;mpler
JMS: Echinocereus munzii	Echinocereus engelmannii (Engelm.) Lem.
JM1: Echinocereus triglochidiatus	Echinocereus mojavensis (Engelm. & J.M. Bigelow) R&uuml;mpler
JMS: Echinocereus triglochidiatus var. mojavensis	Echinocereus mojavensis (Engelm. & J.M. Bigelow) R&uuml;mpler
JM1: Echinochloa colona	Echinochloa colona (L.) Link
JMS: Echinochloa colonum	Echinochloa colona (L.) Link
JM1: Echinochloa crus-galli	Echinochloa crus-galli (L.) P. Beauv.
JMS: Echinochloa crus-galli subsp. spiralis	Echinochloa crus-galli (L.) P. Beauv.
JMS: Echinochloa crus-galli var. zelayensis	Echinochloa crus-galli (L.) P. Beauv.
JM1: Echinochloa crus-pavonis	Echinochloa crus-pavonis (Kunth) Schult. var. crus-pavonis
JM2: Echinochloa esculenta	Echinochloa esculenta (A. Braun) H. Scholz
JMS: Echinochloa frumentacea	Echinochloa esculenta (A. Braun) H. Scholz
JM1: Echinochloa muricata	Echinochloa muricata (P. Beauv.) Fernald var. microstachya Wiegand
JM2: Echinochloa muricata var. microstachya	Echinochloa muricata (P. Beauv.) Fernald var. microstachya Wiegand
JM2: Echinochloa oryzicola	Echinochloa oryzicola (Vasinger) Vasinger
JM1: Echinochloa oryzoides	Echinochloa oryzoides (Ard.) Fritsch
JMS: Echinochloa phyllopogon	Echinochloa oryzoides (Ard.) Fritsch
JM1: Echinodorus berteroi	Echinodorus berteroi (Spreng.) Fassett
JMS: Echinodorus berteroi var. lanceolatus	Echinodorus berteroi (Spreng.) Fassett
JMS: Echinomastus johnsonii	Sclerocactus johnsonii (Engelm.) N.P. Taylor
JM1: Echinops sphaerocephalus	Echinops sphaerocephalus L.
JM1: Echium candicans	Echium candicans L. f.
JM2: Echium pininana	Echium pininana Webb & Berthel.
JM1: Echium plantagineum	Echium plantagineum L.
JM1: Eclipta prostrata	Eclipta prostrata (L.) L.
JMS: Ectosperma alexandrae	Swallenia alexandrae (Swallen) Soderstr. & H.F. Decker
JMS: Edwinia californica	Jamesia americana Torr. & A. Gray var. rosea C.K. Schneid.
JM1: Egeria densa	Egeria densa Planch.
JM2: Ehrendorferia chrysantha	Ehrendorferia chrysantha (Hook. & Arn.) Rylander
JM2: Ehrendorferia ochroleuca	Ehrendorferia ochroleuca (Engelm.) Fukuhara
JM1: Ehrharta calycina	Ehrharta calycina Sm.
JM1: Ehrharta erecta	Ehrharta erecta Lam.
JM2: Ehrharta longiflora	Ehrharta longiflora Sm.
JM1: Eichhornia crassipes	Eichhornia crassipes (Mart.) Solms
JM2: Elaeagnus angustifolia	Elaeagnus angustifolia L.
JM1: Elaeagnus angustifolius	Elaeagnus angustifolia L.
JMS: Elaterium bigelovii	Brandegea bigelovii (S. Watson) Cogn.
JM1: Elatine ambigua	Elatine ambigua Wight
JM1: Elatine brachysperma	Elatine brachysperma A. Gray
JM1: Elatine californica	Elatine californica A. Gray
JM1: Elatine chilensis	Elatine chilensis Gay
JMS: Elatine gracilis	Elatine chilensis Gay
JM1: Elatine heterandra	Elatine heterandra H. Mason
JM1: Elatine rubella	Elatine rubella Rydb.
JM1: Eleocharis acicularis	Eleocharis acicularis (L.) Roem. & Schult.; Eleocharis bella (Piper) Svenson
JM1: Eleocharis acicularis var. acicularis	Eleocharis acicularis (L.) Roem. & Schult. var. acicularis
JM1: Eleocharis acicularis var. bella	Eleocharis bella (Piper) Svenson
JM2: Eleocharis acicularis var. gracilescens	Eleocharis acicularis var. gracilescens Svenson
JM2: Eleocharis acicularis var. occidentalis	Eleocharis acicularis var. occidentalis Svenson
JM1: Eleocharis atropurpurea	Eleocharis atropurpurea (Retz.) J. Presl & C. Presl
JM2: Eleocharis bella	Eleocharis bella (Piper) Svenson
JM2: Eleocharis bernardina	Eleocharis bernardina (Munz & I.M. Johnst.) Munz & I.M. Johnst.
JM1: Eleocharis bolanderi	Eleocharis bolanderi A. Gray
JM2: Eleocharis coloradoensis	Eleocharis coloradoensis (Britton) Gilly
JM2: Eleocharis decumbens	Eleocharis decumbens C.B. Clarke
JM2: Eleocharis engelmannii	Eleocharis engelmannii Steud.
JM2: Eleocharis engelmannii var. detonsa	Eleocharis engelmannii var. detonsa A. Gray
JM2: Eleocharis engelmannii var. engelmannii	Eleocharis engelmannii Steud. var. engelmannii
JM2: Eleocharis flavescens	Eleocharis flavescens (Poir.) Urb.
JM2: Eleocharis flavescens var. flavescens	Eleocharis flavescens (Poir.) Urb. var. flavescens
JM1: Eleocharis geniculata	Eleocharis geniculata (L.) Roem. & Schult.
JM1: Eleocharis macrostachya	Eleocharis macrostachya Britton
JM1: Eleocharis montevidensis	Eleocharis montevidensis Kunth
JM1: Eleocharis obtusa	Eleocharis obtusa (Willd.) Schult.; Eleocharis engelmannii Steud.
JM1: Eleocharis obtusa var. engelmannii	Eleocharis engelmannii Steud.
JM1: Eleocharis obtusa var. obtusa	Eleocharis obtusa (Willd.) Schult.
JM2: Eleocharis ovata	Eleocharis ovata (Roth) Roem. & Schult.
JM1: Eleocharis pachycarpa	Eleocharis pachycarpa E. Desv.
JM2: Eleocharis palustris	Eleocharis palustris (L.) Roem. & Schult.
JM1: Eleocharis parishii	Eleocharis parishii Britton
JM1: Eleocharis parvula	Eleocharis parvula (Roem. & Schult.) Bluff et al.
JM1: Eleocharis pauciflora	Eleocharis quinqueflora (Hartmann) O. Schwarz
JM1: Eleocharis quadrangulata	Eleocharis quadrangulata (Michx.) Roem. & Schult.
JM2: Eleocharis quinqueflora	Eleocharis quinqueflora (Hartmann) O. Schwarz
JM1: Eleocharis radicans	Eleocharis radicans (Poir.) Kunth
JM1: Eleocharis rostellata	Eleocharis rostellata (Torr.) Torr.
JM2: Eleocharis suksdorfiana	Eleocharis suksdorfiana Beauverd
JM2: Eleocharis tenuis	Eleocharis tenuis (Willd.) Schult.
JM2: Eleocharis tenuis var. tenuis	Eleocharis tenuis (Willd.) Schult. var. tenuis
JM1: Eleocharis thermalis	Eleocharis flavescens (Poir.) Urb. var. flavescens
JM2: Eleocharis torticulmis	Eleocharis torticulmis S.G. Sm.
JM2: Eleusine coracana	Eleusine coracana (L.) Gaertn.
JM2: Eleusine coracana subsp. africana	Eleusine coracana (L.) Gaertn. subsp. africana (Kenn.-O'Byrne) Hilu & de Wet
JM1: Eleusine indica	Eleusine indica (L.) Gaertn.
JMS: Eleusine indica subsp. africana	Eleusine coracana (L.) Gaertn. subsp. africana (Kenn.-O'Byrne) Hilu & de Wet
JM1: Eleusine tristachya	Eleusine tristachya (Lam.) Lam.
JM2: Elodea bifoliata	Elodea bifoliata H. St. John
JM1: Elodea canadensis	Elodea canadensis Michx.
JMS: Elodea longivaginata	Elodea bifoliata H. St. John
JMS: Elodea nevadensis	Elodea bifoliata H. St. John
JM1: Elodea nuttallii	Elodea nuttallii (Planch.) H. St. John
JM2: Elymus &times;gouldii	Elymus &times;gouldii J.P. Sm. & Columbus
JM2: Elymus &times;vancouverensis	Elymus &times;vancouverensis Vasey
JM1: Elymus arizonicus	excluded
JM1: Elymus californicus	Elymus californicus (Thurb.) Gould
JM1: Elymus canadensis	excluded
JM2: Elymus caput-medusae	Elymus caput-medusae L.
JM2: Elymus cinereus	Elymus cinereus Scribn. & Merr.
JM2: Elymus condensatus	Elymus condensatus J. Presl
JMS: Elymus elongatus	Elymus ponticus (Podp.) N. Snow
JMS: Elymus elongatus var. ponticus	Elymus ponticus (Podp.) N. Snow
JM1: Elymus elymoides	Elymus elymoides (Raf.) Swezey
JM1: Elymus elymoides subsp. brevifolius	Elymus elymoides var. brevifolius (J.G. Sm.) Dorn
JM1: Elymus elymoides subsp. californicus	Elymus elymoides var. californicus (J.G. Sm.) J.P. Sm.
JM1: Elymus elymoides subsp. elymoides	Elymus elymoides (Raf.) Swezey var. elymoides
JM1: Elymus elymoides subsp. hordeoides	excluded
JM2: Elymus elymoides var. brevifolius	Elymus elymoides var. brevifolius (J.G. Sm.) Dorn
JM2: Elymus elymoides var. californicus	Elymus elymoides var. californicus (J.G. Sm.) J.P. Sm.
JM2: Elymus elymoides var. elymoides	Elymus elymoides (Raf.) Swezey var. elymoides
JM1: Elymus glaucus	Elymus glaucus Buckley
JM1: Elymus glaucus subsp. glaucus	Elymus glaucus Buckley subsp. glaucus
JM1: Elymus glaucus subsp. jepsonii	Elymus glaucus Buckley subsp. glaucus
JM1: Elymus glaucus subsp. virescens	Elymus glaucus subsp. virescens (Piper) Gould
JM2: Elymus hispidus	Elymus hispidus (Opiz) Melderis
JM2: Elymus lanceolatus	Elymus lanceolatus (Scribn. & J.G. Sm.) Gould
JM1: Elymus lanceolatus subsp. lanceolatus	Elymus lanceolatus (Scribn. & J.G. Sm.) Gould subsp. lanceolatus
JMS: Elymus lanceolatus subsp. riparius	Elymus lanceolatus (Scribn. & J.G. Sm.) Gould subsp. lanceolatus
JM2: Elymus mollis	Elymus mollis Trin.
JM2: Elymus mollis subsp. mollis	Elymus mollis Trin. subsp. mollis
JM1: Elymus multisetus	Elymus multisetus (J.G. Sm.) Burtt Davy
JM2: Elymus pacificus	Elymus pacificus Gould
JM2: Elymus ponticus	Elymus ponticus (Podp.) N. Snow
JM2: Elymus repens	Elymus repens (L.) Gould
JM2: Elymus salina	Elymus salina M.E. Jones
JM1: Elymus scribneri	Elymus scribneri (Vasey) M.E. Jones
JM2: Elymus sierrae	Elymus sierrae Gould
JM1: Elymus sierrus	Elymus sierrae Gould
JM2: Elymus smithii	Elymus smithii (Rydb.) Gould
JM2: Elymus spicatus	Elymus spicatus (Pursh) Gould
JM1: Elymus stebbinsii	Elymus stebbinsii Gould
JM1: Elymus trachycaulus	Elymus trachycaulus (Link) Shinners
JM1: Elymus trachycaulus subsp. subsecundus	Elymus trachycaulus (Link) Shinners subsp. trachycaulus
JM1: Elymus trachycaulus subsp. trachycaulus	Elymus trachycaulus (Link) Shinners subsp. trachycaulus
JM2: Elymus triticoides	Elymus triticoides Buckley
JM1: Elytrigia elongata	Elymus ponticus (Podp.) N. Snow
JMS: Elytrigia intermedia	Elymus hispidus (Opiz) Melderis
JM1: Elytrigia intermedia subsp. intermedia	Elymus hispidus (Opiz) Melderis
JMS: Elytrigia intermedia var. intermedia	Elymus hispidus (Opiz) Melderis
JM1: Elytrigia juncea subsp. boreali-atlantica	excluded
JMS: Elytrigia pontica	Elymus ponticus (Podp.) N. Snow
JM1: Elytrigia pontica subsp. pontica	Elymus ponticus (Podp.) N. Snow
JM1: Elytrigia repens	Elymus repens (L.) Gould
JM1: Emex australis	Emex australis Steinh.
JM1: Emex spinosa	Emex spinosa (L.) Campd.
JM1: Emmenanthe penduliflora	Emmenanthe penduliflora Benth.
JM1: Emmenanthe penduliflora var. penduliflora	Emmenanthe penduliflora Benth. var. penduliflora
JM1: Emmenanthe penduliflora var. rosea	Emmenanthe penduliflora var. rosea Brand
JM1: Empetrum nigrum	Empetrum nigrum L.
JM1: Encelia actoni	Encelia actoni Elmer
JM1: Encelia californica	Encelia californica Nutt.
JM1: Encelia farinosa	Encelia farinosa Torr.
JM1: Encelia frutescens	Encelia frutescens (A. Gray) A. Gray
JM1: Encelia virginensis	Encelia virginensis A. Nelson
JM1: Enceliopsis covillei	Enceliopsis covillei (A. Nelson) S.F. Blake
JM1: Enceliopsis nudicaulis	Enceliopsis nudicaulis (A. Gray) A. Nelson
JMS: Enceliopsis nudicaulis var. corrugata	Enceliopsis nudicaulis (A. Gray) A. Nelson
JMS: Endolepis covillei	Atriplex covillei (Standl.) J.F. Macbr.
JM2: Enemion occidentale	Enemion occidentale (Hook. & Arn.) J.R. Drumm. & Hutch.
JM2: Enemion stipitatum	Enemion stipitatum (A. Gray) J.R. Drumm. & Hutch.
JM1: Enneapogon desvauxii	Enneapogon desvauxii P. Beauv.
JM1: Ephedra aspera	Ephedra aspera S. Watson
JM1: Ephedra californica	Ephedra californica S. Watson
JMS: Ephedra distachya	Ephedra foeminea Forssk.
JM1: Ephedra fasciculata	Ephedra aspera S. Watson
JM1: Ephedra fasciculata var. clokeyi	Ephedra aspera S. Watson
JM1: Ephedra fasciculata var. fasciculata	Ephedra aspera S. Watson
JM2: Ephedra foeminea	Ephedra foeminea Forssk.
JM1: Ephedra funerea	Ephedra funerea Coville & C.V. Morton
JM1: Ephedra nevadensis	Ephedra nevadensis S. Watson
JM1: Ephedra trifurca	Ephedra trifurca S. Watson
JM1: Ephedra viridis	Ephedra viridis Coville
JMS: Epilobium adenocaulon	Epilobium ciliatum Raf.; Epilobium ciliatum Raf. subsp. ciliatum
JMS: Epilobium adenocaulon var. holosericeum	Epilobium ciliatum Raf. subsp. ciliatum
JMS: Epilobium adenocaulon var. occidentale	Epilobium ciliatum Raf. subsp. ciliatum
JMS: Epilobium adenocaulon var. parishii	Epilobium ciliatum Raf. subsp. ciliatum
JM1: Epilobium anagallidifolium	Epilobium anagallidifolium Lam.
JMS: Epilobium angustifolium	Chamerion angustifolium (L.) Holub
JM1: Epilobium angustifolium subsp. circumvagum	Chamerion angustifolium (L.) Holub subsp. circumvagum (Mosquin) Hoch
JM1: Epilobium brachycarpum	Epilobium brachycarpum C. Presl
JMS: Epilobium brevistylum	Epilobium ciliatum Raf.; Epilobium hallianum Hausskn.
JMS: Epilobium brevistylum var. brevistylum	Epilobium ciliatum subsp. glandulosum (Lehm.) Hoch & P.H. Raven
JMS: Epilobium brevistylum var. ursinum	Epilobium hallianum Hausskn.
JM2: Epilobium campestre	Epilobium campestre (Jeps.) Hoch & W.L. Wagner
JM1: Epilobium canum	Epilobium canum (Greene) P.H. Raven; Epilobium septentrionale (D.D. Keck) R.N. Bowman & Hoch
JM1: Epilobium canum subsp. canum	Epilobium canum (Greene) P.H. Raven subsp. canum
JM2: Epilobium canum subsp. garrettii	Epilobium canum subsp. garrettii (A. Nelson) P.H. Raven
JM1: Epilobium canum subsp. latifolium	Epilobium canum subsp. latifolium (Hook.) P.H. Raven
JMS: Epilobium canum subsp. septentrionale	Epilobium septentrionale (D.D. Keck) R.N. Bowman & Hoch
JM1: Epilobium ciliatum	Epilobium ciliatum Raf.
JM1: Epilobium ciliatum subsp. ciliatum	Epilobium ciliatum Raf. subsp. ciliatum
JM1: Epilobium ciliatum subsp. glandulosum	Epilobium ciliatum subsp. glandulosum (Lehm.) Hoch & P.H. Raven
JM1: Epilobium ciliatum subsp. watsonii	Epilobium ciliatum subsp. watsonii (Barbey) Hoch & P.H. Raven
JM1: Epilobium clavatum	Epilobium clavatum Trel.
JM1: Epilobium cleistogamum	Epilobium cleistogamum (Curran) Hoch & P.H. Raven
JM1: Epilobium densiflorum	Epilobium densiflorum (Lindl.) Hoch & P.H. Raven
JMS: Epilobium drummondii	Epilobium saximontanum Hausskn.
JMS: Epilobium exaltatum	Epilobium oreganum Greene
JM1: Epilobium foliosum	Epilobium foliosum (Torr. & A. Gray) Suksd.
JM1: Epilobium glaberrimum	Epilobium glaberrimum Barbey
JM1: Epilobium glaberrimum subsp. fastigiatum	Epilobium glaberrimum subsp. fastigiatum (Nutt.) Hoch & P.H. Raven
JM1: Epilobium glaberrimum subsp. glaberrimum	Epilobium glaberrimum Barbey subsp. glaberrimum
JMS: Epilobium glaberrimum var. fastigiatum	Epilobium glaberrimum subsp. fastigiatum (Nutt.) Hoch & P.H. Raven
JMS: Epilobium glandulosum	Epilobium ciliatum subsp. glandulosum (Lehm.) Hoch & P.H. Raven
JM1: Epilobium halleanum	Epilobium hallianum Hausskn.
JM2: Epilobium hallianum	Epilobium hallianum Hausskn.
JM2: Epilobium hornemannii	Epilobium hornemannii Reichb.
JM1: Epilobium hornemannii subsp. hornemannii	Epilobium hornemannii Reichb. subsp. hornemannii
JM1: Epilobium howellii	Epilobium howellii Hoch
JM1: Epilobium lactiflorum	Epilobium lactiflorum Hausskn.
JM1: Epilobium latifolium	Chamerion latifolium (L.) Holub
JM1: Epilobium leptophyllum	Epilobium leptophyllum Raf.
JM1: Epilobium luteum	Epilobium luteum Pursh
JM1: Epilobium minutum	Epilobium minutum Lindl.
JM1: Epilobium nivium	Epilobium nivium Brandegee
JM1: Epilobium obcordatum	Epilobium obcordatum A. Gray
JMS: Epilobium obcordatum subsp. siskiyouense	Epilobium siskiyouense (Munz) Hoch & P.H. Raven
JMS: Epilobium obcordatum var. laxum	Epilobium siskiyouense (Munz) Hoch & P.H. Raven
JM1: Epilobium oreganum	Epilobium oreganum Greene
JM1: Epilobium oregonense	Epilobium oregonense Hausskn.
JM1: Epilobium pallidum	Epilobium pallidum (Eastw.) Hoch & P.H. Raven
JM1: Epilobium palustre	Epilobium palustre L.
JMS: Epilobium paniculatum	Epilobium brachycarpum C. Presl
JMS: Epilobium paniculatum var. jucundum	Epilobium brachycarpum C. Presl
JMS: Epilobium paniculatum var. laevicaule	Epilobium brachycarpum C. Presl
JMS: Epilobium paniculatum var. tracyi	Epilobium brachycarpum C. Presl
JMS: Epilobium pringleanum	Epilobium hallianum Hausskn.
JMS: Epilobium pringleanum var. tenue	Epilobium hallianum Hausskn.
JM1: Epilobium pygmaeum	Epilobium campestre (Jeps.) Hoch & W.L. Wagner
JM1: Epilobium rigidum	Epilobium rigidum Hausskn.
JM1: Epilobium saximontanum	Epilobium saximontanum Hausskn.
JM1: Epilobium septentrionale	Epilobium septentrionale (D.D. Keck) R.N. Bowman & Hoch
JM1: Epilobium siskiyouense	Epilobium siskiyouense (Munz) Hoch & P.H. Raven
JM1: Epilobium torreyi	Epilobium torreyi (S. Watson) Hoch & P.H. Raven
JMS: Epilobium watsonii	Epilobium ciliatum subsp. watsonii (Barbey) Hoch & P.H. Raven
JMS: Epilobium watsonii var. franciscanum	Epilobium ciliatum subsp. watsonii (Barbey) Hoch & P.H. Raven
JM1: Epipactis gigantea	Epipactis gigantea Hook.
JMS: Epipactis gigantea f. rubrifolia	Epipactis gigantea Hook.
JM1: Epipactis helleborine	Epipactis helleborine (L.) Crantz
JM2: Equisetum &times;ferrissii	Equisetum &times;ferrissii Clute
JM1: Equisetum arvense	Equisetum arvense L.
JMS: Equisetum funstonii	Equisetum laevigatum A. Braun
JM2: Equisetum hyemale	Equisetum hyemale L.
JM1: Equisetum hyemale subsp. affine	Equisetum hyemale L. subsp. affine (Engelm.) Calder & Roy L. Taylor
JM1: Equisetum laevigatum	Equisetum laevigatum A. Braun
JM1: Equisetum palustre	Equisetum palustre L.
JM2: Equisetum telmateia	Equisetum telmateia Ehrh.
JM1: Equisetum telmateia subsp. braunii	Equisetum telmateia Ehrh. subsp. braunii (J. Milde) Hauke
JMS: Eragrostis arida	Eragrostis pectinacea var. miserrima (E. Fourn.) Reeder
JM1: Eragrostis barrelieri	Eragrostis barrelieri Daveau
JM1: Eragrostis cilianensis	Eragrostis cilianensis (All.) Janch.
JM2: Eragrostis curvula	Eragrostis curvula (Schrad.) Nees
JM1: Eragrostis curvula var. curvula	Eragrostis curvula (Schrad.) Nees
JMS: Eragrostis diffusa	Eragrostis pectinacea (Michx.) Nees var. pectinacea
JMS: Eragrostis fendleriana	Poa fendleriana (Steud.) Vasey
JM2: Eragrostis hypnoides	Eragrostis hypnoides (Lam.) Britton et al.
JM1: Eragrostis lehmanniana	Eragrostis lehmanniana Nees
JM1: Eragrostis lutescens	Eragrostis lutescens Scribn.
JMS: Eragrostis megastachya	Eragrostis cilianensis (All.) Janch.
JM1: Eragrostis mexicana	Eragrostis mexicana (Hornem.) Link
JM1: Eragrostis mexicana subsp. mexicana	Eragrostis mexicana (Hornem.) Link subsp. mexicana
JM1: Eragrostis mexicana subsp. virescens	Eragrostis mexicana subsp. virescens (J. Presl) S.D. Koch & S&aacute;nchez Vega
JM1: Eragrostis minor	Eragrostis minor Host
JMS: Eragrostis neomexicana	Eragrostis mexicana (Hornem.) Link subsp. mexicana
JMS: Eragrostis orcuttiana	Eragrostis mexicana subsp. virescens (J. Presl) S.D. Koch & S&aacute;nchez Vega
JM1: Eragrostis pectinacea	Eragrostis pectinacea (Michx.) Nees
JM1: Eragrostis pectinacea var. miserrima	Eragrostis pectinacea var. miserrima (E. Fourn.) Reeder
JM1: Eragrostis pectinacea var. pectinacea	Eragrostis pectinacea (Michx.) Nees var. pectinacea
JM2: Eragrostis pilosa	Eragrostis pilosa (L.) P. Beauv.
JM1: Eragrostis pilosa var. pilosa	Eragrostis pilosa (L.) P. Beauv. var. pilosa
JMS: Eragrostis tephrosanthos	Eragrostis pectinacea var. miserrima (E. Fourn.) Reeder
JM1: Erechtites glomerata	Senecio glomeratus Poir.
JMS: Erechtites glomeratus	Senecio glomeratus Poir.
JMS: Erechtites hieracifolia	excluded
JM1: Erechtites hieracifolia var. hieracifolia	excluded
JM1: Erechtites minima	Senecio minimus Poir.
JMS: Erechtites minimus	Senecio minimus Poir.
JMS: Erechtites quadridentata	Senecio quadridentatus Labill.
JM1: Eremalche exilis	Eremalche exilis (A. Gray) Greene
JM1: Eremalche parryi	Eremalche parryi (Greene) Greene
JM1: Eremalche parryi subsp. kernensis	Eremalche parryi subsp. kernensis (C.B. Wolf) D.M. Bates
JM1: Eremalche parryi subsp. parryi	Eremalche parryi (Greene) Greene subsp. parryi
JM1: Eremalche rotundifolia	Eremalche rotundifolia (A. Gray) Greene
JM1: Eremocarpus setigerus	Croton setiger Hook.
JM2: Eremogone aculeata	Eremogone aculeata (S. Watson) Ikonn.
JM2: Eremogone cliftonii	Eremogone cliftonii Rabeler & R.L. Hartm.
JM2: Eremogone congesta	Eremogone congesta (Nutt.) Ikonn.
JM2: Eremogone congesta var. charlestonensis	Eremogone congesta var. charlestonensis (Maguire) R.L. Hartm. & Rabeler
JM2: Eremogone congesta var. congesta	Eremogone congesta (Nutt.) Ikonn. var. congesta
JM2: Eremogone congesta var. crassula	Eremogone congesta var. crassula (Maguire) R.L. Hartm. & Rabeler
JM2: Eremogone congesta var. simulans	Eremogone congesta var. simulans (Maguire) R.L. Hartm. & Rabeler
JM2: Eremogone congesta var. subcongesta	Eremogone congesta var. subcongesta (S. Watson) R.L. Hartm. & Rabeler
JM2: Eremogone congesta var. suffrutescens	Eremogone congesta var. suffrutescens (A. Gray) R.L. Hartm. & Rabeler
JM2: Eremogone ferrisiae	Eremogone ferrisiae (Abrams) R.L. Hartm. & Rabeler
JM2: Eremogone kingii	Eremogone kingii (S. Watson) Ikonn.
JM2: Eremogone kingii var. glabrescens	Eremogone kingii (S. Watson) Ikonn. var. glabrescens (S. Watson) Dorn
JM2: Eremogone macradenia	Eremogone macradenia (S. Watson) Ikonn.; Eremogone ferrisiae (Abrams) R.L. Hartm. & Rabeler
JM2: Eremogone macradenia var. arcuifolia	Eremogone macradenia var. arcuifolia (Maguire) R.L. Hartm. & Rabeler
JMS: Eremogone macradenia var. ferrisiae	Eremogone ferrisiae (Abrams) R.L. Hartm. & Rabeler
JM2: Eremogone macradenia var. macradenia	Eremogone macradenia (S. Watson) Ikonn. var. macradenia
JM2: Eremogone ursina	Eremogone ursina (B.L. Rob.) Ikonn.
JM2: Eremothera boothii	Eremothera boothii (Douglas) W.L. Wagner & Hoch
JM2: Eremothera boothii subsp. alyssoides	Eremothera boothii subsp. alyssoides (Hook. & Arn.) W.L. Wagner & Hoch
JM2: Eremothera boothii subsp. boothii	Eremothera boothii (Douglas) W.L. Wagner & Hoch subsp. boothii
JM2: Eremothera boothii subsp. condensata	Eremothera boothii subsp. condensata (Munz) W.L. Wagner & Hoch
JM2: Eremothera boothii subsp. decorticans	Eremothera boothii subsp. decorticans (Hook. & Arn.) W.L. Wagner & Hoch
JM2: Eremothera boothii subsp. desertorum	Eremothera boothii subsp. desertorum (Munz) W.L. Wagner & Hoch
JM2: Eremothera boothii subsp. intermedia	Eremothera boothii subsp. intermedia (Munz) W.L. Wagner & Hoch
JM2: Eremothera chamaenerioides	Eremothera chamaenerioides (A. Gray) W.L. Wagner & Hoch
JM2: Eremothera minor	Eremothera minor (A. Nelson) W.L. Wagner & Hoch
JM2: Eremothera refracta	Eremothera refracta (S. Watson) W.L. Wagner & Hoch
JMS: Erianthus ravennae	Saccharum ravennae (L.) L.
JM1: Eriastrum abramsii	Eriastrum abramsii (Elmer) H. Mason
JM1: Eriastrum brandegeae	Eriastrum brandegeeae H. Mason
JM2: Eriastrum brandegeeae	Eriastrum brandegeeae H. Mason
JM1: Eriastrum densifolium	Eriastrum densifolium (Benth.) H. Mason
JM1: Eriastrum densifolium subsp. austromontanum	Eriastrum densifolium subsp. austromontanum (T.T. Craig) H. Mason
JM1: Eriastrum densifolium subsp. densifolium	Eriastrum densifolium (Benth.) H. Mason subsp. densifolium
JM1: Eriastrum densifolium subsp. elongatum	Eriastrum densifolium subsp. elongatum (Benth.) H. Mason
JM1: Eriastrum densifolium subsp. mohavense	Eriastrum densifolium subsp. mohavense (T.T. Craig) H. Mason
JM1: Eriastrum densifolium subsp. sanctorum	Eriastrum densifolium subsp. sanctorum (Milliken) H. Mason
JM1: Eriastrum diffusum	Eriastrum diffusum (A. Gray) H. Mason
JM2: Eriastrum eremicum	Eriastrum eremicum (Jeps.) H. Mason
JM1: Eriastrum eremicum subsp. eremicum	Eriastrum eremicum (Jeps.) H. Mason subsp. eremicum
JM1: Eriastrum filifolium	Eriastrum filifolium (Nutt.) Wooton & Standl.
JM2: Eriastrum harwoodii	Eriastrum harwoodii (T.T. Craig) D. Gowen
JM1: Eriastrum hooveri	Eriastrum hooveri (Jeps.) H. Mason
JM1: Eriastrum luteum	Eriastrum luteum (Benth.) H. Mason
JM1: Eriastrum pluriflorum	Eriastrum pluriflorum (A. Heller) H. Mason
JM2: Eriastrum pluriflorum subsp. pluriflorum	Eriastrum pluriflorum (A. Heller) H. Mason subsp. pluriflorum
JM2: Eriastrum pluriflorum subsp. sherman-hoytiae	Eriastrum pluriflorum subsp. sherman-hoytiae (T.T. Craig) H. Mason
JM1: Eriastrum sapphirinum	Eriastrum sapphirinum (Eastw.) H. Mason
JMS: Eriastrum sapphirinum subsp. ambiguum	Eriastrum sapphirinum (Eastw.) H. Mason subsp. sapphirinum
JM2: Eriastrum sapphirinum subsp. dasyanthum	Eriastrum sapphirinum subsp. dasyanthum (Brand) H. Mason
JMS: Eriastrum sapphirinum subsp. gymnocephalum	Eriastrum sapphirinum (Eastw.) H. Mason subsp. sapphirinum
JM2: Eriastrum sapphirinum subsp. sapphirinum	Eriastrum sapphirinum (Eastw.) H. Mason subsp. sapphirinum
JM2: Eriastrum signatum	Eriastrum signatum D. Gowen
JM1: Eriastrum sparsiflorum	Eriastrum sparsiflorum (Eastw.) H. Mason
JMS: Eriastrum sparsiflorum subsp. harwoodii	Eriastrum harwoodii (T.T. Craig) D. Gowen
JM2: Eriastrum tracyi	Eriastrum tracyi H. Mason
JM1: Eriastrum virgatum	Eriastrum virgatum (Benth.) H. Mason
JM1: Eriastrum wilcoxii	Eriastrum wilcoxii (A. Nelson) H. Mason
JM1: Erica lusitanica	Erica lusitanica Rudolphi
JM2: Ericameria albida	Ericameria albida (A. Gray) L.C. Anderson
JM1: Ericameria arborescens	Ericameria arborescens (A. Gray) Greene; Ericameria parishii (Greene) H.M. Hall
JMS: Ericameria arborescens subsp. parishii	Ericameria parishii (Greene) H.M. Hall var. parishii
JM1: Ericameria bloomeri	Ericameria bloomeri (A. Gray) J.F. Macbr.
JM1: Ericameria brachylepis	Ericameria brachylepis (A. Gray) H.M. Hall
JM2: Ericameria cooperi	Ericameria cooperi (A. Gray) H.M. Hall
JM1: Ericameria cooperi var. cooperi	Ericameria cooperi (A. Gray) H.M. Hall var. cooperi
JM1: Ericameria cuneata	Ericameria cuneata (A. Gray) McClatchie
JM1: Ericameria cuneata var. cuneata	Ericameria cuneata (A. Gray) McClatchie var. cuneata
JM1: Ericameria cuneata var. macrocephala	Ericameria cuneata var. macrocephala Urbatsch
JM1: Ericameria cuneata var. spathulata	Ericameria cuneata var. spathulata (A. Gray) H.M. Hall
JM1: Ericameria discoidea	Ericameria discoidea (Nutt.) G.L. Nesom
JM1: Ericameria ericoides	Ericameria ericoides (Less.) Jeps.
JM1: Ericameria fasciculata	Ericameria fasciculata (Eastw.) J.F. Macbr.
JM1: Ericameria gilmanii	Ericameria gilmanii (S.F. Blake) G.L. Nesom
JM1: Ericameria greenei	Ericameria greenei (A. Gray) G.L. Nesom
JM1: Ericameria laricifolia	Ericameria laricifolia (A. Gray) Shinners
JM1: Ericameria linearifolia	Ericameria linearifolia (DC.) Urbatsch & Wussow
JM1: Ericameria nana	Ericameria nana Nutt.
JM2: Ericameria nauseosa	Ericameria nauseosa (Pall.) G.L. Nesom & G.I. Baird
JM2: Ericameria nauseosa var. bernardina	Ericameria nauseosa var. bernardina (H.M. Hall) G.L. Nesom & G.I. Baird
JM2: Ericameria nauseosa var. ceruminosa	Ericameria nauseosa var. ceruminosa (Durand & Hilg.) G.L. Nesom & G.I. Baird
JM2: Ericameria nauseosa var. hololeuca	Ericameria nauseosa var. hololeuca (A. Gray) G.L. Nesom & G.I. Baird
JM2: Ericameria nauseosa var. leiosperma	Ericameria nauseosa var. leiosperma (A. Gray) G.L. Nesom & G.I. Baird
JM2: Ericameria nauseosa var. mohavensis	Ericameria nauseosa var. mohavensis (Greene) G.L. Nesom & G.I. Baird
JM2: Ericameria nauseosa var. oreophila	Ericameria nauseosa var. oreophila (A. Nelson) G.L. Nesom & G.I. Baird
JM2: Ericameria nauseosa var. speciosa	Ericameria nauseosa var. speciosa (Nutt.) G.L. Nesom & G.I. Baird
JM2: Ericameria nauseosa var. washoensis	Ericameria nauseosa var. washoensis (L.C. Anderson) G.L. Nesom & G.I. Baird
JM1: Ericameria ophitidis	Ericameria ophitidis (J.T. Howell) G.L. Nesom
JM1: Ericameria palmeri	Ericameria palmeri (A. Gray) H.M. Hall
JM1: Ericameria palmeri var. pachylepis	Ericameria palmeri var. pachylepis (H.M. Hall) G.L. Nesom
JM1: Ericameria palmeri var. palmeri	Ericameria palmeri (A. Gray) H.M. Hall var. palmeri
JM2: Ericameria paniculata	Ericameria paniculata (A. Gray) Rydb.
JM2: Ericameria parishii	Ericameria parishii (Greene) H.M. Hall
JM1: Ericameria parishii var. parishii	Ericameria parishii (Greene) H.M. Hall var. parishii
JM2: Ericameria parryi	Ericameria parryi (A. Gray) G.L. Nesom & G.I. Baird
JM2: Ericameria parryi var. aspera	Ericameria parryi var. aspera (Greene) G.L. Nesom & G.I. Baird
JM2: Ericameria parryi var. imula	Ericameria parryi var. imula (H.M. Hall & Clem.) G.L. Nesom & G.I. Baird
JM2: Ericameria parryi var. latior	Ericameria parryi var. latior (H.M. Hall & Clem.) G.L. Nesom & G.I. Baird
JM2: Ericameria parryi var. monocephala	Ericameria parryi var. monocephala (A. Nelson & P.B. Kenn.) G.L. Nesom & G.I. Baird
JM2: Ericameria parryi var. nevadensis	Ericameria parryi var. nevadensis (A. Gray) G.L. Nesom & G.I. Baird
JM2: Ericameria parryi var. vulcanica	Ericameria parryi var. vulcanica (Greene) G.L. Nesom & G.I. Baird
JM1: Ericameria pinifolia	Ericameria pinifolia (A. Gray) H.M. Hall
JM1: Ericameria suffruticosa	Ericameria suffruticosa (Nutt.) G.L. Nesom
JM2: Ericameria teretifolia	Ericameria teretifolia (Durand & Hilg.) Jeps.
JMS: Erigeron acris	Erigeron nivalis Nutt.
JMS: Erigeron acris var. debilis	Erigeron nivalis Nutt.
JM1: Erigeron aequifolius	Erigeron aequifolius H.M. Hall
JM1: Erigeron algidus	Erigeron algidus Jeps.
JM1: Erigeron aliceae	Erigeron aliceae Howell
JM1: Erigeron angustatus	Erigeron greenei G.L. Nesom
JM1: Erigeron annuus	Erigeron annuus (L.) Pers.
JM1: Erigeron aphanactis	Erigeron aphanactis (A. Gray) Greene
JM1: Erigeron aphanactis var. aphanactis	Erigeron aphanactis (A. Gray) Greene var. aphanactis
JM1: Erigeron aphanactis var. congestus	Erigeron aphanactis var. congestus (Greene) Cronquist
JM1: Erigeron argentatus	Erigeron argentatus A. Gray
JM1: Erigeron austiniae	Erigeron chrysopsidis A. Gray var. austiniae (Greene) G.L. Nesom
JM1: Erigeron barbellulatus	Erigeron barbellulatus Greene
JM1: Erigeron biolettii	Erigeron biolettii Greene
JM1: Erigeron blochmaniae	Erigeron blochmaniae Greene
JM1: Erigeron bloomeri	Erigeron bloomeri A. Gray
JM1: Erigeron bloomeri var. bloomeri	Erigeron bloomeri A. Gray var. bloomeri
JM1: Erigeron bloomeri var. nudatus	Erigeron bloomeri var. nudatus (A. Gray) Cronquist
JM2: Erigeron bonariensis	Erigeron bonariensis L.
JM1: Erigeron breweri	Erigeron breweri A. Gray; Erigeron klamathensis (G.L. Nesom) G.L. Nesom
JM1: Erigeron breweri var. bisanctus	Erigeron breweri var. bisanctus G.L. Nesom
JM1: Erigeron breweri var. breweri	Erigeron breweri A. Gray var. breweri
JM1: Erigeron breweri var. covillei	Erigeron breweri var. covillei (Greene) G.L. Nesom
JM1: Erigeron breweri var. jacinteus	Erigeron breweri var. jacinteus (H.M. Hall) Cronquist
JM1: Erigeron breweri var. klamathensis	Erigeron klamathensis (G.L. Nesom) G.L. Nesom
JM1: Erigeron breweri var. porphyreticus	Erigeron breweri var. porphyreticus (M.E. Jones) Cronquist
JM1: Erigeron calvus	Erigeron calvus Coville
JM2: Erigeron canadensis	Erigeron canadensis L.
JM1: Erigeron cervinus	Erigeron cervinus Greene
JM2: Erigeron chrysopsidis	Erigeron chrysopsidis A. Gray
JM2: Erigeron chrysopsidis var. austiniae	Erigeron chrysopsidis A. Gray var. austiniae (Greene) G.L. Nesom
JM1: Erigeron clokeyi	Erigeron clokeyi Cronquist var. pinzliae G.L. Nesom
JM2: Erigeron clokeyi var. pinzliae	Erigeron clokeyi Cronquist var. pinzliae G.L. Nesom
JM1: Erigeron compactus	Erigeron compactus S.F. Blake
JM1: Erigeron compositus	Erigeron compositus Pursh
JM1: Erigeron concinnus	Erigeron concinnus (Hook. & Arn.) Torr. & A. Gray
JM1: Erigeron concinnus var. concinnus	Erigeron concinnus (Hook. & Arn.) Torr. & A. Gray var. concinnus
JM1: Erigeron concinnus var. condensatus	excluded
JM1: Erigeron coulteri	Erigeron coulteri Porter
JMS: Erigeron debilis	Erigeron nivalis Nutt.
JMS: Erigeron decumbens	Erigeron robustior (Cronquist) G.L. Nesom
JM1: Erigeron decumbens var. robustior	Erigeron robustior (Cronquist) G.L. Nesom
JM1: Erigeron divergens	Erigeron divergens Torr. & A. Gray
JM1: Erigeron eatonii	Erigeron eatonii A. Gray
JM1: Erigeron eatonii var. nevadincola	Erigeron eatonii var. nevadincola (S.F. Blake) G.L. Nesom
JM1: Erigeron eatonii var. plantagineus	Erigeron eatonii var. plantagineus (Greene) Cronquist
JM1: Erigeron eatonii var. sonnei	Erigeron eatonii var. sonnei (Greene) G.L. Nesom
JM1: Erigeron elegantulus	Erigeron elegantulus Greene
JM1: Erigeron elmeri	Erigeron elmeri (Greene) Greene
JM2: Erigeron filifolius	Erigeron filifolius Nutt.
JM1: Erigeron filifolius var. filifolius	Erigeron filifolius Nutt.
JMS: Erigeron filifolius var. robustior	Erigeron filifolius Nutt.
JM2: Erigeron flagellaris	Erigeron flagellaris A. Gray
JM1: Erigeron foliosus	Erigeron foliosus Nutt.
JM1: Erigeron foliosus var. confinis	Erigeron foliosus var. confinis (Howell) Jeps.
JM1: Erigeron foliosus var. foliosus	Erigeron foliosus Nutt. var. foliosus
JM1: Erigeron foliosus var. franciscensis	Erigeron foliosus var. franciscensis G.L. Nesom
JM1: Erigeron foliosus var. hartwegii	Erigeron foliosus var. hartwegii (Greene) Jeps.
JM1: Erigeron foliosus var. mendocinus	Erigeron foliosus var. mendocinus (Greene) G.L. Nesom
JM2: Erigeron glacialis	Erigeron glacialis (Nutt.) A. Nelson
JM2: Erigeron glacialis var. glacialis	Erigeron glacialis (Nutt.) A. Nelson var. glacialis
JM2: Erigeron glacialis var. hirsutus	Erigeron glacialis var. hirsutus (Cronquist) G.L. Nesom
JM1: Erigeron glaucus	Erigeron glaucus Ker Gawl.
JM2: Erigeron greenei	Erigeron greenei G.L. Nesom
JM1: Erigeron inornatus	Erigeron inornatus (A. Gray) A. Gray
JM1: Erigeron inornatus var. calidipetris	Erigeron inornatus var. calidipetris G.L. Nesom
JM1: Erigeron inornatus var. inornatus	Erigeron inornatus (A. Gray) A. Gray var. inornatus
JM1: Erigeron inornatus var. keilii	Erigeron inornatus var. keilii G.L. Nesom
JM1: Erigeron karvinskianus	Erigeron karvinskianus DC.
JM2: Erigeron klamathensis	Erigeron klamathensis (G.L. Nesom) G.L. Nesom
JM1: Erigeron lassenianus	Erigeron lassenianus Greene
JM1: Erigeron lassenianus var. deficiens	Erigeron lassenianus var. deficiens Cronquist
JM1: Erigeron lassenianus var. lassenianus	Erigeron lassenianus Greene var. lassenianus
JM1: Erigeron linearis	Erigeron linearis (Hook.) Piper
JM1: Erigeron lobatus	Erigeron divergens Torr. & A. Gray
JM2: Erigeron lonchophyllus	Erigeron lonchophyllus Hook.
JM2: Erigeron maniopotamicus	Erigeron maniopotamicus G.L. Nesom & T.W. Nelson
JM1: Erigeron mariposanus	Erigeron mariposanus Congdon
JM1: Erigeron miser	Erigeron miser A. Gray
JM1: Erigeron multiceps	Erigeron multiceps Greene
JM2: Erigeron nivalis	Erigeron nivalis Nutt.
JM2: Erigeron oxyphyllus	Erigeron oxyphyllus Greene
JM1: Erigeron parishii	Erigeron parishii A. Gray
JM1: Erigeron peregrinus	Erigeron glacialis (Nutt.) A. Nelson
JMS: Erigeron peregrinus var. angustifolius	Erigeron glacialis (Nutt.) A. Nelson var. glacialis
JM1: Erigeron peregrinus var. callianthemus	Erigeron glacialis (Nutt.) A. Nelson var. glacialis
JM1: Erigeron peregrinus var. hirsutus	Erigeron glacialis var. hirsutus (Cronquist) G.L. Nesom
JM1: Erigeron petrophilus	Erigeron petrophilus Greene
JM1: Erigeron petrophilus var. petrophilus	Erigeron petrophilus Greene var. petrophilus
JM1: Erigeron petrophilus var. sierrensis	Erigeron petrophilus var. sierrensis G.L. Nesom
JM1: Erigeron petrophilus var. viscidulus	Erigeron petrophilus var. viscidulus (A. Gray) G.L. Nesom
JM1: Erigeron philadelphicus	Erigeron philadelphicus L.
JM2: Erigeron philadelphicus var. philadelphicus	Erigeron philadelphicus L. var. philadelphicus
JM2: Erigeron pumilus	Erigeron pumilus Nutt.
JMS: Erigeron pumilus var. gracilior	Erigeron pumilus Nutt. var. intermedius (Cronquist) S.L. Welsh
JM1: Erigeron pumilus var. intermedius	Erigeron pumilus Nutt. var. intermedius (Cronquist) S.L. Welsh
JM1: Erigeron pygmaeus	Erigeron pygmaeus (A. Gray) Greene
JM1: Erigeron reductus	Erigeron reductus (Cronquist) G.L. Nesom
JM1: Erigeron reductus var. angustatus	Erigeron reductus var. angustatus (A. Gray) G.L. Nesom
JM1: Erigeron reductus var. reductus	Erigeron reductus (Cronquist) G.L. Nesom var. reductus
JM2: Erigeron robustior	Erigeron robustior (Cronquist) G.L. Nesom
JM1: Erigeron sanctarum	Erigeron sanctarum S. Watson
JM1: Erigeron serpentinus	Erigeron serpentinus G.L. Nesom
JM1: Erigeron strigosus	Erigeron strigosus Willd.
JMS: Erigeron strigosus var. septentrionalis	Erigeron strigosus Willd. var. strigosus
JM2: Erigeron strigosus var. strigosus	Erigeron strigosus Willd. var. strigosus
JM2: Erigeron sumatrensis	Erigeron sumatrensis Retz.
JM1: Erigeron supplex	Erigeron supplex A. Gray
JM1: Erigeron tener	Erigeron tener (A. Gray) A. Gray
JM2: Erigeron uncialis	Erigeron uncialis S.F. Blake
JM1: Erigeron uncialis var. uncialis	Erigeron uncialis S.F. Blake var. uncialis
JM1: Erigeron utahensis	Erigeron utahensis A. Gray
JM1: Erigeron vagus	Erigeron vagus Payson
JM2: Eriobotrya japonica	Eriobotrya japonica (Thunb.) Lindl.
JM2: Eriochloa acuminata	Eriochloa acuminata (J. Presl) Kunth
JM1: Eriochloa acuminata var. acuminata	Eriochloa acuminata (J. Presl) Kunth var. acuminata
JM2: Eriochloa aristata	Eriochloa aristata Vasey
JM1: Eriochloa aristata var. aristata	Eriochloa aristata Vasey var. aristata
JM1: Eriochloa contracta	Eriochloa contracta Hitchc.
JMS: Eriochloa gracilis	Eriochloa acuminata (J. Presl) Kunth var. acuminata
JM1: Eriodictyon altissimum	Eriodictyon altissimum P.V. Wells
JM1: Eriodictyon angustifolium	Eriodictyon angustifolium Nutt.
JM1: Eriodictyon californicum	Eriodictyon californicum (Hook. & Arn.) Torr.
JM1: Eriodictyon capitatum	Eriodictyon capitatum Eastw.
JM1: Eriodictyon crassifolium	Eriodictyon crassifolium Benth.
JM1: Eriodictyon crassifolium var. crassifolium	Eriodictyon crassifolium Benth. var. crassifolium
JM1: Eriodictyon crassifolium var. nigrescens	Eriodictyon crassifolium var. nigrescens Brand
JM2: Eriodictyon lobbii	Eriodictyon lobbii (A. Gray) Greene
JM2: Eriodictyon parryi	Eriodictyon parryi (A. Gray) Greene
JM1: Eriodictyon tomentosum	Eriodictyon tomentosum Benth.
JM1: Eriodictyon traskiae	Eriodictyon traskiae Eastw.
JM2: Eriodictyon traskiae subsp. smithii	Eriodictyon traskiae subsp. smithii Munz
JM2: Eriodictyon traskiae subsp. traskiae	Eriodictyon traskiae Eastw. subsp. traskiae
JM1: Eriodictyon trichocalyx	Eriodictyon trichocalyx A. Heller
JM1: Eriodictyon trichocalyx var. lanatum	Eriodictyon trichocalyx var. lanatum (Brand) Jeps.
JM1: Eriodictyon trichocalyx var. trichocalyx	Eriodictyon trichocalyx A. Heller var. trichocalyx
JM1: Eriogonum alpinum	Eriogonum alpinum Engelm.
JM1: Eriogonum ampullaceum	Eriogonum ampullaceum J.T. Howell
JM1: Eriogonum angulosum	Eriogonum angulosum Benth.
JM1: Eriogonum apiculatum	Eriogonum apiculatum S. Watson
JM1: Eriogonum apricum	Eriogonum apricum J.T. Howell
JM1: Eriogonum apricum var. apricum	Eriogonum apricum var. apricum
JM1: Eriogonum apricum var. prostratum	Eriogonum apricum var. prostratum Myatt
JM1: Eriogonum arborescens	Eriogonum arborescens Greene
JM1: Eriogonum argillosum	Eriogonum argillosum J.T. Howell
JM1: Eriogonum baileyi	Eriogonum baileyi S. Watson
JM1: Eriogonum baileyi var. baileyi	Eriogonum baileyi var. baileyi
JM1: Eriogonum baileyi var. praebens	Eriogonum baileyi var. praebens (Gand.) Reveal
JM1: Eriogonum beatleyae	Eriogonum rosense A. Nelson & P.B. Kenn. var. rosense
JM1: Eriogonum bifurcatum	Eriogonum bifurcatum Reveal
JM1: Eriogonum brachyanthum	Eriogonum brachyanthum Coville
JM1: Eriogonum brachypodum	Eriogonum brachypodum Torr. & A. Gray
JM1: Eriogonum breedlovei	Eriogonum breedlovei (J.T. Howell) Reveal
JM1: Eriogonum breedlovei var. breedlovei	Eriogonum breedlovei var. breedlovei
JM1: Eriogonum breedlovei var. shevockii	Eriogonum breedlovei var. shevockii J.T. Howell
JM1: Eriogonum butterworthianum	Eriogonum butterworthianum J.T. Howell
JM2: Eriogonum caespitosum	Eriogonum caespitosum Nutt.
JM2: Eriogonum callistum	Eriogonum callistum Reveal
JM2: Eriogonum cedrorum	Eriogonum cedrorum Reveal & Raiche
JM1: Eriogonum cernuum	Eriogonum cernuum Nutt.
JM1: Eriogonum cernuum var. cernuum	Eriogonum cernuum Nutt.
JM1: Eriogonum cernuum var. viminale	Eriogonum cernuum Nutt.
JM1: Eriogonum cespitosum	Eriogonum caespitosum Nutt.
JM1: Eriogonum cinereum	Eriogonum cinereum Benth.
JM1: Eriogonum cithariforme	Eriogonum cithariforme S. Watson
JM2: Eriogonum cithariforme var. agninum	Eriogonum cithariforme var. agninum (Greene) Reveal
JM2: Eriogonum cithariforme var. cithariforme	Eriogonum cithariforme var. cithariforme
JM2: Eriogonum clavatum	Eriogonum clavatum Small
JM2: Eriogonum collinum	Eriogonum collinum M.E. Jones
JM2: Eriogonum compositum	Eriogonum compositum Benth.
JM1: Eriogonum compositum var. compositum	Eriogonum compositum Benth. var. compositum
JM1: Eriogonum congdonii	Eriogonum congdonii (S. Stokes) Reveal
JM1: Eriogonum contiguum	Eriogonum contiguum (Reveal) Reveal
JM1: Eriogonum covilleanum	Eriogonum covilleanum Eastw.
JM1: Eriogonum crocatum	Eriogonum crocatum Davidson
JM1: Eriogonum dasyanthemum	Eriogonum dasyanthemum Torr. & A. Gray
JM1: Eriogonum davidsonii	Eriogonum davidsonii Greene
JM1: Eriogonum deflexum	Eriogonum deflexum Torr.
JM1: Eriogonum deflexum var. baratum	Eriogonum deflexum var. baratum (Elmer) Reveal
JM1: Eriogonum deflexum var. deflexum	Eriogonum deflexum var. deflexum
JM1: Eriogonum deflexum var. nevadense	Eriogonum deflexum var. nevadense Reveal
JM1: Eriogonum deflexum var. rectum	Eriogonum deflexum var. deflexum
JM1: Eriogonum deserticola	Eriogonum deserticola S. Watson
JM1: Eriogonum diclinum	Eriogonum diclinum Reveal
JM2: Eriogonum douglasii	Eriogonum douglasii Benth.
JM1: Eriogonum douglasii var. douglasii	Eriogonum douglasii Benth. var. meridionale Reveal
JM2: Eriogonum douglasii var. meridionale	Eriogonum douglasii Benth. var. meridionale Reveal
JM1: Eriogonum eastwoodianum	Eriogonum eastwoodianum J.T. Howell
JM1: Eriogonum elatum	Eriogonum elatum Benth.
JM1: Eriogonum elatum var. elatum	Eriogonum elatum var. elatum
JM1: Eriogonum elatum var. villosum	Eriogonum elatum var. villosum Jeps.
JM1: Eriogonum elegans	Eriogonum elegans Greene
JM2: Eriogonum elongatum	Eriogonum elongatum Benth.
JM1: Eriogonum elongatum var. elongatum	Eriogonum elongatum Benth. var. elongatum
JM1: Eriogonum eremicola	Eriogonum eremicola J.T. Howell & Reveal
JMS: Eriogonum ericifolium	Eriogonum thornei (Reveal & Henrickson) L.M. Shultz
JM1: Eriogonum ericifolium var. thornei	Eriogonum thornei (Reveal & Henrickson) L.M. Shultz
JM2: Eriogonum esmeraldense	Eriogonum esmeraldense S. Watson
JM1: Eriogonum esmeraldense var. esmeraldense	Eriogonum esmeraldense S. Watson var. esmeraldense
JM2: Eriogonum evanidum	Eriogonum evanidum Reveal
JM2: Eriogonum exaltatum	Eriogonum exaltatum M.E. Jones
JM1: Eriogonum fasciculatum	Eriogonum fasciculatum Benth.
JM1: Eriogonum fasciculatum var. fasciculatum	Eriogonum fasciculatum var. fasciculatum
JM1: Eriogonum fasciculatum var. flavoviride	Eriogonum fasciculatum var. flavoviride Munz & I.M. Johnst.
JM1: Eriogonum fasciculatum var. foliolosum	Eriogonum fasciculatum var. foliolosum (Nutt.) Abrams
JM1: Eriogonum fasciculatum var. polifolium	Eriogonum fasciculatum var. polifolium (Benth.) Torr. & A. Gray
JM1: Eriogonum foliosum	Eriogonum evanidum Reveal
JM1: Eriogonum giganteum	Eriogonum giganteum S. Watson
JM1: Eriogonum giganteum var. compactum	Eriogonum giganteum var. compactum Dunkle
JM1: Eriogonum giganteum var. formosum	Eriogonum giganteum var. formosum K. Brandegee
JM1: Eriogonum giganteum var. giganteum	Eriogonum giganteum var. giganteum
JM1: Eriogonum gilmanii	Eriogonum gilmanii S. Stokes
JM1: Eriogonum glandulosum	Eriogonum glandulosum (Nutt.) Benth.
JM1: Eriogonum gossypinum	Eriogonum gossypinum Curran
JM1: Eriogonum gracile	Eriogonum gracile Benth.
JM1: Eriogonum gracile var. gracile	Eriogonum gracile var. gracile
JM1: Eriogonum gracile var. incultum	Eriogonum gracile var. incultum Reveal
JM1: Eriogonum gracilipes	Eriogonum gracilipes S. Watson
JM1: Eriogonum gracillimum	Eriogonum gracillimum S. Watson
JM1: Eriogonum grande	Eriogonum grande Greene
JM1: Eriogonum grande var. grande	Eriogonum grande var. grande
JM1: Eriogonum grande var. rubescens	Eriogonum grande var. rubescens (Greene) Munz
JM1: Eriogonum grande var. timorum	Eriogonum grande var. timorum Reveal
JM1: Eriogonum heermannii	Eriogonum heermannii Durand & Hilg.
JM1: Eriogonum heermannii var. argense	Eriogonum heermannii var. argense (M.E. Jones) Munz
JM1: Eriogonum heermannii var. floccosum	Eriogonum heermannii var. floccosum Munz
JM1: Eriogonum heermannii var. heermannii	Eriogonum heermannii var. heermannii
JM1: Eriogonum heermannii var. humilius	Eriogonum heermannii var. humilius (S. Stokes) Reveal
JM1: Eriogonum heermannii var. occidentale	Eriogonum heermannii var. occidentale S. Stokes
JM1: Eriogonum heermannii var. sulcatum	Eriogonum heermannii var. sulcatum (S. Watson) Munz & Reveal
JM2: Eriogonum heracleoides	Eriogonum heracleoides Nutt.
JM1: Eriogonum heracleoides var. heracleoides	Eriogonum heracleoides Nutt. var. heracleoides
JM1: Eriogonum hirtellum	Eriogonum hirtellum J.T. Howell & Bacig.
JM1: Eriogonum hirtiflorum	Eriogonum hirtiflorum S. Watson
JM1: Eriogonum hoffmannii	Eriogonum hoffmannii S. Stokes
JM1: Eriogonum hoffmannii var. hoffmannii	Eriogonum hoffmannii var. hoffmannii
JM1: Eriogonum hoffmannii var. robustius	Eriogonum hoffmannii var. robustius S. Stokes
JM1: Eriogonum hookeri	Eriogonum hookeri S. Watson
JM1: Eriogonum incanum	Eriogonum incanum Torr. & A. Gray
JM1: Eriogonum inerme	Eriogonum inerme (S. Watson) Jeps.
JM2: Eriogonum inerme var. hispidulum	Eriogonum inerme var. hispidulum Goodman
JM2: Eriogonum inerme var. inerme	Eriogonum inerme var. inerme
JM1: Eriogonum inflatum	Eriogonum inflatum Torr. & Fr&eacute;m.
JM1: Eriogonum inflatum var. deflatum	Eriogonum inflatum Torr. & Fr&eacute;m.
JM1: Eriogonum inflatum var. inflatum	Eriogonum inflatum Torr. & Fr&eacute;m.
JMS: Eriogonum insigne	Eriogonum deflexum var. deflexum; Eriogonum exaltatum M.E. Jones
JM1: Eriogonum intrafractum	Eriogonum intrafractum Coville & C.V. Morton
JM1: Eriogonum kelloggii	Eriogonum kelloggii A. Gray
JM1: Eriogonum kennedyi	Eriogonum kennedyi S. Watson
JM1: Eriogonum kennedyi var. alpigenum	Eriogonum kennedyi var. alpigenum (Munz & I.M. Johnst.) Munz & I.M. Johnst.
JM1: Eriogonum kennedyi var. austromontanum	Eriogonum kennedyi var. austromontanum Munz & I.M. Johnst.
JM1: Eriogonum kennedyi var. kennedyi	Eriogonum kennedyi var. kennedyi
JM1: Eriogonum kennedyi var. pinicola	Eriogonum kennedyi var. pinicola Reveal
JM1: Eriogonum kennedyi var. purpusii	Eriogonum kennedyi var. purpusii (Brandegee) Reveal
JM1: Eriogonum latens	Eriogonum latens Jeps.
JM1: Eriogonum latifolium	Eriogonum latifolium Sm.
JM1: Eriogonum libertini	Eriogonum libertini Reveal
JM1: Eriogonum lobbii	Eriogonum lobbii Torr. & A. Gray
JMS: Eriogonum lobbii var. lobbii	Eriogonum lobbii Torr. & A. Gray
JM1: Eriogonum luteolum	Eriogonum luteolum Greene
JM1: Eriogonum luteolum var. caninum	Eriogonum luteolum var. caninum (Greene) Reveal
JM1: Eriogonum luteolum var. luteolum	Eriogonum luteolum var. luteolum
JM2: Eriogonum luteolum var. pedunculatum	Eriogonum luteolum var. pedunculatum (S. Stokes) Reveal
JM2: Eriogonum luteolum var. saltuarium	Eriogonum luteolum var. saltuarium Reveal
JM1: Eriogonum maculatum	Eriogonum maculatum A. Heller
JM1: Eriogonum marifolium	Eriogonum marifolium Torr. & A. Gray
JM2: Eriogonum marifolium var. cupulatum	Eriogonum marifolium var. cupulatum (S. Stokes) Reveal
JM2: Eriogonum marifolium var. marifolium	Eriogonum marifolium var. marifolium
JM2: Eriogonum mensicola	Eriogonum mensicola S. Stokes
JM1: Eriogonum microthecum	Eriogonum microthecum Nutt.
JM1: Eriogonum microthecum var. alpinum	Eriogonum microthecum var. alpinum Reveal
JM1: Eriogonum microthecum var. ambiguum	Eriogonum microthecum var. ambiguum (M.E. Jones) Reveal
JM1: Eriogonum microthecum var. corymbosoides	Eriogonum microthecum var. corymbosoides Reveal
JM1: Eriogonum microthecum var. johnstonii	Eriogonum microthecum var. johnstonii Reveal
JM2: Eriogonum microthecum var. lacus-ursi	Eriogonum microthecum var. lacus-ursi Reveal & A.C. Sanders
JM1: Eriogonum microthecum var. lapidicola	Eriogonum microthecum var. lapidicola Reveal
JM1: Eriogonum microthecum var. laxiflorum	Eriogonum microthecum var. laxiflorum Hook.
JM1: Eriogonum microthecum var. panamintense	Eriogonum microthecum var. panamintense S. Stokes
JM2: Eriogonum microthecum var. schoolcraftii	Eriogonum microthecum var. schoolcraftii Reveal
JM1: Eriogonum microthecum var. simpsonii	Eriogonum microthecum var. simpsonii (Benth.) Reveal
JM1: Eriogonum mohavense	Eriogonum mohavense S. Watson
JM1: Eriogonum molestum	Eriogonum molestum S. Watson
JM1: Eriogonum nervulosum	Eriogonum nervulosum (S. Stokes) Reveal
JM1: Eriogonum nidularium	Eriogonum nidularium Coville
JM1: Eriogonum nortonii	Eriogonum nortonii Greene
JM1: Eriogonum nudum	Eriogonum nudum Benth.
JM1: Eriogonum nudum var. auriculatum	Eriogonum nudum var. auriculatum (Benth.) Jeps.
JM1: Eriogonum nudum var. decurrens	Eriogonum nudum var. decurrens (S. Stokes) M.L. Bowerman
JM1: Eriogonum nudum var. deductum	Eriogonum nudum var. deductum (Greene) Jeps.
JMS: Eriogonum nudum var. gramineum	Eriogonum nudum var. westonii (S. Stokes) J.T. Howell
JM1: Eriogonum nudum var. indictum	Eriogonum nudum var. indictum (Jeps.) Reveal
JM1: Eriogonum nudum var. murinum	Eriogonum nudum var. murinum Reveal
JM1: Eriogonum nudum var. nudum	Eriogonum nudum var. nudum
JM1: Eriogonum nudum var. oblongifolium	Eriogonum nudum var. oblongifolium S. Watson
JM1: Eriogonum nudum var. paralinum	Eriogonum nudum var. paralinum Reveal
JM1: Eriogonum nudum var. pauciflorum	Eriogonum nudum var. pauciflorum S. Watson
JM2: Eriogonum nudum var. psychicola	Eriogonum nudum var. psychicola Reveal
JM1: Eriogonum nudum var. pubiflorum	Eriogonum nudum var. pubiflorum Benth.
JM1: Eriogonum nudum var. regirivum	Eriogonum nudum var. regirivum Reveal & J.C. Stebbins
JM1: Eriogonum nudum var. scapigerum	Eriogonum nudum var. scapigerum (Eastw.) Jeps.
JM1: Eriogonum nudum var. westonii	Eriogonum nudum var. westonii (S. Stokes) J.T. Howell
JM1: Eriogonum nummulare	Eriogonum nummulare M.E. Jones
JM1: Eriogonum nutans	Eriogonum nutans Torr. & A. Gray
JM2: Eriogonum nutans var. glabratum	Eriogonum nutans var. glabratum Reveal
JM2: Eriogonum nutans var. nutans	Eriogonum nutans var. nutans
JM1: Eriogonum ochrocephalum	Eriogonum ochrocephalum S. Watson
JM1: Eriogonum ochrocephalum var. alexanderae	excluded
JM1: Eriogonum ochrocephalum var. ochrocephalum	Eriogonum ochrocephalum S. Watson var. ochrocephalum
JM1: Eriogonum ordii	Eriogonum ordii S. Watson
JM1: Eriogonum ovalifolium	Eriogonum ovalifolium Nutt.
JM2: Eriogonum ovalifolium var. caelestinum	Eriogonum ovalifolium var. caelestinum Reveal
JM2: Eriogonum ovalifolium var. depressum	Eriogonum ovalifolium var. depressum Blank.
JM1: Eriogonum ovalifolium var. eximium	Eriogonum ovalifolium var. eximium (Tidestr.) J.T. Howell
JM2: Eriogonum ovalifolium var. monarchense	Eriogonum ovalifolium var. monarchense D.A. York
JM1: Eriogonum ovalifolium var. nivale	Eriogonum ovalifolium var. nivale (Coville) M.E. Jones
JM1: Eriogonum ovalifolium var. ovalifolium	Eriogonum ovalifolium var. ovalifolium
JM1: Eriogonum ovalifolium var. purpureum	Eriogonum ovalifolium var. purpureum (Nutt.) Durand
JM1: Eriogonum ovalifolium var. vineum	Eriogonum ovalifolium var. vineum (Small) A. Nelson
JM1: Eriogonum palmerianum	Eriogonum palmerianum Reveal
JM1: Eriogonum panamintense	Eriogonum panamintense C.V. Morton
JM1: Eriogonum parishii	Eriogonum parishii S. Watson
JM1: Eriogonum parvifolium	Eriogonum parvifolium Sm.
JM1: Eriogonum pendulum	Eriogonum pendulum S. Watson
JM1: Eriogonum plumatella	Eriogonum plumatella Durand & Hilg.
JM2: Eriogonum polycladon	Eriogonum polycladon Benth.
JM1: Eriogonum polypodum	Eriogonum polypodum Small
JM1: Eriogonum prattenianum	Eriogonum prattenianum Durand
JM1: Eriogonum prattenianum var. avium	Eriogonum prattenianum var. avium Reveal & Shevock
JM1: Eriogonum prattenianum var. prattenianum	Eriogonum prattenianum var. prattenianum
JM1: Eriogonum prociduum	Eriogonum prociduum Reveal
JMS: Eriogonum prociduum var. prociduum	Eriogonum prociduum Reveal
JM1: Eriogonum puberulum	Johanneshowellia puberula (S. Watson) Reveal
JM1: Eriogonum pusillum	Eriogonum pusillum Torr. & A. Gray
JM1: Eriogonum pyrolifolium	Eriogonum pyrolifolium Hook.
JM2: Eriogonum pyrolifolium var. coryphaeum	Eriogonum pyrolifolium var. coryphaeum Torr. & A. Gray
JM2: Eriogonum pyrolifolium var. pyrolifolium	Eriogonum pyrolifolium var. pyrolifolium
JM1: Eriogonum reniforme	Eriogonum reniforme Torr. & Fr&eacute;m.
JM1: Eriogonum rixfordii	Eriogonum rixfordii S. Stokes
JM1: Eriogonum rosense	Eriogonum rosense A. Nelson & P.B. Kenn.
JMS: Eriogonum rosense var. beatleyae	Eriogonum rosense A. Nelson & P.B. Kenn. var. rosense
JM2: Eriogonum rosense var. rosense	Eriogonum rosense A. Nelson & P.B. Kenn. var. rosense
JM1: Eriogonum roseum	Eriogonum roseum Durand & Hilg.
JM2: Eriogonum rupinum	Eriogonum rupinum Reveal
JM1: Eriogonum saxatile	Eriogonum saxatile S. Watson
JM2: Eriogonum shockleyi	Eriogonum shockleyi S. Watson
JM1: Eriogonum shockleyi var. shockleyi	Eriogonum shockleyi S. Watson
JM1: Eriogonum siskiyouense	Eriogonum siskiyouense Small
JM2: Eriogonum spectabile	Eriogonum spectabile B.L. Corbin et al.
JM1: Eriogonum spergulinum	Eriogonum spergulinum A. Gray
JM1: Eriogonum spergulinum var. pratense	Eriogonum spergulinum var. pratense (S. Stokes) J.T. Howell
JM1: Eriogonum spergulinum var. reddingianum	Eriogonum spergulinum var. reddingianum (M.E. Jones) J.T. Howell
JM1: Eriogonum spergulinum var. spergulinum	Eriogonum spergulinum var. spergulinum
JM1: Eriogonum sphaerocephalum	Eriogonum sphaerocephalum Benth.
JM1: Eriogonum sphaerocephalum var. halimioides	Eriogonum sphaerocephalum var. halimioides (Gand.) S. Stokes
JM1: Eriogonum sphaerocephalum var. sphaerocephalum	Eriogonum sphaerocephalum var. sphaerocephalum
JM1: Eriogonum strictum	Eriogonum strictum Benth.
JM1: Eriogonum strictum var. anserinum	Eriogonum strictum var. anserinum (Greene) S. Stokes
JM1: Eriogonum strictum var. greenei	Eriogonum strictum var. greenei (A. Gray) Reveal
JM1: Eriogonum strictum var. proliferum	Eriogonum strictum var. proliferum (Torr. & A. Gray) C.L. Hitchc.
JM1: Eriogonum temblorense	Eriogonum temblorense J.T. Howell & Twisselm.
JM1: Eriogonum ternatum	Eriogonum ternatum Howell
JM1: Eriogonum thomasii	Eriogonum thomasii Torr.
JM2: Eriogonum thornei	Eriogonum thornei (Reveal & Henrickson) L.M. Shultz
JM1: Eriogonum thurberi	Eriogonum thurberi Torr.
JM1: Eriogonum trichopes	Eriogonum trichopes Torr.; Eriogonum clavatum Small
JM1: Eriogonum trichopes var. hooveri	Eriogonum clavatum Small
JM1: Eriogonum trichopes var. trichopes	Eriogonum trichopes Torr.
JM1: Eriogonum tripodum	Eriogonum tripodum Greene
JM1: Eriogonum truncatum	Eriogonum truncatum Torr. & A. Gray
JM1: Eriogonum twisselmannii	Eriogonum twisselmannii (J.T. Howell) Reveal
JM1: Eriogonum umbellatum	Eriogonum umbellatum Torr.
JMS: Eriogonum umbellatum subsp. ferrissii	Eriogonum umbellatum var. subaridum S. Stokes
JM2: Eriogonum umbellatum var. ahartii	Eriogonum umbellatum var. ahartii Reveal
JM1: Eriogonum umbellatum var. argus	Eriogonum umbellatum var. argus Reveal
JM1: Eriogonum umbellatum var. bahiiforme	Eriogonum umbellatum var. bahiiforme (Torr. & A. Gray) Jeps.; Eriogonum umbellatum var. smallianum (A. Heller) S. Stokes
JM2: Eriogonum umbellatum var. canifolium	Eriogonum umbellatum var. canifolium Reveal
JM1: Eriogonum umbellatum var. chlorothamnus	Eriogonum umbellatum var. chlorothamnus Reveal
JM1: Eriogonum umbellatum var. covillei	Eriogonum umbellatum var. covillei (Small) Munz & Reveal
JM1: Eriogonum umbellatum var. dichrocephalum	Eriogonum umbellatum var. dichrocephalum Gand.
JM2: Eriogonum umbellatum var. dumosum	Eriogonum umbellatum var. dumosum (Greene) Reveal
JM1: Eriogonum umbellatum var. furcosum	Eriogonum umbellatum var. furcosum Reveal
JM1: Eriogonum umbellatum var. glaberrimum	Eriogonum umbellatum var. glaberrimum (Gand.) Reveal
JM2: Eriogonum umbellatum var. goodmanii	Eriogonum umbellatum var. goodmanii Reveal
JM1: Eriogonum umbellatum var. humistratum	Eriogonum umbellatum var. humistratum Reveal
JM1: Eriogonum umbellatum var. juniporinum	Eriogonum umbellatum var. juniporinum Reveal
JM2: Eriogonum umbellatum var. lautum	Eriogonum umbellatum var. lautum Reveal
JM1: Eriogonum umbellatum var. minus	Eriogonum umbellatum var. minus I.M. Johnst.
JM2: Eriogonum umbellatum var. modocense	Eriogonum umbellatum var. modocense (Greene) S. Stokes
JM1: Eriogonum umbellatum var. munzii	Eriogonum umbellatum var. munzii Reveal
JM2: Eriogonum umbellatum var. nelsoniorum	Eriogonum umbellatum var. nelsoniorum Reveal
JM1: Eriogonum umbellatum var. nevadense	Eriogonum umbellatum var. nevadense Gand.
JM1: Eriogonum umbellatum var. polyanthum	Eriogonum umbellatum var. dumosum (Greene) Reveal; Eriogonum umbellatum var. polyanthum (Benth.) M.E. Jones
JM2: Eriogonum umbellatum var. smallianum	Eriogonum umbellatum var. smallianum (A. Heller) S. Stokes
JM1: Eriogonum umbellatum var. speciosum	Eriogonum umbellatum var. speciosum (Drew) S. Stokes
JM1: Eriogonum umbellatum var. subaridum	Eriogonum umbellatum var. subaridum S. Stokes
JM1: Eriogonum umbellatum var. torreyanum	Eriogonum umbellatum var. torreyanum (A. Gray) M.E. Jones
JM1: Eriogonum umbellatum var. versicolor	Eriogonum umbellatum var. versicolor S. Stokes
JM1: Eriogonum ursinum	Eriogonum ursinum S. Watson
JM2: Eriogonum ursinum var. erubescens	Eriogonum ursinum var. erubescens Reveal & J. Knorr
JM2: Eriogonum ursinum var. ursinum	Eriogonum ursinum var. ursinum
JM1: Eriogonum vestitum	Eriogonum vestitum J.T. Howell
JM1: Eriogonum vimineum	Eriogonum vimineum Benth.
JM1: Eriogonum viridescens	Eriogonum viridescens A. Heller
JM1: Eriogonum wrightii	Eriogonum wrightii Benth.
JM1: Eriogonum wrightii var. membranaceum	Eriogonum wrightii var. membranaceum Jeps.
JM1: Eriogonum wrightii var. nodosum	Eriogonum wrightii var. nodosum (Small) Reveal
JM1: Eriogonum wrightii var. olanchense	Eriogonum wrightii var. olanchense (J.T. Howell) Reveal
JM1: Eriogonum wrightii var. subscaposum	Eriogonum wrightii var. subscaposum S. Watson
JM1: Eriogonum wrightii var. trachygonum	Eriogonum wrightii var. trachygonum (Benth.) Jeps.
JM1: Eriogonum wrightii var. wrightii	Eriogonum wrightii var. wrightii
JM1: Erioneuron pilosum	Erioneuron pilosum (Buckley) Nash
JM1: Erioneuron pulchellum	Dasyochloa pulchella (Kunth) Rydb.
JM1: Eriophorum criniger	Eriophorum crinigerum (A. Gray) Beetle
JM2: Eriophorum crinigerum	Eriophorum crinigerum (A. Gray) Beetle
JM1: Eriophorum gracile	Eriophorum gracile Roth
JM1: Eriophyllum ambiguum	Eriophyllum ambiguum (A. Gray) A. Gray
JM1: Eriophyllum ambiguum var. ambiguum	Eriophyllum ambiguum (A. Gray) A. Gray var. ambiguum
JM1: Eriophyllum ambiguum var. paleaceum	Eriophyllum ambiguum (A. Gray) A. Gray var. paleaceum (Brandegee) Ferris
JM1: Eriophyllum confertiflorum	Eriophyllum confertiflorum (DC.) A. Gray
JM1: Eriophyllum confertiflorum var. confertiflorum	Eriophyllum confertiflorum (DC.) A. Gray var. confertiflorum
JMS: Eriophyllum confertiflorum var. latum	Eriophyllum confertiflorum (DC.) A. Gray var. confertiflorum
JM1: Eriophyllum confertiflorum var. tanacetiflorum	Eriophyllum confertiflorum var. tanacetiflorum (Greene) Jeps.
JM1: Eriophyllum congdonii	Eriophyllum congdonii Brandegee
JMS: Eriophyllum croceum	Eriophyllum lanatum var. croceum (Greene) Jeps.
JMS: Eriophyllum idoneum	Eriophyllum lanatum var. achilleoides (DC.) Jeps.
JM1: Eriophyllum jepsonii	Eriophyllum jepsonii Greene
JM1: Eriophyllum lanatum	Eriophyllum lanatum (Pursh) J. Forbes
JM1: Eriophyllum lanatum var. achillaeoides	Eriophyllum lanatum var. achilleoides (DC.) Jeps.
JM2: Eriophyllum lanatum var. achilleoides	Eriophyllum lanatum var. achilleoides (DC.) Jeps.
JM1: Eriophyllum lanatum var. arachnoideum	Eriophyllum lanatum var. arachnoideum (Fisch. & Av&eacute;-Lall.) Jeps.
JM1: Eriophyllum lanatum var. croceum	Eriophyllum lanatum var. croceum (Greene) Jeps.
JM1: Eriophyllum lanatum var. grandiflorum	Eriophyllum lanatum var. grandiflorum (A. Gray) Jeps.
JM1: Eriophyllum lanatum var. hallii	Eriophyllum lanatum var. hallii Constance
JM1: Eriophyllum lanatum var. integrifolium	Eriophyllum lanatum var. integrifolium (Hook.) Smiley
JM1: Eriophyllum lanatum var. lanceolatum	Eriophyllum lanatum var. lanceolatum (Howell) Jeps.
JM1: Eriophyllum lanatum var. obovatum	Eriophyllum lanatum var. obovatum (Greene) H.M. Hall
JM1: Eriophyllum lanosum	Eriophyllum lanosum (A. Gray) A. Gray
JM1: Eriophyllum latilobum	Eriophyllum latilobum Rydb.
JM1: Eriophyllum mohavense	Eriophyllum mohavense (I.M. Johnst.) Jeps.
JM1: Eriophyllum multicaule	Eriophyllum multicaule (DC.) A. Gray
JM1: Eriophyllum nevinii	Constancea nevinii (A. Gray) B.G. Baldwin
JM1: Eriophyllum nubigenum	Eriophyllum nubigenum A. Gray
JMS: Eriophyllum paleaceum	Eriophyllum ambiguum (A. Gray) A. Gray var. paleaceum (Brandegee) Ferris
JM1: Eriophyllum pringlei	Eriophyllum pringlei A. Gray
JM1: Eriophyllum staechadifolium	Eriophyllum staechadifolium Lag.
JM1: Eriophyllum wallacei	Eriophyllum wallacei (A. Gray) A. Gray
JMS: Eriophyllum wallacei var. calvescens	Eriophyllum wallacei (A. Gray) A. Gray
JM1: Erodium botrys	Erodium botrys (Cav.) Bertol.
JM1: Erodium brachycarpum	Erodium brachycarpum (Godr.) Thell.
JM1: Erodium cicutarium	Erodium cicutarium (L.) Aiton
JM1: Erodium cygnorum	Erodium cygnorum Nees
JM1: Erodium macrophyllum	California macrophylla (Hook. & Arn.) J.J. Aldasoro et al.
JMS: Erodium macrophyllum var. californicum	California macrophylla (Hook. & Arn.) J.J. Aldasoro et al.
JM1: Erodium malacoides	Erodium malacoides (L.) Aiton
JM1: Erodium moschatum	Erodium moschatum (L.) Aiton
JM1: Erodium texanum	Erodium texanum A. Gray
JMS: Eruca sativa	Eruca vesicaria (L.) Cav. subsp. sativa (Mill.) Thell.
JM2: Eruca vesicaria	Eruca vesicaria (L.) Cav.
JM1: Eruca vesicaria subsp. sativa	Eruca vesicaria (L.) Cav. subsp. sativa (Mill.) Thell.
JM1: Erucastrum gallicum	Erucastrum gallicum (Willd.) O.E. Schulz
JM1: Eryngium alismaefolium	Eryngium alismifolium Greene
JM2: Eryngium alismifolium	Eryngium alismifolium Greene
JM1: Eryngium aristulatum	Eryngium aristulatum Jeps.; Eryngium jepsonii J.M. Coult. & Rose
JM1: Eryngium aristulatum var. aristulatum	Eryngium aristulatum Jeps. var. aristulatum; Eryngium jepsonii J.M. Coult. & Rose
JM1: Eryngium aristulatum var. hooveri	Eryngium aristulatum var. hooveri M.Y. Sheikh
JM1: Eryngium aristulatum var. parishii	Eryngium aristulatum var. parishii (J.M. Coult. & Rose) Mathias & Constance
JM1: Eryngium armatum	Eryngium armatum (S. Watson) J.M. Coult. & Rose
JM1: Eryngium articulatum	Eryngium articulatum Hook.; Eryngium alismifolium Greene
JMS: Eryngium articulatum var. bakeri	Eryngium articulatum Hook.
JMS: Eryngium articulatum var. microcephalum	Eryngium alismifolium Greene
JMS: Eryngium californicum	Eryngium jepsonii J.M. Coult. & Rose
JM1: Eryngium castrense	Eryngium castrense Jeps.
JM1: Eryngium constancei	Eryngium constancei M.Y. Sheikh
JMS: Eryngium elongatum	Eryngium jepsonii J.M. Coult. & Rose
JMS: Eryngium globosum	Eryngium spinosepalum Mathias
JMS: Eryngium globosum var. medium	Eryngium castrense Jeps.
JMS: Eryngium harknessii	Eryngium articulatum Hook.
JMS: Eryngium harmsianum	Eryngium armatum (S. Watson) J.M. Coult. & Rose
JM2: Eryngium jepsonii	Eryngium jepsonii J.M. Coult. & Rose
JMS: Eryngium jepsonii var. parishii	Eryngium aristulatum var. parishii (J.M. Coult. & Rose) Mathias & Constance
JMS: Eryngium longistylum	Eryngium armatum (S. Watson) J.M. Coult. & Rose
JM1: Eryngium mathiasiae	Eryngium mathiasiae M.Y. Sheikh
JMS: Eryngium minimum	Eryngium alismifolium Greene
JMS: Eryngium parishii	Eryngium aristulatum var. parishii (J.M. Coult. & Rose) Mathias & Constance
JM2: Eryngium pendletonense	Eryngium pendletonense K.L. Marsden & M.G. Simpson
JMS: Eryngium petiolatum	Eryngium armatum (S. Watson) J.M. Coult. & Rose; Eryngium alismifolium Greene
JMS: Eryngium petiolatum var. armatum	Eryngium armatum (S. Watson) J.M. Coult. & Rose
JMS: Eryngium petiolatum var. minimum	Eryngium alismifolium Greene
JM1: Eryngium pinnatisectum	Eryngium pinnatisectum Jeps.
JM1: Eryngium racemosum	Eryngium racemosum Jeps.
JM1: Eryngium spinosepalum	Eryngium spinosepalum Mathias
JMS: Eryngium spinosepalum var. medium	Eryngium castrense Jeps.
JM1: Eryngium vaseyi	Eryngium vaseyi J.M. Coult. & Rose; Eryngium castrense Jeps.; Eryngium spinosepalum Mathias
JMS: Eryngium vaseyi var. castrense	Eryngium castrense Jeps.
JMS: Eryngium vaseyi var. globosum	Eryngium spinosepalum Mathias
JM2: Eryngium vaseyi var. vallicola	Eryngium vaseyi var. vallicola (Jeps.) Munz
JM2: Eryngium vaseyi var. vaseyi	Eryngium vaseyi J.M. Coult. & Rose var. vaseyi
JM1: Erysimum ammophilum	Erysimum ammophilum A. Heller
JMS: Erysimum amoenum	Erysimum capitatum var. purshii (Durand) Rollins
JMS: Erysimum argillosum	Erysimum capitatum var. purshii (Durand) Rollins
JMS: Erysimum asperum	Erysimum capitatum (Hook.) Greene
JMS: Erysimum asperum var. bealianum	Erysimum capitatum (Hook.) Greene var. capitatum
JMS: Erysimum asperum var. purshii	Erysimum capitatum var. purshii (Durand) Rollins
JMS: Erysimum asperum var. stellatum	Erysimum capitatum (Hook.) Greene var. capitatum
JM1: Erysimum capitatum	Erysimum capitatum (Hook.) Greene; Erysimum perenne (Coville) Abrams
JM1: Erysimum capitatum subsp. angustatum	Erysimum capitatum (Hook.) Greene var. capitatum
JM1: Erysimum capitatum subsp. capitatum	Erysimum capitatum (Hook.) Greene var. capitatum
JM1: Erysimum capitatum subsp. lompocense	Erysimum capitatum (Hook.) Greene var. capitatum
JM1: Erysimum capitatum subsp. perenne	Erysimum perenne (Coville) Abrams
JMS: Erysimum capitatum var. angustatum	Erysimum capitatum (Hook.) Greene var. capitatum
JMS: Erysimum capitatum var. bealianum	Erysimum capitatum (Hook.) Greene var. capitatum
JM2: Erysimum capitatum var. capitatum	Erysimum capitatum (Hook.) Greene var. capitatum
JMS: Erysimum capitatum var. lompocense	Erysimum capitatum (Hook.) Greene var. capitatum
JMS: Erysimum capitatum var. perenne	Erysimum perenne (Coville) Abrams
JM2: Erysimum capitatum var. purshii	Erysimum capitatum var. purshii (Durand) Rollins
JM1: Erysimum cheiranthoides	Erysimum cheiranthoides L.
JM1: Erysimum cheiri	Erysimum cheiri (L.) Crantz
JM2: Erysimum concinnum	Erysimum concinnum Eastw.
JMS: Erysimum concinnum subsp. suffrutescens	Erysimum suffrutescens (Abrams) Rossbach
JM1: Erysimum franciscanum	Erysimum franciscanum Rossbach
JMS: Erysimum franciscanum var. crassifolium	Erysimum franciscanum Rossbach
JM1: Erysimum insulare	Erysimum capitatum (Hook.) Greene; Erysimum insulare Greene; Erysimum suffrutescens (Abrams) Rossbach
JM1: Erysimum insulare subsp. insulare	Erysimum insulare Greene
JM1: Erysimum insulare subsp. suffrutescens	Erysimum suffrutescens (Abrams) Rossbach
JMS: Erysimum insulare var. angustatum	Erysimum capitatum (Hook.) Greene var. capitatum
JM1: Erysimum menziesii	Erysimum menziesii (Hook.) Wettst.; Erysimum concinnum Eastw.
JM1: Erysimum menziesii subsp. concinnum	Erysimum concinnum Eastw.
JM1: Erysimum menziesii subsp. eurekense	Erysimum menziesii (Hook.) Wettst.
JM1: Erysimum menziesii subsp. menziesii	Erysimum menziesii (Hook.) Wettst.
JM1: Erysimum menziesii subsp. yadonii	Erysimum menziesii (Hook.) Wettst.
JMS: Erysimum moniliforme	Erysimum capitatum (Hook.) Greene var. capitatum
JM2: Erysimum perenne	Erysimum perenne (Coville) Abrams
JM1: Erysimum repandum	Erysimum repandum L.
JMS: Erysimum suffrutescens	Erysimum capitatum (Hook.) Greene; Erysimum suffrutescens (Abrams) Rossbach
JMS: Erysimum suffrutescens var. grandifolium	Erysimum suffrutescens (Abrams) Rossbach
JMS: Erysimum suffrutescens var. lompocense	Erysimum capitatum (Hook.) Greene var. capitatum
JM1: Erysimum teretifolium	Erysimum teretifolium Eastw.
JM1: Erythronium californicum	Erythronium californicum Purdy
JM1: Erythronium citrinum	Erythronium citrinum S. Watson
JM2: Erythronium citrinum var. citrinum	Erythronium citrinum S. Watson var. citrinum
JM2: Erythronium citrinum var. roderickii	Erythronium citrinum var. roderickii Shevock & G.A. Allen
JM1: Erythronium grandiflorum	Erythronium grandiflorum Pursh
JM2: Erythronium grandiflorum subsp. grandiflorum	Erythronium grandiflorum Pursh subsp. grandiflorum
JMS: Erythronium grandiflorum var. pallidum	Erythronium grandiflorum Pursh subsp. grandiflorum
JM1: Erythronium helenae	Erythronium helenae Applegate
JM1: Erythronium hendersonii	Erythronium hendersonii S. Watson
JMS: Erythronium howellii	Erythronium citrinum S. Watson var. citrinum
JM1: Erythronium klamathense	Erythronium klamathense Applegate
JM2: Erythronium multiscapideum	Erythronium multiscapideum (Kellogg) A. Nelson & P.B. Kenn.
JM1: Erythronium multiscapoideum	Erythronium multiscapideum (Kellogg) A. Nelson & P.B. Kenn.
JM1: Erythronium oregonum	Erythronium oregonum Applegate
JM2: Erythronium pluriflorum	Erythronium pluriflorum Shevock et al.
JM1: Erythronium purpurascens	Erythronium purpurascens S. Watson
JM2: Erythronium pusaterii	Erythronium pusaterii (Munz & J.T. Howell) Shevock et al.
JM1: Erythronium revolutum	Erythronium revolutum Sm.
JM2: Erythronium taylorii	Erythronium taylorii Shevock & G.A. Allen
JM1: Erythronium tuolumnense	Erythronium tuolumnense Applegate
JM1: Eschscholzia caespitosa	Eschscholzia caespitosa Benth.
JM1: Eschscholzia californica	Eschscholzia californica Cham.
JM1: Eschscholzia glyptosperma	Eschscholzia glyptosperma Greene
JM1: Eschscholzia hypecoides	Eschscholzia hypecoides Benth.
JM1: Eschscholzia lemmonii	Eschscholzia lemmonii Greene
JM1: Eschscholzia lemmonii subsp. kernensis	Eschscholzia lemmonii subsp. kernensis (Munz) C. Clark
JM1: Eschscholzia lemmonii subsp. lemmonii	Eschscholzia lemmonii Greene subsp. lemmonii
JM1: Eschscholzia lobbii	Eschscholzia lobbii Greene
JM1: Eschscholzia minutiflora	Eschscholzia minutiflora S. Watson
JM1: Eschscholzia parishii	Eschscholzia minutiflora S. Watson; Eschscholzia parishii Greene
JM1: Eschscholzia ramosa	Eschscholzia ramosa (Greene) Greene
JM1: Eschscholzia rhombipetala	Eschscholzia rhombipetala Greene
JMS: Escobaria deserti	Coryphantha chlorantha (Engelm.) Britton & Rose
JM1: Escobaria vivipara	Coryphantha alversonii (J.M. Coult.) Orcutt; Coryphantha chlorantha (Engelm.) Britton & Rose; Coryphantha vivipara (Nutt.) Britton & Rose
JM1: Escobaria vivipara var. alversonii	Coryphantha alversonii (J.M. Coult.) Orcutt
JM1: Escobaria vivipara var. deserti	Coryphantha chlorantha (Engelm.) Britton & Rose
JM1: Escobaria vivipara var. rosea	Coryphantha vivipara (Nutt.) Britton & Rose var. rosea (Clokey) L.D. Benson
JM1: Eucalyptus camaldulensis	Eucalyptus camaldulensis Dehnh.
JM1: Eucalyptus citriodora	Eucalyptus citriodora Hook.
JM1: Eucalyptus cladocalyx	Eucalyptus cladocalyx F. Muell.
JM2: Eucalyptus conferruminata	Eucalyptus conferruminata D.J. Carr & S.G.M. Carr
JM1: Eucalyptus globulus	Eucalyptus globulus Labill.
JM1: Eucalyptus polyanthemos	Eucalyptus polyanthemos Schauer
JM2: Eucalyptus pulchella	Eucalyptus pulchella Desf.
JM1: Eucalyptus pulverulenta	excluded
JM1: Eucalyptus sideroxylon	Eucalyptus sideroxylon Woolls
JM1: Eucalyptus tereticornis	Eucalyptus tereticornis Sm.
JM1: Eucalyptus viminalis	Eucalyptus viminalis Labill.
JM2: Eucephalus breweri	Eucephalus breweri (A. Gray) G.L. Nesom
JMS: Eucephalus brickellioides	Eucephalus tomentellus (Greene) Greene
JM2: Eucephalus engelmannii	Eucephalus engelmannii (D.C. Eaton) Greene
JM2: Eucephalus glabratus	Eucephalus glabratus (Greene) Greene
JMS: Eucephalus glandulosus	Eucephalus glabratus (Greene) Greene
JM2: Eucephalus ledophyllus	Eucephalus ledophyllus (A. Gray) Greene
JM2: Eucephalus ledophyllus var. covillei	Eucephalus ledophyllus (A. Gray) Greene var. covillei (Greene) G.L. Nesom
JM2: Eucephalus tomentellus	Eucephalus tomentellus (Greene) Greene
JM2: Eucephalus vialis	Eucephalus vialis Bradshaw
JM2: Euchiton gymnocephalus	Euchiton gymnocephalus (DC.) Holub
JM2: Euchiton involucratus	Euchiton involucratus (G. Forst.) Holub
JM2: Euchiton sphaericus	Euchiton sphaericus (Willd.) Holub
JM1: Euclidium syriacum	Euclidium syriacum (L.) W.T. Aiton
JM1: Eucnide rupestris	Eucnide rupestris (Baill.) H.J. Thomps. & W.R. Ernst
JM1: Eucnide urens	Eucnide urens (A. Gray) Parry
JM1: Eucrypta chrysanthemifolia	Eucrypta chrysanthemifolia (Benth.) Greene
JM1: Eucrypta chrysanthemifolia var. bipinnatifida	Eucrypta chrysanthemifolia var. bipinnatifida (Torr.) Constance
JM1: Eucrypta chrysanthemifolia var. chrysanthemifolia	Eucrypta chrysanthemifolia (Benth.) Greene var. chrysanthemifolia
JM1: Eucrypta micrantha	Eucrypta micrantha (Torr.) A. Heller
JMS: Eugenia australis	Syzygium australe (Link) B. Hyland
JM2: Eulobus californicus	Eulobus californicus Torr. & A. Gray
JM1: Euonymus occidentalis	Euonymus occidentalis Torr.
JM1: Euonymus occidentalis var. occidentalis	Euonymus occidentalis Torr. var. occidentalis
JM1: Euonymus occidentalis var. parishii	Euonymus occidentalis var. parishii (Trel.) Jeps.
JMS: Eupatorium grandiflorum	Brickellia grandiflora (Hook.) Nutt.
JM1: Euphorbia crenulata	Euphorbia crenulata Engelm.
JM2: Euphorbia cyathophora	Euphorbia cyathophora Murray
JM2: Euphorbia davidii	Euphorbia davidii Subils
JM2: Euphorbia dendroides	Euphorbia dendroides L.
JM1: Euphorbia dentata	Euphorbia dentata Michx.
JM1: Euphorbia eriantha	Euphorbia eriantha Benth.
JM1: Euphorbia esula	Euphorbia virgata Waldst. & Kit.
JM2: Euphorbia exstipulata	Euphorbia exstipulata Engelm.
JM1: Euphorbia exstipulata var. exstipulata	Euphorbia exstipulata Engelm. var. exstipulata
JM1: Euphorbia helioscopia	Euphorbia helioscopia L.
JM1: Euphorbia incisa	Euphorbia schizoloba Engelm.
JM1: Euphorbia lathyris	Euphorbia lathyris L.
JM2: Euphorbia lurida	Euphorbia lurida Engelm.
JM1: Euphorbia misera	Euphorbia misera Benth.
JM1: Euphorbia oblongata	Euphorbia oblongata Griseb.
JM1: Euphorbia palmeri	Euphorbia lurida Engelm.
JM1: Euphorbia peplus	Euphorbia peplus L.
JM2: Euphorbia schizoloba	Euphorbia schizoloba Engelm.
JM1: Euphorbia serrata	excluded
JM1: Euphorbia spathulata	Euphorbia spathulata Lam.
JM2: Euphorbia terracina	Euphorbia terracina L.
JM2: Euphorbia virgata	Euphorbia virgata Waldst. & Kit.
JM2: Euphrosyne acerosa	Euphrosyne acerosa (Nutt.) Panero
JM2: Euphrosyne nevadensis	Euphrosyne nevadensis (M.E. Jones) Panero
JMS: Eurotia lanata	Krascheninnikovia lanata (Pursh) A. Meeuse & A. Smit
JM2: Eurybia integrifolia	Eurybia integrifolia (Nutt.) G.L. Nesom
JM2: Eurybia merita	Eurybia merita (A. Nelson) G.L. Nesom
JM2: Eurybia radulina	Eurybia radulina (A. Gray) G.L. Nesom
JM1: Eustoma exaltatum	Eustoma exaltatum (L.) G. Don
JM2: Eustoma exaltatum subsp. exaltatum	Eustoma exaltatum (L.) G. Don subsp. exaltatum
JM1: Euthamia occidentalis	Euthamia occidentalis Nutt.
JMS: Fagonia californica	Fagonia pachyacantha Rydb.
JMS: Fagonia californica subsp. pachyacantha	Fagonia pachyacantha Rydb.
JM1: Fagonia laevis	Fagonia laevis Standl.
JM1: Fagonia pachyacantha	Fagonia pachyacantha Rydb.
JM1: Fagopyrum esculentum	excluded
JM2: Fallopia baldschuanica	Fallopia baldschuanica (Regel) Holub
JM2: Fallopia convolvulus	Fallopia convolvulus (L.) A. L&ouml;ve
JM2: Fallopia japonica	Fallopia japonica (Houtt.) Ronse Decr.
JM2: Fallopia sachalinensis	Fallopia sachalinensis (F. Schmidt) Ronse Decr.
JM1: Fallugia paradoxa	Fallugia paradoxa (D. Don) Torr.
JM1: Fendlerella utahensis	Fendlerella utahensis (S. Watson) A. Heller
JMS: Ferocactus acanthodes	Ferocactus cylindraceus (Engelm.) Orcutt
JM1: Ferocactus cylindraceus	Ferocactus cylindraceus (Engelm.) Orcutt
JM1: Ferocactus cylindraceus var. cylindraceus	Ferocactus cylindraceus (Engelm.) Orcutt
JM1: Ferocactus cylindraceus var. lecontei	Ferocactus cylindraceus (Engelm.) Orcutt
JM1: Ferocactus viridescens	Ferocactus viridescens (Torr. & A. Gray) Britton & Rose
JMS: Festuca arida	Festuca microstachys Nutt.
JM1: Festuca arundinacea	Festuca arundinacea Schreb.
JM2: Festuca brachyphylla	Festuca brachyphylla Schult. & Schult.
JM2: Festuca brachyphylla subsp. breviculmis	Festuca brachyphylla Schult. & Schult. f. subsp. breviculmis Fred.
JM1: Festuca brachyphylla subsp. coloradensis	excluded
JM2: Festuca bromoides	Festuca bromoides L.
JM1: Festuca californica	Festuca californica Vasey
JMS: Festuca confusa	Festuca microstachys Nutt.
JMS: Festuca dertonensis	Festuca bromoides L.
JMS: Festuca eastwoodiae	Festuca microstachys Nutt.
JMS: Festuca elatior	Festuca arundinacea Schreb.
JMS: Festuca elatior var. pratensis	Festuca pratensis Huds.
JM1: Festuca elmeri	Festuca elmeri Scribn. & Merr.
JMS: Festuca elmeri subsp. luxurians	Festuca elmeri Scribn. & Merr.
JMS: Festuca grayi	Festuca microstachys Nutt.
JMS: Festuca howellii	Festuca elmeri Scribn. & Merr.
JM1: Festuca idahoensis	Festuca idahoensis Elmer
JMS: Festuca idahoensis subsp. roemeri	Festuca idahoensis Elmer
JM1: Festuca kingii	Festuca kingii (S. Watson) Cassidy
JMS: Festuca megalura	Festuca myuros L.
JM2: Festuca microstachys	Festuca microstachys Nutt.
JMS: Festuca microstachys var. ciliata	Festuca microstachys Nutt.
JMS: Festuca microstachys var. pauciflora	Festuca microstachys Nutt.
JMS: Festuca microstachys var. simulans	Festuca microstachys Nutt.
JM1: Festuca minutiflora	Festuca minutiflora Rydb.
JM2: Festuca myuros	Festuca myuros L.
JM1: Festuca occidentalis	Festuca occidentalis Hook.
JM2: Festuca octoflora	Festuca octoflora Walter
JMS: Festuca octoflora subsp. hirtella	Festuca octoflora Walter
JMS: Festuca pacifica	Festuca microstachys Nutt.
JM2: Festuca perennis	Festuca perennis (L.) Columbus & J.P. Sm.
JM1: Festuca pratensis	Festuca pratensis Huds.
JMS: Festuca reflexa	Festuca microstachys Nutt.
JMS: Festuca roemeri	Festuca idahoensis Elmer
JMS: Festuca roemeri var. klamathensis	Festuca idahoensis Elmer
JM1: Festuca rubra	Festuca rubra L.
JM2: Festuca saximontana	Festuca saximontana Rydb.
JM1: Festuca saximontana var. purpusiana	Festuca saximontana Rydb.
JM1: Festuca subulata	Festuca subulata Trin.
JM1: Festuca subuliflora	Festuca subuliflora Scribn.
JM2: Festuca temulenta	Festuca temulenta (L.) Columbus & J.P. Sm.
JM1: Festuca trachyphylla	Festuca trachyphylla (Hack.) Krajina
JMS: Festuca tracyi	Festuca microstachys Nutt.
JM1: Festuca viridula	Festuca viridula Vasey
JM1: Ficus carica	Ficus carica L.
JM1: Filago arizonica	Logfia arizonica (A. Gray) Holub
JM1: Filago californica	Logfia filaginoides (Hook. & Arn.) Morefield
JM1: Filago depressa	Logfia depressa (A. Gray) Holub
JM1: Filago gallica	Logfia gallica (L.) Coss. & Germ.
JMS: Filago germanica	Filago pyramidata L. var. pyramidata
JM2: Filago pyramidata	Filago pyramidata L.
JM1: Filago pyramidata var. pyramidata	Filago pyramidata L. var. pyramidata
JM2: Fimbristylis autumnalis	Fimbristylis autumnalis (L.) Roem. & Schult.
JM1: Fimbristylis miliacea	excluded
JM1: Fimbristylis thermalis	Fimbristylis thermalis S. Watson
JM1: Fimbristylis vahlii	Fimbristylis vahlii (Lam.) Link
JM1: Flaveria trinervia	Flaveria trinervia (Spreng.) C. Mohr
JM1: Floerkea proserpinacoides	Floerkea proserpinacoides Willd.
JM1: Foeniculum vulgare	Foeniculum vulgare Mill.
JMS: Forestiera neomexicana	Forestiera pubescens Nutt.
JMS: Forestiera neomexicana var. arizonica	Forestiera pubescens Nutt.
JMS: Forestiera neomexicana var. neomexicana	Forestiera pubescens Nutt.
JM1: Forestiera pubescens	Forestiera pubescens Nutt.
JMS: Forestiera pubescens var. parviflora	Forestiera pubescens Nutt.
JM2: Fouquieria splendens	Fouquieria splendens Engelm.
JM1: Fouquieria splendens subsp. splendens	Fouquieria splendens Engelm. subsp. splendens
JM1: Fragaria chiloensis	Fragaria chiloensis (L.) Mill.
JMS: Fragaria chiloensis subsp. lucida	Fragaria chiloensis (L.) Mill.
JMS: Fragaria crinita	Fragaria vesca L.
JM1: Fragaria vesca	Fragaria vesca L.
JMS: Fragaria vesca subsp. bracteata	Fragaria vesca L.
JM1: Fragaria virginiana	Fragaria virginiana Mill.
JM2: Frangula californica	Frangula californica (Eschsch.) A. Gray
JM2: Frangula californica subsp. crassifolia	Frangula californica subsp. crassifolia (Jeps.) Kartesz & Gandhi
JM2: Frangula californica subsp. cuspidata	Frangula californica subsp. cuspidata (Greene) Kartesz & Gandhi
JM2: Frangula californica subsp. occidentalis	Frangula californica subsp. occidentalis (Greene) Kartesz & Gandhi
JM2: Frangula californica subsp. tomentella	Frangula californica subsp. tomentella (Benth.) Kartesz & Gandhi
JM2: Frangula californica subsp. ursina	Frangula californica subsp. ursina (Greene) Kartesz & Gandhi
JM2: Frangula purshiana	Frangula purshiana (DC.) J.G. Cooper
JM2: Frangula purshiana subsp. annonifolia	Frangula purshiana subsp. annonifolia (Greene) Sawyer & S.W. Edwards
JM2: Frangula purshiana subsp. purshiana	Frangula purshiana (DC.) J.G. Cooper subsp. purshiana
JM2: Frangula purshiana subsp. ultramafica	Frangula purshiana subsp. ultramafica Sawyer & S.W. Edwards
JM2: Frangula rubra	Frangula rubra (Greene) Grubov
JM2: Frangula rubra subsp. modocensis	Frangula rubra subsp. modocensis (C.B. Wolf) Kartesz & Gandhi
JM2: Frangula rubra subsp. obtusissima	Frangula rubra subsp. obtusissima (Greene) Kartesz & Gandhi
JM2: Frangula rubra subsp. yosemitana	Frangula rubra subsp. yosemitana (C.B. Wolf) Kartesz & Gandhi
JMS: Frankenia grandifolia	Frankenia salina (Molina) I.M. Johnst.
JMS: Frankenia grandifolia var. campestris	Frankenia salina (Molina) I.M. Johnst.
JM1: Frankenia palmeri	Frankenia palmeri S. Watson
JM2: Frankenia pulverulenta	Frankenia pulverulenta L.
JM1: Frankenia salina	Frankenia salina (Molina) I.M. Johnst.
JM2: Frasera albicaulis	Frasera albicaulis Griseb.
JM2: Frasera albicaulis var. modocensis	Frasera albicaulis var. modocensis (H. St. John) N.H. Holmgren
JM2: Frasera albicaulis var. nitida	Frasera albicaulis var. nitida (Benth.) C.L. Hitchc.
JM2: Frasera albomarginata	Frasera albomarginata S. Watson
JM2: Frasera albomarginata var. albomarginata	Frasera albomarginata S. Watson var. albomarginata
JM2: Frasera albomarginata var. induta	Frasera albomarginata var. induta (Tidestr.) Card
JM2: Frasera neglecta	Frasera neglecta H.M. Hall
JM2: Frasera parryi	Frasera parryi Torr.
JM2: Frasera puberulenta	Frasera puberulenta Davidson
JM2: Frasera speciosa	Frasera speciosa Griseb.
JM2: Frasera tubulosa	Frasera tubulosa Coville
JM2: Frasera umpquaensis	Frasera umpquaensis M. Peck & Applegate
JM1: Fraxinus anomala	Fraxinus anomala S. Watson
JMS: Fraxinus anomala var. triphylla	Fraxinus anomala S. Watson
JM1: Fraxinus dipetala	Fraxinus dipetala Hook. & Arn.
JMS: Fraxinus dipetala var. trifoliolata	Fraxinus parryi Moran
JM1: Fraxinus latifolia	Fraxinus latifolia Benth.
JMS: Fraxinus oregona	Fraxinus latifolia Benth.
JM2: Fraxinus parryi	Fraxinus parryi Moran
JMS: Fraxinus pennsylvanica	Fraxinus latifolia Benth.; Fraxinus latifolia Benth.
JMS: Fraxinus pennsylvanica subsp. oregona	Fraxinus latifolia Benth.
JMS: Fraxinus pennsylvanica subsp. velutina	Fraxinus velutina Torr.
JMS: Fraxinus trifoliolata	Fraxinus parryi Moran
JM1: Fraxinus velutina	Fraxinus velutina Torr.
JMS: Fraxinus velutina var. coriacea	Fraxinus velutina Torr.
JM1: Freesia alba	Freesia alba (G.L. Mey.) Gumbl.
JMS: Fremontia vermiculata	Sarcobatus vermiculatus (Hook.) Torr.
JM1: Fremontodendron californicum	Fremontodendron californicum (Torr.) Coville; Fremontodendron decumbens R.M. Lloyd
JM1: Fremontodendron californicum subsp. californicum	Fremontodendron californicum (Torr.) Coville
JMS: Fremontodendron californicum subsp. crassifolium	Fremontodendron californicum (Torr.) Coville
JM1: Fremontodendron californicum subsp. decumbens	Fremontodendron decumbens R.M. Lloyd
JMS: Fremontodendron californicum subsp. napense	Fremontodendron californicum (Torr.) Coville
JMS: Fremontodendron californicum subsp. obispoense	Fremontodendron californicum (Torr.) Coville
JM2: Fremontodendron decumbens	Fremontodendron decumbens R.M. Lloyd
JM1: Fremontodendron mexicanum	Fremontodendron mexicanum Davidson
JM1: Fritillaria affinis	Fritillaria affinis (Schult. & Schult. f.) Sealy
JM1: Fritillaria affinis var. affinis	Fritillaria affinis (Schult. & Schult. f.) Sealy
JM1: Fritillaria affinis var. tristulis	Fritillaria affinis (Schult. & Schult. f.) Sealy
JM1: Fritillaria agrestis	Fritillaria agrestis Greene
JM1: Fritillaria atropurpurea	Fritillaria atropurpurea Nutt.
JM1: Fritillaria biflora	Fritillaria biflora Lindl.
JM1: Fritillaria biflora var. biflora	Fritillaria biflora Lindl. var. biflora
JM1: Fritillaria biflora var. ineziana	Fritillaria biflora var. ineziana Jeps.
JM2: Fritillaria brandegeei	Fritillaria brandegeei Eastw.
JM1: Fritillaria brandegei	Fritillaria brandegeei Eastw.
JM1: Fritillaria eastwoodiae	Fritillaria eastwoodiae R.M. MacFarl.
JM1: Fritillaria falcata	Fritillaria falcata (Jeps.) D.E. Beetle
JM2: Fritillaria gentneri	Fritillaria gentneri Gilkey
JM1: Fritillaria glauca	Fritillaria glauca Greene
JM1: Fritillaria liliacea	Fritillaria liliacea Lindl.
JM1: Fritillaria micrantha	Fritillaria micrantha A. Heller
JM1: Fritillaria ojaiensis	Fritillaria ojaiensis Davidson
JM1: Fritillaria pinetorum	Fritillaria pinetorum Davidson
JM1: Fritillaria pluriflora	Fritillaria pluriflora Benth.
JM1: Fritillaria pudica	Fritillaria pudica (Pursh) Spreng.
JM1: Fritillaria purdyi	Fritillaria purdyi Eastw.
JM1: Fritillaria recurva	Fritillaria recurva Benth.
JM1: Fritillaria striata	Fritillaria striata Eastw.
JM1: Fritillaria viridea	Fritillaria viridea Kellogg
JM2: Fumaria capreolata	Fumaria capreolata L.
JM1: Fumaria officinalis	Fumaria officinalis L.
JM1: Fumaria parviflora	Fumaria parviflora Lam.
JM2: Funastrum crispum	Funastrum crispum (Benth.) Schltr.
JM2: Funastrum cynanchoides	Funastrum cynanchoides (Decne.) Schltr.
JM2: Funastrum cynanchoides var. hartwegii	Funastrum cynanchoides (Decne.) Schltr. var. hartwegii (Vail) Krings
JM2: Funastrum hirtellum	Funastrum hirtellum (A. Gray) Schltr.
JM2: Funastrum utahense	Funastrum utahense (Engelm.) Liede & Meve
JMS: Gaillardia amara	Helenium amarum (Raf.) H. Rock var. amarum
JM1: Gaillardia aristata	Gaillardia aristata Pursh
JM1: Gaillardia pulchella	Gaillardia pulchella Foug.
JM2: Galinsoga parviflora	Galinsoga parviflora Cav.
JM1: Galinsoga parviflora var. parviflora	Galinsoga parviflora Cav. var. parviflora
JM1: Galinsoga quadriradiata	excluded
JM1: Galium ambiguum	Galium ambiguum W. Wight
JM2: Galium ambiguum subsp. ambiguum	Galium ambiguum W. Wight subsp. ambiguum
JM2: Galium ambiguum subsp. siskiyouense	Galium ambiguum subsp. siskiyouense (Ferris) Dempster & Stebbins
JM1: Galium ambiguum var. ambiguum	Galium ambiguum W. Wight subsp. ambiguum
JM1: Galium ambiguum var. siskiyouense	Galium ambiguum subsp. siskiyouense (Ferris) Dempster & Stebbins
JM1: Galium andrewsii	Galium andrewsii A. Gray
JM1: Galium andrewsii subsp. andrewsii	Galium andrewsii A. Gray subsp. andrewsii
JM1: Galium andrewsii subsp. gatense	Galium andrewsii subsp. gatense (Dempster) Dempster & Stebbins
JM1: Galium andrewsii subsp. intermedium	Galium andrewsii subsp. intermedium Dempster & Stebbins
JMS: Galium andrewsii var. gatense	Galium andrewsii subsp. gatense (Dempster) Dempster & Stebbins
JM1: Galium angustifolium	Galium angustifolium A. Gray; Galium johnstonii Dempster & Stebbins
JM1: Galium angustifolium subsp. angustifolium	Galium angustifolium A. Gray subsp. angustifolium
JM1: Galium angustifolium subsp. borregoense	Galium angustifolium subsp. borregoense Dempster & Stebbins
JM1: Galium angustifolium subsp. foliosum	Galium angustifolium subsp. foliosum (Hilend & J.T. Howell) Dempster & Stebbins
JM1: Galium angustifolium subsp. gabrielense	Galium angustifolium subsp. gabrielense (Munz & I.M. Johnst.) Dempster & Stebbins
JM1: Galium angustifolium subsp. gracillimum	Galium angustifolium subsp. gracillimum Dempster & Stebbins
JM1: Galium angustifolium subsp. jacinticum	Galium angustifolium subsp. jacinticum Dempster & Stebbins
JM1: Galium angustifolium subsp. nudicaule	Galium angustifolium subsp. nudicaule Dempster & Stebbins
JM1: Galium angustifolium subsp. onycense	Galium angustifolium subsp. onycense (Dempster) Dempster & Stebbins
JMS: Galium angustifolium var. foliosum	Galium angustifolium subsp. foliosum (Hilend & J.T. Howell) Dempster & Stebbins
JMS: Galium angustifolium var. onycense	Galium angustifolium subsp. onycense (Dempster) Dempster & Stebbins
JMS: Galium angustifolium var. pinetorum	Galium johnstonii Dempster & Stebbins
JM1: Galium aparine	Galium aparine L.
JM1: Galium argense	Galium argense Dempster & Ehrend.
JM1: Galium bifolium	Galium bifolium S. Watson
JM1: Galium bolanderi	Galium bolanderi A. Gray
JM2: Galium boreale	Galium boreale L.
JM1: Galium boreale subsp. septentrionale	Galium boreale L.
JM1: Galium buxifolium	Galium buxifolium Greene
JM1: Galium californicum	Galium californicum Hook. & Arn.
JM1: Galium californicum subsp. californicum	Galium californicum Hook. & Arn. subsp. californicum
JM1: Galium californicum subsp. flaccidum	Galium californicum subsp. flaccidum (Greene) Dempster & Stebbins
JM1: Galium californicum subsp. luciense	Galium californicum subsp. luciense Dempster & Stebbins
JM1: Galium californicum subsp. maritimum	Galium californicum subsp. maritimum Dempster & Stebbins
JM1: Galium californicum subsp. miguelense	Galium californicum subsp. miguelense (Greene) Dempster & Stebbins
JM1: Galium californicum subsp. primum	Galium californicum subsp. primum Dempster & Stebbins
JM1: Galium californicum subsp. sierrae	Galium californicum subsp. sierrae Dempster & Stebbins
JMS: Galium californicum var. miguelense	Galium californicum subsp. miguelense (Greene) Dempster & Stebbins
JM1: Galium catalinense	Galium catalinense A. Gray
JM1: Galium catalinense subsp. acrispum	Galium catalinense subsp. acrispum Dempster
JM1: Galium catalinense subsp. catalinense	Galium catalinense A. Gray subsp. catalinense
JM1: Galium clementis	Galium clementis Eastw.
JM1: Galium cliftonsmithii	Galium cliftonsmithii (Dempster) Dempster & Stebbins
JMS: Galium cymosum	Galium trifidum subsp. columbianum (Rydb.) Hult&eacute;n
JM1: Galium divaricatum	Galium divaricatum Lam.
JMS: Galium gabrielense	Galium angustifolium subsp. gabrielense (Munz & I.M. Johnst.) Dempster & Stebbins
JM1: Galium glabrescens	Galium glabrescens (Ehrend.) Dempster & Ehrend.
JM1: Galium glabrescens subsp. glabrescens	Galium glabrescens (Ehrend.) Dempster & Ehrend. subsp. glabrescens
JM1: Galium glabrescens subsp. modocense	Galium glabrescens subsp. modocense Dempster & Ehrend.
JM1: Galium grande	Galium grande McClatchie
JM1: Galium grayanum	Galium grayanum Ehrend.
JM1: Galium grayanum var. grayanum	Galium grayanum Ehrend. var. grayanum
JM1: Galium grayanum var. nanum	Galium grayanum var. nanum Dempster & Ehrend.
JM1: Galium hallii	Galium hallii Munz & I.M. Johnst.
JM1: Galium hardhamiae	Galium hardhamiae Dempster
JM1: Galium hilendiae	Galium hilendiae Dempster & Ehrend.
JM1: Galium hilendiae subsp. carneum	Galium hilendiae subsp. carneum (Hilend & J.T. Howell) Dempster & Ehrend.
JM1: Galium hilendiae subsp. hilendiae	Galium hilendiae Dempster & Ehrend. subsp. hilendiae
JM1: Galium hilendiae subsp. kingstonense	Galium hilendiae subsp. kingstonense (Dempster) Dempster & Ehrend.
JM1: Galium hypotrichium	Galium hypotrichium A. Gray
JM1: Galium hypotrichium subsp. hypotrichium	Galium hypotrichium A. Gray subsp. hypotrichium
JM1: Galium hypotrichium subsp. inyoense	Galium hypotrichium subsp. inyoense Dempster & Ehrend.
JM1: Galium hypotrichium subsp. subalpinum	Galium hypotrichium subsp. subalpinum (Hilend & J.T. Howell) Ehrend.
JM1: Galium hypotrichium subsp. tomentellum	Galium hypotrichium subsp. tomentellum Ehrend.
JM1: Galium jepsonii	Galium jepsonii Hilend & J.T. Howell
JM1: Galium johnstonii	Galium johnstonii Dempster & Stebbins
JM1: Galium magnifolium	Galium magnifolium (Dempster) Dempster
JM1: Galium matthewsii	Galium matthewsii A. Gray
JM2: Galium mexicanum	Galium mexicanum Kunth
JM2: Galium mexicanum subsp. asperulum	Galium mexicanum Kunth subsp. asperulum (A. Gray) Dempster
JM1: Galium mexicanum var. asperulum	Galium mexicanum Kunth subsp. asperulum (A. Gray) Dempster
JM1: Galium mollugo	Galium mollugo L.
JM1: Galium multiflorum	Galium multiflorum Kellogg
JMS: Galium multiflorum f. hirsutum	Galium multiflorum Kellogg
JM1: Galium munzii	Galium munzii Hilend & J.T. Howell
JMS: Galium munzii var. carneum	Galium hilendiae subsp. carneum (Hilend & J.T. Howell) Dempster & Ehrend.
JMS: Galium munzii var. kingstonense	Galium hilendiae subsp. kingstonense (Dempster) Dempster & Ehrend.
JM1: Galium murale	Galium murale (L.) All.
JM1: Galium muricatum	Galium muricatum W. Wight
JM1: Galium nuttallii	Galium nuttallii A. Gray; Galium porrigens Dempster; Galium cliftonsmithii (Dempster) Dempster & Stebbins; Galium porrigens Dempster
JM1: Galium nuttallii subsp. insulare	Galium nuttallii subsp. insulare Ferris
JM1: Galium nuttallii subsp. nuttallii	Galium nuttallii A. Gray subsp. nuttallii
JMS: Galium nuttallii var. cliftonsmithii	Galium cliftonsmithii (Dempster) Dempster & Stebbins
JMS: Galium nuttallii var. ovalifolium	Galium porrigens Dempster var. porrigens
JMS: Galium nuttallii var. tenue	Galium porrigens var. tenue (Dempster) Dempster
JM1: Galium oreganum	Galium oreganum Britton
JM1: Galium parishii	Galium parishii Hilend & J.T. Howell
JM1: Galium parisiense	Galium parisiense L.
JM1: Galium porrigens	Galium porrigens Dempster
JM1: Galium porrigens var. porrigens	Galium porrigens Dempster var. porrigens
JM1: Galium porrigens var. tenue	Galium porrigens var. tenue (Dempster) Dempster
JM1: Galium proliferum	Galium proliferum A. Gray
JMS: Galium pubens	Galium bolanderi A. Gray
JM1: Galium saxatile	excluded
JM1: Galium schultesii	excluded
JM1: Galium serpenticum	Galium serpenticum Dempster
JM1: Galium serpenticum subsp. scotticum	Galium serpenticum subsp. scotticum Dempster & Ehrend.
JM1: Galium serpenticum subsp. warnerense	Galium serpenticum subsp. warnerense Dempster & Ehrend.
JM1: Galium sparsiflorum	Galium sparsiflorum W. Wight
JM1: Galium sparsiflorum subsp. glabrius	Galium sparsiflorum subsp. glabrius Dempster & Stebbins
JM1: Galium sparsiflorum subsp. sparsiflorum	Galium sparsiflorum W. Wight subsp. sparsiflorum
JM2: Galium stellatum	Galium stellatum Kellogg
JM1: Galium stellatum var. eremicum	Galium stellatum Kellogg
JM1: Galium tricornutum	Galium tricornutum Dandy
JM1: Galium trifidum	Galium trifidum L.
JM2: Galium trifidum subsp. columbianum	Galium trifidum subsp. columbianum (Rydb.) Hult&eacute;n
JM2: Galium trifidum subsp. subbiflorum	Galium trifidum subsp. subbiflorum (Wiegand) Puff.
JM1: Galium trifidum var. pacificum	Galium trifidum subsp. columbianum (Rydb.) Hult&eacute;n
JM1: Galium trifidum var. pusillum	Galium trifidum subsp. subbiflorum (Wiegand) Puff.
JM1: Galium triflorum	Galium triflorum Michx.
JM1: Galium verum	excluded
JMS: Galium watsonii	Galium multiflorum Kellogg
JM1: Galium wrightii	Galium wrightii A. Gray
JM1: Galvezia speciosa	Gambelia speciosa Nutt.
JM2: Gambelia speciosa	Gambelia speciosa Nutt.
JM2: Gamochaeta calviceps	Gamochaeta calviceps (Fernald) Cabrera
JM2: Gamochaeta coarctata	Gamochaeta coarctata (Willd.) Kergu&eacute;len
JM2: Gamochaeta pensylvanica	Gamochaeta pensylvanica (Willd.) Cabrera
JM2: Gamochaeta stachydifolia	Gamochaeta stachydifolia (Lam.) Cabrera
JM2: Gamochaeta stagnalis	Gamochaeta stagnalis (I.M. Johnst.) Anderb.
JM2: Gamochaeta ustulata	Gamochaeta ustulata (Nutt.) Holub
JM1: Garrya buxifolia	Garrya buxifolia A. Gray
JM1: Garrya congdonii	Garrya congdonii Eastw.
JM1: Garrya elliptica	Garrya elliptica Lindl.
JM1: Garrya flavescens	Garrya flavescens S. Watson
JM1: Garrya fremontii	Garrya fremontii Torr.
JM1: Garrya veatchii	Garrya veatchii Kellogg
JM2: Gastridium phleoides	Gastridium phleoides (Nees & Meyen) C.E. Hubb.
JM1: Gastridium ventricosum	Gastridium phleoides (Nees & Meyen) C.E. Hubb.
JM2: Gaudinia fragilis	Gaudinia fragilis (L.) P. Beauv.
JM1: Gaultheria humifusa	Gaultheria humifusa (Graham) Rydb.
JM1: Gaultheria ovatifolia	Gaultheria ovatifolia A. Gray
JM1: Gaultheria shallon	Gaultheria shallon Pursh
JM1: Gaura coccinea	Oenothera suffrutescens (Ser.) W.L. Wagner & Hoch
JMS: Gaura coccinea var. glabra	Oenothera suffrutescens (Ser.) W.L. Wagner & Hoch
JM1: Gaura drummondii	Oenothera xenogaura W.L. Wagner & Hoch
JMS: Gaura mollis	Oenothera curtiflora W.L. Wagner & Hoch
JMS: Gaura odorata	Oenothera xenogaura W.L. Wagner & Hoch
JMS: Gaura odorata	misappl. to Oenothera xenogaura W.L. Wagner & Hoch
JM1: Gaura parviflora	Oenothera curtiflora W.L. Wagner & Hoch
JMS: Gaura parviflora var. lachnocarpa	Oenothera curtiflora W.L. Wagner & Hoch
JM1: Gaura sinuata	Oenothera sinuosa W.L. Wagner & Hoch
JMS: Gaura villosa	Oenothera sinuosa W.L. Wagner & Hoch
JMS: Gaura villosa var. mckelveyae	Oenothera sinuosa W.L. Wagner & Hoch
JMS: Gaura villosa var. villosa	Oenothera sinuosa W.L. Wagner & Hoch
JM1: Gayophytum decipiens	Gayophytum decipiens H. Lewis & Szweyk.
JM1: Gayophytum diffusum	Gayophytum diffusum Torr. & A. Gray
JM1: Gayophytum diffusum subsp. diffusum	Gayophytum diffusum Torr. & A. Gray subsp. diffusum
JM1: Gayophytum diffusum subsp. parviflorum	Gayophytum diffusum subsp. parviflorum H. Lewis & Szweyk.
JM1: Gayophytum eriospermum	Gayophytum eriospermum Coville
JM1: Gayophytum heterozygum	Gayophytum heterozygum H. Lewis & Szweyk.
JM1: Gayophytum humile	Gayophytum humile A. Juss.
JMS: Gayophytum nuttallii	Gayophytum humile A. Juss.
JM1: Gayophytum oligospermum	Gayophytum oligospermum H. Lewis & Szweyk.
JM1: Gayophytum racemosum	Gayophytum racemosum Torr. & A. Gray
JM1: Gayophytum ramosissimum	Gayophytum ramosissimum Torr. & A. Gray
JM1: Gazania linearis	Gazania linearis (Thunb.) Druce
JM1: Genista canariensis	Genista canariensis L.
JM1: Genista linifolia	Genista linifolia L.
JM1: Genista maderensis	Genista maderensis (Webb & Berthel.) Lowe
JM2: Genista monosperma	Genista monosperma (L.) Lam.
JM1: Genista monspessulana	Genista monspessulana (L.) L.A.S. Johnson
JM1: Genista stenopetala	excluded
JM2: Gentiana affinis	Gentiana affinis Griseb.
JM1: Gentiana affinis var. ovata	Gentiana affinis Griseb. var. ovata A. Gray
JMS: Gentiana affinis var. parvidentata	Gentiana affinis Griseb. var. ovata A. Gray
JM1: Gentiana calycosa	Gentiana calycosa Griseb.
JM1: Gentiana fremontii	Gentiana fremontii Torr.
JM1: Gentiana newberryi	Gentiana newberryi A. Gray
JM1: Gentiana newberryi var. newberryi	Gentiana newberryi A. Gray var. newberryi
JM1: Gentiana newberryi var. tiogana	Gentiana newberryi var. tiogana (A. Heller) J.S. Pringle
JMS: Gentiana oregana	Gentiana affinis Griseb. var. ovata A. Gray
JM1: Gentiana plurisetosa	Gentiana plurisetosa C.T. Mason
JM1: Gentiana prostrata	Gentiana prostrata Haenke
JM1: Gentiana sceptrum	Gentiana sceptrum Griseb.
JM1: Gentiana setigera	Gentiana setigera A. Gray
JMS: Gentiana tenella	Comastoma tenellum (Rottb.) Toyok.
JM2: Gentianella amarella	Gentianella amarella (L.) B&ouml;rner
JM1: Gentianella amarella subsp. acuta	Gentianella amarella (L.) B&ouml;rner subsp. acuta (Michx.) J.M. Gillett
JMS: Gentianella tenella	Comastoma tenellum (Rottb.) Toyok.
JM1: Gentianella tenella subsp. tenella	Comastoma tenellum (Rottb.) Toyok.
JMS: Gentianella tenella var. tenella	Comastoma tenellum (Rottb.) Toyok.
JM1: Gentianopsis holopetala	Gentianopsis holopetala (A. Gray) H.H. Iltis
JM1: Gentianopsis simplex	Gentianopsis simplex (A. Gray) H.H. Iltis
JM1: Geraea canescens	Geraea canescens Torr. & A. Gray
JM1: Geraea viscida	Geraea viscida (A. Gray) S.F. Blake
JM2: Geranium aequale	Geranium aequale (Bab.) Aedo
JM1: Geranium anemonifolium	Geranium palmatum Cav.
JM1: Geranium bicknellii	Geranium bicknellii Britton
JM1: Geranium californicum	Geranium californicum G.N. Jones & F.L. Jones
JM1: Geranium carolinianum	Geranium carolinianum L.
JM2: Geranium columbinum	Geranium columbinum L.
JMS: Geranium concinnum	Geranium californicum G.N. Jones & F.L. Jones
JM2: Geranium core-core	Geranium core-core Steud.
JM1: Geranium dissectum	Geranium dissectum L.
JM2: Geranium lucidum	Geranium lucidum L.
JMS: Geranium microphyllum	Geranium potentilloides DC.
JM1: Geranium molle	Geranium molle L.
JM1: Geranium oreganum	Geranium oreganum Howell
JM2: Geranium palmatum	Geranium palmatum Cav.
JMS: Geranium pilosum	Geranium solanderi Carolin
JM1: Geranium potentilloides	Geranium potentilloides DC.
JM2: Geranium purpureum	Geranium purpureum Vill.
JM1: Geranium pusillum	Geranium pusillum L.
JM2: Geranium pyrenaicum	Geranium pyrenaicum Burm. f.
JM1: Geranium retrorsum	misappl. to Geranium core-core
JM1: Geranium richardsonii	Geranium richardsonii Fisch. & Trautv.
JM1: Geranium robertianum	Geranium robertianum L.
JM2: Geranium rotundifolium	Geranium rotundifolium L.
JM2: Geranium solanderi	Geranium solanderi Carolin
JMS: Geranium sphaerospermum	Geranium carolinianum L.
JM2: Geranium texanum	Geranium texanum (Trel.) A. Heller
JM1: Geranium viscosissimum	Geranium viscosissimum Fisch. & C.A. Mey.
JMS: Geranium viscosissimum var. incisum	Geranium oreganum Howell
JM1: Geum aleppicum	Geum aleppicum Jacq.
JM1: Geum macrophyllum	Geum macrophyllum Willd.
JM2: Geum macrophyllum var. macrophyllum	Geum macrophyllum Willd. var. macrophyllum
JM2: Geum macrophyllum var. perincisum	Geum macrophyllum var. perincisum (Rydb.) Raup
JM1: Geum triflorum	Geum triflorum Pursh var. ciliatum (Pursh) Fassett
JMS: Geum triflorum var. canescens	Geum triflorum Pursh var. ciliatum (Pursh) Fassett
JM2: Geum triflorum var. ciliatum	Geum triflorum Pursh var. ciliatum (Pursh) Fassett
JM1: Gilia achilleifolia	Gilia achilleifolia Benth.
JM1: Gilia achilleifolia subsp. achilleifolia	Gilia achilleifolia Benth. subsp. achilleifolia
JM1: Gilia achilleifolia subsp. multicaulis	Gilia achilleifolia subsp. multicaulis (Benth.) V.E. Grant & A.D. Grant
JM1: Gilia aliquanta	Gilia aliquanta A.D. Grant & V.E. Grant
JM1: Gilia aliquanta subsp. aliquanta	Gilia aliquanta A.D. Grant & V.E. Grant subsp. aliquanta
JM1: Gilia aliquanta subsp. breviloba	Gilia aliquanta subsp. breviloba A.D. Grant & V.E. Grant
JM1: Gilia angelensis	Gilia angelensis V.E. Grant
JM1: Gilia australis	Saltugilia australis (H. Mason & A.D. Grant) L.A. Johnson
JM1: Gilia austro-occidentalis	Gilia austro-occidentalis (A.D. Grant & V.E. Grant) A.D. Grant & V.E. Grant
JM1: Gilia brecciarum	Gilia brecciarum M.E. Jones; Gilia jacens A.D. Grant & V.E. Grant
JM1: Gilia brecciarum subsp. brecciarum	Gilia brecciarum M.E. Jones subsp. brecciarum
JM1: Gilia brecciarum subsp. jacens	Gilia jacens A.D. Grant & V.E. Grant
JM1: Gilia brecciarum subsp. neglecta	Gilia brecciarum subsp. neglecta A.D. Grant & V.E. Grant
JM1: Gilia campanulata	Linanthus campanulatus (A. Gray) J.M. Porter & L.A. Johnson
JM1: Gilia cana	Gilia cana (M.E. Jones) A. Heller
JM1: Gilia cana subsp. bernardina	Gilia cana subsp. bernardina A.D. Grant & V.E. Grant
JM1: Gilia cana subsp. cana	Gilia cana (M.E. Jones) A. Heller subsp. cana
JM1: Gilia cana subsp. speciformis	Gilia cana subsp. speciformis A.D. Grant & V.E. Grant
JM1: Gilia cana subsp. speciosa	Gilia cana subsp. speciosa (Jeps.) A.D. Grant & V.E. Grant
JM1: Gilia cana subsp. triceps	Gilia cana subsp. triceps (Brand) A.D. Grant & V.E. Grant
JM1: Gilia capillaris	Navarretia capillaris (Kellogg) Kuntze
JM1: Gilia capitata	Gilia capitata Sims
JM1: Gilia capitata subsp. abrotanifolia	Gilia capitata subsp. abrotanifolia (Greene) V.E. Grant
JM1: Gilia capitata subsp. capitata	Gilia capitata Sims subsp. capitata
JM1: Gilia capitata subsp. chamissonis	Gilia capitata subsp. chamissonis (Greene) V.E. Grant
JM1: Gilia capitata subsp. mediomontana	Gilia capitata subsp. mediomontana V.E. Grant
JM1: Gilia capitata subsp. pacifica	Gilia capitata subsp. pacifica V.E. Grant
JM1: Gilia capitata subsp. pedemontana	Gilia capitata subsp. pedemontana V.E. Grant
JM1: Gilia capitata subsp. staminea	Gilia capitata subsp. staminea (Greene) V.E. Grant
JM1: Gilia capitata subsp. tomentosa	Gilia capitata subsp. tomentosa (Brand) V.E. Grant
JM1: Gilia caruifolia	Saltugilia caruifolia (Abrams) L.A. Johnson
JM1: Gilia clivorum	Gilia clivorum (Jeps.) V.E. Grant
JM1: Gilia clokeyi	Gilia clokeyi H. Mason
JM1: Gilia diegensis	Gilia diegensis (Munz) A.D. Grant & V.E. Grant
JM1: Gilia filiformis	Linanthus filiformis (A. Gray) J.M. Porter & L.A. Johnson
JM1: Gilia hutchinsifolia	Aliciella hutchinsifolia (Rydb.) J.M. Porter
JM1: Gilia inconspicua	Gilia inconspicua (Sm.) Sweet
JM1: Gilia interior	Gilia interior (H. Mason & A.D. Grant) A.D. Grant
JM1: Gilia inyoensis	Linanthus inyoensis (I.M. Johnst.) J.M. Porter & L.A. Johnson
JM2: Gilia jacens	Gilia jacens A.D. Grant & V.E. Grant
JM1: Gilia latiflora	Gilia latiflora (A. Gray) A. Gray
JM1: Gilia latiflora subsp. cuyamensis	Gilia latiflora subsp. cuyamensis A.D. Grant & V.E. Grant
JM1: Gilia latiflora subsp. davyi	Gilia latiflora subsp. davyi (Milliken) A.D. Grant & V.E. Grant
JM1: Gilia latiflora subsp. elongata	Gilia latiflora subsp. elongata A.D. Grant & V.E. Grant
JM1: Gilia latiflora subsp. latiflora	Gilia latiflora (A. Gray) A. Gray subsp. latiflora
JM1: Gilia latifolia	Aliciella latifolia (S. Watson) J.M. Porter subsp. latifolia
JMS: Gilia latimeri	Saltugilia latimeri T.L. Weese & L.A. Johnson
JM1: Gilia leptalea	Navarretia leptalea (A. Gray) L.A. Johnson
JM1: Gilia leptalea subsp. bicolor	Navarretia leptalea subsp. bicolor (H. Mason & A.D. Grant) L.A. Johnson
JM1: Gilia leptalea subsp. leptalea	Navarretia leptalea (A. Gray) L.A. Johnson subsp. leptalea
JM1: Gilia leptantha	Gilia leptantha Parish
JM1: Gilia leptantha subsp. leptantha	Gilia leptantha Parish subsp. leptantha
JM1: Gilia leptantha subsp. pinetorum	Gilia leptantha subsp. pinetorum A.D. Grant & V.E. Grant
JM1: Gilia leptantha subsp. purpusii	Gilia leptantha subsp. purpusii (Milliken) A.D. Grant & V.E. Grant
JM1: Gilia leptantha subsp. transversa	Gilia leptantha subsp. transversa A.D. Grant & V.E. Grant
JM1: Gilia leptomeria	Aliciella leptomeria (A. Gray) J.M. Porter
JM1: Gilia lottiae	Aliciella lottiae (A.G. Day) J.M. Porter
JM1: Gilia maculata	Linanthus maculatus (Parish) Milliken
JM1: Gilia malior	Gilia malior A.G. Day & V.E. Grant
JM1: Gilia micromeria	Aliciella micromeria (A. Gray) J.M. Porter
JM1: Gilia millefoliata	Gilia millefoliata Fisch. & C.A. Mey.
JM1: Gilia minor	Gilia minor A.D. Grant & V.E. Grant
JM1: Gilia modocensis	Gilia modocensis Eastw.
JM1: Gilia nevinii	Gilia nevinii A. Gray
JM1: Gilia ochroleuca	Gilia ochroleuca M.E. Jones
JM1: Gilia ochroleuca subsp. bizonata	Gilia ochroleuca subsp. bizonata A.D. Grant & V.E. Grant
JM1: Gilia ochroleuca subsp. exilis	Gilia ochroleuca subsp. exilis (A. Gray) A.D. Grant & V.E. Grant
JM1: Gilia ochroleuca subsp. ochroleuca	Gilia ochroleuca M.E. Jones subsp. ochroleuca
JM1: Gilia ochroleuca subsp. vivida	Gilia ochroleuca subsp. vivida (A.D. Grant & V.E. Grant) A.D. Grant & V.E. Grant
JM1: Gilia ophthalmoides	Gilia ophthalmoides Brand
JM1: Gilia ripleyi	Aliciella ripleyi (Barneby) J.M. Porter
JM1: Gilia salticola	Gilia salticola Eastw.
JM1: Gilia scopulorum	Gilia scopulorum M.E. Jones
JM1: Gilia sinistra	Navarretia sinistra (M.E. Jones) L.A. Johnson
JM1: Gilia sinistra subsp. pinnatisecta	Navarretia sinistra subsp. pinnatisecta (H. Mason & A.D. Grant) L.A. Johnson
JM1: Gilia sinistra subsp. sinistra	Navarretia sinistra (M.E. Jones) L.A. Johnson subsp. sinistra
JM1: Gilia sinuata	Gilia sinuata Benth.
JM1: Gilia splendens	Saltugilia splendens (H. Mason & A.D. Grant) L.A. Johnson
JM1: Gilia splendens subsp. grantii	Saltugilia splendens subsp. grantii (Brand) L.A. Johnson
JM1: Gilia splendens subsp. splendens	Saltugilia splendens (H. Mason & A.D. Grant) L.A. Johnson subsp. splendens
JM1: Gilia stellata	Gilia stellata A. Heller
JM1: Gilia subacaulis	Aliciella monoensis J.M. Porter
JM1: Gilia tenerrima	Lathrocasis tenerrima (A. Gray) L.A. Johnson
JM1: Gilia tenuiflora	Gilia tenuiflora Benth.
JM1: Gilia tenuiflora subsp. amplifaucalis	Gilia tenuiflora subsp. amplifaucalis A.D. Grant & V.E. Grant
JM1: Gilia tenuiflora subsp. arenaria	Gilia tenuiflora subsp. arenaria (Benth.) A.D. Grant & V.E. Grant
JM1: Gilia tenuiflora subsp. hoffmannii	Gilia tenuiflora subsp. hoffmannii (Eastw.) A.D. Grant & V.E. Grant
JM1: Gilia tenuiflora subsp. tenuiflora	Gilia tenuiflora Benth. subsp. tenuiflora
JM1: Gilia transmontana	Gilia transmontana (H. Mason & A.D. Grant) A.D. Grant & V.E. Grant
JM1: Gilia tricolor	Gilia tricolor Benth.
JM1: Gilia tricolor subsp. diffusa	Gilia tricolor subsp. diffusa (Congdon) H. Mason & A.D. Grant
JM1: Gilia tricolor subsp. tricolor	Gilia tricolor Benth. subsp. tricolor
JM1: Gilia triodon	Aliciella triodon (Eastw.) Brand
JM2: Gilia yorkii	Gilia yorkii Shevock & A.G. Day
JM1: Gilmania luteola	Gilmania luteola (Coville) Coville
JM1: Githopsis diffusa	Githopsis diffusa A. Gray
JM1: Githopsis diffusa subsp. candida	Githopsis diffusa subsp. candida (Ewan) Morin
JM1: Githopsis diffusa subsp. diffusa	Githopsis diffusa A. Gray subsp. diffusa
JM1: Githopsis diffusa subsp. filicaulis	Githopsis diffusa subsp. filicaulis (Ewan) Morin
JM1: Githopsis diffusa subsp. robusta	Githopsis diffusa subsp. robusta Morin
JM1: Githopsis pulchella	Githopsis pulchella Vatke
JM1: Githopsis pulchella subsp. campestris	Githopsis pulchella subsp. campestris Morin
JM1: Githopsis pulchella subsp. pulchella	Githopsis pulchella Vatke subsp. pulchella
JM1: Githopsis pulchella subsp. serpentinicola	Githopsis pulchella subsp. serpentinicola Morin
JM2: Githopsis pulchella var. glabra	Githopsis pulchella var. glabra (Jeps.) Morin
JM2: Githopsis pulchella var. pulchella	Githopsis pulchella Vatke var. pulchella
JM1: Githopsis specularioides	Githopsis specularioides Nutt.
JM1: Githopsis tenella	Githopsis tenella Morin
JM1: Gladiolus italicus	excluded
JM1: Gladiolus tristis	excluded
JMS: Glandularia gooddingii	Verbena gooddingii Briq.
JMS: Glandularia pulchella	Verbena pulchella Sweet
JM1: Glaucium flavum	Glaucium flavum Crantz
JM1: Glaux maritima	Glaux maritima L.
JM2: Glebionis coronaria	Glebionis coronaria (L.) Spach
JM2: Glebionis segetum	Glebionis segetum (L.) Fourr.
JM1: Glechoma hederacea	Glechoma hederacea L.
JM2: Gleditsia triacanthos	Gleditsia triacanthos L.
JMS: Glehnia leiocarpa	Glehnia littoralis Miq. subsp. leiocarpa (Mathias) Hult&eacute;n
JM2: Glehnia littoralis	Glehnia littoralis Miq.
JM1: Glehnia littoralis subsp. leiocarpa	Glehnia littoralis Miq. subsp. leiocarpa (Mathias) Hult&eacute;n
JM1: Glinus lotoides	Glinus lotoides L.
JM2: Glinus radiatus	Glinus radiatus (Ruiz & Pav.) Rohrb.
JM1: Glossopetalon pungens	Glossopetalon pungens Brandegee
JM1: Glossopetalon spinescens	Glossopetalon spinescens A. Gray var. aridum M.E. Jones
JM2: Glossopetalon spinescens var. aridum	Glossopetalon spinescens A. Gray var. aridum M.E. Jones
JM2: Glyceria &times;occidentalis	Glyceria &times;occidentalis (Piper) J.C. Nelson
JM1: Glyceria borealis	Glyceria borealis (Nash) Batch.
JMS: Glyceria davyi	Glyceria leptostachya Buckley
JM2: Glyceria declinata	Glyceria declinata Br&eacute;b.
JM1: Glyceria elata	Glyceria elata (Rydb.) M.E. Jones
JM2: Glyceria fluitans	Glyceria fluitans (L.) R. Br.
JM1: Glyceria grandis	Glyceria grandis S. Watson
JM1: Glyceria leptostachya	Glyceria leptostachya Buckley
JM1: Glyceria occidentalis	Glyceria &times;occidentalis (Piper) J.C. Nelson
JM1: Glyceria striata	Glyceria striata (Lam.) Hitchc.
JM1: Glycyrrhiza glabra	Glycyrrhiza glabra L.
JM1: Glycyrrhiza lepidota	Glycyrrhiza lepidota Pursh
JM1: Glyptopleura marginata	Glyptopleura marginata D.C. Eaton
JM2: Glyptopleura setulosa	Glyptopleura setulosa A. Gray
JMS: Gnaphalium beneolens	Pseudognaphalium beneolens (Davidson) Anderb.
JM1: Gnaphalium bicolor	Pseudognaphalium biolettii Anderb.
JM1: Gnaphalium californicum	Pseudognaphalium californicum (DC.) Anderb.
JM1: Gnaphalium canescens	Pseudognaphalium canescens (DC.) Anderb.; Pseudognaphalium beneolens (Davidson) Anderb.; Pseudognaphalium microcephalum (Nutt.) Anderb.; Pseudognaphalium thermale (E.E. Nelson) G.L. Nesom
JM1: Gnaphalium canescens subsp. beneolens	Pseudognaphalium beneolens (Davidson) Anderb.
JM1: Gnaphalium canescens subsp. canescens	Pseudognaphalium canescens (DC.) Anderb.
JM1: Gnaphalium canescens subsp. microcephalum	Pseudognaphalium microcephalum (Nutt.) Anderb.
JM1: Gnaphalium canescens subsp. thermale	Pseudognaphalium thermale (E.E. Nelson) G.L. Nesom
JMS: Gnaphalium chilense	Pseudognaphalium stramineum (Kunth) Anderb.
JM1: Gnaphalium collinum	Euchiton gymnocephalus (DC.) Holub
JMS: Gnaphalium gymnocephalum	Euchiton gymnocephalus (DC.) Holub
JM1: Gnaphalium japonicum	Euchiton sphaericus (Willd.) Holub
JM1: Gnaphalium leucocephalum	Pseudognaphalium leucocephalum (A. Gray) Anderb.
JM1: Gnaphalium luteo-album	Pseudognaphalium luteoalbum (L.) Hilliard & B.L. Burtt
JMS: Gnaphalium luteoalbum	Pseudognaphalium luteoalbum (L.) Hilliard & B.L. Burtt
JMS: Gnaphalium macounii	Pseudognaphalium macounii (Greene) Kartesz
JMS: Gnaphalium microcephalum	Pseudognaphalium microcephalum (Nutt.) Anderb.
JMS: Gnaphalium microcephalum var. thermale	Pseudognaphalium thermale (E.E. Nelson) G.L. Nesom
JM1: Gnaphalium palustre	Gnaphalium palustre Nutt.
JM1: Gnaphalium purpureum	Gamochaeta ustulata (Nutt.) Holub
JM1: Gnaphalium ramosissimum	Pseudognaphalium ramosissimum (Nutt.) Anderb.
JMS: Gnaphalium roseum	Pseudognaphalium roseum (Kunth) Anderb.
JM1: Gnaphalium stramineum	Pseudognaphalium stramineum (Kunth) Anderb.
JMS: Gnaphalium thermale	Pseudognaphalium thermale (E.E. Nelson) G.L. Nesom
JMS: Gnaphalium wrightii	Pseudognaphalium canescens (DC.) Anderb.
JMS: Gomphocarpus fruticosus	Asclepias fruticosa L.
JM1: Goodmania luteola	Goodmania luteola (Parry) Reveal & Ertter
JM1: Goodyera oblongifolia	Goodyera oblongifolia Raf.
JM2: Gossypium hirsutum	Gossypium hirsutum L.
JMS: Graphephorum wolfii	Trisetum wolfii Vasey
JM1: Gratiola ebracteata	Gratiola ebracteata A. DC.
JM1: Gratiola heterosepala	Gratiola heterosepala H. Mason & Bacig.
JM1: Gratiola neglecta	Gratiola neglecta Torr.
JM1: Grayia spinosa	Grayia spinosa (Hook.) Moq.
JM2: Grevillea robusta	Grevillea robusta R. Br.
JM2: Grindelia &times;paludosa	Grindelia &times;paludosa Greene
JM1: Grindelia camporum	Grindelia camporum Greene
JMS: Grindelia camporum var. bracteosa	Grindelia camporum Greene
JM1: Grindelia camporum var. bracteosum	Grindelia camporum Greene
JM1: Grindelia camporum var. camporum	Grindelia camporum Greene
JM2: Grindelia fraxinipratensis	Grindelia fraxinipratensis Reveal & Beatley
JM1: Grindelia fraxino-pratensis	Grindelia fraxinipratensis Reveal & Beatley
JM2: Grindelia hallii	Grindelia hallii Steyerm.
JM1: Grindelia hirsutula	Grindelia hirsutula Hook. & Arn.; Grindelia camporum Greene; Grindelia hallii Steyerm.
JM1: Grindelia hirsutula var. davyi	Grindelia camporum Greene
JM1: Grindelia hirsutula var. hallii	Grindelia hallii Steyerm.
JM1: Grindelia hirsutula var. hirsutula	Grindelia hirsutula Hook. & Arn.
JM1: Grindelia hirsutula var. maritima	Grindelia hirsutula Hook. & Arn.
JM1: Grindelia nana	Grindelia nana Nutt.
JM2: Grindelia squarrosa	Grindelia squarrosa (Pursh) Dunal
JM1: Grindelia squarrosa var. serrulata	Grindelia squarrosa (Pursh) Dunal var. serrulata (Rydb.) Steyerm.
JM1: Grindelia stricta	Grindelia stricta DC.
JM1: Grindelia stricta var. angustifolia	Grindelia stricta var. angustifolia (A. Gray) M.A. Lane
JM1: Grindelia stricta var. platyphylla	Grindelia stricta var. platyphylla (Greene) M.A. Lane
JM1: Grindelia stricta var. stricta	Grindelia stricta DC. var. stricta
JM2: Grusonia parishii	Grusonia parishii (Orcutt) Pinkava
JM2: Grusonia pulchella	Grusonia pulchella (Engelm.) H. Rob.
JM2: Guilleminea densa	Guilleminea densa (Willd.) Moq.
JM1: Guilleminea densa var. aggregata	Guilleminea densa (Willd.) Moq. var. aggregata Uline & W.L. Bray
JMS: Guillenia cooperi	Caulanthus cooperi (S. Watson) Payson
JM1: Guillenia flavescens	Caulanthus flavescens (Hook.) Payson
JMS: Guillenia heterophylla	Caulanthus heterophyllus (Nutt.) Payson
JM1: Guillenia lasiophylla	Caulanthus lasiophyllus (Hook. & Arn.) Payson
JM1: Guillenia lemmonii	Caulanthus anceps Payson
JM1: Guizotia abyssinica	excluded
JM1: Gunnera tinctoria	Gunnera tinctoria (Molina) Mirb.
JM1: Gutierrezia californica	Gutierrezia californica (DC.) Torr. & A. Gray
JM1: Gutierrezia microcephala	Gutierrezia microcephala (DC.) A. Gray
JM1: Gutierrezia sarothrae	Gutierrezia sarothrae (Pursh) Britton & Rusby
JM1: Gymnosteris parvula	Gymnosteris parvula A. Heller
JM2: Gypsophila elegans	Gypsophila elegans M. Bieb.
JM1: Gypsophila elegans var. elegans	Gypsophila elegans M. Bieb.
JM2: Gypsophila paniculata	Gypsophila paniculata L.
JM1: Gypsophila paniculata var. paniculata	Gypsophila paniculata L.
JM1: Gypsophila scorzonerifolia	Gypsophila scorzonerifolia Ser.
JMS: Habenaria saccata	Platanthera stricta Lindl.
JM1: Hackelia amethystina	Hackelia amethystina Eastw.
JM1: Hackelia bella	Hackelia bella (J.F. Macbr.) I.M. Johnst.
JM1: Hackelia brevicula	Hackelia brevicula (Jeps.) J.L. Gentry
JM1: Hackelia californica	Hackelia californica (A. Gray) I.M. Johnst.
JM1: Hackelia cusickii	Hackelia cusickii (Piper) Brand
JM1: Hackelia floribunda	Hackelia floribunda (Lehm.) I.M. Johnst.
JMS: Hackelia longituba	Hackelia velutina (Piper) I.M. Johnst.
JM1: Hackelia micrantha	Hackelia micrantha (Eastw.) J.L. Gentry
JM1: Hackelia mundula	Hackelia mundula (Jeps.) Ferris
JM1: Hackelia nervosa	Hackelia nervosa (Kellogg) I.M. Johnst.
JM1: Hackelia setosa	Hackelia setosa (Piper) I.M. Johnst.
JM1: Hackelia sharsmithii	Hackelia sharsmithii I.M. Johnst.
JM1: Hackelia velutina	Hackelia velutina (Piper) I.M. Johnst.
JM1: Hainardia cylindrica	Hainardia cylindrica (Willd.) Greuter
JM1: Halimodendron halodendron	Halimodendron halodendron (Pall.) Voss
JMS: Halimolobos diffusa	Halimolobos jaegeri (Munz) Rollins
JMS: Halimolobos diffusa var. jaegeri	Halimolobos jaegeri (Munz) Rollins
JM1: Halimolobos jaegeri	Halimolobos jaegeri (Munz) Rollins
JM1: Halimolobos virgata	Transberingia bursifolia (DC.) Al-Shehbaz & O'Kane subsp. virgata (Nutt.) Al-Shehbaz & O'Kane
JM1: Halodule wrightii	excluded
JM1: Halogeton glomeratus	Halogeton glomeratus (M. Bieb.) C.A. Mey.
JM1: Haloragis erecta	excluded
JM2: Harmonia doris-nilesiae	Harmonia doris-nilesiae (T.W. Nelson & J.P. Nelson) B.G. Baldwin
JM2: Harmonia guggolziorum	Harmonia guggolziorum B.G. Baldwin
JM2: Harmonia hallii	Harmonia hallii (D.D. Keck) B.G. Baldwin
JM2: Harmonia nutans	Harmonia nutans (Greene) B.G. Baldwin
JM2: Harmonia stebbinsii	Harmonia stebbinsii (T.W. Nelson & J.P. Nelson) B.G. Baldwin
JM1: Harpagonella palmeri	Harpagonella palmeri A. Gray
JM1: Hastingsia alba	Hastingsia alba (Durand) S. Watson
JM1: Hastingsia serpentinicola	Hastingsia serpentinicola Becking
JM1: Hazardia brickellioides	Hazardia brickellioides (S.F. Blake) W.D. Clark
JM1: Hazardia cana	Hazardia cana (A. Gray) Greene
JM1: Hazardia detonsa	Hazardia detonsa (Greene) Greene
JM1: Hazardia orcuttii	Hazardia orcuttii (A. Gray) Greene
JM1: Hazardia squarrosa	Hazardia squarrosa (Hook. & Arn.) Greene
JM1: Hazardia squarrosa var. grindelioides	Hazardia squarrosa var. grindelioides (DC.) W.D. Clark
JM1: Hazardia squarrosa var. obtusa	Hazardia squarrosa var. obtusa (Greene) Jeps.
JM1: Hazardia squarrosa var. squarrosa	Hazardia squarrosa (Hook. & Arn.) Greene var. squarrosa
JM1: Hazardia stenolepis	Hazardia stenolepis (H.M. Hall) Hoover
JM1: Hazardia whitneyi	Hazardia whitneyi (A. Gray) Greene
JM1: Hazardia whitneyi var. discoidea	Hazardia whitneyi var. discoidea (J.T. Howell) W.D. Clark
JM1: Hazardia whitneyi var. whitneyi	Hazardia whitneyi (A. Gray) Greene var. whitneyi
JMS: Hebe &times;franciscana	excluded
JM1: Hebe speciosa	excluded
JM1: Hecastocleis shockleyi	Hecastocleis shockleyi A. Gray
JM1: Hedeoma drummondii	Hedeoma drummondii Benth.
JM2: Hedeoma nana	Hedeoma nana (Torr.) Briq.
JM2: Hedeoma nana subsp. californica	Hedeoma nana (Torr.) Briq. subsp. californica W.S. Stewart
JMS: Hedeoma nanum	Hedeoma nana (Torr.) Briq.
JM1: Hedeoma nanum subsp. californicum	Hedeoma nana (Torr.) Briq. subsp. californica W.S. Stewart
JM2: Hedera canariensis	Hedera canariensis Willd.
JM1: Hedera helix	Hedera helix L.; Hedera canariensis Willd.
JMS: Hedera helix subsp. canariensis	Hedera canariensis Willd.
JMS: Hedera helix subsp. helix	Hedera helix L.
JM2: Hedychium flavescens	Hedychium flavescens Roscoe
JM1: Hedypnois cretica	Hedypnois cretica (L.) Dum. Cours.
JMS: Heleniastrum autumnale	Helenium autumnale L.
JMS: Heleniastrum bigelovii	Helenium bigelovii Torr. & A. Gray
JMS: Heleniastrum bolanderi	Helenium bolanderi A. Gray
JMS: Heleniastrum occidentale	Helenium bigelovii Torr. & A. Gray
JMS: Heleniastrum puberulum	Helenium puberulum DC.
JMS: Heleniastrum rivulare	Helenium bigelovii Torr. & A. Gray
JMS: Helenium altissimum	Helenium autumnale L.
JM1: Helenium amarum	Helenium amarum (Raf.) H. Rock
JM2: Helenium amarum var. amarum	Helenium amarum (Raf.) H. Rock var. amarum
JM1: Helenium autumnale	Helenium autumnale L.
JMS: Helenium autumnale var. canaliculatum	Helenium autumnale L.
JMS: Helenium autumnale var. fylesii	Helenium autumnale L.
JM1: Helenium autumnale var. grandiflorum	Helenium autumnale L.
JM1: Helenium autumnale var. montanum	Helenium autumnale L.
JMS: Helenium autumnale var. parviflorum	Helenium autumnale L.
JM1: Helenium bigelovii	Helenium bigelovii Torr. & A. Gray
JMS: Helenium bigelovii var. festivum	Helenium bolanderi A. Gray
JM1: Helenium bolanderi	Helenium bolanderi A. Gray
JMS: Helenium californicum	Helenium puberulum DC.
JMS: Helenium canaliculatum	Helenium autumnale L.
JMS: Helenium decurrens	Helenium puberulum DC.
JMS: Helenium edwardsianum	Helenium autumnale L.
JMS: Helenium grandiflorum	Helenium autumnale L.
JMS: Helenium hoopesii	Hymenoxys hoopesii (A. Gray) Bierner
JMS: Helenium huronense	Helenium autumnale L.
JMS: Helenium latifolium	Helenium autumnale L.
JMS: Helenium macranthum	Helenium autumnale L.
JMS: Helenium montanum	Helenium autumnale L.
JMS: Helenium parviflorum	Helenium autumnale L.
JM1: Helenium puberulum	Helenium puberulum DC.
JMS: Helenium pubescens	Helenium puberulum DC.
JMS: Helenium rivulare	Helenium bigelovii Torr. & A. Gray
JMS: Helenium rosilla	Helenium puberulum DC.
JMS: Helenium tenuifolium	Helenium amarum (Raf.) H. Rock var. amarum
JMS: Heleochloa schoenoides	Crypsis schoenoides (L.) Lam.
JM1: Helianthella californica	Helianthella californica A. Gray
JMS: Helianthella californica subsp. californica	Helianthella californica A. Gray var. californica
JMS: Helianthella californica subsp. nevadensis	Helianthella californica var. nevadensis (Greene) Jeps.
JMS: Helianthella californica subsp. shastensis	Helianthella californica var. shastensis W.A. Weber
JM1: Helianthella californica var. californica	Helianthella californica A. Gray var. californica
JM1: Helianthella californica var. nevadensis	Helianthella californica var. nevadensis (Greene) Jeps.
JM1: Helianthella californica var. shastensis	Helianthella californica var. shastensis W.A. Weber
JM1: Helianthella castanea	Helianthella castanea Greene
JM1: Helianthemum greenei	Helianthemum greenei B.L. Rob.
JM1: Helianthemum scoparium	Helianthemum scoparium Nutt.
JMS: Helianthemum scoparium var. aldersonii	Helianthemum scoparium Nutt.
JMS: Helianthemum scoparium var. vulgare	Helianthemum scoparium Nutt.
JMS: Helianthemum suffrutescens	Helianthemum scoparium Nutt.
JM1: Helianthus annuus	Helianthus annuus L.
JM1: Helianthus bolanderi	Helianthus bolanderi A. Gray
JM1: Helianthus californicus	Helianthus californicus DC.
JM1: Helianthus ciliaris	Helianthus ciliaris DC.
JM1: Helianthus cusickii	Helianthus cusickii A. Gray
JM2: Helianthus exilis	Helianthus exilis A. Gray
JM1: Helianthus gracilentus	Helianthus gracilentus A. Gray
JM2: Helianthus inexpectatus	Helianthus inexpectatus D.J. Keil & Elvin
JM1: Helianthus maximilianii	excluded
JM1: Helianthus niveus	Helianthus petiolaris Nutt.; Helianthus niveus (Benth.) Brandegee
JM1: Helianthus niveus subsp. canescens	Helianthus petiolaris Nutt. subsp. canescens (A. Gray) D.J. Keil
JM1: Helianthus niveus subsp. tephrodes	Helianthus niveus (Benth.) Brandegee subsp. tephrodes (A. Gray) Heiser
JM1: Helianthus nuttallii	Helianthus nuttallii Torr. & A. Gray
JM1: Helianthus nuttallii subsp. nuttallii	Helianthus nuttallii Torr. & A. Gray subsp. nuttallii
JM1: Helianthus nuttallii subsp. parishii	Helianthus nuttallii Torr. & A. Gray subsp. parishii (A. Gray) Heiser
JM2: Helianthus petiolaris	Helianthus petiolaris Nutt.
JM2: Helianthus petiolaris subsp. canescens	Helianthus petiolaris Nutt. subsp. canescens (A. Gray) D.J. Keil
JMS: Helichrysum orbiculare	Plecostachys serpyllifolia (P.J. Bergius) Hilliard & B.L. Burtt
JM2: Helichrysum petiolare	Helichrysum petiolare Hilliard & B.L. Burtt
JMS: Helichrysum serpyllifolium	Plecostachys serpyllifolia (P.J. Bergius) Hilliard & B.L. Burtt
JM1: Heliomeris hispida	excluded
JM2: Heliomeris multiflora	Heliomeris multiflora Nutt.
JM1: Heliomeris multiflora var. nevadensis	Heliomeris multiflora Nutt. var. nevadensis (A. Nelson) W.F. Yates
JM1: Heliotropium amplexicaule	Heliotropium amplexicaule Vahl
JM2: Heliotropium convolvulaceum	Heliotropium convolvulaceum (Nutt.) A. Gray
JM1: Heliotropium convolvulaceum var. californicum	Heliotropium convolvulaceum (Nutt.) A. Gray var. californicum (Greene) I.M. Johnst.
JM1: Heliotropium curassavicum	misappl. to Heliotropium curassavicum var. oculatum
JM2: Heliotropium curassavicum var. oculatum	Heliotropium curassavicum L. var. oculatum (A. Heller) Tidestr.
JM1: Heliotropium europaeum	Heliotropium europaeum L.
JM2: Helminthotheca echioides	Helminthotheca echioides (L.) Holub
JM2: Hemieva ranunculifolia	Hemieva ranunculifolia (Hook.) Raf.
JM1: Hemitomes congestum	Hemitomes congestum A. Gray
JM2: Hemizonella minima	Hemizonella minima (A. Gray) A. Gray
JM1: Hemizonia arida	Deinandra arida (D.D. Keck) B.G. Baldwin
JM1: Hemizonia clementina	Deinandra clementina (Brandegee) B.G. Baldwin
JM1: Hemizonia congesta	Hemizonia congesta DC.
JM1: Hemizonia congesta subsp. calyculata	Hemizonia congesta subsp. calyculata Babc. & H.M. Hall
JM1: Hemizonia congesta subsp. clevelandii	Hemizonia congesta subsp. clevelandii (Greene) Babc. & H.M. Hall
JM1: Hemizonia congesta subsp. congesta	Hemizonia congesta DC. subsp. congesta; Hemizonia congesta subsp. lutescens (Greene) Babc. & H.M. Hall
JM1: Hemizonia congesta subsp. leucocephala	Hemizonia congesta DC. subsp. congesta
JM2: Hemizonia congesta subsp. lutescens	Hemizonia congesta subsp. lutescens (Greene) Babc. & H.M. Hall
JM1: Hemizonia congesta subsp. luzulifolia	Hemizonia congesta subsp. luzulifolia (DC.) Babc. & H.M. Hall
JM1: Hemizonia congesta subsp. tracyi	Hemizonia congesta subsp. tracyi Babc. & H.M. Hall
JM1: Hemizonia conjugens	Deinandra conjugens (D.D. Keck) B.G. Baldwin
JM1: Hemizonia corymbosa	Deinandra corymbosa (DC.) B.G. Baldwin
JM1: Hemizonia corymbosa subsp. corymbosa	Deinandra corymbosa (DC.) B.G. Baldwin
JM1: Hemizonia corymbosa subsp. macrocephala	Deinandra corymbosa (DC.) B.G. Baldwin
JM1: Hemizonia fasciculata	Deinandra fasciculata (DC.) Greene
JM1: Hemizonia fitchii	Centromadia fitchii (A. Gray) Greene
JM1: Hemizonia floribunda	Deinandra floribunda (A. Gray) Davidson & Moxley
JM1: Hemizonia halliana	Deinandra halliana (D.D. Keck) B.G. Baldwin
JM1: Hemizonia increscens	Deinandra increscens (D.D. Keck) B.G. Baldwin; Deinandra paniculata (A. Gray) Davidson & Moxley
JM1: Hemizonia increscens subsp. foliosa	Deinandra paniculata (A. Gray) Davidson & Moxley
JM1: Hemizonia increscens subsp. increscens	Deinandra increscens (D.D. Keck) B.G. Baldwin subsp. increscens
JM1: Hemizonia increscens subsp. villosa	Deinandra increscens subsp. villosa (Tanowitz) B.G. Baldwin
JM1: Hemizonia kelloggii	Deinandra kelloggii (Greene) Greene
JM1: Hemizonia lobbii	Deinandra lobbii (Greene) Greene
JM1: Hemizonia minthornii	Deinandra minthornii (Jeps.) B.G. Baldwin
JM1: Hemizonia mohavensis	Deinandra mohavensis (D.D. Keck) B.G. Baldwin
JM1: Hemizonia pallida	Deinandra pallida (D.D. Keck) B.G. Baldwin
JM1: Hemizonia paniculata	Deinandra paniculata (A. Gray) Davidson & Moxley
JM1: Hemizonia parryi	Centromadia parryi (Greene) Greene
JM1: Hemizonia parryi subsp. australis	Centromadia parryi subsp. australis (D.D. Keck) B.G. Baldwin
JM1: Hemizonia parryi subsp. congdonii	Centromadia parryi subsp. congdonii (B.L. Rob. & Greenm.) B.G. Baldwin
JM1: Hemizonia parryi subsp. parryi	Centromadia parryi (Greene) Greene subsp. parryi
JM1: Hemizonia parryi subsp. rudis	Centromadia parryi subsp. rudis (Greene) B.G. Baldwin
JM1: Hemizonia pentactis	Deinandra pentactis (D.D. Keck) B.G. Baldwin
JM1: Hemizonia pungens	Centromadia pungens (Hook. & Arn.) Greene
JM1: Hemizonia pungens subsp. laevis	Centromadia pungens subsp. laevis (D.D. Keck) B.G. Baldwin
JM1: Hemizonia pungens subsp. maritima	Centromadia pungens (Hook. & Arn.) Greene subsp. pungens
JM1: Hemizonia pungens subsp. pungens	Centromadia pungens (Hook. & Arn.) Greene subsp. pungens
JM1: Hemizonia pungens subsp. septentrionalis	Centromadia pungens (Hook. & Arn.) Greene subsp. pungens
JM1: Heracleum lanatum	Heracleum maximum W. Bartram
JM2: Heracleum maximum	Heracleum maximum W. Bartram
JM1: Herissantia crispa	Herissantia crispa (L.) Brizicky
JM1: Herniaria hirsuta	Herniaria hirsuta L.
JM1: Herniaria hirsuta subsp. cinerea	Herniaria hirsuta var. cinerea (DC.) Loret & Barrandon
JM1: Herniaria hirsuta subsp. hirsuta	Herniaria hirsuta L. var. hirsuta
JM2: Herniaria hirsuta var. cinerea	Herniaria hirsuta var. cinerea (DC.) Loret & Barrandon
JM2: Herniaria hirsuta var. hirsuta	Herniaria hirsuta L. var. hirsuta
JM1: Hesperevax acaulis	Hesperevax acaulis (Kellogg) Greene
JM1: Hesperevax acaulis var. acaulis	Hesperevax acaulis (Kellogg) Greene var. acaulis
JM1: Hesperevax acaulis var. ambusticola	Hesperevax acaulis var. ambusticola Morefield
JM1: Hesperevax acaulis var. robustior	Hesperevax acaulis var. robustior Morefield
JM1: Hesperevax caulescens	Hesperevax caulescens (Benth.) A. Gray
JM1: Hesperevax sparsiflora	Hesperevax sparsiflora (A. Gray) Greene
JM1: Hesperevax sparsiflora var. brevifolia	Hesperevax sparsiflora var. brevifolia (A. Gray) Morefield
JM1: Hesperevax sparsiflora var. sparsiflora	Hesperevax sparsiflora (A. Gray) Greene var. sparsiflora
JM2: Hesperidanthus jaegeri	Hesperidanthus jaegeri (Rollins) Al-Shehbaz
JM1: Hesperis matronalis	Hesperis matronalis L.
JM1: Hesperocallis undulata	Hesperocallis undulata A. Gray
JM1: Hesperochiron californicus	Hesperochiron californicus (Benth.) S. Watson
JM1: Hesperochiron pumilus	Hesperochiron pumilus (Griseb.) Porter
JMS: Hesperochloa kingii	Festuca kingii (S. Watson) Cassidy
JM1: Hesperocnide tenella	Hesperocnide tenella Torr.
JM2: Hesperocyparis abramsiana	Hesperocyparis abramsiana (C.B. Wolf) Bartel
JM2: Hesperocyparis abramsiana var. butanoensis	Hesperocyparis abramsiana var. butanoensis (Silba) Bartel & R.P. Adams
JM2: Hesperocyparis bakeri	Hesperocyparis bakeri (Jeps.) Bartel
JM2: Hesperocyparis forbesii	Hesperocyparis forbesii (Jeps.) Bartel
JM2: Hesperocyparis goveniana	Hesperocyparis goveniana (Gordon) Bartel
JM2: Hesperocyparis macnabiana	Hesperocyparis macnabiana (A. Murray bis) Bartel
JM2: Hesperocyparis macrocarpa	Hesperocyparis macrocarpa (Hartw.) Bartel
JM2: Hesperocyparis nevadensis	Hesperocyparis nevadensis (Abrams) Bartel
JM2: Hesperocyparis pygmaea	Hesperocyparis pygmaea (Lemmon) Bartel
JM2: Hesperocyparis sargentii	Hesperocyparis sargentii (Jeps.) Bartel
JM2: Hesperocyparis stephensonii	Hesperocyparis stephensonii (C.B. Wolf) Bartel
JM1: Hesperolinon adenophyllum	Hesperolinon adenophyllum (A. Gray) Small
JM1: Hesperolinon bicarpellatum	Hesperolinon bicarpellatum (H. Sharsm.) H. Sharsm.
JM1: Hesperolinon breweri	Hesperolinon breweri (A. Gray) Small
JM1: Hesperolinon californicum	Hesperolinon californicum (Benth.) Small
JM1: Hesperolinon clevelandii	Hesperolinon clevelandii (Greene) Small
JM1: Hesperolinon congestum	Hesperolinon congestum (A. Gray) Small
JM1: Hesperolinon didymocarpum	Hesperolinon didymocarpum H. Sharsm.
JM1: Hesperolinon disjunctum	Hesperolinon disjunctum H. Sharsm.
JM1: Hesperolinon drymarioides	Hesperolinon drymarioides (Curran) Small
JM1: Hesperolinon micranthum	Hesperolinon micranthum (A. Gray) Small
JM1: Hesperolinon serpentinum	excluded
JM1: Hesperolinon spergulinum	Hesperolinon spergulinum (A. Gray) Small
JM1: Hesperolinon tehamense	Hesperolinon tehamense H. Sharsm.
JM2: Hesperomecon linearis	Hesperomecon linearis (Benth.) Greene
JM1: Hesperostipa comata	Stipa comata Trin. & Rupr.
JM1: Hesperostipa comata subsp. comata	Stipa comata Trin. & Rupr. var. comata
JM1: Hesperostipa comata subsp. intermedia	Stipa comata var. intermedia Scribn. & Tweedy
JM2: Hesperoyucca whipplei	Hesperoyucca whipplei (Torr.) Trel.
JM1: Heteranthemis viscidehirta	Heteranthemis viscidihirta Schott
JM2: Heteranthemis viscidihirta	Heteranthemis viscidihirta Schott
JM1: Heteranthera dubia	Heteranthera dubia (Jacq.) MacMill.
JM1: Heteranthera limosa	Heteranthera limosa (Sw.) Willd.
JM1: Heterocodon rariflorum	Heterocodon rariflorum Nutt.
JM1: Heterodraba unilateralis	Athysanus unilateralis (M.E. Jones) Jeps.
JMS: Heterogaura heterandra	Clarkia heterandra (Torr.) H. Lewis & P.H. Raven
JM1: Heteromeles arbutifolia	Heteromeles arbutifolia (Lindl.) M. Roem.
JM1: Heteropogon contortus	Heteropogon contortus (L.) Roem. & Schult.
JMS: Heterotheca echioides	Heterotheca sessiliflora
JMS: Heterotheca echioides var. bolanderi	Heterotheca sessiliflora subsp. bolanderi (A. Gray) Semple
JM1: Heterotheca grandiflora	Heterotheca grandiflora Nutt.
JM2: Heterotheca monarchensis	Heterotheca monarchensis D.A. York et al.
JM1: Heterotheca oregona	Heterotheca oregona (Nutt.) Shinners
JM1: Heterotheca oregona var. compacta	Heterotheca oregona var. compacta (D.D. Keck) Semple
JM1: Heterotheca oregona var. oregona	Heterotheca oregona (Nutt.) Shinners var. oregona
JM1: Heterotheca oregona var. rudis	Heterotheca oregona var. rudis (Greene) Semple
JM1: Heterotheca oregona var. scaberrima	Heterotheca oregona var. scaberrima (A. Gray) Semple
JM1: Heterotheca psammophila	Heterotheca subaxillaris (Lam.) Britton & Rusby subsp. latifolia (Buckley) Semple
JM1: Heterotheca sessiliflora	Heterotheca sessiliflora (Nutt.) Shinners
JM1: Heterotheca sessiliflora subsp. bolanderi	Heterotheca sessiliflora subsp. bolanderi (A. Gray) Semple
JM1: Heterotheca sessiliflora subsp. echioides	Heterotheca sessiliflora subsp. echioides (Benth.) Semple
JM1: Heterotheca sessiliflora subsp. fastigiata	Heterotheca sessiliflora subsp. fastigiata (Greene) Semple
JM1: Heterotheca sessiliflora subsp. sessiliflora	Heterotheca sessiliflora (Nutt.) Shinners subsp. sessiliflora
JMS: Heterotheca sessiliflora var. echioides	Heterotheca sessiliflora subsp. echioides (Benth.) Semple
JMS: Heterotheca sessiliflora var. fastigiata	Heterotheca sessiliflora subsp. fastigiata (Greene) Semple
JMS: Heterotheca sessiliflora var. sessiliflora	Heterotheca sessiliflora (Nutt.) Shinners subsp. sessiliflora
JM2: Heterotheca shevockii	Heterotheca shevockii (Semple) Semple
JM2: Heterotheca subaxillaris	Heterotheca subaxillaris (Lam.) Britton & Rusby
JM2: Heterotheca subaxillaris subsp. latifolia	Heterotheca subaxillaris (Lam.) Britton & Rusby subsp. latifolia (Buckley) Semple
JM1: Heterotheca villosa	Heterotheca villosa (Pursh) Shinners; Heterotheca shevockii (Semple) Semple
JM1: Heterotheca villosa var. hispida	Heterotheca villosa var. minor (Hook.) Semple
JM2: Heterotheca villosa var. minor	Heterotheca villosa var. minor (Hook.) Semple
JM1: Heterotheca villosa var. scabra	Heterotheca villosa var. scabra (Eastw.) Semple
JM1: Heterotheca villosa var. shevockii	Heterotheca shevockii (Semple) Semple
JM1: Heterotheca villosa var. villosa	Heterotheca villosa var. minor (Hook.) Semple
JM1: Heuchera abramsii	Heuchera abramsii Rydb.
JM1: Heuchera brevistaminea	Heuchera brevistaminea Wiggins
JM2: Heuchera caespitosa	Heuchera caespitosa Eastw.
JM1: Heuchera cespitosa	Heuchera caespitosa Eastw.
JM2: Heuchera cylindrica	Heuchera cylindrica Douglas
JM1: Heuchera cylindrica var. alpina	Heuchera cylindrica Douglas
JM1: Heuchera duranii	Heuchera parvifolia Torr. & A. Gray
JM1: Heuchera elegans	Heuchera caespitosa Eastw.
JM2: Heuchera hirsutissima	Heuchera hirsutissima Rosend. et al.
JM1: Heuchera maxima	Heuchera maxima Greene
JM1: Heuchera merriamii	Heuchera merriamii Eastw.
JM1: Heuchera micrantha	Heuchera micrantha Lindl.
JMS: Heuchera micrantha var. diversifolia	Heuchera micrantha Lindl.
JMS: Heuchera micrantha var. erubescens	Heuchera micrantha Lindl.
JMS: Heuchera micrantha var. hartwegii	Heuchera micrantha Lindl.
JMS: Heuchera micrantha var. macropetala	Heuchera micrantha Lindl.
JM1: Heuchera parishii	Heuchera parishii Rydb.
JM2: Heuchera parvifolia	Heuchera parvifolia Torr. & A. Gray
JM1: Heuchera pilosissima	Heuchera pilosissima Fisch. & C.A. Mey.
JM1: Heuchera rubescens	Heuchera rubescens Torr.
JM1: Heuchera rubescens var. alpicola	Heuchera rubescens Torr.
JM1: Heuchera rubescens var. glandulosa	Heuchera rubescens Torr.
JM1: Heuchera rubescens var. rydbergiana	Heuchera rubescens Torr.
JM1: Heuchera rubescens var. versicolor	Heuchera rubescens Torr.
JMS: Hibiscus californicus	Hibiscus lasiocarpos Cav. var. occidentalis (Torr.) A. Gray
JM1: Hibiscus denudatus	Hibiscus denudatus Benth.
JM2: Hibiscus lasiocarpos var. occidentalis	Hibiscus lasiocarpos Cav. var. occidentalis (Torr.) A. Gray
JM1: Hibiscus lasiocarpus	Hibiscus lasiocarpos Cav. var. occidentalis (Torr.) A. Gray
JM1: Hibiscus trionum	Hibiscus trionum L.
JMS: Hieracium albertinum	Hieracium scouleri Hook.
JM1: Hieracium albiflorum	Hieracium albiflorum Hook.
JM1: Hieracium argutum	Hieracium argutum Nutt.
JM1: Hieracium aurantiacum	Hieracium aurantiacum L.
JM1: Hieracium bolanderi	Hieracium bolanderi A. Gray
JM1: Hieracium gracile	Hieracium triste Spreng.
JM1: Hieracium greenei	Hieracium greenei A. Gray
JM1: Hieracium horridum	Hieracium horridum Fr.
JM2: Hieracium nudicaule	Hieracium nudicaule (A. Gray) A. Heller
JM2: Hieracium parryi	Hieracium parryi Zahn
JM1: Hieracium scouleri	Hieracium scouleri Hook.
JMS: Hieracium scouleri var. albertinum	Hieracium scouleri Hook.
JMS: Hieracium scouleri var. griseum	Hieracium scouleri Hook.
JM2: Hieracium triste	Hieracium triste Spreng.
JM1: Hierochloe occidentalis	Anthoxanthum occidentale (Buckley) Veldkamp
JM1: Hierochloe odorata	Anthoxanthum nitens (Weber) Y. Schouten & Veldkamp subsp. nitens
JM2: Hilaria jamesii	Hilaria jamesii (Torr.) Benth.
JM2: Hilaria rigida	Hilaria rigida (Thurb.) Scribn.
JM1: Hippuris vulgaris	Hippuris vulgaris L.
JM1: Hirschfeldia incana	Hirschfeldia incana (L.) Lagr.-Fossat
JM1: Hoffmannseggia glauca	Hoffmannseggia glauca (Ortega) Eifert
JM2: Hoffmannseggia microphylla	Hoffmannseggia microphylla Torr.
JM1: Hoita macrostachya	Hoita macrostachya (DC.) Rydb.
JM1: Hoita orbicularis	Hoita orbicularis (Lindl.) Rydb.
JM1: Hoita strobilina	Hoita strobilina (Hook. & Arn.) Rydb.
JMS: Holacantha emoryi	Castela emoryi (A. Gray) Moran & Felger
JM1: Holcus lanatus	Holcus lanatus L.
JM1: Holcus mollis	Holcus mollis L.
JM1: Hollisteria lanata	Hollisteria lanata S. Watson
JM2: Holmgrenanthe petrophila	Holmgrenanthe petrophila (Coville & C.V. Morton) Elisens
JMS: Holmgrenia andina	Neoholmgrenia andina (Nutt.) W.L. Wagner & Hoch
JM1: Holocarpha heermannii	Holocarpha heermannii (Greene) D.D. Keck
JM1: Holocarpha macradenia	Holocarpha macradenia (DC.) Greene
JM1: Holocarpha obconica	Holocarpha obconica (J.C. Clausen & D.D. Keck) D.D. Keck
JMS: Holocarpha obconica subsp. autumnalis	Holocarpha obconica (J.C. Clausen & D.D. Keck) D.D. Keck
JM1: Holocarpha virgata	Holocarpha virgata (A. Gray) D.D. Keck
JM1: Holocarpha virgata subsp. elongata	Holocarpha virgata subsp. elongata D.D. Keck
JM1: Holocarpha virgata subsp. virgata	Holocarpha virgata (A. Gray) D.D. Keck subsp. virgata
JM1: Holodiscus discolor	Holodiscus discolor (Pursh) Maxim.
JM2: Holodiscus discolor var. discolor	Holodiscus discolor (Pursh) Maxim. var. discolor
JM2: Holodiscus discolor var. glabrescens	Holodiscus discolor var. glabrescens (Greenm.) Jeps.
JM2: Holodiscus discolor var. microphyllus	Holodiscus discolor var. microphyllus (Rydb.) Jeps.
JM1: Holodiscus microphyllus	Holodiscus discolor var. microphyllus (Rydb.) Jeps.
JM1: Holodiscus microphyllus var. glabrescens	Holodiscus discolor var. glabrescens (Greenm.) Jeps.
JM1: Holodiscus microphyllus var. microphyllus	Holodiscus discolor var. microphyllus (Rydb.) Jeps.
JMS: Holodiscus saxicola	Holodiscus discolor (Pursh) Maxim.
JM2: Holosteum umbellatum	Holosteum umbellatum L.
JM1: Holosteum umbellatum subsp. umbellatum	Holosteum umbellatum L. subsp. umbellatum
JM1: Holozonia filipes	Holozonia filipes (Hook. & Arn.) Greene
JM1: Hordeum arizonicum	Hordeum arizonicum Covas
JM1: Hordeum brachyantherum	Hordeum brachyantherum Nevski
JM1: Hordeum brachyantherum subsp. brachyantherum	Hordeum brachyantherum subsp. brachyantherum
JM1: Hordeum brachyantherum subsp. californicum	Hordeum brachyantherum subsp. californicum (Covas & Stebbins) Bothmer et al.
JMS: Hordeum californicum	Hordeum brachyantherum subsp. californicum (Covas & Stebbins) Bothmer et al.
JM1: Hordeum depressum	Hordeum depressum (Scribn. & J.G. Sm.) Rydb.
JMS: Hordeum geniculatum	Hordeum marinum Huds. subsp. gussoneanum (Parl.) Thell.
JMS: Hordeum glaucum	Hordeum murinum subsp. glaucum (Steud.) Tzvelev
JMS: Hordeum hystrix	Hordeum marinum Huds. subsp. gussoneanum (Parl.) Thell.
JM1: Hordeum intercedens	Hordeum intercedens Nevski
JM1: Hordeum jubatum	Hordeum jubatum L.
JM2: Hordeum jubatum subsp. jubatum	Hordeum jubatum L. subsp. jubatum
JMS: Hordeum jubatum var. cespitosum	Hordeum jubatum L. subsp. jubatum
JMS: Hordeum leporinum	Hordeum murinum subsp. leporinum (Link) Arcang.
JM1: Hordeum marinum subsp. gussoneanum	Hordeum marinum Huds. subsp. gussoneanum (Parl.) Thell.
JM1: Hordeum marinum	Hordeum marinum Huds. subsp. gussoneanum (Parl.) Thell.
JM1: Hordeum murinum	Hordeum murinum L.
JM1: Hordeum murinum subsp. glaucum	Hordeum murinum subsp. glaucum (Steud.) Tzvelev
JM1: Hordeum murinum subsp. leporinum	Hordeum murinum subsp. leporinum (Link) Arcang.
JM1: Hordeum murinum subsp. murinum	Hordeum murinum L. subsp. murinum
JMS: Hordeum stebbinsii	Hordeum murinum subsp. glaucum (Steud.) Tzvelev
JM2: Hordeum vulgare	Hordeum vulgare L.
JMS: Hordeum vulgare var. trifurcatum	Hordeum vulgare L.
JM1: Horkelia bolanderi	Horkelia bolanderi A. Gray; Horkelia clevelandii (Greene) Rydb.
JMS: Horkelia bolanderi subsp. clevelandii	Horkelia clevelandii (Greene) Rydb. var. clevelandii
JM1: Horkelia californica	Horkelia californica Cham. & Schltdl.
JM1: Horkelia californica subsp. californica	Horkelia californica Cham. & Schltdl. var. californica
JM1: Horkelia californica subsp. dissita	Horkelia californica var. elata (Greene) Ertter & Reveal
JM1: Horkelia californica subsp. frondosa	Horkelia californica var. frondosa (Greene) Ertter & Reveal
JM2: Horkelia californica var. californica	Horkelia californica Cham. & Schltdl. var. californica
JM2: Horkelia californica var. elata	Horkelia californica var. elata (Greene) Ertter & Reveal
JM2: Horkelia californica var. frondosa	Horkelia californica var. frondosa (Greene) Ertter & Reveal
JMS: Horkelia chandleri	Ivesia muirii A. Gray
JM1: Horkelia clevelandii	Horkelia clevelandii (Greene) Rydb.
JM2: Horkelia clevelandii var. clevelandii	Horkelia clevelandii (Greene) Rydb. var. clevelandii
JM2: Horkelia congesta	Horkelia congesta Hook.
JM1: Horkelia congesta subsp. nemorosa	Horkelia congesta Hook. var. nemorosa (D.D. Keck) M. Peck
JM2: Horkelia congesta var. nemorosa	Horkelia congesta Hook. var. nemorosa (D.D. Keck) M. Peck
JM1: Horkelia cuneata	Horkelia cuneata Lindl.
JM1: Horkelia cuneata subsp. cuneata	Horkelia cuneata Lindl. var. cuneata
JM1: Horkelia cuneata subsp. puberula	Horkelia cuneata var. puberula (Rydb.) Ertter & Reveal
JM1: Horkelia cuneata subsp. sericea	Horkelia cuneata var. sericea (A. Gray) Ertter & Reveal
JM2: Horkelia cuneata var. cuneata	Horkelia cuneata Lindl. var. cuneata
JM2: Horkelia cuneata var. puberula	Horkelia cuneata var. puberula (Rydb.) Ertter & Reveal
JM2: Horkelia cuneata var. sericea	Horkelia cuneata var. sericea (A. Gray) Ertter & Reveal
JM1: Horkelia daucifolia	Horkelia daucifolia (Greene) Rydb.
JM2: Horkelia daucifolia var. daucifolia	Horkelia daucifolia (Greene) Rydb. var. daucifolia
JM2: Horkelia daucifolia var. indicta	Horkelia daucifolia var. indicta (Jeps.) Ertter & Reveal
JM1: Horkelia fusca	Horkelia fusca Lindl.
JM1: Horkelia fusca subsp. capitata	Horkelia fusca var. pseudocapitata (Howell) M. Peck
JM1: Horkelia fusca subsp. parviflora	Horkelia fusca var. parviflora (Hook. & Arn.) Wawra
JMS: Horkelia fusca subsp. pseudocapitata	Horkelia fusca var. brownii (Rydb.) Ertter & Reveal; Horkelia fusca var. pseudocapitata (Howell) M. Peck
JM1: Horkelia fusca subsp. tenella	Horkelia fusca var. tenella S. Watson
JM2: Horkelia fusca var. brownii	Horkelia fusca var. brownii (Rydb.) Ertter & Reveal
JM2: Horkelia fusca var. parviflora	Horkelia fusca var. parviflora (Hook. & Arn.) Wawra
JM2: Horkelia fusca var. pseudocapitata	Horkelia fusca var. pseudocapitata (Howell) M. Peck
JM2: Horkelia fusca var. tenella	Horkelia fusca var. tenella S. Watson
JM1: Horkelia hendersonii	Horkelia hendersonii Howell
JM1: Horkelia hispidula	Horkelia hispidula Rydb.
JM2: Horkelia howellii	Horkelia howellii (Greene) Rydb.
JM1: Horkelia marinensis	Horkelia marinensis (Elmer) Crum
JM1: Horkelia parryi	Horkelia parryi Greene
JM1: Horkelia rydbergii	Horkelia rydbergii Elmer
JM1: Horkelia sericata	Horkelia sericata S. Watson
JM1: Horkelia tenuiloba	Horkelia tenuiloba (Torr.) A. Gray
JM1: Horkelia tridentata	Horkelia tridentata Torr.
JM1: Horkelia tridentata subsp. flavescens	Horkelia tridentata var. flavescens (Rydb.) Ertter & Reveal
JM1: Horkelia tridentata subsp. tridentata	Horkelia tridentata Torr. var. tridentata
JM2: Horkelia tridentata var. flavescens	Horkelia tridentata var. flavescens (Rydb.) Ertter & Reveal
JM2: Horkelia tridentata var. tridentata	Horkelia tridentata Torr. var. tridentata
JM1: Horkelia truncata	Horkelia truncata Rydb.
JM1: Horkelia tularensis	Horkelia tularensis (J.T. Howell) Munz
JM1: Horkelia wilderae	Horkelia wilderae Parish
JM1: Horkelia yadonii	Horkelia yadonii Ertter
JM1: Horkeliella congdonis	Horkeliella congdonis (Rydb.) Rydb.
JM1: Horkeliella purpurascens	Horkeliella purpurascens (S. Watson) Rydb.
JM2: Hornungia procumbens	Hornungia procumbens (L.) Hayek
JM1: Horsfordia alata	Horsfordia alata (S. Watson) A. Gray
JM1: Horsfordia newberryi	Horsfordia newberryi (S. Watson) A. Gray
JM2: Hosackia crassifolia	Hosackia crassifolia Benth.
JM2: Hosackia crassifolia var. crassifolia	Hosackia crassifolia Benth. var. crassifolia
JM2: Hosackia crassifolia var. otayensis	Hosackia crassifolia var. otayensis (Isely) Brouillet
JM2: Hosackia gracilis	Hosackia gracilis Benth.
JM2: Hosackia incana	Hosackia incana Torr.
JM2: Hosackia oblongifolia	Hosackia oblongifolia Benth.
JM2: Hosackia oblongifolia var. cuprea	Hosackia oblongifolia var. cuprea (Greene) Brouillet
JM2: Hosackia oblongifolia var. oblongifolia	Hosackia oblongifolia Benth. var. oblongifolia
JM2: Hosackia pinnata	Hosackia pinnata (Hook.) Abrams
JM2: Hosackia rosea	Hosackia rosea Eastw.
JM2: Hosackia stipularis	Hosackia stipularis Benth.
JM2: Hosackia stipularis var. ottleyi	Hosackia stipularis var. ottleyi (Isely) Brouillet
JM2: Hosackia stipularis var. stipularis	Hosackia stipularis Benth. var. stipularis
JM2: Hosackia yollabolliensis	Hosackia yollabolliensis (Munz) D.D. Sokoloff
JM2: Howellia aquatilis	Howellia aquatilis A. Gray
JM1: Hulsea algida	Hulsea algida A. Gray
JM1: Hulsea brevifolia	Hulsea brevifolia A. Gray
JM1: Hulsea californica	Hulsea californica Torr. & A. Gray
JMS: Hulsea californica subsp. inyoensis	Hulsea vestita subsp. inyoensis (D.D. Keck) Wilken
JM1: Hulsea heterochroma	Hulsea heterochroma A. Gray
JM1: Hulsea mexicana	Hulsea mexicana Rydb.
JM1: Hulsea nana	Hulsea nana A. Gray
JM1: Hulsea vestita	Hulsea vestita A. Gray
JM1: Hulsea vestita subsp. callicarpha	Hulsea vestita subsp. callicarpha (H.M. Hall) Wilken
JM1: Hulsea vestita subsp. gabrielensis	Hulsea vestita subsp. gabrielensis Wilken
JM1: Hulsea vestita subsp. inyoensis	Hulsea vestita subsp. inyoensis (D.D. Keck) Wilken
JM1: Hulsea vestita subsp. parryi	Hulsea vestita subsp. parryi (A. Gray) Wilken
JM1: Hulsea vestita subsp. pygmaea	Hulsea vestita subsp. pygmaea (A. Gray) Wilken
JM1: Hulsea vestita subsp. vestita	Hulsea vestita A. Gray subsp. vestita
JMS: Hulsea vestita var. callicarpha	Hulsea vestita subsp. callicarpha (H.M. Hall) Wilken
JM1: Humulus lupulus	Humulus lupulus L.
JMS: Humulus lupulus var. neomexicanus	Humulus lupulus L.
JM1: Hutchinsia procumbens	Hornungia procumbens (L.) Hayek
JM1: Hydrilla verticillata	Hydrilla verticillata (L. f.) Royle
JM1: Hydrocotyle moschata	excluded
JM1: Hydrocotyle ranunculoides	Hydrocotyle ranunculoides L. f.
JM1: Hydrocotyle sibthorpioides	excluded
JM1: Hydrocotyle umbellata	Hydrocotyle umbellata L.
JM1: Hydrocotyle verticillata	Hydrocotyle verticillata Thunb.
JMS: Hydrocotyle verticillata var. triradiata	Hydrocotyle verticillata Thunb.
JMS: Hydropeltis purpurea	Brasenia schreberi J.F. Gmel.
JM2: Hydrophyllum capitatum	Hydrophyllum capitatum Benth.
JM1: Hydrophyllum capitatum var. alpinum	Hydrophyllum capitatum Benth. var. alpinum S. Watson
JM2: Hydrophyllum fendleri	Hydrophyllum fendleri (A. Gray) A. Heller
JM1: Hydrophyllum fendleri var. albifrons	Hydrophyllum fendleri (A. Gray) A. Heller var. albifrons (A. Heller) J.F. Macbr.
JM1: Hydrophyllum occidentale	Hydrophyllum occidentale (S. Watson) A. Gray
JM1: Hydrophyllum tenuipes	Hydrophyllum tenuipes A. Heller
JM1: Hymenoclea monogyra	Ambrosia monogyra (Torr. & A. Gray) Strother & B.G. Baldwin
JMS: Hymenoclea platyspina	Ambrosia &times;platyspina (Seaman) Strother & B.G. Baldwin
JM1: Hymenoclea salsola	Ambrosia salsola (Torr. & A. Gray) Strother & B.G. Baldwin
JM1: Hymenoclea salsola var. fasciculata	Ambrosia salsola (Torr. & A. Gray) Strother & B.G. Baldwin var. salsola
JMS: Hymenoclea salsola var. patula	Ambrosia salsola (Torr. & A. Gray) Strother & B.G. Baldwin var. salsola
JM1: Hymenoclea salsola var. pentalepis	Ambrosia salsola var. pentalepis (Rydb.) Strother & B.G. Baldwin
JM1: Hymenoclea salsola var. salsola	Ambrosia salsola (Torr. & A. Gray) Strother & B.G. Baldwin var. salsola
JMS: Hymenolobus procumbens	Hornungia procumbens (L.) Hayek
JM1: Hymenopappus filifolius	Hymenopappus filifolius Hook.
JM1: Hymenopappus filifolius var. eriopodus	Hymenopappus filifolius Hook. var. eriopodus (A. Nelson) B.L. Turner
JM1: Hymenopappus filifolius var. lugens	Hymenopappus filifolius Hook. var. lugens (Greene) Jeps.
JM1: Hymenopappus filifolius var. megacephalus	Hymenopappus filifolius Hook. var. megacephalus B.L. Turner
JM1: Hymenopappus filifolius var. nanus	Hymenopappus filifolius Hook. var. nanus (Rydb.) B.L. Turner
JM1: Hymenothrix loomisii	Hymenothrix loomisii S.F. Blake
JM1: Hymenothrix wrightii	Hymenothrix wrightii A. Gray
JMS: Hymenoxys acaulis	Tetraneuris acaulis (Pursh) Greene
JM1: Hymenoxys acaulis var. arizonica	Tetraneuris acaulis (Pursh) Greene var. arizonica (Greene) K.F. Parker
JMS: Hymenoxys acaulis var. nana	Tetraneuris acaulis (Pursh) Greene var. arizonica (Greene) K.F. Parker
JM1: Hymenoxys cooperi	Hymenoxys cooperi (A. Gray) Cockerell
JMS: Hymenoxys cooperi var. canescens	Hymenoxys cooperi (A. Gray) Cockerell
JM2: Hymenoxys hoopesii	Hymenoxys hoopesii (A. Gray) Bierner
JM1: Hymenoxys lemmonii	Hymenoxys lemmonii (Greene) Cockerell
JM1: Hymenoxys odorata	Hymenoxys odorata DC.
JM1: Hyparrhenia hirta	Hyparrhenia hirta (L.) Stapf
JM1: Hypericum anagalloides	Hypericum anagalloides Cham. & Schltdl.
JM2: Hypericum androsaemum	Hypericum androsaemum L.
JM2: Hypericum calycinum	Hypericum calycinum L.
JM1: Hypericum canariense	Hypericum canariense L.
JM1: Hypericum concinnum	Hypericum concinnum Benth.
JMS: Hypericum formosum	Hypericum scouleri Hook.
JM1: Hypericum formosum var. scouleri	Hypericum scouleri Hook.
JM2: Hypericum hookerianum	Hypericum hookerianum Wight & Arn.
JM1: Hypericum mutilum	Hypericum mutilum L.
JM2: Hypericum mutilum subsp. mutilum	Hypericum mutilum L. subsp. mutilum
JM1: Hypericum perforatum	Hypericum perforatum L.
JM2: Hypericum perforatum subsp. perforatum	Hypericum perforatum L. subsp. perforatum
JM2: Hypericum scouleri	Hypericum scouleri Hook.
JM1: Hypochaeris glabra	Hypochaeris glabra L.
JM1: Hypochaeris radicata	Hypochaeris radicata L.
JM1: Hyptis emoryi	Hyptis emoryi Torr.
JMS: Hystrix californica	Elymus californicus (Thurb.) Gould
JM2: Iberis umbellata	Iberis umbellata L.
JM1: Idahoa scapigera	Idahoa scapigera (Hook.) A. Nelson & J.F. Macbr.
JM1: Ilex aquifolium	Ilex aquifolium L.
JM1: Iliamna bakeri	Iliamna bakeri (Jeps.) Wiggins
JM1: Iliamna latibracteata	Iliamna latibracteata Wiggins
JM2: Iliamna rivularis	Iliamna rivularis (Hook.) Greene
JM2: Impatiens balfourii	Impatiens balfourii Hook. f.
JM2: Impatiens capensis	Impatiens capensis Meerb.
JM2: Impatiens glandulifera	Impatiens glandulifera Royle
JMS: Impatiens noli-tangere	Impatiens capensis Meerb.
JM1: Imperata brevifolia	Imperata brevifolia Vasey
JM2: Ionactis alpina	Ionactis alpina (Nutt.) Greene
JM1: Ipheion uniflorum	Ipheion uniflorum (Graham) Raf.
JMS: Ipomoea acuminata	Ipomoea indica (Burm.) Merr.
JM1: Ipomoea cairica	Ipomoea cairica (L.) Sweet
JM2: Ipomoea hederacea	Ipomoea hederacea Jacq.
JM2: Ipomoea indica	Ipomoea indica (Burm.) Merr.
JM1: Ipomoea mutabilis	Ipomoea indica (Burm.) Merr.
JM1: Ipomoea nil	excluded
JM1: Ipomoea purpurea	Ipomoea purpurea (L.) Roth
JM1: Ipomoea triloba	Ipomoea triloba L.
JM1: Ipomopsis aggregata	Ipomopsis aggregata (Pursh) V.E. Grant; Ipomopsis arizonica (Greene) Wherry; Ipomopsis tenuituba (Rydb.) V.E. Grant
JM2: Ipomopsis aggregata subsp. aggregata	Ipomopsis aggregata (Pursh) V.E. Grant subsp. aggregata
JMS: Ipomopsis aggregata subsp. arizonica	Ipomopsis arizonica (Greene) Wherry
JMS: Ipomopsis aggregata subsp. attenuata	Ipomopsis tenuituba (Rydb.) V.E. Grant
JM1: Ipomopsis aggregata subsp. bridgesii	Ipomopsis aggregata subsp. bridgesii (A. Gray) V.E. Grant & A.D. Grant
JM1: Ipomopsis aggregata subsp. formosissima	Ipomopsis aggregata (Pursh) V.E. Grant subsp. aggregata
JM1: Ipomopsis arizonica	Ipomopsis arizonica (Greene) Wherry
JM1: Ipomopsis congesta	Ipomopsis congesta (Hook.) V.E. Grant
JM1: Ipomopsis congesta subsp. congesta	Ipomopsis congesta (Hook.) V.E. Grant subsp. congesta
JM1: Ipomopsis congesta subsp. montana	Ipomopsis congesta subsp. montana (A. Nelson & P.B. Kenn.) V.E. Grant
JM1: Ipomopsis congesta subsp. palmifrons	Ipomopsis congesta subsp. montana (A. Nelson & P.B. Kenn.) V.E. Grant
JM1: Ipomopsis depressa	Loeseliastrum depressum (A. Gray) J.M. Porter & L.A. Johnson
JM1: Ipomopsis effusa	Ipomopsis effusa (A. Gray) Moran
JM1: Ipomopsis polycladon	Ipomopsis polycladon (Torr.) V.E. Grant
JM1: Ipomopsis tenuifolia	Ipomopsis tenuifolia (A. Gray) V.E. Grant
JM1: Ipomopsis tenuituba	Ipomopsis tenuituba (Rydb.) V.E. Grant
JM1: Iris bracteata	Iris bracteata S. Watson
JM1: Iris chrysophylla	Iris chrysophylla Howell
JM1: Iris douglasiana	Iris douglasiana Herb.
JM1: Iris fernaldii	Iris fernaldii R.C. Foster
JM2: Iris foetidissima	Iris foetidissima L.
JM2: Iris germanica	Iris germanica L.
JM1: Iris hartwegii	Iris hartwegii Baker
JM1: Iris hartwegii subsp. australis	Iris hartwegii subsp. australis (Parish) L.W. Lenz
JM1: Iris hartwegii subsp. columbiana	Iris hartwegii subsp. columbiana L.W. Lenz
JM1: Iris hartwegii subsp. hartwegii	Iris hartwegii Baker subsp. hartwegii
JM1: Iris hartwegii subsp. pinetorum	Iris hartwegii subsp. pinetorum (Eastw.) L.W. Lenz
JM1: Iris innominata	Iris innominata L.F. Hend.
JM1: Iris longipetala	Iris longipetala Herb.
JM1: Iris macrosiphon	Iris macrosiphon Torr.
JM1: Iris missouriensis	Iris missouriensis Nutt.
JM1: Iris munzii	Iris munzii R.C. Foster
JM1: Iris pseudacorus	Iris pseudacorus L.
JM1: Iris purdyi	Iris purdyi Eastw.
JM2: Iris tenax	Iris tenax Lindl.
JM1: Iris tenax subsp. klamathensis	Iris tenax Lindl. subsp. klamathensis L.W. Lenz
JM1: Iris tenuissima	Iris tenuissima Dykes
JM1: Iris tenuissima subsp. purdyiformis	Iris tenuissima subsp. purdyiformis (R.C. Foster) L.W. Lenz
JM1: Iris tenuissima subsp. tenuissima	Iris tenuissima Dykes subsp. tenuissima
JM2: Iris thompsonii	Iris thompsonii R.C. Foster
JM1: Isatis tinctoria	Isatis tinctoria L.
JM1: Isocoma acradenia	Isocoma acradenia (Greene) Greene
JM1: Isocoma acradenia var. acradenia	Isocoma acradenia (Greene) Greene var. acradenia
JM1: Isocoma acradenia var. bracteosa	Isocoma acradenia var. bracteosa (Greene) G.L. Nesom
JM1: Isocoma acradenia var. eremophila	Isocoma acradenia var. eremophila (Greene) G.L. Nesom
JM1: Isocoma arguta	Isocoma arguta Greene
JM1: Isocoma menziesii	Isocoma menziesii (Hook. & Arn.) G.L. Nesom
JM2: Isocoma menziesii var. decumbens	Isocoma menziesii var. decumbens (Greene) G.L. Nesom
JM2: Isocoma menziesii var. diabolica	Isocoma menziesii var. diabolica G.L. Nesom
JM1: Isocoma menziesii var. menziesii	Isocoma menziesii (Hook. & Arn.) G.L. Nesom var. menziesii
JM1: Isocoma menziesii var. sedoides	Isocoma menziesii var. sedoides (Greene) G.L. Nesom
JM1: Isocoma menziesii var. vernonioides	Isocoma menziesii var. vernonioides (Nutt.) G.L. Nesom
JM1: Isoetes bolanderi	Isoetes bolanderi Engelm.
JMS: Isoetes bolanderi var. pygmaea	Isoetes bolanderi Engelm.
JM1: Isoetes echinospora	Isoetes echinospora Durieu
JM1: Isoetes howellii	Isoetes howellii Engelm.
JM1: Isoetes nuttallii	Isoetes nuttallii Engelm.
JM1: Isoetes occidentalis	Isoetes occidentalis L.F. Hend.
JM1: Isoetes orcuttii	Isoetes orcuttii A.A. Eaton
JM2: Isolepis carinata	Isolepis carinata Torr.
JM2: Isolepis cernua	Isolepis cernua (Vahl) Roem. & Schult.
JM2: Isolepis levynsiana	Isolepis levynsiana Muasya & D.A. Simpson
JM2: Isolepis setacea	Isolepis setacea (L.) R. Br.
JMS: Isolepis tenella	Isolepis levynsiana Muasya & D.A. Simpson
JM1: Isomeris arborea	Peritoma arborea (Nutt.) H.H. Iltis
JMS: Isomeris arborea var. angustata	Peritoma arborea var. angustata (Parish) H.H. Iltis
JMS: Isomeris arborea var. arborea	Peritoma arborea (Nutt.) H.H. Iltis var. arborea
JMS: Isomeris arborea var. globosa	Peritoma arborea var. globosa (Coville) H.H. Iltis
JMS: Isomeris arborea var. insularis	Peritoma arborea var. globosa (Coville) H.H. Iltis
JM1: Isopyrum occidentale	Enemion occidentale (Hook. & Arn.) J.R. Drumm. & Hutch.
JM1: Isopyrum stipitatum	Enemion stipitatum (A. Gray) J.R. Drumm. & Hutch.
JMS: Isotrema californicum	Aristolochia californica Torr.
JM1: Iva acerosa	Euphrosyne acerosa (Nutt.) Panero
JM2: Iva axillaris	Iva axillaris Pursh
JM1: Iva axillaris subsp. robustior	Iva axillaris Pursh
JM1: Iva hayesiana	Iva hayesiana A. Gray
JM1: Iva nevadensis	Euphrosyne nevadensis (M.E. Jones) Panero
JM1: Ivesia aperta	Ivesia aperta (J.T. Howell) Munz
JM1: Ivesia aperta var. aperta	Ivesia aperta (J.T. Howell) Munz var. aperta
JM1: Ivesia aperta var. canina	Ivesia aperta var. canina Ertter
JM1: Ivesia argyrocoma	Ivesia argyrocoma (Rydb.) Rydb.
JM2: Ivesia argyrocoma var. argyrocoma	Ivesia argyrocoma (Rydb.) Rydb. var. argyrocoma
JM2: Ivesia arizonica	Ivesia arizonica (J.T. Howell) Ertter
JM1: Ivesia arizonica var. arizonica	Ivesia arizonica (J.T. Howell) Ertter var. arizonica
JM1: Ivesia baileyi	Ivesia baileyi S. Watson
JM1: Ivesia baileyi var. baileyi	Ivesia baileyi S. Watson var. baileyi
JM1: Ivesia baileyi var. beneolens	Ivesia baileyi var. beneolens (A. Nelson & J.F. Macbr.) Ertter
JM1: Ivesia callida	Ivesia callida (H.M. Hall) Rydb.
JM1: Ivesia campestris	Ivesia campestris (M.E. Jones) Rydb.
JM1: Ivesia gordonii	Ivesia gordonii (Hook.) Torr. & A. Gray
JM2: Ivesia gordonii var. alpicola	Ivesia gordonii var. alpicola (Howell) Ertter & Reveal
JM2: Ivesia gordonii var. ursinorum	Ivesia gordonii var. ursinorum (Jeps.) Ertter & Reveal
JM1: Ivesia jaegeri	Ivesia jaegeri Munz & I.M. Johnst.
JM2: Ivesia kingii	Ivesia kingii S. Watson
JM1: Ivesia kingii var. kingii	Ivesia kingii S. Watson var. kingii
JM1: Ivesia longibracteata	Ivesia longibracteata Ertter
JM1: Ivesia lycopodioides	Ivesia lycopodioides A. Gray
JM1: Ivesia lycopodioides subsp. lycopodioides	Ivesia lycopodioides A. Gray var. lycopodioides
JM1: Ivesia lycopodioides subsp. megalopetala	Ivesia lycopodioides var. megalopetala (Rydb.) Ertter & Reveal
JM1: Ivesia lycopodioides subsp. scandularis	Ivesia lycopodioides var. scandularis (Rydb.) Ertter & Reveal
JM2: Ivesia lycopodioides var. lycopodioides	Ivesia lycopodioides A. Gray var. lycopodioides
JM2: Ivesia lycopodioides var. megalopetala	Ivesia lycopodioides var. megalopetala (Rydb.) Ertter & Reveal
JM2: Ivesia lycopodioides var. scandularis	Ivesia lycopodioides var. scandularis (Rydb.) Ertter & Reveal
JM1: Ivesia muirii	Ivesia muirii A. Gray
JM1: Ivesia paniculata	Ivesia paniculata T.W. Nelson & J.P. Nelson
JM1: Ivesia patellifera	Ivesia patellifera (J.T. Howell) Ertter
JM1: Ivesia pickeringii	Ivesia pickeringii A. Gray
JM1: Ivesia pygmaea	Ivesia pygmaea A. Gray
JM1: Ivesia santolinoides	Ivesia santolinoides A. Gray
JM1: Ivesia saxosa	Ivesia saxosa (Greene) Ertter
JM1: Ivesia sericoleuca	Ivesia sericoleuca (Rydb.) Rydb.
JM2: Ivesia shockleyi	Ivesia shockleyi S. Watson
JM1: Ivesia shockleyi var. shockleyi	Ivesia shockleyi S. Watson var. shockleyi
JM1: Ivesia unguiculata	Ivesia unguiculata A. Gray
JM1: Ivesia webberi	Ivesia webberi A. Gray
JM1: Ixia maculata	Ixia maculata L.
JM2: Jacaranda mimosifolia	Jacaranda mimosifolia D. Don
JMS: Jacobaea vulgaris	Senecio jacobaea L.
JM2: Jamesia americana	Jamesia americana Torr. & A. Gray
JMS: Jamesia americana subsp. californica	Jamesia americana Torr. & A. Gray var. rosea C.K. Schneid.
JMS: Jamesia americana var. californica	Jamesia americana Torr. & A. Gray var. rosea C.K. Schneid.
JM1: Jamesia americana var. rosea	Jamesia americana Torr. & A. Gray var. rosea C.K. Schneid.
JMS: Jamesia californica	Jamesia americana Torr. & A. Gray var. rosea C.K. Schneid.
JMS: Jarava speciosa	Stipa speciosa Trin. & Rupr.
JM1: Jaumea carnosa	Jaumea carnosa (Less.) A. Gray
JM2: Jensia rammii	Jensia rammii (Greene) B.G. Baldwin
JM2: Jensia yosemitana	Jensia yosemitana (A. Gray) B.G. Baldwin
JM1: Jepsonia heterandra	Jepsonia heterandra Eastw.
JM1: Jepsonia malvifolia	Jepsonia malvifolia (Greene) Small
JM1: Jepsonia parryi	Jepsonia parryi (Torr.) Small
JM2: Johanneshowellia puberula	Johanneshowellia puberula (S. Watson) Reveal
JM1: Juglans californica	Juglans californica S. Watson; Juglans hindsii R.E. Sm.
JM1: Juglans californica var. californica	Juglans californica S. Watson
JM1: Juglans californica var. hindsii	Juglans hindsii R.E. Sm.
JM2: Juglans hindsii	Juglans hindsii R.E. Sm.
JM1: Juglans regia	Juglans regia L.
JM1: Juncus acuminatus	Juncus acuminatus Michx.
JM2: Juncus acutus	Juncus acutus L.
JM1: Juncus acutus subsp. leopoldii	Juncus acutus L. subsp. leopoldii (Parl.) Snogerup
JMS: Juncus acutus var. sphaerocarpus	Juncus acutus L. subsp. leopoldii (Parl.) Snogerup
JM1: Juncus ambiguus	Juncus ambiguus Guss.
JM2: Juncus anthelatus	Juncus anthelatus (Wiegand) R.E. Brooks
JMS: Juncus arcticus	Juncus balticus Willd.; Juncus mexicanus Willd.
JMS: Juncus arcticus var. balticus	Juncus balticus Willd. subsp. ater (Rydb.) Snogerup
JMS: Juncus arcticus var. mexicanus	Juncus mexicanus Willd.
JM1: Juncus articulatus	Juncus articulatus L.
JM2: Juncus articulatus subsp. articulatus	Juncus articulatus L. subsp. articulatus
JM1: Juncus balticus	Juncus balticus Willd. subsp. ater (Rydb.) Snogerup
JM2: Juncus balticus subsp. ater	Juncus balticus Willd. subsp. ater (Rydb.) Snogerup
JMS: Juncus balticus var. montanus	Juncus balticus Willd. subsp. ater (Rydb.) Snogerup
JM1: Juncus bolanderi	Juncus bolanderi Engelm.
JM1: Juncus brachyphyllus	Juncus brachyphyllus Wiegand
JM1: Juncus breweri	Juncus breweri Engelm.
JM1: Juncus bryoides	Juncus bryoides F.J. Herm.
JM1: Juncus bufonius	Juncus bufonius L.; Juncus ambiguus Guss.
JM1: Juncus bufonius var. bufonius	Juncus bufonius L. var. bufonius
JMS: Juncus bufonius var. congdonii	Juncus bufonius L. var. bufonius
JM1: Juncus bufonius var. congestus	Juncus bufonius var. congestus Wahlb.
JMS: Juncus bufonius var. halophilus	Juncus ambiguus Guss.
JM1: Juncus bufonius var. occidentalis	Juncus bufonius var. occidentalis F.J. Herm.
JM1: Juncus capillaris	Juncus capillaris F.J. Herm.
JM1: Juncus capitatus	Juncus capitatus Weigel
JM1: Juncus chlorocephalus	Juncus chlorocephalus Engelm.
JM1: Juncus confusus	Juncus confusus Coville
JM1: Juncus cooperi	Juncus cooperi Engelm.
JM1: Juncus covillei	Juncus covillei Piper
JM1: Juncus covillei var. covillei	Juncus covillei Piper
JM1: Juncus covillei var. obtusatus	Juncus covillei Piper
JM1: Juncus cyperoides	Juncus cyperoides Laharpe
JM1: Juncus diffusissimus	Juncus diffusissimus Buckley
JM2: Juncus digitatus	Juncus digitatus C.W. Witham & Zika
JM1: Juncus drummondii	Juncus drummondii E. Mey.
JMS: Juncus drummondii var. subtriflorus	Juncus drummondii E. Mey.
JM1: Juncus dubius	Juncus dubius Engelm.
JM1: Juncus dudleyi	Juncus dudleyi Wiegand
JM1: Juncus duranii	Juncus duranii Ewan
JM1: Juncus effusus	Juncus effusus L.; Juncus hesperius (Piper) Lint; Juncus exiguus (Fernald & Wiegand) Snogerup & Zika; Juncus laccatus Zika
JM2: Juncus effusus subsp. austrocalifornicus	Juncus effusus subsp. austrocalifornicus Zika
JM2: Juncus effusus subsp. effusus	Juncus effusus L. subsp. effusus
JM2: Juncus effusus subsp. pacificus	Juncus effusus subsp. pacificus (Fernald & Wiegand) Piper & Beattie
JM2: Juncus effusus subsp. solutus	Juncus effusus subsp. solutus (Fernald & Wiegand) H&auml;met-Ahti
JM1: Juncus effusus var. brunneus	Juncus hesperius (Piper) Lint
JMS: Juncus effusus var. compactus	Juncus effusus L. subsp. effusus
JM1: Juncus effusus var. exiguus	Juncus exiguus (Fernald & Wiegand) Snogerup & Zika
JM1: Juncus effusus var. gracilis	Juncus laccatus Zika
JM1: Juncus effusus var. pacificus	Juncus effusus subsp. pacificus (Fernald & Wiegand) Piper & Beattie
JMS: Juncus effusus var. solutus	Juncus effusus subsp. solutus (Fernald & Wiegand) H&auml;met-Ahti
JM1: Juncus ensifolius	Juncus ensifolius Wikstr.
JMS: Juncus ensifolius var. montanus	Juncus saximontanus A. Nelson
JM2: Juncus exiguus	Juncus exiguus (Fernald & Wiegand) Snogerup & Zika
JM2: Juncus falcatus	Juncus falcatus E. Mey.
JM2: Juncus falcatus subsp. falcatus	Juncus falcatus E. Mey. subsp. falcatus
JM2: Juncus falcatus subsp. sitchensis	Juncus falcatus subsp. sitchensis (Buchenau) Hult&eacute;n
JM1: Juncus falcatus var. falcatus	Juncus falcatus E. Mey. subsp. falcatus
JMS: Juncus falcatus var. sitchensis	Juncus falcatus subsp. sitchensis (Buchenau) Hult&eacute;n
JM2: Juncus gerardii	Juncus gerardii Loisel.
JM2: Juncus gerardii subsp. gerardii	Juncus gerardii Loisel. subsp. gerardii
JM1: Juncus hemiendytus	Juncus hemiendytus F.J. Herm.
JM1: Juncus hemiendytus var. abjectus	Juncus hemiendytus var. abjectus (F.J. Herm.) Ertter
JM1: Juncus hemiendytus var. hemiendytus	Juncus hemiendytus F.J. Herm. var. hemiendytus
JM2: Juncus hesperius	Juncus hesperius (Piper) Lint
JM1: Juncus howellii	Juncus howellii F.J. Herm.
JM2: Juncus interior	Juncus interior Wiegand
JMS: Juncus interior var. arizonicus	Juncus interior Wiegand
JMS: Juncus interior var. neomexicanus	Juncus interior Wiegand
JM1: Juncus kelloggii	Juncus kelloggii Engelm.
JM2: Juncus laccatus	Juncus laccatus Zika
JM1: Juncus leiospermus	Juncus leiospermus F.J. Herm.
JM1: Juncus leiospermus var. ahartii	Juncus leiospermus var. ahartii Ertter
JM1: Juncus leiospermus var. leiospermus	Juncus leiospermus F.J. Herm. var. leiospermus
JM2: Juncus lescurii	Juncus lescurii Bol.
JMS: Juncus lescurii var. tracyi	Juncus breweri Engelm.
JM1: Juncus lesueurii	Juncus lescurii Bol.
JM1: Juncus longistylis	Juncus longistylis Torr.
JM1: Juncus luciensis	Juncus luciensis Ertter
JM1: Juncus macrandrus	Juncus macrandrus Coville
JM1: Juncus macrophyllus	Juncus macrophyllus Coville
JM2: Juncus marginatus	Juncus marginatus Rostk.
JM1: Juncus marginatus var. marginatus	Juncus marginatus Rostk.
JMS: Juncus megaspermus	Juncus triformis Engelm.
JM1: Juncus mertensianus	Juncus mertensianus Bong.; Juncus nevadensis S. Watson; Juncus duranii Ewan
JMS: Juncus mertensianus subsp. gracilis	Juncus nevadensis S. Watson var. nevadensis
JMS: Juncus mertensianus var. duranii	Juncus duranii Ewan
JM1: Juncus mexicanus	Juncus mexicanus Willd.
JM1: Juncus nevadensis	Juncus nevadensis S. Watson
JM2: Juncus nevadensis var. inventus	Juncus nevadensis var. inventus (L.F. Hend.) C.L. Hitchc.
JM2: Juncus nevadensis var. nevadensis	Juncus nevadensis S. Watson var. nevadensis
JM1: Juncus nodosus	Juncus nodosus L.
JM1: Juncus occidentalis	Juncus occidentalis (Coville) Wiegand
JMS: Juncus oreganus	Juncus supiniformis Engelm.
JM1: Juncus orthophyllus	Juncus orthophyllus Coville
JM1: Juncus oxymeris	Juncus oxymeris Engelm.
JM1: Juncus parryi	Juncus parryi Engelm.
JM1: Juncus patens	Juncus patens E. Mey.
JM1: Juncus phaeocephalus	Juncus nevadensis S. Watson; Juncus phaeocephalus Engelm.
JMS: Juncus phaeocephalus var. gracilis	Juncus nevadensis S. Watson var. nevadensis
JM1: Juncus phaeocephalus var. paniculatus	Juncus phaeocephalus var. paniculatus Engelm.
JM1: Juncus phaeocephalus var. phaeocephalus	Juncus phaeocephalus Engelm. var. phaeocephalus
JM2: Juncus planifolius	Juncus planifolius R. Br.
JMS: Juncus ranarius	Juncus ambiguus Guss.
JM1: Juncus regelii	Juncus regelii Buchenau
JM1: Juncus rugulosus	Juncus rugulosus Engelm.
JM1: Juncus saximontanus	Juncus saximontanus A. Nelson
JMS: Juncus saximontanus f. brunnescens	Juncus saximontanus A. Nelson
JM1: Juncus supiniformis	Juncus supiniformis Engelm.
JM1: Juncus tenuis	Juncus tenuis Willd.; Juncus occidentalis (Coville) Wiegand; Juncus dudleyi Wiegand
JMS: Juncus tenuis var. congestus	Juncus occidentalis (Coville) Wiegand
JMS: Juncus tenuis var. dudleyi	Juncus dudleyi Wiegand
JMS: Juncus tenuis var. occidentalis	Juncus occidentalis (Coville) Wiegand
JM1: Juncus textilis	Juncus textilis Buchenau
JM1: Juncus tiehmii	Juncus tiehmii Ertter
JM1: Juncus torreyi	Juncus torreyi Coville
JM1: Juncus triformis	Juncus triformis Engelm.
JM1: Juncus uncialis	Juncus uncialis Greene
JM2: Juncus usitatus	Juncus usitatus L.A.S. Johnson
JM1: Juncus xiphioides	Juncus xiphioides E. Mey.
JM1: Juniperus californica	Juniperus californica Carri&egrave;re
JM1: Juniperus communis	Juniperus communis L.
JM2: Juniperus communis var. depressa	Juniperus communis var. depressa Pursh
JM2: Juniperus communis var. jackii	Juniperus communis var. jackii Rehder
JMS: Juniperus communis var. montana	Juniperus communis var. jackii Rehder
JM2: Juniperus communis var. saxatilis	Juniperus communis var. saxatilis Pall.
JM2: Juniperus grandis	Juniperus grandis R.P. Adams
JM1: Juniperus occidentalis	Juniperus occidentalis Hook.; Juniperus grandis R.P. Adams
JM1: Juniperus occidentalis var. australis	Juniperus grandis R.P. Adams
JM1: Juniperus occidentalis var. occidentalis	Juniperus occidentalis Hook.
JM1: Juniperus osteosperma	Juniperus osteosperma (Torr.) Little
JMS: Jussiaea californica	Ludwigia peploides (Kunth) P.H. Raven subsp. peploides
JMS: Jussiaea repens	Ludwigia peploides (Kunth) P.H. Raven
JMS: Jussiaea repens var. californica	Ludwigia peploides (Kunth) P.H. Raven subsp. peploides
JMS: Jussiaea repens var. montevidensis	Ludwigia peploides subsp. montevidensis (Spreng.) P.H. Raven
JMS: Jussiaea repens var. peploides	Ludwigia peploides (Kunth) P.H. Raven subsp. peploides
JMS: Jussiaea uruguayensis	Ludwigia grandiflora (Michx.) Greuter & Burdet
JM1: Justicia californica	Justicia californica (Benth.) D.N. Gibson
JMS: Kali australis	Salsola australis R. Br.
JMS: Kali paulsenii	Salsola paulsenii Litv.
JM1: Kallstroemia californica	Kallstroemia californica (S. Watson) Vail
JM1: Kallstroemia grandiflora	Kallstroemia grandiflora A. Gray
JM1: Kallstroemia parviflora	Kallstroemia parviflora Norton
JMS: Kalmia microphylla	Kalmia polifolia Wangenh.
JM1: Kalmia polifolia	Kalmia polifolia Wangenh.
JM1: Kalmia polifolia subsp. microphylla	Kalmia polifolia Wangenh.
JM1: Kalmia polifolia subsp. polifolia	Kalmia polifolia Wangenh.
JM1: Keckiella antirrhinoides	Keckiella antirrhinoides (Benth.) Straw
JMS: Keckiella antirrhinoides subsp. microphylla	Keckiella antirrhinoides var. microphylla (A. Gray) N.H. Holmgren
JM1: Keckiella antirrhinoides var. antirrhinoides	Keckiella antirrhinoides (Benth.) Straw var. antirrhinoides
JM1: Keckiella antirrhinoides var. microphylla	Keckiella antirrhinoides var. microphylla (A. Gray) N.H. Holmgren
JM1: Keckiella breviflora	Keckiella breviflora (Lindl.) Straw
JMS: Keckiella breviflora subsp. glabrisepala	Keckiella breviflora var. glabrisepala (D.D. Keck) N.H. Holmgren
JM1: Keckiella breviflora var. breviflora	Keckiella breviflora (Lindl.) Straw var. breviflora
JM1: Keckiella breviflora var. glabrisepala	Keckiella breviflora var. glabrisepala (D.D. Keck) N.H. Holmgren
JM1: Keckiella cordifolia	Keckiella cordifolia (Benth.) Straw
JM1: Keckiella corymbosa	Keckiella corymbosa (A. DC.) Straw
JM1: Keckiella lemmonii	Keckiella lemmonii (A. Gray) Straw
JM1: Keckiella rothrockii	Keckiella rothrockii (A. Gray) Straw
JMS: Keckiella rothrockii subsp. jacintensis	Keckiella rothrockii var. jacintensis (Abrams) N.H. Holmgren
JM1: Keckiella rothrockii var. jacintensis	Keckiella rothrockii var. jacintensis (Abrams) N.H. Holmgren
JM1: Keckiella rothrockii var. rothrockii	Keckiella rothrockii (A. Gray) Straw var. rothrockii
JM1: Keckiella ternata	Keckiella ternata (A. Gray) Straw
JMS: Keckiella ternata subsp. septentrionalis	Keckiella ternata var. septentrionalis (Munz & I.M. Johnst.) N.H. Holmgren
JM1: Keckiella ternata var. septentrionalis	Keckiella ternata var. septentrionalis (Munz & I.M. Johnst.) N.H. Holmgren
JM1: Keckiella ternata var. ternata	Keckiella ternata (A. Gray) Straw var. ternata
JM1: Kelloggia galioides	Kelloggia galioides Torr.
JM1: Kickxia elatine	Kickxia elatine (L.) Dumort.
JM1: Kickxia spuria	Kickxia spuria (L.) Dumort.
JM2: Kniphofia uvaria	Kniphofia uvaria (L.) Oken
JM1: Kobresia bellardii	Kobresia myosuroides (Vill.) Fiori & Paol.
JM2: Kobresia myosuroides	Kobresia myosuroides (Vill.) Fiori & Paol.
JM1: Kochia americana	Kochia americana S. Watson; Kochia californica S. Watson
JMS: Kochia americana var. californica	Kochia californica S. Watson
JMS: Kochia americana var. vestita	Kochia americana S. Watson
JM1: Kochia californica	Kochia californica S. Watson
JMS: Kochia iranica	Kochia scoparia (L.) Schrad. subsp. scoparia
JM1: Kochia scoparia	Kochia scoparia (L.) Schrad.
JMS: Kochia scoparia f. trichophylla	Kochia scoparia (L.) Schrad. subsp. scoparia
JMS: Kochia scoparia subsp. culta	Kochia scoparia (L.) Schrad. subsp. scoparia
JM2: Kochia scoparia subsp. scoparia	Kochia scoparia (L.) Schrad. subsp. scoparia
JMS: Kochia scoparia var. subvillosa	Kochia scoparia (L.) Schrad. subsp. scoparia
JMS: Kochia trichophylla	Kochia scoparia (L.) Schrad. subsp. scoparia
JMS: Kochia vestita	Kochia americana S. Watson
JM2: Koeberlinia spinosa	Koeberlinia spinosa Zucc.
JM1: Koeberlinia spinosa subsp. tenuispina	Koeberlinia spinosa Zucc. var. tenuispina Kearney & Peebles
JM2: Koeberlinia spinosa var. tenuispina	Koeberlinia spinosa Zucc. var. tenuispina Kearney & Peebles
JMS: Koeleria cristata	Koeleria macrantha (Ledeb.) Schult.
JMS: Koeleria cristata var. longifolia	Koeleria macrantha (Ledeb.) Schult.
JM2: Koeleria gerardii	Koeleria gerardii (Vill.) Shinners
JMS: Koeleria gracilis	Koeleria macrantha (Ledeb.) Schult.
JM1: Koeleria macrantha	Koeleria macrantha (Ledeb.) Schult.
JMS: Koeleria nitida	Koeleria macrantha (Ledeb.) Schult.
JM1: Koeleria phleoides	Koeleria gerardii (Vill.) Shinners
JMS: Koeleria pyramidata	Koeleria macrantha (Ledeb.) Schult.
JM2: Kopsiopsis hookeri	Kopsiopsis hookeri (Walp.) Govaerts
JM2: Kopsiopsis strobilacea	Kopsiopsis strobilacea (A. Gray) Beck
JM2: Krameria bicolor	Krameria bicolor S. Watson
JM1: Krameria erecta	Krameria erecta Schult.
JM1: Krameria grayi	Krameria bicolor S. Watson
JM1: Krascheninnikovia lanata	Krascheninnikovia lanata (Pursh) A. Meeuse & A. Smit
JM1: Kumlienia hystricula	Ranunculus hystriculus A. Gray
JM2: Kyhosia bolanderi	Kyhosia bolanderi (A. Gray) B.G. Baldwin
JM1: Kyllinga brevifolia	Kyllinga brevifolia Rottb.
JMS: Lachnagrostis filiformis	Agrostis avenacea J.F. Gmel.
JM1: Lactuca biennis	Lactuca biennis (Moench) Fernald
JM1: Lactuca canadensis	Lactuca canadensis L.
JM1: Lactuca ludoviciana	Lactuca ludoviciana (Nutt.) Riddell
JM1: Lactuca saligna	Lactuca saligna L.
JM1: Lactuca serriola	Lactuca serriola L.
JM2: Lactuca tatarica	Lactuca tatarica (L.) C.A. Mey.
JM1: Lactuca tatarica subsp. pulchella	Lactuca tatarica (L.) C.A. Mey. subsp. pulchella Stebbins
JM1: Lactuca virosa	Lactuca virosa L.
JM2: Ladeania lanceolata	Ladeania lanceolata (Pursh) A.N. Egan & Reveal
JM2: Laennecia coulteri	Laennecia coulteri (A. Gray) G.L. Nesom
JM1: Lagophylla dichotoma	Lagophylla dichotoma Benth.
JM1: Lagophylla glandulosa	Lagophylla glandulosa A. Gray
JM1: Lagophylla minor	Lagophylla minor (D.D. Keck) D.D. Keck
JM1: Lagophylla ramosissima	Lagophylla ramosissima Nutt.
JM1: Lagophylla ramosissima subsp. congesta	Lagophylla ramosissima Nutt.
JM1: Lagophylla ramosissima subsp. ramosissima	Lagophylla ramosissima Nutt.
JM2: Lagunaria patersonia	Lagunaria patersonia (Andrews) G. Don
JM1: Lagurus ovatus	Lagurus ovatus L.
JM1: Lamarckia aurea	Lamarckia aurea (L.) Moench
JM2: Lamiastrum galeobdolon	Lamiastrum galeobdolon (L.) Ehrend. & Polatschek
JM1: Lamium amplexicaule	Lamium amplexicaule L.
JM1: Lamium purpureum	Lamium purpureum L.
JM2: Landoltia punctata	Landoltia punctata (G. Mey.) Les & D.J. Crawford
JM1: Langloisia setosissima	Langloisia setosissima (Torr. & A. Gray) Greene
JM1: Langloisia setosissima subsp. punctata	Langloisia setosissima subsp. punctata (Coville) Timbrook
JM1: Langloisia setosissima subsp. setosissima	Langloisia setosissima (Torr. & A. Gray) Greene subsp. setosissima
JM1: Lantana camara	Lantana camara L.
JM1: Lantana montevidensis	Lantana montevidensis (Spreng.) Briq.
JMS: Lappula echinata	Lappula squarrosa (Retz.) Dumort.
JMS: Lappula fremontii	Lappula squarrosa (Retz.) Dumort.
JMS: Lappula occidentalis	Lappula redowskii (Hornem.) Greene
JM1: Lappula redowskii	Lappula redowskii (Hornem.) Greene
JM1: Lappula redowskii var. cupulata	Lappula redowskii var. cupulata (A. Gray) M.E. Jones
JM1: Lappula redowskii var. redowskii	Lappula redowskii (Hornem.) Greene var. redowskii
JM1: Lappula squarrosa	Lappula squarrosa (Retz.) Dumort.
JM1: Lapsana communis	Lapsana communis L.
JM1: Larrea tridentata	Larrea tridentata (DC.) Coville
JM2: Lasiospermum bipinnatum	Lasiospermum bipinnatum (Thunb.) Druce
JM1: Lastarriaea coriacea	Lastarriaea coriacea (Goodman) Hoover
JM1: Lasthenia burkei	Lasthenia burkei (Greene) Greene
JM1: Lasthenia californica	Lasthenia californica Lindl.
JM2: Lasthenia californica subsp. bakeri	Lasthenia californica subsp. bakeri (J.T. Howell) R. Chan
JM2: Lasthenia californica subsp. californica	Lasthenia californica Lindl. subsp. californica
JM2: Lasthenia californica subsp. macrantha	Lasthenia californica subsp. macrantha (A. Gray) R. Chan
JM1: Lasthenia chrysantha	Lasthenia chrysantha (A. Gray) Greene
JMS: Lasthenia chrysostoma	Lasthenia californica Lindl. subsp. californica
JM1: Lasthenia conjugens	Lasthenia conjugens Greene
JM1: Lasthenia coronaria	Lasthenia coronaria (Nutt.) Ornduff
JM1: Lasthenia debilis	Lasthenia debilis (A. Gray) Ornduff
JM1: Lasthenia ferrisiae	Lasthenia ferrisiae Ornduff
JM1: Lasthenia fremontii	Lasthenia fremontii (A. Gray) Greene
JM1: Lasthenia glaberrima	Lasthenia glaberrima DC.
JM1: Lasthenia glabrata	Lasthenia glabrata Lindl.
JM1: Lasthenia glabrata subsp. coulteri	Lasthenia glabrata subsp. coulteri (A. Gray) Ornduff
JM1: Lasthenia glabrata subsp. glabrata	Lasthenia glabrata Lindl. subsp. glabrata
JM2: Lasthenia gracilis	Lasthenia gracilis (DC.) Greene
JMS: Lasthenia hirsutula	Lasthenia californica Lindl. subsp. californica
JM1: Lasthenia leptalea	Lasthenia leptalea (A. Gray) Ornduff
JM1: Lasthenia macrantha	Lasthenia californica subsp. macrantha (A. Gray) R. Chan
JM1: Lasthenia macrantha subsp. bakeri	Lasthenia californica subsp. bakeri (J.T. Howell) R. Chan
JM1: Lasthenia macrantha subsp. macrantha	Lasthenia californica subsp. macrantha (A. Gray) R. Chan
JM2: Lasthenia maritima	Lasthenia maritima (A. Gray) M.C. Vasey
JM1: Lasthenia microglossa	Lasthenia microglossa (DC.) Greene
JM1: Lasthenia minor	Lasthenia minor (DC.) Ornduff
JM1: Lasthenia platycarpha	Lasthenia platycarpha (A. Gray) Greene
JM2: Lathrocasis tenerrima	Lathrocasis tenerrima (A. Gray) L.A. Johnson
JM1: Lathyrus angulatus	Lathyrus angulatus L.
JM1: Lathyrus aphaca	excluded
JM1: Lathyrus biflorus	Lathyrus biflorus T.W. Nelson & J.P. Nelson
JM1: Lathyrus brownii	Lathyrus brownii Eastw.
JM1: Lathyrus cicera	Lathyrus cicera L.
JM1: Lathyrus delnorticus	Lathyrus delnorticus C.L. Hitchc.
JM1: Lathyrus glandulosus	Lathyrus glandulosus Broich
JM1: Lathyrus hirsutus	Lathyrus hirsutus L.
JM1: Lathyrus hitchcockianus	Lathyrus hitchcockianus Barneby & Reveal
JM1: Lathyrus japonicus	Lathyrus japonicus Willd.
JM1: Lathyrus jepsonii	Lathyrus jepsonii Greene
JM1: Lathyrus jepsonii var. californicus	Lathyrus jepsonii var. californicus (S. Watson) Hoover
JM1: Lathyrus jepsonii var. jepsonii	Lathyrus jepsonii Greene var. jepsonii
JM1: Lathyrus lanszwertii	Lathyrus lanszwertii Kellogg
JM1: Lathyrus lanszwertii var. aridus	Lathyrus lanszwertii var. aridus (Piper) Jeps.
JM1: Lathyrus lanszwertii var. lanszwertii	Lathyrus lanszwertii Kellogg var. lanszwertii
JM1: Lathyrus lanszwertii var. tracyi	Lathyrus lanszwertii var. tracyi (Bradshaw) Isely
JM1: Lathyrus latifolius	Lathyrus latifolius L.
JM1: Lathyrus littoralis	Lathyrus littoralis (Nutt.) Walp.
JM2: Lathyrus nevadensis	Lathyrus nevadensis S. Watson
JM1: Lathyrus nevadensis var. nevadensis	Lathyrus nevadensis S. Watson var. nevadensis
JM1: Lathyrus odoratus	Lathyrus odoratus L.
JM1: Lathyrus palustris	Lathyrus palustris L.
JM1: Lathyrus polyphyllus	Lathyrus polyphyllus Nutt.
JM1: Lathyrus rigidus	Lathyrus rigidus T.G. White
JM1: Lathyrus sphaericus	Lathyrus sphaericus Retz.
JM1: Lathyrus splendens	Lathyrus splendens Kellogg
JM1: Lathyrus sulphureus	Lathyrus sulphureus A. Gray
JMS: Lathyrus sulphureus var. argillaceus	Lathyrus sulphureus A. Gray
JM1: Lathyrus tingitanus	Lathyrus tingitanus L.
JM1: Lathyrus torreyi	Lathyrus torreyi A. Gray
JM1: Lathyrus vestitus	Lathyrus vestitus Nutt.
JM1: Lathyrus vestitus var. alefeldii	Lathyrus vestitus var. alefeldii (T.G. White) Isely
JM1: Lathyrus vestitus var. ochropetalus	Lathyrus vestitus var. ochropetalus (Piper) Isely
JM1: Lathyrus vestitus var. vestitus	Lathyrus vestitus Nutt. var. vestitus
JM2: Laurus nobilis	Laurus nobilis L.
JM1: Lavatera arborea	Malva arborea (L.) Webb & Berthel.
JM1: Lavatera assurgentiflora	Malva assurgentiflora (Kellogg) M.F. Ray
JMS: Lavatera assurgentiflora subsp. glabra	Malva assurgentiflora (Kellogg) M.F. Ray
JM1: Lavatera cretica	Malva pseudolavatera Webb & Berthel.
JM2: Lavatera olbia	Lavatera olbia L.
JM2: Lavatera trimestris	Lavatera trimestris L.
JM1: Layia carnosa	Layia carnosa (Nutt.) Torr. & A. Gray
JM1: Layia chrysanthemoides	Layia chrysanthemoides (DC.) A. Gray
JM1: Layia discoidea	Layia discoidea D.D. Keck
JM1: Layia fremontii	Layia fremontii (Torr. & A. Gray) A. Gray
JM1: Layia gaillardioides	Layia gaillardioides (Hook. & Arn.) DC.
JM1: Layia glandulosa	Layia glandulosa (Hook.) Hook. & Arn.
JM1: Layia heterotricha	Layia heterotricha (DC.) Hook. & Arn.
JM1: Layia hieracioides	Layia hieracioides (DC.) Hook. & Arn.
JM1: Layia jonesii	Layia jonesii A. Gray
JM1: Layia leucopappa	Layia leucopappa D.D. Keck
JM1: Layia munzii	Layia munzii D.D. Keck
JM1: Layia pentachaeta	Layia pentachaeta A. Gray
JM1: Layia pentachaeta subsp. albida	Layia pentachaeta subsp. albida D.D. Keck
JM1: Layia pentachaeta subsp. pentachaeta	Layia pentachaeta A. Gray subsp. pentachaeta
JM1: Layia platyglossa	Layia platyglossa (Fisch. & C.A. Mey.) A. Gray
JM1: Layia septentrionalis	Layia septentrionalis D.D. Keck
JM1: Ledum glandulosum	Rhododendron columbianum (Piper) Harmaja
JM1: Leersia oryzoides	Leersia oryzoides (L.) Sw.
JM1: Legenere limosa	Legenere limosa (Greene) McVaugh
JM1: Lembertia congdonii	Monolopia congdonii (A. Gray) B.G. Baldwin
JMS: Lemmonia californica	Nama californicum (A. Gray) J.D. Bacon
JM1: Lemna aequinoctialis	Lemna aequinoctialis Welw.
JMS: Lemna cyclostasa	Lemna valdiviana Phil.
JM1: Lemna gibba	Lemna gibba L.
JMS: Lemna minima	Lemna minuta Kunth
JM1: Lemna minor	Lemna minor L.
JMS: Lemna minuscula	Lemna minuta Kunth
JM1: Lemna minuta	Lemna minuta Kunth
JM1: Lemna trisulca	Lemna trisulca L.
JM1: Lemna turionifera	Lemna turionifera Landolt
JM1: Lemna valdiviana	Lemna valdiviana Phil.
JMS: Lemna valdiviana var. abbreviata	Lemna valdiviana Phil.
JM1: Lens culinaris	Lens culinaris Medik.
JMS: Leontodon leysseri	Leontodon saxatilis Lam.
JM2: Leontodon saxatilis	Leontodon saxatilis Lam.
JM2: Leontodon saxatilis subsp. longirostris	Leontodon saxatilis subsp. longirostris (Finch & P.D. Sell) P. Silva
JM2: Leontodon saxatilis subsp. saxatilis	Leontodon saxatilis Lam. subsp. saxatilis
JM1: Leontodon taraxacoides	Leontodon saxatilis Lam.
JM1: Leontodon taraxacoides subsp. longirostris	Leontodon saxatilis subsp. longirostris (Finch & P.D. Sell) P. Silva
JM1: Leontodon taraxacoides subsp. taraxacoides	Leontodon saxatilis Lam.
JM1: Lepechinia calycina	Lepechinia calycina (Benth.) Munz
JM1: Lepechinia cardiophylla	Lepechinia cardiophylla Epling
JM1: Lepechinia fragrans	Lepechinia fragrans (Greene) Epling
JM1: Lepechinia ganderi	Lepechinia ganderi Epling
JM2: Lepechinia rossii	Lepechinia rossii S. Boyd & Mistretta
JM2: Lepidium acutidens	Lepidium acutidens (A. Gray) Howell
JM2: Lepidium appelianum	Lepidium appelianum Al-Shehbaz
JM1: Lepidium campestre	Lepidium campestre (L.) W.T. Aiton
JM2: Lepidium chalepense	Lepidium chalepense L.
JM2: Lepidium coronopus	Lepidium coronopus (L.) Al-Shehbaz
JM1: Lepidium densiflorum	Lepidium densiflorum Schrad.; Lepidium ramosissimum A. Nelson
JMS: Lepidium densiflorum var. bourgeauanum	Lepidium ramosissimum A. Nelson
JM1: Lepidium densiflorum var. densiflorum	Lepidium densiflorum Schrad.
JM1: Lepidium densiflorum var. elongatum	Lepidium densiflorum Schrad.
JM1: Lepidium densiflorum var. macrocarpum	Lepidium densiflorum Schrad.
JM1: Lepidium densiflorum var. pubicarpum	Lepidium densiflorum Schrad.
JM1: Lepidium densiflorum var. ramosum	Lepidium densiflorum Schrad.
JM1: Lepidium dictyotum	Lepidium dictyotum A. Gray; Lepidium acutidens (A. Gray) Howell
JM1: Lepidium dictyotum var. acutidens	Lepidium acutidens (A. Gray) Howell
JM1: Lepidium dictyotum var. dictyotum	Lepidium dictyotum A. Gray
JM2: Lepidium didymum	Lepidium didymum L.
JM2: Lepidium draba	Lepidium draba L.
JM1: Lepidium flavum	Lepidium flavum Torr.
JM1: Lepidium flavum var. felipense	Lepidium flavum Torr.
JM1: Lepidium flavum var. flavum	Lepidium flavum Torr.
JM1: Lepidium fremontii	Lepidium fremontii S. Watson
JM1: Lepidium fremontii var. fremontii	Lepidium fremontii S. Watson
JM1: Lepidium fremontii var. stipitatum	Lepidium fremontii S. Watson
JM1: Lepidium heterophyllum	Lepidium heterophyllum Benth.
JM1: Lepidium jaredii	Lepidium jaredii Brandegee
JM2: Lepidium lasiocarpum	Lepidium lasiocarpum Nutt.
JM2: Lepidium lasiocarpum subsp. lasiocarpum	Lepidium lasiocarpum Nutt. subsp. lasiocarpum
JM1: Lepidium lasiocarpum var. lasiocarpum	Lepidium lasiocarpum Nutt. subsp. lasiocarpum
JM1: Lepidium latifolium	Lepidium latifolium L.
JM1: Lepidium latipes	Lepidium latipes Hook.
JM1: Lepidium latipes var. heckardii	Lepidium latipes Hook.
JM1: Lepidium latipes var. latipes	Lepidium latipes Hook.
JM1: Lepidium montanum	Lepidium montanum Nutt.
JMS: Lepidium montanum subsp. canescens	Lepidium montanum Nutt.
JMS: Lepidium montanum subsp. cinereum	Lepidium montanum Nutt.
JM1: Lepidium montanum var. canescens	Lepidium montanum Nutt.
JM1: Lepidium montanum var. cinereum	Lepidium montanum Nutt.
JM1: Lepidium montanum var. montanum	Lepidium montanum Nutt.
JM1: Lepidium nitidum	Lepidium nitidum Nutt.
JM1: Lepidium nitidum var. howellii	Lepidium nitidum Nutt.
JM1: Lepidium nitidum var. nitidum	Lepidium nitidum Nutt.
JM1: Lepidium nitidum var. oreganum	Lepidium nitidum Nutt.
JM1: Lepidium oblongum	Lepidium oblongum Small
JM1: Lepidium oblongum var. insulare	Lepidium oblongum Small
JM1: Lepidium oblongum var. oblongum	Lepidium oblongum Small
JM1: Lepidium oxycarpum	Lepidium oxycarpum Torr. & A. Gray
JMS: Lepidium oxycarpum var. acutidens	Lepidium acutidens (A. Gray) Howell
JM1: Lepidium perfoliatum	Lepidium perfoliatum L.
JM1: Lepidium pinnatifidum	Lepidium pinnatifidum Ledeb.
JM2: Lepidium ramosissimum	Lepidium ramosissimum A. Nelson
JM1: Lepidium ramosissimum var. bourgeauanum	Lepidium ramosissimum A. Nelson
JMS: Lepidium ruderale	Lepidium virginicum L.
JMS: Lepidium squamatum	Lepidium coronopus (L.) Al-Shehbaz
JM1: Lepidium strictum	Lepidium strictum (S. Watson) Rattan
JM1: Lepidium thurberi	Lepidium thurberi Wooton
JM1: Lepidium virginicum	Lepidium virginicum L.
JM2: Lepidium virginicum subsp. menziesii	Lepidium virginicum subsp. menziesii (DC.) Thell.
JM2: Lepidium virginicum subsp. virginicum	Lepidium virginicum L. subsp. virginicum
JM1: Lepidium virginicum var. medium	Lepidium virginicum subsp. menziesii (DC.) Thell.
JMS: Lepidium virginicum var. menziesii	Lepidium virginicum subsp. menziesii (DC.) Thell.
JM1: Lepidium virginicum var. pubescens	Lepidium virginicum subsp. menziesii (DC.) Thell.
JM1: Lepidium virginicum var. robinsonii	Lepidium virginicum subsp. menziesii (DC.) Thell.
JM1: Lepidium virginicum var. virginicum	Lepidium virginicum L.
JM1: Lepidospartum latisquamum	Lepidospartum latisquamum S. Watson
JM1: Lepidospartum squamatum	Lepidospartum squamatum (A. Gray) A. Gray
JM2: Leptochloa dubia	Leptochloa dubia (Kunth) Nees
JM1: Leptochloa fascicularis	Leptochloa fusca subsp. fascicularis (Lam.) N. Snow
JM1: Leptochloa filiformis	Leptochloa panicea (Retz.) Ohwi subsp. brachiata (Steud.) N. Snow
JM2: Leptochloa fusca	Leptochloa fusca (L.) Kunth
JM2: Leptochloa fusca subsp. fascicularis	Leptochloa fusca subsp. fascicularis (Lam.) N. Snow
JM2: Leptochloa fusca subsp. uninervia	Leptochloa fusca subsp. uninervia (J. Presl) N. Snow
JMS: Leptochloa mucronata	Leptochloa panicea (Retz.) Ohwi subsp. brachiata (Steud.) N. Snow
JM2: Leptochloa panicea	Leptochloa panicea (Retz.) Ohwi
JM2: Leptochloa panicea subsp. brachiata	Leptochloa panicea (Retz.) Ohwi subsp. brachiata (Steud.) N. Snow
JM1: Leptochloa uninervia	Leptochloa fusca subsp. uninervia (J. Presl) N. Snow
JM1: Leptochloa viscida	Leptochloa viscida (Scribn.) Beal
JM1: Leptodactylon californicum	Linanthus californicus (Hook. & Arn.) J.M. Porter & L.A. Johnson
JMS: Leptodactylon californicum subsp. brevitrichomum	Linanthus californicus (Hook. & Arn.) J.M. Porter & L.A. Johnson
JMS: Leptodactylon californicum subsp. californicum	Linanthus californicus (Hook. & Arn.) J.M. Porter & L.A. Johnson
JMS: Leptodactylon californicum subsp. glandulosum	Linanthus californicus (Hook. & Arn.) J.M. Porter & L.A. Johnson
JMS: Leptodactylon californicum subsp. leptotrichomum	Linanthus californicus (Hook. & Arn.) J.M. Porter & L.A. Johnson
JMS: Leptodactylon californicum subsp. tomentosum	Linanthus californicus (Hook. & Arn.) J.M. Porter & L.A. Johnson
JM1: Leptodactylon jaegeri	Linanthus jaegeri (Munz) J.M. Porter & L.A. Johnson
JM1: Leptodactylon pungens	Linanthus pungens (Torr.) J.M. Porter & L.A. Johnson
JM2: Leptosiphon acicularis	Leptosiphon acicularis (Greene) Jeps.
JM2: Leptosiphon ambiguus	Leptosiphon ambiguus (Rattan) J.M. Porter & L.A. Johnson
JM2: Leptosiphon androsaceus	Leptosiphon androsaceus Benth.
JM2: Leptosiphon aureus	Leptosiphon aureus (Nutt.) E. Vilm.
JM2: Leptosiphon aureus subsp. aureus	Leptosiphon aureus (Nutt.) E. Vilm. subsp. aureus
JM2: Leptosiphon aureus subsp. decorus	Leptosiphon aureus subsp. decorus (A. Gray) J.M. Porter & L.A. Johnson
JM2: Leptosiphon bicolor	Leptosiphon bicolor Nutt.
JM2: Leptosiphon bolanderi	Leptosiphon bolanderi (A. Gray) J.M. Porter & L.A. Johnson
JM2: Leptosiphon breviculus	Leptosiphon breviculus (A. Gray) J.M. Porter & L.A. Johnson
JM2: Leptosiphon ciliatus	Leptosiphon ciliatus (Benth.) Jeps.
JM2: Leptosiphon croceus	Leptosiphon croceus (Eastw.) J.M. Porter & L.A. Johnson
JM2: Leptosiphon filipes	Leptosiphon filipes (Benth.) J.M. Porter & L.A. Johnson
JM2: Leptosiphon floribundus	Leptosiphon floribundus (A. Gray) J.M. Porter & L.A. Johnson
JM2: Leptosiphon floribundus subsp. floribundus	Leptosiphon floribundus (A. Gray) J.M. Porter & L.A. Johnson subsp. floribundus
JM2: Leptosiphon floribundus subsp. glaber	Leptosiphon floribundus subsp. glaber (R. Patt.) J.M. Porter & L.A. Johnson
JM2: Leptosiphon floribundus subsp. hallii	Leptosiphon floribundus subsp. hallii (Jeps.) J.M. Porter & L.A. Johnson
JM2: Leptosiphon grandiflorus	Leptosiphon grandiflorus Benth.
JM2: Leptosiphon harknessii	Leptosiphon harknessii (Curran) J.M. Porter & L.A. Johnson
JM2: Leptosiphon jepsonii	Leptosiphon jepsonii (Schemske & Goodwillie) J.M. Porter & L.A. Johnson
JM2: Leptosiphon latisectus	Leptosiphon latisectus (E.G. Buxton) J.M. Porter & L.A. Johnson
JM2: Leptosiphon lemmonii	Leptosiphon lemmonii (A. Gray) J.M. Porter & L.A. Johnson
JM2: Leptosiphon liniflorus	Leptosiphon liniflorus (Benth.) J.M. Porter & L.A. Johnson
JM2: Leptosiphon minimus	Leptosiphon minimus (H. Mason) R. Battaglia
JM2: Leptosiphon montanus	Leptosiphon montanus (Greene) J.M. Porter & L.A. Johnson
JM2: Leptosiphon nudatus	Leptosiphon nudatus (Greene) J.M. Porter & L.A. Johnson
JM2: Leptosiphon nuttallii	Leptosiphon nuttallii (A. Gray) J.M. Porter & L.A. Johnson
JM2: Leptosiphon nuttallii subsp. howellii	Leptosiphon nuttallii subsp. howellii (T.W. Nelson & R. Patt.) J.M. Porter & L.A. Johnson
JM2: Leptosiphon nuttallii subsp. nuttallii	Leptosiphon nuttallii (A. Gray) J.M. Porter & L.A. Johnson subsp. nuttallii
JM2: Leptosiphon nuttallii subsp. pubescens	Leptosiphon nuttallii subsp. pubescens (R. Patt.) J.M. Porter & L.A. Johnson
JM2: Leptosiphon oblanceolatus	Leptosiphon oblanceolatus (Brand) J.M. Porter & L.A. Johnson
JM2: Leptosiphon pachyphyllus	Leptosiphon pachyphyllus (R. Patt.) J.M. Porter & L.A. Johnson
JM2: Leptosiphon parviflorus	Leptosiphon parviflorus Benth.
JM2: Leptosiphon pygmaeus	Leptosiphon pygmaeus (Brand) J.M. Porter & L.A. Johnson
JM2: Leptosiphon pygmaeus subsp. continentalis	Leptosiphon pygmaeus subsp. continentalis (P.H. Raven) J.M. Porter & L.A. Johnson
JM2: Leptosiphon pygmaeus subsp. pygmaeus	Leptosiphon pygmaeus (Brand) J.M. Porter & L.A. Johnson subsp. pygmaeus
JM2: Leptosiphon rattanii	Leptosiphon rattanii (A. Gray) J.M. Porter & L.A. Johnson
JM2: Leptosiphon rosaceus	Leptosiphon rosaceus (Hook. f.) R. Battaglia
JM2: Leptosiphon septentrionalis	Leptosiphon septentrionalis (H. Mason) J.M. Porter & L.A. Johnson
JM2: Leptosiphon serrulatus	Leptosiphon serrulatus (Greene) J.M. Porter & L.A. Johnson
JM1: Leptospermum laevigatum	Leptospermum laevigatum (Gaertn.) F. Muell.
JM2: Leptosyne bigelovii	Leptosyne bigelovii (A. Gray) A. Gray
JM2: Leptosyne californica	Leptosyne californica Nutt.
JM2: Leptosyne calliopsidea	Leptosyne calliopsidea (DC.) A. Gray
JM2: Leptosyne douglasii	Leptosyne douglasii DC.
JM2: Leptosyne gigantea	Leptosyne gigantea Kellogg
JM2: Leptosyne hamiltonii	Leptosyne hamiltonii Elmer
JM2: Leptosyne maritima	Leptosyne maritima (Nutt.) A. Gray
JM2: Leptosyne stillmanii	Leptosyne stillmanii A. Gray
JMS: Lepturus cylindricus	Hainardia cylindrica (Willd.) Greuter
JMS: Lesquerella cordiformis	Physaria cordiformis Rollins
JMS: Lesquerella cusickii	Physaria occidentalis (S. Watson) O'Kane & Al-Shehbaz subsp. occidentalis
JM1: Lesquerella kingii	Physaria kingii (S. Watson) O'Kane & Al-Shehbaz; Physaria cordiformis Rollins
JM1: Lesquerella kingii subsp. bernardina	Physaria kingii subsp. bernardina (Munz) O'Kane & Al-Shehbaz
JM1: Lesquerella kingii subsp. kingii	Physaria kingii (S. Watson) O'Kane & Al-Shehbaz subsp. kingii
JM1: Lesquerella kingii subsp. latifolia	Physaria kingii subsp. latifolia (A. Nelson) O'Kane & Al-Shehbaz
JMS: Lesquerella kingii var. cordiformis	Physaria cordiformis Rollins
JMS: Lesquerella ludoviciana	Physaria ludoviciana (Nutt.) O'Kane & Al-Shehbaz
JMS: Lesquerella occidentalis	Physaria occidentalis (S. Watson) O'Kane & Al-Shehbaz
JM1: Lesquerella occidentalis subsp. occidentalis	Physaria occidentalis (S. Watson) O'Kane & Al-Shehbaz subsp. occidentalis
JM1: Lesquerella tenella	Physaria tenella (A. Nelson) O'Kane & Al-Shehbaz
JMS: Lesquerella wardii	Physaria kingii subsp. latifolia (A. Nelson) O'Kane & Al-Shehbaz
JM1: Lessingia arachnoidea	Lessingia arachnoidea Greene
JM1: Lessingia filaginifolia	Corethrogyne filaginifolia (Hook. & Arn.) Nutt.
JM1: Lessingia filaginifolia var. californica	Corethrogyne filaginifolia (Hook. & Arn.) Nutt.
JM1: Lessingia filaginifolia var. filaginifolia	Corethrogyne filaginifolia (Hook. & Arn.) Nutt.
JM1: Lessingia germanorum	Lessingia germanorum Cham.
JM1: Lessingia glandulifera	Lessingia glandulifera A. Gray; Lessingia pectinata Greene
JM1: Lessingia glandulifera var. glandulifera	Lessingia glandulifera A. Gray var. glandulifera; Lessingia pectinata var. tenuipes (J.T. Howell) Markos
JM1: Lessingia glandulifera var. pectinata	Lessingia pectinata Greene var. pectinata
JM2: Lessingia glandulifera var. peirsonii	Lessingia glandulifera var. peirsonii (J.T. Howell) Markos
JM1: Lessingia glandulifera var. tomentosa	Lessingia glandulifera var. tomentosa (Greene) Ferris
JM1: Lessingia hololeuca	Lessingia hololeuca Greene
JM1: Lessingia lemmonii	Lessingia glandulifera A. Gray
JM1: Lessingia lemmonii var. lemmonii	Lessingia glandulifera A. Gray var. glandulifera
JM1: Lessingia lemmonii var. peirsonii	Lessingia glandulifera var. peirsonii (J.T. Howell) Markos
JM1: Lessingia lemmonii var. ramulosissima	Lessingia glandulifera A. Gray var. glandulifera
JM1: Lessingia leptoclada	Lessingia leptoclada A. Gray
JM1: Lessingia micradenia	Lessingia micradenia Greene
JM1: Lessingia micradenia var. glabrata	Lessingia micradenia var. glabrata (D.D. Keck) Ferris
JM1: Lessingia micradenia var. micradenia	Lessingia micradenia Greene var. micradenia
JM1: Lessingia nana	Lessingia nana A. Gray
JM1: Lessingia nemaclada	Lessingia nemaclada Greene
JM1: Lessingia occidentalis	Benitoa occidentalis (H.M. Hall) D.D. Keck
JM2: Lessingia pectinata	Lessingia pectinata Greene
JM2: Lessingia pectinata var. pectinata	Lessingia pectinata Greene var. pectinata
JM2: Lessingia pectinata var. tenuipes	Lessingia pectinata var. tenuipes (J.T. Howell) Markos
JM1: Lessingia ramulosa	Lessingia ramulosa A. Gray
JM1: Lessingia tenuis	Lessingia tenuis (A. Gray) Coville
JM1: Lessingia virgata	Lessingia virgata A. Gray
JM2: Leucanthemum lacustre	Leucanthemum lacustre (Brot.) Samp.
JM1: Leucanthemum maximum	Leucanthemum maximum (Ramond) DC.
JM1: Leucanthemum vulgare	Leucanthemum vulgare Lam.
JM1: Leucocrinum montanum	Leucocrinum montanum A. Gray
JM2: Leucojum aestivum	Leucojum aestivum L.
JMS: Leucopoa kingii	Festuca kingii (S. Watson) Cassidy
JM1: Leucothoe davisiae	Leucothoe davisiae A. Gray
JM2: Lewisia &times;whiteae	Lewisia &times;whiteae Purdy
JM1: Lewisia brachycalyx	Lewisia brachycalyx A. Gray
JM1: Lewisia cantelovii	Lewisia cantelovii J.T. Howell
JM1: Lewisia columbiana	excluded
JM1: Lewisia congdonii	Lewisia congdonii (Rydb.) S. Clay
JM1: Lewisia cotyledon	Lewisia cotyledon (S. Watson) B.L. Rob.
JM1: Lewisia cotyledon var. cotyledon	Lewisia cotyledon (S. Watson) B.L. Rob. var. cotyledon
JM1: Lewisia cotyledon var. heckneri	Lewisia cotyledon var. heckneri (C.V. Morton) Munz
JM1: Lewisia cotyledon var. howellii	Lewisia cotyledon var. howellii (S. Watson) Jeps.
JM1: Lewisia disepala	Lewisia disepala Rydb.
JM1: Lewisia glandulosa	Lewisia glandulosa (Rydb.) Dempster
JM1: Lewisia kelloggii	Lewisia kelloggii K. Brandegee
JM2: Lewisia kelloggii subsp. hutchisonii	Lewisia kelloggii subsp. hutchisonii Dempster
JM2: Lewisia kelloggii subsp. kelloggii	Lewisia kelloggii K. Brandegee subsp. kelloggii
JM1: Lewisia leana	Lewisia leeana (Porter) B.L. Rob.
JM2: Lewisia leeana	Lewisia leeana (Porter) B.L. Rob.
JM1: Lewisia longipetala	Lewisia longipetala (Piper) S. Clay
JM1: Lewisia nevadensis	Lewisia nevadensis (A. Gray) B.L. Rob.
JM1: Lewisia oppositifolia	Lewisia oppositifolia (S. Watson) B.L. Rob.
JM1: Lewisia pygmaea	Lewisia pygmaea (A. Gray) B.L. Rob.
JM1: Lewisia rediviva	Lewisia rediviva Pursh
JM2: Lewisia rediviva var. minor	Lewisia rediviva var. minor (Rydb.) Munz
JM2: Lewisia rediviva var. rediviva	Lewisia rediviva Pursh var. rediviva
JM2: Lewisia serrata	Lewisia serrata Heckard & Stebbins
JM1: Lewisia stebbinsii	Lewisia stebbinsii Gankin & W.R. Hildreth
JM1: Lewisia triphylla	Lewisia triphylla (S. Watson) B.L. Rob.
JMS: Leymus &times;multiflorus	Elymus &times;gouldii J.P. Sm. & Columbus
JMS: Leymus &times;vancouverensis	Elymus &times;vancouverensis Vasey
JMS: Leymus californicus	Elymus californicus (Thurb.) Gould
JM1: Leymus cinereus	Elymus cinereus Scribn. & Merr.
JM1: Leymus condensatus	Elymus condensatus J. Presl
JMS: Leymus mollis	Elymus mollis Trin.
JM1: Leymus mollis subsp. mollis	Elymus mollis Trin. subsp. mollis
JM1: Leymus pacificus	Elymus pacificus Gould
JMS: Leymus salina	Elymus salina M.E. Jones
JMS: Leymus salina subsp. mojavensis	Elymus salina M.E. Jones
JMS: Leymus salinus	Elymus salina M.E. Jones
JM1: Leymus salinus subsp. mojavensis	Elymus salina M.E. Jones
JM1: Leymus triticoides	Elymus triticoides Buckley
JM1: Libertia formosa	Libertia formosa Graham
JM1: Ligusticum apiifolium	Ligusticum apiifolium (Nutt.) A. Gray
JM1: Ligusticum californicum	Ligusticum californicum J.M. Coult. & Rose
JM1: Ligusticum grayi	Ligusticum grayi J.M. Coult. & Rose
JM2: Ligustrum japonicum	Ligustrum japonicum Thunb.
JM2: Ligustrum lucidum	Ligustrum lucidum W.T. Aiton
JM2: Ligustrum ovalifolium	Ligustrum ovalifolium Hassk.
JM1: Lilaea scilloides	Triglochin scilloides (Poir.) Mering & Kadereit
JM1: Lilaeopsis masonii	Lilaeopsis masonii Mathias & Constance
JM1: Lilaeopsis occidentalis	Lilaeopsis occidentalis J.M. Coult. & Rose
JM1: Lilium bolanderi	Lilium bolanderi S. Watson
JM1: Lilium columbianum	Lilium columbianum Leichtlin
JM1: Lilium humboldtii	Lilium humboldtii Duch.
JM1: Lilium humboldtii subsp. humboldtii	Lilium humboldtii Duch. subsp. humboldtii
JM1: Lilium humboldtii subsp. ocellatum	Lilium humboldtii subsp. ocellatum (Kellogg) Thorne
JM1: Lilium kelleyanum	Lilium kelleyanum Lemmon
JM1: Lilium kelloggii	Lilium kelloggii Purdy
JM1: Lilium maritimum	Lilium maritimum Kellogg
JM1: Lilium occidentale	Lilium occidentale Purdy
JM1: Lilium pardalinum	Lilium pardalinum Kellogg
JM1: Lilium pardalinum subsp. pardalinum	Lilium pardalinum Kellogg subsp. pardalinum
JM1: Lilium pardalinum subsp. pitkinense	Lilium pardalinum subsp. pitkinense (Beane & Vollmer) M.W. Skinner
JM1: Lilium pardalinum subsp. shastense	Lilium pardalinum subsp. shastense (Eastw.) M.W. Skinner
JM1: Lilium pardalinum subsp. vollmeri	Lilium pardalinum subsp. vollmeri (Eastw.) M.W. Skinner
JM1: Lilium pardalinum subsp. wigginsii	Lilium pardalinum subsp. wigginsii (Beane & Vollmer) M.W. Skinner
JM1: Lilium parryi	Lilium parryi S. Watson
JMS: Lilium parryi var. kessleri	Lilium parryi S. Watson
JM1: Lilium parvum	Lilium parvum Kellogg
JM1: Lilium rubescens	Lilium rubescens S. Watson
JM1: Lilium washingtonianum	Lilium washingtonianum Kellogg
JM1: Lilium washingtonianum subsp. purpurascens	Lilium washingtonianum subsp. purpurascens (Stearn) M.W. Skinner
JM1: Lilium washingtonianum subsp. washingtonianum	Lilium washingtonianum Kellogg subsp. washingtonianum
JM1: Limnanthes alba	Limnanthes alba Benth.
JM1: Limnanthes alba subsp. alba	Limnanthes alba Benth. subsp. alba
JM2: Limnanthes alba subsp. parishii	Limnanthes alba subsp. parishii (Jeps.) Morin
JM1: Limnanthes alba subsp. versicolor	Limnanthes alba subsp. versicolor (Greene) C.T. Mason
JM1: Limnanthes bakeri	Limnanthes bakeri J.T. Howell
JM1: Limnanthes douglasii	Limnanthes douglasii R. Br.
JM1: Limnanthes douglasii subsp. douglasii	Limnanthes douglasii R. Br. subsp. douglasii
JM1: Limnanthes douglasii subsp. nivea	Limnanthes douglasii subsp. nivea (C.T. Mason) C.T. Mason
JM1: Limnanthes douglasii subsp. rosea	Limnanthes douglasii subsp. rosea (Benth.) C.T. Mason
JM2: Limnanthes douglasii subsp. striata	Limnanthes douglasii subsp. striata (Jeps.) Morin
JM1: Limnanthes douglasii subsp. sulphurea	Limnanthes douglasii subsp. sulphurea (C.T. Mason) C.T. Mason
JM1: Limnanthes floccosa	Limnanthes floccosa Howell
JM2: Limnanthes floccosa subsp. bellingeriana	Limnanthes floccosa subsp. bellingeriana (M. Peck) Arroyo
JM1: Limnanthes floccosa subsp. californica	Limnanthes floccosa subsp. californica Arroyo
JM1: Limnanthes floccosa subsp. floccosa	Limnanthes floccosa Howell subsp. floccosa
JMS: Limnanthes gracilis	Limnanthes alba
JM1: Limnanthes gracilis subsp. parishii	Limnanthes alba subsp. parishii (Jeps.) Morin
JM1: Limnanthes montana	Limnanthes montana Jeps.
JM1: Limnanthes striata	Limnanthes douglasii subsp. striata (Jeps.) Morin
JM1: Limnanthes vinculans	Limnanthes vinculans Ornduff
JMS: Limnobium laevigatum	Limnobium spongia (Bosc) Steud.
JM2: Limnobium spongia	Limnobium spongia (Bosc) Steud.
JM1: Limonium arborescens	excluded
JM2: Limonium brassicifolium	Limonium brassicifolium (Webb & Berthel.) Kuntze
JM1: Limonium californicum	Limonium californicum (Boiss.) A. Heller
JMS: Limonium californicum var. mexicanum	Limonium californicum (Boiss.) A. Heller
JM2: Limonium duriusculum	Limonium duriusculum (Girard) Fourr.
JM1: Limonium otolepis	Limonium otolepis (Schrenk) Kuntze
JM1: Limonium perezii	Limonium perezii (Stapf) F.T. Hubb.
JMS: Limonium perfoliatum	Limonium otolepis (Schrenk) Kuntze
JM2: Limonium preauxii	Limonium preauxii (Webb & Berthel.) Kuntze
JM2: Limonium ramosissimum	Limonium ramosissimum (Poir.) Maire
JM1: Limonium sinuatum	Limonium sinuatum (L.) Mill.
JM2: Limonium sventenii	Limonium sventenii A. Santos & M. Fern&aacute;ndez
JM1: Limosella acaulis	Limosella acaulis Sess&eacute; & Moc.
JM1: Limosella aquatica	Limosella aquatica L.
JM2: Limosella australis	Limosella australis R. Br.
JM1: Limosella subulata	Limosella australis R. Br.
JM1: Linanthus acicularis	Leptosiphon acicularis (Greene) Jeps.
JM1: Linanthus ambiguus	Leptosiphon ambiguus (Rattan) J.M. Porter & L.A. Johnson
JM1: Linanthus androsaceus	Leptosiphon androsaceus Benth.
JM1: Linanthus arenicola	Linanthus arenicola (M.E. Jones) Jeps. & V.L. Bailey
JM1: Linanthus aureus	Leptosiphon aureus (Nutt.) E. Vilm.
JM1: Linanthus aureus subsp. aureus	Leptosiphon aureus (Nutt.) E. Vilm. subsp. aureus
JM1: Linanthus aureus subsp. decorus	Leptosiphon aureus subsp. decorus (A. Gray) J.M. Porter & L.A. Johnson
JM1: Linanthus bellus	Linanthus bellus (A. Gray) Greene
JM1: Linanthus bicolor	Leptosiphon bicolor Nutt.
JMS: Linanthus bicolor subsp. minimus	Leptosiphon minimus (H. Mason) R. Battaglia
JM1: Linanthus bigelovii	Linanthus bigelovii (A. Gray) Greene
JM1: Linanthus bolanderi	Leptosiphon bolanderi (A. Gray) J.M. Porter & L.A. Johnson
JM1: Linanthus breviculus	Leptosiphon breviculus (A. Gray) J.M. Porter & L.A. Johnson
JM2: Linanthus californicus	Linanthus californicus (Hook. & Arn.) J.M. Porter & L.A. Johnson
JM2: Linanthus campanulatus	Linanthus campanulatus (A. Gray) J.M. Porter & L.A. Johnson
JM1: Linanthus ciliatus	Leptosiphon ciliatus (Benth.) Jeps.
JM1: Linanthus concinnus	Linanthus concinnus Milliken
JMS: Linanthus croceus	Leptosiphon croceus (Eastw.) J.M. Porter & L.A. Johnson
JM1: Linanthus demissus	Linanthus demissus (A. Gray) Greene
JM1: Linanthus dianthiflorus	Linanthus dianthiflorus (Benth.) Greene
JM1: Linanthus dichotomus	Linanthus dichotomus Benth.
JM2: Linanthus dichotomus subsp. dichotomus	Linanthus dichotomus Benth. subsp. dichotomus
JM2: Linanthus dichotomus subsp. meridianus	Linanthus dichotomus subsp. meridianus (Eastw.) H. Mason
JM2: Linanthus filiformis	Linanthus filiformis (A. Gray) J.M. Porter & L.A. Johnson
JM1: Linanthus filipes	Leptosiphon filipes (Benth.) J.M. Porter & L.A. Johnson
JM1: Linanthus floribundus	Leptosiphon floribundus (A. Gray) J.M. Porter & L.A. Johnson
JM1: Linanthus floribundus subsp. floribundus	Leptosiphon floribundus (A. Gray) J.M. Porter & L.A. Johnson subsp. floribundus
JM1: Linanthus floribundus subsp. glaber	Leptosiphon floribundus subsp. glaber (R. Patt.) J.M. Porter & L.A. Johnson
JM1: Linanthus floribundus subsp. hallii	Leptosiphon floribundus subsp. hallii (Jeps.) J.M. Porter & L.A. Johnson
JM1: Linanthus grandiflorus	Leptosiphon grandiflorus Benth.
JM1: Linanthus harknessii	Leptosiphon harknessii (Curran) J.M. Porter & L.A. Johnson
JM2: Linanthus inyoensis	Linanthus inyoensis (I.M. Johnst.) J.M. Porter & L.A. Johnson
JM2: Linanthus jaegeri	Linanthus jaegeri (Munz) J.M. Porter & L.A. Johnson
JM1: Linanthus jepsonii	Leptosiphon jepsonii (Schemske & Goodwillie) J.M. Porter & L.A. Johnson
JM1: Linanthus jonesii	Linanthus jonesii (A. Gray) Greene
JM1: Linanthus killipii	Linanthus killipii H. Mason
JMS: Linanthus latisectus	Leptosiphon latisectus (E.G. Buxton) J.M. Porter & L.A. Johnson
JM1: Linanthus lemmonii	Leptosiphon lemmonii (A. Gray) J.M. Porter & L.A. Johnson
JM1: Linanthus liniflorus	Leptosiphon liniflorus (Benth.) J.M. Porter & L.A. Johnson
JM2: Linanthus maculatus	Linanthus maculatus (Parish) Milliken
JM1: Linanthus montanus	Leptosiphon montanus (Greene) J.M. Porter & L.A. Johnson
JM1: Linanthus nudatus	Leptosiphon nudatus (Greene) J.M. Porter & L.A. Johnson
JM1: Linanthus nuttallii	Leptosiphon nuttallii (A. Gray) J.M. Porter & L.A. Johnson
JM1: Linanthus nuttallii subsp. howellii	Leptosiphon nuttallii subsp. howellii (T.W. Nelson & R. Patt.) J.M. Porter & L.A. Johnson
JM1: Linanthus nuttallii subsp. nuttallii	Leptosiphon nuttallii (A. Gray) J.M. Porter & L.A. Johnson subsp. nuttallii
JM1: Linanthus nuttallii subsp. pubescens	Leptosiphon nuttallii subsp. pubescens (R. Patt.) J.M. Porter & L.A. Johnson
JM1: Linanthus oblanceolatus	Leptosiphon oblanceolatus (Brand) J.M. Porter & L.A. Johnson
JM1: Linanthus orcuttii	Linanthus orcuttii (Parry & A. Gray) Jeps.
JM1: Linanthus pachyphyllus	Leptosiphon pachyphyllus (R. Patt.) J.M. Porter & L.A. Johnson
JM1: Linanthus parryae	Linanthus parryae (A. Gray) Greene
JM1: Linanthus parviflorus	Leptosiphon parviflorus Benth.
JM2: Linanthus pungens	Linanthus pungens (Torr.) J.M. Porter & L.A. Johnson
JM1: Linanthus pygmaeus	Leptosiphon pygmaeus (Brand) J.M. Porter & L.A. Johnson
JM1: Linanthus pygmaeus subsp. continentalis	Leptosiphon pygmaeus subsp. continentalis (P.H. Raven) J.M. Porter & L.A. Johnson
JM1: Linanthus pygmaeus subsp. pygmaeus	Leptosiphon pygmaeus (Brand) J.M. Porter & L.A. Johnson subsp. pygmaeus
JM1: Linanthus rattanii	Leptosiphon rattanii (A. Gray) J.M. Porter & L.A. Johnson
JMS: Linanthus rosaceus	Leptosiphon rosaceus (Hook. f.) R. Battaglia
JM1: Linanthus septentrionalis	Leptosiphon septentrionalis (H. Mason) J.M. Porter & L.A. Johnson
JM1: Linanthus serrulatus	Leptosiphon serrulatus (Greene) J.M. Porter & L.A. Johnson
JM1: Linaria bipartita	Linaria bipartita (Vent.) Willd.
JM1: Linaria canadensis	Nuttallanthus texanus (Scheele) D.A. Sutton
JMS: Linaria canadensis var. texana	Nuttallanthus texanus (Scheele) D.A. Sutton
JM2: Linaria dalmatica	Linaria dalmatica (L.) Mill.
JM2: Linaria dalmatica subsp. dalmatica	Linaria dalmatica (L.) Mill. subsp. dalmatica
JMS: Linaria genistifolia	Linaria dalmatica (L.) Mill.
JM1: Linaria genistifolia subsp. dalmatica	Linaria dalmatica (L.) Mill. subsp. dalmatica
JM1: Linaria maroccana	Linaria maroccana Hook. f.
JM1: Linaria pinifolia	Linaria pinifolia (Poir.) Thell.
JM1: Linaria purpurea	Linaria purpurea (L.) Mill.
JMS: Linaria reticulata	Linaria pinifolia (Poir.) Thell.
JM1: Linaria supina	excluded
JM1: Linaria vulgaris	Linaria vulgaris Mill.
JM1: Lindernia dubia	Lindernia dubia (L.) Pennell
JM1: Lindernia dubia var. anagallidea	Lindernia dubia (L.) Pennell
JM1: Lindernia dubia var. dubia	Lindernia dubia (L.) Pennell
JM2: Linnaea borealis	Linnaea borealis L.
JMS: Linnaea borealis subsp. americana	Linnaea borealis L. var. longiflora Torr.
JM1: Linnaea borealis var. longiflora	Linnaea borealis L. var. longiflora Torr.
JMS: Linum angustifolium	Linum bienne Mill.
JM1: Linum bienne	Linum bienne Mill.
JM1: Linum grandiflorum	Linum grandiflorum Desf.
JM1: Linum lewisii	Linum lewisii Pursh
JM1: Linum lewisii var. alpicola	Linum lewisii Pursh
JM1: Linum lewisii var. lewisii	Linum lewisii Pursh
JMS: Linum perenne	Linum lewisii Pursh
JMS: Linum perenne subsp. lewisii	Linum lewisii Pursh
JM1: Linum puberulum	Linum puberulum (Engelm.) A. Heller
JM1: Linum usitatissimum	Linum usitatissimum L.
JM1: Lipocarpha aristulata	Lipocarpha aristulata (Coville) G.C. Tucker
JM1: Lipocarpha micrantha	Lipocarpha micrantha (Vahl) G.C. Tucker
JM1: Lipocarpha occidentalis	Lipocarpha occidentalis (A. Gray) G.C. Tucker
JMS: Lippia lanceolata	Phyla lanceolata (Michx.) Greene
JMS: Lippia wrightii	Aloysia wrightii (Torr.) Abrams
JM2: Listera banksiana	Listera banksiana Lindl.
JM1: Listera caurina	Listera banksiana Lindl.
JM1: Listera convallarioides	Listera convallarioides (Sw.) Elliott
JM1: Listera cordata	Listera cordata (L.) R. Br.
JMS: Listera cordata var. nephrophylla	Listera cordata (L.) R. Br.
JM1: Lithocarpus densiflorus	Notholithocarpus densiflorus (Hook. & Arn.) Manos et al.
JM1: Lithocarpus densiflorus var. densiflorus	Notholithocarpus densiflorus (Hook. & Arn.) Manos et al. var. densiflorus
JM1: Lithocarpus densiflorus var. echinoides	Notholithocarpus densiflorus var. echinoides (R. Br. ter) Manos et al.
JM1: Lithophragma affine	Lithophragma affine A. Gray
JM1: Lithophragma bolanderi	Lithophragma bolanderi A. Gray
JM1: Lithophragma campanulatum	Lithophragma campanulatum Howell
JM1: Lithophragma cymbalaria	Lithophragma cymbalaria Torr. & A. Gray
JM1: Lithophragma glabrum	Lithophragma glabrum Nutt.
JM1: Lithophragma heterophyllum	Lithophragma heterophyllum (Hook. & Arn.) Torr. & A. Gray
JM1: Lithophragma maximum	Lithophragma maximum Bacig.
JM1: Lithophragma parviflorum	Lithophragma parviflorum (Hook.) Torr. & A. Gray
JM1: Lithophragma parviflorum var. parviflorum	Lithophragma parviflorum (Hook.) Torr. & A. Gray var. parviflorum
JM1: Lithophragma parviflorum var. trifoliatum	Lithophragma parviflorum var. trifoliatum (Eastw.) Jeps.
JM1: Lithophragma tenellum	Lithophragma tenellum Nutt.
JMS: Lithophragma trifoliatum	Lithophragma parviflorum var. trifoliatum (Eastw.) Jeps.
JM1: Lithospermum arvense	Lithospermum arvense L.
JM1: Lithospermum californicum	Lithospermum californicum A. Gray
JM1: Lithospermum incisum	Lithospermum incisum Lehm.
JM1: Lithospermum ruderale	Lithospermum ruderale Lehm.
JM2: Lobelia cardinalis	Lobelia cardinalis L.
JM1: Lobelia cardinalis var. pseudosplendens	Lobelia cardinalis L. var. pseudosplendens McVaugh
JM2: Lobelia dunnii	Lobelia dunnii Greene
JM1: Lobelia dunnii var. serrata	Lobelia dunnii Greene var. serrata (A. Gray) McVaugh
JM2: Lobelia erinus	Lobelia erinus L.
JM1: Lobularia maritima	Lobularia maritima (L.) Desv.
JM1: Loeflingia squarrosa	Loeflingia squarrosa Nutt.
JM1: Loeflingia squarrosa var. artemisiarum	Loeflingia squarrosa Nutt.
JM1: Loeflingia squarrosa var. squarrosa	Loeflingia squarrosa Nutt.
JM2: Loeseliastrum depressum	Loeseliastrum depressum (A. Gray) J.M. Porter & L.A. Johnson
JM1: Loeseliastrum matthewsii	Loeseliastrum matthewsii (A. Gray) Timbrook
JM1: Loeseliastrum schottii	Loeseliastrum schottii (Torr.) Timbrook
JM2: Logfia arizonica	Logfia arizonica (A. Gray) Holub
JM2: Logfia depressa	Logfia depressa (A. Gray) Holub
JM2: Logfia filaginoides	Logfia filaginoides (Hook. & Arn.) Morefield
JM2: Logfia gallica	Logfia gallica (L.) Coss. & Germ.
JMS: Lolium arundinaceum	Festuca arundinacea Schreb.
JM1: Lolium multiflorum	Festuca perennis (L.) Columbus & J.P. Sm.
JM1: Lolium perenne	Festuca perennis (L.) Columbus & J.P. Sm.
JMS: Lolium perenne var. multiflorum	Festuca perennis (L.) Columbus & J.P. Sm.
JM1: Lolium temulentum	Festuca temulenta (L.) Columbus & J.P. Sm.
JMS: Lomatium alatum	Lomatium triternatum var. macrocarpum (J.M. Coult. & Rose) Mathias
JM2: Lomatium bicolor	Lomatium bicolor (S. Watson) J.M. Coult. & Rose
JM1: Lomatium bicolor var. leptocarpum	Lomatium bicolor (S. Watson) J.M. Coult. & Rose var. leptocarpum (Torr. & A. Gray) Schlessman
JM1: Lomatium californicum	Lomatium californicum (Nutt.) Mathias & Constance
JM1: Lomatium canbyi	Lomatium canbyi (J.M. Coult. & Rose) J.M. Coult. & Rose
JM1: Lomatium caruifolium	Lomatium caruifolium (Hook. & Arn.) J.M. Coult. & Rose
JM1: Lomatium caruifolium var. caruifolium	Lomatium caruifolium (Hook. & Arn.) J.M. Coult. & Rose var. caruifolium
JM1: Lomatium caruifolium var. denticulatum	Lomatium caruifolium var. denticulatum Jeps.
JM1: Lomatium ciliolatum	Lomatium ciliolatum Jeps.; Lomatium hooveri (Mathias & Constance) Constance & Ertter
JM1: Lomatium ciliolatum var. ciliolatum	Lomatium ciliolatum Jeps.
JM1: Lomatium ciliolatum var. hooveri	Lomatium hooveri (Mathias & Constance) Constance & Ertter
JM1: Lomatium congdonii	Lomatium congdonii J.M. Coult. & Rose
JM1: Lomatium dasycarpum	Lomatium dasycarpum (Torr. & A. Gray) J.M. Coult. & Rose
JM1: Lomatium dasycarpum subsp. dasycarpum	Lomatium dasycarpum (Torr. & A. Gray) J.M. Coult. & Rose subsp. dasycarpum
JM1: Lomatium dasycarpum subsp. tomentosum	Lomatium dasycarpum subsp. tomentosum (Benth.) W.L. Theob.
JM1: Lomatium dissectum	Lomatium dissectum (Nutt.) Mathias & Constance
JM1: Lomatium dissectum var. dissectum	Lomatium dissectum (Nutt.) Mathias & Constance var. dissectum
JM1: Lomatium dissectum var. multifidum	Lomatium dissectum var. multifidum (Nutt.) Mathias & Constance
JM1: Lomatium engelmannii	Lomatium engelmannii Mathias
JM1: Lomatium foeniculaceum	Lomatium foeniculaceum (Nutt.) J.M. Coult. & Rose
JM1: Lomatium foeniculaceum subsp. fimbriatum	Lomatium foeniculaceum subsp. fimbriatum W.L. Theob.
JM1: Lomatium foeniculaceum subsp. inyoense	Lomatium foeniculaceum subsp. inyoense (Munz & J.C. Roos) W.L. Theob.
JM2: Lomatium foeniculaceum subsp. macdougalii	Lomatium foeniculaceum subsp. macdougalii (J.M. Coult. & Rose) W.L. Theob.
JMS: Lomatium giganteum	Lomatium triternatum var. macrocarpum (J.M. Coult. & Rose) Mathias
JM1: Lomatium grayi	Lomatium grayi (J.M. Coult. & Rose) J.M. Coult. & Rose
JM1: Lomatium hallii	Lomatium hallii (S. Watson) J.M. Coult. & Rose
JM1: Lomatium hendersonii	Lomatium hendersonii (J.M. Coult. & Rose) J.M. Coult. & Rose
JM2: Lomatium hooveri	Lomatium hooveri (Mathias & Constance) Constance & Ertter
JM1: Lomatium howellii	Lomatium howellii (S. Watson) Jeps.
JMS: Lomatium humile	Lomatium caruifolium var. denticulatum Jeps.
JM1: Lomatium insulare	Lomatium insulare (Eastw.) Munz
JMS: Lomatium inyoense	Lomatium foeniculaceum subsp. inyoense (Munz & J.C. Roos) W.L. Theob.
JMS: Lomatium leptocarpum	Lomatium bicolor (S. Watson) J.M. Coult. & Rose var. leptocarpum (Torr. & A. Gray) Schlessman
JM1: Lomatium lucidum	Lomatium lucidum (Torr. & A. Gray) Jeps.
JM1: Lomatium macrocarpum	Lomatium macrocarpum (Torr. & A. Gray) J.M. Coult. & Rose
JMS: Lomatium macrocarpum var. ellipticum	Lomatium macrocarpum (Torr. & A. Gray) J.M. Coult. & Rose
JM1: Lomatium marginatum	Lomatium marginatum (Benth.) J.M. Coult. & Rose
JM1: Lomatium marginatum var. marginatum	Lomatium marginatum (Benth.) J.M. Coult. & Rose var. marginatum
JM1: Lomatium marginatum var. purpureum	Lomatium marginatum var. purpureum (Jeps.) Jeps.
JM1: Lomatium martindalei	Lomatium martindalei (J.M. Coult. & Rose) J.M. Coult. & Rose
JMS: Lomatium microcarpum	Lomatium hallii (S. Watson) J.M. Coult. & Rose
JM1: Lomatium mohavense	Lomatium mohavense (J.M. Coult. & Rose) J.M. Coult. & Rose
JMS: Lomatium nelsonianum	Lomatium hallii (S. Watson) J.M. Coult. & Rose
JM1: Lomatium nevadense	Lomatium nevadense (S. Watson) J.M. Coult. & Rose
JMS: Lomatium nevadense var. holopterum	Lomatium nevadense var. parishii (J.M. Coult. & Rose) Jeps.
JM1: Lomatium nevadense var. nevadense	Lomatium nevadense (S. Watson) J.M. Coult. & Rose var. nevadense
JM1: Lomatium nevadense var. parishii	Lomatium nevadense var. parishii (J.M. Coult. & Rose) Jeps.
JMS: Lomatium nevadense var. pseudorientale	Lomatium nevadense var. parishii (J.M. Coult. & Rose) Jeps.
JM1: Lomatium nudicaule	Lomatium nudicaule (Pursh) J.M. Coult. & Rose; Lomatium triternatum (Pursh) J.M. Coult. & Rose
JMS: Lomatium nudicaule var. puberulum	Lomatium triternatum (Pursh) J.M. Coult. & Rose var. triternatum
JM1: Lomatium observatorium	Lomatium observatorium Constance & Ertter
JM1: Lomatium parryi	Lomatium parryi (S. Watson) J.F. Macbr.
JM1: Lomatium parvifolium	Lomatium parvifolium (Hook. & Arn.) Jeps.
JMS: Lomatium parvifolium var. pallidum	Lomatium parvifolium (Hook. & Arn.) Jeps.
JM1: Lomatium peckianum	Lomatium peckianum Mathias & Constance
JM1: Lomatium piperi	Lomatium piperi J.M. Coult. & Rose
JM1: Lomatium plummerae	Lomatium plummerae (J.M. Coult. & Rose) J.M. Coult. & Rose
JMS: Lomatium plummerae var. austiniae	Lomatium plummerae (J.M. Coult. & Rose) J.M. Coult. & Rose
JMS: Lomatium plummerae var. sonnei	Lomatium plummerae (J.M. Coult. & Rose) J.M. Coult. & Rose
JM1: Lomatium ravenii	Lomatium ravenii Mathias & Constance
JM1: Lomatium repostum	Lomatium repostum (Jeps.) Mathias
JM1: Lomatium rigidum	Lomatium rigidum (M.E. Jones) Jeps.
JM1: Lomatium shevockii	Lomatium shevockii R.L. Hartm. & Constance
JM1: Lomatium stebbinsii	Lomatium stebbinsii Schlessman & Constance
JMS: Lomatium tomentosum	Lomatium dasycarpum subsp. tomentosum (Benth.) W.L. Theob.
JM1: Lomatium torreyi	Lomatium torreyi (J.M. Coult. & Rose) J.M. Coult. & Rose
JM1: Lomatium tracyi	Lomatium tracyi Mathias & Constance
JM1: Lomatium triternatum	Lomatium triternatum (Pursh) J.M. Coult. & Rose
JM1: Lomatium triternatum var. macrocarpum	Lomatium triternatum var. macrocarpum (J.M. Coult. & Rose) Mathias
JM1: Lomatium triternatum var. triternatum	Lomatium triternatum (Pursh) J.M. Coult. & Rose var. triternatum
JM1: Lomatium utriculatum	Lomatium utriculatum (Torr. & A. Gray) J.M. Coult. & Rose
JM1: Lomatium vaginatum	Lomatium vaginatum J.M. Coult. & Rose
JMS: Lomatium vaseyi	Lomatium utriculatum (Torr. & A. Gray) J.M. Coult. & Rose
JM1: Lonicera cauriana	Lonicera cauriana Fernald
JM1: Lonicera ciliosa	Lonicera ciliosa (Pursh) Poir.
JM1: Lonicera conjugialis	Lonicera conjugialis Kellogg
JM1: Lonicera etrusca	Lonicera etrusca Santi
JM2: Lonicera hispidula	Lonicera hispidula (Lindl.) Torr. & A. Gray
JMS: Lonicera hispidula var. californica	Lonicera hispidula (Lindl.) Torr. & A. Gray
JM1: Lonicera hispidula var. vacillans	Lonicera hispidula (Lindl.) Torr. & A. Gray
JM1: Lonicera interrupta	Lonicera interrupta Benth.
JM1: Lonicera involucrata	Lonicera involucrata (Richardson) Spreng.
JM1: Lonicera involucrata var. involucrata	Lonicera involucrata (Richardson) Spreng. var. involucrata
JM1: Lonicera involucrata var. ledebourii	Lonicera involucrata var. ledebourii (Eschsch.) Jeps.
JM1: Lonicera japonica	Lonicera japonica Murray
JM1: Lonicera subspicata	Lonicera subspicata Hook. & Arn.
JM1: Lonicera subspicata var. denudata	Lonicera subspicata var. denudata Rehder
JM1: Lonicera subspicata var. subspicata	Lonicera subspicata Hook. & Arn. var. subspicata
JM1: Lonicera tatarica	Lonicera tatarica L.
JMS: Lophochloa cristata	Koeleria gerardii (Vill.) Shinners
JMS: Lorandersonia peirsonii	Tonestus peirsonii (D.D. Keck) G.L. Nesom & D.R. Morgan
JM1: Lotus aboriginus	Hosackia rosea Eastw.
JM1: Lotus angustissimus	Lotus angustissimus L.
JM1: Lotus argophyllus	Acmispon argophyllus (A. Gray) Brouillet
JM1: Lotus argophyllus var. adsurgens	Acmispon argophyllus var. adsurgens (Dunkle) Brouillet
JM1: Lotus argophyllus var. argenteus	Acmispon argophyllus var. argenteus (Dunkle) Brouillet
JM1: Lotus argophyllus var. argophyllus	Acmispon argophyllus (A. Gray) Brouillet var. argophyllus
JM1: Lotus argophyllus var. fremontii	Acmispon argophyllus var. fremontii (A. Gray) Brouillet
JM1: Lotus argophyllus var. niveus	Acmispon argophyllus var. niveus (Greene) Brouillet
JM1: Lotus argyraeus	Acmispon argyraeus (Greene) Brouillet
JM1: Lotus argyraeus var. argyraeus	Acmispon argyraeus (Greene) Brouillet var. argyraeus
JM1: Lotus argyraeus var. multicaulis	Acmispon argyraeus var. multicaulis (Ottley) Brouillet
JM1: Lotus argyraeus var. notitius	Acmispon argyraeus var. notitius (Isely) Brouillet
JM1: Lotus benthamii	Acmispon cytisoides (Benth.) Brouillet
JM1: Lotus corniculatus	Lotus corniculatus L.
JM1: Lotus crassifolius	Hosackia crassifolia Benth.
JM1: Lotus crassifolius var. crassifolius	Hosackia crassifolia Benth. var. crassifolia
JM1: Lotus crassifolius var. otayensis	Hosackia crassifolia var. otayensis (Isely) Brouillet
JM1: Lotus dendroideus	Acmispon dendroideus (Greene) Brouillet
JM1: Lotus dendroideus var. dendroideus	Acmispon dendroideus (Greene) Brouillet var. dendroideus
JM1: Lotus dendroideus var. traskiae	Acmispon dendroideus var. traskiae (Abrams) Brouillet
JM1: Lotus dendroideus var. veatchii	Acmispon dendroideus var. veatchii (Greene) Brouillet
JM1: Lotus denticulatus	Acmispon denticulatus (Drew) D.D. Sokoloff
JM1: Lotus formosissimus	Hosackia gracilis Benth.
JMS: Lotus glaber	Lotus tenuis Willd.
JM1: Lotus grandiflorus	Acmispon grandiflorus (Benth.) Brouillet
JM1: Lotus grandiflorus var. grandiflorus	Acmispon grandiflorus (Benth.) Brouillet var. grandiflorus
JM1: Lotus grandiflorus var. macranthus	Acmispon grandiflorus var. macranthus (Greene) Brouillet
JM1: Lotus hamatus	Acmispon micranthus (Torr. & A. Gray) Brouillet
JM1: Lotus haydonii	Acmispon haydonii (Orcutt) Brouillet
JM1: Lotus heermannii	Acmispon heermannii (Durand & Hilg.) Brouillet
JM1: Lotus heermannii var. heermannii	Acmispon heermannii (Durand & Hilg.) Brouillet var. heermannii
JM1: Lotus heermannii var. orbicularis	Acmispon heermannii var. orbicularis (A. Gray) Brouillet
JM1: Lotus humistratus	Acmispon brachycarpus (Benth.) D.D. Sokoloff
JM1: Lotus incanus	Hosackia incana Torr.
JM1: Lotus junceus	Acmispon junceus (Benth.) Brouillet
JM1: Lotus junceus var. biolettii	Acmispon junceus var. biolettii (Greene) Brouillet
JM1: Lotus junceus var. junceus	Acmispon junceus (Benth.) Brouillet var. junceus
JM1: Lotus micranthus	Acmispon parviflorus (Benth.) D.D. Sokoloff
JM1: Lotus nevadensis	Acmispon nevadensis (S. Watson) Brouillet
JM1: Lotus nevadensis var. davidsonii	Acmispon nevadensis var. davidsonii (Greene) Brouillet
JM1: Lotus nevadensis var. nevadensis	Acmispon nevadensis (S. Watson) Brouillet var. nevadensis
JM1: Lotus nuttallianus	Acmispon prostratus (Torr. & A. Gray) Brouillet
JM1: Lotus oblongifolius	Hosackia oblongifolia Benth.
JM1: Lotus oblongifolius var. cupreus	Hosackia oblongifolia var. cuprea (Greene) Brouillet
JM1: Lotus oblongifolius var. oblongifolius	Hosackia oblongifolia Benth. var. oblongifolia
JM1: Lotus pinnatus	Hosackia pinnata (Hook.) Abrams
JM1: Lotus procumbens	Acmispon procumbens (Greene) Brouillet
JM1: Lotus procumbens var. jepsonii	Acmispon procumbens var. jepsonii (Ottley) Brouillet
JM1: Lotus procumbens var. procumbens	Acmispon procumbens (Greene) Brouillet var. procumbens
JM1: Lotus purshianus	Acmispon americanus (Nutt.) Rydb. var. americanus
JM1: Lotus purshianus var. purshianus	Acmispon americanus (Nutt.) Rydb. var. americanus
JM1: Lotus rigidus	Acmispon rigidus (Benth.) Brouillet
JM1: Lotus rubriflorus	Acmispon rubriflorus (H. Sharsm.) D.D. Sokoloff
JM1: Lotus salsuginosus	Acmispon maritimus (Nutt.) D.D. Sokoloff
JM1: Lotus salsuginosus var. brevivexillus	Acmispon maritimus var. brevivexillus (Ottley) Brouillet
JM1: Lotus salsuginosus var. salsuginosus	Acmispon maritimus (Nutt.) D.D. Sokoloff var. maritimus
JM1: Lotus scoparius	Acmispon glaber (Vogel) Brouillet
JM1: Lotus scoparius var. brevialatus	Acmispon glaber var. brevialatus (Ottley) Brouillet
JM1: Lotus scoparius var. scoparius	Acmispon glaber (Vogel) Brouillet var. glaber
JM1: Lotus stipularis	Hosackia stipularis Benth.
JM1: Lotus stipularis var. ottleyi	Hosackia stipularis var. ottleyi (Isely) Brouillet
JM1: Lotus stipularis var. stipularis	Hosackia stipularis Benth. var. stipularis
JM1: Lotus strigosus	Acmispon strigosus (Nutt.) Brouillet
JMS: Lotus subpinnatus	Acmispon wrangelianus (Fisch. & C.A. Mey.) D.D. Sokoloff
JM2: Lotus tenuis	Lotus tenuis Willd.
JM1: Lotus uliginosus	Lotus uliginosus Schkuhr
JM1: Lotus wrangelianus	Acmispon wrangelianus (Fisch. & C.A. Mey.) D.D. Sokoloff
JM1: Lotus yollabolliensis	Hosackia yollabolliensis (Munz) D.D. Sokoloff
JM2: Ludwigia grandiflora	Ludwigia grandiflora (Michx.) Greuter & Burdet
JMS: Ludwigia grandiflora subsp. hexapetala	Ludwigia hexapetala (Hook. & Arn.) Zardini et al.
JM2: Ludwigia hexapetala	Ludwigia hexapetala (Hook. & Arn.) Zardini et al.
JMS: Ludwigia natans	Ludwigia repens J.R. Forst.
JMS: Ludwigia natans var. stipitata	Ludwigia repens J.R. Forst.
JM1: Ludwigia palustris	Ludwigia palustris (L.) Elliott
JMS: Ludwigia palustris var. americana	Ludwigia palustris (L.) Elliott
JMS: Ludwigia palustris var. pacifica	Ludwigia palustris (L.) Elliott
JM1: Ludwigia peploides	Ludwigia peploides (Kunth) P.H. Raven
JM1: Ludwigia peploides subsp. montevidensis	Ludwigia peploides subsp. montevidensis (Spreng.) P.H. Raven
JM1: Ludwigia peploides subsp. peploides	Ludwigia peploides (Kunth) P.H. Raven subsp. peploides
JM1: Ludwigia repens	Ludwigia repens J.R. Forst.
JMS: Ludwigia repens var. stipitata	Ludwigia repens J.R. Forst.
JM1: Luetkea pectinata	Luetkea pectinata (Pursh) Kuntze
JM1: Luina hypoleuca	Luina hypoleuca Benth.
JM1: Luma apiculata	Luma apiculata (DC.) Burret
JM1: Lunaria annua	Lunaria annua L.
JM1: Lupinus adsurgens	Lupinus adsurgens Drew
JM1: Lupinus affinis	Lupinus affinis J. Agardh
JM1: Lupinus albicaulis	Lupinus albicaulis Douglas
JM1: Lupinus albifrons	Lupinus albifrons Benth.
JM1: Lupinus albifrons var. abramsii	Lupinus albifrons var. abramsii (C.P. Sm.) Hoover
JM1: Lupinus albifrons var. albifrons	Lupinus albifrons Benth. var. albifrons
JM1: Lupinus albifrons var. collinus	Lupinus albifrons var. collinus Greene
JM1: Lupinus albifrons var. douglasii	Lupinus albifrons var. douglasii (J. Agardh) C.P. Sm.
JMS: Lupinus albifrons var. flumineus	Lupinus albifrons var. collinus Greene
JM1: Lupinus andersonii	Lupinus andersonii S. Watson
JM1: Lupinus angustiflorus	Lupinus angustiflorus Eastw.
JM1: Lupinus antoninus	Lupinus antoninus Eastw.
JM1: Lupinus apertus	Lupinus apertus A. Heller
JM1: Lupinus arboreus	Lupinus arboreus Sims
JM1: Lupinus arbustus	Lupinus arbustus Douglas
JM1: Lupinus argenteus	Lupinus argenteus Pursh
JM1: Lupinus argenteus var. argenteus	Lupinus argenteus Pursh var. argenteus
JM1: Lupinus argenteus var. heteranthus	Lupinus argenteus var. heteranthus (S. Watson) Barneby
JM1: Lupinus argenteus var. meionanthus	Lupinus argenteus var. meionanthus (A. Gray) Barneby
JM1: Lupinus argenteus var. montigenus	Lupinus argenteus var. montigenus (A. Heller) Barneby
JM1: Lupinus argenteus var. palmeri	Lupinus argenteus var. palmeri (S. Watson) Barneby
JM1: Lupinus arizonicus	Lupinus arizonicus (S. Watson) S. Watson
JM1: Lupinus benthamii	Lupinus benthamii A. Heller
JM1: Lupinus bicolor	Lupinus bicolor Lindl.
JM1: Lupinus brevicaulis	Lupinus brevicaulis S. Watson
JM1: Lupinus breweri	Lupinus breweri A. Gray
JM1: Lupinus breweri var. breweri	Lupinus breweri A. Gray var. breweri
JM1: Lupinus breweri var. bryoides	Lupinus breweri var. bryoides C.P. Sm.
JM1: Lupinus breweri var. grandiflorus	Lupinus breweri var. grandiflorus C.P. Sm.
JMS: Lupinus caespitosus	Lupinus lepidus var. utahensis (S. Watson) C.L. Hitchc.
JM1: Lupinus cervinus	Lupinus cervinus Kellogg
JM1: Lupinus chamissonis	Lupinus chamissonis Eschsch.
JM1: Lupinus citrinus	Lupinus citrinus Kellogg
JM1: Lupinus citrinus var. citrinus	Lupinus citrinus Kellogg var. citrinus
JM1: Lupinus citrinus var. deflexus	Lupinus citrinus var. deflexus (Congdon) Jeps.
JM1: Lupinus concinnus	Lupinus concinnus J. Agardh
JM1: Lupinus constancei	Lupinus constancei T.W. Nelson & J.P. Nelson
JM1: Lupinus covillei	Lupinus covillei Greene
JM1: Lupinus croceus	Lupinus croceus Eastw.
JM1: Lupinus dalesiae	Lupinus dalesiae Eastw.
JM1: Lupinus duranii	Lupinus duranii Eastw.
JM1: Lupinus elatus	Lupinus elatus I.M. Johnst.
JM1: Lupinus elmeri	Lupinus elmeri Greene
JM1: Lupinus excubitus	Lupinus excubitus M.E. Jones
JM1: Lupinus excubitus var. austromontanus	Lupinus excubitus var. austromontanus (A. Heller) C.P. Sm.
JM1: Lupinus excubitus var. excubitus	Lupinus excubitus M.E. Jones var. excubitus
JM1: Lupinus excubitus var. hallii	Lupinus excubitus var. hallii (Abrams) C.P. Sm.
JM1: Lupinus excubitus var. johnstonii	Lupinus excubitus var. johnstonii C.P. Sm.
JM1: Lupinus excubitus var. medius	Lupinus excubitus var. medius (Jeps.) Munz
JM1: Lupinus flavoculatus	Lupinus flavoculatus A. Heller
JM1: Lupinus formosus	Lupinus formosus Greene
JM1: Lupinus formosus var. formosus	Lupinus formosus Greene var. formosus
JM1: Lupinus formosus var. robustus	Lupinus formosus var. robustus C.P. Sm.
JM1: Lupinus fulcratus	Lupinus fulcratus Greene
JM1: Lupinus gracilentus	Lupinus gracilentus Greene
JM1: Lupinus grayi	Lupinus grayi S. Watson
JM1: Lupinus guadalupensis	Lupinus guadalupensis Greene
JM1: Lupinus hirsutissimus	Lupinus hirsutissimus Benth.
JM1: Lupinus holmgrenanus	Lupinus holmgrenianus C.P. Sm.
JM2: Lupinus holmgrenianus	Lupinus holmgrenianus C.P. Sm.
JM1: Lupinus hyacinthinus	Lupinus hyacinthinus Greene
JM1: Lupinus lapidicola	Lupinus lapidicola A. Heller
JM1: Lupinus latifolius	Lupinus latifolius J. Agardh
JM1: Lupinus latifolius var. barbatus	Lupinus latifolius var. barbatus (L.F. Hend.) Munz
JM1: Lupinus latifolius var. columbianus	Lupinus latifolius var. columbianus (A. Heller) C.P. Sm.
JM1: Lupinus latifolius var. dudleyi	Lupinus latifolius var. dudleyi C.P. Sm.
JM1: Lupinus latifolius var. latifolius	Lupinus latifolius J. Agardh var. latifolius
JM1: Lupinus latifolius var. parishii	Lupinus latifolius var. parishii C.P. Sm.
JM1: Lupinus latifolius var. viridifolius	Lupinus latifolius var. viridifolius (A. Heller) C.P. Sm.
JM1: Lupinus lepidus	Lupinus lepidus Lindl.
JM1: Lupinus lepidus var. confertus	Lupinus lepidus var. confertus (Kellogg) C.P. Sm.
JM1: Lupinus lepidus var. culbertsonii	Lupinus lepidus var. culbertsonii (Greene) C.P. Sm.
JM1: Lupinus lepidus var. lobbii	Lupinus lepidus var. lobbii (S. Watson) C.L. Hitchc.
JM1: Lupinus lepidus var. ramosus	Lupinus lepidus var. ramosus Jeps.
JM1: Lupinus lepidus var. sellulus	Lupinus lepidus var. sellulus (Kellogg) Barneby
JM1: Lupinus lepidus var. utahensis	Lupinus lepidus var. utahensis (S. Watson) C.L. Hitchc.
JM1: Lupinus leucophyllus	Lupinus leucophyllus Lindl.
JM1: Lupinus littoralis	Lupinus littoralis Douglas
JM1: Lupinus longifolius	Lupinus longifolius (S. Watson) Abrams
JM1: Lupinus ludovicianus	Lupinus ludovicianus Greene
JM1: Lupinus luteolus	Lupinus luteolus Kellogg
JM1: Lupinus magnificus	Lupinus magnificus M.E. Jones
JM2: Lupinus magnificus var. glarecola	Lupinus magnificus var. glarecola M.E. Jones
JM2: Lupinus magnificus var. magnificus	Lupinus magnificus M.E. Jones var. magnificus
JM1: Lupinus microcarpus	Lupinus microcarpus Sims
JM1: Lupinus microcarpus var. densiflorus	Lupinus microcarpus var. densiflorus (Benth.) Jeps.
JM1: Lupinus microcarpus var. horizontalis	Lupinus microcarpus var. horizontalis (A. Heller) Jeps.
JM1: Lupinus microcarpus var. microcarpus	Lupinus microcarpus Sims var. microcarpus
JM2: Lupinus milo-bakeri	Lupinus milo-bakeri C.P. Sm.
JM1: Lupinus nanus	Lupinus nanus Benth.
JM1: Lupinus nevadensis	Lupinus nevadensis A. Heller
JM1: Lupinus nipomensis	Lupinus nipomensis Eastw.
JM1: Lupinus obtusilobus	Lupinus obtusilobus A. Heller
JM1: Lupinus odoratus	Lupinus odoratus A. Heller
JM1: Lupinus onustus	Lupinus onustus S. Watson
JM1: Lupinus pachylobus	Lupinus pachylobus Greene
JM1: Lupinus padre-crowleyi	Lupinus padre-crowleyi C.P. Sm.
JM1: Lupinus peirsonii	Lupinus peirsonii H. Mason
JM1: Lupinus polyphyllus	Lupinus polyphyllus Lindl.
JM1: Lupinus polyphyllus var. burkei	Lupinus polyphyllus var. burkei (S. Watson) C.L. Hitchc.
JM1: Lupinus polyphyllus var. pallidipes	Lupinus polyphyllus var. pallidipes (A. Heller) C.P. Sm.
JM1: Lupinus polyphyllus var. polyphyllus	Lupinus polyphyllus Lindl. var. polyphyllus
JM1: Lupinus pratensis	Lupinus pratensis A. Heller
JM1: Lupinus pratensis var. eriostachyus	Lupinus pratensis var. eriostachyus C.P. Sm.
JM1: Lupinus pratensis var. pratensis	Lupinus pratensis A. Heller var. pratensis
JM2: Lupinus pusillus	Lupinus pusillus Pursh
JM1: Lupinus pusillus var. intermontanus	Lupinus pusillus Pursh var. intermontanus (A. Heller) C.P. Sm.
JM1: Lupinus rivularis	Lupinus latifolius J. Agardh; Lupinus rivularis Lindl.
JM1: Lupinus saxosus	Lupinus saxosus Howell
JM1: Lupinus sericatus	Lupinus sericatus Kellogg
JM1: Lupinus shockleyi	Lupinus shockleyi S. Watson
JM1: Lupinus sparsiflorus	Lupinus sparsiflorus Benth.
JM1: Lupinus spectabilis	Lupinus spectabilis Hoover
JM1: Lupinus stiversii	Lupinus stiversii Kellogg
JM1: Lupinus succulentus	Lupinus succulentus K. Koch
JM1: Lupinus tidestromii	Lupinus tidestromii Greene
JM1: Lupinus tracyi	Lupinus tracyi Eastw.
JM1: Lupinus truncatus	Lupinus truncatus Nutt.
JM2: Lupinus uncialis	Lupinus uncialis S. Watson
JM1: Lupinus variicolor	Lupinus variicolor Steud.
JMS: Luzula campestris	Luzula comosa E. Mey.
JMS: Luzula campestris var. comosa	Luzula comosa E. Mey.
JM1: Luzula comosa	Luzula comosa E. Mey.; Luzula subsessilis (S. Watson) Buchenau
JMS: Luzula comosa var. congesta	Luzula comosa E. Mey.
JM2: Luzula comosa var. laxa	Luzula comosa var. laxa Buchenau
JMS: Luzula comosa var. macrantha	Luzula subsessilis (S. Watson) Buchenau
JMS: Luzula comosa var. subsessilis	Luzula subsessilis (S. Watson) Buchenau
JM1: Luzula divaricata	Luzula divaricata S. Watson; Luzula parviflora (Ehrh.) Desv. subsp. fastigiata (E. Mey.) H&auml;met-Ahti
JM1: Luzula orestera	Luzula orestera Sharsm.
JM1: Luzula parviflora	Luzula parviflora (Ehrh.) Desv.
JM2: Luzula parviflora subsp. fastigiata	Luzula parviflora (Ehrh.) Desv. subsp. fastigiata (E. Mey.) H&auml;met-Ahti
JM2: Luzula parviflora subsp. parviflora	Luzula parviflora (Ehrh.) Desv. subsp. parviflora
JM1: Luzula piperi	Luzula piperi (Coville) M.E. Jones
JMS: Luzula spadicea	Luzula subcongesta (S. Watson) Jeps.
JMS: Luzula spadicea var. subcongesta	Luzula subcongesta (S. Watson) Jeps.
JM1: Luzula spicata	Luzula spicata (L.) DC.
JMS: Luzula spicata subsp. saximontana	Luzula spicata (L.) DC.
JMS: Luzula spicata var. nova	Luzula spicata (L.) DC.
JM1: Luzula subcongesta	Luzula subcongesta (S. Watson) Jeps.
JM2: Luzula subsessilis	Luzula subsessilis (S. Watson) Buchenau
JMS: Luzula wahlenbergii	Luzula piperi (Coville) M.E. Jones
JMS: Luzula wahlenbergii subsp. piperi	Luzula piperi (Coville) M.E. Jones
JM1: Lychnis coronaria	Lychnis coronaria (L.) Desr.
JM1: Lycium andersonii	Lycium andersonii A. Gray
JM1: Lycium barbarum	Lycium barbarum L.
JM1: Lycium brevipes	Lycium brevipes Benth.
JM1: Lycium brevipes var. brevipes	Lycium brevipes Benth. var. brevipes
JM1: Lycium brevipes var. hassei	Lycium brevipes var. hassei (Greene) C.L. Hitchc.
JM1: Lycium californicum	Lycium californicum Nutt.
JM1: Lycium cooperi	Lycium cooperi A. Gray
JM1: Lycium fremontii	Lycium fremontii A. Gray
JMS: Lycium hassei	Lycium brevipes var. hassei (Greene) C.L. Hitchc.
JM2: Lycium pallidum	Lycium pallidum Miers
JM1: Lycium pallidum var. oligospermum	Lycium pallidum Miers var. oligospermum C.L. Hitchc.
JM1: Lycium parishii	Lycium parishii A. Gray
JM1: Lycium torreyi	Lycium torreyi A. Gray
JM1: Lycium verrucosum	Lycium verrucosum Eastw.
JM1: Lycopersicon esculentum	Lycopersicon esculentum Mill.
JM1: Lycopersicon peruvianum	Lycopersicon peruvianum (L.) Mill.
JM1: Lycopodiella inundata	Lycopodiella inundata (L.) Holub
JM1: Lycopodium clavatum	Lycopodium clavatum L.
JM1: Lycopus americanus	Lycopus americanus W.P.C. Barton
JM1: Lycopus asper	Lycopus asper Greene
JMS: Lycopus lucidus	Lycopus asper Greene
JM1: Lycopus uniflorus	Lycopus uniflorus Michx.
JMS: Lycurus phleoides	Muhlenbergia alopecuroides (Griseb.) P.M. Peterson & Columbus
JM1: Lycurus phleoides var. phleoides	misappl. to Muhlenbergia alopecuroides
JMS: Lycurus setosus	Muhlenbergia alopecuroides (Griseb.) P.M. Peterson & Columbus
JM1: Lyonothamnus floribundus	Lyonothamnus floribundus A. Gray
JM1: Lyonothamnus floribundus subsp. aspleniifolius	Lyonothamnus floribundus subsp. aspleniifolius (Greene) P.H. Raven
JM1: Lyonothamnus floribundus subsp. floribundus	Lyonothamnus floribundus A. Gray subsp. floribundus
JM2: Lyrocarpa coulteri	Lyrocarpa coulteri Hook. & Harv.
JM1: Lyrocarpa coulteri var. palmeri	Lyrocarpa coulteri Hook. & Harv.
JM1: Lysichiton americanum	Lysichiton americanus Hult&eacute;n & H. St. John
JM2: Lysichiton americanus	Lysichiton americanus Hult&eacute;n & H. St. John
JM1: Lysimachia nummularia	Lysimachia nummularia L.
JM1: Lysimachia thyrsiflora	Lysimachia thyrsiflora L.
JM1: Lythrum californicum	Lythrum californicum Torr. & A. Gray
JM1: Lythrum hyssopifolia	Lythrum hyssopifolia L.
JM1: Lythrum portula	Lythrum portula (L.) D.A. Webb
JM1: Lythrum salicaria	Lythrum salicaria L.
JM1: Lythrum tribracteatum	Lythrum tribracteatum Spreng.
JM1: Machaeranthera arida	Arida arizonica (R.C. Jacks. & R.R. Johnson) D.R. Morgan & R.L. Hartm.
JM1: Machaeranthera asteroides	Dieteria asteroides Torr.
JM1: Machaeranthera asteroides var. asteroides	Dieteria asteroides Torr. var. asteroides
JM1: Machaeranthera asteroides var. lagunensis	Dieteria asteroides var. lagunensis (D.D. Keck) D.R. Morgan & R.L. Hartm.
JM1: Machaeranthera canescens	Dieteria canescens (Pursh) Nutt.
JMS: Machaeranthera canescens subsp. canescens	Dieteria canescens (Pursh) Nutt. var. canescens
JM1: Machaeranthera canescens var. canescens	Dieteria canescens (Pursh) Nutt. var. canescens
JM1: Machaeranthera canescens var. incana	Dieteria canescens var. incana (Lindl.) D.R. Morgan & R.L. Hartm.
JM1: Machaeranthera canescens var. leucanthemifolia	Dieteria canescens var. leucanthemifolia (Greene) D.R. Morgan & R.L. Hartm.
JM1: Machaeranthera canescens var. shastensis	Dieteria canescens var. shastensis (A. Gray) D.R. Morgan & R.L. Hartm.
JM1: Machaeranthera canescens var. ziegleri	Dieteria canescens var. ziegleri (Munz) D.R. Morgan & R.L. Hartm.
JM1: Machaeranthera carnosa	Arida carnosa (A. Gray) D.R. Morgan & R.L. Hartm.
JMS: Machaeranthera carnosa var. intricata	Arida carnosa (A. Gray) D.R. Morgan & R.L. Hartm.
JM1: Machaeranthera gracilis	Xanthisma gracile (Nutt.) D.R. Morgan & R.L. Hartm.
JM1: Machaeranthera juncea	Xanthisma junceum (Greene) D.R. Morgan & R.L. Hartm.
JMS: Machaeranthera pinnatifida	Xanthisma spinulosum (Pursh) D.R. Morgan & R.L. Hartm.
JMS: Machaeranthera pinnatifida subsp. gooddingii	Xanthisma spinulosum (Pursh) D.R. Morgan & R.L. Hartm. var. gooddingii (A. Nelson) D.R. Morgan & R.L. Hartm.
JM1: Machaeranthera pinnatifida var. gooddingii	Xanthisma spinulosum (Pursh) D.R. Morgan & R.L. Hartm. var. gooddingii (A. Nelson) D.R. Morgan & R.L. Hartm.
JM1: Machaeranthera tanacetifolia	Machaeranthera tanacetifolia (Kunth) Nees
JM1: Maclura pomifera	Maclura pomifera (Raf.) C.K. Schneid.
JM1: Madia anomala	Madia anomala Greene
JM1: Madia bolanderi	Kyhosia bolanderi (A. Gray) B.G. Baldwin
JM1: Madia citrigracilis	Madia citrigracilis D.D. Keck
JM1: Madia citriodora	Madia citriodora Greene
JM1: Madia doris-nilesiae	Harmonia doris-nilesiae (T.W. Nelson & J.P. Nelson) B.G. Baldwin
JM1: Madia elegans	Madia elegans D. Don
JM1: Madia elegans subsp. densifolia	Madia elegans D. Don
JM1: Madia elegans subsp. elegans	Madia elegans D. Don
JM1: Madia elegans subsp. vernalis	Madia elegans D. Don
JM1: Madia elegans subsp. wheeleri	Madia elegans D. Don
JM1: Madia exigua	Madia exigua (Sm.) A. Gray
JM1: Madia glomerata	Madia glomerata Hook.
JM1: Madia gracilis	Madia gracilis (Sm.) Applegate
JM1: Madia hallii	Harmonia hallii (D.D. Keck) B.G. Baldwin
JM1: Madia madioides	Anisocarpus madioides Nutt.
JM1: Madia minima	Hemizonella minima (A. Gray) A. Gray
JM1: Madia nutans	Harmonia nutans (Greene) B.G. Baldwin
JM1: Madia radiata	Madia radiata Kellogg
JM1: Madia rammii	Jensia rammii (Greene) B.G. Baldwin
JM1: Madia sativa	Madia sativa Molina
JM1: Madia stebbinsii	Harmonia stebbinsii (T.W. Nelson & J.P. Nelson) B.G. Baldwin
JM1: Madia subspicata	Madia subspicata D.D. Keck
JM1: Madia yosemitana	Jensia yosemitana (A. Gray) B.G. Baldwin
JM1: Maianthemum dilatatum	Maianthemum dilatatum (Alph. Wood) A. Nelson & J.F. Macbr.
JM2: Maianthemum racemosum	Maianthemum racemosum (L.) Link
JMS: Maianthemum racemosum subsp. amplexicaule	Maianthemum racemosum (L.) Link
JM2: Maianthemum stellatum	Maianthemum stellatum (L.) Link
JM1: Malacothamnus abbottii	Malacothamnus abbottii (Eastw.) Kearney
JM1: Malacothamnus aboriginum	Malacothamnus aboriginum (B.L. Rob.) Greene
JM1: Malacothamnus clementinus	Malacothamnus clementinus (Munz & I.M. Johnst.) Kearney
JM1: Malacothamnus davidsonii	Malacothamnus davidsonii (B.L. Rob.) Greene
JM1: Malacothamnus densiflorus	Malacothamnus densiflorus (S. Watson) Greene
JMS: Malacothamnus densiflorus var. viscidus	Malacothamnus densiflorus (S. Watson) Greene
JM1: Malacothamnus fasciculatus	Malacothamnus fasciculatus (Torr. & A. Gray) Greene
JM2: Malacothamnus fasciculatus var. catalinensis	Malacothamnus fasciculatus var. catalinensis (Eastw.) Kearney
JM2: Malacothamnus fasciculatus var. fasciculatus	Malacothamnus fasciculatus (Torr. & A. Gray) Greene var. fasciculatus
JM2: Malacothamnus fasciculatus var. nesioticus	Malacothamnus fasciculatus var. nesioticus (B.L. Rob.) Kearney
JM2: Malacothamnus fasciculatus var. nuttallii	Malacothamnus fasciculatus var. nuttallii (Abrams) Kearney
JM1: Malacothamnus fremontii	Malacothamnus fremontii (A. Gray) Greene
JM2: Malacothamnus hallii	Malacothamnus hallii (Eastw.) Kearney
JM1: Malacothamnus jonesii	Malacothamnus jonesii (Munz) Kearney
JM1: Malacothamnus marrubioides	Malacothamnus marrubioides (Durand & Hilg.) Greene
JM2: Malacothamnus orbiculatus	Malacothamnus orbiculatus (Greene) Greene
JM1: Malacothamnus palmeri	Malacothamnus palmeri (S. Watson) Greene
JM2: Malacothamnus palmeri var. involucratus	Malacothamnus palmeri var. involucratus (B.L. Rob.) Kearney
JM2: Malacothamnus palmeri var. palmeri	Malacothamnus palmeri (S. Watson) Greene var. palmeri
JM1: Malacothrix californica	Malacothrix californica DC.
JM1: Malacothrix clevelandii	Malacothrix clevelandii A. Gray
JM1: Malacothrix coulteri	Malacothrix coulteri Harv. & A. Gray
JMS: Malacothrix coulteri var. cognata	Malacothrix coulteri Harv. & A. Gray
JM1: Malacothrix floccifera	Malacothrix floccifera (DC.) S.F. Blake
JM1: Malacothrix foliosa	Malacothrix foliosa A. Gray
JM2: Malacothrix foliosa subsp. crispifolia	Malacothrix foliosa subsp. crispifolia W.S. Davis
JM2: Malacothrix foliosa subsp. foliosa	Malacothrix foliosa A. Gray subsp. foliosa
JM2: Malacothrix foliosa subsp. philbrickii	Malacothrix foliosa subsp. philbrickii W.S. Davis
JM2: Malacothrix foliosa subsp. polycephala	Malacothrix foliosa subsp. polycephala W.S. Davis
JM1: Malacothrix glabrata	Malacothrix glabrata (D.C. Eaton) A. Gray
JM1: Malacothrix incana	Malacothrix incana (Nutt.) Torr. & A. Gray
JM1: Malacothrix indecora	Malacothrix indecora Greene
JM2: Malacothrix junakii	Malacothrix junakii W.S. Davis
JM1: Malacothrix phaeocarpa	Malacothrix phaeocarpa W.S. Davis
JM1: Malacothrix saxatilis	Malacothrix saxatilis (Nutt.) Torr. & A. Gray
JM1: Malacothrix saxatilis var. arachnoidea	Malacothrix saxatilis var. arachnoidea (E.A. McGregor) E.W. Williams
JM1: Malacothrix saxatilis var. commutata	Malacothrix saxatilis var. commutata (Torr. & A. Gray) Ferris
JM1: Malacothrix saxatilis var. implicata	Malacothrix saxatilis var. implicata (Eastw.) H.M. Hall
JM1: Malacothrix saxatilis var. saxatilis	Malacothrix saxatilis (Nutt.) Torr. & A. Gray var. saxatilis
JM1: Malacothrix saxatilis var. tenuifolia	Malacothrix saxatilis var. tenuifolia (Nutt.) A. Gray
JMS: Malacothrix saxitalis var. altissima	Malacothrix saxatilis var. tenuifolia (Nutt.) A. Gray
JM2: Malacothrix similis	Malacothrix similis W.S. Davis & P.H. Raven
JM1: Malacothrix sonchoides	Malacothrix sonchoides (Nutt.) Torr. & A. Gray
JM1: Malacothrix squalida	Malacothrix squalida Greene
JM1: Malacothrix stebbinsii	Malacothrix stebbinsii W.S. Davis & P.H. Raven
JM1: Malacothrix torreyi	Malacothrix torreyi A. Gray
JM2: Malaxis monophyllos	Malaxis monophyllos (L.) Sw.
JM1: Malaxis monophyllos subsp. brachypoda	Malaxis monophyllos (L.) Sw. var. brachypoda (A. Gray) F. Morris & E.A. Eames
JM2: Malaxis monophyllos var. brachypoda	Malaxis monophyllos (L.) Sw. var. brachypoda (A. Gray) F. Morris & E.A. Eames
JM1: Malcolmia africana	Strigosella africana (L.) Botsch.
JM1: Malephora crocea	Malephora crocea (Jacq.) Schwantes
JMS: Malephora purpureo-crocea	Malephora crocea (Jacq.) Schwantes
JM1: Malosma laurina	Malosma laurina (Nutt.) Abrams
JM1: Malperia tenuis	Malperia tenuis S. Watson
JMS: Malus domestica	Malus pumila Mill.
JM1: Malus fusca	Malus fusca (Raf.) C.K. Schneid.
JM2: Malus pumila	Malus pumila Mill.
JMS: Malus pumila var. domestica	Malus pumila Mill.
JM1: Malus sylvestris	Malus pumila Mill.
JM2: Malva arborea	Malva arborea (L.) Webb & Berthel.
JM2: Malva assurgentiflora	Malva assurgentiflora (Kellogg) M.F. Ray
JMS: Malva crispa	Malva verticillata L. var. crispa L.
JMS: Malva dendromorpha	Malva arborea (L.) Webb & Berthel.
JMS: Malva linnaei	Malva pseudolavatera Webb & Berthel.
JM1: Malva neglecta	Malva neglecta Wallr.
JM1: Malva nicaeensis	Malva nicaeensis All.
JM1: Malva parviflora	Malva parviflora L.
JM2: Malva pseudolavatera	Malva pseudolavatera Webb & Berthel.
JM1: Malva sylvestris	Malva sylvestris L.
JM2: Malva verticillata	Malva verticillata L.
JM2: Malva verticillata var. crispa	Malva verticillata L. var. crispa L.
JM1: Malvella leprosa	Malvella leprosa (Ortega) Krapov.
JMS: Mammillaria alversonii	Coryphantha alversonii (J.M. Coult.) Orcutt
JMS: Mammillaria deserti	Coryphantha chlorantha (Engelm.) Britton & Rose
JM1: Mammillaria dioica	Mammillaria dioica K. Brandegee
JMS: Mammillaria dioica var. incerta	Mammillaria dioica K. Brandegee
JM2: Mammillaria grahamii	Mammillaria grahamii Engelm.
JM2: Mammillaria grahamii var. grahamii	Mammillaria grahamii Engelm. var. grahamii
JMS: Mammillaria microcarpa	Mammillaria grahamii Engelm. var. grahamii
JM1: Mammillaria milleri	Mammillaria grahamii Engelm. var. grahamii
JM1: Mammillaria tetrancistra	Mammillaria tetrancistra Engelm.
JM2: Marah fabacea	Marah fabacea (Naudin) Greene
JMS: Marah fabacea var. agrestis	Marah fabacea (Naudin) Greene
JM1: Marah fabaceus	Marah fabacea (Naudin) Greene
JMS: Marah guadalupensis	Marah macrocarpa (Greene) Greene
JM2: Marah horrida	Marah horrida (Congdon) Dunn
JM1: Marah horridus	Marah horrida (Congdon) Dunn
JM2: Marah macrocarpa	Marah macrocarpa (Greene) Greene
JMS: Marah macrocarpa var. micrantha	Marah macrocarpa (Greene) Greene
JM1: Marah macrocarpus	Marah macrocarpa (Greene) Greene
JM1: Marah macrocarpus var. macrocarpus	Marah macrocarpa (Greene) Greene
JM1: Marah macrocarpus var. major	Marah macrocarpa (Greene) Greene
JM2: Marah oregana	Marah oregana (S. Watson) Howell
JM1: Marah oreganus	Marah oregana (S. Watson) Howell
JM1: Marah watsonii	Marah watsonii (Cogn.) Greene
JM2: Marina orcuttii	Marina orcuttii (S. Watson) Barneby
JM1: Marina orcuttii var. orcuttii	Marina orcuttii (S. Watson) Barneby var. orcuttii
JM1: Marina parryi	Marina parryi (Torr. & A. Gray) Barneby
JM1: Marrubium vulgare	Marrubium vulgare L.
JM1: Marsilea oligospora	Marsilea oligospora Goodd.
JM2: Marsilea vestita	Marsilea vestita Hook. & Grev.; Marsilea oligospora Goodd.
JM1: Marsilea vestita subsp. vestita	Marsilea vestita Hook. & Grev. subsp. vestita
JMS: Marsilea vestita var. oligospora	Marsilea oligospora Goodd.
JMS: Maruta cotula	Anthemis cotula L.
JM1: Matelea parvifolia	Matelea parvifolia (Torr.) Woodson
JM2: Matricaria chamomilla	Matricaria chamomilla L.
JM2: Matricaria discoidea	Matricaria discoidea DC.
JM1: Matricaria globifera	Oncosiphon piluliferum (L. f.) K&auml;llersj&ouml;
JMS: Matricaria inodora	Tripleurospermum inodorum (L.) Sch. Bip.
JMS: Matricaria matricarioides	Matricaria discoidea DC.
JM2: Matricaria occidentalis	Matricaria occidentalis Greene
JM1: Matthiola incana	Matthiola incana (L.) W.T. Aiton
JM2: Maurandella antirrhiniflora	Maurandella antirrhiniflora (Willd.) Rothm.
JMS: Maurandya antirrhiniflora	Maurandella antirrhiniflora (Willd.) Rothm.
JM1: Maurandya antirrhiniflora subsp. antirrhiniflora	Maurandella antirrhiniflora (Willd.) Rothm.
JM1: Maurandya petrophila	Holmgrenanthe petrophila (Coville & C.V. Morton) Elisens
JM2: Mauranthemum paludosum	Mauranthemum paludosum (Poir.) Vogt & Oberpr.
JM2: Maytenus boaria	Maytenus boaria Molina
JM1: Meconella californica	Meconella californica Torr. & Fr&eacute;m.
JM1: Meconella denticulata	Meconella denticulata Greene
JM1: Meconella linearis	Hesperomecon linearis (Benth.) Greene
JM2: Meconella oregana	Meconella oregana Nutt.
JM1: Medicago arabica	Medicago arabica (L.) Huds.
JM1: Medicago lupulina	Medicago lupulina L.
JM1: Medicago minima	Medicago minima (L.) Bartal.
JMS: Medicago muricata	Medicago truncatula Gaertn.
JM1: Medicago orbicularis	Medicago orbicularis (L.) Bartal.
JM1: Medicago polymorpha	Medicago polymorpha L.
JM1: Medicago praecox	Medicago praecox DC.
JM2: Medicago rigidula	Medicago rigidula (L.) All.
JM1: Medicago sativa	Medicago sativa L.
JM2: Medicago scutellata	Medicago scutellata (L.) Mill.
JM2: Medicago truncatula	Medicago truncatula Gaertn.
JM2: Melaleuca citrina	Melaleuca citrina (Curtis) Dum. Cours.
JM2: Melaleuca viminalis	Melaleuca viminalis (Gaertn.) Byrnes
JM1: Melia azedarach	Melia azedarach L.
JM1: Melica aristata	Melica aristata Bol.
JM1: Melica bulbosa	Melica bulbosa Porter & J.M. Coult.
JM1: Melica californica	Melica californica Scribn.
JM1: Melica frutescens	Melica frutescens Scribn.
JM1: Melica fugax	Melica fugax Bol.
JM1: Melica geyeri	Melica geyeri Munro
JMS: Melica geyeri var. aristulata	Melica geyeri Munro
JM1: Melica harfordii	Melica harfordii Bol.
JM1: Melica imperfecta	Melica imperfecta Trin.
JM1: Melica spectabilis	Melica spectabilis Scribn.
JM1: Melica stricta	Melica stricta Bol.
JMS: Melica stricta var. albicaulis	Melica stricta Bol.
JM1: Melica subulata	Melica subulata (Griseb.) Scribn.
JM1: Melica torreyana	Melica torreyana Scribn.
JM1: Melilotus alba	Melilotus albus Medik.
JM2: Melilotus albus	Melilotus albus Medik.
JM1: Melilotus indica	Melilotus indicus (L.) All.
JM2: Melilotus indicus	Melilotus indicus (L.) All.
JM1: Melilotus officinalis	Melilotus officinalis Lam.
JM2: Melinis repens	Melinis repens (Willd.) Zizka
JM2: Melinis repens subsp. repens	Melinis repens (Willd.) Zizka subsp. repens
JM1: Melissa officinalis	Melissa officinalis L.
JM1: Menodora scabra	Menodora scabra A. Gray
JM2: Menodora scabra var. glabrescens	Menodora scabra var. glabrescens A. Gray
JM2: Menodora scabra var. scabra	Menodora scabra A. Gray var. scabra
JM1: Menodora scoparia	Menodora scabra var. glabrescens A. Gray
JM1: Menodora spinescens	Menodora spinescens A. Gray
JM2: Menodora spinescens var. mohavensis	Menodora spinescens var. mohavensis Steyerm.
JM2: Menodora spinescens var. spinescens	Menodora spinescens A. Gray var. spinescens
JM2: Mentha &times;gracilis	Mentha &times;gracilis Sole
JM2: Mentha &times;piperita	Mentha &times;piperita L.
JM2: Mentha &times;rotundifolia	Mentha &times;rotundifolia (L.) Huds.
JM2: Mentha &times;smithiana	Mentha &times;smithiana R.A. Graham
JM2: Mentha &times;villosa	Mentha &times;villosa Huds.
JM2: Mentha aquatica	Mentha aquatica L.
JM1: Mentha arvensis	Mentha arvensis L.
JMS: Mentha arvensis var. canadensis	Mentha canadensis L.
JMS: Mentha arvensis var. villosa	Mentha canadensis L.
JM2: Mentha canadensis	Mentha canadensis L.
JMS: Mentha citrata	Mentha &times;piperita L.; Mentha aquatica L.
JMS: Mentha gentilis	Mentha &times;gracilis Sole
JM2: Mentha longifolia	Mentha longifolia (L.) L.
JM1: Mentha pulegium	Mentha pulegium L.
JMS: Mentha rotundifolia	Mentha suaveolens Ehrh.
JM2: Mentha spicata	Mentha spicata L.
JM1: Mentha spicata var. spicata	Mentha spicata L.
JM1: Mentha suaveolens	Mentha suaveolens Ehrh.
JM1: Mentzelia affinis	Mentzelia affinis Greene
JM1: Mentzelia albicaulis	Mentzelia albicaulis (Hook.) Torr. & A. Gray
JM1: Mentzelia congesta	Mentzelia congesta Torr. & A. Gray
JMS: Mentzelia congesta var. davidsoniana	Mentzelia congesta Torr. & A. Gray
JM1: Mentzelia crocea	Mentzelia crocea Kellogg
JM1: Mentzelia desertorum	Mentzelia desertorum (Davidson) H.J. Thomps. & J.E. Roberts
JM1: Mentzelia dispersa	Mentzelia dispersa S. Watson
JM1: Mentzelia eremophila	Mentzelia eremophila (Jeps.) H.J. Thomps. & J.E. Roberts
JM1: Mentzelia gracilenta	Mentzelia gracilenta Torr. & A. Gray
JM1: Mentzelia hirsutissima	Mentzelia hirsutissima S. Watson
JMS: Mentzelia hirsutissima var. stenophylla	Mentzelia hirsutissima S. Watson
JM1: Mentzelia involucrata	Mentzelia involucrata S. Watson
JMS: Mentzelia involucrata var. megalantha	Mentzelia involucrata S. Watson
JM1: Mentzelia inyoensis	Mentzelia inyoensis H.J. Thomps. & Prigge
JM1: Mentzelia jonesii	Mentzelia jonesii (Urb. & Gilg) H.J. Thomps. & J.E. Roberts
JM1: Mentzelia laevicaulis	Mentzelia laevicaulis (Hook.) Torr. & A. Gray
JMS: Mentzelia leucophylla	Mentzelia oreophila J. Darl.
JM1: Mentzelia lindleyi	Mentzelia lindleyi Torr. & A. Gray
JMS: Mentzelia lindleyi subsp. crocea	Mentzelia crocea Kellogg
JM2: Mentzelia longiloba	Mentzelia longiloba J. Darl.
JM1: Mentzelia micrantha	Mentzelia micrantha (Hook. & Arn.) Torr. & A. Gray
JM1: Mentzelia montana	Mentzelia montana Davidson
JMS: Mentzelia multiflora	Mentzelia longiloba J. Darl.
JM1: Mentzelia multiflora subsp. longiloba	Mentzelia longiloba J. Darl.
JM1: Mentzelia nitens	Mentzelia nitens Greene
JM1: Mentzelia obscura	Mentzelia obscura H.J. Thomps. & J.E. Roberts
JM1: Mentzelia oreophila	Mentzelia oreophila J. Darl.
JM1: Mentzelia pectinata	Mentzelia pectinata Kellogg
JMS: Mentzelia peirsonii	Mentzelia tricuspis A. Gray
JMS: Mentzelia pinetorum	Mentzelia dispersa S. Watson
JM1: Mentzelia polita	Mentzelia polita A. Nelson
JM1: Mentzelia pterosperma	Mentzelia pterosperma Eastw.
JM2: Mentzelia puberula	Mentzelia puberula J. Darl.
JM2: Mentzelia ravenii	Mentzelia ravenii H.J. Thomps. & J.E. Roberts
JM1: Mentzelia reflexa	Mentzelia reflexa Coville
JM1: Mentzelia torreyi	Mentzelia torreyi A. Gray
JM1: Mentzelia tricuspis	Mentzelia tricuspis A. Gray
JMS: Mentzelia tricuspis var. brevicornuta	Mentzelia tridentata (Davidson) H.J. Thomps. & J.E. Roberts
JM1: Mentzelia tridentata	Mentzelia tridentata (Davidson) H.J. Thomps. & J.E. Roberts
JM1: Mentzelia veatchiana	Mentzelia veatchiana Kellogg
JM1: Menyanthes trifoliata	Menyanthes trifoliata L.
JM1: Menziesia ferruginea	Menziesia ferruginea Sm.
JM1: Mercurialis annua	Mercurialis annua L.
JM1: Mertensia bella	Mertensia bella Piper
JM1: Mertensia ciliata	Mertensia ciliata (Torr.) G. Don var. stomatechoides (Kellogg) Jeps.
JM2: Mertensia ciliata var. stomatechoides	Mertensia ciliata (Torr.) G. Don var. stomatechoides (Kellogg) Jeps.
JM1: Mertensia cusickii	Mertensia cusickii Piper
JM1: Mertensia longiflora	Mertensia longiflora Greene
JM1: Mertensia oblongifolia	Mertensia oblongifolia (Nutt.) G. Don
JM1: Mertensia oblongifolia var. amoena	Mertensia oblongifolia var. amoena (A. Nelson) L.O. Williams
JM1: Mertensia oblongifolia var. nevadensis	Mertensia oblongifolia var. nevadensis (A. Nelson) L.O. Williams
JM1: Mertensia oblongifolia var. oblongifolia	Mertensia oblongifolia (Nutt.) G. Don var. oblongifolia
JM1: Mesembryanthemum crystallinum	Mesembryanthemum crystallinum L.
JM1: Mesembryanthemum nodiflorum	Mesembryanthemum nodiflorum L.
JM2: Micranthes aprica	Micranthes aprica (Greene) Small
JM2: Micranthes bryophora	Micranthes bryophora (A. Gray) Brouillet & Gornall
JM2: Micranthes californica	Micranthes californica (Greene) Small
JM2: Micranthes ferruginea	Micranthes ferruginea (Graham) Brouillet & Gornall
JM2: Micranthes fragosa	Micranthes fragosa (Small) Small
JM2: Micranthes howellii	Micranthes howellii (Greene) Small
JM2: Micranthes integrifolia	Micranthes integrifolia (Hook.) Small
JM2: Micranthes marshallii	Micranthes marshallii (Greene) Small
JM2: Micranthes nidifica	Micranthes nidifica (Greene) Small
JM2: Micranthes odontoloma	Micranthes odontoloma (Piper) A. Heller
JM2: Micranthes oregana	Micranthes oregana (Howell) Small
JM2: Micranthes tolmiei	Micranthes tolmiei (Torr. & A. Gray) Brouillet & Gornall
JM2: Micromonolepis pusilla	Micromonolepis pusilla (S. Watson) Ulbr.
JM1: Micropus amphibolus	Micropus amphibolus A. Gray
JM1: Micropus californicus	Micropus californicus Fisch. & C.A. Mey.
JM1: Micropus californicus var. californicus	Micropus californicus Fisch. & C.A. Mey. var. californicus
JM1: Micropus californicus var. subvestitus	Micropus californicus var. subvestitus A. Gray
JM1: Microseris acuminata	Microseris acuminata Greene
JM1: Microseris bigelovii	Microseris bigelovii (A. Gray) Sch. Bip.
JM1: Microseris borealis	Microseris borealis (Bong.) Sch. Bip.
JM1: Microseris campestris	Microseris campestris Greene
JM1: Microseris douglasii	Microseris douglasii (DC.) Sch. Bip.
JM1: Microseris douglasii subsp. douglasii	Microseris douglasii (DC.) Sch. Bip. subsp. douglasii
JM1: Microseris douglasii subsp. platycarpha	Microseris douglasii subsp. platycarpha (A. Gray) K.L. Chambers
JM1: Microseris douglasii subsp. tenella	Microseris douglasii subsp. tenella (A. Gray) K.L. Chambers
JM1: Microseris elegans	Microseris elegans A. Gray
JMS: Microseris howellii	Microseris laciniata subsp. siskiyouensis K.L. Chambers
JM1: Microseris laciniata	Microseris laciniata (Hook.) Sch. Bip.
JM2: Microseris laciniata subsp. detlingii	Microseris laciniata subsp. detlingii K.L. Chambers
JM1: Microseris laciniata subsp. laciniata	Microseris laciniata (Hook.) Sch. Bip. subsp. laciniata
JM1: Microseris laciniata subsp. leptosepala	Microseris laciniata subsp. leptosepala (Nutt.) K.L. Chambers
JM1: Microseris laciniata subsp. siskiyouensis	Microseris laciniata subsp. siskiyouensis K.L. Chambers
JM1: Microseris nutans	Microseris nutans (Hook.) Sch. Bip.
JM1: Microseris paludosa	Microseris paludosa (Greene) J.T. Howell
JM1: Microseris sylvatica	Microseris sylvatica (Benth.) Sch. Bip.
JM2: Microsteris gracilis	Microsteris gracilis (Hook.) Greene
JMS: Microsteris gracilis subsp. humilior	Microsteris gracilis (Hook.) Greene
JMS: Microsteris gracilis var. humilior	Microsteris gracilis (Hook.) Greene
JMS: Mimulus acutidens	Mimulus inconspicuus A. Gray
JM1: Mimulus alsinoides	Mimulus alsinoides Benth.
JM1: Mimulus androsaceus	Mimulus androsaceus Greene
JM1: Mimulus angustatus	Mimulus angustatus (A. Gray) A. Gray
JMS: Mimulus angustifolius	Mimulus nanus var. mephiticus (Greene) D.M. Thomps.
JMS: Mimulus arenarius	Mimulus floribundus Lindl.
JMS: Mimulus aridus	Mimulus aurantiacus var. aridus (Abrams) D.M. Thomps.
JM1: Mimulus aurantiacus	Mimulus aurantiacus Curtis
JM2: Mimulus aurantiacus var. aridus	Mimulus aurantiacus var. aridus (Abrams) D.M. Thomps.
JM2: Mimulus aurantiacus var. grandiflorus	Mimulus aurantiacus var. grandiflorus (Lindl.) D.M. Thomps.
JM2: Mimulus aurantiacus var. parviflorus	Mimulus aurantiacus var. parviflorus (Greene) D.M. Thomps.
JM2: Mimulus aurantiacus var. pubescens	Mimulus aurantiacus var. pubescens (Torr.) D.M. Thomps.
JM2: Mimulus aurantiacus var. puniceus	Mimulus aurantiacus var. puniceus (Nutt.) D.M. Thomps.
JMS: Mimulus austinae	Mimulus nanus Hook. & Arn. var. nanus
JMS: Mimulus barbatus	Mimulus montioides A. Gray
JM1: Mimulus bicolor	Mimulus bicolor Benth.
JMS: Mimulus bifidus	Mimulus aurantiacus var. grandiflorus (Lindl.) D.M. Thomps.
JM1: Mimulus bigelovii	Mimulus bigelovii (A. Gray) A. Gray
JM1: Mimulus bigelovii var. bigelovii	Mimulus bigelovii (A. Gray) A. Gray var. bigelovii
JM1: Mimulus bigelovii var. cuspidatus	Mimulus bigelovii var. cuspidatus A.L. Grant
JMS: Mimulus bigelovii var. panamintensis	Mimulus bigelovii var. cuspidatus A.L. Grant
JMS: Mimulus biolettii	Mimulus filicaulis S. Watson
JM1: Mimulus bolanderi	Mimulus bolanderi A. Gray
JMS: Mimulus brachiatus	Mimulus layneae (Greene) Jeps.
JMS: Mimulus brandegeei	Mimulus latifolius A. Gray
JM1: Mimulus breviflorus	Mimulus breviflorus Piper
JM1: Mimulus brevipes	Mimulus brevipes Benth.
JM1: Mimulus breweri	Mimulus breweri (Greene) Coville
JM1: Mimulus cardinalis	Mimulus cardinalis Benth.
JM1: Mimulus clevelandii	Mimulus clevelandii Brandegee
JMS: Mimulus coccineus	Mimulus nanus var. mephiticus (Greene) D.M. Thomps.
JM1: Mimulus congdonii	Mimulus congdonii B.L. Rob.
JM1: Mimulus constrictus	Mimulus constrictus (A.L. Grant) Pennell
JMS: Mimulus cupriphilus	Mimulus guttatus DC.
JM1: Mimulus cusickii	Mimulus cusickii (Greene) Rattan
JMS: Mimulus densus	Mimulus nanus var. mephiticus (Greene) D.M. Thomps.
JM1: Mimulus dentatus	Mimulus dentatus Benth.
JMS: Mimulus diffusus	Mimulus palmeri A. Gray
JMS: Mimulus discolor	Mimulus montioides A. Gray
JM1: Mimulus douglasii	Mimulus douglasii (Benth.) A. Gray
JMS: Mimulus dudleyi	Mimulus floribundus Lindl.
JM2: Mimulus evanescens	Mimulus evanescens Meinke
JM1: Mimulus exiguus	Mimulus exiguus A. Gray
JM1: Mimulus filicaulis	Mimulus filicaulis S. Watson
JMS: Mimulus flemingii	Mimulus aurantiacus var. parviflorus (Greene) D.M. Thomps.
JM1: Mimulus floribundus	Mimulus floribundus Lindl.
JMS: Mimulus floribundus var. subulatus	Mimulus floribundus Lindl.
JM1: Mimulus fremontii	Mimulus fremontii (Benth.) A. Gray
JM2: Mimulus fremontii var. fremontii	Mimulus fremontii (Benth.) A. Gray var. fremontii
JM2: Mimulus fremontii var. vandenbergensis	Mimulus fremontii var. vandenbergensis D.M. Thomps.
JMS: Mimulus glabratus	Mimulus guttatus DC.
JMS: Mimulus glabratus subsp. utahensis	Mimulus guttatus DC.
JM1: Mimulus glaucescens	Mimulus glaucescens Greene
JMS: Mimulus glutinosus	Mimulus aurantiacus var. aridus (Abrams) D.M. Thomps.
JMS: Mimulus glutinosus var. brachypus	Mimulus aurantiacus var. pubescens (Torr.) D.M. Thomps.
JM1: Mimulus gracilipes	Mimulus gracilipes B.L. Rob.
JMS: Mimulus grayi	Mimulus inconspicuus A. Gray
JM1: Mimulus guttatus	Mimulus guttatus DC.
JMS: Mimulus guttatus subsp. arenicola	Mimulus guttatus DC.
JMS: Mimulus guttatus subsp. arvensis	Mimulus guttatus DC.
JMS: Mimulus guttatus subsp. litoralis	Mimulus guttatus DC.
JMS: Mimulus guttatus subsp. micranthus	Mimulus guttatus DC.
JM1: Mimulus inconspicuus	Mimulus inconspicuus A. Gray
JM1: Mimulus jepsonii	Mimulus nanus var. jepsonii (A.L. Grant) D.M. Thomps.
JM1: Mimulus johnstonii	Mimulus johnstonii A.L. Grant
JM1: Mimulus kelloggii	Mimulus kelloggii (Greene) A. Gray
JM1: Mimulus laciniatus	Mimulus laciniatus A. Gray
JM1: Mimulus latidens	Mimulus latidens (A. Gray) Greene
JM1: Mimulus latifolius	Mimulus latifolius A. Gray
JM1: Mimulus layneae	Mimulus layneae (Greene) Jeps.
JM1: Mimulus leptaleus	Mimulus leptaleus A. Gray
JMS: Mimulus leptanthus	Mimulus aurantiacus var. aridus (Abrams) D.M. Thomps.
JM1: Mimulus lewisii	Mimulus lewisii Pursh
JMS: Mimulus linearis	Mimulus aurantiacus var. grandiflorus (Lindl.) D.M. Thomps.
JMS: Mimulus longiflorus	Mimulus aurantiacus var. pubescens (Torr.) D.M. Thomps.
JMS: Mimulus longiflorus var. rutilus	Mimulus aurantiacus var. pubescens (Torr.) D.M. Thomps.
JM1: Mimulus mephiticus	Mimulus nanus var. mephiticus (Greene) D.M. Thomps.
JMS: Mimulus microcarpus	Mimulus nanus var. jepsonii (A.L. Grant) D.M. Thomps.
JMS: Mimulus microphyllus	Mimulus guttatus DC.
JMS: Mimulus microphyton	Mimulus nanus Hook. & Arn. var. nanus
JM1: Mimulus mohavensis	Mimulus mohavensis Lemmon
JM1: Mimulus montioides	Mimulus montioides A. Gray
JM1: Mimulus moschatus	Mimulus moschatus Lindl.
JMS: Mimulus moschatus var. moniliformis	Mimulus moschatus Lindl.
JM1: Mimulus nanus	Mimulus nanus Hook. & Arn.
JM2: Mimulus nanus var. jepsonii	Mimulus nanus var. jepsonii (A.L. Grant) D.M. Thomps.
JM2: Mimulus nanus var. mephiticus	Mimulus nanus var. mephiticus (Greene) D.M. Thomps.
JM2: Mimulus nanus var. nanus	Mimulus nanus Hook. & Arn. var. nanus
JMS: Mimulus nasutus	Mimulus guttatus DC.
JM1: Mimulus norrisii	Mimulus norrisii Heckard & Shevock
JM1: Mimulus nudatus	Mimulus nudatus Greene
JM1: Mimulus palmeri	Mimulus palmeri A. Gray
JM1: Mimulus parishii	Mimulus parishii Greene
JM1: Mimulus parryi	Mimulus parryi A. Gray
JM1: Mimulus pictus	Mimulus pictus (Greene) A. Gray
JM1: Mimulus pilosus	Mimulus pilosus (Benth.) S. Watson
JMS: Mimulus platylaemus	Mimulus bolanderi A. Gray
JM1: Mimulus primuloides	Mimulus primuloides Benth.
JM1: Mimulus primuloides subsp. linearifolius	Mimulus primuloides var. linearifolius A.L. Grant
JM1: Mimulus primuloides subsp. primuloides	Mimulus primuloides Benth.
JM2: Mimulus primuloides var. linearifolius	Mimulus primuloides var. linearifolius A.L. Grant
JM2: Mimulus primuloides var. primuloides	Mimulus primuloides Benth. var. primuloides
JM1: Mimulus pulchellus	Mimulus pulchellus (Greene) A.L. Grant
JM1: Mimulus pulsiferae	Mimulus pulsiferae A. Gray
JM1: Mimulus purpureus	Mimulus purpureus A.L. Grant
JM1: Mimulus pygmaeus	Mimulus pygmaeus A.L. Grant
JM1: Mimulus rattanii	Mimulus rattanii A. Gray
JMS: Mimulus rattanii subsp. decurtatus	Mimulus rattanii A. Gray
JMS: Mimulus reifschneiderae	Mimulus nanus var. mephiticus (Greene) D.M. Thomps.
JM1: Mimulus ringens	Mimulus ringens L.
JM1: Mimulus rubellus	Mimulus rubellus A. Gray
JM1: Mimulus rupicola	Mimulus rupicola Coville & A.L. Grant
JM1: Mimulus shevockii	Mimulus shevockii Heckard & Bacig.
JMS: Mimulus spissus	Mimulus bigelovii var. cuspidatus A.L. Grant
JMS: Mimulus stamineus	Mimulus nanus var. mephiticus (Greene) D.M. Thomps.
JMS: Mimulus stellatus	Mimulus aurantiacus var. aridus (Abrams) D.M. Thomps.
JMS: Mimulus subsecundus	Mimulus fremontii (Benth.) A. Gray var. fremontii
JM1: Mimulus suksdorfii	Mimulus suksdorfii A. Gray
JM1: Mimulus tilingii	Mimulus tilingii Regel
JM1: Mimulus torreyi	Mimulus torreyi A. Gray
JM1: Mimulus traskiae	Mimulus traskiae A.L. Grant
JM1: Mimulus tricolor	Mimulus tricolor Lindl.
JM1: Mimulus viscidus	Mimulus viscidus Congdon
JM2: Mimulus viscidus var. compactus	Mimulus viscidus var. compactus D.M. Thomps.
JM2: Mimulus viscidus var. viscidus	Mimulus viscidus var. viscidus
JMS: Mimulus washoensis	Mimulus nanus var. mephiticus (Greene) D.M. Thomps.
JMS: Mimulus whipplei	Mimulus guttatus DC.
JM1: Mimulus whitneyi	Mimulus whitneyi A. Gray
JMS: Mimulus wolfii	Mimulus nanus var. mephiticus (Greene) D.M. Thomps.
JM1: Minuartia californica	Minuartia californica (A. Gray) Mattf.
JM2: Minuartia cismontana	Minuartia cismontana Meinke & Zika
JM1: Minuartia decumbens	Minuartia decumbens T.W. Nelson & J.P. Nelson
JM1: Minuartia douglasii	Minuartia douglasii (Torr. & A. Gray) Mattf.
JM1: Minuartia howellii	Minuartia howellii (S. Watson) Mattf.
JM1: Minuartia nuttallii	Minuartia nuttallii (Pax) Briq.
JM1: Minuartia nuttallii subsp. fragilis	Minuartia nuttallii var. fragilis (Maguire & A.H. Holmgren) Rabeler & R.L. Hartm.
JM1: Minuartia nuttallii subsp. gracilis	Minuartia nuttallii var. gracilis (B.L. Rob.) Rabeler & R.L. Hartm.
JM1: Minuartia nuttallii subsp. gregaria	Minuartia nuttallii var. gregaria (A. Heller) Rabeler & R.L. Hartm.
JM2: Minuartia nuttallii var. fragilis	Minuartia nuttallii var. fragilis (Maguire & A.H. Holmgren) Rabeler & R.L. Hartm.
JM2: Minuartia nuttallii var. gracilis	Minuartia nuttallii var. gracilis (B.L. Rob.) Rabeler & R.L. Hartm.
JM2: Minuartia nuttallii var. gregaria	Minuartia nuttallii var. gregaria (A. Heller) Rabeler & R.L. Hartm.
JM1: Minuartia obtusiloba	Minuartia obtusiloba (Rydb.) House
JM1: Minuartia pusilla	Minuartia pusilla (S. Watson) Mattf.
JM1: Minuartia rosei	Minuartia rosei (Maguire & Barneby) McNeill
JM1: Minuartia rubella	Minuartia rubella (Wahlenb.) Hiern
JM1: Minuartia stolonifera	Minuartia stolonifera T.W. Nelson & J.P. Nelson
JM1: Minuartia stricta	Minuartia stricta (Sw.) Hiern
JM2: Mirabilis albida	Mirabilis albida (Walter) Heimerl
JM1: Mirabilis alipes	Mirabilis alipes (S. Watson) Pilz
JM1: Mirabilis bigelovii	Mirabilis laevis var. villosa (Kellogg) Spellenb.
JMS: Mirabilis bigelovii var. aspera	Mirabilis laevis var. villosa (Kellogg) Spellenb.
JM1: Mirabilis bigelovii var. bigelovii	Mirabilis laevis var. villosa (Kellogg) Spellenb.
JM1: Mirabilis bigelovii var. retrorsa	Mirabilis laevis var. retrorsa (A. Heller) Jeps.
JM1: Mirabilis californica	Mirabilis laevis var. crassifolia (Choisy) Spellenb.
JMS: Mirabilis californica var. cedrosensis	Mirabilis laevis var. crassifolia (Choisy) Spellenb.
JM1: Mirabilis coccinea	Mirabilis coccinea (Torr.) Benth. & Hook. f.
JMS: Mirabilis comata	Mirabilis albida (Walter) Heimerl
JM1: Mirabilis greenei	Mirabilis greenei S. Watson
JM1: Mirabilis jalapa	Mirabilis jalapa L.
JM2: Mirabilis jalapa var. jalapa	Mirabilis jalapa L. var. jalapa
JM2: Mirabilis laevis	Mirabilis laevis (Benth.) Curran
JM2: Mirabilis laevis var. crassifolia	Mirabilis laevis var. crassifolia (Choisy) Spellenb.
JM2: Mirabilis laevis var. retrorsa	Mirabilis laevis var. retrorsa (A. Heller) Jeps.
JM2: Mirabilis laevis var. villosa	Mirabilis laevis var. villosa (Kellogg) Spellenb.
JM1: Mirabilis linearis	Mirabilis linearis (Pursh) Heimerl
JM2: Mirabilis linearis var. linearis	Mirabilis linearis (Pursh) Heimerl var. linearis
JM1: Mirabilis multiflora	Mirabilis multiflora (Torr.) A. Gray
JM1: Mirabilis multiflora var. glandulosa	Mirabilis multiflora var. glandulosa (Standl.) J.F. Macbr.
JM1: Mirabilis multiflora var. pubescens	Mirabilis multiflora var. pubescens S. Watson
JM1: Mirabilis nyctaginea	Mirabilis nyctaginea (Michx.) MacMill.
JM1: Mirabilis oblongifolia	Mirabilis albida (Walter) Heimerl
JM1: Mirabilis pumila	Mirabilis albida (Walter) Heimerl
JM1: Mirabilis tenuiloba	Mirabilis tenuiloba S. Watson
JM1: Miscanthus sinensis	excluded
JM1: Mitella breweri	Pectiantia breweri (A. Gray) Rydb.
JM1: Mitella caulescens	Mitellastra caulescens (Nutt.) Howell
JM1: Mitella diversifolia	Ozomelis diversifolia (Greene) Rydb.
JM1: Mitella ovalis	Pectiantia ovalis (Greene) Rydb.
JM1: Mitella pentandra	Pectiantia pentandra (Hook.) Rydb.
JM1: Mitella trifida	Ozomelis trifida (Graham) Rydb.
JM2: Mitellastra caulescens	Mitellastra caulescens (Nutt.) Howell
JM1: Modiola caroliniana	Modiola caroliniana (L.) G. Don
JM1: Moehringia macrophylla	Moehringia macrophylla (Hook.) Fenzl
JM2: Moenchia erecta	Moenchia erecta (L.) P. Gaertn. et al.
JM2: Moenchia erecta subsp. erecta	Moenchia erecta (L.) P. Gaertn. et al. subsp. erecta
JM1: Mohavea breviflora	Mohavea breviflora Coville
JM1: Mohavea confertiflora	Mohavea confertiflora (A. DC.) A. Heller
JM1: Mollugo cerviana	Mollugo cerviana (L.) Ser.
JM1: Mollugo verticillata	Mollugo verticillata L.
JM1: Moluccella laevis	Moluccella laevis L.
JM1: Monanthochloe littoralis	Distichlis littoralis (Engelm.) H.L. Bell & Columbus
JM1: Monarda pectinata	Monarda pectinata Nutt.
JMS: Monardella anemonoides	Monardella linoides subsp. anemonoides (Greene) Elvin & A.C. Sanders
JM1: Monardella antonina	Monardella villosa Benth.
JM1: Monardella antonina subsp. antonina	Monardella villosa Benth. subsp. villosa
JM1: Monardella antonina subsp. benitensis	Monardella villosa Benth. subsp. villosa
JM1: Monardella australis	Monardella australis Abrams
JM2: Monardella australis subsp. australis	Monardella australis Abrams subsp. australis
JM2: Monardella australis subsp. cinerea	Monardella australis subsp. cinerea (Abrams) A.C. Sanders & Elvin
JM2: Monardella australis subsp. jokerstii	Monardella australis subsp. jokerstii Elvin & A.C. Sanders
JM2: Monardella beneolens	Monardella beneolens Shevock et al.
JM2: Monardella boydii	Monardella boydii A.C. Sanders & Elvin
JM1: Monardella breweri	Monardella breweri A. Gray
JM2: Monardella breweri subsp. breweri	Monardella breweri A. Gray subsp. breweri
JM2: Monardella breweri subsp. glandulifera	Monardella breweri subsp. glandulifera (I.M. Johnst.) Elvin
JM2: Monardella breweri subsp. lanceolata	Monardella breweri subsp. lanceolata (A. Gray) A.C. Sanders & Elvin
JM2: Monardella breweri subsp. microcephala	Monardella breweri subsp. microcephala (A. Gray) Elvin & A.C. Sanders
JM1: Monardella candicans	Monardella candicans Benth.; Monardella exilis (A. Gray) Greene; Monardella venosa (Torr.) A.C. Sanders & Elvin
JMS: Monardella candicans var. exilis	Monardella exilis (A. Gray) Greene
JMS: Monardella candicans var. venosa	Monardella venosa (Torr.) A.C. Sanders & Elvin
JM1: Monardella cinerea	Monardella australis subsp. cinerea (Abrams) A.C. Sanders & Elvin
JM1: Monardella crispa	Monardella undulata subsp. crispa (Elmer) Elvin & A.C. Sanders
JM1: Monardella douglasii	Monardella douglasii Benth.; Monardella venosa (Torr.) A.C. Sanders & Elvin
JM1: Monardella douglasii subsp. douglasii	Monardella douglasii Benth.
JM1: Monardella douglasii subsp. venosa	Monardella venosa (Torr.) A.C. Sanders & Elvin
JMS: Monardella douglasii var. parryi	Monardella venosa (Torr.) A.C. Sanders & Elvin
JMS: Monardella douglasii var. venosa	Monardella venosa (Torr.) A.C. Sanders & Elvin
JM2: Monardella eremicola	Monardella eremicola A.C. Sanders & Elvin
JM1: Monardella exilis	Monardella exilis (A. Gray) Greene
JM1: Monardella follettii	Monardella follettii (Jeps.) Jokerst
JMS: Monardella franciscana	Monardella villosa subsp. franciscana (Elmer) Jokerst
JM1: Monardella frutescens	Monardella undulata Benth. subsp. undulata
JM1: Monardella glauca	Monardella odoratissima subsp. glauca (Greene) Epling
JM1: Monardella hypoleuca	Monardella hypoleuca A. Gray; Monardella saxicola I.M. Johnst.
JM1: Monardella hypoleuca subsp. hypoleuca	Monardella hypoleuca A. Gray subsp. hypoleuca; Monardella hypoleuca subsp. intermedia A.C. Sanders & Elvin
JM2: Monardella hypoleuca subsp. intermedia	Monardella hypoleuca subsp. intermedia A.C. Sanders & Elvin
JM1: Monardella hypoleuca subsp. lanata	Monardella hypoleuca subsp. lanata (Abrams) Munz
JMS: Monardella hypoleuca var. saxicola	Monardella saxicola I.M. Johnst.
JMS: Monardella lanata	Monardella hypoleuca subsp. lanata (Abrams) Munz
JM1: Monardella lanceolata	Monardella breweri subsp. glandulifera (I.M. Johnst.) Elvin; Monardella breweri subsp. lanceolata (A. Gray) A.C. Sanders & Elvin
JMS: Monardella lanceolata var. glandulifera	Monardella breweri subsp. glandulifera (I.M. Johnst.) Elvin
JMS: Monardella lanceolata var. microcephala	Monardella breweri subsp. microcephala (A. Gray) Elvin & A.C. Sanders
JMS: Monardella lanceolata var. sanguinea	Monardella breweri subsp. lanceolata (A. Gray) A.C. Sanders & Elvin
JMS: Monardella ledifolia	Monardella viridis Jeps.
JM1: Monardella leucocephala	Monardella leucocephala A. Gray
JM1: Monardella linoides	Monardella linoides A. Gray; Monardella viminea Greene
JM2: Monardella linoides subsp. anemonoides	Monardella linoides subsp. anemonoides (Greene) Elvin & A.C. Sanders
JM2: Monardella linoides subsp. erecta	Monardella linoides subsp. erecta (Abrams) Elvin & A.C. Sanders
JM1: Monardella linoides subsp. linoides	Monardella linoides A. Gray subsp. linoides; Monardella linoides subsp. anemonoides (Greene) Elvin & A.C. Sanders
JM1: Monardella linoides subsp. oblonga	Monardella linoides subsp. oblonga (Greene) Abrams
JM2: Monardella linoides subsp. sierrae	Monardella linoides subsp. sierrae Elvin & A.C. Sanders
JM1: Monardella linoides subsp. stricta	excluded
JM1: Monardella linoides subsp. viminea	Monardella viminea Greene
JMS: Monardella linoides var. anemonoides	Monardella linoides subsp. anemonoides (Greene) Elvin & A.C. Sanders
JMS: Monardella linoides var. oblonga	Monardella linoides subsp. oblonga (Greene) Abrams
JMS: Monardella linoides var. viminea	Monardella viminea Greene
JM1: Monardella macrantha	Monardella macrantha A. Gray; Monardella nana A. Gray
JM1: Monardella macrantha subsp. hallii	Monardella macrantha subsp. hallii (Abrams) Abrams
JM1: Monardella macrantha subsp. macrantha	Monardella macrantha A. Gray subsp. macrantha
JMS: Monardella macrantha var. pinetorum	Monardella nana A. Gray
JM2: Monardella mojavensis	Monardella mojavensis Elvin & A.C. Sanders
JM1: Monardella nana	Monardella nana A. Gray
JM1: Monardella nana subsp. arida	Monardella nana A. Gray
JM1: Monardella nana subsp. leptosiphon	Monardella nana A. Gray
JM1: Monardella nana subsp. nana	Monardella nana A. Gray
JM1: Monardella nana subsp. tenuiflora	Monardella nana A. Gray
JMS: Monardella neglecta	Monardella purpurea Howell
JMS: Monardella oblonga	Monardella linoides subsp. oblonga (Greene) Abrams
JM1: Monardella odoratissima	Monardella australis Abrams; Monardella odoratissima Benth.; Monardella follettii (Jeps.) Jokerst; Monardella purpurea Howell
JMS: Monardella odoratissima subsp. australis	Monardella australis Abrams subsp. australis
JMS: Monardella odoratissima subsp. glauca	Monardella follettii (Jeps.) Jokerst; Monardella odoratissima subsp. glauca (Greene) Epling
JM1: Monardella odoratissima subsp. odoratissima	Monardella odoratissima Benth.
JM1: Monardella odoratissima subsp. pallida	Monardella odoratissima subsp. pallida (A. Heller) Epling
JMS: Monardella odoratissima var. follettii	Monardella follettii (Jeps.) Jokerst
JMS: Monardella odoratissima var. glauca	Monardella odoratissima subsp. glauca (Greene) Epling
JMS: Monardella odoratissima var. neglecta	Monardella purpurea Howell
JMS: Monardella odoratissima var. ovata	Monardella odoratissima Benth.; Monardella odoratissima subsp. glauca (Greene) Epling
JMS: Monardella ovata	Monardella odoratissima Benth.
JMS: Monardella pallida	Monardella odoratissima subsp. pallida (A. Heller) Epling
JM1: Monardella palmeri	Monardella palmeri A. Gray
JMS: Monardella peninsularis	Monardella breweri subsp. microcephala (A. Gray) Elvin & A.C. Sanders
JM1: Monardella pringlei	Monardella pringlei A. Gray
JM1: Monardella purpurea	Monardella purpurea Howell
JMS: Monardella reflexa	Monardella villosa Benth. subsp. villosa
JM1: Monardella robisonii	Monardella robisonii Munz
JMS: Monardella robusta	Monardella hypoleuca A. Gray subsp. hypoleuca
JM2: Monardella saxicola	Monardella saxicola I.M. Johnst.
JM1: Monardella sheltonii	Monardella sheltonii Torr.
JM2: Monardella sinuata	Monardella sinuata Elvin & A.C. Sanders
JM2: Monardella sinuata subsp. nigrescens	Monardella sinuata subsp. nigrescens Elvin & A.C. Sanders
JM2: Monardella sinuata subsp. sinuata	Monardella sinuata Elvin & A.C. Sanders subsp. sinuata
JM1: Monardella siskiyouensis	Monardella villosa Benth. subsp. villosa
JM1: Monardella stebbinsii	Monardella stebbinsii Hardham & Bartel
JM2: Monardella stoneana	Monardella stoneana Elvin & A.C. Sanders
JM1: Monardella undulata	Monardella sinuata Elvin & A.C. Sanders; Monardella undulata Benth.
JM2: Monardella undulata subsp. arguelloensis	Monardella undulata subsp. arguelloensis Elvin & A.C. Sanders
JM2: Monardella undulata subsp. crispa	Monardella undulata subsp. crispa (Elmer) Elvin & A.C. Sanders
JM2: Monardella undulata subsp. undulata	Monardella undulata Benth. subsp. undulata
JMS: Monardella undulata var. crispa	Monardella undulata subsp. crispa (Elmer) Elvin & A.C. Sanders
JMS: Monardella undulata var. frutescens	Monardella undulata Benth. subsp. undulata
JM2: Monardella venosa	Monardella venosa (Torr.) A.C. Sanders & Elvin
JM1: Monardella villosa	Monardella villosa Benth.; Monardella purpurea Howell; Monardella sheltonii Torr.
JM1: Monardella villosa subsp. franciscana	Monardella villosa subsp. franciscana (Elmer) Jokerst
JM1: Monardella villosa subsp. globosa	Monardella villosa Benth. subsp. villosa
JMS: Monardella villosa subsp. neglecta	Monardella purpurea Howell
JM1: Monardella villosa subsp. obispoensis	Monardella villosa subsp. obispoensis (Jeps.) Jokerst
JMS: Monardella villosa subsp. sheltonii	Monardella sheltonii Torr.
JMS: Monardella villosa subsp. subserrata	Monardella villosa Benth. subsp. villosa
JM1: Monardella villosa subsp. villosa	Monardella villosa Benth. subsp. villosa
JMS: Monardella villosa var. franciscana	Monardella villosa subsp. franciscana (Elmer) Jokerst
JMS: Monardella villosa var. neglecta	Monardella purpurea Howell
JMS: Monardella villosa var. obispoensis	Monardella villosa subsp. obispoensis (Jeps.) Jokerst
JMS: Monardella villosa var. sheltonii	Monardella sheltonii Torr.
JM2: Monardella viminea	Monardella viminea Greene
JM1: Monardella viridis	Monardella viridis Jeps.; Monardella saxicola I.M. Johnst.
JM1: Monardella viridis subsp. saxicola	Monardella saxicola I.M. Johnst.
JM1: Monardella viridis subsp. viridis	Monardella viridis Jeps.
JMS: Monerma cylindrica	Hainardia cylindrica (Willd.) Greuter
JM1: Moneses uniflora	Moneses uniflora (L.) A. Gray
JM1: Monochoria vaginalis	Monochoria vaginalis (Burm. f.) Kunth
JM1: Monolepis nuttalliana	Monolepis nuttalliana (Schult.) Greene
JM1: Monolepis pusilla	Micromonolepis pusilla (S. Watson) Ulbr.
JM1: Monolepis spathulata	Monolepis spathulata A. Gray
JMS: Monolopia bahiifolia	Pseudobahia bahiifolia (Benth.) Rydb.
JMS: Monolopia bahiifolia var. pinnatifida	Pseudobahia heermannii (Durand) Rydb.
JM2: Monolopia congdonii	Monolopia congdonii (A. Gray) B.G. Baldwin
JM1: Monolopia gracilens	Monolopia gracilens A. Gray
JM1: Monolopia lanceolata	Monolopia lanceolata Nutt.
JM1: Monolopia major	Monolopia major DC.
JM1: Monolopia stricta	Monolopia stricta Crum
JM1: Monoptilon bellidiforme	Monoptilon bellidiforme Torr. & A. Gray
JM1: Monoptilon bellioides	Monoptilon bellioides (A. Gray) H.M. Hall
JM1: Monotropa hypopitys	Monotropa hypopitys L.
JM1: Monotropa uniflora	Monotropa uniflora L.
JM1: Montia chamissoi	Montia chamissoi (Spreng.) Greene
JM1: Montia dichotoma	Montia dichotoma (Nutt.) Howell
JM1: Montia diffusa	Montia diffusa (Nutt.) Greene
JM1: Montia fontana	Montia fontana L.
JMS: Montia fontana subsp. amporitana	Montia fontana L.
JMS: Montia fontana subsp. chondrosperma	Montia fontana L.
JMS: Montia fontana subsp. variabilis	Montia fontana L.
JMS: Montia funstonii	Montia fontana L.
JM1: Montia howellii	Montia howellii S. Watson
JM1: Montia linearis	Montia linearis (Hook.) Greene
JM1: Montia parvifolia	Montia parvifolia (DC.) Greene
JMS: Montia perfoliata	Claytonia parviflora
JMS: Montia perfoliata f. parviflora	Claytonia parviflora Hook. subsp. parviflora
JMS: Montia perfoliata var. utahensis	Claytonia parviflora subsp. utahensis (Rydb.) John M. Mill. & K.L. Chambers
JMS: Montia spathulata	Claytonia parviflora
JMS: Montia spathulata var. tenuifolia	Claytonia parviflora subsp. viridis (Davidson) John M. Mill. & K.L. Chambers
JM2: Morella californica	Morella californica (Cham. & Schltdl.) Wilbur
JM1: Mortonia utahensis	Mortonia utahensis (Trel.) A. Nelson
JM1: Morus alba	Morus alba L.
JM1: Mucronea californica	Mucronea californica Benth.
JM1: Mucronea perfoliata	Mucronea perfoliata (A. Gray) A. Heller
JM1: Muehlenbeckia complexa	Muehlenbeckia complexa (A. Cunn.) Meisn.
JM1: Muehlenbeckia hastatula	Muehlenbeckia hastulata (Sm.) I.M. Johnst.
JM2: Muehlenbeckia hastulata	Muehlenbeckia hastulata (Sm.) I.M. Johnst.
JMS: Muehlenbeckia hastulata var. fascicularis	Muehlenbeckia hastulata (Sm.) I.M. Johnst.
JMS: Muehlenbeckia hastulata var. rotundata	Muehlenbeckia hastulata (Sm.) I.M. Johnst.
JM2: Muhlenbergia alopecuroides	Muhlenbergia alopecuroides (Griseb.) P.M. Peterson & Columbus
JM1: Muhlenbergia andina	Muhlenbergia andina (Nutt.) Hitchc.
JM1: Muhlenbergia appressa	Muhlenbergia appressa C.O. Goodd.
JM1: Muhlenbergia arsenei	Muhlenbergia arsenei Hitchc.
JM1: Muhlenbergia asperifolia	Muhlenbergia asperifolia (Trin.) Parodi
JM1: Muhlenbergia californica	Muhlenbergia californica Vasey
JM1: Muhlenbergia filiformis	Muhlenbergia filiformis (S. Watson) Rydb.
JM1: Muhlenbergia fragilis	Muhlenbergia fragilis Swallen
JM1: Muhlenbergia jonesii	Muhlenbergia jonesii (Vasey) Hitchc.
JM1: Muhlenbergia mexicana	Muhlenbergia mexicana (L.) Trin.
JM1: Muhlenbergia microsperma	Muhlenbergia microsperma (DC.) Kunth
JM1: Muhlenbergia minutissima	Muhlenbergia minutissima (Steud.) Swallen
JM1: Muhlenbergia montana	Muhlenbergia montana (Nutt.) Hitchc.
JM1: Muhlenbergia pauciflora	Muhlenbergia pauciflora Buckley
JM1: Muhlenbergia porteri	Muhlenbergia porteri Beal
JM1: Muhlenbergia richardsonis	Muhlenbergia richardsonis (Trin.) Rydb.
JM1: Muhlenbergia rigens	Muhlenbergia rigens (Benth.) Hitchc.
JM1: Muhlenbergia schreberi	Muhlenbergia schreberi J.F. Gmel.
JM1: Muhlenbergia utilis	Muhlenbergia utilis (Torr.) Hitchc.
JM1: Muilla clevelandii	Bloomeria clevelandii S. Watson
JM1: Muilla coronata	Muilla coronata Greene
JM1: Muilla maritima	Muilla maritima (Torr.) S. Watson
JM1: Muilla transmontana	Muilla transmontana Greene
JMS: Mulgedium oblongifolium	Lactuca tatarica (L.) C.A. Mey. subsp. pulchella Stebbins
JMS: Mulgedium pulchellum	Lactuca tatarica (L.) C.A. Mey. subsp. pulchella Stebbins
JM1: Munroa squarrosa	Munroa squarrosa (Nutt.) Torr.
JM2: Munzothamnus blairii	Munzothamnus blairii (Munz & I.M. Johnst.) P.H. Raven
JM1: Muscari botryoides	excluded (historical waif)
JM1: Myoporum laetum	Myoporum laetum G. Forst.
JM1: Myosotis discolor	Myosotis discolor Pers.
JM1: Myosotis latifolia	Myosotis latifolia Poir.
JM1: Myosotis laxa	Myosotis laxa Lehm.
JM1: Myosotis micrantha	Myosotis micrantha Lehm.
JM1: Myosotis scorpioides	Myosotis scorpioides L.
JM1: Myosotis verna	Myosotis verna Nutt.
JM1: Myosurus apetalus	Myosurus apetalus Gay
JM2: Myosurus apetalus var. borealis	Myosurus apetalus var. borealis Whittem.
JM2: Myosurus apetalus var. montanus	Myosurus apetalus var. montanus (G.R. Campb.) Whittem.
JM1: Myosurus cupulatus	Myosurus cupulatus S. Watson
JM1: Myosurus minimus	Myosurus minimus L.
JM1: Myosurus sessilis	Myosurus sessilis S. Watson
JM1: Myrica californica	Morella californica (Cham. & Schltdl.) Wilbur
JM1: Myrica hartwegii	Myrica hartwegii S. Watson
JM1: Myriophyllum aquaticum	Myriophyllum aquaticum (Vell.) Verdc.
JMS: Myriophyllum brasiliense	Myriophyllum aquaticum (Vell.) Verdc.
JMS: Myriophyllum elatinoides	Myriophyllum quitense Kunth
JMS: Myriophyllum exalbescens	Myriophyllum sibiricum Kom.
JM1: Myriophyllum hippuroides	Myriophyllum hippuroides Torr. & A. Gray
JMS: Myriophyllum proserpinacoides	Myriophyllum aquaticum (Vell.) Verdc.
JM2: Myriophyllum quitense	Myriophyllum quitense Kunth
JM1: Myriophyllum sibiricum	Myriophyllum sibiricum Kom.
JM1: Myriophyllum spicatum	Myriophyllum spicatum L.
JMS: Myriophyllum spicatum subsp. exalbescens	Myriophyllum sibiricum Kom.
JMS: Myriophyllum spicatum var. exalbescens	Myriophyllum sibiricum Kom.
JM1: Myriophyllum verticillatum	Myriophyllum verticillatum L.
JM2: Myrtus communis	Myrtus communis L.
JM1: Najas flexilis	Najas flexilis (Willd.) Rostk. & W.L.E. Schmidt
JM1: Najas gracillima	Najas gracillima (Engelm.) Magnus
JM1: Najas graminea	Najas graminea Delile
JM1: Najas guadalupensis	Najas guadalupensis (Spreng.) Magnus
JM2: Najas guadalupensis subsp. guadalupensis	Najas guadalupensis (Spreng.) Magnus subsp. guadalupensis
JM1: Najas marina	Najas marina L.
JM1: Nama aretioides	Nama aretioides (Hook. & Arn.) Brand
JM1: Nama aretioides var. californicum	Nama aretioides var. californicum (Brand) Jeps.
JM1: Nama aretioides var. multiflorum	Nama aretioides var. multiflorum (A. Heller) Jeps.
JM1: Nama californicum	Nama californicum (A. Gray) J.D. Bacon
JM1: Nama demissum	Nama demissum A. Gray
JM1: Nama demissum var. covillei	Nama demissum var. covillei Brand
JM1: Nama demissum var. demissum	Nama demissum A. Gray var. demissum
JM1: Nama densum	Nama densum Lemmon
JM1: Nama densum var. densum	Nama densum Lemmon var. densum
JM1: Nama densum var. parviflorum	Nama densum var. parviflorum (Greenm.) C.L. Hitchc.
JM1: Nama depressum	Nama depressum A. Gray
JM2: Nama dichotomum	Nama dichotomum (Ruiz & Pav.) Choisy
JM1: Nama dichotomum var. dichotomum	Nama dichotomum (Ruiz & Pav.) Choisy var. dichotomum
JM2: Nama hispidum	Nama hispidum A. Gray
JM1: Nama hispidum var. spathulatum	Nama hispidum A. Gray var. spathulatum (Torr.) C.L. Hitchc.
JM1: Nama lobbii	Eriodictyon lobbii (A. Gray) Greene
JM1: Nama pusillum	Nama pusillum A. Gray
JM1: Nama rothrockii	Nama rothrockii A. Gray
JM1: Nama stenocarpum	Nama stenocarpum A. Gray
JM2: Narcissus pseudonarcissus	Narcissus pseudonarcissus L.
JM2: Narcissus tazetta	Narcissus tazetta L.
JM1: Narthecium californicum	Narthecium californicum Baker
JM1: Nassella cernua	Stipa cernua Stebbins & Love
JM1: Nassella formicara	Stipa manicata E. Desv.
JMS: Nassella formicarum	Stipa manicata E. Desv.
JM1: Nassella lepida	Stipa lepida Hitchc.
JMS: Nassella manicata	Stipa manicata E. Desv.
JM1: Nassella pulchra	Stipa pulchra Hitchc.
JM2: Nasturtium gambelii	Nasturtium gambelii (S. Watson) O.E. Schulz
JM2: Nasturtium officinale	Nasturtium officinale W.T. Aiton
JM1: Navarretia atractyloides	Navarretia atractyloides (Benth.) Hook. & Arn.
JM1: Navarretia breweri	Navarretia breweri (A. Gray) Greene
JM2: Navarretia capillaris	Navarretia capillaris (Kellogg) Kuntze
JM1: Navarretia cotulifolia	Navarretia cotulifolia (Benth.) Hook. & Arn.
JM1: Navarretia divaricata	Navarretia divaricata (A. Gray) Greene
JM1: Navarretia divaricata subsp. divaricata	Navarretia divaricata (A. Gray) Greene subsp. divaricata
JM1: Navarretia divaricata subsp. vividior	Navarretia divaricata subsp. vividior (Jeps. & V.L. Bailey) H. Mason
JM1: Navarretia eriocephala	Navarretia eriocephala H. Mason
JM1: Navarretia filicaulis	Navarretia filicaulis (A. Gray) Greene
JM1: Navarretia fossalis	Navarretia fossalis Moran
JM2: Navarretia gowenii	Navarretia gowenii L.A. Johnson
JM1: Navarretia hamata	Navarretia hamata Greene
JM1: Navarretia hamata subsp. hamata	Navarretia hamata Greene subsp. hamata
JM1: Navarretia hamata subsp. leptantha	Navarretia hamata subsp. leptantha (Greene) H. Mason
JM1: Navarretia hamata subsp. parviloba	Navarretia hamata subsp. parviloba A.G. Day
JM1: Navarretia heterandra	Navarretia heterandra H. Mason
JM1: Navarretia heterodoxa	Navarretia heterodoxa (Greene) Greene
JM1: Navarretia intertexta	Navarretia intertexta (Benth.) Hook.
JM1: Navarretia intertexta subsp. intertexta	Navarretia intertexta (Benth.) Hook. subsp. intertexta
JM1: Navarretia intertexta subsp. propinqua	Navarretia intertexta subsp. propinqua (Suksd.) A.G. Day
JM1: Navarretia jaredii	Navarretia mitracarpa Greene
JM1: Navarretia jepsonii	Navarretia jepsonii Jeps.
JM2: Navarretia leptalea	Navarretia leptalea (A. Gray) L.A. Johnson
JM2: Navarretia leptalea subsp. bicolor	Navarretia leptalea subsp. bicolor (H. Mason & A.D. Grant) L.A. Johnson
JM2: Navarretia leptalea subsp. leptalea	Navarretia leptalea (A. Gray) L.A. Johnson subsp. leptalea
JM1: Navarretia leucocephala	Navarretia leucocephala Benth.
JM1: Navarretia leucocephala subsp. bakeri	Navarretia leucocephala subsp. bakeri (H. Mason) A.G. Day
JM1: Navarretia leucocephala subsp. leucocephala	Navarretia leucocephala Benth. subsp. leucocephala
JM1: Navarretia leucocephala subsp. minima	Navarretia leucocephala subsp. minima (Nutt.) A.G. Day
JM1: Navarretia leucocephala subsp. pauciflora	Navarretia leucocephala subsp. pauciflora (H. Mason) A.G. Day
JM1: Navarretia leucocephala subsp. plieantha	Navarretia leucocephala subsp. plieantha (H. Mason) A.G. Day
JM1: Navarretia mellita	Navarretia mellita Greene
JM2: Navarretia mitracarpa	Navarretia mitracarpa Greene
JM1: Navarretia myersii	Navarretia myersii P.S. Allen & A.G. Day
JM2: Navarretia myersii subsp. deminuta	Navarretia myersii subsp. deminuta A.G. Day
JM2: Navarretia myersii subsp. myersii	Navarretia myersii P.S. Allen & A.G. Day subsp. myersii
JM1: Navarretia nigelliformis	Navarretia nigelliformis Greene
JM1: Navarretia nigelliformis subsp. nigelliformis	Navarretia nigelliformis Greene subsp. nigelliformis
JM1: Navarretia nigelliformis subsp. radians	Navarretia nigelliformis subsp. radians (J.T. Howell) A.G. Day
JM2: Navarretia ojaiensis	Navarretia ojaiensis Elvin et al.
JM1: Navarretia peninsularis	Navarretia peninsularis Greene
JM1: Navarretia prolifera	Navarretia prolifera Greene
JM1: Navarretia prolifera subsp. lutea	Navarretia prolifera subsp. lutea (Brand) H. Mason
JM1: Navarretia prolifera subsp. prolifera	Navarretia prolifera Greene subsp. prolifera
JM1: Navarretia prostrata	Navarretia prostrata (A. Gray) Greene
JM1: Navarretia pubescens	Navarretia pubescens (Benth.) Hook. & Arn.
JM1: Navarretia rosulata	Navarretia rosulata Brand
JM1: Navarretia setiloba	Navarretia setiloba Coville
JM2: Navarretia sinistra	Navarretia sinistra (M.E. Jones) L.A. Johnson
JM2: Navarretia sinistra subsp. pinnatisecta	Navarretia sinistra subsp. pinnatisecta (H. Mason & A.D. Grant) L.A. Johnson
JM2: Navarretia sinistra subsp. sinistra	Navarretia sinistra (M.E. Jones) L.A. Johnson subsp. sinistra
JM1: Navarretia squarrosa	Navarretia squarrosa (Eschsch.) Hook. & Arn.
JM1: Navarretia subuligera	Navarretia subuligera Greene
JM1: Navarretia tagetina	Navarretia tagetina Greene
JM1: Navarretia viscidula	Navarretia viscidula Benth.
JM1: Nemacaulis denudata	Nemacaulis denudata Nutt.
JM1: Nemacaulis denudata var. denudata	Nemacaulis denudata var. denudata
JM1: Nemacaulis denudata var. gracilis	Nemacaulis denudata var. gracilis Goodman & L.D. Benson
JM2: Nemacladus calcaratus	Nemacladus calcaratus Morin
JM2: Nemacladus californicus	Nemacladus californicus (A. Gray) Morin
JM1: Nemacladus capillaris	Nemacladus capillaris Greene
JM1: Nemacladus glanduliferus	Nemacladus glanduliferus Jeps.; Nemacladus orientalis (McVaugh) Morin
JM1: Nemacladus glanduliferus var. glanduliferus	Nemacladus glanduliferus Jeps.
JM1: Nemacladus glanduliferus var. orientalis	Nemacladus orientalis (McVaugh) Morin
JM1: Nemacladus gracilis	Nemacladus gracilis Eastw.
JM1: Nemacladus interior	Nemacladus interior (Munz) G.T. Robbins
JM1: Nemacladus longiflorus	Nemacladus longiflorus A. Gray
JM1: Nemacladus longiflorus var. breviflorus	Nemacladus longiflorus var. breviflorus McVaugh
JM1: Nemacladus longiflorus var. longiflorus	Nemacladus longiflorus A. Gray var. longiflorus
JM1: Nemacladus montanus	Nemacladus montanus Greene
JM2: Nemacladus orientalis	Nemacladus orientalis (McVaugh) Morin
JM1: Nemacladus pinnatifidus	Nemacladus pinnatifidus Greene
JM1: Nemacladus ramosissimus	Nemacladus ramosissimus Nutt.
JM1: Nemacladus rigidus	Nemacladus rigidus Curran
JM1: Nemacladus rubescens	Nemacladus rubescens Greene; Nemacladus tenuis (McVaugh) Morin
JMS: Nemacladus rubescens var. rubescens	Nemacladus rubescens Greene
JMS: Nemacladus rubescens var. tenuis	Nemacladus tenuis (McVaugh) Morin
JM1: Nemacladus secundiflorus	Nemacladus secundiflorus G.T. Robbins
JM2: Nemacladus secundiflorus var. robbinsii	Nemacladus secundiflorus var. robbinsii Morin
JM2: Nemacladus secundiflorus var. secundiflorus	Nemacladus secundiflorus G.T. Robbins var. secundiflorus
JM1: Nemacladus sigmoideus	Nemacladus sigmoideus G.T. Robbins
JM2: Nemacladus tenuis	Nemacladus tenuis (McVaugh) Morin
JM2: Nemacladus tenuis var. aliformis	Nemacladus tenuis var. aliformis Morin
JM2: Nemacladus tenuis var. tenuis	Nemacladus tenuis (McVaugh) Morin var. tenuis
JM1: Nemacladus twisselmannii	Nemacladus twisselmannii J.T. Howell
JM1: Nemophila breviflora	Nemophila breviflora A. Gray
JM1: Nemophila heterophylla	Nemophila heterophylla Fisch. & C.A. Mey.
JM1: Nemophila maculata	Nemophila maculata Lindl.
JM1: Nemophila menziesii	Nemophila menziesii Hook. & Arn.
JM1: Nemophila menziesii var. atomaria	Nemophila menziesii var. atomaria (Fisch. & C.A. Mey.) Voss
JM1: Nemophila menziesii var. integrifolia	Nemophila menziesii var. integrifolia Parish
JM1: Nemophila menziesii var. menziesii	Nemophila menziesii Hook. & Arn. var. menziesii
JM1: Nemophila parviflora	Nemophila parviflora Benth.
JM1: Nemophila parviflora var. austinae	Nemophila parviflora var. austiniae (Eastw.) Brand
JM2: Nemophila parviflora var. austiniae	Nemophila parviflora var. austiniae (Eastw.) Brand
JM1: Nemophila parviflora var. parviflora	Nemophila parviflora Benth. var. parviflora
JM1: Nemophila parviflora var. quercifolia	Nemophila parviflora var. quercifolia (Eastw.) H.P. Chandler
JM1: Nemophila pedunculata	Nemophila pedunculata Benth.
JM1: Nemophila pulchella	Nemophila pulchella Eastw.
JM1: Nemophila pulchella var. fremontii	Nemophila pulchella var. fremontii (Elmer) Constance
JM1: Nemophila pulchella var. gracilis	Nemophila pulchella var. gracilis (Eastw.) Constance
JM1: Nemophila pulchella var. pulchella	Nemophila pulchella Eastw. var. pulchella
JM1: Nemophila spatulata	Nemophila spatulata Coville
JM2: Neoholmgrenia andina	Neoholmgrenia andina (Nutt.) W.L. Wagner & Hoch
JMS: Neokochia americana	Kochia americana S. Watson
JMS: Neokochia californica	Kochia californica S. Watson
JMS: Neolloydia johnsonii	Sclerocactus johnsonii (Engelm.) N.P. Taylor
JM1: Neostapfia colusana	Neostapfia colusana (Burtt Davy) Burtt Davy
JM1: Nepeta cataria	Nepeta cataria L.
JM2: Nerium oleander	Nerium oleander L.
JM2: Nestotus stenophyllus	Nestotus stenophyllus (A. Gray) R.P. Roberts et al.
JM2: Neviusia cliftonii	Neviusia cliftonii Shevock et al.
JM1: Nicandra physalodes	Nicandra physalodes (L.) Gaertn.
JM1: Nicolletia occidentalis	Nicolletia occidentalis A. Gray
JM2: Nicotiana acuminata	Nicotiana acuminata (Graham) Hook.
JM1: Nicotiana acuminata var. multiflora	Nicotiana acuminata (Graham) Hook. var. multiflora (Phil.) Reiche
JM1: Nicotiana attenuata	Nicotiana attenuata S. Watson
JMS: Nicotiana bigelovii	Nicotiana quadrivalvis Pursh
JMS: Nicotiana bigelovii var. wallacei	Nicotiana quadrivalvis Pursh
JM1: Nicotiana clevelandii	Nicotiana clevelandii A. Gray
JM1: Nicotiana glauca	Nicotiana glauca Graham
JM1: Nicotiana obtusifolia	Nicotiana obtusifolia M. Martens & Galeotti
JM1: Nicotiana quadrivalvis	Nicotiana quadrivalvis Pursh
JMS: Nicotiana quadrivalvis var. bigelovii	Nicotiana quadrivalvis Pursh
JMS: Nicotiana quadrivalvis var. quadrivalvis	Nicotiana quadrivalvis Pursh
JM1: Nicotiana sylvestris	Nicotiana sylvestris Speg. & Comes
JM1: Nitrophila mohavensis	Nitrophila mohavensis Munz & J.C. Roos
JM1: Nitrophila occidentalis	Nitrophila occidentalis (Moq.) S. Watson
JM2: Noccaea fendleri	Noccaea fendleri (A. Gray) Holub
JM2: Noccaea fendleri subsp. californica	Noccaea fendleri subsp. californica (S. Watson) Al-Shehbaz & M. Koch
JM2: Noccaea fendleri subsp. glauca	Noccaea fendleri subsp. glauca (A. Nelson) Al-Shehbaz & M. Koch
JMS: Noccaea glauca	Noccaea fendleri subsp. glauca (A. Nelson) Al-Shehbaz & M. Koch
JM1: Nolina bigelovii	Nolina bigelovii (Torr.) S. Watson
JM2: Nolina cismontana	Nolina cismontana Dice
JM1: Nolina interrata	Nolina interrata Gentry
JM1: Nolina parryi	Nolina parryi S. Watson
JM1: Nothocalais alpestris	Nothocalais alpestris (A. Gray) K.L. Chambers
JM1: Nothocalais troximoides	Nothocalais troximoides (A. Gray) Greene
JM1: Nothochelone nemorosa	Nothochelone nemorosa (Lindl.) Straw
JM1: Notholaena californica	Notholaena californica D.C. Eaton
JM2: Notholithocarpus densiflorus	Notholithocarpus densiflorus (Hook. & Arn.) Manos et al.
JM2: Notholithocarpus densiflorus var. densiflorus	Notholithocarpus densiflorus (Hook. & Arn.) Manos et al. var. densiflorus
JM2: Notholithocarpus densiflorus var. echinoides	Notholithocarpus densiflorus var. echinoides (R. Br. ter) Manos et al.
JM2: Nothoscordum gracile	Nothoscordum gracile (Aiton) Stearn
JM1: Nothoscordum inodorum	Nothoscordum gracile (Aiton) Stearn
JMS: Nuphar lutea	Nuphar polysepala Engelm.
JM1: Nuphar lutea subsp. polysepala	Nuphar polysepala Engelm.
JM2: Nuphar polysepala	Nuphar polysepala Engelm.
JM2: Nuttallanthus texanus	Nuttallanthus texanus (Scheele) D.A. Sutton
JM1: Nymphaea mexicana	Nymphaea mexicana Zucc.
JM1: Nymphaea odorata	Nymphaea odorata Aiton
JM1: Nymphoides peltata	Nymphoides peltata (S.G. Gmel.) Kuntze
JMS: Obione bracteosa	Atriplex serenana Abrams
JMS: Obione confertifolia	Atriplex confertifolia (Torr. & Fr&eacute;m.) S. Watson
JMS: Obione cordulata	Atriplex cordulata Jeps.
JMS: Obione coulteri	Atriplex coulteri (Moq.) D. Dietr.
JMS: Obione elegans	Atriplex elegans (Moq.) D. Dietr.
JMS: Obione fruticulosa	Atriplex fruticulosa Jeps.
JMS: Obione glauca	Atriplex glauca L.
JMS: Obione hymenelytra	Atriplex hymenelytra (Torr.) S. Watson
JMS: Obione lentiformis	Atriplex lentiformis (Torr.) S. Watson
JMS: Obione leucophylla	Atriplex leucophylla (Moq.) D. Dietr.
JMS: Obione microcarpa	Atriplex pacifica A. Nelson
JMS: Obione parishii	Atriplex parishii S. Watson
JMS: Obione polycarpa	Atriplex polycarpa (Torr.) S. Watson
JMS: Obione pusilla	Atriplex pusilla (S. Watson) S. Watson
JMS: Obione radiata	Atriplex elegans (Moq.) D. Dietr.
JMS: Obione torreyi	Atriplex torreyi (S. Watson) S. Watson var. torreyi
JMS: Obione truncata	Atriplex truncata (S. Watson) A. Gray
JMS: Obione tularensis	Atriplex tularensis Coville
JM1: Odontostomum hartwegii	Odontostomum hartwegii Torr.
JM1: Oemleria cerasiformis	Oemleria cerasiformis (Hook. & Arn.) J.W. Landon
JM1: Oenanthe pimpinelloides	excluded (misidentification)
JM1: Oenanthe sarmentosa	Oenanthe sarmentosa DC.
JMS: Oenothera &times;erythrosepala	Oenothera glazioviana Micheli
JMS: Oenothera abramsii	Camissoniopsis pallida (Abrams) W.L. Wagner & Hoch subsp. pallida
JMS: Oenothera alyssoides	Eremothera boothii subsp. alyssoides (Hook. & Arn.) W.L. Wagner & Hoch
JMS: Oenothera andina	Neoholmgrenia andina (Nutt.) W.L. Wagner & Hoch
JMS: Oenothera arenaria	Chylismia arenaria A. Nelson
JMS: Oenothera avita	Oenothera californica subsp. avita W.M. Klein
JMS: Oenothera avita subsp. eurekensis	Oenothera californica subsp. eurekensis (Munz & J.C. Roos) W.M. Klein
JM1: Oenothera biennis	Oenothera biennis L.; Oenothera villosa Thunb. subsp. strigosa (Rydb.) W. Dietr. & P.H. Raven
JMS: Oenothera bistorta	Camissoniopsis bistorta (Torr. & A. Gray) W.L. Wagner & Hoch
JMS: Oenothera bistorta var. veitchiana	Camissoniopsis bistorta (Torr. & A. Gray) W.L. Wagner & Hoch
JMS: Oenothera boothii	Eremothera boothii (Douglas) W.L. Wagner & Hoch
JMS: Oenothera boothii subsp. condensata	Eremothera boothii subsp. condensata (Munz) W.L. Wagner & Hoch
JMS: Oenothera boothii subsp. decorticans	Eremothera boothii subsp. decorticans (Hook. & Arn.) W.L. Wagner & Hoch
JMS: Oenothera boothii subsp. desertorum	Eremothera boothii subsp. desertorum (Munz) W.L. Wagner & Hoch
JMS: Oenothera boothii subsp. intermedia	Eremothera boothii subsp. intermedia (Munz) W.L. Wagner & Hoch
JMS: Oenothera boothii subsp. inyoensis	Eremothera boothii subsp. desertorum (Munz) W.L. Wagner & Hoch
JMS: Oenothera boothii subsp. rutila	Eremothera boothii subsp. decorticans (Hook. & Arn.) W.L. Wagner & Hoch
JMS: Oenothera brevipes	Chylismia brevipes (A. Gray) Small
JMS: Oenothera brevipes subsp. arizonica	Chylismia brevipes subsp. arizonica (P.H. Raven) W.L. Wagner & Hoch
JMS: Oenothera brevipes subsp. pallidula	Chylismia brevipes subsp. pallidula (Munz) W.L. Wagner & Hoch
JM1: Oenothera caespitosa	Oenothera cespitosa Nutt.
JM1: Oenothera caespitosa subsp. crinita	Oenothera cespitosa subsp. crinita (Rydb.) Munz
JM1: Oenothera caespitosa subsp. marginata	Oenothera cespitosa subsp. marginata (Hook. & Arn.) Munz
JM1: Oenothera californica	Oenothera californica (S. Watson) S. Watson
JM1: Oenothera californica subsp. avita	Oenothera californica subsp. avita W.M. Klein
JM1: Oenothera californica subsp. californica	Oenothera californica (S. Watson) S. Watson subsp. californica
JM1: Oenothera californica subsp. eurekensis	Oenothera californica subsp. eurekensis (Munz & J.C. Roos) W.M. Klein
JMS: Oenothera californica var. glabrata	Oenothera californica (S. Watson) S. Watson subsp. californica
JMS: Oenothera cardiophylla	Chylismia cardiophylla (Torr.) Small
JMS: Oenothera cardiophylla subsp. robusta	Chylismia cardiophylla subsp. robusta (P.H. Raven) W.L. Wagner & Hoch
JM2: Oenothera cavernae	Oenothera cavernae Munz
JM2: Oenothera cespitosa	Oenothera cespitosa Nutt.
JM2: Oenothera cespitosa subsp. crinita	Oenothera cespitosa subsp. crinita (Rydb.) Munz
JM2: Oenothera cespitosa subsp. marginata	Oenothera cespitosa subsp. marginata (Hook. & Arn.) Munz
JMS: Oenothera cespitosa var. crinita	Oenothera cespitosa subsp. crinita (Rydb.) Munz
JMS: Oenothera cespitosa var. marginata	Oenothera cespitosa subsp. marginata (Hook. & Arn.) Munz
JMS: Oenothera chamaenerioides	Eremothera chamaenerioides (A. Gray) W.L. Wagner & Hoch
JMS: Oenothera cheiranthifolia	Camissoniopsis cheiranthifolia (Spreng.) W.L. Wagner & Hoch
JMS: Oenothera cheiranthifolia subsp. suffruticosa	Camissoniopsis cheiranthifolia subsp. suffruticosa (S. Watson) W.L. Wagner & Hoch
JMS: Oenothera cheiranthifolia var. nitida	Camissoniopsis cheiranthifolia (Spreng.) W.L. Wagner & Hoch
JMS: Oenothera claviformis	Chylismia claviformis (Torr. & Fr&eacute;m.) A. Heller
JMS: Oenothera claviformis subsp. aurantiaca	Chylismia claviformis subsp. aurantiaca (Munz) W.L. Wagner & Hoch
JMS: Oenothera claviformis subsp. citrina	Chylismia claviformis subsp. cruciformis (Kellogg) W.L. Wagner & Hoch
JMS: Oenothera claviformis subsp. cruciformis	Chylismia claviformis subsp. cruciformis (Kellogg) W.L. Wagner & Hoch
JMS: Oenothera claviformis subsp. funerea	Chylismia claviformis subsp. funerea (P.H. Raven) W.L. Wagner & Hoch
JMS: Oenothera claviformis subsp. integrior	Chylismia claviformis subsp. integrior (P.H. Raven) W.L. Wagner & Hoch
JMS: Oenothera claviformis subsp. lancifolia	Chylismia claviformis subsp. lancifolia (A. Heller) W.L. Wagner & Hoch
JMS: Oenothera claviformis subsp. peirsonii	Chylismia claviformis subsp. peirsonii (Munz) W.L. Wagner & Hoch
JMS: Oenothera claviformis subsp. yumae	Chylismia claviformis subsp. yumae (P.H. Raven) W.L. Wagner & Hoch
JMS: Oenothera contorta	Camissonia contorta (Douglas) Kearney; Camissonia parvula (Torr. & A. Gray) P.H. Raven; Camissonia pusilla P.H. Raven
JMS: Oenothera contorta var. flexuosa	Camissonia parvula (Torr. & A. Gray) P.H. Raven; Camissonia pusilla P.H. Raven
JMS: Oenothera cruciata	Camissonia contorta (Douglas) Kearney; Camissonia lacustris P.H. Raven
JM2: Oenothera curtiflora	Oenothera curtiflora W.L. Wagner & Hoch
JM1: Oenothera deltoides	Oenothera deltoides Torr. & Fr&eacute;m.
JM1: Oenothera deltoides subsp. cognata	Oenothera deltoides subsp. cognata (Jeps.) W.M. Klein
JM1: Oenothera deltoides subsp. deltoides	Oenothera deltoides Torr. & Fr&eacute;m. subsp. deltoides
JM1: Oenothera deltoides subsp. howellii	Oenothera deltoides subsp. howellii (Munz) W.M. Klein
JM1: Oenothera deltoides subsp. piperi	Oenothera deltoides subsp. piperi (Munz) W.M. Klein
JMS: Oenothera dentata	Camissonia lacustris P.H. Raven
JMS: Oenothera deserti	Eremothera refracta (S. Watson) W.L. Wagner & Hoch
JM1: Oenothera elata	Oenothera elata Kunth
JM1: Oenothera elata subsp. hirsutissima	Oenothera elata subsp. hirsutissima (S. Watson) W. Dietr.
JM1: Oenothera elata subsp. hookeri	Oenothera elata subsp. hookeri (Torr. & A. Gray) W. Dietr. & W.L. Wagner
JM1: Oenothera flava	Oenothera flava (A. Nelson) Garrett
JMS: Oenothera flava subsp. flava	Oenothera flava (A. Nelson) Garrett
JM1: Oenothera glazioviana	Oenothera glazioviana Micheli
JMS: Oenothera graciliflora	Tetrapteron graciliflorum (Hook. & Arn.) W.L. Wagner & Hoch
JMS: Oenothera guadalupensis	Camissoniopsis guadalupensis (S. Watson) W.L. Wagner & Hoch
JMS: Oenothera guadalupensis subsp. clementina	Camissoniopsis guadalupensis (S. Watson) W.L. Wagner & Hoch subsp. clementina (P.H. Raven) W.L. Wagner & Hoch
JMS: Oenothera hallii	Camissoniopsis pallida subsp. hallii (Davidson) W.L. Wagner & Hoch
JMS: Oenothera heterochroma	Chylismia heterochroma (S. Watson) Small
JMS: Oenothera heterochroma subsp. monoensis	Chylismia heterochroma (S. Watson) Small
JMS: Oenothera heterophylla	Camissoniopsis bistorta (Torr. & A. Gray) W.L. Wagner & Hoch
JMS: Oenothera hirta	Camissoniopsis intermedia (P.H. Raven) W.L. Wagner & Hoch; Camissoniopsis micrantha (Spreng.) W.L. Wagner & Hoch
JMS: Oenothera hirtella	Camissoniopsis hirtella (Greene) W.L. Wagner & Hoch
JMS: Oenothera hookeri	Oenothera villosa Thunb. subsp. strigosa (Rydb.) W. Dietr. & P.H. Raven; Oenothera villosa Thunb.; Oenothera elata Kunth; Oenothera wolfii (Munz) P.H. Raven et al.
JMS: Oenothera hookeri subsp. angustifolia	Oenothera elata subsp. hirsutissima (S. Watson) W. Dietr.
JMS: Oenothera hookeri subsp. grisea	Oenothera elata subsp. hirsutissima (S. Watson) W. Dietr.
JMS: Oenothera hookeri subsp. montereyensis	Oenothera elata subsp. hookeri (Torr. & A. Gray) W. Dietr. & W.L. Wagner
JMS: Oenothera hookeri subsp. venusta	Oenothera elata subsp. hirsutissima (S. Watson) W. Dietr.
JMS: Oenothera hookeri subsp. wolfii	Oenothera wolfii (Munz) P.H. Raven et al.
JMS: Oenothera ignota	Camissoniopsis confusa (P.H. Raven) W.L. Wagner & Hoch; Camissoniopsis ignota (Jeps.) W.L. Wagner & Hoch
JMS: Oenothera kernensis	Camissonia kernensis
JMS: Oenothera kernensis subsp. gilmanii	Camissonia kernensis subsp. gilmanii (Munz) P.H. Raven
JMS: Oenothera kernensis subsp. mojavensis	Camissonia kernensis subsp. gilmanii (Munz) P.H. Raven
JM1: Oenothera laciniata	Oenothera laciniata Hill
JMS: Oenothera laciniata subsp. pubescens	Oenothera pubescens Spreng.
JMS: Oenothera leptocarpa	Eulobus californicus Torr. & A. Gray
JM1: Oenothera longissima	Oenothera longissima Rydb.
JMS: Oenothera longissima subsp. clutei	Oenothera longissima Rydb.
JMS: Oenothera micrantha	Camissoniopsis intermedia (P.H. Raven) W.L. Wagner & Hoch; Camissoniopsis micrantha (Spreng.) W.L. Wagner & Hoch; Camissoniopsis ignota (Jeps.) W.L. Wagner & Hoch; Camissoniopsis luciae (P.H. Raven) W.L. Wagner & Hoch
JMS: Oenothera micrantha var. ignota	Camissoniopsis ignota (Jeps.) W.L. Wagner & Hoch
JMS: Oenothera micrantha var. jonesii	Camissoniopsis luciae (P.H. Raven) W.L. Wagner & Hoch
JMS: Oenothera minor	Eremothera minor (A. Nelson) W.L. Wagner & Hoch
JMS: Oenothera munzii	Chylismia munzii (P.H. Raven) W.L. Wagner & Hoch
JMS: Oenothera ovata	Taraxia ovata (Torr. & A. Gray) Small
JMS: Oenothera palmeri	Tetrapteron palmeri (S. Watson) W.L. Wagner & Hoch
JMS: Oenothera parvula	Camissonia parvula (Torr. & A. Gray) P.H. Raven
JM1: Oenothera primiveris	Oenothera primiveris A. Gray
JM1: Oenothera primiveris subsp. bufonis	Oenothera primiveris subsp. bufonis (M.E. Jones) Munz
JMS: Oenothera primiveris subsp. caulescens	Oenothera primiveris A. Gray subsp. primiveris
JM1: Oenothera primiveris subsp. primiveris	Oenothera primiveris A. Gray subsp. primiveris
JMS: Oenothera pterosperma	Chylismiella pterosperma (S. Watson) W.L. Wagner & Hoch
JMS: Oenothera pubens	Camissonia pubens (S. Watson) P.H. Raven
JM1: Oenothera pubescens	Oenothera pubescens Spreng.
JMS: Oenothera refracta	Eremothera refracta (S. Watson) W.L. Wagner & Hoch
JM1: Oenothera rosea	Oenothera rosea Aiton
JMS: Oenothera scapoidea	Chylismia walkeri A. Nelson
JMS: Oenothera scapoidea var. tortilis	Chylismia walkeri A. Nelson subsp. tortilis (Jeps.) W.L. Wagner & Hoch
JM2: Oenothera sinuosa	Oenothera sinuosa W.L. Wagner & Hoch
JM1: Oenothera speciosa	Oenothera speciosa Nutt.
JMS: Oenothera speciosa var. childsii	Oenothera speciosa Nutt.
JM2: Oenothera stricta	Oenothera stricta Link
JM1: Oenothera stricta subsp. stricta	Oenothera stricta Link subsp. stricta
JMS: Oenothera strigosa	Oenothera villosa Thunb. subsp. strigosa (Rydb.) W. Dietr. & P.H. Raven
JMS: Oenothera strigulosa	Camissonia contorta (Douglas) Kearney; Camissonia strigulosa (Fisch. & C.A. Mey.) P.H. Raven
JMS: Oenothera subacaulis	Taraxia subacaulis (Pursh) Rydb.
JMS: Oenothera subacaulis var. taraxacifolia	Taraxia subacaulis (Pursh) Rydb.
JM2: Oenothera suffrutescens	Oenothera suffrutescens (Ser.) W.L. Wagner & Hoch
JMS: Oenothera tanacetifolia	Taraxia tanacetifolia (Torr. & A. Gray) Piper
JM2: Oenothera villosa	Oenothera villosa Thunb.
JM1: Oenothera villosa subsp. strigosa	Oenothera villosa Thunb. subsp. strigosa (Rydb.) W. Dietr. & P.H. Raven
JMS: Oenothera walkeri	Chylismia walkeri A. Nelson
JMS: Oenothera walkeri subsp. tortilis	Chylismia walkeri A. Nelson subsp. tortilis (Jeps.) W.L. Wagner & Hoch
JM2: Oenothera wolfii	Oenothera wolfii (Munz) P.H. Raven et al.
JM2: Oenothera xenogaura	Oenothera xenogaura W.L. Wagner & Hoch
JM1: Oenothera xylocarpa	Oenothera xylocarpa Coville
JM1: Olea europaea	Olea europaea L.
JMS: Olea europaea subsp. africana	Olea europaea L.
JM1: Oligomeris linifolia	Oligomeris linifolia (Hornem.) J.F. Macbr.
JM1: Olneya tesota	Olneya tesota A. Gray
JM2: Olsynium douglasii	Olsynium douglasii (A. Dietr.) E.P. Bicknell
JM2: Olsynium douglasii var. douglasii	Olsynium douglasii (A. Dietr.) E.P. Bicknell var. douglasii
JM2: Oncosiphon piluliferum	Oncosiphon piluliferum (L. f.) K&auml;llersj&ouml;
JM1: Onobrychis viciifolia	Onobrychis viciifolia Scop.
JM2: Onopordum acanthium	Onopordum acanthium L.
JM1: Onopordum acanthium subsp. acanthium	Onopordum acanthium L. subsp. acanthium
JM1: Onopordum illyricum	Onopordum illyricum L.
JM1: Onopordum tauricum	Onopordum tauricum Willd.
JM1: Ophioglossum californicum	Ophioglossum californicum Prantl
JM1: Ophioglossum pusillum	Ophioglossum pusillum Raf.
JMS: Opuntia &times;fosbergii	Cylindropuntia &times;fosbergii (C.B. Wolf) Rebman et al.
JMS: Opuntia &times;munzii	Cylindropuntia munzii (C.B. Wolf) Backeb.
JM2: Opuntia &times;occidentalis	Opuntia &times;occidentalis Engelm. & J.M. Bigelow
JM2: Opuntia &times;vaseyi	Opuntia &times;vaseyi (J.M. Coult.) Britton & Rose
JMS: Opuntia acanthocarpa	Cylindropuntia ganderi (C.B. Wolf) Rebman & Pinkava; Cylindropuntia acanthocarpa (Engelm. & J.M. Bigelow) F.M. Knuth
JMS: Opuntia acanthocarpa subsp. ganderi	Cylindropuntia ganderi (C.B. Wolf) Rebman & Pinkava
JM1: Opuntia acanthocarpa var. coloradensis	Cylindropuntia acanthocarpa (Engelm. & J.M. Bigelow) F.M. Knuth var. coloradensis (L.D. Benson) Pinkava
JM1: Opuntia basilaris	Opuntia basilaris Engelm. & J.M. Bigelow
JM1: Opuntia basilaris var. basilaris	Opuntia basilaris Engelm. & J.M. Bigelow var. basilaris
JM1: Opuntia basilaris var. brachyclada	Opuntia basilaris var. brachyclada (Griffiths) Munz
JMS: Opuntia basilaris var. ramosa	Opuntia basilaris Engelm. & J.M. Bigelow var. basilaris
JM1: Opuntia basilaris var. treleasei	Opuntia basilaris var. treleasei (J.M. Coult.) Toumey
JMS: Opuntia bernardina	Cylindropuntia californica var. parkeri (J.M. Coult.) Pinkava
JM1: Opuntia bigelovii	Cylindropuntia bigelovii (Engelm.) F.M. Knuth
JMS: Opuntia bigelovii var. hoffmannii	Cylindropuntia &times;fosbergii (C.B. Wolf) Rebman et al.
JMS: Opuntia californica	Cylindropuntia californica
JMS: Opuntia californica var. parkeri	Cylindropuntia californica var. parkeri (J.M. Coult.) Pinkava
JM1: Opuntia chlorotica	Opuntia chlorotica Engelm. & J.M. Bigelow
JM1: Opuntia echinocarpa	Cylindropuntia echinocarpa (Engelm. & J.M. Bigelow) F.M. Knuth
JMS: Opuntia echinocarpa var. parkeri	Cylindropuntia californica var. parkeri (J.M. Coult.) Pinkava
JM2: Opuntia engelmannii	Opuntia engelmannii Engelm.
JM1: Opuntia engelmannii var. engelmannii	Opuntia engelmannii Engelm. var. engelmannii
JM1: Opuntia erinacea	Opuntia polyacantha
JM1: Opuntia erinacea var. erinacea	Opuntia polyacantha var. erinacea (Engelm. & J.M. Bigelow) B.D. Parfitt
JMS: Opuntia erinacea var. hystricina	Opuntia polyacantha var. hystricina (Engelm. & J.M. Bigelow) B.D. Parfitt
JM1: Opuntia erinacea var. utahensis	Opuntia polyacantha var. erinacea (Engelm. & J.M. Bigelow) B.D. Parfitt
JM1: Opuntia ficus-indica	Opuntia &times;occidentalis Engelm. & J.M. Bigelow; Opuntia ficus-indica (L.) Mill.
JMS: Opuntia fosbergii	Cylindropuntia &times;fosbergii (C.B. Wolf) Rebman et al.
JM1: Opuntia fragilis	Opuntia fragilis (Nutt.) Haw.
JMS: Opuntia ganderi	Cylindropuntia ganderi (C.B. Wolf) Rebman & Pinkava
JMS: Opuntia humistrata	Opuntia basilaris var. brachyclada (Griffiths) Munz
JM2: Opuntia leucotricha	Opuntia leucotricha DC.
JM1: Opuntia littoralis	Opuntia littoralis (Engelm.) Cockerell; Opuntia oricola Philbrick; Opuntia &times;vaseyi (J.M. Coult.) Britton & Rose; Opuntia phaeacantha Engelm.
JMS: Opuntia littoralis var. austrocalifornica	Opuntia &times;vaseyi (J.M. Coult.) Britton & Rose
JMS: Opuntia littoralis var. piercei	Opuntia phaeacantha Engelm.
JMS: Opuntia littoralis var. vaseyi	Opuntia &times;vaseyi (J.M. Coult.) Britton & Rose
JMS: Opuntia megacantha	Opuntia ficus-indica (L.) Mill.
JM2: Opuntia microdasys	Opuntia microdasys (Lehm.) Pfeiff.
JMS: Opuntia mojavensis	probably Opuntia phaeacantha Engelm.
JMS: Opuntia munzii	Cylindropuntia munzii (C.B. Wolf) Backeb.
JMS: Opuntia occidentalis	Opuntia littoralis (Engelm.) Cockerell
JMS: Opuntia occidentalis var. covillei	Opuntia &times;vaseyi (J.M. Coult.) Britton & Rose
JM1: Opuntia oricola	Opuntia oricola Philbrick
JM1: Opuntia parishii	Grusonia parishii (Orcutt) Pinkava
JM1: Opuntia parryi	Cylindropuntia californica var. parkeri (J.M. Coult.) Pinkava; Cylindropuntia californica (Torr. & A. Gray) F.M. Knuth
JMS: Opuntia parryi var. parryi	Cylindropuntia californica var. parkeri (J.M. Coult.) Pinkava
JMS: Opuntia parryi var. serpentina	Cylindropuntia californica (Torr. & A. Gray) F.M. Knuth var. californica
JM1: Opuntia phaeacantha	Opuntia engelmannii Engelm.; Opuntia phaeacantha Engelm.
JMS: Opuntia phaeacantha var. discata	Opuntia engelmannii Engelm. var. engelmannii
JMS: Opuntia phaeacantha var. major	Opuntia phaeacantha Engelm.
JM2: Opuntia polyacantha	Opuntia polyacantha Haw.
JM2: Opuntia polyacantha var. erinacea	Opuntia polyacantha var. erinacea (Engelm. & J.M. Bigelow) B.D. Parfitt
JM2: Opuntia polyacantha var. hystricina	Opuntia polyacantha var. hystricina (Engelm. & J.M. Bigelow) B.D. Parfitt
JMS: Opuntia polyacantha var. rufispina	Opuntia polyacantha var. erinacea (Engelm. & J.M. Bigelow) B.D. Parfitt
JM1: Opuntia prolifera	Cylindropuntia prolifera (Engelm.) F.M. Knuth
JM1: Opuntia pulchella	Grusonia pulchella (Engelm.) H. Rob.
JM1: Opuntia ramosissima	Cylindropuntia ramosissima (Engelm.) F.M. Knuth
JM2: Opuntia robusta	Opuntia robusta Pfeiff.
JMS: Opuntia semispinosa	Opuntia littoralis (Engelm.) Cockerell
JMS: Opuntia serpentina	Cylindropuntia californica (Torr. & A. Gray) F.M. Knuth var. californica
JMS: Opuntia stanlyi	Grusonia parishii (Orcutt) Pinkava
JMS: Opuntia treleasei	Opuntia basilaris var. treleasei (J.M. Coult.) Toumey
JMS: Opuntia ursina	Opuntia polyacantha var. erinacea (Engelm. & J.M. Bigelow) B.D. Parfitt
JMS: Opuntia whitneyana	Opuntia basilaris Engelm. & J.M. Bigelow var. basilaris
JMS: Opuntia wigginsii	Cylindropuntia echinocarpa (Engelm. & J.M. Bigelow) F.M. Knuth
JM1: Opuntia wolfii	Cylindropuntia wolfii (L.D. Benson) M.A. Baker
JM1: Orcuttia californica	Orcuttia californica Vasey; Orcuttia inaequalis Hoover; Orcuttia viscida (Hoover) Reeder
JMS: Orcuttia californica var. ineaqualis	Orcuttia inaequalis Hoover
JMS: Orcuttia californica var. viscida	Orcuttia viscida (Hoover) Reeder
JMS: Orcuttia greenei	Tuctoria greenei (Vasey) Reeder
JM1: Orcuttia inaequalis	Orcuttia inaequalis Hoover
JMS: Orcuttia mucronata	Tuctoria mucronata (Crampton) Reeder
JM1: Orcuttia pilosa	Orcuttia pilosa Hoover
JM1: Orcuttia tenuis	Orcuttia tenuis Hitchc.
JM1: Orcuttia viscida	Orcuttia viscida (Hoover) Reeder
JM1: Oreonana clementis	Oreonana clementis (M.E. Jones) Jeps.
JM1: Oreonana purpurascens	Oreonana purpurascens Shevock & Constance
JM1: Oreonana vestita	Oreonana vestita (S. Watson) Jeps.
JM2: Oreostemma alpigenum	Oreostemma alpigenum (Torr. & A. Gray) Greene
JM2: Oreostemma alpigenum var. andersonii	Oreostemma alpigenum (Torr. & A. Gray) Greene var. andersonii (A. Gray) G.L. Nesom
JM2: Oreostemma elatum	Oreostemma elatum (Greene) Greene
JM2: Oreostemma peirsonii	Oreostemma peirsonii (Sharsm.) G.L. Nesom
JM2: Origanum &times;majoricum	Origanum &times;majoricum Cambess.
JM1: Origanum vulgare	Origanum vulgare subsp. hirtum (Link) Ietsw.
JM2: Origanum vulgare subsp. hirtum	Origanum vulgare L. subsp. hirtum (Link) Ietsw.
JM1: Ornithopus pinnatus	Ornithopus pinnatus (Mill.) Druce
JM1: Ornithopus sativus	Ornithopus sativus Brot.
JM1: Ornithostaphylos oppositifolia	Ornithostaphylos oppositifolia (Parry) Small
JM1: Orobanche bulbosa	Orobanche bulbosa Beck
JM1: Orobanche californica	Orobanche californica Cham. & Schltdl.; Orobanche parishii (Jeps.) Heckard; Orobanche vallicola (Jeps.) Heckard; Orobanche corymbosa (Rydb.) Ferris
JM1: Orobanche californica subsp. californica	Orobanche californica Cham. & Schltdl. subsp. californica
JM2: Orobanche californica subsp. condensa	Orobanche californica subsp. condensa Heckard
JM1: Orobanche californica subsp. feudgei	Orobanche californica subsp. feudgei (Munz) Heckard
JM1: Orobanche californica subsp. grandis	Orobanche californica subsp. grandis Heckard
JM1: Orobanche californica subsp. grayana	Orobanche californica subsp. grayana (Beck) Heckard
JM1: Orobanche californica subsp. jepsonii	Orobanche californica subsp. jepsonii (Munz) Heckard
JMS: Orobanche californica var. californica	Orobanche vallicola (Jeps.) Heckard
JMS: Orobanche californica var. claremontensis	Orobanche vallicola (Jeps.) Heckard
JMS: Orobanche californica var. corymbosa	Orobanche corymbosa (Rydb.) Ferris
JMS: Orobanche californica var. parishii	Orobanche parishii (Jeps.) Heckard subsp. parishii
JM1: Orobanche cooperi	Orobanche cooperi (A. Gray) A. Heller
JM1: Orobanche corymbosa	Orobanche corymbosa (Rydb.) Ferris
JM1: Orobanche fasciculata	Orobanche fasciculata Nutt.
JMS: Orobanche fasciculata var. franciscana	Orobanche fasciculata Nutt.
JMS: Orobanche fasciculata var. lutea	Orobanche fasciculata Nutt.
JMS: Orobanche grayana	Orobanche californica Cham. & Schltdl.
JMS: Orobanche grayana var. feudgei	Orobanche californica subsp. feudgei (Munz) Heckard
JMS: Orobanche grayana var. grayana	Orobanche californica subsp. grayana (Beck) Heckard
JMS: Orobanche grayana var. jepsonii	Orobanche californica subsp. jepsonii (Munz) Heckard
JMS: Orobanche grayana var. nelsonii	Orobanche californica Cham. & Schltdl. subsp. californica
JMS: Orobanche grayana var. violacea	Orobanche californica Cham. & Schltdl. subsp. californica
JMS: Orobanche ludoviciana	Orobanche cooperi (A. Gray) A. Heller
JMS: Orobanche ludoviciana var. cooperi	Orobanche cooperi (A. Gray) A. Heller
JMS: Orobanche ludoviciana var. latiloba	Orobanche cooperi (A. Gray) A. Heller
JM1: Orobanche parishii	Orobanche parishii (Jeps.) Heckard
JM1: Orobanche parishii subsp. brachyloba	Orobanche parishii subsp. brachyloba Heckard
JM1: Orobanche parishii subsp. parishii	Orobanche parishii (Jeps.) Heckard subsp. parishii
JM1: Orobanche pinorum	Orobanche pinorum Hook.
JM1: Orobanche ramosa	Orobanche ramosa L.
JM1: Orobanche uniflora	Orobanche uniflora L.
JMS: Orobanche uniflora subsp. occidentalis	Orobanche uniflora L.
JMS: Orobanche uniflora var. minuta	Orobanche uniflora L.
JMS: Orobanche uniflora var. sedi	Orobanche uniflora L.
JM1: Orobanche valida	Orobanche valida Jeps.
JM1: Orobanche valida subsp. howellii	Orobanche valida subsp. howellii Heckard & L.T. Collins
JM1: Orobanche valida subsp. valida	Orobanche valida Jeps. subsp. valida
JM1: Orobanche vallicola	Orobanche vallicola (Jeps.) Heckard
JM1: Orochaenactis thysanocarpha	Orochaenactis thysanocarpha (A. Gray) Coville
JM1: Orogenia fusiformis	Orogenia fusiformis S. Watson
JM1: Orthilia secunda	Orthilia secunda (L.) House
JMS: Orthocarpus attenuatus	Castilleja attenuata (A. Gray) T.I. Chuang & Heckard
JMS: Orthocarpus bidwelliae	Triphysaria micrantha (A. Heller) T.I. Chuang & Heckard
JMS: Orthocarpus bidwelliae var. micranthus	Triphysaria micrantha (A. Heller) T.I. Chuang & Heckard
JM1: Orthocarpus bracteosus	Orthocarpus bracteosus Benth.
JMS: Orthocarpus campestris	Castilleja campestris (Benth.) T.I. Chuang & Heckard
JMS: Orthocarpus campestris var. succulentus	Castilleja campestris subsp. succulenta (Hoover) T.I. Chuang & Heckard
JMS: Orthocarpus castillejoides	Castilleja ambigua Hook. & Arn.
JMS: Orthocarpus castillejoides var. humboldtiensis	Castilleja ambigua subsp. humboldtiensis (D.D. Keck) T.I. Chuang & Heckard
JMS: Orthocarpus castillejoides var. insalutatus	Castilleja ambigua subsp. insalutata (Jeps.) T.I. Chuang & Heckard
JMS: Orthocarpus copelandii	Orthocarpus cuspidatus subsp. copelandii (Eastw.) T.I. Chuang & Heckard
JMS: Orthocarpus copelandii var. cryptanthus	Orthocarpus cuspidatus subsp. cryptanthus (Piper) T.I. Chuang & Heckard
JM1: Orthocarpus cuspidatus	Orthocarpus cuspidatus Greene
JM1: Orthocarpus cuspidatus subsp. copelandii	Orthocarpus cuspidatus subsp. copelandii (Eastw.) T.I. Chuang & Heckard
JM1: Orthocarpus cuspidatus subsp. cryptanthus	Orthocarpus cuspidatus subsp. cryptanthus (Piper) T.I. Chuang & Heckard
JM1: Orthocarpus cuspidatus subsp. cuspidatus	Orthocarpus cuspidatus Greene subsp. cuspidatus
JMS: Orthocarpus densiflora	Castilleja densiflora (Benth.) T.I. Chuang & Heckard
JMS: Orthocarpus densiflorus var. gracilis	Castilleja densiflora subsp. gracilis (Benth.) T.I. Chuang & Heckard
JMS: Orthocarpus densiflorus var. obispoensis	Castilleja densiflora subsp. obispoensis (D.D. Keck) T.I. Chuang & Heckard
JMS: Orthocarpus erianthus	Triphysaria eriantha (Benth.) T.I. Chuang & Heckard; Triphysaria micrantha (A. Heller) T.I. Chuang & Heckard
JMS: Orthocarpus erianthus var. gratiosus	Triphysaria eriantha (Benth.) T.I. Chuang & Heckard subsp. eriantha
JMS: Orthocarpus erianthus var. micranthus	Triphysaria micrantha (A. Heller) T.I. Chuang & Heckard
JMS: Orthocarpus erianthus var. roseus	Triphysaria eriantha subsp. rosea (A. Gray) T.I. Chuang & Heckard
JMS: Orthocarpus faucibarbatus	Triphysaria versicolor Fisch. & C.A. Mey.; Triphysaria versicolor subsp. faucibarbata (A. Gray) T.I. Chuang & Heckard
JMS: Orthocarpus faucibarbatus subsp. albidus	Triphysaria versicolor Fisch. & C.A. Mey. subsp. versicolor
JMS: Orthocarpus floribundus	Triphysaria floribunda (Benth.) T.I. Chuang & Heckard
JMS: Orthocarpus hispidus	Castilleja tenuis (A. Heller) T.I. Chuang & Heckard
JM1: Orthocarpus imbricatus	Orthocarpus imbricatus S. Watson
JMS: Orthocarpus lacerus	Castilleja lacera (Benth.) T.I. Chuang & Heckard
JMS: Orthocarpus lasiorhynchus	Castilleja lasiorhyncha (A. Gray) T.I. Chuang & Heckard
JMS: Orthocarpus linearilobus	Castilleja lineariloba (Benth.) T.I. Chuang & Heckard
JMS: Orthocarpus lithospermoides	Castilleja rubicundula (Jeps.) T.I. Chuang & Heckard
JMS: Orthocarpus lithospermoides var. bicolor	Castilleja rubicundula (Jeps.) T.I. Chuang & Heckard subsp. rubicundula
JMS: Orthocarpus lithospermoides var. lithospermoides	Castilleja rubicundula subsp. lithospermoides (Benth.) T.I. Chuang & Heckard
JM1: Orthocarpus luteus	Orthocarpus luteus Nutt.
JMS: Orthocarpus micranthus	Triphysaria micrantha (A. Heller) T.I. Chuang & Heckard
JM1: Orthocarpus pachystachyus	Orthocarpus pachystachyus A. Gray
JMS: Orthocarpus purpurascens	Castilleja exserta (A. Heller) T.I. Chuang & Heckard
JMS: Orthocarpus purpurascens var. latifolius	Castilleja exserta subsp. latifolia (S. Watson) T.I. Chuang & Heckard
JMS: Orthocarpus purpurascens var. ornatus	Castilleja exserta subsp. venusta (A. Heller) T.I. Chuang & Heckard
JMS: Orthocarpus purpurascens var. pallidus	Castilleja exserta (A. Heller) T.I. Chuang & Heckard subsp. exserta
JMS: Orthocarpus pusillus	Triphysaria pusilla (Benth.) T.I. Chuang & Heckard
JM1: Oryctes nevadensis	Oryctes nevadensis S. Watson
JM1: Oryza sativa	Oryza sativa L.
JMS: Oryzopsis exigua	Stipa exigua (Thurb.) Columbus & J.P. Sm.
JMS: Oryzopsis hymenoides	Stipa hymenoides Roem. & Schult.
JMS: Oryzopsis kingii	Stipa kingii Bol.
JMS: Oryzopsis micrantha	Stipa divaricata Columbus & J.P. Sm.
JMS: Oryzopsis miliacea	Stipa miliacea (L.) Hoover var. miliacea
JMS: Oryzopsis webberi	Stipa webberi (Thurb.) B.L. Johnson
JM1: Osmadenia tenella	Osmadenia tenella Nutt.
JM2: Osmorhiza berteroi	Osmorhiza berteroi DC.
JM1: Osmorhiza brachypoda	Osmorhiza brachypoda Torr.
JM1: Osmorhiza chilensis	Osmorhiza berteroi DC.
JM1: Osmorhiza depauperata	Osmorhiza depauperata Phil.
JM1: Osmorhiza occidentalis	Osmorhiza occidentalis (Nutt.) Torr.
JM1: Osmorhiza purpurea	Osmorhiza purpurea (J.M. Coult. & Rose) Suksd.
JM1: Osteospermum ecklonis	Dimorphotheca ecklonis DC.
JMS: Osteospermum fruticosum	Dimorphotheca fruticosa (L.) DC.
JM1: Ottelia alismoides	Ottelia alismoides (L.) Pers.
JM1: Oxalis albicans	Oxalis californica (Abrams) R. Knuth; Oxalis pilosa Nutt.
JM1: Oxalis albicans subsp. californica	Oxalis californica (Abrams) R. Knuth
JM1: Oxalis albicans subsp. pilosa	Oxalis pilosa Nutt.
JM2: Oxalis articulata	Oxalis articulata Savigny
JM2: Oxalis articulata subsp. rubra	Oxalis articulata Savigny subsp. rubra (A. St.-Hil.) Lourteig
JM2: Oxalis bowiei	Oxalis bowiei G. Don
JM2: Oxalis californica	Oxalis californica (Abrams) R. Knuth
JM1: Oxalis corniculata	Oxalis corniculata L.
JMS: Oxalis corniculata subsp. pilosa	Oxalis pilosa Nutt.
JMS: Oxalis corniculata var. wrightii	Oxalis pilosa Nutt.
JM1: Oxalis hirta	excluded
JM1: Oxalis incarnata	Oxalis incarnata L.
JM1: Oxalis latifolia	excluded
JM1: Oxalis laxa	Oxalis micrantha Colla
JM2: Oxalis micrantha	Oxalis micrantha Colla
JM1: Oxalis oregana	Oxalis oregana Nutt.
JM1: Oxalis pes-caprae	Oxalis pes-caprae L.
JM2: Oxalis pilosa	Oxalis pilosa Nutt.
JM1: Oxalis purpurea	Oxalis purpurea L.
JM1: Oxalis rubra	Oxalis articulata Savigny subsp. rubra (A. St.-Hil.) Lourteig
JM1: Oxalis suksdorfii	Oxalis suksdorfii Trel.
JM1: Oxalis trilliifolia	Oxalis trilliifolia Hook.
JMS: Oxybaphus laevis	Mirabilis laevis (Benth.) Curran
JM1: Oxypolis occidentalis	Oxypolis occidentalis J.M. Coult. & Rose
JM1: Oxyria digyna	Oxyria digyna (L.) Hill
JM1: Oxystylis lutea	Oxystylis lutea Torr. & Fr&eacute;m.
JMS: Oxytenia acerosa	Euphrosyne acerosa (Nutt.) Panero
JM1: Oxytheca caryophylloides	Sidotheca caryophylloides (Parry) Reveal
JM2: Oxytheca dendroidea	Oxytheca dendroidea Nutt.
JM1: Oxytheca dendroidea subsp. dendroidea	Oxytheca dendroidea Nutt. subsp. dendroidea
JM1: Oxytheca emarginata	Sidotheca emarginata (H.M. Hall) Reveal
JM1: Oxytheca parishii	Acanthoscyphus parishii (Parry) Small
JM1: Oxytheca parishii var. abramsii	Acanthoscyphus parishii var. abramsii (E.A. McGregor) Reveal
JM1: Oxytheca parishii var. cienegensis	Acanthoscyphus parishii var. cienegensis (Ertter) Reveal
JM1: Oxytheca parishii var. goodmaniana	Acanthoscyphus parishii var. goodmaniana (Ertter) Reveal
JM1: Oxytheca parishii var. parishii	Acanthoscyphus parishii var. goodmaniana (Ertter) Reveal
JM1: Oxytheca perfoliata	Oxytheca perfoliata Torr. & A. Gray
JM1: Oxytheca trilobata	Sidotheca trilobata (A. Gray) Reveal
JM1: Oxytheca watsonii	Oxytheca watsonii Torr. & A. Gray
JM2: Oxytropis borealis	Oxytropis borealis DC.
JM2: Oxytropis borealis var. australis	Oxytropis borealis DC. var. australis S.L. Welsh
JM1: Oxytropis borealis var. viscida	Oxytropis borealis var. viscida (Nutt.) S.L. Welsh
JM2: Oxytropis deflexa	Oxytropis deflexa (Pall.) DC.
JM1: Oxytropis deflexa var. sericea	Oxytropis deflexa (Pall.) DC. var. sericea Torr. & A. Gray
JM1: Oxytropis oreophila	Oxytropis oreophila A. Gray
JM2: Oxytropis oreophila var. oreophila	Oxytropis oreophila A. Gray var. oreophila
JM1: Oxytropis parryi	Oxytropis parryi A. Gray
JM2: Ozomelis diversifolia	Ozomelis diversifolia (Greene) Rydb.
JM2: Ozomelis trifida	Ozomelis trifida (Graham) Rydb.
JM2: Packera bernardina	Packera bernardina (Greene) W.A. Weber & &Aacute;. L&ouml;ve
JM2: Packera bolanderi	Packera bolanderi (A. Gray) W.A. Weber & &Aacute;. L&ouml;ve
JM2: Packera bolanderi var. bolanderi	Packera bolanderi (A. Gray) W.A. Weber & &Aacute;. L&ouml;ve var. bolanderi
JM2: Packera breweri	Packera breweri (Burtt Davy) W.A. Weber & &Aacute;. L&ouml;ve
JM2: Packera cana	Packera cana (Hook.) W.A. Weber & &Aacute;. L&ouml;ve
JM2: Packera clevelandii	Packera clevelandii (Greene) W.A. Weber & &Aacute;. L&ouml;ve
JM2: Packera eurycephala	Packera eurycephala (Torr. & A. Gray) W.A. Weber & &Aacute;. L&ouml;ve
JM2: Packera eurycephala var. eurycephala	Packera eurycephala (Torr. & A. Gray) W.A. Weber & &Aacute;. L&ouml;ve var. eurycephala
JM2: Packera eurycephala var. lewisrosei	Packera eurycephala var. lewisrosei (J.T. Howell) J.F. Bain
JM2: Packera ganderi	Packera ganderi (T.M. Barkley & R.M. Beauch.) W.A. Weber & &Aacute;. L&ouml;ve
JM2: Packera greenei	Packera greenei (A. Gray) W.A. Weber & &Aacute;. L&ouml;ve
JM2: Packera hesperia	Packera hesperia (Greene) W.A. Weber & &Aacute;. L&ouml;ve
JM2: Packera indecora	Packera indecora (Greene) &Aacute;. L&ouml;ve & D. L&ouml;ve
JM2: Packera ionophylla	Packera ionophylla (Greene) W.A. Weber & &Aacute;. L&ouml;ve
JM2: Packera layneae	Packera layneae (Greene) W.A. Weber & &Aacute;. L&ouml;ve
JM2: Packera macounii	Packera macounii (Greene) W.A. Weber & &Aacute;. L&ouml;ve
JM2: Packera multilobata	Packera multilobata (Torr. & A. Gray) W.A. Weber & &Aacute;. L&ouml;ve
JM2: Packera pauciflora	Packera pauciflora (Pursh) &Aacute;. L&ouml;ve & D. L&ouml;ve
JM2: Packera pseudaurea	Packera pseudaurea (Rydb.) W.A. Weber & &Aacute;. L&ouml;ve
JM2: Packera pseudaurea var. pseudaurea	Packera pseudaurea (Rydb.) W.A. Weber & &Aacute;. L&ouml;ve var. pseudaurea
JM2: Packera streptanthifolia	Packera streptanthifolia (Greene) W.A. Weber & &Aacute;. L&ouml;ve
JM2: Packera streptanthifolia var. streptanthifolia	Packera streptanthifolia (Greene) W.A. Weber & &Aacute;. L&ouml;ve var. streptanthifolia
JM2: Packera subnuda	Packera subnuda (DC.) Trock & T.M. Barkley
JM2: Packera subnuda var. subnuda	Packera subnuda (DC.) Trock & T.M. Barkley var. subnuda
JM2: Packera werneriifolia	Packera werneriifolia (A. Gray) W.A. Weber & &Aacute;. L&ouml;ve
JM1: Paeonia brownii	Paeonia brownii Douglas
JM1: Paeonia californica	Paeonia californica Nutt.
JM1: Palafoxia arida	Palafoxia arida B.L. Turner & M.I. Morris
JM1: Palafoxia arida var. arida	Palafoxia arida B.L. Turner & M.I. Morris var. arida
JM1: Palafoxia arida var. gigantea	Palafoxia arida var. gigantea (M.E. Jones) B.L. Turner & M.I. Morris
JM2: Pancratium maritimum	Pancratium maritimum L.
JM1: Panicum acuminatum	Panicum acuminatum Sw.
JM1: Panicum acuminatum var. acuminatum	Panicum acuminatum Sw.
JM2: Panicum acuminatum var. fasciculatum	Panicum acuminatum var. fasciculatum (Torr.) Lelong
JM1: Panicum acuminatum var. lindheimeri	Panicum acuminatum var. lindheimeri (Nash) Beetle
JM2: Panicum acuminatum var. thermale	Panicum acuminatum var. thermale (Bol.) Wipff
JM1: Panicum antidotale	Panicum antidotale Retz.
JM1: Panicum capillare	Panicum capillare L.
JMS: Panicum capillare subsp. hillmanii	Panicum hillmanii Chase
JM1: Panicum dichotomiflorum	Panicum dichotomiflorum Michx.
JM2: Panicum dichotomiflorum subsp. dichotomiflorum	Panicum dichotomiflorum Michx. subsp. dichotomiflorum
JM1: Panicum hillmanii	Panicum hillmanii Chase
JM1: Panicum hirticaule	Panicum hirticaule J. Presl
JM2: Panicum hirticaule subsp. hirticaule	Panicum hirticaule J. Presl subsp. hirticaule
JMS: Panicum huachucae	Panicum acuminatum var. fasciculatum (Torr.) Lelong
JMS: Panicum lassenianum	Panicum acuminatum var. thermale (Bol.) Wipff
JMS: Panicum lindheimeri	Panicum acuminatum var. lindheimeri (Nash) Beetle
JM1: Panicum maximum	excluded (without mention)
JM1: Panicum miliaceum	Panicum miliaceum L.
JM2: Panicum miliaceum subsp. miliaceum	Panicum miliaceum L. subsp. miliaceum
JMS: Panicum occidentale	Panicum acuminatum var. fasciculatum (Torr.) Lelong
JM2: Panicum oligosanthes	Panicum oligosanthes Schult.
JM1: Panicum oligosanthes var. scribnerianum	Panicum oligosanthes Schult. var. scribnerianum (Nash) Fernald
JMS: Panicum pacificum	Panicum acuminatum var. fasciculatum (Torr.) Lelong
JM2: Panicum rigidulum	Panicum rigidulum Nees
JM2: Panicum rigidulum subsp. rigidulum	Panicum rigidulum Nees subsp. rigidulum
JMS: Panicum scribnerianum	Panicum oligosanthes Schult. var. scribnerianum (Nash) Fernald
JMS: Panicum thermale	Panicum acuminatum var. thermale (Bol.) Wipff
JM1: Panicum urvilleanum	Panicum urvilleanum Kunth
JMS: Papaver apulum	Papaver hybridum L.
JMS: Papaver apulum var. micranthum	Papaver hybridum L.
JM1: Papaver argemone	Papaver argemone L.
JM1: Papaver californicum	Papaver californicum A. Gray
JM2: Papaver heterophyllum	Papaver heterophyllum (Benth.) Greene
JM2: Papaver hybridum	Papaver hybridum L.
JM1: Papaver rhoeas	Papaver rhoeas L.
JM1: Papaver somniferum	Papaver somniferum L.
JMS: Pappostipa speciosa	Stipa speciosa Trin. & Rupr.
JM1: Parapholis incurva	Parapholis incurva (L.) C.E. Hubb.
JM1: Parapholis strigosa	Parapholis strigosa (Dumort.) C.E. Hubb.
JMS: Paraserianthes lophantha	Albizia lophantha (Willd.) Benth.
JM1: Parentucellia latifolia	Parentucellia latifolia (L.) Caruel
JM1: Parentucellia viscosa	Parentucellia viscosa (L.) Caruel
JM1: Parietaria hespera	Parietaria hespera Hinton
JM1: Parietaria hespera var. californica	Parietaria hespera var. californica Hinton
JM1: Parietaria hespera var. hespera	Parietaria hespera Hinton var. hespera
JM1: Parietaria judaica	Parietaria judaica L.
JM1: Parietaria pensylvanica	Parietaria pensylvanica Willd.
JM1: Parishella californica	Nemacladus californicus (A. Gray) Morin
JM1: Parkinsonia aculeata	Parkinsonia aculeata L.
JM2: Parkinsonia florida	Parkinsonia florida (A. Gray) S. Watson
JM2: Parkinsonia microphylla	Parkinsonia microphylla Torr.
JM1: Parnassia californica	Parnassia palustris L.
JM1: Parnassia cirrata	Parnassia cirrata Piper
JM2: Parnassia cirrata var. cirrata	Parnassia cirrata Piper var. cirrata
JM2: Parnassia cirrata var. intermedia	Parnassia cirrata var. intermedia (Rydb.) P.K. Holmgren & N.H. Holmgren
JM1: Parnassia fimbriata	Parnassia fimbriata K.D. Koenig
JM2: Parnassia palustris	Parnassia palustris L.
JMS: Parnassia palustris var. parviflora	Parnassia parviflora DC.
JM1: Parnassia parviflora	Parnassia parviflora DC.
JM1: Paronychia ahartii	Paronychia ahartii Ertter
JM2: Paronychia echinulata	Paronychia echinulata Chater
JM1: Paronychia echinulata var. echinulata	Paronychia echinulata Chater var. echinulata
JM1: Paronychia franciscana	Paronychia franciscana Eastw.
JMS: Parrya menziesii	Phoenicaulis cheiranthoides Nutt.
JMS: Parrya menziesii var. glabra	Phoenicaulis cheiranthoides Nutt.
JM1: Parthenocissus vitacea	Parthenocissus inserta (A. Kern) Fritsch
JM1: Parvisedum congdonii	Sedella pumila (Benth.) Britton & Rose
JM1: Parvisedum leiocarpum	Sedella leiocarpa H. Sharsm.
JM1: Parvisedum pentandrum	Sedella pentandra H. Sharsm.
JM1: Parvisedum pumilum	Sedella pumila (Benth.) Britton & Rose
JM1: Pascopyrum smithii	Elymus smithii (Rydb.) Gould
JM1: Paspalum dilatatum	Paspalum dilatatum Poir.
JM1: Paspalum distichum	Paspalum distichum L.
JMS: Paspalum distichum var. indutum	Paspalum distichum L.
JM1: Paspalum notatum	excluded
JMS: Paspalum paspalodes	Paspalum distichum L.
JM1: Paspalum urvillei	Paspalum urvillei Steud.
JM2: Paspalum vaginatum	Paspalum vaginatum Sw.
JM2: Passiflora caerulea	Passiflora caerulea L.
JMS: Passiflora mollissima	Passiflora tarminiana Coppens & V.E. Barney
JM2: Passiflora tarminiana	Passiflora tarminiana Coppens & V.E. Barney
JM1: Pastinaca sativa	Pastinaca sativa L.
JM1: Paxistima myrsinites	Paxistima myrsinites (Pursh) Raf.
JM2: Pectiantia breweri	Pectiantia breweri (A. Gray) Rydb.
JM2: Pectiantia ovalis	Pectiantia ovalis (Greene) Rydb.
JM2: Pectiantia pentandra	Pectiantia pentandra (Hook.) Rydb.
JM2: Pectis papposa	Pectis papposa Harv. & A. Gray
JM1: Pectis papposa var. papposa	Pectis papposa Harv. & A. Gray var. papposa
JM1: Pectocarya heterocarpa	Pectocarya heterocarpa (I.M. Johnst.) I.M. Johnst.
JM2: Pectocarya linearis	Pectocarya linearis (Ruiz & Pav.) DC.
JM1: Pectocarya linearis subsp. ferocula	Pectocarya linearis (Ruiz & Pav.) DC. subsp. ferocula (I.M. Johnst.) Thorne
JM1: Pectocarya penicillata	Pectocarya penicillata (Hook. & Arn.) A. DC.
JM1: Pectocarya peninsularis	Pectocarya peninsularis I.M. Johnst.
JM1: Pectocarya platycarpa	Pectocarya platycarpa (Munz & I.M. Johnst.) Munz & I.M. Johnst.
JM1: Pectocarya pusilla	Pectocarya pusilla (A. DC.) A. Gray
JM1: Pectocarya recurvata	Pectocarya recurvata I.M. Johnst.
JM1: Pectocarya setosa	Pectocarya setosa A. Gray
JM1: Pedicularis attollens	Pedicularis attollens A. Gray
JMS: Pedicularis aurantiaca	Pedicularis densiflora Hook.
JM2: Pedicularis bracteosa	Pedicularis bracteosa Benth.
JM1: Pedicularis bracteosa var. flavida	Pedicularis bracteosa Benth. var. flavida (Pennell) Cronquist
JM1: Pedicularis centranthera	Pedicularis centranthera A. Gray
JM1: Pedicularis contorta	Pedicularis contorta Benth.
JM1: Pedicularis crenulata	Pedicularis crenulata Benth.
JMS: Pedicularis crenulata f. candida	Pedicularis crenulata Benth.
JM1: Pedicularis densiflora	Pedicularis densiflora Hook.
JMS: Pedicularis densiflora subsp. aurantiaca	Pedicularis densiflora Hook.
JM1: Pedicularis dudleyi	Pedicularis dudleyi Elmer
JMS: Pedicularis flavida	Pedicularis bracteosa Benth. var. flavida (Pennell) Cronquist
JM1: Pedicularis groenlandica	Pedicularis groenlandica Retz.
JMS: Pedicularis groenlandica var. surrecta	Pedicularis groenlandica Retz.
JM1: Pedicularis howellii	Pedicularis howellii A. Gray
JM1: Pedicularis racemosa	Pedicularis racemosa Benth.
JM1: Pedicularis semibarbata	Pedicularis semibarbata A. Gray
JMS: Pedicularis semibarbata subsp. charlestonensis	Pedicularis semibarbata A. Gray
JM1: Pediomelum californicum	Pediomelum californicum (S. Watson) Rydb.
JM1: Pediomelum castoreum	Pediomelum castoreum (S. Watson) Rydb.
JM2: Peganum harmala	Peganum harmala L.
JMS: Pelargonium &times;domesticum	excluded
JM2: Pelargonium &times;hortorum	Pelargonium &times;hortorum L.H. Bailey
JM2: Pelargonium capitatum	Pelargonium capitatum (L.) L'H&eacute;r.
JM1: Pelargonium grossularioides	Pelargonium grossularioides (L.) L'H&eacute;r.
JM1: Pelargonium inquinans	Pelargonium inquinans (L.) L'H&eacute;r.
JM1: Pelargonium panduriforme	Pelargonium panduriforme Eckl. & Zeyher
JM1: Pelargonium peltatum	Pelargonium peltatum (L.) L'H&eacute;r.
JM1: Pelargonium quercifolium	excluded
JM1: Pelargonium vitifolium	Pelargonium vitifolium (L.) L'H&eacute;r.
JM1: Pelargonium zonale	Pelargonium zonale (L.) L'H&eacute;r.
JM1: Pellaea andromedifolia	Pellaea andromedifolia (Kaulf.) F&eacute;e
JMS: Pellaea andromedifolia var. pubescens	excluded
JM1: Pellaea brachyptera	Pellaea brachyptera (T. Moore) Baker
JM1: Pellaea breweri	Pellaea breweri D.C. Eaton
JM1: Pellaea bridgesii	Pellaea bridgesii Hook.
JM1: Pellaea mucronata	Pellaea mucronata (D.C. Eaton) D.C. Eaton
JM1: Pellaea mucronata var. californica	Pellaea mucronata var. californica (Lemmon) Munz & I.M. Johnst.
JM1: Pellaea mucronata var. mucronata	Pellaea mucronata (D.C. Eaton) D.C. Eaton var. mucronata
JM1: Pellaea truncata	Pellaea truncata Goodd.
JM1: Peltandra virginica	Peltandra virginica (L.) Schott & Endl.
JM2: Pennisetum ciliare	Pennisetum ciliare (L.) Link
JM1: Pennisetum clandestinum	Pennisetum clandestinum Chiov.
JM1: Pennisetum setaceum	Pennisetum setaceum (Forssk.) Chiov.
JM1: Pennisetum villosum	Pennisetum villosum Fresen.
JM1: Penstemon albomarginatus	Penstemon albomarginatus M.E. Jones
JM1: Penstemon anguineus	Penstemon anguineus Eastw.
JM1: Penstemon azureus	Penstemon azureus Benth.
JM1: Penstemon azureus var. angustissimus	Penstemon azureus var. angustissimus A. Gray
JM1: Penstemon azureus var. azureus	Penstemon azureus Benth. var. azureus
JM1: Penstemon barnebyi	Penstemon barnebyi N.H. Holmgren
JM1: Penstemon bicolor	Penstemon bicolor (Brandegee) Clokey & D.D. Keck
JMS: Penstemon bridgesii	Penstemon rostriflorus Kellogg
JMS: Penstemon bryantiae	Penstemon palmeri A. Gray
JM1: Penstemon caesius	Penstemon caesius A. Gray
JM1: Penstemon calcareus	Penstemon calcareus Brandegee
JM1: Penstemon californicus	Penstemon californicus (Munz & I.M. Johnst.) D.D. Keck
JM1: Penstemon centranthifolius	Penstemon centranthifolius Benth.
JM1: Penstemon cinicola	Penstemon cinicola D.D. Keck
JM1: Penstemon clevelandii	Penstemon clevelandii A. Gray
JM1: Penstemon clevelandii var. clevelandii	Penstemon clevelandii A. Gray var. clevelandii
JM1: Penstemon clevelandii var. connatus	Penstemon clevelandii var. connatus Munz & I.M. Johnst.
JM1: Penstemon clevelandii var. mohavensis	Penstemon clevelandii var. mohavensis (D.D. Keck) McMinn
JMS: Penstemon confusus	Penstemon patens (M.E. Jones) N.H. Holmgren
JMS: Penstemon confusus subsp. patens	Penstemon patens (M.E. Jones) N.H. Holmgren
JM2: Penstemon davidsonii	Penstemon davidsonii Greene
JM1: Penstemon davidsonii var. davidsonii	Penstemon davidsonii Greene
JM1: Penstemon deustus	Penstemon deustus Lindl.; Penstemon sudans M.E. Jones
JMS: Penstemon deustus subsp. heterander	Penstemon deustus var. pedicellatus M.E. Jones
JMS: Penstemon deustus subsp. sudans	Penstemon sudans M.E. Jones
JM2: Penstemon deustus var. deustus	Penstemon deustus Lindl. var. deustus
JM1: Penstemon deustus var. pedicellatus	Penstemon deustus var. pedicellatus M.E. Jones
JMS: Penstemon deustus var. savagei	Penstemon deustus var. suffrutescens L.F. Hend.
JM1: Penstemon deustus var. suffrutescens	Penstemon deustus var. suffrutescens L.F. Hend.
JM1: Penstemon eatonii	Penstemon eatonii A. Gray
JM1: Penstemon eatonii var. eatonii	Penstemon eatonii A. Gray var. eatonii
JM1: Penstemon eatonii var. undosus	Penstemon eatonii var. undosus M.E. Jones
JM1: Penstemon filiformis	Penstemon filiformis (D.D. Keck) D.D. Keck
JM1: Penstemon floridus	Penstemon floridus Brandegee
JM1: Penstemon floridus var. austinii	Penstemon floridus var. austinii (Eastw.) N.H. Holmgren
JM1: Penstemon floridus var. floridus	Penstemon floridus Brandegee var. floridus
JM1: Penstemon fruticiformis	Penstemon fruticiformis Coville
JM1: Penstemon fruticiformis var. amargosae	Penstemon fruticiformis var. amargosae (D.D. Keck) N.H. Holmgren
JM1: Penstemon fruticiformis var. fruticiformis	Penstemon fruticiformis Coville var. fruticiformis
JM1: Penstemon gracilentus	Penstemon gracilentus A. Gray
JM1: Penstemon grinnellii	Penstemon grinnellii Eastw.
JM1: Penstemon grinnellii var. grinnellii	Penstemon grinnellii Eastw. var. grinnellii
JM1: Penstemon grinnellii var. scrophularioides	Penstemon grinnellii var. scrophularioides (M.E. Jones) N.H. Holmgren
JM1: Penstemon heterodoxus	Penstemon heterodoxus A. Gray
JM1: Penstemon heterodoxus var. cephalophorus	Penstemon heterodoxus var. cephalophorus (Greene) N.H. Holmgren
JM1: Penstemon heterodoxus var. heterodoxus	Penstemon heterodoxus A. Gray var. heterodoxus
JM1: Penstemon heterodoxus var. shastensis	Penstemon heterodoxus var. shastensis (D.D. Keck) N.H. Holmgren
JM1: Penstemon heterophyllus	Penstemon heterophyllus Lindl.
JM1: Penstemon heterophyllus var. australis	Penstemon heterophyllus var. australis Munz & I.M. Johnst.
JM1: Penstemon heterophyllus var. heterophyllus	Penstemon heterophyllus Lindl. var. heterophyllus
JM1: Penstemon heterophyllus var. purdyi	Penstemon heterophyllus var. purdyi (D.D. Keck) McMinn
JMS: Penstemon hians	Penstemon grinnellii Eastw. var. grinnellii
JM2: Penstemon humilis	Penstemon humilis A. Gray
JM1: Penstemon humilis var. humilis	Penstemon humilis A. Gray
JM1: Penstemon incertus	Penstemon incertus Brandegee
JM1: Penstemon janishiae	Penstemon janishiae N.H. Holmgren
JM1: Penstemon labrosus	Penstemon labrosus (A. Gray) Hook. f.
JM1: Penstemon laetus	Penstemon laetus A. Gray; Penstemon roezlii Regel
JMS: Penstemon laetus subsp. roezlii	Penstemon roezlii Regel
JM1: Penstemon laetus var. laetus	Penstemon laetus A. Gray var. laetus
JM1: Penstemon laetus var. leptosepalus	Penstemon laetus var. leptosepalus A. Gray
JM1: Penstemon laetus var. sagittatus	Penstemon laetus var. sagittatus (D.D. Keck) McMinn
JMS: Penstemon miser	Penstemon janishiae N.H. Holmgren
JM1: Penstemon monoensis	Penstemon monoensis A. Heller
JMS: Penstemon nemorosus	Nothochelone nemorosa (Lindl.) Straw
JM1: Penstemon neotericus	Penstemon neotericus D.D. Keck
JM1: Penstemon newberryi	Penstemon newberryi A. Gray
JM1: Penstemon newberryi var. berryi	Penstemon newberryi var. berryi (Eastw.) N.H. Holmgren
JM1: Penstemon newberryi var. newberryi	Penstemon newberryi A. Gray var. newberryi
JM1: Penstemon newberryi var. sonomensis	Penstemon newberryi var. sonomensis (Greene) Jeps.
JM1: Penstemon pahutensis	Penstemon pahutensis N.H. Holmgren
JM2: Penstemon palmeri	Penstemon palmeri A. Gray
JM1: Penstemon palmeri var. palmeri	Penstemon palmeri A. Gray
JM1: Penstemon papillatus	Penstemon papillatus J.T. Howell
JM1: Penstemon parvulus	Penstemon parvulus (A. Gray) Krautter
JM1: Penstemon patens	Penstemon patens (M.E. Jones) N.H. Holmgren
JMS: Penstemon peirsonii	Penstemon grinnellii var. scrophularioides (M.E. Jones) N.H. Holmgren
JM1: Penstemon personatus	Penstemon personatus D.D. Keck
JM1: Penstemon procerus	Penstemon procerus Graham
JM1: Penstemon procerus var. brachyanthus	Penstemon procerus var. brachyanthus (Pennell) Cronquist
JM1: Penstemon procerus var. formosus	Penstemon procerus var. formosus (A. Nelson) Cronquist
JM1: Penstemon pseudospectabilis	Penstemon pseudospectabilis M.E. Jones
JM1: Penstemon purpusii	Penstemon purpusii Brandegee
JM1: Penstemon rattanii	Penstemon rattanii A. Gray
JM1: Penstemon rattanii var. kleei	Penstemon rattanii var. kleei (Greene) A. Gray
JM1: Penstemon rattanii var. rattanii	Penstemon rattanii A. Gray var. rattanii
JM1: Penstemon roezlii	Penstemon roezlii Regel
JM1: Penstemon rostriflorus	Penstemon rostriflorus Kellogg
JM1: Penstemon rupicola	Penstemon rupicola (Piper) Howell
JM2: Penstemon rydbergii	Penstemon rydbergii A. Nelson
JM1: Penstemon rydbergii var. oreocharis	Penstemon rydbergii A. Nelson var. oreocharis (Greene) N.H. Holmgren
JM1: Penstemon scapoides	Penstemon scapoides D.D. Keck
JM1: Penstemon speciosus	Penstemon speciosus Lindl.
JMS: Penstemon speciosus subsp. kennedyi	Penstemon speciosus Lindl.
JM1: Penstemon spectabilis	Penstemon spectabilis A. Gray
JM1: Penstemon spectabilis var. spectabilis	Penstemon spectabilis A. Gray var. spectabilis
JM1: Penstemon spectabilis var. subviscosus	Penstemon spectabilis var. subviscosus (D.D. Keck) McMinn
JM1: Penstemon stephensii	Penstemon stephensii Brandegee
JM1: Penstemon sudans	Penstemon sudans M.E. Jones
JM1: Penstemon thompsoniae	Penstemon thompsoniae (A. Gray) Rydb.
JM1: Penstemon thurberi	Penstemon thurberi Torr.
JM1: Penstemon tracyi	Penstemon tracyi D.D. Keck
JM1: Penstemon utahensis	Penstemon utahensis Eastw.
JM1: Penstemon venustus	Penstemon venustus Lindl.
JM1: Pentachaeta alsinoides	Pentachaeta alsinoides Greene
JM1: Pentachaeta aurea	Pentachaeta aurea Nutt.
JM2: Pentachaeta aurea subsp. allenii	Pentachaeta aurea subsp. allenii D.J. Keil
JM2: Pentachaeta aurea subsp. aurea	Pentachaeta aurea Nutt. subsp. aurea
JM1: Pentachaeta bellidiflora	Pentachaeta bellidiflora Greene
JM1: Pentachaeta exilis	Pentachaeta exilis (A. Gray) A. Gray
JM1: Pentachaeta exilis subsp. aeolica	Pentachaeta exilis subsp. aeolica Van Horn & Ornduff
JM1: Pentachaeta exilis subsp. exilis	Pentachaeta exilis (A. Gray) A. Gray subsp. exilis
JM1: Pentachaeta fragilis	Pentachaeta fragilis Brandegee
JM1: Pentachaeta lyonii	Pentachaeta lyonii A. Gray
JM2: Pentagramma pallida	Pentagramma pallida (Weath.) Yatsk. et al.
JM2: Pentagramma triangularis	Pentagramma triangularis (Kaulf.) Yatsk., Windham, & E. Wollenw.
JM2: Pentagramma triangularis subsp. maxonii	Pentagramma triangularis subsp. maxonii (Weath.) Yatsk. et al.
JM2: Pentagramma triangularis subsp. triangularis	Pentagramma triangularis  (Kaulf.) Yatsk., Windham, & E. Wollenw.subsp. triangularis
JM2: Pentagramma triangularis subsp. viscosa	Pentagramma triangularis subsp. viscosa (D.C. Eaton) Yatsk. et al.
JMS: Pentaphylloides fruticosa	Dasiphora fruticosa (L.) Rydb.
JM1: Peraphyllum ramosissimum	Peraphyllum ramosissimum Nutt.
JM1: Pericome caudata	Pericome caudata A. Gray
JM1: Perideridia bacigalupii	Perideridia bacigalupii T.I. Chuang & Constance
JM1: Perideridia bolanderi	Perideridia bolanderi (A. Gray) A. Nelson & J.F. Macbr.
JM1: Perideridia bolanderi subsp. bolanderi	Perideridia bolanderi (A. Gray) A. Nelson & J.F. Macbr. subsp. bolanderi
JM1: Perideridia bolanderi subsp. involucrata	Perideridia bolanderi subsp. involucrata T.I. Chuang & Constance
JM1: Perideridia californica	Perideridia californica (Torr.) A. Nelson & J.F. Macbr.
JM1: Perideridia gairdneri	Perideridia gairdneri (Hook. & Arn.) Mathias
JM1: Perideridia gairdneri subsp. borealis	Perideridia gairdneri subsp. borealis T.I. Chuang & Constance
JM1: Perideridia gairdneri subsp. gairdneri	Perideridia gairdneri (Hook. & Arn.) Mathias subsp. gairdneri
JM1: Perideridia howellii	Perideridia howellii (J.M. Coult. & Rose) Mathias
JM1: Perideridia kelloggii	Perideridia kelloggii (A. Gray) Mathias
JM1: Perideridia lemmonii	Perideridia lemmonii (J.M. Coult. & Rose) T.I. Chuang & Constance
JM1: Perideridia leptocarpa	Perideridia leptocarpa T.I. Chuang & Constance
JM1: Perideridia oregana	Perideridia oregana (S. Watson) Mathias
JM1: Perideridia parishii	Perideridia parishii (J.M. Coult. & Rose) A. Nelson & J.F. Macbr.
JM1: Perideridia parishii subsp. latifolia	Perideridia parishii subsp. latifolia (A. Gray) T.I. Chuang & Constance
JM1: Perideridia parishii subsp. parishii	Perideridia parishii (J.M. Coult. & Rose) A. Nelson & J.F. Macbr. subsp. parishii
JM1: Perideridia pringlei	Perideridia pringlei (J.M. Coult. & Rose) A. Nelson & J.F. Macbr.
JM2: Peritoma arborea	Peritoma arborea (Nutt.) H.H. Iltis
JM2: Peritoma arborea var. angustata	Peritoma arborea var. angustata (Parish) H.H. Iltis
JM2: Peritoma arborea var. arborea	Peritoma arborea (Nutt.) H.H. Iltis var. arborea
JM2: Peritoma arborea var. globosa	Peritoma arborea var. globosa (Coville) H.H. Iltis
JM2: Peritoma jonesii	Peritoma jonesii (J.F. Macbr.) H.H. Iltis
JM2: Peritoma lutea	Peritoma lutea (Hook.) Raf.
JM2: Peritoma platycarpa	Peritoma platycarpa (Torr.) H.H. Iltis
JM2: Peritoma serrulata	Peritoma serrulata (Pursh) DC.
JM1: Perityle emoryi	Perityle emoryi Torr.
JM2: Perityle intricata	Perityle intricata (Brandegee) Shinners
JM1: Perityle inyoensis	Perityle inyoensis (Ferris) A.M. Powell
JM1: Perityle megalocephala	Perityle megalocephala (S. Watson) J.F. Macbr.; Perityle intricata (Brandegee) Shinners
JMS: Perityle megalocephala var. intricata	Perityle intricata (Brandegee) Shinners
JM1: Perityle megalocephala var. megalocephala	Perityle megalocephala (S. Watson) J.F. Macbr. var. megalocephala
JM1: Perityle megalocephala var. oligophylla	Perityle megalocephala var. oligophylla A.M. Powell
JM1: Perityle villosa	Perityle villosa (S.F. Blake) Shinners
JM2: Persea americana	Persea americana Mill.
JM2: Persicaria amphibia	Persicaria amphibia (L.) Gray
JM2: Persicaria capitata	Persicaria capitata (D. Don) H. Gross
JM2: Persicaria hydropiper	Persicaria hydropiper (L.) Delarbre
JM2: Persicaria hydropiperoides	Persicaria hydropiperoides (Michx.) Small
JM2: Persicaria lapathifolia	Persicaria lapathifolia (L.) Gray
JM2: Persicaria maculosa	Persicaria maculosa Gray
JM2: Persicaria orientalis	Persicaria orientalis (L.) Spach
JM2: Persicaria pensylvanica	Persicaria pensylvanica (L.) M. G&oacute;mez
JM2: Persicaria punctata	Persicaria punctata (Elliott) Small
JM2: Persicaria wallichii	Persicaria wallichii Greuter & Burdet
JMS: Petalonyx gilmanii	Petalonyx thurberi subsp. gilmanii (Munz) W.S. Davis & H.J. Thomps.
JM1: Petalonyx linearis	Petalonyx linearis Greene
JM1: Petalonyx nitidus	Petalonyx nitidus S. Watson
JM1: Petalonyx thurberi	Petalonyx thurberi A. Gray
JM1: Petalonyx thurberi subsp. gilmanii	Petalonyx thurberi subsp. gilmanii (Munz) W.S. Davis & H.J. Thomps.
JM1: Petalonyx thurberi subsp. thurberi	Petalonyx thurberi A. Gray subsp. thurberi
JM2: Petasites frigidus	Petasites frigidus (L.) Fr.
JM1: Petasites frigidus var. palmatus	Petasites frigidus (L.) Fr. var. palmatus (Aiton) Cronquist
JM1: Peteria thompsoniae	Peteria thompsoniae S. Watson
JM2: Petradoria pumila	Petradoria pumila (Nutt.) Greene
JM1: Petradoria pumila subsp. pumila	Petradoria pumila (Nutt.) Greene var. pumila
JM2: Petradoria pumila var. pumila	Petradoria pumila (Nutt.) Greene var. pumila
JM1: Petrophyton caespitosum	Petrophytum caespitosum (Nutt.) Rydb.
JM1: Petrophyton caespitosum subsp. acuminatum	Petrophytum caespitosum subsp. acuminatum (Rydb.) Munz
JM1: Petrophyton caespitosum subsp. caespitosum	Petrophytum caespitosum (Nutt.) Rydb. subsp. caespitosum
JM2: Petrophytum caespitosum	Petrophytum caespitosum (Nutt.) Rydb.
JM2: Petrophytum caespitosum subsp. acuminatum	Petrophytum caespitosum subsp. acuminatum (Rydb.) Munz
JM2: Petrophytum caespitosum subsp. caespitosum	Petrophytum caespitosum (Nutt.) Rydb. subsp. caespitosum
JM1: Petrorhagia dubia	Petrorhagia dubia (Raf.) G. L&oacute;pez & Romo
JM1: Petrorhagia nanteuilii	Petrorhagia nanteuilii (Burnat) P.W. Ball & Heywood
JM1: Petrorhagia prolifera	Petrorhagia prolifera (L.) P.W. Ball & Heywood
JM1: Petroselinum crispum	Petroselinum crispum (Mill.) A.W. Hill
JM1: Petunia parviflora	Petunia parviflora Juss.
JM1: Peucephyllum schottii	Peucephyllum schottii A. Gray
JM1: Phacelia adenophora	Phacelia adenophora J.T. Howell
JM1: Phacelia affinis	Phacelia affinis A. Gray
JM1: Phacelia amabilis	Phacelia amabilis Constance
JM1: Phacelia anelsonii	Phacelia anelsonii J.F. Macbr.
JM1: Phacelia argentea	Phacelia argentea A. Nelson & J.F. Macbr.
JM1: Phacelia austromontana	Phacelia austromontana J.T. Howell
JM1: Phacelia barnebyana	Phacelia barnebyana J.T. Howell
JM2: Phacelia bicolor	Phacelia bicolor S. Watson
JM1: Phacelia bicolor var. bicolor	Phacelia bicolor S. Watson var. bicolor
JM1: Phacelia bolanderi	Phacelia bolanderi A. Gray
JM1: Phacelia brachyloba	Phacelia brachyloba (Benth.) A. Gray
JM1: Phacelia breweri	Phacelia breweri A. Gray
JM1: Phacelia californica	Phacelia californica Cham.
JM1: Phacelia calthifolia	Phacelia calthifolia Brand
JM1: Phacelia campanularia	Phacelia campanularia A. Gray
JM1: Phacelia campanularia subsp. campanularia	Phacelia campanularia subsp. campanularia
JM1: Phacelia campanularia subsp. vasiformis	Phacelia campanularia subsp. vasiformis G. Gillett
JM1: Phacelia cicutaria	Phacelia cicutaria Greene; Phacelia hubbyi (J.F. Macbr.) L.M. Garrison
JM1: Phacelia cicutaria var. cicutaria	Phacelia cicutaria Greene var. cicutaria
JM1: Phacelia cicutaria var. hispida	Phacelia cicutaria var. hispida J.T. Howell
JM1: Phacelia cicutaria var. hubbyi	Phacelia hubbyi (J.F. Macbr.) L.M. Garrison
JM1: Phacelia ciliata	Phacelia ciliata Benth.
JMS: Phacelia cinerea	Phacelia distans Benth.
JM1: Phacelia coerulea	Phacelia coerulea Greene
JM1: Phacelia congdonii	Phacelia congdonii Greene
JM1: Phacelia cookei	Phacelia cookei Constance & Heckard
JM1: Phacelia corymbosa	Phacelia corymbosa Jeps.
JM1: Phacelia crenulata	Phacelia crenulata S. Watson
JM1: Phacelia crenulata var. ambigua	Phacelia crenulata var. ambigua (M.E. Jones) J.F. Macbr.
JM1: Phacelia crenulata var. crenulata	Phacelia crenulata S. Watson var. crenulata
JMS: Phacelia crenulata var. funerea	Phacelia crenulata S. Watson var. crenulata
JM1: Phacelia crenulata var. minutiflora	Phacelia crenulata var. minutiflora (Munz) Jeps.
JM1: Phacelia cryptantha	Phacelia cryptantha Greene
JM1: Phacelia curvipes	Phacelia curvipes S. Watson
JMS: Phacelia curvipes var. macrantha	Phacelia davidsonii A. Gray
JM1: Phacelia dalesiana	Phacelia dalesiana J.T. Howell
JM1: Phacelia davidsonii	Phacelia davidsonii A. Gray
JM1: Phacelia distans	Phacelia distans Benth.
JM1: Phacelia divaricata	Phacelia divaricata (Benth.) A. Gray; Phacelia insularis Munz; Phacelia congdonii Greene
JMS: Phacelia divaricata var. congdonii	Phacelia congdonii Greene
JMS: Phacelia divaricata var. continentis	Phacelia insularis var. continentis J.T. Howell
JMS: Phacelia divaricata var. insularis	Phacelia insularis Munz var. insularis
JM1: Phacelia douglasii	Phacelia douglasii (Benth.) Torr.
JMS: Phacelia douglasii var. cryptantha	Phacelia stellaris Brand
JM1: Phacelia egena	Phacelia egena (Brand) J.T. Howell
JM1: Phacelia eisenii	Phacelia eisenii Brandegee
JM1: Phacelia exilis	Phacelia exilis (A. Gray) G.J. Lee
JM1: Phacelia floribunda	Phacelia floribunda Greene
JM1: Phacelia fremontii	Phacelia fremontii Torr.
JMS: Phacelia frigida	Phacelia hastata
JMS: Phacelia frigida subsp. dasyphylla	Phacelia hastata subsp. compacta (Brand) Heckard
JMS: Phacelia frigida subsp. frigida	Phacelia hastata subsp. compacta (Brand) Heckard
JM1: Phacelia glandulifera	Phacelia glandulifera Piper
JM1: Phacelia grandiflora	Phacelia grandiflora (Benth.) A. Gray
JM1: Phacelia greenei	Phacelia greenei J.T. Howell
JM1: Phacelia grisea	Phacelia grisea A. Gray
JM1: Phacelia gymnoclada	Phacelia gymnoclada S. Watson
JM1: Phacelia hastata	Phacelia hastata Lehm.
JM1: Phacelia hastata subsp. compacta	Phacelia hastata subsp. compacta (Brand) Heckard
JM1: Phacelia hastata subsp. hastata	Phacelia hastata Lehm. subsp. hastata
JM2: Phacelia heterophylla	Phacelia heterophylla Pursh
JM1: Phacelia heterophylla subsp. virgata	Phacelia heterophylla Pursh subsp. virgata (Greene) Heckard
JM2: Phacelia hubbyi	Phacelia hubbyi (J.F. Macbr.) L.M. Garrison
JM1: Phacelia humilis	Phacelia humilis Torr. & A. Gray
JM1: Phacelia humilis var. dudleyi	Phacelia humilis var. dudleyi J.T. Howell
JM1: Phacelia humilis var. humilis	Phacelia humilis Torr. & A. Gray var. humilis
JM1: Phacelia hydrophylloides	Phacelia hydrophylloides A. Gray
JM1: Phacelia imbricata	Phacelia imbricata Greene
JMS: Phacelia imbricata subsp. bernardina	Phacelia imbricata Greene subsp. imbricata
JM1: Phacelia imbricata subsp. imbricata	Phacelia imbricata Greene subsp. imbricata
JM1: Phacelia imbricata subsp. patula	Phacelia imbricata subsp. patula (Brand) Heckard
JM1: Phacelia insularis	Phacelia insularis Munz
JM1: Phacelia insularis var. continentis	Phacelia insularis var. continentis J.T. Howell
JM1: Phacelia insularis var. insularis	Phacelia insularis Munz var. insularis
JM1: Phacelia inundata	Phacelia inundata J.T. Howell
JM1: Phacelia inyoensis	Phacelia inyoensis (J.F. Macbr.) J.T. Howell
JM1: Phacelia ivesiana	Phacelia ivesiana Torr.
JM1: Phacelia ixodes	excluded
JM2: Phacelia keckii	Phacelia keckii Munz & I.M. Johnst.
JM1: Phacelia lemmonii	Phacelia lemmonii A. Gray
JM1: Phacelia leonis	Phacelia leonis J.T. Howell
JM1: Phacelia linearis	Phacelia linearis (Pursh) Holz.
JM1: Phacelia longipes	Phacelia longipes A. Gray
JM1: Phacelia lyonii	Phacelia lyonii A. Gray
JM1: Phacelia malvifolia	Phacelia malvifolia Cham.
JM1: Phacelia marcescens	Phacelia marcescens J.F. Macbr.
JM1: Phacelia minor	Phacelia minor (Harv.) F. Zimm.
JMS: Phacelia minutiflora	Phacelia crenulata var. minutiflora (Munz) Jeps.
JM1: Phacelia mohavensis	Phacelia mohavensis A. Gray
JMS: Phacelia mohavensis var. exilis	Phacelia exilis (A. Gray) G.J. Lee
JM1: Phacelia monoensis	Phacelia monoensis Halse
JM1: Phacelia mustelina	Phacelia mustelina Coville
JM1: Phacelia mutabilis	Phacelia mutabilis Greene
JM1: Phacelia nashiana	Phacelia nashiana Jeps.
JM1: Phacelia neglecta	Phacelia neglecta M.E. Jones
JM1: Phacelia nemoralis	Phacelia nemoralis Greene
JM1: Phacelia nemoralis subsp. nemoralis	Phacelia nemoralis Greene subsp. nemoralis
JM1: Phacelia nemoralis subsp. oregonensis	Phacelia nemoralis subsp. oregonensis Heckard
JM1: Phacelia novenmillensis	Phacelia novenmillensis Munz
JMS: Phacelia oreopola	Phacelia hastata
JMS: Phacelia oreopola subsp. simulans	Phacelia hastata subsp. compacta (Brand) Heckard
JM1: Phacelia orogenes	Phacelia orogenes Brand
JM1: Phacelia pachyphylla	Phacelia pachyphylla A. Gray
JM1: Phacelia parishii	Phacelia parishii A. Gray
JM1: Phacelia parryi	Phacelia parryi Torr.
JM1: Phacelia pedicellata	Phacelia pedicellata A. Gray
JM1: Phacelia peirsoniana	Phacelia peirsoniana J.T. Howell
JM1: Phacelia perityloides	Phacelia perityloides Coville
JM1: Phacelia perityloides var. jaegeri	Phacelia perityloides var. jaegeri Munz
JM1: Phacelia perityloides var. perityloides	Phacelia perityloides Coville var. perityloides
JM1: Phacelia phacelioides	Phacelia phacelioides (Benth.) Brand
JM1: Phacelia platyloba	Phacelia platyloba A. Gray
JM1: Phacelia pringlei	Phacelia pringlei A. Gray
JM1: Phacelia procera	Phacelia procera A. Gray
JM2: Phacelia pulchella	Phacelia pulchella A. Gray
JM1: Phacelia pulchella var. gooddingii	Phacelia pulchella A. Gray var. gooddingii (Brand) J.T. Howell
JM1: Phacelia purpusii	Phacelia purpusii Brandegee
JM1: Phacelia quickii	Phacelia quickii J.T. Howell
JM1: Phacelia racemosa	Phacelia racemosa (Kellogg) Brandegee
JM1: Phacelia ramosissima	Phacelia ramosissima Lehm.
JM1: Phacelia ramosissima var. austrolitoralis	Phacelia ramosissima Lehm.
JM1: Phacelia ramosissima var. eremophila	Phacelia ramosissima Lehm.
JM1: Phacelia ramosissima var. latifolia	Phacelia ramosissima Lehm.
JM1: Phacelia ramosissima var. montereyensis	Phacelia ramosissima Lehm.
JM1: Phacelia ramosissima var. ramosissima	Phacelia ramosissima Lehm.
JM1: Phacelia ramosissima var. subglabra	Phacelia ramosissima Lehm.
JMS: Phacelia ramosissima var. suffrutescens	Phacelia ramosissima Lehm.
JMS: Phacelia ramosissima var. valida	Phacelia ramosissima Lehm.
JM1: Phacelia rattanii	Phacelia rattanii A. Gray
JM1: Phacelia rotundifolia	Phacelia rotundifolia S. Watson
JM1: Phacelia saxicola	Phacelia saxicola A. Gray
JM2: Phacelia sericea	Phacelia sericea (Graham) A. Gray
JM1: Phacelia sericea var. ciliosa	Phacelia sericea (Graham) A. Gray var. ciliosa Rydb.
JM1: Phacelia stebbinsii	Phacelia stebbinsii Constance & Heckard
JM1: Phacelia stellaris	Phacelia stellaris Brand
JM1: Phacelia suaveolens	Phacelia suaveolens Greene; Phacelia keckii Munz & I.M. Johnst.
JM1: Phacelia suaveolens var. keckii	Phacelia keckii Munz & I.M. Johnst.
JM1: Phacelia suaveolens var. suaveolens	Phacelia suaveolens Greene
JM1: Phacelia tanacetifolia	Phacelia tanacetifolia Benth.
JM1: Phacelia tetramera	Phacelia tetramera J.T. Howell
JM1: Phacelia thermalis	Phacelia thermalis Greene
JM1: Phacelia umbrosa	Phacelia umbrosa Greene
JM1: Phacelia vallicola	Phacelia vallicola Brand
JM1: Phacelia vallis-mortae	Phacelia vallis-mortae J.W. Voss
JM1: Phacelia viscida	Phacelia viscida (Lindl.) Torr.
JM2: Phacelia viscida var. albiflora	Phacelia viscida var. albiflora (Nutt.) A. Gray
JM2: Phacelia viscida var. viscida	Phacelia viscida var. viscida
JM1: Phalacroseris bolanderi	Phalacroseris bolanderi A. Gray
JMS: Phalacroseris bolanderi var. coronata	Phalacroseris bolanderi A. Gray
JMS: Phalaris americana	Phalaris caroliniana Walter
JMS: Phalaris amethystina	Phalaris californica Hook. & Arn.
JM1: Phalaris angusta	Phalaris angusta Trin.
JM1: Phalaris aquatica	Phalaris aquatica L.
JM1: Phalaris arundinacea	Phalaris arundinacea L.
JM1: Phalaris brachystachys	Phalaris brachystachys Link
JMS: Phalaris bulbosa	Phalaris aquatica L.; Phalaris coerulescens Desf.
JM1: Phalaris californica	Phalaris californica Hook. & Arn.
JM1: Phalaris canariensis	Phalaris canariensis L.
JM1: Phalaris caroliniana	Phalaris caroliniana Walter
JM2: Phalaris coerulescens	Phalaris coerulescens Desf.
JMS: Phalaris commutata	Phalaris aquatica L.
JMS: Phalaris intermedia	Phalaris caroliniana Walter
JMS: Phalaris intermedia var. angusta	Phalaris angusta Trin.
JMS: Phalaris intermedia var. angustata	Phalaris angusta Trin.
JM1: Phalaris lemmonii	Phalaris lemmonii Vasey
JMS: Phalaris microstachya	Phalaris caroliniana Walter
JM1: Phalaris minor	Phalaris minor Retz.
JMS: Phalaris occidentalis	Phalaris caroliniana Walter
JM1: Phalaris paradoxa	Phalaris paradoxa L.; Phalaris coerulescens Desf.
JMS: Phalaris paradoxa var. coerulescens	Phalaris coerulescens Desf.
JMS: Phalaris paradoxa var. praemorsa	Phalaris paradoxa L.
JMS: Phalaris praemorsa	Phalaris paradoxa L.
JMS: Phalaris stenoptera	Phalaris aquatica L.
JMS: Phalaris trivialis	Phalaris caroliniana Walter
JMS: Phalaris tuberosa	Phalaris aquatica L.
JMS: Phalaris tuberosa var. stenoptera	Phalaris aquatica L.
JM1: Phaseolus filiformis	Phaseolus filiformis Benth.
JM1: Philadelphus lewisii	Philadelphus lewisii Pursh
JMS: Philadelphus lewisii subsp. californicus	Philadelphus lewisii Pursh
JMS: Philadelphus lewisii subsp. gordonianus	Philadelphus lewisii Pursh
JM1: Philadelphus microphyllus	Philadelphus microphyllus A. Gray
JMS: Philadelphus microphyllus subsp. pumilus	Philadelphus microphyllus A. Gray
JMS: Philadelphus microphyllus subsp. stramineus	Philadelphus microphyllus A. Gray
JMS: Philadelphus microphyllus var. stramineus	Philadelphus microphyllus A. Gray
JM1: Phleum alpinum	Phleum alpinum L.
JM1: Phleum pratense	Phleum pratense L.
JM1: Phlox adsurgens	Phlox adsurgens A. Gray
JM1: Phlox austromontana	Phlox austromontana Coville
JMS: Phlox caespitosa	Phlox douglasii Hook.
JMS: Phlox caespitosa subsp. pulvinata	Phlox pulvinata (Wherry) Cronquist
JM1: Phlox cespitosa	Phlox douglasii Hook.
JM1: Phlox condensata	Phlox condensata (A. Gray) E.E. Nelson
JM1: Phlox diffusa	Phlox diffusa Benth.
JM1: Phlox dispersa	Phlox dispersa Sharsm.
JM1: Phlox dolichantha	Phlox dolichantha A. Gray
JM2: Phlox douglasii	Phlox douglasii Hook.
JMS: Phlox douglasii subsp. rigida	Phlox douglasii Hook.
JM1: Phlox gracilis	Microsteris gracilis (Hook.) Greene
JM1: Phlox hirsuta	Phlox hirsuta E.E. Nelson
JM2: Phlox hoodii	Phlox hoodii Richardson
JM1: Phlox hoodii subsp. canescens	Phlox hoodii Richardson subsp. canescens (Torr. & A. Gray) Wherry
JM1: Phlox muscoides	Phlox muscoides Nutt.
JM1: Phlox pulvinata	Phlox pulvinata (Wherry) Cronquist
JM1: Phlox speciosa	Phlox speciosa Pursh
JM1: Phlox speciosa subsp. nitida	Phlox speciosa Pursh
JM1: Phlox speciosa subsp. occidentalis	Phlox speciosa Pursh
JM1: Phlox stansburyi	Phlox stansburyi (Torr.) A. Heller
JM2: Phlox stansburyi subsp. stansburyi	Phlox stansburyi (Torr.) A. Heller subsp. stansburyi
JM2: Phlox stansburyi subsp. superba	Phlox stansburyi subsp. superba (Brand) Wherry
JM2: Phlox stansburyi var. brevifolia	Phlox stansburyi var. brevifolia (A. Gray) E.E. Nelson
JM1: Phoenicaulis cheiranthoides	Phoenicaulis cheiranthoides Nutt.
JMS: Phoenicaulis cheiranthoides subsp. glabra	Phoenicaulis cheiranthoides Nutt.
JMS: Phoenicaulis cheiranthoides var. lanuginosa	Phoenicaulis cheiranthoides Nutt.
JMS: Phoenicaulis eurycarpa	Anelsonia eurycarpa (A. Gray) J.F. Macbr. & Payson
JM1: Phoenix canariensis	Phoenix canariensis Chabaud
JM1: Phoenix dactylifera	Phoenix dactylifera L.
JM1: Pholisma arenarium	Pholisma arenarium Hook.
JM1: Pholisma sonorae	Pholisma sonorae (A. Gray) Yatsk.
JM1: Pholistoma auritum	Pholistoma auritum (Lindl.) Lilja
JM1: Pholistoma auritum var. arizonicum	Pholistoma auritum var. arizonicum (M.E. Jones) Constance
JM1: Pholistoma auritum var. auritum	Pholistoma auritum (Lindl.) Lilja var. auritum
JM1: Pholistoma membranaceum	Pholistoma membranaceum (Benth.) Constance
JM1: Pholistoma racemosum	Pholistoma racemosum (A. Gray) Constance
JM2: Phoradendron bolleanum	Phoradendron bolleanum (Seem.) Eichler
JM1: Phoradendron californicum	Phoradendron californicum Nutt.
JM1: Phoradendron densum	Phoradendron bolleanum (Seem.) Eichler
JM1: Phoradendron juniperinum	Phoradendron juniperinum A. Gray
JM1: Phoradendron libocedri	Phoradendron juniperinum A. Gray
JM1: Phoradendron macrophyllum	Phoradendron serotinum subsp. macrophyllum (Engelm.) Kuijt
JM1: Phoradendron pauciflorum	Phoradendron bolleanum (Seem.) Eichler
JM2: Phoradendron serotinum	Phoradendron serotinum (Raf.) M.C. Johnst.
JM2: Phoradendron serotinum subsp. macrophyllum	Phoradendron serotinum subsp. macrophyllum (Engelm.) Kuijt
JM2: Phoradendron serotinum subsp. tomentosum	Phoradendron serotinum subsp. tomentosum (DC.) Kuijt
JM1: Phoradendron villosum	Phoradendron serotinum subsp. tomentosum (DC.) Kuijt
JM1: Phragmites australis	Phragmites australis (Cav.) Steud.
JMS: Phragmites australis var. berlandieri	Phragmites australis (Cav.) Steud.
JMS: Phragmites berlandieri	Phragmites australis (Cav.) Steud.
JMS: Phragmites communis	Phragmites australis (Cav.) Steud.
JMS: Phragmites communis var. berlandieri	Phragmites australis (Cav.) Steud.
JM1: Phyla lanceolata	Phyla lanceolata (Michx.) Greene
JM1: Phyla nodiflora	Phyla nodiflora (L.) Greene
JMS: Phyla nodiflora var. canescens	Phyla nodiflora (L.) Greene
JM1: Phyla nodiflora var. incisa	Phyla nodiflora (L.) Greene
JM1: Phyla nodiflora var. nodiflora	Phyla nodiflora (L.) Greene
JMS: Phyla nodiflora var. reptans	Phyla nodiflora (L.) Greene
JMS: Phyla nodiflora var. rosea	Phyla nodiflora (L.) Greene
JM1: Phyllodoce breweri	Phyllodoce breweri (A. Gray) Maxim.
JM1: Phyllodoce empetriformis	Phyllodoce empetriformis (Sm.) D. Don
JM1: Phyllospadix scouleri	Phyllospadix scouleri Hook.
JM1: Phyllospadix torreyi	Phyllospadix torreyi S. Watson
JM2: Phyllostachys aurea	Phyllostachys aurea Rivi&egrave;re & C. Rivi&egrave;re
JM1: Physalis acutifolia	Physalis acutifolia (Miers) Sandwith
JMS: Physalis angulata	Physalis lancifolia Nees
JMS: Physalis angulata var. lancifolia	Physalis lancifolia Nees
JM1: Physalis crassifolia	Physalis crassifolia Benth.
JM1: Physalis hederifolia	Physalis hederifolia A. Gray
JM1: Physalis hederifolia var. fendleri	Physalis hederifolia var. fendleri (A. Gray) Cronquist
JM1: Physalis hederifolia var. palmeri	Physalis hederifolia var. palmeri (A. Gray) C.L. Hitchc.
JM1: Physalis lancifolia	Physalis lancifolia Nees
JM1: Physalis lobata	Physalis lobata Torr.
JM1: Physalis longifolia	Physalis longifolia Nutt.
JM1: Physalis philadelphica	Physalis philadelphica Lam.
JM1: Physalis pubescens	Physalis pubescens L.
JM1: Physalis pubescens var. grisea	Physalis pubescens var. grisea Waterf.
JM1: Physalis pubescens var. integrifolia	Physalis pubescens var. integrifolia (Dunal) Waterf.
JM1: Physalis viscosa	Physalis viscosa L.
JM1: Physaria chambersii	Physaria chambersii Rollins
JM2: Physaria cordiformis	Physaria cordiformis Rollins
JM2: Physaria kingii	Physaria kingii (S. Watson) O'Kane & Al-Shehbaz
JM2: Physaria kingii subsp. bernardina	Physaria kingii subsp. bernardina (Munz) O'Kane & Al-Shehbaz
JM2: Physaria kingii subsp. kingii	Physaria kingii (S. Watson) O'Kane & Al-Shehbaz subsp. kingii
JM2: Physaria kingii subsp. latifolia	Physaria kingii subsp. latifolia (A. Nelson) O'Kane & Al-Shehbaz
JM2: Physaria ludoviciana	Physaria ludoviciana (Nutt.) O'Kane & Al-Shehbaz
JM2: Physaria occidentalis	Physaria occidentalis (S. Watson) O'Kane & Al-Shehbaz
JM2: Physaria occidentalis subsp. occidentalis	Physaria occidentalis (S. Watson) O'Kane & Al-Shehbaz subsp. occidentalis
JM2: Physaria tenella	Physaria tenella (A. Nelson) O'Kane & Al-Shehbaz
JMS: Physaria wardii	Physaria kingii subsp. latifolia (A. Nelson) O'Kane & Al-Shehbaz
JM1: Physocarpus alternans	Physocarpus alternans (M.E. Jones) J.T. Howell
JM1: Physocarpus capitatus	Physocarpus capitatus (Pursh) Kuntze
JM1: Phytolacca americana	Phytolacca americana L.
JM2: Phytolacca americana var. americana	Phytolacca americana L. var. americana
JM2: Phytolacca heterotepala	Phytolacca heterotepala H. Walter
JM2: Phytolacca icosandra	Phytolacca icosandra L.
JM1: Picea breweriana	Picea breweriana S. Watson
JM1: Picea engelmannii	Picea engelmannii Engelm.
JM1: Picea sitchensis	Picea sitchensis (Bong.) Carri&egrave;re
JM1: Pickeringia montana	Pickeringia montana Nutt.
JM1: Pickeringia montana var. montana	Pickeringia montana var. montana
JM1: Pickeringia montana var. tomentosa	Pickeringia montana var. tomentosa (Abrams) I.M. Johnst.
JM1: Picris echioides	Helminthotheca echioides (L.) Holub
JMS: Picrothamnus desertorum	Artemisia spinescens D.C. Eaton
JM1: Pilostyles thurberi	Pilostyles thurberi A. Gray
JM1: Pilularia americana	Pilularia americana A. Braun
JM2: Pinguicula macroceras	Pinguicula macroceras Link
JMS: Pinguicula vulgaris	Pinguicula macroceras Link
JM1: Pinguicula vulgaris subsp. macroceras	Pinguicula macroceras Link
JM1: Pinus albicaulis	Pinus albicaulis Engelm.
JM1: Pinus attenuata	Pinus attenuata Lemmon
JM1: Pinus balfouriana	Pinus balfouriana Grev. & Balf.
JM1: Pinus balfouriana subsp. austrina	Pinus balfouriana subsp. austrina R.J. Mastrog. & J.D. Mastrog.
JM1: Pinus balfouriana subsp. balfouriana	Pinus balfouriana Grev. & Balf. subsp. balfouriana
JM1: Pinus contorta	Pinus contorta Loudon
JM1: Pinus contorta subsp. bolanderi	Pinus contorta subsp. bolanderi (Parl.) Critchf.
JM1: Pinus contorta subsp. contorta	Pinus contorta Loudon subsp. contorta
JM1: Pinus contorta subsp. murrayana	Pinus contorta subsp. murrayana (Grev. & Balf.) Critchf.
JM1: Pinus coulteri	Pinus coulteri D. Don
JM1: Pinus edulis	Pinus edulis Engelm.
JM1: Pinus flexilis	Pinus flexilis E. James
JM1: Pinus jeffreyi	Pinus jeffreyi Grev. & Balf.
JM1: Pinus lambertiana	Pinus lambertiana Douglas
JM1: Pinus longaeva	Pinus longaeva D.K. Bailey
JM1: Pinus monophylla	Pinus monophylla Torr. & Fr&eacute;m.
JM1: Pinus monticola	Pinus monticola D. Don
JM1: Pinus muricata	Pinus muricata D. Don
JM1: Pinus ponderosa	Pinus ponderosa Lawson & C. Lawson
JM2: Pinus ponderosa var. pacifica	Pinus ponderosa var. pacifica J.R. Haller & Vivrette
JM2: Pinus ponderosa var. ponderosa	Pinus ponderosa Lawson & C. Lawson var. ponderosa
JM2: Pinus ponderosa var. washoensis	Pinus ponderosa var. washoensis (H. Mason & Stockw.) J.R. Haller & Vivrette
JM1: Pinus quadrifolia	Pinus quadrifolia Sudw.
JM1: Pinus radiata	Pinus radiata D. Don
JM1: Pinus sabiniana	Pinus sabiniana D. Don
JM1: Pinus torreyana	Pinus torreyana Carri&egrave;re
JM2: Pinus torreyana subsp. insularis	Pinus torreyana subsp. insularis J.R. Haller
JM2: Pinus torreyana subsp. torreyana	Pinus torreyana Carri&egrave;re subsp. torreyana
JM1: Pinus washoensis	Pinus ponderosa var. washoensis (H. Mason & Stockw.) J.R. Haller & Vivrette
JM1: Piperia candida	Piperia candida Rand. Morgan & Ackerman
JM2: Piperia colemanii	Piperia colemanii Rand. Morgan & Glicenstein
JM1: Piperia cooperi	Piperia cooperi (S. Watson) Rydb.
JM1: Piperia elegans	Piperia elegans (Lindl.) Rydb.
JM2: Piperia elegans subsp. decurtata	Piperia elegans subsp. decurtata Rand. Morgan & Glicenstein
JM2: Piperia elegans subsp. elegans	Piperia elegans (Lindl.) Rydb. subsp. elegans
JM1: Piperia elongata	Piperia elongata Rydb.
JM1: Piperia leptopetala	Piperia leptopetala Rydb.
JM1: Piperia michaelii	Piperia michaelii (Greene) Rydb.
JM1: Piperia transversa	Piperia transversa Suksd.
JM1: Piperia unalascensis	Piperia unalascensis (Spreng.) Rydb.
JM1: Piperia yadonii	Piperia yadonii Rand. Morgan & Ackerman
JMS: Piptatherum exiguum	Stipa exigua (Thurb.) Columbus & J.P. Sm.
JM1: Piptatherum micranthum	Stipa divaricata Columbus & J.P. Sm.
JM1: Piptatherum miliaceum	Stipa miliacea (L.) Hoover var. miliacea
JMS: Piptatherum miliaceum subsp. miliaceum	Stipa miliacea (L.) Hoover var. miliacea
JM1: Piptochaetium setosum	Stipa purpurata Columbus & J.P. Sm.
JMS: Piptochaetium stipoides	Stipa chaetophora (Griseb.) Columbus & J.P. Sm.
JM1: Pistacia atlantica	Pistacia atlantica Desf.
JM1: Pistia stratiotes	Pistia stratiotes L.
JM1: Pisum sativum	Pisum sativum L.
JM1: Pittosporum crassifolium	Pittosporum crassifolium Banks & Sol.
JM1: Pittosporum tenuifolium	Pittosporum tenuifolium Gaertn.
JM1: Pittosporum tobira	Pittosporum tobira (Thunb.) W.T. Aiton
JM1: Pittosporum undulatum	Pittosporum undulatum Vent.
JM1: Pityopus californicus	Pityopus californicus (Eastw.) H.F. Copel.
JMS: Pityrogramma triangularis	Pentagramma pallida (Weath.) Yatsk. et al.
JMS: Pityrogramma triangularis var. pallida	Pentagramma pallida (Weath.) Yatsk. et al.
JM1: Plagiobothrys acanthocarpus	Plagiobothrys acanthocarpus (Piper) I.M. Johnst.
JM1: Plagiobothrys arizonicus	Plagiobothrys arizonicus (A. Gray) A. Gray
JM1: Plagiobothrys austinae	Plagiobothrys austiniae (Greene) I.M. Johnst.
JM2: Plagiobothrys austiniae	Plagiobothrys austiniae (Greene) I.M. Johnst.
JM1: Plagiobothrys bracteatus	Plagiobothrys bracteatus (Howell) I.M. Johnst.
JM1: Plagiobothrys canescens	Plagiobothrys canescens Benth.
JM2: Plagiobothrys canescens var. canescens	Plagiobothrys canescens Benth. var. canescens
JM2: Plagiobothrys canescens var. catalinensis	Plagiobothrys canescens var. catalinensis (A. Gray) Jeps.
JM1: Plagiobothrys chorisianus	Plagiobothrys chorisianus (Cham.) I.M. Johnst.
JM1: Plagiobothrys chorisianus var. chorisianus	Plagiobothrys chorisianus (Cham.) I.M. Johnst. var. chorisianus
JM1: Plagiobothrys chorisianus var. hickmanii	Plagiobothrys chorisianus var. hickmanii (Greene) I.M. Johnst.
JM1: Plagiobothrys cognatus	Plagiobothrys cognatus (Greene) I.M. Johnst.
JM1: Plagiobothrys collinus	Plagiobothrys collinus (Phil.) I.M. Johnst.
JM1: Plagiobothrys collinus var. californicus	Plagiobothrys collinus var. californicus (A. Gray) Higgins
JM1: Plagiobothrys collinus var. fulvescens	Plagiobothrys collinus var. fulvescens (I.M. Johnst.) Higgins
JM1: Plagiobothrys collinus var. gracilis	Plagiobothrys collinus var. gracilis (I.M. Johnst.) Higgins
JM1: Plagiobothrys collinus var. ursinus	Plagiobothrys collinus var. ursinus (A. Gray) Higgins
JM1: Plagiobothrys cusickii	Plagiobothrys cusickii (Greene) I.M. Johnst.
JM2: Plagiobothrys diffusus	Plagiobothrys diffusus (Greene) I.M. Johnst.
JM1: Plagiobothrys distantiflorus	Plagiobothrys distantiflorus (Piper) I.M. Johnst.
JM1: Plagiobothrys fulvus	misappl. to Plagiobothrys fulvus var. campestris
JM2: Plagiobothrys fulvus var. campestris	Plagiobothrys fulvus (Hook. & Arn.) I.M. Johnst. var. campestris (Greene) I.M. Johnst.
JM1: Plagiobothrys glaber	Plagiobothrys glaber (A. Gray) I.M. Johnst.
JM1: Plagiobothrys glyptocarpus	Plagiobothrys glyptocarpus (Piper) I.M. Johnst.
JM1: Plagiobothrys glyptocarpus var. glyptocarpus	Plagiobothrys glyptocarpus (Piper) I.M. Johnst. var. glyptocarpus
JM1: Plagiobothrys glyptocarpus var. modestus	Plagiobothrys glyptocarpus var. modestus I.M. Johnst.
JM1: Plagiobothrys greenei	Plagiobothrys greenei (A. Gray) I.M. Johnst.
JM1: Plagiobothrys hispidulus	Plagiobothrys hispidulus (Greene) I.M. Johnst.
JM1: Plagiobothrys hispidus	Plagiobothrys hispidus A. Gray
JM1: Plagiobothrys humistratus	Plagiobothrys humistratus (Greene) I.M. Johnst.
JM1: Plagiobothrys hystriculus	Plagiobothrys hystriculus (Piper) I.M. Johnst.
JM1: Plagiobothrys infectivus	Plagiobothrys infectivus I.M. Johnst.
JM1: Plagiobothrys jonesii	Plagiobothrys jonesii A. Gray
JM1: Plagiobothrys kingii	Plagiobothrys kingii (S. Watson) A. Gray
JM1: Plagiobothrys kingii var. harknessii	Plagiobothrys kingii var. harknessii (Greene) Jeps.
JM1: Plagiobothrys kingii var. kingii	Plagiobothrys kingii (S. Watson) A. Gray var. kingii
JM1: Plagiobothrys leptocladus	Plagiobothrys leptocladus (Greene) I.M. Johnst.
JM1: Plagiobothrys lithocaryus	Plagiobothrys lithocaryus (A. Gray) I.M. Johnst.
JM1: Plagiobothrys mollis	Plagiobothrys mollis (A. Gray) I.M. Johnst.
JM1: Plagiobothrys mollis var. mollis	Plagiobothrys mollis (A. Gray) I.M. Johnst. var. mollis
JM1: Plagiobothrys mollis var. vestitus	Plagiobothrys mollis var. vestitus (Greene) I.M. Johnst.
JM1: Plagiobothrys myosotoides	Plagiobothrys verrucosus (Phil.) I.M. Johnst.
JMS: Plagiobothrys myosotoides subsp. verrucosus	Plagiobothrys verrucosus (Phil.) I.M. Johnst.
JM2: Plagiobothrys nitens	Plagiobothrys nitens (Greene) I.M. Johnst.
JM1: Plagiobothrys nothofulvus	Plagiobothrys nothofulvus (A. Gray) A. Gray
JM1: Plagiobothrys parishii	Plagiobothrys parishii I.M. Johnst.
JM1: Plagiobothrys reticulatus	Plagiobothrys reticulatus (Piper) I.M. Johnst.
JM1: Plagiobothrys reticulatus var. reticulatus	Plagiobothrys reticulatus (Piper) I.M. Johnst. var. reticulatus
JM1: Plagiobothrys reticulatus var. rossianorum	Plagiobothrys reticulatus var. rossianorum I.M. Johnst.
JM1: Plagiobothrys salsus	Plagiobothrys salsus (Brandegee) I.M. Johnst.
JMS: Plagiobothrys scouleri	Plagiobothrys nitens (Greene) I.M. Johnst.
JMS: Plagiobothrys scouleri var. penicillatus	Plagiobothrys nitens (Greene) I.M. Johnst.
JM1: Plagiobothrys scriptus	Plagiobothrys scriptus (Greene) I.M. Johnst.
JM1: Plagiobothrys shastensis	Plagiobothrys shastensis A. Gray
JM1: Plagiobothrys stipitatus	Plagiobothrys stipitatus (Greene) I.M. Johnst.
JM1: Plagiobothrys stipitatus var. micranthus	Plagiobothrys stipitatus var. micranthus (Piper) I.M. Johnst.
JM1: Plagiobothrys stipitatus var. stipitatus	Plagiobothrys stipitatus (Greene) I.M. Johnst. var. stipitatus
JM1: Plagiobothrys strictus	Plagiobothrys strictus (Greene) I.M. Johnst.
JM1: Plagiobothrys tenellus	Plagiobothrys tenellus (Hook.) A. Gray
JM1: Plagiobothrys tener	Plagiobothrys tener (Greene) I.M. Johnst.
JM2: Plagiobothrys tener var. subglaber	Plagiobothrys tener var. subglaber I.M. Johnst.
JM2: Plagiobothrys tener var. tener	Plagiobothrys tener (Greene) I.M. Johnst. var. tener
JM1: Plagiobothrys torreyi	Plagiobothrys torreyi (A. Gray) A. Gray
JM1: Plagiobothrys torreyi var. diffusus	Plagiobothrys torreyi var. diffusus I.M. Johnst.
JM2: Plagiobothrys torreyi var. perplexans	Plagiobothrys torreyi var. perplexans I.M. Johnst.
JM1: Plagiobothrys torreyi var. torreyi	Plagiobothrys torreyi (A. Gray) A. Gray var. torreyi
JM1: Plagiobothrys trachycarpus	Plagiobothrys trachycarpus (A. Gray) I.M. Johnst.
JM1: Plagiobothrys uncinatus	Plagiobothrys uncinatus J.T. Howell
JM1: Plagiobothrys undulatus	Plagiobothrys undulatus (Piper) I.M. Johnst.
JM2: Plagiobothrys verrucosus	Plagiobothrys verrucosus (Phil.) I.M. Johnst.
JM2: Planodes virginicum	Planodes virginicum (L.) Greene
JM2: Plantago arenaria	Plantago arenaria Waldst. & Kit.
JM1: Plantago aristata	Plantago aristata Michx.
JMS: Plantago bigelovii	Plantago elongata Pursh
JM1: Plantago coronopus	Plantago coronopus L.
JM1: Plantago elongata	Plantago elongata Pursh
JMS: Plantago elongata subsp. pentasperma	Plantago elongata Pursh
JM1: Plantago erecta	Plantago erecta E. Morris
JM1: Plantago eriopoda	Plantago eriopoda Torr.
JMS: Plantago fastigiata	Plantago ovata Forssk. var. fastigiata (Morris) S.C. Meyers & A. Liston
JM1: Plantago indica	Plantago arenaria Waldst. & Kit.
JMS: Plantago insularis	Plantago ovata Forssk. var. insularis (Eastw.) S.C. Meyers & A. Liston
JM1: Plantago lanceolata	Plantago lanceolata L.
JM1: Plantago major	Plantago major L.
JMS: Plantago major var. pilgeri	Plantago major L.
JMS: Plantago major var. scopulorum	Plantago major L.
JM1: Plantago maritima	Plantago maritima L.
JMS: Plantago maritima var. californica	Plantago maritima L.
JMS: Plantago maritima var. juncoides	Plantago maritima L.
JM1: Plantago ovata	Plantago ovata Forssk.
JM2: Plantago ovata var. fastigiata	Plantago ovata Forssk. var. fastigiata (Morris) S.C. Meyers & A. Liston
JM2: Plantago ovata var. insularis	Plantago ovata Forssk. var. insularis (Eastw.) S.C. Meyers & A. Liston
JM1: Plantago patagonica	Plantago patagonica Jacq.
JMS: Plantago psyllium	Plantago arenaria Waldst. & Kit.
JMS: Plantago purshii	Plantago patagonica Jacq.
JM1: Plantago pusilla	Plantago pusilla Nutt.
JM2: Plantago rhodosperma	Plantago rhodosperma Decne.
JM1: Plantago subnuda	Plantago subnuda Pilg.
JM2: Plantago truncata	Plantago truncata Cham. & Schltdl.
JM1: Plantago truncata subsp. firma	Plantago truncata Cham. & Schltdl. subsp. firma (Kunze) Pilg.
JM1: Plantago virginica	Plantago virginica L.
JM2: Platanthera dilatata	Platanthera dilatata (Pursh) L.C. Beck
JM2: Platanthera dilatata var. leucostachys	Platanthera dilatata (Pursh) L.C. Beck var. leucostachys (Lindl.) Luer
JM1: Platanthera hyperborea	Platanthera tescamnis Sheviak & W.F. Jenn.
JMS: Platanthera hyperborea var. purpurascens	Platanthera yosemitensis Colwell et al.
JM1: Platanthera leucostachys	Platanthera dilatata (Pursh) L.C. Beck var. leucostachys (Lindl.) Luer
JMS: Platanthera purpurascens	Platanthera yosemitensis Colwell et al.
JM1: Platanthera sparsiflora	Platanthera sparsiflora (S. Watson) Schltr.
JM1: Platanthera stricta	Platanthera stricta Lindl.
JM2: Platanthera tescamnis	Platanthera tescamnis Sheviak & W.F. Jenn.
JM2: Platanthera yosemitensis	Platanthera yosemitensis Colwell et al.
JMS: Platanus &times;acerifolia	Platanus &times;hispanica M&uuml;nchh.
JM2: Platanus &times;hispanica	Platanus &times;hispanica M&uuml;nchh.
JMS: Platanus &times;hybrida	Platanus &times;hispanica M&uuml;nchh.
JMS: Platanus hispanica	Platanus &times;hispanica M&uuml;nchh.
JM1: Platanus racemosa	Platanus racemosa Nutt.
JM1: Platystemon californicus	Platystemon californicus Benth.
JM2: Plecostachys serpyllifolia	Plecostachys serpyllifolia (P.J. Bergius) Hilliard & B.L. Burtt
JM1: Plectritis brachystemon	Plectritis congesta subsp. brachystemon (Fisch. & C.A. Mey.) Morey
JM1: Plectritis ciliosa	Plectritis ciliosa (Greene) Jeps.
JM1: Plectritis ciliosa subsp. ciliosa	Plectritis ciliosa (Greene) Jeps.
JM1: Plectritis ciliosa subsp. insignis	Plectritis ciliosa (Greene) Jeps.
JM1: Plectritis congesta	Plectritis congesta (Lindl.) DC.
JM2: Plectritis congesta subsp. brachystemon	Plectritis congesta subsp. brachystemon (Fisch. & C.A. Mey.) Morey
JM2: Plectritis congesta subsp. congesta	Plectritis congesta (Lindl.) DC. subsp. congesta
JM1: Plectritis macrocera	Plectritis macrocera Torr. & A. Gray
JM2: Pleiacanthus spinosus	Pleiacanthus spinosus (Nutt.) Rydb.
JM1: Pleuraphis jamesii	Hilaria jamesii (Torr.) Benth.
JM1: Pleuraphis rigida	Hilaria rigida (Thurb.) Scribn.
JM1: Pleuricospora fimbriolata	Pleuricospora fimbriolata A. Gray
JM1: Pleurocoronis pluriseta	Pleurocoronis pluriseta (A. Gray) R.M. King & H. Rob.
JM1: Pleuropogon californicus	Pleuropogon californicus (Nees) Vasey
JM2: Pleuropogon californicus var. californicus	Pleuropogon californicus var. californicus
JM2: Pleuropogon californicus var. davyi	Pleuropogon californicus var. davyi (L.D. Benson) But
JMS: Pleuropogon davyi	Pleuropogon californicus var. davyi (L.D. Benson) But
JM1: Pleuropogon hooverianus	Pleuropogon hooverianus (L.D. Benson) J.T. Howell
JM1: Pleuropogon refractus	Pleuropogon refractus (A. Gray) Vasey
JM1: Pluchea odorata	Pluchea odorata (L.) Cass.
JM2: Pluchea odorata var. odorata	Pluchea odorata (L.) Cass. var. odorata
JM1: Pluchea sericea	Pluchea sericea (Nutt.) Coville
JM2: Plumbago auriculata	Plumbago auriculata Lam.
JM2: Poa abbreviata	Poa abbreviata R. Br.
JM2: Poa abbreviata subsp. marshii	Poa abbreviata subsp. marshii Soreng
JM2: Poa abbreviata subsp. pattersonii	Poa abbreviata subsp. pattersonii (Vasey) &Aacute;. L&ouml;ve et al.
JMS: Poa alpina	Poa cusickii
JMS: Poa alpina var. purpurascens	Poa cusickii subsp. purpurascens (Vasey) Soreng
JM1: Poa annua	Poa annua L.
JM1: Poa atropurpurea	Poa atropurpurea Scribn.
JM1: Poa bigelovii	Poa bigelovii Vasey & Scribn.
JM1: Poa bolanderi	Poa bolanderi Vasey
JMS: Poa bolanderi var. howellii	Poa howellii Vasey & Scribn.
JM1: Poa bulbosa	Poa bulbosa L.
JM2: Poa bulbosa subsp. bulbosa	Poa bulbosa L. subsp. bulbosa
JM2: Poa bulbosa subsp. vivipara	Poa bulbosa subsp. vivipara (Koeler) Arcang.
JMS: Poa canbyi	Poa secunda J. Presl subsp. secunda
JM1: Poa compressa	Poa compressa L.
JM1: Poa confinis	Poa confinis Vasey
JM1: Poa cusickii	Poa cusickii Vasey
JM1: Poa cusickii subsp. cusickii	Poa cusickii Vasey subsp. cusickii
JM1: Poa cusickii subsp. epilis	Poa cusickii subsp. epilis (Scribn.) W.A. Weber
JM1: Poa cusickii subsp. pallida	Poa cusickii subsp. pallida Soreng
JM1: Poa cusickii subsp. purpurascens	Poa cusickii subsp. purpurascens (Vasey) Soreng
JM2: Poa diaboli	Poa diaboli Soreng & D.J. Keil
JM1: Poa douglasii	Poa douglasii Nees
JMS: Poa douglasii subsp. macrantha	Poa macrantha Vasey
JMS: Poa epilis	Poa cusickii subsp. epilis (Scribn.) W.A. Weber
JM2: Poa fendleriana	Poa fendleriana (Steud.) Vasey
JM2: Poa fendleriana subsp. fendleriana	Poa fendleriana (Steud.) Vasey subsp. fendleriana
JM1: Poa fendleriana subsp. longiligula	Poa fendleriana subsp. longiligula (Scribn. & T.A. Williams) Soreng
JM2: Poa glauca	Poa glauca Vahl
JM1: Poa glauca subsp. rupicola	Poa glauca Vahl subsp. rupicola (Rydb.) W.A. Weber
JMS: Poa gracillima	Poa secunda J. Presl subsp. secunda
JMS: Poa hansenii	Poa cusickii Vasey subsp. cusickii
JM1: Poa howellii	Poa howellii Vasey & Scribn.
JMS: Poa incurva	Poa secunda J. Presl subsp. secunda
JM1: Poa infirma	Poa infirma Kunth
JM1: Poa keckii	Poa keckii Soreng
JM1: Poa kelloggii	Poa kelloggii Vasey
JM2: Poa leptocoma	Poa leptocoma Trin.
JM1: Poa leptocoma subsp. leptocoma	Poa leptocoma Trin. subsp. leptocoma
JM1: Poa lettermanii	Poa lettermanii Vasey
JMS: Poa longiligula	Poa fendleriana subsp. longiligula (Scribn. & T.A. Williams) Soreng
JM1: Poa macrantha	Poa macrantha Vasey
JM1: Poa napensis	Poa napensis Beetle
JM1: Poa nemoralis	Poa nemoralis L.
JMS: Poa nervosa	Poa wheeleri Vasey
JM1: Poa palustris	Poa palustris L.
JM1: Poa pattersonii	Poa abbreviata subsp. pattersonii (Vasey) &Aacute;. L&ouml;ve et al.
JM1: Poa piperi	Poa piperi Hitchc.
JM2: Poa pratensis	Poa pratensis L.
JM1: Poa pratensis subsp. pratensis	Poa pratensis L. subsp. pratensis
JM1: Poa pringlei	Poa pringlei Scribn.
JMS: Poa purpurascens	Poa cusickii subsp. purpurascens (Vasey) Soreng
JM1: Poa rhizomata	Poa piperi Hitchc.; Poa rhizomata Hitchc.
JMS: Poa rupicola	Poa glauca Vahl subsp. rupicola (Rydb.) W.A. Weber
JMS: Poa sandbergii	Poa secunda J. Presl subsp. secunda
JMS: Poa scabrella	Poa secunda J. Presl subsp. secunda
JM1: Poa secunda	Poa secunda J. Presl
JM1: Poa secunda subsp. juncifolia	Poa secunda subsp. juncifolia (Scribn.) Soreng
JM1: Poa secunda subsp. secunda	Poa secunda J. Presl subsp. secunda
JM1: Poa sierrae	Poa sierrae J.T. Howell
JM1: Poa stebbinsii	Poa stebbinsii Soreng
JMS: Poa subaristata	Poa cusickii subsp. pallida Soreng
JMS: Poa suksdorfii	Poa keckii Soreng
JM1: Poa tenerrima	Poa tenerrima Scribn.
JM1: Poa trivialis	Poa trivialis L.
JM1: Poa unilateralis	Poa unilateralis Vasey
JM2: Poa unilateralis subsp. unilateralis	Poa unilateralis Vasey subsp. unilateralis
JM1: Poa wheeleri	Poa wheeleri Vasey
JMS: Podagrostis humilis	Agrostis humilis Vasey
JMS: Podagrostis thurberiana	Agrostis humilis Vasey
JM1: Podistera nevadensis	Podistera nevadensis (A. Gray) S. Watson
JM1: Pogogyne abramsii	Pogogyne abramsii J.T. Howell
JM1: Pogogyne clareana	Pogogyne clareana J.T. Howell
JM1: Pogogyne douglasii	Pogogyne douglasii Benth.
JM1: Pogogyne floribunda	Pogogyne floribunda Jokerst
JM1: Pogogyne nudiuscula	Pogogyne nudiuscula A. Gray
JM1: Pogogyne serpylloides	Pogogyne serpylloides (Torr.) A. Gray
JMS: Pogogyne serpylloides subsp. intermedia	Pogogyne serpylloides (Torr.) A. Gray
JM1: Pogogyne zizyphoroides	Pogogyne zizyphoroides Benth.
JMS: Poinciana spinosa	Caesalpinia spinosa (Molina) Kuntze
JM2: Polanisia dodecandra	Polanisia dodecandra (L.) DC.
JM1: Polanisia dodecandra subsp. trachysperma	Polanisia dodecandra (L.) DC. subsp. trachysperma (Torr. & A. Gray) H.H. Iltis
JM1: Polemonium californicum	Polemonium californicum Eastw.
JM1: Polemonium carneum	Polemonium carneum A. Gray
JM1: Polemonium chartaceum	Polemonium chartaceum H. Mason
JM1: Polemonium eximium	Polemonium eximium Greene
JM1: Polemonium micranthum	Polemonium micranthum Benth.
JM1: Polemonium occidentale	Polemonium occidentale Greene
JM2: Polemonium occidentale subsp. occidentale	Polemonium occidentale Greene subsp. occidentale
JM1: Polemonium pulcherrimum	Polemonium pulcherrimum Hook.
JM1: Polemonium pulcherrimum var. pilosum	Polemonium pulcherrimum var. pilosum (Greenm.) Brand
JM1: Polemonium pulcherrimum var. pulcherrimum	Polemonium pulcherrimum Hook. var. pulcherrimum
JM1: Poliomintha incana	Poliomintha incana (Torr.) A. Gray
JM1: Polycarpon depressum	Polycarpon depressum Nutt.
JM1: Polycarpon tetraphyllum	Polycarpon tetraphyllum (L.) L.
JM2: Polycarpon tetraphyllum var. tetraphyllum	Polycarpon tetraphyllum (L.) L. var. tetraphyllum
JM1: Polyctenium fremontii	Polyctenium fremontii (S. Watson) Greene
JM1: Polyctenium fremontii var. confertum	Polyctenium fremontii (S. Watson) Greene
JM1: Polyctenium fremontii var. fremontii	Polyctenium fremontii (S. Watson) Greene
JMS: Polyctenium williamsiae	Polyctenium fremontii (S. Watson) Greene
JM1: Polygala acanthoclada	Polygala acanthoclada A. Gray
JMS: Polygala acanthoclada var. intricata	Polygala intermontana T. Wendt
JM1: Polygala californica	Polygala californica Nutt.
JM1: Polygala cornuta	Polygala cornuta Kellogg
JMS: Polygala cornuta subsp. fishiae	Polygala cornuta var. fishiae (Parry) Jeps.
JM1: Polygala cornuta var. cornuta	Polygala cornuta Kellogg var. cornuta
JM1: Polygala cornuta var. fishiae	Polygala cornuta var. fishiae (Parry) Jeps.
JM1: Polygala heterorhyncha	Polygala heterorhyncha (Barneby) T. Wendt
JM1: Polygala intermontana	Polygala intermontana T. Wendt
JM1: Polygala subspinosa	Polygala subspinosa S. Watson
JMS: Polygala subspinosa var. heterorhyncha	Polygala heterorhyncha (Barneby) T. Wendt
JM1: Polygonum amphibium	Persicaria amphibia (L.) Gray
JM1: Polygonum amphibium var. emersum	Persicaria amphibia (L.) Gray
JM1: Polygonum amphibium var. stipulaceum	Persicaria amphibia (L.) Gray
JM1: Polygonum arenastrum	Polygonum aviculare subsp. depressum (Meisn.) Arcang.
JM1: Polygonum argyrocoleon	Polygonum argyrocoleon Kunze
JMS: Polygonum aubertii	Fallopia baldschuanica (Regel) Holub
JM2: Polygonum austiniae	Polygonum austiniae Greene
JM2: Polygonum aviculare	Polygonum aviculare L.
JM2: Polygonum aviculare subsp. aviculare	Polygonum aviculare subsp. aviculare
JM2: Polygonum aviculare subsp. buxiforme	Polygonum aviculare subsp. buxiforme (Small) Costea & Tardif
JM2: Polygonum aviculare subsp. depressum	Polygonum aviculare subsp. depressum (Meisn.) Arcang.
JM2: Polygonum aviculare subsp. neglectum	Polygonum aviculare subsp. neglectum (Besser) Arcang.
JMS: Polygonum aviculare subsp. rectum	Polygonum aviculare subsp. neglectum (Besser) Arcang.
JM2: Polygonum aviculare subsp. rurivagum	Polygonum aviculare subsp. rurivagum (Boreau) Berher
JM1: Polygonum baldschuanicum	Fallopia baldschuanica (Regel) Holub
JM1: Polygonum bidwelliae	Polygonum bidwelliae S. Watson
JM1: Polygonum bistortoides	Bistorta bistortoides (Pursh) Small
JM1: Polygonum bolanderi	Polygonum bolanderi W.H. Brewer
JM1: Polygonum californicum	Polygonum californicum Meisn.
JM1: Polygonum capitatum	Persicaria capitata (D. Don) H. Gross
JM1: Polygonum convolvulus	Fallopia convolvulus (L.) A. L&ouml;ve
JM1: Polygonum cuspidatum	Fallopia japonica (Houtt.) Ronse Decr.
JM1: Polygonum davisiae	Aconogonon davisiae (A. Gray) Soj&aacute;k
JM1: Polygonum douglasii	Polygonum douglasii Greene; Polygonum sawatchense Small; Polygonum austiniae Greene; Polygonum majus (Meisn.) Piper; Polygonum spergulariiforme Small
JM1: Polygonum douglasii subsp. austiniae	Polygonum austiniae Greene
JM1: Polygonum douglasii subsp. douglasii	Polygonum douglasii Greene
JM1: Polygonum douglasii subsp. johnstonii	Polygonum sawatchense subsp. sawatchense
JM1: Polygonum douglasii subsp. majus	Polygonum majus (Meisn.) Piper
JM1: Polygonum douglasii subsp. spergulariiforme	Polygonum spergulariiforme Small
JM2: Polygonum fowleri	Polygonum fowleri B.L. Rob.
JM2: Polygonum fowleri subsp. fowleri	Polygonum fowleri B.L. Rob. subsp. fowleri
JM2: Polygonum hickmanii	Polygonum hickmanii H.R. Hinds & Rand. Morgan
JM1: Polygonum hydropiper	Persicaria hydropiper (L.) Delarbre
JM1: Polygonum hydropiperoides	Persicaria hydropiperoides (Michx.) Small
JM1: Polygonum lapathifolium	Persicaria lapathifolia (L.) Gray
JM2: Polygonum majus	Polygonum majus (Meisn.) Piper
JM1: Polygonum marinense	Polygonum marinense T.R. Mert. & P.H. Raven
JM1: Polygonum minimum	Polygonum minimum S. Watson
JMS: Polygonum neglectum	Polygonum aviculare subsp. neglectum (Besser) Arcang.
JM1: Polygonum newberryi	Aconogonon newberryi (Small) Soj&aacute;k
JM1: Polygonum paronychia	Polygonum paronychia Cham. & Schltdl.
JM1: Polygonum parryi	Polygonum parryi Greene
JM1: Polygonum patulum	Polygonum ramosissimum Michx.
JM1: Polygonum pensylvanicum	Persicaria pensylvanica (L.) M. G&oacute;mez
JM1: Polygonum persicaria	Persicaria maculosa Gray
JM1: Polygonum phytolaccifolium	Aconogonon phytolaccifolium (Small) Rydb.
JM1: Polygonum polygaloides	Polygonum polygaloides Meisn.
JM1: Polygonum polygaloides subsp. confertiflorum	Polygonum polygaloides subsp. confertiflorum (Piper) J.C. Hickman
JM1: Polygonum polygaloides subsp. esotericum	Polygonum polygaloides subsp. esotericum (L.C. Wheeler) J.C. Hickman
JM1: Polygonum polygaloides subsp. kelloggii	Polygonum polygaloides subsp. kelloggii (Greene) J.C. Hickman
JM1: Polygonum polystachyum	Persicaria wallichii Greuter & Burdet
JM1: Polygonum prolificum	Polygonum ramosissimum subsp. prolificum (Small) Costea & Tardif
JM1: Polygonum punctatum	Persicaria punctata (Elliott) Small
JM1: Polygonum ramosissimum	Polygonum ramosissimum Michx.
JM2: Polygonum ramosissimum subsp. prolificum	Polygonum ramosissimum subsp. prolificum (Small) Costea & Tardif
JM1: Polygonum sachalinense	Fallopia sachalinensis (F. Schmidt) Ronse Decr.
JM2: Polygonum sawatchense	Polygonum sawatchense Small
JM2: Polygonum sawatchense subsp. oblivium	Polygonum sawatchense subsp. oblivium Costea & Tardif
JM2: Polygonum sawatchense subsp. sawatchense	Polygonum sawatchense subsp. sawatchense
JM1: Polygonum shastense	Polygonum shastense W.H. Brewer
JM2: Polygonum spergulariiforme	Polygonum spergulariiforme Small
JMS: Polygonum triandrum	Polygonum sawatchense subsp. sawatchense
JM1: Polypodium californicum	Polypodium californicum Kaulf.
JM1: Polypodium calirhiza	Polypodium calirhiza S.A. Whitmore & A.R. Sm.
JM1: Polypodium glycyrrhiza	Polypodium glycyrrhiza D.C. Eaton
JM1: Polypodium hesperium	Polypodium hesperium Maxon
JM1: Polypodium scouleri	Polypodium scouleri Hook. & Grev.
JM1: Polypogon australis	Polypogon australis Brongn.
JM1: Polypogon elongatus	Polypogon imberbis (Phil.) Johow
JM2: Polypogon imberbis	Polypogon imberbis (Phil.) Johow
JM1: Polypogon interruptus	Polypogon interruptus Kunth
JM1: Polypogon maritimus	Polypogon maritimus Willd.
JM1: Polypogon monspeliensis	Polypogon monspeliensis (L.) Desf.
JMS: Polypogon semiverticillatus	Polypogon viridis (Gouan) Breistr.
JM2: Polypogon viridis	Polypogon viridis (Gouan) Breistr.
JM1: Polystichum californicum	Polystichum californicum (D.C. Eaton) Diels
JM1: Polystichum dudleyi	Polystichum dudleyi Maxon
JM1: Polystichum imbricans	Polystichum imbricans (D.C. Eaton) D.H. Wagner
JM1: Polystichum imbricans subsp. curtum	Polystichum imbricans subsp. curtum (Ewan) D.H. Wagner
JM1: Polystichum imbricans subsp. imbricans	Polystichum imbricans (D.C. Eaton) D.H. Wagner subsp. imbricans
JM1: Polystichum kruckebergii	Polystichum kruckebergii W.H. Wagner
JM1: Polystichum lemmonii	Polystichum lemmonii Underw.
JM1: Polystichum lonchitis	Polystichum lonchitis (L.) Roth
JM1: Polystichum munitum	Polystichum munitum (Kaulf.) C. Presl
JM1: Polystichum scopulinum	Polystichum scopulinum (D.C. Eaton) Maxon
JM1: Populus alba	Populus alba L.
JM1: Populus angustifolia	Populus angustifolia E. James
JMS: Populus balsamifera	Populus trichocarpa Hook.
JM1: Populus balsamifera subsp. trichocarpa	Populus trichocarpa Hook.
JMS: Populus deltoides	Populus fremontii S. Watson
JMS: Populus deltoides var. fremontii	Populus fremontii S. Watson subsp. fremontii
JM2: Populus fremontii	Populus fremontii S. Watson
JM1: Populus fremontii subsp. fremontii	Populus fremontii S. Watson subsp. fremontii
JM2: Populus nigra	Populus nigra L.
JMS: Populus nigra var. italica	Populus nigra L.
JM1: Populus tremuloides	Populus tremuloides Michx.
JM2: Populus trichocarpa	Populus trichocarpa Hook.
JM1: Porophyllum gracile	Porophyllum gracile Benth.
JM2: Porophyllum ruderale	Porophyllum ruderale (Jacq.) Cass.
JM2: Porophyllum ruderale var. macrocephalum	Porophyllum ruderale (Jacq.) Cass. var. macrocephalum (DC.) Cronquist
JM1: Porterella carnosula	Porterella carnosula (Hook. & Arn.) Torr.
JM1: Portulaca halimoides	Portulaca halimoides L.
JM1: Portulaca oleracea	Portulaca oleracea L.
JM2: Potamogeton alpinus	Potamogeton alpinus Balb.
JM1: Potamogeton alpinus subsp. tenuifolius	Potamogeton alpinus Balb.
JM1: Potamogeton amplifolius	Potamogeton amplifolius Tuck.
JM2: Potamogeton berchtoldii	Potamogeton berchtoldii Fieber
JM1: Potamogeton crispus	Potamogeton crispus L.
JM1: Potamogeton diversifolius	Potamogeton diversifolius Raf.
JM2: Potamogeton epihydrus	Potamogeton epihydrus Raf.
JM1: Potamogeton epihydrus subsp. nuttallii	Potamogeton epihydrus Raf.
JM1: Potamogeton filiformis	misappl. to Stuckenia filiformis subsp. alpina
JMS: Potamogeton filiformis var. alpinus	Stuckenia filiformis (Pers.) B&ouml;rner subsp. alpina (Blytt) R.R. Haynes et al.
JMS: Potamogeton filiformis var. macounii	Stuckenia filiformis (Pers.) B&ouml;rner subsp. alpina (Blytt) R.R. Haynes et al.
JM1: Potamogeton foliosus	Potamogeton foliosus Raf.
JM2: Potamogeton foliosus subsp. fibrillosus	Potamogeton foliosus subsp. fibrillosus (Fernald) R.R. Haynes & Hellq.
JM2: Potamogeton foliosus subsp. foliosus	Potamogeton foliosus Raf. subsp. foliosus
JM1: Potamogeton foliosus var. fibrillosus	Potamogeton foliosus subsp. fibrillosus (Fernald) R.R. Haynes & Hellq.
JM1: Potamogeton foliosus var. foliosus	Potamogeton foliosus Raf. subsp. foliosus
JM1: Potamogeton gramineus	Potamogeton gramineus L.
JM1: Potamogeton illinoensis	Potamogeton illinoensis Morong
JM1: Potamogeton latifolius	Stuckenia striata (Ruiz & Pav.) Holub
JM1: Potamogeton natans	Potamogeton natans L.
JM1: Potamogeton nodosus	Potamogeton nodosus Poir.
JM1: Potamogeton pectinatus	Stuckenia pectinata (L.) B&ouml;rner
JM1: Potamogeton praelongus	Potamogeton praelongus Wulfen
JM1: Potamogeton pusillus	Potamogeton pusillus L.; Potamogeton berchtoldii Fieber
JMS: Potamogeton pusillus subsp. tenuissimus	Potamogeton berchtoldii Fieber
JM1: Potamogeton pusillus var. pusillus	Potamogeton pusillus L.
JM1: Potamogeton pusillus var. tenuissimus	Potamogeton berchtoldii Fieber
JM1: Potamogeton richardsonii	Potamogeton richardsonii (A. Benn.) Rydb.
JM1: Potamogeton robbinsii	Potamogeton robbinsii Oakes
JM1: Potamogeton zosteriformis	Potamogeton zosteriformis Fernald
JM2: Potentilla anglica	Potentilla anglica Laichard.
JM1: Potentilla anserina	Potentilla anserina L.
JM1: Potentilla anserina subsp. anserina	Potentilla anserina L. subsp. anserina
JM1: Potentilla anserina subsp. pacifica	Potentilla anserina subsp. pacifica (Howell) Rousi
JM2: Potentilla basaltica	Potentilla basaltica Tiehm & Ertter
JM1: Potentilla biennis	Potentilla biennis Greene
JM2: Potentilla breweri	Potentilla breweri S. Watson
JM2: Potentilla bruceae	Potentilla bruceae Rydb.
JM1: Potentilla concinna	misappl. to Potentilla concinna var. proxima
JM2: Potentilla concinna var. proxima	Potentilla concinna Richardson var. proxima (Rydb.) S.L. Welsh & B.C. Johnst.
JM1: Potentilla cristae	Potentilla cristae Ferlatte & Strother
JMS: Potentilla diversifolia	Potentilla glaucophylla Lehm. var. glaucophylla
JM1: Potentilla diversifolia var. diversifolia	misappl. to P. glaucophylla var. glaucophylla
JM1: Potentilla drummondii	Potentilla drummondii Lehm.; Potentilla breweri S. Watson; Potentilla bruceae Rydb.
JM1: Potentilla drummondii subsp. breweri	Potentilla breweri S. Watson
JM1: Potentilla drummondii subsp. bruceae	Potentilla bruceae Rydb.
JM1: Potentilla drummondii subsp. drummondii	Potentilla drummondii Lehm.
JM1: Potentilla flabellifolia	Potentilla flabellifolia Torr. & A. Gray
JM1: Potentilla fruticosa	Dasiphora fruticosa (L.) Rydb.
JM1: Potentilla glandulosa	Drymocallis glandulosa (Lindl.) Rydb.; Drymocallis lactea (Greene) Rydb.; Drymocallis cuneifolia Rydb.; Drymocallis rhomboidea (Rydb.) Rydb.; Drymocallis hansenii (Greene) Rydb.; Drymocallis pseudorupestris (Rydb.) Rydb.
JM1: Potentilla glandulosa subsp. ashlandica	Drymocallis lactea var. austiniae (Jeps.) Ertter
JM1: Potentilla glandulosa subsp. ewanii	Drymocallis cuneifolia var. ewanii (D.D. Keck) Ertter
JM1: Potentilla glandulosa subsp. glandulosa	Drymocallis glandulosa (Lindl.) Rydb. var. glandulosa
JM1: Potentilla glandulosa subsp. globosa	Drymocallis rhomboidea (Rydb.) Rydb.
JM1: Potentilla glandulosa subsp. hansenii	Drymocallis hansenii (Greene) Rydb.
JM1: Potentilla glandulosa subsp. nevadensis	Drymocallis lactea (Greene) Rydb. var. lactea
JM1: Potentilla glandulosa subsp. pseudorupestris	Drymocallis pseudorupestris (Rydb.) Rydb.
JM1: Potentilla glandulosa subsp. reflexa	Drymocallis glandulosa var. reflexa (Greene) Ertter
JM2: Potentilla glaucophylla	Potentilla glaucophylla Lehm.
JM2: Potentilla glaucophylla var. glaucophylla	Potentilla glaucophylla Lehm. var. glaucophylla
JM1: Potentilla gracilis	Potentilla gracilis Hook.
JM1: Potentilla gracilis var. elmeri	Potentilla gracilis var. elmeri (Rydb.) Jeps.
JM1: Potentilla gracilis var. fastigiata	Potentilla gracilis var. fastigiata (Nutt.) S. Watson
JM1: Potentilla gracilis var. flabelliformis	Potentilla gracilis var. flabelliformis (Lehm.) Torr. & A. Gray
JM1: Potentilla gracilis var. gracilis	Potentilla gracilis Hook. var. gracilis
JM1: Potentilla grayi	Potentilla grayi S. Watson
JM1: Potentilla hickmanii	Potentilla hickmanii Eastw.
JM2: Potentilla jepsonii	Potentilla jepsonii Ertter
JM1: Potentilla millefolia	Potentilla millefolia Rydb.
JM1: Potentilla morefieldii	Potentilla morefieldii Ertter
JM1: Potentilla multijuga	Potentilla multijuga Lehm.
JM1: Potentilla newberryi	Potentilla newberryi A. Gray
JM1: Potentilla norvegica	Potentilla norvegica L.
JM1: Potentilla palustris	Comarum palustre L.
JMS: Potentilla peirsonii	Drymocallis cuneifolia Rydb. var. cuneifolia
JM1: Potentilla pensylvanica	Potentilla pensylvanica L.
JM1: Potentilla pseudosericea	Potentilla pseudosericea Rydb.
JM2: Potentilla pulcherrima	Potentilla pulcherrima Lehm.
JM1: Potentilla recta	Potentilla recta L.
JM1: Potentilla rimicola	Potentilla rimicola (Munz & I.M. Johnst.) Ertter
JM1: Potentilla rivalis	Potentilla rivalis Nutt.
JM2: Potentilla uliginosa	Potentilla uliginosa B.C. Johnst. & Ertter
JM1: Potentilla wheeleri	Potentilla wheeleri S. Watson
JM2: Poteridium annuum	Poteridium annuum (Nutt.) Spach
JM2: Poterium sanguisorba	Poterium sanguisorba L.
JM1: Prenanthella exigua	Prenanthella exigua (A. Gray) Rydb.
JMS: Primula clevelandii	Dodecatheon clevelandii Greene
JMS: Primula clevelandii var. gracilis	Dodecatheon clevelandii subsp. sanctarum (Greene) Abrams
JMS: Primula clevelandii var. insularis	Dodecatheon clevelandii subsp. insulare H.J. Thomps.
JMS: Primula clevelandii var. patula	Dodecatheon clevelandii subsp. patulum (Kuntze) H.J. Thomps.
JMS: Primula conjugens	Dodecatheon conjugens Greene
JMS: Primula fragrans	Dodecatheon redolens (H.M. Hall) H.J. Thomps.
JMS: Primula hendersonii	Dodecatheon hendersonii A. Gray
JMS: Primula jeffreyi	Dodecatheon jeffreyi Van Houtte
JMS: Primula pauciflora	Dodecatheon pulchellum (Raf.) Merr.
JMS: Primula subalpina	Dodecatheon subalpinum Eastw.
JM1: Primula suffrutescens	Primula suffrutescens A. Gray
JMS: Primula tetrandra	Dodecatheon alpinum (A. Gray) Greene
JM1: Prionopsis ciliata	excluded (historical waif)
JM1: Proboscidea althaeifolia	Proboscidea althaeifolia (Benth.) Decne.
JM2: Proboscidea louisianica	Proboscidea louisianica (Mill.) Thell.
JM1: Proboscidea louisianica subsp. louisianica	Proboscidea louisianica (Mill.) Thell. subsp. louisianica
JM1: Proboscidea lutea	Proboscidea lutea (Lindl.) Stapf
JMS: Proboscidea parviflora	excluded
JM1: Proboscidea parviflora subsp. parviflora	excluded
JM2: Prosartes hookeri	Prosartes hookeri Torr.
JM2: Prosartes parvifolia	Prosartes parvifolia S. Watson
JM2: Prosartes smithii	Prosartes smithii (Hook.) Utech et al.
JM2: Prosopis glandulosa	Prosopis glandulosa Torr.
JM1: Prosopis glandulosa var. torreyana	Prosopis glandulosa Torr. var. torreyana (L.D. Benson) M.C. Johnst.
JM1: Prosopis pubescens	Prosopis pubescens Benth.
JM1: Prosopis strombulifera	Prosopis strombulifera (Lam.) Benth.
JM1: Prosopis velutina	Prosopis velutina Wooton
JM1: Prunella vulgaris	Prunella vulgaris L.
JMS: Prunella vulgaris subsp. lanceolata	Prunella vulgaris var. lanceolata (W.P.C. Barton) Fernald
JMS: Prunella vulgaris var. atropurpurea	Prunella vulgaris var. lanceolata (W.P.C. Barton) Fernald
JM1: Prunella vulgaris var. lanceolata	Prunella vulgaris var. lanceolata (W.P.C. Barton) Fernald
JMS: Prunella vulgaris var. parviflora	Prunella vulgaris L. var. vulgaris
JM1: Prunella vulgaris var. vulgaris	Prunella vulgaris L. var. vulgaris
JMS: Prunus amygdalus	Prunus dulcis (Mill.) D.A. Webb
JM1: Prunus andersonii	Prunus andersonii A. Gray
JM1: Prunus cerasifera	Prunus cerasifera Ehrh.
JM1: Prunus dulcis	Prunus dulcis (Mill.) D.A. Webb
JM1: Prunus emarginata	Prunus emarginata (Douglas) Eaton
JM2: Prunus eremophila	Prunus eremophila Prigge
JM1: Prunus fasciculata	Prunus fasciculata (Torr.) A. Gray
JM1: Prunus fasciculata var. fasciculata	Prunus fasciculata (Torr.) A. Gray var. fasciculata
JM1: Prunus fasciculata var. punctata	Prunus fasciculata var. punctata Jeps.
JM1: Prunus fremontii	Prunus fremontii S. Watson
JM1: Prunus ilicifolia	Prunus ilicifolia (Hook. & Arn.) D. Dietr.
JM1: Prunus ilicifolia subsp. ilicifolia	Prunus ilicifolia (Hook. & Arn.) D. Dietr. subsp. ilicifolia
JM1: Prunus ilicifolia subsp. lyonii	Prunus ilicifolia subsp. lyonii (Eastw.) P.H. Raven
JM2: Prunus persica	Prunus persica (L.) Batsch
JM1: Prunus subcordata	Prunus subcordata Benth.
JM2: Prunus virginiana	Prunus virginiana L.
JM1: Prunus virginiana var. demissa	Prunus virginiana L. var. demissa (Nutt.) Torr.
JM1: Psathyrotes annua	Psathyrotes annua (Nutt.) A. Gray
JM1: Psathyrotes ramosissima	Psathyrotes ramosissima (Torr.) A. Gray
JMS: Pseudelymus saxicola	Elymus spicatus (Pursh) Gould
JM1: Pseudobahia bahiifolia	Pseudobahia bahiifolia (Benth.) Rydb.
JM1: Pseudobahia heermannii	Pseudobahia heermannii (Durand) Rydb.
JM1: Pseudobahia peirsonii	Pseudobahia peirsonii Munz
JM2: Pseudognaphalium beneolens	Pseudognaphalium beneolens (Davidson) Anderb.
JM2: Pseudognaphalium biolettii	Pseudognaphalium biolettii Anderb.
JM2: Pseudognaphalium californicum	Pseudognaphalium californicum (DC.) Anderb.
JM2: Pseudognaphalium canescens	Pseudognaphalium canescens (DC.) Anderb.
JM2: Pseudognaphalium leucocephalum	Pseudognaphalium leucocephalum (A. Gray) Anderb.
JM2: Pseudognaphalium luteoalbum	Pseudognaphalium luteoalbum (L.) Hilliard & B.L. Burtt
JM2: Pseudognaphalium macounii	Pseudognaphalium macounii (Greene) Kartesz
JM2: Pseudognaphalium microcephalum	Pseudognaphalium microcephalum (Nutt.) Anderb.
JMS: Pseudognaphalium microcephalum var. thermale	Pseudognaphalium thermale (E.E. Nelson) G.L. Nesom
JM2: Pseudognaphalium ramosissimum	Pseudognaphalium ramosissimum (Nutt.) Anderb.
JM2: Pseudognaphalium roseum	Pseudognaphalium roseum (Kunth) Anderb.
JM2: Pseudognaphalium stramineum	Pseudognaphalium stramineum (Kunth) Anderb.
JM2: Pseudognaphalium thermale	Pseudognaphalium thermale (E.E. Nelson) G.L. Nesom
JM1: Pseudoroegneria spicata	Elymus spicatus (Pursh) Gould
JM2: Pseudorontium cyathiferum	Pseudorontium cyathiferum (Benth.) Rothm.
JM1: Pseudostellaria jamesiana	Pseudostellaria jamesiana (Torr.) W.A. Weber & R.L. Hartm.
JM2: Pseudostellaria sierrae	Pseudostellaria sierrae Rabeler & R.L. Hartm.
JM2: Pseudotrillium rivale	Pseudotrillium rivale (S. Watson) S.B. Farmer
JM1: Pseudotsuga macrocarpa	Pseudotsuga macrocarpa (Vasey) Mayr
JM2: Pseudotsuga menziesii	Pseudotsuga menziesii (Mirb.) Franco
JM1: Pseudotsuga menziesii var. menziesii	Pseudotsuga menziesii (Mirb.) Franco var. menziesii
JM1: Psilocarphus brevissimus	Psilocarphus brevissimus Nutt.
JM1: Psilocarphus brevissimus var. brevissimus	Psilocarphus brevissimus Nutt. var. brevissimus
JM1: Psilocarphus brevissimus var. multiflorus	Psilocarphus brevissimus var. multiflorus Cronquist
JM2: Psilocarphus chilensis	Psilocarphus chilensis A. Gray
JM1: Psilocarphus elatior	Psilocarphus elatior (A. Gray) A. Gray
JMS: Psilocarphus globiferus	Psilocarphus brevissimus Nutt. var. brevissimus; Psilocarphus chilensis A. Gray
JM1: Psilocarphus oregonus	Psilocarphus oregonus Nutt.
JM1: Psilocarphus tenellus	Psilocarphus tenellus Nutt.; Psilocarphus chilensis A. Gray
JM1: Psilocarphus tenellus var. globiferus	Psilocarphus chilensis A. Gray
JM1: Psilocarphus tenellus var. tenellus	Psilocarphus tenellus Nutt.
JMS: Psilocarphus tenellus var. tenuis	Psilocarphus chilensis A. Gray
JM1: Psilostrophe cooperi	Psilostrophe cooperi (A. Gray) Greene
JMS: Psoralea bituminosa	Bituminaria bituminosa (L.) C.H. Stirt.
JMS: Psoralea physodes	Rupertia physodes (Douglas) J.W. Grimes
JM1: Psoralidium lanceolatum	Ladeania lanceolata (Pursh) A.N. Egan & Reveal
JM1: Psorothamnus arborescens	Psorothamnus arborescens (A. Gray) Barneby
JM1: Psorothamnus arborescens var. arborescens	Psorothamnus arborescens (A. Gray) Barneby var. arborescens
JM1: Psorothamnus arborescens var. minutifolius	Psorothamnus arborescens var. minutifolius (Parish) Barneby
JM1: Psorothamnus arborescens var. simplicifolius	Psorothamnus arborescens var. simplicifolius (Parish) Barneby
JM1: Psorothamnus emoryi	Psorothamnus emoryi (A. Gray) Rydb.
JM1: Psorothamnus fremontii	Psorothamnus fremontii (A. Gray) Barneby
JM1: Psorothamnus fremontii var. attenuatus	Psorothamnus fremontii var. attenuatus Barneby
JM1: Psorothamnus fremontii var. fremontii	Psorothamnus fremontii (A. Gray) Barneby var. fremontii
JM1: Psorothamnus polydenius	Psorothamnus polydenius (Torr.) Rydb.
JM1: Psorothamnus schottii	Psorothamnus schottii (Torr.) Barneby
JM1: Psorothamnus spinosus	Psorothamnus spinosus (A. Gray) Barneby
JM1: Ptelea crenulata	Ptelea crenulata Greene
JM2: Pteridium aquilinum	Pteridium aquilinum (L.) Kuhn
JM1: Pteridium aquilinum var. pubescens	Pteridium aquilinum (L.) Kuhn var. pubescens Underw.
JM1: Pteris cretica	Pteris cretica L.
JM1: Pteris tremula	Pteris tremula R. Br.
JM1: Pteris vittata	Pteris vittata L.
JM2: Pterocarya stenoptera	Pterocarya stenoptera C. DC.
JM1: Pterospora andromedea	Pterospora andromedea Nutt.
JM1: Pterostegia drymarioides	Pterostegia drymarioides Fisch. & C.A. Mey.
JMS: Pteryxia petraea	Cymopterus terebinthinus var. petraeus (M.E. Jones) Goodrich
JMS: Pteryxia terebinthinus	Cymopterus terebinthinus
JMS: Pteryxia terebinthinus var. californicus	Cymopterus terebinthinus var. californicus (J.M. Coult. & Rose) Jeps.
JM1: Ptilagrostis kingii	Stipa kingii Bol.
JMS: Puccinellia airoides	Puccinellia nuttalliana (Schult.) Hitchc.
JMS: Puccinellia californica	Torreyochloa pallida (Torr.) G.L. Church var. pauciflora (J. Presl) J.I. Davis
JM1: Puccinellia distans	Puccinellia distans (Jacq.) Parl.
JMS: Puccinellia erecta	Torreyochloa erecta (Hitchc.) G.L. Church
JMS: Puccinellia grandis	Puccinellia nutkaensis (J. Presl) Fernald & Weath.
JM1: Puccinellia howellii	Puccinellia howellii J.I. Davis
JM1: Puccinellia lemmonii	Puccinellia lemmonii (Vasey) Scribn.
JM1: Puccinellia nutkaensis	Puccinellia nutkaensis (J. Presl) Fernald & Weath.
JM1: Puccinellia nuttalliana	Puccinellia nuttalliana (Schult.) Hitchc.
JM1: Puccinellia parishii	Puccinellia parishii Hitchc.
JMS: Puccinellia pauciflora	Torreyochloa pallida (Torr.) G.L. Church var. pauciflora (J. Presl) J.I. Davis
JM1: Puccinellia pumila	Puccinellia pumila (Vasey) Hitchc.
JM1: Puccinellia simplex	Puccinellia simplex Scribn.
JM1: Pulicaria paludosa	Pulicaria paludosa Link
JM1: Punica granatum	Punica granatum L.
JMS: Purshia mexicana	Purshia stansburyana (Torr.) Henrickson
JM1: Purshia mexicana var. stansburyana	Purshia stansburyana (Torr.) Henrickson
JM2: Purshia stansburyana	Purshia stansburyana (Torr.) Henrickson
JM1: Purshia tridentata	Purshia tridentata (Pursh) DC.
JM1: Purshia tridentata var. glandulosa	Purshia tridentata var. glandulosa (Curran) M.E. Jones
JM1: Purshia tridentata var. tridentata	Purshia tridentata (Pursh) DC. var. tridentata
JM1: Pycnanthemum californicum	Pycnanthemum californicum Durand
JM1: Pyracantha angustifolia	Pyracantha angustifolia (Franch.) C.K. Schneid.
JM2: Pyracantha atalantioides	Pyracantha atalantioides (Hance) Stapf
JM2: Pyracantha coccinea	Pyracantha coccinea M. Roem.
JM2: Pyracantha crenulata	Pyracantha crenulata (D. Don) M. Roem.
JM2: Pyracantha fortuneana	Pyracantha fortuneana (Maxim.) H.L. Li
JM2: Pyracantha koidzumii	Pyracantha koidzumii (Hayata) Rehder
JM1: Pyrola asarifolia	Pyrola asarifolia Michx.
JM1: Pyrola asarifolia subsp. asarifolia	Pyrola asarifolia Michx. subsp. asarifolia
JM1: Pyrola asarifolia subsp. bracteata	Pyrola asarifolia subsp. bracteata (Hook.) Haber
JM1: Pyrola chlorantha	Pyrola chlorantha Sw.
JM1: Pyrola minor	Pyrola minor L.
JM1: Pyrola picta	Pyrola picta Sm.
JM1: Pyrrocoma apargioides	Pyrrocoma apargioides (A. Gray) Greene
JM2: Pyrrocoma carthamoides	Pyrrocoma carthamoides Hook.
JM1: Pyrrocoma carthamoides var. cusickii	Pyrrocoma carthamoides Hook. var. cusickii (A. Gray) Kartesz & Gandhi
JM1: Pyrrocoma hirta	Pyrrocoma hirta (A. Gray) Greene
JM1: Pyrrocoma hirta var. hirta	Pyrrocoma hirta (A. Gray) Greene var. hirta
JM1: Pyrrocoma hirta var. lanulosa	Pyrrocoma hirta var. lanulosa (Greene) G.K. Br. & D.J. Keil
JM1: Pyrrocoma lanceolata	Pyrrocoma lanceolata (Hook.) Greene
JM1: Pyrrocoma lanceolata var. lanceolata	Pyrrocoma lanceolata (Hook.) Greene var. lanceolata
JM1: Pyrrocoma lanceolata var. subviscosa	Pyrrocoma lanceolata var. subviscosa (Greene) G.K. Br. & D.J. Keil
JM1: Pyrrocoma lucida	Pyrrocoma lucida (D.D. Keck) Kartesz & Gandhi
JM1: Pyrrocoma racemosa	Pyrrocoma racemosa (Nutt.) Torr. & A. Gray
JM1: Pyrrocoma racemosa var. congesta	Pyrrocoma racemosa var. congesta (Greene) G.K. Br. & D.J. Keil
JM1: Pyrrocoma racemosa var. paniculata	Pyrrocoma racemosa var. paniculata (Nutt.) Kartesz & Gandhi
JM1: Pyrrocoma racemosa var. pinetorum	Pyrrocoma racemosa var. pinetorum (D.D. Keck) Kartesz & Gandhi
JM1: Pyrrocoma racemosa var. racemosa	Pyrrocoma racemosa (Nutt.) Torr. & A. Gray var. racemosa
JM1: Pyrrocoma racemosa var. sessiliflora	Pyrrocoma racemosa var. sessiliflora (Greene) G.K. Br. & D.J. Keil
JM1: Pyrrocoma uniflora	Pyrrocoma uniflora (Hook.) Greene
JM1: Pyrrocoma uniflora var. gossypina	Pyrrocoma uniflora var. gossypina (Greene) Kartesz & Gandhi
JM1: Pyrrocoma uniflora var. uniflora	Pyrrocoma uniflora (Hook.) Greene var. uniflora
JM2: Pyrus communis	Pyrus communis L.
JMS: Pyrus malus	Malus pumila Mill.
JM2: Quercus &times;acutidens	Quercus &times;acutidens Torr.
JM2: Quercus &times;alvordiana	Quercus &times;alvordiana Eastw.
JM2: Quercus &times;macdonaldii	Quercus &times;macdonaldii Greene
JM1: Quercus agrifolia	Quercus agrifolia N&eacute;e
JM1: Quercus agrifolia var. agrifolia	Quercus agrifolia N&eacute;e var. agrifolia
JMS: Quercus agrifolia var. frutescens	Quercus agrifolia N&eacute;e var. agrifolia
JM1: Quercus agrifolia var. oxyadenia	Quercus agrifolia var. oxyadenia (Torr.) J.T. Howell
JM1: Quercus berberidifolia	Quercus berberidifolia Liebm.
JM2: Quercus cedrosensis	Quercus cedrosensis C.H. Mull.
JM1: Quercus chrysolepis	Quercus chrysolepis Liebm.
JMS: Quercus chrysolepis var. nana	Quercus chrysolepis Liebm.
JM1: Quercus cornelius-mulleri	Quercus cornelius-mulleri Nixon & K.P. Steele
JM1: Quercus douglasii	Quercus douglasii Hook. & Arn.
JM1: Quercus dumosa	Quercus dumosa Nutt.
JMS: Quercus dunnii	Quercus palmeri (Engelm.) Engelm.
JM1: Quercus durata	Quercus durata Jeps.
JM1: Quercus durata var. durata	Quercus durata Jeps. var. durata
JM1: Quercus durata var. gabrielensis	Quercus durata var. gabrielensis Nixon & C.H. Mull.
JM1: Quercus engelmannii	Quercus engelmannii Greene
JM1: Quercus garryana	Quercus garryana Hook.
JM1: Quercus garryana var. breweri	Quercus garryana var. breweri (Engelm.) Jeps.
JM1: Quercus garryana var. garryana	Quercus garryana Hook. var. garryana
JM2: Quercus garryana var. semota	Quercus garryana var. semota Jeps.
JM2: Quercus ilex	Quercus ilex L.
JM1: Quercus john-tuckeri	Quercus john-tuckeri Nixon & C.H. Mull.
JM1: Quercus kelloggii	Quercus kelloggii Newb.
JM1: Quercus lobata	Quercus lobata N&eacute;e
JMS: Quercus lobata var. turbinata	Quercus lobata N&eacute;e
JMS: Quercus lobata var. walteri	Quercus lobata N&eacute;e
JM2: Quercus pacifica	Quercus pacifica Nixon & C.H. Mull.
JM1: Quercus palmeri	Quercus palmeri (Engelm.) Engelm.
JM1: Quercus parvula	Quercus parvula Greene
JM1: Quercus parvula var. parvula	Quercus parvula Greene var. parvula
JM1: Quercus parvula var. shrevei	Quercus parvula var. shrevei (C.H. Mull.) Nixon
JM2: Quercus parvula var. tamalpaisensis	Quercus parvula var. tamalpaisensis S.K. Langer
JM1: Quercus sadleriana	Quercus sadleriana R. Br. ter
JM1: Quercus tomentella	Quercus tomentella Engelm.
JM1: Quercus turbinella	Quercus turbinella Greene
JM1: Quercus vaccinifolia	Quercus vacciniifolia Kellogg
JM2: Quercus vacciniifolia	Quercus vacciniifolia Kellogg
JM1: Quercus wislizeni	Quercus wislizeni A. DC.
JM1: Quercus wislizeni var. frutescens	Quercus wislizeni var. frutescens Engelm.
JM1: Quercus wislizeni var. wislizeni	Quercus wislizeni A. DC. var. wislizeni
JM1: Rafinesquia californica	Rafinesquia californica Nutt.
JM1: Rafinesquia neomexicana	Rafinesquia neomexicana A. Gray
JM1: Raillardella argentea	Raillardella argentea (A. Gray) A. Gray
JM1: Raillardella pringlei	Raillardella pringlei Greene
JM1: Raillardella scaposa	Raillardella scaposa (A. Gray) A. Gray
JM1: Raillardiopsis muirii	Carlquistia muirii (A. Gray) B.G. Baldwin
JM1: Raillardiopsis scabrida	Anisocarpus scabridus (Eastw.) B.G. Baldwin
JM1: Ranunculus acris	Ranunculus acris L.
JM1: Ranunculus alismifolius	Ranunculus alismifolius Benth.
JM1: Ranunculus alismifolius var. alismellus	Ranunculus alismifolius var. alismellus A. Gray
JM1: Ranunculus alismifolius var. alismifolius	Ranunculus alismifolius Benth. var. alismifolius
JM2: Ranunculus alismifolius var. hartwegii	Ranunculus alismifolius var. hartwegii (Greene) Jeps.
JM2: Ranunculus alismifolius var. lemmonii	Ranunculus alismifolius var. lemmonii (A. Gray) L.D. Benson
JM1: Ranunculus andersonii	Ranunculus andersonii A. Gray
JM2: Ranunculus aquatilis	Ranunculus aquatilis L.
JM2: Ranunculus aquatilis var. aquatilis	Ranunculus aquatilis L. var. aquatilis
JMS: Ranunculus aquatilis var. capillaceus	Ranunculus aquatilis var. diffusus With.
JM2: Ranunculus aquatilis var. diffusus	Ranunculus aquatilis var. diffusus With.
JMS: Ranunculus aquatilis var. hispidulus	Ranunculus aquatilis L. var. aquatilis
JMS: Ranunculus aquatilis var. subrigidus	Ranunculus aquatilis var. diffusus With.
JM1: Ranunculus aquatilus	Ranunculus aquatilis L.
JM1: Ranunculus aquatilus var. capillaceus	Ranunculus aquatilis var. diffusus With.
JM1: Ranunculus aquatilus var. hispidulus	Ranunculus aquatilis L. var. aquatilis
JM1: Ranunculus aquatilus var. subrigidus	Ranunculus aquatilis var. diffusus With.
JM1: Ranunculus arvensis	Ranunculus arvensis L.
JM2: Ranunculus bonariensis	Ranunculus bonariensis Poir.
JM1: Ranunculus bonariensis var. trisepalus	Ranunculus bonariensis Poir. var. trisepalus (Hook. & Arn.) Lourteig
JM1: Ranunculus bulbosus	Ranunculus bulbosus L.
JM1: Ranunculus californicus	Ranunculus californicus Benth.
JM2: Ranunculus californicus var. californicus	Ranunculus californicus Benth. var. californicus
JM2: Ranunculus californicus var. cuneatus	Ranunculus californicus var. cuneatus Greene
JM1: Ranunculus canus	Ranunculus canus Benth.
JM2: Ranunculus canus var. canus	Ranunculus canus Benth. var. canus
JM2: Ranunculus canus var. ludovicianus	Ranunculus canus var. ludovicianus (Greene) L.D. Benson
JM2: Ranunculus cymbalaria	Ranunculus cymbalaria Pursh
JM1: Ranunculus cymbalaria var. saximontanus	Ranunculus cymbalaria Pursh
JM1: Ranunculus eschscholtzii	Ranunculus eschscholtzii Schltdl.
JM2: Ranunculus eschscholtzii var. eschscholtzii	Ranunculus eschscholtzii Schltdl. var. eschscholtzii
JM1: Ranunculus eschscholtzii var. oxynotus	Ranunculus eschscholtzii var. oxynotus (A. Gray) Jeps.
JM1: Ranunculus eschscholtzii var. suksdorfii	Ranunculus eschscholtzii var. suksdorfii (A. Gray) L.D. Benson
JM1: Ranunculus flabellaris	Ranunculus flabellaris Raf.
JM1: Ranunculus flammula	Ranunculus flammula L.
JM2: Ranunculus flammula var. flammula	Ranunculus flammula L. var. flammula
JM2: Ranunculus flammula var. ovalis	Ranunculus flammula var. ovalis (Bigelow) L.D. Benson
JM1: Ranunculus glaberrimus	Ranunculus glaberrimus Hook.
JM1: Ranunculus glaberrimus var. ellipticus	Ranunculus glaberrimus var. ellipticus (Greene) Greene
JM1: Ranunculus glaberrimus var. glaberrimus	Ranunculus glaberrimus Hook. var. glaberrimus
JM1: Ranunculus gormanii	Ranunculus gormanii Greene
JM1: Ranunculus hebecarpus	Ranunculus hebecarpus Hook. & Arn.
JM1: Ranunculus hydrocharoides	Ranunculus hydrocharoides A. Gray
JM2: Ranunculus hystriculus	Ranunculus hystriculus A. Gray
JM1: Ranunculus lobbii	Ranunculus lobbii (Hiern) A. Gray
JM1: Ranunculus macounii	Ranunculus macounii Britton
JM1: Ranunculus muricatus	Ranunculus muricatus L.
JM1: Ranunculus occidentalis	Ranunculus occidentalis Nutt.
JM2: Ranunculus occidentalis var. dissectus	Ranunculus occidentalis var. dissectus L.F. Hend.
JM2: Ranunculus occidentalis var. howellii	Ranunculus occidentalis var. howellii Greene
JM2: Ranunculus occidentalis var. occidentalis	Ranunculus occidentalis Nutt. var. occidentalis
JM2: Ranunculus occidentalis var. ultramontanus	Ranunculus occidentalis var. ultramontanus Greene
JM1: Ranunculus orthorhynchus	Ranunculus orthorhynchus Hook.
JM1: Ranunculus orthorhynchus var. bloomeri	Ranunculus orthorhynchus var. bloomeri (S. Watson) L.D. Benson
JM1: Ranunculus orthorhynchus var. orthorhynchus	Ranunculus orthorhynchus var. orthorhynchus
JM2: Ranunculus orthorhynchus var. platyphyllus	Ranunculus orthorhynchus var. platyphyllus A. Gray
JM1: Ranunculus parviflorus	Ranunculus parviflorus L.
JM1: Ranunculus populago	Ranunculus populago Greene
JM1: Ranunculus pusillus	Ranunculus pusillus Poir.
JM1: Ranunculus repens	Ranunculus repens L.
JM1: Ranunculus sardous	Ranunculus sardous Crantz
JM1: Ranunculus sceleratus	Ranunculus sceleratus L.
JM2: Ranunculus sceleratus var. multifidus	Ranunculus sceleratus var. multifidus Nutt.
JM2: Ranunculus sceleratus var. sceleratus	Ranunculus sceleratus var. sceleratus
JM1: Ranunculus testiculatus	Ranunculus testiculatus Crantz
JM2: Ranunculus trilobus	Ranunculus trilobus Desf.
JM1: Ranunculus uncinatus	Ranunculus uncinatus D. Don
JMS: Ranunculus uncinatus var. parviflorus	Ranunculus uncinatus D. Don
JM1: Raphanus raphanistrum	Raphanus raphanistrum L.
JM1: Raphanus sativus	Raphanus sativus L.
JM1: Rapistrum rugosum	Rapistrum rugosum (L.) All.
JMS: Ratibida columnaris	Ratibida columnifera (Nutt.) Wooton & Standl.
JMS: Ratibida columnaris var. pulcherrima	Ratibida columnifera (Nutt.) Wooton & Standl.
JM2: Ratibida columnifera	Ratibida columnifera (Nutt.) Wooton & Standl.
JM1: Reseda alba	Reseda alba L.
JM1: Reseda lutea	Reseda lutea L.
JM1: Reseda luteola	Reseda luteola L.
JM1: Reseda odorata	Reseda odorata L.
JMS: Retama monosperma	Genista monosperma (L.) Lam.
JM1: Rhagadiolus stellatus	Rhagadiolus stellatus (L.) Gaertn.
JM2: Rhamnus alaterna	Rhamnus alaterna L.
JM1: Rhamnus alnifolia	Rhamnus alnifolia L'H&eacute;r.
JMS: Rhamnus annonifolia	Frangula purshiana subsp. annonifolia (Greene) Sawyer & S.W. Edwards
JM1: Rhamnus californica	Frangula californica (Eschsch.) A. Gray; Frangula rubra (Greene) Grubov
JM1: Rhamnus californica subsp. californica	Frangula californica (Eschsch.) A. Gray
JMS: Rhamnus californica subsp. crassifolia	Frangula californica subsp. crassifolia (Jeps.) Kartesz & Gandhi
JMS: Rhamnus californica subsp. cuspidata	Frangula californica subsp. cuspidata (Greene) Kartesz & Gandhi
JM1: Rhamnus californica subsp. occidentalis	Frangula californica subsp. occidentalis (Greene) Kartesz & Gandhi
JMS: Rhamnus californica subsp. tomentella	Frangula californica subsp. tomentella (Benth.) Kartesz & Gandhi
JMS: Rhamnus californica subsp. ursina	Frangula californica subsp. ursina (Greene) Kartesz & Gandhi
JMS: Rhamnus californica var. crassifolia	Frangula californica subsp. crassifolia (Jeps.) Kartesz & Gandhi
JMS: Rhamnus californica var. obtusissima	Frangula californica (Eschsch.) A. Gray
JMS: Rhamnus californica var. occidentalis	Frangula californica subsp. occidentalis (Greene) Kartesz & Gandhi
JMS: Rhamnus californica var. rubra	Frangula rubra (Greene) Grubov
JMS: Rhamnus californica var. tomentella	Frangula californica subsp. tomentella (Benth.) Kartesz & Gandhi
JMS: Rhamnus californica var. ursina	Frangula californica subsp. ursina (Greene) Kartesz & Gandhi
JMS: Rhamnus californica var. viridula	Frangula californica subsp. cuspidata (Greene) Kartesz & Gandhi
JMS: Rhamnus catalinae	Rhamnus pirifolia Greene
JM1: Rhamnus crocea	Rhamnus crocea Nutt.; Rhamnus ilicifolia Kellogg; Rhamnus pilosa (Curran) Abrams; Rhamnus pirifolia Greene
JMS: Rhamnus crocea subsp. ilicifolia	Rhamnus ilicifolia Kellogg
JMS: Rhamnus crocea subsp. pilosa	Rhamnus pilosa (Curran) Abrams
JMS: Rhamnus crocea subsp. pirifolia	Rhamnus pirifolia Greene
JMS: Rhamnus crocea var. ilicifolia	Rhamnus ilicifolia Kellogg
JMS: Rhamnus crocea var. insularis	Rhamnus pirifolia Greene
JMS: Rhamnus crocea var. pilosa	Rhamnus pilosa (Curran) Abrams
JMS: Rhamnus crocea var. pirifolia	Rhamnus pirifolia Greene
JMS: Rhamnus cuspidata	Frangula californica subsp. cuspidata (Greene) Kartesz & Gandhi
JM1: Rhamnus ilicifolia	Rhamnus ilicifolia Kellogg
JMS: Rhamnus obtusissima	Frangula rubra subsp. obtusissima (Greene) Kartesz & Gandhi
JMS: Rhamnus occidentalis	Frangula californica subsp. occidentalis (Greene) Kartesz & Gandhi
JM1: Rhamnus pilosa	Rhamnus pilosa (Curran) Abrams
JM1: Rhamnus pirifolia	Rhamnus pirifolia Greene
JM1: Rhamnus purshiana	Frangula purshiana (DC.) J.G. Cooper
JMS: Rhamnus purshiana var. annonifolia	Frangula purshiana subsp. annonifolia (Greene) Sawyer & S.W. Edwards
JM1: Rhamnus rubra	Frangula rubra (Greene) Grubov
JMS: Rhamnus rubra subsp. modocensis	Frangula rubra subsp. modocensis (C.B. Wolf) Kartesz & Gandhi
JMS: Rhamnus rubra subsp. obtusissima	Frangula rubra subsp. obtusissima (Greene) Kartesz & Gandhi
JMS: Rhamnus rubra subsp. rubra	Frangula rubra subsp. obtusissima (Greene) Kartesz & Gandhi
JMS: Rhamnus rubra subsp. yosemitana	Frangula rubra subsp. yosemitana (C.B. Wolf) Kartesz & Gandhi
JMS: Rhamnus rubra var. modocensis	Frangula rubra subsp. modocensis (C.B. Wolf) Kartesz & Gandhi
JMS: Rhamnus rubra var. obtusissima	Frangula rubra subsp. obtusissima (Greene) Kartesz & Gandhi
JMS: Rhamnus rubra var. yosemitana	Frangula rubra subsp. yosemitana (C.B. Wolf) Kartesz & Gandhi
JM1: Rhamnus tomentella	Frangula californica
JM1: Rhamnus tomentella subsp. crassifolia	Frangula californica subsp. crassifolia (Jeps.) Kartesz & Gandhi
JM1: Rhamnus tomentella subsp. cuspidata	Frangula californica subsp. cuspidata (Greene) Kartesz & Gandhi
JM1: Rhamnus tomentella subsp. tomentella	Frangula californica subsp. tomentella (Benth.) Kartesz & Gandhi
JM1: Rhamnus tomentella subsp. ursina	Frangula californica subsp. ursina (Greene) Kartesz & Gandhi
JM1: Rhamnus tomentella var. ursina	Frangula californica subsp. ursina (Greene) Kartesz & Gandhi
JMS: Rhamnus ursina	Frangula californica subsp. ursina (Greene) Kartesz & Gandhi
JM2: Rhodiola integrifolia	Rhodiola integrifolia Raf.
JM2: Rhodiola integrifolia subsp. integrifolia	Rhodiola integrifolia Raf. subsp. integrifolia
JM2: Rhododendron columbianum	Rhododendron columbianum (Piper) Harmaja
JM1: Rhododendron macrophyllum	Rhododendron macrophyllum G. Don
JM1: Rhododendron occidentale	Rhododendron occidentale (Torr. & A. Gray) A. Gray
JM2: Rhus aromatica	Rhus aromatica Aiton
JM1: Rhus integrifolia	Rhus integrifolia (Nutt.) Rothr.
JMS: Rhus lancea	Searsia lancea (L. f.) F.A. Barkley
JM1: Rhus ovata	Rhus ovata S. Watson
JM1: Rhus trilobata	Rhus aromatica Aiton
JM1: Rhynchelytrum repens	Melinis repens (Willd.) Zizka subsp. repens
JMS: Rhynchelytrum roseum	Melinis repens (Willd.) Zizka subsp. repens
JM1: Rhynchospora alba	Rhynchospora alba (L.) Vahl
JM1: Rhynchospora californica	Rhynchospora californica Gale
JM1: Rhynchospora capitellata	Rhynchospora capitellata (Michx.) Vahl
JM2: Rhynchospora globularis	Rhynchospora globularis (Chapm.) Small
JM1: Rhynchospora globularis var. globularis	Rhynchospora globularis (Chapm.) Small
JMS: Rhynchospora recognita	Rhynchospora globularis (Chapm.) Small
JM1: Ribes amarum	Ribes amarum McClatchie
JMS: Ribes amarum var. hoffmannii	Ribes amarum McClatchie
JM1: Ribes aureum	Ribes aureum Pursh
JM1: Ribes aureum var. aureum	Ribes aureum Pursh var. aureum
JM1: Ribes aureum var. gracillimum	Ribes aureum var. gracillimum (Coville & Britton) Jeps.
JM1: Ribes binominatum	Ribes binominatum A. Heller
JM1: Ribes bracteosum	Ribes bracteosum Douglas
JM1: Ribes californicum	Ribes californicum Hook. & Arn.
JM1: Ribes californicum var. californicum	Ribes californicum Hook. & Arn. var. californicum
JM1: Ribes californicum var. hesperium	Ribes californicum var. hesperium (McClatchie) Jeps.
JM1: Ribes canthariforme	Ribes canthariforme Wiggins
JM1: Ribes cereum	Ribes cereum Douglas
JM1: Ribes cereum var. cereum	Ribes cereum Douglas var. cereum
JM1: Ribes cereum var. inebrians	Ribes cereum var. inebrians (Lindl.) C.L. Hitchc.
JM1: Ribes divaricatum	Ribes divaricatum Douglas
JM1: Ribes divaricatum var. parishii	Ribes divaricatum var. parishii (A. Heller) Jeps.
JM1: Ribes divaricatum var. pubiflorum	Ribes divaricatum var. pubiflorum Koehne
JM2: Ribes hudsonianum	Ribes hudsonianum Richardson
JM1: Ribes hudsonianum var. petiolare	Ribes hudsonianum Richardson var. petiolare (Douglas) Jancz.
JM1: Ribes indecorum	Ribes indecorum Eastw.
JM1: Ribes inerme	Ribes inerme Rydb.
JM1: Ribes inerme var. inerme	Ribes inerme Rydb. var. inerme
JM1: Ribes inerme var. klamathense	Ribes inerme var. klamathense (Coville) Jeps.
JM1: Ribes lacustre	Ribes lacustre (Pers.) Poir.
JM1: Ribes lasianthum	Ribes lasianthum Greene
JM1: Ribes laxiflorum	Ribes laxiflorum Pursh
JMS: Ribes leptanthum	Ribes lasianthum Greene
JMS: Ribes leptanthum var. lasianthum	Ribes lasianthum Greene
JM1: Ribes lobbii	Ribes lobbii A. Gray
JM1: Ribes malvaceum	Ribes malvaceum Sm.
JM1: Ribes malvaceum var. malvaceum	Ribes malvaceum Sm. var. malvaceum
JM1: Ribes malvaceum var. viridifolium	Ribes malvaceum var. viridifolium Abrams
JM1: Ribes marshallii	Ribes marshallii Greene
JM1: Ribes menziesii	Ribes menziesii Pursh
JMS: Ribes menziesii var. faustum	Ribes menziesii Pursh var. menziesii
JMS: Ribes menziesii var. hystriculum	Ribes menziesii Pursh var. menziesii
JMS: Ribes menziesii var. hystrix	Ribes menziesii Pursh var. menziesii
JM2: Ribes menziesii var. ixoderme	Ribes menziesii var. ixoderme Quick
JMS: Ribes menziesii var. leptosmum	Ribes menziesii Pursh var. menziesii
JM2: Ribes menziesii var. menziesii	Ribes menziesii Pursh var. menziesii
JMS: Ribes menziesii var. senile	Ribes menziesii Pursh var. menziesii
JM1: Ribes montigenum	Ribes montigenum McClatchie
JM1: Ribes nevadense	Ribes nevadense Kellogg
JM1: Ribes quercetorum	Ribes quercetorum Greene
JM1: Ribes roezlii	Ribes roezlii Regel
JM1: Ribes roezlii var. amictum	Ribes roezlii var. amictum (Greene) Jeps.
JM1: Ribes roezlii var. cruentum	Ribes roezlii var. cruentum (Greene) Rehder
JM1: Ribes roezlii var. roezlii	Ribes roezlii Regel var. roezlii
JM1: Ribes sanguineum	Ribes sanguineum Pursh
JM1: Ribes sanguineum var. glutinosum	Ribes sanguineum var. glutinosum (Benth.) Loudon
JM1: Ribes sanguineum var. sanguineum	Ribes sanguineum Pursh var. sanguineum
JM1: Ribes sericeum	Ribes sericeum Eastw.
JM1: Ribes speciosum	Ribes speciosum Pursh
JM1: Ribes thacherianum	Ribes thacherianum (Jeps.) Munz
JM1: Ribes tularense	Ribes tularense (Coville) Fedde
JM1: Ribes velutinum	Ribes velutinum Greene
JMS: Ribes velutinum var. gooddingii	Ribes velutinum Greene
JM1: Ribes viburnifolium	Ribes viburnifolium A. Gray
JM1: Ribes victoris	Ribes victoris Greene
JM1: Ribes viscosissimum	Ribes viscosissimum Pursh
JMS: Ribes viscosissimum var. hallii	Ribes viscosissimum Pursh
JM1: Ricinus communis	Ricinus communis L.
JM1: Rigiopappus leptocladus	Rigiopappus leptocladus A. Gray
JM1: Robinia neomexicana	Robinia neomexicana A. Gray
JM1: Robinia pseudoacacia	Robinia pseudoacacia L.
JM1: Romanzoffia californica	Romanzoffia californica Greene
JM1: Romanzoffia sitchensis	Romanzoffia sitchensis Bong.
JM1: Romanzoffia tracyi	Romanzoffia tracyi Jeps.
JM1: Romneya coulteri	Romneya coulteri Harv.
JM1: Romneya trichocalyx	Romneya trichocalyx Eastw.
JM2: Romulea rosea	Romulea rosea (L.) Eckl.
JM1: Romulea rosea var. australis	Romulea rosea (L.) Eckl. var. australis (Ewart) M.P. de Vos
JM1: Rorippa austriaca	Rorippa austriaca (Crantz) Besser
JMS: Rorippa calycina	Rorippa columbiae (S. Watson) Howell
JMS: Rorippa calycina var. columbiae	Rorippa columbiae (S. Watson) Howell
JM1: Rorippa columbiae	Rorippa columbiae (S. Watson) Howell
JM1: Rorippa curvipes	Rorippa curvipes Greene
JM1: Rorippa curvipes var. curvipes	Rorippa curvipes Greene
JM1: Rorippa curvipes var. truncata	Rorippa curvipes Greene
JM1: Rorippa curvisiliqua	Rorippa curvisiliqua (Hook.) Britton
JMS: Rorippa curvisiliqua var. occidentalis	Rorippa curvisiliqua (Hook.) Britton
JM1: Rorippa gambelii	Nasturtium gambelii (S. Watson) O.E. Schulz
JM1: Rorippa nasturtium-aquaticum	Nasturtium officinale W.T. Aiton
JM1: Rorippa palustris	Rorippa palustris (L.) Besser
JMS: Rorippa palustris subsp. fernaldiana	Rorippa palustris (L.) Besser subsp. palustris
JM2: Rorippa palustris subsp. hispida	Rorippa palustris subsp. hispida (Desv.) Jonsell
JMS: Rorippa palustris subsp. occidentalis	Rorippa palustris (L.) Besser subsp. palustris
JM2: Rorippa palustris subsp. palustris	Rorippa palustris (L.) Besser subsp. palustris
JMS: Rorippa palustris var. fernaldiana	Rorippa palustris (L.) Besser subsp. palustris
JM1: Rorippa palustris var. hispida	Rorippa palustris subsp. hispida (Desv.) Jonsell
JM1: Rorippa palustris var. occidentalis	Rorippa palustris (L.) Besser subsp. palustris
JM1: Rorippa sinuata	Rorippa sinuata (Nutt.) Hitchc.
JM1: Rorippa sphaerocarpa	Rorippa sphaerocarpa (A. Gray) Britton
JM1: Rorippa subumbellata	Rorippa subumbellata Rollins
JM1: Rorippa tenerrima	Rorippa tenerrima Greene
JM1: Rosa bridgesii	Rosa bridgesii Rydb.
JM1: Rosa californica	Rosa californica Cham. & Schltdl.
JM1: Rosa canina	Rosa canina L.
JM1: Rosa eglanteria	Rosa rubiginosa L.
JM1: Rosa gymnocarpa	Rosa gymnocarpa Nutt.
JM2: Rosa gymnocarpa var. gymnocarpa	Rosa gymnocarpa Nutt. var. gymnocarpa
JM2: Rosa gymnocarpa var. serpentina	Rosa gymnocarpa var. serpentina Ertter & W.H. Lewis
JM1: Rosa minutifolia	Rosa minutifolia Engelm.
JM2: Rosa multiflora	Rosa multiflora Thunb.
JM2: Rosa nutkana	Rosa nutkana C. Presl
JM2: Rosa nutkana subsp. macdougalii	Rosa nutkana subsp. macdougalii (Holz.) Piper
JM2: Rosa nutkana subsp. nutkana	Rosa nutkana C. Presl subsp. nutkana
JM1: Rosa nutkana var. nutkana	Rosa nutkana C. Presl subsp. nutkana
JM1: Rosa pinetorum	Rosa pinetorum A. Heller
JM1: Rosa pisocarpa	Rosa pisocarpa A. Gray
JM2: Rosa pisocarpa subsp. ahartii	Rosa pisocarpa subsp. ahartii Ertter & W.H. Lewis
JM2: Rosa pisocarpa subsp. pisocarpa	Rosa pisocarpa A. Gray subsp. pisocarpa
JM2: Rosa rubiginosa	Rosa rubiginosa L.
JM1: Rosa spithamea	Rosa spithamea S. Watson
JM2: Rosa woodsii	Rosa woodsii Lindl.
JM2: Rosa woodsii subsp. gratissima	Rosa woodsii subsp. gratissima (Greene) W.H. Lewis & Ertter
JM2: Rosa woodsii subsp. ultramontana	Rosa woodsii subsp. ultramontana (S. Watson) Roy L. Taylor & MacBryde
JM1: Rosa woodsii var. ultramontana	Rosa woodsii subsp. ultramontana (S. Watson) Roy L. Taylor & MacBryde
JMS: Rostraria cristata	Koeleria gerardii (Vill.) Shinners
JM1: Rotala indica	Rotala indica (Willd.) Koehne
JM1: Rotala ramosior	Rotala ramosior (L.) Koehne
JMS: Rottboellia cylindrica	Hainardia cylindrica (Willd.) Greuter
JM2: Rubus armeniacus	Rubus armeniacus Focke
JMS: Rubus bifrons	Rubus armeniacus Focke
JM1: Rubus discolor	Rubus armeniacus Focke
JM1: Rubus glaucifolius	Rubus glaucifolius Kellogg
JMS: Rubus glaucifolius var. ganderi	Rubus glaucifolius Kellogg
JM1: Rubus laciniatus	Rubus laciniatus Willd.
JM1: Rubus lasiococcus	Rubus lasiococcus A. Gray
JM1: Rubus leucodermis	Rubus leucodermis Torr. & A. Gray
JMS: Rubus leucodermis var. bernardinus	Rubus leucodermis Torr. & A. Gray
JMS: Rubus leucodermis var. trinitatis	Rubus leucodermis Torr. & A. Gray
JM1: Rubus nivalis	Rubus nivalis Douglas
JM1: Rubus parviflorus	Rubus parviflorus Nutt.
JMS: Rubus parviflorus var. velutinus	Rubus parviflorus Nutt.
JM1: Rubus pensilvanicus	Rubus pensilvanicus Poir.
JM1: Rubus spectabilis	Rubus spectabilis Pursh
JMS: Rubus spectabilis var. franciscanus	Rubus spectabilis Pursh
JM2: Rubus ulmifolius	Rubus ulmifolius Schott
JM2: Rubus ulmifolius var. anoplothyrsus	Rubus ulmifolius var. anoplothyrsus Sudre
JM1: Rubus ulmifolius var. inermis	Rubus ulmifolius var. anoplothyrsus Sudre
JM1: Rubus ursinus	Rubus ursinus Cham. & Schltdl.
JM1: Rudbeckia californica	Rudbeckia californica A. Gray; Rudbeckia glaucescens Eastw.; Rudbeckia klamathensis P.B. Cox & Urbatsch
JM1: Rudbeckia californica var. californica	Rudbeckia californica A. Gray
JM1: Rudbeckia californica var. glauca	Rudbeckia glaucescens Eastw.
JM1: Rudbeckia californica var. intermedia	Rudbeckia klamathensis P.B. Cox & Urbatsch
JM2: Rudbeckia glaucescens	Rudbeckia glaucescens Eastw.
JM2: Rudbeckia hirta	Rudbeckia hirta L.
JM1: Rudbeckia hirta var. pulcherrima	Rudbeckia hirta L. var. pulcherrima Farw.
JM2: Rudbeckia klamathensis	Rudbeckia klamathensis P.B. Cox & Urbatsch
JM2: Rudbeckia occidentalis	Rudbeckia occidentalis Nutt.
JM1: Rudbeckia occidentalis var. occidentalis	Rudbeckia occidentalis Nutt.
JM1: Rumex acetosella	Rumex acetosella L.
JM2: Rumex britannica	Rumex britannica L.
JM2: Rumex californicus	Rumex californicus Rech. f.
JM1: Rumex conglomeratus	Rumex conglomeratus Murray
JM2: Rumex crassus	Rumex crassus Rech. f.
JM1: Rumex crispus	Rumex crispus L.
JM1: Rumex dentatus	Rumex dentatus L.
JM2: Rumex fueginus	Rumex fueginus Phil.
JM1: Rumex hymenosepalus	Rumex hymenosepalus Torr.
JM1: Rumex kerneri	Rumex kerneri Borb&aacute;s
JM2: Rumex lacustris	Rumex lacustris Greene
JM1: Rumex maritimus	Rumex fueginus Phil.
JM1: Rumex obtusifolius	Rumex obtusifolius L.
JM1: Rumex occidentalis	Rumex occidentalis S. Watson
JM1: Rumex orbiculatus	Rumex britannica L.
JM2: Rumex palustris	Rumex palustris Sm.
JM1: Rumex paucifolius	Rumex paucifolius Nutt.
JM2: Rumex persicarioides	Rumex persicarioides L.
JM1: Rumex pulcher	Rumex pulcher L.
JM1: Rumex salicifolius	Rumex salicifolius Weinm.; Rumex crassus Rech. f.; Rumex californicus Rech. f.; Rumex lacustris Greene; Rumex transitorius Rech. f.; Rumex triangulivalvis (Danser) Rech. f.
JM1: Rumex salicifolius var. crassus	Rumex crassus Rech. f.
JM1: Rumex salicifolius var. denticulatus	Rumex californicus Rech. f.
JM1: Rumex salicifolius var. lacustris	Rumex lacustris Greene
JM1: Rumex salicifolius var. salicifolius	Rumex salicifolius Weinm.
JM1: Rumex salicifolius var. transitorius	Rumex transitorius Rech. f.
JM1: Rumex salicifolius var. triangulivalvis	Rumex triangulivalvis (Danser) Rech. f.
JM1: Rumex stenophyllus	Rumex stenophyllus Ledeb.
JM2: Rumex transitorius	Rumex transitorius Rech. f.
JM2: Rumex triangulivalvis	Rumex triangulivalvis (Danser) Rech. f.
JM2: Rumex utahensis	Rumex utahensis Rech. f.
JM1: Rumex venosus	Rumex venosus Pursh
JM1: Rumex violascens	Rumex violascens Rech. f.
JM1: Rupertia hallii	Rupertia hallii (Rydb.) J.W. Grimes
JM1: Rupertia physodes	Rupertia physodes (Douglas) J.W. Grimes
JM1: Rupertia rigida	Rupertia rigida (Parish) J.W. Grimes
JM1: Ruppia cirrhosa	Ruppia cirrhosa (Petagna) Grande
JM1: Ruppia maritima	Ruppia maritima L.
JM1: Ruta chalepensis	Ruta chalepensis L.
JMS: Rytidosperma caespitosa	Rytidosperma caespitosum (Gaudich.) Connor & Edgar
JM2: Rytidosperma caespitosum	Rytidosperma caespitosum (Gaudich.) Connor & Edgar
JM2: Rytidosperma penicillatum	Rytidosperma penicillatum (Labill.) Connor & Edgar
JM2: Rytidosperma racemosum	Rytidosperma racemosum (R. Br.) Connor & Edgar
JM1: Saccharum ravennae	Saccharum ravennae (L.) L.
JM1: Sagina apetala	Sagina apetala Ard.
JMS: Sagina apetala var. barbata	Sagina apetala Ard.
JM2: Sagina decumbens	Sagina decumbens (Elliott) Torr. & A. Gray
JM1: Sagina decumbens subsp. occidentalis	Sagina decumbens (Elliott) Torr. & A. Gray subsp. occidentalis (S. Watson) G.E. Crow
JM2: Sagina maxima	Sagina maxima A. Gray
JM1: Sagina maxima subsp. crassicaulis	Sagina maxima A. Gray subsp. crassicaulis (S. Watson) G.E. Crow
JM1: Sagina procumbens	Sagina procumbens L.
JM1: Sagina saginoides	Sagina saginoides (L.) H. Karst.
JM2: Sagina subulata	Sagina subulata (Swartz) C. Presl
JM1: Sagittaria cuneata	Sagittaria cuneata E. Sheld.
JM1: Sagittaria latifolia	Sagittaria latifolia Willd.
JM1: Sagittaria longiloba	Sagittaria longiloba J.G. Sm.
JM2: Sagittaria montevidensis	Sagittaria montevidensis Cham. & Schltdl.
JM1: Sagittaria montevidensis subsp. calycina	Sagittaria montevidensis Cham. & Schltdl. subsp. calycina (Engelm.) Bogin
JM2: Sagittaria rigida	Sagittaria rigida Pursh
JM1: Sagittaria sanfordii	Sagittaria sanfordii Greene
JM1: Salazaria mexicana	Scutellaria mexicana (Torr.) A.J. Paton
JM1: Salicornia bigelovii	Salicornia bigelovii Torr.
JM2: Salicornia depressa	Salicornia depressa Standl.
JM1: Salicornia europaea	Salicornia depressa Standl.
JM2: Salicornia pacifica	Salicornia pacifica Standl.
JM2: Salicornia perennis	Salicornia perennis Mill.
JM2: Salicornia rubra	Salicornia rubra A. Nelson
JM1: Salicornia subterminalis	Arthrocnemum subterminale (Parish) Standl.
JM1: Salicornia utahensis	excluded (misappl. to S. pacifica)
JM1: Salicornia virginica	Salicornia pacifica Standl.
JM1: Salix alba	Salix alba L.
JMS: Salix alba var. vitellina	Salix alba L.
JM1: Salix arctica	Salix petrophila Rydb.
JMS: Salix arctica subsp. petraea	Salix petrophila Rydb.
JM1: Salix babylonica	Salix babylonica L.
JM1: Salix bebbiana	Salix bebbiana Sarg.
JMS: Salix bonplandiana	Salix laevigata Bebb
JMS: Salix bonplandiana var. laevigata	Salix laevigata Bebb
JM1: Salix boothii	Salix boothii Dorn
JM2: Salix brachycarpa	Salix brachycarpa Nutt.
JM1: Salix brachycarpa subsp. brachycarpa	Salix brachycarpa Nutt. var. brachycarpa
JM2: Salix brachycarpa var. brachycarpa	Salix brachycarpa Nutt. var. brachycarpa
JM1: Salix breweri	Salix breweri Bebb
JM1: Salix delnortensis	Salix delnortensis C.K. Schneid.
JM1: Salix drummondiana	Salix drummondiana Hook.
JM1: Salix eastwoodiae	Salix eastwoodiae A. Heller
JMS: Salix eriocephala	Salix prolixa Andersson; Salix ligulifolia C.K. Schneid.; Salix lutea Nutt.
JMS: Salix eriocephala subsp. mackenzieana	Salix prolixa Andersson
JMS: Salix eriocephala var. ligulifolia	Salix ligulifolia C.K. Schneid.
JMS: Salix eriocephala var. watsonii	Salix lutea Nutt.
JM1: Salix exigua	Salix exigua Nutt.
JM2: Salix exigua var. exigua	Salix exigua Nutt. var. exigua
JM2: Salix exigua var. hindsiana	Salix exigua var. hindsiana (Benth.) Dorn
JMS: Salix exigua var. nevadensis	Salix exigua Nutt. var. exigua
JMS: Salix exigua var. stenophylla	Salix exigua Nutt. var. exigua
JM1: Salix geyeriana	Salix geyeriana Andersson
JM1: Salix gooddingii	Salix gooddingii C.R. Ball
JMS: Salix hindsiana	Salix exigua var. hindsiana (Benth.) Dorn
JMS: Salix hindsiana var. leucodendroides	Salix exigua var. hindsiana (Benth.) Dorn
JMS: Salix hindsiana var. parishiana	Salix exigua var. hindsiana (Benth.) Dorn
JM1: Salix hookeriana	Salix hookeriana Hook.
JM1: Salix jepsonii	Salix jepsonii C.K. Schneid.
JM1: Salix laevigata	Salix laevigata Bebb
JM2: Salix lasiandra	Salix lasiandra Benth.
JM2: Salix lasiandra var. caudata	Salix lasiandra var. caudata (Nutt.) Sudw.
JM1: Salix lasiolepis	Salix lasiolepis Benth.
JMS: Salix lasiolepis var. bigelovii	Salix lasiolepis Benth.
JM1: Salix lemmonii	Salix lemmonii Bebb
JM1: Salix ligulifolia	Salix ligulifolia C.K. Schneid.
JM1: Salix lucida	Salix lasiandra
JM1: Salix lucida subsp. caudata	Salix lasiandra var. caudata (Nutt.) Sudw.
JM1: Salix lucida subsp. lasiandra	Salix lasiandra Benth. var. lasiandra
JM1: Salix lutea	Salix lutea Nutt.
JM1: Salix melanopsis	Salix melanopsis Nutt.
JMS: Salix myrtillifolia	Salix boothii Dorn
JM2: Salix nivalis	Salix nivalis Hook.
JM1: Salix orestera	Salix orestera C.K. Schneid.
JM2: Salix petrophila	Salix petrophila Rydb.
JMS: Salix phylicifolia	Salix planifolia Pursh
JMS: Salix phylicifolia var. monica	Salix planifolia Pursh
JM2: Salix planifolia	Salix planifolia Pursh
JM1: Salix planifolia subsp. planifolia	Salix planifolia Pursh
JM1: Salix prolixa	Salix prolixa Andersson
JMS: Salix pseudocordata	Salix boothii Dorn
JM2: Salix purpurea	Salix purpurea L.
JMS: Salix reticulata	Salix nivalis Hook.
JM1: Salix reticulata subsp. nivalis	Salix nivalis Hook.
JM1: Salix scouleriana	Salix scouleriana Hook.
JM1: Salix sessilifolia	excluded (misappl. to S. melanopsis)
JM1: Salix sitchensis	Salix sitchensis Bong.
JM2: Salix tracyi	Salix tracyi C.R. Ball
JM1: Salpichroa origanifolia	Salpichroa origanifolia (Lam.) Baill.
JMS: Salsola atriplicifolia	Cycloloma atriplicifolium (Spreng.) J.M. Coult.
JM2: Salsola australis	Salsola australis R. Br.
JM1: Salsola damascena	Salsola damascena Botsch.
JM2: Salsola gobicola	Salsola gobicola Iljin
JMS: Salsola iberica	Salsola tragus L.
JMS: Salsola kali	Salsola australis R. Br.; Salsola tragus L.
JMS: Salsola kali subsp. pontica	Salsola australis R. Br.
JMS: Salsola kali var. tenuifolia	Salsola australis R. Br.; Salsola tragus L.
JM1: Salsola paulsenii	Salsola gobicola Iljin; Salsola paulsenii Litv.
JMS: Salsola pestifer	Salsola tragus L.
JM2: Salsola ryanii	Salsola ryanii Hrusa & Gaskin
JM1: Salsola soda	Salsola soda L.
JM1: Salsola tragus	Salsola australis R. Br.; Salsola tragus L.
JMS: Salsola vermiculata	Salsola damascena Botsch.
JM2: Saltugilia australis	Saltugilia australis (H. Mason & A.D. Grant) L.A. Johnson
JM2: Saltugilia caruifolia	Saltugilia caruifolia (Abrams) L.A. Johnson
JMS: Saltugilia grinnellii	Saltugilia splendens (H. Mason & A.D. Grant) L.A. Johnson
JM2: Saltugilia latimeri	Saltugilia latimeri T.L. Weese & L.A. Johnson
JM2: Saltugilia splendens	Saltugilia splendens (H. Mason & A.D. Grant) L.A. Johnson
JM2: Saltugilia splendens subsp. grantii	Saltugilia splendens subsp. grantii (Brand) L.A. Johnson
JM2: Saltugilia splendens subsp. splendens	Saltugilia splendens (H. Mason & A.D. Grant) L.A. Johnson subsp. splendens
JM1: Salvia aethiopis	Salvia aethiopis L.
JM1: Salvia apiana	Salvia apiana Jeps.
JM2: Salvia brandegeei	Salvia brandegeei Munz
JM1: Salvia brandegei	Salvia brandegeei Munz
JM1: Salvia carduacea	Salvia carduacea Benth.
JMS: Salvia carnosa	Salvia dorrii (Kellogg) Abrams
JMS: Salvia carnosa subsp. gilmanii	Salvia dorrii (Kellogg) Abrams var. dorrii
JM1: Salvia clevelandii	Salvia clevelandii (A. Gray) Greene
JM1: Salvia columbariae	Salvia columbariae Benth.
JMS: Salvia columbariae var. ziegleri	Salvia columbariae Benth.
JM1: Salvia dorrii	Salvia dorrii (Kellogg) Abrams
JMS: Salvia dorrii subsp. argentea	Salvia dorrii (Kellogg) Abrams var. dorrii
JMS: Salvia dorrii subsp. carnosa	Salvia dorrii var. incana (Benth.) Strachan
JMS: Salvia dorrii subsp. gilmanii	Salvia dorrii (Kellogg) Abrams var. dorrii
JMS: Salvia dorrii var. carnosa	Salvia dorrii var. incana (Benth.) Strachan
JM1: Salvia dorrii var. dorrii	Salvia dorrii (Kellogg) Abrams var. dorrii
JM1: Salvia dorrii var. incana	Salvia dorrii var. incana (Benth.) Strachan
JM1: Salvia dorrii var. pilosa	Salvia dorrii var. pilosa (A. Gray) Strachan & Reveal
JM1: Salvia eremostachya	Salvia eremostachya Jeps.
JM1: Salvia funerea	Salvia funerea M.E. Jones
JMS: Salvia funerea var. fornacis	Salvia funerea M.E. Jones
JM1: Salvia greatae	Salvia greatae Brandegee
JM1: Salvia leucophylla	Salvia leucophylla Greene
JM1: Salvia mellifera	Salvia mellifera Greene
JM1: Salvia mohavensis	Salvia mohavensis Greene
JM1: Salvia munzii	Salvia munzii Epling
JM1: Salvia pachyphylla	Salvia pachyphylla Munz
JM1: Salvia sonomensis	Salvia sonomensis Greene
JM1: Salvia spathacea	Salvia spathacea Greene
JM1: Salvia vaseyi	Salvia vaseyi (Porter) Parish
JM1: Salvia verbenacea	excluded
JM2: Salvia virgata	Salvia virgata Jacq.
JM2: Salvinia minima	Salvinia minima Baker
JM2: Salvinia molesta	Salvinia molesta D.S. Mitch.
JM2: Salvinia oblongifolia	Salvinia oblongifolia Mart.
JM1: Sambucus melanocarpa	Sambucus racemosa var. melanocarpa (A. Gray) McMinn
JM1: Sambucus mexicana	Sambucus nigra L. subsp. caerulea (Raf.) Bolli
JM2: Sambucus nigra	Sambucus nigra L.
JM2: Sambucus nigra subsp. caerulea	Sambucus nigra L. subsp. caerulea (Raf.) Bolli
JM1: Sambucus racemosa	Sambucus racemosa L.
JM2: Sambucus racemosa var. melanocarpa	Sambucus racemosa var. melanocarpa (A. Gray) McMinn
JM1: Sambucus racemosa var. microbotrys	Sambucus racemosa L. var. racemosa
JM1: Sambucus racemosa var. racemosa	Sambucus racemosa L. var. racemosa
JMS: Samolus floribundus	Samolus parviflorus Raf.
JM1: Samolus parviflorus	Samolus parviflorus Raf.
JMS: Sanguisorba minor	Poterium sanguisorba L.
JM1: Sanguisorba minor subsp. muricata	Poterium sanguisorba L.
JM1: Sanguisorba occidentalis	Poteridium annuum (Nutt.) Spach
JM1: Sanguisorba officinalis	Sanguisorba officinalis L.
JM1: Sanicula arctopoides	Sanicula arctopoides Hook. & Arn.
JM1: Sanicula arguta	Sanicula arguta J.M. Coult. & Rose
JM1: Sanicula bipinnata	Sanicula bipinnata Hook. & Arn.
JM1: Sanicula bipinnatifida	Sanicula bipinnatifida Hook.
JM1: Sanicula crassicaulis	Sanicula crassicaulis DC.
JM1: Sanicula graveolens	Sanicula graveolens DC.
JM1: Sanicula hoffmannii	Sanicula hoffmannii (Munz) R.H. Shan & Constance
JM1: Sanicula laciniata	Sanicula laciniata Hook. & Arn.
JM1: Sanicula maritima	Sanicula maritima S. Watson
JM1: Sanicula peckiana	Sanicula peckiana J.F. Macbr.
JM1: Sanicula saxatilis	Sanicula saxatilis Greene
JMS: Sanicula simulans	Sanicula arguta J.M. Coult. & Rose
JM1: Sanicula tracyi	Sanicula tracyi R.H. Shan & Constance
JM1: Sanicula tuberosa	Sanicula tuberosa Torr.
JM2: Santolina chamaecyparissus	Santolina chamaecyparissus L.
JM1: Santolina chamaecyparisus	excluded
JM1: Sanvitalia abertii	Sanvitalia abertii A. Gray
JMS: Sapium sebiferum	Triadica sebifera (L.) Small
JM1: Saponaria officinalis	Saponaria officinalis L.
JM2: Sarcobatus baileyi	Sarcobatus baileyi Coville
JMS: Sarcobatus maximillianii	Sarcobatus vermiculatus (Hook.) Torr.
JM1: Sarcobatus vermiculatus	Sarcobatus vermiculatus (Hook.) Torr.
JMS: Sarcobatus vermiculatus var. baileyi	Sarcobatus baileyi Coville
JMS: Sarcocornia pacifica	Salicornia pacifica Standl.
JMS: Sarcocornia perennis	Salicornia perennis Mill.
JM1: Sarcodes sanguinea	Sarcodes sanguinea Torr.
JMS: Sarcostemma crispum	Funastrum crispum (Benth.) Schltr.
JMS: Sarcostemma cynanchoides	Funastrum cynanchoides (Decne.) Schltr.
JM1: Sarcostemma cynanchoides subsp. hartwegii	Funastrum cynanchoides (Decne.) Schltr. var. hartwegii (Vail) Krings
JM1: Sarcostemma hirtellum	Funastrum hirtellum (A. Gray) Schltr.
JM1: Sarracenia purpurea	Sarracenia purpurea L.
JM1: Satureja chandleri	Clinopodium chandleri (Brandegee) P.D. Cantino & Wagstaff
JM1: Satureja douglasii	Clinopodium douglasii (Benth.) Kuntze
JM1: Satureja mimuloides	Clinopodium mimuloides (Benth.) Kuntze
JM1: Saussurea americana	Saussurea americana D.C. Eaton
JM1: Saxifraga aprica	Micranthes aprica (Greene) Small
JM1: Saxifraga bryophora	Micranthes bryophora (A. Gray) Brouillet & Gornall
JM1: Saxifraga californica	Micranthes californica (Greene) Small
JM1: Saxifraga cespitosa	Saxifraga cespitosa L.
JM1: Saxifraga ferruginea	Micranthes ferruginea (Graham) Brouillet & Gornall
JM1: Saxifraga howellii	Micranthes howellii (Greene) Small
JM2: Saxifraga hyperborea	Saxifraga hyperborea R. Br.
JM1: Saxifraga integrifolia	Micranthes integrifolia (Hook.) Small
JM1: Saxifraga marshallii	Micranthes marshallii (Greene) Small
JM1: Saxifraga mertensiana	Saxifraga mertensiana Bong.
JMS: Saxifraga nidifica	Micranthes fragosa (Small) Small; Micranthes nidifica (Greene) Small
JMS: Saxifraga nidifica var. claytoniifolia	Micranthes fragosa (Small) Small
JM1: Saxifraga nidifica var. nidifica	Micranthes nidifica (Greene) Small
JM1: Saxifraga nuttallii	Cascadia nuttallii (Small) A.M. Johnson
JM1: Saxifraga odontoloma	Micranthes odontoloma (Piper) A. Heller
JM1: Saxifraga oregana	Micranthes oregana (Howell) Small
JM1: Saxifraga rivularis	Saxifraga hyperborea R. Br.
JM1: Saxifraga rufidula	Micranthes marshallii
JM1: Saxifraga stolonifera	excluded
JM1: Saxifraga tolmiei	Micranthes tolmiei (Torr. & A. Gray) Brouillet & Gornall
JM1: Saxifragopsis fragarioides	Saxifragopsis fragarioides (Greene) Small
JM1: Scabiosa atropurpurea	Scabiosa atropurpurea L.
JM1: Scabiosa stellata	Scabiosa stellata L.
JM1: Scandix pecten-veneris	Scandix pecten-veneris L.
JM2: Sceptridium multifidum	Sceptridium multifidum (S.G. Gmel.) Tagawa
JMS: Schedonorus arundinaceus	Festuca arundinacea Schreb.
JMS: Schedonorus phoenix	Festuca arundinacea Schreb.
JMS: Schedonorus pratensis	Festuca pratensis Huds.
JM2: Scheuchzeria palustris	Scheuchzeria palustris L.
JM1: Scheuchzeria palustris subsp. americana	Scheuchzeria palustris L.
JM1: Schinus molle	Schinus molle L.
JM1: Schinus polygamus	Schinus polygamus (Cav.) Cabrera
JM1: Schinus terebinthifolius	Schinus terebinthifolius Raddi
JM1: Schismus arabicus	Schismus arabicus Nees
JM1: Schismus barbatus	Schismus barbatus (L.) Thell.
JM1: Schizachyrium scoparium	excluded
JMS: Schkuhria multiflora	Bahia neomexicana (A. Gray) A. Gray
JM1: Schkuhria multiflora var. multiflora	Bahia neomexicana (A. Gray) A. Gray
JM2: Schoenoplectus acutus	Schoenoplectus acutus (Bigelow) &Aacute;. L&ouml;ve & D. L&ouml;ve
JM2: Schoenoplectus acutus var. occidentalis	Schoenoplectus acutus (Bigelow) &Aacute;. L&ouml;ve & D. L&ouml;ve var. occidentalis (S. Watson) S.G. Sm.
JM2: Schoenoplectus americanus	Schoenoplectus americanus (Pers.) Schinz & R. Keller
JM2: Schoenoplectus californicus	Schoenoplectus californicus (C.A. Mey.) Soj&aacute;k
JMS: Schoenoplectus fluviatilis	Bolboschoenus fluviatilis (Torr.) Soj&aacute;k
JMS: Schoenoplectus glaucus	Bolboschoenus glaucus (Lam.) S.G. Sm.
JM2: Schoenoplectus heterochaetus	Schoenoplectus heterochaetus (Chase) Soj&aacute;k
JM2: Schoenoplectus mucronatus	Schoenoplectus mucronatus (L.) Palla
JM2: Schoenoplectus pungens	Schoenoplectus pungens (Vahl) Palla
JM2: Schoenoplectus pungens var. longispicatus	Schoenoplectus pungens (Vahl) Palla var. longispicatus (Britton) S.G. Sm.
JMS: Schoenoplectus robustus	Bolboschoenus robustus (Pursh) Soj&aacute;k
JM2: Schoenoplectus saximontanus	Schoenoplectus saximontanus (Fernald) J. Raynal
JM2: Schoenoplectus subterminalis	Schoenoplectus subterminalis (Torr.) Soj&aacute;k
JM2: Schoenoplectus tabernaemontani	Schoenoplectus tabernaemontani (C.C. Gmel.) Palla
JM2: Schoenoplectus triqueter	Schoenoplectus triqueter (L.) Palla
JM1: Schoenus nigricans	Schoenus nigricans L.
JMS: Scirpus acutus	Schoenoplectus acutus (Bigelow) &Aacute;. L&ouml;ve & D. L&ouml;ve
JM1: Scirpus acutus var. occidentalis	Schoenoplectus acutus (Bigelow) &Aacute;. L&ouml;ve & D. L&ouml;ve var. occidentalis (S. Watson) S.G. Sm.
JM1: Scirpus americanus	Schoenoplectus americanus (Pers.) Schinz & R. Keller
JMS: Scirpus americanus var. longispicatus	Schoenoplectus pungens (Vahl) Palla var. longispicatus (Britton) S.G. Sm.
JM1: Scirpus californicus	Schoenoplectus californicus (C.A. Mey.) Soj&aacute;k
JM1: Scirpus cernuus	Isolepis cernua (Vahl) Roem. & Schult.
JM1: Scirpus clementis	Trichophorum clementis (M.E. Jones) S.G. Sm.
JM1: Scirpus congdonii	Scirpus congdonii Britton
JM2: Scirpus cyperinus	Scirpus cyperinus (L.) Kunth
JM1: Scirpus diffusus	Scirpus diffusus Schuyler
JM1: Scirpus fluviatilis	Bolboschoenus fluviatilis (Torr.) Soj&aacute;k
JM1: Scirpus heterochaetus	Schoenoplectus heterochaetus (Chase) Soj&aacute;k
JM1: Scirpus koilolepis	Isolepis carinata Torr.
JM1: Scirpus maritimus	Bolboschoenus maritimus (L.) Palla subsp. paludosus (A. Nelson) T. Koyama
JMS: Scirpus maritimus var. paludosus	Bolboschoenus maritimus (L.) Palla subsp. paludosus (A. Nelson) T. Koyama
JM1: Scirpus microcarpus	Scirpus microcarpus J. Presl & C. Presl
JM1: Scirpus mucronatus	Schoenoplectus mucronatus (L.) Palla
JM1: Scirpus nevadensis	Amphiscirpus nevadensis (S. Watson) Oteng-Yeb.
JM1: Scirpus pendulus	Scirpus pendulus Muhl.
JM1: Scirpus pumilus	Trichophorum pumilum (Vahl) Schinz & Thell.
JM1: Scirpus pungens	Schoenoplectus pungens (Vahl) Palla var. longispicatus (Britton) S.G. Sm.
JM1: Scirpus robustus	Bolboschoenus robustus (Pursh) Soj&aacute;k
JM1: Scirpus saximontanus	Schoenoplectus saximontanus (Fernald) J. Raynal
JM1: Scirpus setaceus	Isolepis setacea (L.) R. Br.
JM1: Scirpus subterminalis	Schoenoplectus subterminalis (Torr.) Soj&aacute;k
JM1: Scirpus tabernaemontani	Schoenoplectus tabernaemontani (C.C. Gmel.) Palla
JMS: Scirpus tenuis	Eleocharis tenuis (Willd.) Schult. var. tenuis
JMS: Scirpus triqueter	Schoenoplectus triqueter (L.) Palla
JM1: Scirpus tuberosus	Bolboschoenus glaucus (Lam.) S.G. Sm.
JM2: Scleranthus annuus	Scleranthus annuus L.
JM1: Scleranthus annuus subsp. annuus	Scleranthus annuus L. subsp. annuus
JM1: Sclerocactus johnsonii	Sclerocactus johnsonii (Engelm.) N.P. Taylor
JM1: Sclerocactus polyancistrus	Sclerocactus polyancistrus (Engelm. & J.M. Bigelow) Britton & Rose
JM1: Sclerochloa dura	Sclerochloa dura (L.) P. Beauv.
JM1: Sclerolinon digynum	Sclerolinon digynum (A. Gray) C.M. Rogers
JMS: Scleropoa rigida	Desmazeria rigida (L.) Tutin
JM1: Scleropogon brevifolius	Scleropogon brevifolius Phil.
JM1: Scoliopus bigelovii	Scoliopus bigelovii Torr.
JM1: Scolymus hispanicus	Scolymus hispanicus L.
JM1: Scopulophila rixfordii	Scopulophila rixfordii (Brandegee) Munz & I.M. Johnst.
JM1: Scorzonera hispanica	Scorzonera hispanica L.
JM1: Scribneria bolanderi	Scribneria bolanderi (Thurb.) Hack.
JM1: Scrophularia atrata	Scrophularia atrata Pennell
JM1: Scrophularia californica	Scrophularia californica Cham. & Schltdl.
JM1: Scrophularia californica subsp. californica	Scrophularia californica Cham. & Schltdl.
JM1: Scrophularia californica subsp. floribunda	Scrophularia californica Cham. & Schltdl.
JM1: Scrophularia desertorum	Scrophularia desertorum (Munz) R.J. Shaw
JM1: Scrophularia lanceolata	Scrophularia lanceolata Pursh
JM2: Scrophularia peregrina	Scrophularia peregrina L.
JM1: Scrophularia villosa	Scrophularia villosa Pennell
JMS: Scutellaria angustifolia	Scutellaria siphocampyloides Vatke
JMS: Scutellaria angustifolia var. canescens	Scutellaria siphocampyloides Vatke
JM1: Scutellaria antirrhinoides	Scutellaria antirrhinoides Benth.
JMS: Scutellaria austiniae	Scutellaria siphocampyloides Vatke
JM1: Scutellaria bolanderi	Scutellaria bolanderi A. Gray
JM1: Scutellaria bolanderi subsp. austromontana	Scutellaria bolanderi subsp. austromontana Epling
JM1: Scutellaria bolanderi subsp. bolanderi	Scutellaria bolanderi A. Gray subsp. bolanderi
JM1: Scutellaria californica	Scutellaria californica A. Gray
JM1: Scutellaria galericulata	Scutellaria galericulata L.
JMS: Scutellaria holmgreniorum	Scutellaria nana A. Gray
JM1: Scutellaria lateriflora	Scutellaria lateriflora L.
JMS: Scutellaria linearifolia	Scutellaria siphocampyloides Vatke
JM2: Scutellaria mexicana	Scutellaria mexicana (Torr.) A.J. Paton
JM1: Scutellaria nana	Scutellaria nana A. Gray
JMS: Scutellaria pilosiuscula	Scutellaria tuberosa Benth.
JMS: Scutellaria sanhedrinsis	Scutellaria antirrhinoides Benth.
JM1: Scutellaria siphocampyloides	Scutellaria siphocampyloides Vatke
JM1: Scutellaria tuberosa	Scutellaria tuberosa Benth.
JMS: Scutellaria tuberosa subsp. similis	Scutellaria tuberosa Benth.
JMS: Scutellaria viarum	Scutellaria antirrhinoides Benth.
JM2: Searsia lancea	Searsia lancea (L. f.) F.A. Barkley
JM1: Secale cereale	Secale cereale L.
JMS: Securigera varia	Coronilla varia L.
JMS: Sedella congdonii	Sedella pumila (Benth.) Britton & Rose
JM2: Sedella leiocarpa	Sedella leiocarpa H. Sharsm.
JM2: Sedella pentandra	Sedella pentandra H. Sharsm.
JM2: Sedella pumila	Sedella pumila (Benth.) Britton & Rose
JM1: Sedum albomarginatum	Sedum albomarginatum R.T. Clausen
JM2: Sedum album	Sedum album L.
JMS: Sedum dendroideum	Sedum praealtum A. DC.
JMS: Sedum dendroideum subsp. praealtum	Sedum praealtum A. DC.
JM1: Sedum divergens	Sedum divergens S. Watson
JM1: Sedum eastwoodiae	Sedum laxum subsp. eastwoodiae (Britton) R.T. Clausen
JM1: Sedum lanceolatum	Sedum lanceolatum Torr.
JMS: Sedum lanceolatum var. subalpinum	Sedum lanceolatum Torr.
JM1: Sedum laxum	Sedum laxum (Britton) A. Berger; Sedum obtusatum A. Gray
JM2: Sedum laxum subsp. eastwoodiae	Sedum laxum subsp. eastwoodiae (Britton) R.T. Clausen
JM1: Sedum laxum subsp. flavidum	Sedum laxum subsp. flavidum Denton
JM1: Sedum laxum subsp. heckneri	Sedum laxum subsp. heckneri (M. Peck) R.T. Clausen
JM1: Sedum laxum subsp. laxum	Sedum laxum (Britton) A. Berger subsp. laxum
JMS: Sedum laxum subsp. retusum	Sedum obtusatum subsp. retusum (Rose) R.T. Clausen
JMS: Sedum laxum var. eastwoodiae	Sedum laxum subsp. eastwoodiae (Britton) R.T. Clausen
JMS: Sedum laxum var. flavidum	Sedum laxum subsp. flavidum Denton
JMS: Sedum laxum var. heckneri	Sedum laxum subsp. heckneri (M. Peck) R.T. Clausen
JMS: Sedum laxum var. latifolium	Sedum laxum (Britton) A. Berger subsp. laxum
JMS: Sedum laxum var. laxum	Sedum laxum (Britton) A. Berger subsp. laxum
JM1: Sedum niveum	Sedum niveum Davidson
JM1: Sedum oblanceolatum	Sedum oblanceolatum R.T. Clausen
JM1: Sedum obtusatum	Sedum obtusatum A. Gray
JM1: Sedum obtusatum subsp. boreale	Sedum obtusatum subsp. boreale R.T. Clausen
JM1: Sedum obtusatum subsp. obtusatum	Sedum obtusatum A. Gray subsp. obtusatum
JM2: Sedum obtusatum subsp. paradisum	Sedum obtusatum subsp. paradisum Denton
JM1: Sedum obtusatum subsp. retusum	Sedum obtusatum subsp. retusum (Rose) R.T. Clausen
JMS: Sedum obtusatum var. boreale	Sedum obtusatum subsp. boreale R.T. Clausen
JMS: Sedum obtusatum var. obtusatum	Sedum obtusatum A. Gray subsp. obtusatum
JMS: Sedum obtusatum var. paradisum	Sedum obtusatum subsp. paradisum Denton
JMS: Sedum obtusatum var. retusum	Sedum obtusatum subsp. retusum (Rose) R.T. Clausen
JM1: Sedum oreganum	Sedum oreganum Nutt.
JM1: Sedum oregonense	Sedum oregonense (S. Watson) M. Peck
JM1: Sedum paradisum	Sedum obtusatum subsp. paradisum Denton
JM2: Sedum praealtum	Sedum praealtum A. DC.
JM1: Sedum radiatum	Sedum radiatum S. Watson
JMS: Sedum radiatum var. depauperatum	Sedum radiatum S. Watson
JMS: Sedum rosea	Rhodiola integrifolia Raf.
JMS: Sedum rosea subsp. integrifolium	Rhodiola integrifolia Raf. subsp. integrifolia
JMS: Sedum roseum	Rhodiola integrifolia Raf.
JM1: Sedum roseum subsp. integrifolium	Rhodiola integrifolia Raf. subsp. integrifolia
JM1: Sedum spathulifolium	Sedum spathulifolium Hook.
JMS: Sedum spathulifolium var. pruinosum	Sedum spathulifolium Hook.
JM1: Sedum stenopetalum	Sedum stenopetalum Pursh; Sedum radiatum S. Watson
JMS: Sedum stenopetalum subsp. radiatum	Sedum radiatum S. Watson
JMS: Sedum stenopetalum var. monanthum	Sedum stenopetalum Pursh
JM1: Selaginella asprella	Selaginella asprella Maxon
JM1: Selaginella bigelovii	Selaginella bigelovii Underw.
JM1: Selaginella cinerascens	Selaginella cinerascens A.A. Eaton
JMS: Selaginella densa	Selaginella scopulorum Maxon
JM1: Selaginella densa var. scopulorum	Selaginella scopulorum Maxon
JM1: Selaginella eremophila	Selaginella eremophila Maxon
JM1: Selaginella hansenii	Selaginella hansenii Hieron.
JM1: Selaginella leucobryoides	Selaginella leucobryoides Maxon
JM1: Selaginella oregana	Selaginella oregana D.C. Eaton
JM2: Selaginella scopulorum	Selaginella scopulorum Maxon
JM1: Selaginella wallacei	Selaginella wallacei Hieron.
JM1: Selaginella watsonii	Selaginella watsonii Underw.
JM1: Selinocarpus nevadensis	Acleisanthes nevadensis (Standl.) B.L. Turner
JM1: Senecio aphanactis	Senecio aphanactis Greene
JM1: Senecio aronicoides	Senecio aronicoides DC.
JM1: Senecio astephanus	Senecio astephanus Greene
JM1: Senecio bernardinus	Packera bernardina (Greene) W.A. Weber & &Aacute;. L&ouml;ve
JM1: Senecio blochmaniae	Senecio blochmaniae Greene
JMS: Senecio bolanderi	Packera bolanderi (A. Gray) W.A. Weber & &Aacute;. L&ouml;ve var. bolanderi
JM1: Senecio bolanderi var. bolanderi	Packera bolanderi (A. Gray) W.A. Weber & &Aacute;. L&ouml;ve var. bolanderi
JM1: Senecio breweri	Packera breweri (Burtt Davy) W.A. Weber & &Aacute;. L&ouml;ve
JM1: Senecio californicus	Senecio californicus DC.
JM1: Senecio canus	Packera cana (Hook.) W.A. Weber & &Aacute;. L&ouml;ve
JM1: Senecio clarkianus	Senecio clarkianus A. Gray
JM1: Senecio clevelandii	Packera clevelandii (Greene) W.A. Weber & &Aacute;. L&ouml;ve
JM1: Senecio cymbalarioides	Packera subnuda (DC.) Trock & T.M. Barkley var. subnuda
JM1: Senecio elegans	Senecio elegans L.
JM1: Senecio eurycephalus	Packera eurycephala (Torr. & A. Gray) W.A. Weber & &Aacute;. L&ouml;ve
JM1: Senecio eurycephalus var. eurycephalus	Packera eurycephala (Torr. & A. Gray) W.A. Weber & &Aacute;. L&ouml;ve var. eurycephala
JM1: Senecio eurycephalus var. lewisrosei	Packera eurycephala var. lewisrosei (J.T. Howell) J.F. Bain
JM1: Senecio flaccidus	Senecio flaccidus Less.
JM1: Senecio flaccidus var. douglasii	Senecio flaccidus var. douglasii (DC.) B.L. Turner & T.M. Barkley
JM1: Senecio flaccidus var. monoensis	Senecio flaccidus var. monoensis (Greene) B.L. Turner & T.M. Barkley
JM1: Senecio fremontii	Senecio fremontii Torr. & A. Gray
JM1: Senecio fremontii var. fremontii	Senecio fremontii Torr. & A. Gray var. fremontii
JM1: Senecio fremontii var. occidentalis	Senecio fremontii Torr. & A. Gray var. occidentalis A. Gray
JM1: Senecio ganderi	Packera ganderi (T.M. Barkley & R.M. Beauch.) W.A. Weber & &Aacute;. L&ouml;ve
JM2: Senecio glomeratus	Senecio glomeratus Poir.
JM1: Senecio greenei	Packera greenei (A. Gray) W.A. Weber & &Aacute;. L&ouml;ve
JMS: Senecio hesperius	Packera hesperia (Greene) W.A. Weber & &Aacute;. L&ouml;ve
JM1: Senecio hybridus	excluded
JM1: Senecio hydrophiloides	Senecio hydrophiloides Rydb.
JM1: Senecio hydrophilus	Senecio hydrophilus Nutt.
JM1: Senecio indecorus	Packera indecora (Greene) &Aacute;. L&ouml;ve & D. L&ouml;ve
JM1: Senecio integerrimus	Senecio integerrimus Nutt.
JM1: Senecio integerrimus var. exaltatus	Senecio integerrimus var. exaltatus (Nutt.) Cronquist
JM1: Senecio integerrimus var. major	Senecio integerrimus var. major (A. Gray) Cronquist
JM1: Senecio integerrimus var. ochroleucus	Senecio integerrimus var. ochroleucus (A. Gray) Cronquist
JM1: Senecio ionophyllus	Packera ionophylla (Greene) W.A. Weber & &Aacute;. L&ouml;ve
JM1: Senecio jacobaea	Senecio jacobaea L.
JM1: Senecio layneae	Packera layneae (Greene) W.A. Weber & &Aacute;. L&ouml;ve
JM2: Senecio linearifolius	Senecio linearifolius A. Rich.
JM2: Senecio linearifolius var. linearifolius	Senecio linearifolius A. Rich. var. linearifolius
JM1: Senecio lyonii	Senecio lyonii A. Gray
JM1: Senecio macounii	Packera macounii (Greene) W.A. Weber & &Aacute;. L&ouml;ve
JM1: Senecio mikanioides	Delairea odorata Lem.
JM2: Senecio minimus	Senecio minimus Poir.
JM1: Senecio mohavensis	Senecio mohavensis A. Gray
JM1: Senecio multilobatus	Packera multilobata (Torr. & A. Gray) W.A. Weber & &Aacute;. L&ouml;ve
JM1: Senecio pattersonensis	Senecio pattersonensis Hoover
JM1: Senecio pauciflorus	Packera pauciflora (Pursh) &Aacute;. L&ouml;ve & D. L&ouml;ve
JMS: Senecio pseudaureus	Packera pseudaurea (Rydb.) W.A. Weber & &Aacute;. L&ouml;ve
JM1: Senecio pseudaureus var. pseudaureus	Packera pseudaurea (Rydb.) W.A. Weber & &Aacute;. L&ouml;ve var. pseudaurea
JM2: Senecio quadridentatus	Senecio quadridentatus Labill.
JM1: Senecio scorzonella	Senecio scorzonella Greene
JM2: Senecio serra	Senecio serra Hook.
JM1: Senecio serra var. serra	Senecio serra Hook. var. serra
JM1: Senecio spartioides	Senecio spartioides Torr. & A. Gray
JMS: Senecio spartioides var. multicapitatus	Senecio spartioides Torr. & A. Gray
JM1: Senecio streptanthifolius	Packera streptanthifolia (Greene) W.A. Weber & &Aacute;. L&ouml;ve var. streptanthifolia
JM1: Senecio sylvaticus	Senecio sylvaticus L.
JM1: Senecio triangularis	Senecio triangularis Hook.
JM1: Senecio vulgaris	Senecio vulgaris L.
JM1: Senecio werneriifolius	Packera werneriifolia (A. Gray) W.A. Weber & &Aacute;. L&ouml;ve
JM2: Senegalia greggii	Senegalia greggii (A. Gray) Britton & Rose
JM1: Senna armata	Senna armata (S. Watson) H.S. Irwin & Barneby
JM2: Senna artemisioides	Senna artemisioides (DC.) Randell
JM1: Senna covesii	Senna covesii (A. Gray) H.S. Irwin & Barneby
JM1: Senna didymobotrya	Senna didymobotrya (Fresen.) H.S. Irwin & Barneby
JM2: Senna marilandica	Senna marilandica (L.) Link
JM1: Senna multiglandulosa	Senna multiglandulosa (Jacq.) H.S. Irwin & Barneby
JMS: Septimia multicava	Crassula multicava Lem. subsp. multicava
JM1: Sequoia sempervirens	Sequoia sempervirens (D. Don) Endl.
JM1: Sequoiadendron giganteum	Sequoiadendron giganteum (Lindl.) J. Buchholz
JM2: Sericocarpus oregonensis	Sericocarpus oregonensis Nutt.
JM2: Sericocarpus oregonensis subsp. californicus	Sericocarpus oregonensis subsp. californicus (Durand) Ferris
JM2: Sericocarpus oregonensis subsp. oregonensis	Sericocarpus oregonensis Nutt. subsp. oregonensis
JMS: Sericocarpus oregonensis var. californicus	Sericocarpus oregonensis subsp. californicus (Durand) Ferris
JMS: Sericocarpus oregonensis var. oregonensis	Sericocarpus oregonensis Nutt. subsp. oregonensis
JMS: Sericocarpus tomentellus	Eucephalus tomentellus (Greene) Greene
JM1: Sesbania exaltata	Sesbania herbacea (Mill.) McVaugh
JM2: Sesbania herbacea	Sesbania herbacea (Mill.) McVaugh
JM2: Sesbania punicea	Sesbania punicea (Cav.) Benth.
JMS: Sesbania tripetii	Sesbania punicea (Cav.) Benth.
JM1: Sesuvium verrucosum	Sesuvium verrucosum Raf.
JM2: Setaria adhaerens	Setaria adhaerens (Forssk.) Chiov.
JMS: Setaria carnei	Setaria verticillata (L.) P. Beauv.
JM1: Setaria faberi	Setaria faberi R.A.W. Herrm.
JMS: Setaria geniculata	Setaria parviflora (Poir.) Kergu&eacute;len
JMS: Setaria glauca	Setaria pumila (Poir.) Roem. & Schult. subsp. pumila
JM1: Setaria gracilis	Setaria parviflora (Poir.) Kergu&eacute;len
JMS: Setaria lutescens	Setaria pumila (Poir.) Roem. & Schult. subsp. pumila
JM2: Setaria parviflora	Setaria parviflora (Poir.) Kergu&eacute;len
JM1: Setaria pumila	Setaria pumila (Poir.) Roem. & Schult.
JM2: Setaria pumila subsp. pumila	Setaria pumila (Poir.) Roem. & Schult. subsp. pumila
JM1: Setaria sphacelata	Setaria sphacelata (Schumach.) Stapf & C.E. Hubb.
JM1: Setaria verticillata	Setaria verticillata (L.) P. Beauv.
JM1: Setaria viridis	Setaria viridis (L.) P. Beauv.
JM1: Shepherdia argentea	Shepherdia argentea (Pursh) Nutt.
JM1: Shepherdia canadensis	Shepherdia canadensis (L.) Nutt.
JM1: Sherardia arvensis	Sherardia arvensis L.
JM1: Sibara deserti	Sibara deserti (M.E. Jones) Rollins
JM1: Sibara filifolia	Sibara filifolia (Greene) Greene
JM1: Sibara rosulata	Sibara deserti (M.E. Jones) Rollins
JM1: Sibara virginica	Planodes virginicum (L.) Greene
JM2: Sibaropsis hammittii	Sibaropsis hammittii S. Boyd & T.S. Ross
JM1: Sibbaldia procumbens	Sibbaldia procumbens L.
JM1: Sida rhombifolia	Sida rhombifolia L.
JM2: Sida spinosa	Sida spinosa L.
JM2: Sidalcea asprella	Sidalcea asprella Greene
JM2: Sidalcea asprella subsp. asprella	Sidalcea asprella Greene subsp. asprella
JM2: Sidalcea asprella subsp. nana	Sidalcea asprella subsp. nana (Jeps.) S.R. Hill
JM1: Sidalcea calycosa	Sidalcea calycosa M.E. Jones
JM1: Sidalcea calycosa subsp. calycosa	Sidalcea calycosa M.E. Jones subsp. calycosa
JM1: Sidalcea calycosa subsp. rhizomata	Sidalcea calycosa subsp. rhizomata (Jeps.) Munz
JM2: Sidalcea celata	Sidalcea celata (Jeps.) S.R. Hill
JM1: Sidalcea covillei	Sidalcea covillei Greene
JM1: Sidalcea diploscypha	Sidalcea diploscypha (Torr. & A. Gray) A. Gray
JM2: Sidalcea elegans	Sidalcea elegans Greene
JM2: Sidalcea gigantea	Sidalcea gigantea G.L. Clifton et al.
JM1: Sidalcea glaucescens	Sidalcea glaucescens Greene
JM1: Sidalcea hartwegii	Sidalcea hartwegii A. Gray
JM1: Sidalcea hickmanii	Sidalcea hickmanii Greene
JM1: Sidalcea hickmanii subsp. anomala	Sidalcea hickmanii subsp. anomala C.L. Hitchc.
JM1: Sidalcea hickmanii subsp. hickmanii	Sidalcea hickmanii Greene subsp. hickmanii
JM2: Sidalcea hickmanii subsp. napensis	Sidalcea hickmanii subsp. napensis S.R. Hill
JM1: Sidalcea hickmanii subsp. parishii	Sidalcea hickmanii subsp. parishii (B.L. Rob.) C.L. Hitchc.
JM2: Sidalcea hickmanii subsp. pillsburiensis	Sidalcea hickmanii subsp. pillsburiensis S.R. Hill
JM1: Sidalcea hickmanii subsp. viridis	Sidalcea hickmanii subsp. viridis C.L. Hitchc.
JM1: Sidalcea hirsuta	Sidalcea hirsuta A. Gray
JM1: Sidalcea keckii	Sidalcea keckii Wiggins
JM1: Sidalcea malachroides	Sidalcea malachroides (Hook. & Arn.) A. Gray
JM1: Sidalcea malviflora	Sidalcea malviflora (DC.) A. Gray; Sidalcea asprella Greene; Sidalcea celata (Jeps.) S.R. Hill
JM1: Sidalcea malviflora subsp. asprella	Sidalcea asprella Greene
JM1: Sidalcea malviflora subsp. californica	Sidalcea malviflora subsp. californica (Torr. & A. Gray) C.L. Hitchc.
JMS: Sidalcea malviflora subsp. celata	Sidalcea celata (Jeps.) S.R. Hill
JM1: Sidalcea malviflora subsp. dolosa	Sidalcea malviflora subsp. dolosa C.L. Hitchc.
JM1: Sidalcea malviflora subsp. laciniata	Sidalcea malviflora subsp. laciniata C.L. Hitchc.
JM1: Sidalcea malviflora subsp. malviflora	Sidalcea malviflora (DC.) A. Gray subsp. malviflora
JMS: Sidalcea malviflora subsp. nana	Sidalcea asprella subsp. nana (Jeps.) S.R. Hill
JM1: Sidalcea malviflora subsp. patula	Sidalcea malviflora subsp. patula C.L. Hitchc.
JM1: Sidalcea malviflora subsp. purpurea	Sidalcea malviflora subsp. purpurea C.L. Hitchc.
JM2: Sidalcea malviflora subsp. rostrata	Sidalcea malviflora subsp. rostrata (Eastw.) Wiggins
JM1: Sidalcea malviflora subsp. sparsifolia	Sidalcea sparsifolia (C.L. Hitchc.) S.R. Hill
JM1: Sidalcea multifida	Sidalcea multifida Greene
JM1: Sidalcea neomexicana	Sidalcea neomexicana A. Gray
JM1: Sidalcea oregana	Sidalcea oregana (Torr. & A. Gray) A. Gray
JM1: Sidalcea oregana subsp. eximia	Sidalcea oregana subsp. eximia (Greene) C.L. Hitchc.
JM1: Sidalcea oregana subsp. hydrophila	Sidalcea oregana subsp. hydrophila (A. Heller) C.L. Hitchc.
JM1: Sidalcea oregana subsp. oregana	Sidalcea oregana (Torr. & A. Gray) A. Gray subsp. oregana
JM1: Sidalcea oregana subsp. spicata	Sidalcea oregana subsp. spicata (Regel) C.L. Hitchc.
JM1: Sidalcea oregana subsp. valida	Sidalcea oregana subsp. valida (Greene) C.L. Hitchc.
JM1: Sidalcea pedata	Sidalcea pedata A. Gray
JM1: Sidalcea ranunculacea	Sidalcea ranunculacea Greene
JM1: Sidalcea reptans	Sidalcea reptans Greene
JM1: Sidalcea robusta	Sidalcea robusta Roush
JM2: Sidalcea setosa	Sidalcea setosa C.L. Hitchc.
JM2: Sidalcea sparsifolia	Sidalcea sparsifolia (C.L. Hitchc.) S.R. Hill
JM1: Sidalcea stipularis	Sidalcea stipularis J.T. Howell & G.H. True
JM2: Sidotheca caryophylloides	Sidotheca caryophylloides (Parry) Reveal
JM2: Sidotheca emarginata	Sidotheca emarginata (H.M. Hall) Reveal
JM2: Sidotheca trilobata	Sidotheca trilobata (A. Gray) Reveal
JM1: Silene antirrhina	Silene antirrhina L.
JM1: Silene aperta	Silene aperta Greene
JM2: Silene armeria	Silene armeria L.
JM1: Silene bernardina	Silene bernardina S. Watson
JM2: Silene bolanderi	Silene bolanderi A. Gray
JM1: Silene bridgesii	Silene bridgesii Rohrb.
JM1: Silene californica	Silene laciniata subsp. californica (Durand) J.K. Morton
JM1: Silene campanulata	Silene campanulata S. Watson
JM1: Silene campanulata subsp. campanulata	Silene campanulata S. Watson subsp. campanulata
JM1: Silene campanulata subsp. glandulosa	Silene campanulata subsp. glandulosa C.L. Hitchc. & Maguire
JM2: Silene coniflora	Silene coniflora Otth
JM1: Silene conoidea	Silene conoidea L.
JMS: Silene coronaria	Lychnis coronaria (L.) Desr.
JM1: Silene dichotoma	Silene dichotoma Ehrh.
JM2: Silene dichotoma subsp. dichotoma	Silene dichotoma Ehrh. subsp. dichotoma
JM1: Silene douglasii	Silene douglasii Hook.
JM2: Silene douglasii var. douglasii	Silene douglasii Hook. var. douglasii
JM1: Silene gallica	Silene gallica L.
JM1: Silene grayi	Silene grayi S. Watson
JM1: Silene hookeri	Silene hookeri Nutt.; Silene bolanderi A. Gray
JMS: Silene hookeri subsp. bolanderi	Silene bolanderi A. Gray
JMS: Silene hookeri subsp. pulverulenta	Silene hookeri Nutt.
JM1: Silene invisa	Silene invisa C.L. Hitchc. & Maguire
JM2: Silene laciniata	Silene laciniata Cav.
JMS: Silene laciniata subsp. brandegeei	Silene laciniata Cav. subsp. laciniata
JM2: Silene laciniata subsp. californica	Silene laciniata subsp. californica (Durand) J.K. Morton
JM2: Silene laciniata subsp. laciniata	Silene laciniata Cav. subsp. laciniata
JM1: Silene laciniata subsp. major	Silene laciniata Cav. subsp. laciniata
JMS: Silene laciniata var. angustifolia	Silene laciniata Cav. subsp. laciniata
JMS: Silene laciniata var. latifolia	Silene laciniata Cav. subsp. laciniata
JM2: Silene latifolia	Silene latifolia Poir.
JM1: Silene latifolia subsp. alba	Silene latifolia Poir.
JM1: Silene lemmonii	Silene lemmonii S. Watson
JM1: Silene marmorensis	Silene marmorensis Kruckeb.
JM1: Silene menziesii	Silene menziesii Hook.
JM1: Silene multinervia	Silene coniflora Otth
JM1: Silene noctiflora	Silene noctiflora L.
JM1: Silene nuda	Silene nuda (S. Watson) C.L. Hitchc. & Maguire
JM1: Silene occidentalis	Silene occidentalis S. Watson
JM1: Silene occidentalis subsp. longistipitata	Silene occidentalis S. Watson
JM1: Silene occidentalis subsp. occidentalis	Silene occidentalis S. Watson
JM1: Silene oregana	Silene oregana S. Watson
JM1: Silene parishii	Silene parishii S. Watson
JM2: Silene pendula	Silene pendula L.
JM2: Silene pseudatocion	Silene pseudatocion Desf.
JM2: Silene salmonacea	Silene salmonacea T.W. Nelson et al.
JM1: Silene sargentii	Silene sargentii S. Watson
JM2: Silene scouleri	Silene scouleri Hook.
JM1: Silene scouleri subsp. grandis	Silene scouleri Hook. subsp. scouleri
JM2: Silene scouleri subsp. scouleri	Silene scouleri Hook. subsp. scouleri
JM2: Silene serpentinicola	Silene serpentinicola T.W. Nelson & J.P. Nelson
JM1: Silene suksdorfii	Silene suksdorfii B.L. Rob.
JM1: Silene verecunda	Silene verecunda S. Watson
JM1: Silene verecunda subsp. andersonii	Silene verecunda S. Watson
JM1: Silene verecunda subsp. platyota	Silene verecunda S. Watson
JM1: Silene verecunda subsp. verecunda	Silene verecunda S. Watson
JMS: Silene verecunda var. eglandulosa	Silene verecunda S. Watson
JM1: Silene vulgaris	Silene vulgaris (Moench) Garcke
JM1: Silybum marianum	Silybum marianum (L.) Gaertn.
JM1: Simmondsia chinensis	Simmondsia chinensis (Link) C.K. Schneid.
JM1: Sinapis alba	Sinapis alba L.
JM1: Sinapis arvensis	Sinapis arvensis L.
JM1: Sisymbrium altissimum	Sisymbrium altissimum L.
JM1: Sisymbrium erysimoides	Sisymbrium erysimoides Desf.
JM1: Sisymbrium irio	Sisymbrium irio L.
JM1: Sisymbrium loeselii	Sisymbrium loeselii L.
JM1: Sisymbrium officinale	Sisymbrium officinale (L.) Scop.
JM1: Sisymbrium orientale	Sisymbrium orientale L.
JM1: Sisyrinchium bellum	Sisyrinchium bellum S. Watson
JM1: Sisyrinchium californicum	Sisyrinchium californicum (Ker Gawl.) W.T. Aiton
JMS: Sisyrinchium douglasii	Olsynium douglasii (A. Dietr.) E.P. Bicknell
JM1: Sisyrinchium douglasii var. douglasii	Olsynium douglasii (A. Dietr.) E.P. Bicknell var. douglasii
JM1: Sisyrinchium elmeri	Sisyrinchium elmeri Greene
JM1: Sisyrinchium funereum	Sisyrinchium funereum E.P. Bicknell
JM1: Sisyrinchium halophilum	Sisyrinchium halophilum Greene
JM2: Sisyrinchium hitchcockii	Sisyrinchium hitchcockii Douglass M. Hend.
JM1: Sisyrinchium idahoense	Sisyrinchium idahoense E.P. Bicknell
JM1: Sisyrinchium idahoense var. idahoense	Sisyrinchium idahoense E.P. Bicknell var. idahoense
JM1: Sisyrinchium idahoense var. occidentale	Sisyrinchium idahoense var. occidentale (E.P. Bicknell) Douglass M. Hend.
JM2: Sisyrinchium longipes	Sisyrinchium longipes (E.P. Bicknell) Kearney & Peebles
JMS: Sitanion hystrix	Elymus elymoides (Raf.) Swezey
JMS: Sitanion hystrix var. californicum	Elymus elymoides var. californicus (J.G. Sm.) J.P. Sm.
JMS: Sitanion hystrix var. hystrix	Elymus elymoides (Raf.) Swezey var. elymoides
JMS: Sitanion jubatum	Elymus multisetus (J.G. Sm.) Burtt Davy
JMS: Sitanion longifolium	Elymus elymoides var. brevifolius (J.G. Sm.) Dorn
JM1: Sium suave	Sium suave Walter
JM2: Smelowskia ovalis	Smelowskia ovalis M.E. Jones
JM1: Smelowskia ovalis var. congesta	Smelowskia ovalis M.E. Jones
JM1: Smilacina racemosa	Maianthemum racemosum (L.) Link
JM1: Smilacina stellata	Maianthemum stellatum (L.) Link
JM1: Smilax californica	Smilax californica (A. DC.) A. Gray
JM1: Smilax jamesii	Smilax jamesii G.A. Wallace
JM1: Solanum americanum	Solanum americanum Mill.
JM1: Solanum aviculare	Solanum aviculare G. Forst.
JM1: Solanum carolinense	Solanum carolinense L.
JM1: Solanum dimidiatum	Solanum dimidiatum Raf.
JM1: Solanum douglasii	Solanum douglasii Dunal
JM1: Solanum dulcamara	Solanum dulcamara L.
JM1: Solanum elaeagnifolium	Solanum elaeagnifolium Cav.
JM1: Solanum furcatum	Solanum furcatum Dunal
JM1: Solanum lanceolatum	Solanum lanceolatum Cav.
JM1: Solanum marginatum	Solanum marginatum L. f.
JM1: Solanum mauritianum	Solanum aviculare G. Forst.
JM1: Solanum nigrum	Solanum nigrum L.
JM1: Solanum parishii	Solanum parishii A. Heller
JMS: Solanum peruvianum	Lycopersicon peruvianum (L.) Mill.
JM2: Solanum physalifolium	Solanum physalifolium Rusby
JM2: Solanum physalifolium var. nitidibaccatum	Solanum physalifolium Rusby var. nitidibaccatum (Bitter) Edmonds
JM1: Solanum rostratum	Solanum rostratum Dunal
JM1: Solanum sarrachoides	Solanum physalifolium Rusby var. nitidibaccatum (Bitter) Edmonds
JM1: Solanum sisymbriifolium	Solanum sisymbriifolium Lam.
JM1: Solanum triflorum	Solanum triflorum Nutt.
JM1: Solanum umbelliferum	Solanum umbelliferum Eschsch.
JM1: Solanum wallacei	Solanum wallacei (A. Gray) Parish
JM1: Solanum xanti	Solanum xanti A. Gray
JM1: Soleirolia soleirolii	Soleirolia soleirolii (Req.) Dandy
JM2: Solidago altissima	Solidago altissima L.
JM2: Solidago altissima subsp. altissima	Solidago altissima L. subsp. altissima
JM1: Solidago altissima var. altissima	Solidago altissima L. subsp. altissima
JM1: Solidago californica	Solidago velutina subsp. californica (Nutt.) Semple
JMS: Solidago canadensis	Solidago elongata Nutt.; Solidago lepida DC.
JM1: Solidago canadensis subsp. elongata	Solidago elongata Nutt.
JMS: Solidago canadensis var. elongata	Solidago elongata Nutt.
JMS: Solidago canadensis var. salebrosa	Solidago lepida DC. var. salebrosa (Piper) Semple
JM1: Solidago confinis	Solidago confinis A. Gray
JMS: Solidago confinis var. spectabilis	Solidago spectabilis (D.C. Eaton) A. Gray
JM2: Solidago elongata	Solidago elongata Nutt.
JM1: Solidago gigantea	Solidago lepida DC. var. salebrosa (Piper) Semple
JM1: Solidago guiradonis	Solidago guiradonis A. Gray
JM2: Solidago lepida	Solidago lepida DC.
JM2: Solidago lepida var. salebrosa	Solidago lepida DC. var. salebrosa (Piper) Semple
JMS: Solidago missouriensis	Solidago spectabilis (D.C. Eaton) A. Gray
JM1: Solidago multiradiata	Solidago multiradiata Aiton
JM1: Solidago sparsiflora	Solidago velutina subsp. sparsiflora (A. Gray) Semple
JM2: Solidago spathulata	Solidago spathulata DC.
JM1: Solidago spathulata subsp. spathulata	Solidago spathulata DC.
JM1: Solidago spectabilis	Solidago spectabilis (D.C. Eaton) A. Gray
JM2: Solidago velutina	Solidago velutina DC.
JM2: Solidago velutina subsp. californica	Solidago velutina subsp. californica (Nutt.) Semple
JM2: Solidago velutina subsp. sparsiflora	Solidago velutina subsp. sparsiflora (A. Gray) Semple
JM1: Soliva sessilis	Soliva sessilis Ruiz & Pav.
JM1: Sollya heterophylla	Billardiera heterophylla (Lindl.) L.W. Cayzer & Crisp
JM1: Sonchus arvensis	Sonchus arvensis L.
JM2: Sonchus arvensis subsp. arvensis	Sonchus arvensis L. subsp. arvensis
JM2: Sonchus arvensis subsp. uliginosus	Sonchus arvensis subsp. uliginosus (M. Bieb.) Nyman
JM2: Sonchus asper	Sonchus asper (L.) Hill
JM1: Sonchus asper subsp. asper	Sonchus asper (L.) Hill subsp. asper
JM1: Sonchus oleraceus	Sonchus oleraceus L.
JM1: Sonchus tenerrimus	Sonchus tenerrimus L.
JMS: Sophora secundiflora	Calia secundiflora (Ortega) Yakovlev
JM1: Sorbus aucuparia	Sorbus aucuparia L.
JM1: Sorbus californica	Sorbus californica Greene
JM1: Sorbus scopulina	Sorbus scopulina Greene
JM1: Sorbus scopulina var. cascadensis	Sorbus scopulina Greene
JM1: Sorbus scopulina var. scopulina	Sorbus scopulina Greene
JM2: Sorbus sitchensis	Sorbus sitchensis M. Roem.
JM1: Sorbus sitchensis var. grayi	Sorbus sitchensis var. grayi (Wenz.) C.L. Hitchc.
JM2: Sorbus sitchensis var. sitchensis	Sorbus sitchensis var. sitchensis
JM1: Sorghum bicolor	Sorghum bicolor (L.) Moench
JM1: Sorghum halepense	Sorghum halepense (L.) Pers.
JM1: Sparaxis grandiflora	Sparaxis grandiflora (D. Delaroche) Ker Gawl.
JM1: Sparaxis tricolor	Sparaxis tricolor (Schneev.) Ker Gawl.
JM1: Sparganium angustifolium	Sparganium angustifolium Michx.; Sparganium emersum Rehmann
JMS: Sparganium angustifolium subsp. emersum	Sparganium emersum Rehmann
JMS: Sparganium angustifolium var. multipedunculatum	Sparganium angustifolium Michx.
JMS: Sparganium chlorocarpum	Sparganium emersum Rehmann
JMS: Sparganium chlorocarpum var. acaule	Sparganium emersum Rehmann
JM2: Sparganium emersum	Sparganium emersum Rehmann; Sparganium angustifolium Michx.
JMS: Sparganium emersum subsp. acaule	Sparganium emersum Rehmann
JM1: Sparganium emersum subsp. emersum	Sparganium emersum Rehmann
JMS: Sparganium emersum var. multipedunculatum	Sparganium angustifolium Michx.
JMS: Sparganium erectum	Sparganium eurycarpum
JM1: Sparganium erectum subsp. stoloniferum	Sparganium eurycarpum var. greenei (Morong) Graebn.
JM2: Sparganium eurycarpum	Sparganium eurycarpum A. Gray
JM1: Sparganium eurycarpum subsp. eurycarpum	Sparganium eurycarpum A. Gray var. eurycarpum
JM2: Sparganium eurycarpum var. eurycarpum	Sparganium eurycarpum A. Gray var. eurycarpum
JM2: Sparganium eurycarpum var. greenei	Sparganium eurycarpum var. greenei (Morong) Graebn.
JMS: Sparganium greenei	Sparganium eurycarpum var. greenei (Morong) Graebn.
JMS: Sparganium minimum	Sparganium natans L.
JMS: Sparganium multipedunculatum	Sparganium angustifolium Michx.
JM1: Sparganium natans	Sparganium natans L.
JMS: Sparganium simplex	Sparganium angustifolium Michx.
JMS: Sparganium simplex var. multipedunculatum	Sparganium angustifolium Michx.
JM1: Spartina alterniflora	Spartina alterniflora Loisel.
JM1: Spartina densiflora	Spartina densiflora Brongn.
JM1: Spartina foliosa	Spartina foliosa Trin.
JM1: Spartina gracilis	Spartina gracilis Trin.
JM1: Spartina patens	Spartina patens (Aiton) Muhl.
JM1: Spartium junceum	Spartium junceum L.
JM2: Spergula arvensis	Spergula arvensis L.
JM1: Spergula arvensis subsp. arvensis	Spergula arvensis L.
JM1: Spergularia atrosperma	Spergularia atrosperma R. Rossbach
JM1: Spergularia bocconei	Spergularia bocconi (Scheele) Graebn.
JM2: Spergularia bocconi	Spergularia bocconi (Scheele) Graebn.
JM2: Spergularia canadensis	Spergularia canadensis (Pers.) G. Don
JM1: Spergularia canadensis var. occidentalis	Spergularia canadensis (Pers.) G. Don var. occidentalis R. Rossbach
JM1: Spergularia macrotheca	Spergularia macrotheca (Cham. & Schltdl.) Heynh.
JM1: Spergularia macrotheca var. leucantha	Spergularia macrotheca var. leucantha (Greene) B.L. Rob.
JM1: Spergularia macrotheca var. longistyla	Spergularia macrotheca var. longistyla R. Rossbach
JM1: Spergularia macrotheca var. macrotheca	Spergularia macrotheca (Cham. & Schltdl.) Heynh. var. macrotheca
JM1: Spergularia marina	Spergularia marina (L.) Besser
JMS: Spergularia marina var. tenuis	Spergularia marina (L.) Besser
JMS: Spergularia maritima	Spergularia media (L.) C. Presl var. media
JM1: Spergularia media	Spergularia media (L.) C. Presl
JM2: Spergularia media var. media	Spergularia media (L.) C. Presl var. media
JM1: Spergularia platensis	Spergularia platensis (Cambess.) Fenzl
JM2: Spergularia platensis var. platensis	Spergularia platensis (Cambess.) Fenzl var. platensis
JM1: Spergularia rubra	Spergularia rubra (L.) J. Presl & C. Presl
JMS: Spergularia salina	Spergularia marina (L.) Besser
JM1: Spergularia villosa	Spergularia villosa (Pers.) Cambess.
JM1: Spermolepis echinata	Spermolepis echinata (DC.) A. Heller
JM1: Sphaeralcea ambigua	Sphaeralcea ambigua A. Gray
JM1: Sphaeralcea ambigua var. ambigua	Sphaeralcea ambigua A. Gray var. ambigua
JM1: Sphaeralcea ambigua var. rosacea	Sphaeralcea ambigua var. rosacea (Munz & I.M. Johnst.) Kearney
JM1: Sphaeralcea ambigua var. rugosa	Sphaeralcea ambigua var. rugosa (Kearney) Kearney
JM1: Sphaeralcea angustifolia	Sphaeralcea angustifolia (Cav.) G. Don
JM1: Sphaeralcea coulteri	Sphaeralcea coulteri (S. Watson) A. Gray
JM2: Sphaeralcea emoryi	Sphaeralcea emoryi A. Gray
JM1: Sphaeralcea emoryi var. emoryi	Sphaeralcea emoryi A. Gray var. emoryi
JM1: Sphaeralcea grossulariifolia	Sphaeralcea grossulariifolia (Hook. & Arn.) Rydb.
JMS: Sphaeralcea grossulariifolia var. grossulariifolia	Sphaeralcea grossulariifolia (Hook. & Arn.) Rydb.
JM1: Sphaeralcea munroana	Sphaeralcea munroana (Lindl.) A. Gray
JM1: Sphaeralcea orcuttii	Sphaeralcea orcuttii Rose
JM2: Sphaeralcea rusbyi	Sphaeralcea rusbyi A. Gray
JMS: Sphaeralcea rusbyi subsp. eremicola	Sphaeralcea rusbyi A. Gray var. eremicola (Jeps.) Kearney
JM1: Sphaeralcea rusbyi var. eremicola	Sphaeralcea rusbyi A. Gray var. eremicola (Jeps.) Kearney
JM1: Sphaeromeria cana	Sphaeromeria cana (D.C. Eaton) A. Heller
JM1: Sphaeromeria potentilloides	Sphaeromeria potentilloides (A. Gray) A. Heller
JM1: Sphaeromeria potentilloides var. nitrophila	Sphaeromeria potentilloides var. nitrophila (Cronquist) A.H. Holmgren et al.
JM1: Sphaeromeria potentilloides var. potentilloides	Sphaeromeria potentilloides (A. Gray) A. Heller var. potentilloides
JM1: Sphaerophysa salsula	Sphaerophysa salsula (Pall.) DC.
JM1: Sphenopholis obtusata	Sphenopholis obtusata (Michx.) Scribn.
JM1: Sphenosciadium capitellatum	Sphenosciadium capitellatum A. Gray
JM1: Spiraea densiflora	Spiraea splendens K. Koch
JMS: Spiraea densiflora subsp. splendens	Spiraea splendens K. Koch
JM1: Spiraea douglasii	Spiraea douglasii Hook.
JM2: Spiraea splendens	Spiraea splendens K. Koch
JM1: Spiranthes porrifolia	Spiranthes porrifolia Lindl.
JM1: Spiranthes romanzoffiana	Spiranthes romanzoffiana Cham.
JMS: Spirodela oligorrhiza	Landoltia punctata (G. Mey.) Les & D.J. Crawford
JM2: Spirodela polyrhiza	Spirodela polyrhiza (L.) Schleid.
JM1: Spirodela polyrrhiza	Spirodela polyrhiza (L.) Schleid.
JM1: Spirodela punctata	Landoltia punctata (G. Mey.) Les & D.J. Crawford
JM1: Sporobolus airoides	Sporobolus airoides (Torr.) Torr.
JMS: Sporobolus airoides var. wrightii	Sporobolus wrightii Scribn.
JM1: Sporobolus contractus	Sporobolus contractus Hitchc.
JMS: Sporobolus creber	Sporobolus indicus (L.) R. Br.
JM1: Sporobolus cryptandrus	Sporobolus cryptandrus (Torr.) A. Gray
JMS: Sporobolus cryptandrus var. strictus	Sporobolus contractus Hitchc.
JM1: Sporobolus flexuosus	Sporobolus flexuosus (Vasey) Rydb.
JM1: Sporobolus indicus	Sporobolus indicus (L.) R. Br.
JMS: Sporobolus poiretii	Sporobolus indicus (L.) R. Br.
JM1: Sporobolus vaginiflorus	Sporobolus vaginiflorus (A. Gray) Alph. Wood
JM2: Sporobolus wrightii	Sporobolus wrightii Scribn.
JM1: Stachys ajugoides	Stachys ajugoides Benth.; Stachys pycnantha Benth.; Stachys rigida Benth.
JM1: Stachys ajugoides var. ajugoides	Stachys ajugoides Benth.
JMS: Stachys ajugoides var. cymosa	Stachys pycnantha Benth.
JMS: Stachys ajugoides var. quercetorum	Stachys rigida Benth. var. quercetorum (A. Heller) G.A. Mulligan & D.B. Munro
JM1: Stachys ajugoides var. rigida	Stachys bergii G.A. Mulligan & D.B. Munro; Stachys rigida Benth. var. quercetorum (A. Heller) G.A. Mulligan & D.B. Munro
JMS: Stachys ajugoides var. stricta	Stachys stricta Greene
JM1: Stachys albens	Stachys albens A. Gray
JMS: Stachys albens var. juliensis	Stachys albens A. Gray
JM1: Stachys arvensis	excluded
JM2: Stachys bergii	Stachys bergii G.A. Mulligan & D.B. Munro
JM1: Stachys bullata	Stachys bullata Benth.
JMS: Stachys californica	Stachys bullata Benth.
JM1: Stachys chamissonis	Stachys chamissonis Benth.
JMS: Stachys flaccida	Stachys chamissonis Benth.
JMS: Stachys gracilenta	Stachys rigida Benth. var. quercetorum (A. Heller) G.A. Mulligan & D.B. Munro
JMS: Stachys lanuginosa	Stachys albens A. Gray
JMS: Stachys malacophylla	Stachys albens A. Gray
JM2: Stachys mexicana	Stachys mexicana Benth.
JMS: Stachys palustris	Stachys pilosa Nutt.
JM1: Stachys palustris subsp. pilosa	Stachys pilosa Nutt.
JM2: Stachys pilosa	Stachys pilosa Nutt.
JM1: Stachys pycnantha	Stachys pycnantha Benth.
JMS: Stachys quercetorum	Stachys rigida Benth. var. quercetorum (A. Heller) G.A. Mulligan & D.B. Munro
JMS: Stachys ramosa	Stachys ajugoides Benth.
JM2: Stachys rigida	Stachys rigida Benth.; Stachys bergii G.A. Mulligan & D.B. Munro
JMS: Stachys rigida subsp. lanata	Stachys bergii G.A. Mulligan & D.B. Munro
JMS: Stachys rigida subsp. quercetorum	Stachys rigida Benth. var. quercetorum (A. Heller) G.A. Mulligan & D.B. Munro
JMS: Stachys rigida subsp. rivularis	Stachys rigida Benth. var. quercetorum (A. Heller) G.A. Mulligan & D.B. Munro
JM2: Stachys rigida var. quercetorum	Stachys rigida Benth. var. quercetorum (A. Heller) G.A. Mulligan & D.B. Munro
JM2: Stachys stebbinsii	Stachys stebbinsii G.A. Mulligan & D.B. Munro
JM1: Stachys stricta	Stachys stricta Greene
JMS: Stachys velutina	Stachys albens A. Gray
JMS: Stachys veronicifolia	Stachys rigida Benth. var. quercetorum (A. Heller) G.A. Mulligan & D.B. Munro
JMS: Stachys viarum	Stachys rigida Benth. var. quercetorum (A. Heller) G.A. Mulligan & D.B. Munro
JMS: Stanfordia californica	Caulanthus californicus (S. Watson) Payson
JM1: Stanleya elata	Stanleya elata M.E. Jones
JM1: Stanleya pinnata	Stanleya pinnata (Pursh) Britton
JMS: Stanleya pinnata subsp. inyoensis	Stanleya pinnata (Pursh) Britton var. pinnata
JM1: Stanleya pinnata var. inyoensis	Stanleya pinnata (Pursh) Britton var. pinnata
JM1: Stanleya pinnata var. pinnata	Stanleya pinnata (Pursh) Britton var. pinnata
JM1: Stanleya viridiflora	Stanleya viridiflora Nutt.
JM1: Staphylea bolanderi	Staphylea bolanderi A. Gray
JMS: Statice perezii	Limonium perezii (Stapf) F.T. Hubb.
JM1: Stebbinsoseris decipiens	Stebbinsoseris decipiens (K.L. Chambers) K.L. Chambers
JM1: Stebbinsoseris heterocarpa	Stebbinsoseris heterocarpa (Nutt.) K.L. Chambers
JM2: Stellaria borealis	Stellaria borealis Bigelow
JM1: Stellaria borealis subsp. sitchana	Stellaria borealis Bigelow subsp. sitchana (Steud.) Piper & Beattie
JM1: Stellaria calycantha	Stellaria calycantha (Ledeb.) Bong.
JM1: Stellaria crispa	Stellaria crispa Cham. & Schltdl.
JM1: Stellaria graminea	Stellaria graminea L.
JMS: Stellaria lagunensis	Arenaria lanuginosa (Michx.) Rohrb. var. saxosa (A. Gray) Zarucchi et al.
JM1: Stellaria littoralis	Stellaria littoralis Torr.
JM1: Stellaria longifolia	Stellaria longifolia Willd.
JM2: Stellaria longipes	Stellaria longipes Goldie
JM2: Stellaria longipes subsp. longipes	Stellaria longipes Goldie subsp. longipes
JM1: Stellaria longipes var. longipes	Stellaria longipes Goldie subsp. longipes
JM1: Stellaria media	Stellaria media (L.) Vill.
JMS: Stellaria media subsp. neglecta	Stellaria neglecta Weihe
JM2: Stellaria neglecta	Stellaria neglecta Weihe
JM1: Stellaria nitens	Stellaria nitens Nutt.
JM1: Stellaria obtusa	Stellaria obtusa Engelm.
JM1: Stellaria pallida	Stellaria pallida (Dumort.) Cr&eacute;p.
JM1: Stellaria umbellata	Stellaria umbellata Kar. & Kir.
JM1: Stemodia durantifolia	Stemodia durantifolia (L.) Sw.
JM1: Stenanthium occidentale	Stenanthium occidentale A. Gray
JM1: Stenotaphrum secundatum	Stenotaphrum secundatum (Walter) Kuntze
JM1: Stenotus acaulis	Stenotus acaulis (Nutt.) Nutt.
JM1: Stenotus lanuginosus	Stenotus lanuginosus (A. Gray) Greene
JM2: Stenotus lanuginosus var. lanuginosus	Stenotus lanuginosus (A. Gray) Greene var. lanuginosus
JM1: Stenotus stenophyllus	Nestotus stenophyllus (A. Gray) R.P. Roberts et al.
JM1: Stephanomeria blairii	Munzothamnus blairii (Munz & I.M. Johnst.) P.H. Raven
JM1: Stephanomeria cichoriacea	Stephanomeria cichoriacea A. Gray
JM1: Stephanomeria diegensis	Stephanomeria diegensis Gottlieb
JM1: Stephanomeria elata	Stephanomeria elata Nutt.
JM1: Stephanomeria exigua	Stephanomeria exigua Nutt.
JM1: Stephanomeria exigua subsp. carotifera	Stephanomeria exigua subsp. carotifera (Hoover) Gottlieb
JM1: Stephanomeria exigua subsp. coronaria	Stephanomeria exigua subsp. coronaria (Greene) Gottlieb
JM1: Stephanomeria exigua subsp. deanei	Stephanomeria exigua subsp. deanei (J.F. Macbr.) Gottlieb
JM1: Stephanomeria exigua subsp. exigua	Stephanomeria exigua Nutt. subsp. exigua
JM1: Stephanomeria exigua subsp. macrocarpa	Stephanomeria exigua subsp. macrocarpa Gottlieb
JM1: Stephanomeria lactucina	Stephanomeria lactucina A. Gray
JMS: Stephanomeria minor	Stephanomeria tenuifolia (Raf.) H.M. Hall
JMS: Stephanomeria minor var. minor	Stephanomeria tenuifolia (Raf.) H.M. Hall
JMS: Stephanomeria minor var. myrioclada	Stephanomeria tenuifolia (Raf.) H.M. Hall
JM1: Stephanomeria paniculata	Stephanomeria paniculata Nutt.
JM1: Stephanomeria parryi	Stephanomeria parryi A. Gray
JM1: Stephanomeria pauciflora	Stephanomeria pauciflora (Torr.) A. Nelson
JM1: Stephanomeria pauciflora var. parishii	Stephanomeria pauciflora (Torr.) A. Nelson
JM1: Stephanomeria pauciflora var. pauciflora	Stephanomeria pauciflora (Torr.) A. Nelson
JMS: Stephanomeria runcinata	Stephanomeria pauciflora (Torr.) A. Nelson
JMS: Stephanomeria runcinata var. parishii	Stephanomeria pauciflora (Torr.) A. Nelson
JM1: Stephanomeria spinosa	Pleiacanthus spinosus (Nutt.) Rydb.
JM1: Stephanomeria tenuifolia	Stephanomeria tenuifolia (Raf.) H.M. Hall
JMS: Stephanomeria tenuifolia var. myrioclada	Stephanomeria tenuifolia (Raf.) H.M. Hall
JMS: Stephanomeria tomentosa	Stephanomeria virgata Benth. subsp. virgata
JM1: Stephanomeria virgata	Stephanomeria virgata Benth.
JM1: Stephanomeria virgata subsp. pleurocarpa	Stephanomeria virgata subsp. pleurocarpa (Greene) Gottlieb
JM1: Stephanomeria virgata subsp. virgata	Stephanomeria virgata Benth. subsp. virgata
JM1: Stillingia linearifolia	Stillingia linearifolia S. Watson
JM1: Stillingia paucidentata	Stillingia paucidentata S. Watson
JM1: Stillingia spinulosa	Stillingia spinulosa Torr.
JM2: Stipa arida	Stipa arida M.E. Jones
JM2: Stipa brachychaeta	Stipa brachychaeta Godr.
JM2: Stipa capensis	Stipa capensis Thunb.
JM2: Stipa cernua	Stipa cernua Stebbins & Love
JM2: Stipa chaetophora	Stipa chaetophora (Griseb.) Columbus & J.P. Sm.
JMS: Stipa columbiana	Stipa nelsonii Scribn. var. dorei (Barkworth & J.R. Maze) Dorn
JM2: Stipa comata	Stipa comata Trin. & Rupr.
JM2: Stipa comata var. comata	Stipa comata Trin. & Rupr. var. comata
JM2: Stipa comata var. intermedia	Stipa comata var. intermedia Scribn. & Tweedy
JM2: Stipa coronata	Stipa coronata Thurb.
JM2: Stipa diegoensis	Stipa diegoensis Swallen
JM2: Stipa divaricata	Stipa divaricata Columbus & J.P. Sm.
JM2: Stipa exigua	Stipa exigua (Thurb.) Columbus & J.P. Sm.
JMS: Stipa formicarum	Stipa manicata E. Desv.
JM2: Stipa hymenoides	Stipa hymenoides Roem. & Schult.
JM2: Stipa kingii	Stipa kingii Bol.
JM2: Stipa latiglumis	Stipa latiglumis Swallen
JM2: Stipa lemmonii	Stipa lemmonii (Vasey) Scribn.
JM2: Stipa lemmonii var. lemmonii	Stipa lemmonii (Vasey) Scribn. var. lemmonii
JM2: Stipa lemmonii var. pubescens	Stipa lemmonii var. pubescens Crampton
JM2: Stipa lepida	Stipa lepida Hitchc.
JM2: Stipa lettermanii	Stipa lettermanii Vasey
JM2: Stipa manicata	Stipa manicata E. Desv.
JM2: Stipa mauritanica	Stipa mauritanica (Poir.) Columbus & J.P. Sm.
JM2: Stipa miliacea	Stipa miliacea (L.) Hoover
JM2: Stipa miliacea var. miliacea	Stipa miliacea (L.) Hoover var. miliacea
JM2: Stipa nelsonii	Stipa nelsonii Scribn.
JM2: Stipa nelsonii var. dorei	Stipa nelsonii Scribn. var. dorei (Barkworth & J.R. Maze) Dorn
JM2: Stipa nevadensis	Stipa nevadensis B.L. Johnson
JM2: Stipa occidentalis	Stipa occidentalis S. Watson
JM2: Stipa occidentalis var. californica	Stipa occidentalis var. californica (Merr. & Burtt Davy) C.L. Hitchc.
JM2: Stipa occidentalis var. occidentalis	Stipa occidentalis S. Watson var. occidentalis
JM2: Stipa occidentalis var. pubescens	Stipa occidentalis var. pubescens (Vasey) J.R. Maze et al.
JM2: Stipa parishii	Stipa parishii Vasey
JM2: Stipa parishii var. parishii	Stipa parishii Vasey var. parishii
JM2: Stipa pinetorum	Stipa pinetorum M.E. Jones
JM2: Stipa pulchra	Stipa pulchra Hitchc.
JM2: Stipa purpurata	Stipa purpurata Columbus & J.P. Sm.
JM2: Stipa speciosa	Stipa speciosa Trin. & Rupr.
JM2: Stipa stillmanii	Stipa stillmanii Bol.
JM2: Stipa thurberiana	Stipa thurberiana Piper
JM2: Stipa webberi	Stipa webberi (Thurb.) B.L. Johnson
JM1: Streptanthella longirostris	Streptanthella longirostris (S. Watson) Rydb.
JMS: Streptanthella longirostris var. derelicta	Streptanthella longirostris (S. Watson) Rydb.
JM1: Streptanthus albidus	Streptanthus glandulosus Hook.
JM1: Streptanthus albidus subsp. albidus	Streptanthus glandulosus subsp. albidus (Greene) Al-Shehbaz et al.
JM1: Streptanthus albidus subsp. peramoenus	Streptanthus glandulosus Hook. subsp. glandulosus
JMS: Streptanthus anceps	Caulanthus anceps Payson
JM1: Streptanthus barbatus	Streptanthus barbatus S. Watson
JM1: Streptanthus barbiger	Streptanthus barbiger Greene
JM1: Streptanthus batrachopus	Streptanthus batrachopus J.L. Morrison
JM1: Streptanthus bernardinus	Streptanthus bernardinus (Greene) Parish
JM1: Streptanthus brachiatus	Streptanthus brachiatus F.W. Hoffm.
JM1: Streptanthus brachiatus subsp. brachiatus	Streptanthus brachiatus F.W. Hoffm.
JM1: Streptanthus brachiatus subsp. hoffmanii	Streptanthus brachiatus F.W. Hoffm.
JM1: Streptanthus breweri	Streptanthus breweri A. Gray; Streptanthus hesperidis Jeps.
JM1: Streptanthus breweri var. breweri	Streptanthus breweri A. Gray
JM1: Streptanthus breweri var. hesperidis	Streptanthus hesperidis Jeps.
JM1: Streptanthus callistus	Streptanthus callistus J.L. Morrison
JM1: Streptanthus campestris	Streptanthus campestris S. Watson
JM1: Streptanthus cordatus	Streptanthus cordatus Nutt.; Streptanthus oliganthus Rollins
JM1: Streptanthus cordatus var. cordatus	Streptanthus cordatus Nutt. var. cordatus
JM1: Streptanthus cordatus var. duranii	Streptanthus cordatus Nutt. var. cordatus
JMS: Streptanthus cordatus var. exiguus	Streptanthus oliganthus Rollins
JM1: Streptanthus cordatus var. piutensis	Streptanthus cordatus var. piutensis J.T. Howell
JMS: Streptanthus coulteri	Caulanthus lemmonii S. Watson
JMS: Streptanthus coulteri var. lemmonii	Caulanthus lemmonii S. Watson
JM1: Streptanthus diversifolius	Streptanthus diversifolius S. Watson
JM1: Streptanthus drepanoides	Streptanthus drepanoides Kruckeb. & J.L. Morrison
JM1: Streptanthus farnsworthianus	Streptanthus farnsworthianus J.T. Howell
JM1: Streptanthus fenestratus	Streptanthus fenestratus (Greene) J.T. Howell
JMS: Streptanthus flavescens	Caulanthus flavescens (Hook.) Payson
JM1: Streptanthus glandulosus	Streptanthus glandulosus Hook.
JM2: Streptanthus glandulosus subsp. albidus	Streptanthus glandulosus subsp. albidus (Greene) Al-Shehbaz et al.
JMS: Streptanthus glandulosus subsp. arkii	Streptanthus glandulosus Hook. subsp. glandulosus
JM1: Streptanthus glandulosus subsp. glandulosus	Streptanthus glandulosus Hook. subsp. glandulosus
JM2: Streptanthus glandulosus subsp. hoffmanii	Streptanthus glandulosus subsp. hoffmanii (Kruckeb.) M.S. Mayer & D.W. Taylor
JM2: Streptanthus glandulosus subsp. niger	Streptanthus glandulosus subsp. niger (Greene) Al-Shehbaz et al.
JM1: Streptanthus glandulosus subsp. pulchellus	Streptanthus glandulosus subsp. pulchellus (Greene) Kruckeb.
JMS: Streptanthus glandulosus subsp. raichei	Streptanthus glandulosus Hook. subsp. glandulosus
JM1: Streptanthus glandulosus subsp. secundus	Streptanthus glandulosus subsp. secundus (Greene) Kruckeb.
JM2: Streptanthus glandulosus subsp. sonomensis	Streptanthus glandulosus subsp. sonomensis (Kruckeb.) M.S. Mayer & D.W. Taylor
JMS: Streptanthus glandulosus var. hoffmannii	Streptanthus glandulosus subsp. hoffmanii (Kruckeb.) M.S. Mayer & D.W. Taylor
JMS: Streptanthus glandulosus var. niger	Streptanthus glandulosus subsp. niger (Greene) Al-Shehbaz et al.
JMS: Streptanthus glandulosus var. pulchellus	Streptanthus glandulosus subsp. pulchellus (Greene) Kruckeb.
JMS: Streptanthus glandulosus var. sonomensis	Streptanthus glandulosus subsp. sonomensis (Kruckeb.) M.S. Mayer & D.W. Taylor
JMS: Streptanthus glaucus	Caulanthus glaucus S. Watson
JM1: Streptanthus gracilis	Streptanthus gracilis Eastw.
JMS: Streptanthus hallii	Caulanthus hallii Payson
JM2: Streptanthus hesperidis	Streptanthus hesperidis Jeps.
JMS: Streptanthus heterophyllus	Caulanthus heterophyllus (Nutt.) Payson
JM1: Streptanthus hispidus	Streptanthus hispidus A. Gray
JM1: Streptanthus howellii	Streptanthus howellii S. Watson
JMS: Streptanthus inflatus	Caulanthus inflatus S. Watson
JM1: Streptanthus insignis	Streptanthus insignis Jeps.
JM1: Streptanthus insignis subsp. insignis	Streptanthus insignis Jeps. subsp. insignis
JM1: Streptanthus insignis subsp. lyonii	Streptanthus insignis subsp. lyonii Kruckeb. & J.L. Morrison
JM2: Streptanthus longisiliquus	Streptanthus longisiliquus G.L. Clifton & R.E. Buck
JMS: Streptanthus major	Caulanthus major (M.E. Jones) Payson
JM1: Streptanthus morrisonii	Streptanthus morrisonii F.W. Hoffm.
JMS: Streptanthus morrisonii subsp. elatus	Streptanthus morrisonii F.W. Hoffm.
JMS: Streptanthus morrisonii subsp. hirtiflorus	Streptanthus morrisonii F.W. Hoffm.
JMS: Streptanthus morrisonii subsp. kruckebergii	Streptanthus morrisonii F.W. Hoffm.
JM1: Streptanthus niger	Streptanthus glandulosus subsp. niger (Greene) Al-Shehbaz et al.
JM2: Streptanthus oblanceolatus	Streptanthus oblanceolatus T.W. Nelson & J.P. Nelson
JM1: Streptanthus oliganthus	Streptanthus oliganthus Rollins
JMS: Streptanthus pilosus	Caulanthus pilosus S. Watson
JM1: Streptanthus polygaloides	Streptanthus polygaloides A. Gray
JMS: Streptanthus simulans	Caulanthus simulans Payson
JM1: Streptanthus tortuosus	Streptanthus tortuosus Kellogg
JM1: Streptanthus tortuosus var. flavescens	Streptanthus tortuosus Kellogg
JMS: Streptanthus tortuosus var. oblongus	Streptanthus tortuosus Kellogg
JMS: Streptanthus tortuosus var. optatus	Streptanthus tortuosus Kellogg
JM1: Streptanthus tortuosus var. orbiculatus	Streptanthus tortuosus Kellogg
JMS: Streptanthus tortuosus var. pallidus	Streptanthus tortuosus Kellogg
JM1: Streptanthus tortuosus var. suffrutescens	Streptanthus tortuosus Kellogg
JM1: Streptanthus tortuosus var. tortuosus	Streptanthus tortuosus Kellogg
JM2: Streptanthus vernalis	Streptanthus vernalis R. O'Donnell & R.W. Dolan
JM2: Streptanthus vimineus	Streptanthus vimineus (Greene) Al-Shehbaz & D.W. Taylor
JM2: Streptopus amplexifolius	Streptopus amplexifolius (L.) DC.
JM1: Streptopus amplexifolius var. americanus	Streptopus amplexifolius (L.) DC. var. americanus Schult. & Schult. f.
JM2: Strigosella africana	Strigosella africana (L.) Botsch.
JMS: Struthiopteris spicant	Blechnum spicant (L.) Roth
JM2: Stuckenia filiformis	Stuckenia filiformis (Pers.) B&ouml;rner
JM2: Stuckenia filiformis subsp. alpina	Stuckenia filiformis (Pers.) B&ouml;rner subsp. alpina (Blytt) R.R. Haynes et al.
JM2: Stuckenia pectinata	Stuckenia pectinata (L.) B&ouml;rner
JM2: Stuckenia striata	Stuckenia striata (Ruiz & Pav.) Holub
JM1: Stylocline citroleum	Stylocline citroleum Morefield
JMS: Stylocline gnaphalioides	Stylocline gnaphaloides Nutt.
JM1: Stylocline gnaphaloides	Stylocline gnaphaloides Nutt.
JM1: Stylocline intertexta	Stylocline intertexta Morefield
JM1: Stylocline masonii	Stylocline masonii Morefield
JM1: Stylocline micropoides	Stylocline micropoides A. Gray
JM1: Stylocline psilocarphoides	Stylocline psilocarphoides M. Peck
JM1: Stylocline sonorensis	Stylocline sonorensis Wiggins
JM1: Stylomecon heterophylla	Papaver heterophyllum (Benth.) Greene
JMS: Styrax officinalis	Styrax redivivus (Torr.) L.C. Wheeler
JMS: Styrax officinalis var. californicus	Styrax redivivus (Torr.) L.C. Wheeler
JMS: Styrax officinalis var. fulvescens	Styrax redivivus (Torr.) L.C. Wheeler
JM1: Styrax officinalis var. redivivus	Styrax redivivus (Torr.) L.C. Wheeler
JM2: Styrax redivivus	Styrax redivivus (Torr.) L.C. Wheeler
JM1: Suaeda calceoliformis	Suaeda calceoliformis (Hook.) Moq.
JM1: Suaeda californica	Suaeda californica S. Watson
JMS: Suaeda californica var. pubescens	Suaeda taxifolia (Standl.) Standl.
JMS: Suaeda californica var. taxifolia	Suaeda taxifolia (Standl.) Standl.
JMS: Suaeda depressa	Suaeda calceoliformis (Hook.) Moq.
JMS: Suaeda depressa var. depressa	Suaeda calceoliformis (Hook.) Moq.
JMS: Suaeda depressa var. erecta	Suaeda calceoliformis (Hook.) Moq.
JM1: Suaeda esteroa	Suaeda esteroa Ferren & S.A. Whitmore
JMS: Suaeda fruticosa	Suaeda nigra (Raf.) J.F. Macbr.
JM1: Suaeda moquinii	Suaeda nigra (Raf.) J.F. Macbr.
JM2: Suaeda nigra	Suaeda nigra (Raf.) J.F. Macbr.
JM2: Suaeda occidentalis	Suaeda occidentalis (S. Watson) S. Watson
JM1: Suaeda taxifolia	Suaeda taxifolia (Standl.) Standl.
JMS: Suaeda torreyana	Suaeda nigra (Raf.) J.F. Macbr.
JMS: Suaeda torreyana var. ramosissima	Suaeda nigra (Raf.) J.F. Macbr.
JMS: Suaeda torreyana var. torreyana	Suaeda nigra (Raf.) J.F. Macbr.
JM2: Subularia aquatica	Subularia aquatica L.
JM2: Subularia aquatica subsp. americana	Subularia aquatica L. subsp. americana G.A. Mulligan & Calder
JM1: Subularia aquatica var. americana	Subularia aquatica L. subsp. americana G.A. Mulligan & Calder
JM1: Suksdorfia ranunculifolia	Hemieva ranunculifolia (Hook.) Raf.
JM1: Swallenia alexandrae	Swallenia alexandrae (Swallen) Soderstr. & H.F. Decker
JM1: Swertia albicaulis	Frasera albicaulis Griseb.
JM1: Swertia albicaulis var. albicaulis	Frasera albicaulis var. modocensis (H. St. John) N.H. Holmgren
JM1: Swertia albicaulis var. nitida	Frasera albicaulis var. nitida (Benth.) C.L. Hitchc.
JM1: Swertia albomarginata	Frasera albomarginata S. Watson
JM1: Swertia fastigiata	Frasera umpquaensis M. Peck & Applegate
JM1: Swertia neglecta	Frasera neglecta H.M. Hall
JM1: Swertia parryi	Frasera parryi Torr.
JM1: Swertia perennis	Swertia perennis L.
JM1: Swertia puberulenta	Frasera puberulenta Davidson
JM1: Swertia radiata	Frasera speciosa Griseb.
JMS: Swertia radiata var. radiata	Frasera speciosa Griseb.
JM1: Swertia tubulosa	Frasera tubulosa Coville
JMS: Swertia umpquaensis	Frasera umpquaensis M. Peck & Applegate
JM2: Syagrus romanzoffiana	Syagrus romanzoffiana (Cham.) Glassman
JMS: Sympetaleia rupestris	Eucnide rupestris (Baill.) H.J. Thomps. & W.R. Ernst
JMS: Symphoricarpos acutus	Symphoricarpos mollis Nutt.
JM2: Symphoricarpos albus	Symphoricarpos albus (L.) S.F. Blake
JM1: Symphoricarpos albus var. laevigatus	Symphoricarpos albus (L.) S.F. Blake var. laevigatus (Fernald) S.F. Blake
JMS: Symphoricarpos hesperius	Symphoricarpos mollis Nutt.
JM1: Symphoricarpos longiflorus	Symphoricarpos longiflorus A. Gray
JM1: Symphoricarpos mollis	Symphoricarpos mollis Nutt.
JM1: Symphoricarpos rotundifolius	Symphoricarpos rotundifolius A. Gray
JM1: Symphoricarpos rotundifolius var. parishii	Symphoricarpos rotundifolius var. parishii (Rydb.) Dempster
JM1: Symphoricarpos rotundifolius var. rotundifolius	Symphoricarpos rotundifolius A. Gray var. rotundifolius
JM2: Symphyotrichum ascendens	Symphyotrichum ascendens (Lindl.) G.L. Nesom
JM2: Symphyotrichum bracteolatum	Symphyotrichum bracteolatum (Nutt.) G.L. Nesom
JM2: Symphyotrichum campestre	Symphyotrichum campestre (Nutt.) G.L. Nesom
JMS: Symphyotrichum campestre var. bloomeri	Symphyotrichum campestre (Nutt.) G.L. Nesom
JM2: Symphyotrichum chilense	Symphyotrichum chilense (Nees) G.L. Nesom
JMS: Symphyotrichum chilense var. invenustum	Symphyotrichum chilense (Nees) G.L. Nesom
JMS: Symphyotrichum chilense var. medium	Symphyotrichum chilense (Nees) G.L. Nesom
JM2: Symphyotrichum defoliatum	Symphyotrichum defoliatum (Parish) G.L. Nesom
JMS: Symphyotrichum eatonii	Symphyotrichum bracteolatum (Nutt.) G.L. Nesom
JMS: Symphyotrichum expansum	Symphyotrichum subulatum var. parviflorum (Nees) S.D. Sundb.
JM2: Symphyotrichum foliaceum	Symphyotrichum foliaceum (DC.) G.L. Nesom
JM2: Symphyotrichum foliaceum var. apricum	Symphyotrichum foliaceum var. apricum (A. Gray) G.L. Nesom
JM2: Symphyotrichum foliaceum var. parryi	Symphyotrichum foliaceum var. parryi (D.C. Eaton) G.L. Nesom
JM2: Symphyotrichum frondosum	Symphyotrichum frondosum (Nutt.) G.L. Nesom
JM2: Symphyotrichum greatae	Symphyotrichum greatae (Parish) G.L. Nesom
JM2: Symphyotrichum hendersonii	Symphyotrichum hendersonii (Fernald) G.L. Nesom
JM2: Symphyotrichum lanceolatum	Symphyotrichum lanceolatum (Willd.) G.L. Nesom
JM2: Symphyotrichum lanceolatum var. hesperium	Symphyotrichum lanceolatum (Willd.) G.L. Nesom var. hesperium (A. Gray) G.L. Nesom
JM2: Symphyotrichum lentum	Symphyotrichum lentum (Greene) G.L. Nesom
JM2: Symphyotrichum spathulatum	Symphyotrichum spathulatum (Lindl.) G.L. Nesom
JM2: Symphyotrichum spathulatum var. intermedium	Symphyotrichum spathulatum var. intermedium (A. Gray) G.L. Nesom
JM2: Symphyotrichum spathulatum var. spathulatum	Symphyotrichum spathulatum (Lindl.) G.L. Nesom var. spathulatum
JM2: Symphyotrichum spathulatum var. yosemitanum	Symphyotrichum spathulatum var. yosemitanum (A. Gray) G.L. Nesom
JM2: Symphyotrichum subspicatum	Symphyotrichum subspicatum (Nees) G.L. Nesom
JM2: Symphyotrichum subulatum	Symphyotrichum subulatum (Michx.) G.L. Nesom
JM2: Symphyotrichum subulatum var. elongatum	Symphyotrichum subulatum var. elongatum (A.G. Jones & Lowry) S.D. Sundb.
JM2: Symphyotrichum subulatum var. parviflorum	Symphyotrichum subulatum var. parviflorum (Nees) S.D. Sundb.
JM2: Symphyotrichum subulatum var. squamatum	Symphyotrichum subulatum var. squamatum (Spreng.) S.D. Sundb.
JM2: Symphytum &times;uplandicum	Symphytum &times;uplandicum Nyman
JM1: Symphytum asperum	Symphytum &times;uplandicum Nyman
JM1: Symphytum officinale	Symphytum officinale L.
JM2: Synthyris cordata	Synthyris cordata (A. Gray) A. Heller
JMS: Synthyris major	Synthyris missurica (Raf.) Pennell subsp. missurica
JM1: Synthyris missurica	Synthyris missurica (Raf.) Pennell
JM2: Synthyris missurica subsp. missurica	Synthyris missurica (Raf.) Pennell subsp. missurica
JM1: Synthyris reniformis	Synthyris reniformis (Benth.) Benth.
JMS: Synthyris stellata	Synthyris missurica (Raf.) Pennell subsp. missurica
JM1: Syntrichopappus fremontii	Syntrichopappus fremontii A. Gray
JM1: Syntrichopappus lemmonii	Syntrichopappus lemmonii (A. Gray) A. Gray
JM1: Systenotheca vortriedei	Systenotheca vortriedei (Brandegee) Reveal & Hardham
JM2: Syzygium australe	Syzygium australe (Link) B. Hyland
JMS: Taeniatherum asperum	Elymus caput-medusae L.
JM1: Taeniatherum caput-medusae	Elymus caput-medusae L.
JM1: Tagetes erecta	Tagetes erecta L.
JM1: Tagetes minuta	Tagetes minuta L.
JMS: Tagetes patula	Tagetes erecta L.
JM1: Tamarix aphylla	Tamarix aphylla (L.) H. Karst.
JM1: Tamarix chinensis	Tamarix chinensis Lour.
JM1: Tamarix gallica	Tamarix gallica L.
JM1: Tamarix parviflora	Tamarix parviflora DC.
JM1: Tamarix ramosissima	Tamarix ramosissima Ledeb.
JM2: Tanacetum bipinnatum	Tanacetum bipinnatum (L.) Sch. Bip.
JM1: Tanacetum camphoratum	Tanacetum bipinnatum (L.) Sch. Bip.
JM1: Tanacetum parthenium	Tanacetum parthenium (L.) Sch. Bip.
JM1: Tanacetum vulgare	Tanacetum vulgare L.
JM1: Taraxacum californicum	Taraxacum californicum Munz & I.M. Johnst.
JM2: Taraxacum ceratophorum	Taraxacum ceratophorum (Ledeb.) DC.
JMS: Taraxacum ceratophorum var. bernardinum	Taraxacum californicum Munz & I.M. Johnst.
JM2: Taraxacum erythrospermum	Taraxacum erythrospermum Besser
JMS: Taraxacum laevigatum	Taraxacum erythrospermum Besser
JMS: Taraxacum laevigatum var. erythrospermum	Taraxacum erythrospermum Besser
JM1: Taraxacum officinale	Taraxacum officinale F.H. Wigg.; Taraxacum ceratophorum (Ledeb.) DC.; Taraxacum erythrospermum Besser
JMS: Taraxacum officinale subsp. ceratophorum	Taraxacum ceratophorum (Ledeb.) DC.
JMS: Taraxacum officinale var. erythrospermum	Taraxacum erythrospermum Besser
JM2: Taraxia ovata	Taraxia ovata (Torr. & A. Gray) Small
JM2: Taraxia subacaulis	Taraxia subacaulis (Pursh) Rydb.
JM2: Taraxia tanacetifolia	Taraxia tanacetifolia (Torr. & A. Gray) Piper
JM1: Tauschia arguta	Tauschia arguta (Torr. & A. Gray) J.F. Macbr.
JM1: Tauschia glauca	Tauschia glauca (J.M. Coult. & Rose) Mathias & Constance
JM1: Tauschia hartwegii	Tauschia hartwegii (A. Gray) J.F. Macbr.
JM1: Tauschia howellii	Tauschia howellii (J.M. Coult. & Rose) J.F. Macbr.
JM1: Tauschia kelloggii	Tauschia kelloggii (A. Gray) J.F. Macbr.
JM1: Tauschia parishii	Tauschia parishii (J.M. Coult. & Rose) J.F. Macbr.
JM1: Taxus brevifolia	Taxus brevifolia Nutt.
JMS: Taxus brevifolia var. polychaeta	Taxus brevifolia Nutt.
JMS: Taxus brevifolia var. reptaneta	Taxus brevifolia Nutt.
JM1: Teesdalia coronopifolia	Teesdalia coronopifolia (Bergeret) Thell.
JM2: Teesdalia nudicaulis	Teesdalia nudicaulis (L.) W.T. Aiton
JM1: Tellima grandiflora	Tellima grandiflora (Pursh) Lindl.
JM1: Tetracoccus dioicus	Tetracoccus dioicus Parry
JM1: Tetracoccus hallii	Tetracoccus hallii Brandegee
JM1: Tetracoccus ilicifolius	Tetracoccus ilicifolius Coville & Gilman
JM1: Tetradymia argyraea	Tetradymia argyraea Munz & J.C. Roos
JM1: Tetradymia axillaris	Tetradymia axillaris A. Nelson
JM1: Tetradymia axillaris var. axillaris	Tetradymia axillaris var. axillaris
JM1: Tetradymia axillaris var. longispina	Tetradymia axillaris var. longispina (M.E. Jones) Strother
JM1: Tetradymia canescens	Tetradymia canescens DC.
JM1: Tetradymia comosa	Tetradymia comosa A. Gray
JM1: Tetradymia glabrata	Tetradymia glabrata Torr. & A. Gray
JM1: Tetradymia spinosa	Tetradymia spinosa Hook. & Arn.
JM1: Tetradymia stenolepis	Tetradymia stenolepis Greene
JM1: Tetradymia tetrameres	Tetradymia tetrameres (S.F. Blake) Strother
JM1: Tetragonia tetragonioides	Tetragonia tetragonioides (Pall.) Kuntze
JM2: Tetraneuris acaulis	Tetraneuris acaulis (Pursh) Greene
JM2: Tetraneuris acaulis var. arizonica	Tetraneuris acaulis (Pursh) Greene var. arizonica (Greene) K.F. Parker
JMS: Tetraneuris acaulis var. nana	Tetraneuris acaulis (Pursh) Greene var. arizonica (Greene) K.F. Parker
JM2: Tetrapteron graciliflorum	Tetrapteron graciliflorum (Hook. & Arn.) W.L. Wagner & Hoch
JM2: Tetrapteron palmeri	Tetrapteron palmeri (S. Watson) W.L. Wagner & Hoch
JM2: Teucrium cubense	Teucrium cubense Jacq.
JM1: Teucrium cubense subsp. depressum	Teucrium cubense Jacq. subsp. depressum E.M. McClint. & Epling
JMS: Teucrium cubense var. densum	Teucrium cubense Jacq. subsp. depressum E.M. McClint. & Epling
JM1: Teucrium glandulosum	Teucrium glandulosum Kellogg
JMS: Teutliopsis patula	Atriplex patula L.
JM1: Thalictrum alpinum	Thalictrum alpinum L.
JM1: Thalictrum fendleri	Thalictrum fendleri A. Gray
JM1: Thalictrum fendleri var. fendleri	Thalictrum fendleri A. Gray var. fendleri
JM1: Thalictrum fendleri var. polycarpum	Thalictrum fendleri var. polycarpum Torr.
JM1: Thalictrum occidentale	Thalictrum occidentale A. Gray
JMS: Thalictrum polycarpum	Thalictrum fendleri var. polycarpum Torr.
JM1: Thalictrum sparsiflorum	Thalictrum sparsiflorum Fisch. & C.A. Mey.
JM1: Thamnosma montana	Thamnosma montana Torr. & Fr&eacute;m.
JM1: Thelesperma megapotamicum	Thelesperma megapotamicum (Spreng.) Kuntze
JM2: Thelesperma simplicifolium	Thelesperma simplicifolium (A. Gray) A. Gray
JM2: Thelesperma simplicifolium var. simplicifolium	Thelesperma simplicifolium (A. Gray) A. Gray var. simplicifolium
JM1: Thelypodium brachycarpum	Thelypodium brachycarpum Torr.
JMS: Thelypodium cooperi	Caulanthus cooperi (S. Watson) Payson
JM1: Thelypodium crispum	Thelypodium crispum Payson
JMS: Thelypodium flavescens	Caulanthus flavescens (Hook.) Payson
JM1: Thelypodium flexuosum	Thelypodium flexuosum B.L. Rob.
JM2: Thelypodium howellii	Thelypodium howellii S. Watson
JM1: Thelypodium howellii subsp. howellii	Thelypodium howellii S. Watson subsp. howellii
JM1: Thelypodium integrifolium	Thelypodium integrifolium (Nutt.) Walp.
JM1: Thelypodium integrifolium subsp. affine	Thelypodium integrifolium subsp. affine (Greene) Al-Shehbaz
JM1: Thelypodium integrifolium subsp. complanatum	Thelypodium integrifolium subsp. complanatum Al-Shehbaz
JMS: Thelypodium jaegeri	Hesperidanthus jaegeri (Rollins) Al-Shehbaz
JM1: Thelypodium laciniatum	Thelypodium laciniatum (Hook.) Walp.
JMS: Thelypodium laciniatum var. milleflorum	Thelypodium milleflorum A. Nelson
JMS: Thelypodium lasiophyllum	Caulanthus lasiophyllus (Hook. & Arn.) Payson
JMS: Thelypodium lemmonii	Caulanthus anceps Payson
JM1: Thelypodium milleflorum	Thelypodium milleflorum A. Nelson
JM1: Thelypodium stenopetalum	Thelypodium stenopetalum S. Watson
JM1: Thelypteris nevadensis	Thelypteris nevadensis (Baker) C.V. Morton
JM2: Thelypteris puberula	Thelypteris puberula (Baker) C.V. Morton
JM1: Thelypteris puberula var. sonorensis	Thelypteris puberula (Baker) C.V. Morton var. sonorensis A.R. Sm.
JM2: Thermopsis californica	Thermopsis californica S. Watson
JM2: Thermopsis californica var. argentata	Thermopsis californica var. argentata (Greene) C.J. Chen & B.L. Turner
JM2: Thermopsis californica var. californica	Thermopsis californica S. Watson var. californica
JM2: Thermopsis californica var. semota	Thermopsis californica var. semota (Jeps.) C.J. Chen & B.L. Turner
JM2: Thermopsis gracilis	Thermopsis gracilis Howell
JM1: Thermopsis macrophylla	Thermopsis macrophylla Hook. & Arn.; Thermopsis californica S. Watson; Thermopsis gracilis Howell
JMS: Thermopsis macrophylla var. agnina	Thermopsis macrophylla Hook. & Arn.
JM1: Thermopsis macrophylla var. argentata	Thermopsis californica var. argentata (Greene) C.J. Chen & B.L. Turner
JM1: Thermopsis macrophylla var. macrophylla	Thermopsis macrophylla Hook. & Arn.
JM1: Thermopsis macrophylla var. semota	Thermopsis californica var. semota (Jeps.) C.J. Chen & B.L. Turner
JM1: Thermopsis macrophylla var. venosa	Thermopsis gracilis Howell
JM2: Thermopsis robusta	Thermopsis robusta Howell
JMS: Thinopyrum intermedium	Elymus hispidus (Opiz) Melderis
JMS: Thinopyrum intermedium subsp. barbulatum	Elymus hispidus (Opiz) Melderis
JMS: Thinopyrum ponticum	Elymus ponticus (Podp.) N. Snow
JMS: Thlaspi alpestre	Noccaea fendleri
JMS: Thlaspi alpestre var. californicum	Noccaea fendleri subsp. californica (S. Watson) Al-Shehbaz & M. Koch
JMS: Thlaspi alpestre var. glaucum	Noccaea fendleri subsp. glauca (A. Nelson) Al-Shehbaz & M. Koch
JM1: Thlaspi arvense	Thlaspi arvense L.
JM1: Thlaspi californicum	Noccaea fendleri subsp. californica (S. Watson) Al-Shehbaz & M. Koch
JMS: Thlaspi fendleri	Noccaea fendleri (A. Gray) Holub
JMS: Thlaspi fendleri var. glauca	Noccaea fendleri subsp. glauca (A. Nelson) Al-Shehbaz & M. Koch
JMS: Thlaspi glaucum	Noccaea fendleri
JMS: Thlaspi glaucum subsp. californicum	Noccaea fendleri subsp. californica (S. Watson) Al-Shehbaz & M. Koch
JMS: Thlaspi montanum	Noccaea fendleri
JMS: Thlaspi montanum var. californicum	Noccaea fendleri subsp. californica (S. Watson) Al-Shehbaz & M. Koch
JMS: Thlaspi montanum var. fendleri	Noccaea fendleri (A. Gray) Holub
JM1: Thlaspi montanum var. montanum	Noccaea fendleri subsp. glauca (A. Nelson) Al-Shehbaz & M. Koch
JM1: Thuja plicata	Thuja plicata D. Don
JM2: Thymophylla pentachaeta	Thymophylla pentachaeta (DC.) Small
JM1: Thymophylla pentachaeta var. belenidium	Thymophylla pentachaeta (DC.) Small var. belenidium (DC.) Strother
JM2: Thymophylla tenuiloba	Thymophylla tenuiloba (DC.) Small
JM2: Thymophylla tenuiloba var. tenuiloba	Thymophylla tenuiloba (DC.) Small var. tenuiloba
JM1: Thysanocarpus conchuliferus	Thysanocarpus conchuliferus Greene
JM1: Thysanocarpus curvipes	Thysanocarpus curvipes Hook.
JM1: Thysanocarpus laciniatus	Thysanocarpus laciniatus Nutt.; Thysanocarpus conchuliferus Greene
JMS: Thysanocarpus laciniatus var. conchuliferus	Thysanocarpus conchuliferus Greene
JM2: Thysanocarpus laciniatus var. hitchcockii	Thysanocarpus laciniatus var. hitchcockii Munz
JM2: Thysanocarpus laciniatus var. laciniatus	Thysanocarpus laciniatus Nutt. var. laciniatus
JM2: Thysanocarpus laciniatus var. rigidus	Thysanocarpus laciniatus var. rigidus Munz
JMS: Thysanocarpus pusillus	Athysanus pusillus (Hook.) Greene
JM1: Thysanocarpus radians	Thysanocarpus radians Benth.
JMS: Thysanocarpus radians var. montanus	Thysanocarpus radians Benth.
JM1: Tiarella trifoliata	Tiarella trifoliata L.
JM1: Tiarella trifoliata var. trifoliata	Tiarella trifoliata L. var. trifoliata
JM1: Tiarella trifoliata var. unifoliata	Tiarella trifoliata var. unifoliata (Hook.) Kurtz
JM1: Tidestromia lanuginosa	Tidestromia lanuginosa (Nutt.) Standl.
JMS: Tidestromia lanuginosa subsp. eliassoniana	Tidestromia lanuginosa (Nutt.) Standl.
JM1: Tidestromia oblongifolia	Tidestromia suffruticosa (Torr.) Standl. var. oblongifolia (S. Watson) S&aacute;nch.Pino & Flores Olv.
JMS: Tidestromia oblongifolia subsp. cryptantha	Tidestromia suffruticosa (Torr.) Standl. var. oblongifolia (S. Watson) S&aacute;nch.Pino & Flores Olv.
JM2: Tidestromia suffruticosa	Tidestromia suffruticosa (Torr.) Standl.
JM2: Tidestromia suffruticosa var. oblongifolia	Tidestromia suffruticosa (Torr.) Standl. var. oblongifolia (S. Watson) S&aacute;nch.Pino & Flores Olv.
JM1: Tiquilia canescens	Tiquilia canescens (DC.) A.T. Richardson
JM1: Tiquilia canescens var. canescens	Tiquilia canescens (DC.) A.T. Richardson var. canescens
JM1: Tiquilia canescens var. pulchella	Tiquilia canescens var. pulchella (I.M. Johnst.) A.T. Richardson
JM1: Tiquilia nuttallii	Tiquilia nuttallii (Hook.) A.T. Richardson
JM1: Tiquilia palmeri	Tiquilia palmeri (A. Gray) A.T. Richardson
JM1: Tiquilia plicata	Tiquilia plicata (Torr.) A.T. Richardson
JMS: Tofieldia occidentalis	Triantha occidentalis (S. Watson) R.R. Gates
JM1: Tofieldia occidentalis subsp. occidentalis	Triantha occidentalis (S. Watson) R.R. Gates subsp. occidentalis
JM2: Tolmiea diplomenziesii	Tolmiea diplomenziesii Judd et al.
JM1: Tolmiea menziesii	excluded
JM1: Tolpis barbata	Tolpis barbata (L.) Gaertn.
JM1: Tonella tenella	Tonella tenella (Benth.) A. Heller
JM1: Tonestus eximius	Tonestus eximius (H.M. Hall) A. Nelson & J.F. Macbr.
JM1: Tonestus lyallii	Tonestus lyallii (A. Gray) A. Nelson
JM1: Tonestus peirsonii	Tonestus peirsonii (D.D. Keck) G.L. Nesom & D.R. Morgan
JM1: Torilis arvensis	Torilis arvensis (Huds.) Link
JMS: Torilis arvensis subsp. purpurea	Torilis arvensis (Huds.) Link
JM1: Torilis nodosa	Torilis nodosa (L.) Gaertn.
JM1: Torreya californica	Torreya californica Torr.
JMS: Torreya myristica	Torreya californica Torr.
JM1: Torreyochloa erecta	Torreyochloa erecta (Hitchc.) G.L. Church
JM2: Torreyochloa pallida	Torreyochloa pallida (Torr.) G.L. Church
JM1: Torreyochloa pallida var. pauciflora	Torreyochloa pallida (Torr.) G.L. Church var. pauciflora (J. Presl) J.I. Davis
JM1: Townsendia condensata	Townsendia condensata Parry
JM1: Townsendia leptotes	Townsendia leptotes (A. Gray) Osterh.
JM1: Townsendia parryi	excluded
JM1: Townsendia scapigera	Townsendia scapigera D.C. Eaton
JM1: Toxicodendron diversilobum	Toxicodendron diversilobum (Torr. & A. Gray) Greene
JM2: Toxicoscordion brevibracteatum	Toxicoscordion brevibracteatum (M.E. Jones) R.R. Gates
JM2: Toxicoscordion exaltatum	Toxicoscordion exaltatum (Eastw.) A. Heller
JM2: Toxicoscordion fontanum	Toxicoscordion fontanum (Eastw.) Zomlefer & Judd
JM2: Toxicoscordion fremontii	Toxicoscordion fremontii (Torr.) Rydb.
JM2: Toxicoscordion micranthum	Toxicoscordion micranthum (Eastw.) A. Heller
JM2: Toxicoscordion paniculatum	Toxicoscordion paniculatum (Nutt.) Rydb.
JM2: Toxicoscordion venenosum	Toxicoscordion venenosum (S. Watson) Rydb.
JM2: Toxicoscordion venenosum var. venenosum	Toxicoscordion venenosum (S. Watson) Rydb. var. venenosum
JM1: Tracyina rostrata	Tracyina rostrata S.F. Blake
JM1: Tradescantia fluminensis	Tradescantia fluminensis Vell.
JM2: Tradescantia ohiensis	Tradescantia ohiensis Raf.
JMS: Tradescantia virginiana	Tradescantia ohiensis Raf.
JM1: Tragia ramosa	Tragia ramosa Torr.
JMS: Tragia stylaris	Tragia ramosa Torr.
JM1: Tragopogon dubius	Tragopogon dubius Scop.
JM1: Tragopogon porrifolius	Tragopogon porrifolius L.
JM1: Tragopogon pratensis	Tragopogon pratensis L.
JM2: Transberingia bursifolia	Transberingia bursifolia (DC.) Al-Shehbaz & O'Kane
JM2: Transberingia bursifolia subsp. virgata	Transberingia bursifolia (DC.) Al-Shehbaz & O'Kane subsp. virgata (Nutt.) Al-Shehbaz & O'Kane
JM2: Trautvetteria caroliniensis	Trautvetteria caroliniensis (Walter) Vail
JM1: Trautvetteria caroliniensis var. occidentalis	Trautvetteria caroliniensis (Walter) Vail
JM2: Triadica sebifera	Triadica sebifera (L.) Small
JM2: Triantha occidentalis	Triantha occidentalis (S. Watson) R.R. Gates
JM2: Triantha occidentalis subsp. occidentalis	Triantha occidentalis (S. Watson) R.R. Gates subsp. occidentalis
JM1: Trianthema portulacastrum	Trianthema portulacastrum L.
JM1: Tribulus terrestris	Tribulus terrestris L.
JM1: Tricardia watsonii	Tricardia watsonii S. Watson
JMS: Trichachne californica	Digitaria californica (Benth.) Henrard var. californica
JMS: Trichocoronis riparia	Trichocoronis wrightii (Torr. & A. Gray) A. Gray var. wrightii
JM2: Trichocoronis wrightii	Trichocoronis wrightii (Torr. & A. Gray) A. Gray
JM1: Trichocoronis wrightii var. wrightii	Trichocoronis wrightii (Torr. & A. Gray) A. Gray var. wrightii
JMS: Tricholaena rosea	Melinis repens (Willd.) Zizka subsp. repens
JM2: Trichophorum clementis	Trichophorum clementis (M.E. Jones) S.G. Sm.
JM2: Trichophorum pumilum	Trichophorum pumilum (Vahl) Schinz & Thell.
JM1: Trichoptilium incisum	Trichoptilium incisum (A. Gray) A. Gray
JM1: Trichostema austromontanum	Trichostema austromontanum H. Lewis
JM1: Trichostema austromontanum subsp. austromontanum	Trichostema austromontanum H. Lewis subsp. austromontanum
JM1: Trichostema austromontanum subsp. compactum	Trichostema austromontanum subsp. compactum H. Lewis
JM1: Trichostema lanatum	Trichostema lanatum Benth.
JM1: Trichostema lanceolatum	Trichostema lanceolatum Benth.
JM1: Trichostema laxum	Trichostema laxum A. Gray
JM1: Trichostema micranthum	Trichostema micranthum A. Gray
JM1: Trichostema oblongum	Trichostema oblongum Benth.
JM1: Trichostema ovatum	Trichostema ovatum Curran
JM1: Trichostema parishii	Trichostema parishii Vasey
JM1: Trichostema rubisepalum	Trichostema rubisepalum Elmer
JM2: Trichostema ruygtii	Trichostema ruygtii H. Lewis
JM1: Trichostema simulatum	Trichostema simulatum Jeps.
JM1: Tridens muticus	Tridens muticus (Torr.) Nash
JM2: Tridens muticus var. muticus	Tridens muticus (Torr.) Nash var. muticus
JMS: Tridens pilosus	Erioneuron pilosum (Buckley) Nash
JMS: Tridens pulchellus	Dasyochloa pulchella (Kunth) Rydb.
JM1: Trientalis arctica	Trientalis europaea L.
JMS: Trientalis borealis	Trientalis latifolia Hook.
JMS: Trientalis borealis subsp. latifolia	Trientalis latifolia Hook.
JM2: Trientalis europaea	Trientalis europaea L.
JMS: Trientalis europaea subsp. arctica	Trientalis europaea L.
JM1: Trientalis latifolia	Trientalis latifolia Hook.
JMS: Trifolium agrarium	Trifolium aureum Pollich
JM1: Trifolium albopurpureum	Trifolium albopurpureum Torr. & A. Gray; Trifolium dichotomum Hook. & Arn.; Trifolium olivaceum Greene
JM1: Trifolium albopurpureum var. albopurpureum	Trifolium albopurpureum Torr. & A. Gray
JM1: Trifolium albopurpureum var. dichotomum	Trifolium dichotomum Hook. & Arn.
JM1: Trifolium albopurpureum var. olivaceum	Trifolium olivaceum Greene
JM2: Trifolium alexandrinum	Trifolium alexandrinum L.
JM1: Trifolium amoenum	Trifolium amoenum Greene
JM1: Trifolium andersonii	Trifolium andersonii A. Gray
JM2: Trifolium andersonii subsp. andersonii	Trifolium andersonii A. Gray subsp. andersonii
JM2: Trifolium andersonii subsp. beatleyae	Trifolium andersonii subsp. beatleyae J.M. Gillett
JMS: Trifolium andersonii subsp. monoense	Trifolium andersonii subsp. beatleyae J.M. Gillett
JM1: Trifolium andersonii var. andersonii	Trifolium andersonii A. Gray subsp. andersonii
JM1: Trifolium andersonii var. beatleyae	Trifolium andersonii subsp. beatleyae J.M. Gillett
JM1: Trifolium angustifolium	Trifolium angustifolium L.
JMS: Trifolium appendiculatum	Trifolium variegatum Nutt.
JMS: Trifolium appendiculatum var. appendiculatum	Trifolium variegatum var. major Lojac.
JMS: Trifolium appendiculatum var. rostratum	Trifolium variegatum Nutt. var. variegatum
JM1: Trifolium arvense	Trifolium arvense L.
JM1: Trifolium aureum	Trifolium aureum Pollich
JM1: Trifolium barbigerum	Trifolium barbigerum Torr.; Trifolium grayi Lojac.
JM1: Trifolium barbigerum var. andrewsii	Trifolium grayi Lojac.
JM1: Trifolium barbigerum var. barbigerum	Trifolium barbigerum Torr.
JM1: Trifolium beckwithii	Trifolium beckwithii S. Watson
JM1: Trifolium bifidum	Trifolium bifidum A. Gray
JM1: Trifolium bifidum var. bifidum	Trifolium bifidum A. Gray var. bifidum
JM1: Trifolium bifidum var. decipiens	Trifolium bifidum var. decipiens Greene
JM1: Trifolium bolanderi	Trifolium bolanderi A. Gray
JM1: Trifolium breweri	Trifolium breweri S. Watson
JM1: Trifolium buckwestiorum	Trifolium buckwestiorum Isely
JM1: Trifolium campestre	Trifolium campestre Schreb.
JM2: Trifolium cernuum	Trifolium cernuum Brot.
JM1: Trifolium ciliolatum	Trifolium ciliolatum Benth.
JM1: Trifolium cyathiferum	Trifolium cyathiferum Lindl.
JM1: Trifolium depauperatum	Trifolium depauperatum Desv.; Trifolium hydrophilum Greene
JM1: Trifolium depauperatum var. amplectens	Trifolium depauperatum var. amplectens (Torr. & A. Gray) McDermott
JM1: Trifolium depauperatum var. depauperatum	Trifolium depauperatum Desv. var. depauperatum
JM1: Trifolium depauperatum var. hydrophilum	Trifolium hydrophilum Greene
JM1: Trifolium depauperatum var. truncatum	Trifolium depauperatum var. truncatum (Greene) Isely
JM2: Trifolium dichotomum	Trifolium dichotomum Hook. & Arn.
JM1: Trifolium dubium	Trifolium dubium Sibth.
JM2: Trifolium eriocephalum	Trifolium eriocephalum Nutt.
JM2: Trifolium eriocephalum subsp. eriocephalum	Trifolium eriocephalum Nutt. subsp. eriocephalum
JM1: Trifolium eriocephalum var. eriocephalum	Trifolium eriocephalum Nutt. subsp. eriocephalum
JM1: Trifolium fragiferum	Trifolium fragiferum L.
JM1: Trifolium fucatum	Trifolium fucatum Lindl.
JMS: Trifolium gemellum	Trifolium striatum L.
JM1: Trifolium glomeratum	Trifolium glomeratum L.
JM1: Trifolium gracilentum	Trifolium gracilentum Torr. & A. Gray; Trifolium palmeri S. Watson
JM1: Trifolium gracilentum var. gracilentum	Trifolium gracilentum Torr. & A. Gray
JMS: Trifolium gracilentum var. inconspicuum	Trifolium gracilentum Torr. & A. Gray
JM1: Trifolium gracilentum var. palmeri	Trifolium palmeri S. Watson
JM2: Trifolium grayi	Trifolium grayi Lojac.
JM2: Trifolium gymnocarpon	Trifolium gymnocarpon Nutt.
JM2: Trifolium gymnocarpon subsp. plummerae	Trifolium gymnocarpon Nutt. subsp. plummerae (S. Watson) J.M. Gillett
JM1: Trifolium gymnocarpon var. plummerae	Trifolium gymnocarpon Nutt. subsp. plummerae (S. Watson) J.M. Gillett
JM1: Trifolium hirtum	Trifolium hirtum All.
JM1: Trifolium howellii	Trifolium howellii S. Watson
JM1: Trifolium hybridum	Trifolium hybridum L.
JM2: Trifolium hydrophilum	Trifolium hydrophilum Greene
JM1: Trifolium incarnatum	Trifolium incarnatum L.
JM2: Trifolium jokerstii	Trifolium jokerstii Vincent & Rand. Morgan
JM2: Trifolium kingii	Trifolium kingii S. Watson; Trifolium productum Greene
JM2: Trifolium kingii subsp. dedeckerae	Trifolium kingii S. Watson subsp. dedeckerae (J.M. Gillett) D. Heller
JM1: Trifolium kingii var. productum	Trifolium productum Greene
JM1: Trifolium lemmonii	Trifolium lemmonii S. Watson
JM1: Trifolium longipes	Trifolium longipes Nutt.
JM2: Trifolium longipes subsp. atrorubens	Trifolium longipes subsp. atrorubens (Greene) J.M. Gillett
JM2: Trifolium longipes subsp. elmeri	Trifolium longipes subsp. elmeri (Greene) J.M. Gillett
JM2: Trifolium longipes subsp. hansenii	Trifolium longipes subsp. hansenii (Greene) J.M. Gillett
JM2: Trifolium longipes subsp. multipedunculatum	Trifolium longipes subsp. multipedunculatum (P.B. Kenn.) J.M. Gillett
JM2: Trifolium longipes subsp. oreganum	Trifolium longipes subsp. oreganum (Howell) J.M. Gillett
JM2: Trifolium longipes subsp. shastense	Trifolium longipes subsp. shastense (House) J.M. Gillett
JMS: Trifolium longipes var. atrorubens	Trifolium longipes subsp. atrorubens (Greene) J.M. Gillett
JM1: Trifolium longipes var. elmeri	Trifolium longipes subsp. elmeri (Greene) J.M. Gillett
JMS: Trifolium longipes var. multipedunculatum	Trifolium longipes subsp. multipedunculatum (P.B. Kenn.) J.M. Gillett
JM1: Trifolium longipes var. nevadense	Trifolium longipes subsp. hansenii (Greene) J.M. Gillett
JM1: Trifolium longipes var. oreganum	Trifolium longipes subsp. oreganum (Howell) J.M. Gillett
JM1: Trifolium longipes var. shastense	Trifolium longipes subsp. shastense (House) J.M. Gillett
JMS: Trifolium macilentum	Trifolium kingii S. Watson
JM1: Trifolium macilentum var. dedeckerae	Trifolium kingii S. Watson subsp. dedeckerae (J.M. Gillett) D. Heller
JM1: Trifolium macraei	Trifolium macraei Hook. & Arn.
JM1: Trifolium macrocephalum	Trifolium macrocephalum (Pursh) Poir.
JM1: Trifolium microcephalum	Trifolium microcephalum Pursh
JM1: Trifolium microdon	Trifolium microdon Hook. & Arn.
JMS: Trifolium minutissimum	Trifolium barbigerum Torr.
JM1: Trifolium monanthum	Trifolium monanthum A. Gray
JM2: Trifolium monanthum subsp. grantianum	Trifolium monanthum subsp. grantianum (A. Heller) J.M. Gillett
JM2: Trifolium monanthum subsp. monanthum	Trifolium monanthum A. Gray subsp. monanthum
JM2: Trifolium monanthum subsp. parvum	Trifolium monanthum subsp. parvum (Kellogg) J.M. Gillett
JM2: Trifolium monanthum subsp. tenerum	Trifolium monanthum subsp. tenerum (Eastw.) J.M. Gillett
JMS: Trifolium monanthum var. eastwoodianum	Trifolium monanthum subsp. tenerum (Eastw.) J.M. Gillett
JM1: Trifolium monanthum var. grantianum	Trifolium monanthum subsp. grantianum (A. Heller) J.M. Gillett
JM1: Trifolium monanthum var. monanthum	Trifolium monanthum A. Gray subsp. monanthum
JMS: Trifolium monanthum var. parvum	Trifolium monanthum subsp. parvum (Kellogg) J.M. Gillett
JM1: Trifolium obtusiflorum	Trifolium obtusiflorum Hook.
JM1: Trifolium oliganthum	Trifolium oliganthum Steud.
JM2: Trifolium olivaceum	Trifolium olivaceum Greene
JM2: Trifolium palmeri	Trifolium palmeri S. Watson
JM2: Trifolium polyodon	Trifolium polyodon Greene
JM1: Trifolium pratense	Trifolium pratense L.
JMS: Trifolium procumbens	Trifolium campestre Schreb.
JM2: Trifolium productum	Trifolium productum Greene
JM1: Trifolium repens	Trifolium repens L.
JM2: Trifolium resupinatum	Trifolium resupinatum L.
JM2: Trifolium retusum	Trifolium retusum L.
JM2: Trifolium siskiyouense	Trifolium siskiyouense J.M. Gillett
JM2: Trifolium striatum	Trifolium striatum L.
JM1: Trifolium subterraneum	Trifolium subterraneum L.
JM2: Trifolium tomentosum	Trifolium tomentosum L.
JM1: Trifolium trichocalyx	Trifolium trichocalyx A. Heller
JM1: Trifolium variegatum	Trifolium polyodon Greene; Trifolium variegatum Nutt.; Trifolium variegatum Nutt. var. variegatum; Trifolium variegatum var. geminiflorum (Greene) Vincent; Trifolium variegatum var. major Lojac.
JM2: Trifolium variegatum var. geminiflorum	Trifolium variegatum var. geminiflorum (Greene) Vincent
JM2: Trifolium variegatum var. major	Trifolium variegatum var. major Lojac.
JMS: Trifolium variegatum var. melananthum	Trifolium variegatum var. major Lojac.
JMS: Trifolium variegatum var. pauciflorum	Trifolium variegatum var. geminiflorum (Greene) Vincent
JM2: Trifolium variegatum var. variegatum	Trifolium variegatum Nutt. var. variegatum
JM2: Trifolium vesiculosum	Trifolium vesiculosum Savi
JM1: Trifolium willdenovii	Trifolium willdenovii Spreng.
JM1: Trifolium wormskioldii	Trifolium wormskioldii Lehm.
JMS: Trifolium wormskioldii var. siskiyouense	Trifolium siskiyouense J.M. Gillett
JM1: Triglochin concinna	Triglochin concinna Burtt Davy
JM1: Triglochin concinna var. concinna	Triglochin concinna Burtt Davy var. concinna
JM1: Triglochin concinna var. debilis	Triglochin concinna var. debilis (M.E. Jones) J.T. Howell
JM1: Triglochin maritima	Triglochin maritima L.
JM1: Triglochin palustris	Triglochin palustris L.
JM2: Triglochin scilloides	Triglochin scilloides (Poir.) Mering & Kadereit
JM1: Triglochin striata	Triglochin striata Ruiz & Pav.
JM1: Trillium albidum	Trillium albidum J.D. Freeman
JM1: Trillium angustipetalum	Trillium angustipetalum (Torr.) J.D. Freeman
JM1: Trillium chloropetalum	Trillium chloropetalum (Torr.) Howell
JMS: Trillium chloropetalum var. giganteum	Trillium chloropetalum (Torr.) Howell
JMS: Trillium kurabayashii	Trillium angustipetalum (Torr.) J.D. Freeman
JM1: Trillium ovatum	Trillium ovatum Pursh
JM1: Trillium ovatum subsp. oettingeri	Trillium ovatum subsp. oettingeri Munz & Thorne
JM1: Trillium ovatum subsp. ovatum	Trillium ovatum Pursh subsp. ovatum
JM1: Trillium rivale	Pseudotrillium rivale (S. Watson) S.B. Farmer
JMS: Trimorpha acris	Erigeron nivalis Nutt.
JM1: Trimorpha acris var. debilis	Erigeron nivalis Nutt.
JM1: Trimorpha lonchophylla	Erigeron lonchophyllus Hook.
JM1: Triodanis biflora	Triodanis biflora (Ruiz & Pav.) Greene
JM1: Triodanis perfoliata	Triodanis perfoliata (L.) Nieuwl.
JM1: Triphysaria eriantha	Triphysaria eriantha (Benth.) T.I. Chuang & Heckard
JM1: Triphysaria eriantha subsp. eriantha	Triphysaria eriantha (Benth.) T.I. Chuang & Heckard subsp. eriantha
JM1: Triphysaria eriantha subsp. rosea	Triphysaria eriantha subsp. rosea (A. Gray) T.I. Chuang & Heckard
JM1: Triphysaria floribunda	Triphysaria floribunda (Benth.) T.I. Chuang & Heckard
JM1: Triphysaria micrantha	Triphysaria micrantha (A. Heller) T.I. Chuang & Heckard
JM1: Triphysaria pusilla	Triphysaria pusilla (Benth.) T.I. Chuang & Heckard
JM1: Triphysaria versicolor	Triphysaria versicolor Fisch. & C.A. Mey.
JM1: Triphysaria versicolor subsp. faucibarbata	Triphysaria versicolor subsp. faucibarbata (A. Gray) T.I. Chuang & Heckard
JM1: Triphysaria versicolor subsp. versicolor	Triphysaria versicolor Fisch. & C.A. Mey. subsp. versicolor
JM2: Tripleurospermum inodorum	Tripleurospermum inodorum (L.) Sch. Bip.
JMS: Tripleurospermum maritimum	Tripleurospermum inodorum (L.) Sch. Bip.
JM1: Tripterocalyx crux-maltae	Tripterocalyx crux-maltae (Kellogg) Standl.
JM1: Tripterocalyx micranthus	Tripterocalyx micranthus (Torr.) Hook.
JM1: Trisetum canescens	Trisetum canescens Buckley
JM1: Trisetum cernuum	Trisetum cernuum Trin.; Trisetum projectum Louis-Marie
JMS: Trisetum cernuum var. canescens	Trisetum canescens Buckley
JMS: Trisetum cernuum var. projectum	Trisetum projectum Louis-Marie
JM1: Trisetum flavescens	excluded (extirpated)
JMS: Trisetum montanum	Trisetum spicatum (L.) K. Richt.
JM2: Trisetum projectum	Trisetum projectum Louis-Marie
JM1: Trisetum spicatum	Trisetum spicatum (L.) K. Richt.
JMS: Trisetum spicatum var. projectum	Trisetum projectum Louis-Marie
JM1: Trisetum wolfii	Trisetum wolfii Vasey
JM1: Triteleia bridgesii	Triteleia bridgesii (S. Watson) Greene
JM1: Triteleia clementina	Triteleia clementina Hoover
JM1: Triteleia crocea	Triteleia crocea (Alph. Wood) Greene
JM1: Triteleia crocea var. crocea	Triteleia crocea (Alph. Wood) Greene
JM1: Triteleia crocea var. modesta	Triteleia crocea (Alph. Wood) Greene
JM1: Triteleia dudleyi	Triteleia dudleyi Hoover
JM2: Triteleia grandiflora	Triteleia grandiflora Lindl.
JM1: Triteleia grandiflora subsp. howellii	Triteleia grandiflora Lindl.
JM2: Triteleia hendersonii	Triteleia hendersonii Greene
JM1: Triteleia hyacinthina	Triteleia hyacinthina (Lindl.) Greene
JM1: Triteleia ixioides	Triteleia ixioides (W.T. Aiton) Greene
JM1: Triteleia ixioides subsp. anilina	Triteleia ixioides subsp. anilina (Greene) L.W. Lenz
JM1: Triteleia ixioides subsp. cookii	Triteleia ixioides subsp. cookii (Hoover) L.W. Lenz
JM1: Triteleia ixioides subsp. ixioides	Triteleia ixioides (W.T. Aiton) Greene subsp. ixioides
JM1: Triteleia ixioides subsp. scabra	Triteleia ixioides subsp. scabra (Greene) L.W. Lenz
JM2: Triteleia ixioides subsp. unifolia	Triteleia ixioides subsp. unifolia L.W. Lenz
JM1: Triteleia laxa	Triteleia laxa Benth.
JM1: Triteleia lilacina	Triteleia lilacina Greene
JM1: Triteleia lugens	Triteleia lugens Greene
JM1: Triteleia montana	Triteleia montana Hoover
JM1: Triteleia peduncularis	Triteleia peduncularis Lindl.
JM2: Triticum aestivum	Triticum aestivum L.
JM2: Trixis californica	Trixis californica Kellogg
JM1: Trixis californica var. californica	Trixis californica Kellogg var. californica
JM1: Tropaeolum majus	Tropaeolum majus L.
JM2: Tropidocarpum californicum	Tropidocarpum californicum (Al-Shehbaz) Al-Shehbaz
JM1: Tropidocarpum capparideum	Tropidocarpum capparideum Greene
JM1: Tropidocarpum gracile	Tropidocarpum gracile Hook.
JMS: Tropidocarpum gracile var. dubium	Tropidocarpum gracile Hook.
JM1: Tsuga heterophylla	Tsuga heterophylla (Raf.) Sarg.
JM1: Tsuga mertensiana	Tsuga mertensiana (Bong.) Carri&egrave;re
JM1: Tuberaria guttata	Tuberaria guttata (L.) Fourr.
JM1: Tuctoria greenei	Tuctoria greenei (Vasey) Reeder
JM1: Tuctoria mucronata	Tuctoria mucronata (Crampton) Reeder
JM2: Tulipa clusiana	Tulipa clusiana DC.
JMS: Tumion californicum	Torreya californica Torr.
JM1: Turricula parryi	Eriodictyon parryi (A. Gray) Greene
JM2: Turritis glabra	Turritis glabra L.
JMS: Twisselmannia californica	Tropidocarpum californicum (Al-Shehbaz) Al-Shehbaz
JM1: Typha angustifolia	Typha angustifolia L.
JM1: Typha domingensis	Typha domingensis Pers.
JM1: Typha latifolia	Typha latifolia L.
JM1: Ulex europaea	Ulex europaeus L.
JM2: Ulex europaeus	Ulex europaeus L.
JM2: Ulmus americana	Ulmus americana L.
JMS: Ulmus carpinifolia	Ulmus minor Mill.
JM1: Ulmus minor	Ulmus minor Mill.
JM1: Ulmus parvifolia	Ulmus parvifolia Jacq.
JMS: Ulmus procera	Ulmus minor Mill.
JM1: Ulmus pumila	Ulmus pumila L.
JM1: Umbellularia californica	Umbellularia californica (Hook. & Arn.) Nutt.
JMS: Umbellularia californica var. fresnensis	Umbellularia californica (Hook. & Arn.) Nutt.
JM1: Uropappus lindleyi	Uropappus lindleyi (DC.) Nutt.
JM1: Urospermum picroides	Urospermum picroides (L.) F.W. Schmidt
JM1: Urtica dioica	Urtica dioica L.
JM1: Urtica dioica subsp. gracilis	Urtica dioica subsp. gracilis (Aiton) Selander
JM1: Urtica dioica subsp. holosericea	Urtica dioica subsp. holosericea (Nutt.) Thorne
JM1: Urtica urens	Urtica urens L.
JMS: Utricularia cleistogama	Utricularia subulata L.
JM1: Utricularia gibba	Utricularia gibba L.
JM1: Utricularia intermedia	Utricularia intermedia Hayne
JM2: Utricularia macrorhiza	Utricularia macrorhiza Leconte
JM1: Utricularia minor	Utricularia minor L.
JM2: Utricularia ochroleuca	Utricularia ochroleuca R.W. Hartm.
JMS: Utricularia stygia	Utricularia ochroleuca R.W. Hartm.
JM2: Utricularia subulata	Utricularia subulata L.
JM1: Utricularia vulgaris	excluded
JM1: Vaccaria hispanica	Vaccaria hispanica (Mill.) Rauschert
JM1: Vaccinium caespitosum	Vaccinium cespitosum Michx.
JM2: Vaccinium cespitosum	Vaccinium cespitosum Michx.
JM1: Vaccinium deliciosum	Vaccinium deliciosum Piper
JM1: Vaccinium macrocarpon	Vaccinium macrocarpon Aiton
JM1: Vaccinium membranaceum	Vaccinium membranaceum Torr.
JM1: Vaccinium ovatum	Vaccinium ovatum Pursh
JM1: Vaccinium parvifolium	Vaccinium parvifolium Sm.
JM1: Vaccinium scoparium	Vaccinium scoparium Coville
JM2: Vaccinium uliginosum	Vaccinium uliginosum L.
JM1: Vaccinium uliginosum subsp. occidentale	Vaccinium uliginosum L. subsp. occidentale (A. Gray) Hult&eacute;n
JM2: Vachellia farnesiana	Vachellia farnesiana (L.) Wight & Arn.
JM2: Vachellia farnesiana var. farnesiana	Vachellia farnesiana (L.) Wight & Arn. var. farnesiana
JM2: Vachellia farnesiana var. minuta	Vachellia farnesiana var. minuta (M.E. Jones) Seigler & Ebinger
JM2: Vahlodea atropurpurea	Vahlodea atropurpurea (Wahlenb.) Hartm.
JM1: Valeriana californica	Valeriana californica A. Heller
JMS: Valeriana capitata	Valeriana californica A. Heller
JMS: Valeriana capitata subsp. californica	Valeriana californica A. Heller
JM1: Valeriana occidentalis	Valeriana occidentalis A. Heller
JM1: Valeriana pubicarpa	Valeriana pubicarpa Rydb.
JM1: Valeriana sitchensis	Valeriana sitchensis Bong.
JM1: Valeriana sitchensis subsp. scouleri	Valeriana sitchensis subsp. scouleri Piper
JM1: Valeriana sitchensis subsp. sitchensis	Valeriana sitchensis Bong. subsp. sitchensis
JM2: Valerianella carinata	Valerianella carinata Loisel.
JM1: Valerianella locusta	Valerianella locusta (L.) Betcke
JMS: Valerianella olitoria	Valerianella locusta (L.) Betcke
JM1: Vancouveria chrysantha	Vancouveria chrysantha Greene
JM1: Vancouveria hexandra	Vancouveria hexandra (Hook.) C. Morren & Decne.
JM1: Vancouveria planipetala	Vancouveria planipetala Calloni
JM1: Velezia rigida	Velezia rigida L.
JM1: Venegasia carpesioides	Venegasia carpesioides DC.
JM1: Venidium fastuosum	excluded
JM1: Ventenata dubia	Ventenata dubia (Leers) Coss.
JM2: Veratrum californicum	Veratrum californicum Durand
JM1: Veratrum californicum var. californicum	Veratrum californicum Durand var. californicum
JMS: Veratrum californicum var. caudatum	Veratrum californicum Durand var. californicum
JM1: Veratrum fimbriatum	Veratrum fimbriatum A. Gray
JM1: Veratrum insolitum	Veratrum insolitum Jeps.
JM1: Veratrum viride	Veratrum viride Aiton
JMS: Veratrum viride var. eschscholzianum	Veratrum viride Aiton
JM1: Verbascum blattaria	Verbascum blattaria L.
JM2: Verbascum bombyciferum	Verbascum bombyciferum Boiss.
JM1: Verbascum speciosum	Verbascum speciosum Schrad.
JM1: Verbascum thapsus	Verbascum thapsus L.
JM1: Verbascum virgatum	Verbascum virgatum Stokes
JMS: Verbena abramsii	Verbena lasiostachys Link var. lasiostachys
JM1: Verbena bonariensis	Verbena bonariensis L.
JM1: Verbena bracteata	Verbena bracteata Lag. & Rodr.
JMS: Verbena brasiliensis	Verbena litoralis Kunth
JM1: Verbena californica	Verbena californica Moldenke
JM1: Verbena gooddingii	Verbena gooddingii Briq.
JMS: Verbena gooddingii var. nepetifolia	Verbena gooddingii Briq.
JM1: Verbena hastata	Verbena hastata L.
JMS: Verbena hastata var. scabra	Verbena hastata L.
JMS: Verbena incompta	Verbena bonariensis L.
JM1: Verbena lasiostachys	Verbena lasiostachys Link
JM1: Verbena lasiostachys var. lasiostachys	Verbena lasiostachys Link var. lasiostachys
JM1: Verbena lasiostachys var. scabrida	Verbena lasiostachys var. scabrida Moldenke
JM1: Verbena litoralis	Verbena litoralis Kunth
JMS: Verbena litoralis var. brasiliensis	Verbena litoralis Kunth
JM1: Verbena menthifolia	Verbena menthifolia Benth.
JM2: Verbena pulchella	Verbena pulchella Sweet
JMS: Verbena robusta	Verbena lasiostachys var. scabrida Moldenke
JM1: Verbena scabra	Verbena scabra Vahl
JM1: Verbena tenuisecta	Verbena pulchella Sweet
JM1: Verbesina dissita	Verbesina dissita A. Gray
JM2: Verbesina encelioides	Verbesina encelioides (Cav.) A. Gray
JM1: Verbesina encelioides subsp. exauriculata	Verbesina encelioides (Cav.) A. Gray subsp. exauriculata (B.L. Rob. & Greenm.) J.R. Coleman
JMS: Veronica alpina	Veronica wormskjoldii Roem. & Schult.
JMS: Veronica alpina var. alterniflora	Veronica wormskjoldii Roem. & Schult.
JM1: Veronica americana	Veronica americana Benth.
JM1: Veronica anagallis-aquatica	Veronica anagallis-aquatica L.
JM1: Veronica arvensis	Veronica arvensis L.
JM1: Veronica beccabunga	excluded
JM1: Veronica catenata	Veronica catenata Pennell
JM1: Veronica chamaedrys	excluded
JMS: Veronica comosa	Veronica catenata Pennell
JM1: Veronica copelandii	Veronica copelandii Eastw.
JM1: Veronica cusickii	Veronica cusickii A. Gray
JM1: Veronica filiformis	excluded
JM1: Veronica hederifolia	excluded
JM2: Veronica peregrina	Veronica peregrina L.
JM1: Veronica peregrina subsp. xalapensis	Veronica peregrina L. subsp. xalapensis (Kunth) Pennell
JM1: Veronica persica	Veronica persica Poir.
JM1: Veronica scutellata	Veronica scutellata L.
JM2: Veronica serpyllifolia	Veronica serpyllifolia L.
JM1: Veronica serpyllifolia subsp. humifusa	Veronica serpyllifolia L. subsp. humifusa (Dicks.) Syme
JM1: Veronica triphyllos	Veronica triphyllos L.
JM1: Veronica wormskjoldii	Veronica wormskjoldii Roem. & Schult.
JM2: Viburnum edule	Viburnum edule (Michx.) Raf.
JM1: Viburnum ellipticum	Viburnum ellipticum Hook.
JM2: Vicia americana	Vicia americana Willd.
JM2: Vicia americana subsp. americana	Vicia americana Willd. subsp. americana
JM1: Vicia americana var. americana	Vicia americana Willd. subsp. americana
JMS: Vicia angustifolia	Vicia sativa subsp. nigra (L.) Erhart
JM1: Vicia benghalensis	Vicia benghalensis L.
JM2: Vicia bithynica	Vicia bithynica (L.) L.
JM1: Vicia cracca	Vicia cracca L.
JMS: Vicia dasycarpa	Vicia villosa subsp. varia (Host) Corb.
JM1: Vicia disperma	Vicia disperma DC.
JM1: Vicia faba	Vicia faba L.
JM1: Vicia gigantea	Vicia gigantea Hook.
JM1: Vicia hassei	Vicia hassei S. Watson
JM1: Vicia hirsuta	Vicia hirsuta (L.) Gray
JM1: Vicia lathyroides	Vicia lathyroides L.
JM2: Vicia ludoviciana	Vicia ludoviciana Torr. & A. Gray
JM2: Vicia ludoviciana subsp. ludoviciana	Vicia ludoviciana Torr. & A. Gray subsp. ludoviciana
JM1: Vicia ludoviciana var. ludoviciana	Vicia ludoviciana Torr. & A. Gray subsp. ludoviciana
JM1: Vicia lutea	Vicia lutea L.
JMS: Vicia nigricans	Vicia gigantea Hook.
JMS: Vicia nigricans var. gigantea	Vicia gigantea Hook.
JM1: Vicia pannonica	Vicia pannonica Crantz
JM1: Vicia sativa	Vicia sativa L.
JM1: Vicia sativa subsp. nigra	Vicia sativa subsp. nigra (L.) Erhart
JM1: Vicia sativa subsp. sativa	Vicia sativa L. subsp. sativa
JM1: Vicia tetrasperma	Vicia tetrasperma (L.) Schreb.
JM1: Vicia villosa	Vicia villosa Roth
JM1: Vicia villosa subsp. varia	Vicia villosa subsp. varia (Host) Corb.
JM1: Vicia villosa subsp. villosa	Vicia villosa Roth subsp. villosa
JM1: Viguiera laciniata	Bahiopsis laciniata (A. Gray) E.E. Schill. & Panero
JM1: Viguiera parishii	Bahiopsis parishii (Greene) E.E. Schill. & Panero
JM2: Viguiera purisimae	Viguiera purisimae Brandegee
JM1: Viguiera reticulata	Bahiopsis reticulata (S. Watson) E.E. Schill. & Panero
JM1: Vinca major	Vinca major L.
JM1: Viola adunca	Viola adunca Sm.
JM2: Viola adunca subsp. adunca	Viola adunca Sm. subsp. adunca
JM1: Viola arvensis	Viola arvensis Murray
JM1: Viola aurea	Viola purpurea subsp. aurea (Kellogg) J.C. Clausen
JM1: Viola bakeri	Viola bakeri Greene
JM1: Viola beckwithii	Viola beckwithii Torr. & A. Gray
JM1: Viola cuneata	Viola cuneata S. Watson
JM1: Viola douglasii	Viola douglasii Steud.
JM1: Viola glabella	Viola glabella Nutt.
JM1: Viola hallii	Viola hallii A. Gray
JM2: Viola howellii	Viola howellii A. Gray
JM2: Viola langsdorffii	Viola langsdorffii Ging.
JM1: Viola lobata	Viola lobata Benth.
JM1: Viola lobata subsp. integrifolia	Viola lobata subsp. integrifolia (S. Watson) R.J. Little
JM1: Viola lobata subsp. lobata	Viola lobata Benth. subsp. lobata
JM1: Viola macloskeyi	Viola macloskeyi F.E. Lloyd
JMS: Viola macloskeyi subsp. pallens	Viola macloskeyi F.E. Lloyd
JM2: Viola nephrophylla	Viola nephrophylla Greene
JM1: Viola ocellata	Viola ocellata Torr. & A. Gray
JM1: Viola odorata	Viola odorata L.
JM1: Viola palustris	Viola palustris L.
JM1: Viola pedunculata	Viola pedunculata Torr. & A. Gray
JMS: Viola pedunculata subsp. tenuifolia	Viola pedunculata Torr. & A. Gray
JM1: Viola pinetorum	Viola pinetorum Greene
JM1: Viola pinetorum subsp. grisea	Viola pinetorum subsp. grisea (Jeps.) R.J. Little
JM1: Viola pinetorum subsp. pinetorum	Viola pinetorum Greene subsp. pinetorum
JM1: Viola praemorsa	Viola praemorsa Lindl.
JM1: Viola praemorsa subsp. linguifolia	Viola praemorsa subsp. linguifolia (Nutt.) M.S. Baker & J.C. Clausen
JM1: Viola praemorsa subsp. praemorsa	Viola praemorsa subsp. praemorsa
JM2: Viola primulifolia	Viola primulifolia L.
JM1: Viola primulifolia subsp. occidentalis	Viola primulifolia L. subsp. occidentalis (A. Gray) L.E. McKinney & R.J. Little
JM1: Viola purpurea	Viola purpurea Kellogg
JM2: Viola purpurea subsp. aurea	Viola purpurea subsp. aurea (Kellogg) J.C. Clausen
JM2: Viola purpurea subsp. dimorpha	Viola purpurea subsp. dimorpha M.S. Baker & J.C. Clausen
JM1: Viola purpurea subsp. integrifolia	Viola purpurea subsp. integrifolia M.S. Baker & J.C. Clausen
JM2: Viola purpurea subsp. mesophyta	Viola purpurea subsp. mesophyta M.S. Baker & J.C. Clausen
JM1: Viola purpurea subsp. mohavensis	Viola purpurea subsp. mohavensis (M.S. Baker & J.C. Clausen) J.C. Clausen
JM1: Viola purpurea subsp. purpurea	Viola purpurea subsp. purpurea
JM1: Viola purpurea subsp. quercetorum	Viola purpurea subsp. quercetorum (M.S. Baker & J.C. Clausen) R.J. Little
JM1: Viola purpurea subsp. venosa	Viola purpurea subsp. venosa (S. Watson) M.S. Baker & J.C. Clausen
JM1: Viola sempervirens	Viola sempervirens Greene
JM1: Viola sheltonii	Viola sheltonii Torr.
JMS: Viola sororia	Viola nephrophylla Greene
JM1: Viola sororia subsp. affinis	Viola nephrophylla Greene
JM1: Viola tomentosa	Viola tomentosa M.S. Baker & J.C. Clausen
JM1: Viola tricolor	excluded
JM1: Viscum album	Viscum album L.
JM1: Vitis californica	Vitis californica Benth.
JM1: Vitis girdiana	Vitis girdiana Munson
JM2: Vitis rupestris	Vitis rupestris Scheele
JM1: Vitis vinifera	Vitis vinifera L.
JM2: Volutaria muricata	Volutaria muricata (L.) Maire
JM1: Vulpia bromoides	Festuca bromoides L.
JM1: Vulpia microstachys	Festuca microstachys Nutt.
JM1: Vulpia microstachys var. ciliata	Festuca microstachys Nutt.
JM1: Vulpia microstachys var. confusa	Festuca microstachys Nutt.
JM1: Vulpia microstachys var. microstachys	Festuca microstachys Nutt.
JM1: Vulpia microstachys var. pauciflora	Festuca microstachys Nutt.
JM1: Vulpia myuros	Festuca myuros L.
JMS: Vulpia myuros f. myuros	Festuca myuros L.
JM1: Vulpia myuros var. hirsuta	Festuca myuros L.
JM1: Vulpia myuros var. myuros	Festuca myuros L.
JM1: Vulpia octoflora	Festuca octoflora Walter
JM1: Vulpia octoflora var. hirtella	Festuca octoflora Walter
JM1: Vulpia octoflora var. octoflora	Festuca octoflora Walter
JM1: Washingtonia filifera	Washingtonia filifera (Andr&eacute;) de Bary
JM2: Washingtonia robusta	Washingtonia robusta H. Wendl.
JM1: Watsonia marginata	Watsonia marginata (L. f.) Ker Gawl.
JM1: Watsonia meriana	Watsonia meriana (L.) Mill.
JM1: Whipplea modesta	Whipplea modesta Torr.
JM1: Whitneya dealbata	Arnica dealbata (A. Gray) B.G. Baldwin
JMS: Wislizenia californica	Wislizenia refracta subsp. californica (Greene) S. Keller
JMS: Wislizenia palmeri	Wislizenia refracta subsp. palmeri (A. Gray) S. Keller
JM1: Wislizenia refracta	Wislizenia refracta Engelm.
JM1: Wislizenia refracta subsp. californica	Wislizenia refracta subsp. californica (Greene) S. Keller
JM1: Wislizenia refracta subsp. palmeri	Wislizenia refracta subsp. palmeri (A. Gray) S. Keller
JM1: Wislizenia refracta subsp. refracta	Wislizenia refracta Engelm. subsp. refracta
JM1: Wolffia arrhiza	Wolffia arrhiza (L.) Wimm.
JM1: Wolffia borealis	Wolffia borealis (Hegelm.) Landolt & Wildi
JM1: Wolffia brasiliensis	Wolffia brasiliensis Wedd.
JM1: Wolffia columbiana	Wolffia columbiana H. Karst.
JM1: Wolffia globosa	Wolffia globosa (Roxb.) Hartog & Plas
JMS: Wolffia punctata	Wolffia borealis (Hegelm.) Landolt & Wildi
JM1: Wolffiella lingulata	Wolffiella lingulata (Hegelm.) Hegelm.
JM1: Wolffiella oblonga	Wolffiella oblonga (Phil.) Hegelm.
JM1: Woodsia oregana	Woodsia oregana D.C. Eaton
JMS: Woodsia oregana subsp. cathcartiana	Woodsia oregana D.C. Eaton
JM1: Woodsia plummerae	Woodsia plummerae Lemmon
JM1: Woodsia scopulina	Woodsia scopulina D.C. Eaton
JMS: Woodsia scopulina subsp. laurentiana	Woodsia scopulina D.C. Eaton
JMS: Woodwardia chamissoi	Woodwardia fimbriata Sm.
JM1: Woodwardia fimbriata	Woodwardia fimbriata Sm.
JMS: Woodwardia radicans	Woodwardia fimbriata Sm.
JM1: Wyethia angustifolia	Wyethia angustifolia (DC.) Nutt.
JM1: Wyethia bolanderi	Wyethia bolanderi (A. Gray) W.A. Weber
JM1: Wyethia elata	Wyethia elata H.M. Hall
JM1: Wyethia glabra	Wyethia glabra A. Gray
JM1: Wyethia helenioides	Wyethia helenioides (DC.) Nutt.
JM1: Wyethia invenusta	Wyethia invenusta (Greene) W.A. Weber
JM1: Wyethia longicaulis	Wyethia longicaulis A. Gray
JM1: Wyethia mollis	Wyethia mollis A. Gray
JM1: Wyethia ovata	Wyethia ovata Torr. & A. Gray
JM1: Wyethia reticulata	Wyethia reticulata Greene
JM2: Xanthisma gracile	Xanthisma gracile (Nutt.) D.R. Morgan & R.L. Hartm.
JM2: Xanthisma junceum	Xanthisma junceum (Greene) D.R. Morgan & R.L. Hartm.
JM2: Xanthisma spinulosum	Xanthisma spinulosum (Pursh) D.R. Morgan & R.L. Hartm.
JM2: Xanthisma spinulosum var. gooddingii	Xanthisma spinulosum (Pursh) D.R. Morgan & R.L. Hartm. var. gooddingii (A. Nelson) D.R. Morgan & R.L. Hartm.
JM1: Xanthium spinosum	Xanthium spinosum L.
JM1: Xanthium strumarium	Xanthium strumarium L.
JMS: Xanthocyparis nootkatensis	Callitropsis nootkatensis (D. Don) D.P. Little
JM1: Xerophyllum tenax	Xerophyllum tenax (Pursh) Nutt.
JM1: Xylococcus bicolor	Xylococcus bicolor Nutt.
JM1: Xylorhiza cognata	Xylorhiza cognata (H.M. Hall) T.J. Watson
JM1: Xylorhiza orcuttii	Xylorhiza orcuttii (Vasey & Rose) Greene
JM2: Xylorhiza tortifolia	Xylorhiza tortifolia (Torr. & A. Gray) Greene
JM1: Xylorhiza tortifolia var. tortifolia	Xylorhiza tortifolia (Torr. & A. Gray) Greene var. tortifolia
JM1: Yabea microcarpa	Yabea microcarpa (Hook. & Arn.) Koso-Pol.
JM1: Yucca baccata	Yucca baccata Torr.
JM2: Yucca baccata var. baccata	Yucca baccata Torr. var. baccata
JM1: Yucca brevifolia	Yucca brevifolia Engelm.
JMS: Yucca californica	Yucca schidigera Ortgies
JMS: Yucca mohavensis	Yucca schidigera Ortgies
JM1: Yucca schidigera	Yucca schidigera Ortgies
JM1: Yucca whipplei	Hesperoyucca whipplei (Torr.) Trel.
JM1: Zannichellia palustris	Zannichellia palustris L.
JM1: Zantedeschia aethiopica	Zantedeschia aethiopica (L.) Spreng.
JMS: Zauschneria californica	Epilobium canum (Greene) P.H. Raven
JMS: Zauschneria californica subsp. californica	Epilobium canum (Greene) P.H. Raven subsp. canum
JMS: Zauschneria californica subsp. latifolia	Epilobium canum subsp. latifolium (Hook.) P.H. Raven
JMS: Zauschneria cana	Epilobium canum (Greene) P.H. Raven subsp. canum
JMS: Zauschneria latifolia	Epilobium canum
JMS: Zauschneria latifolia var. garrettii	Epilobium canum subsp. garrettii (A. Nelson) P.H. Raven
JMS: Zauschneria septentrionalis	Epilobium septentrionale (D.D. Keck) R.N. Bowman & Hoch
JMS: Zeltnera abramsii	Zeltnera venusta (A. Gray) G. Mans.
JM2: Zeltnera arizonica	Zeltnera arizonica (A. Gray) G. Mans.
JM2: Zeltnera davyi	Zeltnera davyi (Jeps.) G. Mans.
JM2: Zeltnera exaltata	Zeltnera exaltata (Griseb.) G. Mans.
JM2: Zeltnera muehlenbergii	Zeltnera muehlenbergii (Griseb.) G. Mans.
JM2: Zeltnera namophila	Zeltnera namophila (Reveal et al.) G. Mans.
JM2: Zeltnera trichantha	Zeltnera trichantha (Griseb.) G. Mans.
JM2: Zeltnera venusta	Zeltnera venusta (A. Gray) G. Mans.
JM1: Zigadenus brevibracteatus	Toxicoscordion brevibracteatum (M.E. Jones) R.R. Gates
JM1: Zigadenus exaltatus	Toxicoscordion exaltatum (Eastw.) A. Heller
JMS: Zigadenus fontanus	Toxicoscordion fontanum (Eastw.) Zomlefer & Judd
JM1: Zigadenus fremontii	Toxicoscordion fremontii (Torr.) Rydb.
JM1: Zigadenus micranthus	Toxicoscordion fontanum (Eastw.) Zomlefer & Judd; Toxicoscordion micranthum (Eastw.) A. Heller
JM1: Zigadenus micranthus var. fontanus	Toxicoscordion fontanum (Eastw.) Zomlefer & Judd
JM1: Zigadenus micranthus var. micranthus	Toxicoscordion micranthum (Eastw.) A. Heller
JM1: Zigadenus paniculatus	Toxicoscordion paniculatum (Nutt.) Rydb.
JMS: Zigadenus venenosus	Toxicoscordion venenosum (S. Watson) Rydb.
JM1: Zigadenus venenosus var. venenosus	Toxicoscordion venenosum (S. Watson) Rydb. var. venenosum
JMS: Zizania aquatica	Zizania palustris L.
JMS: Zizania aquatica var. angustifolia	Zizania palustris L. var. interior (Fassett) Dore
JM2: Zizania palustris	Zizania palustris L.
JM1: Zizania palustris var. interior	Zizania palustris L. var. interior (Fassett) Dore
JMS: Ziziphus jujuba	Ziziphus zizyphus (L.) H. Karst.
JM2: Ziziphus obtusifolia	Ziziphus obtusifolia (Torr. & A. Gray) A. Gray
JM1: Ziziphus obtusifolia var. canescens	Ziziphus obtusifolia (Torr. & A. Gray) A. Gray var. canescens (A. Gray) M.C. Johnst.
JM2: Ziziphus parryi	Ziziphus parryi Torr.
JM1: Ziziphus parryi var. parryi	Ziziphus parryi Torr. var. parryi
JM2: Ziziphus zizyphus	Ziziphus zizyphus (L.) H. Karst.
JM2: Zostera japonica	Zostera japonica Aschers. & Graebn.
JM1: Zostera marina	Zostera marina L.
JM1: Zostera pacifica	Zostera pacifica S. Watson
JM1: Zygophyllum fabago	Zygophyllum fabago L.
