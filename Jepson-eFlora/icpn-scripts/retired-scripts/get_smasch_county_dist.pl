#!/usr/bin/perl
#$hc="0001000000";
$trailer =<<EOT;
<hr>
<!-- Begin Navigation -->
<CENTER>
<Font size="1" Face="Verdana, Arial, Helvetica">
<a href = "/"> University & Jepson Herbaria Home Page </a> | 
<BR>
<a href="/gen_info.html">General Information </a> | 
<a href="/ucherb.html"> University Herbarium </a> | 
<a href="/active.html"> Jepson Herbarium </a> |
<BR>
<a href="/Visitor_Guidelines.html"> Visiting the Herbaria </a> | 
<a href="/online_resources.html"> On-line Resources </a> | 
<a href="/res_teach.html"> Research </a> | 
<BR>
<a href="/education.html"> Education </a> | 
<a href="/other_sites_hosted.html"> Related Sites </a> | 
</Font>
<!-- End Navigation -->
<br>
<a href="/copyright.html"> <font size="-2">Copyright by the Regents of 
the University of California </font></a>
</CENTER>

EOT
push(@INC,"/usr/local/web/ucjeps_data/ucjeps_data/cgi");
require "cgi-lib.pl";
&ReadParse(*input);
use LWP::Simple qw(get head);



%counties=(
"NCo" => "Del Norte,Humboldt,Mendocino,Sonoma",
"KR" => "Del Norte,Humboldt,Shasta,Siskiyou,Trinity,Tehama",
"NCoRH" => "Colusa,Glenn,Humboldt,Lake,Mendocino,Tehama,Trinity",
"NCoRI" => "Colusa,Glenn,Lake,Mendocino,Napa,Shasta,Solano,Sonoma,Tehama,Yolo",
"NCoRO" => "Humboldt,Lake,Mendocino,Napa,Solano,Sonoma,Trinity",
"CaRF" => "Butte,Shasta,Tehama",
"CaRH" => "Butte,Lassen,Modoc,Plumas,Shasta,Siskiyou,Tehama",
"nSNF" => "Amador,Butte,Calaveras,El Dorado,Nevada,Placer,Sacramento,Yuba",
"cSNF" => "Fresno,Madera,Mariposa,Tuolumne",
"sSNF" => "Fresno,Kern,Tulare",
"nSNH" => "Alpine,Amador,Butte,Calaveras,El Dorado,Lassen,Nevada,Placer,Plumas,Sierra,Yuba",
"cSNH" => "Fresno,Inyo,Madera,Mariposa,Mono,Tuolumne",
"sSNH" => "Fresno,Inyo,Kern,Tulare",
"Teh" => "Kern",
"ScV" => "Butte,Colusa,Glenn,Placer,Sacramento,Solano,Sutter,Tehama,Yolo,Yuba",
"SnJV" => "Alameda,Contra Costa,Fresno,Kings,Kern,Madera,Mariposa,Merced,Monterey,Santa Barbara,San Benito,San Joaquin,San Luis Obispo,Stanislaus,Tulare",
"CCo" => "Alameda,Contra Costa,Marin,Monterey,Napa,Santa Barbara,Santa Clara,Santa Cruz,San Francisco,San Luis Obispo,San Mateo,Solano,Sonoma",
"SnFrB" => "Alameda,Contra Costa,Merced,Marin,Monterey,Napa,San Benito,Santa Clara,Santa Cruz,San Joaquin,San Mateo,Sonoma,Stanislaus",
"SCoRI" => "Fresno,Kings,Kern,Merced,Monterey,San Benito,San Luis Obispo",
"SCoRO" => "Monterey,Santa Barbara,San Luis Obispo",
"SCo" => "Los Angeles,Orange,Riverside,Santa Barbara,San Bernardino,San Diego,Ventura",
"nChI" => "Santa Barbara,Ventura",
"sChI" => "Los Angeles,Ventura",
"WTR" => "Kern,Los Angeles,Santa Barbara,Ventura",
"SnGb" => "Los Angeles,San Bernardino",
"SnJt" => "Riverside",
"SnBr" => "Riverside,San Bernardino",
"PR" => "Imperial,Los Angeles,Orange,Riverside,San Bernardino,San Diego",
"Wrn" => "Lassen,Modoc",
"MP" => "Lassen,Modoc,Plumas,Shasta,Sierra,Siskiyou",
"WaI" => "Inyo,Mono",
"SNE" => "Alpine,Inyo,Mono",
"DMtns" => "Inyo,Riverside,San Bernardino",
"DMoj" => "Inyo,Kern,Los Angeles,Riverside,San Bernardino",
"DSon" => "Imperial,Riverside,San Bernardino,San Diego",
);

$nullvec="";
for $i (0 .. 39){
	vec($nullvec,$i,1) = 0;
}
while(<DATA>){
#print;
	chomp;
	($region,$mapcoord, $mapcolor,$longregion,$province) = split(/\t/, $_);
	$prov{$region}=$sort_order++;
	$parent{$region}=$province;
	$expand{$region}=$longregion;
	push(@regions,$region);
}
#this sort is important, since it establishes the order of the bit vector,
#which should have been generated following a similar sort
#make sure here's not a blank line at data's end
foreach (@regions){
	if(m/^([a-z])(.*)/){
		$sortstring{$_} = "$2$1";
		$sortstring{$_} =~ s/c$/o/;
	}
	else{
		$sortstring{$_} = $_;
	}
}
@regions=sort bycaps (@regions);
sub bycaps {
	$sortstring{$a} cmp $sortstring{$b} ||
	$a cmp $b
}
#Query string will replace this file read
$hc=$input{hcode};
$distvec = $nullvec;
	#translate hex code to bit vector
#warn unpack("b*",pack("H*",$hcode)), "\n";
$distvec = pack("b*", unpack("b*",pack("H*",$hc)));


foreach $r (sort {$prov{$regions[$a]} <=> $prov{$regions[$b]}}(0 .. 34)){
	if(vec($distvec,$r,1)){
		foreach(split(/,/, $counties{$regions[$r]})){
$seen_county{$_}++;
print "$_";
		}
	}
}








my $taxon_name= $input{'taxon_name'};
$taxon_name=~s/ /+/g;
my $baseurl= "http://www.mip.berkeley.edu:8080/servlet/SmaschCaCountyDist?taxon_name=$taxon_name&comp_radio=no&compare_to=no";
my $page = get($baseurl);
@page=split(/\n\n/,$page);
foreach(@page){
if(m/vspace=0 alt="([A-Z][^"]+)"/){
#
push(@what_I_saw,$1);
unless($seen_county{$1}){
s/blue.gif/red.gif/;
}
}
}
$page=join("\n\n",@page);
#print &PrintHeader;
#print $page;
$page=~s|<table>.*</ul></div>|<H3 align="center">Combined display of distribution of $input{'taxon_name'}</H3><h5>A bioregion is colored if the presence therein of the taxon in question is indicated or implied in the The Jepson Manual. Counties for which the SMASCH database contains a specimen record are represented by a square, which is placed approximately in the center of each such county (county lines not indicated). Note that counties are not coextensive with bioregions.  </H5> |ms;
#print $page;
$page=~s|Missing: *map of California|Bioregional map of California|;
#print $page;
$page=~s|www.mip.berkeley.edu/style/calif_dist.css|ucjeps.berkeley.edu/cal_dist_new.css|;
#print $page;
$page=~s|www.mip.berkeley.edu/images/maps/calif.jpg|ucjeps.berkeley.edu/cgi-bin/new_jmap.pl?$input{'hcode'}|;
#print $page;
$page=~s/alt="([A-Z][^"]+)"/alt="$1 County: click for SMASCH records" title="$1"/g;
#print $page;
$page=~s/County: click for SMASCH records//;
print &PrintHeader;
$page=~s/<!--END//;
$page=~s/Begin Navigation-->//;

#$page .= join("<br>", keys(%seen_county));
#$page .= join("<P>", keys(%seen_county), @what_I_saw);
print<<EOP;
<html>
<head>
<Meta NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
$page
<h5>
The presence of a square in an uncolored bioregion indicates a possible range extension for the taxon in question.  Red squares designate counties that do not overlap at all with any of the indicated bioregions. Click on a square to display records from the Consortium of California Herbaria for that county.
</h5>
$trailer
</html>
EOP
foreach(@page){
#print "$_<P>";
}

__END__
NCo	39,73	0,100,0	North Coast	California Floristic Province
KR	73,33	107,142,35	Klamath Ranges	California Floristic Province
NCoRH	91,98	32,178,170	High North Coast Ranges	California Floristic Province
NCoRI	105,90	32,178,170	Inner North Coast Ranges	California Floristic Province
NCoRO	72,102	32,178,170	Outer North Coast Ranges	California Floristic Province
CaRF	121,83	32,178,170	Cascade Range Foothills	California Floristic Province
CaRH	140,80	10,125,30	High Cascade Range	California Floristic Province
nSNF	159,159	70,130,180	n Sierra Nevada Foothills	California Floristic Province
cSNF	195,218	70,130,180	c Sierra Nevada Foothills	California Floristic Province
sSNF	230,250	70,130,180	s Sierra Nevada Foothills	California Floristic Province
nSNH	179,137	30,144,255	n High Sierra Nevada	California Floristic Province
cSNH	218,203	30,144,255	c High Sierra Nevada	California Floristic Province
sSNH	255,255	30,144,255	s High Sierra Nevada	California Floristic Province
Teh	255,324	72,61,139	Tehachapi Mountain Area	California Floristic Province
ScV	137,177	127,255,25	Sacramento Valley	California Floristic Province
SnJV	184,244	154,205,50	San Joaquin Valley	California Floristic Province
CCo	137,255	102,205,170	Central Coast	California Floristic Province
SnFrB	136,223	176,196,222	San Francisco Bay Area	California Floristic Province
SCoRI	165,261	69,139,116	Inner South Coast Ranges	California Floristic Province
SCoRO	191,329	69,139,116	Outer South Coast Ranges	California Floristic Province
SCo	275,369	155,48,255	South Coast	California Floristic Province
nChI	266,399	221,160,221	n Channel Islands	California Floristic Province
sChI	266,399	221,160,221	s Channel Islands	California Floristic Province
WTR	247,344	255,105,180	Western Transverse Ranges	California Floristic Province
SnGb	288,356	255,105,180	San Gabriel Mountains	California Floristic Province
SnBr	322,358	255,105,180	San Bernardino Mountains	California Floristic Province
PR	325,406	255,000,100	Peninsular Ranges	California Floristic Province
SnJt	332,380	255,000,100	San Jacinto Mountains	California Floristic Province
Wrn	179,39	255,165,0	Warner Mountains	Great Basin Province
MP	165,38	255,232,170	Modoc Plateau	Great Basin Province
WaI	264,222	250,155,15	White and Inyo Mountains	Great Basin Province
SNE	240,196	255,255,15	East of Sierra Nevada	Great Basin Province
DMtns	308,266	255,100,0	Desert Mountains	Desert Province
DMoj	320,315	255,160,122	Mojave Desert	Desert Province
DSon	400,400	255,140,0	Sonoran Desert	Desert Province

