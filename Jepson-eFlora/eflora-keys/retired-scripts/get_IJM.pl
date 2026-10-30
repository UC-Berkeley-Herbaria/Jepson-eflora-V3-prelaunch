#!/usr/bin/perl
use BerkeleyDB;
use CGI;
$query = new CGI;                        # create new CGI object
$data_path	="/usr/local/web/ucjeps_data/ucjeps_data/";

#tie(%IJM_key, "BerkeleyDB::Hash", -Filename=>"${data_path}IJM_expanded.hash")|| die "Stopped; couldnt open IJM_expanded\n";
#tie(%IJM, "BerkeleyDB::Hash", -Filename=>"${data_path}IJM.hash")|| die "Stopped; couldnt open IJM\n"; #file with hash data for eflora treatments, not longer used
tie(%IJM_key, "BerkeleyDB::Hash", -Filename=>"${data_path}IJM_key.hash")|| die "Stopped; couldnt open IJM_key\n";

$kwid_file="/usr/local/web/ucjeps_data/ucjeps_data/interchange_KWID";
        tie(%kwid_hash, "BerkeleyDB::Hash", -Filename=>$kwid_file, -Flags=>DB_RDONLY)|| print "Couldnt open $kwid_file: $!";

$today=localtime();
$today=~s/^[^ ]* //;
$today=~s/\d\d:\d\d:\d\d //;


open(IN, "${data_path}smasch_taxon_ids.txt") || die;
while(<IN>){
	chomp;
	($code,$name,@residue)=split(/\t/);
	$TNOAN{$name}=$code;
	$NAN{$code}=$name;
}

###This is the block that is executed if they give the parameter 'tid'
###formerly, this is what would print the treatment
###now, I am doing a 301 redirect to the PHP pages
if($query->param('tid')){
	$TID= $query->param('tid');
	#if the TID is a string, format the string
	if($TID=~/[A-Za-z]+/){
		($lookfor=$TID)=~s/%20/ /g;
		$lookfor=~s/\+/ /g;
		$lookfor=~s/ X / &times;/g;
		$lookfor=~s/ %[Dd]7 / &times;/g;
		$lookfor=~s/ x / &times;/g;
		$lookfor=~s/^([A-Z]+)/\u\L$1/g;
		$lookfor=~s/[Ss]sp\./subsp./;
		$TID=$TNOAN{$lookfor} || 0; #change the string to the corresponding number, else set to zero if the name doesn't have a matching TID
	}

	#regardless of whether the TID is valid or not, redirect to eflora_display.php
	#if it's valid, they will see the taxon page, if not they will get the same error message
	if($TID=~/^\d[ 0-9,]*$/){
		use CGI;
		$q = new CGI;
		print $q->redirect(
			-location => "http://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=$TID",
			-status => 301
		);
	}


}
#else, print the key
else{
	if($query->param('key')){
		$TID= $query->param('key');
		if($TID=~/^\d[ 0-9,]*$/){
			print $query->header;                    # create the HTTP header
			print <<EOP;
<html xmlns="http://www.w3.org/1999/xhtml">


<head><title>Jepson Herbarium: Jepson Flora Project: Jepson eFlora Keys</title> 
<link href="http://ucjeps.berkeley.edu/common/styles/dropdowns.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-27128382-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-43909100-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
</head>

<body onload="initialize()">
<!-- Begin banner -->
<table class="banner" width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="5" align="center" valign="middle">&nbsp;</td>
  </tr>
  <tr>
    <td rowspan="5" width="12" align="center" valign="middle"></td>
    <td rowspan="3" width="120" align="center" valign="middle">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td rowspan="3" width="120" align="center" valign="middle">
      <a href="http://ucjeps.berkeley.edu/jeps/"><img src="http://ucjeps.berkeley.edu/common/images/JepsonLogoSmall.png" alt="Jepson Herbarium (JEPS)" width="100" height="100" border="0" /></a></td>
    <td rowspan="5" width="12" align="center" valign="middle"></td>
  </tr>

  <tr>
    <td align="center" valign="middle"><span class="bannerTitle">The Jepson Herbarium</span><br /></td>
  </tr>

  <tr>
     <td align="center" valign="top"><a href="http://www.berkeley.edu" class="bannerTagLine">University of California, Berkeley</a></td>
  </tr>

  <tr>
    <td align="center">&nbsp;</td>
    <td height="14" align="center"></td>
    <td align="center"><a href="http://ucjeps.berkeley.edu/jeps/" class="logoText">Jepson&nbsp;Herbarium</a></td>
  </tr>

  <tr>
    <td colspan="3" align="center"></td>
  </tr>
  
  <tr>
    <td height="8" colspan="5" align="center">&nbsp;</td>
  </tr>

  <tr class="bannerBottomBorder">
  	<td colspan="6" height="3"></td>
  </tr>

  <tr>
    <td colspan="6"><img src="/common/images/common_spacer.gif" alt="" width="1" height="1" border="0" /></td>
  </tr>
</table>  
<!-- End banner -->


<div id="content-top">
<table border="0">
   <tr>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td><span class="pageName"><a href="http://ucjeps.berkeley.edu/eflora/">Jepson eFlora:</a> Key page</span></td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
   </tr>
   <tr>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td><span class="pageMajorHeading"><a name="TOP" id="TOP">Vascular Plants of California</a></span>
		<br>
			<span class="pageAuthorLine">
				<a href="http://ucjeps.berkeley.edu/IJM_fam_key.html">Key to families</a>
				|
				<a href="http://ucjeps.berkeley.edu/IJM_toc.html">Table of families and genera</a>
			</span>	  
		</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
   </tr>
   <tr>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>
EOP

#this fill the species list based on the IJM table, which does not exist anymore.  Something has to be created for this to be usable again
	if($IJM_key{$TID}){
		$key= $IJM_key{$TID};
		$key=~s!<a href="#(\d+)!<a href="http://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=$1!g;
		$entry=$IJM{$TID};

			if($entry=~s/<sp_list>(.*)<\/sp_list>//){
				@taxa=split(/,/,$1);
				foreach(@taxa){
				s!.*!<OPTION VALUE="http://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=$&">$NAN{$&}\n!;
				}
			}

		$entry=~s/<br><b>/<b>/g;
		$entry=&dist_expand($entry);
		$entry=~s/orth\. variety/orth. var./g;

	print "<h2>Key to $NAN{$TID}</h2>";

	print "<a href='http://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=$TID'><h3>View taxon page for $NAN{$TID}</h3></a>";

		unless($NAN{$TID}=~/aceae$/){
			print "<p class=bodyText>(For a list of species in $NAN{$TID}, use the above link.)</p>";
		}

	print "<p class=bodyText>Jepson Manual glossary definitions can be seen by moving your cursor over words underlined with dots.</p>";

		$key=&dist_expand($key);

	print $key;
	print <<EOP;
<p>
<a href="&#109;&#97;&#105;&#108;to:rosatti&#064;berkeley.edu?subject=eFlora comment"><font size=3 color="red">Contact/Feedback</font></a>
</p>
<p class=bodyText>
Citation for the whole project: Jepson Flora Project (eds.) [year] <em>Jepson eFlora</em>,  http://ucjeps.berkeley.edu/eflora/ [accessed on month, day, year]
</p>
<p class=bodyText>
Citation for an individual treatment:  [Author of taxon treatment] [year]. [Taxon name] in Jepson Flora Project (eds.) <em>Jepson eFlora</em>, [URL for treatment]. Accessed on [month, day, year].
</p>
<p class=bodyText>
We encourage links to these pages, but the content may not be downloaded for reposting, repackaging, redistributing, or sale in any form, without written permission from The Jepson Herbarium.
</p>

		</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
   </tr>
</table>


<hr>

EOP
	}#if($IJM_key{$TID}){
	else{
			print <<EOP;
<html xmlns="http://www.w3.org/1999/xhtml">


<head><title>Jepson Herbarium: Jepson Flora Project: Jepson eFlora Keys</title> 
<link href="http://ucjeps.berkeley.edu/common/styles/dropdowns.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-27128382-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-43909100-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
</head>
<!-- Begin banner -->
<table class="banner" width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="5" align="center" valign="middle">&nbsp;</td>
  </tr>
  <tr>
    <td rowspan="5" width="12" align="center" valign="middle"></td>
    <td rowspan="3" width="120" align="center" valign="middle">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td rowspan="3" width="120" align="center" valign="middle">
      <a href="http://ucjeps.berkeley.edu/jeps/"><img src="http://ucjeps.berkeley.edu/common/images/JepsonLogoSmall.png" alt="Jepson Herbarium (JEPS)" width="100" height="100" border="0" /></a></td>
    <td rowspan="5" width="12" align="center" valign="middle"></td>
  </tr>

  <tr>
    <td align="center" valign="middle"><span class="bannerTitle">The Jepson Herbarium</span><br /></td>
  </tr>

  <tr>
     <td align="center" valign="top"><a href="http://www.berkeley.edu" class="bannerTagLine">University of California, Berkeley</a></td>
  </tr>

  <tr>
    <td align="center">&nbsp;</td>
    <td height="14" align="center"></td>
    <td align="center"><a href="http://ucjeps.berkeley.edu/jeps/" class="logoText">Jepson&nbsp;Herbarium</a></td>
  </tr>

  <tr>
    <td colspan="3" align="center"></td>
  </tr>
  
  <tr>
    <td height="8" colspan="5" align="center">&nbsp;</td>
  </tr>

  <tr class="bannerBottomBorder">
  	<td colspan="6" height="3"></td>
  </tr>

  <tr>
    <td colspan="6"><img src="/common/images/common_spacer.gif" alt="" width="1" height="1" border="0" /></td>
  </tr>
</table>  
<!-- End banner -->



<div id="content-top">
<table border="0">
   <tr>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
   </tr>
	<tr>
		<td><span class="pageName"><a href="http://ucjeps.berkeley.edu/eflora/">Jepson eFlora:</a> Taxon page</span></td>

	</tr>
	<tr>
       <td><span class="pageMajorHeading"><a name="TOP" id="TOP">Vascular Plants of California</a></span>
		<br>
			<span class="pageAuthorLine">
				<a href="http://ucjeps.berkeley.edu/IJM_fam_key.html">Key to families</a>
				|
				<a href="http://ucjeps.berkeley.edu/IJM_toc.html">Table of families and genera</a>
			</span>	  
		</td>
	</tr>
</table>
KEY NOT FOUND

EOP
	}

		}#if($TID=~/^\d[ 0-9,]*$/){	
		else{
	if($TID=~/[A-Za-z]+/){
		($lookfor=$TID)=~s/%20/ /g;
		$lookfor=~s/\+/ /g;
		$lookfor=~s/ X / \327 ?/g;
		$lookfor=~s/ %[Dd]7 / \327 ?/g;
		$lookfor=~s/ &times; ?/ \327/g;
		$lookfor=~s/ x / \327 ?/g;
		$lookfor=~s/^([A-Z]+)/\u\L$1/g;
		$lookfor=~s/[Ss]sp\./subsp./;
		$TID=$TNOAN{$lookfor} || 0; #change the string to the corresponding number, else set to zero if the name doesn't have a matching TID
	}

	#regardless of whether the TID is valid or not, redirect to eflora_display.php
	#if it's valid, they will see the taxon page, if not they will get the same error message
	if($TID=~/^\d[ 0-9,]*$/){
		use CGI;
		$q = new CGI;
		print $q->redirect(
			-location => "http://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=$TID",
			-status => 301
		);
	}
		}


	}#if($query->param('key')){
}#if($query->param('tid')){
sub dist_expand {
local($_)=shift;
s/CA-FP/California Floristic Province/g;
s/\bNCo\b/North Coast/g;
s/\bNCoR\b/North Coast Ranges/g;
s/\bNCoRO\b/Outer North Coast Ranges/g;
s/\bNCoRI\b/Inner North Coast Ranges/g;
s/\bNCoRH\b/High North Coast Ranges/g;
s/\bCaR\b/Cascade Range/g;
s/\bCaRF\b/Cascade Range Foothills/g;
s/\bCaRH\b/High Cascade Range/g;
s/\bSN\b/Sierra Nevada/g;
s/\bSNE\b/East of Sierra Nevada/g;
s/\bSNF\b/Sierra Nevada Foothills/g;
s/\bSNH\b/High Sierra Nevada/g;
s/\bTeh\b/Tehachapi Mountain Area/g;
s/\bGV\b/Great Central Valley/g;
s/\bScV\b/Sacramento Valley/g;
s/\bSnJV\b/San Joaquin Valley/g;
s/\bSnGb\b/San Gabriel Mountains/g;
s/\bSW\b/Southwestern California/g;
s/\bSCo\b/South Coast/g;
s/\bChI\b/Channel Islands/g;
s/\bPR\b/Peninsular Ranges/g;
s/\bWTR\b/Western Transverse Ranges/g;
s/\bTR\b/Transverse Ranges/g;
s/\bSnJt\b/San Jacinto Mountains/g;
s/\bSCoR\b/South Coast Ranges/g;
s/\bSCoRO\b/Outer South Coast Ranges/g;
s/\bSCoRI\b/Inner South Coast Ranges/g;
s/\bCW\b/Central Western California/g;
s/\bSCoR\b/South Coast Ranges/g;
s/\bCCo\b/Central Coast/g;
s/\bSnFrB\b/San Francisco Bay Area/g;
s/\bNW\b/Northwestern California/g;
s/\bKR\b/Klamath Ranges/g;
s/\bGB\b/Great Basin Floristic Province/g;
s/\bWrn\b/Warner Mountains/g;
s/\bMP\b/Modoc Plateau/g;
s/\bW&I\b/White and Inyo Mountains/g;
s/\bD([,;( ])/Desert$1/g;
s/\nD([.;])/\nDesert$1/g;
s/\bD\.\n/Desert.\n/g;
s/\bDMoj\b/Mojave Desert/g;
s/\bDMtns\b/Desert Mountains/g;
s/\bDSon\b/Sonoran Desert/g;
s/\bCA\b/California/g;
s/\bSnBr\b/San Bernardino Mountains/g;
$_;
}
