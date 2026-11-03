
	#open (FAM, ">keybase/keybase_keys_families_processed.txt");
	#open (GEN, ">keybase/keybase_keys_genera_processed.txt");
	#open (SPE, ">keybase/keybase_keys_species_processed.txt");
	open (GGR, ">keybase/keybase_keys_genus_groups_processed.txt");
	#open (FGR, ">keybase/keybase_keys_family_groups_processed.txt");
	#open (UNA, ">keybase/keybase_keys_unabridged_processed.txt");
	#open (KGR, ">keybase/keybase_keys_key_to_groups_processed.txt");
	
	$/="\n\n";
	#OPEN THE RAW FILE
	$treatments="keybase/keybase_keys_genus_groups.txt";
	open(IN,$treatments) || die;
	#STORE THE FILE IN AN ARRAY, ONE PARAGRAPH PER ELEMENT
	@all_pars=(<IN>);
	
	
	#my @found2=grep(/\t[A-Z][a-z-]+ [a-z-]+\n/g,@all_pars);
	
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
	
	#These are missed in the loops above for some reason
	$all_pars[$j] =~ s/\tDigitaria californica var. californica\n/\tDigitaria {Digitaria californica var. californica}\n/;
	$all_pars[$j] =~ s/\tRanunculus hystriculus\n/\tRanunculus {Ranunculus hystriculus}\n/;
	$all_pars[$j] =~ s/\tFunastrum utahense\n/\tFunastrum {Funastrum utahense}\n/;
	$all_pars[$j] =~ s/\tKochia scoparia\n/\tKochia {Kochia scoparia}\n/;
	$all_pars[$j] =~ s/\tPeritoma arborea\n/\tPeritoma {Peritoma arborea}\n/;
	$all_pars[$j] =~ s/\tLythrum portula\n/\tLythrum {Lythrum portula}\n/;
	$all_pars[$j] =~ s/\tPrimula suffrutescens\n/\tPrimula {Primula suffrutescens}\n/;
	$all_pars[$j] =~ s/\tPellaea bridgesii\n/\tPellaea {Pellaea bridgesii}\n/;
	
	
	#Add family names to the Group links as is the proper format for Keybase
	#need to add some of the link so you get a unique phrase to tag the group to the correct family
	$all_pars[$j] =~ s/(; inflorescence terminal, often conspicuously plume- or fan-like)\tGroup 1/$1\tPoaceae Group 1/;
	$all_pars[$j] =~ s/(falling singly or in pairs with segments of inflorescence axis attached)\tGroup 2/$1\tPoaceae Group 2/;
	$all_pars[$j] =~ s/(sessile or stalked on an unbranched central axis)\tGroup 3/$1\tPoaceae Group 3/;
	$all_pars[$j] =~ s/(whorls of 1&deg; branches)\tGroup 4/$1\tPoaceae Group 4/;
	$all_pars[$j] =~ s/(Spikelets 1-flowered)\tGroup 5/$1\tPoaceae Group 5/;
	$all_pars[$j] =~ s/(several, sometimes very faint)\tGroup 6/$1\tPoaceae Group 6/;
	
	#fix some issies with group keys that have subtaxa that do not have thier own
	#keys imbedded after the species name and befoer the first infra taxon.
	#Trifolium Group 1
	$all_pars[$j] =~ s/; corolla 4.5&ndash;7\.5 mm; NCoR, CaRF, SNF, Teh, GV, CW, SCo, ChI, PR\tTrifolium depauperatum\n/; corolla 4.5&ndash;7\.5 mm; NCoR, CaRF, SNF, Teh, GV, CW, SCo, ChI, PR; <i>Trifolium depauperatum<\/i>\t5\n/;
	$all_pars[$j] =~ s/;3 mm; inflorescence 1&ndash;6-flowered\tTrifolium monanthum\n/;3 mm; inflorescence 1&ndash;6-flowered; <i>Trifolium monanthum<\/i>\t14\n/;
	$all_pars[$j] =~ s/Calyx bell-shaped, lobes entire or toothed\tTrifolium variegatum\n/Calyx bell-shaped, lobes entire or toothed; <i>Trifolium variegatum<\/i>\t24\n/;
	
	#Trifolium Group 2
	$all_pars[$j] =~ s/; calyx lobe hairs &plusmn; 1 mm\tTrifolium andersonii\n/; calyx lobe hairs &plusmn; 1 mm; <i>Trifolium andersonii<\/i>\t4\n/;
	#there are many problems with group 2, you need to add the keys for ssp. of T. monanthum, 
	#therefore all of the couplets need renumbered twice.
	
	$all_pars[$j] =~ s/; plant generally small .see Group 1, couplet 13 for subspecies.\tTrifolium monanthum\n/; plant generally small; <i>Trifolium monanthum<\/i>\t14\n/;
	#add missing key sections for subsp. of T. monanthum
	$all_pars[$j] =~ s/13\tFlowers > 5 per inflorescence unless plant stressed; corolla white to lavender-striate or not; plant small or not\t14\n/13\tFlowers > 5 per inflorescence unless plant stressed; corolla white to lavender-striate or not; plant small or not\t17\n14\tRhizomes thin, white; plant mat-forming, not from central crown or thickened taproot; plant glabrous to &plusmn; hairy\t15\n14\tRhizomes 0; plant not mat-forming, from central crown or thickened taproot; plant densely hairy\t16\n15\tFlowers 1&ndash;5, peduncle bent upward at tip; leaflet tips generally acute; SnGb, SnBr, SnJt\tTrifolium monanthum subsp. grantianum\n15\tFlowers 1&ndash;4, peduncle straight; leaflet tips generally rounded or truncate; CaR, SN, SNE\tTrifolium monanthum subsp. monanthum\n16\tLeaflet tips generally rounded, truncate, or notched\tTrifolium monanthum subsp. parvum\n16\tLeaflet tips acute to acuminate\tTrifolium monanthum subsp. tenerum\n/;
	#all these numbers are added plus 3
	$all_pars[$j] =~ s/14\tPedicels 1&ndash;6 mm, flowers generally becoming reflexed\t15\n/17\tPedicels 1&ndash;6 mm, flowers generally becoming reflexed\t18\n/;
	$all_pars[$j] =~ s/14\tPedicels < 2 mm, flowers becoming reflexed or not\t28\n/17\tPedicels < 2 mm, flowers becoming reflexed or not\t31\n/;
	$all_pars[$j] =~ s/15\tCorolla bright yellow, 5&ndash;7 mm; calyx 1\.5&ndash;2 mm; stalk-like fruit base 2&ndash;3 mm\tTrifolium aureum\n/18\tCorolla bright yellow, 5&ndash;7 mm; calyx 1\.5&ndash;2 mm; stalk-like fruit base 2&ndash;3 mm\tTrifolium aureum\n/;
	$all_pars[$j] =~ s/15\tCorolla not bright yellow, generally > 6 mm; calyx generally > 2 mm; stalk-like fruit base 0 or < 2 mm\t16\n/18\tCorolla not bright yellow, generally > 6 mm; calyx generally > 2 mm; stalk-like fruit base 0 or < 2 mm\t19\n/;
	$all_pars[$j] =~ s/16\tLeaflet lanceolate; leaves mostly basal, occasionally 2&ndash;3 cauline; plants of s SNH, SNE\tTrifolium kingii subsp. dedeckerae\n/19\tLeaflet lanceolate; leaves mostly basal, occasionally 2&ndash;3 cauline; plants of s SNH, SNE\tTrifolium kingii subsp\. dedeckerae\n/;
	$all_pars[$j] =~ s/16\tLeaflet wider than lanceolate, if lanceolate then leaves not mostly basal or plants not of s SNH, SNE\t17\n/19\tLeaflet wider than lanceolate, if lanceolate then leaves not mostly basal or plants not of s SNH, SNE\t20\n/;
	$all_pars[$j] =~ s/17\tStem creeping, rooting, turf-forming; petioles from ground level, &plusmn; equal; corolla white\tTrifolium repens\n/20\tStem creeping, rooting, turf-forming; petioles from ground level, &plusmn; equal; corolla white\tTrifolium repens\n/;
	$all_pars[$j] =~ s/17\tPlant not creeping, not rooting, not turf-forming; petioles not or some from ground level, lower > upper; corolla white or not\t18\n/20\tPlant not creeping, not rooting, not turf-forming; petioles not or some from ground level, lower > upper; corolla white or not\t21\n/;
	$all_pars[$j] =~ s/18\tCalyx tube puberulent or hairy, occasionally &plusmn; so\t19\n/21\tCalyx tube puberulent or hairy, occasionally &plusmn; so\t22\n/;
	$all_pars[$j] =~ s/18\tCalyx tube glabrous\t22\n/21\tCalyx tube glabrous\t25\n/;
	$all_pars[$j] =~ s/19\tCorolla 5&ndash;8 mm; pedicel 2&ndash;5 mm\tTrifolium breweri\n/22\tCorolla 5&ndash;8 mm; pedicel 2&ndash;5 mm\tTrifolium breweri\n/;
	#T. longipes needs to be fixed here also
	$all_pars[$j] =~ s/19\tCorolla 10&ndash;18 mm; pedicel 1&ndash;2 mm\tTrifolium longipes\n/22\tCorolla 10&ndash;18 mm; pedicel 1&ndash;2 mm\t23\n/;
	$all_pars[$j] =~ s/20\tLonger petals tapered to beak; 1400&ndash;2700 m &ndash; MP\tTrifolium longipes subsp\. multipedunculatum\n/23\tLonger petals tapered to beak; 1400&ndash;2700 m &ndash; MP\tTrifolium longipes subsp. multipedunculatum\n/;
	$all_pars[$j] =~ s/20\tLonger petals acute to acuminate but not beaked; 1200&ndash;2700 m\t21\n/23\tLonger petals acute to acuminate but not beaked; 1200&ndash;2700 m\t24\n/;
	$all_pars[$j] =~ s/21\tStems generally well developed, not cespitose; petals generally white, short-tapered, acute, or obtuse; 1200&ndash;1800 m; KR, NCoR\tTrifolium longipes subsp\. oreganum\n/24\tStems generally well developed, not cespitose; petals generally white, short-tapered, acute, or obtuse; 1200&ndash;1800 m; KR, NCoR\tTrifolium longipes subsp\. oreganum\n/;
	$all_pars[$j] =~ s/21\tStems often poorly developed, generally cespitose; petals lavender to purple, longer ones acute to acuminate; 1400&ndash;2700 m; KR, CaR\tTrifolium longipes subsp\. shastense\n/24\tStems often poorly developed, generally cespitose; petals lavender to purple, longer ones acute to acuminate; 1400&ndash;2700 m; KR, CaR\tTrifolium longipes subsp\. shastense\n/;
	$all_pars[$j] =~ s/22\tCalyx lobes ciliate with short, flat bristles .or, through breakage, bristle bases.; bracts inconspicuous, often in a ring at base of inflorescence\tTrifolium ciliolatum\n/25\tCalyx lobes ciliate with short, flat bristles (or, through breakage, bristle bases); bracts inconspicuous, often in a ring at base of inflorescence\tTrifolium ciliolatum\n/;
	$all_pars[$j] =~ s/22\tCalyx lobes not ciliate; bracts subtending individual flowers or 0\t23\n/25\tCalyx lobes not ciliate; bracts subtending individual flowers or 0\t26\n/;
	$all_pars[$j] =~ s/23\tLeaves basal except 1 pair cauline; corolla 10&ndash;17 mm\tTrifolium beckwithii\n/26\tLeaves basal except 1 pair cauline; corolla 10&ndash;17 mm\tTrifolium beckwithii\n/;
	$all_pars[$j] =~ s/23\tLeaves cauline; corolla 5&ndash;11 mm\t24\n/26\tLeaves cauline; corolla 5&ndash;11 mm\t27\n/;
	$all_pars[$j] =~ s/24\tInflorescence 1\.5&ndash;3 cm wide; bracts conspicuous but soon falling; calyx lobes sharply tapered but not bristle-tipped\tTrifolium hybridum\n/27\tInflorescence 1\.5&ndash;3 cm wide; bracts conspicuous but soon falling; calyx lobes sharply tapered but not bristle-tipped\tTrifolium hybridum\n/;
	$all_pars[$j] =~ s/24\tInflorescence 0\.5&ndash;1\.5 cm wide; bracts 0; calyx lobes bristle-tipped\t25\n/27\tInflorescence 0\.5&ndash;1\.5 cm wide; bracts 0; calyx lobes bristle-tipped\t28\n/;
	$all_pars[$j] =~ s/25\tCalyx lobes &plusmn; 0\.5 mm wide at base, glabrous, tube 1\.5&ndash;2\.5 mm\t26\n/28\tCalyx lobes &plusmn; 0\.5 mm wide at base, glabrous, tube 1\.5&ndash;2\.5 mm\t29\n/;
	#T. bifidum needs to be fixed here also
	$all_pars[$j] =~ s/25\tCalyx lobes &plusmn; 0\.2 mm wide at base, with generally few hairs, tube 0\.8&ndash;1\.4 mm\tTrifolium bifidum\n/28\tCalyx lobes &plusmn; 0\.2 mm wide at base, with generally few hairs, tube 0\.8&ndash;1\.4 mm\t30\n/;
	$all_pars[$j] =~ s/26\tLeaflet obovate to obcordate, length 1\.5&ndash;2\.5 &times; width; CA-FP, DMoj\tTrifolium gracilentum\n/29\tLeaflet obovate to obcordate, length 1\.5&ndash;2\.5 &times; width; CA-FP, DMoj\tTrifolium gracilentum\n/;
	$all_pars[$j] =~ s/26\tLeaflets narrowly elliptic or lanceolate, length 3\.5&ndash;5 &times; width; ChI\tTrifolium palmeri\n/29\tLeaflets narrowly elliptic or lanceolate, length 3\.5&ndash;5 &times; width; ChI\tTrifolium palmeri\n/;
	$all_pars[$j] =~ s/27\tLeaflet 2\.5&ndash;5\.5 &times; longer than wide, notched at tip 0\.1&ndash;0\.4 &times; length, otherwise generally entire\tTrifolium bifidum var\. bifidum\n/30\tLeaflet 2\.5&ndash;5\.5 &times; longer than wide, notched at tip 0\.1&ndash;0\.4 &times; length, otherwise generally entire\tTrifolium bifidum var\. bifidum\n/;
	$all_pars[$j] =~ s/27\tLeaflet 1\.5&ndash;2\.5 &times; longer than wide, truncate or notched at tip < 0\.2 &times; length, otherwise dentate or entire\tTrifolium bifidum var\. decipiens\n/30\tLeaflet 1\.5&ndash;2\.5 &times; longer than wide, truncate or notched at tip < 0\.2 &times; length, otherwise dentate or entire\tTrifolium bifidum var\. decipiens\n/;
	$all_pars[$j] =~ s/28\tInflorescence sessile at end of stem or in leaf axils, or in leaf axils on short peduncles 6&ndash;10 mm, << leaves; corolla 4&ndash;6 mm\t29\n/31\tInflorescence sessile at end of stem or in leaf axils, or in leaf axils on short peduncles 6&ndash;10 mm, << leaves; corolla 4&ndash;6 mm\t32\n/;
	$all_pars[$j] =~ s/28\tInflorescence peduncled .or immediately above 1&ndash;2 reduced leaves., peduncle generally > 10 mm, generally > leaves; corolla generally > 5 mm\t31\n/31\tInflorescence peduncled (or immediately above 1&ndash;2 reduced leaves), peduncle generally > 10 mm, generally > leaves; corolla generally > 5 mm\t34\n/;
	$all_pars[$j] =~ s/29\tInflorescence axillary or at end of stem, peduncles 0\tTrifolium glomeratum\n/32\tInflorescence axillary or at end of stem, peduncles 0\tTrifolium glomeratum\n/;
	$all_pars[$j] =~ s/29\tInflorescence axillary, peduncles short or short below, 0 above\t30\n/32\tInflorescence axillary, peduncles short or short below, 0 above\t33\n/;
	$all_pars[$j] =~ s/30\tCorolla > calyx lobes; banner tip notched; peduncles short\tTrifolium cernuum\n/33\tCorolla > calyx lobes; banner tip notched; peduncles short\tTrifolium cernuum\n/;
	$all_pars[$j] =~ s/30\tCorolla < calyx lobes; banner tip occasionally &plusmn; toothed but not notched; peduncles short below, 0 above\tTrifolium retusum\n/33\tCorolla < calyx lobes; banner tip occasionally &plusmn; toothed but not notched; peduncles short below, 0 above\tTrifolium retusum\n/;
	$all_pars[$j] =~ s/31\tBanner inflated in fruit; involucre vestigial, ring-like; corolla generally 6&ndash;9 mm\tTrifolium depauperatum var\. depauperatum\n/34\tBanner inflated in fruit; involucre vestigial, ring-like; corolla generally 6&ndash;9 mm\tTrifolium depauperatum var\. depauperatum\n/;
	$all_pars[$j] =~ s/31\tBanner not inflated in fruit; involucre 0; corolla 6&ndash;9 mm or not\t32\n/34\tBanner not inflated in fruit; involucre 0; corolla 6&ndash;9 mm or not\t35\n/;
	$all_pars[$j] =~ s/32\tFlowers generally reflexed soon after opening; inflorescence often turned to side or downward\t33\n/35\tFlowers generally reflexed soon after opening; inflorescence often turned to side or downward\t36\n/;
	$all_pars[$j] =~ s/32\tFlowers generally not reflexed after opening; inflorescence generally &plusmn; erect\t36\n/35\tFlowers generally not reflexed after opening; inflorescence generally &plusmn; erect\t39\n/;
	$all_pars[$j] =~ s/33\tCalyx hairy, lobes twisted or bent, plumose\tTrifolium eriocephalum subsp\. eriocephalum\n/36\tCalyx hairy, lobes twisted or bent, plumose\tTrifolium eriocephalum subsp. eriocephalum\n/;
	$all_pars[$j] =~ s/33\tCalyx glabrous, lobes not twisted or bent, not plumose\t34\n/36\tCalyx glabrous, lobes not twisted or bent, not plumose\t37\n/;
	$all_pars[$j] =~ s/34\tInflorescence 1&ndash;2 cm wide; calyx 3\.5&ndash;4\.5 mm, generally dark or purple-black; corolla 10&ndash;12 mm\tTrifolium bolanderi\n/37\tInflorescence 1&ndash;2 cm wide; calyx 3\.5&ndash;4\.5 mm, generally dark or purple-black; corolla 10&ndash;12 mm\tTrifolium bolanderi\n/;
	$all_pars[$j] =~ s/34\tInflorescence 1\.5&ndash;3 cm wide; calyx 3&ndash;7 mm, not dark or purple-black; corolla 10&ndash;17 mm\t35\n/37\tInflorescence 1.5&ndash;3 cm wide; calyx 3&ndash;7 mm, not dark or purple-black; corolla 10&ndash;17 mm\t38\n/;
	$all_pars[$j] =~ s/35\tCalyx 4\.5&ndash;7 mm; inflorescence erect, axis not exserted\tTrifolium beckwithii\n/38\tCalyx 4\.5&ndash;7 mm; inflorescence erect, axis not exserted\tTrifolium beckwithii\n/;
	$all_pars[$j] =~ s/35\tCalyx 3&ndash;4 mm; inflorescence generally turned to side or downward, axis exserted, generally forked\tTrifolium productum\n/38\tCalyx 3&ndash;4 mm; inflorescence generally turned to side or downward, axis exserted, generally forked\tTrifolium productum\n/;
	$all_pars[$j] =~ s/36\tInflorescence &plusmn; sessile above a pair of reduced leaves, stipules, or both .in <i>Trifolium macraei<\/i>, occasionally 1 of a pair of inflorescences short-peduncled.\t37\n/39\tInflorescence &plusmn; sessile above a pair of reduced leaves, stipules, or both (in <i>Trifolium macraei<\/i>, occasionally 1 of a pair of inflorescences short-peduncled)\t40\n/;
	$all_pars[$j] =~ s/36\tInflorescence peduncled\t42\n/39\tInflorescence peduncled\t45\n/;
	$all_pars[$j] =~ s/37\tInflorescence generally paired, &plusmn; sessile or occasionally 1 short-peduncled above .1.2 leaves\tTrifolium macraei\n/40\tInflorescence generally paired, &plusmn; sessile or occasionally 1 short-peduncled above (1)2 leaves\tTrifolium macraei\n/;
	$all_pars[$j] =~ s/37\tInflorescence single above subtending leaves\t38\n/40\tInflorescence single above subtending leaves\t41\n/;
	$all_pars[$j] =~ s/38\tCorolla 2-colored .purple with white tips.; locally uncommon, s NCoR, n CCo, SnFrB\tTrifolium amoenum\n/41\tCorolla 2-colored (purple with white tips); locally uncommon, s NCoR, n CCo, SnFrB\tTrifolium amoenum\n/;
	$all_pars[$j] =~ s/38\tCorolla not 2-colored .red-purple or pink.; sporadic or locally common, CA-FP, GB\t39\n/41\tCorolla not 2-colored (red-purple or pink); sporadic or locally common, CA-FP, GB\t42\n/;
	$all_pars[$j] =~ s/39\tCalyx lobes densely to sparsely plumose, lower one &plusmn; 1&ndash;1.5 &times; others; corolla pink\t40\n/42\tCalyx lobes densely to sparsely plumose, lower one &plusmn; 1&ndash;1.5 &times; others; corolla pink\t43\n/;
	$all_pars[$j] =~ s/39\tCalyx lobes sparsely plumose, straight, lower one &plusmn; 2 &times; others, or calyx lobes glabrous, curved, &plusmn; equal; corolla red-purple or pink\t41\n/42\tCalyx lobes sparsely plumose, straight, lower one &plusmn; 2 &times; others, or calyx lobes glabrous, curved, &plusmn; equal; corolla red-purple or pink\t44\n/;
	$all_pars[$j] =~ s/40\tInflorescence spheric, &plusmn; 1\.5&ndash;2 cm; calyx lobes >> tube, densely plumose, 4&ndash;6 mm\tTrifolium hirtum\n/43\tInflorescence spheric, &plusmn; 1\.5&ndash;2 cm; calyx lobes >> tube, densely plumose, 4&ndash;6 mm\tTrifolium hirtum\n/;
	$all_pars[$j] =~ s/40\tInflorescence &plusmn; short-cylindric, 0\.5&ndash;1\.5 cm; calyx lobes <= tube except lower one, sparsely plumose, 1&ndash;2\.5 mm\tTrifolium striatum\n/43\tInflorescence &plusmn; short-cylindric, 0\.5&ndash;1\.5 cm; calyx lobes <= tube except lower one, sparsely plumose, 1&ndash;2\.5 mm\tTrifolium striatum\n/;
	$all_pars[$j] =~ s/41\tLeaflets elliptic to obovate, &plusmn; entire; calyx hairy, veins 10, lobes straight; corolla generally red-purple\tTrifolium pratense\n/44\tLeaflets elliptic to obovate, &plusmn; entire; calyx hairy, veins 10, lobes straight; corolla generally red-purple\tTrifolium pratense\n/;
	$all_pars[$j] =~ s/41\tLeaflets generally lanceolate to elliptic, teeth bristle-like; calyx glabrous, veins 24, lobes straight to curved; corolla pink to purple\tTrifolium vesiculosum\n/44\tLeaflets generally lanceolate to elliptic, teeth bristle-like; calyx glabrous, veins 24, lobes straight to curved; corolla pink to purple\tTrifolium vesiculosum\n/;
	$all_pars[$j] =~ s/42\tCorolla <= calyx; calyx lobes > tube, plumose\t43\n/45\tCorolla <= calyx; calyx lobes > tube, plumose\t46\n/;
	$all_pars[$j] =~ s/42\tCorolla > calyx; calyx lobes > tube or not, plumose or not\t46\n/45\tCorolla > calyx; calyx lobes > tube or not, plumose or not\t49\n/;
	$all_pars[$j] =~ s/43\tLeaflets oblanceolate to obovate, length 1\.2&ndash;3 &times; width; corolla 2-colored .purple with white tips.\t44\n/46\tLeaflets oblanceolate to obovate, length 1\.2&ndash;3 &times; width; corolla 2-colored (purple with white tips)\t47\n/;
	$all_pars[$j] =~ s/43\tLeaflets linear to narrow-lanceolate, -oblong, or -oblanceolate, length 3&ndash;8 &times; width; corolla 1-colored .pale pink to white.\t45\n/46\tLeaflets linear to narrow-lanceolate, -oblong, or -oblanceolate, length 3&ndash;8 &times; width; corolla 1-colored (pale pink to white)\t48\n/;
	$all_pars[$j] =~ s/44\tCalyx 4&ndash;8 mm, lobes 3&ndash;6\.5 mm\tTrifolium albopurpureum\n/47\tCalyx 4&ndash;8 mm, lobes 3&ndash;6\.5 mm\tTrifolium albopurpureum\n/;
	$all_pars[$j] =~ s/44\tCalyx 8&ndash;14 mm, lobes 6\.5&ndash;12 mm\tTrifolium columbinum\n/47\tCalyx 8&ndash;14 mm, lobes 6\.5&ndash;12 mm\tTrifolium columbinum\n/;
	$all_pars[$j] =~ s/45\tCorolla 10&ndash;12 mm, &plusmn; = calyx\tTrifolium angustifolium\n/48\tCorolla 10&ndash;12 mm, &plusmn; = calyx\tTrifolium angustifolium\n/;
	$all_pars[$j] =~ s/45\tCorolla 3&ndash;4 mm, < or << calyx\tTrifolium arvense\n/48\tCorolla 3&ndash;4 mm, < or << calyx\tTrifolium arvense\n/;
	$all_pars[$j] =~ s/46\tPerennial herb; calyx lobes glabrous or hairs few, curved or wavy\t47\n/49\tPerennial herb; calyx lobes glabrous or hairs few, curved or wavy\t50\n/;
	$all_pars[$j] =~ s/46\tAnnual; calyx lobes &plusmn; plumose, hairs generally straight\t50\n/49\tAnnual; calyx lobes &plusmn; plumose, hairs generally straight\t56\n/;
	#add missing key sections for subsp. of T. monanthum
	$all_pars[$j] =~ s/47\tInflorescence < 1 cm wide, flowers generally 1&ndash;5, erect .see Group 1, couplet 13, for subspecies.\tTrifolium monanthum\n/50\tInflorescence < 1 cm wide, flowers generally 1&ndash;5, erect; <i>Trifolium monanthum<\/i>\t51\n/;
	$all_pars[$j] =~ s/47\tInflorescence 1.5&ndash;3 cm wide, flowers > 5, ascending-spreading\tTrifolium longipes\n/50\tInflorescence 1.5&ndash;3 cm wide, flowers > 5, ascending-spreading\t54\n51\tRhizomes thin, white; plant mat-forming, not from central crown or thickened taproot; plant glabrous to &plusmn; hairy\t52\n51\tRhizomes 0; plant not mat-forming, from central crown or thickened taproot; plant densely hairy\t53\n52\tFlowers 1&ndash;5, peduncle bent upward at tip; leaflet tips generally acute; SnGb, SnBr, SnJt\tTrifolium monanthum subsp. grantianum\n52\tFlowers 1&ndash;4, peduncle straight; leaflet tips generally rounded or truncate; CaR, SN, SNE\tTrifolium monanthum subsp. monanthum\n53\tLeaflet tips generally rounded, truncate, or notched\tTrifolium monanthum subsp. parvum\n53\tLeaflet tips acute to acuminate\tTrifolium monanthum subsp. tenerum\n/;
	#Trifolium longipes needs to be fixed here also
	#now all these below are +6
	$all_pars[$j] =~ s/48\tCalyx lobes 3&ndash;5 &times; tube; leaflet length generally 6&ndash;10 &times; width; KR, NCoR, CaR\tTrifolium longipes subsp\. elmeri\n/54\tCalyx lobes 3&ndash;5 &times; tube; leaflet length generally 6&ndash;10 &times; width; KR, NCoR, CaR\tTrifolium longipes subsp. elmeri\n/;
	$all_pars[$j] =~ s/48\tCalyx lobes 1&ndash;3 &times; tube; leaflet length 2&ndash;6 &times; width in CA-FP, to 10 &times; in GB; KR, NCoR, CaR, SN, SnBr, SnJt, GB\t49\n/54\tCalyx lobes 1&ndash;3 &times; tube; leaflet length 2&ndash;6 &times; width in CA-FP, to 10 &times; in GB; KR, NCoR, CaR, SN, SnBr, SnJt, GB\t55\n/;
	$all_pars[$j] =~ s/49\tRoots thickened, fusiform; rhizomes &plusmn; 0; calyx lobes densely long-hairy\tTrifolium longipes subsp\. atrorubens\n/55\tRoots thickened, fusiform; rhizomes &plusmn; 0; calyx lobes densely long-hairy\tTrifolium longipes subsp. atrorubens\n/;
	$all_pars[$j] =~ s/49\tRoots generally not thickened, not fusiform; rhizomes present; calyx &plusmn; glabrous\tTrifolium longipes subsp\. hansenii\n/55\tRoots generally not thickened, not fusiform; rhizomes present; calyx &plusmn; glabrous\tTrifolium longipes subsp. hansenii\n/;
	$all_pars[$j] =~ s/50\tCorolla 2-colored .purple with white tips.\t51\n/56\tCorolla 2-colored (purple with white tips)\t57\n/;
	$all_pars[$j] =~ s/50\tCorolla 1-colored .purple, crimson, pink, white, or cream.\t52\n/56\tCorolla 1-colored (purple, crimson, pink, white, or cream)\t58\n/;
	$all_pars[$j] =~ s/51\tCorolla 12&ndash;16 mm; calyx 10&ndash;12 mm\tTrifolium amoenum\n/57\tCorolla 12&ndash;16 mm; calyx 10&ndash;12 mm\tTrifolium amoenum\n/;
	$all_pars[$j] =~ s/51\tCorolla 7&ndash;12 mm; calyx 4&ndash;8 mm\tTrifolium dichotomum\n/57\tCorolla 7&ndash;12 mm; calyx 4&ndash;8 mm\tTrifolium dichotomum\n/;
	$all_pars[$j] =~ s/52\tCorolla cream; inflorescence ovate to spheric, 1&ndash;2\.5 cm; leaflets elliptic to oblanceolate; stipules long-tapered\tTrifolium alexandrinum\n/58\tCorolla cream; inflorescence ovate to spheric, 1&ndash;2\.5 cm; leaflets elliptic to oblanceolate; stipules long-tapered\tTrifolium alexandrinum\n/;
	$all_pars[$j] =~ s/52\tCorolla crimson or white; inflorescence &plusmn; cylindric or &plusmn; conic, 2&ndash;6 cm; leaflets obovate to obcordate; stipules widely rounded\tTrifolium incarnatum\n/58\tCorolla crimson or white; inflorescence &plusmn; cylindric or &plusmn; conic, 2&ndash;6 cm; leaflets obovate to obcordate; stipules widely rounded\tTrifolium incarnatum\n/;
	
	
	
	
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
	
	#change monotypic genera where the key ends in a genus and that genus is monotypic
	#print "Before: $all_pars[$j]\n";
	$all_pars[$j] =~ s/\tAcalypha\n/\tAcalypha {Acalypha californica}\n/;
	$all_pars[$j] =~ s/\tAchillea\n/\tAchillea {Achillea millefolium}\n/;
	$all_pars[$j] =~ s/\tAchyrachaena\n/\tAchyrachaena {Achyrachaena mollis}\n/;
	$all_pars[$j] =~ s/\tAchyronychia\n/\tAchyronychia {Achyronychia cooperi}\n/;
	$all_pars[$j] =~ s/\tAcourtia\n/\tAcourtia {Acourtia microcephala}\n/;
	$all_pars[$j] =~ s/\tAcroptilon\n/\tAcroptilon {Acroptilon repens}\n/;
	$all_pars[$j] =~ s/\tActaea\n/\tActaea {Actaea rubra}\n/;
	$all_pars[$j] =~ s/\tAdenocaulon\n/\tAdenocaulon {Adenocaulon bicolor}\n/;
	$all_pars[$j] =~ s/\tAdolphia\n/\tAdolphia {Adolphia californica}\n/;
	$all_pars[$j] =~ s/\tAdonis\n/\tAdonis {Adonis aestivalis}\n/;
	$all_pars[$j] =~ s/\tAeschynomene\n/\tAeschynomene {Aeschynomene rudis}\n/;
	$all_pars[$j] =~ s/\tAesculus\n/\tAesculus {Aesculus californica}\n/;
	$all_pars[$j] =~ s/\tAgrostemma\n/\tAgrostemma {Agrostemma githago var. githago}\n/;
	$all_pars[$j] =~ s/\tAilanthus\n/\tAilanthus {Ailanthus altissima}\n/;
	$all_pars[$j] =~ s/\tAlcea\n/\tAlcea {Alcea rosea}\n/;
	$all_pars[$j] =~ s/\tAlhagi\n/\tAlhagi {Alhagi maurorum}\n/;
	$all_pars[$j] =~ s/\tAllenrolfea\n/\tAllenrolfea {Allenrolfea occidentalis}\n/;
	$all_pars[$j] =~ s/\tAlyogyne\n/\tAlyogyne {Alyogyne huegelii}\n/; #missed by David in 2015
	$all_pars[$j] =~ s/\tAllotropa\n/\tAllotropa {Allotropa virgata}\n/;
	$all_pars[$j] =~ s/\tAlmutaster\n/\tAlmutaster {Almutaster pauciflorus}\n/;
	$all_pars[$j] =~ s/\tAloysia\n/\tAloysia {Aloysia wrightii}\n/;
	$all_pars[$j] =~ s/\tAmaryllis\n/\tAmaryllis {Amaryllis belladonna}\n/;
	$all_pars[$j] =~ s/\tAmauriopsis\n/\tAmauriopsis {Amauriopsis dissecta}\n/;
	$all_pars[$j] =~ s/\tAmblyopappus\n/\tAmblyopappus {Amblyopappus pusillus}\n/;
	$all_pars[$j] =~ s/\tAmmophila\n/\tAmmophila {Ammophila arenaria}\n/;
	$all_pars[$j] =~ s/\tAmmoselinum\n/\tAmmoselinum {Ammoselinum giganteum}\n/;
	$all_pars[$j] =~ s/\tAmphiscirpus\n/\tAmphiscirpus {Amphiscirpus nevadensis}\n/;
	$all_pars[$j] =~ s/\tAmsonia\n/\tAmsonia {Amsonia tomentosa}\n/;
	$all_pars[$j] =~ s/\tAnaphalis\n/\tAnaphalis {Anaphalis margaritacea}\n/;
	$all_pars[$j] =~ s/\tAndrostephium\n/\tAndrostephium {Androstephium breviflorum}\n/;
	$all_pars[$j] =~ s/\tAnelsonia\n/\tAnelsonia {Anelsonia eurycarpa}\n/;
	$all_pars[$j] =~ s/\tAnethum\n/\tAnethum {Anethum graveolens}\n/;
	$all_pars[$j] =~ s/\tAnisocoma\n/\tAnisocoma {Anisocoma acaulis}\n/;
	$all_pars[$j] =~ s/\tAnisodontea\n/\tAnisodontea {Anisodontea capensis}\n/; #missed by David in 2015
	$all_pars[$j] =~ s/\tAnthriscus\n/\tAnthriscus {Anthriscus caucalis}\n/;
	$all_pars[$j] =~ s/\tAnulocaulis\n/\tAnulocaulis {Anulocaulis annulatus}\n/;
	$all_pars[$j] =~ s/\tAphanes\n/\tAphanes {Aphanes occidentalis}\n/;
	$all_pars[$j] =~ s/\tAphanisma\n/\tAphanisma {Aphanisma blitoides}\n/;
	$all_pars[$j] =~ s/\tApiastrum\n/\tApiastrum {Apiastrum angustifolium}\n/;
	$all_pars[$j] =~ s/\tAptenia\n/\tAptenia {Aptenia cordifolia}\n/;
	$all_pars[$j] =~ s/\tArabidopsis\n/\tArabidopsis {Arabidopsis thaliana}\n/;
	$all_pars[$j] =~ s/\tAralia\n/\tAralia {Aralia californica}\n/;
	$all_pars[$j] =~ s/\tAraujia\n/\tAraujia {Araujia sericifera}\n/;
	$all_pars[$j] =~ s/\tArbutus\n/\tArbutus {Arbutus menziesii}\n/;
	$all_pars[$j] =~ s/\tArctomecon\n/\tArctomecon {Arctomecon merriamii}\n/;
	$all_pars[$j] =~ s/\tArctotis\n/\tArctotis {Arctotis venusta}\n/;
	$all_pars[$j] =~ s/\tArgyranthemum\n/\tArgyranthemum {Argyranthemum foeniculaceum}\n/;
	$all_pars[$j] =~ s/\tAristocapsa\n/\tAristocapsa {Aristocapsa insignis}\n/;
	$all_pars[$j] =~ s/\tAristolochia\n/\tAristolochia {Aristolochia californica}\n/;
	$all_pars[$j] =~ s/\tArmeria\n/\tArmeria {Armeria maritima subsp. californica}\n/;
	$all_pars[$j] =~ s/\tArmoracia\n/\tArmoracia {Armoracia rusticana}\n/;
	$all_pars[$j] =~ s/\tArrhenatherum\n/\tArrhenatherum {Arrhenatherum elatius}\n/;
	$all_pars[$j] =~ s/\tArthrocnemum\n/\tArthrocnemum {Arthrocnemum subterminale}\n/;
	$all_pars[$j] =~ s/\tAruncus\n/\tAruncus {Aruncus dioicus var. acuminatus}\n/;
	$all_pars[$j] =~ s/\tArundo\n/\tArundo {Arundo donax}\n/;
	$all_pars[$j] =~ s/\tAsperugo\n/\tAsperugo {Asperugo procumbens}\n/;
	$all_pars[$j] =~ s/\tAsphodelus\n/\tAsphodelus {Asphodelus fistulosus}\n/;
	$all_pars[$j] =~ s/\tAstrolepis\n/\tAstrolepis {Astrolepis cochisensis}\n/;
	$all_pars[$j] =~ s/\tAsyneuma\n/\tAsyneuma {Asyneuma prenanthoides}\n/;
	$all_pars[$j] =~ s/\tAtrichoseris\n/\tAtrichoseris {Atrichoseris platyphylla}\n/;
	$all_pars[$j] =~ s/\tAubrieta\n/\tAubrieta {Aubrieta deltoidea}\n/;
	$all_pars[$j] =~ s/\tAvicennia\n/\tAvicennia {Avicennia marina var. australasica}\n/;
	$all_pars[$j] =~ s/\tAyenia\n/\tAyenia {Ayenia compacta}\n/;
	$all_pars[$j] =~ s/\tBahia\n/\tBahia {Bahia neomexicana}\n/;
	$all_pars[$j] =~ s/\tBassia\n/\tBassia {Bassia hyssopifolia}\n/;
	$all_pars[$j] =~ s/\tBebbia\n/\tBebbia {Bebbia juncea var. aspera}\n/;
	$all_pars[$j] =~ s/\tBeckmannia\n/\tBeckmannia {Beckmannia syzigachne}\n/;
	$all_pars[$j] =~ s/\tBellardia\n/\tBellardia {Bellardia trixago}\n/;
	$all_pars[$j] =~ s/\tBellis\n/\tBellis {Bellis perennis}\n/;
	$all_pars[$j] =~ s/\tBenitoa\n/\tBenitoa {Benitoa occidentalis}\n/;
	$all_pars[$j] =~ s/\tBensoniella\n/\tBensoniella {Bensoniella oregona}\n/;
	$all_pars[$j] =~ s/\tBergerocactus\n/\tBergerocactus {Bergerocactus emoryi}\n/;
	$all_pars[$j] =~ s/\tBergia\n/\tBergia {Bergia texana}\n/;
	$all_pars[$j] =~ s/\tBernardia\n/\tBernardia {Bernardia incana}\n/;
	$all_pars[$j] =~ s/\tBerteroa\n/\tBerteroa {Berteroa incana}\n/;
	$all_pars[$j] =~ s/\tBerula\n/\tBerula {Berula erecta}\n/;
	$all_pars[$j] =~ s/\tBeta\n/\tBeta {Beta vulgaris subsp. maritima}\n/;
	$all_pars[$j] =~ s/\tBillardiera\n/\tBillardiera {Billardiera heterophylla}\n/;
	$all_pars[$j] =~ s/\tBistorta\n/\tBistorta {Bistorta bistortoides}\n/;
	$all_pars[$j] =~ s/\tBituminaria\n/\tBituminaria {Bituminaria bituminosa}\n/;
	$all_pars[$j] =~ s/\tBlechnum\n/\tBlechnum {Blechnum spicant}\n/;
	$all_pars[$j] =~ s/\tBlepharidachne\n/\tBlepharidachne {Blepharidachne kingii}\n/;
	$all_pars[$j] =~ s/\tBlepharipappus\n/\tBlepharipappus {Blepharipappus scaber}\n/;
	$all_pars[$j] =~ s/\tBoehmeria\n/\tBoehmeria {Boehmeria cylindrica}\n/;
	$all_pars[$j] =~ s/\tBolandra\n/\tBolandra {Bolandra californica}\n/;
	$all_pars[$j] =~ s/\tBorago\n/\tBorago {Borago officinalis}\n/;
	$all_pars[$j] =~ s/\tBotrypus\n/\tBotrypus {Botrypus virginianus}\n/;
	$all_pars[$j] =~ s/\tBowlesia\n/\tBowlesia {Bowlesia incana}\n/;
	$all_pars[$j] =~ s/\tBrandegea\n/\tBrandegea {Brandegea bigelovii}\n/;
	$all_pars[$j] =~ s/\tBrasenia\n/\tBrasenia {Brasenia schreberi}\n/;
	$all_pars[$j] =~ s/\tBulbine\n/\tBulbine {Bulbine semibarbata}\n/;
	$all_pars[$j] =~ s/\tBulbostylis\n/\tBulbostylis {Bulbostylis capillaris}\n/;
	$all_pars[$j] =~ s/\tCabomba\n/\tCabomba {Cabomba caroliniana}\n/;
	$all_pars[$j] =~ s/\tCacaliopsis\n/\tCacaliopsis {Cacaliopsis nardosmia}\n/;
	$all_pars[$j] =~ s/\tCaesalpinioideae\n/\tCaesalpinioideae {Cercis}\n/;
	$all_pars[$j] =~ s/\tCalia\n/\tCalia {Calia secundiflora}\n/;
	$all_pars[$j] =~ s/\tCalifornia\n/\tCalifornia {California macrophylla}\n/;
	$all_pars[$j] =~ s/\tCalliandra\n/\tCalliandra {Calliandra eriophylla}\n/;
	$all_pars[$j] =~ s/\tCallitropsis\n/\tCallitropsis {Callitropsis nootkatensis}\n/;
	$all_pars[$j] =~ s/\tCalocedrus\n/\tCalocedrus {Calocedrus decurrens}\n/;
	$all_pars[$j] =~ s/\tCalypso\n/\tCalypso {Calypso bulbosa var. occidentalis}\n/;
	$all_pars[$j] =~ s/\tCamelina\n/\tCamelina {Camelina microcarpa}\n/;
	$all_pars[$j] =~ s/\tCampsis\n/\tCampsis {Campsis radicans}\n/; #missed by David in 2015
	$all_pars[$j] =~ s/\tCanbya\n/\tCanbya {Canbya candida}\n/;
	$all_pars[$j] =~ s/\tCannabis\n/\tCannabis {Cannabis sativa}\n/;
	$all_pars[$j] =~ s/\tCapsella\n/\tCapsella {Capsella bursa-pastoris}\n/;
	$all_pars[$j] =~ s/\tCardionema\n/\tCardionema {Cardionema ramosissimum}\n/;
	$all_pars[$j] =~ s/\tCarlowrightia\n/\tCarlowrightia {Carlowrightia arizonica}\n/;
	$all_pars[$j] =~ s/\tCarlquistia\n/\tCarlquistia {Carlquistia muirii}\n/;
	$all_pars[$j] =~ s/\tCarnegiea\n/\tCarnegiea {Carnegiea gigantea}\n/;
	$all_pars[$j] =~ s/\tCarpenteria\n/\tCarpenteria {Carpenteria californica}\n/;
	$all_pars[$j] =~ s/\tCarrichtera\n/\tCarrichtera {Carrichtera annua}\n/;
	$all_pars[$j] =~ s/\tCarsonia\n/\tCarsonia {Carsonia sparsifolia}\n/;
	$all_pars[$j] =~ s/\tCarya\n/\tCarya {Carya illinoinensis}\n/;
	$all_pars[$j] =~ s/\tCascadia\n/\tCascadia {Cascadia nuttallii}\n/;
	$all_pars[$j] =~ s/\tCassiope\n/\tCassiope {Cassiope mertensiana}\n/;
	$all_pars[$j] =~ s/\tCastela\n/\tCastela {Castela emoryi}\n/;
	$all_pars[$j] =~ s/\tCentranthus\n/\tCentranthus {Centranthus ruber}\n/;
	$all_pars[$j] =~ s/\tCentrostegia\n/\tCentrostegia {Centrostegia thurberi}\n/;
	$all_pars[$j] =~ s/\tCephalanthera\n/\tCephalanthera {Cephalanthera austiniae}\n/;
	$all_pars[$j] =~ s/\tCephalanthus\n/\tCephalanthus {Cephalanthus occidentalis}\n/;
	$all_pars[$j] =~ s/\tCercis\n/\tCercis {Cercis occidentalis}\n/;
	$all_pars[$j] =~ s/\tChaetadelpha\n/\tChaetadelpha {Chaetadelpha wheeleri}\n/;
	$all_pars[$j] =~ s/\tChaetopappa\n/\tChaetopappa {Chaetopappa ericoides}\n/;
	$all_pars[$j] =~ s/\tChamaebatiaria\n/\tChamaebatiaria {Chamaebatiaria millefolium}\n/;
	$all_pars[$j] =~ s/\tChamaecyparis\n/\tChamaecyparis {Chamaecyparis lawsoniana}\n/;
	$all_pars[$j] =~ s/\tChamaemelum\n/\tChamaemelum {Chamaemelum fuscatum}\n/;
	$all_pars[$j] =~ s/\tChamelaucium\n/\tChamelaucium {Chamelaucium uncinatum}\n/;
	$all_pars[$j] =~ s/\tChasmanthe\n/\tChasmanthe {Chasmanthe floribunda}\n/;
	$all_pars[$j] =~ s/\tChilopsis\n/\tChilopsis {Chilopsis linearis subsp. arcuata}\n/;
	$all_pars[$j] =~ s/\tChloracantha\n/\tChloracantha {Chloracantha spinosa var. spinosa}\n/;
	$all_pars[$j] =~ s/\tChondrilla\n/\tChondrilla {Chondrilla juncea}\n/;
	$all_pars[$j] =~ s/\tChorispora\n/\tChorispora {Chorispora tenella}\n/;
	$all_pars[$j] =~ s/\tChrysanthemoides\n/\tChrysanthemoides {Chrysanthemoides monilifera subsp. monilifera}\n/;
	$all_pars[$j] =~ s/\tChrysosplenium\n/\tChrysosplenium {Chrysosplenium glechomifolium}\n/;
	$all_pars[$j] =~ s/\tChylismiella\n/\tChylismiella {Chylismiella pterosperma}\n/;
	$all_pars[$j] =~ s/\tCicendia\n/\tCicendia {Cicendia quadrangularis}\n/;
	$all_pars[$j] =~ s/\tCichorium\n/\tCichorium {Cichorium intybus}\n/;
	$all_pars[$j] =~ s/\tCircaea\n/\tCircaea {Circaea alpina subsp. pacifica}\n/;
	$all_pars[$j] =~ s/\tCissus\n/\tCissus {Cissus antarctica}\n/;
	$all_pars[$j] =~ s/\tCitrullus\n/\tCitrullus {Citrullus lanatus var. citroides}\n/;
	$all_pars[$j] =~ s/\tCladium\n/\tCladium {Cladium californicum}\n/;
	$all_pars[$j] =~ s/\tCneoridium\n/\tCneoridium {Cneoridium dumosum}\n/;
	$all_pars[$j] =~ s/\tCochlearia\n/\tCochlearia {Cochlearia groenlandica}\n/;
	$all_pars[$j] =~ s/\tColeogyne\n/\tColeogyne {Coleogyne ramosissima}\n/;
	$all_pars[$j] =~ s/\tColubrina\n/\tColubrina {Colubrina californica}\n/;
	$all_pars[$j] =~ s/\tColutea\n/\tColutea {Colutea arborescens}\n/;
	$all_pars[$j] =~ s/\tComarum\n/\tComarum {Comarum palustre}\n/;
	$all_pars[$j] =~ s/\tComastoma\n/\tComastoma {Comastoma tenellum}\n/;
	$all_pars[$j] =~ s/\tCommelina\n/\tCommelina {Commelina benghalensis}\n/;
	$all_pars[$j] =~ s/\tCondalia\n/\tCondalia {Condalia globosa var. pubescens}\n/;
	$all_pars[$j] =~ s/\tCondea\n/\tCondea {Condea emoryi}\n/;
	$all_pars[$j] =~ s/\tConicosia\n/\tConicosia {Conicosia pugioniformis}\n/;
	$all_pars[$j] =~ s/\tConioselinum\n/\tConioselinum {Conioselinum pacificum}\n/;
	$all_pars[$j] =~ s/\tConium\n/\tConium {Conium maculatum}\n/;
	$all_pars[$j] =~ s/\tConringia\n/\tConringia {Conringia orientalis}\n/;
	$all_pars[$j] =~ s/\tConsolida\n/\tConsolida {Consolida ajacis}\n/;
	$all_pars[$j] =~ s/\tConstancea\n/\tConstancea {Constancea nevinii}\n/;
	$all_pars[$j] =~ s/\tCoprosma\n/\tCoprosma {Coprosma repens}\n/;
	$all_pars[$j] =~ s/\tCoptis\n/\tCoptis {Coptis laciniata}\n/;
	$all_pars[$j] =~ s/\tCorethrogyne\n/\tCorethrogyne {Corethrogyne filaginifolia}\n/;
	$all_pars[$j] =~ s/\tCoriandrum\n/\tCoriandrum {Coriandrum sativum}\n/;
	$all_pars[$j] =~ s/\tCorispermum\n/\tCorispermum {Corispermum americanum var. americanum}\n/;
	$all_pars[$j] =~ s/\tCorylus\n/\tCorylus {Corylus cornuta subsp. californica}\n/;
	$all_pars[$j] =~ s/\tCota\n/\tCota {Cota tinctoria}\n/;
	$all_pars[$j] =~ s/\tCotyledon\n/\tCotyledon {Cotyledon orbiculata var. oblonga}\n/;
	$all_pars[$j] =~ s/\tCressa\n/\tCressa {Cressa truxillensis}\n/;
	$all_pars[$j] =~ s/\tCrocidium\n/\tCrocidium {Crocidium multicaule}\n/;
	$all_pars[$j] =~ s/\tCrocosmia\n/\tCrocosmia {Crocosmia &times;crocosmiiflora}\n/; #changed to a html times sign to fix the bad link to eflora
	$all_pars[$j] =~ s/\tCrucianella\n/\tCrucianella {Crucianella angustifolia}\n/;
	$all_pars[$j] =~ s/\tCrupina\n/\tCrupina {Crupina vulgaris}\n/;
	$all_pars[$j] =~ s/\tCuniculotinus\n/\tCuniculotinus {Cuniculotinus gramineus}\n/;
	$all_pars[$j] =~ s/\tCycloloma\n/\tCycloloma {Cycloloma atriplicifolium}\n/;
	$all_pars[$j] =~ s/\tCyclospermum\n/\tCyclospermum {Cyclospermum leptophyllum}\n/;
	$all_pars[$j] =~ s/\tCymbalaria\n/\tCymbalaria {Cymbalaria muralis}\n/;
	$all_pars[$j] =~ s/\tCynodon\n/\tCynodon {Cynodon dactylon}\n/;
	$all_pars[$j] =~ s/\tCypselea\n/\tCypselea {Cypselea humifusa}\n/;
	$all_pars[$j] =~ s/\tCyrtomium\n/\tCyrtomium {Cyrtomium falcatum}\n/;
	$all_pars[$j] =~ s/\tCystopteris\n/\tCystopteris {Cystopteris fragilis}\n/;
	$all_pars[$j] =~ s/\tDactylis\n/\tDactylis {Dactylis glomerata}\n/;
	$all_pars[$j] =~ s/\tDactyloctenium\n/\tDactyloctenium {Dactyloctenium aegyptium}\n/;
	$all_pars[$j] =~ s/\tDamasonium\n/\tDamasonium {Damasonium californicum}\n/;
	$all_pars[$j] =~ s/\tDarlingtonia\n/\tDarlingtonia {Darlingtonia californica}\n/;
	$all_pars[$j] =~ s/\tDarmera\n/\tDarmera {Darmera peltata}\n/;
	$all_pars[$j] =~ s/\tDasiphora\n/\tDasiphora {Dasiphora fruticosa}\n/;
	$all_pars[$j] =~ s/\tDasyochloa\n/\tDasyochloa {Dasyochloa pulchella}\n/;
	$all_pars[$j] =~ s/\tDedeckera\n/\tDedeckera {Dedeckera eurekensis}\n/;
	$all_pars[$j] =~ s/\tDelairea\n/\tDelairea {Delairea odorata}\n/;
	$all_pars[$j] =~ s/\tDelosperma\n/\tDelosperma {Delosperma litorale}\n/;
	$all_pars[$j] =~ s/\tDesmazeria\n/\tDesmazeria {Desmazeria rigida}\n/;
	$all_pars[$j] =~ s/\tDicoria\n/\tDicoria {Dicoria canescens}\n/;
	$all_pars[$j] =~ s/\tDicranostegia\n/\tDicranostegia {Dicranostegia orcuttiana}\n/;
	$all_pars[$j] =~ s/\tDigitalis\n/\tDigitalis {Digitalis purpurea}\n/;
	$all_pars[$j] =~ s/\tDimeresia\n/\tDimeresia {Dimeresia howellii}\n/;
	$all_pars[$j] =~ s/\tDiodia\n/\tDiodia {Diodia teres}\n/;
	$all_pars[$j] =~ s/\tDissanthelium\n/\tDissanthelium {Dissanthelium californicum}\n/;
	$all_pars[$j] =~ s/\tDittrichia\n/\tDittrichia {Dittrichia graveolens}\n/;
	$all_pars[$j] =~ s/\tDodecahema\n/\tDodecahema {Dodecahema leptoceras}\n/;
	$all_pars[$j] =~ s/\tDopatrium\n/\tDopatrium {Dopatrium junceum}\n/;
	$all_pars[$j] =~ s/\tDraperia\n/\tDraperia {Draperia systyla}\n/;
	$all_pars[$j] =~ s/\tDrosanthemum\n/\tDrosanthemum {Drosanthemum floribundum}\n/;
	$all_pars[$j] =~ s/\tDuchesnea\n/\tDuchesnea {Duchesnea indica var. indica}\n/;
	$all_pars[$j] =~ s/\tDulichium\n/\tDulichium {Dulichium arundinaceum var. arundinaceum}\n/;
	$all_pars[$j] =~ s/\tDyssodia\n/\tDyssodia {Dyssodia papposa}\n/;
	$all_pars[$j] =~ s/\tEastwoodia\n/\tEastwoodia {Eastwoodia elegans}\n/;
	$all_pars[$j] =~ s/\tEatonella\n/\tEatonella {Eatonella nivea}\n/;
	$all_pars[$j] =~ s/\tEchinocactus\n/\tEchinocactus {Echinocactus polycephalus var. polycephalus}\n/;
	$all_pars[$j] =~ s/\tEchinodorus\n/\tEchinodorus {Echinodorus berteroi}\n/;
	$all_pars[$j] =~ s/\tEchinops\n/\tEchinops {Echinops sphaerocephalus}\n/;
	$all_pars[$j] =~ s/\tEclipta\n/\tEclipta {Eclipta prostrata}\n/;
	$all_pars[$j] =~ s/\tEgeria\n/\tEgeria {Egeria densa}\n/;
	$all_pars[$j] =~ s/\tEichhornia\n/\tEichhornia {Eichhornia crassipes}\n/;
	$all_pars[$j] =~ s/\tElaeagnus\n/\tElaeagnus {Elaeagnus angustifolia}\n/;
	$all_pars[$j] =~ s/\tEmpetrum\n/\tEmpetrum {Empetrum nigrum}\n/;
	$all_pars[$j] =~ s/\tEnneapogon\n/\tEnneapogon {Enneapogon desvauxii}\n/;
	$all_pars[$j] =~ s/\tErica\n/\tErica {Erica lusitanica}\n/;
	$all_pars[$j] =~ s/\tErioneuron\n/\tErioneuron {Erioneuron pilosum}\n/;
	$all_pars[$j] =~ s/\tEriophorum\n/\tEriophorum {Eriophorum gracile}\n/;
	$all_pars[$j] =~ s/\tErucastrum\n/\tErucastrum {Erucastrum gallicum}\n/;
	$all_pars[$j] =~ s/\tEuclidium\n/\tEuclidium {Euclidium syriacum}\n/;
	$all_pars[$j] =~ s/\tEulobus\n/\tEulobus {Eulobus californicus}\n/;
	$all_pars[$j] =~ s/\tEustoma\n/\tEustoma {Eustoma exaltatum subsp. exaltatum}\n/;
	$all_pars[$j] =~ s/\tEuthamia\n/\tEuthamia {Euthamia occidentalis}\n/;
	$all_pars[$j] =~ s/\tFallugia\n/\tFallugia {Fallugia paradoxa}\n/;
	$all_pars[$j] =~ s/\tFendlerella\n/\tFendlerella {Fendlerella utahensis}\n/;
	$all_pars[$j] =~ s/\tFicus\n/\tFicus {Ficus carica}\n/;
	$all_pars[$j] =~ s/\tFilago\n/\tFilago {Filago pyramidata var. pyramidata}\n/;
	$all_pars[$j] =~ s/\tFlaveria\n/\tFlaveria {Flaveria trinervia}\n/;
	$all_pars[$j] =~ s/\tFloerkea\n/\tFloerkea {Floerkea proserpinacoides}\n/;
	$all_pars[$j] =~ s/\tFoeniculum\n/\tFoeniculum {Foeniculum vulgare}\n/;
	$all_pars[$j] =~ s/\tForestiera\n/\tForestiera {Forestiera pubescens}\n/;
	$all_pars[$j] =~ s/\tFreesia\n/\tFreesia {Freesia leichtlinii subsp. alba}\n/; #missed by David in 2015
	$all_pars[$j] =~ s/\tGalinsoga\n/\tGalinsoga {Galinsoga parviflora var. parviflora}\n/;
	$all_pars[$j] =~ s/\tGambelia\n/\tGambelia {Gambelia speciosa}\n/;
	$all_pars[$j] =~ s/\tGastridium\n/\tGastridium {Gastridium phleoides}\n/;
	$all_pars[$j] =~ s/\tGaudinia\n/\tGaudinia {Gaudinia fragilis}\n/;
	$all_pars[$j] =~ s/\tGazania\n/\tGazania {Gazania linearis}\n/;
	$all_pars[$j] =~ s/\tGentianella\n/\tGentianella {Gentianella amarella subsp. acuta}\n/;
	$all_pars[$j] =~ s/\tGilmania\n/\tGilmania {Gilmania luteola}\n/;
	$all_pars[$j] =~ s/\tGlaucium\n/\tGlaucium {Glaucium flavum}\n/;
	$all_pars[$j] =~ s/\tGlaux\n/\tGlaux {Glaux maritima}\n/;
	$all_pars[$j] =~ s/\tGlechoma\n/\tGlechoma {Glechoma hederacea}\n/;
	$all_pars[$j] =~ s/\tGleditsia\n/\tGleditsia {Gleditsia triacanthos}\n/;
	$all_pars[$j] =~ s/\tGlehnia\n/\tGlehnia {Glehnia littoralis subsp. leiocarpa}\n/;
	$all_pars[$j] =~ s/\tGnaphalium\n/\tGnaphalium {Gnaphalium palustre}\n/;
	$all_pars[$j] =~ s/\tGoodmania\n/\tGoodmania {Goodmania luteola}\n/;
	$all_pars[$j] =~ s/\tGoodyera\n/\tGoodyera {Goodyera oblongifolia}\n/;
	$all_pars[$j] =~ s/\tGossypium\n/\tGossypium {Gossypium hirsutum}\n/; #missed by David in 2015
	$all_pars[$j] =~ s/\tGrayia\n/\tGrayia {Grayia spinosa}\n/;
	$all_pars[$j] =~ s/\tGuilleminea\n/\tGuilleminea {Guilleminea densa var. aggregata}\n/;
	$all_pars[$j] =~ s/\tGymnosteris\n/\tGymnosteris {Gymnosteris parvula}\n/;
	$all_pars[$j] =~ s/\tHainardia\n/\tHainardia {Hainardia cylindrica}\n/;
	$all_pars[$j] =~ s/\tHalimodendron\n/\tHalimodendron {Halimodendron halodendron}\n/;
	$all_pars[$j] =~ s/\tHalimolobos\n/\tHalimolobos {Halimolobos jaegeri}\n/;
	$all_pars[$j] =~ s/\tHalogeton\n/\tHalogeton {Halogeton glomeratus}\n/;
	$all_pars[$j] =~ s/\tHarpagonella\n/\tHarpagonella {Harpagonella palmeri}\n/;
	$all_pars[$j] =~ s/\tHecastocleis\n/\tHecastocleis {Hecastocleis shockleyi}\n/;
	$all_pars[$j] =~ s/\tHedypnois\n/\tHedypnois {Hedypnois rhagadioloides}\n/;
	$all_pars[$j] =~ s/\tHelichrysum\n/\tHelichrysum {Helichrysum petiolare}\n/;
	$all_pars[$j] =~ s/\tHeliomeris\n/\tHeliomeris {Heliomeris multiflora var. nevadensis}\n/;
	$all_pars[$j] =~ s/\tHelminthotheca\n/\tHelminthotheca {Helminthotheca echioides}\n/;
	$all_pars[$j] =~ s/\tHemieva\n/\tHemieva {Hemieva ranunculifolia}\n/;
	$all_pars[$j] =~ s/\tHemitomes\n/\tHemitomes {Hemitomes congestum}\n/;
	$all_pars[$j] =~ s/\tHemizonella\n/\tHemizonella {Hemizonella minima}\n/;
	$all_pars[$j] =~ s/\tHeracleum\n/\tHeracleum {Heracleum maximum}\n/;
	$all_pars[$j] =~ s/\tHerissantia\n/\tHerissantia {Herissantia crispa}\n/;
	$all_pars[$j] =~ s/\tHesperidanthus\n/\tHesperidanthus {Hesperidanthus jaegeri}\n/;
	$all_pars[$j] =~ s/\tHesperis\n/\tHesperis {Hesperis matronalis}\n/;
	$all_pars[$j] =~ s/\tHesperocallis\n/\tHesperocallis {Hesperocallis undulata}\n/;
	$all_pars[$j] =~ s/\tHesperocnide\n/\tHesperocnide {Hesperocnide tenella}\n/;
	$all_pars[$j] =~ s/\tHesperomecon\n/\tHesperomecon {Hesperomecon linearis}\n/;
	$all_pars[$j] =~ s/\tHesperoyucca\n/\tHesperoyucca {Hesperoyucca whipplei}\n/;
	$all_pars[$j] =~ s/\tHeteranthemis\n/\tHeteranthemis {Heteranthemis viscidihirta}\n/;
	$all_pars[$j] =~ s/\tHeterocodon\n/\tHeterocodon {Heterocodon rariflorum}\n/;
	$all_pars[$j] =~ s/\tHeteromeles\n/\tHeteromeles {Heteromeles arbutifolia}\n/;
	$all_pars[$j] =~ s/\tHeteropogon\n/\tHeteropogon {Heteropogon contortus}\n/;
	$all_pars[$j] =~ s/\tHippuris\n/\tHippuris {Hippuris vulgaris}\n/;
	$all_pars[$j] =~ s/\tHirschfeldia\n/\tHirschfeldia {Hirschfeldia incana}\n/;
	$all_pars[$j] =~ s/\tHollisteria\n/\tHollisteria {Hollisteria lanata}\n/;
	$all_pars[$j] =~ s/\tHolmgrenanthe\n/\tHolmgrenanthe {Holmgrenanthe petrophila}\n/;
	$all_pars[$j] =~ s/\tHolosteum\n/\tHolosteum {Holosteum umbellatum subsp. umbellatum}\n/;
	$all_pars[$j] =~ s/\tHolozonia\n/\tHolozonia {Holozonia filipes}\n/;
	$all_pars[$j] =~ s/\tHornungia\n/\tHornungia {Hornungia procumbens}\n/;
	$all_pars[$j] =~ s/\tHowellanthus\n/\tHowellanthus {Howellanthus dalesianus}\n/;
	$all_pars[$j] =~ s/\tHowellia\n/\tHowellia {Howellia aquatilis}\n/;
	$all_pars[$j] =~ s/\tHumulus\n/\tHumulus {Humulus lupulus}\n/;
	$all_pars[$j] =~ s/\tHydrilla\n/\tHydrilla {Hydrilla verticillata}\n/;
	$all_pars[$j] =~ s/\tHyparrhenia\n/\tHyparrhenia {Hyparrhenia hirta}\n/;
	$all_pars[$j] =~ s/\tIberis\n/\tIberis {Iberis umbellata}\n/;
	$all_pars[$j] =~ s/\tIdahoa\n/\tIdahoa {Idahoa scapigera}\n/;
	$all_pars[$j] =~ s/\tImperata\n/\tImperata {Imperata brevifolia}\n/;
	$all_pars[$j] =~ s/\tIonactis\n/\tIonactis {Ionactis alpina}\n/;
	$all_pars[$j] =~ s/\tIpheion\n/\tIpheion {Ipheion uniflorum}\n/;
	$all_pars[$j] =~ s/\tIsatis\n/\tIsatis {Isatis tinctoria}\n/;
	$all_pars[$j] =~ s/\tIxia\n/\tIxia {Ixia maculata}\n/; #missed by David in 2015
	$all_pars[$j] =~ s/\tJacaranda\n/\tJacaranda {Jacaranda mimosifolia}\n/; #missed by David in 2015
	$all_pars[$j] =~ s/\tJamesia\n/\tJamesia {Jamesia americana var. rosea}\n/;
	$all_pars[$j] =~ s/\tJaumea\n/\tJaumea {Jaumea carnosa}\n/;
	$all_pars[$j] =~ s/\tJohanneshowellia\n/\tJohanneshowellia {Johanneshowellia puberula}\n/;
	$all_pars[$j] =~ s/\tJusticia\n/\tJusticia {Justicia californica}\n/;
	$all_pars[$j] =~ s/\tKalmia\n/\tKalmia {Kalmia polifolia}\n/;
	$all_pars[$j] =~ s/\tKelloggia\n/\tKelloggia {Kelloggia galioides}\n/;
	$all_pars[$j] =~ s/\tKniphofia\n/\tKniphofia {Kniphofia uvaria}\n/;
	$all_pars[$j] =~ s/\tKobresia\n/\tKobresia {Kobresia myosuroides}\n/;
	$all_pars[$j] =~ s/\tKrascheninnikovia\n/\tKrascheninnikovia {Krascheninnikovia lanata}\n/;
	$all_pars[$j] =~ s/\tKyhosia\n/\tKyhosia {Kyhosia bolanderi}\n/;
	$all_pars[$j] =~ s/\tKyllinga\n/\tKyllinga {Kyllinga brevifolia}\n/;
	$all_pars[$j] =~ s/\tLadeania\n/\tLadeania {Ladeania lanceolata}\n/;
	$all_pars[$j] =~ s/\tLaennecia\n/\tLaennecia {Laennecia coulteri}\n/;
	$all_pars[$j] =~ s/\tLagunaria\n/\tLagunaria {Lagunaria patersonia}\n/;
	$all_pars[$j] =~ s/\tLagurus\n/\tLagurus {Lagurus ovatus}\n/;
	$all_pars[$j] =~ s/\tLamarckia\n/\tLamarckia {Lamarckia aurea}\n/;
	$all_pars[$j] =~ s/\tLamiastrum\n/\tLamiastrum {Lamiastrum galeobdolon}\n/;
	$all_pars[$j] =~ s/\tLandoltia\n/\tLandoltia {Landoltia punctata}\n/;
	$all_pars[$j] =~ s/\tLapsana\n/\tLapsana {Lapsana communis}\n/;
	$all_pars[$j] =~ s/\tLarrea\n/\tLarrea {Larrea tridentata}\n/;
	$all_pars[$j] =~ s/\tLasiospermum\n/\tLasiospermum {Lasiospermum bipinnatum}\n/;
	$all_pars[$j] =~ s/\tLastarriaea\n/\tLastarriaea {Lastarriaea coriacea}\n/;
	$all_pars[$j] =~ s/\tLathrocasis\n/\tLathrocasis {Lathrocasis tenerrima}\n/;
	$all_pars[$j] =~ s/\tLeersia\n/\tLeersia {Leersia oryzoides}\n/;
	$all_pars[$j] =~ s/\tLegenere\n/\tLegenere {Legenere limosa}\n/;
	$all_pars[$j] =~ s/\tLens\n/\tLens {Lens culinaris}\n/;
	$all_pars[$j] =~ s/\tLeptospermum\n/\tLeptospermum {Leptospermum laevigatum}\n/;
	$all_pars[$j] =~ s/\tLeucocrinum\n/\tLeucocrinum {Leucocrinum montanum}\n/;
	$all_pars[$j] =~ s/\tLeucojum\n/\tLeucojum {Leucojum aestivum}\n/;
	$all_pars[$j] =~ s/\tLeucothoe\n/\tLeucothoe {Leucothoe davisiae}\n/;
	$all_pars[$j] =~ s/\tLibertia\n/\tLibertia {Libertia formosa}\n/; #missed by David in 2015
	$all_pars[$j] =~ s/\tLimnobium\n/\tLimnobium {Limnobium spongia}\n/;
	$all_pars[$j] =~ s/\tLindernia\n/\tLindernia {Lindernia dubia}\n/;
	$all_pars[$j] =~ s/\tLobularia\n/\tLobularia {Lobularia maritima}\n/;
	$all_pars[$j] =~ s/\tLobularia\n/\tLobularia {Lobularia}\n/;
	$all_pars[$j] =~ s/\tLoeflingia\n/\tLoeflingia {Loeflingia squarrosa}\n/;
	$all_pars[$j] =~ s/\tLuetkea\n/\tLuetkea {Luetkea pectinata}\n/;
	$all_pars[$j] =~ s/\tLuina\n/\tLuina {Luina hypoleuca}\n/;
	$all_pars[$j] =~ s/\tLuma\n/\tLuma {Luma apiculata}\n/;
	$all_pars[$j] =~ s/\tLunaria\n/\tLunaria {Lunaria annua}\n/;
	$all_pars[$j] =~ s/\tLychnis\n/\tLychnis {Lychnis coronaria}\n/;
	$all_pars[$j] =~ s/\tLycopodiella\n/\tLycopodiella {Lycopodiella inundata}\n/;
	$all_pars[$j] =~ s/\tLycopodium\n/\tLycopodium {Lycopodium clavatum}\n/;
	$all_pars[$j] =~ s/\tLyrocarpa\n/\tLyrocarpa {Lyrocarpa coulteri}\n/;
	$all_pars[$j] =~ s/\tLysichiton\n/\tLysichiton {Lysichiton americanus}\n/;
	$all_pars[$j] =~ s/\tMachaeranthera\n/\tMachaeranthera {Machaeranthera tanacetifolia}\n/;
	$all_pars[$j] =~ s/\tMaclura\n/\tMaclura {Maclura pomifera}\n/;
	$all_pars[$j] =~ s/\tMalaxis\n/\tMalaxis {Malaxis monophyllos var. brachypoda}\n/;
	$all_pars[$j] =~ s/\tMalephora\n/\tMalephora {Malephora crocea}\n/;
	$all_pars[$j] =~ s/\tMalosma\n/\tMalosma {Malosma laurina}\n/;
	$all_pars[$j] =~ s/\tMalperia\n/\tMalperia {Malperia tenuis}\n/;
	$all_pars[$j] =~ s/\tMalvella\n/\tMalvella {Malvella leprosa}\n/;
	$all_pars[$j] =~ s/\tMarrubium\n/\tMarrubium {Marrubium vulgare}\n/;
	$all_pars[$j] =~ s/\tMatelea\n/\tMatelea {Matelea parvifolia}\n/;
	$all_pars[$j] =~ s/\tMatthiola\n/\tMatthiola {Matthiola incana}\n/;
	$all_pars[$j] =~ s/\tMaurandella\n/\tMaurandella {Maurandella antirrhiniflora}\n/;
	$all_pars[$j] =~ s/\tMauranthemum\n/\tMauranthemum {Mauranthemum paludosum}\n/;
	$all_pars[$j] =~ s/\tMaytenus\n/\tMaytenus {Maytenus boaria}\n/;
	$all_pars[$j] =~ s/\tMelissa\n/\tMelissa {Melissa officinalis}\n/;
	$all_pars[$j] =~ s/\tMenyanthes\n/\tMenyanthes {Menyanthes trifoliata}\n/;
	$all_pars[$j] =~ s/\tMenziesia\n/\tMenziesia {Menziesia ferruginea}\n/;
	$all_pars[$j] =~ s/\tMercurialis\n/\tMercurialis {Mercurialis annua}\n/;
	$all_pars[$j] =~ s/\tMicromonolepis\n/\tMicromonolepis {Micromonolepis pusilla}\n/;
	$all_pars[$j] =~ s/\tMicrosteris\n/\tMicrosteris {Microsteris gracilis}\n/;
	$all_pars[$j] =~ s/\tMitellastra\n/\tMitellastra {Mitellastra caulescens}\n/;
	$all_pars[$j] =~ s/\tModiola\n/\tModiola {Modiola caroliniana}\n/;
	$all_pars[$j] =~ s/\tMoehringia\n/\tMoehringia {Moehringia macrophylla}\n/;
	$all_pars[$j] =~ s/\tMoenchia\n/\tMoenchia {Moenchia erecta subsp. erecta}\n/;
	$all_pars[$j] =~ s/\tMonarda\n/\tMonarda {Monarda pectinata}\n/;
	$all_pars[$j] =~ s/\tMoneses\n/\tMoneses {Moneses uniflora}\n/;
	$all_pars[$j] =~ s/\tMonochoria\n/\tMonochoria {Monochoria vaginalis}\n/;
	$all_pars[$j] =~ s/\tMorella\n/\tMorella {Morella californica}\n/;
	$all_pars[$j] =~ s/\tMortonia\n/\tMortonia {Mortonia utahensis}\n/;
	$all_pars[$j] =~ s/\tMorus\n/\tMorus {Morus alba}\n/;
	$all_pars[$j] =~ s/\tMunroa\n/\tMunroa {Munroa squarrosa}\n/;
	$all_pars[$j] =~ s/\tMunzothamnus\n/\tMunzothamnus {Munzothamnus blairii}\n/;
	$all_pars[$j] =~ s/\tMyoporum\n/\tMyoporum {Myoporum laetum}\n/;
	$all_pars[$j] =~ s/\tMyrica\n/\tMyrica {Myrica hartwegii}\n/;
	$all_pars[$j] =~ s/\tMyrtus\n/\tMyrtus {Myrtus communis}\n/;
	$all_pars[$j] =~ s/\tNeoholmgrenia\n/\tNeoholmgrenia {Neoholmgrenia andina}\n/;
	$all_pars[$j] =~ s/\tNeostapfia\n/\tNeostapfia {Neostapfia colusana}\n/;
	$all_pars[$j] =~ s/\tNepeta\n/\tNepeta {Nepeta cataria}\n/;
	$all_pars[$j] =~ s/\tNerium\n/\tNerium {Nerium oleander}\n/;
	$all_pars[$j] =~ s/\tNestotus\n/\tNestotus {Nestotus stenophyllus}\n/;
	$all_pars[$j] =~ s/\tNeviusia\n/\tNeviusia {Neviusia cliftonii}\n/;
	$all_pars[$j] =~ s/\tNicandra\n/\tNicandra {Nicandra physalodes}\n/;
	$all_pars[$j] =~ s/\tNicolletia\n/\tNicolletia {Nicolletia occidentalis}\n/;
	$all_pars[$j] =~ s/\tNothochelone\n/\tNothochelone {Nothochelone nemorosa}\n/;
	$all_pars[$j] =~ s/\tNotholaena\n/\tNotholaena {Notholaena californica}\n/;
	$all_pars[$j] =~ s/\tNothoscordum\n/\tNothoscordum {Nothoscordum gracile}\n/;
	$all_pars[$j] =~ s/\tNuphar\n/\tNuphar {Nuphar polysepala}\n/;
	$all_pars[$j] =~ s/\tNuttallanthus\n/\tNuttallanthus {Nuttallanthus texanus}\n/;
	$all_pars[$j] =~ s/\tNymphoides\n/\tNymphoides {Nymphoides peltata}\n/;
	$all_pars[$j] =~ s/\tOemleria\n/\tOemleria {Oemleria cerasiformis}\n/;
	$all_pars[$j] =~ s/\tOenanthe\n/\tOenanthe {Oenanthe sarmentosa}\n/;
	$all_pars[$j] =~ s/\tOlea\n/\tOlea {Olea europaea}\n/;
	$all_pars[$j] =~ s/\tOligomeris\n/\tOligomeris {Oligomeris linifolia}\n/;
	$all_pars[$j] =~ s/\tOlneya\n/\tOlneya {Olneya tesota}\n/;
	$all_pars[$j] =~ s/\tOlsynium\n/\tOlsynium {Olsynium douglasii var. douglasii}\n/;
	$all_pars[$j] =~ s/\tOncosiphon\n/\tOncosiphon {Oncosiphon piluliferum}\n/;
	$all_pars[$j] =~ s/\tOnobrychis\n/\tOnobrychis {Onobrychis viciifolia}\n/;
	$all_pars[$j] =~ s/\tOrnithostaphylos\n/\tOrnithostaphylos {Ornithostaphylos oppositifolia}\n/;
	$all_pars[$j] =~ s/\tOrochaenactis\n/\tOrochaenactis {Orochaenactis thysanocarpha}\n/;
	$all_pars[$j] =~ s/\tOrogenia\n/\tOrogenia {Orogenia fusiformis}\n/;
	$all_pars[$j] =~ s/\tOrthilia\n/\tOrthilia {Orthilia secunda}\n/;
	$all_pars[$j] =~ s/\tOryctes\n/\tOryctes {Oryctes nevadensis}\n/;
	$all_pars[$j] =~ s/\tOryza\n/\tOryza {Oryza sativa}\n/;
	$all_pars[$j] =~ s/\tOsmadenia\n/\tOsmadenia {Osmadenia tenella}\n/;
	$all_pars[$j] =~ s/\tOttelia\n/\tOttelia {Ottelia alismoides}\n/;
	$all_pars[$j] =~ s/\tOxypolis\n/\tOxypolis {Oxypolis occidentalis}\n/;
	$all_pars[$j] =~ s/\tOxyria\n/\tOxyria {Oxyria digyna}\n/;
	$all_pars[$j] =~ s/\tOxystylis\n/\tOxystylis {Oxystylis lutea}\n/;
	$all_pars[$j] =~ s/\tPallenis\n/\tPallenis {Pallenis maritima}\n/;
	$all_pars[$j] =~ s/\tPancratium\n/\tPancratium {Pancratium maritimum}\n/;
	$all_pars[$j] =~ s/\tParthenocissus\n/\tParthenocissus {Parthenocissus inserta}\n/;
	$all_pars[$j] =~ s/\tPastinaca\n/\tPastinaca {Pastinaca sativa}\n/;
	$all_pars[$j] =~ s/\tPaxistima\n/\tPaxistima {Paxistima myrsinites}\n/;
	#$all_pars[$j] =~ s/\tPectis\n/\tPectis {Pectis papposa var. papposa}\n/;
	$all_pars[$j] =~ s/\tPeltandra\n/\tPeltandra {Peltandra virginica}\n/; #missed by David in 2015
	$all_pars[$j] =~ s/\tPeraphyllum\n/\tPeraphyllum {Peraphyllum ramosissimum}\n/;
	$all_pars[$j] =~ s/\tPericome\n/\tPericome {Pericome caudata}\n/;
	$all_pars[$j] =~ s/\tPetasites\n/\tPetasites {Petasites frigidus var. palmatus}\n/;
	$all_pars[$j] =~ s/\tPeteria\n/\tPeteria {Peteria thompsoniae}\n/;
	$all_pars[$j] =~ s/\tPetradoria\n/\tPetradoria {Petradoria pumila var. pumila}\n/;
	$all_pars[$j] =~ s/\tPetroselinum\n/\tPetroselinum {Petroselinum crispum}\n/;
	$all_pars[$j] =~ s/\tPetunia\n/\tPetunia {Petunia parviflora}\n/;
	$all_pars[$j] =~ s/\tPeucephyllum\n/\tPeucephyllum {Peucephyllum schottii}\n/;
	$all_pars[$j] =~ s/\tPhalacroseris\n/\tPhalacroseris {Phalacroseris bolanderi}\n/;
	$all_pars[$j] =~ s/\tPhaseolus\n/\tPhaseolus {Phaseolus filiformis}\n/;
	$all_pars[$j] =~ s/\tPhoenicaulis\n/\tPhoenicaulis {Phoenicaulis cheiranthoides}\n/;
	$all_pars[$j] =~ s/\tPhragmites\n/\tPhragmites {Phragmites australis}\n/;
	$all_pars[$j] =~ s/\tPhyllostachys\n/\tPhyllostachys {Phyllostachys aurea}\n/;
	$all_pars[$j] =~ s/\tPilularia\n/\tPilularia {Pilularia americana}\n/;
	$all_pars[$j] =~ s/\tPinguicula\n/\tPinguicula {Pinguicula macroceras}\n/;
	$all_pars[$j] =~ s/\tPistacia\n/\tPistacia {Pistacia atlantica}\n/;
	$all_pars[$j] =~ s/\tPistia\n/\tPistia {Pistia stratiotes}\n/;
	$all_pars[$j] =~ s/\tPisum\n/\tPisum {Pisum sativum}\n/;
	$all_pars[$j] =~ s/\tPityopus\n/\tPityopus {Pityopus californicus}\n/;
	$all_pars[$j] =~ s/\tPlanodes\n/\tPlanodes {Planodes virginica}\n/;
	$all_pars[$j] =~ s/\tPlatystemon\n/\tPlatystemon {Platystemon californicus}\n/;
	$all_pars[$j] =~ s/\tPlecostachys\n/\tPlecostachys {Plecostachys serpyllifolia}\n/;
	$all_pars[$j] =~ s/\tPleiacanthus\n/\tPleiacanthus {Pleiacanthus spinosus}\n/;
	$all_pars[$j] =~ s/\tPleuricospora\n/\tPleuricospora {Pleuricospora fimbriolata}\n/;
	$all_pars[$j] =~ s/\tPleurocoronis\n/\tPleurocoronis {Pleurocoronis pluriseta}\n/;
	$all_pars[$j] =~ s/\tPlumbago\n/\tPlumbago {Plumbago auriculata}\n/;
	$all_pars[$j] =~ s/\tPodistera\n/\tPodistera {Podistera nevadensis}\n/;
	$all_pars[$j] =~ s/\tPolanisia\n/\tPolanisia {Polanisia dodecandra subsp. trachysperma}\n/;
	$all_pars[$j] =~ s/\tPoliomintha\n/\tPoliomintha {Poliomintha incana}\n/;
	$all_pars[$j] =~ s/\tPolyctenium\n/\tPolyctenium {Polyctenium fremontii}\n/;
	$all_pars[$j] =~ s/\tPorterella\n/\tPorterella {Porterella carnosula}\n/;
	$all_pars[$j] =~ s/\tPoteridium\n/\tPoteridium {Poteridium annuum}\n/;
	$all_pars[$j] =~ s/\tPoterium\n/\tPoterium {Poterium sanguisorba}\n/;
	$all_pars[$j] =~ s/\tPrenanthella\n/\tPrenanthella {Prenanthella exigua}\n/;
	$all_pars[$j] =~ s/\tPseudorontium\n/\tPseudorontium {Pseudorontium cyathiferum}\n/;
	$all_pars[$j] =~ s/\tPseudotrillium\n/\tPseudotrillium {Pseudotrillium rivale}\n/;
	$all_pars[$j] =~ s/\tPsilostrophe\n/\tPsilostrophe {Psilostrophe cooperi}\n/;
	$all_pars[$j] =~ s/\tPtelea\n/\tPtelea {Ptelea crenulata}\n/;
	$all_pars[$j] =~ s/\tPterocarya\n/\tPterocarya {Pterocarya stenoptera}\n/; #missed by David in 2015
	$all_pars[$j] =~ s/\tPterospora\n/\tPterospora {Pterospora andromedea}\n/;
	$all_pars[$j] =~ s/\tPterostegia\n/\tPterostegia {Pterostegia drymarioides}\n/;
	$all_pars[$j] =~ s/\tPulicaria\n/\tPulicaria {Pulicaria paludosa}\n/;
	$all_pars[$j] =~ s/\tPunica\n/\tPunica {Punica granatum}\n/;
	$all_pars[$j] =~ s/\tPycnanthemum\n/\tPycnanthemum {Pycnanthemum californicum}\n/;
	$all_pars[$j] =~ s/\tPyrus\n/\tPyrus {Pyrus communis}\n/;
	$all_pars[$j] =~ s/\tRapistrum\n/\tRapistrum {Rapistrum rugosum}\n/;
	$all_pars[$j] =~ s/\tRatibida\n/\tRatibida {Ratibida columnifera}\n/;
	$all_pars[$j] =~ s/\tRhagadiolus\n/\tRhagadiolus {Rhagadiolus stellatus}\n/;
	$all_pars[$j] =~ s/\tRhodiola\n/\tRhodiola {Rhodiola integrifolia subsp. integrifolia}\n/;
	$all_pars[$j] =~ s/\tRicinus\n/\tRicinus {Ricinus communis}\n/;
	$all_pars[$j] =~ s/\tRigiopappus\n/\tRigiopappus {Rigiopappus leptocladus}\n/;
	$all_pars[$j] =~ s/\tRomulea\n/\tRomulea {Romulea rosea var. australis}\n/;
	$all_pars[$j] =~ s/\tRuta\n/\tRuta {Ruta chalepensis}\n/;
	$all_pars[$j] =~ s/\tSaccharum\n/\tSaccharum {Saccharum ravennae}\n/;
	$all_pars[$j] =~ s/\tSalpichroa\n/\tSalpichroa {Salpichroa origanifolia}\n/;
	$all_pars[$j] =~ s/\tSanguisorba\n/\tSanguisorba {Sanguisorba officinalis}\n/;
	$all_pars[$j] =~ s/\tSantolina\n/\tSantolina {Santolina chamaecyparissus}\n/;
	$all_pars[$j] =~ s/\tSanvitalia\n/\tSanvitalia {Sanvitalia abertii}\n/;
	$all_pars[$j] =~ s/\tSaponaria\n/\tSaponaria {Saponaria officinalis}\n/;
	$all_pars[$j] =~ s/\tSarcodes\n/\tSarcodes {Sarcodes sanguinea}\n/;
	$all_pars[$j] =~ s/\tSarracenia\n/\tSarracenia {Sarracenia purpurea}\n/;
	$all_pars[$j] =~ s/\tSaussurea\n/\tSaussurea {Saussurea americana}\n/;
	$all_pars[$j] =~ s/\tSaxifragopsis\n/\tSaxifragopsis {Saxifragopsis fragarioides}\n/;
	$all_pars[$j] =~ s/\tScandix\n/\tScandix {Scandix pecten-veneris}\n/;
	$all_pars[$j] =~ s/\tSceptridium\n/\tSceptridium {Sceptridium multifidum}\n/;
	$all_pars[$j] =~ s/\tSchoenus\n/\tSchoenus {Schoenus nigricans}\n/;
	$all_pars[$j] =~ s/\tScleranthus\n/\tScleranthus {Scleranthus annuus subsp. annuus}\n/;
	$all_pars[$j] =~ s/\tSclerochloa\n/\tSclerochloa {Sclerochloa dura}\n/;
	$all_pars[$j] =~ s/\tSclerolinon\n/\tSclerolinon {Sclerolinon digynum}\n/;
	$all_pars[$j] =~ s/\tScleropogon\n/\tScleropogon {Scleropogon brevifolius}\n/;
	$all_pars[$j] =~ s/\tScoliopus\n/\tScoliopus {Scoliopus bigelovii}\n/;
	$all_pars[$j] =~ s/\tScolymus\n/\tScolymus {Scolymus hispanicus}\n/;
	$all_pars[$j] =~ s/\tScopulophila\n/\tScopulophila {Scopulophila rixfordii}\n/;
	$all_pars[$j] =~ s/\tScorzonera\n/\tScorzonera {Scorzonera hispanica}\n/;
	$all_pars[$j] =~ s/\tScribneria\n/\tScribneria {Scribneria bolanderi}\n/;
	$all_pars[$j] =~ s/\tSearsia\n/\tSearsia {Searsia lancea}\n/;
	$all_pars[$j] =~ s/\tSecale\n/\tSecale {Secale cereale}\n/;
	$all_pars[$j] =~ s/\tSenegalia\n/\tSenegalia {Senegalia greggii}\n/;
	$all_pars[$j] =~ s/\tSequoia\n/\tSequoia {Sequoia sempervirens}\n/;
	$all_pars[$j] =~ s/\tSequoiadendron\n/\tSequoiadendron {Sequoiadendron giganteum}\n/;
	$all_pars[$j] =~ s/\tSesuvium\n/\tSesuvium {Sesuvium verrucosum}\n/;
	$all_pars[$j] =~ s/\tSherardia\n/\tSherardia {Sherardia arvensis}\n/;
	$all_pars[$j] =~ s/\tSibaropsis\n/\tSibaropsis {Sibaropsis hammittii}\n/;
	$all_pars[$j] =~ s/\tSibbaldia\n/\tSibbaldia {Sibbaldia procumbens}\n/;
	$all_pars[$j] =~ s/\tSilybum\n/\tSilybum {Silybum marianum}\n/;
	$all_pars[$j] =~ s/\tSium\n/\tSium {Sium suave}\n/;
	$all_pars[$j] =~ s/\tSmelowskia\n/\tSmelowskia {Smelowskia ovalis}\n/;
	$all_pars[$j] =~ s/\tSoleirolia\n/\tSoleirolia {Soleirolia soleirolii}\n/;
	$all_pars[$j] =~ s/\tSoliva\n/\tSoliva {Soliva sessilis}\n/;
	$all_pars[$j] =~ s/\tSpartium\n/\tSpartium {Spartium junceum}\n/;
	$all_pars[$j] =~ s/\tSpergula\n/\tSpergula {Spergula arvensis}\n/;
	$all_pars[$j] =~ s/\tSpermolepis\n/\tSpermolepis {Spermolepis echinata}\n/;
	$all_pars[$j] =~ s/\tSphaerophysa\n/\tSphaerophysa {Sphaerophysa salsula}\n/;
	$all_pars[$j] =~ s/\tSphenopholis\n/\tSphenopholis {Sphenopholis obtusata}\n/;
	$all_pars[$j] =~ s/\tSphenosciadium\n/\tSphenosciadium {Sphenosciadium capitellatum}\n/;
	$all_pars[$j] =~ s/\tSpirodela\n/\tSpirodela {Spirodela polyrhiza}\n/;
	$all_pars[$j] =~ s/\tStemodia\n/\tStemodia {Stemodia durantifolia}\n/;
	$all_pars[$j] =~ s/\tStenanthium\n/\tStenanthium {Stenanthium occidentale}\n/;
	$all_pars[$j] =~ s/\tStenotaphrum\n/\tStenotaphrum {Stenotaphrum secundatum}\n/;
	$all_pars[$j] =~ s/\tStreptanthella\n/\tStreptanthella {Streptanthella longirostris}\n/;
	$all_pars[$j] =~ s/\tStreptopus\n/\tStreptopus {Streptopus amplexifolius var. americanus}\n/;
	$all_pars[$j] =~ s/\tStrigosella\n/\tStrigosella {Strigosella africana}\n/;
	$all_pars[$j] =~ s/\tStutzia\n/\tStutzia {Stutzia covillei}\n/;
	$all_pars[$j] =~ s/\tSwallenia\n/\tSwallenia {Swallenia alexandrae}\n/;
	$all_pars[$j] =~ s/\tSwertia\n/\tSwertia {Swertia perennis}\n/;
	$all_pars[$j] =~ s/\tSyagrus\n/\tSyagrus {Syagrus romanzoffiana}\n/;
	$all_pars[$j] =~ s/\tSystenotheca\n/\tSystenotheca {Systenotheca vortriedei}\n/;
	$all_pars[$j] =~ s/\tSyzygium\n/\tSyzygium {Syzygium australe}\n/;
	$all_pars[$j] =~ s/\tTaxus\n/\tTaxus {Taxus brevifolia}\n/;
	$all_pars[$j] =~ s/\tTellima\n/\tTellima {Tellima grandiflora}\n/;
	$all_pars[$j] =~ s/\tTetragonia\n/\tTetragonia {Tetragonia tetragonoides}\n/;
	$all_pars[$j] =~ s/\tTetraneuris\n/\tTetraneuris {Tetraneuris acaulis var. arizonica}\n/;
	$all_pars[$j] =~ s/\tThamnosma\n/\tThamnosma {Thamnosma montana}\n/;
	$all_pars[$j] =~ s/\tThelesperma\n/\tThelesperma {Thelesperma megapotamicum}\n/;
	$all_pars[$j] =~ s/\tThlaspi\n/\tThlaspi {Thlaspi arvense}\n/;
	$all_pars[$j] =~ s/\tThuja\n/\tThuja {Thuja plicata}\n/;
	$all_pars[$j] =~ s/\tTolmiea\n/\tTolmiea {Tolmiea diplomenziesii}\n/;
	$all_pars[$j] =~ s/\tTolpis\n/\tTolpis {Tolpis barbata}\n/;
	$all_pars[$j] =~ s/\tTonella\n/\tTonella {Tonella tenella}\n/;
	$all_pars[$j] =~ s/\tTorreya\n/\tTorreya {Torreya californica}\n/;
	$all_pars[$j] =~ s/\tToxicodendron\n/\tToxicodendron {Toxicodendron diversilobum}\n/;
	$all_pars[$j] =~ s/\tTracyina\n/\tTracyina {Tracyina rostrata}\n/;
	$all_pars[$j] =~ s/\tTragia\n/\tTragia {Tragia ramosa}\n/;
	$all_pars[$j] =~ s/\tTrautvetteria\n/\tTrautvetteria {Trautvetteria caroliniensis}\n/;
	$all_pars[$j] =~ s/\tTriadica\n/\tTriadica {Triadica sebifera}\n/;
	$all_pars[$j] =~ s/\tTrianthema\n/\tTrianthema {Trianthema portulacastrum}\n/;
	$all_pars[$j] =~ s/\tTribulus\n/\tTribulus {Tribulus terrestris}\n/;
	$all_pars[$j] =~ s/\tTricardia\n/\tTricardia {Tricardia watsonii}\n/;
	$all_pars[$j] =~ s/\tTrichocoronis\n/\tTrichocoronis {Trichocoronis wrightii var. wrightii}\n/;
	$all_pars[$j] =~ s/\tTrichoptilium\n/\tTrichoptilium {Trichoptilium incisum}\n/;
	$all_pars[$j] =~ s/\tTripleurospermum\n/\tTripleurospermum {Tripleurospermum inodorum}\n/;
	$all_pars[$j] =~ s/\tTriticum\n/\tTriticum {Triticum aestivum}\n/;
	$all_pars[$j] =~ s/\tTrixis\n/\tTrixis {Trixis californica var. californica}\n/;
	$all_pars[$j] =~ s/\tTuberaria\n/\tTuberaria {Tuberaria guttata}\n/;
	$all_pars[$j] =~ s/\tTulipa\n/\tTulipa {Tulipa clusiana}\n/;
	$all_pars[$j] =~ s/\tTurritis\n/\tTurritis {Turritis glabra}\n/;
	$all_pars[$j] =~ s/\tUlex\n/\tUlex {Ulex europaeus}\n/;
	$all_pars[$j] =~ s/\tUropappus\n/\tUropappus {Uropappus lindleyi}\n/;
	$all_pars[$j] =~ s/\tUrospermum\n/\tUrospermum {Urospermum picroides}\n/;
	$all_pars[$j] =~ s/\tVaccaria\n/\tVaccaria {Vaccaria hispanica}\n/;
	$all_pars[$j] =~ s/\tVahlodea\n/\tVahlodea {Vahlodea atropurpurea}\n/;
	$all_pars[$j] =~ s/\tVelezia\n/\tVelezia {Velezia rigida}\n/;
	$all_pars[$j] =~ s/\tVenegasia\n/\tVenegasia {Venegasia carpesioides}\n/;
	$all_pars[$j] =~ s/\tVentenata\n/\tVentenata {Ventenata dubia}\n/;
	$all_pars[$j] =~ s/\tViguiera\n/\tViguiera {Viguiera purisimae}\n/;
	$all_pars[$j] =~ s/\tVinca\n/\tVinca {Vinca major}\n/;
	$all_pars[$j] =~ s/\tViscum\n/\tViscum {Viscum album}\n/;
	$all_pars[$j] =~ s/\tVolutaria\n/\tVolutaria {Volutaria muricata}\n/;
	$all_pars[$j] =~ s/\tWhipplea\n/\tWhipplea {Whipplea modesta}\n/;
	$all_pars[$j] =~ s/\tWigandia\n/\tWigandia {Wigandia urens}\n/;
	$all_pars[$j] =~ s/\tWoodwardia\n/\tWoodwardia {Woodwardia fimbriata}\n/;
	$all_pars[$j] =~ s/\tXerophyllum\n/\tXerophyllum {Xerophyllum tenax}\n/;
	$all_pars[$j] =~ s/\tXylococcus\n/\tXylococcus {Xylococcus bicolor}\n/;
	$all_pars[$j] =~ s/\tYabea\n/\tYabea {Yabea microcarpa}\n/;
	$all_pars[$j] =~ s/\tZantedeschia\n/\tZantedeschia {Zantedeschia aethiopica}\n/;
	$all_pars[$j] =~ s/\tZygophyllum\n/\tZygophyllum {Zygophyllum fabago}\n/;
	#print "After: $all_pars[$j]\n";
	
	
	
	}
	
	#Hydrocotyle (treated in araliaceae)
	#Botrychium simplex or b. pumicola (small or shade pls, see couplet 3 to separate the species)
	#Botrychium crenulatum(sun plants)
	#Galenia==>Galenia {Galenia pubescens} #this needs to link to the eflora page for Aizoaceae since it is a waif-noted name and does not have its own page
	#Orogenia {Orogenia fusiformis} #no longer is a valid genus, this is a Lomatium
	#Sphenosciadium {Sphenosciadium capitellatum} #same, but this is an Angelica
	
	
	
		print GGR join("\n",@all_pars);
	
	
	close(IN);
	close(GGR);
	
	
	print <<EOP;
	Names converted: $found2
	Subtaxa converted: $found3
	Grass Names converted: $found4
	 TOTAL LINES: $found1
	
	EOP
	
	local $/ = '';
	open( my $file, "<", "keybase/keybase_keys_genus_groups_processed.txt" );
	open( my $output, ">", "keybase/pre-match-gen" ) or die $!;
	
	my $found4;
	my $found1;
	my $found2;
	my $found3;
	
	
	while ( my $line = <$file> ) {
	
	
	
	    if ( $line =~ m/([A-Z][a-z]+ Group \d+):.+/g ) {
	        my $output_name = $1;
	        $output_name =~ s/ /_/g;
	        $line =~ s/^[A-Z][a-z]+ Group \d+:.+\n//g;
	        $line =~ s/^Group \d+:.+\n//g;
	        $line =~ s/^\n//g; #remove blank lines and beginning and end
	        $line =~ s/\n$//g;
	
	print "$output_name\n";
	++$found1;
	        close($output);
	        open( $output, ">", "keybase/".$output_name.".txt" ) or die $!;
	    }
	    elsif ( $line =~ m/([A-Z][a-z]+ Group \d+[A-Z]):.+/g ) {
	        my $output_name = $1;
	        $output_name =~ s/ /_/g;
	        $line =~ s/^[A-Z][a-z]+ Group \d+.:.+\n//g;
	        $line =~ s/^Group \d+.:.+\n//g;
	        $line =~ s/^\n//g; #remove blank lines and beginning and end
	        $line =~ s/\n$//g;
	
	print "$output_name\n";
	++$found2;
	        close($output);
	        open( $output, ">", "keybase/".$output_name.".txt" ) or die $!;
	    }
	    elsif ( $line =~ m/([A-Z][a-z]+ Group \d+):?/g ) {
	        my $output_name = $1;
	        $output_name =~ s/ /_/g;
	        $line =~ s/^[A-Z][a-z]+ Group \d+:.*\n//g;
	        $line =~ s/^Group \d+:.*\n//g;
	        $line =~ s/^\n//g; #remove blank lines and beginning and end
	        $line =~ s/\n$//g;
	
	print "$output_name\n";
	++$found1;
	        close($output);
	        open( $output, ">", "keybase/".$output_name.".txt" ) or die $!;
	    }
	    elsif ($line =~ m/([A-Za-z]+ [0-9A-Za-z ]+)/g) {
	        my $output_name = $1;
	        $output_name =~ s/ /_/g;
	        #$line =~ s/^[A-Za-z]+.*\n//g;
	        $line =~ s/^\n//g; #remove blank lines and beginning and end
	        $line =~ s/\n$//g;
	print $line."\n\n";
	print "$output_name\n";
	++$found3;
	        close($output);
	        open( $output, ">", "keybase/".$output_name.".txt" ) or die $!;
	    }
	
	    print {$output} $line;
		++$found4;
	
	}
	
	
	print <<EOP;
	Keybase within-Genus Group files
	Keys with Genus Group digit converted: $found1
	Keys with Genus Group digit+letter converted: $found2
	
	Keys Unconverted: $found3
	
	 TOTAL LINES: $found4
	
	EOP
	