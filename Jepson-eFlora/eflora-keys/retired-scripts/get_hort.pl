#!/usr/bin/perl
use BerkeleyDB;
$trailer =<<EOT;
<br>
<blockquote>
The Jepson Horticultural Database derives from the horticulture information provided in the first edition of <em>The Jepson Manual</em> for more than 3500 native species. The database is intended to allow this information to be searched easily and maintained conveniently. It will be expanded to allow searches that include other characteristics of the plants.
<P>
The Jepson Herbarium gratefully acknowledges the Elvenia J. Slosson Endowment Fund for supporting the development of the Jepson Horticultural Database.
</blockquote>

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
</body>
</html>

EOT

$page_top= "<a href=\"/jepson_flora_project.html\">Jepson&nbsp;Flora Project</a>: <a href=\"/interchange/\">Jepson Interchange</a>";

$expand{"!NOREQ"}="no specific additional requirements";
$expand{"In cult"}="Information about growing requirements is available from nurseries, CNPS chapters, and botanical gardens.";
$expand{"CVS"}="Cultivars available in the horticultural trade.";
$expand{"TRY"}="Insufficiently tested, but worth pursuing, especially within its natural range.";
$expand{"DFCLT"}="Difficult; needs special care in all zones; has complex requirements";
$expand{"INV"}="Invasive; once established, tending to outcompete, displace, or overrun others.";
$expand{"GRCVR"}="Good groundcover.";
$expand{"STBL"}="Especially good for stabilizing or restoring disturbed or degraded areas. May be less suitable for general garden use.";
$expand{"DRN"}="excellent drainage (modification of compacted or other water-holding soils may be necessary)";
$expand{"DRN,DRY"}="excellent drainage (modification of compacted or other water-holding soils may be necessary)  and absence of frequent summer water (distance from water-loving plants)";
$expand{"DRN,DRY,IRR,SHD"}="excellent drainage (modification of compacted or other water-holding soils may be necessary), moderate summer watering, absence of frequent summer water (distance from water-loving plants), and full or part shade (morning and winter sun may be tolerated";
$expand{"DRN,DRY,SHD"}="excellent drainage (modification of compacted or other water-holding soils may be necessary), absence of frequent summer water (distance from water-loving plants), and full or part shade (morning and winter sun may be tolerated)";
$expand{"DRN,DRY,SUN"}="excellent drainage (modification of compacted or other water-holding soils may be necessary), absence of frequent summer water (distance from water-loving plants), and full or nearly full sun (tolerates summer afternoon sun)";
$expand{"DRN,DRY July to October,SHD"}="excellent drainage (modification of compacted or other water-holding soils may be necessary), absence of frequent summer water (distance from water-loving plants) from July to October, and full or part shade (morning and winter sun may be tolerated)";
$expand{"DRN,DRY July to September,SHD"}="excellent drainage (modification of compacted or other water-holding soils may be necessary), absence of frequent summer water (distance from water-loving plants) from July to September, and full or part shade (morning and winter sun may be tolerated)";
$expand{"DRN,DRY July to September,part SHD"}="excellent drainage (modification of compacted or other water-holding soils may be necessary), absence of frequent summer water (distance from water-loving plants) from July to September, and part shade (morning and winter sun may be tolerated)";
$expand{"DRN,DRY July to September,SHD"}="excellent drainage (modification of compacted or other water-holding soils may be necessary), absence of frequent summer water (distance from water-loving plants) from July to September, and full or part shade (morning and winter sun may be tolerated)";
$expand{"DRN,summer DRY,SHD"}="excellent drainage (modification of compacted or other water-holding soils may be necessary), absence of frequent summer water (distance from water-loving plants), and full or part shade (morning and winter sun may be tolerated)";
$expand{"DRN,SHD,summerDRY"}="excellent drainage (modification of compacted or other water-holding soils may be necessary), absence of frequent summer water (distance from water-loving plants), and full or part shade (morning and winter sun may be tolerated)";
$expand{"DRN,mid summer DRY,SHD"}="excellent drainage (modification of compacted or other water-holding soils may be necessary), absence of mid summer water (distance from water-loving plants), and full or part shade (morning and winter sun may be tolerated)";

$expand{"DRN,part SHD"}="excellent drainage (modification of compacted or other water-holding soils may be necessary) and part shade (morning and winter sun may be tolerated)";
$expand{"DRN,some IRR"}="excellent drainage (modification of compacted or other water-holding soils may be necessary)  and occasional moderate summer watering";
$expand{"DRN,summerDRY"}="excellent drainage (modification of compacted or other water-holding soils may be necessary)  and absence of frequent summer water (distance from water-loving plants)";
$expand{"DRN,summerDRY,winterIRR"}="excellent drainage (modification of compacted or other water-holding soils may be necessary),  absence of frequent summer water (distance from water-loving plants), and watering in winter";
$expand{"DRN,IRR or WET"}="excellent drainage (modification of compacted or other water-holding soils may be necessary) and moderate summer watering or continuously moist or wet soil";
$expand{"DRN,IRR or part SHD"}="excellent drainage (modification of compacted or other water-holding soils may be necessary) and moderate summer watering or part shade";
$expand{"DRN,IRR or WET,SHD"}="excellent drainage (modification of compacted or other water-holding soils may be necessary), full or part shade (morning and winter sun may be tolerated) and moderate summer watering or continuously moist or wet soil";
$expand{"DRN,IRR or WET,SHD"}="excellent drainage (modification of compacted or other water-holding soils may be necessary), moderate summer watering or continuously moist or wet soil, and full or part shade (morning and winter sun may be tolerated)";
$expand{"DRN,IRR"}="excellent drainage (modification of compacted or other water-holding soils may be necessary)  and moderate summer watering";
$expand{"DRN,IRR,SHD"}="excellent drainage (modification of compacted or other water-holding soils may be necessary), moderate summer watering, and full or part shade (morning and winter sun may be tolerated)";
$expand{"DRN,IRR,SHD,WET"}="excellent drainage (modification of compacted or other water-holding soils may be necessary), moderate summer watering, full or part shade (morning and winter sun may be tolerated, and continuously moist or wet soil";
$expand{"DRN,IRR,SUN"}="excellent drainage (modification of compacted or other water-holding soils may be necessary),  moderate summer watering, and full or nearly full sun (tolerates summer afternoon sun)";
$expand{"DRN,SHD or IRR"}="excellent drainage (modification of compacted or other water-holding soils may be necessary)  and moderate summer watering or full or part shade (morning and winter sun may be tolerated)";
$expand{"DRN,SHD"}="excellent drainage (modification of compacted or other water-holding soils may be necessary) and full or part shade (morning and winter sun may be tolerated)";
$expand{"DRN,SHD,WET"}="excellent drainage (modification of compacted or other water-holding soils may be necessary),  part shade (morning and winter sun may be tolerated), and  continuously moist or wet soil";
$expand{"DRN,SUN"}="excellent drainage (modification of compacted or other water-holding soils may be necessary) and full or nearly full sun (tolerates summer afternoon sun)";
$expand{"DRN,WET or IRR"}="excellent drainage (modification of compacted or other water-holding soils may be necessary) and moderate summer watering or continuously moist or wet soil";
$expand{"DRN,WET or IRR,SHD"}="excellent drainage (modification of compacted or other water-holding soils may be necessary), full or part shade (morning and winter sun may be tolerated) and moderate summer watering or continuously moist or wet soil";
$expand{"DRN,WET"}="excellent drainage (modification of compacted or other water-holding soils may be necessary) and continuously moist or wet soil";
$expand{"DRY"}="absence of frequent summer water (distance from water-loving plants)";
$expand{"DRY,SHD"}="absence of frequent summer water (distance from water-loving plants) and full or part shade (morning and winter sun may be tolerated)";
$expand{"DRY,SUN"}="absence of frequent summer water (distance from water-loving plants), and full or nearly full sun (tolerates summer afternoon sun)";
$expand{"IRR or WET"}="moderate summer watering or continuously moist or wet soil";
$expand{"IRR or WET,SHD"}="full or part shade (morning and winter sun may be tolerated) and moderate summer watering or continuously moist or wet soil";
$expand{"IRR or WET,SUN"}="moderate summer watering or continuously moist or wet soil and full or nearly full sun (tolerates summer afternoon sun)";
$expand{"IRR"}="moderate summer watering";
$expand{"IRR,SHD"}="full or part shade (morning and winter sun may be tolerated) and moderate summer watering";
$expand{"IRR,part SHD"}="part shade (morning and winter sun may be tolerated) and moderate summer watering";
$expand{"part SHD"}="part shade (morning and winter sun may be tolerated)";
$expand{"IRR,SHD,WET"}="full or part shade (morning and winter sun may be tolerated), moderate summer watering, and continuously moist or wet soil";
$expand{"IRR,SUN"}="moderate summer watering, and full or nearly full sun (tolerates summer afternoon sun)";
$expand{"IRR or WET,part SHD"}="moderate summer watering or continuously moist or wet soil and part shade (morning and winter sun may be tolerated),";
$expand{"IRR to WET,SUN"}="moderate summer watering or continuously moist or wet soil, and full or nearly full sun (tolerates summer afternoon sun)";
$expand{"IRR,SUN"}="moderate summer watering, and full or nearly full sun (tolerates summer afternoon sun)";
$expand{"SHD"}="full or part shade (morning and winter sun may be tolerated)";
$expand{"SHD,IRR"}="full or part shade (morning and winter sun may be tolerated) and moderate summer watering";
$expand{"SHD,WET or IRR"}="full or part shade (morning and winter sun may be tolerated) and moderate summer watering or continuously moist or wet soil";
$expand{"SHD,WET"}="full or part shade (morning and winter sun may be tolerated) and continuously moist or wet soil";
$expand{"SUN"}="full or nearly full sun (tolerates summer afternoon sun)";
$expand{"SUN,IRR or WET"}="moderate summer watering or continuously moist or wet soil and full or nearly full sun (tolerates summer afternoon sun)";
$expand{"SUN,WET or IRR"}="moderate summer watering or continuously moist or wet soil and full or nearly full sun (tolerates summer afternoon sun)";
$expand{"SUN,WET"}="full or nearly full sun (tolerates summer afternoon sun) and  continuously moist or wet soil";
$expand{"SUN, water"}="full or nearly full sun (tolerates summer afternoon sun) and  immersion";
$expand{"WET or IRR"}="moderate summer watering or continuously moist or wet soil";
$expand{"WET"}="continuously moist or wet soil";
$/="";
$path_to_rlm="/usr/local/web/ucjeps_data/ucjeps_data/";
open(IN,"${path_to_rlm}new_pop_hort.out") || die "couldnt open hort\n";

use CGI;
        $query = new CGI;                        # create new CGI object
        print $query->header;                    # create the HTTP header
        tie(%NAME_CODE, "BerkeleyDB::Hash", -Filename=>"/usr/local/web/ucjeps_data/ucjeps_data/name_to_code", -Flags=>DB_RDONLY)|| die "$!";
	#tie(%NAME_CODE, "BerkeleyDB::Hash", -Filename=>"/usr/local/web/ucjeps_data/ucjeps_data/name_to_code")|| die "$!";
	tie(%TID_TO_NAME, "BerkeleyDB::Hash", -Filename=>"/usr/local/web/ucjeps_data/ucjeps_data/TID_TO_NAME", -Flags=>DB_RDONLY)|| die "$!";
	#tie(%TID_TO_NAME, "BerkeleyDB::Hash", -Filename=>"/home/rlmoe/TID_TO_NAME")|| die "$!";
if($query->param(taxon)){
$this_taxon=  $query->param(taxon);
#Sep 25 2020
$this_taxon=~s/[^A-Za-z ]//g;
print <<EOP;
<html>
<head>
<title>
UCJEPS: Entry from Jepson Horticultural Database for $this_taxon
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
plant names,
Horticulture,
Sunset Climate Zones
">

</head>
<body BGCOLOR="#FFFFFF" text="#663300">
<table bgcolor="#f0f0f0" align="left" border=0 width="100%">
<TR>
<Td>
<font size="3">
&nbsp;
&nbsp;
<strong>
$page_top
</strong>
&nbsp;
&nbsp;
</font>
</Td>
</TR>
</table>
<br>
&nbsp;
EOP
	$tid= $query->param(taxon);
#Sep 25 2020
	$tid=~s/[^A-Za-z0-9]//g;
$tid=~s/ [xX] / \327 /;
#print $tid;
	$tid= $NAME_CODE{$tid} if $tid=~/[A-Z][a-z]/;
#print $tid, "<br>";
if($tid=~/^\d+$/){
	while(<IN>){
		($name)=m/^(\d+)/;
		if($tid == $name){
#print "name: $name\n";
			%req=();
			%req_hash=();
			%req_hash_EW=();
			chomp;
			@lines=split(/\n/);
#print join("<br>",@lines);
			($first_line=shift(@lines))=~s/.*\t//;
			@first_codes=split("",$first_line);
			$LF_line = pop(@lines) if $lines[$#lines]=~/LF:/;
			$last_line = pop(@lines) unless $lines[$#lines]=~/\d\d\d\d$/;
			foreach(@lines){
				($taxon_id, $req, $string)=split(/\t/);
				$req{$req}=$string;
			}
			foreach $i (0 .. 23){
				@req_tally_EW=();
				if($first_codes[$i] == 2){
					foreach $requirement (sort(keys(%req))){
						if(substr($req{$requirement},$i,1)==1){
							push(@req_tally_EW,$requirement);
						}
					}
					$field=$i+1;
					$req_hash_EW{join(",",@req_tally_EW)} .= "$field ";

		
				}
			}
			foreach $i (0 .. 23){
#print "$i";
				@req_tally=();
				if($first_codes[$i] == 1){
#print "$i<br>";
					foreach $requirement (sort(keys(%req))){
						if(substr($req{$requirement},$i,1)==1){
#print "req $requirement<br>";
							push(@req_tally,$requirement);
						}
					}
					$field=$i+1;
					$req_hash{join(",",@req_tally)} .= "$field ";

		
				}
			}
			print "\n<table border=1 width=\"75%\" align=\"center\" bgcolor=\"#ddffdd\"><tr><td> <table  align=\"center\"><tr><td><h2 align=center><img src=\"/hort_symbol.gif\"><br>Information from the Jepson Horticultural Database for<br><em>$TID_TO_NAME{$name}</em></h2>\n";
			%SO=();
%seen_req=();
			foreach(keys(%req_hash_EW), keys(%req_hash)){
#print "<br>$_\n";
push(@req_hash,$_) unless $seen_req{$_}++;
}
			#@req_hash = keys(%req_hash_EW), keys(%req_hash);
			foreach(@req_hash){
#print "<br>$_\n";
				$SO{$_}=s/,/,/g;
			}
			foreach(sort {$SO{$a}<=>$SO{$b} || $a cmp $b}(@req_hash)){
				$req_header= $expand{$_} || $_;
#$pluses= "zone @pluses" if $#pluses==0;
#$pluses= "zones " . join(", " , @pluses) if $#pluses>0;
#$minuses= "zone @minuses" if $#minuses==0;
#$minuses= "zones " . join(", " , @minuses) if $#minuses>0;
$req_hash{$_}=~s/(\d+) /$1, /g;
$req_hash{$_}=~s/(.*)(\d+), (\d+), (\d+)[, ]*$/zones $1$2, $3, and $4/||
$req_hash{$_}=~s/(\d+), (\d+)[ ,]*$/ zones $1 and $2/||
$req_hash{$_}=~s/(\d)[, ]*/ zone $1/;
$req_hash_EW{$_}=~s/(\d+) /$1, /g;
$req_hash_EW{$_}=~s/(.*)(\d+), (\d+), (\d+)[, ]*$/zones $1$2, $3, and $4/||
$req_hash_EW{$_}=~s/(\d+), (\d+)[ ,]*$/ zones $1 and $2/||
$req_hash_EW{$_}=~s/(\d+)[ ,]*/ zone $1/;


				if($req_hash_EW{$_} && $req_hash{$_}){
				$req_hash{$_}=~s/, *$//;
					print " <P>Given $req_header, grows especially well in <strong>$req_hash_EW{$_}</strong>\n and also in $req_hash{$_}.\n";# if $req_header=~/[A-Z][A-Z]/;
				}
				elsif($req_hash_EW{$_}){
					print "<P> Given $req_header, grows especially well in <strong>$req_hash_EW{$_}</strong>.\n";
				}
				elsif($req_hash{$_}){
					print "<P> Given $req_header, grows in $req_hash{$_}.\n ";
				}
			}
			if($last_line=~/TRY/){
				print "<P>$expand{'TRY'}\n";
			}
			if($last_line=~/DFCLT/){
				print "<P>$expand{'DFCLT'}\n";
			}
			if($last_line=~/CVS/){
				print "<P>$expand{'CVS'}\n";
			}
			if($last_line=~/In cult/){
				print "<P>$expand{'In cult'}\n";
			}
			if($last_line=~/STBL/){
				print "<P>$expand{'STBL'}\n";
			}
			if($last_line=~/GRCVR/){
				print "<P>$expand{'GRCVR'}\n";
			}
			if($last_line=~/INV/){
			if($last_line=~/can be INV/){
				print "<P>Can be $expand{'INV'}\n";
}
else{
				print "<P>$expand{'INV'}\n";
}
			}
if($last_line=~/DRY/){
foreach($last_line){
if(m/DRN, DRY, SHD/){
print " including  $expand{'DRN,DRY,SHD'}\n";
}
elsif(m/DRN, DRY, SUN/){
print " including  $expand{'DRN,DRY,SUN'}\n";
}
elsif(m/DRN, DRY/){
print " including  $expand{'DRN,DRY'}\n";
}
elsif(m/DRN, IRR: pots and rock gardens only; DRY when dormant/){
print " including  well drained soil, summer watering (pots and rock gardens only), and no watering during dormancy\n";
}
elsif(m/DRY/){
print " including  $expand{'DRY'}\n";
}
}
}

print "</td></tr></table></td></tr></table>\n";
last;
		}
	}
}
else{
print "name not found";
}
			($treatment_name=$TID_TO_NAME{$name})=~s/ /+/g;
($cp_name=$treatment_name)=~s/subsp/ssp/;


	open(IN,"${path_to_rlm}hort_comments") || die "couldnt open hort\n";
local($/)="";
$h_comment="";
while(<IN>){
if(s/^$tid\n//o){
$h_comment=qq{<LI><a href="/cgi-bin/get_hort.pl?comment=$tid">Read user comments</a>};
$h_comment=qq{<LI>&nbsp;<table border=1 bgcolor="#eeeeee"><tr><th>Comment from user:</th></tr><tr><td>$_</td></tr></table>};
last;
}
}
close(IN);

print <<EOP;
<a href="http://ucjeps.berkeley.edu/cgi-bin/get_JM_treatment.pl?$treatment_name">Treatment in The Jepson Manual</a>
<br>
<a href="http://ucjeps.berkeley.edu/cgi-bin/get_cpn.pl?$treatment_name">Jepson Interchange</a>
<br>
<a href="http://ucjeps.berkeley.edu/db/horticulture/index.html">Horticulture query page</a>
<br>
<a href="http://www.sunset.com/sunset/web/Sponsors/Garden/sunsetmonrovia_r1/html
files/zone_map3.html">Sunset climate zone information</a> [link to Sunset Magazine]
<br>
<a href="http://calphotos.berkeley.edu/cgi/img_query?where-genre=Plant&where-taxon=$cp_name">CalPhotos</a> [link to images]

<br>
<UL>
<LI><a href="mailto:rlmoe\@uclink4.berkeley.edu?subject=get_hort, $treatment_name">Send your comments on this page to The Jepson Herbarium</a>
$h_comment
</UL>

$trailer
EOP
}
else{
	open(IN,"${path_to_rlm}new_pop_hort.out") || die "couldnt open hort\n";
        @names = $query->param;
	@zones= $query->param(zone);
	@quals= $query->param(qual);
	if($zones[0] eq "All"){
	}
	@requirements= $query->param(req);
$/="";
if(grep(/WELL/,@quals)){
	$ews="2";
}
else{
$ews="[21]";
}
@ews=(".") x 24;
	foreach $zone (@zones){
		next unless $zone=~m/^[1-9][0-9]?$/;
		#next unless $zone=~m/^[0-9]$/;
$ews[$zone-1]=$ews;
	}
$zone_string=join("",@ews);

if(@requirements){
foreach(@requirements){
next unless m/^[!A-Z]+$/;
	#$qs="........................";
@qs=(".") x 24;
	$pattern="$_\t";
	foreach $zone (@zones){
		#substr($qs,$zone-1,1)=1;
$qs[$zone-1]=1;
	}
	$pattern .= join("",@qs);
	if($big_pattern){ $big_pattern .= " && m/$pattern/ ";}
	else{$big_pattern = " m/$pattern/ ";}
}
if($big_pattern){
$program=<<EOP;
if($big_pattern){
	if(m/^(\\d+)\\t\\t$zone_string/){
		#print "<br>", \$TID_TO_NAME{\$1} || \$1, "\\n";
		print qq{<br><a href="http://ucjeps.berkeley.edu/cgi-bin/get_hort.pl?taxon=\$1">\$TID_TO_NAME{\$1}</a>\\n};
	}
}
EOP
}
else{
$program=<<EOP;
	if(m/^(\\d+)\\t\\t+$zone_string/){
		#print "<br>\$TID_TO_NAME{\$1}\\n";
		#print "<br>", \$TID_TO_NAME{\$1} || \$1, "\\n";
		print qq{<br><a href="http://ucjeps.berkeley.edu/cgi-bin/get_hort.pl?taxon=\$1">\$TID_TO_NAME{\$1}</a>\\n};
	}
EOP
}
}
else{
	$qs="........................";
	#foreach $zone (@zones){
		#substr($qs,$zone-1,1)="1";
	#}
	$program=<<EOP;
	if(m/^(\\d+)\\t\\t+$zone_string/){
		print qq{<br><a href="http://ucjeps.berkeley.edu/cgi-bin/get_hort.pl?taxon=\$1">\$TID_TO_NAME{\$1}</a>\\n};
	}
EOP
}

print <<EOP;
<head>
<title>
UCJEPS: Entry from Jepson Horticultural Database
</title>
</head>
<body BGCOLOR="#FFFFFF" text="#663300">
<table bgcolor="#f0f0f0" align="left" border=0 width="100%">
<TR>
<Td>
<font size="3">
&nbsp;
&nbsp;
<strong>
$page_top
</strong>
&nbsp;
&nbsp;
</font>
</Td>
</TR>
</table>
<br>
&nbsp;
			<table border=1 width="75%" align="center" bgcolor="#ddffdd"><tr><td><table align="center" width="100%"><tr><td>
<H2 align="center">Jepson Horticultural Database<br>Results page</h2>
EOP
print "ZONES: ", join(", ",@zones),"<br>" if @zones;
print "REQUIREMENTS: ", join(", ",@requirements),"<br>" if @requirements;

if(grep(/DFCLT/,@quals)){
$program=~s|^|next if m/DFCLT/;|;
}
if(grep(/GRCVR/,@quals)){
$program=~s|^|next unless m/GRCVR/;|;
}
if(grep(/^CULT/,@quals)){
$program=~s!^!next unless m/\\tCVS|cult/;!;
}
if(grep(/INV/,@quals)){
$program=~s|^|next if m/INV/;|;
}
    foreach $lf (qw(
annual
aquatic
biennial
bulb
cactus
carnivorous
evergreen
fern
grass
parasite
perennial
shrub
subshrub
succulent
tree
vine
    )){
    if(grep(/$lf/,@quals)){
    $program=~s|^|next unless m/LF:.*\\b$lf/;\n|;
    }
    }
$program="while(<IN>){ next if m/^\t\t/; $program}";
	eval($program);

#print join("<P>", @zones, @requirements);
			#if($ENV{'REMOTE_ADDR'}=~/128.32.108.250/ ){
#print "<P>$program";
#}
	open(IN,"${path_to_rlm}hort_comments") || die "couldnt open hort\n";
local($/)="";
while(<IN>){
if(s/^$tid\n//o){
$h_comment=qq{<LI><a href="/cgi-bin/get_hort.pl?comment=$tid">Read user comments</a>};
$h_comment=qq{<LI>Comment from user:<br>$_};
last;
}
else{
$h_comment="";
}
}
close(IN);
print qq{</table></td></tr></table><br> <UL> <LI><a href="mailto:rlmoe\@uclink4.berkeley.edu?subject=get_hort, list">Send your comments on this page to The Jepson Herbarium</a> $h_comment</UL>$trailer};
# &nbsp;The query is: $program$trailer};
}
