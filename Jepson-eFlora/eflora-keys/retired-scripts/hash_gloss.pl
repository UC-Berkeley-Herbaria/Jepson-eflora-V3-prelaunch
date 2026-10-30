%plural=(
"cypsela","cypselae",
"corolla","corollas",
"stigma","stigmas",
"lemma","lemmas",
"savanna","savannas",
"placenta","placentas",
"rib","ribs",
"bulb","bulbs",
"limb","limbs",
"herb","herbs",
"scrub","scrubs",
"coastal scrub","coastal scrubs",
"shrub","shrubs",
"subshrub","subshrubs",
"pollen sac","pollen sacs",
"head","heads",
"discoid head","discoid heads",
"radiate head","radiate heads",
"disciform head","disciform heads",
"liguliflorous head","liguliflorous heads",
"radiant head","radiant heads",
"woodland","woodlands",
"foothill woodland","foothill woodlands",
"closed-cone conifer forest or woodland","closed-cone conifer forest or woodlands",
"desert woodland","desert woodlands",
"grassland","grasslands",
"peatland","peatlands",
"coastal strand","coastal strands",
"subtend","subtends",
"wood","woods",
"bud","buds",
"lobe","lobes",
"tube","tubes",
"inflorescence","inflorescences",
"blade","blades",
"intergrade","intergrades",
"node","nodes",
"staminode","staminodes",
"internode","internodes",
"scree","screes",
"tree","trees",
"herbage","herbages",
"spike","spikes",
"scale","scales",
"receptacle","receptacles",
"follicle","follicles",
"panicle","panicles",
"utricle","utricles",
"auricle","auricles",
"peduncle","peduncles",
"tubercle","tubercles",
"needle","needles",
"prickle","prickles",
"areole","areoles",
"petiole","petioles",
"bristle","bristles",
"ligule","ligules",
"pinnule","pinnules",
"stipule","stipules",
"capsule","capsules",
"ovule","ovules",
"style","styles",
"raceme","racemes",
"pome","pomes",
"rhizome","rhizomes",
"legume","legumes",
"glume","glumes",
"cyme","cymes",
"achene","achenes",
"timberline","timberlines",
"spine","spines",
"vine","vines",
"cone","cones",
"clone","clones",
"stone","stones",
"dune","dunes",
"stipe","stipes",
"drupe","drupes",
"involucre","involucres",
"spore","spores",
"sculpture","sculptures",
"suture","sutures",
"waif","waifs",
"twig","twigs",
"wing","wings",
"sheath","sheaths",
"perianth","perianths",
"beak","beaks",
"rank","ranks",
"alkali sink","alkali sinks",
"disk","disks",
"umbel","umbels",
"pedicel","pedicels",
"lenticel","lenticels",
"involucel","involucels",
"keel","keels",
"carpel","carpels",
"aril","arils",
"tendril","tendrils",
"pistil","pistils",
"axil","axils",
"foothill","foothills",
"vernal pool","vernal pools",
"stem","stems",
"angiosperm","angiosperms",
"gymnosperm","gymnosperms",
"corm","corms",
"alluvial fan","alluvial fans",
"stamen","stamens",
"vein","veins",
"margin","margins",
"catkin","catkins",
"column","columns",
"cotyledon","cotyledons",
"stolon","stolons",
"thorn","thorns",
"awn","awns",
"lip","lips",
"swamp","swamps",
"mericarp","mericarps",
"chamber","chambers",
"tuber","tubers",
"anther","anthers",
"banner","banners",
"flower","flowers",
"ligulate flower","ligulate flowers",
"disk flower","disk flowers",
"ray flower","ray flowers",
"hair","hairs",
"bur","burs",
"spur","spurs",
"peat","peats",
"throat","throats",
"habitat","habitats",
"bract","bracts",
"bulblet","bulblets",
"spikelet","spikelets",
"leaflet","leaflets",
"bractlet","bractlets",
"nutlet","nutlets",
"floret","florets",
"habit","habits",
"fruit","fruits",
"filament","filaments",
"segment","segments",
"shoot","shoots",
"root","roots",
"taproot","taproots",
"perianth part","perianth parts",
"desert","deserts",
"forest","forests",
"redwood forest","redwood forests",
"mixed-evergreen forest","mixed-evergreen forests",
"conifer forest","conifer forests",
"nut","nuts",
"claw","claws",
"meadow","meadows",
"ray","rays",
);



print << 'EOP';
use BerkeleyDB;
$filename="IJM.hash";
tie %h, "BerkeleyDB::Hash",
                -Filename => $filename,
                -Flags    => DB_CREATE
        or die "Cannot open file $filename: $! $BerkeleyDB::Error\n" ;

while(($key,$value)=each(%h)){
	foreach($value){
#print "$_\n";
		@contents=split(/\n/,$_);
		foreach $i (0 .. $#contents){
			$_=$contents[$i];
			if(m/:<\/b>/ || m/<blockquote>/){
				@words=split(/ /,$_);
					foreach(@words){
EOP

open(IN, "IJM_glossary.html") || die;
#<dt><a name="sheath">sheath.</a></dt><dd> Surrounding or partially surrounding, often tubular structure or part of a structure, such as a leaf base in Apiaceae or Poaceae.</dd>
while(<IN>){
if(m/<dt>.*">(.*)\.<\/a>.*<dd> *(.*)[ .]*<\/dd>/){
$term=$1; $def=$2;
$def=~s/"/\\"/g;
$def=~s/\(see [^)]+\)//g;
$def=~s/<\/?em>//g;
#$def=~s!([^<])/!$1\\/!g;
if($term=~m/(.*) \((.*), (.*)\)/){
$GLOSS{$1}=$def;
$GLOSS{$2}=$def;
$GLOSS{$3}=$def;
}
elsif($term=~m/(.*) \((.*)\)/){
$GLOSS{$1}=$def;
$GLOSS{$2}=$def;
}
elsif($term=~m/(.*), (.*)/){
$GLOSS{$1}=$def;
$GLOSS{$2}=$def;
}
else{
$GLOSS{$term}=$def;
}
}
else{
#print $_
}
}
foreach(sort(keys(%GLOSS))){
$GLOSS{$_}=~s/([\[\]()])/\\$1/g;
print <<EOP;
next if s!\\b$_\\b!<span title="$GLOSS{$_}">$_</span>!;
EOP
if($plural{$_}){
print <<EOP;
next if s!\\b$plural{$_}\\b!<span title="$GLOSS{$_}">$plural{$_}</span>!;
EOP
}
}
print <<'EOP';

}
$contents=join(" ",@words);
$contents[$i]=$contents;
}
}
$value=join("\n",@contents);
$value=~s/<span/\n<span/g;
print "$value\n";
}
}

EOP
