<?php
date_default_timezone_set('America/Los_Angeles');

//old code
//$SearchTerm = htmlspecialchars($_GET["index"]);

//Security mod to prevent cross-site scripting attacks
  if (isset($_GET['index'])){
	$SearchTerm = $_GET['index'];
	$SearchTerm = htmlspecialchars($SearchTerm);
	$SearchTerm = str_replace(chr(0),"", $SearchTerm);  #NULL BYTES
	$SearchTerm = trim($SearchTerm, $character_mask = "\s\t\n\r\0\x0B");
	//$SearchTerm = preg_replace("/[^0-9]/", "", $SearchTerm);
  }


//connect to the database
require 'config/config.php';
$db = new SQLite3($database_location);
?>

<?php

date_default_timezone_set('America/Los_Angeles');

?>

<?php 
// TID is passed to JS by using PHP to echo the value of $TaxonID to a JS variable TaxID 
// Apparently there are better ways to do this using AJAX

?>
<!DOCTYPE html>
 
<html lang="en">  

<head>
<title>Jepson eFlora Index Page</title> 
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

<h1><a href="/eflora/">Jepson eFlora</h1></a> 
<h2>Index Page</h2>
<!-- Begin spacer block-->
	</div>

<div id="content">
<div class="efBody">

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
<!-- Begin spacer block-->
<div class="spacer_spacer_blue">

<form action="/eflora/search_eflora.php" method="POST">
<label>Scientific Name<br>
		<input type="text" id="query_text" name="query"></label>
		<input type="submit" value="Submit Name">
</form>
</div>
<!-- Begin spacer block-->
<div class="spacer_spacer_blue">

<?php
//$SearchTerm must be a single capital letter
if (preg_match("/^[A-Z]$/", $SearchTerm)) {
	echo '<br><p class="bodyText"><h1>Index Page: '.$SearchTerm.'</h1></p>';

//perform a search that returns all names that start with a letter
//this is the same query as in search_eflora.php, but with a different WHERE clause
	$stmt = $db->prepare("SELECT a.ScientificName as ScientificName, a.TaxonID as TaxonID, a.CommonName as CommonName, a.Status as Status, a.IsTerminalTaxon as IsTerminalTaxon, a.HasKey as HasKey, a.AcceptedNameTID as AcceptedNameTID, b.ScientificName as AcceptedName
						FROM eflora_taxa a
						LEFT OUTER JOIN eflora_taxa b on a.AcceptedNameTID = b.TaxonID
						WHERE a.ScientificName LIKE '".$SearchTerm."%'
						ORDER BY ScientificName");
	$results = $stmt->execute();

	  echo '<div class="eFloraTable"><table>';
		echo '<tr ><th>Scientific Name</th><th>Common Name</th><th>Status</th></tr>';

	  while ($row = $results->fetchArray()) {
	  
// If no results are found, echo a message and stop
		if ($row == false){
			echo '<i>'.$SearchTerm.'</i> was not found in the eFlora name list.<br>';
			echo 'Try another search, or try searching the <a href="/interchange/">Jepson Online Interchange</a>.<br>';
    		exit;
		}
		
	  
		if ($row['AcceptedNameTID']){ //if it has an AcceptedNameTID, then it's a synonym, so print the synonym line
			$row['Status'] = str_replace("Noted Name", "Mentioned in<br>a note", $row['Status']);			
			echo '<tr><td><a href="/eflora/eflora_display.php?tid='.$row['AcceptedNameTID'].'">'.$row['ScientificName'].'</a><br>(Under '.$row['AcceptedName'].')</td>';
			echo '<td>'.$row['CommonName'].'</td>';
			echo '<td>'.ucfirst(strtolower($row['Status'])).'</td>';
			echo '</tr>';		
		}
		else { //else it is an accepted name, so print the full line
			echo '<tr><td><a href="/eflora/eflora_display.php?tid='.$row['TaxonID'].'">'.$row['ScientificName'].'</a>';
			if ($row['HasKey']){ //if it has a key, add the key text under the name
				echo '<br>&nbsp;&nbsp;<a href="/eflora/eflora_keys.php?key='.$row['TaxonID'].'">&#x21b3;&nbsp;&nbsp;Key to '.$row['ScientificName'].'</td>';

			}
			else {
				echo '</td>';
			}
			echo '<td>'.$row['CommonName'].'</td>';
			echo '<td>'.ucfirst(strtolower($row['Status'])).'</td>';
		}	

	  }
		echo '</table></div>';
	#}
	#else {
	#	echo '<i>'.$SearchTerm.'</i> was not found in the eFlora name list.<br>
	#	Try another search, or try searching the <a href="/interchange/">Jepson Online Interchange</a>.<br>';
	#}
	#	echo '</table></div>';
	#}
}

else {
	echo '<br><p><span class="feedbackLink">';
	echo 'Invalid index URL. Please use the index links above.</p><br><br><span>';
}

?>

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


