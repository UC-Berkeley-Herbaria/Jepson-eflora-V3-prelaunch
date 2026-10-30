<?php
date_default_timezone_set('America/Los_Angeles');
$SearchTerm = $TaxonID = $TaxonName = "";


//get user input from POST
if (isset($_POST['query'])){
	$SearchTerm = $_POST['query'];
	$SearchTerm = htmlspecialchars($SearchTerm);
	$SearchTerm = trim($SearchTerm, $character_mask = "\s\t\n\r\0\x0B");
}	
// define variables and set to empty values


//Security mod to prevent cross-site scripting attacks
  if (isset($_GET['tid'])){
	$TaxonID = $_GET['tid'];
	$TaxonID = htmlspecialchars($TaxonID);
	$TaxonID = str_replace(chr(0),"", $TaxonID);  #NULL BYTES
	$TaxonID = trim($TaxonID, $character_mask = "\s\t\n\r\0\x0B");
	$TaxonID = preg_replace("/[^0-9]/", "", $TaxonID);
  }

  if (isset($_GET['name'])){
	$TaxonName = $_GET['name'];
	$TaxonName = htmlspecialchars($TaxonName);
	$TaxonName = str_replace(chr(0),"", $TaxonName);  #NULL BYTES
	$TaxonName = trim($TaxonName, $character_mask = "\t\n\r\0\x0B");
	
	//$TaxonName = preg_replace("+", " ", $TaxonName);
	$TaxonName = preg_replace("/[^A-Za-z-\s+]/", "", $TaxonName);

//prep value for searching
	$TaxonName = str_replace("%20", " ", $TaxonName);
	$TaxonName = str_replace("+", " ", $TaxonName);
	$TaxonName = str_replace("_", " ", $TaxonName);
	$TaxonName = str_replace("\s+", " ", $TaxonName); 
	$TaxonName = str_replace(" ssp ", " subsp. ", $TaxonName);
	$TaxonName = str_replace(" var ", " var. ", $TaxonName);
	$TaxonName = str_replace(" subsp ", " subsp. ", $TaxonName);
	
  }


require '../../ucjeps_data/ucjeps_data/config/config_eflora.php';
//require 'config/config.php';
$db = new SQLite3($database_location);

?>



<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>California Flora - Jepson eFlora Search; Vascular Plants of California, Jepson Herbarium</title>

<link href="/common/styles/dropdowns.css" rel="stylesheet" type="text/css" />

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
       <td width="100%"><span class="pageName"><a href="/eflora/">ICPN and Jepson eFlora Synonymy Search page</span>
       <br /><span class="pageMajorHeading"><a name="TOP" id="TOP">Vascular Plants of California</a></span>
       
		</td>
	</tr>
</table>

<table width="100%">
<tr>
<td width="100%" valign="top">

<?php

  if (isset($_POST['query'])){

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
//OR their search term matches anywhere in the ScientificName as long as it's preceded by a space (i.e. they start with the specific or infra epithet)
//One problem with this is if someone searches "var" or "subsp", and in general it may be too permissible
$stmt = $db->prepare("SELECT a.ScientificName as ScientificName, a.TaxonID as TaxonID, a.CommonName as CommonName, a.Status as Status, a.IsTerminalTaxon as IsTerminalTaxon, a.HasKey as HasKey, a.AcceptedNameTID as AcceptedNameTID, b.ScientificName as AcceptedName
						FROM eflora_taxa a
						LEFT OUTER JOIN eflora_taxa b on a.AcceptedNameTID = b.TaxonID
						WHERE a.ScientificName LIKE '".$SearchTerm."%' OR a.ScientificName LIKE '% ".$SearchTerm."%'
						ORDER BY ScientificName");
$results = $stmt->execute();

//	$results = $db->query("SELECT ScientificName, TaxonID, CommonName, NativeStatus, IsTerminalTaxon
//						FROM eflora_taxa
//						WHERE IsTerminalTaxon=1 AND ScientificName LIKE '".$SearchTerm."%'
//						ORDER BY ScientificName"); 

//in the following "if" paragraph, the row needs to be printed before the while loop
//because when the while loop runs fetchArray, it is moving on to the second row
//so if the first row isn't printed before the while loop, the results will start with the second row.
	if ($row = $results->fetchArray()) {
		echo '<div class="eFloraTable"><table border="1">';
		echo '<tr><td>Scientific Name</td><td>Common Name</td><td></td></tr>';
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
		while ($row = $results->fetchArray()) {
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
	}
	else {
		echo '<span class=\'bodyText\'>This name was not found in the <i>Jepson eFlora</i> database.<br />';
		echo 'Possible reasons:<br />';
		echo '<b>&middot;</b>This is a name that has not been added to the eflora synonymy database, ';
		echo 'even though it is used or has been used for California plants (in the Consortium of California Herbaria, for instance).<br />';
		echo '<b>&middot;</b>This may be name of a plant that does not occur in California or otherwise does not qualify for inclusion in the eflora.<br />';
		echo'<b>&middot;</b>This name may have been added to the Index of California Plant Names (ICPN). ';
		echo 'Click on this link to search the ';
		echo '<a href="/cgi-bin/get_cpn.pl?'.$SearchTerm.'"><b>ICPN (linked via the Jepson Online Interchange)</b></a>';
		echo '<br /><br /><b>OR</b><br /><br />';
		echo 'Try another search in the eflora:<br />';
		echo '<form action="/eflora/search_eflora.php" method="POST">';
		echo '<b>Scientific Name<br></b><input type="text" id="query_text" name="query"></input>';
		echo '<input type="submit" value="Submit Name" />';
		echo '</form></span>';

	}	
  }
  elseif(isset($_GET['name'])){
	
	echo '<p class="bodyText">You searched for: "'.$TaxonName.'"<p>';

	$TaxonName = str_replace(" ", "%", $TaxonName); //replace space with wildcard, so e.g. "Art cal" returns "Artemisia californica"

//the notes above apply here also
$stmt = $db->prepare("SELECT a.ScientificName as ScientificName, a.TaxonID as TaxonID, a.CommonName as CommonName, a.Status as Status, a.IsTerminalTaxon as IsTerminalTaxon, a.HasKey as HasKey, a.AcceptedNameTID as AcceptedNameTID, b.ScientificName as AcceptedName
						FROM eflora_taxa a
						LEFT OUTER JOIN eflora_taxa b on a.AcceptedNameTID = b.TaxonID
						WHERE a.ScientificName LIKE '".$TaxonName."%' OR a.ScientificName LIKE '% ".$TaxonName."%'
						ORDER BY ScientificName");
$results = $stmt->execute();

//in the following "if" paragraph, the row needs to be printed before the while loop
//because when the while loop runs fetchArray, it is moving on to the second row
//so if the first row isn't printed before the while loop, the results will start with the second row.
	if ($row = $results->fetchArray()) {
		echo '<div class="eFloraTable"><table border="1">';
		echo '<tr><td>Scientific Name</td><td>Common Name</td><td></td></tr>';
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
		while ($row = $results->fetchArray()) {
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
	}
	else {
		echo '<span class=\'bodyText\'>This name was not found in the <i>Jepson eFlora</i> database.<br />';
		echo 'Possible reasons:<br />';
		echo '<b>&middot;</b>This is a name that has not been added to the eflora synonymy database, ';
		echo 'even though it is used or has been used for California plants (in the Consortium of California Herbaria, for instance).<br />';
		echo '<b>&middot;</b>This may be name of a plant that does not occur in California or otherwise does not qualify for inclusion in the eflora.<br />';
		echo'<b>&middot;</b>This name may have been added to the Index of California Plant Names (ICPN). ';
		echo 'Click on this link to search the ';
		echo '<a href="/cgi-bin/get_cpn.pl?'.$TaxonName.'"><b>ICPN (linked via the Jepson Online Interchange)</b></a>';
		echo '<br /><br /><b>OR</b><br /><br />';
		echo 'Try another search in the eflora:<br />';
		echo '<form action="/eflora/search_eflora.php" method="POST">';
		echo '<b>Scientific Name<br></b><input type="text" id="query_text" name="query"></input>';
		echo '<input type="submit" value="Submit Name" />';
		echo '</form></span>';
	}
  }
  elseif(isset($_GET['tid'])){
	
	echo '<p class="bodyText">You searched for: "'.$TaxonID.'"<p>';

	$TaxonID = str_replace(" ", "", $TaxonID); //TID's should not have spaces

//the notes above apply here also
$stmt = $db->prepare("SELECT a.ScientificName as ScientificName, a.TaxonID as TaxonID, a.CommonName as CommonName, a.Status as Status, a.IsTerminalTaxon as IsTerminalTaxon, a.HasKey as HasKey, a.AcceptedNameTID as AcceptedNameTID, b.ScientificName as AcceptedName
						FROM eflora_taxa a
						LEFT OUTER JOIN eflora_taxa b on a.AcceptedNameTID = b.TaxonID
						WHERE a.TaxonID =".$TaxonID."
						ORDER BY ScientificName");
$results = $stmt->execute();

//in the following "if" paragraph, the row needs to be printed before the while loop
//because when the while loop runs fetchArray, it is moving on to the second row
//so if the first row isn't printed before the while loop, the results will start with the second row.
	if ($row = $results->fetchArray()) {
		echo '<div class="eFloraTable"><table border="1">';
		echo '<tr><td>Scientific Name</td><td>Common Name</td><td></td></tr>';
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
		while ($row = $results->fetchArray()) {
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
	}
	else {
		echo '<span class=\'bodyText\'>This ID was not found in the <i>Jepson eFlora</i> database.<br />';
		echo 'Possible reasons:<br />';
		echo '<b>&middot;</b>This ID is for a name that has not been added to the eflora synonymy database, ';
		echo 'even though it is used or has been used for California plants (in the Consortium of California Herbaria, for instance).<br />';
		echo '<b>&middot;</b>This may be the ID for a name of a plant that does not occur in California or otherwise does not qualify for inclusion in the eflora.<br />';
		echo'<b>&middot;</b>This ID may be for a name has been added to the Index of California Plant Names (ICPN). ';
		echo 'Click on this link to search the ';
		echo '<a href="/cgi-bin/get_cpn.pl?'.$TaxonID.'"><b>ICPN (linked via the Jepson Online Interchange)</b></a>';
		echo '<br /><br /><b>OR</b><br /><br />';
		echo 'Try another search in the eflora:<br />';
		echo '<form action="/eflora/search_eflora.php" method="POST">';
		echo '<b>Scientific Name<br></b><input type="text" id="query_text" name="query"></input>';
		echo '<input type="submit" value="Submit Name" />';
		echo '</form></span>';
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
<?php include('../common/php/eflora_footer.php'); ?>
<!--End footer-->
