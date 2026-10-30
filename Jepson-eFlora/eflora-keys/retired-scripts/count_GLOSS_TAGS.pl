use strict;
#use warnings;
 
 
my %count;
#usr/bin/perl


my $file = shift or die "Usage: $0 FILE\n";
open my $fh, "<", $file or die "Could not open '$file'$!";
open(OUTPUT, ">WordFreqs.txt");
my $w;
my $word;

my $list = "abaxial|achene|achenes|acidic|acuminate|acute|adaxial|adherent|adventitious|alien|alkali|alkaline|alluvial|alpine|alternate|angiosperm|angiosperms|annual|annuli|annulus|anther|anthers|apogamous|appressed|aquatic|areole|areoles|aril|arils|armed|ascending|asymmetric|auricle|auricles|awn|awns|axes|axil|axile|axillary|axils|axis|banner|barbed|bark|basal|beak|beaks|berry|biennial|bilateral|biradial|bisexual|blade|blades|brackish|bract|bractlet|bractlets|bracts|bristle|bristles|bud|buds|bulb|bulblet|bulblets|bulbs|bur|callus|calyx|canescent|capsule|capsules|carpel|carpels|cartilaginous|catkin|catkins|caudex|caudices|cauline|cespitose|chamber|chambers|chaparral|ciliate|circumboreal|circumscissile|claw|claws|cleistogamous|clone|clones|closed-cone forest|coastal redwood|coastal scrub|coastal strand|collar|collars|column|columns|compound|compressed|concave|cone|cones|conic|coniferous forest|continuous|convex|cordate|corm|corms|corolla|corollas|costa|costule|costulet|cotyledon|cotyledons|crenate|cylindric|cyme|cymes|deciduous|decumbent|decurrent|dehiscent|deltate|dense|dentate|depressed|desert|digitate|dioecious|diploid|disciform head|discoid head|disk flower|disk flowers|dissected|distal|distally|drupe|drupes|dune|dunes|elliptic|emergent|endemic|entire|ephemeral|epidermis|epipetalous|erect|estuarine|evergreen|exceeding|exserted|extant|extinct|extirpated|exudate|fertile|fibrous|filament|filaments|fleshy|floret|florets|follicle|follicles|foothill|foothills|forked|free-central|free|fringed|frond|fruit stalk|fruit|fruits|funnel-shaped|fused|fusiform|glabrous|gland|glands|glandular|glaucous|glume|glumes|graduated|granular|grassland|grasslands|gymnosperm|gymnosperms|habit|habitat|habitats|habits|hair|hairs|haploid|hastate|head|heads|hemispheric|herb|herbaceous|herbage|herbs|heterostylous|hypanthia|hypanthium|included|indehiscent|indusia|indusium|inferior|inflorescence|inflorescences|infraspecific|intergrade|intermediate|internode|internodes|interrupted|intertidal|involucel|involucre|involucres|keel|keeled|keels|lamina|laminae|lanceolate|lateral|leaf|leaflet|leaflets|leaves|legume|legumes|lemma|lemmas|lenticel|lenticels|lenticular|ligulate flower|ligule|ligules|liguliflorous|limb|limbs|linear|lip|lips|lobe|lobes|loculicidal|longitudinal|margin|margins|marsh|marshes|meadow|meadows|membranous|mericarp|mixed-evergreen forest|monoecious|monolete spore|montane|mucro|mucronate|native|naturalized|nectar|nectaries|nectary|needle|needles|node|nodes|nut|nutlet|nutlets|nuts|oblique|oblong|obtuse|ocrea|ocreae|open|opposite|ovaries|ovary stalk|ovary|ovate|ovoid|ovule|ovules|palea|paleae|paleate|palmate|palmately|panicle|panicles|papillate|pappus|parasite|parasites|parietal|parietally|peat|peatland|peatlands|pedicel|pedicels|peduncle|peduncles|peltate|pendent|perennial|perianth part|perianth|perianths|perigynium|persistent|petal|petals|petiole|petioles|phyllaries|phyllary|pinna|pinnae|pinnate|pinnately|pinnule|pinnules|pinnulet|pistil|pistillate|pistils|placenta|placentas|planoconvex|pleated|plumose|pollen|pollination|pollinia|pollinium|polyploid|pome|prickle|prickles|prostrate|protandrous|protogynous|proximal|proximally|puberulent|raceme|racemes|rachides|rachis|radial|radiant|radiate|rank|ranked|ranks|rare|ray flower|rayed|rays|receptacle|receptacles|recurved|reduced|reflexed|reniform|rhizome|rhizomes|rib|ribbed|ribs|riparian|root|roots|rosette|rosettes|rotate|ruderal|sagittate|salverform|savanna|scabrous|scale|scales|scapose|scar|scarious|scars|scree|scrub|sculpture|seed|seeds|segment|segments|sepal|sepals|septa|septicidal|septum|series|serpentine|serpentinitic|serrate|sessile|sheath|sheaths|shoot|shoots|shrub|shrubs|simple|sinus|sori|sorus|spheric|spike|spikelet|spikelets|spikes|spine|spines|sporangia|sporangium|spore|spores|spreading|spur|spurs|stamen|stamens|staminate|staminode|staminodes|stellate|stem|stems|sterile|stigma|stigmas|stigmata|stipe|stipes|stipule|stipules|stolon|stolons|stoma|stoma|stomata|stomate|stone|stones|stout|striate|strigose|style|styles|subalpine|submersed|subshrub|subshrubs|subtend|subtidal|superior|suture|sutures|swamp|swamps|talus|tapered|taproot|taproots|taxa|taxon|teeth|tendril|tendrils|terminal|ternate|thorn|thorns|throat|throats|timberline|tomentose|tooth|transverse|tree|trees|trilete spore|trophophore|truncate|tube|tuber|tubercle|tubercles|tubers|tubes|twig|twigs|twining|ultimate|umbel|umbels|understory|unisexual|urn-shaped|utricle|utricles|valve|valves|vascular|vein|veins|vernal pool|vernal pools|vestigial|vine|vines|waif|waifs|wash|washes|whorl|whorled|wing|wings|wiry|wood|woodland|woodlands|woody|Abaxial|Achene|Achenes|Acidic|Acuminate|Acute|Adaxial|Adherent|Adventitious|Alien|Alkali|Alkaline|Alluvial|Alpine|Alternate|Angiosperm|Angiosperms|Annual|Annuli|Annulus|Anther|Anthers|Apogamous|Appressed|Aquatic|Areole|Areoles|Aril|Arils|Armed|Ascending|Asymmetric|Auricle|Auricles|Awn|Awns|Axes|Axil|Axile|Axillary|Axils|Axis|Banner|Barbed|Bark|Basal|Beak|Beaks|Berry|Biennial|Bilateral|Biradial|Bisexual|Blade|Blades|Brackish|Bract|Bractlet|Bractlets|Bracts|Bristle|Bristles|Bud|Buds|Bulb|Bulblet|Bulblets|Bulbs|Bur|Callus|Calyx|Canescent|Capsule|Capsules|Carpel|Carpels|Cartilaginous|Catkin|Catkins|Caudex|Caudices|Cauline|Cespitose|Chamber|Chambers|Chaparral|Ciliate|Circumboreal|Circumscissile|Claw|Claws|Cleistogamous|Clone|Clones|Closed-cone forest|Coastal redwood|Coastal scrub|Coastal strand|Collar|Collars|Column|Columns|Compound|Compressed|Concave|Cone|Cones|Conic|Coniferous forest|Continuous|Convex|Cordate|Corm|Corms|Corolla|Corollas|Costa|Costule|Costulet|Cotyledon|Cotyledons|Crenate|Cylindric|Cyme|Cymes|Deciduous|Decumbent|Decurrent|Dehiscent|Deltate|Dense|Dentate|Depressed|Desert|Digitate|Dioecious|Diploid|Disciform head|Discoid head|Disk flower|Disk flowers|Dissected|Distal|Distally|Drupe|Drupes|Dune|Dunes|Elliptic|Emergent|Endemic|Entire|Ephemeral|Epidermis|Epipetalous|Erect|Estuarine|Evergreen|Exceeding|Exserted|Extant|Extinct|Extirpated|Exudate|Fertile|Fibrous|Filament|Filaments|Fleshy|Floret|Florets|Follicle|Follicles|Foothill|Foothills|Forked|Free-central|Free|Fringed|Frond|Fruit stalk|Fruit|Fruits|Funnel-shaped|Fused|Fusiform|Glabrous|Gland|Glands|Glandular|Glaucous|Glume|Glumes|Graduated|Granular|Grassland|Grasslands|Gymnosperm|Gymnosperms|Habit|Habitat|Habitats|Habits|Hair|Hairs|Haploid|Hastate|Head|Heads|Hemispheric|Herb|Herbaceous|Herbage|Herbs|Heterostylous|Hypanthia|Hypanthium|Included|Indehiscent|Indusia|Indusium|Inferior|Inflorescence|Inflorescences|Infraspecific|Intergrade|Intermediate|Internode|Internodes|Interrupted|Intertidal|Involucel|Involucre|Involucres|Keel|Keeled|Keels|Lamina|Laminae|Lanceolate|Lateral|Leaf|Leaflet|Leaflets|Leaves|Legume|Legumes|Lemma|Lemmas|Lenticel|Lenticels|Lenticular|Ligulate flower|Ligule|Ligules|Liguliflorous|Limb|Limbs|Linear|Lip|Lips|Lobe|Lobes|Loculicidal|Longitudinal|Margin|Margins|Marsh|Marshes|Meadow|Meadows|Membranous|Mericarp|Mixed-evergreen forest|Monoecious|Monolete spore|Montane|Mucro|Mucronate|Native|Naturalized|Nectar|Nectaries|Nectary|Needle|Needles|Node|Nodes|Nut|Nutlet|Nutlets|Nuts|Oblique|Oblong|Obtuse|Ocrea|Ocreae|Open|Opposite|Ovaries|Ovary stalk|Ovary|Ovate|Ovoid|Ovule|Ovules|Palea|Paleae|Paleate|Palmate|Palmately|Panicle|Panicles|Papillate|Pappus|Parasite|Parasites|Parietal|Parietally|Peat|Peatland|Peatlands|Pedicel|Pedicels|Peduncle|Peduncles|Peltate|Pendent|Perennial|Perianth part|Perianth|Perianths|Perigynium|Persistent|Petal|Petals|Petiole|Petioles|Phyllaries|Phyllary|Pinna|Pinnae|Pinnate|Pinnately|Pinnule|Pinnules|Pinnulet|Pistil|Pistillate|Pistils|Placenta|Placentas|Planoconvex|Pleated|Plumose|Pollen|Pollination|Pollinia|Pollinium|Polyploid|Pome|Prickle|Prickles|Prostrate|Protandrous|Protogynous|Proximal|Proximally|Puberulent|Raceme|Racemes|Rachides|Rachis|Radial|Radiant|Radiate|Rank|Ranked|Ranks|Rare|Ray flower|Rayed|Rays|Receptacle|Receptacles|Recurved|Reduced|Reflexed|Reniform|Rhizome|Rhizomes|Rib|Ribbed|Ribs|Riparian|Root|Roots|Rosette|Rosettes|Rotate|Ruderal|Sagittate|Salverform|Savanna|Scabrous|Scale|Scales|Scapose|Scar|Scarious|Scars|Scree|Scrub|Sculpture|Seed|Seeds|Segment|Segments|Sepal|Sepals|Septa|Septicidal|Septum|Series|Serpentine|Serpentinitic|Serrate|Sessile|Sheath|Sheaths|Shoot|Shoots|Shrub|Shrubs|Simple|Sinus|Sori|Sorus|Spheric|Spike|Spikelet|Spikelets|Spikes|Spine|Spines|Sporangia|Sporangium|Spore|Spores|Spreading|Spur|Spurs|Stamen|Stamens|Staminate|Staminode|Staminodes|Stellate|Stem|Stems|Sterile|Stigma|Stigmas|Stigmata|Stipe|Stipes|Stipule|Stipules|Stolon|Stolons|Stoma|Stoma|Stomata|Stomate|Stone|Stones|Stout|Striate|Strigose|Style|Styles|Subalpine|Submersed|Subshrub|Subshrubs|Subtend|Subtidal|Superior|Suture|Sutures|Swamp|Swamps|Talus|Tapered|Taproot|Taproots|Taxa|Taxon|Teeth|Tendril|Tendrils|Terminal|Ternate|Thorn|Thorns|Throat|Throats|Timberline|Tomentose|Tooth|Transverse|Tree|Trees|Trilete spore|Trophophore|Truncate|Tube|Tuber|Tubercle|Tubercles|Tubers|Tubes|Twig|Twigs|Twining|Ultimate|Umbel|Umbels|Understory|Unisexual|Urn-shaped|Utricle|Utricles|Valve|Valves|Vascular|Vein|Veins|Vernal pool|Vernal pools|Vestigial|Vine|Vines|Waif|Waifs|Wash|Washes|Whorl|Whorled|Wing|Wings|Wiry|Wood|Woodland|Woodlands|Woody";

while(<$fh>){
   my @words = split(/\s+/);
   foreach my $word (@words){
   			if ($word =~ m/ ?woodland[ ,;<]+/){
   				print "q";
   			}
            if($word =~ m/ ?($list)[ ,;<]+/){
				#$word = $1;
      		$count{$word}++;
			#print $1,"\n";
      		}
   }

   #print "$w occurs $count{$w} times\n";

}
foreach $word (sort keys %count) {
   print OUTPUT "$word occurs $count{$word} times\n";
}

close ($fh);
close (OUTPUT);




#my $fh = "count_results.txt";
#my $file = shift or die "Usage: $0 FILE\n";
#open my $fh, '<', $file or die "Could not open '$file'$!";
#while (my $line = <$fh>) {
#    chomp $line;
#my $str= @strings;
  
#    foreach my $lne (split /\s+/, $line) {
#			if ($lne =~ m/$str([,;<]*)/){
#				print $lne;
#	        	$count{$lne}++;
#    		}
		
#	}
#}
 
#foreach my $lne (sort keys %count) {
#    printf $lne,"==>",$count{$lne};
#}
