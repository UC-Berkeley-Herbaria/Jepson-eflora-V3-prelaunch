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
$taxon_id=$query->param('taxon_id');
$fips_string=$query->param('fips');
$taxon_id=~s/[^0-9]//g;
tie(%TID_TO_NAME, "BerkeleyDB::Hash", -Filename=>"$CDL_taxon_id_file", -Flags=>DB_RDONLY)
 	or print "Cannot open file CDL_TID_TO_NAME: $! $BerkeleyDB::Error\n" ;
$taxon_name=$TID_TO_NAME{$taxon_id};
untie(%TID_TO_NAME);
if($taxon_id){
@counties= &get_counties($taxon_id);
}
elsif($fips_string){
@FIPS= &get_fips($fips_string);
}

if(@counties){
#<html><head><link rel="stylesheet" type="text/css" href="http://www.mip.berkeley.edu/style/calif_dist.css">
print <<EOP;
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<html><head><link rel="stylesheet" type="text/css" href="/common/css/mip_map.css">

<title>UC/JEPS Consortium of California Herbaria County-Level Distribution Results </title>
</head><body bgcolor="#fefefe">
<table bgcolor="#dddddd" cellpadding=0 cellspacing=2>
<tr><td align="bottom">
<h2>
Consortium of California Herbaria:<br>
County-Level Distribution Results
</h2>
</td></tr></table>
<div class="leftcolumn">

<h4>Distribution of <i>$taxon_name</i></h4>
<P>
Click on a square to display records from the Consortium of California Herbaria for that county.
 <ul>
EOP
foreach $fip (@counties){
print <<EOP;
<li>$fips_to_county{$fip}
EOP
}
print <<EOP;
</ul></div>
<div class="basemap"><img src="/common/images/mip_cal_map.jpg" alt="County map of California"></div>
<div class = "dist">
EOP

foreach $fip (@counties){
	$dot="blue.gif";
	$taxon_name=~s/ /+/g;
	print <<EOP;
<div class="f$fip">
<a href="/cgi-bin/get_consort.pl?taxon_name=$taxon_name&county=$fip" target="blank">
<img src="/images/$dot" align=top hspace=0 vspace=0 alt="$fips_to_county{$fip} County: click for Consortium records" title="$fips_to_county{$fip}"></a></div>

EOP
}
print <<EOP;
</div>
<!--Begin Navigation-->
<div class="bottomform">
<CENTER>
<font size=1>
<a href = "/"> University & Jepson Herbaria Home Page
</a>
<br />
<a href="/uc/"> University Herbarium </a>
 | 
<a href="/jeps/"> Jepson Herbarium </a>
<br />
<a href="/main/guidelines.html"> Visiting the Herbaria </a>
 | 
<a href="/main/databases.html"> Online Resources </a>
 | 
<a href="/main/education.html"> Education </a>
<br />
<a href="/main/copyright.html">Copyright &copy; </a> by the Regents of the University of California
</Font>
</CENTER>
<!--End Navigation-->
</div>
</body></html>
EOP
}
elsif(@FIPS){
print <<EOP;
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<html><head><link rel="stylesheet" type="text/css" href="/common/css/mip_map.css">

<title>UC/JEPS Consortium of California Herbaria County-Level Distribution Results </title>
</head><body bgcolor="#fefefe">
<table bgcolor="#dddddd" cellpadding=0 cellspacing=2>
<tr><td align="bottom">
<h2>
Consortium of California Herbaria:<br>
County-Level Distribution Results
</h2>
</td></tr></table>
<div class="leftcolumn">

EOP
print <<EOP;
</div>
<div class="basemap"><img src="/common/images/mip_cal_map.jpg" alt="County map of California"></div>
<div class = "dist">
EOP

foreach $fip (@FIPS){
	$dot="blue.gif";
	$taxon_name=~s/ /+/g;
	print <<EOP;
<div class="f$fip">
<img src="/images/$dot" align=top hspace=0 vspace=0> </div>

EOP
}
print <<EOP;
</div>
<!--Begin Navigation-->
<div class="bottomform">
<CENTER>
<font size=1>
<a href = "/"> University & Jepson Herbaria Home Page
</a>
<br />
<a href="/uc/"> University Herbarium </a>
 | 
<a href="/jeps/"> Jepson Herbarium </a>
<br />
<a href="/main/guidelines.html"> Visiting the Herbaria </a>
 | 
<a href="/main/databases.html"> Online Resources </a>
 | 
<a href="/main/education.html"> Education </a>
<br />
<a href="/main/copyright.html">Copyright &copy; </a> by the Regents of the University of California
</Font>
</CENTER>
<!--End Navigation-->
</div>
</body></html>
EOP
}
else{
print <<EOP;
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<html><head><link rel="stylesheet" type="text/css" href="/common/css/cal_dist_new.css">

<title>UC/JEPS Consortium of California Herbaria County-Level Distribution Results </title>
</head><body bgcolor="#fefefe"><table><tr><td align=left>
</td>
<td><h2>Consortium of California Herbaria:<br>County-Level Distribution Results</h2></td></tr></table>
<h3>No results for $taxon_name</h3>
$fips_string
@FIPS
<!--Begin Navigation-->
<div class="bottomform">
<CENTER>
<font size=1>
<a href = "/"> University & Jepson Herbaria Home Page
</a>
<br />
<a href="/uc/"> University Herbarium </a>
 | 
<a href="/jeps/"> Jepson Herbarium </a>
<br />
<a href="/main/guidelines.html"> Visiting the Herbaria </a>
 | 
<a href="/main/databases.html"> Online Resources </a>
 | 
<a href="/main/education.html"> Education </a>
<br />
<a href="/main/copyright.html">Copyright &copy; </a> by the Regents of the University of California
</Font>
</CENTER>
<!--End Navigation-->
</body></html>
EOP
}

sub get_counties {
	my($tid)=shift;
 	tie %tid_to_county, "BerkeleyDB::Hash", -Filename => "$CDL_TID_TO_CO", -Flags=>DB_RDONLY  or print "Cannot open file CDL_TID_TO_CO: $! $BerkeleyDB::Error\n" ;
	$_=$tid_to_county{$tid};
	my(@fips)=m/(\d\d\d\d\d)/g;
 	untie(%tid_to_county);
	return(@fips);
}
sub get_fips {
local($_)=shift;
	my(@fips)=m/(\d\d\d\d\d)/g;
	return(@fips);
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
