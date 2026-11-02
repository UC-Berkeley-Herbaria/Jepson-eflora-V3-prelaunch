#!/usr/bin/perl
$data_path	="/usr/local/web/ucjeps_data/ucjeps_data/";
$CDL_taxon_id_file	="${data_path}CDL_TID_TO_NAME";
 	 $CDL_TID_TO_CO ="${data_path}CDL_TID_TO_CO";
use CGI;
$query = new CGI;                        # create new CGI object
print $query->header;                    # create the HTTP header
use BerkeleyDB;
%fips_to_county=&load_fips();
%fips=reverse(%fips_to_county);
$taxon_name=$query->param('taxon_name');

#$taxon_name=~s/[^A-Za-z ]/_/g;

$taxon_id=$query->param('taxon_id');

#$taxon_id=~s/[^0-9]//g;

tie(%TID_TO_NAME, "BerkeleyDB::Hash", -Filename=>"$CDL_taxon_id_file", -Flags=>DB_RDONLY);
if($taxon_id){
$taxon_name=$TID_TO_NAME{$taxon_id};
}
else{
tie(%NAME_CODE, "BerkeleyDB::Hash", -Filename=>"/usr/local/web/ucjeps_data/ucjeps_data/name_to_code", -Flags=>DB_RDONLY)|| die "$!";
	$taxon_id=$NAME_CODE{$taxon_name};
untie(%NAME_CODE);
}
untie(%TID_TO_NAME);
$hc=$query->param('hcode');
#
########26 June 2020
$hc=~s/[^A-Za-z0-9]/_/g;


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
$distvec = $nullvec;
	#translate hex code to bit vector
#warn unpack("b*",pack("H*",$hcode)), "\n";
$distvec = pack("b*", unpack("b*",pack("H*",$hc)));


foreach $r (sort {$prov{$regions[$a]} <=> $prov{$regions[$b]}}(0 .. 34)){
	if(vec($distvec,$r,1)){
		foreach(split(/,/, $counties{$regions[$r]})){
$seen_county{$_}++;
#print "$_";
		}
	}
}





print <<EOP;
<html>
<head>
<Meta NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
<link rel="stylesheet" type="text/css" href="http://ucjeps.berkeley.edu/cal_dist_new.css">
<title>Consortium of California Herbaria Bioregional/County Distribution Results </title>
</head>
<body>
<table bgcolor="#dddddd" cellpadding=0 cellspacing=2>
<tr><td align="bottom">
<h2>
Consortium of California Herbaria:<br>
County/Bioregion Distribution Results
</h2>
</td></tr></table>
<div class="leftcolumn">
<H4>Distribution of <i>$taxon_name</i>
</H4>
A bioregion is colored if the presence therein of the taxon in question is indicated or implied in the The Jepson Manual. Counties for which the Consortium of California Herbaria database contains a specimen record are represented by a square, which is placed approximately in the center of each such county (county lines not indicated). Note that counties are not coextensive with bioregions. 
<P>
The presence of a square in an uncolored bioregion indicates a possible range extension for the taxon in question.  Red squares designate counties that do not overlap at all with any of the indicated bioregions.
<P>
Click on a square to display records from the Consortium of California Herbaria for that county.
<P>
<a href="http://ucjeps.berkeley.edu/cguide.html#Geography"><font size="-2">Read about bioregions</font></a>
</div>

<div class="basemap"><img src="http://ucjeps.berkeley.edu/cgi-bin/new_jmap.pl?$hc" alt="Bioregional/county map of California " title="UCJEPS: Bioregional/
County map of California" width="638" height="443">
</div>
<div class = "dist">
EOP
foreach $fip (&get_counties($taxon_id)){
	$dot="blue.gif";
	unless($seen_county{$fips_to_county{$fip}}){
		$dot="red.gif";
	}
	$taxon_name=~s/ /+/g;
	print <<EOP;
<div class="f$fip">
<a href="http://ucjeps.berkeley.edu/cgi-bin/get_consort.pl?taxon_name=$taxon_name&county=$fip" target="blank">
<img src="/images/$dot" align=top hspace=0 vspace=0 alt="$fips_to_county{$fip} County: click for Consortium records" title="$fips_to_county{$fip}"></a></div>

EOP
}

$trailer =<<EOT;
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
print<<EOP;
<div class="bottomform">
$trailer
</div>
</body>
</html>
EOP
sub get_counties {
	my($tid)=shift;
 	tie %tid_to_county, "BerkeleyDB::Hash", -Filename => "$CDL_TID_TO_CO", -Flags=>DB_RDONLY  or print "Cannot open file CDL_TID_TO_CO: $! $BerkeleyDB::Error\n" ;
	$_=$tid_to_county{$tid};
	@counties=m/(\d\d\d\d\d)/g;
 	untie(%tid_to_county);
	return(@counties);
}

sub load_fips{
return (
"06001","Alameda",
"06003","Alpine",
"06005","Amador",
"06007","Butte",
"06009","Calaveras",
"06011","Colusa",
"06013","Contra Costa",
"06015","Del Norte",
"06017","El Dorado",
"06019","Fresno",
"06021","Glenn",
"06023","Humboldt",
"06025","Imperial",
"06027","Inyo",
"06029","Kern",
"06031","Kings",
"06033","Lake",
"06035","Lassen",
"06037","Los Angeles",
"06039","Madera",
"06041","Marin",
"06043","Mariposa",
"06045","Mendocino",
"06047","Merced",
"06049","Modoc",
"06051","Mono",
"06053","Monterey",
"06055","Napa",
"06057","Nevada",
"06059","Orange",
"06061","Placer",
"06063","Plumas",
"06065","Riverside",
"06067","Sacramento",
"06069","San Benito",
"06071","San Bernardino",
"06073","San Diego",
"06075","San Francisco",
"06077","San Joaquin",
"06079","San Luis Obispo",
"06081","San Mateo",
"06083","Santa Barbara",
"06085","Santa Clara",
"06087","Santa Cruz",
"06089","Shasta",
"06091","Sierra",
"06093","Siskiyou",
"06095","Solano",
"06097","Sonoma",
"06099","Stanislaus",
"06101","Sutter",
"06103","Tehama",
"06105","Trinity",
"06107","Tulare",
"06109","Tuolumne",
"06111","Ventura",
"06113","Yolo",
"06115","Yuba"
);
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
