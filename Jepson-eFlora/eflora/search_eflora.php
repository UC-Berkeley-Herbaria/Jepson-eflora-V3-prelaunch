<?php
date_default_timezone_set('America/Los_Angeles');

//Security mod to prevent cross-site scripting attacks
if (isset($_GET['name'])){
	$SearchTerm = $_GET['name'];
// 1. Remove Null Bytes first
	$SearchTerm = str_replace(chr(0), "", $SearchTerm);

// 2. Trim using the standard whitespace characters (space, tab, newline, etc.)
// PHP's default trim() already handles \t, \n, \r, \0, and \x0B.
	$SearchTerm = trim($SearchTerm);

// 3. Finally, escape for HTML output
	$SearchTerm = htmlspecialchars($SearchTerm, ENT_QUOTES, 'UTF-8');
}
else{
	echo '<br /><p><span class="feedbackLink">';
	echo '<i>'.$SearchTerm.'</i> --> Search term invalid.</span></p>';
	echo '<p><b>Try another search, or try searching the <a href="/interchange/">Jepson Online Interchange</a>.</p><br /><br />';
	$SearchTerm = "";
    exit;
}

//connect to the database
require '../../herbariadb_data/eflora/config/config_eflora_mysql.php';
$db = mysqli_connect($db_host, $db_user, $db_pw, $db_name);

?>


<!DOCTYPE html>
 
<html lang="en">  

<head>
<title>Scientific Name Search Page - Jepson eFlora</title> 
<meta charset="UTF-8">
<meta name="description" content="For vascular plants occurring in wildlands or otherwise outside of cultivation in California, the Jepson eFlora contains taxonomic treatments, distribution maps, illustrations, photographs, and identification keys.">
  <meta name="keywords" content="California Flora, Jepson eFlora, Flora of California, Vascular Plants of California, Jepson Flora Project, ">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="common/css/dropdowns.css" rel="stylesheet" type="text/css" />

<link href="common/css/jepson_eflora.css" rel="stylesheet" type="text/css" />

<link rel="shortcut icon" href="common/images/JepsonLogoSmall.png" type="image/x-icon" />

<!--mobile js script files-->
<script src="common/js/dh_custom.js"></script>

<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-T5YC99QF6Q"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-T5YC99QF6Q');
</script>

</head>

<body>

<!-- Begin banner -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/herbaria-header.php'); ?>  
<!-- End banner -->

<main>
 <div id="content-top">

<h1><a href="/eflora/">Jepson eFlora</h1></a> 
<h2>Search Page</h2>

<h2><a name="TOP" id="TOP">Vascular Plants of California</a></h2>
			<p class="generalTextBold">
				<a class="efTag" href="/eflora/keys/IJM_fam_key.php">Key to families</a>
				|
				<a class="efTag" href="/eflora/toc.php">Table of families and genera</a>
<br>
<!--eFlora index-->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/eflora_index_bar.php'); ?>

			</p>	  

	<form action="search_eflora.php" method="get">
		<label for="name">Scientific Name Search:</label>
		<input type="text" id="name" name="name" placeholder="Enter a scientific name..." required>
		<input type="submit" value="Submit Name">
	</form>
		</div>

<!-- Begin spacer block-->
		<div class="spacer_grey">

<?php

	$pattern = '/^[A-Za-z \-\.]+$/';
	if (preg_match($pattern, $SearchTerm)) {
			echo '<br><p class="bodyText"><h2>You searched for: '.$SearchTerm.'</h2></p>';
//perform a search that returns all names that start with a letter
//this is the same query as in search_eflora.php, but with a different WHERE clause

		$sql = "SELECT a.ScientificName as ScientificName, a.TaxonID as TaxonID";
		$sql.= ", a.CommonName as CommonName, a.Status as Status, a.IsTerminalTaxon as IsTerminalTaxon";
		$sql.= ", a.HasKey as HasKey, a.AcceptedNameTID as AcceptedNameTID, b.ScientificName as AcceptedName";
		$sql.= " FROM eflora_synonymy a";
		$sql.= " LEFT OUTER JOIN eflora_synonymy b on a.AcceptedNameTID = b.TaxonID";
		$sql.= " WHERE a.ScientificName LIKE '".$SearchTerm."%'";
		$sql.= " ORDER BY Status, ScientificName";

//BEGIN temporary bug fix lines to add when needed
//echo '<br />'.$sql.'<br />';

		if(!mysqli_query($db, $sql)){
			die('Error: ' . mysqli_error($db));
		}


	$result = mysqli_query($db, $sql);
		
		echo '<table class="eFloraTable"><tr><th>Scientific Name</th><th>Common Name</th><th><em>Jepson eFlora</em> Status</th></tr>';

		// Check if any rows were returned
		if (mysqli_num_rows($result) > 0) {
		// If rows exist, loop through them
			while ($row = mysqli_fetch_array($result)) {
//BEGIN temporary bug fix lines to add when needed
//foreach ($row as $key=>$value) {
//    echo $key."<br />";
//}
//END temp bug fix lines
		//query and assign variable to each table field
				if (!empty($row['ScientificName'])){
					$SciName = $row['ScientificName'];
				}
				else{
					$SciName = null;
				}

				if (!empty($row['TaxonID'])){
					$TID = $row['TaxonID'];
				}
				else{
					$TID = null;
				}

				if (!empty($row['CommonName'])){
					$common = $row['CommonName'];
				}
				else{
					$common = null;
				}

				if (!empty($row['Status'])){
					$status = $row['Status'];
				}
				else{
					$status = null;
				}

				if (!empty($row['IsTerminalTaxon'])){
					$terminal = $row['IsTerminalTaxon'];
				}
				else{
					$terminal = null;
				}

				if (!empty($row['HasKey'])){
					$key = $row['HasKey'];
				}
				else{
					$key = null;
				}

				if (!empty($row['AcceptedNameTID'])){
					$AcceptedTID = $row['AcceptedNameTID'];
				}
				else{
					$AcceptedTID = null;
				}

				if (!empty($row['AcceptedName'])){
					$accepted = $row['AcceptedName'];
				}
				else{
					$accepted = null;
				}
	  
	  
				if( (!empty($accepted)) && (!empty($AcceptedTID)) ){ //if it has an AcceptedName and a AcceptedNameTID, then it's a valid synonym, so print the synonym line
					$status = str_replace("Noted Name", "Mentioned in<br>a note", $status);			
					echo '<tr><td><a href="/eflora/eflora_display.php?tid='.$AcceptedTID.'">'.$SciName.'</a><br>(Under '.$accepted.')</td>';
					echo '<td>'.$common.'</td>';
					echo '<td>'.ucfirst(strtolower($status)).'</td>';
					echo '</tr>';
				} else { //else it should be an accepted name, so print the full line
					if( (!empty($SciName)) && (!empty($TID)) ){ //if it has an ScientificName and a Taxon ID, then it's a valid name line
					
						if ($key){ //if it has a key, add the key text under the name
							echo '<tr><td><a href="/eflora/eflora_display.php?tid='.$TID.'">'.$SciName.'</a>';
							echo '<br>&nbsp;&nbsp;<a href="/eflora/eflora_keys.php?key='.$TID.'">&#x21b3;&nbsp;&nbsp;Key to '.$SciName.'</td>';
							echo '<td>'.$common.'</td>';
							echo '<td>'.ucfirst(strtolower($status)).'</td>';
							echo '</tr>';
						} else {
							echo '<tr><td><a href="/eflora/eflora_display.php?tid='.$TID.'">'.$SciName.'</a>';
							echo '</td>';
							echo '<td>'.$common.'</td>';
							echo '<td>'.ucfirst(strtolower($status)).'</td>';
							echo '</tr>';
						}
					}

				//do not print incomplete entries without both a tid and a name,
				//they are errors that need fix
				}
			}
		} else {
			//close eflora table
			echo '</table><br><br>';
			echo '<p class="feedbackLink">'.$SearchTerm;
			echo ' was not found in the <i>Jepson eFlora</i> database.</p>';
			echo '<p class="feedbackLink">Click here to <a href="search_icpn.php?icpn='.$SearchTerm;
			echo '">view results for '.$SearchTerm;
			echo ' in the Index of California Plant Names database.</a></p><br>';
		}
	} else {
		echo '<br><p><span class="feedbackLink">';
		echo 'Invalid Scientific name format. Please use the index links above.</p><br><br><span>';
	}

	//close eflora table
	echo '</table>';
?>

	</div> 

<div class="spacer_grey">
<p class=bodyText><a href="https://docs.google.com/forms/d/e/1FAIpQLSc_wrQXqB9gNPrOgUTZ9WN38Ub08JlmgaIha7Ua99sHGzMntA/viewform">Please use this Google Form for Contact/Feedback</a>
</div>

</div>
</main>
<!--CLOSE ALL Main divisions, tables -->

	<div class ="spacer_grey">
<!--begin footer-->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/footer.php'); ?>
<!--end footer-->
	</div>
</body>
</html>


