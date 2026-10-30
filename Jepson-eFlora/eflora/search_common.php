<?php
date_default_timezone_set('America/Los_Angeles');


//get user input from POST
if (isset($_POST['query'])){
	$SearchTerm = $_POST['query'];
}	
elseif (isset($_GET['name'])){
	$SearchTerm = $_GET['name'];
}
else{
	echo '<br /><p><span class="feedbackLink">';
	echo '<i>'.$SearchTerm.'</i> --> Search term invalid.</span></p>';
	echo '<p><b>Try another search, or try searching the <a href="/interchange/">Jepson Online Interchange</a>.</p><br /><br />';
	$SearchTerm = "";
    exit;
}
//connect to the database
require 'config/config.php';
$db = new SQLite3($database_location);
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Search Page - Jepson eFlora</title>

<meta charset="UTF-8">
<meta name="description" content="For vascular plants occurring in wildlands or otherwise outside of cultivation in California, the Jepson eFlora contains taxonomic treatments, distribution maps, illustrations, photographs, and identification keys.">
  <meta name="keywords" content="California Flora, Jepson eFlora, Flora of California, Vascular Plants of California, Jepson Flora Project, ">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="/common/styles/dropdowns.css" rel="stylesheet" type="text/css" />
<link href="/common/css/jepson_eflora.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="/common/images/JepsonLogoSmall.png" type="image/x-icon" />

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-43909100-4"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-43909100-4');
</script>
</head>

<body onload="initialize()">
<!-- Begin banner -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/header_jeps.php'); ?>
<!-- End banner -->

<!-- Beginning of horizontal menu -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/globalnav.php'); ?> 
<!-- End of horizontal menu -->

<!-- Start of sidebar menu-->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/localnav_media.php'); ?>
<!-- End of sidebar --> 

<table border="0">
   <tr>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td width="100%"><span class="pageName"><a href="/eflora/">Jepson eFlora:</a> Search Page</span>
       <br /><span class="pageMajorHeading"><a name="TOP" id="TOP">Vascular Plants of California</a></span>
		<br />
			<span class="pageAuthorLine">
				<a href="/IJM_keys/IJM_fam_key.html">Key to families</a>
				|
				<a href="/IJM_keys/toc.html">Table of families and genera</a>
			</span>	  
		</td>
	</tr>
</table>

<table align="center" width="100%"><tr><td>
&nbsp;
</td>
<td width=90%>
<!--eFlora index-->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/eflora_index_bar.php'); ?>
<hr align="left" width=300px>
</td>

<td >
&nbsp;
</td></tr>
</table>
<br>

<table width="100%">
<tr>
<td width="100%" valign="top">

<form action="/eflora/search_eflora.php" method="POST">
<b>Scientific Name<br></b>		<input type="text" id="query_text" name="query"></input>
		<input type="submit" value="Submit Name" />
</form>

<?php

if (isset($SearchTerm)){
	$SearchTerm = trim( $SearchTerm, $character_mask = " \t\n\r\0\x0B");

//Security mod to prevent cross-site scripting attacks
	$SearchTerm = preg_replace("/[^a-zA-Z\s.]/", "", $SearchTerm);
	
	echo '<p class="bodyText">You searched for: "'.$SearchTerm.'"<p>';
	if (strpos($SearchTerm, " ssp. ") !== false) { #in case someone uses ssp.
		$SearchTerm = str_replace(" ssp. ", " subsp. ", $SearchTerm);
	}
	$SearchTerm = str_replace(" ", "%", $SearchTerm); //replace space with wildcard, so e.g. "Art cal" returns "Artemisia californica"
	$SearchTerm = str_replace("+", "%", $SearchTerm); //replace '+' with wildcard, so e.g. "Artemisia+californica" returns "Artemisia californica"

	
//put in a query that gets the ScientificName, TID, maybe other stuff FROM eflora_taxa WHERE ScientificName LIKE ScientificName%
//preparing a query and then executing it, as done here, is supposed to be faster than running the query directly
//IsTerminalTaxon=1 was taken out of the display, on request
//The WHERE statement is set up so that the $SearchTerm needs to match the start of the name (i.e. they start with the genus)
//OR their search term matches anywhere in the CommonName as long as it's preceded by a space (i.e. they start with the specific or infra epithet)
//One problem with this is if someone searches "var" or "subsp", and in general it may be too permissible
$stmt = $db->prepare("SELECT a.ScientificName as ScientificName, a.TaxonID as TaxonID, a.CommonName as CommonName, a.Status as Status, a.IsTerminalTaxon as IsTerminalTaxon, a.HasKey as HasKey, a.AcceptedNameTID as AcceptedNameTID, b.ScientificName as AcceptedName
						FROM eflora_taxa a
						LEFT OUTER JOIN eflora_taxa b on a.AcceptedNameTID = b.TaxonID
						WHERE a.CommonName LIKE '".$SearchTerm."%' OR a.CommonName LIKE '% ".$SearchTerm."%'
						ORDER BY CommonName");
$results = $stmt->execute();

$resultWasEmpty = true;
//	$results = $db->query("SELECT ScientificName, TaxonID, CommonName, NativeStatus, IsTerminalTaxon
//						FROM eflora_taxa
//						WHERE IsTerminalTaxon=1 AND ScientificName LIKE '".$SearchTerm."%'
//						ORDER BY ScientificName"); 

		echo '<div class="eFloraTable"><table border="1">';
		  echo '<tr><td>Scientific Name</td><td>Common Name</td><td></td></tr>';

	  while ($row = $results->fetchArray()) {
	  
	  
		  
// If no results are found, echo a message and stop
		if ($row == false){
			echo '<br /><p><span class="feedbackLink">';
			echo '<i>'.$SearchTerm.'</i> was not found in the eFlora name list.</span></p><br />';
			echo '<p><b>Try another search, or try searching the <a href="/interchange/">Jepson Online Interchange</a>.</p><br /><br />';
    		exit;
		}

		$resultWasEmpty = false;
  
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

if ($resultWasEmpty) {
    		echo '<br /><p><span class="feedbackLink">';
			echo $SearchTerm.' was not found or is not a scientific name.</span></p><br />';
			echo '<p><b>Try another search, or try searching the <a href="/interchange/">Jepson Online Interchange</a>.</p><br /><br />';
}



}

else {
	echo 'No search term entered. Please enter a search term above<br>';
}

?>
<br>
<a href="mailto:interchange@lists.berkeley.edu"><span class="feedbackLink">Feedback/Contact<span></a><br>
</td>
</tr>
</table>



<!--Begin footer-->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/eflora_footer.php'); ?>
<!--End footer-->
