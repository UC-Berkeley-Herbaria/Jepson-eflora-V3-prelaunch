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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<?php 
// TID is passed to JS by using PHP to echo the value of $TaxonID to a JS variable TaxID 
// Apparently there are better ways to do this using AJAX

?>

<head>
<head>
<title>Index Page, California Flora, Jepson eFlora</title> 
<meta charset="UTF-8">
<meta name="description" content="The Jepson eFlora is the foremost authority on the native and naturalized vascular plants of California. For plants occurring in wildlands or otherwise outside of cultivation, the Jepson eFlora contains taxonomic treatments, distribution maps, illustrations, photographs, and identification keys."  />
  <meta name="keywords" content="California Flora, Jepson eFlora, Flora of California, Vascular Plants of California, Jepson Flora Project, ">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link href="/common/styles/dropdowns.css" rel="stylesheet" type="text/css" />
	<link href="/common/css/jepson_eflora.css" rel="stylesheet" type="text/css" />
		<link rel="shortcut icon" href="/common/images/JepsonLogoSmall.png" type="image/x-icon" />

<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-T5YC99QF6Q"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-T5YC99QF6Q');
</script>




</head>

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

</head>

<body>
<table id="normaltable">
  <tr>
   <td class="spacer1"><img src="/common/images/common_spacer.gif" alt="" style="height:1px;width:5px;"></td>
	<td>
	 <table><!-- content table -->
	  <tr>
	   <td>
<div>
<!-- Begin banner -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/header_jeps.php'); ?>
<!-- End banner -->

<!-- Beginning of horizontal menu -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/globalnav.php'); ?>
<!-- End of horizontal menu -->
</div>

<div style="border-left-style: solid;border-left-color: #C0DFFD;border-right-style: solid;border-right-color: #C0DFFD;"><!-- Begin content divider -->
	<table style="background-color: #E6F3FF"><!-- content table -->
	 <tr>  
	  <td style="vertical-align: top;">
		<table id = "sideLinks" style="width=10vw;">
		<tr>
			<td style="vertical-align: top;"><!-- <<background test>> -->
<!-- Start of sidebar menu-->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/localnav_eflora_primary.php'); ?>
<!-- End of sidebar --> 
			</td>
		</tr>
		</table>
	  </td>
	  <td style="border-left-style: solid;border-left-color: #C0DFFD;"><img src="/common/images/common_spacer.gif" alt="" style="height:1px;width:15px;"></td>
	  <td style="padding-top: 5px;vertical-align: top;width=90vw;">
 <table>
  <tr>
    <td style="padding-top: 0;vertical-align: top;">
     <div id="content-top">
<table border="0">
	<tr>
		<td><span class="pageName"><a href="/eflora/">Jepson eFlora:</a> Index Page</span></td>

	</tr>
	<tr>
       <td><span class="pageMajorHeading"><a name="TOP" id="TOP">Vascular Plants of California</a></span>
		<br>
			<span class="pageAuthorLine">
				<a href="/IJM_keys/IJM_fam_key.html">Key to families</a>
				|
				<a href="toc.html">Table of families and genera</a>
			</span>	  
		</td>
	</tr>
</table>
<p>
<form action="/eflora/search_eflora.php" method="POST">
<b>Scientific Name</b><br />		<input type="text" id="query_text" name="query">
		<input type="submit" value="Submit Name" />
</form>

<?php
//$SearchTerm must be a single capital letter
if (preg_match("/^[A-Z]$/", $SearchTerm)) {
	echo '<p class="bodyText">Index Page: '.$SearchTerm.'<p>';

//perform a search that returns all names that start with a letter
//this is the same query as in search_eflora.php, but with a different WHERE clause
	$stmt = $db->prepare("SELECT a.ScientificName as ScientificName, a.TaxonID as TaxonID, a.CommonName as CommonName, a.Status as Status, a.IsTerminalTaxon as IsTerminalTaxon, a.HasKey as HasKey, a.AcceptedNameTID as AcceptedNameTID, b.ScientificName as AcceptedName
						FROM eflora_taxa a
						LEFT OUTER JOIN eflora_taxa b on a.AcceptedNameTID = b.TaxonID
						WHERE a.ScientificName LIKE '".$SearchTerm."%'
						ORDER BY ScientificName");
	$results = $stmt->execute();

	  echo '<div class="eFloraTable"><table border="1">';
		echo '<tr><td>Scientific Name</td><td>Common Name</td><td></td></tr>';

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
	echo '<br /><p><span class="feedbackLink">';
	echo 'Invalid index URL. Please use the index links above.</p><br /><br /><span>';
}

?>
<br>
<p class=bodyText><a href="https://docs.google.com/forms/d/e/1FAIpQLSc_wrQXqB9gNPrOgUTZ9WN38Ub08JlmgaIha7Ua99sHGzMntA/viewform"><font size=3 color="red">Please use this Google Form for Contact/Feedback</font></a>

<!-- End body section-->

	</div>
   </td>
  </tr>
</table> <!--close box outline table-->
  
<!-- Begin footer -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/footer.php'); ?>
<!-- End footer -->

 
 	</td>
   <td class="spacer1"><img src="/common/images/common_spacer.gif" alt="" style="height:1px;width:15px;"></td>
  </tr>
 </table> <!--close outside normal table-->




</body>
</html>

