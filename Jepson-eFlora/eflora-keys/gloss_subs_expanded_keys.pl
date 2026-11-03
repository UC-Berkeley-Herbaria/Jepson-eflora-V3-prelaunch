
#$file="input_files/eflora_keys.txt";
$file="../eflora_database/input/eflora_keys_formatted-NEW.txt";
#$file="../eflora_database/input/eflora_family_keys_formatted-NEW.txt";

$file_expanded="input/eflora_keys_expanded-SQL.txt";
#$file_expanded="input/eflora_family_keys_expanded-SQL.txt";

$/="\n";



open(OUT, ">", $file_expanded) || die;

open(IN, '<:encoding(UTF-8)', $file) or die "CRITICAL: Could not open '$file' for reading: $!";
warn "Processing file: $file\n";

	while(<IN>){
				if(s!(<div class.+) *Abaxial([ ,;<]+)!$1 <<1>>Abaxial<<1>>$2!){
				}
				if(s! abaxial([ ,;<]+)! <<1>>abaxial<<1>>$1!g){
				}
				if(s!Achene([ ,;<]+)!<<2>>Achene<<2>>$1!g){
				}
				if(s! achene([ ,;<]+)! <<2>>achene<<2>>$1!g){
				}
				if(s!Achenes([ ,;<]+)!<<3>>Achenes<<3>>$1!g){
				}
				if(s! achenes([ ,;<]+)! <<3>>achenes<<3>>$1!g){
				}
				if(s!Acidic([ ,;<]+)!<<4>>Acidic<<4>>$1!g){
				}
				if(s! acidic([ ,;<]+)! <<4>>acidic<<4>>$1!g){
				}
				if(s!Acuminate([ ,;<]+)!<<5>>Acuminate<<5>>$1!g){
				}
				if(s! acuminate([ ,;<]+)! <<5>>acuminate<<5>>$1!g){
				}
				if(s!Acute([ ,;<]+)!<<6>>Acute<<6>>$1!g){
				}
				if(s! acute([ ,;<]+)! <<6>>acute<<6>>$1!g){
				}
				if(s!Adaxial([ ,;<]+)!<<7>>Adaxial<<7>>$1!g){
				}
				if(s! adaxial([ ,;<]+)! <<7>>adaxial<<7>>$1!g){
				}
				if(s!Adherent([ ,;<]+)!<<8>>Adherent<<8>>$1!g){
				}
				if(s! adherent([ ,;<]+)! <<8>>adherent<<8>>$1!g){
				}
				if(s!Adventitious([ ,;<]+)!<<9>>Adventitious<<9>>$1!g){
				}
				if(s! adventitious([ ,;<]+)! <<9>>adventitious<<9>>$1!g){
				}
				if(s!Alien([ ,;<]+)!<<10>>Alien<<10>>$1!g){
				}
				if(s! alien([ ,;<]+)! <<10>>alien<<10>>$1!g){
				}
				if(s!Alkali([ ,;<]+)!<<11>>Alkali<<11>>$1!g){
				}
				if(s! alkali([ ,;<]+)! <<11>>alkali<<11>>$1!g){
				}
				if(s!Alkaline([ ,;<]+)!<<12>>Alkaline<<12>>$1!g){
				}
				if(s! alkaline([ ,;<]+)! <<12>>alkaline<<12>>$1!g){
				}
				if(s!Alluvial([ ,;<]+)!<<13>>Alluvial<<13>>$1!g){
				}
				if(s! alluvial([ ,;<]+)! <<13>>alluvial<<13>>$1!g){
				}
				if(s!Alpine([ ,;<]+)!<<14>>Alpine<<14>>$1!g){
				}
				if(s! alpine([ ,;<]+)! <<14>>alpine<<14>>$1!g){
				}
				if(s!Alternate([ ,;<]+)!<<15>>Alternate<<15>>$1!g){
				}
				if(s! alternate([ ,;<]+)! <<15>>alternate<<15>>$1!g){
				}
				if(s!Angiosperm([ ,;<]+)!<<16>>Angiosperm<<16>>$1!g){
				}
				if(s! angiosperm([ ,;<]+)! <<16>>angiosperm<<16>>$1!g){
				}
				if(s!Angiosperms([ ,;<]+)!<<17>>Angiosperms<<17>>$1!g){
				}
				if(s! angiosperms([ ,;<]+)! <<17>>angiosperms<<17>>$1!g){
				}
				if(s!Annual([ ,;<]+)!<<18>>Annual<<18>>$1!g){
				}
				if(s! annual([ ,;<]+)! <<18>>annual<<18>>$1!g){
				}
				if(s!Annulus([ ,;<]+)!<<19>>Annulus<<19>>$1!g){
				}
				if(s! annulus([ ,;<]+)! <<19>>annulus<<19>>$1!g){
				}
				if(s!Annuli([ ,;<]+)!<<20>>Annuli<<20>>$1!g){
				}
				if(s! annuli([ ,;<]+)! <<20>>annuli<<20>>$1!g){
				}
				if(s!Anther([ ,;<]+)!<<21>>Anther<<21>>$1!g){
				}
				if(s! anther([ ,;<]+)! <<21>>anther<<21>>$1!g){
				}
				if(s!Anthers([ ,;<]+)!<<22>>Anthers<<22>>$1!g){
				}
				if(s! anthers([ ,;<]+)! <<22>>anthers<<22>>$1!g){
				}
				if(s!Appressed([ ,;<]+)!<<23>>Appressed<<23>>$1!g){
				}
				if(s! appressed([ ,;<]+)! <<23>>appressed<<23>>$1!g){
				}
				if(s!Apogamous([ ,;<]+)!<<24>>Apogamous<<24>>$1!g){
				}
				if(s! apogamous([ ,;<]+)! <<24>>apogamous<<24>>$1!g){
				}
				if(s!Aquatic([ ,;<]+)!<<25>>Aquatic<<25>>$1!g){
				}
				if(s! aquatic([ ,;<]+)! <<25>>aquatic<<25>>$1!g){
				}
				if(s!Areole([ ,;<]+)!<<26>>Areole<<26>>$1!g){
				}
				if(s! areole([ ,;<]+)! <<26>>areole<<26>>$1!g){
				}
				if(s!Areoles([ ,;<]+)!<<27>>Areoles<<27>>$1!g){
				}
				if(s! areoles([ ,;<]+)! <<27>>areoles<<27>>$1!g){
				}
				if(s!Aril([ ,;<]+)!<<28>>Aril<<28>>$1!g){
				}
				if(s! aril([ ,;<]+)! <<28>>aril<<28>>$1!g){
				}
				if(s!Arils([ ,;<]+)!<<29>>Arils<<29>>$1!g){
				}
				if(s! arils([ ,;<]+)! <<29>>arils<<29>>$1!g){
				}
				if(s!Armed([ ,;<]+)!<<30>>Armed<<30>>$1!g){
				}
				if(s! armed([ ,;<]+)! <<30>>armed<<30>>$1!g){
				}
				if(s!Ascending([ ,;<]+)!<<31>>Ascending<<31>>$1!g){
				}
				if(s! ascending([ ,;<]+)! <<31>>ascending<<31>>$1!g){
				}
				if(s!Asymmetric([ ,;<]+)!<<32>>Asymmetric<<32>>$1!g){
				}
				if(s! asymmetric([ ,;<]+)! <<32>>asymmetric<<32>>$1!g){
				}
				if(s!Auricle([ ,;<]+)!<<33>>Auricle<<33>>$1!g){
				}
				if(s! auricle([ ,;<]+)! <<33>>auricle<<33>>$1!g){
				}
				if(s!Auricles([ ,;<]+)!<<34>>Auricles<<34>>$1!g){
				}
				if(s! auricles([ ,;<]+)! <<34>>auricles<<34>>$1!g){
				}
				if(s!Awn([ ,;<]+)!<<35>>Awn<<35>>$1!g){
				}
				if(s! awn([ ,;<]+)! <<35>>awn<<35>>$1!g){
				}
				if(s!Awns([ ,;<]+)!<<36>>Awns<<36>>$1!g){
				}
				if(s! awns([ ,;<]+)! <<36>>awns<<36>>$1!g){
				}
				if(s!Axil([ ,;<]+)!<<37>>Axil<<37>>$1!g){
				}
				if(s! axil([ ,;<]+)! <<37>>axil<<37>>$1!g){
				}
				if(s!Axils([ ,;<]+)!<<38>>Axils<<38>>$1!g){
				}
				if(s! axils([ ,;<]+)! <<38>>axils<<38>>$1!g){
				}
				if(s!Axile([ ,;<]+)!<<39>>Axile<<39>>$1!g){
				}
				if(s! axile([ ,;<]+)! <<39>>axile<<39>>$1!g){
				}
				if(s!Axillary([ ,;<]+)!<<40>>Axillary<<40>>$1!g){
				}
				if(s! axillary([ ,;<]+)! <<40>>axillary<<40>>$1!g){
				}
				if(s!Axis([ ,;<]+)!<<41>>Axis<<41>>$1!g){
				}
				if(s! axis([ ,;<]+)! <<41>>axis<<41>>$1!g){
				}
				if(s!Axes([ ,;<]+)!<<42>>Axes<<42>>$1!g){
				}
				if(s! axes([ ,;<]+)! <<42>>axes<<42>>$1!g){
				}
				if(s!Banner([ ,;<]+)!<<43>>Banner<<43>>$1!g){
				}
				if(s! banner([ ,;<]+)! <<43>>banner<<43>>$1!g){
				}
				if(s!Barbed([ ,;<]+)!<<44>>Barbed<<44>>$1!g){
				}
				if(s! barbed([ ,;<]+)! <<44>>barbed<<44>>$1!g){
				}
				if(s!Bark([ ,;<]+)!<<45>>Bark<<45>>$1!g){
				}
				if(s! bark([ ,;<]+)! <<45>>bark<<45>>$1!g){
				}
				if(s!Basal([ ,;<]+)!<<46>>Basal<<46>>$1!g){
				}
				if(s! basal([ ,;<]+)! <<46>>basal<<46>>$1!g){
				}
				if(s!Beak([ ,;<]+)!<<47>>Beak<<47>>$1!g){
				}
				if(s! beak([ ,;<]+)! <<47>>beak<<47>>$1!g){
				}
				if(s!Beaks([ ,;<]+)!<<48>>Beaks<<48>>$1!g){
				}
				if(s! beaks([ ,;<]+)! <<48>>beaks<<48>>$1!g){
				}
				if(s!Berry([ ,;<]+)!<<49>>Berry<<49>>$1!g){
				}
				if(s! berry([ ,;<]+)! <<49>>berry<<49>>$1!g){
				}
				if(s!Biennial([ ,;<]+)!<<50>>Biennial<<50>>$1!g){
				}
				if(s! biennial([ ,;<]+)! <<50>>biennial<<50>>$1!g){
				}
				if(s!Bilateral([ ,;<]+)!<<51>>Bilateral<<51>>$1!g){
				}
				if(s! bilateral([ ,;<]+)! <<51>>bilateral<<51>>$1!g){
				}
				if(s!Biradial([ ,;<]+)!<<52>>Biradial<<52>>$1!g){
				}
				if(s! biradial([ ,;<]+)! <<52>>biradial<<52>>$1!g){
				}
				if(s!Bisexual([ ,;<]+)!<<53>>Bisexual<<53>>$1!g){
				}
				if(s! bisexual([ ,;<]+)! <<53>>bisexual<<53>>$1!g){
				}
				if(s!Blade([ ,;<]+)!<<54>>Blade<<54>>$1!g){
				}
				if(s! blade([ ,;<]+)! <<54>>blade<<54>>$1!g){
				}
				if(s!Blades([ ,;<]+)!<<55>>Blades<<55>>$1!g){
				}
				if(s! blades([ ,;<]+)! <<55>>blades<<55>>$1!g){
				}
				if(s!Brackish([ ,;<]+)!<<56>>Brackish<<56>>$1!g){
				}
				if(s! brackish([ ,;<]+)! <<56>>brackish<<56>>$1!g){
				}
				if(s!Bract([ ,;<]+)!<<57>>Bract<<57>>$1!g){
				}
				if(s! bract([ ,;<]+)! <<57>>bract<<57>>$1!g){
				}
				if(s!Bracts([ ,;<]+)!<<58>>Bracts<<58>>$1!g){
				}
				if(s! bracts([ ,;<]+)! <<58>>bracts<<58>>$1!g){
				}
				if(s!Bractlet([ ,;<]+)!<<59>>Bractlet<<59>>$1!g){
				}
				if(s! bractlet([ ,;<]+)! <<59>>bractlet<<59>>$1!g){
				}
				if(s!Bractlets([ ,;<]+)!<<60>>Bractlets<<60>>$1!g){
				}
				if(s! bractlets([ ,;<]+)! <<60>>bractlets<<60>>$1!g){
				}
				if(s!Bristle([ ,;<]+)!<<61>>Bristle<<61>>$1!g){
				}
				if(s! bristle([ ,;<]+)! <<61>>bristle<<61>>$1!g){
				}
				if(s!Bristles([ ,;<]+)!<<62>>Bristles<<62>>$1!g){
				}
				if(s! bristles([ ,;<]+)! <<62>>bristles<<62>>$1!g){
				}
				if(s!Bud([ ,;<]+)!<<63>>Bud<<63>>$1!g){
				}
				if(s! bud([ ,;<]+)! <<63>>bud<<63>>$1!g){
				}
				if(s!Buds([ ,;<]+)!<<64>>Buds<<64>>$1!g){
				}
				if(s! buds([ ,;<]+)! <<64>>buds<<64>>$1!g){
				}
				if(s!Bulb([ ,;<]+)!<<65>>Bulb<<65>>$1!g){
				}
				if(s! bulb([ ,;<]+)! <<65>>bulb<<65>>$1!g){
				}
				if(s!Bulbs([ ,;<]+)!<<66>>Bulbs<<66>>$1!g){
				}
				if(s! bulbs([ ,;<]+)! <<66>>bulbs<<66>>$1!g){
				}
				if(s!Bulblet([ ,;<]+)!<<67>>Bulblet<<67>>$1!g){
				}
				if(s! bulblet([ ,;<]+)! <<67>>bulblet<<67>>$1!g){
				}
				if(s!Bulblets([ ,;<]+)!<<68>>Bulblets<<68>>$1!g){
				}
				if(s! bulblets([ ,;<]+)! <<68>>bulblets<<68>>$1!g){
				}
				if(s!Bur([ ,;<]+)!<<69>>Bur<<69>>$1!g){
				}
				if(s! bur([ ,;<]+)! <<69>>bur<<69>>$1!g){
				}
				if(s!Callus([ ,;<]+)!<<70>>Callus<<70>>$1!g){
				}
				if(s! callus([ ,;<]+)! <<70>>callus<<70>>$1!g){
				}
				if(s!Calyx([ ,;<]+)!<<71>>Calyx<<71>>$1!g){
				}
				if(s! calyx([ ,;<]+)! <<71>>calyx<<71>>$1!g){
				}
				if(s!Canescent([ ,;<]+)!<<72>>Canescent<<72>>$1!g){
				}
				if(s! canescent([ ,;<]+)! <<72>>canescent<<72>>$1!g){
				}
				if(s!Capsule([ ,;<]+)!<<73>>Capsule<<73>>$1!g){
				}
				if(s! capsule([ ,;<]+)! <<73>>capsule<<73>>$1!g){
				}
				if(s!Capsules([ ,;<]+)!<<74>>Capsules<<74>>$1!g){
				}
				if(s! capsules([ ,;<]+)! <<74>>capsules<<74>>$1!g){
				}
				if(s!Carpel([ ,;<]+)!<<75>>Carpel<<75>>$1!g){
				}
				if(s! carpel([ ,;<]+)! <<75>>carpel<<75>>$1!g){
				}
				if(s!Carpels([ ,;<]+)!<<76>>Carpels<<76>>$1!g){
				}
				if(s! carpels([ ,;<]+)! <<76>>carpels<<76>>$1!g){
				}
				if(s!Cartilaginous([ ,;<]+)!<<77>>Cartilaginous<<77>>$1!g){
				}
				if(s! cartilaginous([ ,;<]+)! <<77>>cartilaginous<<77>>$1!g){
				}
				if(s!Catkin([ ,;<]+)!<<78>>Catkin<<78>>$1!g){
				}
				if(s! catkin([ ,;<]+)! <<78>>catkin<<78>>$1!g){
				}
				if(s!Catkins([ ,;<]+)!<<79>>Catkins<<79>>$1!g){
				}
				if(s! catkins([ ,;<]+)! <<79>>catkins<<79>>$1!g){
				}
				if(s!Caudex([ ,;<]+)!<<80>>Caudex<<80>>$1!g){
				}
				if(s! caudex([ ,;<]+)! <<80>>caudex<<80>>$1!g){
				}
				if(s!Caudices([ ,;<]+)!<<81>>Caudices<<81>>$1!g){
				}
				if(s! caudices([ ,;<]+)! <<81>>caudices<<81>>$1!g){
				}
				if(s!Cauline([ ,;<]+)!<<82>>Cauline<<82>>$1!g){
				}
				if(s! cauline([ ,;<]+)! <<82>>cauline<<82>>$1!g){
				}
				if(s!Cespitose([ ,;<]+)!<<83>>Cespitose<<83>>$1!g){
				}
				if(s! cespitose([ ,;<]+)! <<83>>cespitose<<83>>$1!g){
				}
				if(s!Chamber([ ,;<]+)!<<84>>Chamber<<84>>$1!g){
				}
				if(s! chamber([ ,;<]+)! <<84>>chamber<<84>>$1!g){
				}
				if(s!Chambers([ ,;<]+)!<<85>>Chambers<<85>>$1!g){
				}
				if(s! chambers([ ,;<]+)! <<85>>chambers<<85>>$1!g){
				}
				if(s!Chaparral([ ,;<]+)!<<86>>Chaparral<<86>>$1!g){
				}
				if(s! chaparral([ ,;<]+)! <<86>>chaparral<<86>>$1!g){
				}
				if(s!Ciliate([ ,;<]+)!<<87>>Ciliate<<87>>$1!g){
				}
				if(s! ciliate([ ,;<]+)! <<87>>ciliate<<87>>$1!g){
				}
				if(s!Circumboreal([ ,;<]+)!<<88>>Circumboreal<<88>>$1!g){
				}
				if(s! circumboreal([ ,;<]+)! <<88>>circumboreal<<88>>$1!g){
				}
				if(s!Circumscissile([ ,;<]+)!<<89>>Circumscissile<<89>>$1!g){
				}
				if(s! circumscissile([ ,;<]+)! <<89>>circumscissile<<89>>$1!g){
				}
				if(s!Claw([ ,;<]+)!<<90>>Claw<<90>>$1!g){
				}
				if(s! claw([ ,;<]+)! <<90>>claw<<90>>$1!g){
				}
				if(s!Claws([ ,;<]+)!<<91>>Claws<<91>>$1!g){
				}
				if(s! claws([ ,;<]+)! <<91>>claws<<91>>$1!g){
				}
				if(s!Cleistogamous([ ,;<]+)!<<92>>Cleistogamous<<92>>$1!g){
				}
				if(s! cleistogamous([ ,;<]+)! <<92>>cleistogamous<<92>>$1!g){
				}
				if(s!Clone([ ,;<]+)!<<93>>Clone<<93>>$1!g){
				}
				if(s! clone([ ,;<]+)! <<93>>clone<<93>>$1!g){
				}
				if(s!Clones([ ,;<]+)!<<94>>Clones<<94>>$1!g){
				}
				if(s! clones([ ,;<]+)! <<94>>clones<<94>>$1!g){
				}
				if(s!Closed-cone forest([ ,;<]+)!<<95>>Closed-cone forest<<95>>$1!g){
				}
				if(s! closed-cone forest([ ,;<]+)! <<95>>closed-cone forest<<95>>$1!g){
				}
				if(s!Coastal redwood([ ,;<]+)!<<96>>Coastal redwood<<96>>$1!g){
				}
				if(s! coastal redwood([ ,;<]+)! <<96>>coastal redwood<<96>>$1!g){
				}
				if(s!Coastal scrub([ ,;<]+)!<<97>>Coastal scrub<<97>>$1!g){
				}
				if(s! coastal scrub([ ,;<]+)! <<97>>coastal scrub<<97>>$1!g){
				}
				if(s!Coastal strand([ ,;<]+)!<<98>>Coastal strand<<98>>$1!g){
				}
				if(s! coastal strand([ ,;<]+)! <<98>>coastal strand<<98>>$1!g){
				}
				if(s!Collar([ ,;<]+)!<<99>>Collar<<99>>$1!g){
				}
				if(s! collar([ ,;<]+)! <<99>>collar<<99>>$1!g){
				}
				if(s!Collars([ ,;<]+)!<<100>>Collars<<100>>$1!g){
				}
				if(s! collars([ ,;<]+)! <<100>>collars<<100>>$1!g){
				}
				if(s!Column([ ,;<]+)!<<101>>Column<<101>>$1!g){
				}
				if(s! column([ ,;<]+)! <<101>>column<<101>>$1!g){
				}
				if(s!Columns([ ,;<]+)!<<102>>Columns<<102>>$1!g){
				}
				if(s! columns([ ,;<]+)! <<102>>columns<<102>>$1!g){
				}
				if(s!Compound([ ,;<]+)!<<103>>Compound<<103>>$1!g){
				}
				if(s! compound([ ,;<]+)! <<103>>compound<<103>>$1!g){
				}
				if(s!Compressed([ ,;<]+)!<<104>>Compressed<<104>>$1!g){
				}
				if(s! compressed([ ,;<]+)! <<104>>compressed<<104>>$1!g){
				}
				if(s!Concave([ ,;<]+)!<<105>>Concave<<105>>$1!g){
				}
				if(s! concave([ ,;<]+)! <<105>>concave<<105>>$1!g){
				}
				if(s!Cone([ ,;<]+)!<<106>>Cone<<106>>$1!g){
				}
				if(s! cone([ ,;<]+)! <<106>>cone<<106>>$1!g){
				}
				if(s!Cones([ ,;<]+)!<<107>>Cones<<107>>$1!g){
				}
				if(s! cones([ ,;<]+)! <<107>>cones<<107>>$1!g){
				}
				if(s!Conic([ ,;<]+)!<<108>>Conic<<108>>$1!g){
				}
				if(s! conic([ ,;<]+)! <<108>>conic<<108>>$1!g){
				}
				if(s!Coniferous forest([ ,;<]+)!<<109>>Coniferous forest<<109>>$1!g){
				}
				if(s! coniferous forest([ ,;<]+)! <<109>>coniferous forest<<109>>$1!g){
				}
				if(s!Continuous([ ,;<]+)!<<110>>Continuous<<110>>$1!g){
				}
				if(s! continuous([ ,;<]+)! <<110>>continuous<<110>>$1!g){
				}
				if(s!Convex([ ,;<]+)!<<111>>Convex<<111>>$1!g){
				}
				if(s! convex([ ,;<]+)! <<111>>convex<<111>>$1!g){
				}
				if(s!Cordate([ ,;<]+)!<<112>>Cordate<<112>>$1!g){
				}
				if(s! cordate([ ,;<]+)! <<112>>cordate<<112>>$1!g){
				}
				if(s!Corm([ ,;<]+)!<<113>>Corm<<113>>$1!g){
				}
				if(s! corm([ ,;<]+)! <<113>>corm<<113>>$1!g){
				}
				if(s!Corms([ ,;<]+)!<<114>>Corms<<114>>$1!g){
				}
				if(s! corms([ ,;<]+)! <<114>>corms<<114>>$1!g){
				}
				if(s!Corolla([ ,;<]+)!<<115>>Corolla<<115>>$1!g){
				}
				if(s! corolla([ ,;<]+)! <<115>>corolla<<115>>$1!g){
				}
				if(s!Corollas([ ,;<]+)!<<116>>Corollas<<116>>$1!g){
				}
				if(s! corollas([ ,;<]+)! <<116>>corollas<<116>>$1!g){
				}
				if(s!Costa([ ,;<]+)!<<117>>Costa<<117>>$1!g){
				}
				if(s! costa([ ,;<]+)! <<117>>costa<<117>>$1!g){
				}
				if(s!Costule([ ,;<]+)!<<118>>Costule<<118>>$1!g){
				}
				if(s! costule([ ,;<]+)! <<118>>costule<<118>>$1!g){
				}
				if(s!Costulet([ ,;<]+)!<<119>>Costulet<<119>>$1!g){
				}
				if(s! costulet([ ,;<]+)! <<119>>costulet<<119>>$1!g){
				}
				if(s!Cotyledon([ ,;<]+)!<<120>>Cotyledon<<120>>$1!g){
				}
				if(s! cotyledon([ ,;<]+)! <<120>>cotyledon<<120>>$1!g){
				}
				if(s!Cotyledons([ ,;<]+)!<<121>>Cotyledons<<121>>$1!g){
				}
				if(s! cotyledons([ ,;<]+)! <<121>>cotyledons<<121>>$1!g){
				}
				if(s!Crenate([ ,;<]+)!<<122>>Crenate<<122>>$1!g){
				}
				if(s! crenate([ ,;<]+)! <<122>>crenate<<122>>$1!g){
				}
				if(s!Cylindric([ ,;<]+)!<<123>>Cylindric<<123>>$1!g){
				}
				if(s! cylindric([ ,;<]+)! <<123>>cylindric<<123>>$1!g){
				}
				if(s!Cyme([ ,;<]+)!<<124>>Cyme<<124>>$1!g){
				}
				if(s! cyme([ ,;<]+)! <<124>>cyme<<124>>$1!g){
				}
				if(s!Cymes([ ,;<]+)!<<125>>Cymes<<125>>$1!g){
				}
				if(s! cymes([ ,;<]+)! <<125>>cymes<<125>>$1!g){
				}
				if(s!Deciduous([ ,;<]+)!<<126>>Deciduous<<126>>$1!g){
				}
				if(s! deciduous([ ,;<]+)! <<126>>deciduous<<126>>$1!g){
				}
				if(s!Decumbent([ ,;<]+)!<<127>>Decumbent<<127>>$1!g){
				}
				if(s! decumbent([ ,;<]+)! <<127>>decumbent<<127>>$1!g){
				}
				if(s!Decurrent([ ,;<]+)!<<128>>Decurrent<<128>>$1!g){
				}
				if(s! decurrent([ ,;<]+)! <<128>>decurrent<<128>>$1!g){
				}
				if(s!Dehiscent([ ,;<]+)!<<129>>Dehiscent<<129>>$1!g){
				}
				if(s! dehiscent([ ,;<]+)! <<129>>dehiscent<<129>>$1!g){
				}
				if(s!Deltate([ ,;<]+)!<<130>>Deltate<<130>>$1!g){
				}
				if(s! deltate([ ,;<]+)! <<130>>deltate<<130>>$1!g){
				}
				if(s!Dense([ ,;<]+)!<<131>>Dense<<131>>$1!g){
				}
				if(s! dense([ ,;<]+)! <<131>>dense<<131>>$1!g){
				}
				if(s!Dentate([ ,;<]+)!<<132>>Dentate<<132>>$1!g){
				}
				if(s! dentate([ ,;<]+)! <<132>>dentate<<132>>$1!g){
				}
				if(s!Depressed([ ,;<]+)!<<133>>Depressed<<133>>$1!g){
				}
				if(s! depressed([ ,;<]+)! <<133>>depressed<<133>>$1!g){
				}
				if(s!Desert([ ,;<]+)!<<134>>Desert<<134>>$1!g){
				}
				if(s! desert([ ,;<]+)! <<134>>desert<<134>>$1!g){
				}
				if(s!Dioecious([ ,;<]+)!<<135>>Dioecious<<135>>$1!g){
				}
				if(s! dioecious([ ,;<]+)! <<135>>dioecious<<135>>$1!g){
				}
				if(s!Digitate([ ,;<]+)!<<136>>Digitate<<136>>$1!g){
				}
				if(s! digitate([ ,;<]+)! <<136>>digitate<<136>>$1!g){
				}
				if(s!Diploid([ ,;<]+)!<<137>>Diploid<<137>>$1!g){
				}
				if(s! diploid([ ,;<]+)! <<137>>diploid<<137>>$1!g){
				}
				if(s!Disciform head([ ,;<]+)!<<138>>Disciform head<<138>>$1!g){
				}
				if(s! disciform head([ ,;<]+)! <<138>>disciform head<<138>>$1!g){
				}
				if(s!Discoid head([ ,;<]+)!<<139>>Discoid head<<139>>$1!g){
				}
				if(s! discoid head([ ,;<]+)! <<139>>discoid head<<139>>$1!g){
				}
				if(s!Disk flower([ ,;<]+)!<<140>>Disk flower<<140>>$1!g){
				}
				if(s! disk flower([ ,;<]+)! <<140>>disk flower<<140>>$1!g){
				}
				if(s!Disk flowers([ ,;<]+)!<<141>>Disk flowers<<141>>$1!g){
				}
				if(s! disk flowers([ ,;<]+)! <<141>>disk flowers<<141>>$1!g){
				}
				if(s!Dissected([ ,;<]+)!<<142>>Dissected<<142>>$1!g){
				}
				if(s! dissected([ ,;<]+)! <<142>>dissected<<142>>$1!g){
				}
				if(s!Distal([ ,;<]+)!<<143>>Distal<<143>>$1!g){
				}
				if(s! distal([ ,;<]+)! <<143>>distal<<143>>$1!g){
				}
				if(s!Distally([ ,;<]+)!<<144>>Distally<<144>>$1!g){
				}
				if(s! distally([ ,;<]+)! <<144>>distally<<144>>$1!g){
				}
				if(s!Drupe([ ,;<]+)!<<145>>Drupe<<145>>$1!g){
				}
				if(s! drupe([ ,;<]+)! <<145>>drupe<<145>>$1!g){
				}
				if(s!Drupes([ ,;<]+)!<<146>>Drupes<<146>>$1!g){
				}
				if(s! drupes([ ,;<]+)! <<146>>drupes<<146>>$1!g){
				}
				if(s!Dune([ ,;<]+)!<<147>>Dune<<147>>$1!g){
				}
				if(s! dune([ ,;<]+)! <<147>>dune<<147>>$1!g){
				}
				if(s!Dunes([ ,;<]+)!<<148>>Dunes<<148>>$1!g){
				}
				if(s! dunes([ ,;<]+)! <<148>>dunes<<148>>$1!g){
				}
				if(s!Elliptic([ ,;<]+)!<<149>>Elliptic<<149>>$1!g){
				}
				if(s! elliptic([ ,;<]+)! <<149>>elliptic<<149>>$1!g){
				}
				if(s!Emergent([ ,;<]+)!<<150>>Emergent<<150>>$1!g){
				}
				if(s! emergent([ ,;<]+)! <<150>>emergent<<150>>$1!g){
				}
				if(s!Endemic([ ,;<]+)!<<151>>Endemic<<151>>$1!g){
				}
				if(s! endemic([ ,;<]+)! <<151>>endemic<<151>>$1!g){
				}
				if(s!Entire([ ,;<]+)!<<152>>Entire<<152>>$1!g){
				}
				if(s! entire([ ,;<]+)! <<152>>entire<<152>>$1!g){
				}
				if(s!Ephemeral([ ,;<]+)!<<153>>Ephemeral<<153>>$1!g){
				}
				if(s! ephemeral([ ,;<]+)! <<153>>ephemeral<<153>>$1!g){
				}
				if(s!Epidermis([ ,;<]+)!<<154>>Epidermis<<154>>$1!g){
				}
				if(s! epidermis([ ,;<]+)! <<154>>epidermis<<154>>$1!g){
				}
				if(s!Epipetalous([ ,;<]+)!<<155>>Epipetalous<<155>>$1!g){
				}
				if(s! epipetalous([ ,;<]+)! <<155>>epipetalous<<155>>$1!g){
				}
				if(s!Erect([ ,;<]+)!<<156>>Erect<<156>>$1!g){
				}
				if(s! erect([ ,;<]+)! <<156>>erect<<156>>$1!g){
				}
				if(s!Estuarine([ ,;<]+)!<<157>>Estuarine<<157>>$1!g){
				}
				if(s! estuarine([ ,;<]+)! <<157>>estuarine<<157>>$1!g){
				}
				if(s!Evergreen([ ,;<]+)!<<158>>Evergreen<<158>>$1!g){
				}
				if(s! evergreen([ ,;<]+)! <<158>>evergreen<<158>>$1!g){
				}
				if(s!Exceeding([ ,;<]+)!<<159>>Exceeding<<159>>$1!g){
				}
				if(s! exceeding([ ,;<]+)! <<159>>exceeding<<159>>$1!g){
				}
				if(s!Exserted([ ,;<]+)!<<160>>Exserted<<160>>$1!g){
				}
				if(s! exserted([ ,;<]+)! <<160>>exserted<<160>>$1!g){
				}
				if(s!Extant([ ,;<]+)!<<161>>Extant<<161>>$1!g){
				}
				if(s! extant([ ,;<]+)! <<161>>extant<<161>>$1!g){
				}
				if(s!Extinct([ ,;<]+)!<<162>>Extinct<<162>>$1!g){
				}
				if(s! extinct([ ,;<]+)! <<162>>extinct<<162>>$1!g){
				}
				if(s!Extirpated([ ,;<]+)!<<163>>Extirpated<<163>>$1!g){
				}
				if(s! extirpated([ ,;<]+)! <<163>>extirpated<<163>>$1!g){
				}
				if(s!Exudate([ ,;<]+)!<<164>>Exudate<<164>>$1!g){
				}
				if(s! exudate([ ,;<]+)! <<164>>exudate<<164>>$1!g){
				}
				if(s!Fertile([ ,;<]+)!<<165>>Fertile<<165>>$1!g){
				}
				if(s! fertile([ ,;<]+)! <<165>>fertile<<165>>$1!g){
				}
				if(s!Fibrous([ ,;<]+)!<<166>>Fibrous<<166>>$1!g){
				}
				if(s! fibrous([ ,;<]+)! <<166>>fibrous<<166>>$1!g){
				}
				if(s!Filament([ ,;<]+)!<<167>>Filament<<167>>$1!g){
				}
				if(s! filament([ ,;<]+)! <<167>>filament<<167>>$1!g){
				}
				if(s!Filaments([ ,;<]+)!<<168>>Filaments<<168>>$1!g){
				}
				if(s! filaments([ ,;<]+)! <<168>>filaments<<168>>$1!g){
				}
				if(s!Fleshy([ ,;<]+)!<<169>>Fleshy<<169>>$1!g){
				}
				if(s! fleshy([ ,;<]+)! <<169>>fleshy<<169>>$1!g){
				}
				if(s!Floret([ ,;<]+)!<<170>>Floret<<170>>$1!g){
				}
				if(s! floret([ ,;<]+)! <<170>>floret<<170>>$1!g){
				}
				if(s!Florets([ ,;<]+)!<<171>>Florets<<171>>$1!g){
				}
				if(s! florets([ ,;<]+)! <<171>>florets<<171>>$1!g){
				}
				if(s!Follicle([ ,;<]+)!<<172>>Follicle<<172>>$1!g){
				}
				if(s! follicle([ ,;<]+)! <<172>>follicle<<172>>$1!g){
				}
				if(s!Follicles([ ,;<]+)!<<173>>Follicles<<173>>$1!g){
				}
				if(s! follicles([ ,;<]+)! <<173>>follicles<<173>>$1!g){
				}
				if(s!Foothill([ ,;<]+)!<<174>>Foothill<<174>>$1!g){
				}
				if(s! foothill([ ,;<]+)! <<174>>foothill<<174>>$1!g){
				}
				if(s!Foothills([ ,;<]+)!<<175>>Foothills<<175>>$1!g){
				}
				if(s! foothills([ ,;<]+)! <<175>>foothills<<175>>$1!g){
				}
				if(s!Forked([ ,;<]+)!<<176>>Forked<<176>>$1!g){
				}
				if(s! forked([ ,;<]+)! <<176>>forked<<176>>$1!g){
				}
				if(s!Free([ ,;<]+)!<<177>>Free<<177>>$1!g){
				}
				if(s! free([ ,;<]+)! <<177>>free<<177>>$1!g){
				}
				if(s!Free-central([ ,;<]+)!<<178>>Free-central<<178>>$1!g){
				}
				if(s! free-central([ ,;<]+)! <<178>>free-central<<178>>$1!g){
				}
				if(s!Fringed([ ,;<]+)!<<179>>Fringed<<179>>$1!g){
				}
				if(s! fringed([ ,;<]+)! <<179>>fringed<<179>>$1!g){
				}
				if(s!Frond([ ,;<]+)!<<180>>Frond<<180>>$1!g){
				}
				if(s! frond([ ,;<]+)! <<180>>frond<<180>>$1!g){
				}
				if(s!Fruit([ ,;<]+)!<<181>>Fruit<<181>>$1!g){
				}
				if(s! fruit([ ,;<]+)! <<181>>fruit<<181>>$1!g){
				}
				if(s!Fruits([ ,;<]+)!<<182>>Fruits<<182>>$1!g){
				}
				if(s! fruits([ ,;<]+)! <<182>>fruits<<182>>$1!g){
				}
				if(s!Funnel-shaped([ ,;<]+)!<<183>>Funnel-shaped<<183>>$1!g){
				}
				if(s! funnel-shaped([ ,;<]+)! <<183>>funnel-shaped<<183>>$1!g){
				}
				if(s!Fused([ ,;<]+)!<<184>>Fused<<184>>$1!g){
				}
				if(s! fused([ ,;<]+)! <<184>>fused<<184>>$1!g){
				}
				if(s!Fusiform([ ,;<]+)!<<185>>Fusiform<<185>>$1!g){
				}
				if(s! fusiform([ ,;<]+)! <<185>>fusiform<<185>>$1!g){
				}
				if(s!Glabrous([ ,;<]+)!<<186>>Glabrous<<186>>$1!g){
				}
				if(s! glabrous([ ,;<]+)! <<186>>glabrous<<186>>$1!g){
				}
				if(s!Gland([ ,;<]+)!<<187>>Gland<<187>>$1!g){
				}
				if(s! gland([ ,;<]+)! <<187>>gland<<187>>$1!g){
				}
				if(s!Glands([ ,;<]+)!<<188>>Glands<<188>>$1!g){
				}
				if(s! glands([ ,;<]+)! <<188>>glands<<188>>$1!g){
				}
				if(s!Glandular([ ,;<]+)!<<189>>Glandular<<189>>$1!g){
				}
				if(s! glandular([ ,;<]+)! <<189>>glandular<<189>>$1!g){
				}
				if(s!Glaucous([ ,;<]+)!<<190>>Glaucous<<190>>$1!g){
				}
				if(s! glaucous([ ,;<]+)! <<190>>glaucous<<190>>$1!g){
				}
				if(s!Glume([ ,;<]+)!<<191>>Glume<<191>>$1!g){
				}
				if(s! glume([ ,;<]+)! <<191>>glume<<191>>$1!g){
				}
				if(s!Glumes([ ,;<]+)!<<192>>Glumes<<192>>$1!g){
				}
				if(s! glumes([ ,;<]+)! <<192>>glumes<<192>>$1!g){
				}
				if(s!Graduated([ ,;<]+)!<<193>>Graduated<<193>>$1!g){
				}
				if(s! graduated([ ,;<]+)! <<193>>graduated<<193>>$1!g){
				}
				if(s!Granular([ ,;<]+)!<<194>>Granular<<194>>$1!g){
				}
				if(s! granular([ ,;<]+)! <<194>>granular<<194>>$1!g){
				}
				if(s!Grassland([ ,;<]+)!<<195>>Grassland<<195>>$1!g){
				}
				if(s! grassland([ ,;<]+)! <<195>>grassland<<195>>$1!g){
				}
				if(s!Grasslands([ ,;<]+)!<<196>>Grasslands<<196>>$1!g){
				}
				if(s! grasslands([ ,;<]+)! <<196>>grasslands<<196>>$1!g){
				}
				if(s!Gymnosperm([ ,;<]+)!<<197>>Gymnosperm<<197>>$1!g){
				}
				if(s! gymnosperm([ ,;<]+)! <<197>>gymnosperm<<197>>$1!g){
				}
				if(s!Gymnosperms([ ,;<]+)!<<198>>Gymnosperms<<198>>$1!g){
				}
				if(s! gymnosperms([ ,;<]+)! <<198>>gymnosperms<<198>>$1!g){
				}
				if(s!Habit([ ,;<]+)!<<199>>Habit<<199>>$1!g){
				}
				if(s! habit([ ,;<]+)! <<199>>habit<<199>>$1!g){
				}
				if(s!Habits([ ,;<]+)!<<200>>Habits<<200>>$1!g){
				}
				if(s! habits([ ,;<]+)! <<200>>habits<<200>>$1!g){
				}
				if(s!Habitat([ ,;<]+)!<<201>>Habitat<<201>>$1!g){
				}
				if(s! habitat([ ,;<]+)! <<201>>habitat<<201>>$1!g){
				}
				if(s!Habitats([ ,;<]+)!<<202>>Habitats<<202>>$1!g){
				}
				if(s! habitats([ ,;<]+)! <<202>>habitats<<202>>$1!g){
				}
				if(s!Hair([ ,;<]+)!<<203>>Hair<<203>>$1!g){
				}
				if(s! hair([ ,;<]+)! <<203>>hair<<203>>$1!g){
				}
				if(s!Hairs([ ,;<]+)!<<204>>Hairs<<204>>$1!g){
				}
				if(s! hairs([ ,;<]+)! <<204>>hairs<<204>>$1!g){
				}
				if(s!Haploid([ ,;<]+)!<<205>>Haploid<<205>>$1!g){
				}
				if(s! haploid([ ,;<]+)! <<205>>haploid<<205>>$1!g){
				}
				if(s!Hastate([ ,;<]+)!<<206>>Hastate<<206>>$1!g){
				}
				if(s! hastate([ ,;<]+)! <<206>>hastate<<206>>$1!g){
				}
				if(s!Head([ ,;<]+)!<<207>>Head<<207>>$1!g){
				}
				if(s! head([ ,;<]+)! <<207>>head<<207>>$1!g){
				}
				if(s!Heads([ ,;<]+)!<<208>>Heads<<208>>$1!g){
				}
				if(s! heads([ ,;<]+)! <<208>>heads<<208>>$1!g){
				}
				if(s!Hemispheric([ ,;<]+)!<<209>>Hemispheric<<209>>$1!g){
				}
				if(s! hemispheric([ ,;<]+)! <<209>>hemispheric<<209>>$1!g){
				}
				if(s!Herb([ ,;<]+)!<<210>>Herb<<210>>$1!g){
				}
				if(s! herb([ ,;<]+)! <<210>>herb<<210>>$1!g){
				}
				if(s!Herbs([ ,;<]+)!<<211>>Herbs<<211>>$1!g){
				}
				if(s! herbs([ ,;<]+)! <<211>>herbs<<211>>$1!g){
				}
				if(s!Herbaceous([ ,;<]+)!<<212>>Herbaceous<<212>>$1!g){
				}
				if(s! herbaceous([ ,;<]+)! <<212>>herbaceous<<212>>$1!g){
				}
				if(s!Herbage([ ,;<]+)!<<213>>Herbage<<213>>$1!g){
				}
				if(s! herbage([ ,;<]+)! <<213>>herbage<<213>>$1!g){
				}
				if(s!Heterostylous([ ,;<]+)!<<214>>Heterostylous<<214>>$1!g){
				}
				if(s! heterostylous([ ,;<]+)! <<214>>heterostylous<<214>>$1!g){
				}
				if(s!Hypanthium([ ,;<]+)!<<215>>Hypanthium<<215>>$1!g){
				}
				if(s! hypanthium([ ,;<]+)! <<215>>hypanthium<<215>>$1!g){
				}
				if(s!Hypanthia([ ,;<]+)!<<216>>Hypanthia<<216>>$1!g){
				}
				if(s! hypanthia([ ,;<]+)! <<216>>hypanthia<<216>>$1!g){
				}
				if(s!Included([ ,;<]+)!<<217>>Included<<217>>$1!g){
				}
				if(s! included([ ,;<]+)! <<217>>included<<217>>$1!g){
				}
				if(s!Indehiscent([ ,;<]+)!<<218>>Indehiscent<<218>>$1!g){
				}
				if(s! indehiscent([ ,;<]+)! <<218>>indehiscent<<218>>$1!g){
				}
				if(s!Indusium([ ,;<]+)!<<219>>Indusium<<219>>$1!g){
				}
				if(s! indusium([ ,;<]+)! <<219>>indusium<<219>>$1!g){
				}
				if(s!Indusia([ ,;<]+)!<<220>>Indusia<<220>>$1!g){
				}
				if(s! indusia([ ,;<]+)! <<220>>indusia<<220>>$1!g){
				}
				if(s!Inferior([ ,;<]+)!<<221>>Inferior<<221>>$1!g){
				}
				if(s! inferior([ ,;<]+)! <<221>>inferior<<221>>$1!g){
				}
				if(s!Inflorescence([ ,;<]+)!<<222>>Inflorescence<<222>>$1!g){
				}
				if(s! inflorescence([ ,;<]+)! <<222>>inflorescence<<222>>$1!g){
				}
				if(s!Inflorescences([ ,;<]+)!<<223>>Inflorescences<<223>>$1!g){
				}
				if(s! inflorescences([ ,;<]+)! <<223>>inflorescences<<223>>$1!g){
				}
				if(s!Infraspecific([ ,;<]+)!<<224>>Infraspecific<<224>>$1!g){
				}
				if(s! infraspecific([ ,;<]+)! <<224>>infraspecific<<224>>$1!g){
				}
				if(s!Intergrade([ ,;<]+)!<<225>>Intergrade<<225>>$1!g){
				}
				if(s! intergrade([ ,;<]+)! <<225>>intergrade<<225>>$1!g){
				}
				if(s!Intermediate([ ,;<]+)!<<226>>Intermediate<<226>>$1!g){
				}
				if(s! intermediate([ ,;<]+)! <<226>>intermediate<<226>>$1!g){
				}
				if(s!Internode([ ,;<]+)!<<227>>Internode<<227>>$1!g){
				}
				if(s! internode([ ,;<]+)! <<227>>internode<<227>>$1!g){
				}
				if(s!Internodes([ ,;<]+)!<<228>>Internodes<<228>>$1!g){
				}
				if(s! internodes([ ,;<]+)! <<228>>internodes<<228>>$1!g){
				}
				if(s!Interrupted([ ,;<]+)!<<229>>Interrupted<<229>>$1!g){
				}
				if(s! interrupted([ ,;<]+)! <<229>>interrupted<<229>>$1!g){
				}
				if(s!Intertidal([ ,;<]+)!<<230>>Intertidal<<230>>$1!g){
				}
				if(s! intertidal([ ,;<]+)! <<230>>intertidal<<230>>$1!g){
				}
				if(s!Involucel([ ,;<]+)!<<231>>Involucel<<231>>$1!g){
				}
				if(s! involucel([ ,;<]+)! <<231>>involucel<<231>>$1!g){
				}
				if(s!Involucre([ ,;<]+)!<<232>>Involucre<<232>>$1!g){
				}
				if(s! involucre([ ,;<]+)! <<232>>involucre<<232>>$1!g){
				}
				if(s!Involucres([ ,;<]+)!<<233>>Involucres<<233>>$1!g){
				}
				if(s! involucres([ ,;<]+)! <<233>>involucres<<233>>$1!g){
				}
				if(s!Keel([ ,;<]+)!<<234>>Keel<<234>>$1!g){
				}
				if(s! keel([ ,;<]+)! <<234>>keel<<234>>$1!g){
				}
				if(s!Keels([ ,;<]+)!<<235>>Keels<<235>>$1!g){
				}
				if(s! keels([ ,;<]+)! <<235>>keels<<235>>$1!g){
				}
				if(s!Keeled([ ,;<]+)!<<236>>Keeled<<236>>$1!g){
				}
				if(s! keeled([ ,;<]+)! <<236>>keeled<<236>>$1!g){
				}
				if(s!Lamina([ ,;<]+)!<<237>>Lamina<<237>>$1!g){
				}
				if(s! lamina([ ,;<]+)! <<237>>lamina<<237>>$1!g){
				}
				if(s!Laminae([ ,;<]+)!<<238>>Laminae<<238>>$1!g){
				}
				if(s! laminae([ ,;<]+)! <<238>>laminae<<238>>$1!g){
				}
				if(s!Lanceolate([ ,;<]+)!<<239>>Lanceolate<<239>>$1!g){
				}
				if(s! lanceolate([ ,;<]+)! <<239>>lanceolate<<239>>$1!g){
				}
				if(s!Lateral([ ,;<]+)!<<240>>Lateral<<240>>$1!g){
				}
				if(s! lateral([ ,;<]+)! <<240>>lateral<<240>>$1!g){
				}
				if(s!Leaf([ ,;<]+)!<<241>>Leaf<<241>>$1!g){
				}
				if(s! leaf([ ,;<]+)! <<241>>leaf<<241>>$1!g){
				}
				if(s!Leaves([ ,;<]+)!<<242>>Leaves<<242>>$1!g){
				}
				if(s! leaves([ ,;<]+)! <<242>>leaves<<242>>$1!g){
				}
				if(s!Leaflet([ ,;<]+)!<<243>>Leaflet<<243>>$1!g){
				}
				if(s! leaflet([ ,;<]+)! <<243>>leaflet<<243>>$1!g){
				}
				if(s!Leaflets([ ,;<]+)!<<244>>Leaflets<<244>>$1!g){
				}
				if(s! leaflets([ ,;<]+)! <<244>>leaflets<<244>>$1!g){
				}
				if(s!Legume([ ,;<]+)!<<245>>Legume<<245>>$1!g){
				}
				if(s! legume([ ,;<]+)! <<245>>legume<<245>>$1!g){
				}
				if(s!Legumes([ ,;<]+)!<<246>>Legumes<<246>>$1!g){
				}
				if(s! legumes([ ,;<]+)! <<246>>legumes<<246>>$1!g){
				}
				if(s!Lemma([ ,;<]+)!<<247>>Lemma<<247>>$1!g){
				}
				if(s! lemma([ ,;<]+)! <<247>>lemma<<247>>$1!g){
				}
				if(s!Lemmas([ ,;<]+)!<<248>>Lemmas<<248>>$1!g){
				}
				if(s! lemmas([ ,;<]+)! <<248>>lemmas<<248>>$1!g){
				}
				if(s!Lenticel([ ,;<]+)!<<249>>Lenticel<<249>>$1!g){
				}
				if(s! lenticel([ ,;<]+)! <<249>>lenticel<<249>>$1!g){
				}
				if(s!Lenticels([ ,;<]+)!<<250>>Lenticels<<250>>$1!g){
				}
				if(s! lenticels([ ,;<]+)! <<250>>lenticels<<250>>$1!g){
				}
				if(s!Lenticular([ ,;<]+)!<<251>>Lenticular<<251>>$1!g){
				}
				if(s! lenticular([ ,;<]+)! <<251>>lenticular<<251>>$1!g){
				}
				if(s!Ligulate flower([ ,;<]+)!<<252>>Ligulate flower<<252>>$1!g){
				}
				if(s! ligulate flower([ ,;<]+)! <<252>>ligulate flower<<252>>$1!g){
				}
				if(s!Ligule([ ,;<]+)!<<253>>Ligule<<253>>$1!g){
				}
				if(s! ligule([ ,;<]+)! <<253>>ligule<<253>>$1!g){
				}
				if(s!Ligules([ ,;<]+)!<<254>>Ligules<<254>>$1!g){
				}
				if(s! ligules([ ,;<]+)! <<254>>ligules<<254>>$1!g){
				}
				if(s!Liguliflorous([ ,;<]+)!<<255>>Liguliflorous<<255>>$1!g){
				}
				if(s! liguliflorous([ ,;<]+)! <<255>>liguliflorous<<255>>$1!g){
				}
				if(s!Limb([ ,;<]+)!<<256>>Limb<<256>>$1!g){
				}
				if(s! limb([ ,;<]+)! <<256>>limb<<256>>$1!g){
				}
				if(s!Limbs([ ,;<]+)!<<257>>Limbs<<257>>$1!g){
				}
				if(s! limbs([ ,;<]+)! <<257>>limbs<<257>>$1!g){
				}
				if(s!Linear([ ,;<]+)!<<258>>Linear<<258>>$1!g){
				}
				if(s! linear([ ,;<]+)! <<258>>linear<<258>>$1!g){
				}
				if(s!Lip([ ,;<]+)!<<259>>Lip<<259>>$1!g){
				}
				if(s! lip([ ,;<]+)! <<259>>lip<<259>>$1!g){
				}
				if(s!Lips([ ,;<]+)!<<260>>Lips<<260>>$1!g){
				}
				if(s! lips([ ,;<]+)! <<260>>lips<<260>>$1!g){
				}
				if(s!Lobe([ ,;<]+)!<<261>>Lobe<<261>>$1!g){
				}
				if(s! lobe([ ,;<]+)! <<261>>lobe<<261>>$1!g){
				}
				if(s!Lobes([ ,;<]+)!<<262>>Lobes<<262>>$1!g){
				}
				if(s! lobes([ ,;<]+)! <<262>>lobes<<262>>$1!g){
				}
				if(s!Loculicidal([ ,;<]+)!<<263>>Loculicidal<<263>>$1!g){
				}
				if(s! loculicidal([ ,;<]+)! <<263>>loculicidal<<263>>$1!g){
				}
				if(s!Longitudinal([ ,;<]+)!<<264>>Longitudinal<<264>>$1!g){
				}
				if(s! longitudinal([ ,;<]+)! <<264>>longitudinal<<264>>$1!g){
				}
				if(s!Margin([ ,;<]+)!<<265>>Margin<<265>>$1!g){
				}
				if(s! margin([ ,;<]+)! <<265>>margin<<265>>$1!g){
				}
				if(s!Margins([ ,;<]+)!<<266>>Margins<<266>>$1!g){
				}
				if(s! margins([ ,;<]+)! <<266>>margins<<266>>$1!g){
				}
				if(s!Marsh([ ,;<]+)!<<267>>Marsh<<267>>$1!g){
				}
				if(s! marsh([ ,;<]+)! <<267>>marsh<<267>>$1!g){
				}
				if(s!Marshes([ ,;<]+)!<<268>>Marshes<<268>>$1!g){
				}
				if(s! marshes([ ,;<]+)! <<268>>marshes<<268>>$1!g){
				}
				if(s!Meadow([ ,;<]+)!<<269>>Meadow<<269>>$1!g){
				}
				if(s! meadow([ ,;<]+)! <<269>>meadow<<269>>$1!g){
				}
				if(s!Meadows([ ,;<]+)!<<270>>Meadows<<270>>$1!g){
				}
				if(s! meadows([ ,;<]+)! <<270>>meadows<<270>>$1!g){
				}
				if(s!Membranous([ ,;<]+)!<<271>>Membranous<<271>>$1!g){
				}
				if(s! membranous([ ,;<]+)! <<271>>membranous<<271>>$1!g){
				}
				if(s!Mericarp([ ,;<]+)!<<272>>Mericarp<<272>>$1!g){
				}
				if(s! mericarp([ ,;<]+)! <<272>>mericarp<<272>>$1!g){
				}
				if(s!Mixed-evergreen forest([ ,;<]+)!<<273>>Mixed-evergreen forest<<273>>$1!g){
				}
				if(s! mixed-evergreen forest([ ,;<]+)! <<273>>mixed-evergreen forest<<273>>$1!g){
				}
				if(s!Monoecious([ ,;<]+)!<<274>>Monoecious<<274>>$1!g){
				}
				if(s! monoecious([ ,;<]+)! <<274>>monoecious<<274>>$1!g){
				}
				if(s!Monolete spore([ ,;<]+)!<<275>>Monolete spore<<275>>$1!g){
				}
				if(s! monolete spore([ ,;<]+)! <<275>>monolete spore<<275>>$1!g){
				}
				if(s!Montane([ ,;<]+)!<<276>>Montane<<276>>$1!g){
				}
				if(s! montane([ ,;<]+)! <<276>>montane<<276>>$1!g){
				}
				if(s!Mucro([ ,;<]+)!<<277>>Mucro<<277>>$1!g){
				}
				if(s! mucro([ ,;<]+)! <<277>>mucro<<277>>$1!g){
				}
				if(s!Mucronate([ ,;<]+)!<<278>>Mucronate<<278>>$1!g){
				}
				if(s! mucronate([ ,;<]+)! <<278>>mucronate<<278>>$1!g){
				}
				if(s!Native([ ,;<]+)!<<279>>Native<<279>>$1!g){
				}
				if(s! native([ ,;<]+)! <<279>>native<<279>>$1!g){
				}
				if(s!Naturalized([ ,;<]+)!<<280>>Naturalized<<280>>$1!g){
				}
				if(s! naturalized([ ,;<]+)! <<280>>naturalized<<280>>$1!g){
				}
				if(s!Nectar([ ,;<]+)!<<281>>Nectar<<281>>$1!g){
				}
				if(s! nectar([ ,;<]+)! <<281>>nectar<<281>>$1!g){
				}
				if(s!Nectary([ ,;<]+)!<<282>>Nectary<<282>>$1!g){
				}
				if(s! nectary([ ,;<]+)! <<282>>nectary<<282>>$1!g){
				}
				if(s!Nectaries([ ,;<]+)!<<283>>Nectaries<<283>>$1!g){
				}
				if(s! nectaries([ ,;<]+)! <<283>>nectaries<<283>>$1!g){
				}
				if(s!Needle([ ,;<]+)!<<284>>Needle<<284>>$1!g){
				}
				if(s! needle([ ,;<]+)! <<284>>needle<<284>>$1!g){
				}
				if(s!Needles([ ,;<]+)!<<285>>Needles<<285>>$1!g){
				}
				if(s! needles([ ,;<]+)! <<285>>needles<<285>>$1!g){
				}
				if(s!Node([ ,;<]+)!<<286>>Node<<286>>$1!g){
				}
				if(s! node([ ,;<]+)! <<286>>node<<286>>$1!g){
				}
				if(s!Nodes([ ,;<]+)!<<287>>Nodes<<287>>$1!g){
				}
				if(s! nodes([ ,;<]+)! <<287>>nodes<<287>>$1!g){
				}
				if(s!Nut([ ,;<]+)!<<288>>Nut<<288>>$1!g){
				}
				if(s! nut([ ,;<]+)! <<288>>nut<<288>>$1!g){
				}
				if(s!Nuts([ ,;<]+)!<<289>>Nuts<<289>>$1!g){
				}
				if(s! nuts([ ,;<]+)! <<289>>nuts<<289>>$1!g){
				}
				if(s!Nutlet([ ,;<]+)!<<290>>Nutlet<<290>>$1!g){
				}
				if(s! nutlet([ ,;<]+)! <<290>>nutlet<<290>>$1!g){
				}
				if(s!Nutlets([ ,;<]+)!<<291>>Nutlets<<291>>$1!g){
				}
				if(s! nutlets([ ,;<]+)! <<291>>nutlets<<291>>$1!g){
				}
				if(s!Oblique([ ,;<]+)!<<292>>Oblique<<292>>$1!g){
				}
				if(s! oblique([ ,;<]+)! <<292>>oblique<<292>>$1!g){
				}
				if(s!Oblong([ ,;<]+)!<<293>>Oblong<<293>>$1!g){
				}
				if(s! oblong([ ,;<]+)! <<293>>oblong<<293>>$1!g){
				}
				if(s!Obtuse([ ,;<]+)!<<294>>Obtuse<<294>>$1!g){
				}
				if(s! obtuse([ ,;<]+)! <<294>>obtuse<<294>>$1!g){
				}
				if(s!Ocrea([ ,;<]+)!<<295>>Ocrea<<295>>$1!g){
				}
				if(s! ocrea([ ,;<]+)! <<295>>ocrea<<295>>$1!g){
				}
				if(s!Ocreae([ ,;<]+)!<<296>>Ocreae<<296>>$1!g){
				}
				if(s! ocreae([ ,;<]+)! <<296>>ocreae<<296>>$1!g){
				}
				if(s!Open([ ,;<]+)!<<297>>Open<<297>>$1!g){
				}
				if(s! open([ ,;<]+)! <<297>>open<<297>>$1!g){
				}
				if(s!Opposite([ ,;<]+)!<<298>>Opposite<<298>>$1!g){
				}
				if(s! opposite([ ,;<]+)! <<298>>opposite<<298>>$1!g){
				}
				if(s!Ovary([ ,;<]+)!<<299>>Ovary<<299>>$1!g){
				}
				if(s! ovary([ ,;<]+)! <<299>>ovary<<299>>$1!g){
				}
				if(s!Ovaries([ ,;<]+)!<<300>>Ovaries<<300>>$1!g){
				}
				if(s! ovaries([ ,;<]+)! <<300>>ovaries<<300>>$1!g){
				}
				if(s!Ovary stalk([ ,;<]+)!<<301>>Ovary stalk<<301>>$1!g){
				}
				if(s! ovary stalk([ ,;<]+)! <<301>>ovary stalk<<301>>$1!g){
				}
				if(s!Fruit stalk([ ,;<]+)!<<302>>Fruit stalk<<302>>$1!g){
				}
				if(s! fruit stalk([ ,;<]+)! <<302>>fruit stalk<<302>>$1!g){
				}
				if(s!Ovate([ ,;<]+)!<<303>>Ovate<<303>>$1!g){
				}
				if(s! ovate([ ,;<]+)! <<303>>ovate<<303>>$1!g){
				}
				if(s!Ovoid([ ,;<]+)!<<304>>Ovoid<<304>>$1!g){
				}
				if(s! ovoid([ ,;<]+)! <<304>>ovoid<<304>>$1!g){
				}
				if(s!Ovule([ ,;<]+)!<<305>>Ovule<<305>>$1!g){
				}
				if(s! ovule([ ,;<]+)! <<305>>ovule<<305>>$1!g){
				}
				if(s!Ovules([ ,;<]+)!<<306>>Ovules<<306>>$1!g){
				}
				if(s! ovules([ ,;<]+)! <<306>>ovules<<306>>$1!g){
				}
				if(s!Paleate([ ,;<]+)!<<307>>Paleate<<307>>$1!g){
				}
				if(s! paleate([ ,;<]+)! <<307>>paleate<<307>>$1!g){
				}
				if(s!Palea([ ,;<]+)!<<308>>Palea<<308>>$1!g){
				}
				if(s! palea([ ,;<]+)! <<308>>palea<<308>>$1!g){
				}
				if(s!Paleae([ ,;<]+)!<<309>>Paleae<<309>>$1!g){
				}
				if(s! paleae([ ,;<]+)! <<309>>paleae<<309>>$1!g){
				}
				if(s!Palmately([ ,;<]+)!<<310>>Palmately<<310>>$1!g){
				}
				if(s! palmately([ ,;<]+)! <<310>>palmately<<310>>$1!g){
				}
				if(s!Palmate([ ,;<]+)!<<311>>Palmate<<311>>$1!g){
				}
				if(s! palmate([ ,;<]+)! <<311>>palmate<<311>>$1!g){
				}
				if(s!Panicle([ ,;<]+)!<<312>>Panicle<<312>>$1!g){
				}
				if(s! panicle([ ,;<]+)! <<312>>panicle<<312>>$1!g){
				}
				if(s!Panicles([ ,;<]+)!<<313>>Panicles<<313>>$1!g){
				}
				if(s! panicles([ ,;<]+)! <<313>>panicles<<313>>$1!g){
				}
				if(s!Papillate([ ,;<]+)!<<314>>Papillate<<314>>$1!g){
				}
				if(s! papillate([ ,;<]+)! <<314>>papillate<<314>>$1!g){
				}
				if(s!Pappus([ ,;<]+)!<<315>>Pappus<<315>>$1!g){
				}
				if(s! pappus([ ,;<]+)! <<315>>pappus<<315>>$1!g){
				}
				if(s!Parasite([ ,;<]+)!<<316>>Parasite<<316>>$1!g){
				}
				if(s! parasite([ ,;<]+)! <<316>>parasite<<316>>$1!g){
				}
				if(s!Parasites([ ,;<]+)!<<317>>Parasites<<317>>$1!g){
				}
				if(s! parasites([ ,;<]+)! <<317>>parasites<<317>>$1!g){
				}
				if(s!Parietal([ ,;<]+)!<<318>>Parietal<<318>>$1!g){
				}
				if(s! parietal([ ,;<]+)! <<318>>parietal<<318>>$1!g){
				}
				if(s!Parietally([ ,;<]+)!<<319>>Parietally<<319>>$1!g){
				}
				if(s! parietally([ ,;<]+)! <<319>>parietally<<319>>$1!g){
				}
				if(s!Peat([ ,;<]+)!<<320>>Peat<<320>>$1!g){
				}
				if(s! peat([ ,;<]+)! <<320>>peat<<320>>$1!g){
				}
				if(s!Peatland([ ,;<]+)!<<321>>Peatland<<321>>$1!g){
				}
				if(s! peatland([ ,;<]+)! <<321>>peatland<<321>>$1!g){
				}
				if(s!Peatlands([ ,;<]+)!<<322>>Peatlands<<322>>$1!g){
				}
				if(s! peatlands([ ,;<]+)! <<322>>peatlands<<322>>$1!g){
				}
				if(s!Pedicel([ ,;<]+)!<<323>>Pedicel<<323>>$1!g){
				}
				if(s! pedicel([ ,;<]+)! <<323>>pedicel<<323>>$1!g){
				}
				if(s!Pedicels([ ,;<]+)!<<324>>Pedicels<<324>>$1!g){
				}
				if(s! pedicels([ ,;<]+)! <<324>>pedicels<<324>>$1!g){
				}
				if(s!Peduncle([ ,;<]+)!<<325>>Peduncle<<325>>$1!g){
				}
				if(s! peduncle([ ,;<]+)! <<325>>peduncle<<325>>$1!g){
				}
				if(s!Peduncles([ ,;<]+)!<<326>>Peduncles<<326>>$1!g){
				}
				if(s! peduncles([ ,;<]+)! <<326>>peduncles<<326>>$1!g){
				}
				if(s!Peltate([ ,;<]+)!<<327>>Peltate<<327>>$1!g){
				}
				if(s! peltate([ ,;<]+)! <<327>>peltate<<327>>$1!g){
				}
				if(s!Pendent([ ,;<]+)!<<328>>Pendent<<328>>$1!g){
				}
				if(s! pendent([ ,;<]+)! <<328>>pendent<<328>>$1!g){
				}
				if(s!Perennial([ ,;<]+)!<<329>>Perennial<<329>>$1!g){
				}
				if(s! perennial([ ,;<]+)! <<329>>perennial<<329>>$1!g){
				}
				if(s!Perianth([ ,;<]+)!<<330>>Perianth<<330>>$1!g){
				}
				if(s! perianth([ ,;<]+)! <<330>>perianth<<330>>$1!g){
				}
				if(s!Perianths([ ,;<]+)!<<331>>Perianths<<331>>$1!g){
				}
				if(s! perianths([ ,;<]+)! <<331>>perianths<<331>>$1!g){
				}
				if(s!Perianth part([ ,;<]+)!<<332>>Perianth part<<332>>$1!g){
				}
				if(s! perianth part([ ,;<]+)! <<332>>perianth part<<332>>$1!g){
				}
				if(s!Perigynium([ ,;<]+)!<<333>>Perigynium<<333>>$1!g){
				}
				if(s! perigynium([ ,;<]+)! <<333>>perigynium<<333>>$1!g){
				}
				if(s!Persistent([ ,;<]+)!<<334>>Persistent<<334>>$1!g){
				}
				if(s! persistent([ ,;<]+)! <<334>>persistent<<334>>$1!g){
				}
				if(s!Petal([ ,;<]+)!<<335>>Petal<<335>>$1!g){
				}
				if(s! petal([ ,;<]+)! <<335>>petal<<335>>$1!g){
				}
				if(s!Petals([ ,;<]+)!<<336>>Petals<<336>>$1!g){
				}
				if(s! petals([ ,;<]+)! <<336>>petals<<336>>$1!g){
				}
				if(s!Petiole([ ,;<]+)!<<337>>Petiole<<337>>$1!g){
				}
				if(s! petiole([ ,;<]+)! <<337>>petiole<<337>>$1!g){
				}
				if(s!Petioles([ ,;<]+)!<<338>>Petioles<<338>>$1!g){
				}
				if(s! petioles([ ,;<]+)! <<338>>petioles<<338>>$1!g){
				}
				if(s!Phyllary([ ,;<]+)!<<339>>Phyllary<<339>>$1!g){
				}
				if(s! phyllary([ ,;<]+)! <<339>>phyllary<<339>>$1!g){
				}
				if(s!Phyllaries([ ,;<]+)!<<340>>Phyllaries<<340>>$1!g){
				}
				if(s! phyllaries([ ,;<]+)! <<340>>phyllaries<<340>>$1!g){
				}
				if(s!Pinna([ ,;<]+)!<<341>>Pinna<<341>>$1!g){
				}
				if(s! pinna([ ,;<]+)! <<341>>pinna<<341>>$1!g){
				}
				if(s!Pinnae([ ,;<]+)!<<342>>Pinnae<<342>>$1!g){
				}
				if(s! pinnae([ ,;<]+)! <<342>>pinnae<<342>>$1!g){
				}
				if(s!Pinnate([ ,;<]+)!<<343>>Pinnate<<343>>$1!g){
				}
				if(s! pinnate([ ,;<]+)! <<343>>pinnate<<343>>$1!g){
				}
				if(s!Pinnately([ ,;<]+)!<<344>>Pinnately<<344>>$1!g){
				}
				if(s! pinnately([ ,;<]+)! <<344>>pinnately<<344>>$1!g){
				}
				if(s!Pinnule([ ,;<]+)!<<345>>Pinnule<<345>>$1!g){
				}
				if(s! pinnule([ ,;<]+)! <<345>>pinnule<<345>>$1!g){
				}
				if(s!Pinnules([ ,;<]+)!<<346>>Pinnules<<346>>$1!g){
				}
				if(s! pinnules([ ,;<]+)! <<346>>pinnules<<346>>$1!g){
				}
				if(s!Pinnulet([ ,;<]+)!<<347>>Pinnulet<<347>>$1!g){
				}
				if(s! pinnulet([ ,;<]+)! <<347>>pinnulet<<347>>$1!g){
				}
				if(s!Pistil([ ,;<]+)!<<348>>Pistil<<348>>$1!g){
				}
				if(s! pistil([ ,;<]+)! <<348>>pistil<<348>>$1!g){
				}
				if(s!Pistils([ ,;<]+)!<<349>>Pistils<<349>>$1!g){
				}
				if(s! pistils([ ,;<]+)! <<349>>pistils<<349>>$1!g){
				}
				if(s!Pistillate([ ,;<]+)!<<350>>Pistillate<<350>>$1!g){
				}
				if(s! pistillate([ ,;<]+)! <<350>>pistillate<<350>>$1!g){
				}
				if(s!Placenta([ ,;<]+)!<<351>>Placenta<<351>>$1!g){
				}
				if(s! placenta([ ,;<]+)! <<351>>placenta<<351>>$1!g){
				}
				if(s!Placentas([ ,;<]+)!<<352>>Placentas<<352>>$1!g){
				}
				if(s! placentas([ ,;<]+)! <<352>>placentas<<352>>$1!g){
				}
				if(s!Planoconvex([ ,;<]+)!<<353>>Planoconvex<<353>>$1!g){
				}
				if(s! planoconvex([ ,;<]+)! <<353>>planoconvex<<353>>$1!g){
				}
				if(s!Pleated([ ,;<]+)!<<354>>Pleated<<354>>$1!g){
				}
				if(s! pleated([ ,;<]+)! <<354>>pleated<<354>>$1!g){
				}
				if(s!Plumose([ ,;<]+)!<<355>>Plumose<<355>>$1!g){
				}
				if(s! plumose([ ,;<]+)! <<355>>plumose<<355>>$1!g){
				}
				if(s!Pollen([ ,;<]+)!<<356>>Pollen<<356>>$1!g){
				}
				if(s! pollen([ ,;<]+)! <<356>>pollen<<356>>$1!g){
				}
				if(s!Pollination([ ,;<]+)!<<357>>Pollination<<357>>$1!g){
				}
				if(s! pollination([ ,;<]+)! <<357>>pollination<<357>>$1!g){
				}
				if(s!Pollinium([ ,;<]+)!<<358>>Pollinium<<358>>$1!g){
				}
				if(s! pollinium([ ,;<]+)! <<358>>pollinium<<358>>$1!g){
				}
				if(s!Pollinia([ ,;<]+)!<<359>>Pollinia<<359>>$1!g){
				}
				if(s! pollinia([ ,;<]+)! <<359>>pollinia<<359>>$1!g){
				}
				if(s!Polyploid([ ,;<]+)!<<360>>Polyploid<<360>>$1!g){
				}
				if(s! polyploid([ ,;<]+)! <<360>>polyploid<<360>>$1!g){
				}
				if(s!Pome([ ,;<]+)!<<361>>Pome<<361>>$1!g){
				}
				if(s! pome([ ,;<]+)! <<361>>pome<<361>>$1!g){
				}
				if(s!Prickle([ ,;<]+)!<<362>>Prickle<<362>>$1!g){
				}
				if(s! prickle([ ,;<]+)! <<362>>prickle<<362>>$1!g){
				}
				if(s!Prickles([ ,;<]+)!<<363>>Prickles<<363>>$1!g){
				}
				if(s! prickles([ ,;<]+)! <<363>>prickles<<363>>$1!g){
				}
				if(s!Prostrate([ ,;<]+)!<<364>>Prostrate<<364>>$1!g){
				}
				if(s! prostrate([ ,;<]+)! <<364>>prostrate<<364>>$1!g){
				}
				if(s!Protandrous([ ,;<]+)!<<365>>Protandrous<<365>>$1!g){
				}
				if(s! protandrous([ ,;<]+)! <<365>>protandrous<<365>>$1!g){
				}
				if(s!Protogynous([ ,;<]+)!<<366>>Protogynous<<366>>$1!g){
				}
				if(s! protogynous([ ,;<]+)! <<366>>protogynous<<366>>$1!g){
				}
				if(s!Proximal([ ,;<]+)!<<367>>Proximal<<367>>$1!g){
				}
				if(s! proximal([ ,;<]+)! <<367>>proximal<<367>>$1!g){
				}
				if(s!Proximally([ ,;<]+)!<<368>>Proximally<<368>>$1!g){
				}
				if(s! proximally([ ,;<]+)! <<368>>proximally<<368>>$1!g){
				}
				if(s!Puberulent([ ,;<]+)!<<369>>Puberulent<<369>>$1!g){
				}
				if(s! puberulent([ ,;<]+)! <<369>>puberulent<<369>>$1!g){
				}
				if(s!Raceme([ ,;<]+)!<<370>>Raceme<<370>>$1!g){
				}
				if(s! raceme([ ,;<]+)! <<370>>raceme<<370>>$1!g){
				}
				if(s!Racemes([ ,;<]+)!<<371>>Racemes<<371>>$1!g){
				}
				if(s! racemes([ ,;<]+)! <<371>>racemes<<371>>$1!g){
				}
				if(s!Rachis([ ,;<]+)!<<372>>Rachis<<372>>$1!g){
				}
				if(s! rachis([ ,;<]+)! <<372>>rachis<<372>>$1!g){
				}
				if(s!Rachides([ ,;<]+)!<<373>>Rachides<<373>>$1!g){
				}
				if(s! rachides([ ,;<]+)! <<373>>rachides<<373>>$1!g){
				}
				if(s!Radial([ ,;<]+)!<<374>>Radial<<374>>$1!g){
				}
				if(s! radial([ ,;<]+)! <<374>>radial<<374>>$1!g){
				}
				if(s!Radiant([ ,;<]+)!<<375>>Radiant<<375>>$1!g){
				}
				if(s! radiant([ ,;<]+)! <<375>>radiant<<375>>$1!g){
				}
				if(s!Radiate([ ,;<]+)!<<376>>Radiate<<376>>$1!g){
				}
				if(s! radiate([ ,;<]+)! <<376>>radiate<<376>>$1!g){
				}
				if(s!Rank([ ,;<]+)!<<377>>Rank<<377>>$1!g){
				}
				if(s! rank([ ,;<]+)! <<377>>rank<<377>>$1!g){
				}
				if(s!Ranks([ ,;<]+)!<<378>>Ranks<<378>>$1!g){
				}
				if(s! ranks([ ,;<]+)! <<378>>ranks<<378>>$1!g){
				}
				if(s!Ranked([ ,;<]+)!<<379>>Ranked<<379>>$1!g){
				}
				if(s! ranked([ ,;<]+)! <<379>>ranked<<379>>$1!g){
				}
				if(s!Rare([ ,;<]+)!<<380>>Rare<<380>>$1!g){
				}
				if(s! rare([ ,;<]+)! <<380>>rare<<380>>$1!g){
				}
				if(s!Rays([ ,;<]+)!<<381>>Rays<<381>>$1!g){
				}
				if(s! rays([ ,;<]+)! <<381>>rays<<381>>$1!g){
				}
				if(s!Rayed([ ,;<]+)!<<382>>Rayed<<382>>$1!g){
				}
				if(s! rayed([ ,;<]+)! <<382>>rayed<<382>>$1!g){
				}
				if(s!Ray flower([ ,;<]+)!<<383>>Ray flower<<383>>$1!g){
				}
				if(s! ray flower([ ,;<]+)! <<383>>ray flower<<383>>$1!g){
				}
				if(s!Receptacle([ ,;<]+)!<<384>>Receptacle<<384>>$1!g){
				}
				if(s! receptacle([ ,;<]+)! <<384>>receptacle<<384>>$1!g){
				}
				if(s!Receptacles([ ,;<]+)!<<385>>Receptacles<<385>>$1!g){
				}
				if(s! receptacles([ ,;<]+)! <<385>>receptacles<<385>>$1!g){
				}
				if(s!Recurved([ ,;<]+)!<<386>>Recurved<<386>>$1!g){
				}
				if(s! recurved([ ,;<]+)! <<386>>recurved<<386>>$1!g){
				}
				if(s!Reduced([ ,;<]+)!<<387>>Reduced<<387>>$1!g){
				}
				if(s! reduced([ ,;<]+)! <<387>>reduced<<387>>$1!g){
				}
				if(s!Reflexed([ ,;<]+)!<<388>>Reflexed<<388>>$1!g){
				}
				if(s! reflexed([ ,;<]+)! <<388>>reflexed<<388>>$1!g){
				}
				if(s!Reniform([ ,;<]+)!<<389>>Reniform<<389>>$1!g){
				}
				if(s! reniform([ ,;<]+)! <<389>>reniform<<389>>$1!g){
				}
				if(s!Rhizome([ ,;<]+)!<<390>>Rhizome<<390>>$1!g){
				}
				if(s! rhizome([ ,;<]+)! <<390>>rhizome<<390>>$1!g){
				}
				if(s!Rhizomes([ ,;<]+)!<<391>>Rhizomes<<391>>$1!g){
				}
				if(s! rhizomes([ ,;<]+)! <<391>>rhizomes<<391>>$1!g){
				}
				if(s!Rib([ ,;<]+)!<<392>>Rib<<392>>$1!g){
				}
				if(s! rib([ ,;<]+)! <<392>>rib<<392>>$1!g){
				}
				if(s!Ribs([ ,;<]+)!<<393>>Ribs<<393>>$1!g){
				}
				if(s! ribs([ ,;<]+)! <<393>>ribs<<393>>$1!g){
				}
				if(s!Ribbed([ ,;<]+)!<<394>>Ribbed<<394>>$1!g){
				}
				if(s! ribbed([ ,;<]+)! <<394>>ribbed<<394>>$1!g){
				}
				if(s!Riparian([ ,;<]+)!<<395>>Riparian<<395>>$1!g){
				}
				if(s! riparian([ ,;<]+)! <<395>>riparian<<395>>$1!g){
				}
				if(s!Root([ ,;<]+)!<<396>>Root<<396>>$1!g){
				}
				if(s! root([ ,;<]+)! <<396>>root<<396>>$1!g){
				}
				if(s!Roots([ ,;<]+)!<<397>>Roots<<397>>$1!g){
				}
				if(s! roots([ ,;<]+)! <<397>>roots<<397>>$1!g){
				}
				if(s!Rosette([ ,;<]+)!<<398>>Rosette<<398>>$1!g){
				}
				if(s! rosette([ ,;<]+)! <<398>>rosette<<398>>$1!g){
				}
				if(s!Rosettes([ ,;<]+)!<<399>>Rosettes<<399>>$1!g){
				}
				if(s! rosettes([ ,;<]+)! <<399>>rosettes<<399>>$1!g){
				}
				if(s!Rotate([ ,;<]+)!<<400>>Rotate<<400>>$1!g){
				}
				if(s! rotate([ ,;<]+)! <<400>>rotate<<400>>$1!g){
				}
				if(s!Ruderal([ ,;<]+)!<<401>>Ruderal<<401>>$1!g){
				}
				if(s! ruderal([ ,;<]+)! <<401>>ruderal<<401>>$1!g){
				}
				if(s!Sagittate([ ,;<]+)!<<402>>Sagittate<<402>>$1!g){
				}
				if(s! sagittate([ ,;<]+)! <<402>>sagittate<<402>>$1!g){
				}
				if(s!Salverform([ ,;<]+)!<<403>>Salverform<<403>>$1!g){
				}
				if(s! salverform([ ,;<]+)! <<403>>salverform<<403>>$1!g){
				}
				if(s!Savanna([ ,;<]+)!<<404>>Savanna<<404>>$1!g){
				}
				if(s! savanna([ ,;<]+)! <<404>>savanna<<404>>$1!g){
				}
				if(s!Scabrous([ ,;<]+)!<<405>>Scabrous<<405>>$1!g){
				}
				if(s! scabrous([ ,;<]+)! <<405>>scabrous<<405>>$1!g){
				}
				if(s!Scale([ ,;<]+)!<<406>>Scale<<406>>$1!g){
				}
				if(s! scale([ ,;<]+)! <<406>>scale<<406>>$1!g){
				}
				if(s!Scales([ ,;<]+)!<<407>>Scales<<407>>$1!g){
				}
				if(s! scales([ ,;<]+)! <<407>>scales<<407>>$1!g){
				}
				if(s!Scapose([ ,;<]+)!<<408>>Scapose<<408>>$1!g){
				}
				if(s! scapose([ ,;<]+)! <<408>>scapose<<408>>$1!g){
				}
				if(s!Scar([ ,;<]+)!<<409>>Scar<<409>>$1!g){
				}
				if(s! scar([ ,;<]+)! <<409>>scar<<409>>$1!g){
				}
				if(s!Scars([ ,;<]+)!<<410>>Scars<<410>>$1!g){
				}
				if(s! scars([ ,;<]+)! <<410>>scars<<410>>$1!g){
				}
				if(s!Scarious([ ,;<]+)!<<411>>Scarious<<411>>$1!g){
				}
				if(s! scarious([ ,;<]+)! <<411>>scarious<<411>>$1!g){
				}
				if(s!Scree([ ,;<]+)!<<412>>Scree<<412>>$1!g){
				}
				if(s! scree([ ,;<]+)! <<412>>scree<<412>>$1!g){
				}
				if(s!Scrub([ ,;<]+)!<<413>>Scrub<<413>>$1!g){
				}
				if(s! scrub([ ,;<]+)! <<413>>scrub<<413>>$1!g){
				}
				if(s!Sculpture([ ,;<]+)!<<414>>Sculpture<<414>>$1!g){
				}
				if(s! sculpture([ ,;<]+)! <<414>>sculpture<<414>>$1!g){
				}
				if(s!Seed([ ,;<]+)!<<415>>Seed<<415>>$1!g){
				}
				if(s! seed([ ,;<]+)! <<415>>seed<<415>>$1!g){
				}
				if(s!Seeds([ ,;<]+)!<<416>>Seeds<<416>>$1!g){
				}
				if(s! seeds([ ,;<]+)! <<416>>seeds<<416>>$1!g){
				}
				if(s!Segment([ ,;<]+)!<<417>>Segment<<417>>$1!g){
				}
				if(s! segment([ ,;<]+)! <<417>>segment<<417>>$1!g){
				}
				if(s!Segments([ ,;<]+)!<<418>>Segments<<418>>$1!g){
				}
				if(s! segments([ ,;<]+)! <<418>>segments<<418>>$1!g){
				}
				if(s!Sepal([ ,;<]+)!<<419>>Sepal<<419>>$1!g){
				}
				if(s! sepal([ ,;<]+)! <<419>>sepal<<419>>$1!g){
				}
				if(s!Sepals([ ,;<]+)!<<420>>Sepals<<420>>$1!g){
				}
				if(s! sepals([ ,;<]+)! <<420>>sepals<<420>>$1!g){
				}
				if(s!Septicidal([ ,;<]+)!<<421>>Septicidal<<421>>$1!g){
				}
				if(s! septicidal([ ,;<]+)! <<421>>septicidal<<421>>$1!g){
				}
				if(s!Septum([ ,;<]+)!<<422>>Septum<<422>>$1!g){
				}
				if(s! septum([ ,;<]+)! <<422>>septum<<422>>$1!g){
				}
				if(s!Septa([ ,;<]+)!<<423>>Septa<<423>>$1!g){
				}
				if(s! septa([ ,;<]+)! <<423>>septa<<423>>$1!g){
				}
				if(s!Series([ ,;<]+)!<<424>>Series<<424>>$1!g){
				}
				if(s! series([ ,;<]+)! <<424>>series<<424>>$1!g){
				}
				if(s!Serpentine([ ,;<]+)!<<425>>Serpentine<<425>>$1!g){
				}
				if(s! serpentine([ ,;<]+)! <<425>>serpentine<<425>>$1!g){
				}
				if(s!Serpentinitic([ ,;<]+)!<<426>>Serpentinitic<<426>>$1!g){
				}
				if(s! serpentinitic([ ,;<]+)! <<426>>serpentinitic<<426>>$1!g){
				}
				if(s!Serrate([ ,;<]+)!<<427>>Serrate<<427>>$1!g){
				}
				if(s! serrate([ ,;<]+)! <<427>>serrate<<427>>$1!g){
				}
				if(s!Sessile([ ,;<]+)!<<428>>Sessile<<428>>$1!g){
				}
				if(s! sessile([ ,;<]+)! <<428>>sessile<<428>>$1!g){
				}
				if(s!Sheath([ ,;<]+)!<<429>>Sheath<<429>>$1!g){
				}
				if(s! sheath([ ,;<]+)! <<429>>sheath<<429>>$1!g){
				}
				if(s!Sheaths([ ,;<]+)!<<430>>Sheaths<<430>>$1!g){
				}
				if(s! sheaths([ ,;<]+)! <<430>>sheaths<<430>>$1!g){
				}
				if(s!Shoot([ ,;<]+)!<<431>>Shoot<<431>>$1!g){
				}
				if(s! shoot([ ,;<]+)! <<431>>shoot<<431>>$1!g){
				}
				if(s!Shoots([ ,;<]+)!<<432>>Shoots<<432>>$1!g){
				}
				if(s! shoots([ ,;<]+)! <<432>>shoots<<432>>$1!g){
				}
				if(s!Shrub([ ,;<]+)!<<433>>Shrub<<433>>$1!g){
				}
				if(s! shrub([ ,;<]+)! <<433>>shrub<<433>>$1!g){
				}
				if(s!Shrubs([ ,;<]+)!<<434>>Shrubs<<434>>$1!g){
				}
				if(s! shrubs([ ,;<]+)! <<434>>shrubs<<434>>$1!g){
				}
				if(s!Simple([ ,;<]+)!<<435>>Simple<<435>>$1!g){
				}
				if(s! simple([ ,;<]+)! <<435>>simple<<435>>$1!g){
				}
				if(s!Sinus([ ,;<]+)!<<436>>Sinus<<436>>$1!g){
				}
				if(s! sinus([ ,;<]+)! <<436>>sinus<<436>>$1!g){
				}
				if(s!Sorus([ ,;<]+)!<<437>>Sorus<<437>>$1!g){
				}
				if(s! sorus([ ,;<]+)! <<437>>sorus<<437>>$1!g){
				}
				if(s!Sori([ ,;<]+)!<<438>>Sori<<438>>$1!g){
				}
				if(s! sori([ ,;<]+)! <<438>>sori<<438>>$1!g){
				}
				if(s!Spheric([ ,;<]+)!<<439>>Spheric<<439>>$1!g){
				}
				if(s! spheric([ ,;<]+)! <<439>>spheric<<439>>$1!g){
				}
				if(s!Spike([ ,;<]+)!<<440>>Spike<<440>>$1!g){
				}
				if(s! spike([ ,;<]+)! <<440>>spike<<440>>$1!g){
				}
				if(s!Spikes([ ,;<]+)!<<441>>Spikes<<441>>$1!g){
				}
				if(s! spikes([ ,;<]+)! <<441>>spikes<<441>>$1!g){
				}
				if(s!Spikelet([ ,;<]+)!<<442>>Spikelet<<442>>$1!g){
				}
				if(s! spikelet([ ,;<]+)! <<442>>spikelet<<442>>$1!g){
				}
				if(s!Spikelets([ ,;<]+)!<<443>>Spikelets<<443>>$1!g){
				}
				if(s! spikelets([ ,;<]+)! <<443>>spikelets<<443>>$1!g){
				}
				if(s!Spine([ ,;<]+)!<<444>>Spine<<444>>$1!g){
				}
				if(s! spine([ ,;<]+)! <<444>>spine<<444>>$1!g){
				}
				if(s!Spines([ ,;<]+)!<<445>>Spines<<445>>$1!g){
				}
				if(s! spines([ ,;<]+)! <<445>>spines<<445>>$1!g){
				}
				if(s!Sporangium([ ,;<]+)!<<446>>Sporangium<<446>>$1!g){
				}
				if(s! sporangium([ ,;<]+)! <<446>>sporangium<<446>>$1!g){
				}
				if(s!Sporangia([ ,;<]+)!<<447>>Sporangia<<447>>$1!g){
				}
				if(s! sporangia([ ,;<]+)! <<447>>sporangia<<447>>$1!g){
				}
				if(s!Spore([ ,;<]+)!<<448>>Spore<<448>>$1!g){
				}
				if(s! spore([ ,;<]+)! <<448>>spore<<448>>$1!g){
				}
				if(s!Spores([ ,;<]+)!<<449>>Spores<<449>>$1!g){
				}
				if(s! spores([ ,;<]+)! <<449>>spores<<449>>$1!g){
				}
				if(s!Spreading([ ,;<]+)!<<450>>Spreading<<450>>$1!g){
				}
				if(s! spreading([ ,;<]+)! <<450>>spreading<<450>>$1!g){
				}
				if(s!Spur([ ,;<]+)!<<451>>Spur<<451>>$1!g){
				}
				if(s! spur([ ,;<]+)! <<451>>spur<<451>>$1!g){
				}
				if(s!Spurs([ ,;<]+)!<<452>>Spurs<<452>>$1!g){
				}
				if(s! spurs([ ,;<]+)! <<452>>spurs<<452>>$1!g){
				}
				if(s!Stamen([ ,;<]+)!<<453>>Stamen<<453>>$1!g){
				}
				if(s! stamen([ ,;<]+)! <<453>>stamen<<453>>$1!g){
				}
				if(s!Stamens([ ,;<]+)!<<454>>Stamens<<454>>$1!g){
				}
				if(s! stamens([ ,;<]+)! <<454>>stamens<<454>>$1!g){
				}
				if(s!Staminate([ ,;<]+)!<<455>>Staminate<<455>>$1!g){
				}
				if(s! staminate([ ,;<]+)! <<455>>staminate<<455>>$1!g){
				}
				if(s!Staminode([ ,;<]+)!<<456>>Staminode<<456>>$1!g){
				}
				if(s! staminode([ ,;<]+)! <<456>>staminode<<456>>$1!g){
				}
				if(s!Staminodes([ ,;<]+)!<<457>>Staminodes<<457>>$1!g){
				}
				if(s! staminodes([ ,;<]+)! <<457>>staminodes<<457>>$1!g){
				}
				if(s!Stellate([ ,;<]+)!<<458>>Stellate<<458>>$1!g){
				}
				if(s! stellate([ ,;<]+)! <<458>>stellate<<458>>$1!g){
				}
				if(s!Stem([ ,;<]+)!<<459>>Stem<<459>>$1!g){
				}
				if(s! stem([ ,;<]+)! <<459>>stem<<459>>$1!g){
				}
				if(s!Stems([ ,;<]+)!<<460>>Stems<<460>>$1!g){
				}
				if(s! stems([ ,;<]+)! <<460>>stems<<460>>$1!g){
				}
				if(s!Sterile([ ,;<]+)!<<461>>Sterile<<461>>$1!g){
				}
				if(s! sterile([ ,;<]+)! <<461>>sterile<<461>>$1!g){
				}
				if(s!Stigma([ ,;<]+)!<<462>>Stigma<<462>>$1!g){
				}
				if(s! stigma([ ,;<]+)! <<462>>stigma<<462>>$1!g){
				}
				if(s!Stigmas([ ,;<]+)!<<463>>Stigmas<<463>>$1!g){
				}
				if(s! stigmas([ ,;<]+)! <<463>>stigmas<<463>>$1!g){
				}
				if(s!Stigmata([ ,;<]+)!<<464>>Stigmata<<464>>$1!g){
				}
				if(s! stigmata([ ,;<]+)! <<464>>stigmata<<464>>$1!g){
				}
				if(s!Stipe([ ,;<]+)!<<465>>Stipe<<465>>$1!g){
				}
				if(s! stipe([ ,;<]+)! <<465>>stipe<<465>>$1!g){
				}
				if(s!Stipes([ ,;<]+)!<<466>>Stipes<<466>>$1!g){
				}
				if(s! stipes([ ,;<]+)! <<466>>stipes<<466>>$1!g){
				}
				if(s!Stipule([ ,;<]+)!<<467>>Stipule<<467>>$1!g){
				}
				if(s! stipule([ ,;<]+)! <<467>>stipule<<467>>$1!g){
				}
				if(s!Stipules([ ,;<]+)!<<468>>Stipules<<468>>$1!g){
				}
				if(s! stipules([ ,;<]+)! <<468>>stipules<<468>>$1!g){
				}
				if(s!Stolon([ ,;<]+)!<<469>>Stolon<<469>>$1!g){
				}
				if(s! stolon([ ,;<]+)! <<469>>stolon<<469>>$1!g){
				}
				if(s!Stolons([ ,;<]+)!<<470>>Stolons<<470>>$1!g){
				}
				if(s! stolons([ ,;<]+)! <<470>>stolons<<470>>$1!g){
				}
				if(s!Stoma([ ,;<]+)!<<471>>Stoma<<471>>$1!g){
				}
				if(s! stoma([ ,;<]+)! <<471>>stoma<<471>>$1!g){
				}
				if(s!Stomata([ ,;<]+)!<<472>>Stomata<<472>>$1!g){
				}
				if(s! stomata([ ,;<]+)! <<472>>stomata<<472>>$1!g){
				}
				if(s!Stomate([ ,;<]+)!<<473>>Stomate<<473>>$1!g){
				}
				if(s! stomate([ ,;<]+)! <<473>>stomate<<473>>$1!g){
				}
				if(s!Stoma([ ,;<]+)!<<474>>Stoma<<474>>$1!g){
				}
				if(s! stoma([ ,;<]+)! <<474>>stoma<<474>>$1!g){
				}
				if(s!Stone([ ,;<]+)!<<475>>Stone<<475>>$1!g){
				}
				if(s! stone([ ,;<]+)! <<475>>stone<<475>>$1!g){
				}
				if(s!Stones([ ,;<]+)!<<476>>Stones<<476>>$1!g){
				}
				if(s! stones([ ,;<]+)! <<476>>stones<<476>>$1!g){
				}
				if(s!Stout([ ,;<]+)!<<477>>Stout<<477>>$1!g){
				}
				if(s! stout([ ,;<]+)! <<477>>stout<<477>>$1!g){
				}
				if(s!Striate([ ,;<]+)!<<478>>Striate<<478>>$1!g){
				}
				if(s! striate([ ,;<]+)! <<478>>striate<<478>>$1!g){
				}
				if(s!Strigose([ ,;<]+)!<<479>>Strigose<<479>>$1!g){
				}
				if(s! strigose([ ,;<]+)! <<479>>strigose<<479>>$1!g){
				}
				if(s!Style([ ,;<]+)!<<480>>Style<<480>>$1!g){
				}
				if(s! style([ ,;<]+)! <<480>>style<<480>>$1!g){
				}
				if(s!Styles([ ,;<]+)!<<481>>Styles<<481>>$1!g){
				}
				if(s! styles([ ,;<]+)! <<481>>styles<<481>>$1!g){
				}
				if(s!Subalpine([ ,;<]+)!<<482>>Subalpine<<482>>$1!g){
				}
				if(s! subalpine([ ,;<]+)! <<482>>subalpine<<482>>$1!g){
				}
				if(s!Submersed([ ,;<]+)!<<483>>Submersed<<483>>$1!g){
				}
				if(s! submersed([ ,;<]+)! <<483>>submersed<<483>>$1!g){
				}
				if(s!Subshrub([ ,;<]+)!<<484>>Subshrub<<484>>$1!g){
				}
				if(s! subshrub([ ,;<]+)! <<484>>subshrub<<484>>$1!g){
				}
				if(s!Subshrubs([ ,;<]+)!<<485>>Subshrubs<<485>>$1!g){
				}
				if(s! subshrubs([ ,;<]+)! <<485>>subshrubs<<485>>$1!g){
				}
				if(s!Subtend([ ,;<]+)!<<486>>Subtend<<486>>$1!g){
				}
				if(s! subtend([ ,;<]+)! <<486>>subtend<<486>>$1!g){
				}
				if(s!Subtidal([ ,;<]+)!<<487>>Subtidal<<487>>$1!g){
				}
				if(s! subtidal([ ,;<]+)! <<487>>subtidal<<487>>$1!g){
				}
				if(s!Superior([ ,;<]+)!<<488>>Superior<<488>>$1!g){
				}
				if(s! superior([ ,;<]+)! <<488>>superior<<488>>$1!g){
				}
				if(s!Suture([ ,;<]+)!<<489>>Suture<<489>>$1!g){
				}
				if(s! suture([ ,;<]+)! <<489>>suture<<489>>$1!g){
				}
				if(s!Sutures([ ,;<]+)!<<490>>Sutures<<490>>$1!g){
				}
				if(s! sutures([ ,;<]+)! <<490>>sutures<<490>>$1!g){
				}
				if(s!Swamp([ ,;<]+)!<<491>>Swamp<<491>>$1!g){
				}
				if(s! swamp([ ,;<]+)! <<491>>swamp<<491>>$1!g){
				}
				if(s!Swamps([ ,;<]+)!<<492>>Swamps<<492>>$1!g){
				}
				if(s! swamps([ ,;<]+)! <<492>>swamps<<492>>$1!g){
				}
				if(s!Talus([ ,;<]+)!<<493>>Talus<<493>>$1!g){
				}
				if(s! talus([ ,;<]+)! <<493>>talus<<493>>$1!g){
				}
				if(s!Tapered([ ,;<]+)!<<494>>Tapered<<494>>$1!g){
				}
				if(s! tapered([ ,;<]+)! <<494>>tapered<<494>>$1!g){
				}
				if(s!Taproot([ ,;<]+)!<<495>>Taproot<<495>>$1!g){
				}
				if(s! taproot([ ,;<]+)! <<495>>taproot<<495>>$1!g){
				}
				if(s!Taproots([ ,;<]+)!<<496>>Taproots<<496>>$1!g){
				}
				if(s! taproots([ ,;<]+)! <<496>>taproots<<496>>$1!g){
				}
				if(s!Taxon([ ,;<]+)!<<497>>Taxon<<497>>$1!g){
				}
				if(s! taxon([ ,;<]+)! <<497>>taxon<<497>>$1!g){
				}
				if(s!Taxa([ ,;<]+)!<<498>>Taxa<<498>>$1!g){
				}
				if(s! taxa([ ,;<]+)! <<498>>taxa<<498>>$1!g){
				}
				if(s!Tendril([ ,;<]+)!<<499>>Tendril<<499>>$1!g){
				}
				if(s! tendril([ ,;<]+)! <<499>>tendril<<499>>$1!g){
				}
				if(s!Tendrils([ ,;<]+)!<<500>>Tendrils<<500>>$1!g){
				}
				if(s! tendrils([ ,;<]+)! <<500>>tendrils<<500>>$1!g){
				}
				if(s!Terminal([ ,;<]+)!<<501>>Terminal<<501>>$1!g){
				}
				if(s! terminal([ ,;<]+)! <<501>>terminal<<501>>$1!g){
				}
				if(s!Ternate([ ,;<]+)!<<502>>Ternate<<502>>$1!g){
				}
				if(s! ternate([ ,;<]+)! <<502>>ternate<<502>>$1!g){
				}
				if(s!Thorn([ ,;<]+)!<<503>>Thorn<<503>>$1!g){
				}
				if(s! thorn([ ,;<]+)! <<503>>thorn<<503>>$1!g){
				}
				if(s!Thorns([ ,;<]+)!<<504>>Thorns<<504>>$1!g){
				}
				if(s! thorns([ ,;<]+)! <<504>>thorns<<504>>$1!g){
				}
				if(s!Throat([ ,;<]+)!<<505>>Throat<<505>>$1!g){
				}
				if(s! throat([ ,;<]+)! <<505>>throat<<505>>$1!g){
				}
				if(s!Throats([ ,;<]+)!<<506>>Throats<<506>>$1!g){
				}
				if(s! throats([ ,;<]+)! <<506>>throats<<506>>$1!g){
				}
				if(s!Timberline([ ,;<]+)!<<507>>Timberline<<507>>$1!g){
				}
				if(s! timberline([ ,;<]+)! <<507>>timberline<<507>>$1!g){
				}
				if(s!Tomentose([ ,;<]+)!<<508>>Tomentose<<508>>$1!g){
				}
				if(s! tomentose([ ,;<]+)! <<508>>tomentose<<508>>$1!g){
				}
				if(s!Tooth([ ,;<]+)!<<509>>Tooth<<509>>$1!g){
				}
				if(s! tooth([ ,;<]+)! <<509>>tooth<<509>>$1!g){
				}
				if(s!Teeth([ ,;<]+)!<<510>>Teeth<<510>>$1!g){
				}
				if(s! teeth([ ,;<]+)! <<510>>teeth<<510>>$1!g){
				}
				if(s!Transverse([ ,;<]+)!<<511>>Transverse<<511>>$1!g){
				}
				if(s! transverse([ ,;<]+)! <<511>>transverse<<511>>$1!g){
				}
				if(s!Tree([ ,;<]+)!<<512>>Tree<<512>>$1!g){
				}
				if(s! tree([ ,;<]+)! <<512>>tree<<512>>$1!g){
				}
				if(s!Trees([ ,;<]+)!<<513>>Trees<<513>>$1!g){
				}
				if(s! trees([ ,;<]+)! <<513>>trees<<513>>$1!g){
				}
				if(s!Trilete spore([ ,;<]+)!<<514>>Trilete spore<<514>>$1!g){
				}
				if(s! trilete spore([ ,;<]+)! <<514>>trilete spore<<514>>$1!g){
				}
				if(s!Truncate([ ,;<]+)!<<515>>Truncate<<515>>$1!g){
				}
				if(s! truncate([ ,;<]+)! <<515>>truncate<<515>>$1!g){
				}
				if(s!Trophophore([ ,;<]+)!<<516>>Trophophore<<516>>$1!g){
				}
				if(s! trophophore([ ,;<]+)! <<516>>trophophore<<516>>$1!g){
				}
				if(s!Tube([ ,;<]+)!<<517>>Tube<<517>>$1!g){
				}
				if(s! tube([ ,;<]+)! <<517>>tube<<517>>$1!g){
				}
				if(s!Tubes([ ,;<]+)!<<518>>Tubes<<518>>$1!g){
				}
				if(s! tubes([ ,;<]+)! <<518>>tubes<<518>>$1!g){
				}
				if(s!Tuber([ ,;<]+)!<<519>>Tuber<<519>>$1!g){
				}
				if(s! tuber([ ,;<]+)! <<519>>tuber<<519>>$1!g){
				}
				if(s!Tubers([ ,;<]+)!<<520>>Tubers<<520>>$1!g){
				}
				if(s! tubers([ ,;<]+)! <<520>>tubers<<520>>$1!g){
				}
				if(s!Tubercle([ ,;<]+)!<<521>>Tubercle<<521>>$1!g){
				}
				if(s! tubercle([ ,;<]+)! <<521>>tubercle<<521>>$1!g){
				}
				if(s!Tubercles([ ,;<]+)!<<522>>Tubercles<<522>>$1!g){
				}
				if(s! tubercles([ ,;<]+)! <<522>>tubercles<<522>>$1!g){
				}
				if(s!Twig([ ,;<]+)!<<523>>Twig<<523>>$1!g){
				}
				if(s! twig([ ,;<]+)! <<523>>twig<<523>>$1!g){
				}
				if(s!Twigs([ ,;<]+)!<<524>>Twigs<<524>>$1!g){
				}
				if(s! twigs([ ,;<]+)! <<524>>twigs<<524>>$1!g){
				}
				if(s!Twining([ ,;<]+)!<<525>>Twining<<525>>$1!g){
				}
				if(s! twining([ ,;<]+)! <<525>>twining<<525>>$1!g){
				}
				if(s!Ultimate([ ,;<]+)!<<526>>Ultimate<<526>>$1!g){
				}
				if(s! ultimate([ ,;<]+)! <<526>>ultimate<<526>>$1!g){
				}
				if(s!Umbel([ ,;<]+)!<<527>>Umbel<<527>>$1!g){
				}
				if(s! umbel([ ,;<]+)! <<527>>umbel<<527>>$1!g){
				}
				if(s!Umbels([ ,;<]+)!<<528>>Umbels<<528>>$1!g){
				}
				if(s! umbels([ ,;<]+)! <<528>>umbels<<528>>$1!g){
				}
				if(s!Understory([ ,;<]+)!<<529>>Understory<<529>>$1!g){
				}
				if(s! understory([ ,;<]+)! <<529>>understory<<529>>$1!g){
				}
				if(s!Unisexual([ ,;<]+)!<<530>>Unisexual<<530>>$1!g){
				}
				if(s! unisexual([ ,;<]+)! <<530>>unisexual<<530>>$1!g){
				}
				if(s!Urn-shaped([ ,;<]+)!<<531>>Urn-shaped<<531>>$1!g){
				}
				if(s! urn-shaped([ ,;<]+)! <<531>>urn-shaped<<531>>$1!g){
				}
				if(s!Utricle([ ,;<]+)!<<532>>Utricle<<532>>$1!g){
				}
				if(s! utricle([ ,;<]+)! <<532>>utricle<<532>>$1!g){
				}
				if(s!Utricles([ ,;<]+)!<<533>>Utricles<<533>>$1!g){
				}
				if(s! utricles([ ,;<]+)! <<533>>utricles<<533>>$1!g){
				}
				if(s!Valve([ ,;<]+)!<<534>>Valve<<534>>$1!g){
				}
				if(s! valve([ ,;<]+)! <<534>>valve<<534>>$1!g){
				}
				if(s!Valves([ ,;<]+)!<<535>>Valves<<535>>$1!g){
				}
				if(s! valves([ ,;<]+)! <<535>>valves<<535>>$1!g){
				}
				if(s!Vascular([ ,;<]+)!<<536>>Vascular<<536>>$1!g){
				}
				if(s! vascular([ ,;<]+)! <<536>>vascular<<536>>$1!g){
				}
				if(s!Vein([ ,;<]+)!<<537>>Vein<<537>>$1!g){
				}
				if(s! vein([ ,;<]+)! <<537>>vein<<537>>$1!g){
				}
				if(s!Veins([ ,;<]+)!<<538>>Veins<<538>>$1!g){
				}
				if(s! veins([ ,;<]+)! <<538>>veins<<538>>$1!g){
				}
				if(s!Vernal pool([ ,;<]+)!<<539>>Vernal pool<<539>>$1!g){
				}
				if(s! vernal pool([ ,;<]+)! <<539>>vernal pool<<539>>$1!g){
				}
				if(s!Vernal pools([ ,;<]+)!<<540>>Vernal pools<<540>>$1!g){
				}
				if(s! vernal pools([ ,;<]+)! <<540>>vernal pools<<540>>$1!g){
				}
				if(s!Vestigial([ ,;<]+)!<<541>>Vestigial<<541>>$1!g){
				}
				if(s! vestigial([ ,;<]+)! <<541>>vestigial<<541>>$1!g){
				}
				if(s!Vine([ ,;<]+)!<<542>>Vine<<542>>$1!g){
				}
				if(s! vine([ ,;<]+)! <<542>>vine<<542>>$1!g){
				}
				if(s!Vines([ ,;<]+)!<<543>>Vines<<543>>$1!g){
				}
				if(s! vines([ ,;<]+)! <<543>>vines<<543>>$1!g){
				}
				if(s!Waif([ ,;<]+)!<<544>>Waif<<544>>$1!g){
				}
				if(s! waif([ ,;<]+)! <<544>>waif<<544>>$1!g){
				}
				if(s!Waifs([ ,;<]+)!<<545>>Waifs<<545>>$1!g){
				}
				if(s! waifs([ ,;<]+)! <<545>>waifs<<545>>$1!g){
				}
				if(s!Wash([ ,;<]+)!<<546>>Wash<<546>>$1!g){
				}
				if(s! wash([ ,;<]+)! <<546>>wash<<546>>$1!g){
				}
				if(s!Washes([ ,;<]+)!<<547>>Washes<<547>>$1!g){
				}
				if(s! washes([ ,;<]+)! <<547>>washes<<547>>$1!g){
				}
				if(s!Whorled([ ,;<]+)!<<548>>Whorled<<548>>$1!g){
				}
				if(s! whorled([ ,;<]+)! <<548>>whorled<<548>>$1!g){
				}
				if(s!Whorl([ ,;<]+)!<<549>>Whorl<<549>>$1!g){
				}
				if(s! whorl([ ,;<]+)! <<549>>whorl<<549>>$1!g){
				}
				if(s!Wing([ ,;<]+)!<<550>>Wing<<550>>$1!g){
				}
				if(s! wing([ ,;<]+)! <<550>>wing<<550>>$1!g){
				}
				if(s!Wings([ ,;<]+)!<<551>>Wings<<551>>$1!g){
				}
				if(s! wings([ ,;<]+)! <<551>>wings<<551>>$1!g){
				}
				if(s!Wiry([ ,;<]+)!<<552>>Wiry<<552>>$1!g){
				}
				if(s! wiry([ ,;<]+)! <<552>>wiry<<552>>$1!g){
				}
				if(s!Wood([ ,;<]+)!<<553>>Wood<<553>>$1!g){
				}
				if(s! wood([ ,;<]+)! <<553>>wood<<553>>$1!g){
				}
				if(s!Woody([ ,;<]+)!<<554>>Woody<<554>>$1!g){
				}
				if(s! woody([ ,;<]+)! <<554>>woody<<554>>$1!g){
				}
				if(s!Woodland([ ,;<]+)!<<555>>Woodland<<555>>$1!g){
				}
				if(s! woodland([ ,;<]+)! <<555>>woodland<<555>>$1!g){
				}
				if(s!Woodlands([ ,;<]+)!<<556>>Woodlands<<556>>$1!g){
				}
				if(s! woodlands([ ,;<]+)! <<556>>woodlands<<556>>$1!g){
				}
		print OUT $_." ";


}
close(IN);
close(OUT);

