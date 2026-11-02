<?php
date_default_timezone_set('America/Los_Angeles');

//Security mod to prevent cross-site scripting attacks
	$TaxonID = htmlspecialchars($_GET["key"]);
	$TaxonID = str_replace(chr(0),"", $TaxonID);  #NULL BYTES
	$TaxonID = trim($TaxonID, $character_mask = " \t\n\r\0\x0B");
	$TaxonID = preg_replace("/[^0-9]/", "", $TaxonID);


require 'config/config.php';
$db = new SQLite3($database_location);

$results = $db->query('SELECT ID, TaxonID, ScientificName, HasKey, KeyText 
						FROM eflora_keys
						WHERE TaxonID='.$TaxonID.''); //16711 is the TaxonID for Calochortus amabilis, for example

while ($row = $results->fetchArray()) {


$ID = $row['ID'];
$TID = $row['TaxonID'];
$ScientificName = $row['ScientificName'];
$FormattedKey = $row['KeyText'];
$has_key = $row['HasKey'];

//var_dump($row); 
/*var_dump prints the whole row in a databased format
which is useful for seeing what you're getting
but is pretty ugly
*/

}

	
//Before doing anything, if the TID isn't recognized, give a plain error screen
if (!$TID){ //if TaxonID (pulled from URL) did not match a line in the database...
  echo "Taxon not recognized TID=".$TaxonID;


header("Location: https://ucjeps.berkeley.edu/cgi-bin/get_cpn.pl?".$TaxonID, true, 301);
exit();

}
?>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<?php 
// TID is passed to JS by using PHP to echo the value of $TaxonID to a JS variable TaxID 
// Apparently there are better ways to do this using AJAX
// Also, the header needs some work

?>

<head>
<!--<title><?php echo "$ScientificName"?>==><?php echo "$MapName"?></title> --> <!--For variable testing-->
<title><?php echo "$ScientificName"?> key to species, Jepson eFlora</title> 
<link href="/common/styles/dropdowns.css" rel="stylesheet" type="text/css" />

<style type="text/css">

.large-image {
	box-shadow: 1px 1px 3px 3px rgba(127, 127, 127, 0.15);
	width: 140px;
	padding-left: 0px;
	padding-right: 0px;
}


.inline {
	display: inline-block;
}


.dropdown {
	display: inline;
	position: relative;
	padding: 0px;
}

.dropdown-content {
	display: none;
  position: absolute;
	text-align: center;
  background-color: #FFFFFF;
	padding-left: 9px;
	padding-right: 0px;
  width: 140px;
  box-shadow: 1px 1px 3px 3px rgba(127, 127, 127, 0.15);
  z-index: 100;
}

.dropdown-content a {
  color: black;
  padding: 0px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: black;}

.dropdown:hover .dropdown-content {display: inline;}

.dropdown:hover .dropbtn {background-color: black;}

</style>


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

<body>
<script>
window.onload = setInterval(clock,1000);
function clock(){
	var d = new Date();
	var yr = d.getFullYear();
	var month = d.getMonth();
	var monthArr = ["January", "February","March", "April", "May", "June", "July", "August", "September", "October", "November","December"];
	month = monthArr[month];
	var date = d.getDate();
  document.getElementById("year").innerHTML = yr;
  document.getElementById("month").innerHTML = month+" "+yr;
  document.getElementById("day").innerHTML = date;
}
</script>
<!-- Begin banner -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/header_jeps.php'); ?>
<!-- End banner -->

<!-- Beginning of horizontal menu -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/globalnav.php'); ?> 
<!-- End of horizontal menu -->


<div id="content">
<table border="0">
	<tr>
		<td><span class="pageName"><a href="/eflora/">Jepson eFlora:</a> Key page</span></td>

	</tr>
	<tr>
       <td><span class="pageMajorHeading"><a name="TOP" id="TOP">Vascular Plants of California</a></span>
		<br>
			<span class="pageAuthorLine">
				<a href="/IJM_fam_key.html">Key to families</a>
				|
				<a href="/IJM_toc.html">Table of families and genera</a>
			</span>	  
		</td>
	</tr>
</table>

<div id="content">
<table border="0">
   <tr>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>
<!--eFlora index-->
<?php include('common/eflora_index_bar.php'); ?>
<!--end eFlora index-->
       <td>&nbsp;</td>
       <td>&nbsp;</td>
	</tr>
   <tr>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>
<?php
$pattern = '/aceae$/';

if (isset($FormattedKey)) {
	echo '<h2>Key to '.$ScientificName.'</h2>';
	echo '<p class=bodyText><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid='.$TID.'"><h3>View taxon page for '.$ScientificName.'</h3></a></p>';
	
if (preg_match($pattern, $ScientificName)) {
    echo "<p class=bodyText>&nbsp;</p>";
}
else {
    echo '<p class=bodyText>(For a list of species in '.$ScientificName.', use the above link.)</p>';
}
	echo '<p class=bodyText>Jepson Manual glossary definitions can be seen by moving your cursor over words underlined with dots.</p>';
	echo $FormattedKey;
	echo '<p class=bodyText>&nbsp;</p>';
}
?>
<p class=bodyText>
<a href="&#109;&#97;&#105;&#108;to:rosatti&#064;berkeley.edu?subject=eFlora comment"><font size=3 color="red">Contact/Feedback</font></a>
</p>
<p class="bodyText">Citation for the whole project: Jepson Flora Project (eds.) <span id="year"></span>. Jepson eFlora, https://ucjeps.berkeley.edu/eflora/ [accessed on <span id="day"></span> <span id="month"></span>]</p> 

<p class=bodyText>
Citation for an individual treatment:  [Author of taxon treatment] [year]. [Taxon name] in Jepson Flora Project (eds.) <em>Jepson eFlora</em>, [URL for treatment]. Accessed on <span id="day"></span> <span id="month"></span> <span id="year">.</p>

<p class=bodyText>
We encourage links to these pages, but the content may not be downloaded for reposting, repackaging, redistributing, or sale in any form, without written permission from The Jepson Herbarium.
</p>

		</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
   </tr>
</table>
</div>
<!--Begin footer-->
<?php include('common/eflora_footer.php'); ?>
<!--End footer-->
</body></html>
