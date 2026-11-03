
#$file="input/eflora_family_keys_expanded-SQL.txt";

$file="input/eflora_keys_expanded-SQL.txt";

$file_expanded="output/eflora_keys_expanded-SQL.html";
#$file_expanded="output/eflora_family_keys_expanded-SQL.html";


open(IN, "../Synonymy/input/smasch_taxon_ids.txt") || die;
while(<IN>){
	chomp;
	s/X /&times;/;
next if (m/^#/);
	($code,$name)=split(/\t/);
	$NAME_TO_CODE{$name}=$code;
	$CODE_TO_NAME{$code}=$name;
	
}
close(IN);


open(OUT, ">", $file_expanded) || die;

open(my $fh_in, '<:encoding(UTF-8)', $file) or die "CRITICAL: Could not open '$file' for reading: $!";
warn "Processing file: $file\n";

while (my $line = <$fh_in>) {
    chomp($line);




if ($line =~ s|<<1>>Abaxial<<1>>|<span class="term-trigger" tabindex="0">Abaxial<span class="term-popup">The side or surface of a structure away from the axis on which the structure is borne (e.g., the lower surface of a leaf, the outer surface of a petal).</span></span>|g){ }

if ($line =~ s| <<1>>abaxial<<1>>|&nbsp;<span class="term-trigger" tabindex="0">abaxial<span class="term-popup">The side or surface of a structure away from the axis on which the structure is borne (e.g., the lower surface of a leaf, the outer surface of a petal).</span></span>|g){ }

if ($line =~ s|<<2>>Achene<<2>>|<span class="term-trigger" tabindex="0">Achene<span class="term-popup">Dry, indehiscent, 1-seeded fruit from a 1-chambered ovary, sometimes winged, often appearing to be a naked seed. A 1-seeded dry fruit derived from an inferior ovary of > 1 carpel (e.g., Asteraceae, Dipsacaceae) is sometimes called a cypsela.</span></span>|g){ }

if ($line =~ s| <<2>>achene<<2>>|&nbsp;<span class="term-trigger" tabindex="0">achene<span class="term-popup"><img src="/eflora/common/images/morph/achene.jpg" class="term-img" alt="Morphology: achene">Dry, indehiscent, 1-seeded fruit from a 1-chambered ovary, sometimes winged, often appearing to be a naked seed. A 1-seeded dry fruit derived from an inferior ovary of > 1 carpel (e.g., Asteraceae, Dipsacaceae) is sometimes called a cypsela.</span></span>|g){ }

if ($line =~ s|<<3>>Achenes<<3>>|<span class="term-trigger" tabindex="0">Achenes<span class="term-popup">Dry, indehiscent, 1-seeded fruit from a 1-chambered ovary, sometimes winged, often appearing to be a naked seed. A 1-seeded dry fruit derived from an inferior ovary of > 1 carpel (e.g., Asteraceae, Dipsacaceae) is sometimes called a cypsela.</span></span>|g){ }

if ($line =~ s| <<3>>achenes<<3>>|&nbsp;<span class="term-trigger" tabindex="0">achenes<span class="term-popup">Dry, indehiscent, 1-seeded fruit from a 1-chambered ovary, sometimes winged, often appearing to be a naked seed. A 1-seeded dry fruit derived from an inferior ovary of > 1 carpel (e.g., Asteraceae, Dipsacaceae) is sometimes called a cypsela.</span></span>|g){ }

if ($line =~ s|<<4>>Acidic<<4>>|<span class="term-trigger" tabindex="0">Acidic<span class="term-popup">Soil or water with a low pH, often found in habitats such as coniferous forests and bogs where decomposition of plant remains liberates an excess of hydrogen ions.</span></span>|g){ }

if ($line =~ s| <<4>>acidic<<4>>|&nbsp;<span class="term-trigger" tabindex="0">acidic<span class="term-popup">Soil or water with a low pH, often found in habitats such as coniferous forests and bogs where decomposition of plant remains liberates an excess of hydrogen ions.</span></span>|g){ }

if ($line =~ s|<<5>>Acuminate<<5>>|<span class="term-trigger" tabindex="0">Acuminate<span class="term-popup">Having a long-tapered, sharp tip, the sides concave.</span></span>|g){ }

if ($line =~ s| <<5>>acuminate<<5>>|&nbsp;<span class="term-trigger" tabindex="0">acuminate<span class="term-popup"><img src="/eflora/common/images/morph/acuminate.jpg" class="term-img" alt="Morphology: acuminate">Having a long-tapered, sharp tip, the sides concave.</span></span>|g){ }

if ($line =~ s|<<6>>Acute<<6>>|<span class="term-trigger" tabindex="0">Acute<span class="term-popup">Having a short-tapered, sharp tip, the sides convex or straight and converging at less than a right angle.</span></span>|g){ }

if ($line =~ s| <<6>>acute<<6>>|&nbsp;<span class="term-trigger" tabindex="0">acute<span class="term-popup"><img src="/eflora/common/images/morph/acute.jpg" class="term-img" alt="Morphology: acute">Having a short-tapered, sharp tip, the sides convex or straight and converging at less than a right angle.</span></span>|g){ }

if ($line =~ s|<<7>>Adaxial<<7>>|<span class="term-trigger" tabindex="0">Adaxial<span class="term-popup">The side or surface of a structure toward the axis on which the structure is borne (e.g., the upper surface of a leaf, the inner surface of a petal).</span></span>|g){ }

if ($line =~ s| <<7>>adaxial<<7>>|&nbsp;<span class="term-trigger" tabindex="0">adaxial<span class="term-popup">The side or surface of a structure toward the axis on which the structure is borne (e.g., the upper surface of a leaf, the inner surface of a petal).</span></span>|g){ }

if ($line =~ s|<<8>>Adherent<<8>>|<span class="term-trigger" tabindex="0">Adherent<span class="term-popup">Sticking to and sometimes appearing fused to another part of like or unlike kind, but separable from it, such as 'perianth adherent to fruit'.</span></span>|g){ }

if ($line =~ s| <<8>>adherent<<8>>|&nbsp;<span class="term-trigger" tabindex="0">adherent<span class="term-popup">Sticking to and sometimes appearing fused to another part of like or unlike kind, but separable from it, such as 'perianth adherent to fruit'.</span></span>|g){ }

if ($line =~ s|<<9>>Adventitious<<9>>|<span class="term-trigger" tabindex="0">Adventitious<span class="term-popup">Arising at unusual times or places, such as  roots on aerial stems.</span></span>|g){ }

if ($line =~ s| <<9>>adventitious<<9>>|&nbsp;<span class="term-trigger" tabindex="0">adventitious<span class="term-popup">Arising at unusual times or places, such as  roots on aerial stems.</span></span>|g){ }

if ($line =~ s|<<10>>Alien<<10>>|<span class="term-trigger" tabindex="0">Alien<span class="term-popup">Not native; introduced purposely or accidentally into an area.</span></span>|g){ }

if ($line =~ s| <<10>>alien<<10>>|&nbsp;<span class="term-trigger" tabindex="0">alien<span class="term-popup">Not native; introduced purposely or accidentally into an area.</span></span>|g){ }

if ($line =~ s|<<11>>Alkali<<11>>|<span class="term-trigger" tabindex="0">Alkali<span class="term-popup">Soil or water with a high pH (i.e., basic), often found in areas where evaporation concentrates dissolved solutes.</span></span>|g){ }

if ($line =~ s| <<11>>alkali<<11>>|&nbsp;<span class="term-trigger" tabindex="0">alkali<span class="term-popup">Soil or water with a high pH (i.e., basic), often found in areas where evaporation concentrates dissolved solutes.</span></span>|g){ }

if ($line =~ s|<<12>>Alkaline<<12>>|<span class="term-trigger" tabindex="0">Alkaline<span class="term-popup">Soil or water with a high pH (i.e., basic), often found in areas where evaporation concentrates dissolved solutes.</span></span>|g){ }

if ($line =~ s| <<12>>alkaline<<12>>|&nbsp;<span class="term-trigger" tabindex="0">alkaline<span class="term-popup">Soil or water with a high pH (i.e., basic), often found in areas where evaporation concentrates dissolved solutes.</span></span>|g){ }

if ($line =~ s|<<13>>Alluvial<<13>>|<span class="term-trigger" tabindex="0">Alluvial<span class="term-popup">Pertaining to sediments deposited by flowing water.</span></span>|g){ }

if ($line =~ s| <<13>>alluvial<<13>>|&nbsp;<span class="term-trigger" tabindex="0">alluvial<span class="term-popup">Pertaining to sediments deposited by flowing water.</span></span>|g){ }

if ($line =~ s|<<14>>Alpine<<14>>|<span class="term-trigger" tabindex="0">Alpine<span class="term-popup">Pertaining to the vegetational--altitudinal zone above timberline; zone above the subalpine.</span></span>|g){ }

if ($line =~ s| <<14>>alpine<<14>>|&nbsp;<span class="term-trigger" tabindex="0">alpine<span class="term-popup">Pertaining to the vegetational--altitudinal zone above timberline; zone above the subalpine.</span></span>|g){ }

if ($line =~ s|<<15>>Alternate<<15>>|<span class="term-trigger" tabindex="0">Alternate<span class="term-popup">1. Arranged singly, often spirally, along an axis - e.g., one leaf per node. 2. Occurring in different ranks, appearing to be between, not directly above or below, as 'stamens alternate petals'.</span></span>|g){ }

if ($line =~ s| <<15>>alternate<<15>>|&nbsp;<span class="term-trigger" tabindex="0">alternate<span class="term-popup"><img src="/eflora/common/images/morph/alternate.jpg" class="term-img" alt="Morphology: alternate">1. Arranged singly, often spirally, along an axis - e.g., one leaf per node. 2. Occurring in different ranks, appearing to be between, not directly above or below, as 'stamens alternate petals'.</span></span>|g){ }

if ($line =~ s|<<16>>Angiosperm<<16>>|<span class="term-trigger" tabindex="0">Angiosperm<span class="term-popup">Plant that bears flowers (hence, 'flowering plant'), in which 'vesseled seeds' (hence, angio-sperm) are enclosed in an ovary; woody to herbaceous.</span></span>|g){ }

if ($line =~ s| <<16>>angiosperm<<16>>|&nbsp;<span class="term-trigger" tabindex="0">angiosperm<span class="term-popup">Plant that bears flowers (hence, 'flowering plant'), in which 'vesseled seeds' (hence, angio-sperm) are enclosed in an ovary; woody to herbaceous.</span></span>|g){ }

if ($line =~ s|<<17>>Angiosperms<<17>>|<span class="term-trigger" tabindex="0">Angiosperms<span class="term-popup">Plant that bears flowers (hence, 'flowering plant'), in which 'vesseled seeds' (hence, angio-sperm) are enclosed in an ovary; woody to herbaceous.</span></span>|g){ }

if ($line =~ s| <<17>>angiosperms<<17>>|&nbsp;<span class="term-trigger" tabindex="0">angiosperms<span class="term-popup">Plant that bears flowers (hence, 'flowering plant'), in which 'vesseled seeds' (hence, angio-sperm) are enclosed in an ovary; woody to herbaceous.</span></span>|g){ }

if ($line =~ s|<<18>>Annual<<18>>|<span class="term-trigger" tabindex="0">Annual<span class="term-popup">Completing life cycle (germination through death) in one year or growing season, generally non-woody.</span></span>|g){ }

if ($line =~ s| <<18>>annual<<18>>|&nbsp;<span class="term-trigger" tabindex="0">annual<span class="term-popup">Completing life cycle (germination through death) in one year or growing season, generally non-woody.</span></span>|g){ }

if ($line =~ s|<<19>>Annulus<<19>>|<span class="term-trigger" tabindex="0">Annulus<span class="term-popup">On the sporangium of most ferns, a row of cells with partly thickened walls that functions in the release of spores.</span></span>|g){ }

if ($line =~ s| <<19>>annulus<<19>>|&nbsp;<span class="term-trigger" tabindex="0">annulus<span class="term-popup">On the sporangium of most ferns, a row of cells with partly thickened walls that functions in the release of spores.</span></span>|g){ }

if ($line =~ s|<<20>>Annuli<<20>>|<span class="term-trigger" tabindex="0">Annuli<span class="term-popup">On the sporangium of most ferns, a row of cells with partly thickened walls that functions in the release of spores.</span></span>|g){ }

if ($line =~ s| <<20>>annuli<<20>>|&nbsp;<span class="term-trigger" tabindex="0">annuli<span class="term-popup">On the sporangium of most ferns, a row of cells with partly thickened walls that functions in the release of spores.</span></span>|g){ }

if ($line =~ s|<<21>>Anther<<21>>|<span class="term-trigger" tabindex="0">Anther<span class="term-popup">Pollen-bearing portion of a stamen, including one, two, or four pollen sacs.</span></span>|g){ }

if ($line =~ s| <<21>>anther<<21>>|&nbsp;<span class="term-trigger" tabindex="0">anther<span class="term-popup">Pollen-bearing portion of a stamen, including one, two, or four pollen sacs.</span></span>|g){ }

if ($line =~ s|<<22>>Anthers<<22>>|<span class="term-trigger" tabindex="0">Anthers<span class="term-popup">Pollen-bearing portion of a stamen, including one, two, or four pollen sacs.</span></span>|g){ }

if ($line =~ s| <<22>>anthers<<22>>|&nbsp;<span class="term-trigger" tabindex="0">anthers<span class="term-popup">Pollen-bearing portion of a stamen, including one, two, or four pollen sacs.</span></span>|g){ }

if ($line =~ s|<<23>>Appressed<<23>>|<span class="term-trigger" tabindex="0">Appressed<span class="term-popup">Parallel or nearly parallel to and often in contact with surface of origin; used to describe the disposition of hairs, leaves, pedicels, etc.</span></span>|g){ }

if ($line =~ s| <<23>>appressed<<23>>|&nbsp;<span class="term-trigger" tabindex="0">appressed<span class="term-popup"><img src="/eflora/common/images/morph/appressed.jpg" class="term-img" alt="Morphology: appressed">Parallel or nearly parallel to and often in contact with surface of origin; used to describe the disposition of hairs, leaves, pedicels, etc.</span></span>|g){ }

if ($line =~ s|<<24>>Apogamous<<24>>|<span class="term-trigger" tabindex="0">Apogamous<span class="term-popup">Forming a sporophyte (the generation in a vascular plant life cycle that is conspicuous, 2n, and produces spores, which give rise to gametophytes) from a gametophyte (the generation in a vascular plant life cycle that is inconspicuous, n, and produces sperms and eggs, which usually unite in fertilization to give rise to sporophytes) by direct, asexual development, rather than by fertilization of eggs by sperms.</span></span>|g){ }

if ($line =~ s| <<24>>apogamous<<24>>|&nbsp;<span class="term-trigger" tabindex="0">apogamous<span class="term-popup">Forming a sporophyte (the generation in a vascular plant life cycle that is conspicuous, 2n, and produces spores, which give rise to gametophytes) from a gametophyte (the generation in a vascular plant life cycle that is inconspicuous, n, and produces sperms and eggs, which usually unite in fertilization to give rise to sporophytes) by direct, asexual development, rather than by fertilization of eggs by sperms.</span></span>|g){ }

if ($line =~ s|<<25>>Aquatic<<25>>|<span class="term-trigger" tabindex="0">Aquatic<span class="term-popup">Growing under, in, or on water (generally fresh; if brackish, saline, or marine, so indicated), whether rooted in bottom or floating, and including plants with parts of shoots submersed but with other parts above water; excluding plants of seeps or wet rocks. (e.g., Potamogeton gramineus)</span></span>|g){ }

if ($line =~ s| <<25>>aquatic<<25>>|&nbsp;<span class="term-trigger" tabindex="0">aquatic<span class="term-popup">Growing under, in, or on water (generally fresh; if brackish, saline, or marine, so indicated), whether rooted in bottom or floating, and including plants with parts of shoots submersed but with other parts above water; excluding plants of seeps or wet rocks. (e.g., Potamogeton gramineus)</span></span>|g){ }

if ($line =~ s|<<26>>Areole<<26>>|<span class="term-trigger" tabindex="0">Areole<span class="term-popup">1. In Cactaceae, a well-defined, axillary area bearing one to many spines and generally other, shorter structures  (e.g., Ferocactus cylindraceus).  2.  In general, each of many areas defined by smallest veins on a leaf .</span></span>|g){ }

if ($line =~ s| <<26>>areole<<26>>|&nbsp;<span class="term-trigger" tabindex="0">areole<span class="term-popup">1. In Cactaceae, a well-defined, axillary area bearing one to many spines and generally other, shorter structures  (e.g., Ferocactus cylindraceus).  2.  In general, each of many areas defined by smallest veins on a leaf .</span></span>|g){ }

if ($line =~ s|<<27>>Areoles<<27>>|<span class="term-trigger" tabindex="0">Areoles<span class="term-popup">1. In Cactaceae, a well-defined, axillary area bearing one to many spines and generally other, shorter structures  (e.g., Ferocactus cylindraceus).  2.  In general, each of many areas defined by smallest veins on a leaf .</span></span>|g){ }

if ($line =~ s| <<27>>areoles<<27>>|&nbsp;<span class="term-trigger" tabindex="0">areoles<span class="term-popup">1. In Cactaceae, a well-defined, axillary area bearing one to many spines and generally other, shorter structures  (e.g., Ferocactus cylindraceus).  2.  In general, each of many areas defined by smallest veins on a leaf .</span></span>|g){ }

if ($line =~ s|<<28>>Aril<<28>>|<span class="term-trigger" tabindex="0">Aril<span class="term-popup">Fleshy, corky, or bony appendage arising at or near the point of seed attachment, sometimes completely covering the seed.</span></span>|g){ }

if ($line =~ s| <<28>>aril<<28>>|&nbsp;<span class="term-trigger" tabindex="0">aril<span class="term-popup">Fleshy, corky, or bony appendage arising at or near the point of seed attachment, sometimes completely covering the seed.</span></span>|g){ }

if ($line =~ s|<<29>>Arils<<29>>|<span class="term-trigger" tabindex="0">Arils<span class="term-popup">Fleshy, corky, or bony appendage arising at or near the point of seed attachment, sometimes completely covering the seed.</span></span>|g){ }

if ($line =~ s| <<29>>arils<<29>>|&nbsp;<span class="term-trigger" tabindex="0">arils<span class="term-popup">Fleshy, corky, or bony appendage arising at or near the point of seed attachment, sometimes completely covering the seed.</span></span>|g){ }

if ($line =~ s|<<30>>Armed<<30>>|<span class="term-trigger" tabindex="0">Armed<span class="term-popup">Bearing prickles, spines, or thorns.</span></span>|g){ }

if ($line =~ s| <<30>>armed<<30>>|&nbsp;<span class="term-trigger" tabindex="0">armed<span class="term-popup">Bearing prickles, spines, or thorns.</span></span>|g){ }

if ($line =~ s|<<31>>Ascending<<31>>|<span class="term-trigger" tabindex="0">Ascending<span class="term-popup">Curving or angling upward from base, or about 30-60 degrees less than vertical or away from axis of attachment.</span></span>|g){ }

if ($line =~ s| <<31>>ascending<<31>>|&nbsp;<span class="term-trigger" tabindex="0">ascending<span class="term-popup"><img src="/eflora/common/images/morph/ascending-STEM.jpg" class="term-img" alt="Morphology: ascending">Curving or angling upward from base, or about 30-60 degrees less than vertical or away from axis of attachment.</span></span>|g){ }

if ($line =~ s|<<32>>Asymmetric<<32>>|<span class="term-trigger" tabindex="0">Asymmetric<span class="term-popup">Not divisible into identical or mirror-image halves.</span></span>|g){ }

if ($line =~ s| <<32>>asymmetric<<32>>|&nbsp;<span class="term-trigger" tabindex="0">asymmetric<span class="term-popup"><img src="/eflora/common/images/morph/asymmetric.jpg" class="term-img" alt="Morphology: asymmetric">Not divisible into identical or mirror-image halves.</span></span>|g){ }

if ($line =~ s|<<33>>Auricle<<33>>|<span class="term-trigger" tabindex="0">Auricle<span class="term-popup">In Poaceae, a structure, often lanceolate, projecting from both margins of the leaf lateral to the ligule.</span></span>|g){ }

if ($line =~ s| <<33>>auricle<<33>>|&nbsp;<span class="term-trigger" tabindex="0">auricle<span class="term-popup"><img src="/eflora/common/images/morph/grass-leaf-auricle.jpg" class="term-img" alt="Morphology: auricle">In Poaceae, a structure, often lanceolate, projecting from both margins of the leaf lateral to the ligule.</span></span>|g){ }

if ($line =~ s|<<34>>Auricles<<34>>|<span class="term-trigger" tabindex="0">Auricles<span class="term-popup">In Poaceae, a structure, often lanceolate, projecting from both margins of the leaf lateral to the ligule.</span></span>|g){ }

if ($line =~ s| <<34>>auricles<<34>>|&nbsp;<span class="term-trigger" tabindex="0">auricles<span class="term-popup">In Poaceae, a structure, often lanceolate, projecting from both margins of the leaf lateral to the ligule.</span></span>|g){ }

if ($line =~ s|<<35>>Awn<<35>>|<span class="term-trigger" tabindex="0">Awn<span class="term-popup">1. Bristle-like appendage or elongation, generally terminal.  2. Stiff, needle-like pappus element in Asteraceae.</span></span>|g){ }

if ($line =~ s| <<35>>awn<<35>>|&nbsp;<span class="term-trigger" tabindex="0">awn<span class="term-popup"><img src="/eflora/common/images/morph/awned.jpg" class="term-img" alt="Morphology: awn">1. Bristle-like appendage or elongation, generally terminal.  2. Stiff, needle-like pappus element in Asteraceae.</span></span>|g){ }

if ($line =~ s|<<36>>Awns<<36>>|<span class="term-trigger" tabindex="0">Awns<span class="term-popup">1. Bristle-like appendage or elongation, generally terminal.  2. Stiff, needle-like pappus element in Asteraceae.</span></span>|g){ }

if ($line =~ s| <<36>>awns<<36>>|&nbsp;<span class="term-trigger" tabindex="0">awns<span class="term-popup"><img src="/eflora/common/images/morph/awned.jpg" class="term-img" alt="Morphology: awns">1. Bristle-like appendage or elongation, generally terminal.  2. Stiff, needle-like pappus element in Asteraceae.</span></span>|g){ }

if ($line =~ s|<<37>>Axil<<37>>|<span class="term-trigger" tabindex="0">Axil<span class="term-popup">Distal, adaxial angle between an appendage or branch and a main axis (e.g., between leaf and stem, or between lateral vein and midrib on a leaf).</span></span>|g){ }

if ($line =~ s| <<37>>axil<<37>>|&nbsp;<span class="term-trigger" tabindex="0">axil<span class="term-popup"><img src="/eflora/common/images/morph/axil.jpg" class="term-img" alt="Morphology: axil">Distal, adaxial angle between an appendage or branch and a main axis (e.g., between leaf and stem, or between lateral vein and midrib on a leaf).</span></span>|g){ }

if ($line =~ s|<<38>>Axils<<38>>|<span class="term-trigger" tabindex="0">Axils<span class="term-popup">Distal, adaxial angle between an appendage or branch and a main axis (e.g., between leaf and stem, or between lateral vein and midrib on a leaf).</span></span>|g){ }

if ($line =~ s| <<38>>axils<<38>>|&nbsp;<span class="term-trigger" tabindex="0">axils<span class="term-popup">Distal, adaxial angle between an appendage or branch and a main axis (e.g., between leaf and stem, or between lateral vein and midrib on a leaf).</span></span>|g){ }

if ($line =~ s|<<39>>Axile<<39>>|<span class="term-trigger" tabindex="0">Axile<span class="term-popup">Pertaining to an axis, as of a placenta along the central axis in a compound ovary with more than one chamber.</span></span>|g){ }

if ($line =~ s| <<39>>axile<<39>>|&nbsp;<span class="term-trigger" tabindex="0">axile<span class="term-popup"><img src="/eflora/common/images/morph/axile-placenta.jpg" class="term-img" alt="Morphology: axile">Pertaining to an axis, as of a placenta along the central axis in a compound ovary with more than one chamber.</span></span>|g){ }

if ($line =~ s|<<40>>Axillary<<40>>|<span class="term-trigger" tabindex="0">Axillary<span class="term-popup">Pertaining to or within an axil, especially a leaf axil.</span></span>|g){ }

if ($line =~ s| <<40>>axillary<<40>>|&nbsp;<span class="term-trigger" tabindex="0">axillary<span class="term-popup"><img src="/eflora/common/images/morph/axillary-bud.jpg" class="term-img" alt="Morphology: axillary">Pertaining to or within an axil, especially a leaf axil.</span></span>|g){ }

if ($line =~ s|<<41>>Axis<<41>>|<span class="term-trigger" tabindex="0">Axis<span class="term-popup">Line of direction, growth, or extension; structure occupying such a position - e.g., the main stem of a plant or inflorescence, the midrib of a leaf.</span></span>|g){ }

if ($line =~ s| <<41>>axis<<41>>|&nbsp;<span class="term-trigger" tabindex="0">axis<span class="term-popup">Line of direction, growth, or extension; structure occupying such a position - e.g., the main stem of a plant or inflorescence, the midrib of a leaf.</span></span>|g){ }

if ($line =~ s|<<42>>Axes<<42>>|<span class="term-trigger" tabindex="0">Axes<span class="term-popup">Line of direction, growth, or extension; structure occupying such a position - e.g., the main stem of a plant or inflorescence, the midrib of a leaf.</span></span>|g){ }

if ($line =~ s| <<42>>axes<<42>>|&nbsp;<span class="term-trigger" tabindex="0">axes<span class="term-popup">Line of direction, growth, or extension; structure occupying such a position - e.g., the main stem of a plant or inflorescence, the midrib of a leaf.</span></span>|g){ }

if ($line =~ s|<<43>>Banner<<43>>|<span class="term-trigger" tabindex="0">Banner<span class="term-popup">Uppermost, often largest petal of many members of Fabaceae.</span></span>|g){ }

if ($line =~ s| <<43>>banner<<43>>|&nbsp;<span class="term-trigger" tabindex="0">banner<span class="term-popup">Uppermost, often largest petal of many members of Fabaceae.</span></span>|g){ }

if ($line =~ s|<<44>>Barbed<<44>>|<span class="term-trigger" tabindex="0">Barbed<span class="term-popup">Having sharp, normally downward- or backward-pointing projections.  Said of an awn, bristle, or other structure.</span></span>|g){ }

if ($line =~ s| <<44>>barbed<<44>>|&nbsp;<span class="term-trigger" tabindex="0">barbed<span class="term-popup"><img src="/eflora/common/images/morph/barbed.jpg" class="term-img" alt="Morphology: barbed">Having sharp, normally downward- or backward-pointing projections.  Said of an awn, bristle, or other structure.</span></span>|g){ }

if ($line =~ s|<<45>>Bark<<45>>|<span class="term-trigger" tabindex="0">Bark<span class="term-popup">Tough tissue (including phloem) covering the wood (hardened xylem) of subshrubs, shrubs, trees, and some vines.</span></span>|g){ }

if ($line =~ s| <<45>>bark<<45>>|&nbsp;<span class="term-trigger" tabindex="0">bark<span class="term-popup">Tough tissue (including phloem) covering the wood (hardened xylem) of subshrubs, shrubs, trees, and some vines.</span></span>|g){ }

if ($line =~ s|<<46>>Basal<<46>>|<span class="term-trigger" tabindex="0">Basal<span class="term-popup">At or near the base of a plant or plant part.  Especially said of leaves clustered near the ground or of a placenta confined to the base of an ovary.</span></span>|g){ }

if ($line =~ s| <<46>>basal<<46>>|&nbsp;<span class="term-trigger" tabindex="0">basal<span class="term-popup"><img src="/eflora/common/images/morph/basal-rosette.jpg" class="term-img" alt="Morphology: basal">At or near the base of a plant or plant part.  Especially said of leaves clustered near the ground or of a placenta confined to the base of an ovary.</span></span>|g){ }

if ($line =~ s|<<47>>Beak<<47>>|<span class="term-trigger" tabindex="0">Beak<span class="term-popup">Generally distal or terminal, narrowed, generally sterile part of fruit or surrounding structures (e.g., Ambrosia bur, Carex perigynium).</span></span>|g){ }

if ($line =~ s| <<47>>beak<<47>>|&nbsp;<span class="term-trigger" tabindex="0">beak<span class="term-popup">Generally distal or terminal, narrowed, generally sterile part of fruit or surrounding structures (e.g., Ambrosia bur, Carex perigynium).</span></span>|g){ }

if ($line =~ s|<<48>>Beaks<<48>>|<span class="term-trigger" tabindex="0">Beaks<span class="term-popup">Generally distal or terminal, narrowed, generally sterile part of fruit or surrounding structures (e.g., Ambrosia bur, Carex perigynium).</span></span>|g){ }

if ($line =~ s| <<48>>beaks<<48>>|&nbsp;<span class="term-trigger" tabindex="0">beaks<span class="term-popup">Generally distal or terminal, narrowed, generally sterile part of fruit or surrounding structures (e.g., Ambrosia bur, Carex perigynium).</span></span>|g){ }

if ($line =~ s|<<49>>Berry<<49>>|<span class="term-trigger" tabindex="0">Berry<span class="term-popup">Fleshy, indehiscent fruit in which the seeds are generally more than 1 and are not encased in a stone. (e.g., Solanum americanum)</span></span>|g){ }

if ($line =~ s| <<49>>berry<<49>>|&nbsp;<span class="term-trigger" tabindex="0">berry<span class="term-popup">Fleshy, indehiscent fruit in which the seeds are generally more than 1 and are not encased in a stone. (e.g., Solanum americanum)</span></span>|g){ }

if ($line =~ s|<<50>>Biennial<<50>>|<span class="term-trigger" tabindex="0">Biennial<span class="term-popup">Completing life cycle (germination through death) in two years or growing seasons (generally flowering only in the second), non-woody (at least above ground), often with a rosette the first growing season.</span></span>|g){ }

if ($line =~ s| <<50>>biennial<<50>>|&nbsp;<span class="term-trigger" tabindex="0">biennial<span class="term-popup">Completing life cycle (germination through death) in two years or growing seasons (generally flowering only in the second), non-woody (at least above ground), often with a rosette the first growing season.</span></span>|g){ }

if ($line =~ s|<<51>>Bilateral<<51>>|<span class="term-trigger" tabindex="0">Bilateral<span class="term-popup">Divisible into mirror-image halves in only one way.</span></span>|g){ }

if ($line =~ s| <<51>>bilateral<<51>>|&nbsp;<span class="term-trigger" tabindex="0">bilateral<span class="term-popup"><img src="/eflora/common/images/morph/bilateral.jpg" class="term-img" alt="Morphology: bilateral">Divisible into mirror-image halves in only one way.</span></span>|g){ }

if ($line =~ s|<<52>>Biradial<<52>>|<span class="term-trigger" tabindex="0">Biradial<span class="term-popup">Divisible into mirror-image halves in two ways; isobilateral.</span></span>|g){ }

if ($line =~ s| <<52>>biradial<<52>>|&nbsp;<span class="term-trigger" tabindex="0">biradial<span class="term-popup"><img src="/eflora/common/images/morph/biradial.jpg" class="term-img" alt="Morphology: biradial">Divisible into mirror-image halves in two ways; isobilateral.</span></span>|g){ }

if ($line =~ s|<<53>>Bisexual<<53>>|<span class="term-trigger" tabindex="0">Bisexual<span class="term-popup">Both male and female reproductive parts occurring and functional in the same plant or structure (e.g., flower, spikelet, inflorescence).</span></span>|g){ }

if ($line =~ s| <<53>>bisexual<<53>>|&nbsp;<span class="term-trigger" tabindex="0">bisexual<span class="term-popup"><img src="/eflora/common/images/morph/bisexual-flower.jpg" class="term-img" alt="Morphology: bisexual">Both male and female reproductive parts occurring and functional in the same plant or structure (e.g., flower, spikelet, inflorescence).</span></span>|g){ }

if ($line =~ s|<<54>>Blade<<54>>|<span class="term-trigger" tabindex="0">Blade<span class="term-popup">Expanded portion of a leaf, petal, or other structure, generally flat but sometimes rolled, cylindric, wavy, or cupped.</span></span>|g){ }

if ($line =~ s| <<54>>blade<<54>>|&nbsp;<span class="term-trigger" tabindex="0">blade<span class="term-popup"><img src="/eflora/common/images/morph/grass-leaf-blade.jpg" class="term-img" alt="Morphology: blade">Expanded portion of a leaf, petal, or other structure, generally flat but sometimes rolled, cylindric, wavy, or cupped.</span></span>|g){ }

if ($line =~ s|<<55>>Blades<<55>>|<span class="term-trigger" tabindex="0">Blades<span class="term-popup">Expanded portion of a leaf, petal, or other structure, generally flat but sometimes rolled, cylindric, wavy, or cupped.</span></span>|g){ }

if ($line =~ s| <<55>>blades<<55>>|&nbsp;<span class="term-trigger" tabindex="0">blades<span class="term-popup">Expanded portion of a leaf, petal, or other structure, generally flat but sometimes rolled, cylindric, wavy, or cupped.</span></span>|g){ }

if ($line =~ s|<<56>>Brackish<<56>>|<span class="term-trigger" tabindex="0">Brackish<span class="term-popup">Somewhat salty, generally a mixture of saline and fresh water.</span></span>|g){ }

if ($line =~ s| <<56>>brackish<<56>>|&nbsp;<span class="term-trigger" tabindex="0">brackish<span class="term-popup">Somewhat salty, generally a mixture of saline and fresh water.</span></span>|g){ }

if ($line =~ s|<<57>>Bract<<57>>|<span class="term-trigger" tabindex="0">Bract<span class="term-popup">Reduced, leaf- or scale-like structure subtending a branch, cone scale, peduncle, pedicel, or flower.</span></span>|g){ }

if ($line =~ s| <<57>>bract<<57>>|&nbsp;<span class="term-trigger" tabindex="0">bract<span class="term-popup"><img src="/eflora/common/images/morph/bract.jpg" class="term-img" alt="Morphology: bract">Reduced, leaf- or scale-like structure subtending a branch, cone scale, peduncle, pedicel, or flower.</span></span>|g){ }

if ($line =~ s|<<58>>Bracts<<58>>|<span class="term-trigger" tabindex="0">Bracts<span class="term-popup">Reduced, leaf- or scale-like structure subtending a branch, cone scale, peduncle, pedicel, or flower.</span></span>|g){ }

if ($line =~ s| <<58>>bracts<<58>>|&nbsp;<span class="term-trigger" tabindex="0">bracts<span class="term-popup">Reduced, leaf- or scale-like structure subtending a branch, cone scale, peduncle, pedicel, or flower.</span></span>|g){ }

if ($line =~ s|<<59>>Bractlet<<59>>|<span class="term-trigger" tabindex="0">Bractlet<span class="term-popup">1. Relatively small, generally secondary bract within an inflorescence.  2. Bract-like structure on a pedicel that often does not directly subtend another structure.</span></span>|g){ }

if ($line =~ s| <<59>>bractlet<<59>>|&nbsp;<span class="term-trigger" tabindex="0">bractlet<span class="term-popup">1. Relatively small, generally secondary bract within an inflorescence.  2. Bract-like structure on a pedicel that often does not directly subtend another structure.</span></span>|g){ }

if ($line =~ s|<<60>>Bractlets<<60>>|<span class="term-trigger" tabindex="0">Bractlets<span class="term-popup">1. Relatively small, generally secondary bract within an inflorescence.  2. Bract-like structure on a pedicel that often does not directly subtend another structure.</span></span>|g){ }

if ($line =~ s| <<60>>bractlets<<60>>|&nbsp;<span class="term-trigger" tabindex="0">bractlets<span class="term-popup">1. Relatively small, generally secondary bract within an inflorescence.  2. Bract-like structure on a pedicel that often does not directly subtend another structure.</span></span>|g){ }

if ($line =~ s|<<61>>Bristle<<61>>|<span class="term-trigger" tabindex="0">Bristle<span class="term-popup">1. Relatively large, generally stiff, more or less straight hair. (e.g., Navarretia breweri) 2. In Asteraceae, fine, cylindric or minutely flattened pappus element (e.g., Calycoseris parryi) or epidermal outgrowth on the receptacle (e.g., Centaurea solstitialis).</span></span>|g){ }

if ($line =~ s| <<61>>bristle<<61>>|&nbsp;<span class="term-trigger" tabindex="0">bristle<span class="term-popup">1. Relatively large, generally stiff, more or less straight hair. (e.g., Navarretia breweri) 2. In Asteraceae, fine, cylindric or minutely flattened pappus element (e.g., Calycoseris parryi) or epidermal outgrowth on the receptacle (e.g., Centaurea solstitialis).</span></span>|g){ }

if ($line =~ s|<<62>>Bristles<<62>>|<span class="term-trigger" tabindex="0">Bristles<span class="term-popup">1. Relatively large, generally stiff, more or less straight hair. (e.g., Navarretia breweri) 2. In Asteraceae, fine, cylindric or minutely flattened pappus element (e.g., Calycoseris parryi) or epidermal outgrowth on the receptacle (e.g., Centaurea solstitialis).</span></span>|g){ }

if ($line =~ s| <<62>>bristles<<62>>|&nbsp;<span class="term-trigger" tabindex="0">bristles<span class="term-popup">1. Relatively large, generally stiff, more or less straight hair. (e.g., Navarretia breweri) 2. In Asteraceae, fine, cylindric or minutely flattened pappus element (e.g., Calycoseris parryi) or epidermal outgrowth on the receptacle (e.g., Centaurea solstitialis).</span></span>|g){ }

if ($line =~ s|<<63>>Bud<<63>>|<span class="term-trigger" tabindex="0">Bud<span class="term-popup">1. An incompletely developed, more or less embryonic shoot, usually covered with bud scales.  2. An unopened flower, often protected by sepals.</span></span>|g){ }

if ($line =~ s| <<63>>bud<<63>>|&nbsp;<span class="term-trigger" tabindex="0">bud<span class="term-popup"><img src="/eflora/common/images/morph/bud-scale-scars.jpg" class="term-img" alt="Morphology: bud">1. An incompletely developed, more or less embryonic shoot, usually covered with bud scales.  2. An unopened flower, often protected by sepals.</span></span>|g){ }

if ($line =~ s|<<64>>Buds<<64>>|<span class="term-trigger" tabindex="0">Buds<span class="term-popup">1. An incompletely developed, more or less embryonic shoot, usually covered with bud scales.  2. An unopened flower, often protected by sepals.</span></span>|g){ }

if ($line =~ s| <<64>>buds<<64>>|&nbsp;<span class="term-trigger" tabindex="0">buds<span class="term-popup"><img src="/eflora/common/images/morph/buds-and-scars.jpg" class="term-img" alt="Morphology: buds">1. An incompletely developed, more or less embryonic shoot, usually covered with bud scales.  2. An unopened flower, often protected by sepals.</span></span>|g){ }

if ($line =~ s|<<65>>Bulb<<65>>|<span class="term-trigger" tabindex="0">Bulb<span class="term-popup">Short underground stem and the fleshy leaves or leaf bases attached to and surrounding it (e.g., an onion).</span></span>|g){ }

if ($line =~ s| <<65>>bulb<<65>>|&nbsp;<span class="term-trigger" tabindex="0">bulb<span class="term-popup">Short underground stem and the fleshy leaves or leaf bases attached to and surrounding it (e.g., an onion).</span></span>|g){ }

if ($line =~ s|<<66>>Bulbs<<66>>|<span class="term-trigger" tabindex="0">Bulbs<span class="term-popup">Short underground stem and the fleshy leaves or leaf bases attached to and surrounding it (e.g., an onion).</span></span>|g){ }

if ($line =~ s| <<66>>bulbs<<66>>|&nbsp;<span class="term-trigger" tabindex="0">bulbs<span class="term-popup"><img src="/eflora/common/images/morph/bulb.jpg" class="term-img" alt="Morphology: bulbs">Short underground stem and the fleshy leaves or leaf bases attached to and surrounding it (e.g., an onion).</span></span>|g){ }

if ($line =~ s|<<67>>Bulblet<<67>>|<span class="term-trigger" tabindex="0">Bulblet<span class="term-popup">1. Small bulb generally produced at the base of a bulb.  2. Any small, bulb-like structure that propagates a plant, often in a leaf or bract axil.</span></span>|g){ }

if ($line =~ s| <<67>>bulblet<<67>>|&nbsp;<span class="term-trigger" tabindex="0">bulblet<span class="term-popup"><img src="/eflora/common/images/morph/bulblet.jpg" class="term-img" alt="Morphology: bulblet">1. Small bulb generally produced at the base of a bulb.  2. Any small, bulb-like structure that propagates a plant, often in a leaf or bract axil.</span></span>|g){ }

if ($line =~ s|<<68>>Bulblets<<68>>|<span class="term-trigger" tabindex="0">Bulblets<span class="term-popup">1. Small bulb generally produced at the base of a bulb.  2. Any small, bulb-like structure that propagates a plant, often in a leaf or bract axil.</span></span>|g){ }

if ($line =~ s| <<68>>bulblets<<68>>|&nbsp;<span class="term-trigger" tabindex="0">bulblets<span class="term-popup"><img src="/eflora/common/images/morph/bulblet.jpg" class="term-img" alt="Morphology: bulblets">1. Small bulb generally produced at the base of a bulb.  2. Any small, bulb-like structure that propagates a plant, often in a leaf or bract axil.</span></span>|g){ }

if ($line =~ s|<<69>>Bur<<69>>|<span class="term-trigger" tabindex="0">Bur<span class="term-popup">Fruit or fruiting inflorescence with awns or bristles, often barbed.  (e.g., Xanthium strumarium)</span></span>|g){ }

if ($line =~ s| <<69>>bur<<69>>|&nbsp;<span class="term-trigger" tabindex="0">bur<span class="term-popup">Fruit or fruiting inflorescence with awns or bristles, often barbed.  (e.g., Xanthium strumarium)</span></span>|g){ }

if ($line =~ s|<<70>>Callus<<70>>|<span class="term-trigger" tabindex="0">Callus<span class="term-popup">1. In some Poaceae, enlarged or projected hard base of floret; sometimes hairy or sharp-pointed. 2. A firm protuberance.</span></span>|g){ }

if ($line =~ s| <<70>>callus<<70>>|&nbsp;<span class="term-trigger" tabindex="0">callus<span class="term-popup">1. In some Poaceae, enlarged or projected hard base of floret; sometimes hairy or sharp-pointed. 2. A firm protuberance.</span></span>|g){ }

if ($line =~ s|<<71>>Calyx<<71>>|<span class="term-trigger" tabindex="0">Calyx<span class="term-popup">Collective term for sepals; outermost or lowermost whorl of flower parts, generally green and enclosing remainder of flower in bud.  Sometimes indistinguishable from corolla.</span></span>|g){ }

if ($line =~ s| <<71>>calyx<<71>>|&nbsp;<span class="term-trigger" tabindex="0">calyx<span class="term-popup">Collective term for sepals; outermost or lowermost whorl of flower parts, generally green and enclosing remainder of flower in bud.  Sometimes indistinguishable from corolla.</span></span>|g){ }

if ($line =~ s|<<72>>Canescent<<72>>|<span class="term-trigger" tabindex="0">Canescent<span class="term-popup">Covered with dense, fine, generally grayish white hairs.  (e.g., Phoenicaulis cheiranthoides leaf)</span></span>|g){ }

if ($line =~ s| <<72>>canescent<<72>>|&nbsp;<span class="term-trigger" tabindex="0">canescent<span class="term-popup">Covered with dense, fine, generally grayish white hairs.  (e.g., Phoenicaulis cheiranthoides leaf)</span></span>|g){ }

if ($line =~ s|<<73>>Capsule<<73>>|<span class="term-trigger" tabindex="0">Capsule<span class="term-popup">Dry fruit from compound pistil, nearly always dehiscent (irregularly or by pores, slits, or lines of separation).</span></span>|g){ }

if ($line =~ s| <<73>>capsule<<73>>|&nbsp;<span class="term-trigger" tabindex="0">capsule<span class="term-popup">Dry fruit from compound pistil, nearly always dehiscent (irregularly or by pores, slits, or lines of separation).</span></span>|g){ }

if ($line =~ s|<<74>>Capsules<<74>>|<span class="term-trigger" tabindex="0">Capsules<span class="term-popup">Dry fruit from compound pistil, nearly always dehiscent (irregularly or by pores, slits, or lines of separation).</span></span>|g){ }

if ($line =~ s| <<74>>capsules<<74>>|&nbsp;<span class="term-trigger" tabindex="0">capsules<span class="term-popup"><img src="/eflora/common/images/morph/capsules.jpg" class="term-img" alt="Morphology: capsules">Dry fruit from compound pistil, nearly always dehiscent (irregularly or by pores, slits, or lines of separation).</span></span>|g){ }

if ($line =~ s|<<75>>Carpel<<75>>|<span class="term-trigger" tabindex="0">Carpel<span class="term-popup">The basic female structure of a flower, evolved from a fertile leaf.  Carpels are free or variously fused into a compound pistil, the number of carpels then often equal to the number of stigmas, styles, or chambers of the ovary.</span></span>|g){ }

if ($line =~ s| <<75>>carpel<<75>>|&nbsp;<span class="term-trigger" tabindex="0">carpel<span class="term-popup">The basic female structure of a flower, evolved from a fertile leaf.  Carpels are free or variously fused into a compound pistil, the number of carpels then often equal to the number of stigmas, styles, or chambers of the ovary.</span></span>|g){ }

if ($line =~ s|<<76>>Carpels<<76>>|<span class="term-trigger" tabindex="0">Carpels<span class="term-popup">The basic female structure of a flower, evolved from a fertile leaf.  Carpels are free or variously fused into a compound pistil, the number of carpels then often equal to the number of stigmas, styles, or chambers of the ovary.</span></span>|g){ }

if ($line =~ s| <<76>>carpels<<76>>|&nbsp;<span class="term-trigger" tabindex="0">carpels<span class="term-popup">The basic female structure of a flower, evolved from a fertile leaf.  Carpels are free or variously fused into a compound pistil, the number of carpels then often equal to the number of stigmas, styles, or chambers of the ovary.</span></span>|g){ }

if ($line =~ s|<<77>>Cartilaginous<<77>>|<span class="term-trigger" tabindex="0">Cartilaginous<span class="term-popup">thickened, usually whitish, sometimes flexible; in ferns, applied especially to margins of blades.</span></span>|g){ }

if ($line =~ s| <<77>>cartilaginous<<77>>|&nbsp;<span class="term-trigger" tabindex="0">cartilaginous<span class="term-popup">thickened, usually whitish, sometimes flexible; in ferns, applied especially to margins of blades.</span></span>|g){ }

if ($line =~ s|<<78>>Catkin<<78>>|<span class="term-trigger" tabindex="0">Catkin<span class="term-popup">Spike or spike-like (e.g., Alnus) inflorescence of unisexual flowers with inconspicuous perianths (generally wind-pollinated), usually pendent and often with conspicuous bracts.</span></span>|g){ }

if ($line =~ s| <<78>>catkin<<78>>|&nbsp;<span class="term-trigger" tabindex="0">catkin<span class="term-popup"><img src="/eflora/common/images/morph/catkin.jpg" class="term-img" alt="Morphology: catkin">Spike or spike-like (e.g., Alnus) inflorescence of unisexual flowers with inconspicuous perianths (generally wind-pollinated), usually pendent and often with conspicuous bracts.</span></span>|g){ }

if ($line =~ s|<<79>>Catkins<<79>>|<span class="term-trigger" tabindex="0">Catkins<span class="term-popup">Spike or spike-like (e.g., Alnus) inflorescence of unisexual flowers with inconspicuous perianths (generally wind-pollinated), usually pendent and often with conspicuous bracts.</span></span>|g){ }

if ($line =~ s| <<79>>catkins<<79>>|&nbsp;<span class="term-trigger" tabindex="0">catkins<span class="term-popup"><img src="/eflora/common/images/morph/catkin.jpg" class="term-img" alt="Morphology: catkins">Spike or spike-like (e.g., Alnus) inflorescence of unisexual flowers with inconspicuous perianths (generally wind-pollinated), usually pendent and often with conspicuous bracts.</span></span>|g){ }

if ($line =~ s|<<80>>Caudex<<80>>|<span class="term-trigger" tabindex="0">Caudex<span class="term-popup">Generally short, sometimes woody, more or less vertical stem of a perennial, at or beneath ground level.</span></span>|g){ }

if ($line =~ s| <<80>>caudex<<80>>|&nbsp;<span class="term-trigger" tabindex="0">caudex<span class="term-popup"><img src="/eflora/common/images/morph/caudex.jpg" class="term-img" alt="Morphology: caudex">Generally short, sometimes woody, more or less vertical stem of a perennial, at or beneath ground level.</span></span>|g){ }

if ($line =~ s|<<81>>Caudices<<81>>|<span class="term-trigger" tabindex="0">Caudices<span class="term-popup">Generally short, sometimes woody, more or less vertical stem of a perennial, at or beneath ground level.</span></span>|g){ }

if ($line =~ s| <<81>>caudices<<81>>|&nbsp;<span class="term-trigger" tabindex="0">caudices<span class="term-popup">Generally short, sometimes woody, more or less vertical stem of a perennial, at or beneath ground level.</span></span>|g){ }

if ($line =~ s|<<82>>Cauline<<82>>|<span class="term-trigger" tabindex="0">Cauline<span class="term-popup">Pertaining to structures, especially leaves, borne along (i.e., not confined to the base of) an elongate, above-ground  stem; not basal.</span></span>|g){ }

if ($line =~ s| <<82>>cauline<<82>>|&nbsp;<span class="term-trigger" tabindex="0">cauline<span class="term-popup">Pertaining to structures, especially leaves, borne along (i.e., not confined to the base of) an elongate, above-ground  stem; not basal.</span></span>|g){ }

if ($line =~ s|<<83>>Cespitose<<83>>|<span class="term-trigger" tabindex="0">Cespitose<span class="term-popup">Having a densely clumped, tufted, matted, or cushion-like growth form.</span></span>|g){ }

if ($line =~ s| <<83>>cespitose<<83>>|&nbsp;<span class="term-trigger" tabindex="0">cespitose<span class="term-popup"><img src="/eflora/common/images/morph/cespitose.jpg" class="term-img" alt="Morphology: cespitose">Having a densely clumped, tufted, matted, or cushion-like growth form.</span></span>|g){ }

if ($line =~ s|<<84>>Chamber<<84>>|<span class="term-trigger" tabindex="0">Chamber<span class="term-popup">Compartment or cavity within an ovary, capsule, or other hollow structure.</span></span>|g){ }

if ($line =~ s| <<84>>chamber<<84>>|&nbsp;<span class="term-trigger" tabindex="0">chamber<span class="term-popup">Compartment or cavity within an ovary, capsule, or other hollow structure.</span></span>|g){ }

if ($line =~ s|<<85>>Chambers<<85>>|<span class="term-trigger" tabindex="0">Chambers<span class="term-popup">Compartment or cavity within an ovary, capsule, or other hollow structure.</span></span>|g){ }

if ($line =~ s| <<85>>chambers<<85>>|&nbsp;<span class="term-trigger" tabindex="0">chambers<span class="term-popup">Compartment or cavity within an ovary, capsule, or other hollow structure.</span></span>|g){ }

if ($line =~ s|<<86>>Chaparral<<86>>|<span class="term-trigger" tabindex="0">Chaparral<span class="term-popup">Vegetation dominated by mostly evergreen shrubs with thick, leathery leaves and stiff branches.</span></span>|g){ }

if ($line =~ s| <<86>>chaparral<<86>>|&nbsp;<span class="term-trigger" tabindex="0">chaparral<span class="term-popup">Vegetation dominated by mostly evergreen shrubs with thick, leathery leaves and stiff branches.</span></span>|g){ }

if ($line =~ s|<<87>>Ciliate<<87>>|<span class="term-trigger" tabindex="0">Ciliate<span class="term-popup">Having generally straight, conspicuous hairs along margins or edges.</span></span>|g){ }

if ($line =~ s| <<87>>ciliate<<87>>|&nbsp;<span class="term-trigger" tabindex="0">ciliate<span class="term-popup"><img src="/eflora/common/images/morph/ciliate.jpg" class="term-img" alt="Morphology: ciliate">Having generally straight, conspicuous hairs along margins or edges.</span></span>|g){ }

if ($line =~ s|<<88>>Circumboreal<<88>>|<span class="term-trigger" tabindex="0">Circumboreal<span class="term-popup">Occurring around the world at northern latitudes.</span></span>|g){ }

if ($line =~ s| <<88>>circumboreal<<88>>|&nbsp;<span class="term-trigger" tabindex="0">circumboreal<span class="term-popup">Occurring around the world at northern latitudes.</span></span>|g){ }

if ($line =~ s|<<89>>Circumscissile<<89>>|<span class="term-trigger" tabindex="0">Circumscissile<span class="term-popup">Dehiscence, usually of a fruit (capsule), by a transverse line, the top coming off as a lid.</span></span>|g){ }

if ($line =~ s| <<89>>circumscissile<<89>>|&nbsp;<span class="term-trigger" tabindex="0">circumscissile<span class="term-popup"><img src="/eflora/common/images/morph/circumscissile.jpg" class="term-img" alt="Morphology: circumscissile">Dehiscence, usually of a fruit (capsule), by a transverse line, the top coming off as a lid.</span></span>|g){ }

if ($line =~ s|<<90>>Claw<<90>>|<span class="term-trigger" tabindex="0">Claw<span class="term-popup">Stalk-like base of some free or nearly free sepals or petals.</span></span>|g){ }

if ($line =~ s| <<90>>claw<<90>>|&nbsp;<span class="term-trigger" tabindex="0">claw<span class="term-popup">Stalk-like base of some free or nearly free sepals or petals.</span></span>|g){ }

if ($line =~ s|<<91>>Claws<<91>>|<span class="term-trigger" tabindex="0">Claws<span class="term-popup">Stalk-like base of some free or nearly free sepals or petals.</span></span>|g){ }

if ($line =~ s| <<91>>claws<<91>>|&nbsp;<span class="term-trigger" tabindex="0">claws<span class="term-popup">Stalk-like base of some free or nearly free sepals or petals.</span></span>|g){ }

if ($line =~ s|<<92>>Cleistogamous<<92>>|<span class="term-trigger" tabindex="0">Cleistogamous<span class="term-popup">Bud-like, unopening flowers that are generally self-fertilized.</span></span>|g){ }

if ($line =~ s| <<92>>cleistogamous<<92>>|&nbsp;<span class="term-trigger" tabindex="0">cleistogamous<span class="term-popup">Bud-like, unopening flowers that are generally self-fertilized.</span></span>|g){ }

if ($line =~ s|<<93>>Clone<<93>>|<span class="term-trigger" tabindex="0">Clone<span class="term-popup">Genetically identical individuals resulting from asexual reproduction (fragmentation of rhizomes or stolons, budding, etc.); often used for an apparent population, the members of which are or were connected (e.g., aspens, cattails, duckweeds, sumacs).</span></span>|g){ }

if ($line =~ s| <<93>>clone<<93>>|&nbsp;<span class="term-trigger" tabindex="0">clone<span class="term-popup">Genetically identical individuals resulting from asexual reproduction (fragmentation of rhizomes or stolons, budding, etc.); often used for an apparent population, the members of which are or were connected (e.g., aspens, cattails, duckweeds, sumacs).</span></span>|g){ }

if ($line =~ s|<<94>>Clones<<94>>|<span class="term-trigger" tabindex="0">Clones<span class="term-popup">Genetically identical individuals resulting from asexual reproduction (fragmentation of rhizomes or stolons, budding, etc.); often used for an apparent population, the members of which are or were connected (e.g., aspens, cattails, duckweeds, sumacs).</span></span>|g){ }

if ($line =~ s| <<94>>clones<<94>>|&nbsp;<span class="term-trigger" tabindex="0">clones<span class="term-popup">Genetically identical individuals resulting from asexual reproduction (fragmentation of rhizomes or stolons, budding, etc.); often used for an apparent population, the members of which are or were connected (e.g., aspens, cattails, duckweeds, sumacs).</span></span>|g){ }

if ($line =~ s|<<95>>Closed-cone forest<<95>>|<span class="term-trigger" tabindex="0">Closed-cone forest<span class="term-popup">Vegetation dominated by species of Pinus or Cupressus in which the seed cones persist unopened on the branches for extended periods of time; dominated by closely spaced +- tall trees.</span></span>|g){ }

if ($line =~ s| <<95>>closed-cone forest<<95>>|&nbsp;<span class="term-trigger" tabindex="0">closed-cone forest<span class="term-popup">Vegetation dominated by species of Pinus or Cupressus in which the seed cones persist unopened on the branches for extended periods of time; dominated by closely spaced +- tall trees.</span></span>|g){ }

if ($line =~ s|<<96>>Coastal redwood<<96>>|<span class="term-trigger" tabindex="0">Coastal redwood<span class="term-popup">Vegetation dominated by Sequoia sempervirens, occurring on slopes and canyons of coastal mountain ranges; dominated by closely spaced +- tall trees.</span></span>|g){ }

if ($line =~ s| <<96>>coastal redwood<<96>>|&nbsp;<span class="term-trigger" tabindex="0">coastal redwood<span class="term-popup">Vegetation dominated by Sequoia sempervirens, occurring on slopes and canyons of coastal mountain ranges; dominated by closely spaced +- tall trees.</span></span>|g){ }

if ($line =~ s|<<97>>Coastal scrub<<97>>|<span class="term-trigger" tabindex="0">Coastal scrub<span class="term-popup">Coastal vegetation dominated mostly by shrubs with flexible branches, e.g., Baccharis pilularis, Artemesia californica</span></span>|g){ }

if ($line =~ s| <<97>>coastal scrub<<97>>|&nbsp;<span class="term-trigger" tabindex="0">coastal scrub<span class="term-popup">Coastal vegetation dominated mostly by shrubs with flexible branches, e.g., Baccharis pilularis, Artemesia californica</span></span>|g){ }

if ($line =~ s|<<98>>Coastal strand<<98>>|<span class="term-trigger" tabindex="0">Coastal strand<span class="term-popup">Beach and foredune habitat, characterized by sandy soils, strong winds, salt spray, and wave action.</span></span>|g){ }

if ($line =~ s| <<98>>coastal strand<<98>>|&nbsp;<span class="term-trigger" tabindex="0">coastal strand<span class="term-popup">Beach and foredune habitat, characterized by sandy soils, strong winds, salt spray, and wave action.</span></span>|g){ }

if ($line =~ s|<<99>>Collar<<99>>|<span class="term-trigger" tabindex="0">Collar<span class="term-popup">1. In Poaceae, the abaxial junction of leaf sheath and blade. 2. Raised, inflated, or wing-like, encircling projection (e.g., the seeds of Delphinium luteum, D. nudicaule)</span></span>|g){ }

if ($line =~ s| <<99>>collar<<99>>|&nbsp;<span class="term-trigger" tabindex="0">collar<span class="term-popup">1. In Poaceae, the abaxial junction of leaf sheath and blade. 2. Raised, inflated, or wing-like, encircling projection (e.g., the seeds of Delphinium luteum, D. nudicaule)</span></span>|g){ }

if ($line =~ s|<<100>>Collars<<100>>|<span class="term-trigger" tabindex="0">Collars<span class="term-popup">1. In Poaceae, the abaxial junction of leaf sheath and blade. 2. Raised, inflated, or wing-like, encircling projection (e.g., the seeds of Delphinium luteum, D. nudicaule)</span></span>|g){ }

if ($line =~ s| <<100>>collars<<100>>|&nbsp;<span class="term-trigger" tabindex="0">collars<span class="term-popup">1. In Poaceae, the abaxial junction of leaf sheath and blade. 2. Raised, inflated, or wing-like, encircling projection (e.g., the seeds of Delphinium luteum, D. nudicaule)</span></span>|g){ }

if ($line =~ s|<<101>>Column<<101>>|<span class="term-trigger" tabindex="0">Column<span class="term-popup">Structure at the center of an orchid flower formed by fusion of stamen(s) and style.</span></span>|g){ }

if ($line =~ s| <<101>>column<<101>>|&nbsp;<span class="term-trigger" tabindex="0">column<span class="term-popup"><img src="/eflora/common/images/morph/orchid-column.jpg" class="term-img" alt="Morphology: column">Structure at the center of an orchid flower formed by fusion of stamen(s) and style.</span></span>|g){ }

if ($line =~ s|<<102>>Columns<<102>>|<span class="term-trigger" tabindex="0">Columns<span class="term-popup">Structure at the center of an orchid flower formed by fusion of stamen(s) and style.</span></span>|g){ }

if ($line =~ s| <<102>>columns<<102>>|&nbsp;<span class="term-trigger" tabindex="0">columns<span class="term-popup">Structure at the center of an orchid flower formed by fusion of stamen(s) and style.</span></span>|g){ }

if ($line =~ s|<<103>>Compound<<103>>|<span class="term-trigger" tabindex="0">Compound<span class="term-popup">1. Composed of two or more parts, as a compound leaf composed of leaflets or a compound pistil composed of fused or partly fused carpels.  2. Repeating a structural pattern (a compound umbel is an umbel of umbels).</span></span>|g){ }

if ($line =~ s| <<103>>compound<<103>>|&nbsp;<span class="term-trigger" tabindex="0">compound<span class="term-popup">1. Composed of two or more parts, as a compound leaf composed of leaflets or a compound pistil composed of fused or partly fused carpels.  2. Repeating a structural pattern (a compound umbel is an umbel of umbels).</span></span>|g){ }

if ($line =~ s|<<104>>Compressed<<104>>|<span class="term-trigger" tabindex="0">Compressed<span class="term-popup">Flattened side-to-side or front-to-back.</span></span>|g){ }

if ($line =~ s| <<104>>compressed<<104>>|&nbsp;<span class="term-trigger" tabindex="0">compressed<span class="term-popup"><img src="/eflora/common/images/morph/compressed.jpg" class="term-img" alt="Morphology: compressed">Flattened side-to-side or front-to-back.</span></span>|g){ }

if ($line =~ s|<<105>>Concave<<105>>|<span class="term-trigger" tabindex="0">Concave<span class="term-popup">Hollowed or indented, as the interior of a curved surface.</span></span>|g){ }

if ($line =~ s| <<105>>concave<<105>>|&nbsp;<span class="term-trigger" tabindex="0">concave<span class="term-popup">Hollowed or indented, as the interior of a curved surface.</span></span>|g){ }

if ($line =~ s|<<106>>Cone<<106>>|<span class="term-trigger" tabindex="0">Cone<span class="term-popup">Reproductive structure composed of an axis, scales, and sometimes bracts.  1.  Non-woody structure producing spores (e.g., clubmosses, horsetails) or pollen (e.g., male cone of conifers).  2. Generally woody structure producing seeds (e.g., female cones of most conifers).  (e.g., Abies concolor)</span></span>|g){ }

if ($line =~ s| <<106>>cone<<106>>|&nbsp;<span class="term-trigger" tabindex="0">cone<span class="term-popup">Reproductive structure composed of an axis, scales, and sometimes bracts.  1.  Non-woody structure producing spores (e.g., clubmosses, horsetails) or pollen (e.g., male cone of conifers).  2. Generally woody structure producing seeds (e.g., female cones of most conifers).  (e.g., Abies concolor)</span></span>|g){ }

if ($line =~ s|<<107>>Cones<<107>>|<span class="term-trigger" tabindex="0">Cones<span class="term-popup">Reproductive structure composed of an axis, scales, and sometimes bracts.  1.  Non-woody structure producing spores (e.g., clubmosses, horsetails) or pollen (e.g., male cone of conifers).  2. Generally woody structure producing seeds (e.g., female cones of most conifers).  (e.g., Abies concolor)</span></span>|g){ }

if ($line =~ s| <<107>>cones<<107>>|&nbsp;<span class="term-trigger" tabindex="0">cones<span class="term-popup">Reproductive structure composed of an axis, scales, and sometimes bracts.  1.  Non-woody structure producing spores (e.g., clubmosses, horsetails) or pollen (e.g., male cone of conifers).  2. Generally woody structure producing seeds (e.g., female cones of most conifers).  (e.g., Abies concolor)</span></span>|g){ }

if ($line =~ s|<<108>>Conic<<108>>|<span class="term-trigger" tabindex="0">Conic<span class="term-popup">Three-dimensional, defined by a wide, more or less round base, the sides evenly tapered to a narrow tip.</span></span>|g){ }

if ($line =~ s| <<108>>conic<<108>>|&nbsp;<span class="term-trigger" tabindex="0">conic<span class="term-popup">Three-dimensional, defined by a wide, more or less round base, the sides evenly tapered to a narrow tip.</span></span>|g){ }

if ($line =~ s|<<109>>Coniferous forest<<109>>|<span class="term-trigger" tabindex="0">Coniferous forest<span class="term-popup">Vegetation dominated by trees belonging to various species of conifers (e.g., firs, pines, redwoods); dominated by closely spaced +- tall trees.</span></span>|g){ }

if ($line =~ s| <<109>>coniferous forest<<109>>|&nbsp;<span class="term-trigger" tabindex="0">coniferous forest<span class="term-popup">Vegetation dominated by trees belonging to various species of conifers (e.g., firs, pines, redwoods); dominated by closely spaced +- tall trees.</span></span>|g){ }

if ($line =~ s|<<110>>Continuous<<110>>|<span class="term-trigger" tabindex="0">Continuous<span class="term-popup">Having parts spaced evenly and without interruption, not clumped; pertaining especially to  inflorescences in which the flowers are evenly spaced.</span></span>|g){ }

if ($line =~ s| <<110>>continuous<<110>>|&nbsp;<span class="term-trigger" tabindex="0">continuous<span class="term-popup">Having parts spaced evenly and without interruption, not clumped; pertaining especially to  inflorescences in which the flowers are evenly spaced.</span></span>|g){ }

if ($line =~ s|<<111>>Convex<<111>>|<span class="term-trigger" tabindex="0">Convex<span class="term-popup">Rounded outward, as the exterior of a curved surface.</span></span>|g){ }

if ($line =~ s| <<111>>convex<<111>>|&nbsp;<span class="term-trigger" tabindex="0">convex<span class="term-popup">Rounded outward, as the exterior of a curved surface.</span></span>|g){ }

if ($line =~ s|<<112>>Cordate<<112>>|<span class="term-trigger" tabindex="0">Cordate<span class="term-popup">Heart-shaped; often pertaining to a leaf in which the blade base on both sides of the petiole is rounded and convex.</span></span>|g){ }

if ($line =~ s| <<112>>cordate<<112>>|&nbsp;<span class="term-trigger" tabindex="0">cordate<span class="term-popup"><img src="/eflora/common/images/morph/cordate.jpg" class="term-img" alt="Morphology: cordate">Heart-shaped; often pertaining to a leaf in which the blade base on both sides of the petiole is rounded and convex.</span></span>|g){ }

if ($line =~ s|<<113>>Corm<<113>>|<span class="term-trigger" tabindex="0">Corm<span class="term-popup">Short, thick, unbranched, underground stem often surrounded by dry (not fleshy) leaves or leaf bases. (e.g., Muilla maritima)</span></span>|g){ }

if ($line =~ s| <<113>>corm<<113>>|&nbsp;<span class="term-trigger" tabindex="0">corm<span class="term-popup">Short, thick, unbranched, underground stem often surrounded by dry (not fleshy) leaves or leaf bases. (e.g., Muilla maritima)</span></span>|g){ }

if ($line =~ s|<<114>>Corms<<114>>|<span class="term-trigger" tabindex="0">Corms<span class="term-popup">Short, thick, unbranched, underground stem often surrounded by dry (not fleshy) leaves or leaf bases. (e.g., Muilla maritima)</span></span>|g){ }

if ($line =~ s| <<114>>corms<<114>>|&nbsp;<span class="term-trigger" tabindex="0">corms<span class="term-popup">Short, thick, unbranched, underground stem often surrounded by dry (not fleshy) leaves or leaf bases. (e.g., Muilla maritima)</span></span>|g){ }

if ($line =~ s|<<115>>Corolla<<115>>|<span class="term-trigger" tabindex="0">Corolla<span class="term-popup">Collective term for petals; whorl of flower parts immediately inside or above calyx, often large and brightly colored.  Sometimes indistinguishable from calyx.</span></span>|g){ }

if ($line =~ s| <<115>>corolla<<115>>|&nbsp;<span class="term-trigger" tabindex="0">corolla<span class="term-popup">Collective term for petals; whorl of flower parts immediately inside or above calyx, often large and brightly colored.  Sometimes indistinguishable from calyx.</span></span>|g){ }

if ($line =~ s|<<116>>Corollas<<116>>|<span class="term-trigger" tabindex="0">Corollas<span class="term-popup">Collective term for petals; whorl of flower parts immediately inside or above calyx, often large and brightly colored.  Sometimes indistinguishable from calyx.</span></span>|g){ }

if ($line =~ s| <<116>>corollas<<116>>|&nbsp;<span class="term-trigger" tabindex="0">corollas<span class="term-popup">Collective term for petals; whorl of flower parts immediately inside or above calyx, often large and brightly colored.  Sometimes indistinguishable from calyx.</span></span>|g){ }

if ($line =~ s|<<117>>Costa<<117>>|<span class="term-trigger" tabindex="0">Costa<span class="term-popup">In ferns, primary axis of a pinna.</span></span>|g){ }

if ($line =~ s| <<117>>costa<<117>>|&nbsp;<span class="term-trigger" tabindex="0">costa<span class="term-popup"><img src="/eflora/common/images/morph/fern-leaf-costa.jpg" class="term-img" alt="Morphology: costa">In ferns, primary axis of a pinna.</span></span>|g){ }

if ($line =~ s|<<118>>Costule<<118>>|<span class="term-trigger" tabindex="0">Costule<span class="term-popup">In ferns, primary axis of a pinnule.</span></span>|g){ }

if ($line =~ s| <<118>>costule<<118>>|&nbsp;<span class="term-trigger" tabindex="0">costule<span class="term-popup">In ferns, primary axis of a pinnule.</span></span>|g){ }

if ($line =~ s|<<119>>Costulet<<119>>|<span class="term-trigger" tabindex="0">Costulet<span class="term-popup">In ferns, primary axis of a pinnulet.</span></span>|g){ }

if ($line =~ s| <<119>>costulet<<119>>|&nbsp;<span class="term-trigger" tabindex="0">costulet<span class="term-popup">In ferns, primary axis of a pinnulet.</span></span>|g){ }

if ($line =~ s|<<120>>Cotyledon<<120>>|<span class="term-trigger" tabindex="0">Cotyledon<span class="term-popup">Seed-leaf; a modified leaf present in the seed, often functioning for food storage.  Persistent in some annuals and of aid in their identification.  (e.g., Lupinus microcarpus)</span></span>|g){ }

if ($line =~ s| <<120>>cotyledon<<120>>|&nbsp;<span class="term-trigger" tabindex="0">cotyledon<span class="term-popup">Seed-leaf; a modified leaf present in the seed, often functioning for food storage.  Persistent in some annuals and of aid in their identification.  (e.g., Lupinus microcarpus)</span></span>|g){ }

if ($line =~ s|<<121>>Cotyledons<<121>>|<span class="term-trigger" tabindex="0">Cotyledons<span class="term-popup">Seed-leaf; a modified leaf present in the seed, often functioning for food storage.  Persistent in some annuals and of aid in their identification.  (e.g., Lupinus microcarpus)</span></span>|g){ }

if ($line =~ s| <<121>>cotyledons<<121>>|&nbsp;<span class="term-trigger" tabindex="0">cotyledons<span class="term-popup">Seed-leaf; a modified leaf present in the seed, often functioning for food storage.  Persistent in some annuals and of aid in their identification.  (e.g., Lupinus microcarpus)</span></span>|g){ }

if ($line =~ s|<<122>>Crenate<<122>>|<span class="term-trigger" tabindex="0">Crenate<span class="term-popup">Pertaining to margins with shallow, rounded teeth, between which are usually acute sinuses (i.e., scalloped)</span></span>|g){ }

if ($line =~ s| <<122>>crenate<<122>>|&nbsp;<span class="term-trigger" tabindex="0">crenate<span class="term-popup"><img src="/eflora/common/images/morph/crenate.jpg" class="term-img" alt="Morphology: crenate">Pertaining to margins with shallow, rounded teeth, between which are usually acute sinuses (i.e., scalloped)</span></span>|g){ }

if ($line =~ s|<<123>>Cylindric<<123>>|<span class="term-trigger" tabindex="0">Cylindric<span class="term-popup">Elongate, with parallel sides and, at any point, round in transverse section.</span></span>|g){ }

if ($line =~ s| <<123>>cylindric<<123>>|&nbsp;<span class="term-trigger" tabindex="0">cylindric<span class="term-popup"><img src="/eflora/common/images/morph/cylindric.jpg" class="term-img" alt="Morphology: cylindric">Elongate, with parallel sides and, at any point, round in transverse section.</span></span>|g){ }

if ($line =~ s|<<124>>Cyme<<124>>|<span class="term-trigger" tabindex="0">Cyme<span class="term-popup">1. In flowering plants excluding Asteraceae and some other groups, a branched inflorescence in which the central or uppermost flower opens before the peripheral or lowermost flowers on any axis.  see 2. In Asteraceae and some other groups, a cyme-like inflorescence is one in which the central or uppermost inflorescence units (e.g., heads in Asteraceae, umbels enclosed by involucres in Eriogonum), instead of individual flowers, develop and mature before the peripheral or lowermost inflorescence units on any axis.</span></span>|g){ }

if ($line =~ s| <<124>>cyme<<124>>|&nbsp;<span class="term-trigger" tabindex="0">cyme<span class="term-popup"><img src="/eflora/common/images/morph/cyme.jpg" class="term-img" alt="Morphology: cyme">1. In flowering plants excluding Asteraceae and some other groups, a branched inflorescence in which the central or uppermost flower opens before the peripheral or lowermost flowers on any axis.  see 2. In Asteraceae and some other groups, a cyme-like inflorescence is one in which the central or uppermost inflorescence units (e.g., heads in Asteraceae, umbels enclosed by involucres in Eriogonum), instead of individual flowers, develop and mature before the peripheral or lowermost inflorescence units on any axis.</span></span>|g){ }

if ($line =~ s|<<125>>Cymes<<125>>|<span class="term-trigger" tabindex="0">Cymes<span class="term-popup">1. In flowering plants excluding Asteraceae and some other groups, a branched inflorescence in which the central or uppermost flower opens before the peripheral or lowermost flowers on any axis.  see 2. In Asteraceae and some other groups, a cyme-like inflorescence is one in which the central or uppermost inflorescence units (e.g., heads in Asteraceae, umbels enclosed by involucres in Eriogonum), instead of individual flowers, develop and mature before the peripheral or lowermost inflorescence units on any axis.</span></span>|g){ }

if ($line =~ s| <<125>>cymes<<125>>|&nbsp;<span class="term-trigger" tabindex="0">cymes<span class="term-popup"><img src="/eflora/common/images/morph/cyme.jpg" class="term-img" alt="Morphology: cymes">1. In flowering plants excluding Asteraceae and some other groups, a branched inflorescence in which the central or uppermost flower opens before the peripheral or lowermost flowers on any axis.  see 2. In Asteraceae and some other groups, a cyme-like inflorescence is one in which the central or uppermost inflorescence units (e.g., heads in Asteraceae, umbels enclosed by involucres in Eriogonum), instead of individual flowers, develop and mature before the peripheral or lowermost inflorescence units on any axis.</span></span>|g){ }

if ($line =~ s|<<126>>Deciduous<<126>>|<span class="term-trigger" tabindex="0">Deciduous<span class="term-popup">Falling off naturally.  1. Pertaining to leaves that all fall seasonally, or to plants that are seasonally leafless. 2.  Pertaining to structures, such as hairs or flower parts, that fall early or readily.</span></span>|g){ }

if ($line =~ s| <<126>>deciduous<<126>>|&nbsp;<span class="term-trigger" tabindex="0">deciduous<span class="term-popup">Falling off naturally.  1. Pertaining to leaves that all fall seasonally, or to plants that are seasonally leafless. 2.  Pertaining to structures, such as hairs or flower parts, that fall early or readily.</span></span>|g){ }

if ($line =~ s|<<127>>Decumbent<<127>>|<span class="term-trigger" tabindex="0">Decumbent<span class="term-popup">lying mostly flat on the ground but with tips curving up.</span></span>|g){ }

if ($line =~ s| <<127>>decumbent<<127>>|&nbsp;<span class="term-trigger" tabindex="0">decumbent<span class="term-popup"><img src="/eflora/common/images/morph/decumbent.jpg" class="term-img" alt="Morphology: decumbent">lying mostly flat on the ground but with tips curving up.</span></span>|g){ }

if ($line =~ s|<<128>>Decurrent<<128>>|<span class="term-trigger" tabindex="0">Decurrent<span class="term-popup">Pertaining to a wing-like or ridge-like extension basal to  the apparent  or actual point of attachment, particularly a leaf base that appears to continue onto the stem.</span></span>|g){ }

if ($line =~ s| <<128>>decurrent<<128>>|&nbsp;<span class="term-trigger" tabindex="0">decurrent<span class="term-popup"><img src="/eflora/common/images/morph/decurrent.jpg" class="term-img" alt="Morphology: decurrent">Pertaining to a wing-like or ridge-like extension basal to  the apparent  or actual point of attachment, particularly a leaf base that appears to continue onto the stem.</span></span>|g){ }

if ($line =~ s|<<129>>Dehiscent<<129>>|<span class="term-trigger" tabindex="0">Dehiscent<span class="term-popup">Opening at maturity to release contents; usually pertaining to anthers or fruits.</span></span>|g){ }

if ($line =~ s| <<129>>dehiscent<<129>>|&nbsp;<span class="term-trigger" tabindex="0">dehiscent<span class="term-popup"><img src="/eflora/common/images/morph/dehiscent.jpg" class="term-img" alt="Morphology: dehiscent">Opening at maturity to release contents; usually pertaining to anthers or fruits.</span></span>|g){ }

if ($line =~ s|<<130>>Deltate<<130>>|<span class="term-trigger" tabindex="0">Deltate<span class="term-popup">More or less equilaterally triangular, with the corners rounded or not.</span></span>|g){ }

if ($line =~ s| <<130>>deltate<<130>>|&nbsp;<span class="term-trigger" tabindex="0">deltate<span class="term-popup"><img src="/eflora/common/images/morph/deltate.jpg" class="term-img" alt="Morphology: deltate">More or less equilaterally triangular, with the corners rounded or not.</span></span>|g){ }

if ($line =~ s|<<131>>Dense<<131>>|<span class="term-trigger" tabindex="0">Dense<span class="term-popup">Congested or compact; especially pertaining to the disposition of flowers in an inflorescence.</span></span>|g){ }

if ($line =~ s| <<131>>dense<<131>>|&nbsp;<span class="term-trigger" tabindex="0">dense<span class="term-popup">Congested or compact; especially pertaining to the disposition of flowers in an inflorescence.</span></span>|g){ }

if ($line =~ s|<<132>>Dentate<<132>>|<span class="term-trigger" tabindex="0">Dentate<span class="term-popup">Having margins with sharp, relatively coarse teeth pointing outward, not tipward.</span></span>|g){ }

if ($line =~ s| <<132>>dentate<<132>>|&nbsp;<span class="term-trigger" tabindex="0">dentate<span class="term-popup"><img src="/eflora/common/images/morph/dentate.jpg" class="term-img" alt="Morphology: dentate">Having margins with sharp, relatively coarse teeth pointing outward, not tipward.</span></span>|g){ }

if ($line =~ s|<<133>>Depressed<<133>>|<span class="term-trigger" tabindex="0">Depressed<span class="term-popup">Flattened from above and below, or with the center lower than the margins.</span></span>|g){ }

if ($line =~ s| <<133>>depressed<<133>>|&nbsp;<span class="term-trigger" tabindex="0">depressed<span class="term-popup"><img src="/eflora/common/images/morph/depressed.jpg" class="term-img" alt="Morphology: depressed">Flattened from above and below, or with the center lower than the margins.</span></span>|g){ }

if ($line =~ s|<<134>>Desert<<134>>|<span class="term-trigger" tabindex="0">Desert<span class="term-popup">Region and associated communities characterized by low and irregular precipitation and prolonged periods of drought.</span></span>|g){ }

if ($line =~ s| <<134>>desert<<134>>|&nbsp;<span class="term-trigger" tabindex="0">desert<span class="term-popup">Region and associated communities characterized by low and irregular precipitation and prolonged periods of drought.</span></span>|g){ }

if ($line =~ s|<<135>>Dioecious<<135>>|<span class="term-trigger" tabindex="0">Dioecious<span class="term-popup">Pertaining to a taxon in which individuals produce either male or female reproductive structures, and do not produce bisexual reproductive structures.  (e.g., Salix laevigata)</span></span>|g){ }

if ($line =~ s| <<135>>dioecious<<135>>|&nbsp;<span class="term-trigger" tabindex="0">dioecious<span class="term-popup">Pertaining to a taxon in which individuals produce either male or female reproductive structures, and do not produce bisexual reproductive structures.  (e.g., Salix laevigata)</span></span>|g){ }

if ($line =~ s|<<136>>Digitate<<136>>|<span class="term-trigger" tabindex="0">Digitate<span class="term-popup">In Poaceae, pertaining to an inflorescence of two or more spike-like branches attached at the same point at the apex of the inflorescence stalk.</span></span>|g){ }

if ($line =~ s| <<136>>digitate<<136>>|&nbsp;<span class="term-trigger" tabindex="0">digitate<span class="term-popup">In Poaceae, pertaining to an inflorescence of two or more spike-like branches attached at the same point at the apex of the inflorescence stalk.</span></span>|g){ }

if ($line =~ s|<<137>>Diploid<<137>>|<span class="term-trigger" tabindex="0">Diploid<span class="term-popup">Having two sets of chromosomes (maternal and paternal); 2n.</span></span>|g){ }

if ($line =~ s| <<137>>diploid<<137>>|&nbsp;<span class="term-trigger" tabindex="0">diploid<span class="term-popup">Having two sets of chromosomes (maternal and paternal); 2n.</span></span>|g){ }

if ($line =~ s|<<138>>Disciform head<<138>>|<span class="term-trigger" tabindex="0">Disciform head<span class="term-popup">In Asteraceae, a head composed of disk flowers and marginal pistillate (or sterile) flowers with minute or missing laminae, superficially similar to discoid head.</span></span>|g){ }

if ($line =~ s| <<138>>disciform head<<138>>|&nbsp;<span class="term-trigger" tabindex="0">disciform head<span class="term-popup">In Asteraceae, a head composed of disk flowers and marginal pistillate (or sterile) flowers with minute or missing laminae, superficially similar to discoid head.</span></span>|g){ }

if ($line =~ s|<<139>>Discoid head<<139>>|<span class="term-trigger" tabindex="0">Discoid head<span class="term-popup">In Asteraceae, a head composed entirely of disk flowers.</span></span>|g){ }

if ($line =~ s| <<139>>discoid head<<139>>|&nbsp;<span class="term-trigger" tabindex="0">discoid head<span class="term-popup">In Asteraceae, a head composed entirely of disk flowers.</span></span>|g){ }

if ($line =~ s|<<140>>Disk flower<<140>>|<span class="term-trigger" tabindex="0">Disk flower<span class="term-popup">In Asteraceae, a generally bisexual (occasionally staminate or sterile, never pistillate), generally radial flower with a 5- (rarely 4-) lobed corolla; appearing without other flower types (in discoid head), or with marginal flowers of a different type (in radiate, radiant, or disciform heads).</span></span>|g){ }

if ($line =~ s| <<140>>disk flower<<140>>|&nbsp;<span class="term-trigger" tabindex="0">disk flower<span class="term-popup">In Asteraceae, a generally bisexual (occasionally staminate or sterile, never pistillate), generally radial flower with a 5- (rarely 4-) lobed corolla; appearing without other flower types (in discoid head), or with marginal flowers of a different type (in radiate, radiant, or disciform heads).</span></span>|g){ }

if ($line =~ s|<<141>>Disk flowers<<141>>|<span class="term-trigger" tabindex="0">Disk flowers<span class="term-popup">In Asteraceae, a generally bisexual (occasionally staminate or sterile, never pistillate), generally radial flower with a 5- (rarely 4-) lobed corolla; appearing without other flower types (in discoid head), or with marginal flowers of a different type (in radiate, radiant, or disciform heads).</span></span>|g){ }

if ($line =~ s| <<141>>disk flowers<<141>>|&nbsp;<span class="term-trigger" tabindex="0">disk flowers<span class="term-popup">In Asteraceae, a generally bisexual (occasionally staminate or sterile, never pistillate), generally radial flower with a 5- (rarely 4-) lobed corolla; appearing without other flower types (in discoid head), or with marginal flowers of a different type (in radiate, radiant, or disciform heads).</span></span>|g){ }

if ($line =~ s|<<142>>Dissected<<142>>|<span class="term-trigger" tabindex="0">Dissected<span class="term-popup">Deeply, often sharply cut but not compound; usually pertaining to leaves.  (e.g., Cymopteris deserticola)</span></span>|g){ }

if ($line =~ s| <<142>>dissected<<142>>|&nbsp;<span class="term-trigger" tabindex="0">dissected<span class="term-popup">Deeply, often sharply cut but not compound; usually pertaining to leaves.  (e.g., Cymopteris deserticola)</span></span>|g){ }

if ($line =~ s|<<143>>Distal<<143>>|<span class="term-trigger" tabindex="0">Distal<span class="term-popup">Farther away from the base, origin, or point of attachment, or closer to the edge or tip.</span></span>|g){ }

if ($line =~ s| <<143>>distal<<143>>|&nbsp;<span class="term-trigger" tabindex="0">distal<span class="term-popup">Farther away from the base, origin, or point of attachment, or closer to the edge or tip.</span></span>|g){ }

if ($line =~ s|<<144>>Distally<<144>>|<span class="term-trigger" tabindex="0">Distally<span class="term-popup">Farther away from the base, origin, or point of attachment, or closer to the edge or tip.</span></span>|g){ }

if ($line =~ s| <<144>>distally<<144>>|&nbsp;<span class="term-trigger" tabindex="0">distally<span class="term-popup">Farther away from the base, origin, or point of attachment, or closer to the edge or tip.</span></span>|g){ }

if ($line =~ s|<<145>>Drupe<<145>>|<span class="term-trigger" tabindex="0">Drupe<span class="term-popup">Fleshy or pulpy, indehiscent, superficially berry-like fruit in which 1 seed is encased in a stone (as in cherries), or more than 1 seed is encased in an equal number of free or variously fused stones (as in manzanitas).  (e.g., Prunus emarginata fruit)</span></span>|g){ }

if ($line =~ s| <<145>>drupe<<145>>|&nbsp;<span class="term-trigger" tabindex="0">drupe<span class="term-popup">Fleshy or pulpy, indehiscent, superficially berry-like fruit in which 1 seed is encased in a stone (as in cherries), or more than 1 seed is encased in an equal number of free or variously fused stones (as in manzanitas).  (e.g., Prunus emarginata fruit)</span></span>|g){ }

if ($line =~ s|<<146>>Drupes<<146>>|<span class="term-trigger" tabindex="0">Drupes<span class="term-popup">Fleshy or pulpy, indehiscent, superficially berry-like fruit in which 1 seed is encased in a stone (as in cherries), or more than 1 seed is encased in an equal number of free or variously fused stones (as in manzanitas).  (e.g., Prunus emarginata fruit)</span></span>|g){ }

if ($line =~ s| <<146>>drupes<<146>>|&nbsp;<span class="term-trigger" tabindex="0">drupes<span class="term-popup">Fleshy or pulpy, indehiscent, superficially berry-like fruit in which 1 seed is encased in a stone (as in cherries), or more than 1 seed is encased in an equal number of free or variously fused stones (as in manzanitas).  (e.g., Prunus emarginata fruit)</span></span>|g){ }

if ($line =~ s|<<147>>Dune<<147>>|<span class="term-trigger" tabindex="0">Dune<span class="term-popup">Hill or ridge of sand formed by the wind.</span></span>|g){ }

if ($line =~ s| <<147>>dune<<147>>|&nbsp;<span class="term-trigger" tabindex="0">dune<span class="term-popup">Hill or ridge of sand formed by the wind.</span></span>|g){ }

if ($line =~ s|<<148>>Dunes<<148>>|<span class="term-trigger" tabindex="0">Dunes<span class="term-popup">Hill or ridge of sand formed by the wind.</span></span>|g){ }

if ($line =~ s| <<148>>dunes<<148>>|&nbsp;<span class="term-trigger" tabindex="0">dunes<span class="term-popup">Hill or ridge of sand formed by the wind.</span></span>|g){ }

if ($line =~ s|<<149>>Elliptic<<149>>|<span class="term-trigger" tabindex="0">Elliptic<span class="term-popup">In the shape of a flattened circle or ellipse; wider than linear</span></span>|g){ }

if ($line =~ s| <<149>>elliptic<<149>>|&nbsp;<span class="term-trigger" tabindex="0">elliptic<span class="term-popup"><img src="/eflora/common/images/morph/elliptic.jpg" class="term-img" alt="Morphology: elliptic">In the shape of a flattened circle or ellipse; wider than linear</span></span>|g){ }

if ($line =~ s|<<150>>Emergent<<150>>|<span class="term-trigger" tabindex="0">Emergent<span class="term-popup">Pertaining to a plant normally rooted underwater and extending above the water surface, or to a part of such a plant normally held above the water surface.  (e.g., Polygonum amphibium)</span></span>|g){ }

if ($line =~ s| <<150>>emergent<<150>>|&nbsp;<span class="term-trigger" tabindex="0">emergent<span class="term-popup">Pertaining to a plant normally rooted underwater and extending above the water surface, or to a part of such a plant normally held above the water surface.  (e.g., Polygonum amphibium)</span></span>|g){ }

if ($line =~ s|<<151>>Endemic<<151>>|<span class="term-trigger" tabindex="0">Endemic<span class="term-popup">Native to and restricted to a defined geographic area.</span></span>|g){ }

if ($line =~ s| <<151>>endemic<<151>>|&nbsp;<span class="term-trigger" tabindex="0">endemic<span class="term-popup">Native to and restricted to a defined geographic area.</span></span>|g){ }

if ($line =~ s|<<152>>Entire<<152>>|<span class="term-trigger" tabindex="0">Entire<span class="term-popup">Having margins that are continuous and smooth (i.e., without teeth, lobes, etc.).</span></span>|g){ }

if ($line =~ s| <<152>>entire<<152>>|&nbsp;<span class="term-trigger" tabindex="0">entire<span class="term-popup"><img src="/eflora/common/images/morph/entire.jpg" class="term-img" alt="Morphology: entire">Having margins that are continuous and smooth (i.e., without teeth, lobes, etc.).</span></span>|g){ }

if ($line =~ s|<<153>>Ephemeral<<153>>|<span class="term-trigger" tabindex="0">Ephemeral<span class="term-popup">Lasting a short time.  1. Pertaining to individual plants, completing the life cycle (germination through death) or growth cycle in much less than one year.   2.  Pertaining to plant parts,  falling early or remaining functional for a relatively short time (e.g., less than a day for flower parts).</span></span>|g){ }

if ($line =~ s| <<153>>ephemeral<<153>>|&nbsp;<span class="term-trigger" tabindex="0">ephemeral<span class="term-popup">Lasting a short time.  1. Pertaining to individual plants, completing the life cycle (germination through death) or growth cycle in much less than one year.   2.  Pertaining to plant parts,  falling early or remaining functional for a relatively short time (e.g., less than a day for flower parts).</span></span>|g){ }

if ($line =~ s|<<154>>Epidermis<<154>>|<span class="term-trigger" tabindex="0">Epidermis<span class="term-popup">Outermost cell layer (or layers) of non-woody plant parts.</span></span>|g){ }

if ($line =~ s| <<154>>epidermis<<154>>|&nbsp;<span class="term-trigger" tabindex="0">epidermis<span class="term-popup">Outermost cell layer (or layers) of non-woody plant parts.</span></span>|g){ }

if ($line =~ s|<<155>>Epipetalous<<155>>|<span class="term-trigger" tabindex="0">Epipetalous<span class="term-popup">Pertaining to stamens that are fused to the petals to various extents and therefore appear to arise from them.</span></span>|g){ }

if ($line =~ s| <<155>>epipetalous<<155>>|&nbsp;<span class="term-trigger" tabindex="0">epipetalous<span class="term-popup"><img src="/eflora/common/images/morph/epipetalous-stamens.jpg" class="term-img" alt="Morphology: epipetalous">Pertaining to stamens that are fused to the petals to various extents and therefore appear to arise from them.</span></span>|g){ }

if ($line =~ s|<<156>>Erect<<156>>|<span class="term-trigger" tabindex="0">Erect<span class="term-popup">Upright; vertically oriented.</span></span>|g){ }

if ($line =~ s| <<156>>erect<<156>>|&nbsp;<span class="term-trigger" tabindex="0">erect<span class="term-popup"><img src="/eflora/common/images/morph/erect.jpg" class="term-img" alt="Morphology: erect">Upright; vertically oriented.</span></span>|g){ }

if ($line =~ s|<<157>>Estuarine<<157>>|<span class="term-trigger" tabindex="0">Estuarine<span class="term-popup">Pertaining to aquatic habitats where freshwater from streams mixes with sea water in a protected area, resulting in a gradation of brackish waters with varying degrees of salinity.</span></span>|g){ }

if ($line =~ s| <<157>>estuarine<<157>>|&nbsp;<span class="term-trigger" tabindex="0">estuarine<span class="term-popup">Pertaining to aquatic habitats where freshwater from streams mixes with sea water in a protected area, resulting in a gradation of brackish waters with varying degrees of salinity.</span></span>|g){ }

if ($line =~ s|<<158>>Evergreen<<158>>|<span class="term-trigger" tabindex="0">Evergreen<span class="term-popup">Never leafless; usually pertaining to leaves that remain green and on the plant for more than one season, and that do not all fall seasonally, or to plants that are never leafless.</span></span>|g){ }

if ($line =~ s| <<158>>evergreen<<158>>|&nbsp;<span class="term-trigger" tabindex="0">evergreen<span class="term-popup">Never leafless; usually pertaining to leaves that remain green and on the plant for more than one season, and that do not all fall seasonally, or to plants that are never leafless.</span></span>|g){ }

if ($line =~ s|<<159>>Exceeding<<159>>|<span class="term-trigger" tabindex="0">Exceeding<span class="term-popup">Surpassing tipward, due to relative orientation or length of the structures involved (e.g., lateral branches exceeding inflorescences; hoods exceeded by anther head in Asclepias californica; hoods slightly exceeding anther head in Asclepias erosa).</span></span>|g){ }

if ($line =~ s| <<159>>exceeding<<159>>|&nbsp;<span class="term-trigger" tabindex="0">exceeding<span class="term-popup">Surpassing tipward, due to relative orientation or length of the structures involved (e.g., lateral branches exceeding inflorescences; hoods exceeded by anther head in Asclepias californica; hoods slightly exceeding anther head in Asclepias erosa).</span></span>|g){ }

if ($line =~ s|<<160>>Exserted<<160>>|<span class="term-trigger" tabindex="0">Exserted<span class="term-popup">Protruding out of surrounding structure(s) (e.g., stamens exserted from corolla).</span></span>|g){ }

if ($line =~ s| <<160>>exserted<<160>>|&nbsp;<span class="term-trigger" tabindex="0">exserted<span class="term-popup"><img src="/eflora/common/images/morph/exserted-stamens.jpg" class="term-img" alt="Morphology: exserted">Protruding out of surrounding structure(s) (e.g., stamens exserted from corolla).</span></span>|g){ }

if ($line =~ s|<<161>>Extant<<161>>|<span class="term-trigger" tabindex="0">Extant<span class="term-popup">Currently existing or surviving somewhere.</span></span>|g){ }

if ($line =~ s| <<161>>extant<<161>>|&nbsp;<span class="term-trigger" tabindex="0">extant<span class="term-popup">Currently existing or surviving somewhere.</span></span>|g){ }

if ($line =~ s|<<162>>Extinct<<162>>|<span class="term-trigger" tabindex="0">Extinct<span class="term-popup">No longer existing or surviving anywhere.</span></span>|g){ }

if ($line =~ s| <<162>>extinct<<162>>|&nbsp;<span class="term-trigger" tabindex="0">extinct<span class="term-popup">No longer existing or surviving anywhere.</span></span>|g){ }

if ($line =~ s|<<163>>Extirpated<<163>>|<span class="term-trigger" tabindex="0">Extirpated<span class="term-popup">No longer existing or surviving in a defined geographic area, as either a direct or indirect result of human activity.</span></span>|g){ }

if ($line =~ s| <<163>>extirpated<<163>>|&nbsp;<span class="term-trigger" tabindex="0">extirpated<span class="term-popup">No longer existing or surviving in a defined geographic area, as either a direct or indirect result of human activity.</span></span>|g){ }

if ($line =~ s|<<164>>Exudate<<164>>|<span class="term-trigger" tabindex="0">Exudate<span class="term-popup">Material discharged (exuded) from a plant, often with characteristic odor, color, or texture (e.g., sticky, gummy, slippery).</span></span>|g){ }

if ($line =~ s| <<164>>exudate<<164>>|&nbsp;<span class="term-trigger" tabindex="0">exudate<span class="term-popup">Material discharged (exuded) from a plant, often with characteristic odor, color, or texture (e.g., sticky, gummy, slippery).</span></span>|g){ }

if ($line =~ s|<<165>>Fertile<<165>>|<span class="term-trigger" tabindex="0">Fertile<span class="term-popup">Reproductively functional; pertaining to a plant or plant part that produces or is associated with the production of functional spores, pollen, ovules, or seeds (e.g., fertile frond, fertile stamen, fertile flower, fertile floret).</span></span>|g){ }

if ($line =~ s| <<165>>fertile<<165>>|&nbsp;<span class="term-trigger" tabindex="0">fertile<span class="term-popup">Reproductively functional; pertaining to a plant or plant part that produces or is associated with the production of functional spores, pollen, ovules, or seeds (e.g., fertile frond, fertile stamen, fertile flower, fertile floret).</span></span>|g){ }

if ($line =~ s|<<166>>Fibrous<<166>>|<span class="term-trigger" tabindex="0">Fibrous<span class="term-popup">1. Pertaining to structures that are composed at least in part of more or less thread-like but usually tough elements (e.g., Yucca leaves).  2.  Pertaining to a root system composed of many roots similar in length and thickness (e.g., grass roots).</span></span>|g){ }

if ($line =~ s| <<166>>fibrous<<166>>|&nbsp;<span class="term-trigger" tabindex="0">fibrous<span class="term-popup"><img src="/eflora/common/images/morph/fibrous-roots.jpg" class="term-img" alt="Morphology: fibrous">1. Pertaining to structures that are composed at least in part of more or less thread-like but usually tough elements (e.g., Yucca leaves).  2.  Pertaining to a root system composed of many roots similar in length and thickness (e.g., grass roots).</span></span>|g){ }

if ($line =~ s|<<167>>Filament<<167>>|<span class="term-trigger" tabindex="0">Filament<span class="term-popup">Anther-stalk portion of a stamen, often thread-like.</span></span>|g){ }

if ($line =~ s| <<167>>filament<<167>>|&nbsp;<span class="term-trigger" tabindex="0">filament<span class="term-popup">Anther-stalk portion of a stamen, often thread-like.</span></span>|g){ }

if ($line =~ s|<<168>>Filaments<<168>>|<span class="term-trigger" tabindex="0">Filaments<span class="term-popup">Anther-stalk portion of a stamen, often thread-like.</span></span>|g){ }

if ($line =~ s| <<168>>filaments<<168>>|&nbsp;<span class="term-trigger" tabindex="0">filaments<span class="term-popup">Anther-stalk portion of a stamen, often thread-like.</span></span>|g){ }

if ($line =~ s|<<169>>Fleshy<<169>>|<span class="term-trigger" tabindex="0">Fleshy<span class="term-popup">Thick and juicy; succulent.  (e.g., Sesuvium verrucosum)</span></span>|g){ }

if ($line =~ s| <<169>>fleshy<<169>>|&nbsp;<span class="term-trigger" tabindex="0">fleshy<span class="term-popup">Thick and juicy; succulent.  (e.g., Sesuvium verrucosum)</span></span>|g){ }

if ($line =~ s|<<170>>Floret<<170>>|<span class="term-trigger" tabindex="0">Floret<span class="term-popup">In Poaceae, a single flower and its immediately subtending bracts (lemma and generally palea, the lemma subtending the palea when the latter is present); in a sterile floret, the flower and sometimes palea are rudimentary or absent.</span></span>|g){ }

if ($line =~ s| <<170>>floret<<170>>|&nbsp;<span class="term-trigger" tabindex="0">floret<span class="term-popup">In Poaceae, a single flower and its immediately subtending bracts (lemma and generally palea, the lemma subtending the palea when the latter is present); in a sterile floret, the flower and sometimes palea are rudimentary or absent.</span></span>|g){ }

if ($line =~ s|<<171>>Florets<<171>>|<span class="term-trigger" tabindex="0">Florets<span class="term-popup">In Poaceae, a single flower and its immediately subtending bracts (lemma and generally palea, the lemma subtending the palea when the latter is present); in a sterile floret, the flower and sometimes palea are rudimentary or absent.</span></span>|g){ }

if ($line =~ s| <<171>>florets<<171>>|&nbsp;<span class="term-trigger" tabindex="0">florets<span class="term-popup"><img src="/eflora/common/images/morph/grass-florets.jpg" class="term-img" alt="Morphology: florets">In Poaceae, a single flower and its immediately subtending bracts (lemma and generally palea, the lemma subtending the palea when the latter is present); in a sterile floret, the flower and sometimes palea are rudimentary or absent.</span></span>|g){ }

if ($line =~ s|<<172>>Follicle<<172>>|<span class="term-trigger" tabindex="0">Follicle<span class="term-popup">Dry fruit from a simple pistil, dehiscent on only one side, along a single suture.  A single flower may develop into a simple fruit of 1 follicle or an aggregate fruit of several follicles.</span></span>|g){ }

if ($line =~ s| <<172>>follicle<<172>>|&nbsp;<span class="term-trigger" tabindex="0">follicle<span class="term-popup">Dry fruit from a simple pistil, dehiscent on only one side, along a single suture.  A single flower may develop into a simple fruit of 1 follicle or an aggregate fruit of several follicles.</span></span>|g){ }

if ($line =~ s|<<173>>Follicles<<173>>|<span class="term-trigger" tabindex="0">Follicles<span class="term-popup">Dry fruit from a simple pistil, dehiscent on only one side, along a single suture.  A single flower may develop into a simple fruit of 1 follicle or an aggregate fruit of several follicles.</span></span>|g){ }

if ($line =~ s| <<173>>follicles<<173>>|&nbsp;<span class="term-trigger" tabindex="0">follicles<span class="term-popup"><img src="/eflora/common/images/morph/follicles.jpg" class="term-img" alt="Morphology: follicles">Dry fruit from a simple pistil, dehiscent on only one side, along a single suture.  A single flower may develop into a simple fruit of 1 follicle or an aggregate fruit of several follicles.</span></span>|g){ }

if ($line =~ s|<<174>>Foothill<<174>>|<span class="term-trigger" tabindex="0">Foothill<span class="term-popup">Slope at the base of a mountain; especially applied to such features in CA-FP.</span></span>|g){ }

if ($line =~ s| <<174>>foothill<<174>>|&nbsp;<span class="term-trigger" tabindex="0">foothill<span class="term-popup">Slope at the base of a mountain; especially applied to such features in CA-FP.</span></span>|g){ }

if ($line =~ s|<<175>>Foothills<<175>>|<span class="term-trigger" tabindex="0">Foothills<span class="term-popup">Slope at the base of a mountain; especially applied to such features in CA-FP.</span></span>|g){ }

if ($line =~ s| <<175>>foothills<<175>>|&nbsp;<span class="term-trigger" tabindex="0">foothills<span class="term-popup">Slope at the base of a mountain; especially applied to such features in CA-FP.</span></span>|g){ }

if ($line =~ s|<<176>>Forked<<176>>|<span class="term-trigger" tabindex="0">Forked<span class="term-popup">Pertaining to a hair or other structure that branches into two parts.</span></span>|g){ }

if ($line =~ s| <<176>>forked<<176>>|&nbsp;<span class="term-trigger" tabindex="0">forked<span class="term-popup"><img src="/eflora/common/images/morph/forked.jpg" class="term-img" alt="Morphology: forked">Pertaining to a hair or other structure that branches into two parts.</span></span>|g){ }

if ($line =~ s|<<177>>Free<<177>>|<span class="term-trigger" tabindex="0">Free<span class="term-popup">Neither fused to nor adherent to other parts; distinct, separate.</span></span>|g){ }

if ($line =~ s| <<177>>free<<177>>|&nbsp;<span class="term-trigger" tabindex="0">free<span class="term-popup">Neither fused to nor adherent to other parts; distinct, separate.</span></span>|g){ }

if ($line =~ s|<<178>>Free-central<<178>>|<span class="term-trigger" tabindex="0">Free-central<span class="term-popup">Pertaining to a placenta along the central axis in a compound ovary with only one chamber.</span></span>|g){ }

if ($line =~ s| <<178>>free-central<<178>>|&nbsp;<span class="term-trigger" tabindex="0">free-central<span class="term-popup"><img src="/eflora/common/images/morph/free-central-placenta.jpg" class="term-img" alt="Morphology: free-central">Pertaining to a placenta along the central axis in a compound ovary with only one chamber.</span></span>|g){ }

if ($line =~ s|<<179>>Fringed<<179>>|<span class="term-trigger" tabindex="0">Fringed<span class="term-popup">Having ragged or finely cut margins.</span></span>|g){ }

if ($line =~ s| <<179>>fringed<<179>>|&nbsp;<span class="term-trigger" tabindex="0">fringed<span class="term-popup"><img src="/eflora/common/images/morph/fringed.jpg" class="term-img" alt="Morphology: fringed">Having ragged or finely cut margins.</span></span>|g){ }

if ($line =~ s|<<180>>Frond<<180>>|<span class="term-trigger" tabindex="0">Frond<span class="term-popup">In ferns, a leaf, often compound or dissected, borne on a rhizome.</span></span>|g){ }

if ($line =~ s| <<180>>frond<<180>>|&nbsp;<span class="term-trigger" tabindex="0">frond<span class="term-popup">In ferns, a leaf, often compound or dissected, borne on a rhizome.</span></span>|g){ }

if ($line =~ s|<<181>>Fruit<<181>>|<span class="term-trigger" tabindex="0">Fruit<span class="term-popup">An ovary or ovaries and sometimes associated structures after ovule  fertilization (i.e., seed initiation).  A simple fruit develops from one ovary (e.g., cherry, apple, the latter derived largely from the hypanthium); aggregate and multiple fruits develop from ovaries of one and more than one flower, respectively, that remain distinct yet held together as a unit (e.g., a strawberry is an aggregate fruit of achenes held together by a juicy, red flower receptacle; a fig is a multiple fruit of achenes surrounded by a fleshy inflorescence receptacle.</span></span>|g){ }

if ($line =~ s| <<181>>fruit<<181>>|&nbsp;<span class="term-trigger" tabindex="0">fruit<span class="term-popup">An ovary or ovaries and sometimes associated structures after ovule  fertilization (i.e., seed initiation).  A simple fruit develops from one ovary (e.g., cherry, apple, the latter derived largely from the hypanthium); aggregate and multiple fruits develop from ovaries of one and more than one flower, respectively, that remain distinct yet held together as a unit (e.g., a strawberry is an aggregate fruit of achenes held together by a juicy, red flower receptacle; a fig is a multiple fruit of achenes surrounded by a fleshy inflorescence receptacle.</span></span>|g){ }

if ($line =~ s|<<182>>Fruits<<182>>|<span class="term-trigger" tabindex="0">Fruits<span class="term-popup">An ovary or ovaries and sometimes associated structures after ovule  fertilization (i.e., seed initiation).  A simple fruit develops from one ovary (e.g., cherry, apple, the latter derived largely from the hypanthium); aggregate and multiple fruits develop from ovaries of one and more than one flower, respectively, that remain distinct yet held together as a unit (e.g., a strawberry is an aggregate fruit of achenes held together by a juicy, red flower receptacle; a fig is a multiple fruit of achenes surrounded by a fleshy inflorescence receptacle.</span></span>|g){ }

if ($line =~ s| <<182>>fruits<<182>>|&nbsp;<span class="term-trigger" tabindex="0">fruits<span class="term-popup">An ovary or ovaries and sometimes associated structures after ovule  fertilization (i.e., seed initiation).  A simple fruit develops from one ovary (e.g., cherry, apple, the latter derived largely from the hypanthium); aggregate and multiple fruits develop from ovaries of one and more than one flower, respectively, that remain distinct yet held together as a unit (e.g., a strawberry is an aggregate fruit of achenes held together by a juicy, red flower receptacle; a fig is a multiple fruit of achenes surrounded by a fleshy inflorescence receptacle.</span></span>|g){ }

if ($line =~ s|<<183>>Funnel-shaped<<183>>|<span class="term-trigger" tabindex="0">Funnel-shaped<span class="term-popup">Widening from the base more or less gradually through the throat into an ascending, spreading, or recurved limb; often applied to a fused calyx or corolla.</span></span>|g){ }

if ($line =~ s| <<183>>funnel-shaped<<183>>|&nbsp;<span class="term-trigger" tabindex="0">funnel-shaped<span class="term-popup"><img src="/eflora/common/images/morph/funnel-shaped.jpg" class="term-img" alt="Morphology: funnel-shaped">Widening from the base more or less gradually through the throat into an ascending, spreading, or recurved limb; often applied to a fused calyx or corolla.</span></span>|g){ }

if ($line =~ s|<<184>>Fused<<184>>|<span class="term-trigger" tabindex="0">Fused<span class="term-popup">United, as the petals together into a corolla tube or stamens onto petals; neither free nor adherent.</span></span>|g){ }

if ($line =~ s| <<184>>fused<<184>>|&nbsp;<span class="term-trigger" tabindex="0">fused<span class="term-popup">United, as the petals together into a corolla tube or stamens onto petals; neither free nor adherent.</span></span>|g){ }

if ($line =~ s|<<185>>Fusiform<<185>>|<span class="term-trigger" tabindex="0">Fusiform<span class="term-popup">Elongate, widest at the middle, tapered to both ends.</span></span>|g){ }

if ($line =~ s| <<185>>fusiform<<185>>|&nbsp;<span class="term-trigger" tabindex="0">fusiform<span class="term-popup"><img src="/eflora/common/images/morph/fusiform.jpg" class="term-img" alt="Morphology: fusiform">Elongate, widest at the middle, tapered to both ends.</span></span>|g){ }

if ($line =~ s|<<186>>Glabrous<<186>>|<span class="term-trigger" tabindex="0">Glabrous<span class="term-popup">Without hairs.</span></span>|g){ }

if ($line =~ s| <<186>>glabrous<<186>>|&nbsp;<span class="term-trigger" tabindex="0">glabrous<span class="term-popup">Without hairs.</span></span>|g){ }

if ($line =~ s|<<187>>Gland<<187>>|<span class="term-trigger" tabindex="0">Gland<span class="term-popup">A small, often spheric body, on or embedded in the epidermis or at the tip of a hair, that exudes a generally sticky substance.  (e.g., Psorothamnus arborescens)</span></span>|g){ }

if ($line =~ s| <<187>>gland<<187>>|&nbsp;<span class="term-trigger" tabindex="0">gland<span class="term-popup">A small, often spheric body, on or embedded in the epidermis or at the tip of a hair, that exudes a generally sticky substance.  (e.g., Psorothamnus arborescens)</span></span>|g){ }

if ($line =~ s|<<188>>Glands<<188>>|<span class="term-trigger" tabindex="0">Glands<span class="term-popup">A small, often spheric body, on or embedded in the epidermis or at the tip of a hair, that exudes a generally sticky substance.  (e.g., Psorothamnus arborescens)</span></span>|g){ }

if ($line =~ s| <<188>>glands<<188>>|&nbsp;<span class="term-trigger" tabindex="0">glands<span class="term-popup">A small, often spheric body, on or embedded in the epidermis or at the tip of a hair, that exudes a generally sticky substance.  (e.g., Psorothamnus arborescens)</span></span>|g){ }

if ($line =~ s|<<189>>Glandular<<189>>|<span class="term-trigger" tabindex="0">Glandular<span class="term-popup">A small, often spheric body, on or embedded in the epidermis or at the tip of a hair, that exudes a generally sticky substance.  (e.g., Psorothamnus arborescens)</span></span>|g){ }

if ($line =~ s| <<189>>glandular<<189>>|&nbsp;<span class="term-trigger" tabindex="0">glandular<span class="term-popup">A small, often spheric body, on or embedded in the epidermis or at the tip of a hair, that exudes a generally sticky substance.  (e.g., Psorothamnus arborescens)</span></span>|g){ }

if ($line =~ s|<<190>>Glaucous<<190>>|<span class="term-trigger" tabindex="0">Glaucous<span class="term-popup">Covered with a generally whitish or bluish, waxy or powdery film that is sometimes easily rubbed off.</span></span>|g){ }

if ($line =~ s| <<190>>glaucous<<190>>|&nbsp;<span class="term-trigger" tabindex="0">glaucous<span class="term-popup">Covered with a generally whitish or bluish, waxy or powdery film that is sometimes easily rubbed off.</span></span>|g){ }

if ($line =~ s|<<191>>Glume<<191>>|<span class="term-trigger" tabindex="0">Glume<span class="term-popup">In Poaceae, each of generally two sheathing bracts that are the lowermost parts of a spikelet, subtending one or more florets.</span></span>|g){ }

if ($line =~ s| <<191>>glume<<191>>|&nbsp;<span class="term-trigger" tabindex="0">glume<span class="term-popup"><img src="/eflora/common/images/morph/grass-glume.jpg" class="term-img" alt="Morphology: glume">In Poaceae, each of generally two sheathing bracts that are the lowermost parts of a spikelet, subtending one or more florets.</span></span>|g){ }

if ($line =~ s|<<192>>Glumes<<192>>|<span class="term-trigger" tabindex="0">Glumes<span class="term-popup">In Poaceae, each of generally two sheathing bracts that are the lowermost parts of a spikelet, subtending one or more florets.</span></span>|g){ }

if ($line =~ s| <<192>>glumes<<192>>|&nbsp;<span class="term-trigger" tabindex="0">glumes<span class="term-popup">In Poaceae, each of generally two sheathing bracts that are the lowermost parts of a spikelet, subtending one or more florets.</span></span>|g){ }

if ($line =~ s|<<193>>Graduated<<193>>|<span class="term-trigger" tabindex="0">Graduated<span class="term-popup">In Asteraceae, pertaining to an involucre in which the phyllaries are of unequal length, with the outer shortest, the inner longest, and a gradual transition through multiple series between.</span></span>|g){ }

if ($line =~ s| <<193>>graduated<<193>>|&nbsp;<span class="term-trigger" tabindex="0">graduated<span class="term-popup">In Asteraceae, pertaining to an involucre in which the phyllaries are of unequal length, with the outer shortest, the inner longest, and a gradual transition through multiple series between.</span></span>|g){ }

if ($line =~ s|<<194>>Granular<<194>>|<span class="term-trigger" tabindex="0">Granular<span class="term-popup">Covered with minute bumps.</span></span>|g){ }

if ($line =~ s| <<194>>granular<<194>>|&nbsp;<span class="term-trigger" tabindex="0">granular<span class="term-popup"><img src="/eflora/common/images/morph/granular.jpg" class="term-img" alt="Morphology: granular">Covered with minute bumps.</span></span>|g){ }

if ($line =~ s|<<195>>Grassland<<195>>|<span class="term-trigger" tabindex="0">Grassland<span class="term-popup">Vegetation dominated by various species of grasses, often mixed with various other kinds of herbs (not grasses) and sometimes scattered, low-growing shrubs.</span></span>|g){ }

if ($line =~ s| <<195>>grassland<<195>>|&nbsp;<span class="term-trigger" tabindex="0">grassland<span class="term-popup">Vegetation dominated by various species of grasses, often mixed with various other kinds of herbs (not grasses) and sometimes scattered, low-growing shrubs.</span></span>|g){ }

if ($line =~ s|<<196>>Grasslands<<196>>|<span class="term-trigger" tabindex="0">Grasslands<span class="term-popup">Vegetation dominated by various species of grasses, often mixed with various other kinds of herbs (not grasses) and sometimes scattered, low-growing shrubs.</span></span>|g){ }

if ($line =~ s| <<196>>grasslands<<196>>|&nbsp;<span class="term-trigger" tabindex="0">grasslands<span class="term-popup">Vegetation dominated by various species of grasses, often mixed with various other kinds of herbs (not grasses) and sometimes scattered, low-growing shrubs.</span></span>|g){ }

if ($line =~ s|<<197>>Gymnosperm<<197>>|<span class="term-trigger" tabindex="0">Gymnosperm<span class="term-popup">Plant that bears woody or fleshy cones, not flowers, in which 'naked seeds' (hence, gymno-sperm) are not enclosed in an ovary; woody, including e.g., pine, sequoia, ephedra, yew.</span></span>|g){ }

if ($line =~ s| <<197>>gymnosperm<<197>>|&nbsp;<span class="term-trigger" tabindex="0">gymnosperm<span class="term-popup">Plant that bears woody or fleshy cones, not flowers, in which 'naked seeds' (hence, gymno-sperm) are not enclosed in an ovary; woody, including e.g., pine, sequoia, ephedra, yew.</span></span>|g){ }

if ($line =~ s|<<198>>Gymnosperms<<198>>|<span class="term-trigger" tabindex="0">Gymnosperms<span class="term-popup">Plant that bears woody or fleshy cones, not flowers, in which 'naked seeds' (hence, gymno-sperm) are not enclosed in an ovary; woody, including e.g., pine, sequoia, ephedra, yew.</span></span>|g){ }

if ($line =~ s| <<198>>gymnosperms<<198>>|&nbsp;<span class="term-trigger" tabindex="0">gymnosperms<span class="term-popup">Plant that bears woody or fleshy cones, not flowers, in which 'naked seeds' (hence, gymno-sperm) are not enclosed in an ovary; woody, including e.g., pine, sequoia, ephedra, yew.</span></span>|g){ }

if ($line =~ s|<<199>>Habit<<199>>|<span class="term-trigger" tabindex="0">Habit<span class="term-popup">Characteristic mode of growth, general form, or shape of a plant (e.g., cespitose, herb, scapose, shrub).</span></span>|g){ }

if ($line =~ s| <<199>>habit<<199>>|&nbsp;<span class="term-trigger" tabindex="0">habit<span class="term-popup">Characteristic mode of growth, general form, or shape of a plant (e.g., cespitose, herb, scapose, shrub).</span></span>|g){ }

if ($line =~ s|<<200>>Habits<<200>>|<span class="term-trigger" tabindex="0">Habits<span class="term-popup">Characteristic mode of growth, general form, or shape of a plant (e.g., cespitose, herb, scapose, shrub).</span></span>|g){ }

if ($line =~ s| <<200>>habits<<200>>|&nbsp;<span class="term-trigger" tabindex="0">habits<span class="term-popup">Characteristic mode of growth, general form, or shape of a plant (e.g., cespitose, herb, scapose, shrub).</span></span>|g){ }

if ($line =~ s|<<201>>Habitat<<201>>|<span class="term-trigger" tabindex="0">Habitat<span class="term-popup">Natural setting or conditions under which a plant lives (e.g., saltbush scrub, vernal pool, granitic soil among pines, montane forest).</span></span>|g){ }

if ($line =~ s| <<201>>habitat<<201>>|&nbsp;<span class="term-trigger" tabindex="0">habitat<span class="term-popup">Natural setting or conditions under which a plant lives (e.g., saltbush scrub, vernal pool, granitic soil among pines, montane forest).</span></span>|g){ }

if ($line =~ s|<<202>>Habitats<<202>>|<span class="term-trigger" tabindex="0">Habitats<span class="term-popup">Natural setting or conditions under which a plant lives (e.g., saltbush scrub, vernal pool, granitic soil among pines, montane forest).</span></span>|g){ }

if ($line =~ s| <<202>>habitats<<202>>|&nbsp;<span class="term-trigger" tabindex="0">habitats<span class="term-popup">Natural setting or conditions under which a plant lives (e.g., saltbush scrub, vernal pool, granitic soil among pines, montane forest).</span></span>|g){ }

if ($line =~ s|<<203>>Hair<<203>>|<span class="term-trigger" tabindex="0">Hair<span class="term-popup">Thread-like epidermal outgrowth.</span></span>|g){ }

if ($line =~ s| <<203>>hair<<203>>|&nbsp;<span class="term-trigger" tabindex="0">hair<span class="term-popup">Thread-like epidermal outgrowth.</span></span>|g){ }

if ($line =~ s|<<204>>Hairs<<204>>|<span class="term-trigger" tabindex="0">Hairs<span class="term-popup">Thread-like epidermal outgrowth.</span></span>|g){ }

if ($line =~ s| <<204>>hairs<<204>>|&nbsp;<span class="term-trigger" tabindex="0">hairs<span class="term-popup">Thread-like epidermal outgrowth.</span></span>|g){ }

if ($line =~ s|<<205>>Haploid<<205>>|<span class="term-trigger" tabindex="0">Haploid<span class="term-popup">Having one set of chromosomes (maternal or paternal); n.</span></span>|g){ }

if ($line =~ s| <<205>>haploid<<205>>|&nbsp;<span class="term-trigger" tabindex="0">haploid<span class="term-popup">Having one set of chromosomes (maternal or paternal); n.</span></span>|g){ }

if ($line =~ s|<<206>>Hastate<<206>>|<span class="term-trigger" tabindex="0">Hastate<span class="term-popup">Arrowhead-shaped, with two basal lobes oriented more or less perpendicularly to the long axis.</span></span>|g){ }

if ($line =~ s| <<206>>hastate<<206>>|&nbsp;<span class="term-trigger" tabindex="0">hastate<span class="term-popup"><img src="/eflora/common/images/morph/hastate.jpg" class="term-img" alt="Morphology: hastate">Arrowhead-shaped, with two basal lobes oriented more or less perpendicularly to the long axis.</span></span>|g){ }

if ($line =~ s|<<207>>Head<<207>>|<span class="term-trigger" tabindex="0">Head<span class="term-popup">1. A dense, often spheric inflorescence of sessile or subsessile flowers.<br>2. In Asteraceae and some other groups, a head-like inflorescence is one in which sessile or subsessile inflorescence units (e.g., heads in Asteraceae, umbels enclosed by involucres in Eriogonum), instead of individual flowers, are attached in a short dense cluster without an evident axis or branches.</span></span>|g){ }

if ($line =~ s| <<207>>head<<207>>|&nbsp;<span class="term-trigger" tabindex="0">head<span class="term-popup"><img src="/eflora/common/images/morph/head.jpg" class="term-img" alt="Morphology: head">1. A dense, often spheric inflorescence of sessile or subsessile flowers.<br>2. In Asteraceae and some other groups, a head-like inflorescence is one in which sessile or subsessile inflorescence units (e.g., heads in Asteraceae, umbels enclosed by involucres in Eriogonum), instead of individual flowers, are attached in a short dense cluster without an evident axis or branches.</span></span>|g){ }

if ($line =~ s|<<208>>Heads<<208>>|<span class="term-trigger" tabindex="0">Heads<span class="term-popup">1. A dense, often spheric inflorescence of sessile or subsessile flowers.<br>2. In Asteraceae and some other groups, a head-like inflorescence is one in which sessile or subsessile inflorescence units (e.g., heads in Asteraceae, umbels enclosed by involucres in Eriogonum), instead of individual flowers, are attached in a short dense cluster without an evident axis or branches.</span></span>|g){ }

if ($line =~ s| <<208>>heads<<208>>|&nbsp;<span class="term-trigger" tabindex="0">heads<span class="term-popup">1. A dense, often spheric inflorescence of sessile or subsessile flowers.<br>2. In Asteraceae and some other groups, a head-like inflorescence is one in which sessile or subsessile inflorescence units (e.g., heads in Asteraceae, umbels enclosed by involucres in Eriogonum), instead of individual flowers, are attached in a short dense cluster without an evident axis or branches.</span></span>|g){ }

if ($line =~ s|<<209>>Hemispheric<<209>>|<span class="term-trigger" tabindex="0">Hemispheric<span class="term-popup">Shaped like a dome or half sphere.</span></span>|g){ }

if ($line =~ s| <<209>>hemispheric<<209>>|&nbsp;<span class="term-trigger" tabindex="0">hemispheric<span class="term-popup">Shaped like a dome or half sphere.</span></span>|g){ }

if ($line =~ s|<<210>>Herb<<210>>|<span class="term-trigger" tabindex="0">Herb<span class="term-popup">Plant that, at least above ground, is generally non-woody and of less than one year or growing season in duration.</span></span>|g){ }

if ($line =~ s| <<210>>herb<<210>>|&nbsp;<span class="term-trigger" tabindex="0">herb<span class="term-popup">Plant that, at least above ground, is generally non-woody and of less than one year or growing season in duration.</span></span>|g){ }

if ($line =~ s|<<211>>Herbs<<211>>|<span class="term-trigger" tabindex="0">Herbs<span class="term-popup">Plant that, at least above ground, is generally non-woody and of less than one year or growing season in duration.</span></span>|g){ }

if ($line =~ s| <<211>>herbs<<211>>|&nbsp;<span class="term-trigger" tabindex="0">herbs<span class="term-popup">Plant that, at least above ground, is generally non-woody and of less than one year or growing season in duration.</span></span>|g){ }

if ($line =~ s|<<212>>Herbaceous<<212>>|<span class="term-trigger" tabindex="0">Herbaceous<span class="term-popup">Lacking wood; having the characteristics of an herb.</span></span>|g){ }

if ($line =~ s| <<212>>herbaceous<<212>>|&nbsp;<span class="term-trigger" tabindex="0">herbaceous<span class="term-popup">Lacking wood; having the characteristics of an herb.</span></span>|g){ }

if ($line =~ s|<<213>>Herbage<<213>>|<span class="term-trigger" tabindex="0">Herbage<span class="term-popup">The above-ground, non-woody parts of a plant, including especially the leaves and young stems taken together, excluding flowers and fruits.</span></span>|g){ }

if ($line =~ s| <<213>>herbage<<213>>|&nbsp;<span class="term-trigger" tabindex="0">herbage<span class="term-popup">The above-ground, non-woody parts of a plant, including especially the leaves and young stems taken together, excluding flowers and fruits.</span></span>|g){ }

if ($line =~ s|<<214>>Heterostylous<<214>>|<span class="term-trigger" tabindex="0">Heterostylous<span class="term-popup">Pertaining to a taxon in which individual plants produce only one of two or more flower types, each differing in style (and generally stamen) length.</span></span>|g){ }

if ($line =~ s| <<214>>heterostylous<<214>>|&nbsp;<span class="term-trigger" tabindex="0">heterostylous<span class="term-popup">Pertaining to a taxon in which individual plants produce only one of two or more flower types, each differing in style (and generally stamen) length.</span></span>|g){ }

if ($line =~ s|<<215>>Hypanthium<<215>>|<span class="term-trigger" tabindex="0">Hypanthium<span class="term-popup">Structure generally in the shape of a tube, cup, or bowl, derived from the fused lower portions of the perianth and stamens, from which these parts seem to arise, and to which the ovary wall is fused in an inferior ovary (to which the ovary wall is partially fused in a half-inferior ovary; from which the ovary is free in a superior ovary).</span></span>|g){ }

if ($line =~ s| <<215>>hypanthium<<215>>|&nbsp;<span class="term-trigger" tabindex="0">hypanthium<span class="term-popup"><img src="/eflora/common/images/morph/hypanthium.jpg" class="term-img" alt="Morphology: hypanthium">Structure generally in the shape of a tube, cup, or bowl, derived from the fused lower portions of the perianth and stamens, from which these parts seem to arise, and to which the ovary wall is fused in an inferior ovary (to which the ovary wall is partially fused in a half-inferior ovary; from which the ovary is free in a superior ovary).</span></span>|g){ }

if ($line =~ s|<<216>>Hypanthia<<216>>|<span class="term-trigger" tabindex="0">Hypanthia<span class="term-popup">Structure generally in the shape of a tube, cup, or bowl, derived from the fused lower portions of the perianth and stamens, from which these parts seem to arise, and to which the ovary wall is fused in an inferior ovary (to which the ovary wall is partially fused in a half-inferior ovary; from which the ovary is free in a superior ovary).</span></span>|g){ }

if ($line =~ s| <<216>>hypanthia<<216>>|&nbsp;<span class="term-trigger" tabindex="0">hypanthia<span class="term-popup">Structure generally in the shape of a tube, cup, or bowl, derived from the fused lower portions of the perianth and stamens, from which these parts seem to arise, and to which the ovary wall is fused in an inferior ovary (to which the ovary wall is partially fused in a half-inferior ovary; from which the ovary is free in a superior ovary).</span></span>|g){ }

if ($line =~ s|<<217>>Included<<217>>|<span class="term-trigger" tabindex="0">Included<span class="term-popup">Not protruding out of surrounding structure(s) (e.g., stamens included in corolla).</span></span>|g){ }

if ($line =~ s| <<217>>included<<217>>|&nbsp;<span class="term-trigger" tabindex="0">included<span class="term-popup"><img src="/eflora/common/images/morph/included-stamens.jpg" class="term-img" alt="Morphology: included">Not protruding out of surrounding structure(s) (e.g., stamens included in corolla).</span></span>|g){ }

if ($line =~ s|<<218>>Indehiscent<<218>>|<span class="term-trigger" tabindex="0">Indehiscent<span class="term-popup">Not opening inherently to release contents; usually pertaining to fruits.</span></span>|g){ }

if ($line =~ s| <<218>>indehiscent<<218>>|&nbsp;<span class="term-trigger" tabindex="0">indehiscent<span class="term-popup"><img src="/eflora/common/images/morph/indehiscent.jpg" class="term-img" alt="Morphology: indehiscent">Not opening inherently to release contents; usually pertaining to fruits.</span></span>|g){ }

if ($line =~ s|<<219>>Indusium<<219>>|<span class="term-trigger" tabindex="0">Indusium<span class="term-popup">In many ferns, a veil- or scale-like outgrowth of the leaf surface that covers a sorus.</span></span>|g){ }

if ($line =~ s| <<219>>indusium<<219>>|&nbsp;<span class="term-trigger" tabindex="0">indusium<span class="term-popup"><img src="/eflora/common/images/morph/indusium.jpg" class="term-img" alt="Morphology: indusium">In many ferns, a veil- or scale-like outgrowth of the leaf surface that covers a sorus.</span></span>|g){ }

if ($line =~ s|<<220>>Indusia<<220>>|<span class="term-trigger" tabindex="0">Indusia<span class="term-popup">In many ferns, a veil- or scale-like outgrowth of the leaf surface that covers a sorus.</span></span>|g){ }

if ($line =~ s| <<220>>indusia<<220>>|&nbsp;<span class="term-trigger" tabindex="0">indusia<span class="term-popup">In many ferns, a veil- or scale-like outgrowth of the leaf surface that covers a sorus.</span></span>|g){ }

if ($line =~ s|<<221>>Inferior<<221>>|<span class="term-trigger" tabindex="0">Inferior<span class="term-popup">An ovary that is fused to the fused lower portions of the perianth and stamens (i.e., to the hypanthium), to the extent that these structures appear to arise at or above its summit</span></span>|g){ }

if ($line =~ s| <<221>>inferior<<221>>|&nbsp;<span class="term-trigger" tabindex="0">inferior<span class="term-popup">An ovary that is fused to the fused lower portions of the perianth and stamens (i.e., to the hypanthium), to the extent that these structures appear to arise at or above its summit</span></span>|g){ }

if ($line =~ s|<<222>>Inflorescence<<222>>|<span class="term-trigger" tabindex="0">Inflorescence<span class="term-popup">An entire cluster or aggregation of flowers and associated structures (e.g., axes, bracts, bractlets, pedicels); often difficult to determine as to type and boundaries but generally excluding full-sized foliage leaves.</span></span>|g){ }

if ($line =~ s| <<222>>inflorescence<<222>>|&nbsp;<span class="term-trigger" tabindex="0">inflorescence<span class="term-popup">An entire cluster or aggregation of flowers and associated structures (e.g., axes, bracts, bractlets, pedicels); often difficult to determine as to type and boundaries but generally excluding full-sized foliage leaves.</span></span>|g){ }

if ($line =~ s|<<223>>Inflorescences<<223>>|<span class="term-trigger" tabindex="0">Inflorescences<span class="term-popup">An entire cluster or aggregation of flowers and associated structures (e.g., axes, bracts, bractlets, pedicels); often difficult to determine as to type and boundaries but generally excluding full-sized foliage leaves.</span></span>|g){ }

if ($line =~ s| <<223>>inflorescences<<223>>|&nbsp;<span class="term-trigger" tabindex="0">inflorescences<span class="term-popup">An entire cluster or aggregation of flowers and associated structures (e.g., axes, bracts, bractlets, pedicels); often difficult to determine as to type and boundaries but generally excluding full-sized foliage leaves.</span></span>|g){ }

if ($line =~ s|<<224>>Infraspecific<<224>>|<span class="term-trigger" tabindex="0">Infraspecific<span class="term-popup">Below the species level or within a species;  pertaining to variation within a species, whether taxonomically significant (i.e., characterizing subspecies or varieties) or not (e.g., characterizing forms or minor variants).</span></span>|g){ }

if ($line =~ s| <<224>>infraspecific<<224>>|&nbsp;<span class="term-trigger" tabindex="0">infraspecific<span class="term-popup">Below the species level or within a species;  pertaining to variation within a species, whether taxonomically significant (i.e., characterizing subspecies or varieties) or not (e.g., characterizing forms or minor variants).</span></span>|g){ }

if ($line =~ s|<<225>>Intergrade<<225>>|<span class="term-trigger" tabindex="0">Intergrade<span class="term-popup">To merge gradually from one extreme to another through a more or less continuous series of intermediates.</span></span>|g){ }

if ($line =~ s| <<225>>intergrade<<225>>|&nbsp;<span class="term-trigger" tabindex="0">intergrade<span class="term-popup">To merge gradually from one extreme to another through a more or less continuous series of intermediates.</span></span>|g){ }

if ($line =~ s|<<226>>Intermediate<<226>>|<span class="term-trigger" tabindex="0">Intermediate<span class="term-popup">Between extremes or parental taxa in size, shape, color, flowering time, habitat preferences, geographic ranges, or other ways.</span></span>|g){ }

if ($line =~ s| <<226>>intermediate<<226>>|&nbsp;<span class="term-trigger" tabindex="0">intermediate<span class="term-popup">Between extremes or parental taxa in size, shape, color, flowering time, habitat preferences, geographic ranges, or other ways.</span></span>|g){ }

if ($line =~ s|<<227>>Internode<<227>>|<span class="term-trigger" tabindex="0">Internode<span class="term-popup">Segment of an axis (generally a stem) between successive positions (nodes) from which one or more structures (especially leaves, buds, branches, or flowers) arise.</span></span>|g){ }

if ($line =~ s| <<227>>internode<<227>>|&nbsp;<span class="term-trigger" tabindex="0">internode<span class="term-popup"><img src="/eflora/common/images/morph/node-internode.jpg" class="term-img" alt="Morphology: internode">Segment of an axis (generally a stem) between successive positions (nodes) from which one or more structures (especially leaves, buds, branches, or flowers) arise.</span></span>|g){ }

if ($line =~ s|<<228>>Internodes<<228>>|<span class="term-trigger" tabindex="0">Internodes<span class="term-popup">Segment of an axis (generally a stem) between successive positions (nodes) from which one or more structures (especially leaves, buds, branches, or flowers) arise.</span></span>|g){ }

if ($line =~ s| <<228>>internodes<<228>>|&nbsp;<span class="term-trigger" tabindex="0">internodes<span class="term-popup"><img src="/eflora/common/images/morph/node-internode.jpg" class="term-img" alt="Morphology: internodes">Segment of an axis (generally a stem) between successive positions (nodes) from which one or more structures (especially leaves, buds, branches, or flowers) arise.</span></span>|g){ }

if ($line =~ s|<<229>>Interrupted<<229>>|<span class="term-trigger" tabindex="0">Interrupted<span class="term-popup">Having parts spaced unevenly, clustered; pertaining especially to inflorescences in which the flowers are clustered.</span></span>|g){ }

if ($line =~ s| <<229>>interrupted<<229>>|&nbsp;<span class="term-trigger" tabindex="0">interrupted<span class="term-popup">Having parts spaced unevenly, clustered; pertaining especially to inflorescences in which the flowers are clustered.</span></span>|g){ }

if ($line =~ s|<<230>>Intertidal<<230>>|<span class="term-trigger" tabindex="0">Intertidal<span class="term-popup">Pertaining to marine habitats that are submerged at high tide and exposed at low tide.</span></span>|g){ }

if ($line =~ s| <<230>>intertidal<<230>>|&nbsp;<span class="term-trigger" tabindex="0">intertidal<span class="term-popup">Pertaining to marine habitats that are submerged at high tide and exposed at low tide.</span></span>|g){ }

if ($line =~ s|<<231>>Involucel<<231>>|<span class="term-trigger" tabindex="0">Involucel<span class="term-popup">A secondary involucre (group of bracts) within an inflorescence (e.g., those subtending the secondary umbels in members of Apiaceae).</span></span>|g){ }

if ($line =~ s| <<231>>involucel<<231>>|&nbsp;<span class="term-trigger" tabindex="0">involucel<span class="term-popup"><img src="/eflora/common/images/morph/involucel.jpg" class="term-img" alt="Morphology: involucel">A secondary involucre (group of bracts) within an inflorescence (e.g., those subtending the secondary umbels in members of Apiaceae).</span></span>|g){ }

if ($line =~ s|<<232>>Involucre<<232>>|<span class="term-trigger" tabindex="0">Involucre<span class="term-popup">Group of bracts more or less held together as a unit, subtending a flower, fruit (acorn cup), or inflorescence.</span></span>|g){ }

if ($line =~ s| <<232>>involucre<<232>>|&nbsp;<span class="term-trigger" tabindex="0">involucre<span class="term-popup"><img src="/eflora/common/images/morph/involucre.jpg" class="term-img" alt="Morphology: involucre">Group of bracts more or less held together as a unit, subtending a flower, fruit (acorn cup), or inflorescence.</span></span>|g){ }

if ($line =~ s|<<233>>Involucres<<233>>|<span class="term-trigger" tabindex="0">Involucres<span class="term-popup">Group of bracts more or less held together as a unit, subtending a flower, fruit (acorn cup), or inflorescence.</span></span>|g){ }

if ($line =~ s| <<233>>involucres<<233>>|&nbsp;<span class="term-trigger" tabindex="0">involucres<span class="term-popup">Group of bracts more or less held together as a unit, subtending a flower, fruit (acorn cup), or inflorescence.</span></span>|g){ }

if ($line =~ s|<<234>>Keel<<234>>|<span class="term-trigger" tabindex="0">Keel<span class="term-popup">1. Ridge or crease more or less centrally located on the long axis of a structure, generally on the abaxial side.  2. The two lowermost, fused petals of many members of Fabaceae.</span></span>|g){ }

if ($line =~ s| <<234>>keel<<234>>|&nbsp;<span class="term-trigger" tabindex="0">keel<span class="term-popup">1. Ridge or crease more or less centrally located on the long axis of a structure, generally on the abaxial side.  2. The two lowermost, fused petals of many members of Fabaceae.</span></span>|g){ }

if ($line =~ s|<<235>>Keels<<235>>|<span class="term-trigger" tabindex="0">Keels<span class="term-popup">1. Ridge or crease more or less centrally located on the long axis of a structure, generally on the abaxial side.  2. The two lowermost, fused petals of many members of Fabaceae.</span></span>|g){ }

if ($line =~ s| <<235>>keels<<235>>|&nbsp;<span class="term-trigger" tabindex="0">keels<span class="term-popup">1. Ridge or crease more or less centrally located on the long axis of a structure, generally on the abaxial side.  2. The two lowermost, fused petals of many members of Fabaceae.</span></span>|g){ }

if ($line =~ s|<<236>>Keeled<<236>>|<span class="term-trigger" tabindex="0">Keeled<span class="term-popup">1. Having a ridge or crease more or less centrally located on the long axis of a structure, generally on the abaxial side.</span></span>|g){ }

if ($line =~ s| <<236>>keeled<<236>>|&nbsp;<span class="term-trigger" tabindex="0">keeled<span class="term-popup">1. Having a ridge or crease more or less centrally located on the long axis of a structure, generally on the abaxial side.</span></span>|g){ }

if ($line =~ s|<<237>>Lamina<<237>>|<span class="term-trigger" tabindex="0">Lamina<span class="term-popup">In Asteraceae, the strap- or fan-shaped outer portion of the corolla of a ray flower, with generally 3 (sometimes 0, 2, or 4) lobes, or the similarly shaped, 3-lobed outer lip of the 2-lipped corolla of Trixis and Acourtia.</span></span>|g){ }

if ($line =~ s| <<237>>lamina<<237>>|&nbsp;<span class="term-trigger" tabindex="0">lamina<span class="term-popup">In Asteraceae, the strap- or fan-shaped outer portion of the corolla of a ray flower, with generally 3 (sometimes 0, 2, or 4) lobes, or the similarly shaped, 3-lobed outer lip of the 2-lipped corolla of Trixis and Acourtia.</span></span>|g){ }

if ($line =~ s|<<238>>Laminae<<238>>|<span class="term-trigger" tabindex="0">Laminae<span class="term-popup">In Asteraceae, the strap- or fan-shaped outer portion of the corolla of a ray flower, with generally 3 (sometimes 0, 2, or 4) lobes, or the similarly shaped, 3-lobed outer lip of the 2-lipped corolla of Trixis and Acourtia.</span></span>|g){ }

if ($line =~ s| <<238>>laminae<<238>>|&nbsp;<span class="term-trigger" tabindex="0">laminae<span class="term-popup">In Asteraceae, the strap- or fan-shaped outer portion of the corolla of a ray flower, with generally 3 (sometimes 0, 2, or 4) lobes, or the similarly shaped, 3-lobed outer lip of the 2-lipped corolla of Trixis and Acourtia.</span></span>|g){ }

if ($line =~ s|<<239>>Lanceolate<<239>>|<span class="term-trigger" tabindex="0">Lanceolate<span class="term-popup">Narrowly elongate, widest in the basal half, often tapered to an acute tip.</span></span>|g){ }

if ($line =~ s| <<239>>lanceolate<<239>>|&nbsp;<span class="term-trigger" tabindex="0">lanceolate<span class="term-popup"><img src="/eflora/common/images/morph/lanceolate.jpg" class="term-img" alt="Morphology: lanceolate">Narrowly elongate, widest in the basal half, often tapered to an acute tip.</span></span>|g){ }

if ($line =~ s|<<240>>Lateral<<240>>|<span class="term-trigger" tabindex="0">Lateral<span class="term-popup">Pertaining to the sides(s) of a structure; e.g., laterally compressed (flattened side-to-side), lateral branch, lateral appendage.</span></span>|g){ }

if ($line =~ s| <<240>>lateral<<240>>|&nbsp;<span class="term-trigger" tabindex="0">lateral<span class="term-popup">Pertaining to the sides(s) of a structure; e.g., laterally compressed (flattened side-to-side), lateral branch, lateral appendage.</span></span>|g){ }

if ($line =~ s|<<241>>Leaf<<241>>|<span class="term-trigger" tabindex="0">Leaf<span class="term-popup">Organ arising from a stem, generally composed of a stalk (petiole) and a flat, expanded, green, photosynthetic area (blade); distinguished from a leaflet by the presence in its axil of a bud, branch, thorn, or flower; sometimes with lateral, basal appendages (stipules); either simple (toothed, lobed, or dissected but not divided into leaflets) or compound (divided into leaflets).</span></span>|g){ }

if ($line =~ s| <<241>>leaf<<241>>|&nbsp;<span class="term-trigger" tabindex="0">leaf<span class="term-popup"><img src="/eflora/common/images/morph/leaf.jpg" class="term-img" alt="Morphology: leaf">Organ arising from a stem, generally composed of a stalk (petiole) and a flat, expanded, green, photosynthetic area (blade); distinguished from a leaflet by the presence in its axil of a bud, branch, thorn, or flower; sometimes with lateral, basal appendages (stipules); either simple (toothed, lobed, or dissected but not divided into leaflets) or compound (divided into leaflets).</span></span>|g){ }

if ($line =~ s|<<242>>Leaves<<242>>|<span class="term-trigger" tabindex="0">Leaves<span class="term-popup">Organ arising from a stem, generally composed of a stalk (petiole) and a flat, expanded, green, photosynthetic area (blade); distinguished from a leaflet by the presence in its axil of a bud, branch, thorn, or flower; sometimes with lateral, basal appendages (stipules); either simple (toothed, lobed, or dissected but not divided into leaflets) or compound (divided into leaflets).</span></span>|g){ }

if ($line =~ s| <<242>>leaves<<242>>|&nbsp;<span class="term-trigger" tabindex="0">leaves<span class="term-popup">Organ arising from a stem, generally composed of a stalk (petiole) and a flat, expanded, green, photosynthetic area (blade); distinguished from a leaflet by the presence in its axil of a bud, branch, thorn, or flower; sometimes with lateral, basal appendages (stipules); either simple (toothed, lobed, or dissected but not divided into leaflets) or compound (divided into leaflets).</span></span>|g){ }

if ($line =~ s|<<243>>Leaflet<<243>>|<span class="term-trigger" tabindex="0">Leaflet<span class="term-popup">A leaf-like unit of a compound leaf; distinguished from a leaf by the absence in its axil of a bud, branch, thorn, or flower; lacking lateral, basal appendages (stipules); either simple (leaf 1-compound, with primary leaflets) or compound (leaf 2-compound, with primary and secondary leaflets; 3-compound, with primary, secondary, and tertiary leaflets, etc).</span></span>|g){ }

if ($line =~ s| <<243>>leaflet<<243>>|&nbsp;<span class="term-trigger" tabindex="0">leaflet<span class="term-popup"><img src="/eflora/common/images/morph/primary-leaflet.jpg" class="term-img" alt="Morphology: leaflet">A leaf-like unit of a compound leaf; distinguished from a leaf by the absence in its axil of a bud, branch, thorn, or flower; lacking lateral, basal appendages (stipules); either simple (leaf 1-compound, with primary leaflets) or compound (leaf 2-compound, with primary and secondary leaflets; 3-compound, with primary, secondary, and tertiary leaflets, etc).</span></span>|g){ }

if ($line =~ s|<<244>>Leaflets<<244>>|<span class="term-trigger" tabindex="0">Leaflets<span class="term-popup">A leaf-like unit of a compound leaf; distinguished from a leaf by the absence in its axil of a bud, branch, thorn, or flower; lacking lateral, basal appendages (stipules); either simple (leaf 1-compound, with primary leaflets) or compound (leaf 2-compound, with primary and secondary leaflets; 3-compound, with primary, secondary, and tertiary leaflets, etc).</span></span>|g){ }

if ($line =~ s| <<244>>leaflets<<244>>|&nbsp;<span class="term-trigger" tabindex="0">leaflets<span class="term-popup">A leaf-like unit of a compound leaf; distinguished from a leaf by the absence in its axil of a bud, branch, thorn, or flower; lacking lateral, basal appendages (stipules); either simple (leaf 1-compound, with primary leaflets) or compound (leaf 2-compound, with primary and secondary leaflets; 3-compound, with primary, secondary, and tertiary leaflets, etc).</span></span>|g){ }

if ($line =~ s|<<245>>Legume<<245>>|<span class="term-trigger" tabindex="0">Legume<span class="term-popup">In Fabaceae (legume family), a dry or somewhat fleshy, one- to many-seeded fruit from a simple pistil, typically dehiscent longitudinally along two sutures and splitting into halves that remain joined at the base, sometimes indehiscent or breaking crosswise into one-seeded segments; a plant with such a fruit.</span></span>|g){ }

if ($line =~ s| <<245>>legume<<245>>|&nbsp;<span class="term-trigger" tabindex="0">legume<span class="term-popup">In Fabaceae (legume family), a dry or somewhat fleshy, one- to many-seeded fruit from a simple pistil, typically dehiscent longitudinally along two sutures and splitting into halves that remain joined at the base, sometimes indehiscent or breaking crosswise into one-seeded segments; a plant with such a fruit.</span></span>|g){ }

if ($line =~ s|<<246>>Legumes<<246>>|<span class="term-trigger" tabindex="0">Legumes<span class="term-popup">In Fabaceae (legume family), a dry or somewhat fleshy, one- to many-seeded fruit from a simple pistil, typically dehiscent longitudinally along two sutures and splitting into halves that remain joined at the base, sometimes indehiscent or breaking crosswise into one-seeded segments; a plant with such a fruit.</span></span>|g){ }

if ($line =~ s| <<246>>legumes<<246>>|&nbsp;<span class="term-trigger" tabindex="0">legumes<span class="term-popup">In Fabaceae (legume family), a dry or somewhat fleshy, one- to many-seeded fruit from a simple pistil, typically dehiscent longitudinally along two sutures and splitting into halves that remain joined at the base, sometimes indehiscent or breaking crosswise into one-seeded segments; a plant with such a fruit.</span></span>|g){ }

if ($line =~ s|<<247>>Lemma<<247>>|<span class="term-trigger" tabindex="0">Lemma<span class="term-popup">In Poaceae, the lower, generally larger of two sheathing bracts subtending a flower, generally ensheathing the palea (in a sterile lemma, the associated flower and sometimes palea are rudimentary or absent); with the palea and flower, comprising the floret.</span></span>|g){ }

if ($line =~ s| <<247>>lemma<<247>>|&nbsp;<span class="term-trigger" tabindex="0">lemma<span class="term-popup"><img src="/eflora/common/images/morph/grass-lemma.jpg" class="term-img" alt="Morphology: lemma">In Poaceae, the lower, generally larger of two sheathing bracts subtending a flower, generally ensheathing the palea (in a sterile lemma, the associated flower and sometimes palea are rudimentary or absent); with the palea and flower, comprising the floret.</span></span>|g){ }

if ($line =~ s|<<248>>Lemmas<<248>>|<span class="term-trigger" tabindex="0">Lemmas<span class="term-popup">In Poaceae, the lower, generally larger of two sheathing bracts subtending a flower, generally ensheathing the palea (in a sterile lemma, the associated flower and sometimes palea are rudimentary or absent); with the palea and flower, comprising the floret.</span></span>|g){ }

if ($line =~ s| <<248>>lemmas<<248>>|&nbsp;<span class="term-trigger" tabindex="0">lemmas<span class="term-popup"><img src="/eflora/common/images/morph/grass-lemma.jpg" class="term-img" alt="Morphology: lemmas">In Poaceae, the lower, generally larger of two sheathing bracts subtending a flower, generally ensheathing the palea (in a sterile lemma, the associated flower and sometimes palea are rudimentary or absent); with the palea and flower, comprising the floret.</span></span>|g){ }

if ($line =~ s|<<249>>Lenticel<<249>>|<span class="term-trigger" tabindex="0">Lenticel<span class="term-popup">Each of many spongy or calloused areas of various shapes, sizes, and colors, most commonly on surfaces of young stems (including twigs) or fruits.</span></span>|g){ }

if ($line =~ s| <<249>>lenticel<<249>>|&nbsp;<span class="term-trigger" tabindex="0">lenticel<span class="term-popup">Each of many spongy or calloused areas of various shapes, sizes, and colors, most commonly on surfaces of young stems (including twigs) or fruits.</span></span>|g){ }

if ($line =~ s|<<250>>Lenticels<<250>>|<span class="term-trigger" tabindex="0">Lenticels<span class="term-popup">Each of many spongy or calloused areas of various shapes, sizes, and colors, most commonly on surfaces of young stems (including twigs) or fruits.</span></span>|g){ }

if ($line =~ s| <<250>>lenticels<<250>>|&nbsp;<span class="term-trigger" tabindex="0">lenticels<span class="term-popup"><img src="/eflora/common/images/morph/lenticels.jpg" class="term-img" alt="Morphology: lenticels">Each of many spongy or calloused areas of various shapes, sizes, and colors, most commonly on surfaces of young stems (including twigs) or fruits.</span></span>|g){ }

if ($line =~ s|<<251>>Lenticular<<251>>|<span class="term-trigger" tabindex="0">Lenticular<span class="term-popup">Lens- or discus-shaped, with both major sides convex.</span></span>|g){ }

if ($line =~ s| <<251>>lenticular<<251>>|&nbsp;<span class="term-trigger" tabindex="0">lenticular<span class="term-popup">Lens- or discus-shaped, with both major sides convex.</span></span>|g){ }

if ($line =~ s|<<252>>Ligulate flower<<252>>|<span class="term-trigger" tabindex="0">Ligulate flower<span class="term-popup">In Asteraceae, a bisexual, bilateral flower with the outer portion of the corolla (the ligule) strap- or fan-shaped, 5-lobed; appearing only with other ligulate flowers in a liguliflorous head.</span></span>|g){ }

if ($line =~ s| <<252>>ligulate flower<<252>>|&nbsp;<span class="term-trigger" tabindex="0">ligulate flower<span class="term-popup">In Asteraceae, a bisexual, bilateral flower with the outer portion of the corolla (the ligule) strap- or fan-shaped, 5-lobed; appearing only with other ligulate flowers in a liguliflorous head.</span></span>|g){ }

if ($line =~ s|<<253>>Ligule<<253>>|<span class="term-trigger" tabindex="0">Ligule<span class="term-popup">1. In Asteraceae, the 5-lobed, strap- or fan-shaped outer portion of the corolla of a ligulate flower. 2. In most Poaceae and some other grass-like plants, an appendage at the adaxial junction of leaf sheath and blade, generally membranous, sometimes formed of hairs. 3. In Isoetes and, more obscurely, in Selaginella, a membrane that wholly or partially covers a sporangium.</span></span>|g){ }

if ($line =~ s| <<253>>ligule<<253>>|&nbsp;<span class="term-trigger" tabindex="0">ligule<span class="term-popup"><img src="/eflora/common/images/morph/grass-leaf-ligule.jpg" class="term-img" alt="Morphology: ligule">1. In Asteraceae, the 5-lobed, strap- or fan-shaped outer portion of the corolla of a ligulate flower. 2. In most Poaceae and some other grass-like plants, an appendage at the adaxial junction of leaf sheath and blade, generally membranous, sometimes formed of hairs. 3. In Isoetes and, more obscurely, in Selaginella, a membrane that wholly or partially covers a sporangium.</span></span>|g){ }

if ($line =~ s|<<254>>Ligules<<254>>|<span class="term-trigger" tabindex="0">Ligules<span class="term-popup">1. In Asteraceae, the 5-lobed, strap- or fan-shaped outer portion of the corolla of a ligulate flower. 2. In most Poaceae and some other grass-like plants, an appendage at the adaxial junction of leaf sheath and blade, generally membranous, sometimes formed of hairs. 3. In Isoetes and, more obscurely, in Selaginella, a membrane that wholly or partially covers a sporangium.</span></span>|g){ }

if ($line =~ s| <<254>>ligules<<254>>|&nbsp;<span class="term-trigger" tabindex="0">ligules<span class="term-popup">1. In Asteraceae, the 5-lobed, strap- or fan-shaped outer portion of the corolla of a ligulate flower. 2. In most Poaceae and some other grass-like plants, an appendage at the adaxial junction of leaf sheath and blade, generally membranous, sometimes formed of hairs. 3. In Isoetes and, more obscurely, in Selaginella, a membrane that wholly or partially covers a sporangium.</span></span>|g){ }

if ($line =~ s|<<255>>Liguliflorous<<255>>|<span class="term-trigger" tabindex="0">Liguliflorous<span class="term-popup">In Asteraceae, a head composed entirely of ligulate flowers.</span></span>|g){ }

if ($line =~ s| <<255>>liguliflorous<<255>>|&nbsp;<span class="term-trigger" tabindex="0">liguliflorous<span class="term-popup">In Asteraceae, a head composed entirely of ligulate flowers.</span></span>|g){ }

if ($line =~ s|<<256>>Limb<<256>>|<span class="term-trigger" tabindex="0">Limb<span class="term-popup">In calyces or corollas with fused sepals or petals, the expanded, often lobed portion distal to the tube or throat; in some free or nearly free sepals and petals, the expanded portion distal to the stalk-like base (claw).</span></span>|g){ }

if ($line =~ s| <<256>>limb<<256>>|&nbsp;<span class="term-trigger" tabindex="0">limb<span class="term-popup">In calyces or corollas with fused sepals or petals, the expanded, often lobed portion distal to the tube or throat; in some free or nearly free sepals and petals, the expanded portion distal to the stalk-like base (claw).</span></span>|g){ }

if ($line =~ s|<<257>>Limbs<<257>>|<span class="term-trigger" tabindex="0">Limbs<span class="term-popup">In calyces or corollas with fused sepals or petals, the expanded, often lobed portion distal to the tube or throat; in some free or nearly free sepals and petals, the expanded portion distal to the stalk-like base (claw).</span></span>|g){ }

if ($line =~ s| <<257>>limbs<<257>>|&nbsp;<span class="term-trigger" tabindex="0">limbs<span class="term-popup">In calyces or corollas with fused sepals or petals, the expanded, often lobed portion distal to the tube or throat; in some free or nearly free sepals and petals, the expanded portion distal to the stalk-like base (claw).</span></span>|g){ }

if ($line =~ s|<<258>>Linear<<258>>|<span class="term-trigger" tabindex="0">Linear<span class="term-popup">Elongate, with nearly parallel sides; narrower than elliptic or oblong.</span></span>|g){ }

if ($line =~ s| <<258>>linear<<258>>|&nbsp;<span class="term-trigger" tabindex="0">linear<span class="term-popup"><img src="/eflora/common/images/morph/linear.jpg" class="term-img" alt="Morphology: linear">Elongate, with nearly parallel sides; narrower than elliptic or oblong.</span></span>|g){ }

if ($line =~ s|<<259>>Lip<<259>>|<span class="term-trigger" tabindex="0">Lip<span class="term-popup">1. Upper or lower of two parts in a bilateral, unequally divided calyx or corolla.  2. In Orchidaceae, generally the largest, lowest, most highly modified perianth part.</span></span>|g){ }

if ($line =~ s| <<259>>lip<<259>>|&nbsp;<span class="term-trigger" tabindex="0">lip<span class="term-popup">1. Upper or lower of two parts in a bilateral, unequally divided calyx or corolla.  2. In Orchidaceae, generally the largest, lowest, most highly modified perianth part.</span></span>|g){ }

if ($line =~ s|<<260>>Lips<<260>>|<span class="term-trigger" tabindex="0">Lips<span class="term-popup">1. Upper or lower of two parts in a bilateral, unequally divided calyx or corolla.  2. In Orchidaceae, generally the largest, lowest, most highly modified perianth part.</span></span>|g){ }

if ($line =~ s| <<260>>lips<<260>>|&nbsp;<span class="term-trigger" tabindex="0">lips<span class="term-popup">1. Upper or lower of two parts in a bilateral, unequally divided calyx or corolla.  2. In Orchidaceae, generally the largest, lowest, most highly modified perianth part.</span></span>|g){ }

if ($line =~ s|<<261>>Lobe<<261>>|<span class="term-trigger" tabindex="0">Lobe<span class="term-popup">1. A major expansion or bulge, such as on the margin of a leaf, sepal, or petal, or on the surface of an ovary.  2. The free tips of otherwise fused structures, such as sepals or petals; larger than teeth.</span></span>|g){ }

if ($line =~ s| <<261>>lobe<<261>>|&nbsp;<span class="term-trigger" tabindex="0">lobe<span class="term-popup"><img src="/eflora/common/images/morph/lobe.jpg" class="term-img" alt="Morphology: lobe">1. A major expansion or bulge, such as on the margin of a leaf, sepal, or petal, or on the surface of an ovary.  2. The free tips of otherwise fused structures, such as sepals or petals; larger than teeth.</span></span>|g){ }

if ($line =~ s|<<262>>Lobes<<262>>|<span class="term-trigger" tabindex="0">Lobes<span class="term-popup">1. A major expansion or bulge, such as on the margin of a leaf, sepal, or petal, or on the surface of an ovary.  2. The free tips of otherwise fused structures, such as sepals or petals; larger than teeth.</span></span>|g){ }

if ($line =~ s| <<262>>lobes<<262>>|&nbsp;<span class="term-trigger" tabindex="0">lobes<span class="term-popup"><img src="/eflora/common/images/morph/lobe.jpg" class="term-img" alt="Morphology: lobes">1. A major expansion or bulge, such as on the margin of a leaf, sepal, or petal, or on the surface of an ovary.  2. The free tips of otherwise fused structures, such as sepals or petals; larger than teeth.</span></span>|g){ }

if ($line =~ s|<<263>>Loculicidal<<263>>|<span class="term-trigger" tabindex="0">Loculicidal<span class="term-popup">Pertaining to dehiscence of a fruit (capsule) by a longitudinal line through the wall at or near the center of each chamber, such that each resulting segment corresponds to the two adjacent halves of two adjacent chambers, usually with a placenta-bearing septum centrally.</span></span>|g){ }

if ($line =~ s| <<263>>loculicidal<<263>>|&nbsp;<span class="term-trigger" tabindex="0">loculicidal<span class="term-popup"><img src="/eflora/common/images/morph/loculicidal.jpg" class="term-img" alt="Morphology: loculicidal">Pertaining to dehiscence of a fruit (capsule) by a longitudinal line through the wall at or near the center of each chamber, such that each resulting segment corresponds to the two adjacent halves of two adjacent chambers, usually with a placenta-bearing septum centrally.</span></span>|g){ }

if ($line =~ s|<<264>>Longitudinal<<264>>|<span class="term-trigger" tabindex="0">Longitudinal<span class="term-popup">Pertaining to length or the lengthwise dimension; parallel to the axis.</span></span>|g){ }

if ($line =~ s| <<264>>longitudinal<<264>>|&nbsp;<span class="term-trigger" tabindex="0">longitudinal<span class="term-popup">Pertaining to length or the lengthwise dimension; parallel to the axis.</span></span>|g){ }

if ($line =~ s|<<265>>Margin<<265>>|<span class="term-trigger" tabindex="0">Margin<span class="term-popup">The edge, generally of a leaf or perianth part.</span></span>|g){ }

if ($line =~ s| <<265>>margin<<265>>|&nbsp;<span class="term-trigger" tabindex="0">margin<span class="term-popup">The edge, generally of a leaf or perianth part.</span></span>|g){ }

if ($line =~ s|<<266>>Margins<<266>>|<span class="term-trigger" tabindex="0">Margins<span class="term-popup">The edge, generally of a leaf or perianth part.</span></span>|g){ }

if ($line =~ s| <<266>>margins<<266>>|&nbsp;<span class="term-trigger" tabindex="0">margins<span class="term-popup">The edge, generally of a leaf or perianth part.</span></span>|g){ }

if ($line =~ s|<<267>>Marsh<<267>>|<span class="term-trigger" tabindex="0">Marsh<span class="term-popup">Permanently or periodically inundated, mostly or completely treeless vegetation dominated by semi-aquatic herbs or subshrubs.</span></span>|g){ }

if ($line =~ s| <<267>>marsh<<267>>|&nbsp;<span class="term-trigger" tabindex="0">marsh<span class="term-popup">Permanently or periodically inundated, mostly or completely treeless vegetation dominated by semi-aquatic herbs or subshrubs.</span></span>|g){ }

if ($line =~ s|<<268>>Marshes<<268>>|<span class="term-trigger" tabindex="0">Marshes<span class="term-popup">Permanently or periodically inundated, mostly or completely treeless vegetation dominated by semi-aquatic herbs or subshrubs.</span></span>|g){ }

if ($line =~ s| <<268>>marshes<<268>>|&nbsp;<span class="term-trigger" tabindex="0">marshes<span class="term-popup">Permanently or periodically inundated, mostly or completely treeless vegetation dominated by semi-aquatic herbs or subshrubs.</span></span>|g){ }

if ($line =~ s|<<269>>Meadow<<269>>|<span class="term-trigger" tabindex="0">Meadow<span class="term-popup">Open grass- or sedge-dominated vegetation more or less surrounded by woodland or forest; meadow soils are generally seasonally moist and frequently are composed of fine-grained sediments.</span></span>|g){ }

if ($line =~ s| <<269>>meadow<<269>>|&nbsp;<span class="term-trigger" tabindex="0">meadow<span class="term-popup">Open grass- or sedge-dominated vegetation more or less surrounded by woodland or forest; meadow soils are generally seasonally moist and frequently are composed of fine-grained sediments.</span></span>|g){ }

if ($line =~ s|<<270>>Meadows<<270>>|<span class="term-trigger" tabindex="0">Meadows<span class="term-popup">Open grass- or sedge-dominated vegetation more or less surrounded by woodland or forest; meadow soils are generally seasonally moist and frequently are composed of fine-grained sediments.</span></span>|g){ }

if ($line =~ s| <<270>>meadows<<270>>|&nbsp;<span class="term-trigger" tabindex="0">meadows<span class="term-popup">Open grass- or sedge-dominated vegetation more or less surrounded by woodland or forest; meadow soils are generally seasonally moist and frequently are composed of fine-grained sediments.</span></span>|g){ }

if ($line =~ s|<<271>>Membranous<<271>>|<span class="term-trigger" tabindex="0">Membranous<span class="term-popup">Thin, dry or moist, pliable, often more or less translucent or variously colored, sometimes green.  (e.g., Leymus cinereus ligule)</span></span>|g){ }

if ($line =~ s| <<271>>membranous<<271>>|&nbsp;<span class="term-trigger" tabindex="0">membranous<span class="term-popup">Thin, dry or moist, pliable, often more or less translucent or variously colored, sometimes green.  (e.g., Leymus cinereus ligule)</span></span>|g){ }

if ($line =~ s|<<272>>Mericarp<<272>>|<span class="term-trigger" tabindex="0">Mericarp<span class="term-popup">One of the (generally dry, indehiscent, 1-seeded) parts into which certain fruits (e.g. those of Apiaceae) separate at maturity.</span></span>|g){ }

if ($line =~ s| <<272>>mericarp<<272>>|&nbsp;<span class="term-trigger" tabindex="0">mericarp<span class="term-popup">One of the (generally dry, indehiscent, 1-seeded) parts into which certain fruits (e.g. those of Apiaceae) separate at maturity.</span></span>|g){ }

if ($line =~ s|<<273>>Mixed-evergreen forest<<273>>|<span class="term-trigger" tabindex="0">Mixed-evergreen forest<span class="term-popup">Vegetation dominated by a variable mixture of mostly or only hardwood tree species, most of which retain their leaves throughout the year; dominated by closely spaced +- tall trees.</span></span>|g){ }

if ($line =~ s| <<273>>mixed-evergreen forest<<273>>|&nbsp;<span class="term-trigger" tabindex="0">mixed-evergreen forest<span class="term-popup">Vegetation dominated by a variable mixture of mostly or only hardwood tree species, most of which retain their leaves throughout the year; dominated by closely spaced +- tall trees.</span></span>|g){ }

if ($line =~ s|<<274>>Monoecious<<274>>|<span class="term-trigger" tabindex="0">Monoecious<span class="term-popup">Pertaining to a taxon in which individuals produce both male and female reproductive structures, and do not produce bisexual reproductive structures.  (e.g., Alnus rhombifolia)</span></span>|g){ }

if ($line =~ s| <<274>>monoecious<<274>>|&nbsp;<span class="term-trigger" tabindex="0">monoecious<span class="term-popup">Pertaining to a taxon in which individuals produce both male and female reproductive structures, and do not produce bisexual reproductive structures.  (e.g., Alnus rhombifolia)</span></span>|g){ }

if ($line =~ s|<<275>>Monolete spore<<275>>|<span class="term-trigger" tabindex="0">Monolete spore<span class="term-popup">In spore-bearing plants, bilaterally symmetric spore on which the scar is linear and unbranched.</span></span>|g){ }

if ($line =~ s| <<275>>monolete spore<<275>>|&nbsp;<span class="term-trigger" tabindex="0">monolete spore<span class="term-popup">In spore-bearing plants, bilaterally symmetric spore on which the scar is linear and unbranched.</span></span>|g){ }

if ($line =~ s|<<276>>Montane<<276>>|<span class="term-trigger" tabindex="0">Montane<span class="term-popup">Pertaining to mountains; vegetational--altitudinal zone between the foothill and subalpine zones.</span></span>|g){ }

if ($line =~ s| <<276>>montane<<276>>|&nbsp;<span class="term-trigger" tabindex="0">montane<span class="term-popup">Pertaining to mountains; vegetational--altitudinal zone between the foothill and subalpine zones.</span></span>|g){ }

if ($line =~ s|<<277>>Mucro<<277>>|<span class="term-trigger" tabindex="0">Mucro<span class="term-popup">An abrupt, short, sharp, narrow, terminal point, tip, or projection</span></span>|g){ }

if ($line =~ s| <<277>>mucro<<277>>|&nbsp;<span class="term-trigger" tabindex="0">mucro<span class="term-popup">An abrupt, short, sharp, narrow, terminal point, tip, or projection</span></span>|g){ }

if ($line =~ s|<<278>>Mucronate<<278>>|<span class="term-trigger" tabindex="0">Mucronate<span class="term-popup">An abrupt, short, sharp, narrow, terminal point, tip, or projection</span></span>|g){ }

if ($line =~ s| <<278>>mucronate<<278>>|&nbsp;<span class="term-trigger" tabindex="0">mucronate<span class="term-popup">An abrupt, short, sharp, narrow, terminal point, tip, or projection</span></span>|g){ }

if ($line =~ s|<<279>>Native<<279>>|<span class="term-trigger" tabindex="0">Native<span class="term-popup">Occurring naturally in an area, as neither a direct nor indirect consequence of human activity; indigenous; not alien.</span></span>|g){ }

if ($line =~ s| <<279>>native<<279>>|&nbsp;<span class="term-trigger" tabindex="0">native<span class="term-popup">Occurring naturally in an area, as neither a direct nor indirect consequence of human activity; indigenous; not alien.</span></span>|g){ }

if ($line =~ s|<<280>>Naturalized<<280>>|<span class="term-trigger" tabindex="0">Naturalized<span class="term-popup">Alien (not native) and reproducing either sexually (e.g., by spores, seeds) or vegetatively (e.g., by sprouts, suckers) in the absence of any benefit, intentional or not, direct or indirect, of human activity, and thereby persisting beyond initial generation or establishment.</span></span>|g){ }

if ($line =~ s| <<280>>naturalized<<280>>|&nbsp;<span class="term-trigger" tabindex="0">naturalized<span class="term-popup">Alien (not native) and reproducing either sexually (e.g., by spores, seeds) or vegetatively (e.g., by sprouts, suckers) in the absence of any benefit, intentional or not, direct or indirect, of human activity, and thereby persisting beyond initial generation or establishment.</span></span>|g){ }

if ($line =~ s|<<281>>Nectar<<281>>|<span class="term-trigger" tabindex="0">Nectar<span class="term-popup">A sugary solution, produced in nectaries, consumed primarily as an energy source by animal visitors, usually pollinators.</span></span>|g){ }

if ($line =~ s| <<281>>nectar<<281>>|&nbsp;<span class="term-trigger" tabindex="0">nectar<span class="term-popup">A sugary solution, produced in nectaries, consumed primarily as an energy source by animal visitors, usually pollinators.</span></span>|g){ }

if ($line =~ s|<<282>>Nectary<<282>>|<span class="term-trigger" tabindex="0">Nectary<span class="term-popup">Variously shaped, nectar-producing structure(s) usually at or near the base of the inside of a flower (or sometimes elsewhere, such as in a perianth spur or on a petiole). (e.g., Symphoricarpos rotundifolius)</span></span>|g){ }

if ($line =~ s| <<282>>nectary<<282>>|&nbsp;<span class="term-trigger" tabindex="0">nectary<span class="term-popup">Variously shaped, nectar-producing structure(s) usually at or near the base of the inside of a flower (or sometimes elsewhere, such as in a perianth spur or on a petiole). (e.g., Symphoricarpos rotundifolius)</span></span>|g){ }

if ($line =~ s|<<283>>Nectaries<<283>>|<span class="term-trigger" tabindex="0">Nectaries<span class="term-popup">Variously shaped, nectar-producing structure(s) usually at or near the base of the inside of a flower (or sometimes elsewhere, such as in a perianth spur or on a petiole). (e.g., Symphoricarpos rotundifolius)</span></span>|g){ }

if ($line =~ s| <<283>>nectaries<<283>>|&nbsp;<span class="term-trigger" tabindex="0">nectaries<span class="term-popup">Variously shaped, nectar-producing structure(s) usually at or near the base of the inside of a flower (or sometimes elsewhere, such as in a perianth spur or on a petiole). (e.g., Symphoricarpos rotundifolius)</span></span>|g){ }

if ($line =~ s|<<284>>Needle<<284>>|<span class="term-trigger" tabindex="0">Needle<span class="term-popup">A narrowly linear, often waxy, generally evergreen leaf, especially of conifers.</span></span>|g){ }

if ($line =~ s| <<284>>needle<<284>>|&nbsp;<span class="term-trigger" tabindex="0">needle<span class="term-popup"><img src="/eflora/common/images/morph/needle.jpg" class="term-img" alt="Morphology: needle">A narrowly linear, often waxy, generally evergreen leaf, especially of conifers.</span></span>|g){ }

if ($line =~ s|<<285>>Needles<<285>>|<span class="term-trigger" tabindex="0">Needles<span class="term-popup">A narrowly linear, often waxy, generally evergreen leaf, especially of conifers.</span></span>|g){ }

if ($line =~ s| <<285>>needles<<285>>|&nbsp;<span class="term-trigger" tabindex="0">needles<span class="term-popup"><img src="/eflora/common/images/morph/needles.jpg" class="term-img" alt="Morphology: needles">A narrowly linear, often waxy, generally evergreen leaf, especially of conifers.</span></span>|g){ }

if ($line =~ s|<<286>>Node<<286>>|<span class="term-trigger" tabindex="0">Node<span class="term-popup">Position on a stem from which one or more structures (especially leaves, buds, branches, or flowers) arise.</span></span>|g){ }

if ($line =~ s| <<286>>node<<286>>|&nbsp;<span class="term-trigger" tabindex="0">node<span class="term-popup"><img src="/eflora/common/images/morph/node.jpg" class="term-img" alt="Morphology: node">Position on a stem from which one or more structures (especially leaves, buds, branches, or flowers) arise.</span></span>|g){ }

if ($line =~ s|<<287>>Nodes<<287>>|<span class="term-trigger" tabindex="0">Nodes<span class="term-popup">Position on a stem from which one or more structures (especially leaves, buds, branches, or flowers) arise.</span></span>|g){ }

if ($line =~ s| <<287>>nodes<<287>>|&nbsp;<span class="term-trigger" tabindex="0">nodes<span class="term-popup"><img src="/eflora/common/images/morph/node.jpg" class="term-img" alt="Morphology: nodes">Position on a stem from which one or more structures (especially leaves, buds, branches, or flowers) arise.</span></span>|g){ }

if ($line =~ s|<<288>>Nut<<288>>|<span class="term-trigger" tabindex="0">Nut<span class="term-popup">Mostly dry, sometimes fleshy or pulpy, usually indehiscent fruit in which a single seed is encased in a hard shell.  (e.g., Quercus palmeri)</span></span>|g){ }

if ($line =~ s| <<288>>nut<<288>>|&nbsp;<span class="term-trigger" tabindex="0">nut<span class="term-popup">Mostly dry, sometimes fleshy or pulpy, usually indehiscent fruit in which a single seed is encased in a hard shell.  (e.g., Quercus palmeri)</span></span>|g){ }

if ($line =~ s|<<289>>Nuts<<289>>|<span class="term-trigger" tabindex="0">Nuts<span class="term-popup">Mostly dry, sometimes fleshy or pulpy, usually indehiscent fruit in which a single seed is encased in a hard shell.  (e.g., Quercus palmeri)</span></span>|g){ }

if ($line =~ s| <<289>>nuts<<289>>|&nbsp;<span class="term-trigger" tabindex="0">nuts<span class="term-popup">Mostly dry, sometimes fleshy or pulpy, usually indehiscent fruit in which a single seed is encased in a hard shell.  (e.g., Quercus palmeri)</span></span>|g){ }

if ($line =~ s|<<290>>Nutlet<<290>>|<span class="term-trigger" tabindex="0">Nutlet<span class="term-popup">Small, dry nut or nut-like fruit, usually several of which are produced by a single flower.  (e.g., Boraginaceae, Lamiaceae)</span></span>|g){ }

if ($line =~ s| <<290>>nutlet<<290>>|&nbsp;<span class="term-trigger" tabindex="0">nutlet<span class="term-popup">Small, dry nut or nut-like fruit, usually several of which are produced by a single flower.  (e.g., Boraginaceae, Lamiaceae)</span></span>|g){ }

if ($line =~ s|<<291>>Nutlets<<291>>|<span class="term-trigger" tabindex="0">Nutlets<span class="term-popup">Small, dry nut or nut-like fruit, usually several of which are produced by a single flower.  (e.g., Boraginaceae, Lamiaceae)</span></span>|g){ }

if ($line =~ s| <<291>>nutlets<<291>>|&nbsp;<span class="term-trigger" tabindex="0">nutlets<span class="term-popup">Small, dry nut or nut-like fruit, usually several of which are produced by a single flower.  (e.g., Boraginaceae, Lamiaceae)</span></span>|g){ }

if ($line =~ s|<<292>>Oblique<<292>>|<span class="term-trigger" tabindex="0">Oblique<span class="term-popup">Having unequal sides or an asymmetric base.</span></span>|g){ }

if ($line =~ s| <<292>>oblique<<292>>|&nbsp;<span class="term-trigger" tabindex="0">oblique<span class="term-popup"><img src="/eflora/common/images/morph/oblique.jpg" class="term-img" alt="Morphology: oblique">Having unequal sides or an asymmetric base.</span></span>|g){ }

if ($line =~ s|<<293>>Oblong<<293>>|<span class="term-trigger" tabindex="0">Oblong<span class="term-popup">Longer than wide, with nearly parallel sides; wider than linear.</span></span>|g){ }

if ($line =~ s| <<293>>oblong<<293>>|&nbsp;<span class="term-trigger" tabindex="0">oblong<span class="term-popup"><img src="/eflora/common/images/morph/oblong.jpg" class="term-img" alt="Morphology: oblong">Longer than wide, with nearly parallel sides; wider than linear.</span></span>|g){ }

if ($line =~ s|<<294>>Obtuse<<294>>|<span class="term-trigger" tabindex="0">Obtuse<span class="term-popup">Having a short-tapered, blunt tip or base, the sides convex or straight and converging at more than a right angle.</span></span>|g){ }

if ($line =~ s| <<294>>obtuse<<294>>|&nbsp;<span class="term-trigger" tabindex="0">obtuse<span class="term-popup"><img src="/eflora/common/images/morph/obtuse.jpg" class="term-img" alt="Morphology: obtuse">Having a short-tapered, blunt tip or base, the sides convex or straight and converging at more than a right angle.</span></span>|g){ }

if ($line =~ s|<<295>>Ocrea<<295>>|<span class="term-trigger" tabindex="0">Ocrea<span class="term-popup">A generally scarious sheath around the stem formed by the fusion of stipules.</span></span>|g){ }

if ($line =~ s| <<295>>ocrea<<295>>|&nbsp;<span class="term-trigger" tabindex="0">ocrea<span class="term-popup">A generally scarious sheath around the stem formed by the fusion of stipules.</span></span>|g){ }

if ($line =~ s|<<296>>Ocreae<<296>>|<span class="term-trigger" tabindex="0">Ocreae<span class="term-popup">A generally scarious sheath around the stem formed by the fusion of stipules.</span></span>|g){ }

if ($line =~ s| <<296>>ocreae<<296>>|&nbsp;<span class="term-trigger" tabindex="0">ocreae<span class="term-popup">A generally scarious sheath around the stem formed by the fusion of stipules.</span></span>|g){ }

if ($line =~ s|<<297>>Open<<297>>|<span class="term-trigger" tabindex="0">Open<span class="term-popup">Uncongested or diffuse; especially pertaining to the disposition of flowers in an inflorescence.</span></span>|g){ }

if ($line =~ s| <<297>>open<<297>>|&nbsp;<span class="term-trigger" tabindex="0">open<span class="term-popup">Uncongested or diffuse; especially pertaining to the disposition of flowers in an inflorescence.</span></span>|g){ }

if ($line =~ s|<<298>>Opposite<<298>>|<span class="term-trigger" tabindex="0">Opposite<span class="term-popup">1.  Arranged in pairs along an axis - e.g., two leaves per node.  2.  Occurring in the same rank, directly above or below, as 'stamens opposite petals'.  3.  Located directly across from.</span></span>|g){ }

if ($line =~ s| <<298>>opposite<<298>>|&nbsp;<span class="term-trigger" tabindex="0">opposite<span class="term-popup"><img src="/eflora/common/images/morph/opposite.jpg" class="term-img" alt="Morphology: opposite">1.  Arranged in pairs along an axis - e.g., two leaves per node.  2.  Occurring in the same rank, directly above or below, as 'stamens opposite petals'.  3.  Located directly across from.</span></span>|g){ }

if ($line =~ s|<<299>>Ovary<<299>>|<span class="term-trigger" tabindex="0">Ovary<span class="term-popup">Ovule-bearing, usually wider, basal portion of pistil, normally developing into a fruit as ovules become seeds; may be simple (one carpel, one chamber) or compound (two or more carpels, one or more chambers).</span></span>|g){ }

if ($line =~ s| <<299>>ovary<<299>>|&nbsp;<span class="term-trigger" tabindex="0">ovary<span class="term-popup">Ovule-bearing, usually wider, basal portion of pistil, normally developing into a fruit as ovules become seeds; may be simple (one carpel, one chamber) or compound (two or more carpels, one or more chambers).</span></span>|g){ }

if ($line =~ s|<<300>>Ovaries<<300>>|<span class="term-trigger" tabindex="0">Ovaries<span class="term-popup">Ovule-bearing, usually wider, basal portion of pistil, normally developing into a fruit as ovules become seeds; may be simple (one carpel, one chamber) or compound (two or more carpels, one or more chambers).</span></span>|g){ }

if ($line =~ s| <<300>>ovaries<<300>>|&nbsp;<span class="term-trigger" tabindex="0">ovaries<span class="term-popup">Ovule-bearing, usually wider, basal portion of pistil, normally developing into a fruit as ovules become seeds; may be simple (one carpel, one chamber) or compound (two or more carpels, one or more chambers).</span></span>|g){ }

if ($line =~ s|<<301>>Ovary stalk<<301>>|<span class="term-trigger" tabindex="0">Ovary stalk<span class="term-popup">A pedestal-like, apical prolongation of a floral receptacle (often termed elsewhere a carpophore) or basal constriction of an ovary (often termed elsewhere a gynophore), above the level of perianth insertion, each with the result that the ovary or fruit appears to be stalked over and above the pedicel (whereas the demarcation between pedicel and ovary- or fruit-stalk is observable as the point of perianth insertion, carpophores generally are distinguished from gynophores only by anatomical study).</span></span>|g){ }

if ($line =~ s| <<301>>ovary stalk<<301>>|&nbsp;<span class="term-trigger" tabindex="0">ovary stalk<span class="term-popup">A pedestal-like, apical prolongation of a floral receptacle (often termed elsewhere a carpophore) or basal constriction of an ovary (often termed elsewhere a gynophore), above the level of perianth insertion, each with the result that the ovary or fruit appears to be stalked over and above the pedicel (whereas the demarcation between pedicel and ovary- or fruit-stalk is observable as the point of perianth insertion, carpophores generally are distinguished from gynophores only by anatomical study).</span></span>|g){ }

if ($line =~ s|<<302>>Fruit stalk<<302>>|<span class="term-trigger" tabindex="0">Fruit stalk<span class="term-popup">A pedestal-like, apical prolongation of a floral receptacle (often termed elsewhere a carpophore) or basal constriction of an ovary (often termed elsewhere a gynophore), above the level of perianth insertion, each with the result that the ovary or fruit appears to be stalked over and above the pedicel (whereas the demarcation between pedicel and ovary- or fruit-stalk is observable as the point of perianth insertion, carpophores generally are distinguished from gynophores only by anatomical study).</span></span>|g){ }

if ($line =~ s| <<302>>fruit stalk<<302>>|&nbsp;<span class="term-trigger" tabindex="0">fruit stalk<span class="term-popup">A pedestal-like, apical prolongation of a floral receptacle (often termed elsewhere a carpophore) or basal constriction of an ovary (often termed elsewhere a gynophore), above the level of perianth insertion, each with the result that the ovary or fruit appears to be stalked over and above the pedicel (whereas the demarcation between pedicel and ovary- or fruit-stalk is observable as the point of perianth insertion, carpophores generally are distinguished from gynophores only by anatomical study).</span></span>|g){ }

if ($line =~ s|<<303>>Ovate<<303>>|<span class="term-trigger" tabindex="0">Ovate<span class="term-popup">Egg-shaped (i.e., widest below the middle) in two dimensions (i.e., in one plane), as a leaf.</span></span>|g){ }

if ($line =~ s| <<303>>ovate<<303>>|&nbsp;<span class="term-trigger" tabindex="0">ovate<span class="term-popup"><img src="/eflora/common/images/morph/ovate.jpg" class="term-img" alt="Morphology: ovate">Egg-shaped (i.e., widest below the middle) in two dimensions (i.e., in one plane), as a leaf.</span></span>|g){ }

if ($line =~ s|<<304>>Ovoid<<304>>|<span class="term-trigger" tabindex="0">Ovoid<span class="term-popup">Egg-shaped (i.e., widest below the middle) in three dimensions, as a fruit.</span></span>|g){ }

if ($line =~ s| <<304>>ovoid<<304>>|&nbsp;<span class="term-trigger" tabindex="0">ovoid<span class="term-popup">Egg-shaped (i.e., widest below the middle) in three dimensions, as a fruit.</span></span>|g){ }

if ($line =~ s|<<305>>Ovule<<305>>|<span class="term-trigger" tabindex="0">Ovule<span class="term-popup">In gymnosperms and angiosperms, structure containing an egg, and normally developing into a seed after fertilization.</span></span>|g){ }

if ($line =~ s| <<305>>ovule<<305>>|&nbsp;<span class="term-trigger" tabindex="0">ovule<span class="term-popup">In gymnosperms and angiosperms, structure containing an egg, and normally developing into a seed after fertilization.</span></span>|g){ }

if ($line =~ s|<<306>>Ovules<<306>>|<span class="term-trigger" tabindex="0">Ovules<span class="term-popup">In gymnosperms and angiosperms, structure containing an egg, and normally developing into a seed after fertilization.</span></span>|g){ }

if ($line =~ s| <<306>>ovules<<306>>|&nbsp;<span class="term-trigger" tabindex="0">ovules<span class="term-popup">In gymnosperms and angiosperms, structure containing an egg, and normally developing into a seed after fertilization.</span></span>|g){ }

if ($line =~ s|<<307>>Paleate<<307>>|<span class="term-trigger" tabindex="0">Paleate<span class="term-popup">1. In Asteraceae, a scale-like bract that subtends an individual flower on the receptacle (equal to 'chaff scale' in TJM), absent in some genera, restricted to a ring separating ray and disk flowers in most tarweed species. 2. In Poaceae, the distal, generally smaller of two sheathing bracts subtending a flower, generally two-veined and -keeled and ensheathed by the lemma; with the lemma and flower, comprising the floret.</span></span>|g){ }

if ($line =~ s| <<307>>paleate<<307>>|&nbsp;<span class="term-trigger" tabindex="0">paleate<span class="term-popup">1. In Asteraceae, a scale-like bract that subtends an individual flower on the receptacle (equal to 'chaff scale' in TJM), absent in some genera, restricted to a ring separating ray and disk flowers in most tarweed species. 2. In Poaceae, the distal, generally smaller of two sheathing bracts subtending a flower, generally two-veined and -keeled and ensheathed by the lemma; with the lemma and flower, comprising the floret.</span></span>|g){ }

if ($line =~ s|<<308>>Palea<<308>>|<span class="term-trigger" tabindex="0">Palea<span class="term-popup">1. In Asteraceae, a scale-like bract that subtends an individual flower on the receptacle (equal to 'chaff scale' in TJM), absent in some genera, restricted to a ring separating ray and disk flowers in most tarweed species. 2. In Poaceae, the distal, generally smaller of two sheathing bracts subtending a flower, generally two-veined and -keeled and ensheathed by the lemma; with the lemma and flower, comprising the floret.</span></span>|g){ }

if ($line =~ s| <<308>>palea<<308>>|&nbsp;<span class="term-trigger" tabindex="0">palea<span class="term-popup"><img src="/eflora/common/images/morph/grass-palea.jpg" class="term-img" alt="Morphology: palea">1. In Asteraceae, a scale-like bract that subtends an individual flower on the receptacle (equal to 'chaff scale' in TJM), absent in some genera, restricted to a ring separating ray and disk flowers in most tarweed species. 2. In Poaceae, the distal, generally smaller of two sheathing bracts subtending a flower, generally two-veined and -keeled and ensheathed by the lemma; with the lemma and flower, comprising the floret.</span></span>|g){ }

if ($line =~ s|<<309>>Paleae<<309>>|<span class="term-trigger" tabindex="0">Paleae<span class="term-popup">1. In Asteraceae, a scale-like bract that subtends an individual flower on the receptacle (equal to 'chaff scale' in TJM), absent in some genera, restricted to a ring separating ray and disk flowers in most tarweed species. 2. In Poaceae, the distal, generally smaller of two sheathing bracts subtending a flower, generally two-veined and -keeled and ensheathed by the lemma; with the lemma and flower, comprising the floret.</span></span>|g){ }

if ($line =~ s| <<309>>paleae<<309>>|&nbsp;<span class="term-trigger" tabindex="0">paleae<span class="term-popup">1. In Asteraceae, a scale-like bract that subtends an individual flower on the receptacle (equal to 'chaff scale' in TJM), absent in some genera, restricted to a ring separating ray and disk flowers in most tarweed species. 2. In Poaceae, the distal, generally smaller of two sheathing bracts subtending a flower, generally two-veined and -keeled and ensheathed by the lemma; with the lemma and flower, comprising the floret.</span></span>|g){ }

if ($line =~ s|<<310>>Palmately<<310>>|<span class="term-trigger" tabindex="0">Palmately<span class="term-popup">More than two structures or parts (e.g., veins, lobes, or leaflets) radiating from a common point in two dimensions (i.e., in one plane).</span></span>|g){ }

if ($line =~ s| <<310>>palmately<<310>>|&nbsp;<span class="term-trigger" tabindex="0">palmately<span class="term-popup">More than two structures or parts (e.g., veins, lobes, or leaflets) radiating from a common point in two dimensions (i.e., in one plane).</span></span>|g){ }

if ($line =~ s|<<311>>Palmate<<311>>|<span class="term-trigger" tabindex="0">Palmate<span class="term-popup">More than two structures or parts (e.g., veins, lobes, or leaflets) radiating from a common point in two dimensions (i.e., in one plane).</span></span>|g){ }

if ($line =~ s| <<311>>palmate<<311>>|&nbsp;<span class="term-trigger" tabindex="0">palmate<span class="term-popup"><img src="/eflora/common/images/morph/palmate.jpg" class="term-img" alt="Morphology: palmate">More than two structures or parts (e.g., veins, lobes, or leaflets) radiating from a common point in two dimensions (i.e., in one plane).</span></span>|g){ }

if ($line =~ s|<<312>>Panicle<<312>>|<span class="term-trigger" tabindex="0">Panicle<span class="term-popup">1. In flowering plants excluding Asteraceae, Cyperaceae, Poaceae, and some other groups, a branched inflorescence in which the basal or lateral flowers (or some of them) open before the terminal or central flowers on any axis. 2. In Asteraceae, Cyperaceae,  Poaceae, and some other groups, a panicle-like inflorescence is one in which at least some of  the inflorescence units (e.g., heads in Asteraceae; spikelets in Cyperaceae and Poaceae),  instead of individual flowers, are attached (stalked or unstalked) to branches and not directly to the main axis of the inflorescence and in which floral development may or may not proceed as in 1.</span></span>|g){ }

if ($line =~ s| <<312>>panicle<<312>>|&nbsp;<span class="term-trigger" tabindex="0">panicle<span class="term-popup"><img src="/eflora/common/images/morph/panicle.jpg" class="term-img" alt="Morphology: panicle">1. In flowering plants excluding Asteraceae, Cyperaceae, Poaceae, and some other groups, a branched inflorescence in which the basal or lateral flowers (or some of them) open before the terminal or central flowers on any axis. 2. In Asteraceae, Cyperaceae,  Poaceae, and some other groups, a panicle-like inflorescence is one in which at least some of  the inflorescence units (e.g., heads in Asteraceae; spikelets in Cyperaceae and Poaceae),  instead of individual flowers, are attached (stalked or unstalked) to branches and not directly to the main axis of the inflorescence and in which floral development may or may not proceed as in 1.</span></span>|g){ }

if ($line =~ s|<<313>>Panicles<<313>>|<span class="term-trigger" tabindex="0">Panicles<span class="term-popup">1. In flowering plants excluding Asteraceae, Cyperaceae, Poaceae, and some other groups, a branched inflorescence in which the basal or lateral flowers (or some of them) open before the terminal or central flowers on any axis. 2. In Asteraceae, Cyperaceae,  Poaceae, and some other groups, a panicle-like inflorescence is one in which at least some of  the inflorescence units (e.g., heads in Asteraceae; spikelets in Cyperaceae and Poaceae),  instead of individual flowers, are attached (stalked or unstalked) to branches and not directly to the main axis of the inflorescence and in which floral development may or may not proceed as in 1.</span></span>|g){ }

if ($line =~ s| <<313>>panicles<<313>>|&nbsp;<span class="term-trigger" tabindex="0">panicles<span class="term-popup"><img src="/eflora/common/images/morph/panicle.jpg" class="term-img" alt="Morphology: panicles">1. In flowering plants excluding Asteraceae, Cyperaceae, Poaceae, and some other groups, a branched inflorescence in which the basal or lateral flowers (or some of them) open before the terminal or central flowers on any axis. 2. In Asteraceae, Cyperaceae,  Poaceae, and some other groups, a panicle-like inflorescence is one in which at least some of  the inflorescence units (e.g., heads in Asteraceae; spikelets in Cyperaceae and Poaceae),  instead of individual flowers, are attached (stalked or unstalked) to branches and not directly to the main axis of the inflorescence and in which floral development may or may not proceed as in 1.</span></span>|g){ }

if ($line =~ s|<<314>>Papillate<<314>>|<span class="term-trigger" tabindex="0">Papillate<span class="term-popup">Pertaining to a surface (e.g., of a leaf, stigma, fruit) bearing small, rounded or conic protuberances (papillae).</span></span>|g){ }

if ($line =~ s| <<314>>papillate<<314>>|&nbsp;<span class="term-trigger" tabindex="0">papillate<span class="term-popup"><img src="/eflora/common/images/morph/papillate.jpg" class="term-img" alt="Morphology: papillate">Pertaining to a surface (e.g., of a leaf, stigma, fruit) bearing small, rounded or conic protuberances (papillae).</span></span>|g){ }

if ($line =~ s|<<315>>Pappus<<315>>|<span class="term-trigger" tabindex="0">Pappus<span class="term-popup">In Asteraceae, the aggregate of structures such as awns, bristles, or scales arising from the top of the inferior ovary, in place of the calyx.</span></span>|g){ }

if ($line =~ s| <<315>>pappus<<315>>|&nbsp;<span class="term-trigger" tabindex="0">pappus<span class="term-popup">In Asteraceae, the aggregate of structures such as awns, bristles, or scales arising from the top of the inferior ovary, in place of the calyx.</span></span>|g){ }

if ($line =~ s|<<316>>Parasite<<316>>|<span class="term-trigger" tabindex="0">Parasite<span class="term-popup">A plant that benefits by taking resources from a physical connection to a host plant of another species; green parasites (hemiparasites) derive water and dissolved inorganic substances (e.g., mineral nutrients) from the connection and often are able to survive without it, while non-green parasites (holoparasites) obtain in addition energy-rich, organic compounds (products of photosynthesis) from the connection and cannot survive without it; the connection may or may not involve a fungal intermediate, and may or may not be detrimental to the host.</span></span>|g){ }

if ($line =~ s| <<316>>parasite<<316>>|&nbsp;<span class="term-trigger" tabindex="0">parasite<span class="term-popup">A plant that benefits by taking resources from a physical connection to a host plant of another species; green parasites (hemiparasites) derive water and dissolved inorganic substances (e.g., mineral nutrients) from the connection and often are able to survive without it, while non-green parasites (holoparasites) obtain in addition energy-rich, organic compounds (products of photosynthesis) from the connection and cannot survive without it; the connection may or may not involve a fungal intermediate, and may or may not be detrimental to the host.</span></span>|g){ }

if ($line =~ s|<<317>>Parasites<<317>>|<span class="term-trigger" tabindex="0">Parasites<span class="term-popup">A plant that benefits by taking resources from a physical connection to a host plant of another species; green parasites (hemiparasites) derive water and dissolved inorganic substances (e.g., mineral nutrients) from the connection and often are able to survive without it, while non-green parasites (holoparasites) obtain in addition energy-rich, organic compounds (products of photosynthesis) from the connection and cannot survive without it; the connection may or may not involve a fungal intermediate, and may or may not be detrimental to the host.</span></span>|g){ }

if ($line =~ s| <<317>>parasites<<317>>|&nbsp;<span class="term-trigger" tabindex="0">parasites<span class="term-popup">A plant that benefits by taking resources from a physical connection to a host plant of another species; green parasites (hemiparasites) derive water and dissolved inorganic substances (e.g., mineral nutrients) from the connection and often are able to survive without it, while non-green parasites (holoparasites) obtain in addition energy-rich, organic compounds (products of photosynthesis) from the connection and cannot survive without it; the connection may or may not involve a fungal intermediate, and may or may not be detrimental to the host.</span></span>|g){ }

if ($line =~ s|<<318>>Parietal<<318>>|<span class="term-trigger" tabindex="0">Parietal<span class="term-popup">Pertaining to placentas on the inside surface of the ovary wall in a compound ovary with one or more chambers.</span></span>|g){ }

if ($line =~ s| <<318>>parietal<<318>>|&nbsp;<span class="term-trigger" tabindex="0">parietal<span class="term-popup"><img src="/eflora/common/images/morph/parietal-placentas.jpg" class="term-img" alt="Morphology: parietal">Pertaining to placentas on the inside surface of the ovary wall in a compound ovary with one or more chambers.</span></span>|g){ }

if ($line =~ s|<<319>>Parietally<<319>>|<span class="term-trigger" tabindex="0">Parietally<span class="term-popup">Pertaining to placentas on the inside surface of the ovary wall in a compound ovary with one or more chambers.</span></span>|g){ }

if ($line =~ s| <<319>>parietally<<319>>|&nbsp;<span class="term-trigger" tabindex="0">parietally<span class="term-popup">Pertaining to placentas on the inside surface of the ovary wall in a compound ovary with one or more chambers.</span></span>|g){ }

if ($line =~ s|<<320>>Peat<<320>>|<span class="term-trigger" tabindex="0">Peat<span class="term-popup">Material formed by the partial decomposition in water of plant tissues, especially mosses (Sphagnum) or sedges.</span></span>|g){ }

if ($line =~ s| <<320>>peat<<320>>|&nbsp;<span class="term-trigger" tabindex="0">peat<span class="term-popup">Material formed by the partial decomposition in water of plant tissues, especially mosses (Sphagnum) or sedges.</span></span>|g){ }

if ($line =~ s|<<321>>Peatland<<321>>|<span class="term-trigger" tabindex="0">Peatland<span class="term-popup">Moss- or herb-dominated freshwater wetland characterized by nutrient-deficient substrates and the accumulation of peat; often said (elsewhere, not in TJM2) to be bogs if acidic, fens if basic.</span></span>|g){ }

if ($line =~ s| <<321>>peatland<<321>>|&nbsp;<span class="term-trigger" tabindex="0">peatland<span class="term-popup">Moss- or herb-dominated freshwater wetland characterized by nutrient-deficient substrates and the accumulation of peat; often said (elsewhere, not in TJM2) to be bogs if acidic, fens if basic.</span></span>|g){ }

if ($line =~ s|<<322>>Peatlands<<322>>|<span class="term-trigger" tabindex="0">Peatlands<span class="term-popup">Moss- or herb-dominated freshwater wetland characterized by nutrient-deficient substrates and the accumulation of peat; often said (elsewhere, not in TJM2) to be bogs if acidic, fens if basic.</span></span>|g){ }

if ($line =~ s| <<322>>peatlands<<322>>|&nbsp;<span class="term-trigger" tabindex="0">peatlands<span class="term-popup">Moss- or herb-dominated freshwater wetland characterized by nutrient-deficient substrates and the accumulation of peat; often said (elsewhere, not in TJM2) to be bogs if acidic, fens if basic.</span></span>|g){ }

if ($line =~ s|<<323>>Pedicel<<323>>|<span class="term-trigger" tabindex="0">Pedicel<span class="term-popup">Stalk of an individual flower in an inflorescence, or the corresponding   structure in fruit.</span></span>|g){ }

if ($line =~ s| <<323>>pedicel<<323>>|&nbsp;<span class="term-trigger" tabindex="0">pedicel<span class="term-popup"><img src="/eflora/common/images/morph/pedicel.jpg" class="term-img" alt="Morphology: pedicel">Stalk of an individual flower in an inflorescence, or the corresponding   structure in fruit.</span></span>|g){ }

if ($line =~ s|<<324>>Pedicels<<324>>|<span class="term-trigger" tabindex="0">Pedicels<span class="term-popup">Stalk of an individual flower in an inflorescence, or the corresponding   structure in fruit.</span></span>|g){ }

if ($line =~ s| <<324>>pedicels<<324>>|&nbsp;<span class="term-trigger" tabindex="0">pedicels<span class="term-popup"><img src="/eflora/common/images/morph/pedicel.jpg" class="term-img" alt="Morphology: pedicels">Stalk of an individual flower in an inflorescence, or the corresponding   structure in fruit.</span></span>|g){ }

if ($line =~ s|<<325>>Peduncle<<325>>|<span class="term-trigger" tabindex="0">Peduncle<span class="term-popup">Stalk of an individual flower borne singly, not in an inflorescence, or of an entire inflorescence, or the corresponding structure in fruit; the stalk subtending an involucre (e.g., in Asteraceae, Polygonaceae).</span></span>|g){ }

if ($line =~ s| <<325>>peduncle<<325>>|&nbsp;<span class="term-trigger" tabindex="0">peduncle<span class="term-popup"><img src="/eflora/common/images/morph/peduncle.jpg" class="term-img" alt="Morphology: peduncle">Stalk of an individual flower borne singly, not in an inflorescence, or of an entire inflorescence, or the corresponding structure in fruit; the stalk subtending an involucre (e.g., in Asteraceae, Polygonaceae).</span></span>|g){ }

if ($line =~ s|<<326>>Peduncles<<326>>|<span class="term-trigger" tabindex="0">Peduncles<span class="term-popup">Stalk of an individual flower borne singly, not in an inflorescence, or of an entire inflorescence, or the corresponding structure in fruit; the stalk subtending an involucre (e.g., in Asteraceae, Polygonaceae).</span></span>|g){ }

if ($line =~ s| <<326>>peduncles<<326>>|&nbsp;<span class="term-trigger" tabindex="0">peduncles<span class="term-popup"><img src="/eflora/common/images/morph/peduncle.jpg" class="term-img" alt="Morphology: peduncles">Stalk of an individual flower borne singly, not in an inflorescence, or of an entire inflorescence, or the corresponding structure in fruit; the stalk subtending an involucre (e.g., in Asteraceae, Polygonaceae).</span></span>|g){ }

if ($line =~ s|<<327>>Peltate<<327>>|<span class="term-trigger" tabindex="0">Peltate<span class="term-popup">With the stalk attached toward the middle, not at a margin, of a flat structure such as an indusium, scale, or leaf.</span></span>|g){ }

if ($line =~ s| <<327>>peltate<<327>>|&nbsp;<span class="term-trigger" tabindex="0">peltate<span class="term-popup"><img src="/eflora/common/images/morph/peltate.jpg" class="term-img" alt="Morphology: peltate">With the stalk attached toward the middle, not at a margin, of a flat structure such as an indusium, scale, or leaf.</span></span>|g){ }

if ($line =~ s|<<328>>Pendent<<328>>|<span class="term-trigger" tabindex="0">Pendent<span class="term-popup">Drooping, hanging, or suspended from a point of attachment above.  (e.g., Amelanchier utahensis fruit)</span></span>|g){ }

if ($line =~ s| <<328>>pendent<<328>>|&nbsp;<span class="term-trigger" tabindex="0">pendent<span class="term-popup">Drooping, hanging, or suspended from a point of attachment above.  (e.g., Amelanchier utahensis fruit)</span></span>|g){ }

if ($line =~ s|<<329>>Perennial<<329>>|<span class="term-trigger" tabindex="0">Perennial<span class="term-popup">Completing life cycle (germination through death) in more than two years or growing seasons, generally non-woody (at least above ground) to woody; includes perennial herbs as well as subshrubs to trees; the abbreviation 'per' only refers to perennial herb, not to the word 'perennial' alone.</span></span>|g){ }

if ($line =~ s| <<329>>perennial<<329>>|&nbsp;<span class="term-trigger" tabindex="0">Perennial<span class="term-popup">Completing life cycle (germination through death) in more than two years or growing seasons, generally non-woody (at least above ground) to woody; includes perennial herbs as well as subshrubs to trees; the abbreviation 'per' only refers to perennial herb, not to the word 'perennial' alone.</span></span>|g){ }


if ($line =~ s|<<330>>Perianth<<330>>|<span class="term-trigger" tabindex="0">Perianth<span class="term-popup">Calyx and corolla collectively, whether or not they are distinguishable.</span></span>|g){ }

if ($line =~ s| <<330>>perianth<<330>>|&nbsp;<span class="term-trigger" tabindex="0">perianth<span class="term-popup">Calyx and corolla collectively, whether or not they are distinguishable.</span></span>|g){ }

if ($line =~ s|<<331>>Perianths<<331>>|<span class="term-trigger" tabindex="0">Perianths<span class="term-popup">Calyx and corolla collectively, whether or not they are distinguishable.</span></span>|g){ }

if ($line =~ s| <<331>>perianths<<331>>|&nbsp;<span class="term-trigger" tabindex="0">perianths<span class="term-popup">Calyx and corolla collectively, whether or not they are distinguishable.</span></span>|g){ }

if ($line =~ s|<<332>>Perianth part<<332>>|<span class="term-trigger" tabindex="0">Perianth part<span class="term-popup">An individual member of a perianth; used whether or not calyx and corolla are distinguishable, but usually when they are not.</span></span>|g){ }

if ($line =~ s| <<332>>perianth part<<332>>|&nbsp;<span class="term-trigger" tabindex="0">perianth part<span class="term-popup">An individual member of a perianth; used whether or not calyx and corolla are distinguishable, but usually when they are not.</span></span>|g){ }

if ($line =~ s|<<333>>Perigynium<<333>>|<span class="term-trigger" tabindex="0">Perigynium<span class="term-popup">Variously shaped, sac-like structure enclosing the ovary and achene in Carex and Kobresia.</span></span>|g){ }

if ($line =~ s| <<333>>perigynium<<333>>|&nbsp;<span class="term-trigger" tabindex="0">perigynium<span class="term-popup"><img src="/eflora/common/images/morph/perigynium.jpg" class="term-img" alt="Morphology: perigynium">Variously shaped, sac-like structure enclosing the ovary and achene in Carex and Kobresia.</span></span>|g){ }

if ($line =~ s|<<334>>Persistent<<334>>|<span class="term-trigger" tabindex="0">Persistent<span class="term-popup">Not falling off; remaining attached.</span></span>|g){ }

if ($line =~ s| <<334>>persistent<<334>>|&nbsp;<span class="term-trigger" tabindex="0">persistent<span class="term-popup">Not falling off; remaining attached.</span></span>|g){ }

if ($line =~ s|<<335>>Petal<<335>>|<span class="term-trigger" tabindex="0">Petal<span class="term-popup">Individual member of the corolla, whether fused or not; if fused, often equal in number to the number of corolla lobes; often conspicuously colored.</span></span>|g){ }

if ($line =~ s| <<335>>petal<<335>>|&nbsp;<span class="term-trigger" tabindex="0">petal<span class="term-popup">Individual member of the corolla, whether fused or not; if fused, often equal in number to the number of corolla lobes; often conspicuously colored.</span></span>|g){ }

if ($line =~ s|<<336>>Petals<<336>>|<span class="term-trigger" tabindex="0">Petals<span class="term-popup">Individual member of the corolla, whether fused or not; if fused, often equal in number to the number of corolla lobes; often conspicuously colored.</span></span>|g){ }

if ($line =~ s| <<336>>petals<<336>>|&nbsp;<span class="term-trigger" tabindex="0">petals<span class="term-popup">Individual member of the corolla, whether fused or not; if fused, often equal in number to the number of corolla lobes; often conspicuously colored.</span></span>|g){ }

if ($line =~ s|<<337>>Petiole<<337>>|<span class="term-trigger" tabindex="0">Petiole<span class="term-popup">Leaf stalk, connecting leaf blade to stem; sometimes more or less indistinct.</span></span>|g){ }

if ($line =~ s| <<337>>petiole<<337>>|&nbsp;<span class="term-trigger" tabindex="0">petiole<span class="term-popup"><img src="/eflora/common/images/morph/petioled.jpg" class="term-img" alt="Morphology: petiole">Leaf stalk, connecting leaf blade to stem; sometimes more or less indistinct.</span></span>|g){ }

if ($line =~ s|<<338>>Petioles<<338>>|<span class="term-trigger" tabindex="0">Petioles<span class="term-popup">Leaf stalk, connecting leaf blade to stem; sometimes more or less indistinct.</span></span>|g){ }

if ($line =~ s| <<338>>petioles<<338>>|&nbsp;<span class="term-trigger" tabindex="0">petioles<span class="term-popup"><img src="/eflora/common/images/morph/petioled.jpg" class="term-img" alt="Morphology: petioles">Leaf stalk, connecting leaf blade to stem; sometimes more or less indistinct.</span></span>|g){ }

if ($line =~ s|<<339>>Phyllary<<339>>|<span class="term-trigger" tabindex="0">Phyllary<span class="term-popup">In Asteraceae, a bract of the involucre.</span></span>|g){ }

if ($line =~ s| <<339>>phyllary<<339>>|&nbsp;<span class="term-trigger" tabindex="0">phyllary<span class="term-popup">In Asteraceae, a bract of the involucre.</span></span>|g){ }

if ($line =~ s|<<340>>Phyllaries<<340>>|<span class="term-trigger" tabindex="0">Phyllaries<span class="term-popup">In Asteraceae, a bract of the involucre.</span></span>|g){ }

if ($line =~ s| <<340>>phyllaries<<340>>|&nbsp;<span class="term-trigger" tabindex="0">phyllaries<span class="term-popup">In Asteraceae, a bract of the involucre.</span></span>|g){ }

if ($line =~ s|<<341>>Pinna<<341>>|<span class="term-trigger" tabindex="0">Pinna<span class="term-popup">In ferns, primary division of a compound or dissected frond blade.</span></span>|g){ }

if ($line =~ s| <<341>>pinna<<341>>|&nbsp;<span class="term-trigger" tabindex="0">pinna<span class="term-popup"><img src="/eflora/common/images/morph/fern-leaf-pinna.jpg" class="term-img" alt="Morphology: pinna">In ferns, primary division of a compound or dissected frond blade.</span></span>|g){ }

if ($line =~ s|<<342>>Pinnae<<342>>|<span class="term-trigger" tabindex="0">Pinnae<span class="term-popup">In ferns, primary division of a compound or dissected frond blade.</span></span>|g){ }

if ($line =~ s| <<342>>pinnae<<342>>|&nbsp;<span class="term-trigger" tabindex="0">pinnae<span class="term-popup">In ferns, primary division of a compound or dissected frond blade.</span></span>|g){ }

if ($line =~ s|<<343>>Pinnate<<343>>|<span class="term-trigger" tabindex="0">Pinnate<span class="term-popup">Feather-like; pertaining to veins, lobes, leaflets, or other structures arranged in two dimensions (i.e., in one plane) along either side of an axis; a leaf is odd-pinnate if there is a terminal leaflet, even-pinnate if there is not, and either odd- or even-pinnate may be 1-pinnate (blade divided into primary leaflets), 2-pinnate (primary leaflets divided into secondary leaflets), 3-pinnate (secondary leaflets divided into tertiary leaflets), etc.</span></span>|g){ }

if ($line =~ s| <<343>>pinnate<<343>>|&nbsp;<span class="term-trigger" tabindex="0">pinnate<span class="term-popup"><img src="/eflora/common/images/morph/odd-pinnate.jpg" class="term-img" alt="Morphology: pinnate">Feather-like; pertaining to veins, lobes, leaflets, or other structures arranged in two dimensions (i.e., in one plane) along either side of an axis; a leaf is odd-pinnate if there is a terminal leaflet, even-pinnate if there is not, and either odd- or even-pinnate may be 1-pinnate (blade divided into primary leaflets), 2-pinnate (primary leaflets divided into secondary leaflets), 3-pinnate (secondary leaflets divided into tertiary leaflets), etc.</span></span>|g){ }

if ($line =~ s|<<344>>Pinnately<<344>>|<span class="term-trigger" tabindex="0">Pinnately<span class="term-popup">Feather-like; pertaining to veins, lobes, leaflets, or other structures arranged in two dimensions (i.e., in one plane) along either side of an axis; a leaf is odd-pinnate if there is a terminal leaflet, even-pinnate if there is not, and either odd- or even-pinnate may be 1-pinnate (blade divided into primary leaflets), 2-pinnate (primary leaflets divided into secondary leaflets), 3-pinnate (secondary leaflets divided into tertiary leaflets), etc.</span></span>|g){ }

if ($line =~ s| <<344>>pinnately<<344>>|&nbsp;<span class="term-trigger" tabindex="0">pinnately<span class="term-popup">Feather-like; pertaining to veins, lobes, leaflets, or other structures arranged in two dimensions (i.e., in one plane) along either side of an axis; a leaf is odd-pinnate if there is a terminal leaflet, even-pinnate if there is not, and either odd- or even-pinnate may be 1-pinnate (blade divided into primary leaflets), 2-pinnate (primary leaflets divided into secondary leaflets), 3-pinnate (secondary leaflets divided into tertiary leaflets), etc.</span></span>|g){ }

if ($line =~ s|<<345>>Pinnule<<345>>|<span class="term-trigger" tabindex="0">Pinnule<span class="term-popup">In ferns, secondary division of a compound or dissected frond blade, primary division of a pinna.</span></span>|g){ }

if ($line =~ s| <<345>>pinnule<<345>>|&nbsp;<span class="term-trigger" tabindex="0">pinnule<span class="term-popup"><img src="/eflora/common/images/morph/fern-leaf-pinnule.jpg" class="term-img" alt="Morphology: pinnule">In ferns, secondary division of a compound or dissected frond blade, primary division of a pinna.</span></span>|g){ }

if ($line =~ s|<<346>>Pinnules<<346>>|<span class="term-trigger" tabindex="0">Pinnules<span class="term-popup">In ferns, secondary division of a compound or dissected frond blade, primary division of a pinna.</span></span>|g){ }

if ($line =~ s| <<346>>pinnules<<346>>|&nbsp;<span class="term-trigger" tabindex="0">pinnules<span class="term-popup">In ferns, secondary division of a compound or dissected frond blade, primary division of a pinna.</span></span>|g){ }

if ($line =~ s|<<347>>Pinnulet<<347>>|<span class="term-trigger" tabindex="0">Pinnulet<span class="term-popup">In ferns, tertiary division of a compound or dissected frond blade, secondary division of a pinna, primary division of a pinnule.</span></span>|g){ }

if ($line =~ s| <<347>>pinnulet<<347>>|&nbsp;<span class="term-trigger" tabindex="0">pinnulet<span class="term-popup">In ferns, tertiary division of a compound or dissected frond blade, secondary division of a pinna, primary division of a pinnule.</span></span>|g){ }

if ($line =~ s|<<348>>Pistil<<348>>|<span class="term-trigger" tabindex="0">Pistil<span class="term-popup">Female reproductive structure of a flower, composed of an ovule-containing ovary at the base, one or more pollen-receiving stigmas at the tip, and generally one or more styles between ovary and stigma.  A flower may have one or more simple pistils (each a single, free carpel with a single ovary chamber, placenta, and stigma) or one compound pistil (two or more fused or partially fused carpels, the exact number often equaling the number of ovary lobes, ovary chambers, placentas, styles, or stigmas).</span></span>|g){ }

if ($line =~ s| <<348>>pistil<<348>>|&nbsp;<span class="term-trigger" tabindex="0">pistil<span class="term-popup">Female reproductive structure of a flower, composed of an ovule-containing ovary at the base, one or more pollen-receiving stigmas at the tip, and generally one or more styles between ovary and stigma.  A flower may have one or more simple pistils (each a single, free carpel with a single ovary chamber, placenta, and stigma) or one compound pistil (two or more fused or partially fused carpels, the exact number often equaling the number of ovary lobes, ovary chambers, placentas, styles, or stigmas).</span></span>|g){ }

if ($line =~ s|<<349>>Pistils<<349>>|<span class="term-trigger" tabindex="0">Pistils<span class="term-popup">Female reproductive structure of a flower, composed of an ovule-containing ovary at the base, one or more pollen-receiving stigmas at the tip, and generally one or more styles between ovary and stigma.  A flower may have one or more simple pistils (each a single, free carpel with a single ovary chamber, placenta, and stigma) or one compound pistil (two or more fused or partially fused carpels, the exact number often equaling the number of ovary lobes, ovary chambers, placentas, styles, or stigmas).</span></span>|g){ }

if ($line =~ s| <<349>>pistils<<349>>|&nbsp;<span class="term-trigger" tabindex="0">pistils<span class="term-popup">Female reproductive structure of a flower, composed of an ovule-containing ovary at the base, one or more pollen-receiving stigmas at the tip, and generally one or more styles between ovary and stigma.  A flower may have one or more simple pistils (each a single, free carpel with a single ovary chamber, placenta, and stigma) or one compound pistil (two or more fused or partially fused carpels, the exact number often equaling the number of ovary lobes, ovary chambers, placentas, styles, or stigmas).</span></span>|g){ }

if ($line =~ s|<<350>>Pistillate<<350>>|<span class="term-trigger" tabindex="0">Pistillate<span class="term-popup">Pertaining to flowers, inflorescences, or plants with fertile pistils but sterile or missing stamens.  (e.g., Salix laevigata flower)</span></span>|g){ }

if ($line =~ s| <<350>>pistillate<<350>>|&nbsp;<span class="term-trigger" tabindex="0">pistillate<span class="term-popup">Pertaining to flowers, inflorescences, or plants with fertile pistils but sterile or missing stamens.  (e.g., Salix laevigata flower)</span></span>|g){ }

if ($line =~ s|<<351>>Placenta<<351>>|<span class="term-trigger" tabindex="0">Placenta<span class="term-popup">Structure or area to which ovules are attached in an ovary; variously shaped and positioned.</span></span>|g){ }

if ($line =~ s| <<351>>placenta<<351>>|&nbsp;<span class="term-trigger" tabindex="0">placenta<span class="term-popup">Structure or area to which ovules are attached in an ovary; variously shaped and positioned.</span></span>|g){ }

if ($line =~ s|<<352>>Placentas<<352>>|<span class="term-trigger" tabindex="0">Placentas<span class="term-popup">Structure or area to which ovules are attached in an ovary; variously shaped and positioned.</span></span>|g){ }

if ($line =~ s| <<352>>placentas<<352>>|&nbsp;<span class="term-trigger" tabindex="0">placentas<span class="term-popup"><img src="/eflora/common/images/morph/parietal-placentas.jpg" class="term-img" alt="Morphology: placentas">Structure or area to which ovules are attached in an ovary; variously shaped and positioned.</span></span>|g){ }

if ($line =~ s|<<353>>Planoconvex<<353>>|<span class="term-trigger" tabindex="0">Planoconvex<span class="term-popup">Flat or nearly so on one side, rounded on the other.  (e.g., Carex leporinella perigynium)</span></span>|g){ }

if ($line =~ s| <<353>>planoconvex<<353>>|&nbsp;<span class="term-trigger" tabindex="0">planoconvex<span class="term-popup">Flat or nearly so on one side, rounded on the other.  (e.g., Carex leporinella perigynium)</span></span>|g){ }

if ($line =~ s|<<354>>Pleated<<354>>|<span class="term-trigger" tabindex="0">Pleated<span class="term-popup">Having accordion-like folds.</span></span>|g){ }

if ($line =~ s| <<354>>pleated<<354>>|&nbsp;<span class="term-trigger" tabindex="0">pleated<span class="term-popup">Having accordion-like folds.</span></span>|g){ }

if ($line =~ s|<<355>>Plumose<<355>>|<span class="term-trigger" tabindex="0">Plumose<span class="term-popup">Plume-like, usually with the parts arrayed in three dimensions around an axis, or in tufts held together at the base; usually pertaining to small, finely divided structures, such as certain stigmas and pappus elements.</span></span>|g){ }

if ($line =~ s| <<355>>plumose<<355>>|&nbsp;<span class="term-trigger" tabindex="0">plumose<span class="term-popup"><img src="/eflora/common/images/morph/plumose.jpg" class="term-img" alt="Morphology: plumose">Plume-like, usually with the parts arrayed in three dimensions around an axis, or in tufts held together at the base; usually pertaining to small, finely divided structures, such as certain stigmas and pappus elements.</span></span>|g){ }

if ($line =~ s|<<356>>Pollen<<356>>|<span class="term-trigger" tabindex="0">Pollen<span class="term-popup">In gymnosperms and angiosperms, structure containing the sperm; when sperm fertilizes an egg, the egg and surrounding ovule normally develop into a seed.</span></span>|g){ }

if ($line =~ s| <<356>>pollen<<356>>|&nbsp;<span class="term-trigger" tabindex="0">pollen<span class="term-popup">In gymnosperms and angiosperms, structure containing the sperm; when sperm fertilizes an egg, the egg and surrounding ovule normally develop into a seed.</span></span>|g){ }

if ($line =~ s|<<357>>Pollination<<357>>|<span class="term-trigger" tabindex="0">Pollination<span class="term-popup">Placement of pollen, by an insect, the wind, or other vector, on a stigmatic or ovular surface, through which pollen tube growth and fertilization may occur; self-pollination involves only one plant, cross-pollination occurs between plants.</span></span>|g){ }

if ($line =~ s| <<357>>pollination<<357>>|&nbsp;<span class="term-trigger" tabindex="0">pollination<span class="term-popup">Placement of pollen, by an insect, the wind, or other vector, on a stigmatic or ovular surface, through which pollen tube growth and fertilization may occur; self-pollination involves only one plant, cross-pollination occurs between plants.</span></span>|g){ }

if ($line =~ s|<<358>>Pollinium<<358>>|<span class="term-trigger" tabindex="0">Pollinium<span class="term-popup">Especially in Asclepias and related genera, and in Orchidaceae, a mass of coherent pollen grains disseminated as a unit.</span></span>|g){ }

if ($line =~ s| <<358>>pollinium<<358>>|&nbsp;<span class="term-trigger" tabindex="0">pollinium<span class="term-popup">Especially in Asclepias and related genera, and in Orchidaceae, a mass of coherent pollen grains disseminated as a unit.</span></span>|g){ }

if ($line =~ s|<<359>>Pollinia<<359>>|<span class="term-trigger" tabindex="0">Pollinia<span class="term-popup">Especially in Asclepias and related genera, and in Orchidaceae, a mass of coherent pollen grains disseminated as a unit.</span></span>|g){ }

if ($line =~ s| <<359>>pollinia<<359>>|&nbsp;<span class="term-trigger" tabindex="0">pollinia<span class="term-popup">Especially in Asclepias and related genera, and in Orchidaceae, a mass of coherent pollen grains disseminated as a unit.</span></span>|g){ }

if ($line =~ s|<<360>>Polyploid<<360>>|<span class="term-trigger" tabindex="0">Polyploid<span class="term-popup">Having three or more sets of chromosomes; 3n, 4n, etc.</span></span>|g){ }

if ($line =~ s| <<360>>polyploid<<360>>|&nbsp;<span class="term-trigger" tabindex="0">polyploid<span class="term-popup">Having three or more sets of chromosomes; 3n, 4n, etc.</span></span>|g){ }

if ($line =~ s|<<361>>Pome<<361>>|<span class="term-trigger" tabindex="0">Pome<span class="term-popup">In Rosaceae, a fleshy, indehiscent fruit, such as an apple or pear; derived from a compound, inferior ovary (represented as 2-5 papery-walled, radiating segments alternating with fleshy material) and surrounding hypanthium (represented as outer fleshy material and skin).  (e.g., Amelanchier utahensis fruit)</span></span>|g){ }

if ($line =~ s| <<361>>pome<<361>>|&nbsp;<span class="term-trigger" tabindex="0">pome<span class="term-popup">In Rosaceae, a fleshy, indehiscent fruit, such as an apple or pear; derived from a compound, inferior ovary (represented as 2-5 papery-walled, radiating segments alternating with fleshy material) and surrounding hypanthium (represented as outer fleshy material and skin).  (e.g., Amelanchier utahensis fruit)</span></span>|g){ }

if ($line =~ s|<<362>>Prickle<<362>>|<span class="term-trigger" tabindex="0">Prickle<span class="term-popup">Sharp-pointed, stiff or somewhat flexible projection, originating at the epidermis, derived from epidermal cells and therefore neither subtending an axillary bud or branch nor subtended by a leaf or leaf scar, without leaves, leaf scars, buds, or branches; loosely used for any sharp projection. (e.g., Rosa woodsii stem)</span></span>|g){ }

if ($line =~ s| <<362>>prickle<<362>>|&nbsp;<span class="term-trigger" tabindex="0">prickle<span class="term-popup">Sharp-pointed, stiff or somewhat flexible projection, originating at the epidermis, derived from epidermal cells and therefore neither subtending an axillary bud or branch nor subtended by a leaf or leaf scar, without leaves, leaf scars, buds, or branches; loosely used for any sharp projection. (e.g., Rosa woodsii stem)</span></span>|g){ }

if ($line =~ s|<<363>>Prickles<<363>>|<span class="term-trigger" tabindex="0">Prickles<span class="term-popup">Sharp-pointed, stiff or somewhat flexible projection, originating at the epidermis, derived from epidermal cells and therefore neither subtending an axillary bud or branch nor subtended by a leaf or leaf scar, without leaves, leaf scars, buds, or branches; loosely used for any sharp projection. (e.g., Rosa woodsii stem)</span></span>|g){ }

if ($line =~ s| <<363>>prickles<<363>>|&nbsp;<span class="term-trigger" tabindex="0">prickles<span class="term-popup">Sharp-pointed, stiff or somewhat flexible projection, originating at the epidermis, derived from epidermal cells and therefore neither subtending an axillary bud or branch nor subtended by a leaf or leaf scar, without leaves, leaf scars, buds, or branches; loosely used for any sharp projection. (e.g., Rosa woodsii stem)</span></span>|g){ }

if ($line =~ s|<<364>>Prostrate<<364>>|<span class="term-trigger" tabindex="0">Prostrate<span class="term-popup">Lying flat on the ground.</span></span>|g){ }

if ($line =~ s| <<364>>prostrate<<364>>|&nbsp;<span class="term-trigger" tabindex="0">prostrate<span class="term-popup"><img src="/eflora/common/images/morph/prostrate.jpg" class="term-img" alt="Morphology: prostrate">Lying flat on the ground.</span></span>|g){ }

if ($line =~ s|<<365>>Protandrous<<365>>|<span class="term-trigger" tabindex="0">Protandrous<span class="term-popup">Pertaining to a bisexual flower in which pollen release precedes stigma receptivity, or to a plant with staminate and pistillate flowers in which this is true, with the result that cross-pollination is favored.</span></span>|g){ }

if ($line =~ s| <<365>>protandrous<<365>>|&nbsp;<span class="term-trigger" tabindex="0">protandrous<span class="term-popup">Pertaining to a bisexual flower in which pollen release precedes stigma receptivity, or to a plant with staminate and pistillate flowers in which this is true, with the result that cross-pollination is favored.</span></span>|g){ }

if ($line =~ s|<<366>>Protogynous<<366>>|<span class="term-trigger" tabindex="0">Protogynous<span class="term-popup">Pertaining to a bisexual flower in which stigma receptivity precedes pollen release, or to a plant with staminate and pistillate flowers in which this is true, with the result that cross-pollination is favored.</span></span>|g){ }

if ($line =~ s| <<366>>protogynous<<366>>|&nbsp;<span class="term-trigger" tabindex="0">protogynous<span class="term-popup">Pertaining to a bisexual flower in which stigma receptivity precedes pollen release, or to a plant with staminate and pistillate flowers in which this is true, with the result that cross-pollination is favored.</span></span>|g){ }

if ($line =~ s|<<367>>Proximal<<367>>|<span class="term-trigger" tabindex="0">Proximal<span class="term-popup">Closer to the base, origin, or point of attachment, or farther away from the edge or tip.</span></span>|g){ }

if ($line =~ s| <<367>>proximal<<367>>|&nbsp;<span class="term-trigger" tabindex="0">proximal<span class="term-popup">Closer to the base, origin, or point of attachment, or farther away from the edge or tip.</span></span>|g){ }

if ($line =~ s|<<368>>Proximally<<368>>|<span class="term-trigger" tabindex="0">Proximally<span class="term-popup">Closer to the base, origin, or point of attachment, or farther away from the edge or tip.</span></span>|g){ }

if ($line =~ s| <<368>>proximally<<368>>|&nbsp;<span class="term-trigger" tabindex="0">proximally<span class="term-popup">Closer to the base, origin, or point of attachment, or farther away from the edge or tip.</span></span>|g){ }

if ($line =~ s|<<369>>Puberulent<<369>>|<span class="term-trigger" tabindex="0">Puberulent<span class="term-popup">Minutely hairy.</span></span>|g){ }

if ($line =~ s| <<369>>puberulent<<369>>|&nbsp;<span class="term-trigger" tabindex="0">puberulent<span class="term-popup"><img src="/eflora/common/images/morph/puberulent.jpg" class="term-img" alt="Morphology: puberulent">Minutely hairy.</span></span>|g){ }

if ($line =~ s|<<370>>Raceme<<370>>|<span class="term-trigger" tabindex="0">Raceme<span class="term-popup">In flowering plants excluding Asteraceae, Cyperaceae, Poaceae, and some other groups, an unbranched inflorescence in which the flowers are borne on pedicels and nearly always open from the bottom to the top of the inflorescence. 2. In Asteraceae, Cyperaceae,  Poaceae, and some other groups, a raceme-like inflorescence is one in which the inflorescence units (e.g., heads in Asteraceae; spikelets in Cyperaceae and Poaceae), instead of individual flowers, are stalked and attached directly to the main axis of the inflorescence, not to branches, and in which floral development may or may not proceed as in 1.</span></span>|g){ }

if ($line =~ s| <<370>>raceme<<370>>|&nbsp;<span class="term-trigger" tabindex="0">raceme<span class="term-popup"><img src="/eflora/common/images/morph/raceme.jpg" class="term-img" alt="Morphology: raceme">In flowering plants excluding Asteraceae, Cyperaceae, Poaceae, and some other groups, an unbranched inflorescence in which the flowers are borne on pedicels and nearly always open from the bottom to the top of the inflorescence. 2. In Asteraceae, Cyperaceae,  Poaceae, and some other groups, a raceme-like inflorescence is one in which the inflorescence units (e.g., heads in Asteraceae; spikelets in Cyperaceae and Poaceae), instead of individual flowers, are stalked and attached directly to the main axis of the inflorescence, not to branches, and in which floral development may or may not proceed as in 1.</span></span>|g){ }

if ($line =~ s|<<371>>Racemes<<371>>|<span class="term-trigger" tabindex="0">Racemes<span class="term-popup">In flowering plants excluding Asteraceae, Cyperaceae, Poaceae, and some other groups, an unbranched inflorescence in which the flowers are borne on pedicels and nearly always open from the bottom to the top of the inflorescence. 2. In Asteraceae, Cyperaceae,  Poaceae, and some other groups, a raceme-like inflorescence is one in which the inflorescence units (e.g., heads in Asteraceae; spikelets in Cyperaceae and Poaceae), instead of individual flowers, are stalked and attached directly to the main axis of the inflorescence, not to branches, and in which floral development may or may not proceed as in 1.</span></span>|g){ }

if ($line =~ s| <<371>>racemes<<371>>|&nbsp;<span class="term-trigger" tabindex="0">racemes<span class="term-popup">In flowering plants excluding Asteraceae, Cyperaceae, Poaceae, and some other groups, an unbranched inflorescence in which the flowers are borne on pedicels and nearly always open from the bottom to the top of the inflorescence. 2. In Asteraceae, Cyperaceae,  Poaceae, and some other groups, a raceme-like inflorescence is one in which the inflorescence units (e.g., heads in Asteraceae; spikelets in Cyperaceae and Poaceae), instead of individual flowers, are stalked and attached directly to the main axis of the inflorescence, not to branches, and in which floral development may or may not proceed as in 1.</span></span>|g){ }

if ($line =~ s|<<372>>Rachis<<372>>|<span class="term-trigger" tabindex="0">Rachis<span class="term-popup">In ferns, primary axis of a compound or dissected frond blade.</span></span>|g){ }

if ($line =~ s| <<372>>rachis<<372>>|&nbsp;<span class="term-trigger" tabindex="0">rachis<span class="term-popup"><img src="/eflora/common/images/morph/fern-leaf-rachis.jpg" class="term-img" alt="Morphology: rachis">In ferns, primary axis of a compound or dissected frond blade.</span></span>|g){ }

if ($line =~ s|<<373>>Rachides<<373>>|<span class="term-trigger" tabindex="0">Rachides<span class="term-popup">In ferns, primary axis of a compound or dissected frond blade.</span></span>|g){ }

if ($line =~ s| <<373>>rachides<<373>>|&nbsp;<span class="term-trigger" tabindex="0">rachides<span class="term-popup">In ferns, primary axis of a compound or dissected frond blade.</span></span>|g){ }

if ($line =~ s|<<374>>Radial<<374>>|<span class="term-trigger" tabindex="0">Radial<span class="term-popup">Divisible into mirror-image halves in three or more ways.</span></span>|g){ }

if ($line =~ s| <<374>>radial<<374>>|&nbsp;<span class="term-trigger" tabindex="0">radial<span class="term-popup"><img src="/eflora/common/images/morph/radial.jpg" class="term-img" alt="Morphology: radial">Divisible into mirror-image halves in three or more ways.</span></span>|g){ }

if ($line =~ s|<<375>>Radiant<<375>>|<span class="term-trigger" tabindex="0">Radiant<span class="term-popup">In Asteraceae, a discoid head with a peripheral ring of flowers having much enlarged, often bilateral corollas.</span></span>|g){ }

if ($line =~ s| <<375>>radiant<<375>>|&nbsp;<span class="term-trigger" tabindex="0">radiant<span class="term-popup">In Asteraceae, a discoid head with a peripheral ring of flowers having much enlarged, often bilateral corollas.</span></span>|g){ }

if ($line =~ s|<<376>>Radiate<<376>>|<span class="term-trigger" tabindex="0">Radiate<span class="term-popup">In Asteraceae, a head composed of central disk flowers and marginal ray flowers.</span></span>|g){ }

if ($line =~ s| <<376>>radiate<<376>>|&nbsp;<span class="term-trigger" tabindex="0">radiate<span class="term-popup">In Asteraceae, a head composed of central disk flowers and marginal ray flowers.</span></span>|g){ }

if ($line =~ s|<<377>>Rank<<377>>|<span class="term-trigger" tabindex="0">Rank<span class="term-popup">1. A row or column of parts along an axis - e.g., leaves on an erect stem arranged in four vertical rows are 4-ranked.  2. In classification, a taxonomic level - e.g., family, genus, species, subspecies, variety.</span></span>|g){ }

if ($line =~ s| <<377>>rank<<377>>|&nbsp;<span class="term-trigger" tabindex="0">rank<span class="term-popup">1. A row or column of parts along an axis - e.g., leaves on an erect stem arranged in four vertical rows are 4-ranked.  2. In classification, a taxonomic level - e.g., family, genus, species, subspecies, variety.</span></span>|g){ }

if ($line =~ s|<<378>>Ranks<<378>>|<span class="term-trigger" tabindex="0">Ranks<span class="term-popup">1. A row or column of parts along an axis - e.g., leaves on an erect stem arranged in four vertical rows are 4-ranked.  2. In classification, a taxonomic level - e.g., family, genus, species, subspecies, variety.</span></span>|g){ }

if ($line =~ s| <<378>>ranks<<378>>|&nbsp;<span class="term-trigger" tabindex="0">ranks<span class="term-popup">1. A row or column of parts along an axis - e.g., leaves on an erect stem arranged in four vertical rows are 4-ranked.  2. In classification, a taxonomic level - e.g., family, genus, species, subspecies, variety.</span></span>|g){ }

if ($line =~ s|<<379>>Ranked<<379>>|<span class="term-trigger" tabindex="0">Ranked<span class="term-popup">1. A row or column of parts along an axis - e.g., leaves on an erect stem arranged in four vertical rows are 4-ranked.  2. In classification, a taxonomic level - e.g., family, genus, species, subspecies, variety.</span></span>|g){ }

if ($line =~ s| <<379>>ranked<<379>>|&nbsp;<span class="term-trigger" tabindex="0">ranked<span class="term-popup">1. A row or column of parts along an axis - e.g., leaves on an erect stem arranged in four vertical rows are 4-ranked.  2. In classification, a taxonomic level - e.g., family, genus, species, subspecies, variety.</span></span>|g){ }

if ($line =~ s|<<380>>Rare<<380>>|<span class="term-trigger" tabindex="0">Rare<span class="term-popup">Extremely unlikely to be present in appropriate habitats, often restricted to a small number of sites.</span></span>|g){ }

if ($line =~ s| <<380>>rare<<380>>|&nbsp;<span class="term-trigger" tabindex="0">rare<span class="term-popup">Extremely unlikely to be present in appropriate habitats, often restricted to a small number of sites.</span></span>|g){ }

if ($line =~ s|<<381>>Rays<<381>>|<span class="term-trigger" tabindex="0">Rays<span class="term-popup">Each of a number of radiating axes, as a primary branch in a compound umbel.</span></span>|g){ }

if ($line =~ s| <<381>>rays<<381>>|&nbsp;<span class="term-trigger" tabindex="0">rays<span class="term-popup">Each of a number of radiating axes, as a primary branch in a compound umbel.</span></span>|g){ }

if ($line =~ s|<<382>>Rayed<<382>>|<span class="term-trigger" tabindex="0">Rayed<span class="term-popup">Having a number of radiating axes, as in the branches of a compound umbel.</span></span>|g){ }

if ($line =~ s| <<382>>rayed<<382>>|&nbsp;<span class="term-trigger" tabindex="0">rayed<span class="term-popup">Having a number of radiating axes, as in the branches of a compound umbel.</span></span>|g){ }

if ($line =~ s|<<383>>Ray flower<<383>>|<span class="term-trigger" tabindex="0">Ray flower<span class="term-popup">In Asteraceae, a generally pistillate or sterile, bilateral flower with a flat, strap- or fan-shaped, often 3-lobed outer portion of the corolla (lamina); appearing in a ring around a central cluster of disk flowers.</span></span>|g){ }

if ($line =~ s| <<383>>ray flower<<383>>|&nbsp;<span class="term-trigger" tabindex="0">ray flower<span class="term-popup">In Asteraceae, a generally pistillate or sterile, bilateral flower with a flat, strap- or fan-shaped, often 3-lobed outer portion of the corolla (lamina); appearing in a ring around a central cluster of disk flowers.</span></span>|g){ }

if ($line =~ s|<<384>>Receptacle<<384>>|<span class="term-trigger" tabindex="0">Receptacle<span class="term-popup">1. In individual flowers, the structure to which flower parts are attached.  2. In heads or head-like inflorescences, especially in Asteraceae, the structure to which flowers or sometimes heads are attached.</span></span>|g){ }

if ($line =~ s| <<384>>receptacle<<384>>|&nbsp;<span class="term-trigger" tabindex="0">receptacle<span class="term-popup">1. In individual flowers, the structure to which flower parts are attached.  2. In heads or head-like inflorescences, especially in Asteraceae, the structure to which flowers or sometimes heads are attached.</span></span>|g){ }

if ($line =~ s|<<385>>Receptacles<<385>>|<span class="term-trigger" tabindex="0">Receptacles<span class="term-popup">1. In individual flowers, the structure to which flower parts are attached.  2. In heads or head-like inflorescences, especially in Asteraceae, the structure to which flowers or sometimes heads are attached.</span></span>|g){ }

if ($line =~ s| <<385>>receptacles<<385>>|&nbsp;<span class="term-trigger" tabindex="0">receptacles<span class="term-popup">1. In individual flowers, the structure to which flower parts are attached.  2. In heads or head-like inflorescences, especially in Asteraceae, the structure to which flowers or sometimes heads are attached.</span></span>|g){ }

if ($line =~ s|<<386>>Recurved<<386>>|<span class="term-trigger" tabindex="0">Recurved<span class="term-popup">Gradually curved downward or backward.</span></span>|g){ }

if ($line =~ s| <<386>>recurved<<386>>|&nbsp;<span class="term-trigger" tabindex="0">recurved<span class="term-popup"><img src="/eflora/common/images/morph/recurved.jpg" class="term-img" alt="Morphology: recurved">Gradually curved downward or backward.</span></span>|g){ }

if ($line =~ s|<<387>>Reduced<<387>>|<span class="term-trigger" tabindex="0">Reduced<span class="term-popup">Smaller, less lobed, simpler, etc.</span></span>|g){ }

if ($line =~ s| <<387>>reduced<<387>>|&nbsp;<span class="term-trigger" tabindex="0">reduced<span class="term-popup">Smaller, less lobed, simpler, etc.</span></span>|g){ }

if ($line =~ s|<<388>>Reflexed<<388>>|<span class="term-trigger" tabindex="0">Reflexed<span class="term-popup">Abruptly bent or curved downward or backward.</span></span>|g){ }

if ($line =~ s| <<388>>reflexed<<388>>|&nbsp;<span class="term-trigger" tabindex="0">reflexed<span class="term-popup"><img src="/eflora/common/images/morph/reflexed.jpg" class="term-img" alt="Morphology: reflexed">Abruptly bent or curved downward or backward.</span></span>|g){ }

if ($line =~ s|<<389>>Reniform<<389>>|<span class="term-trigger" tabindex="0">Reniform<span class="term-popup">Kidney-shaped; often pertaining to a leaf in which the blade base on both sides of the petiole is rounded and concave.</span></span>|g){ }

if ($line =~ s| <<389>>reniform<<389>>|&nbsp;<span class="term-trigger" tabindex="0">reniform<span class="term-popup"><img src="/eflora/common/images/morph/reniform.jpg" class="term-img" alt="Morphology: reniform">Kidney-shaped; often pertaining to a leaf in which the blade base on both sides of the petiole is rounded and concave.</span></span>|g){ }

if ($line =~ s|<<390>>Rhizome<<390>>|<span class="term-trigger" tabindex="0">Rhizome<span class="term-popup">1. In seed plants, stem that is often elongate, more or less horizontal, usually underground; distinguished from roots by bearing of leaves, leaf scars, axillary buds, etc. 2. In ferns, stem that is located underground, embedded in leaf litter, on rocks or in rock crevices, or on trees or tree branches, often scaly or hairy; distinguished from roots by bearing of fronds (roots rarely bear fronds), and their greater diameter.</span></span>|g){ }

if ($line =~ s| <<390>>rhizome<<390>>|&nbsp;<span class="term-trigger" tabindex="0">rhizome<span class="term-popup"><img src="/eflora/common/images/morph/rhizome.jpg" class="term-img" alt="Morphology: rhizome">1. In seed plants, stem that is often elongate, more or less horizontal, usually underground; distinguished from roots by bearing of leaves, leaf scars, axillary buds, etc. 2. In ferns, stem that is located underground, embedded in leaf litter, on rocks or in rock crevices, or on trees or tree branches, often scaly or hairy; distinguished from roots by bearing of fronds (roots rarely bear fronds), and their greater diameter.</span></span>|g){ }

if ($line =~ s|<<391>>Rhizomes<<391>>|<span class="term-trigger" tabindex="0">Rhizomes<span class="term-popup">1. In seed plants, stem that is often elongate, more or less horizontal, usually underground; distinguished from roots by bearing of leaves, leaf scars, axillary buds, etc. 2. In ferns, stem that is located underground, embedded in leaf litter, on rocks or in rock crevices, or on trees or tree branches, often scaly or hairy; distinguished from roots by bearing of fronds (roots rarely bear fronds), and their greater diameter.</span></span>|g){ }

if ($line =~ s| <<391>>rhizomes<<391>>|&nbsp;<span class="term-trigger" tabindex="0">rhizomes<span class="term-popup">1. In seed plants, stem that is often elongate, more or less horizontal, usually underground; distinguished from roots by bearing of leaves, leaf scars, axillary buds, etc. 2. In ferns, stem that is located underground, embedded in leaf litter, on rocks or in rock crevices, or on trees or tree branches, often scaly or hairy; distinguished from roots by bearing of fronds (roots rarely bear fronds), and their greater diameter.</span></span>|g){ }

if ($line =~ s|<<392>>Rib<<392>>|<span class="term-trigger" tabindex="0">Rib<span class="term-popup">1. Ridge, as on a fruit.  2. Raised vein, as on a leaf or perianth part.  (e.g., Carex hendersonii perigynium)</span></span>|g){ }

if ($line =~ s| <<392>>rib<<392>>|&nbsp;<span class="term-trigger" tabindex="0">rib<span class="term-popup">1. Ridge, as on a fruit.  2. Raised vein, as on a leaf or perianth part.  (e.g., Carex hendersonii perigynium)</span></span>|g){ }

if ($line =~ s|<<393>>Ribs<<393>>|<span class="term-trigger" tabindex="0">Ribs<span class="term-popup">1. Ridge, as on a fruit.  2. Raised vein, as on a leaf or perianth part.  (e.g., Carex hendersonii perigynium)</span></span>|g){ }

if ($line =~ s| <<393>>ribs<<393>>|&nbsp;<span class="term-trigger" tabindex="0">ribs<span class="term-popup">1. Ridge, as on a fruit.  2. Raised vein, as on a leaf or perianth part.  (e.g., Carex hendersonii perigynium)</span></span>|g){ }

if ($line =~ s|<<394>>Ribbed<<394>>|<span class="term-trigger" tabindex="0">Ribbed<span class="term-popup">1. Having ridges, as on a fruit.  2. Having raised veins, as on a leaf or perianth part.  (e.g., Carex hendersonii perigynium)</span></span>|g){ }

if ($line =~ s| <<394>>ribbed<<394>>|&nbsp;<span class="term-trigger" tabindex="0">ribbed<span class="term-popup">1. Having ridges, as on a fruit.  2. Having raised veins, as on a leaf or perianth part.  (e.g., Carex hendersonii perigynium)</span></span>|g){ }

if ($line =~ s|<<395>>Riparian<<395>>|<span class="term-trigger" tabindex="0">Riparian<span class="term-popup">Pertaining to communities that occupy the banks, channels, and flood plains of waterways.</span></span>|g){ }

if ($line =~ s| <<395>>riparian<<395>>|&nbsp;<span class="term-trigger" tabindex="0">riparian<span class="term-popup">Pertaining to communities that occupy the banks, channels, and flood plains of waterways.</span></span>|g){ }

if ($line =~ s|<<396>>Root<<396>>|<span class="term-trigger" tabindex="0">Root<span class="term-popup">Generally underground axis or axes of a plant; distinguished from stems by not bearing leaves, leaf scars, axillary buds,  flowers, etc.; generally growing into the ground from the base of a stem, its functions include anchorage, absorption of water and nutrients, and food storage.</span></span>|g){ }

if ($line =~ s| <<396>>root<<396>>|&nbsp;<span class="term-trigger" tabindex="0">root<span class="term-popup">Generally underground axis or axes of a plant; distinguished from stems by not bearing leaves, leaf scars, axillary buds,  flowers, etc.; generally growing into the ground from the base of a stem, its functions include anchorage, absorption of water and nutrients, and food storage.</span></span>|g){ }

if ($line =~ s|<<397>>Roots<<397>>|<span class="term-trigger" tabindex="0">Roots<span class="term-popup">Generally underground axis or axes of a plant; distinguished from stems by not bearing leaves, leaf scars, axillary buds,  flowers, etc.; generally growing into the ground from the base of a stem, its functions include anchorage, absorption of water and nutrients, and food storage.</span></span>|g){ }

if ($line =~ s| <<397>>roots<<397>>|&nbsp;<span class="term-trigger" tabindex="0">roots<span class="term-popup">Generally underground axis or axes of a plant; distinguished from stems by not bearing leaves, leaf scars, axillary buds,  flowers, etc.; generally growing into the ground from the base of a stem, its functions include anchorage, absorption of water and nutrients, and food storage.</span></span>|g){ }

if ($line =~ s|<<398>>Rosette<<398>>|<span class="term-trigger" tabindex="0">Rosette<span class="term-popup">A radiating cluster of leaves generally at or near ground level.</span></span>|g){ }

if ($line =~ s| <<398>>rosette<<398>>|&nbsp;<span class="term-trigger" tabindex="0">rosette<span class="term-popup"><img src="/eflora/common/images/morph/basal-rosette.jpg" class="term-img" alt="Morphology: rosette">A radiating cluster of leaves generally at or near ground level.</span></span>|g){ }

if ($line =~ s|<<399>>Rosettes<<399>>|<span class="term-trigger" tabindex="0">Rosettes<span class="term-popup">A radiating cluster of leaves generally at or near ground level.</span></span>|g){ }

if ($line =~ s| <<399>>rosettes<<399>>|&nbsp;<span class="term-trigger" tabindex="0">rosettes<span class="term-popup"><img src="/eflora/common/images/morph/basal-rosette.jpg" class="term-img" alt="Morphology: rosettes">A radiating cluster of leaves generally at or near ground level.</span></span>|g){ }

if ($line =~ s|<<400>>Rotate<<400>>|<span class="term-trigger" tabindex="0">Rotate<span class="term-popup">Wheel-shaped, spreading, or saucer-shaped; often applied to  a fused corolla with a short or nonexistent tube and a spreading limb.</span></span>|g){ }

if ($line =~ s| <<400>>rotate<<400>>|&nbsp;<span class="term-trigger" tabindex="0">rotate<span class="term-popup"><img src="/eflora/common/images/morph/rotate.jpg" class="term-img" alt="Morphology: rotate">Wheel-shaped, spreading, or saucer-shaped; often applied to  a fused corolla with a short or nonexistent tube and a spreading limb.</span></span>|g){ }

if ($line =~ s|<<401>>Ruderal<<401>>|<span class="term-trigger" tabindex="0">Ruderal<span class="term-popup">A plant, usually alien, occurring in waste areas, along roadsides, and in other places disturbed by humans; pertaining to such a plant.</span></span>|g){ }

if ($line =~ s| <<401>>ruderal<<401>>|&nbsp;<span class="term-trigger" tabindex="0">ruderal<span class="term-popup">A plant, usually alien, occurring in waste areas, along roadsides, and in other places disturbed by humans; pertaining to such a plant.</span></span>|g){ }

if ($line =~ s|<<402>>Sagittate<<402>>|<span class="term-trigger" tabindex="0">Sagittate<span class="term-popup">Arrowhead-shaped, with two basal lobes oriented nearly parallel to the long axis.</span></span>|g){ }

if ($line =~ s| <<402>>sagittate<<402>>|&nbsp;<span class="term-trigger" tabindex="0">sagittate<span class="term-popup"><img src="/eflora/common/images/morph/sagittate.jpg" class="term-img" alt="Morphology: sagittate">Arrowhead-shaped, with two basal lobes oriented nearly parallel to the long axis.</span></span>|g){ }

if ($line =~ s|<<403>>Salverform<<403>>|<span class="term-trigger" tabindex="0">Salverform<span class="term-popup">Having a slender tube and an abruptly spreading, flat limb; often applied to a fused corolla.</span></span>|g){ }

if ($line =~ s| <<403>>salverform<<403>>|&nbsp;<span class="term-trigger" tabindex="0">salverform<span class="term-popup"><img src="/eflora/common/images/morph/salverform.jpg" class="term-img" alt="Morphology: salverform">Having a slender tube and an abruptly spreading, flat limb; often applied to a fused corolla.</span></span>|g){ }

if ($line =~ s|<<404>>Savanna<<404>>|<span class="term-trigger" tabindex="0">Savanna<span class="term-popup">Vegetation dominated by various species of grasses with scattered individual trees; with less canopy cover than a woodland (canopies do not touch).</span></span>|g){ }

if ($line =~ s| <<404>>savanna<<404>>|&nbsp;<span class="term-trigger" tabindex="0">savanna<span class="term-popup">Vegetation dominated by various species of grasses with scattered individual trees; with less canopy cover than a woodland (canopies do not touch).</span></span>|g){ }

if ($line =~ s|<<405>>Scabrous<<405>>|<span class="term-trigger" tabindex="0">Scabrous<span class="term-popup">Rough to the touch, generally owing to short stiff hairs.  (e.g., Brickellia pappus)</span></span>|g){ }

if ($line =~ s| <<405>>scabrous<<405>>|&nbsp;<span class="term-trigger" tabindex="0">scabrous<span class="term-popup">Rough to the touch, generally owing to short stiff hairs.  (e.g., Brickellia pappus)</span></span>|g){ }

if ($line =~ s|<<406>>Scale<<406>>|<span class="term-trigger" tabindex="0">Scale<span class="term-popup">1. Wide, appressed, membranous, epidermal outgrowth (e.g., Cheilanthes covillei) 2. Structure partially or entirely covering an over-wintering bud (bud scale) (e.g., Salix goodingii bud).  3. In gymnosperms, a woody, seed-bearing structure attached to the cone axis (cone scale) (e.g., Abies magnifica).  4. In Asteraceae, a flat, membranous pappus element (e.g., Hymenoxys hoopesii).  Leaves or bracts may be scale-like in one or more of the preceding ways.</span></span>|g){ }

if ($line =~ s| <<406>>scale<<406>>|&nbsp;<span class="term-trigger" tabindex="0">scale<span class="term-popup"><img src="/eflora/common/images/morph/scale-like.jpg" class="term-img" alt="Morphology: scale">1. Wide, appressed, membranous, epidermal outgrowth (e.g., Cheilanthes covillei) 2. Structure partially or entirely covering an over-wintering bud (bud scale) (e.g., Salix goodingii bud).  3. In gymnosperms, a woody, seed-bearing structure attached to the cone axis (cone scale) (e.g., Abies magnifica).  4. In Asteraceae, a flat, membranous pappus element (e.g., Hymenoxys hoopesii).  Leaves or bracts may be scale-like in one or more of the preceding ways.</span></span>|g){ }

if ($line =~ s|<<407>>Scales<<407>>|<span class="term-trigger" tabindex="0">Scales<span class="term-popup">1. Wide, appressed, membranous, epidermal outgrowth (e.g., Cheilanthes covillei) 2. Structure partially or entirely covering an over-wintering bud (bud scale) (e.g., Salix goodingii bud).  3. In gymnosperms, a woody, seed-bearing structure attached to the cone axis (cone scale) (e.g., Abies magnifica).  4. In Asteraceae, a flat, membranous pappus element (e.g., Hymenoxys hoopesii).  Leaves or bracts may be scale-like in one or more of the preceding ways.</span></span>|g){ }

if ($line =~ s| <<407>>scales<<407>>|&nbsp;<span class="term-trigger" tabindex="0">scales<span class="term-popup">1. Wide, appressed, membranous, epidermal outgrowth (e.g., Cheilanthes covillei) 2. Structure partially or entirely covering an over-wintering bud (bud scale) (e.g., Salix goodingii bud).  3. In gymnosperms, a woody, seed-bearing structure attached to the cone axis (cone scale) (e.g., Abies magnifica).  4. In Asteraceae, a flat, membranous pappus element (e.g., Hymenoxys hoopesii).  Leaves or bracts may be scale-like in one or more of the preceding ways.</span></span>|g){ }

if ($line =~ s|<<408>>Scapose<<408>>|<span class="term-trigger" tabindex="0">Scapose<span class="term-popup">Pertaining to a plant or an inflorescence in which a relatively long peduncle (scape) arises, sometimes with leaf- or scale-like bracts but without true foliage leaves,  from a rosette or other arrangement of leaves at ground level.</span></span>|g){ }

if ($line =~ s| <<408>>scapose<<408>>|&nbsp;<span class="term-trigger" tabindex="0">scapose<span class="term-popup"><img src="/eflora/common/images/morph/scapose.jpg" class="term-img" alt="Morphology: scapose">Pertaining to a plant or an inflorescence in which a relatively long peduncle (scape) arises, sometimes with leaf- or scale-like bracts but without true foliage leaves,  from a rosette or other arrangement of leaves at ground level.</span></span>|g){ }

if ($line =~ s|<<409>>Scar<<409>>|<span class="term-trigger" tabindex="0">Scar<span class="term-popup">Mark left by the natural separation of two structures, as a leaf scar on a stem.</span></span>|g){ }

if ($line =~ s| <<409>>scar<<409>>|&nbsp;<span class="term-trigger" tabindex="0">scar<span class="term-popup"><img src="/eflora/common/images/morph/leaf-scar.jpg" class="term-img" alt="Morphology: scar">Mark left by the natural separation of two structures, as a leaf scar on a stem.</span></span>|g){ }

if ($line =~ s|<<410>>Scars<<410>>|<span class="term-trigger" tabindex="0">Scars<span class="term-popup">Mark left by the natural separation of two structures, as a leaf scar on a stem.</span></span>|g){ }

if ($line =~ s| <<410>>scars<<410>>|&nbsp;<span class="term-trigger" tabindex="0">scars<span class="term-popup"><img src="/eflora/common/images/morph/buds-and-scars.jpg" class="term-img" alt="Morphology: scars">Mark left by the natural separation of two structures, as a leaf scar on a stem.</span></span>|g){ }

if ($line =~ s|<<411>>Scarious<<411>>|<span class="term-trigger" tabindex="0">Scarious<span class="term-popup">Thin, dry, pliable, translucent or variously colored but not green.  (e.g., Carex incurviformis pistillate flower bract)</span></span>|g){ }

if ($line =~ s| <<411>>scarious<<411>>|&nbsp;<span class="term-trigger" tabindex="0">scarious<span class="term-popup">Thin, dry, pliable, translucent or variously colored but not green.  (e.g., Carex incurviformis pistillate flower bract)</span></span>|g){ }

if ($line =~ s|<<412>>Scree<<412>>|<span class="term-trigger" tabindex="0">Scree<span class="term-popup">Relatively unstable, sloping accumulation of small rock fragments, often at a cliff base.</span></span>|g){ }

if ($line =~ s| <<412>>scree<<412>>|&nbsp;<span class="term-trigger" tabindex="0">scree<span class="term-popup">Relatively unstable, sloping accumulation of small rock fragments, often at a cliff base.</span></span>|g){ }

if ($line =~ s|<<413>>Scrub<<413>>|<span class="term-trigger" tabindex="0">Scrub<span class="term-popup">Vegetation dominated by shrubs; may be classified by habitat type or by dominant species; shrubland.</span></span>|g){ }

if ($line =~ s| <<413>>scrub<<413>>|&nbsp;<span class="term-trigger" tabindex="0">scrub<span class="term-popup">Vegetation dominated by shrubs; may be classified by habitat type or by dominant species; shrubland.</span></span>|g){ }

if ($line =~ s|<<414>>Sculpture<<414>>|<span class="term-trigger" tabindex="0">Sculpture<span class="term-popup">Surface ornamentation or topography, often visible only when magnified, as on a seed or pollen grain.  (e.g., Plagiobothrys nothofulvus nutlet)</span></span>|g){ }

if ($line =~ s| <<414>>sculpture<<414>>|&nbsp;<span class="term-trigger" tabindex="0">sculpture<span class="term-popup">Surface ornamentation or topography, often visible only when magnified, as on a seed or pollen grain.  (e.g., Plagiobothrys nothofulvus nutlet)</span></span>|g){ }

if ($line =~ s|<<415>>Seed<<415>>|<span class="term-trigger" tabindex="0">Seed<span class="term-popup">Any fertilized ovule, but in descriptions pertaining to the fully mature condition (i.e., at full cone or fruit maturation), unless noted otherwise.</span></span>|g){ }

if ($line =~ s| <<415>>seed<<415>>|&nbsp;<span class="term-trigger" tabindex="0">seed<span class="term-popup">Any fertilized ovule, but in descriptions pertaining to the fully mature condition (i.e., at full cone or fruit maturation), unless noted otherwise.</span></span>|g){ }

if ($line =~ s|<<416>>Seeds<<416>>|<span class="term-trigger" tabindex="0">Seeds<span class="term-popup">Any fertilized ovule, but in descriptions pertaining to the fully mature condition (i.e., at full cone or fruit maturation), unless noted otherwise.</span></span>|g){ }

if ($line =~ s| <<416>>seeds<<416>>|&nbsp;<span class="term-trigger" tabindex="0">seeds<span class="term-popup">Any fertilized ovule, but in descriptions pertaining to the fully mature condition (i.e., at full cone or fruit maturation), unless noted otherwise.</span></span>|g){ }

if ($line =~ s|<<417>>Segment<<417>>|<span class="term-trigger" tabindex="0">Segment<span class="term-popup">1.  An ultimate or smallest division of a compound leaf (then the segment is also a leaflet) or dissected leaf  - not a marginal lobe, tooth, bristle, etc.  2.  A part into which an organ is naturally or apparently divisible, such as of a calyx, corolla, fruit, etc.  3.  A specified length, such as of a stem, root, style, etc.</span></span>|g){ }

if ($line =~ s| <<417>>segment<<417>>|&nbsp;<span class="term-trigger" tabindex="0">segment<span class="term-popup">1.  An ultimate or smallest division of a compound leaf (then the segment is also a leaflet) or dissected leaf  - not a marginal lobe, tooth, bristle, etc.  2.  A part into which an organ is naturally or apparently divisible, such as of a calyx, corolla, fruit, etc.  3.  A specified length, such as of a stem, root, style, etc.</span></span>|g){ }

if ($line =~ s|<<418>>Segments<<418>>|<span class="term-trigger" tabindex="0">Segments<span class="term-popup">1.  An ultimate or smallest division of a compound leaf (then the segment is also a leaflet) or dissected leaf  - not a marginal lobe, tooth, bristle, etc.  2.  A part into which an organ is naturally or apparently divisible, such as of a calyx, corolla, fruit, etc.  3.  A specified length, such as of a stem, root, style, etc.</span></span>|g){ }

if ($line =~ s| <<418>>segments<<418>>|&nbsp;<span class="term-trigger" tabindex="0">segments<span class="term-popup">1.  An ultimate or smallest division of a compound leaf (then the segment is also a leaflet) or dissected leaf  - not a marginal lobe, tooth, bristle, etc.  2.  A part into which an organ is naturally or apparently divisible, such as of a calyx, corolla, fruit, etc.  3.  A specified length, such as of a stem, root, style, etc.</span></span>|g){ }

if ($line =~ s|<<419>>Sepal<<419>>|<span class="term-trigger" tabindex="0">Sepal<span class="term-popup">Individual member of the calyx, whether fused or not; if fused, often equal in number to the number of calyx lobes; generally green.</span></span>|g){ }

if ($line =~ s| <<419>>sepal<<419>>|&nbsp;<span class="term-trigger" tabindex="0">sepal<span class="term-popup">Individual member of the calyx, whether fused or not; if fused, often equal in number to the number of calyx lobes; generally green.</span></span>|g){ }

if ($line =~ s|<<420>>Sepals<<420>>|<span class="term-trigger" tabindex="0">Sepals<span class="term-popup">Individual member of the calyx, whether fused or not; if fused, often equal in number to the number of calyx lobes; generally green.</span></span>|g){ }

if ($line =~ s| <<420>>sepals<<420>>|&nbsp;<span class="term-trigger" tabindex="0">sepals<span class="term-popup">Individual member of the calyx, whether fused or not; if fused, often equal in number to the number of calyx lobes; generally green.</span></span>|g){ }

if ($line =~ s|<<421>>Septicidal<<421>>|<span class="term-trigger" tabindex="0">Septicidal<span class="term-popup">Pertaining to dehiscence of a fruit (capsule) by a longitudinal line through the wall at or near the center of each septum, such that each resulting segment corresponds to a single chamber, with placentas placed variously.</span></span>|g){ }

if ($line =~ s| <<421>>septicidal<<421>>|&nbsp;<span class="term-trigger" tabindex="0">septicidal<span class="term-popup"><img src="/eflora/common/images/morph/septicidal.jpg" class="term-img" alt="Morphology: septicidal">Pertaining to dehiscence of a fruit (capsule) by a longitudinal line through the wall at or near the center of each septum, such that each resulting segment corresponds to a single chamber, with placentas placed variously.</span></span>|g){ }

if ($line =~ s|<<422>>Septum<<422>>|<span class="term-trigger" tabindex="0">Septum<span class="term-popup">Wall between chambers in a compound ovary.</span></span>|g){ }

if ($line =~ s| <<422>>septum<<422>>|&nbsp;<span class="term-trigger" tabindex="0">septum<span class="term-popup">Wall between chambers in a compound ovary.</span></span>|g){ }

if ($line =~ s|<<423>>Septa<<423>>|<span class="term-trigger" tabindex="0">Septa<span class="term-popup">Wall between chambers in a compound ovary.</span></span>|g){ }

if ($line =~ s| <<423>>septa<<423>>|&nbsp;<span class="term-trigger" tabindex="0">septa<span class="term-popup">Wall between chambers in a compound ovary.</span></span>|g){ }

if ($line =~ s|<<424>>Series<<424>>|<span class="term-trigger" tabindex="0">Series<span class="term-popup">A group of structures of one kind (e.g., involucral bracts, sepals, petals, stamens) of similar size or shape, usually more or less in a row or whorl.</span></span>|g){ }

if ($line =~ s| <<424>>series<<424>>|&nbsp;<span class="term-trigger" tabindex="0">series<span class="term-popup">A group of structures of one kind (e.g., involucral bracts, sepals, petals, stamens) of similar size or shape, usually more or less in a row or whorl.</span></span>|g){ }

if ($line =~ s|<<425>>Serpentine<<425>>|<span class="term-trigger" tabindex="0">Serpentine<span class="term-popup">Pertaining to rocks, or soils derived from them, with generally low levels of calcium and other nutrients, and high levels of magnesium, iron, and certain toxic metals; many plant taxa are restricted to or excluded from serpentine.</span></span>|g){ }

if ($line =~ s| <<425>>serpentine<<425>>|&nbsp;<span class="term-trigger" tabindex="0">serpentine<span class="term-popup">Pertaining to rocks, or soils derived from them, with generally low levels of calcium and other nutrients, and high levels of magnesium, iron, and certain toxic metals; many plant taxa are restricted to or excluded from serpentine.</span></span>|g){ }

if ($line =~ s|<<426>>Serpentinitic<<426>>|<span class="term-trigger" tabindex="0">Serpentinitic<span class="term-popup">Pertaining to rocks, or soils derived from them, with generally low levels of calcium and other nutrients, and high levels of magnesium, iron, and certain toxic metals; many plant taxa are restricted to or excluded from serpentine.</span></span>|g){ }

if ($line =~ s| <<426>>serpentinitic<<426>>|&nbsp;<span class="term-trigger" tabindex="0">serpentinitic<span class="term-popup">Pertaining to rocks, or soils derived from them, with generally low levels of calcium and other nutrients, and high levels of magnesium, iron, and certain toxic metals; many plant taxa are restricted to or excluded from serpentine.</span></span>|g){ }

if ($line =~ s|<<427>>Serrate<<427>>|<span class="term-trigger" tabindex="0">Serrate<span class="term-popup">Having margins with sharp, fine to coarse teeth generally pointing tipward, not outward; margins with such teeth on such primary teeth are doubly serrate.</span></span>|g){ }

if ($line =~ s| <<427>>serrate<<427>>|&nbsp;<span class="term-trigger" tabindex="0">serrate<span class="term-popup"><img src="/eflora/common/images/morph/serrate.jpg" class="term-img" alt="Morphology: serrate">Having margins with sharp, fine to coarse teeth generally pointing tipward, not outward; margins with such teeth on such primary teeth are doubly serrate.</span></span>|g){ }

if ($line =~ s|<<428>>Sessile<<428>>|<span class="term-trigger" tabindex="0">Sessile<span class="term-popup">Without a petiole, peduncle, pedicel, or other kind of stalk.</span></span>|g){ }

if ($line =~ s| <<428>>sessile<<428>>|&nbsp;<span class="term-trigger" tabindex="0">sessile<span class="term-popup"><img src="/eflora/common/images/morph/sessile.jpg" class="term-img" alt="Morphology: sessile">Without a petiole, peduncle, pedicel, or other kind of stalk.</span></span>|g){ }

if ($line =~ s|<<429>>Sheath<<429>>|<span class="term-trigger" tabindex="0">Sheath<span class="term-popup">A surrounding or partially surrounding, often tubular structure or part of a structure, such as a leaf base in Apiaceae or Poaceae.</span></span>|g){ }

if ($line =~ s| <<429>>sheath<<429>>|&nbsp;<span class="term-trigger" tabindex="0">sheath<span class="term-popup"><img src="/eflora/common/images/morph/grass-leaf-sheath.jpg" class="term-img" alt="Morphology: sheath">A surrounding or partially surrounding, often tubular structure or part of a structure, such as a leaf base in Apiaceae or Poaceae.</span></span>|g){ }

if ($line =~ s|<<430>>Sheaths<<430>>|<span class="term-trigger" tabindex="0">Sheaths<span class="term-popup">A surrounding or partially surrounding, often tubular structure or part of a structure, such as a leaf base in Apiaceae or Poaceae.</span></span>|g){ }

if ($line =~ s| <<430>>sheaths<<430>>|&nbsp;<span class="term-trigger" tabindex="0">sheaths<span class="term-popup">A surrounding or partially surrounding, often tubular structure or part of a structure, such as a leaf base in Apiaceae or Poaceae.</span></span>|g){ }

if ($line =~ s|<<431>>Shoot<<431>>|<span class="term-trigger" tabindex="0">Shoot<span class="term-popup">Pertaining collectively to a young stem or twig and its appendages (e.g., new growth in the spring), or to all above-ground parts of a plant (i.e., shoot system).</span></span>|g){ }

if ($line =~ s| <<431>>shoot<<431>>|&nbsp;<span class="term-trigger" tabindex="0">shoot<span class="term-popup">Pertaining collectively to a young stem or twig and its appendages (e.g., new growth in the spring), or to all above-ground parts of a plant (i.e., shoot system).</span></span>|g){ }

if ($line =~ s|<<432>>Shoots<<432>>|<span class="term-trigger" tabindex="0">Shoots<span class="term-popup">Pertaining collectively to a young stem or twig and its appendages (e.g., new growth in the spring), or to all above-ground parts of a plant (i.e., shoot system).</span></span>|g){ }

if ($line =~ s| <<432>>shoots<<432>>|&nbsp;<span class="term-trigger" tabindex="0">shoots<span class="term-popup">Pertaining collectively to a young stem or twig and its appendages (e.g., new growth in the spring), or to all above-ground parts of a plant (i.e., shoot system).</span></span>|g){ }

if ($line =~ s|<<433>>Shrub<<433>>|<span class="term-trigger" tabindex="0">Shrub<span class="term-popup">A woody plant of relatively short maximum height,  with generally many branches from the base.</span></span>|g){ }

if ($line =~ s| <<433>>shrub<<433>>|&nbsp;<span class="term-trigger" tabindex="0">shrub<span class="term-popup">A woody plant of relatively short maximum height,  with generally many branches from the base.</span></span>|g){ }

if ($line =~ s|<<434>>Shrubs<<434>>|<span class="term-trigger" tabindex="0">Shrubs<span class="term-popup">A woody plant of relatively short maximum height,  with generally many branches from the base.</span></span>|g){ }

if ($line =~ s| <<434>>shrubs<<434>>|&nbsp;<span class="term-trigger" tabindex="0">shrubs<span class="term-popup">A woody plant of relatively short maximum height,  with generally many branches from the base.</span></span>|g){ }

if ($line =~ s|<<435>>Simple<<435>>|<span class="term-trigger" tabindex="0">Simple<span class="term-popup">Composed of a single part; undivided; unbranched.</span></span>|g){ }

if ($line =~ s| <<435>>simple<<435>>|&nbsp;<span class="term-trigger" tabindex="0">simple<span class="term-popup"><img src="/eflora/common/images/morph/simple-leaf.jpg" class="term-img" alt="Morphology: simple">Composed of a single part; undivided; unbranched.</span></span>|g){ }

if ($line =~ s|<<436>>Sinus<<436>>|<span class="term-trigger" tabindex="0">Sinus<span class="term-popup">Usually pertaining to margins of leaves, sepals, petals, or other parts, an indentation between adjacent lobes or teeth</span></span>|g){ }

if ($line =~ s| <<436>>sinus<<436>>|&nbsp;<span class="term-trigger" tabindex="0">sinus<span class="term-popup"><img src="/eflora/common/images/morph/sinus.jpg" class="term-img" alt="Morphology: sinus">Usually pertaining to margins of leaves, sepals, petals, or other parts, an indentation between adjacent lobes or teeth</span></span>|g){ }

if ($line =~ s|<<437>>Sorus<<437>>|<span class="term-trigger" tabindex="0">Sorus<span class="term-popup">In many ferns, a distinct cluster of sporangia.</span></span>|g){ }

if ($line =~ s| <<437>>sorus<<437>>|&nbsp;<span class="term-trigger" tabindex="0">sorus<span class="term-popup"><img src="/eflora/common/images/morph/sorus.jpg" class="term-img" alt="Morphology: sorus">In many ferns, a distinct cluster of sporangia.</span></span>|g){ }

if ($line =~ s|<<438>>Sori<<438>>|<span class="term-trigger" tabindex="0">Sori<span class="term-popup">In many ferns, a distinct cluster of sporangia.</span></span>|g){ }

if ($line =~ s| <<438>>sori<<438>>|&nbsp;<span class="term-trigger" tabindex="0">sori<span class="term-popup">In many ferns, a distinct cluster of sporangia.</span></span>|g){ }

if ($line =~ s|<<439>>Spheric<<439>>|<span class="term-trigger" tabindex="0">Spheric<span class="term-popup">Globe- or ball-shaped; circular in three dimensions.</span></span>|g){ }

if ($line =~ s| <<439>>spheric<<439>>|&nbsp;<span class="term-trigger" tabindex="0">spheric<span class="term-popup">Globe- or ball-shaped; circular in three dimensions.</span></span>|g){ }

if ($line =~ s|<<440>>Spike<<440>>|<span class="term-trigger" tabindex="0">Spike<span class="term-popup">1. In flowering plants excluding Asteraceae, Cyperaceae, Poaceae, and some other groups, an unbranched inflorescence in which the flowers are sessile and nearly always open from the bottom to the top of the inflorescence. 2. In Asteraceae, Cyperaceae,  Poaceae, and some other groups, a spike-like inflorescence is one in which the inflorescence units (e.g., heads in Asteraceae; spikelets in Cyperaceae and Poaceae), instead of individual flowers, are sessile and attached directly to the main axis of the inflorescence, not to branches, and in which floral development may or may not proceed as in 1.</span></span>|g){ }

if ($line =~ s| <<440>>spike<<440>>|&nbsp;<span class="term-trigger" tabindex="0">spike<span class="term-popup"><img src="/eflora/common/images/morph/spike.jpg" class="term-img" alt="Morphology: spike">1. In flowering plants excluding Asteraceae, Cyperaceae, Poaceae, and some other groups, an unbranched inflorescence in which the flowers are sessile and nearly always open from the bottom to the top of the inflorescence. 2. In Asteraceae, Cyperaceae,  Poaceae, and some other groups, a spike-like inflorescence is one in which the inflorescence units (e.g., heads in Asteraceae; spikelets in Cyperaceae and Poaceae), instead of individual flowers, are sessile and attached directly to the main axis of the inflorescence, not to branches, and in which floral development may or may not proceed as in 1.</span></span>|g){ }

if ($line =~ s|<<441>>Spikes<<441>>|<span class="term-trigger" tabindex="0">Spikes<span class="term-popup">1. In flowering plants excluding Asteraceae, Cyperaceae, Poaceae, and some other groups, an unbranched inflorescence in which the flowers are sessile and nearly always open from the bottom to the top of the inflorescence. 2. In Asteraceae, Cyperaceae,  Poaceae, and some other groups, a spike-like inflorescence is one in which the inflorescence units (e.g., heads in Asteraceae; spikelets in Cyperaceae and Poaceae), instead of individual flowers, are sessile and attached directly to the main axis of the inflorescence, not to branches, and in which floral development may or may not proceed as in 1.</span></span>|g){ }

if ($line =~ s| <<441>>spikes<<441>>|&nbsp;<span class="term-trigger" tabindex="0">spikes<span class="term-popup">1. In flowering plants excluding Asteraceae, Cyperaceae, Poaceae, and some other groups, an unbranched inflorescence in which the flowers are sessile and nearly always open from the bottom to the top of the inflorescence. 2. In Asteraceae, Cyperaceae,  Poaceae, and some other groups, a spike-like inflorescence is one in which the inflorescence units (e.g., heads in Asteraceae; spikelets in Cyperaceae and Poaceae), instead of individual flowers, are sessile and attached directly to the main axis of the inflorescence, not to branches, and in which floral development may or may not proceed as in 1.</span></span>|g){ }

if ($line =~ s|<<442>>Spikelet<<442>>|<span class="term-trigger" tabindex="0">Spikelet<span class="term-popup">1. In Poaceae, one or more florets (each a flower with subtending lemma and generally palea) and generally 2 subtending glumes; in a sterile spikelet, the flower(s) and sometimes palea(s) are rudimentary or absent. 2. In Cyperaceae, the smallest aggregation of flowers (generally more than 2) and associated bracts.</span></span>|g){ }

if ($line =~ s| <<442>>spikelet<<442>>|&nbsp;<span class="term-trigger" tabindex="0">spikelet<span class="term-popup"><img src="/eflora/common/images/morph/grass-spikelet.jpg" class="term-img" alt="Morphology: spikelet">1. In Poaceae, one or more florets (each a flower with subtending lemma and generally palea) and generally 2 subtending glumes; in a sterile spikelet, the flower(s) and sometimes palea(s) are rudimentary or absent. 2. In Cyperaceae, the smallest aggregation of flowers (generally more than 2) and associated bracts.</span></span>|g){ }

if ($line =~ s|<<443>>Spikelets<<443>>|<span class="term-trigger" tabindex="0">Spikelets<span class="term-popup">1. In Poaceae, one or more florets (each a flower with subtending lemma and generally palea) and generally 2 subtending glumes; in a sterile spikelet, the flower(s) and sometimes palea(s) are rudimentary or absent. 2. In Cyperaceae, the smallest aggregation of flowers (generally more than 2) and associated bracts.</span></span>|g){ }

if ($line =~ s| <<443>>spikelets<<443>>|&nbsp;<span class="term-trigger" tabindex="0">spikelets<span class="term-popup"><img src="/eflora/common/images/morph/grass-spikelet.jpg" class="term-img" alt="Morphology: spikelets">1. In Poaceae, one or more florets (each a flower with subtending lemma and generally palea) and generally 2 subtending glumes; in a sterile spikelet, the flower(s) and sometimes palea(s) are rudimentary or absent. 2. In Cyperaceae, the smallest aggregation of flowers (generally more than 2) and associated bracts.</span></span>|g){ }

if ($line =~ s|<<444>>Spine<<444>>|<span class="term-trigger" tabindex="0">Spine<span class="term-popup">Sharp-pointed, usually stiff projection, originating below the epidermis, derived from a leaf or leaf part (e.g., stipule, vein tip), and therefore often subtending an axillary bud or branch, without buds of its own; loosely used for any sharp projection. (e.g., Cirsium arvense leaf)</span></span>|g){ }

if ($line =~ s| <<444>>spine<<444>>|&nbsp;<span class="term-trigger" tabindex="0">spine<span class="term-popup">Sharp-pointed, usually stiff projection, originating below the epidermis, derived from a leaf or leaf part (e.g., stipule, vein tip), and therefore often subtending an axillary bud or branch, without buds of its own; loosely used for any sharp projection. (e.g., Cirsium arvense leaf)</span></span>|g){ }

if ($line =~ s|<<445>>Spines<<445>>|<span class="term-trigger" tabindex="0">Spines<span class="term-popup">Sharp-pointed, usually stiff projection, originating below the epidermis, derived from a leaf or leaf part (e.g., stipule, vein tip), and therefore often subtending an axillary bud or branch, without buds of its own; loosely used for any sharp projection. (e.g., Cirsium arvense leaf)</span></span>|g){ }

if ($line =~ s| <<445>>spines<<445>>|&nbsp;<span class="term-trigger" tabindex="0">spines<span class="term-popup">Sharp-pointed, usually stiff projection, originating below the epidermis, derived from a leaf or leaf part (e.g., stipule, vein tip), and therefore often subtending an axillary bud or branch, without buds of its own; loosely used for any sharp projection. (e.g., Cirsium arvense leaf)</span></span>|g){ }

if ($line =~ s|<<446>>Sporangium<<446>>|<span class="term-trigger" tabindex="0">Sporangium<span class="term-popup">In non-seed plants, a case or sac in which spores are produced, and from which they are released.</span></span>|g){ }

if ($line =~ s| <<446>>sporangium<<446>>|&nbsp;<span class="term-trigger" tabindex="0">sporangium<span class="term-popup"><img src="/eflora/common/images/morph/sporangium.jpg" class="term-img" alt="Morphology: sporangium">In non-seed plants, a case or sac in which spores are produced, and from which they are released.</span></span>|g){ }

if ($line =~ s|<<447>>Sporangia<<447>>|<span class="term-trigger" tabindex="0">Sporangia<span class="term-popup">In non-seed plants, a case or sac in which spores are produced, and from which they are released.</span></span>|g){ }

if ($line =~ s| <<447>>sporangia<<447>>|&nbsp;<span class="term-trigger" tabindex="0">sporangia<span class="term-popup">In non-seed plants, a case or sac in which spores are produced, and from which they are released.</span></span>|g){ }

if ($line =~ s|<<448>>Spore<<448>>|<span class="term-trigger" tabindex="0">Spore<span class="term-popup">In non-seed plants, one of very many minute, haploid cells (in mass, often appearing dust-like) dispersed from sporangia on a diploid parent plant (sporophyte), normally developing into a small haploid plant (gametophyte) that produces eggs, sperm, or both, the fusion of which results in new diploid offspring.</span></span>|g){ }

if ($line =~ s| <<448>>spore<<448>>|&nbsp;<span class="term-trigger" tabindex="0">spore<span class="term-popup">In non-seed plants, one of very many minute, haploid cells (in mass, often appearing dust-like) dispersed from sporangia on a diploid parent plant (sporophyte), normally developing into a small haploid plant (gametophyte) that produces eggs, sperm, or both, the fusion of which results in new diploid offspring.</span></span>|g){ }

if ($line =~ s|<<449>>Spores<<449>>|<span class="term-trigger" tabindex="0">Spores<span class="term-popup">In non-seed plants, one of very many minute, haploid cells (in mass, often appearing dust-like) dispersed from sporangia on a diploid parent plant (sporophyte), normally developing into a small haploid plant (gametophyte) that produces eggs, sperm, or both, the fusion of which results in new diploid offspring.</span></span>|g){ }

if ($line =~ s| <<449>>spores<<449>>|&nbsp;<span class="term-trigger" tabindex="0">spores<span class="term-popup">In non-seed plants, one of very many minute, haploid cells (in mass, often appearing dust-like) dispersed from sporangia on a diploid parent plant (sporophyte), normally developing into a small haploid plant (gametophyte) that produces eggs, sperm, or both, the fusion of which results in new diploid offspring.</span></span>|g){ }

if ($line =~ s|<<450>>Spreading<<450>>|<span class="term-trigger" tabindex="0">Spreading<span class="term-popup">Oriented more or less perpendicularly to the axis of attachment; often, more or less horizontal.</span></span>|g){ }

if ($line =~ s| <<450>>spreading<<450>>|&nbsp;<span class="term-trigger" tabindex="0">spreading<span class="term-popup"><img src="/eflora/common/images/morph/spreading.jpg" class="term-img" alt="Morphology: spreading">Oriented more or less perpendicularly to the axis of attachment; often, more or less horizontal.</span></span>|g){ }

if ($line =~ s|<<451>>Spur<<451>>|<span class="term-trigger" tabindex="0">Spur<span class="term-popup">Hollow projection or expansion, generally of a perianth part and containing nectar.  (e.g., petals of Aquilegia formosa)</span></span>|g){ }

if ($line =~ s| <<451>>spur<<451>>|&nbsp;<span class="term-trigger" tabindex="0">spur<span class="term-popup">Hollow projection or expansion, generally of a perianth part and containing nectar.  (e.g., petals of Aquilegia formosa)</span></span>|g){ }

if ($line =~ s|<<452>>Spurs<<452>>|<span class="term-trigger" tabindex="0">Spurs<span class="term-popup">Hollow projection or expansion, generally of a perianth part and containing nectar.  (e.g., petals of Aquilegia formosa)</span></span>|g){ }

if ($line =~ s| <<452>>spurs<<452>>|&nbsp;<span class="term-trigger" tabindex="0">spurs<span class="term-popup">Hollow projection or expansion, generally of a perianth part and containing nectar.  (e.g., petals of Aquilegia formosa)</span></span>|g){ }

if ($line =~ s|<<453>>Stamen<<453>>|<span class="term-trigger" tabindex="0">Stamen<span class="term-popup">Male reproductive structure of a flower, typically composed of a stalk-like filament and a terminal, pollen-producing anther.  Filaments sometimes partly fuse to the corolla, or to other filaments to form a tube.</span></span>|g){ }

if ($line =~ s| <<453>>stamen<<453>>|&nbsp;<span class="term-trigger" tabindex="0">stamen<span class="term-popup">Male reproductive structure of a flower, typically composed of a stalk-like filament and a terminal, pollen-producing anther.  Filaments sometimes partly fuse to the corolla, or to other filaments to form a tube.</span></span>|g){ }

if ($line =~ s|<<454>>Stamens<<454>>|<span class="term-trigger" tabindex="0">Stamens<span class="term-popup">Male reproductive structure of a flower, typically composed of a stalk-like filament and a terminal, pollen-producing anther.  Filaments sometimes partly fuse to the corolla, or to other filaments to form a tube.</span></span>|g){ }

if ($line =~ s| <<454>>stamens<<454>>|&nbsp;<span class="term-trigger" tabindex="0">stamens<span class="term-popup">Male reproductive structure of a flower, typically composed of a stalk-like filament and a terminal, pollen-producing anther.  Filaments sometimes partly fuse to the corolla, or to other filaments to form a tube.</span></span>|g){ }

if ($line =~ s|<<455>>Staminate<<455>>|<span class="term-trigger" tabindex="0">Staminate<span class="term-popup">Pertaining to flowers, inflorescences, or plants with fertile stamens but sterile or missing pistils.  (e.g., Salix laevigata flower)</span></span>|g){ }

if ($line =~ s| <<455>>staminate<<455>>|&nbsp;<span class="term-trigger" tabindex="0">staminate<span class="term-popup">Pertaining to flowers, inflorescences, or plants with fertile stamens but sterile or missing pistils.  (e.g., Salix laevigata flower)</span></span>|g){ }

if ($line =~ s|<<456>>Staminode<<456>>|<span class="term-trigger" tabindex="0">Staminode<span class="term-popup">Sterile stamen, usually modified in appearance, sometimes petal-like or elaborate in structure.  (e.g., Penstemon palmeri)</span></span>|g){ }

if ($line =~ s| <<456>>staminode<<456>>|&nbsp;<span class="term-trigger" tabindex="0">staminode<span class="term-popup">Sterile stamen, usually modified in appearance, sometimes petal-like or elaborate in structure.  (e.g., Penstemon palmeri)</span></span>|g){ }

if ($line =~ s|<<457>>Staminodes<<457>>|<span class="term-trigger" tabindex="0">Staminodes<span class="term-popup">Sterile stamen, usually modified in appearance, sometimes petal-like or elaborate in structure.  (e.g., Penstemon palmeri)</span></span>|g){ }

if ($line =~ s| <<457>>staminodes<<457>>|&nbsp;<span class="term-trigger" tabindex="0">staminodes<span class="term-popup">Sterile stamen, usually modified in appearance, sometimes petal-like or elaborate in structure.  (e.g., Penstemon palmeri)</span></span>|g){ }

if ($line =~ s|<<458>>Stellate<<458>>|<span class="term-trigger" tabindex="0">Stellate<span class="term-popup">Pertaining to a hair or other structure with three or more branches radiating in two or three dimensions from a common point.</span></span>|g){ }

if ($line =~ s| <<458>>stellate<<458>>|&nbsp;<span class="term-trigger" tabindex="0">stellate<span class="term-popup"><img src="/eflora/common/images/morph/stellate.jpg" class="term-img" alt="Morphology: stellate">Pertaining to a hair or other structure with three or more branches radiating in two or three dimensions from a common point.</span></span>|g){ }

if ($line =~ s|<<459>>Stem<<459>>|<span class="term-trigger" tabindex="0">Stem<span class="term-popup">Generally above-ground  but sometimes below-ground axis or axes of a plant; distinguished from roots by bearing leaves, leaf scars, axillary buds, flowers, nodes, etc.</span></span>|g){ }

if ($line =~ s| <<459>>stem<<459>>|&nbsp;<span class="term-trigger" tabindex="0">stem<span class="term-popup">Generally above-ground  but sometimes below-ground axis or axes of a plant; distinguished from roots by bearing leaves, leaf scars, axillary buds, flowers, nodes, etc.</span></span>|g){ }

if ($line =~ s|<<460>>Stems<<460>>|<span class="term-trigger" tabindex="0">Stems<span class="term-popup">Generally above-ground  but sometimes below-ground axis or axes of a plant; distinguished from roots by bearing leaves, leaf scars, axillary buds, flowers, nodes, etc.</span></span>|g){ }

if ($line =~ s| <<460>>stems<<460>>|&nbsp;<span class="term-trigger" tabindex="0">stems<span class="term-popup">Generally above-ground  but sometimes below-ground axis or axes of a plant; distinguished from roots by bearing leaves, leaf scars, axillary buds, flowers, nodes, etc.</span></span>|g){ }

if ($line =~ s|<<461>>Sterile<<461>>|<span class="term-trigger" tabindex="0">Sterile<span class="term-popup">Not reproductively functional; pertaining to a plant or plant part that does not produce or is not associated with the production of functional spores, pollen, ovules, or seeds (e.g., sterile frond, sterile stamen, sterile flower, sterile floret).</span></span>|g){ }

if ($line =~ s| <<461>>sterile<<461>>|&nbsp;<span class="term-trigger" tabindex="0">sterile<span class="term-popup">Not reproductively functional; pertaining to a plant or plant part that does not produce or is not associated with the production of functional spores, pollen, ovules, or seeds (e.g., sterile frond, sterile stamen, sterile flower, sterile floret).</span></span>|g){ }

if ($line =~ s|<<462>>Stigma<<462>>|<span class="term-trigger" tabindex="0">Stigma<span class="term-popup">The part of a pistil on which pollen germinates, generally terminal and elevated above the ovary on a style, usually sticky or hairy, sometimes lobed.</span></span>|g){ }

if ($line =~ s| <<462>>stigma<<462>>|&nbsp;<span class="term-trigger" tabindex="0">stigma<span class="term-popup">The part of a pistil on which pollen germinates, generally terminal and elevated above the ovary on a style, usually sticky or hairy, sometimes lobed.</span></span>|g){ }

if ($line =~ s|<<463>>Stigmas<<463>>|<span class="term-trigger" tabindex="0">Stigmas<span class="term-popup">The part of a pistil on which pollen germinates, generally terminal and elevated above the ovary on a style, usually sticky or hairy, sometimes lobed.</span></span>|g){ }

if ($line =~ s| <<463>>stigmas<<463>>|&nbsp;<span class="term-trigger" tabindex="0">stigmas<span class="term-popup">The part of a pistil on which pollen germinates, generally terminal and elevated above the ovary on a style, usually sticky or hairy, sometimes lobed.</span></span>|g){ }

if ($line =~ s|<<464>>Stigmata<<464>>|<span class="term-trigger" tabindex="0">Stigmata<span class="term-popup">The part of a pistil on which pollen germinates, generally terminal and elevated above the ovary on a style, usually sticky or hairy, sometimes lobed.</span></span>|g){ }

if ($line =~ s| <<464>>stigmata<<464>>|&nbsp;<span class="term-trigger" tabindex="0">stigmata<span class="term-popup">The part of a pistil on which pollen germinates, generally terminal and elevated above the ovary on a style, usually sticky or hairy, sometimes lobed.</span></span>|g){ }

if ($line =~ s|<<465>>Stipe<<465>>|<span class="term-trigger" tabindex="0">Stipe<span class="term-popup">In ferns, a frond stalk (analogous to a petiole of a leaf), connecting blade to rhizome.</span></span>|g){ }

if ($line =~ s| <<465>>stipe<<465>>|&nbsp;<span class="term-trigger" tabindex="0">stipe<span class="term-popup">In ferns, a frond stalk (analogous to a petiole of a leaf), connecting blade to rhizome.</span></span>|g){ }

if ($line =~ s|<<466>>Stipes<<466>>|<span class="term-trigger" tabindex="0">Stipes<span class="term-popup">In ferns, a frond stalk (analogous to a petiole of a leaf), connecting blade to rhizome.</span></span>|g){ }

if ($line =~ s| <<466>>stipes<<466>>|&nbsp;<span class="term-trigger" tabindex="0">stipes<span class="term-popup">In ferns, a frond stalk (analogous to a petiole of a leaf), connecting blade to rhizome.</span></span>|g){ }

if ($line =~ s|<<467>>Stipule<<467>>|<span class="term-trigger" tabindex="0">Stipule<span class="term-popup">Appendage at base of petiole, generally paired, variable in form but often leaf- or scale-like, sometimes a spine.</span></span>|g){ }

if ($line =~ s| <<467>>stipule<<467>>|&nbsp;<span class="term-trigger" tabindex="0">stipule<span class="term-popup"><img src="/eflora/common/images/morph/stipule.jpg" class="term-img" alt="Morphology: stipule">Appendage at base of petiole, generally paired, variable in form but often leaf- or scale-like, sometimes a spine.</span></span>|g){ }

if ($line =~ s|<<468>>Stipules<<468>>|<span class="term-trigger" tabindex="0">Stipules<span class="term-popup">Appendage at base of petiole, generally paired, variable in form but often leaf- or scale-like, sometimes a spine.</span></span>|g){ }

if ($line =~ s| <<468>>stipules<<468>>|&nbsp;<span class="term-trigger" tabindex="0">stipules<span class="term-popup">Appendage at base of petiole, generally paired, variable in form but often leaf- or scale-like, sometimes a spine.</span></span>|g){ }

if ($line =~ s|<<469>>Stolon<<469>>|<span class="term-trigger" tabindex="0">Stolon<span class="term-popup">A normally thin, elongate stem lying more or less flat on the ground and forming roots as well as erect stems or shoots (which become new, clonal plants) at generally widely spaced nodes; runner.</span></span>|g){ }

if ($line =~ s| <<469>>stolon<<469>>|&nbsp;<span class="term-trigger" tabindex="0">stolon<span class="term-popup"><img src="/eflora/common/images/morph/stolon.jpg" class="term-img" alt="Morphology: stolon">A normally thin, elongate stem lying more or less flat on the ground and forming roots as well as erect stems or shoots (which become new, clonal plants) at generally widely spaced nodes; runner.</span></span>|g){ }

if ($line =~ s|<<470>>Stolons<<470>>|<span class="term-trigger" tabindex="0">Stolons<span class="term-popup">A normally thin, elongate stem lying more or less flat on the ground and forming roots as well as erect stems or shoots (which become new, clonal plants) at generally widely spaced nodes; runner.</span></span>|g){ }

if ($line =~ s| <<470>>stolons<<470>>|&nbsp;<span class="term-trigger" tabindex="0">stolons<span class="term-popup">A normally thin, elongate stem lying more or less flat on the ground and forming roots as well as erect stems or shoots (which become new, clonal plants) at generally widely spaced nodes; runner.</span></span>|g){ }

if ($line =~ s|<<471>>Stoma<<471>>|<span class="term-trigger" tabindex="0">Stoma<span class="term-popup">A minute pore on a leaf  (less often, stem or other structure)  through which gases pass into or out of a plant (generally, carbon dioxide in, oxygen and water vapor out); generally closed during times of water stress; sometimes used in identification.</span></span>|g){ }

if ($line =~ s| <<471>>stoma<<471>>|&nbsp;<span class="term-trigger" tabindex="0">stoma<span class="term-popup">A minute pore on a leaf  (less often, stem or other structure)  through which gases pass into or out of a plant (generally, carbon dioxide in, oxygen and water vapor out); generally closed during times of water stress; sometimes used in identification.</span></span>|g){ }

if ($line =~ s|<<472>>Stomata<<472>>|<span class="term-trigger" tabindex="0">Stomata<span class="term-popup">A minute pore on a leaf  (less often, stem or other structure)  through which gases pass into or out of a plant (generally, carbon dioxide in, oxygen and water vapor out); generally closed during times of water stress; sometimes used in identification.</span></span>|g){ }

if ($line =~ s| <<472>>stomata<<472>>|&nbsp;<span class="term-trigger" tabindex="0">stomata<span class="term-popup">A minute pore on a leaf  (less often, stem or other structure)  through which gases pass into or out of a plant (generally, carbon dioxide in, oxygen and water vapor out); generally closed during times of water stress; sometimes used in identification.</span></span>|g){ }

if ($line =~ s|<<473>>Stomate<<473>>|<span class="term-trigger" tabindex="0">Stomate<span class="term-popup">A minute pore on a leaf  (less often, stem or other structure)  through which gases pass into or out of a plant (generally, carbon dioxide in, oxygen and water vapor out); generally closed during times of water stress; sometimes used in identification.</span></span>|g){ }

if ($line =~ s| <<473>>stomate<<473>>|&nbsp;<span class="term-trigger" tabindex="0">stomate<span class="term-popup">A minute pore on a leaf  (less often, stem or other structure)  through which gases pass into or out of a plant (generally, carbon dioxide in, oxygen and water vapor out); generally closed during times of water stress; sometimes used in identification.</span></span>|g){ }

if ($line =~ s|<<474>>Stoma<<474>>|<span class="term-trigger" tabindex="0">Stoma<span class="term-popup">A minute pore on a leaf  (less often, stem or other structure)  through which gases pass into or out of a plant (generally, carbon dioxide in, oxygen and water vapor out); generally closed during times of water stress; sometimes used in identification.</span></span>|g){ }

if ($line =~ s| <<474>>stoma<<474>>|&nbsp;<span class="term-trigger" tabindex="0">stoma<span class="term-popup">A minute pore on a leaf  (less often, stem or other structure)  through which gases pass into or out of a plant (generally, carbon dioxide in, oxygen and water vapor out); generally closed during times of water stress; sometimes used in identification.</span></span>|g){ }

if ($line =~ s|<<475>>Stone<<475>>|<span class="term-trigger" tabindex="0">Stone<span class="term-popup">In a drupe, the very hard inner ovary wall and the generally single seed it surrounds; occurring one or more per flower, free or variously fused.  (e.g., Prunus emarginata fruit)</span></span>|g){ }

if ($line =~ s| <<475>>stone<<475>>|&nbsp;<span class="term-trigger" tabindex="0">stone<span class="term-popup">In a drupe, the very hard inner ovary wall and the generally single seed it surrounds; occurring one or more per flower, free or variously fused.  (e.g., Prunus emarginata fruit)</span></span>|g){ }

if ($line =~ s|<<476>>Stones<<476>>|<span class="term-trigger" tabindex="0">Stones<span class="term-popup">In a drupe, the very hard inner ovary wall and the generally single seed it surrounds; occurring one or more per flower, free or variously fused.  (e.g., Prunus emarginata fruit)</span></span>|g){ }

if ($line =~ s| <<476>>stones<<476>>|&nbsp;<span class="term-trigger" tabindex="0">stones<span class="term-popup">In a drupe, the very hard inner ovary wall and the generally single seed it surrounds; occurring one or more per flower, free or variously fused.  (e.g., Prunus emarginata fruit)</span></span>|g){ }

if ($line =~ s|<<477>>Stout<<477>>|<span class="term-trigger" tabindex="0">Stout<span class="term-popup">Thick, sturdy, not slender.</span></span>|g){ }

if ($line =~ s| <<477>>stout<<477>>|&nbsp;<span class="term-trigger" tabindex="0">stout<span class="term-popup">Thick, sturdy, not slender.</span></span>|g){ }

if ($line =~ s|<<478>>Striate<<478>>|<span class="term-trigger" tabindex="0">Striate<span class="term-popup">With fine, longitudinal channels, lines, or ridges.</span></span>|g){ }

if ($line =~ s| <<478>>striate<<478>>|&nbsp;<span class="term-trigger" tabindex="0">striate<span class="term-popup">With fine, longitudinal channels, lines, or ridges.</span></span>|g){ }

if ($line =~ s|<<479>>Strigose<<479>>|<span class="term-trigger" tabindex="0">Strigose<span class="term-popup">With stiff, straight, sharp, appressed hairs.</span></span>|g){ }

if ($line =~ s| <<479>>strigose<<479>>|&nbsp;<span class="term-trigger" tabindex="0">strigose<span class="term-popup"><img src="/eflora/common/images/morph/strigose.jpg" class="term-img" alt="Morphology: strigose">With stiff, straight, sharp, appressed hairs.</span></span>|g){ }

if ($line =~ s|<<480>>Style<<480>>|<span class="term-trigger" tabindex="0">Style<span class="term-popup">In many but not all pistils, the stalk-like part that connects ovary to stigma.</span></span>|g){ }

if ($line =~ s| <<480>>style<<480>>|&nbsp;<span class="term-trigger" tabindex="0">style<span class="term-popup">In many but not all pistils, the stalk-like part that connects ovary to stigma.</span></span>|g){ }

if ($line =~ s|<<481>>Styles<<481>>|<span class="term-trigger" tabindex="0">Styles<span class="term-popup">In many but not all pistils, the stalk-like part that connects ovary to stigma.</span></span>|g){ }

if ($line =~ s| <<481>>styles<<481>>|&nbsp;<span class="term-trigger" tabindex="0">styles<span class="term-popup">In many but not all pistils, the stalk-like part that connects ovary to stigma.</span></span>|g){ }

if ($line =~ s|<<482>>Subalpine<<482>>|<span class="term-trigger" tabindex="0">Subalpine<span class="term-popup">Pertaining to the vegetational--altitudinal zone just below timberline, between the montane and the alpine.</span></span>|g){ }

if ($line =~ s| <<482>>subalpine<<482>>|&nbsp;<span class="term-trigger" tabindex="0">subalpine<span class="term-popup">Pertaining to the vegetational--altitudinal zone just below timberline, between the montane and the alpine.</span></span>|g){ }

if ($line =~ s|<<483>>Submersed<<483>>|<span class="term-trigger" tabindex="0">Submersed<span class="term-popup">Pertaining to a plant normally rooted and remaining underwater, or to a part of such a plant normally held underwater.</span></span>|g){ }

if ($line =~ s| <<483>>submersed<<483>>|&nbsp;<span class="term-trigger" tabindex="0">submersed<span class="term-popup">Pertaining to a plant normally rooted and remaining underwater, or to a part of such a plant normally held underwater.</span></span>|g){ }

if ($line =~ s|<<484>>Subshrub<<484>>|<span class="term-trigger" tabindex="0">Subshrub<span class="term-popup">A plant with the lower stems woody, the upper stems and twigs not woody (or less so) and dying back seasonally.</span></span>|g){ }

if ($line =~ s| <<484>>subshrub<<484>>|&nbsp;<span class="term-trigger" tabindex="0">subshrub<span class="term-popup">A plant with the lower stems woody, the upper stems and twigs not woody (or less so) and dying back seasonally.</span></span>|g){ }

if ($line =~ s|<<485>>Subshrubs<<485>>|<span class="term-trigger" tabindex="0">Subshrubs<span class="term-popup">A plant with the lower stems woody, the upper stems and twigs not woody (or less so) and dying back seasonally.</span></span>|g){ }

if ($line =~ s| <<485>>subshrubs<<485>>|&nbsp;<span class="term-trigger" tabindex="0">subshrubs<span class="term-popup">A plant with the lower stems woody, the upper stems and twigs not woody (or less so) and dying back seasonally.</span></span>|g){ }

if ($line =~ s|<<486>>Subtend<<486>>|<span class="term-trigger" tabindex="0">Subtend<span class="term-popup">Occurring immediately below, as sepals subtending petals or leaves subtending axillary buds.</span></span>|g){ }

if ($line =~ s| <<486>>subtend<<486>>|&nbsp;<span class="term-trigger" tabindex="0">subtend<span class="term-popup">Occurring immediately below, as sepals subtending petals or leaves subtending axillary buds.</span></span>|g){ }

if ($line =~ s|<<487>>Subtidal<<487>>|<span class="term-trigger" tabindex="0">Subtidal<span class="term-popup">Pertaining to marine aquatic habitats that are continuously submerged, even at low tide.</span></span>|g){ }

if ($line =~ s| <<487>>subtidal<<487>>|&nbsp;<span class="term-trigger" tabindex="0">subtidal<span class="term-popup">Pertaining to marine aquatic habitats that are continuously submerged, even at low tide.</span></span>|g){ }

if ($line =~ s|<<488>>Superior<<488>>|<span class="term-trigger" tabindex="0">Superior<span class="term-popup">An ovary that is free from the perianth and stamens, or free from the fused lower portions of these structures (i.e., free from the hypanthium), to the extent that these structures appear to arise at its base, and it appears to arise from the top of the receptacle</span></span>|g){ }

if ($line =~ s| <<488>>superior<<488>>|&nbsp;<span class="term-trigger" tabindex="0">superior<span class="term-popup">An ovary that is free from the perianth and stamens, or free from the fused lower portions of these structures (i.e., free from the hypanthium), to the extent that these structures appear to arise at its base, and it appears to arise from the top of the receptacle</span></span>|g){ }

if ($line =~ s|<<489>>Suture<<489>>|<span class="term-trigger" tabindex="0">Suture<span class="term-popup">Groove or line of dehiscence or fusion.</span></span>|g){ }

if ($line =~ s| <<489>>suture<<489>>|&nbsp;<span class="term-trigger" tabindex="0">suture<span class="term-popup">Groove or line of dehiscence or fusion.</span></span>|g){ }

if ($line =~ s|<<490>>Sutures<<490>>|<span class="term-trigger" tabindex="0">Sutures<span class="term-popup">Groove or line of dehiscence or fusion.</span></span>|g){ }

if ($line =~ s| <<490>>sutures<<490>>|&nbsp;<span class="term-trigger" tabindex="0">sutures<span class="term-popup">Groove or line of dehiscence or fusion.</span></span>|g){ }

if ($line =~ s|<<491>>Swamp<<491>>|<span class="term-trigger" tabindex="0">Swamp<span class="term-popup">Shrub- or tree-dominated vegetation that occurs in permanently wet soils with standing water.</span></span>|g){ }

if ($line =~ s| <<491>>swamp<<491>>|&nbsp;<span class="term-trigger" tabindex="0">swamp<span class="term-popup">Shrub- or tree-dominated vegetation that occurs in permanently wet soils with standing water.</span></span>|g){ }

if ($line =~ s|<<492>>Swamps<<492>>|<span class="term-trigger" tabindex="0">Swamps<span class="term-popup">Shrub- or tree-dominated vegetation that occurs in permanently wet soils with standing water.</span></span>|g){ }

if ($line =~ s| <<492>>swamps<<492>>|&nbsp;<span class="term-trigger" tabindex="0">swamps<span class="term-popup">Shrub- or tree-dominated vegetation that occurs in permanently wet soils with standing water.</span></span>|g){ }

if ($line =~ s|<<493>>Talus<<493>>|<span class="term-trigger" tabindex="0">Talus<span class="term-popup">Relatively stable, sloping accumulation of large rock fragments, often at a cliff base.</span></span>|g){ }

if ($line =~ s| <<493>>talus<<493>>|&nbsp;<span class="term-trigger" tabindex="0">talus<span class="term-popup">Relatively stable, sloping accumulation of large rock fragments, often at a cliff base.</span></span>|g){ }

if ($line =~ s|<<494>>Tapered<<494>>|<span class="term-trigger" tabindex="0">Tapered<span class="term-popup">Gradually (not abruptly) narrower or smaller at base or tip.</span></span>|g){ }

if ($line =~ s| <<494>>tapered<<494>>|&nbsp;<span class="term-trigger" tabindex="0">tapered<span class="term-popup"><img src="/eflora/common/images/morph/tapered.jpg" class="term-img" alt="Morphology: tapered">Gradually (not abruptly) narrower or smaller at base or tip.</span></span>|g){ }

if ($line =~ s|<<495>>Taproot<<495>>|<span class="term-trigger" tabindex="0">Taproot<span class="term-popup">A primary root that grows more or less straight down into soil, is tapered to the end, and has smaller, lateral branches (e.g., carrot).</span></span>|g){ }

if ($line =~ s| <<495>>taproot<<495>>|&nbsp;<span class="term-trigger" tabindex="0">taproot<span class="term-popup">A primary root that grows more or less straight down into soil, is tapered to the end, and has smaller, lateral branches (e.g., carrot).</span></span>|g){ }

if ($line =~ s|<<496>>Taproots<<496>>|<span class="term-trigger" tabindex="0">Taproots<span class="term-popup">A primary root that grows more or less straight down into soil, is tapered to the end, and has smaller, lateral branches (e.g., carrot).</span></span>|g){ }

if ($line =~ s| <<496>>taproots<<496>>|&nbsp;<span class="term-trigger" tabindex="0">taproots<span class="term-popup">A primary root that grows more or less straight down into soil, is tapered to the end, and has smaller, lateral branches (e.g., carrot).</span></span>|g){ }

if ($line =~ s|<<497>>Taxon<<497>>|<span class="term-trigger" tabindex="0">Taxon<span class="term-popup">In classification, a group of organisms (such as plants) at any rank (e.g., species, genus, family); taxonomy is the science of classifying organisms.</span></span>|g){ }

if ($line =~ s| <<497>>taxon<<497>>|&nbsp;<span class="term-trigger" tabindex="0">taxon<span class="term-popup">In classification, a group of organisms (such as plants) at any rank (e.g., species, genus, family); taxonomy is the science of classifying organisms.</span></span>|g){ }

if ($line =~ s|<<498>>Taxa<<498>>|<span class="term-trigger" tabindex="0">Taxa<span class="term-popup">In classification, a group of organisms (such as plants) at any rank (e.g., species, genus, family); taxonomy is the science of classifying organisms.</span></span>|g){ }

if ($line =~ s| <<498>>taxa<<498>>|&nbsp;<span class="term-trigger" tabindex="0">taxa<span class="term-popup">In classification, a group of organisms (such as plants) at any rank (e.g., species, genus, family); taxonomy is the science of classifying organisms.</span></span>|g){ }

if ($line =~ s|<<499>>Tendril<<499>>|<span class="term-trigger" tabindex="0">Tendril<span class="term-popup">A slender, generally coiling structure (generally stem, stipule, or leaf tip) by which a climbing plant becomes attached to its support.  (e.g., Lathyrus lanszwertii leaf)</span></span>|g){ }

if ($line =~ s| <<499>>tendril<<499>>|&nbsp;<span class="term-trigger" tabindex="0">tendril<span class="term-popup">A slender, generally coiling structure (generally stem, stipule, or leaf tip) by which a climbing plant becomes attached to its support.  (e.g., Lathyrus lanszwertii leaf)</span></span>|g){ }

if ($line =~ s|<<500>>Tendrils<<500>>|<span class="term-trigger" tabindex="0">Tendrils<span class="term-popup">A slender, generally coiling structure (generally stem, stipule, or leaf tip) by which a climbing plant becomes attached to its support.  (e.g., Lathyrus lanszwertii leaf)</span></span>|g){ }

if ($line =~ s| <<500>>tendrils<<500>>|&nbsp;<span class="term-trigger" tabindex="0">tendrils<span class="term-popup">A slender, generally coiling structure (generally stem, stipule, or leaf tip) by which a climbing plant becomes attached to its support.  (e.g., Lathyrus lanszwertii leaf)</span></span>|g){ }

if ($line =~ s|<<501>>Terminal<<501>>|<span class="term-trigger" tabindex="0">Terminal<span class="term-popup">Pertaining to the tip of a structure (e.g., terminal bud).</span></span>|g){ }

if ($line =~ s| <<501>>terminal<<501>>|&nbsp;<span class="term-trigger" tabindex="0">terminal<span class="term-popup">Pertaining to the tip of a structure (e.g., terminal bud).</span></span>|g){ }

if ($line =~ s|<<502>>Ternate<<502>>|<span class="term-trigger" tabindex="0">Ternate<span class="term-popup">Lobed or compound into three parts, once, as a clover leaf (e.g.,  Trifolium wormskioldii), or more than once; in a ternate-pinnate leaf, the leaf is divided into three leaflets, each of which is pinnately compound (e.g., Aralia californica); three structures or parts (e.g., veins, lobes, or leaflets) radiating from a common point.</span></span>|g){ }

if ($line =~ s| <<502>>ternate<<502>>|&nbsp;<span class="term-trigger" tabindex="0">ternate<span class="term-popup">Lobed or compound into three parts, once, as a clover leaf (e.g.,  Trifolium wormskioldii), or more than once; in a ternate-pinnate leaf, the leaf is divided into three leaflets, each of which is pinnately compound (e.g., Aralia californica); three structures or parts (e.g., veins, lobes, or leaflets) radiating from a common point.</span></span>|g){ }

if ($line =~ s|<<503>>Thorn<<503>>|<span class="term-trigger" tabindex="0">Thorn<span class="term-popup">Sharp-pointed, usually stiff projection, originating below the epidermis, derived from a branch and therefore often subtended by a leaf or leaf scar, sometimes with leaf scars and buds of its own; loosely used for any sharp projection. (e.g., Castela emoryi)</span></span>|g){ }

if ($line =~ s| <<503>>thorn<<503>>|&nbsp;<span class="term-trigger" tabindex="0">thorn<span class="term-popup">Sharp-pointed, usually stiff projection, originating below the epidermis, derived from a branch and therefore often subtended by a leaf or leaf scar, sometimes with leaf scars and buds of its own; loosely used for any sharp projection. (e.g., Castela emoryi)</span></span>|g){ }

if ($line =~ s|<<504>>Thorns<<504>>|<span class="term-trigger" tabindex="0">Thorns<span class="term-popup">Sharp-pointed, usually stiff projection, originating below the epidermis, derived from a branch and therefore often subtended by a leaf or leaf scar, sometimes with leaf scars and buds of its own; loosely used for any sharp projection. (e.g., Castela emoryi)</span></span>|g){ }

if ($line =~ s| <<504>>thorns<<504>>|&nbsp;<span class="term-trigger" tabindex="0">thorns<span class="term-popup">Sharp-pointed, usually stiff projection, originating below the epidermis, derived from a branch and therefore often subtended by a leaf or leaf scar, sometimes with leaf scars and buds of its own; loosely used for any sharp projection. (e.g., Castela emoryi)</span></span>|g){ }

if ($line =~ s|<<505>>Throat<<505>>|<span class="term-trigger" tabindex="0">Throat<span class="term-popup">In calyces or corollas with fused sepals or petals, the expanded, fused portion distal to the tube and proximal to the limb.</span></span>|g){ }

if ($line =~ s| <<505>>throat<<505>>|&nbsp;<span class="term-trigger" tabindex="0">throat<span class="term-popup">In calyces or corollas with fused sepals or petals, the expanded, fused portion distal to the tube and proximal to the limb.</span></span>|g){ }

if ($line =~ s|<<506>>Throats<<506>>|<span class="term-trigger" tabindex="0">Throats<span class="term-popup">In calyces or corollas with fused sepals or petals, the expanded, fused portion distal to the tube and proximal to the limb.</span></span>|g){ }

if ($line =~ s| <<506>>throats<<506>>|&nbsp;<span class="term-trigger" tabindex="0">throats<span class="term-popup">In calyces or corollas with fused sepals or petals, the expanded, fused portion distal to the tube and proximal to the limb.</span></span>|g){ }

if ($line =~ s|<<507>>Timberline<<507>>|<span class="term-trigger" tabindex="0">Timberline<span class="term-popup">Region in high mountains where subalpine forests give way to treeless alpine vegetation.</span></span>|g){ }

if ($line =~ s| <<507>>timberline<<507>>|&nbsp;<span class="term-trigger" tabindex="0">timberline<span class="term-popup">Region in high mountains where subalpine forests give way to treeless alpine vegetation.</span></span>|g){ }

if ($line =~ s|<<508>>Tomentose<<508>>|<span class="term-trigger" tabindex="0">Tomentose<span class="term-popup">Covered with densely interwoven, generally matted hairs.</span></span>|g){ }

if ($line =~ s| <<508>>tomentose<<508>>|&nbsp;<span class="term-trigger" tabindex="0">tomentose<span class="term-popup"><img src="/eflora/common/images/morph/tomentose.jpg" class="term-img" alt="Morphology: tomentose">Covered with densely interwoven, generally matted hairs.</span></span>|g){ }

if ($line =~ s|<<509>>Tooth<<509>>|<span class="term-trigger" tabindex="0">Tooth<span class="term-popup">1. A small, pointed projection, such as on the margin of a leaf, sepal, or petal.  2. The free tips of otherwise fused structures, such as sepals or petals (somewhat archaic usage); smaller than lobes.</span></span>|g){ }

if ($line =~ s|<<510>>Teeth<<510>>|<span class="term-trigger" tabindex="0">Teeth<span class="term-popup">1. A small, pointed projection, such as on the margin of a leaf, sepal, or petal.  2. The free tips of otherwise fused structures, such as sepals or petals (somewhat archaic usage); smaller than lobes.</span></span>|g){ }

if ($line =~ s| <<510>>teeth<<510>>|&nbsp;<span class="term-trigger" tabindex="0">teeth<span class="term-popup">1. A small, pointed projection, such as on the margin of a leaf, sepal, or petal.  2. The free tips of otherwise fused structures, such as sepals or petals (somewhat archaic usage); smaller than lobes.</span></span>|g){ }

if ($line =~ s|<<511>>Transverse<<511>>|<span class="term-trigger" tabindex="0">Transverse<span class="term-popup">Pertaining to width or the widthwise dimension; perpendicular to the axis.</span></span>|g){ }

if ($line =~ s| <<511>>transverse<<511>>|&nbsp;<span class="term-trigger" tabindex="0">transverse<span class="term-popup">Pertaining to width or the widthwise dimension; perpendicular to the axis.</span></span>|g){ }

if ($line =~ s|<<512>>Tree<<512>>|<span class="term-trigger" tabindex="0">Tree<span class="term-popup">A woody plant of medium to tall maximum height, with generally one trunk from the base.  (e.g., Carnegiea gigantea)</span></span>|g){ }

if ($line =~ s| <<512>>tree<<512>>|&nbsp;<span class="term-trigger" tabindex="0">tree<span class="term-popup">A woody plant of medium to tall maximum height, with generally one trunk from the base.  (e.g., Carnegiea gigantea)</span></span>|g){ }

if ($line =~ s|<<513>>Trees<<513>>|<span class="term-trigger" tabindex="0">Trees<span class="term-popup">A woody plant of medium to tall maximum height, with generally one trunk from the base.  (e.g., Carnegiea gigantea)</span></span>|g){ }

if ($line =~ s| <<513>>trees<<513>>|&nbsp;<span class="term-trigger" tabindex="0">trees<span class="term-popup">A woody plant of medium to tall maximum height, with generally one trunk from the base.  (e.g., Carnegiea gigantea)</span></span>|g){ }

if ($line =~ s|<<514>>Trilete spore<<514>>|<span class="term-trigger" tabindex="0">Trilete spore<span class="term-popup">In spore-bearing plants, radially symmetric spore on which the scar comprises three radiating branches.</span></span>|g){ }

if ($line =~ s| <<514>>trilete spore<<514>>|&nbsp;<span class="term-trigger" tabindex="0">trilete spore<span class="term-popup">In spore-bearing plants, radially symmetric spore on which the scar comprises three radiating branches.</span></span>|g){ }

if ($line =~ s|<<515>>Truncate<<515>>|<span class="term-trigger" tabindex="0">Truncate<span class="term-popup">Abruptly (not gradually) narrower or smaller at base or tip, as if cut straight across or nearly so.</span></span>|g){ }

if ($line =~ s| <<515>>truncate<<515>>|&nbsp;<span class="term-trigger" tabindex="0">truncate<span class="term-popup"><img src="/eflora/common/images/morph/truncate.jpg" class="term-img" alt="Morphology: truncate">Abruptly (not gradually) narrower or smaller at base or tip, as if cut straight across or nearly so.</span></span>|g){ }

if ($line =~ s|<<516>>Trophophore<<516>>|<span class="term-trigger" tabindex="0">Trophophore<span class="term-popup">The sterile blade of moonworts (Botrychium) and adders-tongues (Ophioglossum) that is photosynthetic and mostly does not bear sporangia.</span></span>|g){ }

if ($line =~ s| <<516>>trophophore<<516>>|&nbsp;<span class="term-trigger" tabindex="0">trophophore<span class="term-popup">The sterile blade of moonworts (Botrychium) and adders-tongues (Ophioglossum) that is photosynthetic and mostly does not bear sporangia.</span></span>|g){ }

if ($line =~ s|<<517>>Tube<<517>>|<span class="term-trigger" tabindex="0">Tube<span class="term-popup">In calyces or corollas with fused sepals or petals, the often more or less cylindric, fused portion at the base, proximal to the throat and limb.</span></span>|g){ }

if ($line =~ s| <<517>>tube<<517>>|&nbsp;<span class="term-trigger" tabindex="0">tube<span class="term-popup">In calyces or corollas with fused sepals or petals, the often more or less cylindric, fused portion at the base, proximal to the throat and limb.</span></span>|g){ }

if ($line =~ s|<<518>>Tubes<<518>>|<span class="term-trigger" tabindex="0">Tubes<span class="term-popup">In calyces or corollas with fused sepals or petals, the often more or less cylindric, fused portion at the base, proximal to the throat and limb.</span></span>|g){ }

if ($line =~ s| <<518>>tubes<<518>>|&nbsp;<span class="term-trigger" tabindex="0">tubes<span class="term-popup">In calyces or corollas with fused sepals or petals, the often more or less cylindric, fused portion at the base, proximal to the throat and limb.</span></span>|g){ }

if ($line =~ s|<<519>>Tuber<<519>>|<span class="term-trigger" tabindex="0">Tuber<span class="term-popup">Short, thickened, fleshy, usually starchy, underground stem for storage (of water, food, or both) and sometimes propagation (e.g., potato).</span></span>|g){ }

if ($line =~ s| <<519>>tuber<<519>>|&nbsp;<span class="term-trigger" tabindex="0">tuber<span class="term-popup">Short, thickened, fleshy, usually starchy, underground stem for storage (of water, food, or both) and sometimes propagation (e.g., potato).</span></span>|g){ }

if ($line =~ s|<<520>>Tubers<<520>>|<span class="term-trigger" tabindex="0">Tubers<span class="term-popup">Short, thickened, fleshy, usually starchy, underground stem for storage (of water, food, or both) and sometimes propagation (e.g., potato).</span></span>|g){ }

if ($line =~ s| <<520>>tubers<<520>>|&nbsp;<span class="term-trigger" tabindex="0">tubers<span class="term-popup">Short, thickened, fleshy, usually starchy, underground stem for storage (of water, food, or both) and sometimes propagation (e.g., potato).</span></span>|g){ }

if ($line =~ s|<<521>>Tubercle<<521>>|<span class="term-trigger" tabindex="0">Tubercle<span class="term-popup">Small, wart-like projection.  (e.g., Cryptantha muricata nutlet)</span></span>|g){ }

if ($line =~ s| <<521>>tubercle<<521>>|&nbsp;<span class="term-trigger" tabindex="0">tubercle<span class="term-popup">Small, wart-like projection.  (e.g., Cryptantha muricata nutlet)</span></span>|g){ }

if ($line =~ s|<<522>>Tubercles<<522>>|<span class="term-trigger" tabindex="0">Tubercles<span class="term-popup">Small, wart-like projection.  (e.g., Cryptantha muricata nutlet)</span></span>|g){ }

if ($line =~ s| <<522>>tubercles<<522>>|&nbsp;<span class="term-trigger" tabindex="0">tubercles<span class="term-popup">Small, wart-like projection.  (e.g., Cryptantha muricata nutlet)</span></span>|g){ }

if ($line =~ s|<<523>>Twig<<523>>|<span class="term-trigger" tabindex="0">Twig<span class="term-popup">In woody plants, a terminal stem segment, produced during the current or most recent growth period.</span></span>|g){ }

if ($line =~ s| <<523>>twig<<523>>|&nbsp;<span class="term-trigger" tabindex="0">twig<span class="term-popup">In woody plants, a terminal stem segment, produced during the current or most recent growth period.</span></span>|g){ }

if ($line =~ s|<<524>>Twigs<<524>>|<span class="term-trigger" tabindex="0">Twigs<span class="term-popup">In woody plants, a terminal stem segment, produced during the current or most recent growth period.</span></span>|g){ }

if ($line =~ s| <<524>>twigs<<524>>|&nbsp;<span class="term-trigger" tabindex="0">twigs<span class="term-popup">In woody plants, a terminal stem segment, produced during the current or most recent growth period.</span></span>|g){ }

if ($line =~ s|<<525>>Twining<<525>>|<span class="term-trigger" tabindex="0">Twining<span class="term-popup">Climbing by the twisting or coiling of stems, tendrils, or other structures.  (e.g., Antirrhinum filipes)</span></span>|g){ }

if ($line =~ s| <<525>>twining<<525>>|&nbsp;<span class="term-trigger" tabindex="0">twining<span class="term-popup">Climbing by the twisting or coiling of stems, tendrils, or other structures.  (e.g., Antirrhinum filipes)</span></span>|g){ }

if ($line =~ s|<<526>>Ultimate<<526>>|<span class="term-trigger" tabindex="0">Ultimate<span class="term-popup">Last, most distal, or smallest, as all the tips of a branching stem or the smallest divisions (segments) of a compound leaf or dissected leaf.</span></span>|g){ }

if ($line =~ s| <<526>>ultimate<<526>>|&nbsp;<span class="term-trigger" tabindex="0">ultimate<span class="term-popup">Last, most distal, or smallest, as all the tips of a branching stem or the smallest divisions (segments) of a compound leaf or dissected leaf.</span></span>|g){ }

if ($line =~ s|<<527>>Umbel<<527>>|<span class="term-trigger" tabindex="0">Umbel<span class="term-popup">1. In flowering plants excluding Asteraceae and some other groups, an inflorescence in which three to many pedicels and, if compound, branches (rays) radiate from a common point; characteristic of but not confined to Apiaceae.  2. In Asteraceae and some other groups, an umbel-like inflorescence is one in which three to many stalked inflorescence units (e.g., heads in Asteraceae, umbels enclosed by involucres in Eriogonum), instead of individual flowers, radiate from a common point of attachment without an evident axis or branches.</span></span>|g){ }

if ($line =~ s| <<527>>umbel<<527>>|&nbsp;<span class="term-trigger" tabindex="0">umbel<span class="term-popup"><img src="/eflora/common/images/morph/umbel.jpg" class="term-img" alt="Morphology: umbel">1. In flowering plants excluding Asteraceae and some other groups, an inflorescence in which three to many pedicels and, if compound, branches (rays) radiate from a common point; characteristic of but not confined to Apiaceae.  2. In Asteraceae and some other groups, an umbel-like inflorescence is one in which three to many stalked inflorescence units (e.g., heads in Asteraceae, umbels enclosed by involucres in Eriogonum), instead of individual flowers, radiate from a common point of attachment without an evident axis or branches.</span></span>|g){ }

if ($line =~ s|<<528>>Umbels<<528>>|<span class="term-trigger" tabindex="0">Umbels<span class="term-popup">1. In flowering plants excluding Asteraceae and some other groups, an inflorescence in which three to many pedicels and, if compound, branches (rays) radiate from a common point; characteristic of but not confined to Apiaceae.  2. In Asteraceae and some other groups, an umbel-like inflorescence is one in which three to many stalked inflorescence units (e.g., heads in Asteraceae, umbels enclosed by involucres in Eriogonum), instead of individual flowers, radiate from a common point of attachment without an evident axis or branches.</span></span>|g){ }

if ($line =~ s| <<528>>umbels<<528>>|&nbsp;<span class="term-trigger" tabindex="0">umbels<span class="term-popup">1. In flowering plants excluding Asteraceae and some other groups, an inflorescence in which three to many pedicels and, if compound, branches (rays) radiate from a common point; characteristic of but not confined to Apiaceae.  2. In Asteraceae and some other groups, an umbel-like inflorescence is one in which three to many stalked inflorescence units (e.g., heads in Asteraceae, umbels enclosed by involucres in Eriogonum), instead of individual flowers, radiate from a common point of attachment without an evident axis or branches.</span></span>|g){ }

if ($line =~ s|<<529>>Understory<<529>>|<span class="term-trigger" tabindex="0">Understory<span class="term-popup">Layer of vegetation growing beneath a canopy of taller plants.</span></span>|g){ }

if ($line =~ s| <<529>>understory<<529>>|&nbsp;<span class="term-trigger" tabindex="0">understory<span class="term-popup">Layer of vegetation growing beneath a canopy of taller plants.</span></span>|g){ }

if ($line =~ s|<<530>>Unisexual<<530>>|<span class="term-trigger" tabindex="0">Unisexual<span class="term-popup">Either male or female reproductive parts occurring and functional in the same plant or structure (e.g., flower, spikelet, inforescence).</span></span>|g){ }

if ($line =~ s| <<530>>unisexual<<530>>|&nbsp;<span class="term-trigger" tabindex="0">unisexual<span class="term-popup">Either male or female reproductive parts occurring and functional in the same plant or structure (e.g., flower, spikelet, inforescence).</span></span>|g){ }

if ($line =~ s|<<531>>Urn-shaped<<531>>|<span class="term-trigger" tabindex="0">Urn-shaped<span class="term-popup">Widening more or less abruptly at the base and then gradually or abruptly narrowed toward the tip.</span></span>|g){ }

if ($line =~ s| <<531>>urn-shaped<<531>>|&nbsp;<span class="term-trigger" tabindex="0">urn-shaped<span class="term-popup"><img src="/eflora/common/images/morph/urn-shaped.jpg" class="term-img" alt="Morphology: urn-shaped">Widening more or less abruptly at the base and then gradually or abruptly narrowed toward the tip.</span></span>|g){ }

if ($line =~ s|<<532>>Utricle<<532>>|<span class="term-trigger" tabindex="0">Utricle<span class="term-popup">Mostly dry, dehiscent or indehiscent fruit from a generally compound pistil in which a balloon- or bladder-like ovary wall loosely encloses (or, in some Amaranthaceae, is adherent to) a single seed.</span></span>|g){ }

if ($line =~ s| <<532>>utricle<<532>>|&nbsp;<span class="term-trigger" tabindex="0">utricle<span class="term-popup"><img src="/eflora/common/images/morph/utricle.jpg" class="term-img" alt="Morphology: utricle">Mostly dry, dehiscent or indehiscent fruit from a generally compound pistil in which a balloon- or bladder-like ovary wall loosely encloses (or, in some Amaranthaceae, is adherent to) a single seed.</span></span>|g){ }

if ($line =~ s|<<533>>Utricles<<533>>|<span class="term-trigger" tabindex="0">Utricles<span class="term-popup">Mostly dry, dehiscent or indehiscent fruit from a generally compound pistil in which a balloon- or bladder-like ovary wall loosely encloses (or, in some Amaranthaceae, is adherent to) a single seed.</span></span>|g){ }

if ($line =~ s| <<533>>utricles<<533>>|&nbsp;<span class="term-trigger" tabindex="0">utricles<span class="term-popup">Mostly dry, dehiscent or indehiscent fruit from a generally compound pistil in which a balloon- or bladder-like ovary wall loosely encloses (or, in some Amaranthaceae, is adherent to) a single seed.</span></span>|g){ }

if ($line =~ s|<<534>>Valve<<534>>|<span class="term-trigger" tabindex="0">Valve<span class="term-popup">1. In legumes or capsules opening by longitudinal lines, one of the parts into which the fruit is dehiscent.  2. In anthers, the flap of tissue resulting from dehiscence by a curved line. (e.g., Lauraceae, some Berberidaceae).  3. In Ophioglossaceae, one of the parts into which the sporangium is dehiscent.</span></span>|g){ }

if ($line =~ s| <<534>>valve<<534>>|&nbsp;<span class="term-trigger" tabindex="0">valve<span class="term-popup"><img src="/eflora/common/images/morph/valve.jpg" class="term-img" alt="Morphology: valve">1. In legumes or capsules opening by longitudinal lines, one of the parts into which the fruit is dehiscent.  2. In anthers, the flap of tissue resulting from dehiscence by a curved line. (e.g., Lauraceae, some Berberidaceae).  3. In Ophioglossaceae, one of the parts into which the sporangium is dehiscent.</span></span>|g){ }

if ($line =~ s|<<535>>Valves<<535>>|<span class="term-trigger" tabindex="0">Valves<span class="term-popup">1. In legumes or capsules opening by longitudinal lines, one of the parts into which the fruit is dehiscent.  2. In anthers, the flap of tissue resulting from dehiscence by a curved line. (e.g., Lauraceae, some Berberidaceae).  3. In Ophioglossaceae, one of the parts into which the sporangium is dehiscent.</span></span>|g){ }

if ($line =~ s| <<535>>valves<<535>>|&nbsp;<span class="term-trigger" tabindex="0">valves<span class="term-popup">1. In legumes or capsules opening by longitudinal lines, one of the parts into which the fruit is dehiscent.  2. In anthers, the flap of tissue resulting from dehiscence by a curved line. (e.g., Lauraceae, some Berberidaceae).  3. In Ophioglossaceae, one of the parts into which the sporangium is dehiscent.</span></span>|g){ }

if ($line =~ s|<<536>>Vascular<<536>>|<span class="term-trigger" tabindex="0">Vascular<span class="term-popup">Pertaining to plant veins or to plants with veins.</span></span>|g){ }

if ($line =~ s| <<536>>vascular<<536>>|&nbsp;<span class="term-trigger" tabindex="0">vascular<span class="term-popup">Pertaining to plant veins or to plants with veins.</span></span>|g){ }

if ($line =~ s|<<537>>Vein<<537>>|<span class="term-trigger" tabindex="0">Vein<span class="term-popup">1. Tissue specialized for transport of substances within a plant, water and dissolved inorganic substances (e.g., mineral nutrients) through the xylem, energy-rich, organic compounds (products of photosynthesis) through the phloem.  2. A strand of such tissue, often seen as a line in surface view and as a bundle in transverse section.</span></span>|g){ }

if ($line =~ s| <<537>>vein<<537>>|&nbsp;<span class="term-trigger" tabindex="0">vein<span class="term-popup">1. Tissue specialized for transport of substances within a plant, water and dissolved inorganic substances (e.g., mineral nutrients) through the xylem, energy-rich, organic compounds (products of photosynthesis) through the phloem.  2. A strand of such tissue, often seen as a line in surface view and as a bundle in transverse section.</span></span>|g){ }

if ($line =~ s|<<538>>Veins<<538>>|<span class="term-trigger" tabindex="0">Veins<span class="term-popup">1. Tissue specialized for transport of substances within a plant, water and dissolved inorganic substances (e.g., mineral nutrients) through the xylem, energy-rich, organic compounds (products of photosynthesis) through the phloem.  2. A strand of such tissue, often seen as a line in surface view and as a bundle in transverse section.</span></span>|g){ }

if ($line =~ s| <<538>>veins<<538>>|&nbsp;<span class="term-trigger" tabindex="0">veins<span class="term-popup">1. Tissue specialized for transport of substances within a plant, water and dissolved inorganic substances (e.g., mineral nutrients) through the xylem, energy-rich, organic compounds (products of photosynthesis) through the phloem.  2. A strand of such tissue, often seen as a line in surface view and as a bundle in transverse section.</span></span>|g){ }

if ($line =~ s|<<539>>Vernal pool<<539>>|<span class="term-trigger" tabindex="0">Vernal pool<span class="term-popup">Shallow, ephemeral body of water (i.e., one that becomes dry by spring or early summer) that occupies a depression, with underlying hardpan, claypan, or bedrock, in a grassland, foothill woodland, or chaparral.</span></span>|g){ }

if ($line =~ s| <<539>>vernal pool<<539>>|&nbsp;<span class="term-trigger" tabindex="0">vernal pool<span class="term-popup">Shallow, ephemeral body of water (i.e., one that becomes dry by spring or early summer) that occupies a depression, with underlying hardpan, claypan, or bedrock, in a grassland, foothill woodland, or chaparral.</span></span>|g){ }

if ($line =~ s|<<540>>Vernal pools<<540>>|<span class="term-trigger" tabindex="0">Vernal pools<span class="term-popup">Shallow, ephemeral body of water (i.e., one that becomes dry by spring or early summer) that occupies a depression, with underlying hardpan, claypan, or bedrock, in a grassland, foothill woodland, or chaparral.</span></span>|g){ }

if ($line =~ s| <<540>>vernal pools<<540>>|&nbsp;<span class="term-trigger" tabindex="0">vernal pools<span class="term-popup">Shallow, ephemeral body of water (i.e., one that becomes dry by spring or early summer) that occupies a depression, with underlying hardpan, claypan, or bedrock, in a grassland, foothill woodland, or chaparral.</span></span>|g){ }

if ($line =~ s|<<541>>Vestigial<<541>>|<span class="term-trigger" tabindex="0">Vestigial<span class="term-popup">Rudimentary; pertaining to a structure that is undeveloped, poorly developed, or degenerate and therefore non-functional.</span></span>|g){ }

if ($line =~ s| <<541>>vestigial<<541>>|&nbsp;<span class="term-trigger" tabindex="0">vestigial<span class="term-popup">Rudimentary; pertaining to a structure that is undeveloped, poorly developed, or degenerate and therefore non-functional.</span></span>|g){ }

if ($line =~ s|<<542>>Vine<<542>>|<span class="term-trigger" tabindex="0">Vine<span class="term-popup">A trailing, twining, or climbing plant, usually attached to its support by the twisting or coiling of stems, tendrils, or other structures.   (e.g., Phaseolus filiformis)</span></span>|g){ }

if ($line =~ s| <<542>>vine<<542>>|&nbsp;<span class="term-trigger" tabindex="0">vine<span class="term-popup">A trailing, twining, or climbing plant, usually attached to its support by the twisting or coiling of stems, tendrils, or other structures.   (e.g., Phaseolus filiformis)</span></span>|g){ }

if ($line =~ s|<<543>>Vines<<543>>|<span class="term-trigger" tabindex="0">Vines<span class="term-popup">A trailing, twining, or climbing plant, usually attached to its support by the twisting or coiling of stems, tendrils, or other structures.   (e.g., Phaseolus filiformis)</span></span>|g){ }

if ($line =~ s| <<543>>vines<<543>>|&nbsp;<span class="term-trigger" tabindex="0">vines<span class="term-popup">A trailing, twining, or climbing plant, usually attached to its support by the twisting or coiling of stems, tendrils, or other structures.   (e.g., Phaseolus filiformis)</span></span>|g){ }

if ($line =~ s|<<544>>Waif<<544>>|<span class="term-trigger" tabindex="0">Waif<span class="term-popup">Alien, adventive; reproducing neither sexually (e.g., by spores, seeds) nor vegetatively (e.g., by sprouts, suckers) in the absence of any benefit, intentional or not, direct or indirect, of human activity, and therefore not persisting beyond initial generation or establishment, or reproducing to some extent but not persisting for more than a few generations or well beyond initial establishment and therefore not completely naturalized; generally not considered to be part of the flora, but of interest because of their potential to become naturalized, and thereby to have become so.</span></span>|g){ }

if ($line =~ s| <<544>>waif<<544>>|&nbsp;<span class="term-trigger" tabindex="0">waif<span class="term-popup">Alien, adventive; reproducing neither sexually (e.g., by spores, seeds) nor vegetatively (e.g., by sprouts, suckers) in the absence of any benefit, intentional or not, direct or indirect, of human activity, and therefore not persisting beyond initial generation or establishment, or reproducing to some extent but not persisting for more than a few generations or well beyond initial establishment and therefore not completely naturalized; generally not considered to be part of the flora, but of interest because of their potential to become naturalized, and thereby to have become so.</span></span>|g){ }

if ($line =~ s|<<545>>Waifs<<545>>|<span class="term-trigger" tabindex="0">Waifs<span class="term-popup">Alien, adventive; reproducing neither sexually (e.g., by spores, seeds) nor vegetatively (e.g., by sprouts, suckers) in the absence of any benefit, intentional or not, direct or indirect, of human activity, and therefore not persisting beyond initial generation or establishment, or reproducing to some extent but not persisting for more than a few generations or well beyond initial establishment and therefore not completely naturalized; generally not considered to be part of the flora, but of interest because of their potential to become naturalized, and thereby to have become so.</span></span>|g){ }

if ($line =~ s| <<545>>waifs<<545>>|&nbsp;<span class="term-trigger" tabindex="0">waifs<span class="term-popup">Alien, adventive; reproducing neither sexually (e.g., by spores, seeds) nor vegetatively (e.g., by sprouts, suckers) in the absence of any benefit, intentional or not, direct or indirect, of human activity, and therefore not persisting beyond initial generation or establishment, or reproducing to some extent but not persisting for more than a few generations or well beyond initial establishment and therefore not completely naturalized; generally not considered to be part of the flora, but of interest because of their potential to become naturalized, and thereby to have become so.</span></span>|g){ }

if ($line =~ s|<<546>>Wash<<546>>|<span class="term-trigger" tabindex="0">Wash<span class="term-popup">Normally dry drainage channel with only occasional surface flow (e.g., flash floods), in some cases with water movement and availability below in times of no surface flow.</span></span>|g){ }

if ($line =~ s| <<546>>wash<<546>>|&nbsp;<span class="term-trigger" tabindex="0">wash<span class="term-popup">Normally dry drainage channel with only occasional surface flow (e.g., flash floods), in some cases with water movement and availability below in times of no surface flow.</span></span>|g){ }

if ($line =~ s|<<547>>Washes<<547>>|<span class="term-trigger" tabindex="0">Washes<span class="term-popup">Normally dry drainage channel with only occasional surface flow (e.g., flash floods), in some cases with water movement and availability below in times of no surface flow.</span></span>|g){ }

if ($line =~ s| <<547>>washes<<547>>|&nbsp;<span class="term-trigger" tabindex="0">washes<span class="term-popup">Normally dry drainage channel with only occasional surface flow (e.g., flash floods), in some cases with water movement and availability below in times of no surface flow.</span></span>|g){ }

if ($line =~ s|<<548>>Whorled<<548>>|<span class="term-trigger" tabindex="0">Whorled<span class="term-popup">Arranged in groups of three or more at nodes or positions along an axis (e.g., three leaves per node).</span></span>|g){ }

if ($line =~ s| <<548>>whorled<<548>>|&nbsp;<span class="term-trigger" tabindex="0">whorled<span class="term-popup"><img src="/eflora/common/images/morph/whorled.jpg" class="term-img" alt="Morphology: whorled">Arranged in groups of three or more at nodes or positions along an axis (e.g., three leaves per node).</span></span>|g){ }

if ($line =~ s|<<549>>Whorl<<549>>|<span class="term-trigger" tabindex="0">Whorl<span class="term-popup">Arranged in groups of three or more at nodes or positions along an axis (e.g., three leaves per node).</span></span>|g){ }

if ($line =~ s| <<549>>whorl<<549>>|&nbsp;<span class="term-trigger" tabindex="0">whorl<span class="term-popup">Arranged in groups of three or more at nodes or positions along an axis (e.g., three leaves per node).</span></span>|g){ }

if ($line =~ s|<<550>>Wing<<550>>|<span class="term-trigger" tabindex="0">Wing<span class="term-popup">1. Thin, flat extension or appendage of a surface or margin.  2. In many members of Fabaceae and in some other groups, each of two lateral petals.</span></span>|g){ }

if ($line =~ s| <<550>>wing<<550>>|&nbsp;<span class="term-trigger" tabindex="0">wing<span class="term-popup"><img src="/eflora/common/images/morph/winged-stem.jpg" class="term-img" alt="Morphology: wing">1. Thin, flat extension or appendage of a surface or margin.  2. In many members of Fabaceae and in some other groups, each of two lateral petals.</span></span>|g){ }

if ($line =~ s|<<551>>Wings<<551>>|<span class="term-trigger" tabindex="0">Wings<span class="term-popup">1. Thin, flat extension or appendage of a surface or margin.  2. In many members of Fabaceae and in some other groups, each of two lateral petals.</span></span>|g){ }

if ($line =~ s| <<551>>wings<<551>>|&nbsp;<span class="term-trigger" tabindex="0">wings<span class="term-popup">1. Thin, flat extension or appendage of a surface or margin.  2. In many members of Fabaceae and in some other groups, each of two lateral petals.</span></span>|g){ }

if ($line =~ s|<<552>>Wiry<<552>>|<span class="term-trigger" tabindex="0">Wiry<span class="term-popup">Pertaining to roots, stems, hairs, and other structures that are slender, stiff, and tough.</span></span>|g){ }

if ($line =~ s| <<552>>wiry<<552>>|&nbsp;<span class="term-trigger" tabindex="0">wiry<span class="term-popup">Pertaining to roots, stems, hairs, and other structures that are slender, stiff, and tough.</span></span>|g){ }

if ($line =~ s|<<553>>Wood<<553>>|<span class="term-trigger" tabindex="0">Wood<span class="term-popup">Hardened, thickened, vascular tissue (xylem) under the bark of subshrubs, shrubs, trees, and some vines; number of concentric rings in wood often corresponds to years or growing seasons.</span></span>|g){ }

if ($line =~ s| <<553>>wood<<553>>|&nbsp;<span class="term-trigger" tabindex="0">wood<span class="term-popup">Hardened, thickened, vascular tissue (xylem) under the bark of subshrubs, shrubs, trees, and some vines; number of concentric rings in wood often corresponds to years or growing seasons.</span></span>|g){ }

if ($line =~ s|<<554>>Woody<<554>>|<span class="term-trigger" tabindex="0">Woody<span class="term-popup">A woody plant is a perennial that produces extensive wood and bark. This hard, supportive tissue allows these plants (ex. trees, shrubs, some vines) to persist year-round. Wood, which consists mainly of xylem (reinforced conducting) tissue, transports water and provides support so that these plants have potential to grow taller and wider, and often to live longer, than herbaceous plants.</span></span>|g){ }

if ($line =~ s| <<554>>woody<<554>>|&nbsp;<span class="term-trigger" tabindex="0">woody<span class="term-popup">A woody plant is a perennial that produces extensive wood and bark. This hard, supportive tissue allows these plants (ex. trees, shrubs, some vines) to persist year-round. Wood, which consists mainly of xylem (reinforced conducting) tissue, transports water and provides support so that these plants have potential to grow taller and wider, and often to live longer, than herbaceous plants.</span></span>|g){ }

if ($line =~ s|<<555>>Woodland<<555>>|<span class="term-trigger" tabindex="0">Woodland<span class="term-popup">Vegetation dominated by small- to medium-sized trees, often with less continuous canopy cover than a forest and more than a savanna (canopies do not always touch).</span></span>|g){ }

if ($line =~ s| <<555>>woodland<<555>>|&nbsp;<span class="term-trigger" tabindex="0">woodland<span class="term-popup">Vegetation dominated by small- to medium-sized trees, often with less continuous canopy cover than a forest and more than a savanna (canopies do not always touch).</span></span>|g){ }

if ($line =~ s|<<556>>Woodlands<<556>>|<span class="term-trigger" tabindex="0">Woodlands<span class="term-popup">Vegetation dominated by small- to medium-sized trees, often with less continuous canopy cover than a forest and more than a savanna (canopies do not always touch).</span></span>|g){ }

if ($line =~ s| <<556>>woodlands<<556>>|&nbsp;<span class="term-trigger" tabindex="0">woodlands<span class="term-popup">Vegetation dominated by small- to medium-sized trees, often with less continuous canopy cover than a forest and more than a savanna (canopies do not always touch).</span></span>|g){ }

    # 3. convert line endings to links

	#this used to be done by get_IJM.pl, 
	#but it is converted here so that PHP does not have to do the conversion
	#$key_text=~s|<a href="#(\d+)|<a href="/eflora/eflora_display.php?tid=$1|g;
	#if ($line =~ m|\t([^\t]+)\tVERBATIM NAME: *([^<]+)</div>|){
	#	my $verb = $2;
	#	my $name = $1;
	#	if ($name =~ m|^[A-Za-z .]+$|){
	#		my $tid = $NAME_TO_CODE{$name};
	#		$line=~s|\t([^\t]+)\tVERBATIM NAME: *([^<]+)</div>| ..... <a href="/eflora/eflora_display.php?tid=$tid" class="key-link">$2</a></div>|g;
	#	} else {
	#		$line=~s|\t([^\t]+)\tVERBATIM NAME: *([^<]+)</div>| ..... $2</div>|g;
	#	}
	#}

# We use the 'e' flag to evaluate a code block for every match found by 'g'
# Use {} as delimiters to avoid any further character conflicts
# Call the subroutine for every match found
	$line =~ s{\t([^\t]+)\tVERBATIM NAME: *([^<]+)</div>}{link_verbatim_name($1, $2)}ge;

#g (Global): Tells Perl not to stop after the first match.
#e (Evaluate): Tells Perl that the second half of the s/// isn't just a string, but a block of code that must be run for every match.
#Individual Lookups: Because the code inside the {} runs every time a match is hit, $1 and $2 are updated for every taxon in your section. This allows Lycopodiella to get its TID and Lycopodium to get its own TID in one pass.
#Trimming: I added $verb =~ s/\s+$//g;. In your sample data, there is a space between the name and the </div>. This ensures the link text doesn't have an ugly trailing space inside the <a> tag.

#Eliminates Conflicts: By moving the logic to sub link_verbatim_name, the regexes inside the sub (using / and |) no longer interfere with the regex in your main loop.
#Solves the "First Match Only" problem: Using the ge flags at the end of the s{}{}ge ensures that every single instance of "VERBATIM NAME" in your long line is processed and replaced individually.

#for the full version of the file, do not load any keys that have been hand revised
	 next if $line =~ m| 8902######START|g; #carex group keys
	 next if $line =~ m| 58######START|g; #asteraceae group keys
	 next if $line =~ m| 134######START|g; #fabaceae group keys
	 next if $line =~ m| 11209######START|g; #eriogonum group keys
	 next if $line =~ m| 223######START|g; #poaceae group keys


    # 4. Use the explicit filehandle for output
    print OUT $line . " ";
}
close($fh_in);
close(OUT);

sub link_verbatim_name {
    my ($name, $verb) = @_;

    # 1. Clean up whitespace
    $name =~ s/^\s+|\s+$//g;
    $verb =~ s/\s+$//g;

    # 2. Check if name is valid format
    if ($name =~ m/^[A-Za-z .]+$/) {
        # Look up the TID (assuming %NAME_TO_CODE is a global hash)
        my $tid = $NAME_TO_CODE{$name};

        if ($tid) {
            # Return the link version
            return " ..... <a href=\"/eflora/eflora_display.php?tid=$tid\" class=\"key-link\">$verb</a></div>";
        }
    }

    # 3. Fallback: Return without link
    return " ..... $verb</div>";
}
