	
$file="input/eflora_family_key.txt";

$file_expanded="output/eflora_family_key_expanded.txt";

open(OUT, ">", $file_expanded) || die;

open(IN,$file) || die "couldn't open $file\n";
warn "reading from $file\n";

	while(<IN>){

	if (!/#.+\n/){
		if (!/TJMX AUTHOR:.+\n/){
			if (!/Group \d\d?:.+\n/){
				if (!/KEY_PAR:.+\n/){
					if (!/SCI_ED:.+\n/){

				if(s!Abaxial([ ,;<]+)!<<1>>Abaxial<<1>>$1!){
				}
				if(s! abaxial([ ,;<\v]+)! <<1>>abaxial<<1>>$1!){
				}
				if(s!Achene([ ,;<]+)!<<2>>Achene<<2>>$1!){
				}
				if(s! achene([ ,;<\v]+)! <<2>>achene<<2>>$1!){
				}
				if(s!Achenes([ ,;<]+)!<<3>>Achenes<<3>>$1!){
				}
				if(s! achenes([ ,;<\v]+)! <<3>>achenes<<3>>$1!){
				}
				if(s!Acidic([ ,;<]+)!<<4>>Acidic<<4>>$1!){
				}
				if(s! acidic([ ,;<\v]+)! <<4>>acidic<<4>>$1!){
				}
				if(s!Acuminate([ ,;<]+)!<<5>>Acuminate<<5>>$1!){
				}
				if(s! acuminate([ ,;<\v]+)! <<5>>acuminate<<5>>$1!){
				}
				if(s!Acute([ ,;<]+)!<<6>>Acute<<6>>$1!){
				}
				if(s! acute([ ,;<\v]+)! <<6>>acute<<6>>$1!){
				}
				if(s!Adaxial([ ,;<]+)!<<7>>Adaxial<<7>>$1!){
				}
				if(s! adaxial([ ,;<\v]+)! <<7>>adaxial<<7>>$1!){
				}
				if(s!Adherent([ ,;<]+)!<<8>>Adherent<<8>>$1!){
				}
				if(s! adherent([ ,;<\v]+)! <<8>>adherent<<8>>$1!){
				}
				if(s!Adventitious([ ,;<]+)!<<9>>Adventitious<<9>>$1!){
				}
				if(s! adventitious([ ,;<\v]+)! <<9>>adventitious<<9>>$1!){
				}
				if(s!Alien([ ,;<]+)!<<10>>Alien<<10>>$1!){
				}
				if(s! alien([ ,;<\v]+)! <<10>>alien<<10>>$1!){
				}
				if(s!Alkali([ ,;<]+)!<<11>>Alkali<<11>>$1!){
				}
				if(s! alkali([ ,;<\v]+)! <<11>>alkali<<11>>$1!){
				}
				if(s!Alkaline([ ,;<]+)!<<12>>Alkaline<<12>>$1!){
				}
				if(s! alkaline([ ,;<\v]+)! <<12>>alkaline<<12>>$1!){
				}
				if(s!Alluvial([ ,;<]+)!<<13>>Alluvial<<13>>$1!){
				}
				if(s! alluvial([ ,;<\v]+)! <<13>>alluvial<<13>>$1!){
				}
				if(s!Alpine([ ,;<]+)!<<14>>Alpine<<14>>$1!){
				}
				if(s! alpine([ ,;<\v]+)! <<14>>alpine<<14>>$1!){
				}
				if(s!Alternate([ ,;<]+)!<<15>>Alternate<<15>>$1!){
				}
				if(s! alternate([ ,;<\v]+)! <<15>>alternate<<15>>$1!){
				}
				if(s!Angiosperm([ ,;<]+)!<<16>>Angiosperm<<16>>$1!){
				}
				if(s! angiosperm([ ,;<\v]+)! <<16>>angiosperm<<16>>$1!){
				}
				if(s!Angiosperms([ ,;<]+)!<<17>>Angiosperms<<17>>$1!){
				}
				if(s! angiosperms([ ,;<\v]+)! <<17>>angiosperms<<17>>$1!){
				}
				if(s!Annual([ ,;<]+)!<<18>>Annual<<18>>$1!){
				}
				if(s! annual([ ,;<\v]+)! <<18>>annual<<18>>$1!){
				}
				if(s!Annulus([ ,;<]+)!<<19>>Annulus<<19>>$1!){
				}
				if(s! annulus([ ,;<\v]+)! <<19>>annulus<<19>>$1!){
				}
				if(s!Annuli([ ,;<]+)!<<20>>Annuli<<20>>$1!){
				}
				if(s! annuli([ ,;<\v]+)! <<20>>annuli<<20>>$1!){
				}
				if(s!Anther([ ,;<]+)!<<21>>Anther<<21>>$1!){
				}
				if(s! anther([ ,;<\v]+)! <<21>>anther<<21>>$1!){
				}
				if(s!Anthers([ ,;<]+)!<<22>>Anthers<<22>>$1!){
				}
				if(s! anthers([ ,;<\v]+)! <<22>>anthers<<22>>$1!){
				}
				if(s!Appressed([ ,;<]+)!<<23>>Appressed<<23>>$1!){
				}
				if(s! appressed([ ,;<\v]+)! <<23>>appressed<<23>>$1!){
				}
				if(s!Apogamous([ ,;<]+)!<<24>>Apogamous<<24>>$1!){
				}
				if(s! apogamous([ ,;<\v]+)! <<24>>apogamous<<24>>$1!){
				}
				if(s!Aquatic([ ,;<]+)!<<25>>Aquatic<<25>>$1!){
				}
				if(s! aquatic([ ,;<\v]+)! <<25>>aquatic<<25>>$1!){
				}
				if(s!Areole([ ,;<]+)!<<26>>Areole<<26>>$1!){
				}
				if(s! areole([ ,;<\v]+)! <<26>>areole<<26>>$1!){
				}
				if(s!Areoles([ ,;<]+)!<<27>>Areoles<<27>>$1!){
				}
				if(s! areoles([ ,;<\v]+)! <<27>>areoles<<27>>$1!){
				}
				if(s!Aril([ ,;<]+)!<<28>>Aril<<28>>$1!){
				}
				if(s! aril([ ,;<\v]+)! <<28>>aril<<28>>$1!){
				}
				if(s!Arils([ ,;<]+)!<<29>>Arils<<29>>$1!){
				}
				if(s! arils([ ,;<\v]+)! <<29>>arils<<29>>$1!){
				}
				if(s!Armed([ ,;<]+)!<<30>>Armed<<30>>$1!){
				}
				if(s! armed([ ,;<\v]+)! <<30>>armed<<30>>$1!){
				}
				if(s!Ascending([ ,;<]+)!<<31>>Ascending<<31>>$1!){
				}
				if(s! ascending([ ,;<\v]+)! <<31>>ascending<<31>>$1!){
				}
				if(s!Asymmetric([ ,;<]+)!<<32>>Asymmetric<<32>>$1!){
				}
				if(s! asymmetric([ ,;<\v]+)! <<32>>asymmetric<<32>>$1!){
				}
				if(s!Auricle([ ,;<]+)!<<33>>Auricle<<33>>$1!){
				}
				if(s! auricle([ ,;<\v]+)! <<33>>auricle<<33>>$1!){
				}
				if(s!Auricles([ ,;<]+)!<<34>>Auricles<<34>>$1!){
				}
				if(s! auricles([ ,;<\v]+)! <<34>>auricles<<34>>$1!){
				}
				if(s!Awn([ ,;<]+)!<<35>>Awn<<35>>$1!){
				}
				if(s! awn([ ,;<\v]+)! <<35>>awn<<35>>$1!){
				}
				if(s!Awns([ ,;<]+)!<<36>>Awns<<36>>$1!){
				}
				if(s! awns([ ,;<\v]+)! <<36>>awns<<36>>$1!){
				}
				if(s!Axil([ ,;<]+)!<<37>>Axil<<37>>$1!){
				}
				if(s! axil([ ,;<\v]+)! <<37>>axil<<37>>$1!){
				}
				if(s!Axils([ ,;<]+)!<<38>>Axils<<38>>$1!){
				}
				if(s! axils([ ,;<\v]+)! <<38>>axils<<38>>$1!){
				}
				if(s!Axile([ ,;<]+)!<<39>>Axile<<39>>$1!){
				}
				if(s! axile([ ,;<\v]+)! <<39>>axile<<39>>$1!){
				}
				if(s!Axillary([ ,;<]+)!<<40>>Axillary<<40>>$1!){
				}
				if(s! axillary([ ,;<\v]+)! <<40>>axillary<<40>>$1!){
				}
				if(s!Axis([ ,;<]+)!<<41>>Axis<<41>>$1!){
				}
				if(s! axis([ ,;<\v]+)! <<41>>axis<<41>>$1!){
				}
				if(s!Axes([ ,;<]+)!<<42>>Axes<<42>>$1!){
				}
				if(s! axes([ ,;<\v]+)! <<42>>axes<<42>>$1!){
				}
				if(s!Banner([ ,;<]+)!<<43>>Banner<<43>>$1!){
				}
				if(s! banner([ ,;<\v]+)! <<43>>banner<<43>>$1!){
				}
				if(s!Barbed([ ,;<]+)!<<44>>Barbed<<44>>$1!){
				}
				if(s! barbed([ ,;<\v]+)! <<44>>barbed<<44>>$1!){
				}
				if(s!Bark([ ,;<]+)!<<45>>Bark<<45>>$1!){
				}
				if(s! bark([ ,;<\v]+)! <<45>>bark<<45>>$1!){
				}
				if(s!Basal([ ,;<]+)!<<46>>Basal<<46>>$1!){
				}
				if(s! basal([ ,;<\v]+)! <<46>>basal<<46>>$1!){
				}
				if(s!Beak([ ,;<]+)!<<47>>Beak<<47>>$1!){
				}
				if(s! beak([ ,;<\v]+)! <<47>>beak<<47>>$1!){
				}
				if(s!Beaks([ ,;<]+)!<<48>>Beaks<<48>>$1!){
				}
				if(s! beaks([ ,;<\v]+)! <<48>>beaks<<48>>$1!){
				}
				if(s!Berry([ ,;<]+)!<<49>>Berry<<49>>$1!){
				}
				if(s! berry([ ,;<\v]+)! <<49>>berry<<49>>$1!){
				}
				if(s!Biennial([ ,;<]+)!<<50>>Biennial<<50>>$1!){
				}
				if(s! biennial([ ,;<\v]+)! <<50>>biennial<<50>>$1!){
				}
				if(s!Bilateral([ ,;<]+)!<<51>>Bilateral<<51>>$1!){
				}
				if(s! bilateral([ ,;<\v]+)! <<51>>bilateral<<51>>$1!){
				}
				if(s!Biradial([ ,;<]+)!<<52>>Biradial<<52>>$1!){
				}
				if(s! biradial([ ,;<\v]+)! <<52>>biradial<<52>>$1!){
				}
				if(s!Bisexual([ ,;<]+)!<<53>>Bisexual<<53>>$1!){
				}
				if(s! bisexual([ ,;<\v]+)! <<53>>bisexual<<53>>$1!){
				}
				if(s!Blade([ ,;<]+)!<<54>>Blade<<54>>$1!){
				}
				if(s! blade([ ,;<\v]+)! <<54>>blade<<54>>$1!){
				}
				if(s!Blades([ ,;<]+)!<<55>>Blades<<55>>$1!){
				}
				if(s! blades([ ,;<\v]+)! <<55>>blades<<55>>$1!){
				}
				if(s!Brackish([ ,;<]+)!<<56>>Brackish<<56>>$1!){
				}
				if(s! brackish([ ,;<\v]+)! <<56>>brackish<<56>>$1!){
				}
				if(s!Bract([ ,;<]+)!<<57>>Bract<<57>>$1!){
				}
				if(s! bract([ ,;<\v]+)! <<57>>bract<<57>>$1!){
				}
				if(s!Bracts([ ,;<]+)!<<58>>Bracts<<58>>$1!){
				}
				if(s! bracts([ ,;<\v]+)! <<58>>bracts<<58>>$1!){
				}
				if(s!Bractlet([ ,;<]+)!<<59>>Bractlet<<59>>$1!){
				}
				if(s! bractlet([ ,;<\v]+)! <<59>>bractlet<<59>>$1!){
				}
				if(s!Bractlets([ ,;<]+)!<<60>>Bractlets<<60>>$1!){
				}
				if(s! bractlets([ ,;<\v]+)! <<60>>bractlets<<60>>$1!){
				}
				if(s!Bristle([ ,;<]+)!<<61>>Bristle<<61>>$1!){
				}
				if(s! bristle([ ,;<\v]+)! <<61>>bristle<<61>>$1!){
				}
				if(s!Bristles([ ,;<]+)!<<62>>Bristles<<62>>$1!){
				}
				if(s! bristles([ ,;<\v]+)! <<62>>bristles<<62>>$1!){
				}
				if(s!Bud([ ,;<]+)!<<63>>Bud<<63>>$1!){
				}
				if(s! bud([ ,;<\v]+)! <<63>>bud<<63>>$1!){
				}
				if(s!Buds([ ,;<]+)!<<64>>Buds<<64>>$1!){
				}
				if(s! buds([ ,;<\v]+)! <<64>>buds<<64>>$1!){
				}
				if(s!Bulb([ ,;<]+)!<<65>>Bulb<<65>>$1!){
				}
				if(s! bulb([ ,;<\v]+)! <<65>>bulb<<65>>$1!){
				}
				if(s!Bulbs([ ,;<]+)!<<66>>Bulbs<<66>>$1!){
				}
				if(s! bulbs([ ,;<\v]+)! <<66>>bulbs<<66>>$1!){
				}
				if(s!Bulblet([ ,;<]+)!<<67>>Bulblet<<67>>$1!){
				}
				if(s! bulblet([ ,;<\v]+)! <<67>>bulblet<<67>>$1!){
				}
				if(s!Bulblets([ ,;<]+)!<<68>>Bulblets<<68>>$1!){
				}
				if(s! bulblets([ ,;<\v]+)! <<68>>bulblets<<68>>$1!){
				}
				if(s!Bur([ ,;<]+)!<<69>>Bur<<69>>$1!){
				}
				if(s! bur([ ,;<\v]+)! <<69>>bur<<69>>$1!){
				}
				if(s!Callus([ ,;<]+)!<<70>>Callus<<70>>$1!){
				}
				if(s! callus([ ,;<\v]+)! <<70>>callus<<70>>$1!){
				}
				if(s!Calyx([ ,;<]+)!<<71>>Calyx<<71>>$1!){
				}
				if(s! calyx([ ,;<\v]+)! <<71>>calyx<<71>>$1!){
				}
				if(s!Canescent([ ,;<]+)!<<72>>Canescent<<72>>$1!){
				}
				if(s! canescent([ ,;<\v]+)! <<72>>canescent<<72>>$1!){
				}
				if(s!Capsule([ ,;<]+)!<<73>>Capsule<<73>>$1!){
				}
				if(s! capsule([ ,;<\v]+)! <<73>>capsule<<73>>$1!){
				}
				if(s!Capsules([ ,;<]+)!<<74>>Capsules<<74>>$1!){
				}
				if(s! capsules([ ,;<\v]+)! <<74>>capsules<<74>>$1!){
				}
				if(s!Carpel([ ,;<]+)!<<75>>Carpel<<75>>$1!){
				}
				if(s! carpel([ ,;<\v]+)! <<75>>carpel<<75>>$1!){
				}
				if(s!Carpels([ ,;<]+)!<<76>>Carpels<<76>>$1!){
				}
				if(s! carpels([ ,;<\v]+)! <<76>>carpels<<76>>$1!){
				}
				if(s!Cartilaginous([ ,;<]+)!<<77>>Cartilaginous<<77>>$1!){
				}
				if(s! cartilaginous([ ,;<\v]+)! <<77>>cartilaginous<<77>>$1!){
				}
				if(s!Catkin([ ,;<]+)!<<78>>Catkin<<78>>$1!){
				}
				if(s! catkin([ ,;<\v]+)! <<78>>catkin<<78>>$1!){
				}
				if(s!Catkins([ ,;<]+)!<<79>>Catkins<<79>>$1!){
				}
				if(s! catkins([ ,;<\v]+)! <<79>>catkins<<79>>$1!){
				}
				if(s!Caudex([ ,;<]+)!<<80>>Caudex<<80>>$1!){
				}
				if(s! caudex([ ,;<\v]+)! <<80>>caudex<<80>>$1!){
				}
				if(s!Caudices([ ,;<]+)!<<81>>Caudices<<81>>$1!){
				}
				if(s! caudices([ ,;<\v]+)! <<81>>caudices<<81>>$1!){
				}
				if(s!Cauline([ ,;<]+)!<<82>>Cauline<<82>>$1!){
				}
				if(s! cauline([ ,;<\v]+)! <<82>>cauline<<82>>$1!){
				}
				if(s!Cespitose([ ,;<]+)!<<83>>Cespitose<<83>>$1!){
				}
				if(s! cespitose([ ,;<\v]+)! <<83>>cespitose<<83>>$1!){
				}
				if(s!Chamber([ ,;<]+)!<<84>>Chamber<<84>>$1!){
				}
				if(s! chamber([ ,;<\v]+)! <<84>>chamber<<84>>$1!){
				}
				if(s!Chambers([ ,;<]+)!<<85>>Chambers<<85>>$1!){
				}
				if(s! chambers([ ,;<\v]+)! <<85>>chambers<<85>>$1!){
				}
				if(s!Chaparral([ ,;<]+)!<<86>>Chaparral<<86>>$1!){
				}
				if(s! chaparral([ ,;<\v]+)! <<86>>chaparral<<86>>$1!){
				}
				if(s!Ciliate([ ,;<]+)!<<87>>Ciliate<<87>>$1!){
				}
				if(s! ciliate([ ,;<\v]+)! <<87>>ciliate<<87>>$1!){
				}
				if(s!Circumboreal([ ,;<]+)!<<88>>Circumboreal<<88>>$1!){
				}
				if(s! circumboreal([ ,;<\v]+)! <<88>>circumboreal<<88>>$1!){
				}
				if(s!Circumscissile([ ,;<]+)!<<89>>Circumscissile<<89>>$1!){
				}
				if(s! circumscissile([ ,;<\v]+)! <<89>>circumscissile<<89>>$1!){
				}
				if(s!Claw([ ,;<]+)!<<90>>Claw<<90>>$1!){
				}
				if(s! claw([ ,;<\v]+)! <<90>>claw<<90>>$1!){
				}
				if(s!Claws([ ,;<]+)!<<91>>Claws<<91>>$1!){
				}
				if(s! claws([ ,;<\v]+)! <<91>>claws<<91>>$1!){
				}
				if(s!Cleistogamous([ ,;<]+)!<<92>>Cleistogamous<<92>>$1!){
				}
				if(s! cleistogamous([ ,;<\v]+)! <<92>>cleistogamous<<92>>$1!){
				}
				if(s!Clone([ ,;<]+)!<<93>>Clone<<93>>$1!){
				}
				if(s! clone([ ,;<\v]+)! <<93>>clone<<93>>$1!){
				}
				if(s!Clones([ ,;<]+)!<<94>>Clones<<94>>$1!){
				}
				if(s! clones([ ,;<\v]+)! <<94>>clones<<94>>$1!){
				}
				if(s!Closed-cone forest([ ,;<]+)!<<95>>Closed-cone forest<<95>>$1!){
				}
				if(s! closed-cone forest([ ,;<\v]+)! <<95>>closed-cone forest<<95>>$1!){
				}
				if(s!Coastal redwood([ ,;<]+)!<<96>>Coastal redwood<<96>>$1!){
				}
				if(s! coastal redwood([ ,;<\v]+)! <<96>>coastal redwood<<96>>$1!){
				}
				if(s!Coastal scrub([ ,;<]+)!<<97>>Coastal scrub<<97>>$1!){
				}
				if(s! coastal scrub([ ,;<\v]+)! <<97>>coastal scrub<<97>>$1!){
				}
				if(s!Coastal strand([ ,;<]+)!<<98>>Coastal strand<<98>>$1!){
				}
				if(s! coastal strand([ ,;<\v]+)! <<98>>coastal strand<<98>>$1!){
				}
				if(s!Collar([ ,;<]+)!<<99>>Collar<<99>>$1!){
				}
				if(s! collar([ ,;<\v]+)! <<99>>collar<<99>>$1!){
				}
				if(s!Collars([ ,;<]+)!<<100>>Collars<<100>>$1!){
				}
				if(s! collars([ ,;<\v]+)! <<100>>collars<<100>>$1!){
				}
				if(s!Column([ ,;<]+)!<<101>>Column<<101>>$1!){
				}
				if(s! column([ ,;<\v]+)! <<101>>column<<101>>$1!){
				}
				if(s!Columns([ ,;<]+)!<<102>>Columns<<102>>$1!){
				}
				if(s! columns([ ,;<\v]+)! <<102>>columns<<102>>$1!){
				}
				if(s!Compound([ ,;<]+)!<<103>>Compound<<103>>$1!){
				}
				if(s! compound([ ,;<\v]+)! <<103>>compound<<103>>$1!){
				}
				if(s!Compressed([ ,;<]+)!<<104>>Compressed<<104>>$1!){
				}
				if(s! compressed([ ,;<\v]+)! <<104>>compressed<<104>>$1!){
				}
				if(s!Concave([ ,;<]+)!<<105>>Concave<<105>>$1!){
				}
				if(s! concave([ ,;<\v]+)! <<105>>concave<<105>>$1!){
				}
				if(s!Cone([ ,;<]+)!<<106>>Cone<<106>>$1!){
				}
				if(s! cone([ ,;<\v]+)! <<106>>cone<<106>>$1!){
				}
				if(s!Cones([ ,;<]+)!<<107>>Cones<<107>>$1!){
				}
				if(s! cones([ ,;<\v]+)! <<107>>cones<<107>>$1!){
				}
				if(s!Conic([ ,;<]+)!<<108>>Conic<<108>>$1!){
				}
				if(s! conic([ ,;<\v]+)! <<108>>conic<<108>>$1!){
				}
				if(s!Coniferous forest([ ,;<]+)!<<109>>Coniferous forest<<109>>$1!){
				}
				if(s! coniferous forest([ ,;<\v]+)! <<109>>coniferous forest<<109>>$1!){
				}
				if(s!Continuous([ ,;<]+)!<<110>>Continuous<<110>>$1!){
				}
				if(s! continuous([ ,;<\v]+)! <<110>>continuous<<110>>$1!){
				}
				if(s!Convex([ ,;<]+)!<<111>>Convex<<111>>$1!){
				}
				if(s! convex([ ,;<\v]+)! <<111>>convex<<111>>$1!){
				}
				if(s!Cordate([ ,;<]+)!<<112>>Cordate<<112>>$1!){
				}
				if(s! cordate([ ,;<\v]+)! <<112>>cordate<<112>>$1!){
				}
				if(s!Corm([ ,;<]+)!<<113>>Corm<<113>>$1!){
				}
				if(s! corm([ ,;<\v]+)! <<113>>corm<<113>>$1!){
				}
				if(s!Corms([ ,;<]+)!<<114>>Corms<<114>>$1!){
				}
				if(s! corms([ ,;<\v]+)! <<114>>corms<<114>>$1!){
				}
				if(s!Corolla([ ,;<]+)!<<115>>Corolla<<115>>$1!){
				}
				if(s! corolla([ ,;<\v]+)! <<115>>corolla<<115>>$1!){
				}
				if(s!Corollas([ ,;<]+)!<<116>>Corollas<<116>>$1!){
				}
				if(s! corollas([ ,;<\v]+)! <<116>>corollas<<116>>$1!){
				}
				if(s!Costa([ ,;<]+)!<<117>>Costa<<117>>$1!){
				}
				if(s! costa([ ,;<\v]+)! <<117>>costa<<117>>$1!){
				}
				if(s!Costule([ ,;<]+)!<<118>>Costule<<118>>$1!){
				}
				if(s! costule([ ,;<\v]+)! <<118>>costule<<118>>$1!){
				}
				if(s!Costulet([ ,;<]+)!<<119>>Costulet<<119>>$1!){
				}
				if(s! costulet([ ,;<\v]+)! <<119>>costulet<<119>>$1!){
				}
				if(s!Cotyledon([ ,;<]+)!<<120>>Cotyledon<<120>>$1!){
				}
				if(s! cotyledon([ ,;<\v]+)! <<120>>cotyledon<<120>>$1!){
				}
				if(s!Cotyledons([ ,;<]+)!<<121>>Cotyledons<<121>>$1!){
				}
				if(s! cotyledons([ ,;<\v]+)! <<121>>cotyledons<<121>>$1!){
				}
				if(s!Crenate([ ,;<]+)!<<122>>Crenate<<122>>$1!){
				}
				if(s! crenate([ ,;<\v]+)! <<122>>crenate<<122>>$1!){
				}
				if(s!Cylindric([ ,;<]+)!<<123>>Cylindric<<123>>$1!){
				}
				if(s! cylindric([ ,;<\v]+)! <<123>>cylindric<<123>>$1!){
				}
				if(s!Cyme([ ,;<]+)!<<124>>Cyme<<124>>$1!){
				}
				if(s! cyme([ ,;<\v]+)! <<124>>cyme<<124>>$1!){
				}
				if(s!Cymes([ ,;<]+)!<<125>>Cymes<<125>>$1!){
				}
				if(s! cymes([ ,;<\v]+)! <<125>>cymes<<125>>$1!){
				}
				if(s!Deciduous([ ,;<]+)!<<126>>Deciduous<<126>>$1!){
				}
				if(s! deciduous([ ,;<\v]+)! <<126>>deciduous<<126>>$1!){
				}
				if(s!Decumbent([ ,;<]+)!<<127>>Decumbent<<127>>$1!){
				}
				if(s! decumbent([ ,;<\v]+)! <<127>>decumbent<<127>>$1!){
				}
				if(s!Decurrent([ ,;<]+)!<<128>>Decurrent<<128>>$1!){
				}
				if(s! decurrent([ ,;<\v]+)! <<128>>decurrent<<128>>$1!){
				}
				if(s!Dehiscent([ ,;<]+)!<<129>>Dehiscent<<129>>$1!){
				}
				if(s! dehiscent([ ,;<\v]+)! <<129>>dehiscent<<129>>$1!){
				}
				if(s!Deltate([ ,;<]+)!<<130>>Deltate<<130>>$1!){
				}
				if(s! deltate([ ,;<\v]+)! <<130>>deltate<<130>>$1!){
				}
				if(s!Dense([ ,;<]+)!<<131>>Dense<<131>>$1!){
				}
				if(s! dense([ ,;<\v]+)! <<131>>dense<<131>>$1!){
				}
				if(s!Dentate([ ,;<]+)!<<132>>Dentate<<132>>$1!){
				}
				if(s! dentate([ ,;<\v]+)! <<132>>dentate<<132>>$1!){
				}
				if(s!Depressed([ ,;<]+)!<<133>>Depressed<<133>>$1!){
				}
				if(s! depressed([ ,;<\v]+)! <<133>>depressed<<133>>$1!){
				}
				if(s!Desert([ ,;<]+)!<<134>>Desert<<134>>$1!){
				}
				if(s! desert([ ,;<\v]+)! <<134>>desert<<134>>$1!){
				}
				if(s!Dioecious([ ,;<]+)!<<135>>Dioecious<<135>>$1!){
				}
				if(s! dioecious([ ,;<\v]+)! <<135>>dioecious<<135>>$1!){
				}
				if(s!Digitate([ ,;<]+)!<<136>>Digitate<<136>>$1!){
				}
				if(s! digitate([ ,;<\v]+)! <<136>>digitate<<136>>$1!){
				}
				if(s!Diploid([ ,;<]+)!<<137>>Diploid<<137>>$1!){
				}
				if(s! diploid([ ,;<\v]+)! <<137>>diploid<<137>>$1!){
				}
				if(s!Disciform head([ ,;<]+)!<<138>>Disciform head<<138>>$1!){
				}
				if(s! disciform head([ ,;<\v]+)! <<138>>disciform head<<138>>$1!){
				}
				if(s!Discoid head([ ,;<]+)!<<139>>Discoid head<<139>>$1!){
				}
				if(s! discoid head([ ,;<\v]+)! <<139>>discoid head<<139>>$1!){
				}
				if(s!Disk flower([ ,;<]+)!<<140>>Disk flower<<140>>$1!){
				}
				if(s! disk flower([ ,;<\v]+)! <<140>>disk flower<<140>>$1!){
				}
				if(s!Disk flowers([ ,;<]+)!<<141>>Disk flowers<<141>>$1!){
				}
				if(s! disk flowers([ ,;<\v]+)! <<141>>disk flowers<<141>>$1!){
				}
				if(s!Dissected([ ,;<]+)!<<142>>Dissected<<142>>$1!){
				}
				if(s! dissected([ ,;<\v]+)! <<142>>dissected<<142>>$1!){
				}
				if(s!Distal([ ,;<]+)!<<143>>Distal<<143>>$1!){
				}
				if(s! distal([ ,;<\v]+)! <<143>>distal<<143>>$1!){
				}
				if(s!Distally([ ,;<]+)!<<144>>Distally<<144>>$1!){
				}
				if(s! distally([ ,;<\v]+)! <<144>>distally<<144>>$1!){
				}
				if(s!Drupe([ ,;<]+)!<<145>>Drupe<<145>>$1!){
				}
				if(s! drupe([ ,;<\v]+)! <<145>>drupe<<145>>$1!){
				}
				if(s!Drupes([ ,;<]+)!<<146>>Drupes<<146>>$1!){
				}
				if(s! drupes([ ,;<\v]+)! <<146>>drupes<<146>>$1!){
				}
				if(s!Dune([ ,;<]+)!<<147>>Dune<<147>>$1!){
				}
				if(s! dune([ ,;<\v]+)! <<147>>dune<<147>>$1!){
				}
				if(s!Dunes([ ,;<]+)!<<148>>Dunes<<148>>$1!){
				}
				if(s! dunes([ ,;<\v]+)! <<148>>dunes<<148>>$1!){
				}
				if(s!Elliptic([ ,;<]+)!<<149>>Elliptic<<149>>$1!){
				}
				if(s! elliptic([ ,;<\v]+)! <<149>>elliptic<<149>>$1!){
				}
				if(s!Emergent([ ,;<]+)!<<150>>Emergent<<150>>$1!){
				}
				if(s! emergent([ ,;<\v]+)! <<150>>emergent<<150>>$1!){
				}
				if(s!Endemic([ ,;<]+)!<<151>>Endemic<<151>>$1!){
				}
				if(s! endemic([ ,;<\v]+)! <<151>>endemic<<151>>$1!){
				}
				if(s!Entire([ ,;<]+)!<<152>>Entire<<152>>$1!){
				}
				if(s! entire([ ,;<\v]+)! <<152>>entire<<152>>$1!){
				}
				if(s!Ephemeral([ ,;<]+)!<<153>>Ephemeral<<153>>$1!){
				}
				if(s! ephemeral([ ,;<\v]+)! <<153>>ephemeral<<153>>$1!){
				}
				if(s!Epidermis([ ,;<]+)!<<154>>Epidermis<<154>>$1!){
				}
				if(s! epidermis([ ,;<\v]+)! <<154>>epidermis<<154>>$1!){
				}
				if(s!Epipetalous([ ,;<]+)!<<155>>Epipetalous<<155>>$1!){
				}
				if(s! epipetalous([ ,;<\v]+)! <<155>>epipetalous<<155>>$1!){
				}
				if(s!Erect([ ,;<]+)!<<156>>Erect<<156>>$1!){
				}
				if(s! erect([ ,;<\v]+)! <<156>>erect<<156>>$1!){
				}
				if(s!Estuarine([ ,;<]+)!<<157>>Estuarine<<157>>$1!){
				}
				if(s! estuarine([ ,;<\v]+)! <<157>>estuarine<<157>>$1!){
				}
				if(s!Evergreen([ ,;<]+)!<<158>>Evergreen<<158>>$1!){
				}
				if(s! evergreen([ ,;<\v]+)! <<158>>evergreen<<158>>$1!){
				}
				if(s!Exceeding([ ,;<]+)!<<159>>Exceeding<<159>>$1!){
				}
				if(s! exceeding([ ,;<\v]+)! <<159>>exceeding<<159>>$1!){
				}
				if(s!Exserted([ ,;<]+)!<<160>>Exserted<<160>>$1!){
				}
				if(s! exserted([ ,;<\v]+)! <<160>>exserted<<160>>$1!){
				}
				if(s!Extant([ ,;<]+)!<<161>>Extant<<161>>$1!){
				}
				if(s! extant([ ,;<\v]+)! <<161>>extant<<161>>$1!){
				}
				if(s!Extinct([ ,;<]+)!<<162>>Extinct<<162>>$1!){
				}
				if(s! extinct([ ,;<\v]+)! <<162>>extinct<<162>>$1!){
				}
				if(s!Extirpated([ ,;<]+)!<<163>>Extirpated<<163>>$1!){
				}
				if(s! extirpated([ ,;<\v]+)! <<163>>extirpated<<163>>$1!){
				}
				if(s!Exudate([ ,;<]+)!<<164>>Exudate<<164>>$1!){
				}
				if(s! exudate([ ,;<\v]+)! <<164>>exudate<<164>>$1!){
				}
				if(s!Fertile([ ,;<]+)!<<165>>Fertile<<165>>$1!){
				}
				if(s! fertile([ ,;<\v]+)! <<165>>fertile<<165>>$1!){
				}
				if(s!Fibrous([ ,;<]+)!<<166>>Fibrous<<166>>$1!){
				}
				if(s! fibrous([ ,;<\v]+)! <<166>>fibrous<<166>>$1!){
				}
				if(s!Filament([ ,;<]+)!<<167>>Filament<<167>>$1!){
				}
				if(s! filament([ ,;<\v]+)! <<167>>filament<<167>>$1!){
				}
				if(s!Filaments([ ,;<]+)!<<168>>Filaments<<168>>$1!){
				}
				if(s! filaments([ ,;<\v]+)! <<168>>filaments<<168>>$1!){
				}
				if(s!Fleshy([ ,;<]+)!<<169>>Fleshy<<169>>$1!){
				}
				if(s! fleshy([ ,;<\v]+)! <<169>>fleshy<<169>>$1!){
				}
				if(s!Floret([ ,;<]+)!<<170>>Floret<<170>>$1!){
				}
				if(s! floret([ ,;<\v]+)! <<170>>floret<<170>>$1!){
				}
				if(s!Florets([ ,;<]+)!<<171>>Florets<<171>>$1!){
				}
				if(s! florets([ ,;<\v]+)! <<171>>florets<<171>>$1!){
				}
				if(s!Follicle([ ,;<]+)!<<172>>Follicle<<172>>$1!){
				}
				if(s! follicle([ ,;<\v]+)! <<172>>follicle<<172>>$1!){
				}
				if(s!Follicles([ ,;<]+)!<<173>>Follicles<<173>>$1!){
				}
				if(s! follicles([ ,;<\v]+)! <<173>>follicles<<173>>$1!){
				}
				if(s!Foothill([ ,;<]+)!<<174>>Foothill<<174>>$1!){
				}
				if(s! foothill([ ,;<\v]+)! <<174>>foothill<<174>>$1!){
				}
				if(s!Foothills([ ,;<]+)!<<175>>Foothills<<175>>$1!){
				}
				if(s! foothills([ ,;<\v]+)! <<175>>foothills<<175>>$1!){
				}
				if(s!Forked([ ,;<]+)!<<176>>Forked<<176>>$1!){
				}
				if(s! forked([ ,;<\v]+)! <<176>>forked<<176>>$1!){
				}
				if(s!Free([ ,;<]+)!<<177>>Free<<177>>$1!){
				}
				if(s! free([ ,;<\v]+)! <<177>>free<<177>>$1!){
				}
				if(s!Free-central([ ,;<]+)!<<178>>Free-central<<178>>$1!){
				}
				if(s! free-central([ ,;<\v]+)! <<178>>free-central<<178>>$1!){
				}
				if(s!Fringed([ ,;<]+)!<<179>>Fringed<<179>>$1!){
				}
				if(s! fringed([ ,;<\v]+)! <<179>>fringed<<179>>$1!){
				}
				if(s!Frond([ ,;<]+)!<<180>>Frond<<180>>$1!){
				}
				if(s! frond([ ,;<\v]+)! <<180>>frond<<180>>$1!){
				}
				if(s!Fruit([ ,;<]+)!<<181>>Fruit<<181>>$1!){
				}
				if(s! fruit([ ,;<\v]+)! <<181>>fruit<<181>>$1!){
				}
				if(s!Fruits([ ,;<]+)!<<182>>Fruits<<182>>$1!){
				}
				if(s! fruits([ ,;<\v]+)! <<182>>fruits<<182>>$1!){
				}
				if(s!Funnel-shaped([ ,;<]+)!<<183>>Funnel-shaped<<183>>$1!){
				}
				if(s! funnel-shaped([ ,;<\v]+)! <<183>>funnel-shaped<<183>>$1!){
				}
				if(s!Fused([ ,;<]+)!<<184>>Fused<<184>>$1!){
				}
				if(s! fused([ ,;<\v]+)! <<184>>fused<<184>>$1!){
				}
				if(s!Fusiform([ ,;<]+)!<<185>>Fusiform<<185>>$1!){
				}
				if(s! fusiform([ ,;<\v]+)! <<185>>fusiform<<185>>$1!){
				}
				if(s!Glabrous([ ,;<]+)!<<186>>Glabrous<<186>>$1!){
				}
				if(s! glabrous([ ,;<\v]+)! <<186>>glabrous<<186>>$1!){
				}
				if(s!Gland([ ,;<]+)!<<187>>Gland<<187>>$1!){
				}
				if(s! gland([ ,;<\v]+)! <<187>>gland<<187>>$1!){
				}
				if(s!Glands([ ,;<]+)!<<188>>Glands<<188>>$1!){
				}
				if(s! glands([ ,;<\v]+)! <<188>>glands<<188>>$1!){
				}
				if(s!Glandular([ ,;<]+)!<<189>>Glandular<<189>>$1!){
				}
				if(s! glandular([ ,;<\v]+)! <<189>>glandular<<189>>$1!){
				}
				if(s!Glaucous([ ,;<]+)!<<190>>Glaucous<<190>>$1!){
				}
				if(s! glaucous([ ,;<\v]+)! <<190>>glaucous<<190>>$1!){
				}
				if(s!Glume([ ,;<]+)!<<191>>Glume<<191>>$1!){
				}
				if(s! glume([ ,;<\v]+)! <<191>>glume<<191>>$1!){
				}
				if(s!Glumes([ ,;<]+)!<<192>>Glumes<<192>>$1!){
				}
				if(s! glumes([ ,;<\v]+)! <<192>>glumes<<192>>$1!){
				}
				if(s!Graduated([ ,;<]+)!<<193>>Graduated<<193>>$1!){
				}
				if(s! graduated([ ,;<\v]+)! <<193>>graduated<<193>>$1!){
				}
				if(s!Granular([ ,;<]+)!<<194>>Granular<<194>>$1!){
				}
				if(s! granular([ ,;<\v]+)! <<194>>granular<<194>>$1!){
				}
				if(s!Grassland([ ,;<]+)!<<195>>Grassland<<195>>$1!){
				}
				if(s! grassland([ ,;<\v]+)! <<195>>grassland<<195>>$1!){
				}
				if(s!Grasslands([ ,;<]+)!<<196>>Grasslands<<196>>$1!){
				}
				if(s! grasslands([ ,;<\v]+)! <<196>>grasslands<<196>>$1!){
				}
				if(s!Gymnosperm([ ,;<]+)!<<197>>Gymnosperm<<197>>$1!){
				}
				if(s! gymnosperm([ ,;<\v]+)! <<197>>gymnosperm<<197>>$1!){
				}
				if(s!Gymnosperms([ ,;<]+)!<<198>>Gymnosperms<<198>>$1!){
				}
				if(s! gymnosperms([ ,;<\v]+)! <<198>>gymnosperms<<198>>$1!){
				}
				if(s!Habit([ ,;<]+)!<<199>>Habit<<199>>$1!){
				}
				if(s! habit([ ,;<\v]+)! <<199>>habit<<199>>$1!){
				}
				if(s!Habits([ ,;<]+)!<<200>>Habits<<200>>$1!){
				}
				if(s! habits([ ,;<\v]+)! <<200>>habits<<200>>$1!){
				}
				if(s!Habitat([ ,;<]+)!<<201>>Habitat<<201>>$1!){
				}
				if(s! habitat([ ,;<\v]+)! <<201>>habitat<<201>>$1!){
				}
				if(s!Habitats([ ,;<]+)!<<202>>Habitats<<202>>$1!){
				}
				if(s! habitats([ ,;<\v]+)! <<202>>habitats<<202>>$1!){
				}
				if(s!Hair([ ,;<]+)!<<203>>Hair<<203>>$1!){
				}
				if(s! hair([ ,;<\v]+)! <<203>>hair<<203>>$1!){
				}
				if(s!Hairs([ ,;<]+)!<<204>>Hairs<<204>>$1!){
				}
				if(s! hairs([ ,;<\v]+)! <<204>>hairs<<204>>$1!){
				}
				if(s!Haploid([ ,;<]+)!<<205>>Haploid<<205>>$1!){
				}
				if(s! haploid([ ,;<\v]+)! <<205>>haploid<<205>>$1!){
				}
				if(s!Hastate([ ,;<]+)!<<206>>Hastate<<206>>$1!){
				}
				if(s! hastate([ ,;<\v]+)! <<206>>hastate<<206>>$1!){
				}
				if(s!Head([ ,;<]+)!<<207>>Head<<207>>$1!){
				}
				if(s! head([ ,;<\v]+)! <<207>>head<<207>>$1!){
				}
				if(s!Heads([ ,;<]+)!<<208>>Heads<<208>>$1!){
				}
				if(s! heads([ ,;<\v]+)! <<208>>heads<<208>>$1!){
				}
				if(s!Hemispheric([ ,;<]+)!<<209>>Hemispheric<<209>>$1!){
				}
				if(s! hemispheric([ ,;<\v]+)! <<209>>hemispheric<<209>>$1!){
				}
				if(s!Herb([ ,;<]+)!<<210>>Herb<<210>>$1!){
				}
				if(s! herb([ ,;<\v]+)! <<210>>herb<<210>>$1!){
				}
				if(s!Herbs([ ,;<]+)!<<211>>Herbs<<211>>$1!){
				}
				if(s! herbs([ ,;<\v]+)! <<211>>herbs<<211>>$1!){
				}
				if(s!Herbaceous([ ,;<]+)!<<212>>Herbaceous<<212>>$1!){
				}
				if(s! herbaceous([ ,;<\v]+)! <<212>>herbaceous<<212>>$1!){
				}
				if(s!Herbage([ ,;<]+)!<<213>>Herbage<<213>>$1!){
				}
				if(s! herbage([ ,;<\v]+)! <<213>>herbage<<213>>$1!){
				}
				if(s!Heterostylous([ ,;<]+)!<<214>>Heterostylous<<214>>$1!){
				}
				if(s! heterostylous([ ,;<\v]+)! <<214>>heterostylous<<214>>$1!){
				}
				if(s!Hypanthium([ ,;<]+)!<<215>>Hypanthium<<215>>$1!){
				}
				if(s! hypanthium([ ,;<\v]+)! <<215>>hypanthium<<215>>$1!){
				}
				if(s!Hypanthia([ ,;<]+)!<<216>>Hypanthia<<216>>$1!){
				}
				if(s! hypanthia([ ,;<\v]+)! <<216>>hypanthia<<216>>$1!){
				}
				if(s!Included([ ,;<]+)!<<217>>Included<<217>>$1!){
				}
				if(s! included([ ,;<\v]+)! <<217>>included<<217>>$1!){
				}
				if(s!Indehiscent([ ,;<]+)!<<218>>Indehiscent<<218>>$1!){
				}
				if(s! indehiscent([ ,;<\v]+)! <<218>>indehiscent<<218>>$1!){
				}
				if(s!Indusium([ ,;<]+)!<<219>>Indusium<<219>>$1!){
				}
				if(s! indusium([ ,;<\v]+)! <<219>>indusium<<219>>$1!){
				}
				if(s!Indusia([ ,;<]+)!<<220>>Indusia<<220>>$1!){
				}
				if(s! indusia([ ,;<\v]+)! <<220>>indusia<<220>>$1!){
				}
				if(s!Inferior([ ,;<]+)!<<221>>Inferior<<221>>$1!){
				}
				if(s! inferior([ ,;<\v]+)! <<221>>inferior<<221>>$1!){
				}
				if(s!Inflorescence([ ,;<]+)!<<222>>Inflorescence<<222>>$1!){
				}
				if(s! inflorescence([ ,;<\v]+)! <<222>>inflorescence<<222>>$1!){
				}
				if(s!Inflorescences([ ,;<]+)!<<223>>Inflorescences<<223>>$1!){
				}
				if(s! inflorescences([ ,;<\v]+)! <<223>>inflorescences<<223>>$1!){
				}
				if(s!Infraspecific([ ,;<]+)!<<224>>Infraspecific<<224>>$1!){
				}
				if(s! infraspecific([ ,;<\v]+)! <<224>>infraspecific<<224>>$1!){
				}
				if(s!Intergrade([ ,;<]+)!<<225>>Intergrade<<225>>$1!){
				}
				if(s! intergrade([ ,;<\v]+)! <<225>>intergrade<<225>>$1!){
				}
				if(s!Intermediate([ ,;<]+)!<<226>>Intermediate<<226>>$1!){
				}
				if(s! intermediate([ ,;<\v]+)! <<226>>intermediate<<226>>$1!){
				}
				if(s!Internode([ ,;<]+)!<<227>>Internode<<227>>$1!){
				}
				if(s! internode([ ,;<\v]+)! <<227>>internode<<227>>$1!){
				}
				if(s!Internodes([ ,;<]+)!<<228>>Internodes<<228>>$1!){
				}
				if(s! internodes([ ,;<\v]+)! <<228>>internodes<<228>>$1!){
				}
				if(s!Interrupted([ ,;<]+)!<<229>>Interrupted<<229>>$1!){
				}
				if(s! interrupted([ ,;<\v]+)! <<229>>interrupted<<229>>$1!){
				}
				if(s!Intertidal([ ,;<]+)!<<230>>Intertidal<<230>>$1!){
				}
				if(s! intertidal([ ,;<\v]+)! <<230>>intertidal<<230>>$1!){
				}
				if(s!Involucel([ ,;<]+)!<<231>>Involucel<<231>>$1!){
				}
				if(s! involucel([ ,;<\v]+)! <<231>>involucel<<231>>$1!){
				}
				if(s!Involucre([ ,;<]+)!<<232>>Involucre<<232>>$1!){
				}
				if(s! involucre([ ,;<\v]+)! <<232>>involucre<<232>>$1!){
				}
				if(s!Involucres([ ,;<]+)!<<233>>Involucres<<233>>$1!){
				}
				if(s! involucres([ ,;<\v]+)! <<233>>involucres<<233>>$1!){
				}
				if(s!Keel([ ,;<]+)!<<234>>Keel<<234>>$1!){
				}
				if(s! keel([ ,;<\v]+)! <<234>>keel<<234>>$1!){
				}
				if(s!Keels([ ,;<]+)!<<235>>Keels<<235>>$1!){
				}
				if(s! keels([ ,;<\v]+)! <<235>>keels<<235>>$1!){
				}
				if(s!Keeled([ ,;<]+)!<<236>>Keeled<<236>>$1!){
				}
				if(s! keeled([ ,;<\v]+)! <<236>>keeled<<236>>$1!){
				}
				if(s!Lamina([ ,;<]+)!<<237>>Lamina<<237>>$1!){
				}
				if(s! lamina([ ,;<\v]+)! <<237>>lamina<<237>>$1!){
				}
				if(s!Laminae([ ,;<]+)!<<238>>Laminae<<238>>$1!){
				}
				if(s! laminae([ ,;<\v]+)! <<238>>laminae<<238>>$1!){
				}
				if(s!Lanceolate([ ,;<]+)!<<239>>Lanceolate<<239>>$1!){
				}
				if(s! lanceolate([ ,;<\v]+)! <<239>>lanceolate<<239>>$1!){
				}
				if(s!Lateral([ ,;<]+)!<<240>>Lateral<<240>>$1!){
				}
				if(s! lateral([ ,;<\v]+)! <<240>>lateral<<240>>$1!){
				}
				if(s!Leaf([ ,;<]+)!<<241>>Leaf<<241>>$1!){
				}
				if(s! leaf([ ,;<\v]+)! <<241>>leaf<<241>>$1!){
				}
				if(s!Leaves([ ,;<]+)!<<242>>Leaves<<242>>$1!){
				}
				if(s! leaves([ ,;<\v]+)! <<242>>leaves<<242>>$1!){
				}
				if(s!Leaflet([ ,;<]+)!<<243>>Leaflet<<243>>$1!){
				}
				if(s! leaflet([ ,;<\v]+)! <<243>>leaflet<<243>>$1!){
				}
				if(s!Leaflets([ ,;<]+)!<<244>>Leaflets<<244>>$1!){
				}
				if(s! leaflets([ ,;<\v]+)! <<244>>leaflets<<244>>$1!){
				}
				if(s!Legume([ ,;<]+)!<<245>>Legume<<245>>$1!){
				}
				if(s! legume([ ,;<\v]+)! <<245>>legume<<245>>$1!){
				}
				if(s!Legumes([ ,;<]+)!<<246>>Legumes<<246>>$1!){
				}
				if(s! legumes([ ,;<\v]+)! <<246>>legumes<<246>>$1!){
				}
				if(s!Lemma([ ,;<]+)!<<247>>Lemma<<247>>$1!){
				}
				if(s! lemma([ ,;<\v]+)! <<247>>lemma<<247>>$1!){
				}
				if(s!Lemmas([ ,;<]+)!<<248>>Lemmas<<248>>$1!){
				}
				if(s! lemmas([ ,;<\v]+)! <<248>>lemmas<<248>>$1!){
				}
				if(s!Lenticel([ ,;<]+)!<<249>>Lenticel<<249>>$1!){
				}
				if(s! lenticel([ ,;<\v]+)! <<249>>lenticel<<249>>$1!){
				}
				if(s!Lenticels([ ,;<]+)!<<250>>Lenticels<<250>>$1!){
				}
				if(s! lenticels([ ,;<\v]+)! <<250>>lenticels<<250>>$1!){
				}
				if(s!Lenticular([ ,;<]+)!<<251>>Lenticular<<251>>$1!){
				}
				if(s! lenticular([ ,;<\v]+)! <<251>>lenticular<<251>>$1!){
				}
				if(s!Ligulate flower([ ,;<]+)!<<252>>Ligulate flower<<252>>$1!){
				}
				if(s! ligulate flower([ ,;<\v]+)! <<252>>ligulate flower<<252>>$1!){
				}
				if(s!Ligule([ ,;<]+)!<<253>>Ligule<<253>>$1!){
				}
				if(s! ligule([ ,;<\v]+)! <<253>>ligule<<253>>$1!){
				}
				if(s!Ligules([ ,;<]+)!<<254>>Ligules<<254>>$1!){
				}
				if(s! ligules([ ,;<\v]+)! <<254>>ligules<<254>>$1!){
				}
				if(s!Liguliflorous([ ,;<]+)!<<255>>Liguliflorous<<255>>$1!){
				}
				if(s! liguliflorous([ ,;<\v]+)! <<255>>liguliflorous<<255>>$1!){
				}
				if(s!Limb([ ,;<]+)!<<256>>Limb<<256>>$1!){
				}
				if(s! limb([ ,;<\v]+)! <<256>>limb<<256>>$1!){
				}
				if(s!Limbs([ ,;<]+)!<<257>>Limbs<<257>>$1!){
				}
				if(s! limbs([ ,;<\v]+)! <<257>>limbs<<257>>$1!){
				}
				if(s!Linear([ ,;<]+)!<<258>>Linear<<258>>$1!){
				}
				if(s! linear([ ,;<\v]+)! <<258>>linear<<258>>$1!){
				}
				if(s!Lip([ ,;<]+)!<<259>>Lip<<259>>$1!){
				}
				if(s! lip([ ,;<\v]+)! <<259>>lip<<259>>$1!){
				}
				if(s!Lips([ ,;<]+)!<<260>>Lips<<260>>$1!){
				}
				if(s! lips([ ,;<\v]+)! <<260>>lips<<260>>$1!){
				}
				if(s!Lobe([ ,;<]+)!<<261>>Lobe<<261>>$1!){
				}
				if(s! lobe([ ,;<\v]+)! <<261>>lobe<<261>>$1!){
				}
				if(s!Lobes([ ,;<]+)!<<262>>Lobes<<262>>$1!){
				}
				if(s! lobes([ ,;<\v]+)! <<262>>lobes<<262>>$1!){
				}
				if(s!Loculicidal([ ,;<]+)!<<263>>Loculicidal<<263>>$1!){
				}
				if(s! loculicidal([ ,;<\v]+)! <<263>>loculicidal<<263>>$1!){
				}
				if(s!Longitudinal([ ,;<]+)!<<264>>Longitudinal<<264>>$1!){
				}
				if(s! longitudinal([ ,;<\v]+)! <<264>>longitudinal<<264>>$1!){
				}
				if(s!Margin([ ,;<]+)!<<265>>Margin<<265>>$1!){
				}
				if(s! margin([ ,;<\v]+)! <<265>>margin<<265>>$1!){
				}
				if(s!Margins([ ,;<]+)!<<266>>Margins<<266>>$1!){
				}
				if(s! margins([ ,;<\v]+)! <<266>>margins<<266>>$1!){
				}
				if(s!Marsh([ ,;<]+)!<<267>>Marsh<<267>>$1!){
				}
				if(s! marsh([ ,;<\v]+)! <<267>>marsh<<267>>$1!){
				}
				if(s!Marshes([ ,;<]+)!<<268>>Marshes<<268>>$1!){
				}
				if(s! marshes([ ,;<\v]+)! <<268>>marshes<<268>>$1!){
				}
				if(s!Meadow([ ,;<]+)!<<269>>Meadow<<269>>$1!){
				}
				if(s! meadow([ ,;<\v]+)! <<269>>meadow<<269>>$1!){
				}
				if(s!Meadows([ ,;<]+)!<<270>>Meadows<<270>>$1!){
				}
				if(s! meadows([ ,;<\v]+)! <<270>>meadows<<270>>$1!){
				}
				if(s!Membranous([ ,;<]+)!<<271>>Membranous<<271>>$1!){
				}
				if(s! membranous([ ,;<\v]+)! <<271>>membranous<<271>>$1!){
				}
				if(s!Mericarp([ ,;<]+)!<<272>>Mericarp<<272>>$1!){
				}
				if(s! mericarp([ ,;<\v]+)! <<272>>mericarp<<272>>$1!){
				}
				if(s!Mixed-evergreen forest([ ,;<]+)!<<273>>Mixed-evergreen forest<<273>>$1!){
				}
				if(s! mixed-evergreen forest([ ,;<\v]+)! <<273>>mixed-evergreen forest<<273>>$1!){
				}
				if(s!Monoecious([ ,;<]+)!<<274>>Monoecious<<274>>$1!){
				}
				if(s! monoecious([ ,;<\v]+)! <<274>>monoecious<<274>>$1!){
				}
				if(s!Monolete spore([ ,;<]+)!<<275>>Monolete spore<<275>>$1!){
				}
				if(s! monolete spore([ ,;<\v]+)! <<275>>monolete spore<<275>>$1!){
				}
				if(s!Montane([ ,;<]+)!<<276>>Montane<<276>>$1!){
				}
				if(s! montane([ ,;<\v]+)! <<276>>montane<<276>>$1!){
				}
				if(s!Mucro([ ,;<]+)!<<277>>Mucro<<277>>$1!){
				}
				if(s! mucro([ ,;<\v]+)! <<277>>mucro<<277>>$1!){
				}
				if(s!Mucronate([ ,;<]+)!<<278>>Mucronate<<278>>$1!){
				}
				if(s! mucronate([ ,;<\v]+)! <<278>>mucronate<<278>>$1!){
				}
				if(s!Native([ ,;<]+)!<<279>>Native<<279>>$1!){
				}
				if(s! native([ ,;<\v]+)! <<279>>native<<279>>$1!){
				}
				if(s!Naturalized([ ,;<]+)!<<280>>Naturalized<<280>>$1!){
				}
				if(s! naturalized([ ,;<\v]+)! <<280>>naturalized<<280>>$1!){
				}
				if(s!Nectar([ ,;<]+)!<<281>>Nectar<<281>>$1!){
				}
				if(s! nectar([ ,;<\v]+)! <<281>>nectar<<281>>$1!){
				}
				if(s!Nectary([ ,;<]+)!<<282>>Nectary<<282>>$1!){
				}
				if(s! nectary([ ,;<\v]+)! <<282>>nectary<<282>>$1!){
				}
				if(s!Nectaries([ ,;<]+)!<<283>>Nectaries<<283>>$1!){
				}
				if(s! nectaries([ ,;<\v]+)! <<283>>nectaries<<283>>$1!){
				}
				if(s!Needle([ ,;<]+)!<<284>>Needle<<284>>$1!){
				}
				if(s! needle([ ,;<\v]+)! <<284>>needle<<284>>$1!){
				}
				if(s!Needles([ ,;<]+)!<<285>>Needles<<285>>$1!){
				}
				if(s! needles([ ,;<\v]+)! <<285>>needles<<285>>$1!){
				}
				if(s!Node([ ,;<]+)!<<286>>Node<<286>>$1!){
				}
				if(s! node([ ,;<\v]+)! <<286>>node<<286>>$1!){
				}
				if(s!Nodes([ ,;<]+)!<<287>>Nodes<<287>>$1!){
				}
				if(s! nodes([ ,;<\v]+)! <<287>>nodes<<287>>$1!){
				}
				if(s!Nut([ ,;<]+)!<<288>>Nut<<288>>$1!){
				}
				if(s! nut([ ,;<\v]+)! <<288>>nut<<288>>$1!){
				}
				if(s!Nuts([ ,;<]+)!<<289>>Nuts<<289>>$1!){
				}
				if(s! nuts([ ,;<\v]+)! <<289>>nuts<<289>>$1!){
				}
				if(s!Nutlet([ ,;<]+)!<<290>>Nutlet<<290>>$1!){
				}
				if(s! nutlet([ ,;<\v]+)! <<290>>nutlet<<290>>$1!){
				}
				if(s!Nutlets([ ,;<]+)!<<291>>Nutlets<<291>>$1!){
				}
				if(s! nutlets([ ,;<\v]+)! <<291>>nutlets<<291>>$1!){
				}
				if(s!Oblique([ ,;<]+)!<<292>>Oblique<<292>>$1!){
				}
				if(s! oblique([ ,;<\v]+)! <<292>>oblique<<292>>$1!){
				}
				if(s!Oblong([ ,;<]+)!<<293>>Oblong<<293>>$1!){
				}
				if(s! oblong([ ,;<\v]+)! <<293>>oblong<<293>>$1!){
				}
				if(s!Obtuse([ ,;<]+)!<<294>>Obtuse<<294>>$1!){
				}
				if(s! obtuse([ ,;<\v]+)! <<294>>obtuse<<294>>$1!){
				}
				if(s!Ocrea([ ,;<]+)!<<295>>Ocrea<<295>>$1!){
				}
				if(s! ocrea([ ,;<\v]+)! <<295>>ocrea<<295>>$1!){
				}
				if(s!Ocreae([ ,;<]+)!<<296>>Ocreae<<296>>$1!){
				}
				if(s! ocreae([ ,;<\v]+)! <<296>>ocreae<<296>>$1!){
				}
				if(s!Open([ ,;<]+)!<<297>>Open<<297>>$1!){
				}
				if(s! open([ ,;<\v]+)! <<297>>open<<297>>$1!){
				}
				if(s!Opposite([ ,;<]+)!<<298>>Opposite<<298>>$1!){
				}
				if(s! opposite([ ,;<\v]+)! <<298>>opposite<<298>>$1!){
				}
				if(s!Ovary([ ,;<]+)!<<299>>Ovary<<299>>$1!){
				}
				if(s! ovary([ ,;<\v]+)! <<299>>ovary<<299>>$1!){
				}
				if(s!Ovaries([ ,;<]+)!<<300>>Ovaries<<300>>$1!){
				}
				if(s! ovaries([ ,;<\v]+)! <<300>>ovaries<<300>>$1!){
				}
				if(s!Ovary stalk([ ,;<]+)!<<301>>Ovary stalk<<301>>$1!){
				}
				if(s! ovary stalk([ ,;<\v]+)! <<301>>ovary stalk<<301>>$1!){
				}
				if(s!Fruit stalk([ ,;<]+)!<<302>>Fruit stalk<<302>>$1!){
				}
				if(s! fruit stalk([ ,;<\v]+)! <<302>>fruit stalk<<302>>$1!){
				}
				if(s!Ovate([ ,;<]+)!<<303>>Ovate<<303>>$1!){
				}
				if(s! ovate([ ,;<\v]+)! <<303>>ovate<<303>>$1!){
				}
				if(s!Ovoid([ ,;<]+)!<<304>>Ovoid<<304>>$1!){
				}
				if(s! ovoid([ ,;<\v]+)! <<304>>ovoid<<304>>$1!){
				}
				if(s!Ovule([ ,;<]+)!<<305>>Ovule<<305>>$1!){
				}
				if(s! ovule([ ,;<\v]+)! <<305>>ovule<<305>>$1!){
				}
				if(s!Ovules([ ,;<]+)!<<306>>Ovules<<306>>$1!){
				}
				if(s! ovules([ ,;<\v]+)! <<306>>ovules<<306>>$1!){
				}
				if(s!Paleate([ ,;<]+)!<<307>>Paleate<<307>>$1!){
				}
				if(s! paleate([ ,;<\v]+)! <<307>>paleate<<307>>$1!){
				}
				if(s!Palea([ ,;<]+)!<<308>>Palea<<308>>$1!){
				}
				if(s! palea([ ,;<\v]+)! <<308>>palea<<308>>$1!){
				}
				if(s!Paleae([ ,;<]+)!<<309>>Paleae<<309>>$1!){
				}
				if(s! paleae([ ,;<\v]+)! <<309>>paleae<<309>>$1!){
				}
				if(s!Palmately([ ,;<]+)!<<310>>Palmately<<310>>$1!){
				}
				if(s! palmately([ ,;<\v]+)! <<310>>palmately<<310>>$1!){
				}
				if(s!Palmate([ ,;<]+)!<<311>>Palmate<<311>>$1!){
				}
				if(s! palmate([ ,;<\v]+)! <<311>>palmate<<311>>$1!){
				}
				if(s!Panicle([ ,;<]+)!<<312>>Panicle<<312>>$1!){
				}
				if(s! panicle([ ,;<\v]+)! <<312>>panicle<<312>>$1!){
				}
				if(s!Panicles([ ,;<]+)!<<313>>Panicles<<313>>$1!){
				}
				if(s! panicles([ ,;<\v]+)! <<313>>panicles<<313>>$1!){
				}
				if(s!Papillate([ ,;<]+)!<<314>>Papillate<<314>>$1!){
				}
				if(s! papillate([ ,;<\v]+)! <<314>>papillate<<314>>$1!){
				}
				if(s!Pappus([ ,;<]+)!<<315>>Pappus<<315>>$1!){
				}
				if(s! pappus([ ,;<\v]+)! <<315>>pappus<<315>>$1!){
				}
				if(s!Parasite([ ,;<]+)!<<316>>Parasite<<316>>$1!){
				}
				if(s! parasite([ ,;<\v]+)! <<316>>parasite<<316>>$1!){
				}
				if(s!Parasites([ ,;<]+)!<<317>>Parasites<<317>>$1!){
				}
				if(s! parasites([ ,;<\v]+)! <<317>>parasites<<317>>$1!){
				}
				if(s!Parietal([ ,;<]+)!<<318>>Parietal<<318>>$1!){
				}
				if(s! parietal([ ,;<\v]+)! <<318>>parietal<<318>>$1!){
				}
				if(s!Parietally([ ,;<]+)!<<319>>Parietally<<319>>$1!){
				}
				if(s! parietally([ ,;<\v]+)! <<319>>parietally<<319>>$1!){
				}
				if(s!Peat([ ,;<]+)!<<320>>Peat<<320>>$1!){
				}
				if(s! peat([ ,;<\v]+)! <<320>>peat<<320>>$1!){
				}
				if(s!Peatland([ ,;<]+)!<<321>>Peatland<<321>>$1!){
				}
				if(s! peatland([ ,;<\v]+)! <<321>>peatland<<321>>$1!){
				}
				if(s!Peatlands([ ,;<]+)!<<322>>Peatlands<<322>>$1!){
				}
				if(s! peatlands([ ,;<\v]+)! <<322>>peatlands<<322>>$1!){
				}
				if(s!Pedicel([ ,;<]+)!<<323>>Pedicel<<323>>$1!){
				}
				if(s! pedicel([ ,;<\v]+)! <<323>>pedicel<<323>>$1!){
				}
				if(s!Pedicels([ ,;<]+)!<<324>>Pedicels<<324>>$1!){
				}
				if(s! pedicels([ ,;<\v]+)! <<324>>pedicels<<324>>$1!){
				}
				if(s!Peduncle([ ,;<]+)!<<325>>Peduncle<<325>>$1!){
				}
				if(s! peduncle([ ,;<\v]+)! <<325>>peduncle<<325>>$1!){
				}
				if(s!Peduncles([ ,;<]+)!<<326>>Peduncles<<326>>$1!){
				}
				if(s! peduncles([ ,;<\v]+)! <<326>>peduncles<<326>>$1!){
				}
				if(s!Peltate([ ,;<]+)!<<327>>Peltate<<327>>$1!){
				}
				if(s! peltate([ ,;<\v]+)! <<327>>peltate<<327>>$1!){
				}
				if(s!Pendent([ ,;<]+)!<<328>>Pendent<<328>>$1!){
				}
				if(s! pendent([ ,;<\v]+)! <<328>>pendent<<328>>$1!){
				}
				if(s!Perennial([ ,;<]+)!<<329>>Perennial<<329>>$1!){
				}
				if(s! perennial([ ,;<\v]+)! <<329>>perennial<<329>>$1!){
				}
				if(s!Perianth([ ,;<]+)!<<330>>Perianth<<330>>$1!){
				}
				if(s! perianth([ ,;<\v]+)! <<330>>perianth<<330>>$1!){
				}
				if(s!Perianths([ ,;<]+)!<<331>>Perianths<<331>>$1!){
				}
				if(s! perianths([ ,;<\v]+)! <<331>>perianths<<331>>$1!){
				}
				if(s!Perianth part([ ,;<]+)!<<332>>Perianth part<<332>>$1!){
				}
				if(s! perianth part([ ,;<\v]+)! <<332>>perianth part<<332>>$1!){
				}
				if(s!Perigynium([ ,;<]+)!<<333>>Perigynium<<333>>$1!){
				}
				if(s! perigynium([ ,;<\v]+)! <<333>>perigynium<<333>>$1!){
				}
				if(s!Persistent([ ,;<]+)!<<334>>Persistent<<334>>$1!){
				}
				if(s! persistent([ ,;<\v]+)! <<334>>persistent<<334>>$1!){
				}
				if(s!Petal([ ,;<]+)!<<335>>Petal<<335>>$1!){
				}
				if(s! petal([ ,;<\v]+)! <<335>>petal<<335>>$1!){
				}
				if(s!Petals([ ,;<]+)!<<336>>Petals<<336>>$1!){
				}
				if(s! petals([ ,;<\v]+)! <<336>>petals<<336>>$1!){
				}
				if(s!Petiole([ ,;<]+)!<<337>>Petiole<<337>>$1!){
				}
				if(s! petiole([ ,;<\v]+)! <<337>>petiole<<337>>$1!){
				}
				if(s!Petioles([ ,;<]+)!<<338>>Petioles<<338>>$1!){
				}
				if(s! petioles([ ,;<\v]+)! <<338>>petioles<<338>>$1!){
				}
				if(s!Phyllary([ ,;<]+)!<<339>>Phyllary<<339>>$1!){
				}
				if(s! phyllary([ ,;<\v]+)! <<339>>phyllary<<339>>$1!){
				}
				if(s!Phyllaries([ ,;<]+)!<<340>>Phyllaries<<340>>$1!){
				}
				if(s! phyllaries([ ,;<\v]+)! <<340>>phyllaries<<340>>$1!){
				}
				if(s!Pinna([ ,;<]+)!<<341>>Pinna<<341>>$1!){
				}
				if(s! pinna([ ,;<\v]+)! <<341>>pinna<<341>>$1!){
				}
				if(s!Pinnae([ ,;<]+)!<<342>>Pinnae<<342>>$1!){
				}
				if(s! pinnae([ ,;<\v]+)! <<342>>pinnae<<342>>$1!){
				}
				if(s!Pinnate([ ,;<]+)!<<343>>Pinnate<<343>>$1!){
				}
				if(s! pinnate([ ,;<\v]+)! <<343>>pinnate<<343>>$1!){
				}
				if(s!Pinnately([ ,;<]+)!<<344>>Pinnately<<344>>$1!){
				}
				if(s! pinnately([ ,;<\v]+)! <<344>>pinnately<<344>>$1!){
				}
				if(s!Pinnule([ ,;<]+)!<<345>>Pinnule<<345>>$1!){
				}
				if(s! pinnule([ ,;<\v]+)! <<345>>pinnule<<345>>$1!){
				}
				if(s!Pinnules([ ,;<]+)!<<346>>Pinnules<<346>>$1!){
				}
				if(s! pinnules([ ,;<\v]+)! <<346>>pinnules<<346>>$1!){
				}
				if(s!Pinnulet([ ,;<]+)!<<347>>Pinnulet<<347>>$1!){
				}
				if(s! pinnulet([ ,;<\v]+)! <<347>>pinnulet<<347>>$1!){
				}
				if(s!Pistil([ ,;<]+)!<<348>>Pistil<<348>>$1!){
				}
				if(s! pistil([ ,;<\v]+)! <<348>>pistil<<348>>$1!){
				}
				if(s!Pistils([ ,;<]+)!<<349>>Pistils<<349>>$1!){
				}
				if(s! pistils([ ,;<\v]+)! <<349>>pistils<<349>>$1!){
				}
				if(s!Pistillate([ ,;<]+)!<<350>>Pistillate<<350>>$1!){
				}
				if(s! pistillate([ ,;<\v]+)! <<350>>pistillate<<350>>$1!){
				}
				if(s!Placenta([ ,;<]+)!<<351>>Placenta<<351>>$1!){
				}
				if(s! placenta([ ,;<\v]+)! <<351>>placenta<<351>>$1!){
				}
				if(s!Placentas([ ,;<]+)!<<352>>Placentas<<352>>$1!){
				}
				if(s! placentas([ ,;<\v]+)! <<352>>placentas<<352>>$1!){
				}
				if(s!Planoconvex([ ,;<]+)!<<353>>Planoconvex<<353>>$1!){
				}
				if(s! planoconvex([ ,;<\v]+)! <<353>>planoconvex<<353>>$1!){
				}
				if(s!Pleated([ ,;<]+)!<<354>>Pleated<<354>>$1!){
				}
				if(s! pleated([ ,;<\v]+)! <<354>>pleated<<354>>$1!){
				}
				if(s!Plumose([ ,;<]+)!<<355>>Plumose<<355>>$1!){
				}
				if(s! plumose([ ,;<\v]+)! <<355>>plumose<<355>>$1!){
				}
				if(s!Pollen([ ,;<]+)!<<356>>Pollen<<356>>$1!){
				}
				if(s! pollen([ ,;<\v]+)! <<356>>pollen<<356>>$1!){
				}
				if(s!Pollination([ ,;<]+)!<<357>>Pollination<<357>>$1!){
				}
				if(s! pollination([ ,;<\v]+)! <<357>>pollination<<357>>$1!){
				}
				if(s!Pollinium([ ,;<]+)!<<358>>Pollinium<<358>>$1!){
				}
				if(s! pollinium([ ,;<\v]+)! <<358>>pollinium<<358>>$1!){
				}
				if(s!Pollinia([ ,;<]+)!<<359>>Pollinia<<359>>$1!){
				}
				if(s! pollinia([ ,;<\v]+)! <<359>>pollinia<<359>>$1!){
				}
				if(s!Polyploid([ ,;<]+)!<<360>>Polyploid<<360>>$1!){
				}
				if(s! polyploid([ ,;<\v]+)! <<360>>polyploid<<360>>$1!){
				}
				if(s!Pome([ ,;<]+)!<<361>>Pome<<361>>$1!){
				}
				if(s! pome([ ,;<\v]+)! <<361>>pome<<361>>$1!){
				}
				if(s!Prickle([ ,;<]+)!<<362>>Prickle<<362>>$1!){
				}
				if(s! prickle([ ,;<\v]+)! <<362>>prickle<<362>>$1!){
				}
				if(s!Prickles([ ,;<]+)!<<363>>Prickles<<363>>$1!){
				}
				if(s! prickles([ ,;<\v]+)! <<363>>prickles<<363>>$1!){
				}
				if(s!Prostrate([ ,;<]+)!<<364>>Prostrate<<364>>$1!){
				}
				if(s! prostrate([ ,;<\v]+)! <<364>>prostrate<<364>>$1!){
				}
				if(s!Protandrous([ ,;<]+)!<<365>>Protandrous<<365>>$1!){
				}
				if(s! protandrous([ ,;<\v]+)! <<365>>protandrous<<365>>$1!){
				}
				if(s!Protogynous([ ,;<]+)!<<366>>Protogynous<<366>>$1!){
				}
				if(s! protogynous([ ,;<\v]+)! <<366>>protogynous<<366>>$1!){
				}
				if(s!Proximal([ ,;<]+)!<<367>>Proximal<<367>>$1!){
				}
				if(s! proximal([ ,;<\v]+)! <<367>>proximal<<367>>$1!){
				}
				if(s!Proximally([ ,;<]+)!<<368>>Proximally<<368>>$1!){
				}
				if(s! proximally([ ,;<\v]+)! <<368>>proximally<<368>>$1!){
				}
				if(s!Puberulent([ ,;<]+)!<<369>>Puberulent<<369>>$1!){
				}
				if(s! puberulent([ ,;<\v]+)! <<369>>puberulent<<369>>$1!){
				}
				if(s!Raceme([ ,;<]+)!<<370>>Raceme<<370>>$1!){
				}
				if(s! raceme([ ,;<\v]+)! <<370>>raceme<<370>>$1!){
				}
				if(s!Racemes([ ,;<]+)!<<371>>Racemes<<371>>$1!){
				}
				if(s! racemes([ ,;<\v]+)! <<371>>racemes<<371>>$1!){
				}
				if(s!Rachis([ ,;<]+)!<<372>>Rachis<<372>>$1!){
				}
				if(s! rachis([ ,;<\v]+)! <<372>>rachis<<372>>$1!){
				}
				if(s!Rachides([ ,;<]+)!<<373>>Rachides<<373>>$1!){
				}
				if(s! rachides([ ,;<\v]+)! <<373>>rachides<<373>>$1!){
				}
				if(s!Radial([ ,;<]+)!<<374>>Radial<<374>>$1!){
				}
				if(s! radial([ ,;<\v]+)! <<374>>radial<<374>>$1!){
				}
				if(s!Radiant([ ,;<]+)!<<375>>Radiant<<375>>$1!){
				}
				if(s! radiant([ ,;<\v]+)! <<375>>radiant<<375>>$1!){
				}
				if(s!Radiate([ ,;<]+)!<<376>>Radiate<<376>>$1!){
				}
				if(s! radiate([ ,;<\v]+)! <<376>>radiate<<376>>$1!){
				}
				if(s!Rank([ ,;<]+)!<<377>>Rank<<377>>$1!){
				}
				if(s! rank([ ,;<\v]+)! <<377>>rank<<377>>$1!){
				}
				if(s!Ranks([ ,;<]+)!<<378>>Ranks<<378>>$1!){
				}
				if(s! ranks([ ,;<\v]+)! <<378>>ranks<<378>>$1!){
				}
				if(s!Ranked([ ,;<]+)!<<379>>Ranked<<379>>$1!){
				}
				if(s! ranked([ ,;<\v]+)! <<379>>ranked<<379>>$1!){
				}
				if(s!Rare([ ,;<]+)!<<380>>Rare<<380>>$1!){
				}
				if(s! rare([ ,;<\v]+)! <<380>>rare<<380>>$1!){
				}
				if(s!Rays([ ,;<]+)!<<381>>Rays<<381>>$1!){
				}
				if(s! rays([ ,;<\v]+)! <<381>>rays<<381>>$1!){
				}
				if(s!Rayed([ ,;<]+)!<<382>>Rayed<<382>>$1!){
				}
				if(s! rayed([ ,;<\v]+)! <<382>>rayed<<382>>$1!){
				}
				if(s!Ray flower([ ,;<]+)!<<383>>Ray flower<<383>>$1!){
				}
				if(s! ray flower([ ,;<\v]+)! <<383>>ray flower<<383>>$1!){
				}
				if(s!Receptacle([ ,;<]+)!<<384>>Receptacle<<384>>$1!){
				}
				if(s! receptacle([ ,;<\v]+)! <<384>>receptacle<<384>>$1!){
				}
				if(s!Receptacles([ ,;<]+)!<<385>>Receptacles<<385>>$1!){
				}
				if(s! receptacles([ ,;<\v]+)! <<385>>receptacles<<385>>$1!){
				}
				if(s!Recurved([ ,;<]+)!<<386>>Recurved<<386>>$1!){
				}
				if(s! recurved([ ,;<\v]+)! <<386>>recurved<<386>>$1!){
				}
				if(s!Reduced([ ,;<]+)!<<387>>Reduced<<387>>$1!){
				}
				if(s! reduced([ ,;<\v]+)! <<387>>reduced<<387>>$1!){
				}
				if(s!Reflexed([ ,;<]+)!<<388>>Reflexed<<388>>$1!){
				}
				if(s! reflexed([ ,;<\v]+)! <<388>>reflexed<<388>>$1!){
				}
				if(s!Reniform([ ,;<]+)!<<389>>Reniform<<389>>$1!){
				}
				if(s! reniform([ ,;<\v]+)! <<389>>reniform<<389>>$1!){
				}
				if(s!Rhizome([ ,;<]+)!<<390>>Rhizome<<390>>$1!){
				}
				if(s! rhizome([ ,;<\v]+)! <<390>>rhizome<<390>>$1!){
				}
				if(s!Rhizomes([ ,;<]+)!<<391>>Rhizomes<<391>>$1!){
				}
				if(s! rhizomes([ ,;<\v]+)! <<391>>rhizomes<<391>>$1!){
				}
				if(s!Rib([ ,;<]+)!<<392>>Rib<<392>>$1!){
				}
				if(s! rib([ ,;<\v]+)! <<392>>rib<<392>>$1!){
				}
				if(s!Ribs([ ,;<]+)!<<393>>Ribs<<393>>$1!){
				}
				if(s! ribs([ ,;<\v]+)! <<393>>ribs<<393>>$1!){
				}
				if(s!Ribbed([ ,;<]+)!<<394>>Ribbed<<394>>$1!){
				}
				if(s! ribbed([ ,;<\v]+)! <<394>>ribbed<<394>>$1!){
				}
				if(s!Riparian([ ,;<]+)!<<395>>Riparian<<395>>$1!){
				}
				if(s! riparian([ ,;<\v]+)! <<395>>riparian<<395>>$1!){
				}
				if(s!Root([ ,;<]+)!<<396>>Root<<396>>$1!){
				}
				if(s! root([ ,;<\v]+)! <<396>>root<<396>>$1!){
				}
				if(s!Roots([ ,;<]+)!<<397>>Roots<<397>>$1!){
				}
				if(s! roots([ ,;<\v]+)! <<397>>roots<<397>>$1!){
				}
				if(s!Rosette([ ,;<]+)!<<398>>Rosette<<398>>$1!){
				}
				if(s! rosette([ ,;<\v]+)! <<398>>rosette<<398>>$1!){
				}
				if(s!Rosettes([ ,;<]+)!<<399>>Rosettes<<399>>$1!){
				}
				if(s! rosettes([ ,;<\v]+)! <<399>>rosettes<<399>>$1!){
				}
				if(s!Rotate([ ,;<]+)!<<400>>Rotate<<400>>$1!){
				}
				if(s! rotate([ ,;<\v]+)! <<400>>rotate<<400>>$1!){
				}
				if(s!Ruderal([ ,;<]+)!<<401>>Ruderal<<401>>$1!){
				}
				if(s! ruderal([ ,;<\v]+)! <<401>>ruderal<<401>>$1!){
				}
				if(s!Sagittate([ ,;<]+)!<<402>>Sagittate<<402>>$1!){
				}
				if(s! sagittate([ ,;<\v]+)! <<402>>sagittate<<402>>$1!){
				}
				if(s!Salverform([ ,;<]+)!<<403>>Salverform<<403>>$1!){
				}
				if(s! salverform([ ,;<\v]+)! <<403>>salverform<<403>>$1!){
				}
				if(s!Savanna([ ,;<]+)!<<404>>Savanna<<404>>$1!){
				}
				if(s! savanna([ ,;<\v]+)! <<404>>savanna<<404>>$1!){
				}
				if(s!Scabrous([ ,;<]+)!<<405>>Scabrous<<405>>$1!){
				}
				if(s! scabrous([ ,;<\v]+)! <<405>>scabrous<<405>>$1!){
				}
				if(s!Scale([ ,;<]+)!<<406>>Scale<<406>>$1!){
				}
				if(s! scale([ ,;<\v]+)! <<406>>scale<<406>>$1!){
				}
				if(s!Scales([ ,;<]+)!<<407>>Scales<<407>>$1!){
				}
				if(s! scales([ ,;<\v]+)! <<407>>scales<<407>>$1!){
				}
				if(s!Scapose([ ,;<]+)!<<408>>Scapose<<408>>$1!){
				}
				if(s! scapose([ ,;<\v]+)! <<408>>scapose<<408>>$1!){
				}
				if(s!Scar([ ,;<]+)!<<409>>Scar<<409>>$1!){
				}
				if(s! scar([ ,;<\v]+)! <<409>>scar<<409>>$1!){
				}
				if(s!Scars([ ,;<]+)!<<410>>Scars<<410>>$1!){
				}
				if(s! scars([ ,;<\v]+)! <<410>>scars<<410>>$1!){
				}
				if(s!Scarious([ ,;<]+)!<<411>>Scarious<<411>>$1!){
				}
				if(s! scarious([ ,;<\v]+)! <<411>>scarious<<411>>$1!){
				}
				if(s!Scree([ ,;<]+)!<<412>>Scree<<412>>$1!){
				}
				if(s! scree([ ,;<\v]+)! <<412>>scree<<412>>$1!){
				}
				if(s!Scrub([ ,;<]+)!<<413>>Scrub<<413>>$1!){
				}
				if(s! scrub([ ,;<\v]+)! <<413>>scrub<<413>>$1!){
				}
				if(s!Sculpture([ ,;<]+)!<<414>>Sculpture<<414>>$1!){
				}
				if(s! sculpture([ ,;<\v]+)! <<414>>sculpture<<414>>$1!){
				}
				if(s!Seed([ ,;<]+)!<<415>>Seed<<415>>$1!){
				}
				if(s! seed([ ,;<\v]+)! <<415>>seed<<415>>$1!){
				}
				if(s!Seeds([ ,;<]+)!<<416>>Seeds<<416>>$1!){
				}
				if(s! seeds([ ,;<\v]+)! <<416>>seeds<<416>>$1!){
				}
				if(s!Segment([ ,;<]+)!<<417>>Segment<<417>>$1!){
				}
				if(s! segment([ ,;<\v]+)! <<417>>segment<<417>>$1!){
				}
				if(s!Segments([ ,;<]+)!<<418>>Segments<<418>>$1!){
				}
				if(s! segments([ ,;<\v]+)! <<418>>segments<<418>>$1!){
				}
				if(s!Sepal([ ,;<]+)!<<419>>Sepal<<419>>$1!){
				}
				if(s! sepal([ ,;<\v]+)! <<419>>sepal<<419>>$1!){
				}
				if(s!Sepals([ ,;<]+)!<<420>>Sepals<<420>>$1!){
				}
				if(s! sepals([ ,;<\v]+)! <<420>>sepals<<420>>$1!){
				}
				if(s!Septicidal([ ,;<]+)!<<421>>Septicidal<<421>>$1!){
				}
				if(s! septicidal([ ,;<\v]+)! <<421>>septicidal<<421>>$1!){
				}
				if(s!Septum([ ,;<]+)!<<422>>Septum<<422>>$1!){
				}
				if(s! septum([ ,;<\v]+)! <<422>>septum<<422>>$1!){
				}
				if(s!Septa([ ,;<]+)!<<423>>Septa<<423>>$1!){
				}
				if(s! septa([ ,;<\v]+)! <<423>>septa<<423>>$1!){
				}
				if(s!Series([ ,;<]+)!<<424>>Series<<424>>$1!){
				}
				if(s! series([ ,;<\v]+)! <<424>>series<<424>>$1!){
				}
				if(s!Serpentine([ ,;<]+)!<<425>>Serpentine<<425>>$1!){
				}
				if(s! serpentine([ ,;<\v]+)! <<425>>serpentine<<425>>$1!){
				}
				if(s!Serpentinitic([ ,;<]+)!<<426>>Serpentinitic<<426>>$1!){
				}
				if(s! serpentinitic([ ,;<\v]+)! <<426>>serpentinitic<<426>>$1!){
				}
				if(s!Serrate([ ,;<]+)!<<427>>Serrate<<427>>$1!){
				}
				if(s! serrate([ ,;<\v]+)! <<427>>serrate<<427>>$1!){
				}
				if(s!Sessile([ ,;<]+)!<<428>>Sessile<<428>>$1!){
				}
				if(s! sessile([ ,;<\v]+)! <<428>>sessile<<428>>$1!){
				}
				if(s!Sheath([ ,;<]+)!<<429>>Sheath<<429>>$1!){
				}
				if(s! sheath([ ,;<\v]+)! <<429>>sheath<<429>>$1!){
				}
				if(s!Sheaths([ ,;<]+)!<<430>>Sheaths<<430>>$1!){
				}
				if(s! sheaths([ ,;<\v]+)! <<430>>sheaths<<430>>$1!){
				}
				if(s!Shoot([ ,;<]+)!<<431>>Shoot<<431>>$1!){
				}
				if(s! shoot([ ,;<\v]+)! <<431>>shoot<<431>>$1!){
				}
				if(s!Shoots([ ,;<]+)!<<432>>Shoots<<432>>$1!){
				}
				if(s! shoots([ ,;<\v]+)! <<432>>shoots<<432>>$1!){
				}
				if(s!Shrub([ ,;<]+)!<<433>>Shrub<<433>>$1!){
				}
				if(s! shrub([ ,;<\v]+)! <<433>>shrub<<433>>$1!){
				}
				if(s!Shrubs([ ,;<]+)!<<434>>Shrubs<<434>>$1!){
				}
				if(s! shrubs([ ,;<\v]+)! <<434>>shrubs<<434>>$1!){
				}
				if(s!Simple([ ,;<]+)!<<435>>Simple<<435>>$1!){
				}
				if(s! simple([ ,;<\v]+)! <<435>>simple<<435>>$1!){
				}
				if(s!Sinus([ ,;<]+)!<<436>>Sinus<<436>>$1!){
				}
				if(s! sinus([ ,;<\v]+)! <<436>>sinus<<436>>$1!){
				}
				if(s!Sorus([ ,;<]+)!<<437>>Sorus<<437>>$1!){
				}
				if(s! sorus([ ,;<\v]+)! <<437>>sorus<<437>>$1!){
				}
				if(s!Sori([ ,;<]+)!<<438>>Sori<<438>>$1!){
				}
				if(s! sori([ ,;<\v]+)! <<438>>sori<<438>>$1!){
				}
				if(s!Spheric([ ,;<]+)!<<439>>Spheric<<439>>$1!){
				}
				if(s! spheric([ ,;<\v]+)! <<439>>spheric<<439>>$1!){
				}
				if(s!Spike([ ,;<]+)!<<440>>Spike<<440>>$1!){
				}
				if(s! spike([ ,;<\v]+)! <<440>>spike<<440>>$1!){
				}
				if(s!Spikes([ ,;<]+)!<<441>>Spikes<<441>>$1!){
				}
				if(s! spikes([ ,;<\v]+)! <<441>>spikes<<441>>$1!){
				}
				if(s!Spikelet([ ,;<]+)!<<442>>Spikelet<<442>>$1!){
				}
				if(s! spikelet([ ,;<\v]+)! <<442>>spikelet<<442>>$1!){
				}
				if(s!Spikelets([ ,;<]+)!<<443>>Spikelets<<443>>$1!){
				}
				if(s! spikelets([ ,;<\v]+)! <<443>>spikelets<<443>>$1!){
				}
				if(s!Spine([ ,;<]+)!<<444>>Spine<<444>>$1!){
				}
				if(s! spine([ ,;<\v]+)! <<444>>spine<<444>>$1!){
				}
				if(s!Spines([ ,;<]+)!<<445>>Spines<<445>>$1!){
				}
				if(s! spines([ ,;<\v]+)! <<445>>spines<<445>>$1!){
				}
				if(s!Sporangium([ ,;<]+)!<<446>>Sporangium<<446>>$1!){
				}
				if(s! sporangium([ ,;<\v]+)! <<446>>sporangium<<446>>$1!){
				}
				if(s!Sporangia([ ,;<]+)!<<447>>Sporangia<<447>>$1!){
				}
				if(s! sporangia([ ,;<\v]+)! <<447>>sporangia<<447>>$1!){
				}
				if(s!Spore([ ,;<]+)!<<448>>Spore<<448>>$1!){
				}
				if(s! spore([ ,;<\v]+)! <<448>>spore<<448>>$1!){
				}
				if(s!Spores([ ,;<]+)!<<449>>Spores<<449>>$1!){
				}
				if(s! spores([ ,;<\v]+)! <<449>>spores<<449>>$1!){
				}
				if(s!Spreading([ ,;<]+)!<<450>>Spreading<<450>>$1!){
				}
				if(s! spreading([ ,;<\v]+)! <<450>>spreading<<450>>$1!){
				}
				if(s!Spur([ ,;<]+)!<<451>>Spur<<451>>$1!){
				}
				if(s! spur([ ,;<\v]+)! <<451>>spur<<451>>$1!){
				}
				if(s!Spurs([ ,;<]+)!<<452>>Spurs<<452>>$1!){
				}
				if(s! spurs([ ,;<\v]+)! <<452>>spurs<<452>>$1!){
				}
				if(s!Stamen([ ,;<]+)!<<453>>Stamen<<453>>$1!){
				}
				if(s! stamen([ ,;<\v]+)! <<453>>stamen<<453>>$1!){
				}
				if(s!Stamens([ ,;<]+)!<<454>>Stamens<<454>>$1!){
				}
				if(s! stamens([ ,;<\v]+)! <<454>>stamens<<454>>$1!){
				}
				if(s!Staminate([ ,;<]+)!<<455>>Staminate<<455>>$1!){
				}
				if(s! staminate([ ,;<\v]+)! <<455>>staminate<<455>>$1!){
				}
				if(s!Staminode([ ,;<]+)!<<456>>Staminode<<456>>$1!){
				}
				if(s! staminode([ ,;<\v]+)! <<456>>staminode<<456>>$1!){
				}
				if(s!Staminodes([ ,;<]+)!<<457>>Staminodes<<457>>$1!){
				}
				if(s! staminodes([ ,;<\v]+)! <<457>>staminodes<<457>>$1!){
				}
				if(s!Stellate([ ,;<]+)!<<458>>Stellate<<458>>$1!){
				}
				if(s! stellate([ ,;<\v]+)! <<458>>stellate<<458>>$1!){
				}
				if(s!Stem([ ,;<]+)!<<459>>Stem<<459>>$1!){
				}
				if(s! stem([ ,;<\v]+)! <<459>>stem<<459>>$1!){
				}
				if(s!Stems([ ,;<]+)!<<460>>Stems<<460>>$1!){
				}
				if(s! stems([ ,;<\v]+)! <<460>>stems<<460>>$1!){
				}
				if(s!Sterile([ ,;<]+)!<<461>>Sterile<<461>>$1!){
				}
				if(s! sterile([ ,;<\v]+)! <<461>>sterile<<461>>$1!){
				}
				if(s!Stigma([ ,;<]+)!<<462>>Stigma<<462>>$1!){
				}
				if(s! stigma([ ,;<\v]+)! <<462>>stigma<<462>>$1!){
				}
				if(s!Stigmas([ ,;<]+)!<<463>>Stigmas<<463>>$1!){
				}
				if(s! stigmas([ ,;<\v]+)! <<463>>stigmas<<463>>$1!){
				}
				if(s!Stigmata([ ,;<]+)!<<464>>Stigmata<<464>>$1!){
				}
				if(s! stigmata([ ,;<\v]+)! <<464>>stigmata<<464>>$1!){
				}
				if(s!Stipe([ ,;<]+)!<<465>>Stipe<<465>>$1!){
				}
				if(s! stipe([ ,;<\v]+)! <<465>>stipe<<465>>$1!){
				}
				if(s!Stipes([ ,;<]+)!<<466>>Stipes<<466>>$1!){
				}
				if(s! stipes([ ,;<\v]+)! <<466>>stipes<<466>>$1!){
				}
				if(s!Stipule([ ,;<]+)!<<467>>Stipule<<467>>$1!){
				}
				if(s! stipule([ ,;<\v]+)! <<467>>stipule<<467>>$1!){
				}
				if(s!Stipules([ ,;<]+)!<<468>>Stipules<<468>>$1!){
				}
				if(s! stipules([ ,;<\v]+)! <<468>>stipules<<468>>$1!){
				}
				if(s!Stolon([ ,;<]+)!<<469>>Stolon<<469>>$1!){
				}
				if(s! stolon([ ,;<\v]+)! <<469>>stolon<<469>>$1!){
				}
				if(s!Stolons([ ,;<]+)!<<470>>Stolons<<470>>$1!){
				}
				if(s! stolons([ ,;<\v]+)! <<470>>stolons<<470>>$1!){
				}
				if(s!Stoma([ ,;<]+)!<<471>>Stoma<<471>>$1!){
				}
				if(s! stoma([ ,;<\v]+)! <<471>>stoma<<471>>$1!){
				}
				if(s!Stomata([ ,;<]+)!<<472>>Stomata<<472>>$1!){
				}
				if(s! stomata([ ,;<\v]+)! <<472>>stomata<<472>>$1!){
				}
				if(s!Stomate([ ,;<]+)!<<473>>Stomate<<473>>$1!){
				}
				if(s! stomate([ ,;<\v]+)! <<473>>stomate<<473>>$1!){
				}
				if(s!Stoma([ ,;<]+)!<<474>>Stoma<<474>>$1!){
				}
				if(s! stoma([ ,;<\v]+)! <<474>>stoma<<474>>$1!){
				}
				if(s!Stone([ ,;<]+)!<<475>>Stone<<475>>$1!){
				}
				if(s! stone([ ,;<\v]+)! <<475>>stone<<475>>$1!){
				}
				if(s!Stones([ ,;<]+)!<<476>>Stones<<476>>$1!){
				}
				if(s! stones([ ,;<\v]+)! <<476>>stones<<476>>$1!){
				}
				if(s!Stout([ ,;<]+)!<<477>>Stout<<477>>$1!){
				}
				if(s! stout([ ,;<\v]+)! <<477>>stout<<477>>$1!){
				}
				if(s!Striate([ ,;<]+)!<<478>>Striate<<478>>$1!){
				}
				if(s! striate([ ,;<\v]+)! <<478>>striate<<478>>$1!){
				}
				if(s!Strigose([ ,;<]+)!<<479>>Strigose<<479>>$1!){
				}
				if(s! strigose([ ,;<\v]+)! <<479>>strigose<<479>>$1!){
				}
				if(s!Style([ ,;<]+)!<<480>>Style<<480>>$1!){
				}
				if(s! style([ ,;<\v]+)! <<480>>style<<480>>$1!){
				}
				if(s!Styles([ ,;<]+)!<<481>>Styles<<481>>$1!){
				}
				if(s! styles([ ,;<\v]+)! <<481>>styles<<481>>$1!){
				}
				if(s!Subalpine([ ,;<]+)!<<482>>Subalpine<<482>>$1!){
				}
				if(s! subalpine([ ,;<\v]+)! <<482>>subalpine<<482>>$1!){
				}
				if(s!Submersed([ ,;<]+)!<<483>>Submersed<<483>>$1!){
				}
				if(s! submersed([ ,;<\v]+)! <<483>>submersed<<483>>$1!){
				}
				if(s!Subshrub([ ,;<]+)!<<484>>Subshrub<<484>>$1!){
				}
				if(s! subshrub([ ,;<\v]+)! <<484>>subshrub<<484>>$1!){
				}
				if(s!Subshrubs([ ,;<]+)!<<485>>Subshrubs<<485>>$1!){
				}
				if(s! subshrubs([ ,;<\v]+)! <<485>>subshrubs<<485>>$1!){
				}
				if(s!Subtend([ ,;<]+)!<<486>>Subtend<<486>>$1!){
				}
				if(s! subtend([ ,;<\v]+)! <<486>>subtend<<486>>$1!){
				}
				if(s!Subtidal([ ,;<]+)!<<487>>Subtidal<<487>>$1!){
				}
				if(s! subtidal([ ,;<\v]+)! <<487>>subtidal<<487>>$1!){
				}
				if(s!Superior([ ,;<]+)!<<488>>Superior<<488>>$1!){
				}
				if(s! superior([ ,;<\v]+)! <<488>>superior<<488>>$1!){
				}
				if(s!Suture([ ,;<]+)!<<489>>Suture<<489>>$1!){
				}
				if(s! suture([ ,;<\v]+)! <<489>>suture<<489>>$1!){
				}
				if(s!Sutures([ ,;<]+)!<<490>>Sutures<<490>>$1!){
				}
				if(s! sutures([ ,;<\v]+)! <<490>>sutures<<490>>$1!){
				}
				if(s!Swamp([ ,;<]+)!<<491>>Swamp<<491>>$1!){
				}
				if(s! swamp([ ,;<\v]+)! <<491>>swamp<<491>>$1!){
				}
				if(s!Swamps([ ,;<]+)!<<492>>Swamps<<492>>$1!){
				}
				if(s! swamps([ ,;<\v]+)! <<492>>swamps<<492>>$1!){
				}
				if(s!Talus([ ,;<]+)!<<493>>Talus<<493>>$1!){
				}
				if(s! talus([ ,;<\v]+)! <<493>>talus<<493>>$1!){
				}
				if(s!Tapered([ ,;<]+)!<<494>>Tapered<<494>>$1!){
				}
				if(s! tapered([ ,;<\v]+)! <<494>>tapered<<494>>$1!){
				}
				if(s!Taproot([ ,;<]+)!<<495>>Taproot<<495>>$1!){
				}
				if(s! taproot([ ,;<\v]+)! <<495>>taproot<<495>>$1!){
				}
				if(s!Taproots([ ,;<]+)!<<496>>Taproots<<496>>$1!){
				}
				if(s! taproots([ ,;<\v]+)! <<496>>taproots<<496>>$1!){
				}
				if(s!Taxon([ ,;<]+)!<<497>>Taxon<<497>>$1!){
				}
				if(s! taxon([ ,;<\v]+)! <<497>>taxon<<497>>$1!){
				}
				if(s!Taxa([ ,;<]+)!<<498>>Taxa<<498>>$1!){
				}
				if(s! taxa([ ,;<\v]+)! <<498>>taxa<<498>>$1!){
				}
				if(s!Tendril([ ,;<]+)!<<499>>Tendril<<499>>$1!){
				}
				if(s! tendril([ ,;<\v]+)! <<499>>tendril<<499>>$1!){
				}
				if(s!Tendrils([ ,;<]+)!<<500>>Tendrils<<500>>$1!){
				}
				if(s! tendrils([ ,;<\v]+)! <<500>>tendrils<<500>>$1!){
				}
				if(s!Terminal([ ,;<]+)!<<501>>Terminal<<501>>$1!){
				}
				if(s! terminal([ ,;<\v]+)! <<501>>terminal<<501>>$1!){
				}
				if(s!Ternate([ ,;<]+)!<<502>>Ternate<<502>>$1!){
				}
				if(s! ternate([ ,;<\v]+)! <<502>>ternate<<502>>$1!){
				}
				if(s!Thorn([ ,;<]+)!<<503>>Thorn<<503>>$1!){
				}
				if(s! thorn([ ,;<\v]+)! <<503>>thorn<<503>>$1!){
				}
				if(s!Thorns([ ,;<]+)!<<504>>Thorns<<504>>$1!){
				}
				if(s! thorns([ ,;<\v]+)! <<504>>thorns<<504>>$1!){
				}
				if(s!Throat([ ,;<]+)!<<505>>Throat<<505>>$1!){
				}
				if(s! throat([ ,;<\v]+)! <<505>>throat<<505>>$1!){
				}
				if(s!Throats([ ,;<]+)!<<506>>Throats<<506>>$1!){
				}
				if(s! throats([ ,;<\v]+)! <<506>>throats<<506>>$1!){
				}
				if(s!Timberline([ ,;<]+)!<<507>>Timberline<<507>>$1!){
				}
				if(s! timberline([ ,;<\v]+)! <<507>>timberline<<507>>$1!){
				}
				if(s!Tomentose([ ,;<]+)!<<508>>Tomentose<<508>>$1!){
				}
				if(s! tomentose([ ,;<\v]+)! <<508>>tomentose<<508>>$1!){
				}
				if(s!Tooth([ ,;<]+)!<<509>>Tooth<<509>>$1!){
				}
				if(s! tooth([ ,;<\v]+)! <<509>>tooth<<509>>$1!){
				}
				if(s!Teeth([ ,;<]+)!<<510>>Teeth<<510>>$1!){
				}
				if(s! teeth([ ,;<\v]+)! <<510>>teeth<<510>>$1!){
				}
				if(s!Transverse([ ,;<]+)!<<511>>Transverse<<511>>$1!){
				}
				if(s! transverse([ ,;<\v]+)! <<511>>transverse<<511>>$1!){
				}
				if(s!Tree([ ,;<]+)!<<512>>Tree<<512>>$1!){
				}
				if(s! tree([ ,;<\v]+)! <<512>>tree<<512>>$1!){
				}
				if(s!Trees([ ,;<]+)!<<513>>Trees<<513>>$1!){
				}
				if(s! trees([ ,;<\v]+)! <<513>>trees<<513>>$1!){
				}
				if(s!Trilete spore([ ,;<]+)!<<514>>Trilete spore<<514>>$1!){
				}
				if(s! trilete spore([ ,;<\v]+)! <<514>>trilete spore<<514>>$1!){
				}
				if(s!Truncate([ ,;<]+)!<<515>>Truncate<<515>>$1!){
				}
				if(s! truncate([ ,;<\v]+)! <<515>>truncate<<515>>$1!){
				}
				if(s!Trophophore([ ,;<]+)!<<516>>Trophophore<<516>>$1!){
				}
				if(s! trophophore([ ,;<\v]+)! <<516>>trophophore<<516>>$1!){
				}
				if(s!Tube([ ,;<]+)!<<517>>Tube<<517>>$1!){
				}
				if(s! tube([ ,;<\v]+)! <<517>>tube<<517>>$1!){
				}
				if(s!Tubes([ ,;<]+)!<<518>>Tubes<<518>>$1!){
				}
				if(s! tubes([ ,;<\v]+)! <<518>>tubes<<518>>$1!){
				}
				if(s!Tuber([ ,;<]+)!<<519>>Tuber<<519>>$1!){
				}
				if(s! tuber([ ,;<\v]+)! <<519>>tuber<<519>>$1!){
				}
				if(s!Tubers([ ,;<]+)!<<520>>Tubers<<520>>$1!){
				}
				if(s! tubers([ ,;<\v]+)! <<520>>tubers<<520>>$1!){
				}
				if(s!Tubercle([ ,;<]+)!<<521>>Tubercle<<521>>$1!){
				}
				if(s! tubercle([ ,;<\v]+)! <<521>>tubercle<<521>>$1!){
				}
				if(s!Tubercles([ ,;<]+)!<<522>>Tubercles<<522>>$1!){
				}
				if(s! tubercles([ ,;<\v]+)! <<522>>tubercles<<522>>$1!){
				}
				if(s!Twig([ ,;<]+)!<<523>>Twig<<523>>$1!){
				}
				if(s! twig([ ,;<\v]+)! <<523>>twig<<523>>$1!){
				}
				if(s!Twigs([ ,;<]+)!<<524>>Twigs<<524>>$1!){
				}
				if(s! twigs([ ,;<\v]+)! <<524>>twigs<<524>>$1!){
				}
				if(s!Twining([ ,;<]+)!<<525>>Twining<<525>>$1!){
				}
				if(s! twining([ ,;<\v]+)! <<525>>twining<<525>>$1!){
				}
				if(s!Ultimate([ ,;<]+)!<<526>>Ultimate<<526>>$1!){
				}
				if(s! ultimate([ ,;<\v]+)! <<526>>ultimate<<526>>$1!){
				}
				if(s!Umbel([ ,;<]+)!<<527>>Umbel<<527>>$1!){
				}
				if(s! umbel([ ,;<\v]+)! <<527>>umbel<<527>>$1!){
				}
				if(s!Umbels([ ,;<]+)!<<528>>Umbels<<528>>$1!){
				}
				if(s! umbels([ ,;<\v]+)! <<528>>umbels<<528>>$1!){
				}
				if(s!Understory([ ,;<]+)!<<529>>Understory<<529>>$1!){
				}
				if(s! understory([ ,;<\v]+)! <<529>>understory<<529>>$1!){
				}
				if(s!Unisexual([ ,;<]+)!<<530>>Unisexual<<530>>$1!){
				}
				if(s! unisexual([ ,;<\v]+)! <<530>>unisexual<<530>>$1!){
				}
				if(s!Urn-shaped([ ,;<]+)!<<531>>Urn-shaped<<531>>$1!){
				}
				if(s! urn-shaped([ ,;<\v]+)! <<531>>urn-shaped<<531>>$1!){
				}
				if(s!Utricle([ ,;<]+)!<<532>>Utricle<<532>>$1!){
				}
				if(s! utricle([ ,;<\v]+)! <<532>>utricle<<532>>$1!){
				}
				if(s!Utricles([ ,;<]+)!<<533>>Utricles<<533>>$1!){
				}
				if(s! utricles([ ,;<\v]+)! <<533>>utricles<<533>>$1!){
				}
				if(s!Valve([ ,;<]+)!<<534>>Valve<<534>>$1!){
				}
				if(s! valve([ ,;<\v]+)! <<534>>valve<<534>>$1!){
				}
				if(s!Valves([ ,;<]+)!<<535>>Valves<<535>>$1!){
				}
				if(s! valves([ ,;<\v]+)! <<535>>valves<<535>>$1!){
				}
				if(s!Vascular([ ,;<]+)!<<536>>Vascular<<536>>$1!){
				}
				if(s! vascular([ ,;<\v]+)! <<536>>vascular<<536>>$1!){
				}
				if(s!Vein([ ,;<]+)!<<537>>Vein<<537>>$1!){
				}
				if(s! vein([ ,;<\v]+)! <<537>>vein<<537>>$1!){
				}
				if(s!Veins([ ,;<]+)!<<538>>Veins<<538>>$1!){
				}
				if(s! veins([ ,;<\v]+)! <<538>>veins<<538>>$1!){
				}
				if(s!Vernal pool([ ,;<]+)!<<539>>Vernal pool<<539>>$1!){
				}
				if(s! vernal pool([ ,;<\v]+)! <<539>>vernal pool<<539>>$1!){
				}
				if(s!Vernal pools([ ,;<]+)!<<540>>Vernal pools<<540>>$1!){
				}
				if(s! vernal pools([ ,;<\v]+)! <<540>>vernal pools<<540>>$1!){
				}
				if(s!Vestigial([ ,;<]+)!<<541>>Vestigial<<541>>$1!){
				}
				if(s! vestigial([ ,;<\v]+)! <<541>>vestigial<<541>>$1!){
				}
				if(s!Vine([ ,;<]+)!<<542>>Vine<<542>>$1!){
				}
				if(s! vine([ ,;<\v]+)! <<542>>vine<<542>>$1!){
				}
				if(s!Vines([ ,;<]+)!<<543>>Vines<<543>>$1!){
				}
				if(s! vines([ ,;<\v]+)! <<543>>vines<<543>>$1!){
				}
				if(s!Waif([ ,;<]+)!<<544>>Waif<<544>>$1!){
				}
				if(s! waif([ ,;<\v]+)! <<544>>waif<<544>>$1!){
				}
				if(s!Waifs([ ,;<]+)!<<545>>Waifs<<545>>$1!){
				}
				if(s! waifs([ ,;<\v]+)! <<545>>waifs<<545>>$1!){
				}
				if(s!Wash([ ,;<]+)!<<546>>Wash<<546>>$1!){
				}
				if(s! wash([ ,;<\v]+)! <<546>>wash<<546>>$1!){
				}
				if(s!Washes([ ,;<]+)!<<547>>Washes<<547>>$1!){
				}
				if(s! washes([ ,;<\v]+)! <<547>>washes<<547>>$1!){
				}
				if(s!Whorled([ ,;<]+)!<<548>>Whorled<<548>>$1!){
				}
				if(s! whorled([ ,;<\v]+)! <<548>>whorled<<548>>$1!){
				}
				if(s!Whorl([ ,;<]+)!<<549>>Whorl<<549>>$1!){
				}
				if(s! whorl([ ,;<\v]+)! <<549>>whorl<<549>>$1!){
				}
				if(s!Wing([ ,;<]+)!<<550>>Wing<<550>>$1!){
				}
				if(s! wing([ ,;<\v]+)! <<550>>wing<<550>>$1!){
				}
				if(s!Wings([ ,;<]+)!<<551>>Wings<<551>>$1!){
				}
				if(s! wings([ ,;<\v]+)! <<551>>wings<<551>>$1!){
				}
				if(s!Wiry([ ,;<]+)!<<552>>Wiry<<552>>$1!){
				}
				if(s! wiry([ ,;<\v]+)! <<552>>wiry<<552>>$1!){
				}
				if(s!Wood([ ,;<]+)!<<553>>Wood<<553>>$1!){
				}
				if(s! wood([ ,;<\v]+)! <<553>>wood<<553>>$1!){
				}
				if(s!Woody([ ,;<]+)!<<554>>Woody<<554>>$1!){
				}
				if(s! woody([ ,;<\v]+)! <<554>>woody<<554>>$1!){
				}
				if(s!Woodland([ ,;<]+)!<<555>>Woodland<<555>>$1!){
				}
				if(s! woodland([ ,;<\v]+)! <<555>>woodland<<555>>$1!){
				}
				if(s!Woodlands([ ,;<]+)!<<556>>Woodlands<<556>>$1!){
				}
				if(s! woodlands([ ,;<\v]+)! <<556>>woodlands<<556>>$1!){
				}
					}
				}	
			}
		}
	}	
		print OUT $_;


}
close(IN);
close(OUT);



$file="output/eflora_family_key_expanded.txt";

$file_expanded="output/eflora_family_key_expanded_html.txt";

open(OUT, ">", $file_expanded) || die;

open(IN,$file) || die "couldn't open $file\n";
warn "reading from $file\n";

	while(<IN>){

				if(s!<<1>>Abaxial<<1>>!<u class="dotted" title="The side or surface of a structure away from the axis on which the structure is borne (e.g., the lower surface of a leaf, the outer surface of a petal)." >Abaxial</u>!){
				}
				if(s! <<1>>abaxial<<1>>!&nbsp;<u class="dotted" title="The side or surface of a structure away from the axis on which the structure is borne (e.g., the lower surface of a leaf, the outer surface of a petal)." >abaxial</u>!){
				}
				if(s!<<2>>Achene<<2>>!<u class="dotted" title="Dry, indehiscent, 1-seeded fruit from a 1-chambered ovary, sometimes winged, often appearing to be a naked seed. A 1-seeded dry fruit derived from an inferior ovary of > 1 carpel (e.g., Asteraceae, Dipsacaceae) is sometimes called a cypsela." >Achene</u>!){
				}
				if(s! <<2>>achene<<2>>!&nbsp;<div class="dropdown"><u class="dotted">achene</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/achene.jpg" class="large-image" alt="image missing" >Dry, indehiscent, 1-seeded fruit from a 1-chambered ovary, sometimes winged, often appearing to be a naked seed. A 1-seeded dry fruit derived from an inferior ovary of > 1 carpel (e.g., Asteraceae, Dipsacaceae) is sometimes called a cypsela.</div></div>!){
				}
				if(s!<<3>>Achenes<<3>>!<u class="dotted" title="Dry, indehiscent, 1-seeded fruit from a 1-chambered ovary, sometimes winged, often appearing to be a naked seed. A 1-seeded dry fruit derived from an inferior ovary of > 1 carpel (e.g., Asteraceae, Dipsacaceae) is sometimes called a cypsela." >Achenes</u>!){
				}
				if(s! <<3>>achenes<<3>>!&nbsp;<u class="dotted" title="Dry, indehiscent, 1-seeded fruit from a 1-chambered ovary, sometimes winged, often appearing to be a naked seed. A 1-seeded dry fruit derived from an inferior ovary of > 1 carpel (e.g., Asteraceae, Dipsacaceae) is sometimes called a cypsela." >achenes</u>!){
				}
				if(s!<<4>>Acidic<<4>>!<u class="dotted" title="Soil or water with a low pH, often found in habitats such as coniferous forests and bogs where decomposition of plant remains liberates an excess of hydrogen ions." >Acidic</u>!){
				}
				if(s! <<4>>acidic<<4>>!&nbsp;<u class="dotted" title="Soil or water with a low pH, often found in habitats such as coniferous forests and bogs where decomposition of plant remains liberates an excess of hydrogen ions." >acidic</u>!){
				}
				if(s!<<5>>Acuminate<<5>>!<u class="dotted" title="Having a long-tapered, sharp tip, the sides concave." >Acuminate</u>!){
				}
				if(s! <<5>>acuminate<<5>>!&nbsp;<div class="dropdown"><u class="dotted">acuminate</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/acuminate.jpg" class="large-image" alt="image missing" >Having a long-tapered, sharp tip, the sides concave.</div></div>!){
				}
				if(s!<<6>>Acute<<6>>!<u class="dotted" title="Having a short-tapered, sharp tip, the sides convex or straight and converging at less than a right angle." >Acute</u>!){
				}
				if(s! <<6>>acute<<6>>!&nbsp;<div class="dropdown"><u class="dotted">acute</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/acute.jpg" class="large-image" alt="image missing" >Having a short-tapered, sharp tip, the sides convex or straight and converging at less than a right angle.</div></div>!){
				}
				if(s!<<7>>Adaxial<<7>>!<u class="dotted" title="The side or surface of a structure toward the axis on which the structure is borne (e.g., the upper surface of a leaf, the inner surface of a petal)." >Adaxial</u>!){
				}
				if(s! <<7>>adaxial<<7>>!&nbsp;<u class="dotted" title="The side or surface of a structure toward the axis on which the structure is borne (e.g., the upper surface of a leaf, the inner surface of a petal)." >adaxial</u>!){
				}
				if(s!<<8>>Adherent<<8>>!<u class="dotted" title="Sticking to and sometimes appearing fused to another part of like or unlike kind, but separable from it, such as 'perianth adherent to fruit'." >Adherent</u>!){
				}
				if(s! <<8>>adherent<<8>>!&nbsp;<u class="dotted" title="Sticking to and sometimes appearing fused to another part of like or unlike kind, but separable from it, such as 'perianth adherent to fruit'." >adherent</u>!){
				}
				if(s!<<9>>Adventitious<<9>>!<u class="dotted" title="Arising at unusual times or places, such as  roots on aerial stems." >Adventitious</u>!){
				}
				if(s! <<9>>adventitious<<9>>!&nbsp;<u class="dotted" title="Arising at unusual times or places, such as  roots on aerial stems." >adventitious</u>!){
				}
				if(s!<<10>>Alien<<10>>!<u class="dotted" title="Not native; introduced purposely or accidentally into an area." >Alien</u>!){
				}
				if(s! <<10>>alien<<10>>!&nbsp;<u class="dotted" title="Not native; introduced purposely or accidentally into an area." >alien</u>!){
				}
				if(s!<<11>>Alkali<<11>>!<u class="dotted" title="Soil or water with a high pH (i.e., basic), often found in areas where evaporation concentrates dissolved solutes." >Alkali</u>!){
				}
				if(s! <<11>>alkali<<11>>!&nbsp;<u class="dotted" title="Soil or water with a high pH (i.e., basic), often found in areas where evaporation concentrates dissolved solutes." >alkali</u>!){
				}
				if(s!<<12>>Alkaline<<12>>!<u class="dotted" title="Soil or water with a high pH (i.e., basic), often found in areas where evaporation concentrates dissolved solutes." >Alkaline</u>!){
				}
				if(s! <<12>>alkaline<<12>>!&nbsp;<u class="dotted" title="Soil or water with a high pH (i.e., basic), often found in areas where evaporation concentrates dissolved solutes." >alkaline</u>!){
				}
				if(s!<<13>>Alluvial<<13>>!<u class="dotted" title="Pertaining to sediments deposited by flowing water." >Alluvial</u>!){
				}
				if(s! <<13>>alluvial<<13>>!&nbsp;<u class="dotted" title="Pertaining to sediments deposited by flowing water." >alluvial</u>!){
				}
				if(s!<<14>>Alpine<<14>>!<u class="dotted" title="Pertaining to the vegetational--altitudinal zone above timberline; zone above the subalpine." >Alpine</u>!){
				}
				if(s! <<14>>alpine<<14>>!&nbsp;<u class="dotted" title="Pertaining to the vegetational--altitudinal zone above timberline; zone above the subalpine." >alpine</u>!){
				}
				if(s!<<15>>Alternate<<15>>!<u class="dotted" title="1. Arranged singly, often spirally, along an axis - e.g., one leaf per node. 2. Occurring in different ranks, appearing to be between, not directly above or below, as 'stamens alternate petals'." >Alternate</u>!){
				}
				if(s! <<15>>alternate<<15>>!&nbsp;<div class="dropdown"><u class="dotted">alternate</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/alternate.jpg" class="large-image" alt="image missing" >1. Arranged singly, often spirally, along an axis - e.g., one leaf per node. 2. Occurring in different ranks, appearing to be between, not directly above or below, as 'stamens alternate petals'.</div></div>!){
				}
				if(s!<<16>>Angiosperm<<16>>!<u class="dotted" title="Plant that bears flowers (hence, 'flowering plant'), in which 'vesseled seeds' (hence, angio-sperm) are enclosed in an ovary; woody to herbaceous." >Angiosperm</u>!){
				}
				if(s! <<16>>angiosperm<<16>>!&nbsp;<u class="dotted" title="Plant that bears flowers (hence, 'flowering plant'), in which 'vesseled seeds' (hence, angio-sperm) are enclosed in an ovary; woody to herbaceous." >angiosperm</u>!){
				}
				if(s!<<17>>Angiosperms<<17>>!<u class="dotted" title="Plant that bears flowers (hence, 'flowering plant'), in which 'vesseled seeds' (hence, angio-sperm) are enclosed in an ovary; woody to herbaceous." >Angiosperms</u>!){
				}
				if(s! <<17>>angiosperms<<17>>!&nbsp;<u class="dotted" title="Plant that bears flowers (hence, 'flowering plant'), in which 'vesseled seeds' (hence, angio-sperm) are enclosed in an ovary; woody to herbaceous." >angiosperms</u>!){
				}
				if(s!<<18>>Annual<<18>>!<u class="dotted" title="Completing life cycle (germination through death) in one year or growing season, generally non-woody." >Annual</u>!){
				}
				if(s! <<18>>annual<<18>>!&nbsp;<u class="dotted" title="Completing life cycle (germination through death) in one year or growing season, generally non-woody." >annual</u>!){
				}
				if(s!<<19>>Annulus<<19>>!<u class="dotted" title="On the sporangium of most ferns, a row of cells with partly thickened walls that functions in the release of spores." >Annulus</u>!){
				}
				if(s! <<19>>annulus<<19>>!&nbsp;<u class="dotted" title="On the sporangium of most ferns, a row of cells with partly thickened walls that functions in the release of spores." >annulus</u>!){
				}
				if(s!<<20>>Annuli<<20>>!<u class="dotted" title="On the sporangium of most ferns, a row of cells with partly thickened walls that functions in the release of spores." >Annuli</u>!){
				}
				if(s! <<20>>annuli<<20>>!&nbsp;<u class="dotted" title="On the sporangium of most ferns, a row of cells with partly thickened walls that functions in the release of spores." >annuli</u>!){
				}
				if(s!<<21>>Anther<<21>>!<u class="dotted" title="Pollen-bearing portion of a stamen, including one, two, or four pollen sacs." >Anther</u>!){
				}
				if(s! <<21>>anther<<21>>!&nbsp;<u class="dotted" title="Pollen-bearing portion of a stamen, including one, two, or four pollen sacs." >anther</u>!){
				}
				if(s!<<22>>Anthers<<22>>!<u class="dotted" title="Pollen-bearing portion of a stamen, including one, two, or four pollen sacs." >Anthers</u>!){
				}
				if(s! <<22>>anthers<<22>>!&nbsp;<u class="dotted" title="Pollen-bearing portion of a stamen, including one, two, or four pollen sacs." >anthers</u>!){
				}
				if(s!<<23>>Appressed<<23>>!<u class="dotted" title="Parallel or nearly parallel to and often in contact with surface of origin; used to describe the disposition of hairs, leaves, pedicels, etc." >Appressed</u>!){
				}
				if(s! <<23>>appressed<<23>>!&nbsp;<div class="dropdown"><u class="dotted">appressed</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/appressed.jpg" class="large-image" alt="image missing" >Parallel or nearly parallel to and often in contact with surface of origin; used to describe the disposition of hairs, leaves, pedicels, etc.</div></div>!){
				}
				if(s!<<24>>Apogamous<<24>>!<u class="dotted" title="Forming a sporophyte (the generation in a vascular plant life cycle that is conspicuous, 2n, and produces spores, which give rise to gametophytes) from a gametophyte (the generation in a vascular plant life cycle that is inconspicuous, n, and produces sperms and eggs, which usually unite in fertilization to give rise to sporophytes) by direct, asexual development, rather than by fertilization of eggs by sperms." >Apogamous</u>!){
				}
				if(s! <<24>>apogamous<<24>>!&nbsp;<u class="dotted" title="Forming a sporophyte (the generation in a vascular plant life cycle that is conspicuous, 2n, and produces spores, which give rise to gametophytes) from a gametophyte (the generation in a vascular plant life cycle that is inconspicuous, n, and produces sperms and eggs, which usually unite in fertilization to give rise to sporophytes) by direct, asexual development, rather than by fertilization of eggs by sperms." >apogamous</u>!){
				}
				if(s!<<25>>Aquatic<<25>>!<u class="dotted" title="Growing under, in, or on water (generally fresh; if brackish, saline, or marine, so indicated), whether rooted in bottom or floating, and including plants with parts of shoots submersed but with other parts above water; excluding plants of seeps or wet rocks. (e.g., Potamogeton gramineus)" >Aquatic</u>!){
				}
				if(s! <<25>>aquatic<<25>>!&nbsp;<u class="dotted" title="Growing under, in, or on water (generally fresh; if brackish, saline, or marine, so indicated), whether rooted in bottom or floating, and including plants with parts of shoots submersed but with other parts above water; excluding plants of seeps or wet rocks. (e.g., Potamogeton gramineus)" >aquatic</u>!){
				}
				if(s!<<26>>Areole<<26>>!<u class="dotted" title="1. In Cactaceae, a well-defined, axillary area bearing one to many spines and generally other, shorter structures  (e.g., Ferocactus cylindraceus).  2.  In general, each of many areas defined by smallest veins on a leaf ." >Areole</u>!){
				}
				if(s! <<26>>areole<<26>>!&nbsp;<u class="dotted" title="1. In Cactaceae, a well-defined, axillary area bearing one to many spines and generally other, shorter structures  (e.g., Ferocactus cylindraceus).  2.  In general, each of many areas defined by smallest veins on a leaf ." >areole</u>!){
				}
				if(s!<<27>>Areoles<<27>>!<u class="dotted" title="1. In Cactaceae, a well-defined, axillary area bearing one to many spines and generally other, shorter structures  (e.g., Ferocactus cylindraceus).  2.  In general, each of many areas defined by smallest veins on a leaf ." >Areoles</u>!){
				}
				if(s! <<27>>areoles<<27>>!&nbsp;<u class="dotted" title="1. In Cactaceae, a well-defined, axillary area bearing one to many spines and generally other, shorter structures  (e.g., Ferocactus cylindraceus).  2.  In general, each of many areas defined by smallest veins on a leaf ." >areoles</u>!){
				}
				if(s!<<28>>Aril<<28>>!<u class="dotted" title="Fleshy, corky, or bony appendage arising at or near the point of seed attachment, sometimes completely covering the seed." >Aril</u>!){
				}
				if(s! <<28>>aril<<28>>!&nbsp;<u class="dotted" title="Fleshy, corky, or bony appendage arising at or near the point of seed attachment, sometimes completely covering the seed." >aril</u>!){
				}
				if(s!<<29>>Arils<<29>>!<u class="dotted" title="Fleshy, corky, or bony appendage arising at or near the point of seed attachment, sometimes completely covering the seed." >Arils</u>!){
				}
				if(s! <<29>>arils<<29>>!&nbsp;<u class="dotted" title="Fleshy, corky, or bony appendage arising at or near the point of seed attachment, sometimes completely covering the seed." >arils</u>!){
				}
				if(s!<<30>>Armed<<30>>!<u class="dotted" title="Bearing prickles, spines, or thorns." >Armed</u>!){
				}
				if(s! <<30>>armed<<30>>!&nbsp;<u class="dotted" title="Bearing prickles, spines, or thorns." >armed</u>!){
				}
				if(s!<<31>>Ascending<<31>>!<u class="dotted" title="Curving or angling upward from base, or about 30-60 degrees less than vertical or away from axis of attachment." >Ascending</u>!){
				}
				if(s! <<31>>ascending<<31>>!&nbsp;<div class="dropdown"><u class="dotted">ascending</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/ascending-STEM.jpg" class="large-image" alt="image missing" >Curving or angling upward from base, or about 30-60 degrees less than vertical or away from axis of attachment.</div></div>!){
				}
				if(s!<<32>>Asymmetric<<32>>!<u class="dotted" title="Not divisible into identical or mirror-image halves." >Asymmetric</u>!){
				}
				if(s! <<32>>asymmetric<<32>>!&nbsp;<div class="dropdown"><u class="dotted">asymmetric</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/asymmetric.jpg" class="large-image" alt="image missing" >Not divisible into identical or mirror-image halves.</div></div>!){
				}
				if(s!<<33>>Auricle<<33>>!<u class="dotted" title="In Poaceae, a structure, often lanceolate, projecting from both margins of the leaf lateral to the ligule." >Auricle</u>!){
				}
				if(s! <<33>>auricle<<33>>!&nbsp;<div class="dropdown"><u class="dotted">auricle</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/grass-leaf-auricle.jpg" class="large-image" alt="image missing" >In Poaceae, a structure, often lanceolate, projecting from both margins of the leaf lateral to the ligule.</div></div>!){
				}
				if(s!<<34>>Auricles<<34>>!<u class="dotted" title="In Poaceae, a structure, often lanceolate, projecting from both margins of the leaf lateral to the ligule." >Auricles</u>!){
				}
				if(s! <<34>>auricles<<34>>!&nbsp;<u class="dotted" title="In Poaceae, a structure, often lanceolate, projecting from both margins of the leaf lateral to the ligule." >auricles</u>!){
				}
				if(s!<<35>>Awn<<35>>!<u class="dotted" title="1. Bristle-like appendage or elongation, generally terminal.  2. Stiff, needle-like pappus element in Asteraceae." >Awn</u>!){
				}
				if(s! <<35>>awn<<35>>!&nbsp;<div class="dropdown"><u class="dotted">awn</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/awned.jpg" class="large-image" alt="image missing" >1. Bristle-like appendage or elongation, generally terminal.  2. Stiff, needle-like pappus element in Asteraceae.</div></div>!){
				}
				if(s!<<36>>Awns<<36>>!<u class="dotted" title="1. Bristle-like appendage or elongation, generally terminal.  2. Stiff, needle-like pappus element in Asteraceae." >Awns</u>!){
				}
				if(s! <<36>>awns<<36>>!&nbsp;<div class="dropdown"><u class="dotted">awns</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/awned.jpg" class="large-image" alt="image missing" >1. Bristle-like appendage or elongation, generally terminal.  2. Stiff, needle-like pappus element in Asteraceae.</div></div>!){
				}
				if(s!<<37>>Axil<<37>>!<u class="dotted" title="Distal, adaxial angle between an appendage or branch and a main axis (e.g., between leaf and stem, or between lateral vein and midrib on a leaf)." >Axil</u>!){
				}
				if(s! <<37>>axil<<37>>!&nbsp;<div class="dropdown"><u class="dotted">axil</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/axil.jpg" class="large-image" alt="image missing" >Distal, adaxial angle between an appendage or branch and a main axis (e.g., between leaf and stem, or between lateral vein and midrib on a leaf).</div></div>!){
				}
				if(s!<<38>>Axils<<38>>!<u class="dotted" title="Distal, adaxial angle between an appendage or branch and a main axis (e.g., between leaf and stem, or between lateral vein and midrib on a leaf)." >Axils</u>!){
				}
				if(s! <<38>>axils<<38>>!&nbsp;<u class="dotted" title="Distal, adaxial angle between an appendage or branch and a main axis (e.g., between leaf and stem, or between lateral vein and midrib on a leaf)." >axils</u>!){
				}
				if(s!<<39>>Axile<<39>>!<u class="dotted" title="Pertaining to an axis, as of a placenta along the central axis in a compound ovary with more than one chamber." >Axile</u>!){
				}
				if(s! <<39>>axile<<39>>!&nbsp;<div class="dropdown"><u class="dotted">axile</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/axile-placenta.jpg" class="large-image" alt="image missing" >Pertaining to an axis, as of a placenta along the central axis in a compound ovary with more than one chamber.</div></div>!){
				}
				if(s!<<40>>Axillary<<40>>!<u class="dotted" title="Pertaining to or within an axil, especially a leaf axil." >Axillary</u>!){
				}
				if(s! <<40>>axillary<<40>>!&nbsp;<div class="dropdown"><u class="dotted">axillary</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/axillary-bud.jpg" class="large-image" alt="image missing" >Pertaining to or within an axil, especially a leaf axil.</div></div>!){
				}
				if(s!<<41>>Axis<<41>>!<u class="dotted" title="Line of direction, growth, or extension; structure occupying such a position - e.g., the main stem of a plant or inflorescence, the midrib of a leaf." >Axis</u>!){
				}
				if(s! <<41>>axis<<41>>!&nbsp;<u class="dotted" title="Line of direction, growth, or extension; structure occupying such a position - e.g., the main stem of a plant or inflorescence, the midrib of a leaf." >axis</u>!){
				}
				if(s!<<42>>Axes<<42>>!<u class="dotted" title="Line of direction, growth, or extension; structure occupying such a position - e.g., the main stem of a plant or inflorescence, the midrib of a leaf." >Axes</u>!){
				}
				if(s! <<42>>axes<<42>>!&nbsp;<u class="dotted" title="Line of direction, growth, or extension; structure occupying such a position - e.g., the main stem of a plant or inflorescence, the midrib of a leaf." >axes</u>!){
				}
				if(s!<<43>>Banner<<43>>!<u class="dotted" title="Uppermost, often largest petal of many members of Fabaceae." >Banner</u>!){
				}
				if(s! <<43>>banner<<43>>!&nbsp;<u class="dotted" title="Uppermost, often largest petal of many members of Fabaceae." >banner</u>!){
				}
				if(s!<<44>>Barbed<<44>>!<u class="dotted" title="Having sharp, normally downward- or backward-pointing projections.  Said of an awn, bristle, or other structure." >Barbed</u>!){
				}
				if(s! <<44>>barbed<<44>>!&nbsp;<div class="dropdown"><u class="dotted">barbed</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/barbed.jpg" class="large-image" alt="image missing" >Having sharp, normally downward- or backward-pointing projections.  Said of an awn, bristle, or other structure.</div></div>!){
				}
				if(s!<<45>>Bark<<45>>!<u class="dotted" title="Tough tissue (including phloem) covering the wood (hardened xylem) of subshrubs, shrubs, trees, and some vines." >Bark</u>!){
				}
				if(s! <<45>>bark<<45>>!&nbsp;<u class="dotted" title="Tough tissue (including phloem) covering the wood (hardened xylem) of subshrubs, shrubs, trees, and some vines." >bark</u>!){
				}
				if(s!<<46>>Basal<<46>>!<u class="dotted" title="At or near the base of a plant or plant part.  Especially said of leaves clustered near the ground or of a placenta confined to the base of an ovary." >Basal</u>!){
				}
				if(s! <<46>>basal<<46>>!&nbsp;<div class="dropdown"><u class="dotted">basal</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/basal-rosette.jpg" class="large-image" alt="image missing" >At or near the base of a plant or plant part.  Especially said of leaves clustered near the ground or of a placenta confined to the base of an ovary.</div></div>!){
				}
				if(s!<<47>>Beak<<47>>!<u class="dotted" title="Generally distal or terminal, narrowed, generally sterile part of fruit or surrounding structures (e.g., Ambrosia bur, Carex perigynium)." >Beak</u>!){
				}
				if(s! <<47>>beak<<47>>!&nbsp;<u class="dotted" title="Generally distal or terminal, narrowed, generally sterile part of fruit or surrounding structures (e.g., Ambrosia bur, Carex perigynium)." >beak</u>!){
				}
				if(s!<<48>>Beaks<<48>>!<u class="dotted" title="Generally distal or terminal, narrowed, generally sterile part of fruit or surrounding structures (e.g., Ambrosia bur, Carex perigynium)." >Beaks</u>!){
				}
				if(s! <<48>>beaks<<48>>!&nbsp;<u class="dotted" title="Generally distal or terminal, narrowed, generally sterile part of fruit or surrounding structures (e.g., Ambrosia bur, Carex perigynium)." >beaks</u>!){
				}
				if(s!<<49>>Berry<<49>>!<u class="dotted" title="Fleshy, indehiscent fruit in which the seeds are generally more than 1 and are not encased in a stone. (e.g., Solanum americanum)" >Berry</u>!){
				}
				if(s! <<49>>berry<<49>>!&nbsp;<u class="dotted" title="Fleshy, indehiscent fruit in which the seeds are generally more than 1 and are not encased in a stone. (e.g., Solanum americanum)" >berry</u>!){
				}
				if(s!<<50>>Biennial<<50>>!<u class="dotted" title="Completing life cycle (germination through death) in two years or growing seasons (generally flowering only in the second), non-woody (at least above ground), often with a rosette the first growing season." >Biennial</u>!){
				}
				if(s! <<50>>biennial<<50>>!&nbsp;<u class="dotted" title="Completing life cycle (germination through death) in two years or growing seasons (generally flowering only in the second), non-woody (at least above ground), often with a rosette the first growing season." >biennial</u>!){
				}
				if(s!<<51>>Bilateral<<51>>!<u class="dotted" title="Divisible into mirror-image halves in only one way." >Bilateral</u>!){
				}
				if(s! <<51>>bilateral<<51>>!&nbsp;<div class="dropdown"><u class="dotted">bilateral</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/bilateral.jpg" class="large-image" alt="image missing" >Divisible into mirror-image halves in only one way.</div></div>!){
				}
				if(s!<<52>>Biradial<<52>>!<u class="dotted" title="Divisible into mirror-image halves in two ways; isobilateral." >Biradial</u>!){
				}
				if(s! <<52>>biradial<<52>>!&nbsp;<div class="dropdown"><u class="dotted">biradial</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/biradial.jpg" class="large-image" alt="image missing" >Divisible into mirror-image halves in two ways; isobilateral.</div></div>!){
				}
				if(s!<<53>>Bisexual<<53>>!<u class="dotted" title="Both male and female reproductive parts occurring and functional in the same plant or structure (e.g., flower, spikelet, inflorescence)." >Bisexual</u>!){
				}
				if(s! <<53>>bisexual<<53>>!&nbsp;<div class="dropdown"><u class="dotted">bisexual</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/bisexual-flower.jpg" class="large-image" alt="image missing" >Both male and female reproductive parts occurring and functional in the same plant or structure (e.g., flower, spikelet, inflorescence).</div></div>!){
				}
				if(s!<<54>>Blade<<54>>!<u class="dotted" title="Expanded portion of a leaf, petal, or other structure, generally flat but sometimes rolled, cylindric, wavy, or cupped." >Blade</u>!){
				}
				if(s! <<54>>blade<<54>>!&nbsp;<div class="dropdown"><u class="dotted">blade</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/grass-leaf-blade.jpg" class="large-image" alt="image missing" >Expanded portion of a leaf, petal, or other structure, generally flat but sometimes rolled, cylindric, wavy, or cupped.</div></div>!){
				}
				if(s!<<55>>Blades<<55>>!<u class="dotted" title="Expanded portion of a leaf, petal, or other structure, generally flat but sometimes rolled, cylindric, wavy, or cupped." >Blades</u>!){
				}
				if(s! <<55>>blades<<55>>!&nbsp;<u class="dotted" title="Expanded portion of a leaf, petal, or other structure, generally flat but sometimes rolled, cylindric, wavy, or cupped." >blades</u>!){
				}
				if(s!<<56>>Brackish<<56>>!<u class="dotted" title="Somewhat salty, generally a mixture of saline and fresh water." >Brackish</u>!){
				}
				if(s! <<56>>brackish<<56>>!&nbsp;<u class="dotted" title="Somewhat salty, generally a mixture of saline and fresh water." >brackish</u>!){
				}
				if(s!<<57>>Bract<<57>>!<u class="dotted" title="Reduced, leaf- or scale-like structure subtending a branch, cone scale, peduncle, pedicel, or flower." >Bract</u>!){
				}
				if(s! <<57>>bract<<57>>!&nbsp;<div class="dropdown"><u class="dotted">bract</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/bract.jpg" class="large-image" alt="image missing" >Reduced, leaf- or scale-like structure subtending a branch, cone scale, peduncle, pedicel, or flower.</div></div>!){
				}
				if(s!<<58>>Bracts<<58>>!<u class="dotted" title="Reduced, leaf- or scale-like structure subtending a branch, cone scale, peduncle, pedicel, or flower." >Bracts</u>!){
				}
				if(s! <<58>>bracts<<58>>!&nbsp;<u class="dotted" title="Reduced, leaf- or scale-like structure subtending a branch, cone scale, peduncle, pedicel, or flower." >bracts</u>!){
				}
				if(s!<<59>>Bractlet<<59>>!<u class="dotted" title="1. Relatively small, generally secondary bract within an inflorescence.  2. Bract-like structure on a pedicel that often does not directly subtend another structure." >Bractlet</u>!){
				}
				if(s! <<59>>bractlet<<59>>!&nbsp;<u class="dotted" title="1. Relatively small, generally secondary bract within an inflorescence.  2. Bract-like structure on a pedicel that often does not directly subtend another structure." >bractlet</u>!){
				}
				if(s!<<60>>Bractlets<<60>>!<u class="dotted" title="1. Relatively small, generally secondary bract within an inflorescence.  2. Bract-like structure on a pedicel that often does not directly subtend another structure." >Bractlets</u>!){
				}
				if(s! <<60>>bractlets<<60>>!&nbsp;<u class="dotted" title="1. Relatively small, generally secondary bract within an inflorescence.  2. Bract-like structure on a pedicel that often does not directly subtend another structure." >bractlets</u>!){
				}
				if(s!<<61>>Bristle<<61>>!<u class="dotted" title="1. Relatively large, generally stiff, more or less straight hair. (e.g., Navarretia breweri) 2. In Asteraceae, fine, cylindric or minutely flattened pappus element (e.g., Calycoseris parryi) or epidermal outgrowth on the receptacle (e.g., Centaurea solstitialis)." >Bristle</u>!){
				}
				if(s! <<61>>bristle<<61>>!&nbsp;<u class="dotted" title="1. Relatively large, generally stiff, more or less straight hair. (e.g., Navarretia breweri) 2. In Asteraceae, fine, cylindric or minutely flattened pappus element (e.g., Calycoseris parryi) or epidermal outgrowth on the receptacle (e.g., Centaurea solstitialis)." >bristle</u>!){
				}
				if(s!<<62>>Bristles<<62>>!<u class="dotted" title="1. Relatively large, generally stiff, more or less straight hair. (e.g., Navarretia breweri) 2. In Asteraceae, fine, cylindric or minutely flattened pappus element (e.g., Calycoseris parryi) or epidermal outgrowth on the receptacle (e.g., Centaurea solstitialis)." >Bristles</u>!){
				}
				if(s! <<62>>bristles<<62>>!&nbsp;<u class="dotted" title="1. Relatively large, generally stiff, more or less straight hair. (e.g., Navarretia breweri) 2. In Asteraceae, fine, cylindric or minutely flattened pappus element (e.g., Calycoseris parryi) or epidermal outgrowth on the receptacle (e.g., Centaurea solstitialis)." >bristles</u>!){
				}
				if(s!<<63>>Bud<<63>>!<u class="dotted" title="1. An incompletely developed, more or less embryonic shoot, usually covered with bud scales.  2. An unopened flower, often protected by sepals." >Bud</u>!){
				}
				if(s! <<63>>bud<<63>>!&nbsp;<div class="dropdown"><u class="dotted">bud</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/bud-scale-scars.jpg" class="large-image" alt="image missing" >1. An incompletely developed, more or less embryonic shoot, usually covered with bud scales.  2. An unopened flower, often protected by sepals.</div></div>!){
				}
				if(s!<<64>>Buds<<64>>!<u class="dotted" title="1. An incompletely developed, more or less embryonic shoot, usually covered with bud scales.  2. An unopened flower, often protected by sepals." >Buds</u>!){
				}
				if(s! <<64>>buds<<64>>!&nbsp;<div class="dropdown"><u class="dotted">buds</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/buds-and-scars.jpg" class="large-image" alt="image missing" >1. An incompletely developed, more or less embryonic shoot, usually covered with bud scales.  2. An unopened flower, often protected by sepals.</div></div>!){
				}
				if(s!<<65>>Bulb<<65>>!<u class="dotted" title="Short underground stem and the fleshy leaves or leaf bases attached to and surrounding it (e.g., an onion)." >Bulb</u>!){
				}
				if(s! <<65>>bulb<<65>>!&nbsp;<u class="dotted" title="Short underground stem and the fleshy leaves or leaf bases attached to and surrounding it (e.g., an onion)." >bulb</u>!){
				}
				if(s!<<66>>Bulbs<<66>>!<u class="dotted" title="Short underground stem and the fleshy leaves or leaf bases attached to and surrounding it (e.g., an onion)." >Bulbs</u>!){
				}
				if(s! <<66>>bulbs<<66>>!&nbsp;<div class="dropdown"><u class="dotted">bulbs</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/bulb.jpg" class="large-image" alt="image missing" >Short underground stem and the fleshy leaves or leaf bases attached to and surrounding it (e.g., an onion).</div></div>!){
				}
				if(s!<<67>>Bulblet<<67>>!<u class="dotted" title="1. Small bulb generally produced at the base of a bulb.  2. Any small, bulb-like structure that propagates a plant, often in a leaf or bract axil." >Bulblet</u>!){
				}
				if(s! <<67>>bulblet<<67>>!&nbsp;<div class="dropdown"><u class="dotted">bulblet</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/bulblet.jpg" class="large-image" alt="image missing" >1. Small bulb generally produced at the base of a bulb.  2. Any small, bulb-like structure that propagates a plant, often in a leaf or bract axil.</div></div>!){
				}
				if(s!<<68>>Bulblets<<68>>!<u class="dotted" title="1. Small bulb generally produced at the base of a bulb.  2. Any small, bulb-like structure that propagates a plant, often in a leaf or bract axil." >Bulblets</u>!){
				}
				if(s! <<68>>bulblets<<68>>!&nbsp;<div class="dropdown"><u class="dotted">bulblets</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/bulblet.jpg" class="large-image" alt="image missing" >1. Small bulb generally produced at the base of a bulb.  2. Any small, bulb-like structure that propagates a plant, often in a leaf or bract axil.</div></div>!){
				}
				if(s!<<69>>Bur<<69>>!<u class="dotted" title="Fruit or fruiting inflorescence with awns or bristles, often barbed.  (e.g., Xanthium strumarium)" >Bur</u>!){
				}
				if(s! <<69>>bur<<69>>!&nbsp;<u class="dotted" title="Fruit or fruiting inflorescence with awns or bristles, often barbed.  (e.g., Xanthium strumarium)" >bur</u>!){
				}
				if(s!<<70>>Callus<<70>>!<u class="dotted" title="1. In some Poaceae, enlarged or projected hard base of floret; sometimes hairy or sharp-pointed. 2. A firm protuberance." >Callus</u>!){
				}
				if(s! <<70>>callus<<70>>!&nbsp;<u class="dotted" title="1. In some Poaceae, enlarged or projected hard base of floret; sometimes hairy or sharp-pointed. 2. A firm protuberance." >callus</u>!){
				}
				if(s!<<71>>Calyx<<71>>!<u class="dotted" title="Collective term for sepals; outermost or lowermost whorl of flower parts, generally green and enclosing remainder of flower in bud.  Sometimes indistinguishable from corolla." >Calyx</u>!){
				}
				if(s! <<71>>calyx<<71>>!&nbsp;<u class="dotted" title="Collective term for sepals; outermost or lowermost whorl of flower parts, generally green and enclosing remainder of flower in bud.  Sometimes indistinguishable from corolla." >calyx</u>!){
				}
				if(s!<<72>>Canescent<<72>>!<u class="dotted" title="Covered with dense, fine, generally grayish white hairs.  (e.g., Phoenicaulis cheiranthoides leaf)" >Canescent</u>!){
				}
				if(s! <<72>>canescent<<72>>!&nbsp;<u class="dotted" title="Covered with dense, fine, generally grayish white hairs.  (e.g., Phoenicaulis cheiranthoides leaf)" >canescent</u>!){
				}
				if(s!<<73>>Capsule<<73>>!<u class="dotted" title="Dry fruit from compound pistil, nearly always dehiscent (irregularly or by pores, slits, or lines of separation)." >Capsule</u>!){
				}
				if(s! <<73>>capsule<<73>>!&nbsp;<u class="dotted" title="Dry fruit from compound pistil, nearly always dehiscent (irregularly or by pores, slits, or lines of separation)." >capsule</u>!){
				}
				if(s!<<74>>Capsules<<74>>!<u class="dotted" title="Dry fruit from compound pistil, nearly always dehiscent (irregularly or by pores, slits, or lines of separation)." >Capsules</u>!){
				}
				if(s! <<74>>capsules<<74>>!&nbsp;<div class="dropdown"><u class="dotted">capsules</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/capsules.jpg" class="large-image" alt="image missing" >Dry fruit from compound pistil, nearly always dehiscent (irregularly or by pores, slits, or lines of separation).</div></div>!){
				}
				if(s!<<75>>Carpel<<75>>!<u class="dotted" title="The basic female structure of a flower, evolved from a fertile leaf.  Carpels are free or variously fused into a compound pistil, the number of carpels then often equal to the number of stigmas, styles, or chambers of the ovary." >Carpel</u>!){
				}
				if(s! <<75>>carpel<<75>>!&nbsp;<u class="dotted" title="The basic female structure of a flower, evolved from a fertile leaf.  Carpels are free or variously fused into a compound pistil, the number of carpels then often equal to the number of stigmas, styles, or chambers of the ovary." >carpel</u>!){
				}
				if(s!<<76>>Carpels<<76>>!<u class="dotted" title="The basic female structure of a flower, evolved from a fertile leaf.  Carpels are free or variously fused into a compound pistil, the number of carpels then often equal to the number of stigmas, styles, or chambers of the ovary." >Carpels</u>!){
				}
				if(s! <<76>>carpels<<76>>!&nbsp;<u class="dotted" title="The basic female structure of a flower, evolved from a fertile leaf.  Carpels are free or variously fused into a compound pistil, the number of carpels then often equal to the number of stigmas, styles, or chambers of the ovary." >carpels</u>!){
				}
				if(s!<<77>>Cartilaginous<<77>>!<u class="dotted" title="thickened, usually whitish, sometimes flexible; in ferns, applied especially to margins of blades." >Cartilaginous</u>!){
				}
				if(s! <<77>>cartilaginous<<77>>!&nbsp;<u class="dotted" title="thickened, usually whitish, sometimes flexible; in ferns, applied especially to margins of blades." >cartilaginous</u>!){
				}
				if(s!<<78>>Catkin<<78>>!<u class="dotted" title="Spike or spike-like (e.g., Alnus) inflorescence of unisexual flowers with inconspicuous perianths (generally wind-pollinated), usually pendent and often with conspicuous bracts." >Catkin</u>!){
				}
				if(s! <<78>>catkin<<78>>!&nbsp;<div class="dropdown"><u class="dotted">catkin</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/catkin.jpg" class="large-image" alt="image missing" >Spike or spike-like (e.g., Alnus) inflorescence of unisexual flowers with inconspicuous perianths (generally wind-pollinated), usually pendent and often with conspicuous bracts.</div></div>!){
				}
				if(s!<<79>>Catkins<<79>>!<u class="dotted" title="Spike or spike-like (e.g., Alnus) inflorescence of unisexual flowers with inconspicuous perianths (generally wind-pollinated), usually pendent and often with conspicuous bracts." >Catkins</u>!){
				}
				if(s! <<79>>catkins<<79>>!&nbsp;<div class="dropdown"><u class="dotted">catkins</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/catkin.jpg" class="large-image" alt="image missing" >Spike or spike-like (e.g., Alnus) inflorescence of unisexual flowers with inconspicuous perianths (generally wind-pollinated), usually pendent and often with conspicuous bracts.</div></div>!){
				}
				if(s!<<80>>Caudex<<80>>!<u class="dotted" title="Generally short, sometimes woody, more or less vertical stem of a perennial, at or beneath ground level." >Caudex</u>!){
				}
				if(s! <<80>>caudex<<80>>!&nbsp;<div class="dropdown"><u class="dotted">caudex</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/caudex.jpg" class="large-image" alt="image missing" >Generally short, sometimes woody, more or less vertical stem of a perennial, at or beneath ground level.</div></div>!){
				}
				if(s!<<81>>Caudices<<81>>!<u class="dotted" title="Generally short, sometimes woody, more or less vertical stem of a perennial, at or beneath ground level." >Caudices</u>!){
				}
				if(s! <<81>>caudices<<81>>!&nbsp;<u class="dotted" title="Generally short, sometimes woody, more or less vertical stem of a perennial, at or beneath ground level." >caudices</u>!){
				}
				if(s!<<82>>Cauline<<82>>!<u class="dotted" title="Pertaining to structures, especially leaves, borne along (i.e., not confined to the base of) an elongate, above-ground  stem; not basal." >Cauline</u>!){
				}
				if(s! <<82>>cauline<<82>>!&nbsp;<u class="dotted" title="Pertaining to structures, especially leaves, borne along (i.e., not confined to the base of) an elongate, above-ground  stem; not basal." >cauline</u>!){
				}
				if(s!<<83>>Cespitose<<83>>!<u class="dotted" title="Having a densely clumped, tufted, matted, or cushion-like growth form." >Cespitose</u>!){
				}
				if(s! <<83>>cespitose<<83>>!&nbsp;<div class="dropdown"><u class="dotted">cespitose</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/cespitose.jpg" class="large-image" alt="image missing" >Having a densely clumped, tufted, matted, or cushion-like growth form.</div></div>!){
				}
				if(s!<<84>>Chamber<<84>>!<u class="dotted" title="Compartment or cavity within an ovary, capsule, or other hollow structure." >Chamber</u>!){
				}
				if(s! <<84>>chamber<<84>>!&nbsp;<u class="dotted" title="Compartment or cavity within an ovary, capsule, or other hollow structure." >chamber</u>!){
				}
				if(s!<<85>>Chambers<<85>>!<u class="dotted" title="Compartment or cavity within an ovary, capsule, or other hollow structure." >Chambers</u>!){
				}
				if(s! <<85>>chambers<<85>>!&nbsp;<u class="dotted" title="Compartment or cavity within an ovary, capsule, or other hollow structure." >chambers</u>!){
				}
				if(s!<<86>>Chaparral<<86>>!<u class="dotted" title="Vegetation dominated by mostly evergreen shrubs with thick, leathery leaves and stiff branches." >Chaparral</u>!){
				}
				if(s! <<86>>chaparral<<86>>!&nbsp;<u class="dotted" title="Vegetation dominated by mostly evergreen shrubs with thick, leathery leaves and stiff branches." >chaparral</u>!){
				}
				if(s!<<87>>Ciliate<<87>>!<u class="dotted" title="Having generally straight, conspicuous hairs along margins or edges." >Ciliate</u>!){
				}
				if(s! <<87>>ciliate<<87>>!&nbsp;<div class="dropdown"><u class="dotted">ciliate</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/ciliate.jpg" class="large-image" alt="image missing" >Having generally straight, conspicuous hairs along margins or edges.</div></div>!){
				}
				if(s!<<88>>Circumboreal<<88>>!<u class="dotted" title="Occurring around the world at northern latitudes." >Circumboreal</u>!){
				}
				if(s! <<88>>circumboreal<<88>>!&nbsp;<u class="dotted" title="Occurring around the world at northern latitudes." >circumboreal</u>!){
				}
				if(s!<<89>>Circumscissile<<89>>!<u class="dotted" title="Dehiscence, usually of a fruit (capsule), by a transverse line, the top coming off as a lid." >Circumscissile</u>!){
				}
				if(s! <<89>>circumscissile<<89>>!&nbsp;<div class="dropdown"><u class="dotted">circumscissile</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/circumscissile.jpg" class="large-image" alt="image missing" >Dehiscence, usually of a fruit (capsule), by a transverse line, the top coming off as a lid.</div></div>!){
				}
				if(s!<<90>>Claw<<90>>!<u class="dotted" title="Stalk-like base of some free or nearly free sepals or petals." >Claw</u>!){
				}
				if(s! <<90>>claw<<90>>!&nbsp;<u class="dotted" title="Stalk-like base of some free or nearly free sepals or petals." >claw</u>!){
				}
				if(s!<<91>>Claws<<91>>!<u class="dotted" title="Stalk-like base of some free or nearly free sepals or petals." >Claws</u>!){
				}
				if(s! <<91>>claws<<91>>!&nbsp;<u class="dotted" title="Stalk-like base of some free or nearly free sepals or petals." >claws</u>!){
				}
				if(s!<<92>>Cleistogamous<<92>>!<u class="dotted" title="Bud-like, unopening flowers that are generally self-fertilized." >Cleistogamous</u>!){
				}
				if(s! <<92>>cleistogamous<<92>>!&nbsp;<u class="dotted" title="Bud-like, unopening flowers that are generally self-fertilized." >cleistogamous</u>!){
				}
				if(s!<<93>>Clone<<93>>!<u class="dotted" title="Genetically identical individuals resulting from asexual reproduction (fragmentation of rhizomes or stolons, budding, etc.); often used for an apparent population, the members of which are or were connected (e.g., aspens, cattails, duckweeds, sumacs)." >Clone</u>!){
				}
				if(s! <<93>>clone<<93>>!&nbsp;<u class="dotted" title="Genetically identical individuals resulting from asexual reproduction (fragmentation of rhizomes or stolons, budding, etc.); often used for an apparent population, the members of which are or were connected (e.g., aspens, cattails, duckweeds, sumacs)." >clone</u>!){
				}
				if(s!<<94>>Clones<<94>>!<u class="dotted" title="Genetically identical individuals resulting from asexual reproduction (fragmentation of rhizomes or stolons, budding, etc.); often used for an apparent population, the members of which are or were connected (e.g., aspens, cattails, duckweeds, sumacs)." >Clones</u>!){
				}
				if(s! <<94>>clones<<94>>!&nbsp;<u class="dotted" title="Genetically identical individuals resulting from asexual reproduction (fragmentation of rhizomes or stolons, budding, etc.); often used for an apparent population, the members of which are or were connected (e.g., aspens, cattails, duckweeds, sumacs)." >clones</u>!){
				}
				if(s!<<95>>Closed-cone forest<<95>>!<u class="dotted" title="Vegetation dominated by species of Pinus or Cupressus in which the seed cones persist unopened on the branches for extended periods of time; dominated by closely spaced +- tall trees." >Closed-cone forest</u>!){
				}
				if(s! <<95>>closed-cone forest<<95>>!&nbsp;<u class="dotted" title="Vegetation dominated by species of Pinus or Cupressus in which the seed cones persist unopened on the branches for extended periods of time; dominated by closely spaced +- tall trees." >closed-cone forest</u>!){
				}
				if(s!<<96>>Coastal redwood<<96>>!<u class="dotted" title="Vegetation dominated by Sequoia sempervirens, occurring on slopes and canyons of coastal mountain ranges; dominated by closely spaced +- tall trees." >Coastal redwood</u>!){
				}
				if(s! <<96>>coastal redwood<<96>>!&nbsp;<u class="dotted" title="Vegetation dominated by Sequoia sempervirens, occurring on slopes and canyons of coastal mountain ranges; dominated by closely spaced +- tall trees." >coastal redwood</u>!){
				}
				if(s!<<97>>Coastal scrub<<97>>!<u class="dotted" title="Coastal vegetation dominated mostly by shrubs with flexible branches, e.g., Baccharis pilularis, Artemesia californica" >Coastal scrub</u>!){
				}
				if(s! <<97>>coastal scrub<<97>>!&nbsp;<u class="dotted" title="Coastal vegetation dominated mostly by shrubs with flexible branches, e.g., Baccharis pilularis, Artemesia californica" >coastal scrub</u>!){
				}
				if(s!<<98>>Coastal strand<<98>>!<u class="dotted" title="Beach and foredune habitat, characterized by sandy soils, strong winds, salt spray, and wave action." >Coastal strand</u>!){
				}
				if(s! <<98>>coastal strand<<98>>!&nbsp;<u class="dotted" title="Beach and foredune habitat, characterized by sandy soils, strong winds, salt spray, and wave action." >coastal strand</u>!){
				}
				if(s!<<99>>Collar<<99>>!<u class="dotted" title="1. In Poaceae, the abaxial junction of leaf sheath and blade. 2. Raised, inflated, or wing-like, encircling projection (e.g., the seeds of Delphinium luteum, D. nudicaule)" >Collar</u>!){
				}
				if(s! <<99>>collar<<99>>!&nbsp;<u class="dotted" title="1. In Poaceae, the abaxial junction of leaf sheath and blade. 2. Raised, inflated, or wing-like, encircling projection (e.g., the seeds of Delphinium luteum, D. nudicaule)" >collar</u>!){
				}
				if(s!<<100>>Collars<<100>>!<u class="dotted" title="1. In Poaceae, the abaxial junction of leaf sheath and blade. 2. Raised, inflated, or wing-like, encircling projection (e.g., the seeds of Delphinium luteum, D. nudicaule)" >Collars</u>!){
				}
				if(s! <<100>>collars<<100>>!&nbsp;<u class="dotted" title="1. In Poaceae, the abaxial junction of leaf sheath and blade. 2. Raised, inflated, or wing-like, encircling projection (e.g., the seeds of Delphinium luteum, D. nudicaule)" >collars</u>!){
				}
				if(s!<<101>>Column<<101>>!<u class="dotted" title="Structure at the center of an orchid flower formed by fusion of stamen(s) and style." >Column</u>!){
				}
				if(s! <<101>>column<<101>>!&nbsp;<div class="dropdown"><u class="dotted">column</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/orchid-column.jpg" class="large-image" alt="image missing" >Structure at the center of an orchid flower formed by fusion of stamen(s) and style.</div></div>!){
				}
				if(s!<<102>>Columns<<102>>!<u class="dotted" title="Structure at the center of an orchid flower formed by fusion of stamen(s) and style." >Columns</u>!){
				}
				if(s! <<102>>columns<<102>>!&nbsp;<u class="dotted" title="Structure at the center of an orchid flower formed by fusion of stamen(s) and style." >columns</u>!){
				}
				if(s!<<103>>Compound<<103>>!<u class="dotted" title="1. Composed of two or more parts, as a compound leaf composed of leaflets or a compound pistil composed of fused or partly fused carpels.  2. Repeating a structural pattern (a compound umbel is an umbel of umbels)." >Compound</u>!){
				}
				if(s! <<103>>compound<<103>>!&nbsp;<u class="dotted" title="1. Composed of two or more parts, as a compound leaf composed of leaflets or a compound pistil composed of fused or partly fused carpels.  2. Repeating a structural pattern (a compound umbel is an umbel of umbels)." >compound</u>!){
				}
				if(s!<<104>>Compressed<<104>>!<u class="dotted" title="Flattened side-to-side or front-to-back." >Compressed</u>!){
				}
				if(s! <<104>>compressed<<104>>!&nbsp;<div class="dropdown"><u class="dotted">compressed</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/compressed.jpg" class="large-image" alt="image missing" >Flattened side-to-side or front-to-back.</div></div>!){
				}
				if(s!<<105>>Concave<<105>>!<u class="dotted" title="Hollowed or indented, as the interior of a curved surface." >Concave</u>!){
				}
				if(s! <<105>>concave<<105>>!&nbsp;<u class="dotted" title="Hollowed or indented, as the interior of a curved surface." >concave</u>!){
				}
				if(s!<<106>>Cone<<106>>!<u class="dotted" title="Reproductive structure composed of an axis, scales, and sometimes bracts.  1.  Non-woody structure producing spores (e.g., clubmosses, horsetails) or pollen (e.g., male cone of conifers).  2. Generally woody structure producing seeds (e.g., female cones of most conifers).  (e.g., Abies concolor)" >Cone</u>!){
				}
				if(s! <<106>>cone<<106>>!&nbsp;<u class="dotted" title="Reproductive structure composed of an axis, scales, and sometimes bracts.  1.  Non-woody structure producing spores (e.g., clubmosses, horsetails) or pollen (e.g., male cone of conifers).  2. Generally woody structure producing seeds (e.g., female cones of most conifers).  (e.g., Abies concolor)" >cone</u>!){
				}
				if(s!<<107>>Cones<<107>>!<u class="dotted" title="Reproductive structure composed of an axis, scales, and sometimes bracts.  1.  Non-woody structure producing spores (e.g., clubmosses, horsetails) or pollen (e.g., male cone of conifers).  2. Generally woody structure producing seeds (e.g., female cones of most conifers).  (e.g., Abies concolor)" >Cones</u>!){
				}
				if(s! <<107>>cones<<107>>!&nbsp;<u class="dotted" title="Reproductive structure composed of an axis, scales, and sometimes bracts.  1.  Non-woody structure producing spores (e.g., clubmosses, horsetails) or pollen (e.g., male cone of conifers).  2. Generally woody structure producing seeds (e.g., female cones of most conifers).  (e.g., Abies concolor)" >cones</u>!){
				}
				if(s!<<108>>Conic<<108>>!<u class="dotted" title="Three-dimensional, defined by a wide, more or less round base, the sides evenly tapered to a narrow tip." >Conic</u>!){
				}
				if(s! <<108>>conic<<108>>!&nbsp;<u class="dotted" title="Three-dimensional, defined by a wide, more or less round base, the sides evenly tapered to a narrow tip." >conic</u>!){
				}
				if(s!<<109>>Coniferous forest<<109>>!<u class="dotted" title="Vegetation dominated by trees belonging to various species of conifers (e.g., firs, pines, redwoods); dominated by closely spaced +- tall trees." >Coniferous forest</u>!){
				}
				if(s! <<109>>coniferous forest<<109>>!&nbsp;<u class="dotted" title="Vegetation dominated by trees belonging to various species of conifers (e.g., firs, pines, redwoods); dominated by closely spaced +- tall trees." >coniferous forest</u>!){
				}
				if(s!<<110>>Continuous<<110>>!<u class="dotted" title="Having parts spaced evenly and without interruption, not clumped; pertaining especially to  inflorescences in which the flowers are evenly spaced." >Continuous</u>!){
				}
				if(s! <<110>>continuous<<110>>!&nbsp;<u class="dotted" title="Having parts spaced evenly and without interruption, not clumped; pertaining especially to  inflorescences in which the flowers are evenly spaced." >continuous</u>!){
				}
				if(s!<<111>>Convex<<111>>!<u class="dotted" title="Rounded outward, as the exterior of a curved surface." >Convex</u>!){
				}
				if(s! <<111>>convex<<111>>!&nbsp;<u class="dotted" title="Rounded outward, as the exterior of a curved surface." >convex</u>!){
				}
				if(s!<<112>>Cordate<<112>>!<u class="dotted" title="Heart-shaped; often pertaining to a leaf in which the blade base on both sides of the petiole is rounded and convex." >Cordate</u>!){
				}
				if(s! <<112>>cordate<<112>>!&nbsp;<div class="dropdown"><u class="dotted">cordate</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/cordate.jpg" class="large-image" alt="image missing" >Heart-shaped; often pertaining to a leaf in which the blade base on both sides of the petiole is rounded and convex.</div></div>!){
				}
				if(s!<<113>>Corm<<113>>!<u class="dotted" title="Short, thick, unbranched, underground stem often surrounded by dry (not fleshy) leaves or leaf bases. (e.g., Muilla maritima)" >Corm</u>!){
				}
				if(s! <<113>>corm<<113>>!&nbsp;<u class="dotted" title="Short, thick, unbranched, underground stem often surrounded by dry (not fleshy) leaves or leaf bases. (e.g., Muilla maritima)" >corm</u>!){
				}
				if(s!<<114>>Corms<<114>>!<u class="dotted" title="Short, thick, unbranched, underground stem often surrounded by dry (not fleshy) leaves or leaf bases. (e.g., Muilla maritima)" >Corms</u>!){
				}
				if(s! <<114>>corms<<114>>!&nbsp;<u class="dotted" title="Short, thick, unbranched, underground stem often surrounded by dry (not fleshy) leaves or leaf bases. (e.g., Muilla maritima)" >corms</u>!){
				}
				if(s!<<115>>Corolla<<115>>!<u class="dotted" title="Collective term for petals; whorl of flower parts immediately inside or above calyx, often large and brightly colored.  Sometimes indistinguishable from calyx." >Corolla</u>!){
				}
				if(s! <<115>>corolla<<115>>!&nbsp;<u class="dotted" title="Collective term for petals; whorl of flower parts immediately inside or above calyx, often large and brightly colored.  Sometimes indistinguishable from calyx." >corolla</u>!){
				}
				if(s!<<116>>Corollas<<116>>!<u class="dotted" title="Collective term for petals; whorl of flower parts immediately inside or above calyx, often large and brightly colored.  Sometimes indistinguishable from calyx." >Corollas</u>!){
				}
				if(s! <<116>>corollas<<116>>!&nbsp;<u class="dotted" title="Collective term for petals; whorl of flower parts immediately inside or above calyx, often large and brightly colored.  Sometimes indistinguishable from calyx." >corollas</u>!){
				}
				if(s!<<117>>Costa<<117>>!<u class="dotted" title="In ferns, primary axis of a pinna." >Costa</u>!){
				}
				if(s! <<117>>costa<<117>>!&nbsp;<div class="dropdown"><u class="dotted">costa</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/fern-leaf-costa.jpg" class="large-image" alt="image missing" >In ferns, primary axis of a pinna.</div></div>!){
				}
				if(s!<<118>>Costule<<118>>!<u class="dotted" title="In ferns, primary axis of a pinnule." >Costule</u>!){
				}
				if(s! <<118>>costule<<118>>!&nbsp;<u class="dotted" title="In ferns, primary axis of a pinnule." >costule</u>!){
				}
				if(s!<<119>>Costulet<<119>>!<u class="dotted" title="In ferns, primary axis of a pinnulet." >Costulet</u>!){
				}
				if(s! <<119>>costulet<<119>>!&nbsp;<u class="dotted" title="In ferns, primary axis of a pinnulet." >costulet</u>!){
				}
				if(s!<<120>>Cotyledon<<120>>!<u class="dotted" title="Seed-leaf; a modified leaf present in the seed, often functioning for food storage.  Persistent in some annuals and of aid in their identification.  (e.g., Lupinus microcarpus)" >Cotyledon</u>!){
				}
				if(s! <<120>>cotyledon<<120>>!&nbsp;<u class="dotted" title="Seed-leaf; a modified leaf present in the seed, often functioning for food storage.  Persistent in some annuals and of aid in their identification.  (e.g., Lupinus microcarpus)" >cotyledon</u>!){
				}
				if(s!<<121>>Cotyledons<<121>>!<u class="dotted" title="Seed-leaf; a modified leaf present in the seed, often functioning for food storage.  Persistent in some annuals and of aid in their identification.  (e.g., Lupinus microcarpus)" >Cotyledons</u>!){
				}
				if(s! <<121>>cotyledons<<121>>!&nbsp;<u class="dotted" title="Seed-leaf; a modified leaf present in the seed, often functioning for food storage.  Persistent in some annuals and of aid in their identification.  (e.g., Lupinus microcarpus)" >cotyledons</u>!){
				}
				if(s!<<122>>Crenate<<122>>!<u class="dotted" title="Pertaining to margins with shallow, rounded teeth, between which are usually acute sinuses (i.e., scalloped)" >Crenate</u>!){
				}
				if(s! <<122>>crenate<<122>>!&nbsp;<div class="dropdown"><u class="dotted">crenate</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/crenate.jpg" class="large-image" alt="image missing" >Pertaining to margins with shallow, rounded teeth, between which are usually acute sinuses (i.e., scalloped)</div></div>!){
				}
				if(s!<<123>>Cylindric<<123>>!<u class="dotted" title="Elongate, with parallel sides and, at any point, round in transverse section." >Cylindric</u>!){
				}
				if(s! <<123>>cylindric<<123>>!&nbsp;<div class="dropdown"><u class="dotted">cylindric</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/cylindric.jpg" class="large-image" alt="image missing" >Elongate, with parallel sides and, at any point, round in transverse section.</div></div>!){
				}
				if(s!<<124>>Cyme<<124>>!<u class="dotted" title="1. In flowering plants excluding Asteraceae and some other groups, a branched inflorescence in which the central or uppermost flower opens before the peripheral or lowermost flowers on any axis.  see 2. In Asteraceae and some other groups, a cyme-like inflorescence is one in which the central or uppermost inflorescence units (e.g., heads in Asteraceae, umbels enclosed by involucres in Eriogonum), instead of individual flowers, develop and mature before the peripheral or lowermost inflorescence units on any axis." >Cyme</u>!){
				}
				if(s! <<124>>cyme<<124>>!&nbsp;<div class="dropdown"><u class="dotted">cyme</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/cyme.jpg" class="large-image" alt="image missing" >1. In flowering plants excluding Asteraceae and some other groups, a branched inflorescence in which the central or uppermost flower opens before the peripheral or lowermost flowers on any axis.  see 2. In Asteraceae and some other groups, a cyme-like inflorescence is one in which the central or uppermost inflorescence units (e.g., heads in Asteraceae, umbels enclosed by involucres in Eriogonum), instead of individual flowers, develop and mature before the peripheral or lowermost inflorescence units on any axis.</div></div>!){
				}
				if(s!<<125>>Cymes<<125>>!<u class="dotted" title="1. In flowering plants excluding Asteraceae and some other groups, a branched inflorescence in which the central or uppermost flower opens before the peripheral or lowermost flowers on any axis.  see 2. In Asteraceae and some other groups, a cyme-like inflorescence is one in which the central or uppermost inflorescence units (e.g., heads in Asteraceae, umbels enclosed by involucres in Eriogonum), instead of individual flowers, develop and mature before the peripheral or lowermost inflorescence units on any axis." >Cymes</u>!){
				}
				if(s! <<125>>cymes<<125>>!&nbsp;<div class="dropdown"><u class="dotted">cymes</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/cyme.jpg" class="large-image" alt="image missing" >1. In flowering plants excluding Asteraceae and some other groups, a branched inflorescence in which the central or uppermost flower opens before the peripheral or lowermost flowers on any axis.  see 2. In Asteraceae and some other groups, a cyme-like inflorescence is one in which the central or uppermost inflorescence units (e.g., heads in Asteraceae, umbels enclosed by involucres in Eriogonum), instead of individual flowers, develop and mature before the peripheral or lowermost inflorescence units on any axis.</div></div>!){
				}
				if(s!<<126>>Deciduous<<126>>!<u class="dotted" title="Falling off naturally.  1. Pertaining to leaves that all fall seasonally, or to plants that are seasonally leafless. 2.  Pertaining to structures, such as hairs or flower parts, that fall early or readily." >Deciduous</u>!){
				}
				if(s! <<126>>deciduous<<126>>!&nbsp;<u class="dotted" title="Falling off naturally.  1. Pertaining to leaves that all fall seasonally, or to plants that are seasonally leafless. 2.  Pertaining to structures, such as hairs or flower parts, that fall early or readily." >deciduous</u>!){
				}
				if(s!<<127>>Decumbent<<127>>!<u class="dotted" title="lying mostly flat on the ground but with tips curving up." >Decumbent</u>!){
				}
				if(s! <<127>>decumbent<<127>>!&nbsp;<div class="dropdown"><u class="dotted">decumbent</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/decumbent.jpg" class="large-image" alt="image missing" >lying mostly flat on the ground but with tips curving up.</div></div>!){
				}
				if(s!<<128>>Decurrent<<128>>!<u class="dotted" title="Pertaining to a wing-like or ridge-like extension basal to  the apparent  or actual point of attachment, particularly a leaf base that appears to continue onto the stem." >Decurrent</u>!){
				}
				if(s! <<128>>decurrent<<128>>!&nbsp;<div class="dropdown"><u class="dotted">decurrent</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/decurrent.jpg" class="large-image" alt="image missing" >Pertaining to a wing-like or ridge-like extension basal to  the apparent  or actual point of attachment, particularly a leaf base that appears to continue onto the stem.</div></div>!){
				}
				if(s!<<129>>Dehiscent<<129>>!<u class="dotted" title="Opening at maturity to release contents; usually pertaining to anthers or fruits." >Dehiscent</u>!){
				}
				if(s! <<129>>dehiscent<<129>>!&nbsp;<div class="dropdown"><u class="dotted">dehiscent</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/dehiscent.jpg" class="large-image" alt="image missing" >Opening at maturity to release contents; usually pertaining to anthers or fruits.</div></div>!){
				}
				if(s!<<130>>Deltate<<130>>!<u class="dotted" title="More or less equilaterally triangular, with the corners rounded or not." >Deltate</u>!){
				}
				if(s! <<130>>deltate<<130>>!&nbsp;<div class="dropdown"><u class="dotted">deltate</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/deltate.jpg" class="large-image" alt="image missing" >More or less equilaterally triangular, with the corners rounded or not.</div></div>!){
				}
				if(s!<<131>>Dense<<131>>!<u class="dotted" title="Congested or compact; especially pertaining to the disposition of flowers in an inflorescence." >Dense</u>!){
				}
				if(s! <<131>>dense<<131>>!&nbsp;<u class="dotted" title="Congested or compact; especially pertaining to the disposition of flowers in an inflorescence." >dense</u>!){
				}
				if(s!<<132>>Dentate<<132>>!<u class="dotted" title="Having margins with sharp, relatively coarse teeth pointing outward, not tipward." >Dentate</u>!){
				}
				if(s! <<132>>dentate<<132>>!&nbsp;<div class="dropdown"><u class="dotted">dentate</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/dentate.jpg" class="large-image" alt="image missing" >Having margins with sharp, relatively coarse teeth pointing outward, not tipward.</div></div>!){
				}
				if(s!<<133>>Depressed<<133>>!<u class="dotted" title="Flattened from above and below, or with the center lower than the margins." >Depressed</u>!){
				}
				if(s! <<133>>depressed<<133>>!&nbsp;<div class="dropdown"><u class="dotted">depressed</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/depressed.jpg" class="large-image" alt="image missing" >Flattened from above and below, or with the center lower than the margins.</div></div>!){
				}
				if(s!<<134>>Desert<<134>>!<u class="dotted" title="Region and associated communities characterized by low and irregular precipitation and prolonged periods of drought." >Desert</u>!){
				}
				if(s! <<134>>desert<<134>>!&nbsp;<u class="dotted" title="Region and associated communities characterized by low and irregular precipitation and prolonged periods of drought." >desert</u>!){
				}
				if(s!<<135>>Dioecious<<135>>!<u class="dotted" title="Pertaining to a taxon in which individuals produce either male or female reproductive structures, and do not produce bisexual reproductive structures.  (e.g., Salix laevigata)" >Dioecious</u>!){
				}
				if(s! <<135>>dioecious<<135>>!&nbsp;<u class="dotted" title="Pertaining to a taxon in which individuals produce either male or female reproductive structures, and do not produce bisexual reproductive structures.  (e.g., Salix laevigata)" >dioecious</u>!){
				}
				if(s!<<136>>Digitate<<136>>!<u class="dotted" title="In Poaceae, pertaining to an inflorescence of two or more spike-like branches attached at the same point at the apex of the inflorescence stalk." >Digitate</u>!){
				}
				if(s! <<136>>digitate<<136>>!&nbsp;<u class="dotted" title="In Poaceae, pertaining to an inflorescence of two or more spike-like branches attached at the same point at the apex of the inflorescence stalk." >digitate</u>!){
				}
				if(s!<<137>>Diploid<<137>>!<u class="dotted" title="Having two sets of chromosomes (maternal and paternal); 2n." >Diploid</u>!){
				}
				if(s! <<137>>diploid<<137>>!&nbsp;<u class="dotted" title="Having two sets of chromosomes (maternal and paternal); 2n." >diploid</u>!){
				}
				if(s!<<138>>Disciform head<<138>>!<u class="dotted" title="In Asteraceae, a head composed of disk flowers and marginal pistillate (or sterile) flowers with minute or missing laminae, superficially similar to discoid head." >Disciform head</u>!){
				}
				if(s! <<138>>disciform head<<138>>!&nbsp;<u class="dotted" title="In Asteraceae, a head composed of disk flowers and marginal pistillate (or sterile) flowers with minute or missing laminae, superficially similar to discoid head." >disciform head</u>!){
				}
				if(s!<<139>>Discoid head<<139>>!<u class="dotted" title="In Asteraceae, a head composed entirely of disk flowers." >Discoid head</u>!){
				}
				if(s! <<139>>discoid head<<139>>!&nbsp;<u class="dotted" title="In Asteraceae, a head composed entirely of disk flowers." >discoid head</u>!){
				}
				if(s!<<140>>Disk flower<<140>>!<u class="dotted" title="In Asteraceae, a generally bisexual (occasionally staminate or sterile, never pistillate), generally radial flower with a 5- (rarely 4-) lobed corolla; appearing without other flower types (in discoid head), or with marginal flowers of a different type (in radiate, radiant, or disciform heads)." >Disk flower</u>!){
				}
				if(s! <<140>>disk flower<<140>>!&nbsp;<u class="dotted" title="In Asteraceae, a generally bisexual (occasionally staminate or sterile, never pistillate), generally radial flower with a 5- (rarely 4-) lobed corolla; appearing without other flower types (in discoid head), or with marginal flowers of a different type (in radiate, radiant, or disciform heads)." >disk flower</u>!){
				}
				if(s!<<141>>Disk flowers<<141>>!<u class="dotted" title="In Asteraceae, a generally bisexual (occasionally staminate or sterile, never pistillate), generally radial flower with a 5- (rarely 4-) lobed corolla; appearing without other flower types (in discoid head), or with marginal flowers of a different type (in radiate, radiant, or disciform heads)." >Disk flowers</u>!){
				}
				if(s! <<141>>disk flowers<<141>>!&nbsp;<u class="dotted" title="In Asteraceae, a generally bisexual (occasionally staminate or sterile, never pistillate), generally radial flower with a 5- (rarely 4-) lobed corolla; appearing without other flower types (in discoid head), or with marginal flowers of a different type (in radiate, radiant, or disciform heads)." >disk flowers</u>!){
				}
				if(s!<<142>>Dissected<<142>>!<u class="dotted" title="Deeply, often sharply cut but not compound; usually pertaining to leaves.  (e.g., Cymopteris deserticola)" >Dissected</u>!){
				}
				if(s! <<142>>dissected<<142>>!&nbsp;<u class="dotted" title="Deeply, often sharply cut but not compound; usually pertaining to leaves.  (e.g., Cymopteris deserticola)" >dissected</u>!){
				}
				if(s!<<143>>Distal<<143>>!<u class="dotted" title="Farther away from the base, origin, or point of attachment, or closer to the edge or tip." >Distal</u>!){
				}
				if(s! <<143>>distal<<143>>!&nbsp;<u class="dotted" title="Farther away from the base, origin, or point of attachment, or closer to the edge or tip." >distal</u>!){
				}
				if(s!<<144>>Distally<<144>>!<u class="dotted" title="Farther away from the base, origin, or point of attachment, or closer to the edge or tip." >Distally</u>!){
				}
				if(s! <<144>>distally<<144>>!&nbsp;<u class="dotted" title="Farther away from the base, origin, or point of attachment, or closer to the edge or tip." >distally</u>!){
				}
				if(s!<<145>>Drupe<<145>>!<u class="dotted" title="Fleshy or pulpy, indehiscent, superficially berry-like fruit in which 1 seed is encased in a stone (as in cherries), or more than 1 seed is encased in an equal number of free or variously fused stones (as in manzanitas).  (e.g., Prunus emarginata fruit)" >Drupe</u>!){
				}
				if(s! <<145>>drupe<<145>>!&nbsp;<u class="dotted" title="Fleshy or pulpy, indehiscent, superficially berry-like fruit in which 1 seed is encased in a stone (as in cherries), or more than 1 seed is encased in an equal number of free or variously fused stones (as in manzanitas).  (e.g., Prunus emarginata fruit)" >drupe</u>!){
				}
				if(s!<<146>>Drupes<<146>>!<u class="dotted" title="Fleshy or pulpy, indehiscent, superficially berry-like fruit in which 1 seed is encased in a stone (as in cherries), or more than 1 seed is encased in an equal number of free or variously fused stones (as in manzanitas).  (e.g., Prunus emarginata fruit)" >Drupes</u>!){
				}
				if(s! <<146>>drupes<<146>>!&nbsp;<u class="dotted" title="Fleshy or pulpy, indehiscent, superficially berry-like fruit in which 1 seed is encased in a stone (as in cherries), or more than 1 seed is encased in an equal number of free or variously fused stones (as in manzanitas).  (e.g., Prunus emarginata fruit)" >drupes</u>!){
				}
				if(s!<<147>>Dune<<147>>!<u class="dotted" title="Hill or ridge of sand formed by the wind." >Dune</u>!){
				}
				if(s! <<147>>dune<<147>>!&nbsp;<u class="dotted" title="Hill or ridge of sand formed by the wind." >dune</u>!){
				}
				if(s!<<148>>Dunes<<148>>!<u class="dotted" title="Hill or ridge of sand formed by the wind." >Dunes</u>!){
				}
				if(s! <<148>>dunes<<148>>!&nbsp;<u class="dotted" title="Hill or ridge of sand formed by the wind." >dunes</u>!){
				}
				if(s!<<149>>Elliptic<<149>>!<u class="dotted" title="In the shape of a flattened circle or ellipse; wider than linear" >Elliptic</u>!){
				}
				if(s! <<149>>elliptic<<149>>!&nbsp;<div class="dropdown"><u class="dotted">elliptic</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/elliptic.jpg" class="large-image" alt="image missing" >In the shape of a flattened circle or ellipse; wider than linear</div></div>!){
				}
				if(s!<<150>>Emergent<<150>>!<u class="dotted" title="Pertaining to a plant normally rooted underwater and extending above the water surface, or to a part of such a plant normally held above the water surface.  (e.g., Polygonum amphibium)" >Emergent</u>!){
				}
				if(s! <<150>>emergent<<150>>!&nbsp;<u class="dotted" title="Pertaining to a plant normally rooted underwater and extending above the water surface, or to a part of such a plant normally held above the water surface.  (e.g., Polygonum amphibium)" >emergent</u>!){
				}
				if(s!<<151>>Endemic<<151>>!<u class="dotted" title="Native to and restricted to a defined geographic area." >Endemic</u>!){
				}
				if(s! <<151>>endemic<<151>>!&nbsp;<u class="dotted" title="Native to and restricted to a defined geographic area." >endemic</u>!){
				}
				if(s!<<152>>Entire<<152>>!<u class="dotted" title="Having margins that are continuous and smooth (i.e., without teeth, lobes, etc.)." >Entire</u>!){
				}
				if(s! <<152>>entire<<152>>!&nbsp;<div class="dropdown"><u class="dotted">entire</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/entire.jpg" class="large-image" alt="image missing" >Having margins that are continuous and smooth (i.e., without teeth, lobes, etc.).</div></div>!){
				}
				if(s!<<153>>Ephemeral<<153>>!<u class="dotted" title="Lasting a short time.  1. Pertaining to individual plants, completing the life cycle (germination through death) or growth cycle in much less than one year.   2.  Pertaining to plant parts,  falling early or remaining functional for a relatively short time (e.g., less than a day for flower parts)." >Ephemeral</u>!){
				}
				if(s! <<153>>ephemeral<<153>>!&nbsp;<u class="dotted" title="Lasting a short time.  1. Pertaining to individual plants, completing the life cycle (germination through death) or growth cycle in much less than one year.   2.  Pertaining to plant parts,  falling early or remaining functional for a relatively short time (e.g., less than a day for flower parts)." >ephemeral</u>!){
				}
				if(s!<<154>>Epidermis<<154>>!<u class="dotted" title="Outermost cell layer (or layers) of non-woody plant parts." >Epidermis</u>!){
				}
				if(s! <<154>>epidermis<<154>>!&nbsp;<u class="dotted" title="Outermost cell layer (or layers) of non-woody plant parts." >epidermis</u>!){
				}
				if(s!<<155>>Epipetalous<<155>>!<u class="dotted" title="Pertaining to stamens that are fused to the petals to various extents and therefore appear to arise from them." >Epipetalous</u>!){
				}
				if(s! <<155>>epipetalous<<155>>!&nbsp;<div class="dropdown"><u class="dotted">epipetalous</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/epipetalous-stamens.jpg" class="large-image" alt="image missing" >Pertaining to stamens that are fused to the petals to various extents and therefore appear to arise from them.</div></div>!){
				}
				if(s!<<156>>Erect<<156>>!<u class="dotted" title="Upright; vertically oriented." >Erect</u>!){
				}
				if(s! <<156>>erect<<156>>!&nbsp;<div class="dropdown"><u class="dotted">erect</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/erect.jpg" class="large-image" alt="image missing" >Upright; vertically oriented.</div></div>!){
				}
				if(s!<<157>>Estuarine<<157>>!<u class="dotted" title="Pertaining to aquatic habitats where freshwater from streams mixes with sea water in a protected area, resulting in a gradation of brackish waters with varying degrees of salinity." >Estuarine</u>!){
				}
				if(s! <<157>>estuarine<<157>>!&nbsp;<u class="dotted" title="Pertaining to aquatic habitats where freshwater from streams mixes with sea water in a protected area, resulting in a gradation of brackish waters with varying degrees of salinity." >estuarine</u>!){
				}
				if(s!<<158>>Evergreen<<158>>!<u class="dotted" title="Never leafless; usually pertaining to leaves that remain green and on the plant for more than one season, and that do not all fall seasonally, or to plants that are never leafless." >Evergreen</u>!){
				}
				if(s! <<158>>evergreen<<158>>!&nbsp;<u class="dotted" title="Never leafless; usually pertaining to leaves that remain green and on the plant for more than one season, and that do not all fall seasonally, or to plants that are never leafless." >evergreen</u>!){
				}
				if(s!<<159>>Exceeding<<159>>!<u class="dotted" title="Surpassing tipward, due to relative orientation or length of the structures involved (e.g., lateral branches exceeding inflorescences; hoods exceeded by anther head in Asclepias californica; hoods slightly exceeding anther head in Asclepias erosa)." >Exceeding</u>!){
				}
				if(s! <<159>>exceeding<<159>>!&nbsp;<u class="dotted" title="Surpassing tipward, due to relative orientation or length of the structures involved (e.g., lateral branches exceeding inflorescences; hoods exceeded by anther head in Asclepias californica; hoods slightly exceeding anther head in Asclepias erosa)." >exceeding</u>!){
				}
				if(s!<<160>>Exserted<<160>>!<u class="dotted" title="Protruding out of surrounding structure(s) (e.g., stamens exserted from corolla)." >Exserted</u>!){
				}
				if(s! <<160>>exserted<<160>>!&nbsp;<div class="dropdown"><u class="dotted">exserted</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/exserted-stamens.jpg" class="large-image" alt="image missing" >Protruding out of surrounding structure(s) (e.g., stamens exserted from corolla).</div></div>!){
				}
				if(s!<<161>>Extant<<161>>!<u class="dotted" title="Currently existing or surviving somewhere." >Extant</u>!){
				}
				if(s! <<161>>extant<<161>>!&nbsp;<u class="dotted" title="Currently existing or surviving somewhere." >extant</u>!){
				}
				if(s!<<162>>Extinct<<162>>!<u class="dotted" title="No longer existing or surviving anywhere." >Extinct</u>!){
				}
				if(s! <<162>>extinct<<162>>!&nbsp;<u class="dotted" title="No longer existing or surviving anywhere." >extinct</u>!){
				}
				if(s!<<163>>Extirpated<<163>>!<u class="dotted" title="No longer existing or surviving in a defined geographic area, as either a direct or indirect result of human activity." >Extirpated</u>!){
				}
				if(s! <<163>>extirpated<<163>>!&nbsp;<u class="dotted" title="No longer existing or surviving in a defined geographic area, as either a direct or indirect result of human activity." >extirpated</u>!){
				}
				if(s!<<164>>Exudate<<164>>!<u class="dotted" title="Material discharged (exuded) from a plant, often with characteristic odor, color, or texture (e.g., sticky, gummy, slippery)." >Exudate</u>!){
				}
				if(s! <<164>>exudate<<164>>!&nbsp;<u class="dotted" title="Material discharged (exuded) from a plant, often with characteristic odor, color, or texture (e.g., sticky, gummy, slippery)." >exudate</u>!){
				}
				if(s!<<165>>Fertile<<165>>!<u class="dotted" title="Reproductively functional; pertaining to a plant or plant part that produces or is associated with the production of functional spores, pollen, ovules, or seeds (e.g., fertile frond, fertile stamen, fertile flower, fertile floret)." >Fertile</u>!){
				}
				if(s! <<165>>fertile<<165>>!&nbsp;<u class="dotted" title="Reproductively functional; pertaining to a plant or plant part that produces or is associated with the production of functional spores, pollen, ovules, or seeds (e.g., fertile frond, fertile stamen, fertile flower, fertile floret)." >fertile</u>!){
				}
				if(s!<<166>>Fibrous<<166>>!<u class="dotted" title="1. Pertaining to structures that are composed at least in part of more or less thread-like but usually tough elements (e.g., Yucca leaves).  2.  Pertaining to a root system composed of many roots similar in length and thickness (e.g., grass roots)." >Fibrous</u>!){
				}
				if(s! <<166>>fibrous<<166>>!&nbsp;<div class="dropdown"><u class="dotted">fibrous</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/fibrous-roots.jpg" class="large-image" alt="image missing" >1. Pertaining to structures that are composed at least in part of more or less thread-like but usually tough elements (e.g., Yucca leaves).  2.  Pertaining to a root system composed of many roots similar in length and thickness (e.g., grass roots).</div></div>!){
				}
				if(s!<<167>>Filament<<167>>!<u class="dotted" title="Anther-stalk portion of a stamen, often thread-like." >Filament</u>!){
				}
				if(s! <<167>>filament<<167>>!&nbsp;<u class="dotted" title="Anther-stalk portion of a stamen, often thread-like." >filament</u>!){
				}
				if(s!<<168>>Filaments<<168>>!<u class="dotted" title="Anther-stalk portion of a stamen, often thread-like." >Filaments</u>!){
				}
				if(s! <<168>>filaments<<168>>!&nbsp;<u class="dotted" title="Anther-stalk portion of a stamen, often thread-like." >filaments</u>!){
				}
				if(s!<<169>>Fleshy<<169>>!<u class="dotted" title="Thick and juicy; succulent.  (e.g., Sesuvium verrucosum)" >Fleshy</u>!){
				}
				if(s! <<169>>fleshy<<169>>!&nbsp;<u class="dotted" title="Thick and juicy; succulent.  (e.g., Sesuvium verrucosum)" >fleshy</u>!){
				}
				if(s!<<170>>Floret<<170>>!<u class="dotted" title="In Poaceae, a single flower and its immediately subtending bracts (lemma and generally palea, the lemma subtending the palea when the latter is present); in a sterile floret, the flower and sometimes palea are rudimentary or absent." >Floret</u>!){
				}
				if(s! <<170>>floret<<170>>!&nbsp;<u class="dotted" title="In Poaceae, a single flower and its immediately subtending bracts (lemma and generally palea, the lemma subtending the palea when the latter is present); in a sterile floret, the flower and sometimes palea are rudimentary or absent." >floret</u>!){
				}
				if(s!<<171>>Florets<<171>>!<u class="dotted" title="In Poaceae, a single flower and its immediately subtending bracts (lemma and generally palea, the lemma subtending the palea when the latter is present); in a sterile floret, the flower and sometimes palea are rudimentary or absent." >Florets</u>!){
				}
				if(s! <<171>>florets<<171>>!&nbsp;<div class="dropdown"><u class="dotted">florets</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/grass-florets.jpg" class="large-image" alt="image missing" >In Poaceae, a single flower and its immediately subtending bracts (lemma and generally palea, the lemma subtending the palea when the latter is present); in a sterile floret, the flower and sometimes palea are rudimentary or absent.</div></div>!){
				}
				if(s!<<172>>Follicle<<172>>!<u class="dotted" title="Dry fruit from a simple pistil, dehiscent on only one side, along a single suture.  A single flower may develop into a simple fruit of 1 follicle or an aggregate fruit of several follicles." >Follicle</u>!){
				}
				if(s! <<172>>follicle<<172>>!&nbsp;<u class="dotted" title="Dry fruit from a simple pistil, dehiscent on only one side, along a single suture.  A single flower may develop into a simple fruit of 1 follicle or an aggregate fruit of several follicles." >follicle</u>!){
				}
				if(s!<<173>>Follicles<<173>>!<u class="dotted" title="Dry fruit from a simple pistil, dehiscent on only one side, along a single suture.  A single flower may develop into a simple fruit of 1 follicle or an aggregate fruit of several follicles." >Follicles</u>!){
				}
				if(s! <<173>>follicles<<173>>!&nbsp;<div class="dropdown"><u class="dotted">follicles</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/follicles.jpg" class="large-image" alt="image missing" >Dry fruit from a simple pistil, dehiscent on only one side, along a single suture.  A single flower may develop into a simple fruit of 1 follicle or an aggregate fruit of several follicles.</div></div>!){
				}
				if(s!<<174>>Foothill<<174>>!<u class="dotted" title="Slope at the base of a mountain; especially applied to such features in CA-FP." >Foothill</u>!){
				}
				if(s! <<174>>foothill<<174>>!&nbsp;<u class="dotted" title="Slope at the base of a mountain; especially applied to such features in CA-FP." >foothill</u>!){
				}
				if(s!<<175>>Foothills<<175>>!<u class="dotted" title="Slope at the base of a mountain; especially applied to such features in CA-FP." >Foothills</u>!){
				}
				if(s! <<175>>foothills<<175>>!&nbsp;<u class="dotted" title="Slope at the base of a mountain; especially applied to such features in CA-FP." >foothills</u>!){
				}
				if(s!<<176>>Forked<<176>>!<u class="dotted" title="Pertaining to a hair or other structure that branches into two parts." >Forked</u>!){
				}
				if(s! <<176>>forked<<176>>!&nbsp;<div class="dropdown"><u class="dotted">forked</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/forked.jpg" class="large-image" alt="image missing" >Pertaining to a hair or other structure that branches into two parts.</div></div>!){
				}
				if(s!<<177>>Free<<177>>!<u class="dotted" title="Neither fused to nor adherent to other parts; distinct, separate." >Free</u>!){
				}
				if(s! <<177>>free<<177>>!&nbsp;<u class="dotted" title="Neither fused to nor adherent to other parts; distinct, separate." >free</u>!){
				}
				if(s!<<178>>Free-central<<178>>!<u class="dotted" title="Pertaining to a placenta along the central axis in a compound ovary with only one chamber." >Free-central</u>!){
				}
				if(s! <<178>>free-central<<178>>!&nbsp;<div class="dropdown"><u class="dotted">free-central</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/free-central-placenta.jpg" class="large-image" alt="image missing" >Pertaining to a placenta along the central axis in a compound ovary with only one chamber.</div></div>!){
				}
				if(s!<<179>>Fringed<<179>>!<u class="dotted" title="Having ragged or finely cut margins." >Fringed</u>!){
				}
				if(s! <<179>>fringed<<179>>!&nbsp;<div class="dropdown"><u class="dotted">fringed</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/fringed.jpg" class="large-image" alt="image missing" >Having ragged or finely cut margins.</div></div>!){
				}
				if(s!<<180>>Frond<<180>>!<u class="dotted" title="In ferns, a leaf, often compound or dissected, borne on a rhizome." >Frond</u>!){
				}
				if(s! <<180>>frond<<180>>!&nbsp;<u class="dotted" title="In ferns, a leaf, often compound or dissected, borne on a rhizome." >frond</u>!){
				}
				if(s!<<181>>Fruit<<181>>!<u class="dotted" title="An ovary or ovaries and sometimes associated structures after ovule  fertilization (i.e., seed initiation).  A simple fruit develops from one ovary (e.g., cherry, apple, the latter derived largely from the hypanthium); aggregate and multiple fruits develop from ovaries of one and more than one flower, respectively, that remain distinct yet held together as a unit (e.g., a strawberry is an aggregate fruit of achenes held together by a juicy, red flower receptacle; a fig is a multiple fruit of achenes surrounded by a fleshy inflorescence receptacle." >Fruit</u>!){
				}
				if(s! <<181>>fruit<<181>>!&nbsp;<u class="dotted" title="An ovary or ovaries and sometimes associated structures after ovule  fertilization (i.e., seed initiation).  A simple fruit develops from one ovary (e.g., cherry, apple, the latter derived largely from the hypanthium); aggregate and multiple fruits develop from ovaries of one and more than one flower, respectively, that remain distinct yet held together as a unit (e.g., a strawberry is an aggregate fruit of achenes held together by a juicy, red flower receptacle; a fig is a multiple fruit of achenes surrounded by a fleshy inflorescence receptacle." >fruit</u>!){
				}
				if(s!<<182>>Fruits<<182>>!<u class="dotted" title="An ovary or ovaries and sometimes associated structures after ovule  fertilization (i.e., seed initiation).  A simple fruit develops from one ovary (e.g., cherry, apple, the latter derived largely from the hypanthium); aggregate and multiple fruits develop from ovaries of one and more than one flower, respectively, that remain distinct yet held together as a unit (e.g., a strawberry is an aggregate fruit of achenes held together by a juicy, red flower receptacle; a fig is a multiple fruit of achenes surrounded by a fleshy inflorescence receptacle." >Fruits</u>!){
				}
				if(s! <<182>>fruits<<182>>!&nbsp;<u class="dotted" title="An ovary or ovaries and sometimes associated structures after ovule  fertilization (i.e., seed initiation).  A simple fruit develops from one ovary (e.g., cherry, apple, the latter derived largely from the hypanthium); aggregate and multiple fruits develop from ovaries of one and more than one flower, respectively, that remain distinct yet held together as a unit (e.g., a strawberry is an aggregate fruit of achenes held together by a juicy, red flower receptacle; a fig is a multiple fruit of achenes surrounded by a fleshy inflorescence receptacle." >fruits</u>!){
				}
				if(s!<<183>>Funnel-shaped<<183>>!<u class="dotted" title="Widening from the base more or less gradually through the throat into an ascending, spreading, or recurved limb; often applied to a fused calyx or corolla." >Funnel-shaped</u>!){
				}
				if(s! <<183>>funnel-shaped<<183>>!&nbsp;<div class="dropdown"><u class="dotted">funnel-shaped</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/funnel-shaped.jpg" class="large-image" alt="image missing" >Widening from the base more or less gradually through the throat into an ascending, spreading, or recurved limb; often applied to a fused calyx or corolla.</div></div>!){
				}
				if(s!<<184>>Fused<<184>>!<u class="dotted" title="United, as the petals together into a corolla tube or stamens onto petals; neither free nor adherent." >Fused</u>!){
				}
				if(s! <<184>>fused<<184>>!&nbsp;<u class="dotted" title="United, as the petals together into a corolla tube or stamens onto petals; neither free nor adherent." >fused</u>!){
				}
				if(s!<<185>>Fusiform<<185>>!<u class="dotted" title="Elongate, widest at the middle, tapered to both ends." >Fusiform</u>!){
				}
				if(s! <<185>>fusiform<<185>>!&nbsp;<div class="dropdown"><u class="dotted">fusiform</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/fusiform.jpg" class="large-image" alt="image missing" >Elongate, widest at the middle, tapered to both ends.</div></div>!){
				}
				if(s!<<186>>Glabrous<<186>>!<u class="dotted" title="Without hairs." >Glabrous</u>!){
				}
				if(s! <<186>>glabrous<<186>>!&nbsp;<u class="dotted" title="Without hairs." >glabrous</u>!){
				}
				if(s!<<187>>Gland<<187>>!<u class="dotted" title="A small, often spheric body, on or embedded in the epidermis or at the tip of a hair, that exudes a generally sticky substance.  (e.g., Psorothamnus arborescens)" >Gland</u>!){
				}
				if(s! <<187>>gland<<187>>!&nbsp;<u class="dotted" title="A small, often spheric body, on or embedded in the epidermis or at the tip of a hair, that exudes a generally sticky substance.  (e.g., Psorothamnus arborescens)" >gland</u>!){
				}
				if(s!<<188>>Glands<<188>>!<u class="dotted" title="A small, often spheric body, on or embedded in the epidermis or at the tip of a hair, that exudes a generally sticky substance.  (e.g., Psorothamnus arborescens)" >Glands</u>!){
				}
				if(s! <<188>>glands<<188>>!&nbsp;<u class="dotted" title="A small, often spheric body, on or embedded in the epidermis or at the tip of a hair, that exudes a generally sticky substance.  (e.g., Psorothamnus arborescens)" >glands</u>!){
				}
				if(s!<<189>>Glandular<<189>>!<u class="dotted" title="A small, often spheric body, on or embedded in the epidermis or at the tip of a hair, that exudes a generally sticky substance.  (e.g., Psorothamnus arborescens)" >Glandular</u>!){
				}
				if(s! <<189>>glandular<<189>>!&nbsp;<u class="dotted" title="A small, often spheric body, on or embedded in the epidermis or at the tip of a hair, that exudes a generally sticky substance.  (e.g., Psorothamnus arborescens)" >glandular</u>!){
				}
				if(s!<<190>>Glaucous<<190>>!<u class="dotted" title="Covered with a generally whitish or bluish, waxy or powdery film that is sometimes easily rubbed off." >Glaucous</u>!){
				}
				if(s! <<190>>glaucous<<190>>!&nbsp;<u class="dotted" title="Covered with a generally whitish or bluish, waxy or powdery film that is sometimes easily rubbed off." >glaucous</u>!){
				}
				if(s!<<191>>Glume<<191>>!<u class="dotted" title="In Poaceae, each of generally two sheathing bracts that are the lowermost parts of a spikelet, subtending one or more florets." >Glume</u>!){
				}
				if(s! <<191>>glume<<191>>!&nbsp;<div class="dropdown"><u class="dotted">glume</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/grass-glume.jpg" class="large-image" alt="image missing" >In Poaceae, each of generally two sheathing bracts that are the lowermost parts of a spikelet, subtending one or more florets.</div></div>!){
				}
				if(s!<<192>>Glumes<<192>>!<u class="dotted" title="In Poaceae, each of generally two sheathing bracts that are the lowermost parts of a spikelet, subtending one or more florets." >Glumes</u>!){
				}
				if(s! <<192>>glumes<<192>>!&nbsp;<u class="dotted" title="In Poaceae, each of generally two sheathing bracts that are the lowermost parts of a spikelet, subtending one or more florets." >glumes</u>!){
				}
				if(s!<<193>>Graduated<<193>>!<u class="dotted" title="In Asteraceae, pertaining to an involucre in which the phyllaries are of unequal length, with the outer shortest, the inner longest, and a gradual transition through multiple series between." >Graduated</u>!){
				}
				if(s! <<193>>graduated<<193>>!&nbsp;<u class="dotted" title="In Asteraceae, pertaining to an involucre in which the phyllaries are of unequal length, with the outer shortest, the inner longest, and a gradual transition through multiple series between." >graduated</u>!){
				}
				if(s!<<194>>Granular<<194>>!<u class="dotted" title="Covered with minute bumps." >Granular</u>!){
				}
				if(s! <<194>>granular<<194>>!&nbsp;<div class="dropdown"><u class="dotted">granular</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/granular.jpg" class="large-image" alt="image missing" >Covered with minute bumps.</div></div>!){
				}
				if(s!<<195>>Grassland<<195>>!<u class="dotted" title="Vegetation dominated by various species of grasses, often mixed with various other kinds of herbs (not grasses) and sometimes scattered, low-growing shrubs." >Grassland</u>!){
				}
				if(s! <<195>>grassland<<195>>!&nbsp;<u class="dotted" title="Vegetation dominated by various species of grasses, often mixed with various other kinds of herbs (not grasses) and sometimes scattered, low-growing shrubs." >grassland</u>!){
				}
				if(s!<<196>>Grasslands<<196>>!<u class="dotted" title="Vegetation dominated by various species of grasses, often mixed with various other kinds of herbs (not grasses) and sometimes scattered, low-growing shrubs." >Grasslands</u>!){
				}
				if(s! <<196>>grasslands<<196>>!&nbsp;<u class="dotted" title="Vegetation dominated by various species of grasses, often mixed with various other kinds of herbs (not grasses) and sometimes scattered, low-growing shrubs." >grasslands</u>!){
				}
				if(s!<<197>>Gymnosperm<<197>>!<u class="dotted" title="Plant that bears woody or fleshy cones, not flowers, in which 'naked seeds' (hence, gymno-sperm) are not enclosed in an ovary; woody, including e.g., pine, sequoia, ephedra, yew." >Gymnosperm</u>!){
				}
				if(s! <<197>>gymnosperm<<197>>!&nbsp;<u class="dotted" title="Plant that bears woody or fleshy cones, not flowers, in which 'naked seeds' (hence, gymno-sperm) are not enclosed in an ovary; woody, including e.g., pine, sequoia, ephedra, yew." >gymnosperm</u>!){
				}
				if(s!<<198>>Gymnosperms<<198>>!<u class="dotted" title="Plant that bears woody or fleshy cones, not flowers, in which 'naked seeds' (hence, gymno-sperm) are not enclosed in an ovary; woody, including e.g., pine, sequoia, ephedra, yew." >Gymnosperms</u>!){
				}
				if(s! <<198>>gymnosperms<<198>>!&nbsp;<u class="dotted" title="Plant that bears woody or fleshy cones, not flowers, in which 'naked seeds' (hence, gymno-sperm) are not enclosed in an ovary; woody, including e.g., pine, sequoia, ephedra, yew." >gymnosperms</u>!){
				}
				if(s!<<199>>Habit<<199>>!<u class="dotted" title="Characteristic mode of growth, general form, or shape of a plant (e.g., cespitose, herb, scapose, shrub)." >Habit</u>!){
				}
				if(s! <<199>>habit<<199>>!&nbsp;<u class="dotted" title="Characteristic mode of growth, general form, or shape of a plant (e.g., cespitose, herb, scapose, shrub)." >habit</u>!){
				}
				if(s!<<200>>Habits<<200>>!<u class="dotted" title="Characteristic mode of growth, general form, or shape of a plant (e.g., cespitose, herb, scapose, shrub)." >Habits</u>!){
				}
				if(s! <<200>>habits<<200>>!&nbsp;<u class="dotted" title="Characteristic mode of growth, general form, or shape of a plant (e.g., cespitose, herb, scapose, shrub)." >habits</u>!){
				}
				if(s!<<201>>Habitat<<201>>!<u class="dotted" title="Natural setting or conditions under which a plant lives (e.g., saltbush scrub, vernal pool, granitic soil among pines, montane forest)." >Habitat</u>!){
				}
				if(s! <<201>>habitat<<201>>!&nbsp;<u class="dotted" title="Natural setting or conditions under which a plant lives (e.g., saltbush scrub, vernal pool, granitic soil among pines, montane forest)." >habitat</u>!){
				}
				if(s!<<202>>Habitats<<202>>!<u class="dotted" title="Natural setting or conditions under which a plant lives (e.g., saltbush scrub, vernal pool, granitic soil among pines, montane forest)." >Habitats</u>!){
				}
				if(s! <<202>>habitats<<202>>!&nbsp;<u class="dotted" title="Natural setting or conditions under which a plant lives (e.g., saltbush scrub, vernal pool, granitic soil among pines, montane forest)." >habitats</u>!){
				}
				if(s!<<203>>Hair<<203>>!<u class="dotted" title="Thread-like epidermal outgrowth." >Hair</u>!){
				}
				if(s! <<203>>hair<<203>>!&nbsp;<u class="dotted" title="Thread-like epidermal outgrowth." >hair</u>!){
				}
				if(s!<<204>>Hairs<<204>>!<u class="dotted" title="Thread-like epidermal outgrowth." >Hairs</u>!){
				}
				if(s! <<204>>hairs<<204>>!&nbsp;<u class="dotted" title="Thread-like epidermal outgrowth." >hairs</u>!){
				}
				if(s!<<205>>Haploid<<205>>!<u class="dotted" title="Having one set of chromosomes (maternal or paternal); n." >Haploid</u>!){
				}
				if(s! <<205>>haploid<<205>>!&nbsp;<u class="dotted" title="Having one set of chromosomes (maternal or paternal); n." >haploid</u>!){
				}
				if(s!<<206>>Hastate<<206>>!<u class="dotted" title="Arrowhead-shaped, with two basal lobes oriented more or less perpendicularly to the long axis." >Hastate</u>!){
				}
				if(s! <<206>>hastate<<206>>!&nbsp;<div class="dropdown"><u class="dotted">hastate</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/hastate.jpg" class="large-image" alt="image missing" >Arrowhead-shaped, with two basal lobes oriented more or less perpendicularly to the long axis.</div></div>!){
				}
				if(s!<<207>>Head<<207>>!<u class="dotted" title="1. A dense, often spheric inflorescence of sessile or subsessile flowers.<br>2. In Asteraceae and some other groups, a head-like inflorescence is one in which sessile or subsessile inflorescence units (e.g., heads in Asteraceae, umbels enclosed by involucres in Eriogonum), instead of individual flowers, are attached in a short dense cluster without an evident axis or branches." >Head</u>!){
				}
				if(s! <<207>>head<<207>>!&nbsp;<div class="dropdown"><u class="dotted">head</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/head.jpg" class="large-image" alt="image missing" >1. A dense, often spheric inflorescence of sessile or subsessile flowers.<br>2. In Asteraceae and some other groups, a head-like inflorescence is one in which sessile or subsessile inflorescence units (e.g., heads in Asteraceae, umbels enclosed by involucres in Eriogonum), instead of individual flowers, are attached in a short dense cluster without an evident axis or branches.</div></div>!){
				}
				if(s!<<208>>Heads<<208>>!<u class="dotted" title="1. A dense, often spheric inflorescence of sessile or subsessile flowers.<br>2. In Asteraceae and some other groups, a head-like inflorescence is one in which sessile or subsessile inflorescence units (e.g., heads in Asteraceae, umbels enclosed by involucres in Eriogonum), instead of individual flowers, are attached in a short dense cluster without an evident axis or branches." >Heads</u>!){
				}
				if(s! <<208>>heads<<208>>!&nbsp;<u class="dotted" title="1. A dense, often spheric inflorescence of sessile or subsessile flowers.<br>2. In Asteraceae and some other groups, a head-like inflorescence is one in which sessile or subsessile inflorescence units (e.g., heads in Asteraceae, umbels enclosed by involucres in Eriogonum), instead of individual flowers, are attached in a short dense cluster without an evident axis or branches." >heads</u>!){
				}
				if(s!<<209>>Hemispheric<<209>>!<u class="dotted" title="Shaped like a dome or half sphere." >Hemispheric</u>!){
				}
				if(s! <<209>>hemispheric<<209>>!&nbsp;<u class="dotted" title="Shaped like a dome or half sphere." >hemispheric</u>!){
				}
				if(s!<<210>>Herb<<210>>!<u class="dotted" title="Plant that, at least above ground, is generally non-woody and of less than one year or growing season in duration." >Herb</u>!){
				}
				if(s! <<210>>herb<<210>>!&nbsp;<u class="dotted" title="Plant that, at least above ground, is generally non-woody and of less than one year or growing season in duration." >herb</u>!){
				}
				if(s!<<211>>Herbs<<211>>!<u class="dotted" title="Plant that, at least above ground, is generally non-woody and of less than one year or growing season in duration." >Herbs</u>!){
				}
				if(s! <<211>>herbs<<211>>!&nbsp;<u class="dotted" title="Plant that, at least above ground, is generally non-woody and of less than one year or growing season in duration." >herbs</u>!){
				}
				if(s!<<212>>Herbaceous<<212>>!<u class="dotted" title="Lacking wood; having the characteristics of an herb." >Herbaceous</u>!){
				}
				if(s! <<212>>herbaceous<<212>>!&nbsp;<u class="dotted" title="Lacking wood; having the characteristics of an herb." >herbaceous</u>!){
				}
				if(s!<<213>>Herbage<<213>>!<u class="dotted" title="The above-ground, non-woody parts of a plant, including especially the leaves and young stems taken together, excluding flowers and fruits." >Herbage</u>!){
				}
				if(s! <<213>>herbage<<213>>!&nbsp;<u class="dotted" title="The above-ground, non-woody parts of a plant, including especially the leaves and young stems taken together, excluding flowers and fruits." >herbage</u>!){
				}
				if(s!<<214>>Heterostylous<<214>>!<u class="dotted" title="Pertaining to a taxon in which individual plants produce only one of two or more flower types, each differing in style (and generally stamen) length." >Heterostylous</u>!){
				}
				if(s! <<214>>heterostylous<<214>>!&nbsp;<u class="dotted" title="Pertaining to a taxon in which individual plants produce only one of two or more flower types, each differing in style (and generally stamen) length." >heterostylous</u>!){
				}
				if(s!<<215>>Hypanthium<<215>>!<u class="dotted" title="Structure generally in the shape of a tube, cup, or bowl, derived from the fused lower portions of the perianth and stamens, from which these parts seem to arise, and to which the ovary wall is fused in an inferior ovary (to which the ovary wall is partially fused in a half-inferior ovary; from which the ovary is free in a superior ovary)." >Hypanthium</u>!){
				}
				if(s! <<215>>hypanthium<<215>>!&nbsp;<div class="dropdown"><u class="dotted">hypanthium</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/hypanthium.jpg" class="large-image" alt="image missing" >Structure generally in the shape of a tube, cup, or bowl, derived from the fused lower portions of the perianth and stamens, from which these parts seem to arise, and to which the ovary wall is fused in an inferior ovary (to which the ovary wall is partially fused in a half-inferior ovary; from which the ovary is free in a superior ovary).</div></div>!){
				}
				if(s!<<216>>Hypanthia<<216>>!<u class="dotted" title="Structure generally in the shape of a tube, cup, or bowl, derived from the fused lower portions of the perianth and stamens, from which these parts seem to arise, and to which the ovary wall is fused in an inferior ovary (to which the ovary wall is partially fused in a half-inferior ovary; from which the ovary is free in a superior ovary)." >Hypanthia</u>!){
				}
				if(s! <<216>>hypanthia<<216>>!&nbsp;<u class="dotted" title="Structure generally in the shape of a tube, cup, or bowl, derived from the fused lower portions of the perianth and stamens, from which these parts seem to arise, and to which the ovary wall is fused in an inferior ovary (to which the ovary wall is partially fused in a half-inferior ovary; from which the ovary is free in a superior ovary)." >hypanthia</u>!){
				}
				if(s!<<217>>Included<<217>>!<u class="dotted" title="Not protruding out of surrounding structure(s) (e.g., stamens included in corolla)." >Included</u>!){
				}
				if(s! <<217>>included<<217>>!&nbsp;<div class="dropdown"><u class="dotted">included</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/included-stamens.jpg" class="large-image" alt="image missing" >Not protruding out of surrounding structure(s) (e.g., stamens included in corolla).</div></div>!){
				}
				if(s!<<218>>Indehiscent<<218>>!<u class="dotted" title="Not opening inherently to release contents; usually pertaining to fruits." >Indehiscent</u>!){
				}
				if(s! <<218>>indehiscent<<218>>!&nbsp;<div class="dropdown"><u class="dotted">indehiscent</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/indehiscent.jpg" class="large-image" alt="image missing" >Not opening inherently to release contents; usually pertaining to fruits.</div></div>!){
				}
				if(s!<<219>>Indusium<<219>>!<u class="dotted" title="In many ferns, a veil- or scale-like outgrowth of the leaf surface that covers a sorus." >Indusium</u>!){
				}
				if(s! <<219>>indusium<<219>>!&nbsp;<div class="dropdown"><u class="dotted">indusium</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/indusium.jpg" class="large-image" alt="image missing" >In many ferns, a veil- or scale-like outgrowth of the leaf surface that covers a sorus.</div></div>!){
				}
				if(s!<<220>>Indusia<<220>>!<u class="dotted" title="In many ferns, a veil- or scale-like outgrowth of the leaf surface that covers a sorus." >Indusia</u>!){
				}
				if(s! <<220>>indusia<<220>>!&nbsp;<u class="dotted" title="In many ferns, a veil- or scale-like outgrowth of the leaf surface that covers a sorus." >indusia</u>!){
				}
				if(s!<<221>>Inferior<<221>>!<u class="dotted" title="An ovary that is fused to the fused lower portions of the perianth and stamens (i.e., to the hypanthium), to the extent that these structures appear to arise at or above its summit" >Inferior</u>!){
				}
				if(s! <<221>>inferior<<221>>!&nbsp;<u class="dotted" title="An ovary that is fused to the fused lower portions of the perianth and stamens (i.e., to the hypanthium), to the extent that these structures appear to arise at or above its summit" >inferior</u>!){
				}
				if(s!<<222>>Inflorescence<<222>>!<u class="dotted" title="An entire cluster or aggregation of flowers and associated structures (e.g., axes, bracts, bractlets, pedicels); often difficult to determine as to type and boundaries but generally excluding full-sized foliage leaves." >Inflorescence</u>!){
				}
				if(s! <<222>>inflorescence<<222>>!&nbsp;<u class="dotted" title="An entire cluster or aggregation of flowers and associated structures (e.g., axes, bracts, bractlets, pedicels); often difficult to determine as to type and boundaries but generally excluding full-sized foliage leaves." >inflorescence</u>!){
				}
				if(s!<<223>>Inflorescences<<223>>!<u class="dotted" title="An entire cluster or aggregation of flowers and associated structures (e.g., axes, bracts, bractlets, pedicels); often difficult to determine as to type and boundaries but generally excluding full-sized foliage leaves." >Inflorescences</u>!){
				}
				if(s! <<223>>inflorescences<<223>>!&nbsp;<u class="dotted" title="An entire cluster or aggregation of flowers and associated structures (e.g., axes, bracts, bractlets, pedicels); often difficult to determine as to type and boundaries but generally excluding full-sized foliage leaves." >inflorescences</u>!){
				}
				if(s!<<224>>Infraspecific<<224>>!<u class="dotted" title="Below the species level or within a species;  pertaining to variation within a species, whether taxonomically significant (i.e., characterizing subspecies or varieties) or not (e.g., characterizing forms or minor variants)." >Infraspecific</u>!){
				}
				if(s! <<224>>infraspecific<<224>>!&nbsp;<u class="dotted" title="Below the species level or within a species;  pertaining to variation within a species, whether taxonomically significant (i.e., characterizing subspecies or varieties) or not (e.g., characterizing forms or minor variants)." >infraspecific</u>!){
				}
				if(s!<<225>>Intergrade<<225>>!<u class="dotted" title="To merge gradually from one extreme to another through a more or less continuous series of intermediates." >Intergrade</u>!){
				}
				if(s! <<225>>intergrade<<225>>!&nbsp;<u class="dotted" title="To merge gradually from one extreme to another through a more or less continuous series of intermediates." >intergrade</u>!){
				}
				if(s!<<226>>Intermediate<<226>>!<u class="dotted" title="Between extremes or parental taxa in size, shape, color, flowering time, habitat preferences, geographic ranges, or other ways." >Intermediate</u>!){
				}
				if(s! <<226>>intermediate<<226>>!&nbsp;<u class="dotted" title="Between extremes or parental taxa in size, shape, color, flowering time, habitat preferences, geographic ranges, or other ways." >intermediate</u>!){
				}
				if(s!<<227>>Internode<<227>>!<u class="dotted" title="Segment of an axis (generally a stem) between successive positions (nodes) from which one or more structures (especially leaves, buds, branches, or flowers) arise." >Internode</u>!){
				}
				if(s! <<227>>internode<<227>>!&nbsp;<div class="dropdown"><u class="dotted">internode</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/node-internode.jpg" class="large-image" alt="image missing" >Segment of an axis (generally a stem) between successive positions (nodes) from which one or more structures (especially leaves, buds, branches, or flowers) arise.</div></div>!){
				}
				if(s!<<228>>Internodes<<228>>!<u class="dotted" title="Segment of an axis (generally a stem) between successive positions (nodes) from which one or more structures (especially leaves, buds, branches, or flowers) arise." >Internodes</u>!){
				}
				if(s! <<228>>internodes<<228>>!&nbsp;<div class="dropdown"><u class="dotted">internodes</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/node-internode.jpg" class="large-image" alt="image missing" >Segment of an axis (generally a stem) between successive positions (nodes) from which one or more structures (especially leaves, buds, branches, or flowers) arise.</div></div>!){
				}
				if(s!<<229>>Interrupted<<229>>!<u class="dotted" title="Having parts spaced unevenly, clustered; pertaining especially to inflorescences in which the flowers are clustered." >Interrupted</u>!){
				}
				if(s! <<229>>interrupted<<229>>!&nbsp;<u class="dotted" title="Having parts spaced unevenly, clustered; pertaining especially to inflorescences in which the flowers are clustered." >interrupted</u>!){
				}
				if(s!<<230>>Intertidal<<230>>!<u class="dotted" title="Pertaining to marine habitats that are submerged at high tide and exposed at low tide." >Intertidal</u>!){
				}
				if(s! <<230>>intertidal<<230>>!&nbsp;<u class="dotted" title="Pertaining to marine habitats that are submerged at high tide and exposed at low tide." >intertidal</u>!){
				}
				if(s!<<231>>Involucel<<231>>!<u class="dotted" title="A secondary involucre (group of bracts) within an inflorescence (e.g., those subtending the secondary umbels in members of Apiaceae)." >Involucel</u>!){
				}
				if(s! <<231>>involucel<<231>>!&nbsp;<div class="dropdown"><u class="dotted">involucel</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/involucel.jpg" class="large-image" alt="image missing" >A secondary involucre (group of bracts) within an inflorescence (e.g., those subtending the secondary umbels in members of Apiaceae).</div></div>!){
				}
				if(s!<<232>>Involucre<<232>>!<u class="dotted" title="Group of bracts more or less held together as a unit, subtending a flower, fruit (acorn cup), or inflorescence." >Involucre</u>!){
				}
				if(s! <<232>>involucre<<232>>!&nbsp;<div class="dropdown"><u class="dotted">involucre</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/involucre.jpg" class="large-image" alt="image missing" >Group of bracts more or less held together as a unit, subtending a flower, fruit (acorn cup), or inflorescence.</div></div>!){
				}
				if(s!<<233>>Involucres<<233>>!<u class="dotted" title="Group of bracts more or less held together as a unit, subtending a flower, fruit (acorn cup), or inflorescence." >Involucres</u>!){
				}
				if(s! <<233>>involucres<<233>>!&nbsp;<u class="dotted" title="Group of bracts more or less held together as a unit, subtending a flower, fruit (acorn cup), or inflorescence." >involucres</u>!){
				}
				if(s!<<234>>Keel<<234>>!<u class="dotted" title="1. Ridge or crease more or less centrally located on the long axis of a structure, generally on the abaxial side.  2. The two lowermost, fused petals of many members of Fabaceae." >Keel</u>!){
				}
				if(s! <<234>>keel<<234>>!&nbsp;<u class="dotted" title="1. Ridge or crease more or less centrally located on the long axis of a structure, generally on the abaxial side.  2. The two lowermost, fused petals of many members of Fabaceae." >keel</u>!){
				}
				if(s!<<235>>Keels<<235>>!<u class="dotted" title="1. Ridge or crease more or less centrally located on the long axis of a structure, generally on the abaxial side.  2. The two lowermost, fused petals of many members of Fabaceae." >Keels</u>!){
				}
				if(s! <<235>>keels<<235>>!&nbsp;<u class="dotted" title="1. Ridge or crease more or less centrally located on the long axis of a structure, generally on the abaxial side.  2. The two lowermost, fused petals of many members of Fabaceae." >keels</u>!){
				}
				if(s!<<236>>Keeled<<236>>!<u class="dotted" title="1. Having a ridge or crease more or less centrally located on the long axis of a structure, generally on the abaxial side." >Keeled</u>!){
				}
				if(s! <<236>>keeled<<236>>!&nbsp;<u class="dotted" title="1. Having a ridge or crease more or less centrally located on the long axis of a structure, generally on the abaxial side." >keeled</u>!){
				}
				if(s!<<237>>Lamina<<237>>!<u class="dotted" title="In Asteraceae, the strap- or fan-shaped outer portion of the corolla of a ray flower, with generally 3 (sometimes 0, 2, or 4) lobes, or the similarly shaped, 3-lobed outer lip of the 2-lipped corolla of Trixis and Acourtia." >Lamina</u>!){
				}
				if(s! <<237>>lamina<<237>>!&nbsp;<u class="dotted" title="In Asteraceae, the strap- or fan-shaped outer portion of the corolla of a ray flower, with generally 3 (sometimes 0, 2, or 4) lobes, or the similarly shaped, 3-lobed outer lip of the 2-lipped corolla of Trixis and Acourtia." >lamina</u>!){
				}
				if(s!<<238>>Laminae<<238>>!<u class="dotted" title="In Asteraceae, the strap- or fan-shaped outer portion of the corolla of a ray flower, with generally 3 (sometimes 0, 2, or 4) lobes, or the similarly shaped, 3-lobed outer lip of the 2-lipped corolla of Trixis and Acourtia." >Laminae</u>!){
				}
				if(s! <<238>>laminae<<238>>!&nbsp;<u class="dotted" title="In Asteraceae, the strap- or fan-shaped outer portion of the corolla of a ray flower, with generally 3 (sometimes 0, 2, or 4) lobes, or the similarly shaped, 3-lobed outer lip of the 2-lipped corolla of Trixis and Acourtia." >laminae</u>!){
				}
				if(s!<<239>>Lanceolate<<239>>!<u class="dotted" title="Narrowly elongate, widest in the basal half, often tapered to an acute tip." >Lanceolate</u>!){
				}
				if(s! <<239>>lanceolate<<239>>!&nbsp;<div class="dropdown"><u class="dotted">lanceolate</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/lanceolate.jpg" class="large-image" alt="image missing" >Narrowly elongate, widest in the basal half, often tapered to an acute tip.</div></div>!){
				}
				if(s!<<240>>Lateral<<240>>!<u class="dotted" title="Pertaining to the sides(s) of a structure; e.g., laterally compressed (flattened side-to-side), lateral branch, lateral appendage." >Lateral</u>!){
				}
				if(s! <<240>>lateral<<240>>!&nbsp;<u class="dotted" title="Pertaining to the sides(s) of a structure; e.g., laterally compressed (flattened side-to-side), lateral branch, lateral appendage." >lateral</u>!){
				}
				if(s!<<241>>Leaf<<241>>!<u class="dotted" title="Organ arising from a stem, generally composed of a stalk (petiole) and a flat, expanded, green, photosynthetic area (blade); distinguished from a leaflet by the presence in its axil of a bud, branch, thorn, or flower; sometimes with lateral, basal appendages (stipules); either simple (toothed, lobed, or dissected but not divided into leaflets) or compound (divided into leaflets)." >Leaf</u>!){
				}
				if(s! <<241>>leaf<<241>>!&nbsp;<div class="dropdown"><u class="dotted">leaf</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/leaf.jpg" class="large-image" alt="image missing" >Organ arising from a stem, generally composed of a stalk (petiole) and a flat, expanded, green, photosynthetic area (blade); distinguished from a leaflet by the presence in its axil of a bud, branch, thorn, or flower; sometimes with lateral, basal appendages (stipules); either simple (toothed, lobed, or dissected but not divided into leaflets) or compound (divided into leaflets).</div></div>!){
				}
				if(s!<<242>>Leaves<<242>>!<u class="dotted" title="Organ arising from a stem, generally composed of a stalk (petiole) and a flat, expanded, green, photosynthetic area (blade); distinguished from a leaflet by the presence in its axil of a bud, branch, thorn, or flower; sometimes with lateral, basal appendages (stipules); either simple (toothed, lobed, or dissected but not divided into leaflets) or compound (divided into leaflets)." >Leaves</u>!){
				}
				if(s! <<242>>leaves<<242>>!&nbsp;<u class="dotted" title="Organ arising from a stem, generally composed of a stalk (petiole) and a flat, expanded, green, photosynthetic area (blade); distinguished from a leaflet by the presence in its axil of a bud, branch, thorn, or flower; sometimes with lateral, basal appendages (stipules); either simple (toothed, lobed, or dissected but not divided into leaflets) or compound (divided into leaflets)." >leaves</u>!){
				}
				if(s!<<243>>Leaflet<<243>>!<u class="dotted" title="A leaf-like unit of a compound leaf; distinguished from a leaf by the absence in its axil of a bud, branch, thorn, or flower; lacking lateral, basal appendages (stipules); either simple (leaf 1-compound, with primary leaflets) or compound (leaf 2-compound, with primary and secondary leaflets; 3-compound, with primary, secondary, and tertiary leaflets, etc)." >Leaflet</u>!){
				}
				if(s! <<243>>leaflet<<243>>!&nbsp;<div class="dropdown"><u class="dotted">leaflet</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/primary-leaflet.jpg" class="large-image" alt="image missing" >A leaf-like unit of a compound leaf; distinguished from a leaf by the absence in its axil of a bud, branch, thorn, or flower; lacking lateral, basal appendages (stipules); either simple (leaf 1-compound, with primary leaflets) or compound (leaf 2-compound, with primary and secondary leaflets; 3-compound, with primary, secondary, and tertiary leaflets, etc).</div></div>!){
				}
				if(s!<<244>>Leaflets<<244>>!<u class="dotted" title="A leaf-like unit of a compound leaf; distinguished from a leaf by the absence in its axil of a bud, branch, thorn, or flower; lacking lateral, basal appendages (stipules); either simple (leaf 1-compound, with primary leaflets) or compound (leaf 2-compound, with primary and secondary leaflets; 3-compound, with primary, secondary, and tertiary leaflets, etc)." >Leaflets</u>!){
				}
				if(s! <<244>>leaflets<<244>>!&nbsp;<u class="dotted" title="A leaf-like unit of a compound leaf; distinguished from a leaf by the absence in its axil of a bud, branch, thorn, or flower; lacking lateral, basal appendages (stipules); either simple (leaf 1-compound, with primary leaflets) or compound (leaf 2-compound, with primary and secondary leaflets; 3-compound, with primary, secondary, and tertiary leaflets, etc)." >leaflets</u>!){
				}
				if(s!<<245>>Legume<<245>>!<u class="dotted" title="In Fabaceae (legume family), a dry or somewhat fleshy, one- to many-seeded fruit from a simple pistil, typically dehiscent longitudinally along two sutures and splitting into halves that remain joined at the base, sometimes indehiscent or breaking crosswise into one-seeded segments; a plant with such a fruit." >Legume</u>!){
				}
				if(s! <<245>>legume<<245>>!&nbsp;<u class="dotted" title="In Fabaceae (legume family), a dry or somewhat fleshy, one- to many-seeded fruit from a simple pistil, typically dehiscent longitudinally along two sutures and splitting into halves that remain joined at the base, sometimes indehiscent or breaking crosswise into one-seeded segments; a plant with such a fruit." >legume</u>!){
				}
				if(s!<<246>>Legumes<<246>>!<u class="dotted" title="In Fabaceae (legume family), a dry or somewhat fleshy, one- to many-seeded fruit from a simple pistil, typically dehiscent longitudinally along two sutures and splitting into halves that remain joined at the base, sometimes indehiscent or breaking crosswise into one-seeded segments; a plant with such a fruit." >Legumes</u>!){
				}
				if(s! <<246>>legumes<<246>>!&nbsp;<u class="dotted" title="In Fabaceae (legume family), a dry or somewhat fleshy, one- to many-seeded fruit from a simple pistil, typically dehiscent longitudinally along two sutures and splitting into halves that remain joined at the base, sometimes indehiscent or breaking crosswise into one-seeded segments; a plant with such a fruit." >legumes</u>!){
				}
				if(s!<<247>>Lemma<<247>>!<u class="dotted" title="In Poaceae, the lower, generally larger of two sheathing bracts subtending a flower, generally ensheathing the palea (in a sterile lemma, the associated flower and sometimes palea are rudimentary or absent); with the palea and flower, comprising the floret." >Lemma</u>!){
				}
				if(s! <<247>>lemma<<247>>!&nbsp;<div class="dropdown"><u class="dotted">lemma</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/grass-lemma.jpg" class="large-image" alt="image missing" >In Poaceae, the lower, generally larger of two sheathing bracts subtending a flower, generally ensheathing the palea (in a sterile lemma, the associated flower and sometimes palea are rudimentary or absent); with the palea and flower, comprising the floret.</div></div>!){
				}
				if(s!<<248>>Lemmas<<248>>!<u class="dotted" title="In Poaceae, the lower, generally larger of two sheathing bracts subtending a flower, generally ensheathing the palea (in a sterile lemma, the associated flower and sometimes palea are rudimentary or absent); with the palea and flower, comprising the floret." >Lemmas</u>!){
				}
				if(s! <<248>>lemmas<<248>>!&nbsp;<div class="dropdown"><u class="dotted">lemmas</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/grass-lemma.jpg" class="large-image" alt="image missing" >In Poaceae, the lower, generally larger of two sheathing bracts subtending a flower, generally ensheathing the palea (in a sterile lemma, the associated flower and sometimes palea are rudimentary or absent); with the palea and flower, comprising the floret.</div></div>!){
				}
				if(s!<<249>>Lenticel<<249>>!<u class="dotted" title="Each of many spongy or calloused areas of various shapes, sizes, and colors, most commonly on surfaces of young stems (including twigs) or fruits." >Lenticel</u>!){
				}
				if(s! <<249>>lenticel<<249>>!&nbsp;<u class="dotted" title="Each of many spongy or calloused areas of various shapes, sizes, and colors, most commonly on surfaces of young stems (including twigs) or fruits." >lenticel</u>!){
				}
				if(s!<<250>>Lenticels<<250>>!<u class="dotted" title="Each of many spongy or calloused areas of various shapes, sizes, and colors, most commonly on surfaces of young stems (including twigs) or fruits." >Lenticels</u>!){
				}
				if(s! <<250>>lenticels<<250>>!&nbsp;<div class="dropdown"><u class="dotted">lenticels</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/lenticels.jpg" class="large-image" alt="image missing" >Each of many spongy or calloused areas of various shapes, sizes, and colors, most commonly on surfaces of young stems (including twigs) or fruits.</div></div>!){
				}
				if(s!<<251>>Lenticular<<251>>!<u class="dotted" title="Lens- or discus-shaped, with both major sides convex." >Lenticular</u>!){
				}
				if(s! <<251>>lenticular<<251>>!&nbsp;<u class="dotted" title="Lens- or discus-shaped, with both major sides convex." >lenticular</u>!){
				}
				if(s!<<252>>Ligulate flower<<252>>!<u class="dotted" title="In Asteraceae, a bisexual, bilateral flower with the outer portion of the corolla (the ligule) strap- or fan-shaped, 5-lobed; appearing only with other ligulate flowers in a liguliflorous head." >Ligulate flower</u>!){
				}
				if(s! <<252>>ligulate flower<<252>>!&nbsp;<u class="dotted" title="In Asteraceae, a bisexual, bilateral flower with the outer portion of the corolla (the ligule) strap- or fan-shaped, 5-lobed; appearing only with other ligulate flowers in a liguliflorous head." >ligulate flower</u>!){
				}
				if(s!<<253>>Ligule<<253>>!<u class="dotted" title="1. In Asteraceae, the 5-lobed, strap- or fan-shaped outer portion of the corolla of a ligulate flower. 2. In most Poaceae and some other grass-like plants, an appendage at the adaxial junction of leaf sheath and blade, generally membranous, sometimes formed of hairs. 3. In Isoetes and, more obscurely, in Selaginella, a membrane that wholly or partially covers a sporangium." >Ligule</u>!){
				}
				if(s! <<253>>ligule<<253>>!&nbsp;<div class="dropdown"><u class="dotted">ligule</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/grass-leaf-ligule.jpg" class="large-image" alt="image missing" >1. In Asteraceae, the 5-lobed, strap- or fan-shaped outer portion of the corolla of a ligulate flower. 2. In most Poaceae and some other grass-like plants, an appendage at the adaxial junction of leaf sheath and blade, generally membranous, sometimes formed of hairs. 3. In Isoetes and, more obscurely, in Selaginella, a membrane that wholly or partially covers a sporangium.</div></div>!){
				}
				if(s!<<254>>Ligules<<254>>!<u class="dotted" title="1. In Asteraceae, the 5-lobed, strap- or fan-shaped outer portion of the corolla of a ligulate flower. 2. In most Poaceae and some other grass-like plants, an appendage at the adaxial junction of leaf sheath and blade, generally membranous, sometimes formed of hairs. 3. In Isoetes and, more obscurely, in Selaginella, a membrane that wholly or partially covers a sporangium." >Ligules</u>!){
				}
				if(s! <<254>>ligules<<254>>!&nbsp;<u class="dotted" title="1. In Asteraceae, the 5-lobed, strap- or fan-shaped outer portion of the corolla of a ligulate flower. 2. In most Poaceae and some other grass-like plants, an appendage at the adaxial junction of leaf sheath and blade, generally membranous, sometimes formed of hairs. 3. In Isoetes and, more obscurely, in Selaginella, a membrane that wholly or partially covers a sporangium." >ligules</u>!){
				}
				if(s!<<255>>Liguliflorous<<255>>!<u class="dotted" title="In Asteraceae, a head composed entirely of ligulate flowers." >Liguliflorous</u>!){
				}
				if(s! <<255>>liguliflorous<<255>>!&nbsp;<u class="dotted" title="In Asteraceae, a head composed entirely of ligulate flowers." >liguliflorous</u>!){
				}
				if(s!<<256>>Limb<<256>>!<u class="dotted" title="In calyces or corollas with fused sepals or petals, the expanded, often lobed portion distal to the tube or throat; in some free or nearly free sepals and petals, the expanded portion distal to the stalk-like base (claw)." >Limb</u>!){
				}
				if(s! <<256>>limb<<256>>!&nbsp;<u class="dotted" title="In calyces or corollas with fused sepals or petals, the expanded, often lobed portion distal to the tube or throat; in some free or nearly free sepals and petals, the expanded portion distal to the stalk-like base (claw)." >limb</u>!){
				}
				if(s!<<257>>Limbs<<257>>!<u class="dotted" title="In calyces or corollas with fused sepals or petals, the expanded, often lobed portion distal to the tube or throat; in some free or nearly free sepals and petals, the expanded portion distal to the stalk-like base (claw)." >Limbs</u>!){
				}
				if(s! <<257>>limbs<<257>>!&nbsp;<u class="dotted" title="In calyces or corollas with fused sepals or petals, the expanded, often lobed portion distal to the tube or throat; in some free or nearly free sepals and petals, the expanded portion distal to the stalk-like base (claw)." >limbs</u>!){
				}
				if(s!<<258>>Linear<<258>>!<u class="dotted" title="Elongate, with nearly parallel sides; narrower than elliptic or oblong." >Linear</u>!){
				}
				if(s! <<258>>linear<<258>>!&nbsp;<div class="dropdown"><u class="dotted">linear</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/linear.jpg" class="large-image" alt="image missing" >Elongate, with nearly parallel sides; narrower than elliptic or oblong.</div></div>!){
				}
				if(s!<<259>>Lip<<259>>!<u class="dotted" title="1. Upper or lower of two parts in a bilateral, unequally divided calyx or corolla.  2. In Orchidaceae, generally the largest, lowest, most highly modified perianth part." >Lip</u>!){
				}
				if(s! <<259>>lip<<259>>!&nbsp;<u class="dotted" title="1. Upper or lower of two parts in a bilateral, unequally divided calyx or corolla.  2. In Orchidaceae, generally the largest, lowest, most highly modified perianth part." >lip</u>!){
				}
				if(s!<<260>>Lips<<260>>!<u class="dotted" title="1. Upper or lower of two parts in a bilateral, unequally divided calyx or corolla.  2. In Orchidaceae, generally the largest, lowest, most highly modified perianth part." >Lips</u>!){
				}
				if(s! <<260>>lips<<260>>!&nbsp;<u class="dotted" title="1. Upper or lower of two parts in a bilateral, unequally divided calyx or corolla.  2. In Orchidaceae, generally the largest, lowest, most highly modified perianth part." >lips</u>!){
				}
				if(s!<<261>>Lobe<<261>>!<u class="dotted" title="1. A major expansion or bulge, such as on the margin of a leaf, sepal, or petal, or on the surface of an ovary.  2. The free tips of otherwise fused structures, such as sepals or petals; larger than teeth." >Lobe</u>!){
				}
				if(s! <<261>>lobe<<261>>!&nbsp;<div class="dropdown"><u class="dotted">lobe</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/lobe.jpg" class="large-image" alt="image missing" >1. A major expansion or bulge, such as on the margin of a leaf, sepal, or petal, or on the surface of an ovary.  2. The free tips of otherwise fused structures, such as sepals or petals; larger than teeth.</div></div>!){
				}
				if(s!<<262>>Lobes<<262>>!<u class="dotted" title="1. A major expansion or bulge, such as on the margin of a leaf, sepal, or petal, or on the surface of an ovary.  2. The free tips of otherwise fused structures, such as sepals or petals; larger than teeth." >Lobes</u>!){
				}
				if(s! <<262>>lobes<<262>>!&nbsp;<div class="dropdown"><u class="dotted">lobes</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/lobe.jpg" class="large-image" alt="image missing" >1. A major expansion or bulge, such as on the margin of a leaf, sepal, or petal, or on the surface of an ovary.  2. The free tips of otherwise fused structures, such as sepals or petals; larger than teeth.</div></div>!){
				}
				if(s!<<263>>Loculicidal<<263>>!<u class="dotted" title="Pertaining to dehiscence of a fruit (capsule) by a longitudinal line through the wall at or near the center of each chamber, such that each resulting segment corresponds to the two adjacent halves of two adjacent chambers, usually with a placenta-bearing septum centrally." >Loculicidal</u>!){
				}
				if(s! <<263>>loculicidal<<263>>!&nbsp;<div class="dropdown"><u class="dotted">loculicidal</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/loculicidal.jpg" class="large-image" alt="image missing" >Pertaining to dehiscence of a fruit (capsule) by a longitudinal line through the wall at or near the center of each chamber, such that each resulting segment corresponds to the two adjacent halves of two adjacent chambers, usually with a placenta-bearing septum centrally.</div></div>!){
				}
				if(s!<<264>>Longitudinal<<264>>!<u class="dotted" title="Pertaining to length or the lengthwise dimension; parallel to the axis." >Longitudinal</u>!){
				}
				if(s! <<264>>longitudinal<<264>>!&nbsp;<u class="dotted" title="Pertaining to length or the lengthwise dimension; parallel to the axis." >longitudinal</u>!){
				}
				if(s!<<265>>Margin<<265>>!<u class="dotted" title="The edge, generally of a leaf or perianth part." >Margin</u>!){
				}
				if(s! <<265>>margin<<265>>!&nbsp;<u class="dotted" title="The edge, generally of a leaf or perianth part." >margin</u>!){
				}
				if(s!<<266>>Margins<<266>>!<u class="dotted" title="The edge, generally of a leaf or perianth part." >Margins</u>!){
				}
				if(s! <<266>>margins<<266>>!&nbsp;<u class="dotted" title="The edge, generally of a leaf or perianth part." >margins</u>!){
				}
				if(s!<<267>>Marsh<<267>>!<u class="dotted" title="Permanently or periodically inundated, mostly or completely treeless vegetation dominated by semi-aquatic herbs or subshrubs." >Marsh</u>!){
				}
				if(s! <<267>>marsh<<267>>!&nbsp;<u class="dotted" title="Permanently or periodically inundated, mostly or completely treeless vegetation dominated by semi-aquatic herbs or subshrubs." >marsh</u>!){
				}
				if(s!<<268>>Marshes<<268>>!<u class="dotted" title="Permanently or periodically inundated, mostly or completely treeless vegetation dominated by semi-aquatic herbs or subshrubs." >Marshes</u>!){
				}
				if(s! <<268>>marshes<<268>>!&nbsp;<u class="dotted" title="Permanently or periodically inundated, mostly or completely treeless vegetation dominated by semi-aquatic herbs or subshrubs." >marshes</u>!){
				}
				if(s!<<269>>Meadow<<269>>!<u class="dotted" title="Open grass- or sedge-dominated vegetation more or less surrounded by woodland or forest; meadow soils are generally seasonally moist and frequently are composed of fine-grained sediments." >Meadow</u>!){
				}
				if(s! <<269>>meadow<<269>>!&nbsp;<u class="dotted" title="Open grass- or sedge-dominated vegetation more or less surrounded by woodland or forest; meadow soils are generally seasonally moist and frequently are composed of fine-grained sediments." >meadow</u>!){
				}
				if(s!<<270>>Meadows<<270>>!<u class="dotted" title="Open grass- or sedge-dominated vegetation more or less surrounded by woodland or forest; meadow soils are generally seasonally moist and frequently are composed of fine-grained sediments." >Meadows</u>!){
				}
				if(s! <<270>>meadows<<270>>!&nbsp;<u class="dotted" title="Open grass- or sedge-dominated vegetation more or less surrounded by woodland or forest; meadow soils are generally seasonally moist and frequently are composed of fine-grained sediments." >meadows</u>!){
				}
				if(s!<<271>>Membranous<<271>>!<u class="dotted" title="Thin, dry or moist, pliable, often more or less translucent or variously colored, sometimes green.  (e.g., Leymus cinereus ligule)" >Membranous</u>!){
				}
				if(s! <<271>>membranous<<271>>!&nbsp;<u class="dotted" title="Thin, dry or moist, pliable, often more or less translucent or variously colored, sometimes green.  (e.g., Leymus cinereus ligule)" >membranous</u>!){
				}
				if(s!<<272>>Mericarp<<272>>!<u class="dotted" title="One of the (generally dry, indehiscent, 1-seeded) parts into which certain fruits (e.g. those of Apiaceae) separate at maturity." >Mericarp</u>!){
				}
				if(s! <<272>>mericarp<<272>>!&nbsp;<u class="dotted" title="One of the (generally dry, indehiscent, 1-seeded) parts into which certain fruits (e.g. those of Apiaceae) separate at maturity." >mericarp</u>!){
				}
				if(s!<<273>>Mixed-evergreen forest<<273>>!<u class="dotted" title="Vegetation dominated by a variable mixture of mostly or only hardwood tree species, most of which retain their leaves throughout the year; dominated by closely spaced +- tall trees." >Mixed-evergreen forest</u>!){
				}
				if(s! <<273>>mixed-evergreen forest<<273>>!&nbsp;<u class="dotted" title="Vegetation dominated by a variable mixture of mostly or only hardwood tree species, most of which retain their leaves throughout the year; dominated by closely spaced +- tall trees." >mixed-evergreen forest</u>!){
				}
				if(s!<<274>>Monoecious<<274>>!<u class="dotted" title="Pertaining to a taxon in which individuals produce both male and female reproductive structures, and do not produce bisexual reproductive structures.  (e.g., Alnus rhombifolia)" >Monoecious</u>!){
				}
				if(s! <<274>>monoecious<<274>>!&nbsp;<u class="dotted" title="Pertaining to a taxon in which individuals produce both male and female reproductive structures, and do not produce bisexual reproductive structures.  (e.g., Alnus rhombifolia)" >monoecious</u>!){
				}
				if(s!<<275>>Monolete spore<<275>>!<u class="dotted" title="In spore-bearing plants, bilaterally symmetric spore on which the scar is linear and unbranched." >Monolete spore</u>!){
				}
				if(s! <<275>>monolete spore<<275>>!&nbsp;<u class="dotted" title="In spore-bearing plants, bilaterally symmetric spore on which the scar is linear and unbranched." >monolete spore</u>!){
				}
				if(s!<<276>>Montane<<276>>!<u class="dotted" title="Pertaining to mountains; vegetational--altitudinal zone between the foothill and subalpine zones." >Montane</u>!){
				}
				if(s! <<276>>montane<<276>>!&nbsp;<u class="dotted" title="Pertaining to mountains; vegetational--altitudinal zone between the foothill and subalpine zones." >montane</u>!){
				}
				if(s!<<277>>Mucro<<277>>!<u class="dotted" title="An abrupt, short, sharp, narrow, terminal point, tip, or projection" >Mucro</u>!){
				}
				if(s! <<277>>mucro<<277>>!&nbsp;<u class="dotted" title="An abrupt, short, sharp, narrow, terminal point, tip, or projection" >mucro</u>!){
				}
				if(s!<<278>>Mucronate<<278>>!<u class="dotted" title="An abrupt, short, sharp, narrow, terminal point, tip, or projection" >Mucronate</u>!){
				}
				if(s! <<278>>mucronate<<278>>!&nbsp;<u class="dotted" title="An abrupt, short, sharp, narrow, terminal point, tip, or projection" >mucronate</u>!){
				}
				if(s!<<279>>Native<<279>>!<u class="dotted" title="Occurring naturally in an area, as neither a direct nor indirect consequence of human activity; indigenous; not alien." >Native</u>!){
				}
				if(s! <<279>>native<<279>>!&nbsp;<u class="dotted" title="Occurring naturally in an area, as neither a direct nor indirect consequence of human activity; indigenous; not alien." >native</u>!){
				}
				if(s!<<280>>Naturalized<<280>>!<u class="dotted" title="Alien (not native) and reproducing either sexually (e.g., by spores, seeds) or vegetatively (e.g., by sprouts, suckers) in the absence of any benefit, intentional or not, direct or indirect, of human activity, and thereby persisting beyond initial generation or establishment." >Naturalized</u>!){
				}
				if(s! <<280>>naturalized<<280>>!&nbsp;<u class="dotted" title="Alien (not native) and reproducing either sexually (e.g., by spores, seeds) or vegetatively (e.g., by sprouts, suckers) in the absence of any benefit, intentional or not, direct or indirect, of human activity, and thereby persisting beyond initial generation or establishment." >naturalized</u>!){
				}
				if(s!<<281>>Nectar<<281>>!<u class="dotted" title="A sugary solution, produced in nectaries, consumed primarily as an energy source by animal visitors, usually pollinators." >Nectar</u>!){
				}
				if(s! <<281>>nectar<<281>>!&nbsp;<u class="dotted" title="A sugary solution, produced in nectaries, consumed primarily as an energy source by animal visitors, usually pollinators." >nectar</u>!){
				}
				if(s!<<282>>Nectary<<282>>!<u class="dotted" title="Variously shaped, nectar-producing structure(s) usually at or near the base of the inside of a flower (or sometimes elsewhere, such as in a perianth spur or on a petiole). (e.g., Symphoricarpos rotundifolius)" >Nectary</u>!){
				}
				if(s! <<282>>nectary<<282>>!&nbsp;<u class="dotted" title="Variously shaped, nectar-producing structure(s) usually at or near the base of the inside of a flower (or sometimes elsewhere, such as in a perianth spur or on a petiole). (e.g., Symphoricarpos rotundifolius)" >nectary</u>!){
				}
				if(s!<<283>>Nectaries<<283>>!<u class="dotted" title="Variously shaped, nectar-producing structure(s) usually at or near the base of the inside of a flower (or sometimes elsewhere, such as in a perianth spur or on a petiole). (e.g., Symphoricarpos rotundifolius)" >Nectaries</u>!){
				}
				if(s! <<283>>nectaries<<283>>!&nbsp;<u class="dotted" title="Variously shaped, nectar-producing structure(s) usually at or near the base of the inside of a flower (or sometimes elsewhere, such as in a perianth spur or on a petiole). (e.g., Symphoricarpos rotundifolius)" >nectaries</u>!){
				}
				if(s!<<284>>Needle<<284>>!<u class="dotted" title="A narrowly linear, often waxy, generally evergreen leaf, especially of conifers." >Needle</u>!){
				}
				if(s! <<284>>needle<<284>>!&nbsp;<div class="dropdown"><u class="dotted">needle</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/needle.jpg" class="large-image" alt="image missing" >A narrowly linear, often waxy, generally evergreen leaf, especially of conifers.</div></div>!){
				}
				if(s!<<285>>Needles<<285>>!<u class="dotted" title="A narrowly linear, often waxy, generally evergreen leaf, especially of conifers." >Needles</u>!){
				}
				if(s! <<285>>needles<<285>>!&nbsp;<div class="dropdown"><u class="dotted">needles</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/needles.jpg" class="large-image" alt="image missing" >A narrowly linear, often waxy, generally evergreen leaf, especially of conifers.</div></div>!){
				}
				if(s!<<286>>Node<<286>>!<u class="dotted" title="Position on a stem from which one or more structures (especially leaves, buds, branches, or flowers) arise." >Node</u>!){
				}
				if(s! <<286>>node<<286>>!&nbsp;<div class="dropdown"><u class="dotted">node</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/node.jpg" class="large-image" alt="image missing" >Position on a stem from which one or more structures (especially leaves, buds, branches, or flowers) arise.</div></div>!){
				}
				if(s!<<287>>Nodes<<287>>!<u class="dotted" title="Position on a stem from which one or more structures (especially leaves, buds, branches, or flowers) arise." >Nodes</u>!){
				}
				if(s! <<287>>nodes<<287>>!&nbsp;<div class="dropdown"><u class="dotted">nodes</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/node.jpg" class="large-image" alt="image missing" >Position on a stem from which one or more structures (especially leaves, buds, branches, or flowers) arise.</div></div>!){
				}
				if(s!<<288>>Nut<<288>>!<u class="dotted" title="Mostly dry, sometimes fleshy or pulpy, usually indehiscent fruit in which a single seed is encased in a hard shell.  (e.g., Quercus palmeri)" >Nut</u>!){
				}
				if(s! <<288>>nut<<288>>!&nbsp;<u class="dotted" title="Mostly dry, sometimes fleshy or pulpy, usually indehiscent fruit in which a single seed is encased in a hard shell.  (e.g., Quercus palmeri)" >nut</u>!){
				}
				if(s!<<289>>Nuts<<289>>!<u class="dotted" title="Mostly dry, sometimes fleshy or pulpy, usually indehiscent fruit in which a single seed is encased in a hard shell.  (e.g., Quercus palmeri)" >Nuts</u>!){
				}
				if(s! <<289>>nuts<<289>>!&nbsp;<u class="dotted" title="Mostly dry, sometimes fleshy or pulpy, usually indehiscent fruit in which a single seed is encased in a hard shell.  (e.g., Quercus palmeri)" >nuts</u>!){
				}
				if(s!<<290>>Nutlet<<290>>!<u class="dotted" title="Small, dry nut or nut-like fruit, usually several of which are produced by a single flower.  (e.g., Boraginaceae, Lamiaceae)" >Nutlet</u>!){
				}
				if(s! <<290>>nutlet<<290>>!&nbsp;<u class="dotted" title="Small, dry nut or nut-like fruit, usually several of which are produced by a single flower.  (e.g., Boraginaceae, Lamiaceae)" >nutlet</u>!){
				}
				if(s!<<291>>Nutlets<<291>>!<u class="dotted" title="Small, dry nut or nut-like fruit, usually several of which are produced by a single flower.  (e.g., Boraginaceae, Lamiaceae)" >Nutlets</u>!){
				}
				if(s! <<291>>nutlets<<291>>!&nbsp;<u class="dotted" title="Small, dry nut or nut-like fruit, usually several of which are produced by a single flower.  (e.g., Boraginaceae, Lamiaceae)" >nutlets</u>!){
				}
				if(s!<<292>>Oblique<<292>>!<u class="dotted" title="Having unequal sides or an asymmetric base." >Oblique</u>!){
				}
				if(s! <<292>>oblique<<292>>!&nbsp;<div class="dropdown"><u class="dotted">oblique</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/oblique.jpg" class="large-image" alt="image missing" >Having unequal sides or an asymmetric base.</div></div>!){
				}
				if(s!<<293>>Oblong<<293>>!<u class="dotted" title="Longer than wide, with nearly parallel sides; wider than linear." >Oblong</u>!){
				}
				if(s! <<293>>oblong<<293>>!&nbsp;<div class="dropdown"><u class="dotted">oblong</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/oblong.jpg" class="large-image" alt="image missing" >Longer than wide, with nearly parallel sides; wider than linear.</div></div>!){
				}
				if(s!<<294>>Obtuse<<294>>!<u class="dotted" title="Having a short-tapered, blunt tip or base, the sides convex or straight and converging at more than a right angle." >Obtuse</u>!){
				}
				if(s! <<294>>obtuse<<294>>!&nbsp;<div class="dropdown"><u class="dotted">obtuse</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/obtuse.jpg" class="large-image" alt="image missing" >Having a short-tapered, blunt tip or base, the sides convex or straight and converging at more than a right angle.</div></div>!){
				}
				if(s!<<295>>Ocrea<<295>>!<u class="dotted" title="A generally scarious sheath around the stem formed by the fusion of stipules." >Ocrea</u>!){
				}
				if(s! <<295>>ocrea<<295>>!&nbsp;<u class="dotted" title="A generally scarious sheath around the stem formed by the fusion of stipules." >ocrea</u>!){
				}
				if(s!<<296>>Ocreae<<296>>!<u class="dotted" title="A generally scarious sheath around the stem formed by the fusion of stipules." >Ocreae</u>!){
				}
				if(s! <<296>>ocreae<<296>>!&nbsp;<u class="dotted" title="A generally scarious sheath around the stem formed by the fusion of stipules." >ocreae</u>!){
				}
				if(s!<<297>>Open<<297>>!<u class="dotted" title="Uncongested or diffuse; especially pertaining to the disposition of flowers in an inflorescence." >Open</u>!){
				}
				if(s! <<297>>open<<297>>!&nbsp;<u class="dotted" title="Uncongested or diffuse; especially pertaining to the disposition of flowers in an inflorescence." >open</u>!){
				}
				if(s!<<298>>Opposite<<298>>!<u class="dotted" title="1.  Arranged in pairs along an axis - e.g., two leaves per node.  2.  Occurring in the same rank, directly above or below, as 'stamens opposite petals'.  3.  Located directly across from." >Opposite</u>!){
				}
				if(s! <<298>>opposite<<298>>!&nbsp;<div class="dropdown"><u class="dotted">opposite</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/opposite.jpg" class="large-image" alt="image missing" >1.  Arranged in pairs along an axis - e.g., two leaves per node.  2.  Occurring in the same rank, directly above or below, as 'stamens opposite petals'.  3.  Located directly across from.</div></div>!){
				}
				if(s!<<299>>Ovary<<299>>!<u class="dotted" title="Ovule-bearing, usually wider, basal portion of pistil, normally developing into a fruit as ovules become seeds; may be simple (one carpel, one chamber) or compound (two or more carpels, one or more chambers)." >Ovary</u>!){
				}
				if(s! <<299>>ovary<<299>>!&nbsp;<u class="dotted" title="Ovule-bearing, usually wider, basal portion of pistil, normally developing into a fruit as ovules become seeds; may be simple (one carpel, one chamber) or compound (two or more carpels, one or more chambers)." >ovary</u>!){
				}
				if(s!<<300>>Ovaries<<300>>!<u class="dotted" title="Ovule-bearing, usually wider, basal portion of pistil, normally developing into a fruit as ovules become seeds; may be simple (one carpel, one chamber) or compound (two or more carpels, one or more chambers)." >Ovaries</u>!){
				}
				if(s! <<300>>ovaries<<300>>!&nbsp;<u class="dotted" title="Ovule-bearing, usually wider, basal portion of pistil, normally developing into a fruit as ovules become seeds; may be simple (one carpel, one chamber) or compound (two or more carpels, one or more chambers)." >ovaries</u>!){
				}
				if(s!<<301>>Ovary stalk<<301>>!<u class="dotted" title="A pedestal-like, apical prolongation of a floral receptacle (often termed elsewhere a carpophore) or basal constriction of an ovary (often termed elsewhere a gynophore), above the level of perianth insertion, each with the result that the ovary or fruit appears to be stalked over and above the pedicel (whereas the demarcation between pedicel and ovary- or fruit-stalk is observable as the point of perianth insertion, carpophores generally are distinguished from gynophores only by anatomical study)." >Ovary stalk</u>!){
				}
				if(s! <<301>>ovary stalk<<301>>!&nbsp;<u class="dotted" title="A pedestal-like, apical prolongation of a floral receptacle (often termed elsewhere a carpophore) or basal constriction of an ovary (often termed elsewhere a gynophore), above the level of perianth insertion, each with the result that the ovary or fruit appears to be stalked over and above the pedicel (whereas the demarcation between pedicel and ovary- or fruit-stalk is observable as the point of perianth insertion, carpophores generally are distinguished from gynophores only by anatomical study)." >ovary stalk</u>!){
				}
				if(s!<<302>>Fruit stalk<<302>>!<u class="dotted" title="A pedestal-like, apical prolongation of a floral receptacle (often termed elsewhere a carpophore) or basal constriction of an ovary (often termed elsewhere a gynophore), above the level of perianth insertion, each with the result that the ovary or fruit appears to be stalked over and above the pedicel (whereas the demarcation between pedicel and ovary- or fruit-stalk is observable as the point of perianth insertion, carpophores generally are distinguished from gynophores only by anatomical study)." >Fruit stalk</u>!){
				}
				if(s! <<302>>fruit stalk<<302>>!&nbsp;<u class="dotted" title="A pedestal-like, apical prolongation of a floral receptacle (often termed elsewhere a carpophore) or basal constriction of an ovary (often termed elsewhere a gynophore), above the level of perianth insertion, each with the result that the ovary or fruit appears to be stalked over and above the pedicel (whereas the demarcation between pedicel and ovary- or fruit-stalk is observable as the point of perianth insertion, carpophores generally are distinguished from gynophores only by anatomical study)." >fruit stalk</u>!){
				}
				if(s!<<303>>Ovate<<303>>!<u class="dotted" title="Egg-shaped (i.e., widest below the middle) in two dimensions (i.e., in one plane), as a leaf." >Ovate</u>!){
				}
				if(s! <<303>>ovate<<303>>!&nbsp;<div class="dropdown"><u class="dotted">ovate</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/ovate.jpg" class="large-image" alt="image missing" >Egg-shaped (i.e., widest below the middle) in two dimensions (i.e., in one plane), as a leaf.</div></div>!){
				}
				if(s!<<304>>Ovoid<<304>>!<u class="dotted" title="Egg-shaped (i.e., widest below the middle) in three dimensions, as a fruit." >Ovoid</u>!){
				}
				if(s! <<304>>ovoid<<304>>!&nbsp;<u class="dotted" title="Egg-shaped (i.e., widest below the middle) in three dimensions, as a fruit." >ovoid</u>!){
				}
				if(s!<<305>>Ovule<<305>>!<u class="dotted" title="In gymnosperms and angiosperms, structure containing an egg, and normally developing into a seed after fertilization." >Ovule</u>!){
				}
				if(s! <<305>>ovule<<305>>!&nbsp;<u class="dotted" title="In gymnosperms and angiosperms, structure containing an egg, and normally developing into a seed after fertilization." >ovule</u>!){
				}
				if(s!<<306>>Ovules<<306>>!<u class="dotted" title="In gymnosperms and angiosperms, structure containing an egg, and normally developing into a seed after fertilization." >Ovules</u>!){
				}
				if(s! <<306>>ovules<<306>>!&nbsp;<u class="dotted" title="In gymnosperms and angiosperms, structure containing an egg, and normally developing into a seed after fertilization." >ovules</u>!){
				}
				if(s!<<307>>Paleate<<307>>!<u class="dotted" title="1. In Asteraceae, a scale-like bract that subtends an individual flower on the receptacle (equal to 'chaff scale' in TJM), absent in some genera, restricted to a ring separating ray and disk flowers in most tarweed species. 2. In Poaceae, the distal, generally smaller of two sheathing bracts subtending a flower, generally two-veined and -keeled and ensheathed by the lemma; with the lemma and flower, comprising the floret." >Paleate</u>!){
				}
				if(s! <<307>>paleate<<307>>!&nbsp;<u class="dotted" title="1. In Asteraceae, a scale-like bract that subtends an individual flower on the receptacle (equal to 'chaff scale' in TJM), absent in some genera, restricted to a ring separating ray and disk flowers in most tarweed species. 2. In Poaceae, the distal, generally smaller of two sheathing bracts subtending a flower, generally two-veined and -keeled and ensheathed by the lemma; with the lemma and flower, comprising the floret." >paleate</u>!){
				}
				if(s!<<308>>Palea<<308>>!<u class="dotted" title="1. In Asteraceae, a scale-like bract that subtends an individual flower on the receptacle (equal to 'chaff scale' in TJM), absent in some genera, restricted to a ring separating ray and disk flowers in most tarweed species. 2. In Poaceae, the distal, generally smaller of two sheathing bracts subtending a flower, generally two-veined and -keeled and ensheathed by the lemma; with the lemma and flower, comprising the floret." >Palea</u>!){
				}
				if(s! <<308>>palea<<308>>!&nbsp;<div class="dropdown"><u class="dotted">palea</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/grass-palea.jpg" class="large-image" alt="image missing" >1. In Asteraceae, a scale-like bract that subtends an individual flower on the receptacle (equal to 'chaff scale' in TJM), absent in some genera, restricted to a ring separating ray and disk flowers in most tarweed species. 2. In Poaceae, the distal, generally smaller of two sheathing bracts subtending a flower, generally two-veined and -keeled and ensheathed by the lemma; with the lemma and flower, comprising the floret.</div></div>!){
				}
				if(s!<<309>>Paleae<<309>>!<u class="dotted" title="1. In Asteraceae, a scale-like bract that subtends an individual flower on the receptacle (equal to 'chaff scale' in TJM), absent in some genera, restricted to a ring separating ray and disk flowers in most tarweed species. 2. In Poaceae, the distal, generally smaller of two sheathing bracts subtending a flower, generally two-veined and -keeled and ensheathed by the lemma; with the lemma and flower, comprising the floret." >Paleae</u>!){
				}
				if(s! <<309>>paleae<<309>>!&nbsp;<u class="dotted" title="1. In Asteraceae, a scale-like bract that subtends an individual flower on the receptacle (equal to 'chaff scale' in TJM), absent in some genera, restricted to a ring separating ray and disk flowers in most tarweed species. 2. In Poaceae, the distal, generally smaller of two sheathing bracts subtending a flower, generally two-veined and -keeled and ensheathed by the lemma; with the lemma and flower, comprising the floret." >paleae</u>!){
				}
				if(s!<<310>>Palmately<<310>>!<u class="dotted" title="More than two structures or parts (e.g., veins, lobes, or leaflets) radiating from a common point in two dimensions (i.e., in one plane)." >Palmately</u>!){
				}
				if(s! <<310>>palmately<<310>>!&nbsp;<u class="dotted" title="More than two structures or parts (e.g., veins, lobes, or leaflets) radiating from a common point in two dimensions (i.e., in one plane)." >palmately</u>!){
				}
				if(s!<<311>>Palmate<<311>>!<u class="dotted" title="More than two structures or parts (e.g., veins, lobes, or leaflets) radiating from a common point in two dimensions (i.e., in one plane)." >Palmate</u>!){
				}
				if(s! <<311>>palmate<<311>>!&nbsp;<div class="dropdown"><u class="dotted">palmate</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/palmate.jpg" class="large-image" alt="image missing" >More than two structures or parts (e.g., veins, lobes, or leaflets) radiating from a common point in two dimensions (i.e., in one plane).</div></div>!){
				}
				if(s!<<312>>Panicle<<312>>!<u class="dotted" title="1. In flowering plants excluding Asteraceae, Cyperaceae, Poaceae, and some other groups, a branched inflorescence in which the basal or lateral flowers (or some of them) open before the terminal or central flowers on any axis. 2. In Asteraceae, Cyperaceae,  Poaceae, and some other groups, a panicle-like inflorescence is one in which at least some of  the inflorescence units (e.g., heads in Asteraceae; spikelets in Cyperaceae and Poaceae),  instead of individual flowers, are attached (stalked or unstalked) to branches and not directly to the main axis of the inflorescence and in which floral development may or may not proceed as in 1." >Panicle</u>!){
				}
				if(s! <<312>>panicle<<312>>!&nbsp;<div class="dropdown"><u class="dotted">panicle</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/panicle.jpg" class="large-image" alt="image missing" >1. In flowering plants excluding Asteraceae, Cyperaceae, Poaceae, and some other groups, a branched inflorescence in which the basal or lateral flowers (or some of them) open before the terminal or central flowers on any axis. 2. In Asteraceae, Cyperaceae,  Poaceae, and some other groups, a panicle-like inflorescence is one in which at least some of  the inflorescence units (e.g., heads in Asteraceae; spikelets in Cyperaceae and Poaceae),  instead of individual flowers, are attached (stalked or unstalked) to branches and not directly to the main axis of the inflorescence and in which floral development may or may not proceed as in 1.</div></div>!){
				}
				if(s!<<313>>Panicles<<313>>!<u class="dotted" title="1. In flowering plants excluding Asteraceae, Cyperaceae, Poaceae, and some other groups, a branched inflorescence in which the basal or lateral flowers (or some of them) open before the terminal or central flowers on any axis. 2. In Asteraceae, Cyperaceae,  Poaceae, and some other groups, a panicle-like inflorescence is one in which at least some of  the inflorescence units (e.g., heads in Asteraceae; spikelets in Cyperaceae and Poaceae),  instead of individual flowers, are attached (stalked or unstalked) to branches and not directly to the main axis of the inflorescence and in which floral development may or may not proceed as in 1." >Panicles</u>!){
				}
				if(s! <<313>>panicles<<313>>!&nbsp;<div class="dropdown"><u class="dotted">panicles</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/panicle.jpg" class="large-image" alt="image missing" >1. In flowering plants excluding Asteraceae, Cyperaceae, Poaceae, and some other groups, a branched inflorescence in which the basal or lateral flowers (or some of them) open before the terminal or central flowers on any axis. 2. In Asteraceae, Cyperaceae,  Poaceae, and some other groups, a panicle-like inflorescence is one in which at least some of  the inflorescence units (e.g., heads in Asteraceae; spikelets in Cyperaceae and Poaceae),  instead of individual flowers, are attached (stalked or unstalked) to branches and not directly to the main axis of the inflorescence and in which floral development may or may not proceed as in 1.</div></div>!){
				}
				if(s!<<314>>Papillate<<314>>!<u class="dotted" title="Pertaining to a surface (e.g., of a leaf, stigma, fruit) bearing small, rounded or conic protuberances (papillae)." >Papillate</u>!){
				}
				if(s! <<314>>papillate<<314>>!&nbsp;<div class="dropdown"><u class="dotted">papillate</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/papillate.jpg" class="large-image" alt="image missing" >Pertaining to a surface (e.g., of a leaf, stigma, fruit) bearing small, rounded or conic protuberances (papillae).</div></div>!){
				}
				if(s!<<315>>Pappus<<315>>!<u class="dotted" title="In Asteraceae, the aggregate of structures such as awns, bristles, or scales arising from the top of the inferior ovary, in place of the calyx." >Pappus</u>!){
				}
				if(s! <<315>>pappus<<315>>!&nbsp;<u class="dotted" title="In Asteraceae, the aggregate of structures such as awns, bristles, or scales arising from the top of the inferior ovary, in place of the calyx." >pappus</u>!){
				}
				if(s!<<316>>Parasite<<316>>!<u class="dotted" title="A plant that benefits by taking resources from a physical connection to a host plant of another species; green parasites (hemiparasites) derive water and dissolved inorganic substances (e.g., mineral nutrients) from the connection and often are able to survive without it, while non-green parasites (holoparasites) obtain in addition energy-rich, organic compounds (products of photosynthesis) from the connection and cannot survive without it; the connection may or may not involve a fungal intermediate, and may or may not be detrimental to the host." >Parasite</u>!){
				}
				if(s! <<316>>parasite<<316>>!&nbsp;<u class="dotted" title="A plant that benefits by taking resources from a physical connection to a host plant of another species; green parasites (hemiparasites) derive water and dissolved inorganic substances (e.g., mineral nutrients) from the connection and often are able to survive without it, while non-green parasites (holoparasites) obtain in addition energy-rich, organic compounds (products of photosynthesis) from the connection and cannot survive without it; the connection may or may not involve a fungal intermediate, and may or may not be detrimental to the host." >parasite</u>!){
				}
				if(s!<<317>>Parasites<<317>>!<u class="dotted" title="A plant that benefits by taking resources from a physical connection to a host plant of another species; green parasites (hemiparasites) derive water and dissolved inorganic substances (e.g., mineral nutrients) from the connection and often are able to survive without it, while non-green parasites (holoparasites) obtain in addition energy-rich, organic compounds (products of photosynthesis) from the connection and cannot survive without it; the connection may or may not involve a fungal intermediate, and may or may not be detrimental to the host." >Parasites</u>!){
				}
				if(s! <<317>>parasites<<317>>!&nbsp;<u class="dotted" title="A plant that benefits by taking resources from a physical connection to a host plant of another species; green parasites (hemiparasites) derive water and dissolved inorganic substances (e.g., mineral nutrients) from the connection and often are able to survive without it, while non-green parasites (holoparasites) obtain in addition energy-rich, organic compounds (products of photosynthesis) from the connection and cannot survive without it; the connection may or may not involve a fungal intermediate, and may or may not be detrimental to the host." >parasites</u>!){
				}
				if(s!<<318>>Parietal<<318>>!<u class="dotted" title="Pertaining to placentas on the inside surface of the ovary wall in a compound ovary with one or more chambers." >Parietal</u>!){
				}
				if(s! <<318>>parietal<<318>>!&nbsp;<div class="dropdown"><u class="dotted">parietal</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/parietal-placentas.jpg" class="large-image" alt="image missing" >Pertaining to placentas on the inside surface of the ovary wall in a compound ovary with one or more chambers.</div></div>!){
				}
				if(s!<<319>>Parietally<<319>>!<u class="dotted" title="Pertaining to placentas on the inside surface of the ovary wall in a compound ovary with one or more chambers." >Parietally</u>!){
				}
				if(s! <<319>>parietally<<319>>!&nbsp;<u class="dotted" title="Pertaining to placentas on the inside surface of the ovary wall in a compound ovary with one or more chambers." >parietally</u>!){
				}
				if(s!<<320>>Peat<<320>>!<u class="dotted" title="Material formed by the partial decomposition in water of plant tissues, especially mosses (Sphagnum) or sedges." >Peat</u>!){
				}
				if(s! <<320>>peat<<320>>!&nbsp;<u class="dotted" title="Material formed by the partial decomposition in water of plant tissues, especially mosses (Sphagnum) or sedges." >peat</u>!){
				}
				if(s!<<321>>Peatland<<321>>!<u class="dotted" title="Moss- or herb-dominated freshwater wetland characterized by nutrient-deficient substrates and the accumulation of peat; often said (elsewhere, not in TJM2) to be bogs if acidic, fens if basic." >Peatland</u>!){
				}
				if(s! <<321>>peatland<<321>>!&nbsp;<u class="dotted" title="Moss- or herb-dominated freshwater wetland characterized by nutrient-deficient substrates and the accumulation of peat; often said (elsewhere, not in TJM2) to be bogs if acidic, fens if basic." >peatland</u>!){
				}
				if(s!<<322>>Peatlands<<322>>!<u class="dotted" title="Moss- or herb-dominated freshwater wetland characterized by nutrient-deficient substrates and the accumulation of peat; often said (elsewhere, not in TJM2) to be bogs if acidic, fens if basic." >Peatlands</u>!){
				}
				if(s! <<322>>peatlands<<322>>!&nbsp;<u class="dotted" title="Moss- or herb-dominated freshwater wetland characterized by nutrient-deficient substrates and the accumulation of peat; often said (elsewhere, not in TJM2) to be bogs if acidic, fens if basic." >peatlands</u>!){
				}
				if(s!<<323>>Pedicel<<323>>!<u class="dotted" title="Stalk of an individual flower in an inflorescence, or the corresponding   structure in fruit." >Pedicel</u>!){
				}
				if(s! <<323>>pedicel<<323>>!&nbsp;<div class="dropdown"><u class="dotted">pedicel</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/pedicel.jpg" class="large-image" alt="image missing" >Stalk of an individual flower in an inflorescence, or the corresponding   structure in fruit.</div></div>!){
				}
				if(s!<<324>>Pedicels<<324>>!<u class="dotted" title="Stalk of an individual flower in an inflorescence, or the corresponding   structure in fruit." >Pedicels</u>!){
				}
				if(s! <<324>>pedicels<<324>>!&nbsp;<div class="dropdown"><u class="dotted">pedicels</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/pedicel.jpg" class="large-image" alt="image missing" >Stalk of an individual flower in an inflorescence, or the corresponding   structure in fruit.</div></div>!){
				}
				if(s!<<325>>Peduncle<<325>>!<u class="dotted" title="Stalk of an individual flower borne singly, not in an inflorescence, or of an entire inflorescence, or the corresponding structure in fruit; the stalk subtending an involucre (e.g., in Asteraceae, Polygonaceae)." >Peduncle</u>!){
				}
				if(s! <<325>>peduncle<<325>>!&nbsp;<div class="dropdown"><u class="dotted">peduncle</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/peduncle.jpg" class="large-image" alt="image missing" >Stalk of an individual flower borne singly, not in an inflorescence, or of an entire inflorescence, or the corresponding structure in fruit; the stalk subtending an involucre (e.g., in Asteraceae, Polygonaceae).</div></div>!){
				}
				if(s!<<326>>Peduncles<<326>>!<u class="dotted" title="Stalk of an individual flower borne singly, not in an inflorescence, or of an entire inflorescence, or the corresponding structure in fruit; the stalk subtending an involucre (e.g., in Asteraceae, Polygonaceae)." >Peduncles</u>!){
				}
				if(s! <<326>>peduncles<<326>>!&nbsp;<div class="dropdown"><u class="dotted">peduncles</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/peduncle.jpg" class="large-image" alt="image missing" >Stalk of an individual flower borne singly, not in an inflorescence, or of an entire inflorescence, or the corresponding structure in fruit; the stalk subtending an involucre (e.g., in Asteraceae, Polygonaceae).</div></div>!){
				}
				if(s!<<327>>Peltate<<327>>!<u class="dotted" title="With the stalk attached toward the middle, not at a margin, of a flat structure such as an indusium, scale, or leaf." >Peltate</u>!){
				}
				if(s! <<327>>peltate<<327>>!&nbsp;<div class="dropdown"><u class="dotted">peltate</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/peltate.jpg" class="large-image" alt="image missing" >With the stalk attached toward the middle, not at a margin, of a flat structure such as an indusium, scale, or leaf.</div></div>!){
				}
				if(s!<<328>>Pendent<<328>>!<u class="dotted" title="Drooping, hanging, or suspended from a point of attachment above.  (e.g., Amelanchier utahensis fruit)" >Pendent</u>!){
				}
				if(s! <<328>>pendent<<328>>!&nbsp;<u class="dotted" title="Drooping, hanging, or suspended from a point of attachment above.  (e.g., Amelanchier utahensis fruit)" >pendent</u>!){
				}
				if(s!<<329>>Perennial<<329>>!<u class="dotted" title="Completing life cycle (germination through death) in more than two years or growing seasons, generally non-woody (at least above ground) to woody; includes perennial herbs as well as subshrubs to trees; the abbreviation 'per' only refers to perennial herb, not to the word 'perennial' alone." >Perennial</u>!){
				}
				if(s! <<329>>perennial<<329>>!&nbsp;<div class="dropdown"><u class="dotted">perennial</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/perennial_root.jpg" class="large-image" alt="image missing" >Completing life cycle (germination through death) in more than two years or growing seasons, generally non-woody (at least above ground) to woody; includes perennial herbs as well as subshrubs to trees; the abbreviation 'per' only refers to perennial herb, not to the word 'perennial' alone.</div></div>!){
				}
				if(s!<<330>>Perianth<<330>>!<u class="dotted" title="Calyx and corolla collectively, whether or not they are distinguishable." >Perianth</u>!){
				}
				if(s! <<330>>perianth<<330>>!&nbsp;<u class="dotted" title="Calyx and corolla collectively, whether or not they are distinguishable." >perianth</u>!){
				}
				if(s!<<331>>Perianths<<331>>!<u class="dotted" title="Calyx and corolla collectively, whether or not they are distinguishable." >Perianths</u>!){
				}
				if(s! <<331>>perianths<<331>>!&nbsp;<u class="dotted" title="Calyx and corolla collectively, whether or not they are distinguishable." >perianths</u>!){
				}
				if(s!<<332>>Perianth part<<332>>!<u class="dotted" title="An individual member of a perianth; used whether or not calyx and corolla are distinguishable, but usually when they are not." >Perianth part</u>!){
				}
				if(s! <<332>>perianth part<<332>>!&nbsp;<u class="dotted" title="An individual member of a perianth; used whether or not calyx and corolla are distinguishable, but usually when they are not." >perianth part</u>!){
				}
				if(s!<<333>>Perigynium<<333>>!<u class="dotted" title="Variously shaped, sac-like structure enclosing the ovary and achene in Carex and Kobresia." >Perigynium</u>!){
				}
				if(s! <<333>>perigynium<<333>>!&nbsp;<div class="dropdown"><u class="dotted">perigynium</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/perigynium.jpg" class="large-image" alt="image missing" >Variously shaped, sac-like structure enclosing the ovary and achene in Carex and Kobresia.</div></div>!){
				}
				if(s!<<334>>Persistent<<334>>!<u class="dotted" title="Not falling off; remaining attached." >Persistent</u>!){
				}
				if(s! <<334>>persistent<<334>>!&nbsp;<u class="dotted" title="Not falling off; remaining attached." >persistent</u>!){
				}
				if(s!<<335>>Petal<<335>>!<u class="dotted" title="Individual member of the corolla, whether fused or not; if fused, often equal in number to the number of corolla lobes; often conspicuously colored." >Petal</u>!){
				}
				if(s! <<335>>petal<<335>>!&nbsp;<u class="dotted" title="Individual member of the corolla, whether fused or not; if fused, often equal in number to the number of corolla lobes; often conspicuously colored." >petal</u>!){
				}
				if(s!<<336>>Petals<<336>>!<u class="dotted" title="Individual member of the corolla, whether fused or not; if fused, often equal in number to the number of corolla lobes; often conspicuously colored." >Petals</u>!){
				}
				if(s! <<336>>petals<<336>>!&nbsp;<u class="dotted" title="Individual member of the corolla, whether fused or not; if fused, often equal in number to the number of corolla lobes; often conspicuously colored." >petals</u>!){
				}
				if(s!<<337>>Petiole<<337>>!<u class="dotted" title="Leaf stalk, connecting leaf blade to stem; sometimes more or less indistinct." >Petiole</u>!){
				}
				if(s! <<337>>petiole<<337>>!&nbsp;<div class="dropdown"><u class="dotted">petiole</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/petioled.jpg" class="large-image" alt="image missing" >Leaf stalk, connecting leaf blade to stem; sometimes more or less indistinct.</div></div>!){
				}
				if(s!<<338>>Petioles<<338>>!<u class="dotted" title="Leaf stalk, connecting leaf blade to stem; sometimes more or less indistinct." >Petioles</u>!){
				}
				if(s! <<338>>petioles<<338>>!&nbsp;<div class="dropdown"><u class="dotted">petioles</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/petioled.jpg" class="large-image" alt="image missing" >Leaf stalk, connecting leaf blade to stem; sometimes more or less indistinct.</div></div>!){
				}
				if(s!<<339>>Phyllary<<339>>!<u class="dotted" title="In Asteraceae, a bract of the involucre." >Phyllary</u>!){
				}
				if(s! <<339>>phyllary<<339>>!&nbsp;<u class="dotted" title="In Asteraceae, a bract of the involucre." >phyllary</u>!){
				}
				if(s!<<340>>Phyllaries<<340>>!<u class="dotted" title="In Asteraceae, a bract of the involucre." >Phyllaries</u>!){
				}
				if(s! <<340>>phyllaries<<340>>!&nbsp;<u class="dotted" title="In Asteraceae, a bract of the involucre." >phyllaries</u>!){
				}
				if(s!<<341>>Pinna<<341>>!<u class="dotted" title="In ferns, primary division of a compound or dissected frond blade." >Pinna</u>!){
				}
				if(s! <<341>>pinna<<341>>!&nbsp;<div class="dropdown"><u class="dotted">pinna</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/fern-leaf-pinna.jpg" class="large-image" alt="image missing" >In ferns, primary division of a compound or dissected frond blade.</div></div>!){
				}
				if(s!<<342>>Pinnae<<342>>!<u class="dotted" title="In ferns, primary division of a compound or dissected frond blade." >Pinnae</u>!){
				}
				if(s! <<342>>pinnae<<342>>!&nbsp;<u class="dotted" title="In ferns, primary division of a compound or dissected frond blade." >pinnae</u>!){
				}
				if(s!<<343>>Pinnate<<343>>!<u class="dotted" title="Feather-like; pertaining to veins, lobes, leaflets, or other structures arranged in two dimensions (i.e., in one plane) along either side of an axis; a leaf is odd-pinnate if there is a terminal leaflet, even-pinnate if there is not, and either odd- or even-pinnate may be 1-pinnate (blade divided into primary leaflets), 2-pinnate (primary leaflets divided into secondary leaflets), 3-pinnate (secondary leaflets divided into tertiary leaflets), etc." >Pinnate</u>!){
				}
				if(s! <<343>>pinnate<<343>>!&nbsp;<div class="dropdown"><u class="dotted">pinnate</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/odd-pinnate.jpg" class="large-image" alt="image missing" >Feather-like; pertaining to veins, lobes, leaflets, or other structures arranged in two dimensions (i.e., in one plane) along either side of an axis; a leaf is odd-pinnate if there is a terminal leaflet, even-pinnate if there is not, and either odd- or even-pinnate may be 1-pinnate (blade divided into primary leaflets), 2-pinnate (primary leaflets divided into secondary leaflets), 3-pinnate (secondary leaflets divided into tertiary leaflets), etc.</div></div>!){
				}
				if(s!<<344>>Pinnately<<344>>!<u class="dotted" title="Feather-like; pertaining to veins, lobes, leaflets, or other structures arranged in two dimensions (i.e., in one plane) along either side of an axis; a leaf is odd-pinnate if there is a terminal leaflet, even-pinnate if there is not, and either odd- or even-pinnate may be 1-pinnate (blade divided into primary leaflets), 2-pinnate (primary leaflets divided into secondary leaflets), 3-pinnate (secondary leaflets divided into tertiary leaflets), etc." >Pinnately</u>!){
				}
				if(s! <<344>>pinnately<<344>>!&nbsp;<u class="dotted" title="Feather-like; pertaining to veins, lobes, leaflets, or other structures arranged in two dimensions (i.e., in one plane) along either side of an axis; a leaf is odd-pinnate if there is a terminal leaflet, even-pinnate if there is not, and either odd- or even-pinnate may be 1-pinnate (blade divided into primary leaflets), 2-pinnate (primary leaflets divided into secondary leaflets), 3-pinnate (secondary leaflets divided into tertiary leaflets), etc." >pinnately</u>!){
				}
				if(s!<<345>>Pinnule<<345>>!<u class="dotted" title="In ferns, secondary division of a compound or dissected frond blade, primary division of a pinna." >Pinnule</u>!){
				}
				if(s! <<345>>pinnule<<345>>!&nbsp;<div class="dropdown"><u class="dotted">pinnule</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/fern-leaf-pinnule.jpg" class="large-image" alt="image missing" >In ferns, secondary division of a compound or dissected frond blade, primary division of a pinna.</div></div>!){
				}
				if(s!<<346>>Pinnules<<346>>!<u class="dotted" title="In ferns, secondary division of a compound or dissected frond blade, primary division of a pinna." >Pinnules</u>!){
				}
				if(s! <<346>>pinnules<<346>>!&nbsp;<u class="dotted" title="In ferns, secondary division of a compound or dissected frond blade, primary division of a pinna." >pinnules</u>!){
				}
				if(s!<<347>>Pinnulet<<347>>!<u class="dotted" title="In ferns, tertiary division of a compound or dissected frond blade, secondary division of a pinna, primary division of a pinnule." >Pinnulet</u>!){
				}
				if(s! <<347>>pinnulet<<347>>!&nbsp;<u class="dotted" title="In ferns, tertiary division of a compound or dissected frond blade, secondary division of a pinna, primary division of a pinnule." >pinnulet</u>!){
				}
				if(s!<<348>>Pistil<<348>>!<u class="dotted" title="Female reproductive structure of a flower, composed of an ovule-containing ovary at the base, one or more pollen-receiving stigmas at the tip, and generally one or more styles between ovary and stigma.  A flower may have one or more simple pistils (each a single, free carpel with a single ovary chamber, placenta, and stigma) or one compound pistil (two or more fused or partially fused carpels, the exact number often equaling the number of ovary lobes, ovary chambers, placentas, styles, or stigmas)." >Pistil</u>!){
				}
				if(s! <<348>>pistil<<348>>!&nbsp;<u class="dotted" title="Female reproductive structure of a flower, composed of an ovule-containing ovary at the base, one or more pollen-receiving stigmas at the tip, and generally one or more styles between ovary and stigma.  A flower may have one or more simple pistils (each a single, free carpel with a single ovary chamber, placenta, and stigma) or one compound pistil (two or more fused or partially fused carpels, the exact number often equaling the number of ovary lobes, ovary chambers, placentas, styles, or stigmas)." >pistil</u>!){
				}
				if(s!<<349>>Pistils<<349>>!<u class="dotted" title="Female reproductive structure of a flower, composed of an ovule-containing ovary at the base, one or more pollen-receiving stigmas at the tip, and generally one or more styles between ovary and stigma.  A flower may have one or more simple pistils (each a single, free carpel with a single ovary chamber, placenta, and stigma) or one compound pistil (two or more fused or partially fused carpels, the exact number often equaling the number of ovary lobes, ovary chambers, placentas, styles, or stigmas)." >Pistils</u>!){
				}
				if(s! <<349>>pistils<<349>>!&nbsp;<u class="dotted" title="Female reproductive structure of a flower, composed of an ovule-containing ovary at the base, one or more pollen-receiving stigmas at the tip, and generally one or more styles between ovary and stigma.  A flower may have one or more simple pistils (each a single, free carpel with a single ovary chamber, placenta, and stigma) or one compound pistil (two or more fused or partially fused carpels, the exact number often equaling the number of ovary lobes, ovary chambers, placentas, styles, or stigmas)." >pistils</u>!){
				}
				if(s!<<350>>Pistillate<<350>>!<u class="dotted" title="Pertaining to flowers, inflorescences, or plants with fertile pistils but sterile or missing stamens.  (e.g., Salix laevigata flower)" >Pistillate</u>!){
				}
				if(s! <<350>>pistillate<<350>>!&nbsp;<u class="dotted" title="Pertaining to flowers, inflorescences, or plants with fertile pistils but sterile or missing stamens.  (e.g., Salix laevigata flower)" >pistillate</u>!){
				}
				if(s!<<351>>Placenta<<351>>!<u class="dotted" title="Structure or area to which ovules are attached in an ovary; variously shaped and positioned." >Placenta</u>!){
				}
				if(s! <<351>>placenta<<351>>!&nbsp;<u class="dotted" title="Structure or area to which ovules are attached in an ovary; variously shaped and positioned." >placenta</u>!){
				}
				if(s!<<352>>Placentas<<352>>!<u class="dotted" title="Structure or area to which ovules are attached in an ovary; variously shaped and positioned." >Placentas</u>!){
				}
				if(s! <<352>>placentas<<352>>!&nbsp;<div class="dropdown"><u class="dotted">placentas</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/parietal-placentas.jpg" class="large-image" alt="image missing" >Structure or area to which ovules are attached in an ovary; variously shaped and positioned.</div></div>!){
				}
				if(s!<<353>>Planoconvex<<353>>!<u class="dotted" title="Flat or nearly so on one side, rounded on the other.  (e.g., Carex leporinella perigynium)" >Planoconvex</u>!){
				}
				if(s! <<353>>planoconvex<<353>>!&nbsp;<u class="dotted" title="Flat or nearly so on one side, rounded on the other.  (e.g., Carex leporinella perigynium)" >planoconvex</u>!){
				}
				if(s!<<354>>Pleated<<354>>!<u class="dotted" title="Having accordion-like folds." >Pleated</u>!){
				}
				if(s! <<354>>pleated<<354>>!&nbsp;<u class="dotted" title="Having accordion-like folds." >pleated</u>!){
				}
				if(s!<<355>>Plumose<<355>>!<u class="dotted" title="Plume-like, usually with the parts arrayed in three dimensions around an axis, or in tufts held together at the base; usually pertaining to small, finely divided structures, such as certain stigmas and pappus elements." >Plumose</u>!){
				}
				if(s! <<355>>plumose<<355>>!&nbsp;<div class="dropdown"><u class="dotted">plumose</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/plumose.jpg" class="large-image" alt="image missing" >Plume-like, usually with the parts arrayed in three dimensions around an axis, or in tufts held together at the base; usually pertaining to small, finely divided structures, such as certain stigmas and pappus elements.</div></div>!){
				}
				if(s!<<356>>Pollen<<356>>!<u class="dotted" title="In gymnosperms and angiosperms, structure containing the sperm; when sperm fertilizes an egg, the egg and surrounding ovule normally develop into a seed." >Pollen</u>!){
				}
				if(s! <<356>>pollen<<356>>!&nbsp;<u class="dotted" title="In gymnosperms and angiosperms, structure containing the sperm; when sperm fertilizes an egg, the egg and surrounding ovule normally develop into a seed." >pollen</u>!){
				}
				if(s!<<357>>Pollination<<357>>!<u class="dotted" title="Placement of pollen, by an insect, the wind, or other vector, on a stigmatic or ovular surface, through which pollen tube growth and fertilization may occur; self-pollination involves only one plant, cross-pollination occurs between plants." >Pollination</u>!){
				}
				if(s! <<357>>pollination<<357>>!&nbsp;<u class="dotted" title="Placement of pollen, by an insect, the wind, or other vector, on a stigmatic or ovular surface, through which pollen tube growth and fertilization may occur; self-pollination involves only one plant, cross-pollination occurs between plants." >pollination</u>!){
				}
				if(s!<<358>>Pollinium<<358>>!<u class="dotted" title="Especially in Asclepias and related genera, and in Orchidaceae, a mass of coherent pollen grains disseminated as a unit." >Pollinium</u>!){
				}
				if(s! <<358>>pollinium<<358>>!&nbsp;<u class="dotted" title="Especially in Asclepias and related genera, and in Orchidaceae, a mass of coherent pollen grains disseminated as a unit." >pollinium</u>!){
				}
				if(s!<<359>>Pollinia<<359>>!<u class="dotted" title="Especially in Asclepias and related genera, and in Orchidaceae, a mass of coherent pollen grains disseminated as a unit." >Pollinia</u>!){
				}
				if(s! <<359>>pollinia<<359>>!&nbsp;<u class="dotted" title="Especially in Asclepias and related genera, and in Orchidaceae, a mass of coherent pollen grains disseminated as a unit." >pollinia</u>!){
				}
				if(s!<<360>>Polyploid<<360>>!<u class="dotted" title="Having three or more sets of chromosomes; 3n, 4n, etc." >Polyploid</u>!){
				}
				if(s! <<360>>polyploid<<360>>!&nbsp;<u class="dotted" title="Having three or more sets of chromosomes; 3n, 4n, etc." >polyploid</u>!){
				}
				if(s!<<361>>Pome<<361>>!<u class="dotted" title="In Rosaceae, a fleshy, indehiscent fruit, such as an apple or pear; derived from a compound, inferior ovary (represented as 2-5 papery-walled, radiating segments alternating with fleshy material) and surrounding hypanthium (represented as outer fleshy material and skin).  (e.g., Amelanchier utahensis fruit)" >Pome</u>!){
				}
				if(s! <<361>>pome<<361>>!&nbsp;<u class="dotted" title="In Rosaceae, a fleshy, indehiscent fruit, such as an apple or pear; derived from a compound, inferior ovary (represented as 2-5 papery-walled, radiating segments alternating with fleshy material) and surrounding hypanthium (represented as outer fleshy material and skin).  (e.g., Amelanchier utahensis fruit)" >pome</u>!){
				}
				if(s!<<362>>Prickle<<362>>!<u class="dotted" title="Sharp-pointed, stiff or somewhat flexible projection, originating at the epidermis, derived from epidermal cells and therefore neither subtending an axillary bud or branch nor subtended by a leaf or leaf scar, without leaves, leaf scars, buds, or branches; loosely used for any sharp projection. (e.g., Rosa woodsii stem)" >Prickle</u>!){
				}
				if(s! <<362>>prickle<<362>>!&nbsp;<u class="dotted" title="Sharp-pointed, stiff or somewhat flexible projection, originating at the epidermis, derived from epidermal cells and therefore neither subtending an axillary bud or branch nor subtended by a leaf or leaf scar, without leaves, leaf scars, buds, or branches; loosely used for any sharp projection. (e.g., Rosa woodsii stem)" >prickle</u>!){
				}
				if(s!<<363>>Prickles<<363>>!<u class="dotted" title="Sharp-pointed, stiff or somewhat flexible projection, originating at the epidermis, derived from epidermal cells and therefore neither subtending an axillary bud or branch nor subtended by a leaf or leaf scar, without leaves, leaf scars, buds, or branches; loosely used for any sharp projection. (e.g., Rosa woodsii stem)" >Prickles</u>!){
				}
				if(s! <<363>>prickles<<363>>!&nbsp;<u class="dotted" title="Sharp-pointed, stiff or somewhat flexible projection, originating at the epidermis, derived from epidermal cells and therefore neither subtending an axillary bud or branch nor subtended by a leaf or leaf scar, without leaves, leaf scars, buds, or branches; loosely used for any sharp projection. (e.g., Rosa woodsii stem)" >prickles</u>!){
				}
				if(s!<<364>>Prostrate<<364>>!<u class="dotted" title="Lying flat on the ground." >Prostrate</u>!){
				}
				if(s! <<364>>prostrate<<364>>!&nbsp;<div class="dropdown"><u class="dotted">prostrate</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/prostrate.jpg" class="large-image" alt="image missing" >Lying flat on the ground.</div></div>!){
				}
				if(s!<<365>>Protandrous<<365>>!<u class="dotted" title="Pertaining to a bisexual flower in which pollen release precedes stigma receptivity, or to a plant with staminate and pistillate flowers in which this is true, with the result that cross-pollination is favored." >Protandrous</u>!){
				}
				if(s! <<365>>protandrous<<365>>!&nbsp;<u class="dotted" title="Pertaining to a bisexual flower in which pollen release precedes stigma receptivity, or to a plant with staminate and pistillate flowers in which this is true, with the result that cross-pollination is favored." >protandrous</u>!){
				}
				if(s!<<366>>Protogynous<<366>>!<u class="dotted" title="Pertaining to a bisexual flower in which stigma receptivity precedes pollen release, or to a plant with staminate and pistillate flowers in which this is true, with the result that cross-pollination is favored." >Protogynous</u>!){
				}
				if(s! <<366>>protogynous<<366>>!&nbsp;<u class="dotted" title="Pertaining to a bisexual flower in which stigma receptivity precedes pollen release, or to a plant with staminate and pistillate flowers in which this is true, with the result that cross-pollination is favored." >protogynous</u>!){
				}
				if(s!<<367>>Proximal<<367>>!<u class="dotted" title="Closer to the base, origin, or point of attachment, or farther away from the edge or tip." >Proximal</u>!){
				}
				if(s! <<367>>proximal<<367>>!&nbsp;<u class="dotted" title="Closer to the base, origin, or point of attachment, or farther away from the edge or tip." >proximal</u>!){
				}
				if(s!<<368>>Proximally<<368>>!<u class="dotted" title="Closer to the base, origin, or point of attachment, or farther away from the edge or tip." >Proximally</u>!){
				}
				if(s! <<368>>proximally<<368>>!&nbsp;<u class="dotted" title="Closer to the base, origin, or point of attachment, or farther away from the edge or tip." >proximally</u>!){
				}
				if(s!<<369>>Puberulent<<369>>!<u class="dotted" title="Minutely hairy." >Puberulent</u>!){
				}
				if(s! <<369>>puberulent<<369>>!&nbsp;<div class="dropdown"><u class="dotted">puberulent</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/puberulent.jpg" class="large-image" alt="image missing" >Minutely hairy.</div></div>!){
				}
				if(s!<<370>>Raceme<<370>>!<u class="dotted" title="In flowering plants excluding Asteraceae, Cyperaceae, Poaceae, and some other groups, an unbranched inflorescence in which the flowers are borne on pedicels and nearly always open from the bottom to the top of the inflorescence. 2. In Asteraceae, Cyperaceae,  Poaceae, and some other groups, a raceme-like inflorescence is one in which the inflorescence units (e.g., heads in Asteraceae; spikelets in Cyperaceae and Poaceae), instead of individual flowers, are stalked and attached directly to the main axis of the inflorescence, not to branches, and in which floral development may or may not proceed as in 1." >Raceme</u>!){
				}
				if(s! <<370>>raceme<<370>>!&nbsp;<div class="dropdown"><u class="dotted">raceme</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/raceme.jpg" class="large-image" alt="image missing" >In flowering plants excluding Asteraceae, Cyperaceae, Poaceae, and some other groups, an unbranched inflorescence in which the flowers are borne on pedicels and nearly always open from the bottom to the top of the inflorescence. 2. In Asteraceae, Cyperaceae,  Poaceae, and some other groups, a raceme-like inflorescence is one in which the inflorescence units (e.g., heads in Asteraceae; spikelets in Cyperaceae and Poaceae), instead of individual flowers, are stalked and attached directly to the main axis of the inflorescence, not to branches, and in which floral development may or may not proceed as in 1.</div></div>!){
				}
				if(s!<<371>>Racemes<<371>>!<u class="dotted" title="In flowering plants excluding Asteraceae, Cyperaceae, Poaceae, and some other groups, an unbranched inflorescence in which the flowers are borne on pedicels and nearly always open from the bottom to the top of the inflorescence. 2. In Asteraceae, Cyperaceae,  Poaceae, and some other groups, a raceme-like inflorescence is one in which the inflorescence units (e.g., heads in Asteraceae; spikelets in Cyperaceae and Poaceae), instead of individual flowers, are stalked and attached directly to the main axis of the inflorescence, not to branches, and in which floral development may or may not proceed as in 1." >Racemes</u>!){
				}
				if(s! <<371>>racemes<<371>>!&nbsp;<u class="dotted" title="In flowering plants excluding Asteraceae, Cyperaceae, Poaceae, and some other groups, an unbranched inflorescence in which the flowers are borne on pedicels and nearly always open from the bottom to the top of the inflorescence. 2. In Asteraceae, Cyperaceae,  Poaceae, and some other groups, a raceme-like inflorescence is one in which the inflorescence units (e.g., heads in Asteraceae; spikelets in Cyperaceae and Poaceae), instead of individual flowers, are stalked and attached directly to the main axis of the inflorescence, not to branches, and in which floral development may or may not proceed as in 1." >racemes</u>!){
				}
				if(s!<<372>>Rachis<<372>>!<u class="dotted" title="In ferns, primary axis of a compound or dissected frond blade." >Rachis</u>!){
				}
				if(s! <<372>>rachis<<372>>!&nbsp;<div class="dropdown"><u class="dotted">rachis</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/fern-leaf-rachis.jpg" class="large-image" alt="image missing" >In ferns, primary axis of a compound or dissected frond blade.</div></div>!){
				}
				if(s!<<373>>Rachides<<373>>!<u class="dotted" title="In ferns, primary axis of a compound or dissected frond blade." >Rachides</u>!){
				}
				if(s! <<373>>rachides<<373>>!&nbsp;<u class="dotted" title="In ferns, primary axis of a compound or dissected frond blade." >rachides</u>!){
				}
				if(s!<<374>>Radial<<374>>!<u class="dotted" title="Divisible into mirror-image halves in three or more ways." >Radial</u>!){
				}
				if(s! <<374>>radial<<374>>!&nbsp;<div class="dropdown"><u class="dotted">radial</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/radial.jpg" class="large-image" alt="image missing" >Divisible into mirror-image halves in three or more ways.</div></div>!){
				}
				if(s!<<375>>Radiant<<375>>!<u class="dotted" title="In Asteraceae, a discoid head with a peripheral ring of flowers having much enlarged, often bilateral corollas." >Radiant</u>!){
				}
				if(s! <<375>>radiant<<375>>!&nbsp;<u class="dotted" title="In Asteraceae, a discoid head with a peripheral ring of flowers having much enlarged, often bilateral corollas." >radiant</u>!){
				}
				if(s!<<376>>Radiate<<376>>!<u class="dotted" title="In Asteraceae, a head composed of central disk flowers and marginal ray flowers." >Radiate</u>!){
				}
				if(s! <<376>>radiate<<376>>!&nbsp;<u class="dotted" title="In Asteraceae, a head composed of central disk flowers and marginal ray flowers." >radiate</u>!){
				}
				if(s!<<377>>Rank<<377>>!<u class="dotted" title="1. A row or column of parts along an axis - e.g., leaves on an erect stem arranged in four vertical rows are 4-ranked.  2. In classification, a taxonomic level - e.g., family, genus, species, subspecies, variety." >Rank</u>!){
				}
				if(s! <<377>>rank<<377>>!&nbsp;<u class="dotted" title="1. A row or column of parts along an axis - e.g., leaves on an erect stem arranged in four vertical rows are 4-ranked.  2. In classification, a taxonomic level - e.g., family, genus, species, subspecies, variety." >rank</u>!){
				}
				if(s!<<378>>Ranks<<378>>!<u class="dotted" title="1. A row or column of parts along an axis - e.g., leaves on an erect stem arranged in four vertical rows are 4-ranked.  2. In classification, a taxonomic level - e.g., family, genus, species, subspecies, variety." >Ranks</u>!){
				}
				if(s! <<378>>ranks<<378>>!&nbsp;<u class="dotted" title="1. A row or column of parts along an axis - e.g., leaves on an erect stem arranged in four vertical rows are 4-ranked.  2. In classification, a taxonomic level - e.g., family, genus, species, subspecies, variety." >ranks</u>!){
				}
				if(s!<<379>>Ranked<<379>>!<u class="dotted" title="1. A row or column of parts along an axis - e.g., leaves on an erect stem arranged in four vertical rows are 4-ranked.  2. In classification, a taxonomic level - e.g., family, genus, species, subspecies, variety." >Ranked</u>!){
				}
				if(s! <<379>>ranked<<379>>!&nbsp;<u class="dotted" title="1. A row or column of parts along an axis - e.g., leaves on an erect stem arranged in four vertical rows are 4-ranked.  2. In classification, a taxonomic level - e.g., family, genus, species, subspecies, variety." >ranked</u>!){
				}
				if(s!<<380>>Rare<<380>>!<u class="dotted" title="Extremely unlikely to be present in appropriate habitats, often restricted to a small number of sites." >Rare</u>!){
				}
				if(s! <<380>>rare<<380>>!&nbsp;<u class="dotted" title="Extremely unlikely to be present in appropriate habitats, often restricted to a small number of sites." >rare</u>!){
				}
				if(s!<<381>>Rays<<381>>!<u class="dotted" title="Each of a number of radiating axes, as a primary branch in a compound umbel." >Rays</u>!){
				}
				if(s! <<381>>rays<<381>>!&nbsp;<u class="dotted" title="Each of a number of radiating axes, as a primary branch in a compound umbel." >rays</u>!){
				}
				if(s!<<382>>Rayed<<382>>!<u class="dotted" title="Having a number of radiating axes, as in the branches of a compound umbel." >Rayed</u>!){
				}
				if(s! <<382>>rayed<<382>>!&nbsp;<u class="dotted" title="Having a number of radiating axes, as in the branches of a compound umbel." >rayed</u>!){
				}
				if(s!<<383>>Ray flower<<383>>!<u class="dotted" title="In Asteraceae, a generally pistillate or sterile, bilateral flower with a flat, strap- or fan-shaped, often 3-lobed outer portion of the corolla (lamina); appearing in a ring around a central cluster of disk flowers." >Ray flower</u>!){
				}
				if(s! <<383>>ray flower<<383>>!&nbsp;<u class="dotted" title="In Asteraceae, a generally pistillate or sterile, bilateral flower with a flat, strap- or fan-shaped, often 3-lobed outer portion of the corolla (lamina); appearing in a ring around a central cluster of disk flowers." >ray flower</u>!){
				}
				if(s!<<384>>Receptacle<<384>>!<u class="dotted" title="1. In individual flowers, the structure to which flower parts are attached.  2. In heads or head-like inflorescences, especially in Asteraceae, the structure to which flowers or sometimes heads are attached." >Receptacle</u>!){
				}
				if(s! <<384>>receptacle<<384>>!&nbsp;<u class="dotted" title="1. In individual flowers, the structure to which flower parts are attached.  2. In heads or head-like inflorescences, especially in Asteraceae, the structure to which flowers or sometimes heads are attached." >receptacle</u>!){
				}
				if(s!<<385>>Receptacles<<385>>!<u class="dotted" title="1. In individual flowers, the structure to which flower parts are attached.  2. In heads or head-like inflorescences, especially in Asteraceae, the structure to which flowers or sometimes heads are attached." >Receptacles</u>!){
				}
				if(s! <<385>>receptacles<<385>>!&nbsp;<u class="dotted" title="1. In individual flowers, the structure to which flower parts are attached.  2. In heads or head-like inflorescences, especially in Asteraceae, the structure to which flowers or sometimes heads are attached." >receptacles</u>!){
				}
				if(s!<<386>>Recurved<<386>>!<u class="dotted" title="Gradually curved downward or backward." >Recurved</u>!){
				}
				if(s! <<386>>recurved<<386>>!&nbsp;<div class="dropdown"><u class="dotted">recurved</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/recurved.jpg" class="large-image" alt="image missing" >Gradually curved downward or backward.</div></div>!){
				}
				if(s!<<387>>Reduced<<387>>!<u class="dotted" title="Smaller, less lobed, simpler, etc." >Reduced</u>!){
				}
				if(s! <<387>>reduced<<387>>!&nbsp;<u class="dotted" title="Smaller, less lobed, simpler, etc." >reduced</u>!){
				}
				if(s!<<388>>Reflexed<<388>>!<u class="dotted" title="Abruptly bent or curved downward or backward." >Reflexed</u>!){
				}
				if(s! <<388>>reflexed<<388>>!&nbsp;<div class="dropdown"><u class="dotted">reflexed</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/reflexed.jpg" class="large-image" alt="image missing" >Abruptly bent or curved downward or backward.</div></div>!){
				}
				if(s!<<389>>Reniform<<389>>!<u class="dotted" title="Kidney-shaped; often pertaining to a leaf in which the blade base on both sides of the petiole is rounded and concave." >Reniform</u>!){
				}
				if(s! <<389>>reniform<<389>>!&nbsp;<div class="dropdown"><u class="dotted">reniform</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/reniform.jpg" class="large-image" alt="image missing" >Kidney-shaped; often pertaining to a leaf in which the blade base on both sides of the petiole is rounded and concave.</div></div>!){
				}
				if(s!<<390>>Rhizome<<390>>!<u class="dotted" title="1. In seed plants, stem that is often elongate, more or less horizontal, usually underground; distinguished from roots by bearing of leaves, leaf scars, axillary buds, etc. 2. In ferns, stem that is located underground, embedded in leaf litter, on rocks or in rock crevices, or on trees or tree branches, often scaly or hairy; distinguished from roots by bearing of fronds (roots rarely bear fronds), and their greater diameter." >Rhizome</u>!){
				}
				if(s! <<390>>rhizome<<390>>!&nbsp;<div class="dropdown"><u class="dotted">rhizome</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/rhizome.jpg" class="large-image" alt="image missing" >1. In seed plants, stem that is often elongate, more or less horizontal, usually underground; distinguished from roots by bearing of leaves, leaf scars, axillary buds, etc. 2. In ferns, stem that is located underground, embedded in leaf litter, on rocks or in rock crevices, or on trees or tree branches, often scaly or hairy; distinguished from roots by bearing of fronds (roots rarely bear fronds), and their greater diameter.</div></div>!){
				}
				if(s!<<391>>Rhizomes<<391>>!<u class="dotted" title="1. In seed plants, stem that is often elongate, more or less horizontal, usually underground; distinguished from roots by bearing of leaves, leaf scars, axillary buds, etc. 2. In ferns, stem that is located underground, embedded in leaf litter, on rocks or in rock crevices, or on trees or tree branches, often scaly or hairy; distinguished from roots by bearing of fronds (roots rarely bear fronds), and their greater diameter." >Rhizomes</u>!){
				}
				if(s! <<391>>rhizomes<<391>>!&nbsp;<u class="dotted" title="1. In seed plants, stem that is often elongate, more or less horizontal, usually underground; distinguished from roots by bearing of leaves, leaf scars, axillary buds, etc. 2. In ferns, stem that is located underground, embedded in leaf litter, on rocks or in rock crevices, or on trees or tree branches, often scaly or hairy; distinguished from roots by bearing of fronds (roots rarely bear fronds), and their greater diameter." >rhizomes</u>!){
				}
				if(s!<<392>>Rib<<392>>!<u class="dotted" title="1. Ridge, as on a fruit.  2. Raised vein, as on a leaf or perianth part.  (e.g., Carex hendersonii perigynium)" >Rib</u>!){
				}
				if(s! <<392>>rib<<392>>!&nbsp;<u class="dotted" title="1. Ridge, as on a fruit.  2. Raised vein, as on a leaf or perianth part.  (e.g., Carex hendersonii perigynium)" >rib</u>!){
				}
				if(s!<<393>>Ribs<<393>>!<u class="dotted" title="1. Ridge, as on a fruit.  2. Raised vein, as on a leaf or perianth part.  (e.g., Carex hendersonii perigynium)" >Ribs</u>!){
				}
				if(s! <<393>>ribs<<393>>!&nbsp;<u class="dotted" title="1. Ridge, as on a fruit.  2. Raised vein, as on a leaf or perianth part.  (e.g., Carex hendersonii perigynium)" >ribs</u>!){
				}
				if(s!<<394>>Ribbed<<394>>!<u class="dotted" title="1. Having ridges, as on a fruit.  2. Having raised veins, as on a leaf or perianth part.  (e.g., Carex hendersonii perigynium)" >Ribbed</u>!){
				}
				if(s! <<394>>ribbed<<394>>!&nbsp;<u class="dotted" title="1. Having ridges, as on a fruit.  2. Having raised veins, as on a leaf or perianth part.  (e.g., Carex hendersonii perigynium)" >ribbed</u>!){
				}
				if(s!<<395>>Riparian<<395>>!<u class="dotted" title="Pertaining to communities that occupy the banks, channels, and flood plains of waterways." >Riparian</u>!){
				}
				if(s! <<395>>riparian<<395>>!&nbsp;<u class="dotted" title="Pertaining to communities that occupy the banks, channels, and flood plains of waterways." >riparian</u>!){
				}
				if(s!<<396>>Root<<396>>!<u class="dotted" title="Generally underground axis or axes of a plant; distinguished from stems by not bearing leaves, leaf scars, axillary buds,  flowers, etc.; generally growing into the ground from the base of a stem, its functions include anchorage, absorption of water and nutrients, and food storage." >Root</u>!){
				}
				if(s! <<396>>root<<396>>!&nbsp;<u class="dotted" title="Generally underground axis or axes of a plant; distinguished from stems by not bearing leaves, leaf scars, axillary buds,  flowers, etc.; generally growing into the ground from the base of a stem, its functions include anchorage, absorption of water and nutrients, and food storage." >root</u>!){
				}
				if(s!<<397>>Roots<<397>>!<u class="dotted" title="Generally underground axis or axes of a plant; distinguished from stems by not bearing leaves, leaf scars, axillary buds,  flowers, etc.; generally growing into the ground from the base of a stem, its functions include anchorage, absorption of water and nutrients, and food storage." >Roots</u>!){
				}
				if(s! <<397>>roots<<397>>!&nbsp;<u class="dotted" title="Generally underground axis or axes of a plant; distinguished from stems by not bearing leaves, leaf scars, axillary buds,  flowers, etc.; generally growing into the ground from the base of a stem, its functions include anchorage, absorption of water and nutrients, and food storage." >roots</u>!){
				}
				if(s!<<398>>Rosette<<398>>!<u class="dotted" title="A radiating cluster of leaves generally at or near ground level." >Rosette</u>!){
				}
				if(s! <<398>>rosette<<398>>!&nbsp;<div class="dropdown"><u class="dotted">rosette</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/basal-rosette.jpg" class="large-image" alt="image missing" >A radiating cluster of leaves generally at or near ground level.</div></div>!){
				}
				if(s!<<399>>Rosettes<<399>>!<u class="dotted" title="A radiating cluster of leaves generally at or near ground level." >Rosettes</u>!){
				}
				if(s! <<399>>rosettes<<399>>!&nbsp;<div class="dropdown"><u class="dotted">rosettes</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/basal-rosette.jpg" class="large-image" alt="image missing" >A radiating cluster of leaves generally at or near ground level.</div></div>!){
				}
				if(s!<<400>>Rotate<<400>>!<u class="dotted" title="Wheel-shaped, spreading, or saucer-shaped; often applied to  a fused corolla with a short or nonexistent tube and a spreading limb." >Rotate</u>!){
				}
				if(s! <<400>>rotate<<400>>!&nbsp;<div class="dropdown"><u class="dotted">rotate</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/rotate.jpg" class="large-image" alt="image missing" >Wheel-shaped, spreading, or saucer-shaped; often applied to  a fused corolla with a short or nonexistent tube and a spreading limb.</div></div>!){
				}
				if(s!<<401>>Ruderal<<401>>!<u class="dotted" title="A plant, usually alien, occurring in waste areas, along roadsides, and in other places disturbed by humans; pertaining to such a plant." >Ruderal</u>!){
				}
				if(s! <<401>>ruderal<<401>>!&nbsp;<u class="dotted" title="A plant, usually alien, occurring in waste areas, along roadsides, and in other places disturbed by humans; pertaining to such a plant." >ruderal</u>!){
				}
				if(s!<<402>>Sagittate<<402>>!<u class="dotted" title="Arrowhead-shaped, with two basal lobes oriented nearly parallel to the long axis." >Sagittate</u>!){
				}
				if(s! <<402>>sagittate<<402>>!&nbsp;<div class="dropdown"><u class="dotted">sagittate</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/sagittate.jpg" class="large-image" alt="image missing" >Arrowhead-shaped, with two basal lobes oriented nearly parallel to the long axis.</div></div>!){
				}
				if(s!<<403>>Salverform<<403>>!<u class="dotted" title="Having a slender tube and an abruptly spreading, flat limb; often applied to a fused corolla." >Salverform</u>!){
				}
				if(s! <<403>>salverform<<403>>!&nbsp;<div class="dropdown"><u class="dotted">salverform</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/salverform.jpg" class="large-image" alt="image missing" >Having a slender tube and an abruptly spreading, flat limb; often applied to a fused corolla.</div></div>!){
				}
				if(s!<<404>>Savanna<<404>>!<u class="dotted" title="Vegetation dominated by various species of grasses with scattered individual trees; with less canopy cover than a woodland (canopies do not touch)." >Savanna</u>!){
				}
				if(s! <<404>>savanna<<404>>!&nbsp;<u class="dotted" title="Vegetation dominated by various species of grasses with scattered individual trees; with less canopy cover than a woodland (canopies do not touch)." >savanna</u>!){
				}
				if(s!<<405>>Scabrous<<405>>!<u class="dotted" title="Rough to the touch, generally owing to short stiff hairs.  (e.g., Brickellia pappus)" >Scabrous</u>!){
				}
				if(s! <<405>>scabrous<<405>>!&nbsp;<u class="dotted" title="Rough to the touch, generally owing to short stiff hairs.  (e.g., Brickellia pappus)" >scabrous</u>!){
				}
				if(s!<<406>>Scale<<406>>!<u class="dotted" title="1. Wide, appressed, membranous, epidermal outgrowth (e.g., Cheilanthes covillei) 2. Structure partially or entirely covering an over-wintering bud (bud scale) (e.g., Salix goodingii bud).  3. In gymnosperms, a woody, seed-bearing structure attached to the cone axis (cone scale) (e.g., Abies magnifica).  4. In Asteraceae, a flat, membranous pappus element (e.g., Hymenoxys hoopesii).  Leaves or bracts may be scale-like in one or more of the preceding ways." >Scale</u>!){
				}
				if(s! <<406>>scale<<406>>!&nbsp;<div class="dropdown"><u class="dotted">scale</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/scale-like.jpg" class="large-image" alt="image missing" >1. Wide, appressed, membranous, epidermal outgrowth (e.g., Cheilanthes covillei) 2. Structure partially or entirely covering an over-wintering bud (bud scale) (e.g., Salix goodingii bud).  3. In gymnosperms, a woody, seed-bearing structure attached to the cone axis (cone scale) (e.g., Abies magnifica).  4. In Asteraceae, a flat, membranous pappus element (e.g., Hymenoxys hoopesii).  Leaves or bracts may be scale-like in one or more of the preceding ways.</div></div>!){
				}
				if(s!<<407>>Scales<<407>>!<u class="dotted" title="1. Wide, appressed, membranous, epidermal outgrowth (e.g., Cheilanthes covillei) 2. Structure partially or entirely covering an over-wintering bud (bud scale) (e.g., Salix goodingii bud).  3. In gymnosperms, a woody, seed-bearing structure attached to the cone axis (cone scale) (e.g., Abies magnifica).  4. In Asteraceae, a flat, membranous pappus element (e.g., Hymenoxys hoopesii).  Leaves or bracts may be scale-like in one or more of the preceding ways." >Scales</u>!){
				}
				if(s! <<407>>scales<<407>>!&nbsp;<u class="dotted" title="1. Wide, appressed, membranous, epidermal outgrowth (e.g., Cheilanthes covillei) 2. Structure partially or entirely covering an over-wintering bud (bud scale) (e.g., Salix goodingii bud).  3. In gymnosperms, a woody, seed-bearing structure attached to the cone axis (cone scale) (e.g., Abies magnifica).  4. In Asteraceae, a flat, membranous pappus element (e.g., Hymenoxys hoopesii).  Leaves or bracts may be scale-like in one or more of the preceding ways." >scales</u>!){
				}
				if(s!<<408>>Scapose<<408>>!<u class="dotted" title="Pertaining to a plant or an inflorescence in which a relatively long peduncle (scape) arises, sometimes with leaf- or scale-like bracts but without true foliage leaves,  from a rosette or other arrangement of leaves at ground level." >Scapose</u>!){
				}
				if(s! <<408>>scapose<<408>>!&nbsp;<div class="dropdown"><u class="dotted">scapose</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/scapose.jpg" class="large-image" alt="image missing" >Pertaining to a plant or an inflorescence in which a relatively long peduncle (scape) arises, sometimes with leaf- or scale-like bracts but without true foliage leaves,  from a rosette or other arrangement of leaves at ground level.</div></div>!){
				}
				if(s!<<409>>Scar<<409>>!<u class="dotted" title="Mark left by the natural separation of two structures, as a leaf scar on a stem." >Scar</u>!){
				}
				if(s! <<409>>scar<<409>>!&nbsp;<div class="dropdown"><u class="dotted">scar</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/leaf-scar.jpg" class="large-image" alt="image missing" >Mark left by the natural separation of two structures, as a leaf scar on a stem.</div></div>!){
				}
				if(s!<<410>>Scars<<410>>!<u class="dotted" title="Mark left by the natural separation of two structures, as a leaf scar on a stem." >Scars</u>!){
				}
				if(s! <<410>>scars<<410>>!&nbsp;<div class="dropdown"><u class="dotted">scars</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/buds-and-scars.jpg" class="large-image" alt="image missing" >Mark left by the natural separation of two structures, as a leaf scar on a stem.</div></div>!){
				}
				if(s!<<411>>Scarious<<411>>!<u class="dotted" title="Thin, dry, pliable, translucent or variously colored but not green.  (e.g., Carex incurviformis pistillate flower bract)" >Scarious</u>!){
				}
				if(s! <<411>>scarious<<411>>!&nbsp;<u class="dotted" title="Thin, dry, pliable, translucent or variously colored but not green.  (e.g., Carex incurviformis pistillate flower bract)" >scarious</u>!){
				}
				if(s!<<412>>Scree<<412>>!<u class="dotted" title="Relatively unstable, sloping accumulation of small rock fragments, often at a cliff base." >Scree</u>!){
				}
				if(s! <<412>>scree<<412>>!&nbsp;<u class="dotted" title="Relatively unstable, sloping accumulation of small rock fragments, often at a cliff base." >scree</u>!){
				}
				if(s!<<413>>Scrub<<413>>!<u class="dotted" title="Vegetation dominated by shrubs; may be classified by habitat type or by dominant species; shrubland." >Scrub</u>!){
				}
				if(s! <<413>>scrub<<413>>!&nbsp;<u class="dotted" title="Vegetation dominated by shrubs; may be classified by habitat type or by dominant species; shrubland." >scrub</u>!){
				}
				if(s!<<414>>Sculpture<<414>>!<u class="dotted" title="Surface ornamentation or topography, often visible only when magnified, as on a seed or pollen grain.  (e.g., Plagiobothrys nothofulvus nutlet)" >Sculpture</u>!){
				}
				if(s! <<414>>sculpture<<414>>!&nbsp;<u class="dotted" title="Surface ornamentation or topography, often visible only when magnified, as on a seed or pollen grain.  (e.g., Plagiobothrys nothofulvus nutlet)" >sculpture</u>!){
				}
				if(s!<<415>>Seed<<415>>!<u class="dotted" title="Any fertilized ovule, but in descriptions pertaining to the fully mature condition (i.e., at full cone or fruit maturation), unless noted otherwise." >Seed</u>!){
				}
				if(s! <<415>>seed<<415>>!&nbsp;<u class="dotted" title="Any fertilized ovule, but in descriptions pertaining to the fully mature condition (i.e., at full cone or fruit maturation), unless noted otherwise." >seed</u>!){
				}
				if(s!<<416>>Seeds<<416>>!<u class="dotted" title="Any fertilized ovule, but in descriptions pertaining to the fully mature condition (i.e., at full cone or fruit maturation), unless noted otherwise." >Seeds</u>!){
				}
				if(s! <<416>>seeds<<416>>!&nbsp;<u class="dotted" title="Any fertilized ovule, but in descriptions pertaining to the fully mature condition (i.e., at full cone or fruit maturation), unless noted otherwise." >seeds</u>!){
				}
				if(s!<<417>>Segment<<417>>!<u class="dotted" title="1.  An ultimate or smallest division of a compound leaf (then the segment is also a leaflet) or dissected leaf  - not a marginal lobe, tooth, bristle, etc.  2.  A part into which an organ is naturally or apparently divisible, such as of a calyx, corolla, fruit, etc.  3.  A specified length, such as of a stem, root, style, etc." >Segment</u>!){
				}
				if(s! <<417>>segment<<417>>!&nbsp;<u class="dotted" title="1.  An ultimate or smallest division of a compound leaf (then the segment is also a leaflet) or dissected leaf  - not a marginal lobe, tooth, bristle, etc.  2.  A part into which an organ is naturally or apparently divisible, such as of a calyx, corolla, fruit, etc.  3.  A specified length, such as of a stem, root, style, etc." >segment</u>!){
				}
				if(s!<<418>>Segments<<418>>!<u class="dotted" title="1.  An ultimate or smallest division of a compound leaf (then the segment is also a leaflet) or dissected leaf  - not a marginal lobe, tooth, bristle, etc.  2.  A part into which an organ is naturally or apparently divisible, such as of a calyx, corolla, fruit, etc.  3.  A specified length, such as of a stem, root, style, etc." >Segments</u>!){
				}
				if(s! <<418>>segments<<418>>!&nbsp;<u class="dotted" title="1.  An ultimate or smallest division of a compound leaf (then the segment is also a leaflet) or dissected leaf  - not a marginal lobe, tooth, bristle, etc.  2.  A part into which an organ is naturally or apparently divisible, such as of a calyx, corolla, fruit, etc.  3.  A specified length, such as of a stem, root, style, etc." >segments</u>!){
				}
				if(s!<<419>>Sepal<<419>>!<u class="dotted" title="Individual member of the calyx, whether fused or not; if fused, often equal in number to the number of calyx lobes; generally green." >Sepal</u>!){
				}
				if(s! <<419>>sepal<<419>>!&nbsp;<u class="dotted" title="Individual member of the calyx, whether fused or not; if fused, often equal in number to the number of calyx lobes; generally green." >sepal</u>!){
				}
				if(s!<<420>>Sepals<<420>>!<u class="dotted" title="Individual member of the calyx, whether fused or not; if fused, often equal in number to the number of calyx lobes; generally green." >Sepals</u>!){
				}
				if(s! <<420>>sepals<<420>>!&nbsp;<u class="dotted" title="Individual member of the calyx, whether fused or not; if fused, often equal in number to the number of calyx lobes; generally green." >sepals</u>!){
				}
				if(s!<<421>>Septicidal<<421>>!<u class="dotted" title="Pertaining to dehiscence of a fruit (capsule) by a longitudinal line through the wall at or near the center of each septum, such that each resulting segment corresponds to a single chamber, with placentas placed variously." >Septicidal</u>!){
				}
				if(s! <<421>>septicidal<<421>>!&nbsp;<div class="dropdown"><u class="dotted">septicidal</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/septicidal.jpg" class="large-image" alt="image missing" >Pertaining to dehiscence of a fruit (capsule) by a longitudinal line through the wall at or near the center of each septum, such that each resulting segment corresponds to a single chamber, with placentas placed variously.</div></div>!){
				}
				if(s!<<422>>Septum<<422>>!<u class="dotted" title="Wall between chambers in a compound ovary." >Septum</u>!){
				}
				if(s! <<422>>septum<<422>>!&nbsp;<u class="dotted" title="Wall between chambers in a compound ovary." >septum</u>!){
				}
				if(s!<<423>>Septa<<423>>!<u class="dotted" title="Wall between chambers in a compound ovary." >Septa</u>!){
				}
				if(s! <<423>>septa<<423>>!&nbsp;<u class="dotted" title="Wall between chambers in a compound ovary." >septa</u>!){
				}
				if(s!<<424>>Series<<424>>!<u class="dotted" title="A group of structures of one kind (e.g., involucral bracts, sepals, petals, stamens) of similar size or shape, usually more or less in a row or whorl." >Series</u>!){
				}
				if(s! <<424>>series<<424>>!&nbsp;<u class="dotted" title="A group of structures of one kind (e.g., involucral bracts, sepals, petals, stamens) of similar size or shape, usually more or less in a row or whorl." >series</u>!){
				}
				if(s!<<425>>Serpentine<<425>>!<u class="dotted" title="Pertaining to rocks, or soils derived from them, with generally low levels of calcium and other nutrients, and high levels of magnesium, iron, and certain toxic metals; many plant taxa are restricted to or excluded from serpentine." >Serpentine</u>!){
				}
				if(s! <<425>>serpentine<<425>>!&nbsp;<u class="dotted" title="Pertaining to rocks, or soils derived from them, with generally low levels of calcium and other nutrients, and high levels of magnesium, iron, and certain toxic metals; many plant taxa are restricted to or excluded from serpentine." >serpentine</u>!){
				}
				if(s!<<426>>Serpentinitic<<426>>!<u class="dotted" title="Pertaining to rocks, or soils derived from them, with generally low levels of calcium and other nutrients, and high levels of magnesium, iron, and certain toxic metals; many plant taxa are restricted to or excluded from serpentine." >Serpentinitic</u>!){
				}
				if(s! <<426>>serpentinitic<<426>>!&nbsp;<u class="dotted" title="Pertaining to rocks, or soils derived from them, with generally low levels of calcium and other nutrients, and high levels of magnesium, iron, and certain toxic metals; many plant taxa are restricted to or excluded from serpentine." >serpentinitic</u>!){
				}
				if(s!<<427>>Serrate<<427>>!<u class="dotted" title="Having margins with sharp, fine to coarse teeth generally pointing tipward, not outward; margins with such teeth on such primary teeth are doubly serrate." >Serrate</u>!){
				}
				if(s! <<427>>serrate<<427>>!&nbsp;<div class="dropdown"><u class="dotted">serrate</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/serrate.jpg" class="large-image" alt="image missing" >Having margins with sharp, fine to coarse teeth generally pointing tipward, not outward; margins with such teeth on such primary teeth are doubly serrate.</div></div>!){
				}
				if(s!<<428>>Sessile<<428>>!<u class="dotted" title="Without a petiole, peduncle, pedicel, or other kind of stalk." >Sessile</u>!){
				}
				if(s! <<428>>sessile<<428>>!&nbsp;<div class="dropdown"><u class="dotted">sessile</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/sessile.jpg" class="large-image" alt="image missing" >Without a petiole, peduncle, pedicel, or other kind of stalk.</div></div>!){
				}
				if(s!<<429>>Sheath<<429>>!<u class="dotted" title="A surrounding or partially surrounding, often tubular structure or part of a structure, such as a leaf base in Apiaceae or Poaceae." >Sheath</u>!){
				}
				if(s! <<429>>sheath<<429>>!&nbsp;<div class="dropdown"><u class="dotted">sheath</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/grass-leaf-sheath.jpg" class="large-image" alt="image missing" >A surrounding or partially surrounding, often tubular structure or part of a structure, such as a leaf base in Apiaceae or Poaceae.</div></div>!){
				}
				if(s!<<430>>Sheaths<<430>>!<u class="dotted" title="A surrounding or partially surrounding, often tubular structure or part of a structure, such as a leaf base in Apiaceae or Poaceae." >Sheaths</u>!){
				}
				if(s! <<430>>sheaths<<430>>!&nbsp;<u class="dotted" title="A surrounding or partially surrounding, often tubular structure or part of a structure, such as a leaf base in Apiaceae or Poaceae." >sheaths</u>!){
				}
				if(s!<<431>>Shoot<<431>>!<u class="dotted" title="Pertaining collectively to a young stem or twig and its appendages (e.g., new growth in the spring), or to all above-ground parts of a plant (i.e., shoot system)." >Shoot</u>!){
				}
				if(s! <<431>>shoot<<431>>!&nbsp;<u class="dotted" title="Pertaining collectively to a young stem or twig and its appendages (e.g., new growth in the spring), or to all above-ground parts of a plant (i.e., shoot system)." >shoot</u>!){
				}
				if(s!<<432>>Shoots<<432>>!<u class="dotted" title="Pertaining collectively to a young stem or twig and its appendages (e.g., new growth in the spring), or to all above-ground parts of a plant (i.e., shoot system)." >Shoots</u>!){
				}
				if(s! <<432>>shoots<<432>>!&nbsp;<u class="dotted" title="Pertaining collectively to a young stem or twig and its appendages (e.g., new growth in the spring), or to all above-ground parts of a plant (i.e., shoot system)." >shoots</u>!){
				}
				if(s!<<433>>Shrub<<433>>!<u class="dotted" title="A woody plant of relatively short maximum height,  with generally many branches from the base." >Shrub</u>!){
				}
				if(s! <<433>>shrub<<433>>!&nbsp;<u class="dotted" title="A woody plant of relatively short maximum height,  with generally many branches from the base." >shrub</u>!){
				}
				if(s!<<434>>Shrubs<<434>>!<u class="dotted" title="A woody plant of relatively short maximum height,  with generally many branches from the base." >Shrubs</u>!){
				}
				if(s! <<434>>shrubs<<434>>!&nbsp;<u class="dotted" title="A woody plant of relatively short maximum height,  with generally many branches from the base." >shrubs</u>!){
				}
				if(s!<<435>>Simple<<435>>!<u class="dotted" title="Composed of a single part; undivided; unbranched." >Simple</u>!){
				}
				if(s! <<435>>simple<<435>>!&nbsp;<div class="dropdown"><u class="dotted">simple</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/simple-leaf.jpg" class="large-image" alt="image missing" >Composed of a single part; undivided; unbranched.</div></div>!){
				}
				if(s!<<436>>Sinus<<436>>!<u class="dotted" title="Usually pertaining to margins of leaves, sepals, petals, or other parts, an indentation between adjacent lobes or teeth" >Sinus</u>!){
				}
				if(s! <<436>>sinus<<436>>!&nbsp;<div class="dropdown"><u class="dotted">sinus</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/sinus.jpg" class="large-image" alt="image missing" >Usually pertaining to margins of leaves, sepals, petals, or other parts, an indentation between adjacent lobes or teeth</div></div>!){
				}
				if(s!<<437>>Sorus<<437>>!<u class="dotted" title="In many ferns, a distinct cluster of sporangia." >Sorus</u>!){
				}
				if(s! <<437>>sorus<<437>>!&nbsp;<div class="dropdown"><u class="dotted">sorus</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/sorus.jpg" class="large-image" alt="image missing" >In many ferns, a distinct cluster of sporangia.</div></div>!){
				}
				if(s!<<438>>Sori<<438>>!<u class="dotted" title="In many ferns, a distinct cluster of sporangia." >Sori</u>!){
				}
				if(s! <<438>>sori<<438>>!&nbsp;<u class="dotted" title="In many ferns, a distinct cluster of sporangia." >sori</u>!){
				}
				if(s!<<439>>Spheric<<439>>!<u class="dotted" title="Globe- or ball-shaped; circular in three dimensions." >Spheric</u>!){
				}
				if(s! <<439>>spheric<<439>>!&nbsp;<u class="dotted" title="Globe- or ball-shaped; circular in three dimensions." >spheric</u>!){
				}
				if(s!<<440>>Spike<<440>>!<u class="dotted" title="1. In flowering plants excluding Asteraceae, Cyperaceae, Poaceae, and some other groups, an unbranched inflorescence in which the flowers are sessile and nearly always open from the bottom to the top of the inflorescence. 2. In Asteraceae, Cyperaceae,  Poaceae, and some other groups, a spike-like inflorescence is one in which the inflorescence units (e.g., heads in Asteraceae; spikelets in Cyperaceae and Poaceae), instead of individual flowers, are sessile and attached directly to the main axis of the inflorescence, not to branches, and in which floral development may or may not proceed as in 1." >Spike</u>!){
				}
				if(s! <<440>>spike<<440>>!&nbsp;<div class="dropdown"><u class="dotted">spike</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/spike.jpg" class="large-image" alt="image missing" >1. In flowering plants excluding Asteraceae, Cyperaceae, Poaceae, and some other groups, an unbranched inflorescence in which the flowers are sessile and nearly always open from the bottom to the top of the inflorescence. 2. In Asteraceae, Cyperaceae,  Poaceae, and some other groups, a spike-like inflorescence is one in which the inflorescence units (e.g., heads in Asteraceae; spikelets in Cyperaceae and Poaceae), instead of individual flowers, are sessile and attached directly to the main axis of the inflorescence, not to branches, and in which floral development may or may not proceed as in 1.</div></div>!){
				}
				if(s!<<441>>Spikes<<441>>!<u class="dotted" title="1. In flowering plants excluding Asteraceae, Cyperaceae, Poaceae, and some other groups, an unbranched inflorescence in which the flowers are sessile and nearly always open from the bottom to the top of the inflorescence. 2. In Asteraceae, Cyperaceae,  Poaceae, and some other groups, a spike-like inflorescence is one in which the inflorescence units (e.g., heads in Asteraceae; spikelets in Cyperaceae and Poaceae), instead of individual flowers, are sessile and attached directly to the main axis of the inflorescence, not to branches, and in which floral development may or may not proceed as in 1." >Spikes</u>!){
				}
				if(s! <<441>>spikes<<441>>!&nbsp;<u class="dotted" title="1. In flowering plants excluding Asteraceae, Cyperaceae, Poaceae, and some other groups, an unbranched inflorescence in which the flowers are sessile and nearly always open from the bottom to the top of the inflorescence. 2. In Asteraceae, Cyperaceae,  Poaceae, and some other groups, a spike-like inflorescence is one in which the inflorescence units (e.g., heads in Asteraceae; spikelets in Cyperaceae and Poaceae), instead of individual flowers, are sessile and attached directly to the main axis of the inflorescence, not to branches, and in which floral development may or may not proceed as in 1." >spikes</u>!){
				}
				if(s!<<442>>Spikelet<<442>>!<u class="dotted" title="1. In Poaceae, one or more florets (each a flower with subtending lemma and generally palea) and generally 2 subtending glumes; in a sterile spikelet, the flower(s) and sometimes palea(s) are rudimentary or absent. 2. In Cyperaceae, the smallest aggregation of flowers (generally more than 2) and associated bracts." >Spikelet</u>!){
				}
				if(s! <<442>>spikelet<<442>>!&nbsp;<div class="dropdown"><u class="dotted">spikelet</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/grass-spikelet.jpg" class="large-image" alt="image missing" >1. In Poaceae, one or more florets (each a flower with subtending lemma and generally palea) and generally 2 subtending glumes; in a sterile spikelet, the flower(s) and sometimes palea(s) are rudimentary or absent. 2. In Cyperaceae, the smallest aggregation of flowers (generally more than 2) and associated bracts.</div></div>!){
				}
				if(s!<<443>>Spikelets<<443>>!<u class="dotted" title="1. In Poaceae, one or more florets (each a flower with subtending lemma and generally palea) and generally 2 subtending glumes; in a sterile spikelet, the flower(s) and sometimes palea(s) are rudimentary or absent. 2. In Cyperaceae, the smallest aggregation of flowers (generally more than 2) and associated bracts." >Spikelets</u>!){
				}
				if(s! <<443>>spikelets<<443>>!&nbsp;<div class="dropdown"><u class="dotted">spikelets</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/grass-spikelet.jpg" class="large-image" alt="image missing" >1. In Poaceae, one or more florets (each a flower with subtending lemma and generally palea) and generally 2 subtending glumes; in a sterile spikelet, the flower(s) and sometimes palea(s) are rudimentary or absent. 2. In Cyperaceae, the smallest aggregation of flowers (generally more than 2) and associated bracts.</div></div>!){
				}
				if(s!<<444>>Spine<<444>>!<u class="dotted" title="Sharp-pointed, usually stiff projection, originating below the epidermis, derived from a leaf or leaf part (e.g., stipule, vein tip), and therefore often subtending an axillary bud or branch, without buds of its own; loosely used for any sharp projection. (e.g., Cirsium arvense leaf)" >Spine</u>!){
				}
				if(s! <<444>>spine<<444>>!&nbsp;<u class="dotted" title="Sharp-pointed, usually stiff projection, originating below the epidermis, derived from a leaf or leaf part (e.g., stipule, vein tip), and therefore often subtending an axillary bud or branch, without buds of its own; loosely used for any sharp projection. (e.g., Cirsium arvense leaf)" >spine</u>!){
				}
				if(s!<<445>>Spines<<445>>!<u class="dotted" title="Sharp-pointed, usually stiff projection, originating below the epidermis, derived from a leaf or leaf part (e.g., stipule, vein tip), and therefore often subtending an axillary bud or branch, without buds of its own; loosely used for any sharp projection. (e.g., Cirsium arvense leaf)" >Spines</u>!){
				}
				if(s! <<445>>spines<<445>>!&nbsp;<u class="dotted" title="Sharp-pointed, usually stiff projection, originating below the epidermis, derived from a leaf or leaf part (e.g., stipule, vein tip), and therefore often subtending an axillary bud or branch, without buds of its own; loosely used for any sharp projection. (e.g., Cirsium arvense leaf)" >spines</u>!){
				}
				if(s!<<446>>Sporangium<<446>>!<u class="dotted" title="In non-seed plants, a case or sac in which spores are produced, and from which they are released." >Sporangium</u>!){
				}
				if(s! <<446>>sporangium<<446>>!&nbsp;<div class="dropdown"><u class="dotted">sporangium</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/sporangium.jpg" class="large-image" alt="image missing" >In non-seed plants, a case or sac in which spores are produced, and from which they are released.</div></div>!){
				}
				if(s!<<447>>Sporangia<<447>>!<u class="dotted" title="In non-seed plants, a case or sac in which spores are produced, and from which they are released." >Sporangia</u>!){
				}
				if(s! <<447>>sporangia<<447>>!&nbsp;<u class="dotted" title="In non-seed plants, a case or sac in which spores are produced, and from which they are released." >sporangia</u>!){
				}
				if(s!<<448>>Spore<<448>>!<u class="dotted" title="In non-seed plants, one of very many minute, haploid cells (in mass, often appearing dust-like) dispersed from sporangia on a diploid parent plant (sporophyte), normally developing into a small haploid plant (gametophyte) that produces eggs, sperm, or both, the fusion of which results in new diploid offspring." >Spore</u>!){
				}
				if(s! <<448>>spore<<448>>!&nbsp;<u class="dotted" title="In non-seed plants, one of very many minute, haploid cells (in mass, often appearing dust-like) dispersed from sporangia on a diploid parent plant (sporophyte), normally developing into a small haploid plant (gametophyte) that produces eggs, sperm, or both, the fusion of which results in new diploid offspring." >spore</u>!){
				}
				if(s!<<449>>Spores<<449>>!<u class="dotted" title="In non-seed plants, one of very many minute, haploid cells (in mass, often appearing dust-like) dispersed from sporangia on a diploid parent plant (sporophyte), normally developing into a small haploid plant (gametophyte) that produces eggs, sperm, or both, the fusion of which results in new diploid offspring." >Spores</u>!){
				}
				if(s! <<449>>spores<<449>>!&nbsp;<u class="dotted" title="In non-seed plants, one of very many minute, haploid cells (in mass, often appearing dust-like) dispersed from sporangia on a diploid parent plant (sporophyte), normally developing into a small haploid plant (gametophyte) that produces eggs, sperm, or both, the fusion of which results in new diploid offspring." >spores</u>!){
				}
				if(s!<<450>>Spreading<<450>>!<u class="dotted" title="Oriented more or less perpendicularly to the axis of attachment; often, more or less horizontal." >Spreading</u>!){
				}
				if(s! <<450>>spreading<<450>>!&nbsp;<div class="dropdown"><u class="dotted">spreading</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/spreading.jpg" class="large-image" alt="image missing" >Oriented more or less perpendicularly to the axis of attachment; often, more or less horizontal.</div></div>!){
				}
				if(s!<<451>>Spur<<451>>!<u class="dotted" title="Hollow projection or expansion, generally of a perianth part and containing nectar.  (e.g., petals of Aquilegia formosa)" >Spur</u>!){
				}
				if(s! <<451>>spur<<451>>!&nbsp;<u class="dotted" title="Hollow projection or expansion, generally of a perianth part and containing nectar.  (e.g., petals of Aquilegia formosa)" >spur</u>!){
				}
				if(s!<<452>>Spurs<<452>>!<u class="dotted" title="Hollow projection or expansion, generally of a perianth part and containing nectar.  (e.g., petals of Aquilegia formosa)" >Spurs</u>!){
				}
				if(s! <<452>>spurs<<452>>!&nbsp;<u class="dotted" title="Hollow projection or expansion, generally of a perianth part and containing nectar.  (e.g., petals of Aquilegia formosa)" >spurs</u>!){
				}
				if(s!<<453>>Stamen<<453>>!<u class="dotted" title="Male reproductive structure of a flower, typically composed of a stalk-like filament and a terminal, pollen-producing anther.  Filaments sometimes partly fuse to the corolla, or to other filaments to form a tube." >Stamen</u>!){
				}
				if(s! <<453>>stamen<<453>>!&nbsp;<u class="dotted" title="Male reproductive structure of a flower, typically composed of a stalk-like filament and a terminal, pollen-producing anther.  Filaments sometimes partly fuse to the corolla, or to other filaments to form a tube." >stamen</u>!){
				}
				if(s!<<454>>Stamens<<454>>!<u class="dotted" title="Male reproductive structure of a flower, typically composed of a stalk-like filament and a terminal, pollen-producing anther.  Filaments sometimes partly fuse to the corolla, or to other filaments to form a tube." >Stamens</u>!){
				}
				if(s! <<454>>stamens<<454>>!&nbsp;<u class="dotted" title="Male reproductive structure of a flower, typically composed of a stalk-like filament and a terminal, pollen-producing anther.  Filaments sometimes partly fuse to the corolla, or to other filaments to form a tube." >stamens</u>!){
				}
				if(s!<<455>>Staminate<<455>>!<u class="dotted" title="Pertaining to flowers, inflorescences, or plants with fertile stamens but sterile or missing pistils.  (e.g., Salix laevigata flower)" >Staminate</u>!){
				}
				if(s! <<455>>staminate<<455>>!&nbsp;<u class="dotted" title="Pertaining to flowers, inflorescences, or plants with fertile stamens but sterile or missing pistils.  (e.g., Salix laevigata flower)" >staminate</u>!){
				}
				if(s!<<456>>Staminode<<456>>!<u class="dotted" title="Sterile stamen, usually modified in appearance, sometimes petal-like or elaborate in structure.  (e.g., Penstemon palmeri)" >Staminode</u>!){
				}
				if(s! <<456>>staminode<<456>>!&nbsp;<u class="dotted" title="Sterile stamen, usually modified in appearance, sometimes petal-like or elaborate in structure.  (e.g., Penstemon palmeri)" >staminode</u>!){
				}
				if(s!<<457>>Staminodes<<457>>!<u class="dotted" title="Sterile stamen, usually modified in appearance, sometimes petal-like or elaborate in structure.  (e.g., Penstemon palmeri)" >Staminodes</u>!){
				}
				if(s! <<457>>staminodes<<457>>!&nbsp;<u class="dotted" title="Sterile stamen, usually modified in appearance, sometimes petal-like or elaborate in structure.  (e.g., Penstemon palmeri)" >staminodes</u>!){
				}
				if(s!<<458>>Stellate<<458>>!<u class="dotted" title="Pertaining to a hair or other structure with three or more branches radiating in two or three dimensions from a common point." >Stellate</u>!){
				}
				if(s! <<458>>stellate<<458>>!&nbsp;<div class="dropdown"><u class="dotted">stellate</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/stellate.jpg" class="large-image" alt="image missing" >Pertaining to a hair or other structure with three or more branches radiating in two or three dimensions from a common point.</div></div>!){
				}
				if(s!<<459>>Stem<<459>>!<u class="dotted" title="Generally above-ground  but sometimes below-ground axis or axes of a plant; distinguished from roots by bearing leaves, leaf scars, axillary buds, flowers, nodes, etc." >Stem</u>!){
				}
				if(s! <<459>>stem<<459>>!&nbsp;<u class="dotted" title="Generally above-ground  but sometimes below-ground axis or axes of a plant; distinguished from roots by bearing leaves, leaf scars, axillary buds, flowers, nodes, etc." >stem</u>!){
				}
				if(s!<<460>>Stems<<460>>!<u class="dotted" title="Generally above-ground  but sometimes below-ground axis or axes of a plant; distinguished from roots by bearing leaves, leaf scars, axillary buds, flowers, nodes, etc." >Stems</u>!){
				}
				if(s! <<460>>stems<<460>>!&nbsp;<u class="dotted" title="Generally above-ground  but sometimes below-ground axis or axes of a plant; distinguished from roots by bearing leaves, leaf scars, axillary buds, flowers, nodes, etc." >stems</u>!){
				}
				if(s!<<461>>Sterile<<461>>!<u class="dotted" title="Not reproductively functional; pertaining to a plant or plant part that does not produce or is not associated with the production of functional spores, pollen, ovules, or seeds (e.g., sterile frond, sterile stamen, sterile flower, sterile floret)." >Sterile</u>!){
				}
				if(s! <<461>>sterile<<461>>!&nbsp;<u class="dotted" title="Not reproductively functional; pertaining to a plant or plant part that does not produce or is not associated with the production of functional spores, pollen, ovules, or seeds (e.g., sterile frond, sterile stamen, sterile flower, sterile floret)." >sterile</u>!){
				}
				if(s!<<462>>Stigma<<462>>!<u class="dotted" title="The part of a pistil on which pollen germinates, generally terminal and elevated above the ovary on a style, usually sticky or hairy, sometimes lobed." >Stigma</u>!){
				}
				if(s! <<462>>stigma<<462>>!&nbsp;<u class="dotted" title="The part of a pistil on which pollen germinates, generally terminal and elevated above the ovary on a style, usually sticky or hairy, sometimes lobed." >stigma</u>!){
				}
				if(s!<<463>>Stigmas<<463>>!<u class="dotted" title="The part of a pistil on which pollen germinates, generally terminal and elevated above the ovary on a style, usually sticky or hairy, sometimes lobed." >Stigmas</u>!){
				}
				if(s! <<463>>stigmas<<463>>!&nbsp;<u class="dotted" title="The part of a pistil on which pollen germinates, generally terminal and elevated above the ovary on a style, usually sticky or hairy, sometimes lobed." >stigmas</u>!){
				}
				if(s!<<464>>Stigmata<<464>>!<u class="dotted" title="The part of a pistil on which pollen germinates, generally terminal and elevated above the ovary on a style, usually sticky or hairy, sometimes lobed." >Stigmata</u>!){
				}
				if(s! <<464>>stigmata<<464>>!&nbsp;<u class="dotted" title="The part of a pistil on which pollen germinates, generally terminal and elevated above the ovary on a style, usually sticky or hairy, sometimes lobed." >stigmata</u>!){
				}
				if(s!<<465>>Stipe<<465>>!<u class="dotted" title="In ferns, a frond stalk (analogous to a petiole of a leaf), connecting blade to rhizome." >Stipe</u>!){
				}
				if(s! <<465>>stipe<<465>>!&nbsp;<u class="dotted" title="In ferns, a frond stalk (analogous to a petiole of a leaf), connecting blade to rhizome." >stipe</u>!){
				}
				if(s!<<466>>Stipes<<466>>!<u class="dotted" title="In ferns, a frond stalk (analogous to a petiole of a leaf), connecting blade to rhizome." >Stipes</u>!){
				}
				if(s! <<466>>stipes<<466>>!&nbsp;<u class="dotted" title="In ferns, a frond stalk (analogous to a petiole of a leaf), connecting blade to rhizome." >stipes</u>!){
				}
				if(s!<<467>>Stipule<<467>>!<u class="dotted" title="Appendage at base of petiole, generally paired, variable in form but often leaf- or scale-like, sometimes a spine." >Stipule</u>!){
				}
				if(s! <<467>>stipule<<467>>!&nbsp;<div class="dropdown"><u class="dotted">stipule</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/stipule.jpg" class="large-image" alt="image missing" >Appendage at base of petiole, generally paired, variable in form but often leaf- or scale-like, sometimes a spine.</div></div>!){
				}
				if(s!<<468>>Stipules<<468>>!<u class="dotted" title="Appendage at base of petiole, generally paired, variable in form but often leaf- or scale-like, sometimes a spine." >Stipules</u>!){
				}
				if(s! <<468>>stipules<<468>>!&nbsp;<u class="dotted" title="Appendage at base of petiole, generally paired, variable in form but often leaf- or scale-like, sometimes a spine." >stipules</u>!){
				}
				if(s!<<469>>Stolon<<469>>!<u class="dotted" title="A normally thin, elongate stem lying more or less flat on the ground and forming roots as well as erect stems or shoots (which become new, clonal plants) at generally widely spaced nodes; runner." >Stolon</u>!){
				}
				if(s! <<469>>stolon<<469>>!&nbsp;<div class="dropdown"><u class="dotted">stolon</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/stolon.jpg" class="large-image" alt="image missing" >A normally thin, elongate stem lying more or less flat on the ground and forming roots as well as erect stems or shoots (which become new, clonal plants) at generally widely spaced nodes; runner.</div></div>!){
				}
				if(s!<<470>>Stolons<<470>>!<u class="dotted" title="A normally thin, elongate stem lying more or less flat on the ground and forming roots as well as erect stems or shoots (which become new, clonal plants) at generally widely spaced nodes; runner." >Stolons</u>!){
				}
				if(s! <<470>>stolons<<470>>!&nbsp;<u class="dotted" title="A normally thin, elongate stem lying more or less flat on the ground and forming roots as well as erect stems or shoots (which become new, clonal plants) at generally widely spaced nodes; runner." >stolons</u>!){
				}
				if(s!<<471>>Stoma<<471>>!<u class="dotted" title="A minute pore on a leaf  (less often, stem or other structure)  through which gases pass into or out of a plant (generally, carbon dioxide in, oxygen and water vapor out); generally closed during times of water stress; sometimes used in identification." >Stoma</u>!){
				}
				if(s! <<471>>stoma<<471>>!&nbsp;<u class="dotted" title="A minute pore on a leaf  (less often, stem or other structure)  through which gases pass into or out of a plant (generally, carbon dioxide in, oxygen and water vapor out); generally closed during times of water stress; sometimes used in identification." >stoma</u>!){
				}
				if(s!<<472>>Stomata<<472>>!<u class="dotted" title="A minute pore on a leaf  (less often, stem or other structure)  through which gases pass into or out of a plant (generally, carbon dioxide in, oxygen and water vapor out); generally closed during times of water stress; sometimes used in identification." >Stomata</u>!){
				}
				if(s! <<472>>stomata<<472>>!&nbsp;<u class="dotted" title="A minute pore on a leaf  (less often, stem or other structure)  through which gases pass into or out of a plant (generally, carbon dioxide in, oxygen and water vapor out); generally closed during times of water stress; sometimes used in identification." >stomata</u>!){
				}
				if(s!<<473>>Stomate<<473>>!<u class="dotted" title="A minute pore on a leaf  (less often, stem or other structure)  through which gases pass into or out of a plant (generally, carbon dioxide in, oxygen and water vapor out); generally closed during times of water stress; sometimes used in identification." >Stomate</u>!){
				}
				if(s! <<473>>stomate<<473>>!&nbsp;<u class="dotted" title="A minute pore on a leaf  (less often, stem or other structure)  through which gases pass into or out of a plant (generally, carbon dioxide in, oxygen and water vapor out); generally closed during times of water stress; sometimes used in identification." >stomate</u>!){
				}
				if(s!<<474>>Stoma<<474>>!<u class="dotted" title="A minute pore on a leaf  (less often, stem or other structure)  through which gases pass into or out of a plant (generally, carbon dioxide in, oxygen and water vapor out); generally closed during times of water stress; sometimes used in identification." >Stoma</u>!){
				}
				if(s! <<474>>stoma<<474>>!&nbsp;<u class="dotted" title="A minute pore on a leaf  (less often, stem or other structure)  through which gases pass into or out of a plant (generally, carbon dioxide in, oxygen and water vapor out); generally closed during times of water stress; sometimes used in identification." >stoma</u>!){
				}
				if(s!<<475>>Stone<<475>>!<u class="dotted" title="In a drupe, the very hard inner ovary wall and the generally single seed it surrounds; occurring one or more per flower, free or variously fused.  (e.g., Prunus emarginata fruit)" >Stone</u>!){
				}
				if(s! <<475>>stone<<475>>!&nbsp;<u class="dotted" title="In a drupe, the very hard inner ovary wall and the generally single seed it surrounds; occurring one or more per flower, free or variously fused.  (e.g., Prunus emarginata fruit)" >stone</u>!){
				}
				if(s!<<476>>Stones<<476>>!<u class="dotted" title="In a drupe, the very hard inner ovary wall and the generally single seed it surrounds; occurring one or more per flower, free or variously fused.  (e.g., Prunus emarginata fruit)" >Stones</u>!){
				}
				if(s! <<476>>stones<<476>>!&nbsp;<u class="dotted" title="In a drupe, the very hard inner ovary wall and the generally single seed it surrounds; occurring one or more per flower, free or variously fused.  (e.g., Prunus emarginata fruit)" >stones</u>!){
				}
				if(s!<<477>>Stout<<477>>!<u class="dotted" title="Thick, sturdy, not slender." >Stout</u>!){
				}
				if(s! <<477>>stout<<477>>!&nbsp;<u class="dotted" title="Thick, sturdy, not slender." >stout</u>!){
				}
				if(s!<<478>>Striate<<478>>!<u class="dotted" title="With fine, longitudinal channels, lines, or ridges." >Striate</u>!){
				}
				if(s! <<478>>striate<<478>>!&nbsp;<u class="dotted" title="With fine, longitudinal channels, lines, or ridges." >striate</u>!){
				}
				if(s!<<479>>Strigose<<479>>!<u class="dotted" title="With stiff, straight, sharp, appressed hairs." >Strigose</u>!){
				}
				if(s! <<479>>strigose<<479>>!&nbsp;<div class="dropdown"><u class="dotted">strigose</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/strigose.jpg" class="large-image" alt="image missing" >With stiff, straight, sharp, appressed hairs.</div></div>!){
				}
				if(s!<<480>>Style<<480>>!<u class="dotted" title="In many but not all pistils, the stalk-like part that connects ovary to stigma." >Style</u>!){
				}
				if(s! <<480>>style<<480>>!&nbsp;<u class="dotted" title="In many but not all pistils, the stalk-like part that connects ovary to stigma." >style</u>!){
				}
				if(s!<<481>>Styles<<481>>!<u class="dotted" title="In many but not all pistils, the stalk-like part that connects ovary to stigma." >Styles</u>!){
				}
				if(s! <<481>>styles<<481>>!&nbsp;<u class="dotted" title="In many but not all pistils, the stalk-like part that connects ovary to stigma." >styles</u>!){
				}
				if(s!<<482>>Subalpine<<482>>!<u class="dotted" title="Pertaining to the vegetational--altitudinal zone just below timberline, between the montane and the alpine." >Subalpine</u>!){
				}
				if(s! <<482>>subalpine<<482>>!&nbsp;<u class="dotted" title="Pertaining to the vegetational--altitudinal zone just below timberline, between the montane and the alpine." >subalpine</u>!){
				}
				if(s!<<483>>Submersed<<483>>!<u class="dotted" title="Pertaining to a plant normally rooted and remaining underwater, or to a part of such a plant normally held underwater." >Submersed</u>!){
				}
				if(s! <<483>>submersed<<483>>!&nbsp;<u class="dotted" title="Pertaining to a plant normally rooted and remaining underwater, or to a part of such a plant normally held underwater." >submersed</u>!){
				}
				if(s!<<484>>Subshrub<<484>>!<u class="dotted" title="A plant with the lower stems woody, the upper stems and twigs not woody (or less so) and dying back seasonally." >Subshrub</u>!){
				}
				if(s! <<484>>subshrub<<484>>!&nbsp;<u class="dotted" title="A plant with the lower stems woody, the upper stems and twigs not woody (or less so) and dying back seasonally." >subshrub</u>!){
				}
				if(s!<<485>>Subshrubs<<485>>!<u class="dotted" title="A plant with the lower stems woody, the upper stems and twigs not woody (or less so) and dying back seasonally." >Subshrubs</u>!){
				}
				if(s! <<485>>subshrubs<<485>>!&nbsp;<u class="dotted" title="A plant with the lower stems woody, the upper stems and twigs not woody (or less so) and dying back seasonally." >subshrubs</u>!){
				}
				if(s!<<486>>Subtend<<486>>!<u class="dotted" title="Occurring immediately below, as sepals subtending petals or leaves subtending axillary buds." >Subtend</u>!){
				}
				if(s! <<486>>subtend<<486>>!&nbsp;<u class="dotted" title="Occurring immediately below, as sepals subtending petals or leaves subtending axillary buds." >subtend</u>!){
				}
				if(s!<<487>>Subtidal<<487>>!<u class="dotted" title="Pertaining to marine aquatic habitats that are continuously submerged, even at low tide." >Subtidal</u>!){
				}
				if(s! <<487>>subtidal<<487>>!&nbsp;<u class="dotted" title="Pertaining to marine aquatic habitats that are continuously submerged, even at low tide." >subtidal</u>!){
				}
				if(s!<<488>>Superior<<488>>!<u class="dotted" title="An ovary that is free from the perianth and stamens, or free from the fused lower portions of these structures (i.e., free from the hypanthium), to the extent that these structures appear to arise at its base, and it appears to arise from the top of the receptacle" >Superior</u>!){
				}
				if(s! <<488>>superior<<488>>!&nbsp;<u class="dotted" title="An ovary that is free from the perianth and stamens, or free from the fused lower portions of these structures (i.e., free from the hypanthium), to the extent that these structures appear to arise at its base, and it appears to arise from the top of the receptacle" >superior</u>!){
				}
				if(s!<<489>>Suture<<489>>!<u class="dotted" title="Groove or line of dehiscence or fusion." >Suture</u>!){
				}
				if(s! <<489>>suture<<489>>!&nbsp;<u class="dotted" title="Groove or line of dehiscence or fusion." >suture</u>!){
				}
				if(s!<<490>>Sutures<<490>>!<u class="dotted" title="Groove or line of dehiscence or fusion." >Sutures</u>!){
				}
				if(s! <<490>>sutures<<490>>!&nbsp;<u class="dotted" title="Groove or line of dehiscence or fusion." >sutures</u>!){
				}
				if(s!<<491>>Swamp<<491>>!<u class="dotted" title="Shrub- or tree-dominated vegetation that occurs in permanently wet soils with standing water." >Swamp</u>!){
				}
				if(s! <<491>>swamp<<491>>!&nbsp;<u class="dotted" title="Shrub- or tree-dominated vegetation that occurs in permanently wet soils with standing water." >swamp</u>!){
				}
				if(s!<<492>>Swamps<<492>>!<u class="dotted" title="Shrub- or tree-dominated vegetation that occurs in permanently wet soils with standing water." >Swamps</u>!){
				}
				if(s! <<492>>swamps<<492>>!&nbsp;<u class="dotted" title="Shrub- or tree-dominated vegetation that occurs in permanently wet soils with standing water." >swamps</u>!){
				}
				if(s!<<493>>Talus<<493>>!<u class="dotted" title="Relatively stable, sloping accumulation of large rock fragments, often at a cliff base." >Talus</u>!){
				}
				if(s! <<493>>talus<<493>>!&nbsp;<u class="dotted" title="Relatively stable, sloping accumulation of large rock fragments, often at a cliff base." >talus</u>!){
				}
				if(s!<<494>>Tapered<<494>>!<u class="dotted" title="Gradually (not abruptly) narrower or smaller at base or tip." >Tapered</u>!){
				}
				if(s! <<494>>tapered<<494>>!&nbsp;<div class="dropdown"><u class="dotted">tapered</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/tapered.jpg" class="large-image" alt="image missing" >Gradually (not abruptly) narrower or smaller at base or tip.</div></div>!){
				}
				if(s!<<495>>Taproot<<495>>!<u class="dotted" title="A primary root that grows more or less straight down into soil, is tapered to the end, and has smaller, lateral branches (e.g., carrot)." >Taproot</u>!){
				}
				if(s! <<495>>taproot<<495>>!&nbsp;<u class="dotted" title="A primary root that grows more or less straight down into soil, is tapered to the end, and has smaller, lateral branches (e.g., carrot)." >taproot</u>!){
				}
				if(s!<<496>>Taproots<<496>>!<u class="dotted" title="A primary root that grows more or less straight down into soil, is tapered to the end, and has smaller, lateral branches (e.g., carrot)." >Taproots</u>!){
				}
				if(s! <<496>>taproots<<496>>!&nbsp;<u class="dotted" title="A primary root that grows more or less straight down into soil, is tapered to the end, and has smaller, lateral branches (e.g., carrot)." >taproots</u>!){
				}
				if(s!<<497>>Taxon<<497>>!<u class="dotted" title="In classification, a group of organisms (such as plants) at any rank (e.g., species, genus, family); taxonomy is the science of classifying organisms." >Taxon</u>!){
				}
				if(s! <<497>>taxon<<497>>!&nbsp;<u class="dotted" title="In classification, a group of organisms (such as plants) at any rank (e.g., species, genus, family); taxonomy is the science of classifying organisms." >taxon</u>!){
				}
				if(s!<<498>>Taxa<<498>>!<u class="dotted" title="In classification, a group of organisms (such as plants) at any rank (e.g., species, genus, family); taxonomy is the science of classifying organisms." >Taxa</u>!){
				}
				if(s! <<498>>taxa<<498>>!&nbsp;<u class="dotted" title="In classification, a group of organisms (such as plants) at any rank (e.g., species, genus, family); taxonomy is the science of classifying organisms." >taxa</u>!){
				}
				if(s!<<499>>Tendril<<499>>!<u class="dotted" title="A slender, generally coiling structure (generally stem, stipule, or leaf tip) by which a climbing plant becomes attached to its support.  (e.g., Lathyrus lanszwertii leaf)" >Tendril</u>!){
				}
				if(s! <<499>>tendril<<499>>!&nbsp;<u class="dotted" title="A slender, generally coiling structure (generally stem, stipule, or leaf tip) by which a climbing plant becomes attached to its support.  (e.g., Lathyrus lanszwertii leaf)" >tendril</u>!){
				}
				if(s!<<500>>Tendrils<<500>>!<u class="dotted" title="A slender, generally coiling structure (generally stem, stipule, or leaf tip) by which a climbing plant becomes attached to its support.  (e.g., Lathyrus lanszwertii leaf)" >Tendrils</u>!){
				}
				if(s! <<500>>tendrils<<500>>!&nbsp;<u class="dotted" title="A slender, generally coiling structure (generally stem, stipule, or leaf tip) by which a climbing plant becomes attached to its support.  (e.g., Lathyrus lanszwertii leaf)" >tendrils</u>!){
				}
				if(s!<<501>>Terminal<<501>>!<u class="dotted" title="Pertaining to the tip of a structure (e.g., terminal bud)." >Terminal</u>!){
				}
				if(s! <<501>>terminal<<501>>!&nbsp;<u class="dotted" title="Pertaining to the tip of a structure (e.g., terminal bud)." >terminal</u>!){
				}
				if(s!<<502>>Ternate<<502>>!<u class="dotted" title="Lobed or compound into three parts, once, as a clover leaf (e.g.,  Trifolium wormskioldii), or more than once; in a ternate-pinnate leaf, the leaf is divided into three leaflets, each of which is pinnately compound (e.g., Aralia californica); three structures or parts (e.g., veins, lobes, or leaflets) radiating from a common point." >Ternate</u>!){
				}
				if(s! <<502>>ternate<<502>>!&nbsp;<u class="dotted" title="Lobed or compound into three parts, once, as a clover leaf (e.g.,  Trifolium wormskioldii), or more than once; in a ternate-pinnate leaf, the leaf is divided into three leaflets, each of which is pinnately compound (e.g., Aralia californica); three structures or parts (e.g., veins, lobes, or leaflets) radiating from a common point." >ternate</u>!){
				}
				if(s!<<503>>Thorn<<503>>!<u class="dotted" title="Sharp-pointed, usually stiff projection, originating below the epidermis, derived from a branch and therefore often subtended by a leaf or leaf scar, sometimes with leaf scars and buds of its own; loosely used for any sharp projection. (e.g., Castela emoryi)" >Thorn</u>!){
				}
				if(s! <<503>>thorn<<503>>!&nbsp;<u class="dotted" title="Sharp-pointed, usually stiff projection, originating below the epidermis, derived from a branch and therefore often subtended by a leaf or leaf scar, sometimes with leaf scars and buds of its own; loosely used for any sharp projection. (e.g., Castela emoryi)" >thorn</u>!){
				}
				if(s!<<504>>Thorns<<504>>!<u class="dotted" title="Sharp-pointed, usually stiff projection, originating below the epidermis, derived from a branch and therefore often subtended by a leaf or leaf scar, sometimes with leaf scars and buds of its own; loosely used for any sharp projection. (e.g., Castela emoryi)" >Thorns</u>!){
				}
				if(s! <<504>>thorns<<504>>!&nbsp;<u class="dotted" title="Sharp-pointed, usually stiff projection, originating below the epidermis, derived from a branch and therefore often subtended by a leaf or leaf scar, sometimes with leaf scars and buds of its own; loosely used for any sharp projection. (e.g., Castela emoryi)" >thorns</u>!){
				}
				if(s!<<505>>Throat<<505>>!<u class="dotted" title="In calyces or corollas with fused sepals or petals, the expanded, fused portion distal to the tube and proximal to the limb." >Throat</u>!){
				}
				if(s! <<505>>throat<<505>>!&nbsp;<u class="dotted" title="In calyces or corollas with fused sepals or petals, the expanded, fused portion distal to the tube and proximal to the limb." >throat</u>!){
				}
				if(s!<<506>>Throats<<506>>!<u class="dotted" title="In calyces or corollas with fused sepals or petals, the expanded, fused portion distal to the tube and proximal to the limb." >Throats</u>!){
				}
				if(s! <<506>>throats<<506>>!&nbsp;<u class="dotted" title="In calyces or corollas with fused sepals or petals, the expanded, fused portion distal to the tube and proximal to the limb." >throats</u>!){
				}
				if(s!<<507>>Timberline<<507>>!<u class="dotted" title="Region in high mountains where subalpine forests give way to treeless alpine vegetation." >Timberline</u>!){
				}
				if(s! <<507>>timberline<<507>>!&nbsp;<u class="dotted" title="Region in high mountains where subalpine forests give way to treeless alpine vegetation." >timberline</u>!){
				}
				if(s!<<508>>Tomentose<<508>>!<u class="dotted" title="Covered with densely interwoven, generally matted hairs." >Tomentose</u>!){
				}
				if(s! <<508>>tomentose<<508>>!&nbsp;<div class="dropdown"><u class="dotted">tomentose</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/tomentose.jpg" class="large-image" alt="image missing" >Covered with densely interwoven, generally matted hairs.</div></div>!){
				}
				if(s!<<509>>Tooth<<509>>!<u class="dotted" title="1. A small, pointed projection, such as on the margin of a leaf, sepal, or petal.  2. The free tips of otherwise fused structures, such as sepals or petals (somewhat archaic usage); smaller than lobes." >Tooth</u>!){
				}
				if(s! <<509>>tooth<<509>>!&nbsp;<div class="dropdown"><u class="dotted">tooth</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/tooth-02.jpg" class="large-image" alt="image missing" >1. A small, pointed projection, such as on the margin of a leaf, sepal, or petal.  2. The free tips of otherwise fused structures, such as sepals or petals (somewhat archaic usage); smaller than lobes.</div></div>!){
				}
				if(s!<<510>>Teeth<<510>>!<u class="dotted" title="1. A small, pointed projection, such as on the margin of a leaf, sepal, or petal.  2. The free tips of otherwise fused structures, such as sepals or petals (somewhat archaic usage); smaller than lobes." >Teeth</u>!){
				}
				if(s! <<510>>teeth<<510>>!&nbsp;<u class="dotted" title="1. A small, pointed projection, such as on the margin of a leaf, sepal, or petal.  2. The free tips of otherwise fused structures, such as sepals or petals (somewhat archaic usage); smaller than lobes." >teeth</u>!){
				}
				if(s!<<511>>Transverse<<511>>!<u class="dotted" title="Pertaining to width or the widthwise dimension; perpendicular to the axis." >Transverse</u>!){
				}
				if(s! <<511>>transverse<<511>>!&nbsp;<u class="dotted" title="Pertaining to width or the widthwise dimension; perpendicular to the axis." >transverse</u>!){
				}
				if(s!<<512>>Tree<<512>>!<u class="dotted" title="A woody plant of medium to tall maximum height, with generally one trunk from the base.  (e.g., Carnegiea gigantea)" >Tree</u>!){
				}
				if(s! <<512>>tree<<512>>!&nbsp;<u class="dotted" title="A woody plant of medium to tall maximum height, with generally one trunk from the base.  (e.g., Carnegiea gigantea)" >tree</u>!){
				}
				if(s!<<513>>Trees<<513>>!<u class="dotted" title="A woody plant of medium to tall maximum height, with generally one trunk from the base.  (e.g., Carnegiea gigantea)" >Trees</u>!){
				}
				if(s! <<513>>trees<<513>>!&nbsp;<u class="dotted" title="A woody plant of medium to tall maximum height, with generally one trunk from the base.  (e.g., Carnegiea gigantea)" >trees</u>!){
				}
				if(s!<<514>>Trilete spore<<514>>!<u class="dotted" title="In spore-bearing plants, radially symmetric spore on which the scar comprises three radiating branches." >Trilete spore</u>!){
				}
				if(s! <<514>>trilete spore<<514>>!&nbsp;<u class="dotted" title="In spore-bearing plants, radially symmetric spore on which the scar comprises three radiating branches." >trilete spore</u>!){
				}
				if(s!<<515>>Truncate<<515>>!<u class="dotted" title="Abruptly (not gradually) narrower or smaller at base or tip, as if cut straight across or nearly so." >Truncate</u>!){
				}
				if(s! <<515>>truncate<<515>>!&nbsp;<div class="dropdown"><u class="dotted">truncate</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/truncate.jpg" class="large-image" alt="image missing" >Abruptly (not gradually) narrower or smaller at base or tip, as if cut straight across or nearly so.</div></div>!){
				}
				if(s!<<516>>Trophophore<<516>>!<u class="dotted" title="The sterile blade of moonworts (Botrychium) and adders-tongues (Ophioglossum) that is photosynthetic and mostly does not bear sporangia." >Trophophore</u>!){
				}
				if(s! <<516>>trophophore<<516>>!&nbsp;<u class="dotted" title="The sterile blade of moonworts (Botrychium) and adders-tongues (Ophioglossum) that is photosynthetic and mostly does not bear sporangia." >trophophore</u>!){
				}
				if(s!<<517>>Tube<<517>>!<u class="dotted" title="In calyces or corollas with fused sepals or petals, the often more or less cylindric, fused portion at the base, proximal to the throat and limb." >Tube</u>!){
				}
				if(s! <<517>>tube<<517>>!&nbsp;<u class="dotted" title="In calyces or corollas with fused sepals or petals, the often more or less cylindric, fused portion at the base, proximal to the throat and limb." >tube</u>!){
				}
				if(s!<<518>>Tubes<<518>>!<u class="dotted" title="In calyces or corollas with fused sepals or petals, the often more or less cylindric, fused portion at the base, proximal to the throat and limb." >Tubes</u>!){
				}
				if(s! <<518>>tubes<<518>>!&nbsp;<u class="dotted" title="In calyces or corollas with fused sepals or petals, the often more or less cylindric, fused portion at the base, proximal to the throat and limb." >tubes</u>!){
				}
				if(s!<<519>>Tuber<<519>>!<u class="dotted" title="Short, thickened, fleshy, usually starchy, underground stem for storage (of water, food, or both) and sometimes propagation (e.g., potato)." >Tuber</u>!){
				}
				if(s! <<519>>tuber<<519>>!&nbsp;<u class="dotted" title="Short, thickened, fleshy, usually starchy, underground stem for storage (of water, food, or both) and sometimes propagation (e.g., potato)." >tuber</u>!){
				}
				if(s!<<520>>Tubers<<520>>!<u class="dotted" title="Short, thickened, fleshy, usually starchy, underground stem for storage (of water, food, or both) and sometimes propagation (e.g., potato)." >Tubers</u>!){
				}
				if(s! <<520>>tubers<<520>>!&nbsp;<u class="dotted" title="Short, thickened, fleshy, usually starchy, underground stem for storage (of water, food, or both) and sometimes propagation (e.g., potato)." >tubers</u>!){
				}
				if(s!<<521>>Tubercle<<521>>!<u class="dotted" title="Small, wart-like projection.  (e.g., Cryptantha muricata nutlet)" >Tubercle</u>!){
				}
				if(s! <<521>>tubercle<<521>>!&nbsp;<u class="dotted" title="Small, wart-like projection.  (e.g., Cryptantha muricata nutlet)" >tubercle</u>!){
				}
				if(s!<<522>>Tubercles<<522>>!<u class="dotted" title="Small, wart-like projection.  (e.g., Cryptantha muricata nutlet)" >Tubercles</u>!){
				}
				if(s! <<522>>tubercles<<522>>!&nbsp;<u class="dotted" title="Small, wart-like projection.  (e.g., Cryptantha muricata nutlet)" >tubercles</u>!){
				}
				if(s!<<523>>Twig<<523>>!<u class="dotted" title="In woody plants, a terminal stem segment, produced during the current or most recent growth period." >Twig</u>!){
				}
				if(s! <<523>>twig<<523>>!&nbsp;<u class="dotted" title="In woody plants, a terminal stem segment, produced during the current or most recent growth period." >twig</u>!){
				}
				if(s!<<524>>Twigs<<524>>!<u class="dotted" title="In woody plants, a terminal stem segment, produced during the current or most recent growth period." >Twigs</u>!){
				}
				if(s! <<524>>twigs<<524>>!&nbsp;<u class="dotted" title="In woody plants, a terminal stem segment, produced during the current or most recent growth period." >twigs</u>!){
				}
				if(s!<<525>>Twining<<525>>!<u class="dotted" title="Climbing by the twisting or coiling of stems, tendrils, or other structures.  (e.g., Antirrhinum filipes)" >Twining</u>!){
				}
				if(s! <<525>>twining<<525>>!&nbsp;<u class="dotted" title="Climbing by the twisting or coiling of stems, tendrils, or other structures.  (e.g., Antirrhinum filipes)" >twining</u>!){
				}
				if(s!<<526>>Ultimate<<526>>!<u class="dotted" title="Last, most distal, or smallest, as all the tips of a branching stem or the smallest divisions (segments) of a compound leaf or dissected leaf." >Ultimate</u>!){
				}
				if(s! <<526>>ultimate<<526>>!&nbsp;<u class="dotted" title="Last, most distal, or smallest, as all the tips of a branching stem or the smallest divisions (segments) of a compound leaf or dissected leaf." >ultimate</u>!){
				}
				if(s!<<527>>Umbel<<527>>!<u class="dotted" title="1. In flowering plants excluding Asteraceae and some other groups, an inflorescence in which three to many pedicels and, if compound, branches (rays) radiate from a common point; characteristic of but not confined to Apiaceae.  2. In Asteraceae and some other groups, an umbel-like inflorescence is one in which three to many stalked inflorescence units (e.g., heads in Asteraceae, umbels enclosed by involucres in Eriogonum), instead of individual flowers, radiate from a common point of attachment without an evident axis or branches." >Umbel</u>!){
				}
				if(s! <<527>>umbel<<527>>!&nbsp;<div class="dropdown"><u class="dotted">umbel</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/umbel.jpg" class="large-image" alt="image missing" >1. In flowering plants excluding Asteraceae and some other groups, an inflorescence in which three to many pedicels and, if compound, branches (rays) radiate from a common point; characteristic of but not confined to Apiaceae.  2. In Asteraceae and some other groups, an umbel-like inflorescence is one in which three to many stalked inflorescence units (e.g., heads in Asteraceae, umbels enclosed by involucres in Eriogonum), instead of individual flowers, radiate from a common point of attachment without an evident axis or branches.</div></div>!){
				}
				if(s!<<528>>Umbels<<528>>!<u class="dotted" title="1. In flowering plants excluding Asteraceae and some other groups, an inflorescence in which three to many pedicels and, if compound, branches (rays) radiate from a common point; characteristic of but not confined to Apiaceae.  2. In Asteraceae and some other groups, an umbel-like inflorescence is one in which three to many stalked inflorescence units (e.g., heads in Asteraceae, umbels enclosed by involucres in Eriogonum), instead of individual flowers, radiate from a common point of attachment without an evident axis or branches." >Umbels</u>!){
				}
				if(s! <<528>>umbels<<528>>!&nbsp;<u class="dotted" title="1. In flowering plants excluding Asteraceae and some other groups, an inflorescence in which three to many pedicels and, if compound, branches (rays) radiate from a common point; characteristic of but not confined to Apiaceae.  2. In Asteraceae and some other groups, an umbel-like inflorescence is one in which three to many stalked inflorescence units (e.g., heads in Asteraceae, umbels enclosed by involucres in Eriogonum), instead of individual flowers, radiate from a common point of attachment without an evident axis or branches." >umbels</u>!){
				}
				if(s!<<529>>Understory<<529>>!<u class="dotted" title="Layer of vegetation growing beneath a canopy of taller plants." >Understory</u>!){
				}
				if(s! <<529>>understory<<529>>!&nbsp;<u class="dotted" title="Layer of vegetation growing beneath a canopy of taller plants." >understory</u>!){
				}
				if(s!<<530>>Unisexual<<530>>!<u class="dotted" title="Either male or female reproductive parts occurring and functional in the same plant or structure (e.g., flower, spikelet, inforescence)." >Unisexual</u>!){
				}
				if(s! <<530>>unisexual<<530>>!&nbsp;<u class="dotted" title="Either male or female reproductive parts occurring and functional in the same plant or structure (e.g., flower, spikelet, inforescence)." >unisexual</u>!){
				}
				if(s!<<531>>Urn-shaped<<531>>!<u class="dotted" title="Widening more or less abruptly at the base and then gradually or abruptly narrowed toward the tip." >Urn-shaped</u>!){
				}
				if(s! <<531>>urn-shaped<<531>>!&nbsp;<div class="dropdown"><u class="dotted">urn-shaped</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/urn-shaped.jpg" class="large-image" alt="image missing" >Widening more or less abruptly at the base and then gradually or abruptly narrowed toward the tip.</div></div>!){
				}
				if(s!<<532>>Utricle<<532>>!<u class="dotted" title="Mostly dry, dehiscent or indehiscent fruit from a generally compound pistil in which a balloon- or bladder-like ovary wall loosely encloses (or, in some Amaranthaceae, is adherent to) a single seed." >Utricle</u>!){
				}
				if(s! <<532>>utricle<<532>>!&nbsp;<div class="dropdown"><u class="dotted">utricle</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/utricle.jpg" class="large-image" alt="image missing" >Mostly dry, dehiscent or indehiscent fruit from a generally compound pistil in which a balloon- or bladder-like ovary wall loosely encloses (or, in some Amaranthaceae, is adherent to) a single seed.</div></div>!){
				}
				if(s!<<533>>Utricles<<533>>!<u class="dotted" title="Mostly dry, dehiscent or indehiscent fruit from a generally compound pistil in which a balloon- or bladder-like ovary wall loosely encloses (or, in some Amaranthaceae, is adherent to) a single seed." >Utricles</u>!){
				}
				if(s! <<533>>utricles<<533>>!&nbsp;<u class="dotted" title="Mostly dry, dehiscent or indehiscent fruit from a generally compound pistil in which a balloon- or bladder-like ovary wall loosely encloses (or, in some Amaranthaceae, is adherent to) a single seed." >utricles</u>!){
				}
				if(s!<<534>>Valve<<534>>!<u class="dotted" title="1. In legumes or capsules opening by longitudinal lines, one of the parts into which the fruit is dehiscent.  2. In anthers, the flap of tissue resulting from dehiscence by a curved line. (e.g., Lauraceae, some Berberidaceae).  3. In Ophioglossaceae, one of the parts into which the sporangium is dehiscent." >Valve</u>!){
				}
				if(s! <<534>>valve<<534>>!&nbsp;<div class="dropdown"><u class="dotted">valve</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/valve.jpg" class="large-image" alt="image missing" >1. In legumes or capsules opening by longitudinal lines, one of the parts into which the fruit is dehiscent.  2. In anthers, the flap of tissue resulting from dehiscence by a curved line. (e.g., Lauraceae, some Berberidaceae).  3. In Ophioglossaceae, one of the parts into which the sporangium is dehiscent.</div></div>!){
				}
				if(s!<<535>>Valves<<535>>!<u class="dotted" title="1. In legumes or capsules opening by longitudinal lines, one of the parts into which the fruit is dehiscent.  2. In anthers, the flap of tissue resulting from dehiscence by a curved line. (e.g., Lauraceae, some Berberidaceae).  3. In Ophioglossaceae, one of the parts into which the sporangium is dehiscent." >Valves</u>!){
				}
				if(s! <<535>>valves<<535>>!&nbsp;<u class="dotted" title="1. In legumes or capsules opening by longitudinal lines, one of the parts into which the fruit is dehiscent.  2. In anthers, the flap of tissue resulting from dehiscence by a curved line. (e.g., Lauraceae, some Berberidaceae).  3. In Ophioglossaceae, one of the parts into which the sporangium is dehiscent." >valves</u>!){
				}
				if(s!<<536>>Vascular<<536>>!<u class="dotted" title="Pertaining to plant veins or to plants with veins." >Vascular</u>!){
				}
				if(s! <<536>>vascular<<536>>!&nbsp;<u class="dotted" title="Pertaining to plant veins or to plants with veins." >vascular</u>!){
				}
				if(s!<<537>>Vein<<537>>!<u class="dotted" title="1. Tissue specialized for transport of substances within a plant, water and dissolved inorganic substances (e.g., mineral nutrients) through the xylem, energy-rich, organic compounds (products of photosynthesis) through the phloem.  2. A strand of such tissue, often seen as a line in surface view and as a bundle in transverse section." >Vein</u>!){
				}
				if(s! <<537>>vein<<537>>!&nbsp;<u class="dotted" title="1. Tissue specialized for transport of substances within a plant, water and dissolved inorganic substances (e.g., mineral nutrients) through the xylem, energy-rich, organic compounds (products of photosynthesis) through the phloem.  2. A strand of such tissue, often seen as a line in surface view and as a bundle in transverse section." >vein</u>!){
				}
				if(s!<<538>>Veins<<538>>!<u class="dotted" title="1. Tissue specialized for transport of substances within a plant, water and dissolved inorganic substances (e.g., mineral nutrients) through the xylem, energy-rich, organic compounds (products of photosynthesis) through the phloem.  2. A strand of such tissue, often seen as a line in surface view and as a bundle in transverse section." >Veins</u>!){
				}
				if(s! <<538>>veins<<538>>!&nbsp;<u class="dotted" title="1. Tissue specialized for transport of substances within a plant, water and dissolved inorganic substances (e.g., mineral nutrients) through the xylem, energy-rich, organic compounds (products of photosynthesis) through the phloem.  2. A strand of such tissue, often seen as a line in surface view and as a bundle in transverse section." >veins</u>!){
				}
				if(s!<<539>>Vernal pool<<539>>!<u class="dotted" title="Shallow, ephemeral body of water (i.e., one that becomes dry by spring or early summer) that occupies a depression, with underlying hardpan, claypan, or bedrock, in a grassland, foothill woodland, or chaparral." >Vernal pool</u>!){
				}
				if(s! <<539>>vernal pool<<539>>!&nbsp;<u class="dotted" title="Shallow, ephemeral body of water (i.e., one that becomes dry by spring or early summer) that occupies a depression, with underlying hardpan, claypan, or bedrock, in a grassland, foothill woodland, or chaparral." >vernal pool</u>!){
				}
				if(s!<<540>>Vernal pools<<540>>!<u class="dotted" title="Shallow, ephemeral body of water (i.e., one that becomes dry by spring or early summer) that occupies a depression, with underlying hardpan, claypan, or bedrock, in a grassland, foothill woodland, or chaparral." >Vernal pools</u>!){
				}
				if(s! <<540>>vernal pools<<540>>!&nbsp;<u class="dotted" title="Shallow, ephemeral body of water (i.e., one that becomes dry by spring or early summer) that occupies a depression, with underlying hardpan, claypan, or bedrock, in a grassland, foothill woodland, or chaparral." >vernal pools</u>!){
				}
				if(s!<<541>>Vestigial<<541>>!<u class="dotted" title="Rudimentary; pertaining to a structure that is undeveloped, poorly developed, or degenerate and therefore non-functional." >Vestigial</u>!){
				}
				if(s! <<541>>vestigial<<541>>!&nbsp;<u class="dotted" title="Rudimentary; pertaining to a structure that is undeveloped, poorly developed, or degenerate and therefore non-functional." >vestigial</u>!){
				}
				if(s!<<542>>Vine<<542>>!<u class="dotted" title="A trailing, twining, or climbing plant, usually attached to its support by the twisting or coiling of stems, tendrils, or other structures.   (e.g., Phaseolus filiformis)" >Vine</u>!){
				}
				if(s! <<542>>vine<<542>>!&nbsp;<u class="dotted" title="A trailing, twining, or climbing plant, usually attached to its support by the twisting or coiling of stems, tendrils, or other structures.   (e.g., Phaseolus filiformis)" >vine</u>!){
				}
				if(s!<<543>>Vines<<543>>!<u class="dotted" title="A trailing, twining, or climbing plant, usually attached to its support by the twisting or coiling of stems, tendrils, or other structures.   (e.g., Phaseolus filiformis)" >Vines</u>!){
				}
				if(s! <<543>>vines<<543>>!&nbsp;<u class="dotted" title="A trailing, twining, or climbing plant, usually attached to its support by the twisting or coiling of stems, tendrils, or other structures.   (e.g., Phaseolus filiformis)" >vines</u>!){
				}
				if(s!<<544>>Waif<<544>>!<u class="dotted" title="Alien, adventive; reproducing neither sexually (e.g., by spores, seeds) nor vegetatively (e.g., by sprouts, suckers) in the absence of any benefit, intentional or not, direct or indirect, of human activity, and therefore not persisting beyond initial generation or establishment, or reproducing to some extent but not persisting for more than a few generations or well beyond initial establishment and therefore not completely naturalized; generally not considered to be part of the flora, but of interest because of their potential to become naturalized, and thereby to have become so." >Waif</u>!){
				}
				if(s! <<544>>waif<<544>>!&nbsp;<u class="dotted" title="Alien, adventive; reproducing neither sexually (e.g., by spores, seeds) nor vegetatively (e.g., by sprouts, suckers) in the absence of any benefit, intentional or not, direct or indirect, of human activity, and therefore not persisting beyond initial generation or establishment, or reproducing to some extent but not persisting for more than a few generations or well beyond initial establishment and therefore not completely naturalized; generally not considered to be part of the flora, but of interest because of their potential to become naturalized, and thereby to have become so." >waif</u>!){
				}
				if(s!<<545>>Waifs<<545>>!<u class="dotted" title="Alien, adventive; reproducing neither sexually (e.g., by spores, seeds) nor vegetatively (e.g., by sprouts, suckers) in the absence of any benefit, intentional or not, direct or indirect, of human activity, and therefore not persisting beyond initial generation or establishment, or reproducing to some extent but not persisting for more than a few generations or well beyond initial establishment and therefore not completely naturalized; generally not considered to be part of the flora, but of interest because of their potential to become naturalized, and thereby to have become so." >Waifs</u>!){
				}
				if(s! <<545>>waifs<<545>>!&nbsp;<u class="dotted" title="Alien, adventive; reproducing neither sexually (e.g., by spores, seeds) nor vegetatively (e.g., by sprouts, suckers) in the absence of any benefit, intentional or not, direct or indirect, of human activity, and therefore not persisting beyond initial generation or establishment, or reproducing to some extent but not persisting for more than a few generations or well beyond initial establishment and therefore not completely naturalized; generally not considered to be part of the flora, but of interest because of their potential to become naturalized, and thereby to have become so." >waifs</u>!){
				}
				if(s!<<546>>Wash<<546>>!<u class="dotted" title="Normally dry drainage channel with only occasional surface flow (e.g., flash floods), in some cases with water movement and availability below in times of no surface flow." >Wash</u>!){
				}
				if(s! <<546>>wash<<546>>!&nbsp;<u class="dotted" title="Normally dry drainage channel with only occasional surface flow (e.g., flash floods), in some cases with water movement and availability below in times of no surface flow." >wash</u>!){
				}
				if(s!<<547>>Washes<<547>>!<u class="dotted" title="Normally dry drainage channel with only occasional surface flow (e.g., flash floods), in some cases with water movement and availability below in times of no surface flow." >Washes</u>!){
				}
				if(s! <<547>>washes<<547>>!&nbsp;<u class="dotted" title="Normally dry drainage channel with only occasional surface flow (e.g., flash floods), in some cases with water movement and availability below in times of no surface flow." >washes</u>!){
				}
				if(s!<<548>>Whorled<<548>>!<u class="dotted" title="Arranged in groups of three or more at nodes or positions along an axis (e.g., three leaves per node)." >Whorled</u>!){
				}
				if(s! <<548>>whorled<<548>>!&nbsp;<div class="dropdown"><u class="dotted">whorled</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/whorled.jpg" class="large-image" alt="image missing" >Arranged in groups of three or more at nodes or positions along an axis (e.g., three leaves per node).</div></div>!){
				}
				if(s!<<549>>Whorl<<549>>!<u class="dotted" title="Arranged in groups of three or more at nodes or positions along an axis (e.g., three leaves per node)." >Whorl</u>!){
				}
				if(s! <<549>>whorl<<549>>!&nbsp;<u class="dotted" title="Arranged in groups of three or more at nodes or positions along an axis (e.g., three leaves per node)." >whorl</u>!){
				}
				if(s!<<550>>Wing<<550>>!<u class="dotted" title="1. Thin, flat extension or appendage of a surface or margin.  2. In many members of Fabaceae and in some other groups, each of two lateral petals." >Wing</u>!){
				}
				if(s! <<550>>wing<<550>>!&nbsp;<div class="dropdown"><u class="dotted">wing</u>&nbsp;<div class="dropdown-content"><img src="/eflora/common/images/morph/winged-stem.jpg" class="large-image" alt="image missing" >1. Thin, flat extension or appendage of a surface or margin.  2. In many members of Fabaceae and in some other groups, each of two lateral petals.</div></div>!){
				}
				if(s!<<551>>Wings<<551>>!<u class="dotted" title="1. Thin, flat extension or appendage of a surface or margin.  2. In many members of Fabaceae and in some other groups, each of two lateral petals." >Wings</u>!){
				}
				if(s! <<551>>wings<<551>>!&nbsp;<u class="dotted" title="1. Thin, flat extension or appendage of a surface or margin.  2. In many members of Fabaceae and in some other groups, each of two lateral petals." >wings</u>!){
				}
				if(s!<<552>>Wiry<<552>>!<u class="dotted" title="Pertaining to roots, stems, hairs, and other structures that are slender, stiff, and tough." >Wiry</u>!){
				}
				if(s! <<552>>wiry<<552>>!&nbsp;<u class="dotted" title="Pertaining to roots, stems, hairs, and other structures that are slender, stiff, and tough." >wiry</u>!){
				}
				if(s!<<553>>Wood<<553>>!<u class="dotted" title="Hardened, thickened, vascular tissue (xylem) under the bark of subshrubs, shrubs, trees, and some vines; number of concentric rings in wood often corresponds to years or growing seasons." >Wood</u>!){
				}
				if(s! <<553>>wood<<553>>!&nbsp;<u class="dotted" title="Hardened, thickened, vascular tissue (xylem) under the bark of subshrubs, shrubs, trees, and some vines; number of concentric rings in wood often corresponds to years or growing seasons." >wood</u>!){
				}
				if(s!<<554>>Woody<<554>>!<u class="dotted" title="A woody plant is a perennial that produces extensive wood and bark. This hard, supportive tissue allows these plants (ex. trees, shrubs, some vines) to persist year-round. Wood, which consists mainly of xylem (reinforced conducting) tissue, transports water and provides support so that these plants have potential to grow taller and wider, and often to live longer, than herbaceous plants." >Woody</u>!){
				}
				if(s! <<554>>woody<<554>>!&nbsp;<u class="dotted" title="A woody plant is a perennial that produces extensive wood and bark. This hard, supportive tissue allows these plants (ex. trees, shrubs, some vines) to persist year-round. Wood, which consists mainly of xylem (reinforced conducting) tissue, transports water and provides support so that these plants have potential to grow taller and wider, and often to live longer, than herbaceous plants." >woody</u>!){
				}
				if(s!<<555>>Woodland<<555>>!<u class="dotted" title="Vegetation dominated by small- to medium-sized trees, often with less continuous canopy cover than a forest and more than a savanna (canopies do not always touch)." >Woodland</u>!){
				}
				if(s! <<555>>woodland<<555>>!&nbsp;<u class="dotted" title="Vegetation dominated by small- to medium-sized trees, often with less continuous canopy cover than a forest and more than a savanna (canopies do not always touch)." >woodland</u>!){
				}
				if(s!<<556>>Woodlands<<556>>!<u class="dotted" title="Vegetation dominated by small- to medium-sized trees, often with less continuous canopy cover than a forest and more than a savanna (canopies do not always touch)." >Woodlands</u>!){
				}
				if(s! <<556>>woodlands<<556>>!&nbsp;<u class="dotted" title="Vegetation dominated by small- to medium-sized trees, often with less continuous canopy cover than a forest and more than a savanna (canopies do not always touch)." >woodlands</u>!){
				}





			print OUT $_;


}
close(IN);
close(OUT);
