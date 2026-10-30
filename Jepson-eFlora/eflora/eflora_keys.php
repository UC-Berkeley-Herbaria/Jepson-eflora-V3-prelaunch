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


header("Location: https://ucjeps.berkeley.edu/cgi-bin/get_cpn?".$TaxonID, true, 301);
exit();

}
?>


<?php

date_default_timezone_set('America/Los_Angeles');

?>


<!DOCTYPE html>
 
<html lang="en"> 

<head>
<title><?php echo "$ScientificName"?> key to species, Jepson eFlora, California Flora</title> 
<meta charset="UTF-8">
<meta name="description" content="For vascular plants occurring in wildlands or otherwise outside of cultivation in California, the Jepson eFlora contains taxonomic treatments, distribution maps, illustrations, photographs, and identification keys.">
  <meta name="keywords" content="California Flora, Jepson eFlora, Flora of California, Vascular Plants of California, Jepson Flora Project, ">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="/common/css/dropdowns.css" rel="stylesheet" type="text/css" />
<link href="/common/css/jepson_eflora.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="/common/images/JepsonLogoSmall.png" type="image/x-icon" />

<!--mobile js script files-->
	<script src="/eflora/common/js/dh_custom.js"></script>

<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-T5YC99QF6Q"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-T5YC99QF6Q');
</script>

  <script>
    function myFunction() {
      var x = document.lastModified;
      document.getElementById("demo").innerHTML = x;
    }
  </script>


  <script>
    function myFunction() {
      var x = document.lastModified;
      document.getElementById("demo").innerHTML = x;

	var objToday = new Date(),
		domEnder = function() { var a = objToday; if (/1/.test(parseInt((a + "").charAt(0)))) return "th"; a = parseInt((a + "").charAt(1)); return 1 == a ? "st" : 2 == a ? "nd" : 3 == a ? "rd" : "th" }(),
		dayOfMonth = today + ( objToday.getDate() < 10) ? '0' + objToday.getDate() + domEnder : objToday.getDate() + domEnder,
		months = new Array('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'),
		curMonth = months[objToday.getMonth()],
		curYear = objToday.getFullYear();
	var today = dayOfMonth + " " + curMonth + " " + curYear;

	document.getElementById("DateA").innerHTML = today; 
	document.getElementById("DateB").innerHTML = today; 

    }
  </script>

<style type="text/css">

.large-image {
	box-shadow: 1px 1px 3px 3px rgba(127, 127, 127, 0.15);
	width: 140px;
	height: auto;
	padding-left: 0px;
	padding-right: 0px;
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

</head>

<body onload="myFunction()">

<!-- Begin banner -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/header_jeps.php'); ?>
<!-- End banner -->

<!-- Beginning of horizontal menu -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/globalnav.php'); ?> 
<!-- End of horizontal menu -->

<main>
    <div id="content-top">

<h1>Jepson eFlora Key page for <?php echo "$ScientificName"?></h1>

<!-- Begin spacer block-->
	</div>

<div id="content">
<div class="efBody">


<div class="efBody">
<!-- Begin spacer block-->
<div class="spacer_spacer_blue">
<br>
<p><a class="googleForm" href="https://docs.google.com/forms/d/e/1FAIpQLSc_wrQXqB9gNPrOgUTZ9WN38Ub08JlmgaIha7Ua99sHGzMntA/viewform">Please use this Google Form for Contact/Feedback</a>
<br>
</div>
<!-- Begin spacer block-->
<div class="spacer_spacer_blue">

<h2><a name="TOP" id="TOP">Vascular Plants of California</a></h2>
		<br>
			<p class="generalTextBold">
				<a class="efTag" href="/IJM_keys/IJM_fam_key.html">Key to families</a>
				|
				<a class="efTag" href="/IJM_keys/toc.html">Table of families and genera</a>
			</p>	  
<br>
</div>
<?php
$pattern = '/aceae$/';

if (isset($FormattedKey)) {
	echo '<h3>Key to '.$ScientificName.'</h3>';
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
</p>


</div>
</div>
</div>
<div class ="hr_line_grey">
<p class="footerText"><a href="/main/copyright.html"> Copyright</a> &copy; 2012 - <span id="currentYear"> </span>.  Regents of the University of California</p>
<p class="footerText">We encourage links to these pages, but the content may not be downloaded for reposting, repackaging, redistributing, or sale in any form, without written permission from The University and Jepson Herbaria &mdash; <a href="/eflora/termsofuse.html">Terms of Use</a>.</p>
<p class="footerText">Page last updated <span id='demo'></span>
</p>
</div>

<!-- Get current year for copyright statement -->
<script>
  var currentYear = new Date().getFullYear(); 
  document.getElementById("currentYear").innerText = currentYear; 
</script>
</body>
</html>

