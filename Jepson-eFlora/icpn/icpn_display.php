
<?php
date_default_timezone_set('America/Los_Angeles');

error_reporting(E_ALL);
ini_set('display_errors', '1');

// define variables and set to null values
$results = null;
$row = null;
$db = null;


//Security mod to prevent cross-site scripting attacks
  if (isset($_GET['tid'])){
	$TaxonID = $_GET['tid'];
	$TaxonID = htmlspecialchars($TaxonID);
	$TaxonID = str_replace(chr(0),"", $TaxonID);  #NULL BYTES
	$TaxonID = trim($TaxonID, $character_mask = "\s\t\n\r\0\x0B");
	$TaxonID = preg_replace("/[^0-9]/", "", $TaxonID);
  }
  else{
  	$TaxonID = null;
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
	$TaxonName = str_replace("&times;", "", $TaxonName);
	$TaxonName = str_replace("+", " ", $TaxonName);
	$TaxonName = str_replace("_", " ", $TaxonName);
	$TaxonName = str_replace("\s+", " ", $TaxonName); 
	$TaxonName = str_replace(" ssp ", " subsp. ", $TaxonName);
	$TaxonName = str_replace(" var ", " var. ", $TaxonName);
	$TaxonName = str_replace(" subsp ", " subsp. ", $TaxonName);
  }
  else{
  	$TaxonName = null;
  }

//connect to the database
require '../../../herbariadb_data/eflora/config/config_eflora_mysql.php';
$db = mysqli_connect($db_host, $db_user, $db_pw, $db_name);


//START TAXON ID AND NAME SQL QUERY ASSIGNMENT


//perform a search that returns all names that start with a letter
//this is the same query as in search_eflora.php, but with a different WHERE clause
					//georeferenceRemarks
	if(!empty($TaxonID))  {

		$sql = "SELECT a.TaxonID, a.ScientificName, a.Family, a.Source, ";
		$sql.= " a.SourceComments, a.Literature, a.TJMsynonyms, ";
		$sql.= " a.OtherSynonyms, a.TJMmisapplied, a.JFPmisapplied, a.Correspondence1, a.Correspondence2, ";
		$sql.= " a.Correspondence3, a.Correspondence4, a.Correspondence5, a.Correspondence6, a.Correspondence7, a.Correspondence8, ";
		$sql.= " a.Correspondence9, a.Correspondence10, a.Correspondence11, a.Correspondence12, a.Correspondence13, a.EdComments1, a.EdComments2, ";
		$sql.= " a.EdComments3, a.EdComments4, a.EdComments5, a.EdComments6, a.EdComments7, a.EdComments8, a.EdComments9, ";
		$sql.= " a.EdComments10, a.EdComments11, a.EdComments12, a.EdComments13, a.Summary, a.CurrentStatus, ";
		$sql.= " a.CurrentStatusAuthority, a.CurrentStatusDate, a.CurrentName, a.CurrentNameTID, a.TypesInfo, ";
		$sql.= " a.Updated, a.IsTerminal, a.IsAccepted, c.DistCode ";
		$sql.= " FROM icpn a";
		$sql.= " LEFT JOIN eflora_taxa c ON a.TaxonID = c.TaxonID";
		$sql.= " WHERE a.TaxonID=".$TaxonID." ";

//BEGIN temporary bug fix lines to add when needed
//echo '<br>'.$sql.'<br>';

		if(!mysqli_query($db, $sql)){
			die('Error: ' . mysqli_error($db));
		}

		$result = mysqli_query($db, $sql);

//BEGIN temporary bug fix lines to add when needed
//echo "<table border='1'>
//<tr>
//    <th>ID</th>
//    <th>Name</th>
//    <th>CODE</th>
//</tr>";

//while($row = mysqli_fetch_assoc($result)) {
//    echo "<tr>";
//    echo "<td>" . $row['TaxonID'] . "</td>";
//    echo "<td>" . $row['ScientificName'] . "</td>";
//    echo "<td>" . $row['DistCode'] . "</td>";
//    echo "</tr>";
//}
//echo "</table>";
//END temp bug fix lines

//query and assign variable to each table field
		while ($row = mysqli_fetch_array($result)) {

// If no results are found, echo a message and stop
			if ($row == false){
				echo '<b>The Taxon ID '.$TaxonID.'</b> was not found in eflora taxon table.<br>Try another search.<br>';
    			exit;
			}

//BEGIN temporary bug fix lines to add when needed
//foreach ($row as $key=>$value) {
//    echo $key."<br>";
//}
//END temp bug fix lines

			if (!empty($row['ScientificName'])){
				$ScientificName = html_entity_decode($row['ScientificName']);
			}
			else{
				$ScientificName = null;
			}
	
			if (!empty($row['Family'])){
				$Family = $row['Family'];
			}
			else{
				$Family = null;
			}
	
			if (!empty($row['Source'])){
				$Source = html_entity_decode($row['Source']);
			}
			else{
				$Source = null;
			}
	
			if (!empty($row['SourceComments'])){
				$SourceComments = html_entity_decode($row['SourceComments']);
			}
			else{
				$SourceComments = null;
			}
	
			if (!empty($row['Literature'])){
				$Literature = html_entity_decode($row['Literature']);
			}
			else{
				$Literature = null;
			}
	
			if (!empty($row['TJMsynonyms'])){
				$TJMsynonyms = html_entity_decode($row['TJMsynonyms']);
			}
			else{
				$TJMsynonyms = null;
			}
	
			if (!empty($row['OtherSynonyms'])){
				$OtherSynonyms = html_entity_decode($row['OtherSynonyms']);
			}
			else{
				$OtherSynonyms = null;
			}
	
			if (!empty($row['TJMmisapplied'])){
				$TJMmisapplied = html_entity_decode($row['TJMmisapplied']);;
			}
			else{
				$TJMmisapplied = null;
			}
	
			if (!empty($row['JFPmisapplied'])){
				$JFPmisapplied = html_entity_decode($row['JFPmisapplied']);
			}
			else{
				$JFPmisapplied = null;
			}
	
			if (!empty($row['Correspondence1'])){
				$Correspondence1 = html_entity_decode($row['Correspondence1']);
			}
			else{
				$Correspondence1 = null;
			}
	
			if (!empty($row['Correspondence2'])){
				$Correspondence2 = html_entity_decode($row['Correspondence2']);
			}
			else{
				$Correspondence2 = null;
			}
	
			if (!empty($row['Correspondence3'])){
				$Correspondence3 = html_entity_decode($row['Correspondence3']);
			}
			else{
				$Correspondence3 = null;
			}
	
			if (!empty($row['Correspondence4'])){
				$Correspondence4 = html_entity_decode($row['Correspondence4']);
			}
			else{
				$Correspondence4 = null;
			}
	
			if (!empty($row['Correspondence5'])){
				$Correspondence5 = html_entity_decode($row['Correspondence5']);
			}
			else{
				$Correspondence5 = null;
			}

			if (!empty($row['Correspondence6'])){
				$Correspondence6 = html_entity_decode($row['Correspondence6']);
			}
			else{
				$Correspondence6 = null;
			}
			
			if (!empty($row['Correspondence7'])){
				$Correspondence7 = html_entity_decode($row['Correspondence7']);
			}
			else{
				$Correspondence7 = null;
			}

			if (!empty($row['Correspondence8'])){
				$Correspondence8 = html_entity_decode($row['Correspondence8']);
			}
			else{
				$Correspondence8 = null;
			}

			if (!empty($row['Correspondence9'])){
				$Correspondence9 = html_entity_decode($row['Correspondence9']);
			}
			else{
				$Correspondence9 = null;
			}

			if (!empty($row['Correspondence10'])){
				$Correspondence10 = html_entity_decode($row['Correspondence10']);
			}
			else{
				$Correspondence10 = null;
			}

			if (!empty($row['Correspondence11'])){
				$Correspondence11 = html_entity_decode($row['Correspondence11']);
			}
			else{
				$Correspondence11 = null;
			}

			if (!empty($row['Correspondence12'])){
				$Correspondence12 = html_entity_decode($row['Correspondence12']);
			}
			else{
				$Correspondence12 = null;
			}

			if (!empty($row['Correspondence13'])){
				$Correspondence13 = html_entity_decode($row['Correspondence13']);
			}
			else{
				$Correspondence13 = null;
			}

			if (!empty($row['EdComments1'])){
				$EdComments1 = html_entity_decode($row['EdComments1']);
			}
			else{
				$EdComments1 = null;
			}
	
			if (!empty($row['EdComments2'])){
				$EdComments2 = html_entity_decode($row['EdComments2']);
			}
			else{
				$EdComments2 = null;
			}
	
			if (!empty($row['EdComments3'])){
				$EdComments3 = html_entity_decode($row['EdComments3']);
			}
			else{
				$EdComments3 = null;
			}
	
			if (!empty($row['EdComments4'])){
				$EdComments4 = html_entity_decode($row['EdComments4']);
			}
			else{
				$EdComments4 = null;
			}
	
			if (!empty($row['EdComments5'])){
				$EdComments5 = html_entity_decode($row['EdComments5']);
			}
			else{
				$EdComments5 = null;
			}

			if (!empty($row['EdComments6'])){
				$EdComments6 = html_entity_decode($row['EdComments6']);
			}
			else{
				$EdComments6 = null;
			}
			
			if (!empty($row['EdComments7'])){
				$EdComments7 = html_entity_decode($row['EdComments7']);
			}
			else{
				$EdComments7 = null;
			}

			if (!empty($row['EdComments8'])){
				$EdComments8 = html_entity_decode($row['EdComments8']);
			}
			else{
				$EdComments8 = null;
			}

			if (!empty($row['EdComments9'])){
				$EdComments9 = html_entity_decode($row['EdComments9']);
			}
			else{
				$EdComments9 = null;
			}

			if (!empty($row['EdComments10'])){
				$EdComments10 = html_entity_decode($row['EdComments10']);
			}
			else{
				$EdComments10 = null;
			}

			if (!empty($row['EdComments11'])){
				$EdComments11 = html_entity_decode($row['EdComments11']);
			}
			else{
				$EdComments11 = null;
			}

			if (!empty($row['EdComments12'])){
				$EdComments12 = html_entity_decode($row['EdComments12']);
			}
			else{
				$EdComments12 = null;
			}

			if (!empty($row['EdComments13'])){
				$EdComments13 = html_entity_decode($row['EdComments13']);
			}
			else{
				$EdComments13 = null;
			}

			if (!empty($row['Summary'])){
				$Summary = html_entity_decode($row['Summary']);
			}
			else{
				$Summary = null;
			}
	
			if (!empty($row['CurrentStatus'])){
				$CurrentStatus = $row['CurrentStatus'];
			}
			else{
				$CurrentStatus = null;
			}
	
			if (!empty($row['CurrentStatusAuthority'])){
				$CurrentStatusAuthority = $row['CurrentStatusAuthority'];
			}
			else{
				$CurrentStatusAuthority = null;
			}
	
			if (!empty($row['CurrentStatusDate'])){
				$CurrentStatusDate = $row['CurrentStatusDate'];
			}
			else{
				$CurrentStatusDate = null;
			}
	
			if (!empty($row['CurrentName'])){
				$CurrentName = $row['CurrentName'];
			}
			else{
				$CurrentName = null;
			}
	
			if (!empty($row['CurrentNameTID'])){
				$CurrentNameTID = $row['CurrentNameTID'];
			}
			else{
				$CurrentNameTID = null;
			}
	
			if (!empty($row['TypesInfo'])){
				$TypesInfo = $row['TypesInfo'];
			}
			else{
				$TypesInfo = null;
			}
	
			if (!empty($row['Updated'])){
				$Updated = $row['Updated'];
			}
			else{
				$Updated = null;
			}
	
			if (!empty($row['IsTerminal'])){
				$IsTerminal = $row['IsTerminal'];
			}
	
			if (!empty($row['IsAccepted'])){
				$IsAccepted = $row['IsAccepted'];
			}

			if (!empty($row['DistCode'])){
				$DistCode = $row['DistCode'];
			}
	
/*var_dump($row); */
/*var_dump prints the whole row in a databased format
which is useful for seeing what you're getting
but is pretty ugly
*/
		}
	}
	elseif(!empty($TaxonName))  {

		$sql = "SELECT a.TaxonID, a.ScientificName, a.Family, a.Source, ";
		$sql.= " a.SourceComments, a.Literature,  a.TJMsynonyms, ";
		$sql.= " a.OtherSynonyms, a.TJMmisapplied, a.JFPmisapplied, a.Correspondence1, a.Correspondence2, ";
		$sql.= " a.Correspondence3, a.Correspondence4, a.Correspondence5, a.Correspondence6, a.Correspondence7, a.Correspondence8, ";
		$sql.= " a.Correspondence9, a.Correspondence10, a.Correspondence11, a.Correspondence12, a.Correspondence13, a.EdComments1, a.EdComments2, ";
		$sql.= " a.EdComments3, a.EdComments4, a.EdComments5, a.EdComments6, a.EdComments7, a.EdComments8, a.EdComments9, ";
		$sql.= " a.EdComments10, a.EdComments11, a.EdComments12, a.EdComments13, a.Summary, a.CurrentStatus, ";
		$sql.= " a.CurrentStatusAuthority, a.CurrentStatusDate, a.CurrentName, a.CurrentNameTID, a.TypesInfo, ";
		$sql.= " a.Updated, a.IsTerminal, a.IsAccepted, c.DistCode ";
		$sql.= " FROM icpn a";
		$sql.= " LEFT JOIN eflora_taxa c ON a.TaxonID = c.TaxonID";
		$sql.= " WHERE a.ScientificName LIKE '".$TaxonName."%' ";//Calochortus amabilis, for example

//BEGIN temporary bug fix lines to add when needed
//echo '<br>'.$sql.'<br>';

		if(!mysqli_query($db, $sql)){
			die('Error: ' . mysqli_error($db));
		}

		$result = mysqli_query($db, $sql);


//BEGIN temporary bug fix lines to add when needed
//echo "<table border='1'>
//<tr>
//    <th>ID</th>
//    <th>Name</th>
//</tr>";

//while($row = mysqli_fetch_assoc($result)) {
//    echo "<tr>";
//    echo "<td>" . $row['TaxonID'] . "</td>";
//    echo "<td>" . $row['ScientificName'] . "</td>";
//    echo "<td>" . $row['DistCode'] . "</td>";
//    echo "</tr>";
//}
//echo "</table>";
//END temp bug fix lines

//query and assign variable to each table field
		while ($row = mysqli_fetch_array($result)) {

// If no results are found, echo a message and stop
			if ($row == false){
				echo '<b>The ScientificName '.$TaxonName.'</b> was not found in icpn taxon table.<br>Try another search.<br>';

				echo '<form action="/eflora/search_icpn.php" method="get">';
				echo '<label for="name">ICPN Scientific Name Search:</label>';
				echo '<input type="text" id="name" name="name" placeholder="Enter a scientific name..." required>';
				echo '<input type="submit" value="Submit Name">';
				echo '<INPUT type=reset value=Reset>';
				echo '</form>';
	
    			exit;
			}


			if (!empty($row['ScientificName'])){
				$ScientificName = $row['ScientificName'];
			}
			else{
				$ScientificName = null;
			}
	
			if (!empty($row['Family'])){
				$Family = $row['Family'];
			}
			else{
				$Family = null;
			}
	
			if (!empty($row['AuthorNotes'])){
				$AuthorNotes = $row['AuthorNotes'];
			}
			else{
				$AuthorNotes = null;
			}
	
			if (!empty($row['PublicationNotes'])){
				$PublicationNotes = $row['PublicationNotes'];
			}
			else{
				$PublicationNotes = null;
			}
	
			if (!empty($row['SourceA'])){
				$Source = $row['SourceA'];
			}
			else{
				$Source = null;
			}
	
			if (!empty($row['SourceComments'])){
				$SourceComments = $row['SourceComments'];
			}
			else{
				$SourceComments = null;
			}
	
			if (!empty($row['LiteratureA'])){
				$LiteratureA = $row['LiteratureA'];
			}
			else{
				$LiteratureA = null;
			}
	
			if (!empty($row['LiteratureA'])){
				$LiteratureB = $row['LiteratureB'];
			}
			else{
				$LiteratureB = null;
			}
	
			if (!empty($row['LiteratureC'])){
				$LiteratureC = $row['LiteratureC'];
			}
			else{
				$LiteratureC = null;
			}
	
			if (!empty($row['LiteratureD'])){
				$LiteratureD = $row['LiteratureD'];
			}
			else{
				$LiteratureD = null;
			}
	
			if (!empty($row['TJMsynonyms'])){
				$TJMsynonyms = $row['TJMsynonyms'];
			}
			else{
				$TJMsynonyms = null;
			}
	
			if (!empty($row['OtherSynonyms'])){
				$OtherSynonyms = $row['OtherSynonyms'];
			}
			else{
				$OtherSynonyms = null;
			}
	
			if (!empty($row['TJMmisapplied'])){
				$TJMmisapplied = $row['TJMmisapplied'];
			}
			else{
				$TJMmisapplied = null;
			}
	
			if (!empty($row['JFPmisapplied'])){
				$JFPmisapplied = $row['JFPmisapplied'];
			}
			else{
				$JFPmisapplied = null;
			}
	
			if (!empty($row['GeographicComment'])){
				$GeographicComment = $row['GeographicComment'];
			}
			else{
				$GeographicComment = null;
			}
	
			if (!empty($row['Correspondence1'])){
				$Correspondence1 = $row['Correspondence1'];
			}
			else{
				$Correspondence1 = null;
			}
	
			if (!empty($row['Correspondence2'])){
				$Correspondence2 = $row['Correspondence2'];
			}
			else{
				$Correspondence2 = null;
			}
	
			if (!empty($row['Correspondence3'])){
				$Correspondence3 = $row['Correspondence3'];
			}
			else{
				$Correspondence3 = null;
			}
	
			if (!empty($row['Correspondence4'])){
				$Correspondence4 = $row['Correspondence4'];
			}
			else{
				$Correspondence4 = null;
			}
	
			if (!empty($row['Correspondence5'])){
				$Correspondence5 = $row['Correspondence5'];
			}
			else{
				$Correspondence5 = null;
			}

			if (!empty($row['Correspondence6'])){
				$Correspondence6 = $row['Correspondence6'];
			}
			else{
				$Correspondence6 = null;
			}
			
			if (!empty($row['Correspondence7'])){
				$Correspondence7 = $row['Correspondence7'];
			}
			else{
				$Correspondence7 = null;
			}

			if (!empty($row['Correspondence8'])){
				$Correspondence8 = $row['Correspondence8'];
			}
			else{
				$Correspondence8 = null;
			}

			if (!empty($row['Correspondence9'])){
				$Correspondence9 = $row['Correspondence9'];
			}
			else{
				$Correspondence9 = null;
			}

			if (!empty($row['Correspondence10'])){
				$Correspondence10 = $row['Correspondence10'];
			}
			else{
				$Correspondence10 = null;
			}

			if (!empty($row['Correspondence11'])){
				$Correspondence11 = $row['Correspondence11'];
			}
			else{
				$Correspondence11 = null;
			}

			if (!empty($row['Correspondence12'])){
				$Correspondence12 = $row['Correspondence12'];
			}
			else{
				$Correspondence12 = null;
			}

			if (!empty($row['Correspondence13'])){
				$Correspondence13 = $row['Correspondence13'];
			}
			else{
				$Correspondence13 = null;
			}

			if (!empty($row['EdComments1'])){
				$EdComments1 = $row['EdComments1'];
			}
			else{
				$EdComments1 = null;
			}
	
			if (!empty($row['EdComments2'])){
				$EdComments2 = $row['EdComments2'];
			}
			else{
				$EdComments2 = null;
			}
	
			if (!empty($row['EdComments3'])){
				$EdComments3 = $row['EdComments3'];
			}
			else{
				$EdComments3 = null;
			}
	
			if (!empty($row['EdComments4'])){
				$EdComments4 = $row['EdComments4'];
			}
			else{
				$EdComments4 = null;
			}
	
			if (!empty($row['EdComments5'])){
				$EdComments5 = $row['EdComments5'];
			}
			else{
				$EdComments5 = null;
			}

			if (!empty($row['EdComments6'])){
				$EdComments6 = $row['EdComments6'];
			}
			else{
				$EdComments6 = null;
			}
			
			if (!empty($row['EdComments7'])){
				$EdComments7 = $row['EdComments7'];
			}
			else{
				$EdComments7 = null;
			}

			if (!empty($row['EdComments8'])){
				$EdComments8 = $row['EdComments8'];
			}
			else{
				$EdComments8 = null;
			}

			if (!empty($row['EdComments9'])){
				$EdComments9 = $row['EdComments9'];
			}
			else{
				$EdComments9 = null;
			}

			if (!empty($row['EdComments10'])){
				$EdComments10 = $row['EdComments10'];
			}
			else{
				$EdComments10 = null;
			}

			if (!empty($row['EdComments11'])){
				$EdComments11 = $row['EdComments11'];
			}
			else{
				$EdComments11 = null;
			}

			if (!empty($row['EdComments12'])){
				$EdComments12 = $row['EdComments12'];
			}
			else{
				$EdComments12 = null;
			}

			if (!empty($row['EdComments13'])){
				$EdComments13 = $row['EdComments13'];
			}
			else{
				$EdComments13 = null;
			}

			if (!empty($row['Summary'])){
				$Summary = $row['Summary'];
			}
			else{
				$Summary = null;
			}
	
			if (!empty($row['CurrentStatus'])){
				$CurrentStatus = $row['CurrentStatus'];
			}
			else{
				$CurrentStatus = null;
			}
	
			if (!empty($row['CurrentStatusAuthority'])){
				$CurrentStatusAuthority = $row['CurrentStatusAuthority'];
			}
			else{
				$CurrentStatusAuthority = null;
			}
	
			if (!empty($row['CurrentStatusDate'])){
				$CurrentStatusDate = $row['CurrentStatusDate'];
			}
			else{
				$CurrentStatusDate = null;
			}
	
			if (!empty($row['CurrentName'])){
				$CurrentName = $row['CurrentName'];
			}
			else{
				$CurrentName = null;
			}
	
			if (!empty($row['CurrentNameTID'])){
				$CurrentNameTID = $row['CurrentNameTID'];
			}
			else{
				$CurrentNameTID = null;
			}
	
			if (!empty($row['TypesInfo'])){
				$TypesInfo = $row['TypesInfo'];
			}
			else{
				$TypesInfo = null;
			}
	
			if (!empty($row['Updated'])){
				$Updated = $row['Updated'];
			}
			else{
				$Updated = null;
			}
	
			if (!empty($row['IsTerminal'])){
				$IsTerminal = $row['IsTerminal'];
			}
			else{
				$IsTerminal = null;
			}
	
			if (!empty($row['IsAccepted'])){
				$IsAccepted = $row['IsAccepted'];
			}
			else{
				$IsAccepted = null;
			}

			if (!empty($row['DistCode'])){
				$DistCode = $row['DistCode'];
			}
			else{
				$DistCode = null;
			}

	
//var_dump($row); 
//var_dump prints the whole row in a databased format
//which is useful for seeing what you're getting
//but is pretty ugly

		}
	}
	else{

//Before doing anything, if the TID isn't recognized, give a plain error screen
//Security mod to prevent cross-site scripting attacks
		echo "<br><br><h1>Taxon not recognized NAME=".$TaxonName."</h1><br><br>";
		header("Location: /eflora/search_icpn.php?name=".$TaxonName, true, 301);
		exit();
	}


//END TAXON ID AND NAME SQL QUERY ASSIGNMENT

date_default_timezone_set('America/Los_Angeles');


?>


<!DOCTYPE html>
<html lang="en">
<head>
    <title><?php echo strip_tags($ScientificName); ?> - ICPN Detail Page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Detailed Index to California Plant Names (ICPN) record for <?php echo strip_tags($ScientificName); ?>.">
    
    <!-- CSS Links -->
    <link href="/eflora/common/css/eflora-header.css" rel="stylesheet" type="text/css">
    <link href="/eflora/common/css/jepson-main.css" rel="stylesheet" type="text/css">
    <link href="common/css/icpn.css" rel="stylesheet" type="text/css" />

    <link rel="shortcut icon" href="/eflora/common/images/JepsonLogoSmall.png" type="image/x-icon" />

    <!-- Google tag (gtag.js) -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-JCLW1NZYB5"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());
      gtag('config', 'G-JCLW1NZYB5');
    </script>
</head>

<body>

<!-- Header Component -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/eflora-header.php'); ?>  

<main class="eflora-main">
    <header class="page-title-section">
        <h1><a href="/eflora/icpn/">Index to California Plant Names (ICPN)</a></h1>
    </header>

    <!-- return home link -->
<div class="center-text" style="margin-top: 30px;">
    <a href="/eflora/icpn/" style="font-weight: bold;">&larr; Return to the <i>ICPN</i> Search Page</a>
</div>

    <!-- Search Navigation Section -->
    <nav class="icpn-nav-block" aria-label="ICPN Navigation">        
        <div class="search-centered-container">
            <form action="/eflora/search_icpn.php" method="get" class="centered-form">
                <label for="icpn" class="visually-hidden">Search ICPN Scientific Name</label>
                <div class="input-row">
                    <input type="text" id="icpn" name="icpn" placeholder="Search another name..." required>
                    <div class="button-group">
                        <button type="submit" class="btn btn-submit">Submit</button>
                        <button type="reset" class="btn btn-reset">Reset</button>
                    </div>
                </div>
            </form>
        </div>
    </nav>

   <article class="taxon-hero-header">
        <h2>Scientific Name Details</h2>
        <h3 class="sci-name"><?php echo $ScientificName; ?></h3>
        <h4 class="family-name"><?php echo $Family; ?></h4>
    </article>

    <!-- SECTION 1: The Split Grid (Source Notes & Map) -->
    <div class="detail-grid">
        
        <!-- Left Column: Status & Notes -->
        <div class="taxon-content-left">
            <section class="status-box data-section">
                <?php if (!empty($IsTerminal)): ?>
                    <p class="status-msg accepted"><strong>Accepted:</strong> <?php echo $ScientificName; ?> is a Jepson eFlora accepted name.</p>
                    <a href="/eflora/eflora_display.php?tid=<?php echo $TaxonID; ?>" class="cta-link">View full eFlora Page &rarr;</a>
                <?php else: ?>
                    <?php if (!empty($CurrentName)): ?>
                        <p class="status-msg synonym"><strong>Synonym:</strong> This name is a synonym or variant.</p>
                        <p><strong>Current Accepted Name:</strong> <?php echo $CurrentName; ?></p>
                    <p><a href="/eflora/search_icpn.php?icpn=<?php echo $CurrentName; ?>" class="cta-link">View Accepted Name Page &rarr;</a></p>
                    <?php else: ?>
                        <p class="status-msg">ICPN name (not in Jepson eFlora).</p>
                    <?php endif; ?>
                <?php endif; ?>

                <div class="meta-info">
                    <?php if (!empty($CurrentStatus)) echo "<p><strong>Status:</strong> $CurrentStatus</p>"; ?>
                    <?php if (!empty($CurrentStatusDate)) echo "<p><strong>Analysis Date:</strong> $CurrentStatusDate</p>"; ?>
                    <?php if (!empty($CurrentStatusAuthority)) echo "<p><strong>Authority:</strong> $CurrentStatusAuthority</p>"; ?>
                </div>
            </section>

            <section class="notes-box data-section">
                <h3>Source and Publication Notes</h3>
                <div class="field-list">
                    <?php if (!empty($Source)) echo "<p><strong>Source:</strong>$Source</p>"; ?>
                    <?php if (!empty($SourceComments)) echo "<p><strong>Source Comments:</strong>$SourceComments</p>"; ?>
                    <?php if (!empty($AuthorNotes)) echo "<p><strong>Author Notes:</strong>$AuthorNotes</p>"; ?>
                    <?php if (!empty($PublicationNotes)) echo "<p><strong>Publication Notes:</strong>$PublicationNotes </p>"; ?>
                    <?php 
                        if (!empty($LiteratureA)) echo "<p><strong>Recent Literature:</strong> $LiteratureA  </p>"; 
                        if (!empty($LiteratureB)) echo "<p><strong>Recent Literature (2):</strong> $LiteratureB  </p>"; 
                        if (!empty($LiteratureC)) echo "<p><strong>Recent Literature (3):</strong> $LiteratureC  </p>"; 
                        if (!empty($LiteratureD)) echo "<p><strong>Recent Literature (4):</strong> $LiteratureD  </p>"; 
                    ?>
                </div>
            </section>
        </div>

        <!-- Right Column: Distribution Map -->
        <aside class="map-column">
            <div class="map-sticky-wrapper">
                <h3>California Distribution</h3>
                <?php if (!empty($DistCode)): ?>
                    <img src="/cgi-bin/eflora/new_jmap?<?php echo $DistCode; ?>" 
                         alt="Distribution map of <?php echo strip_tags($ScientificName); ?> in California"
                         class="dist-map">
                    <p class="map-caption">Bioregional distribution within California.</p>
                <?php else: ?>
                    <div class="no-map-placeholder"><p>No map data available.</p></div>
                <?php endif; ?>
            </div>
        </aside>
    </div> <!-- Close detail-grid -->

    <!-- SECTION 2: Full Width Row (Editorial Analysis) -->
    <!-- Placing this OUTSIDE the detail-grid ensures it goes full width -->
    <section class="editorial-full-width data-section">
        <h3>Editorial Analysis, Correspondence, and Comments</h3>
        <?php if (!empty($Summary)) echo "<p class='summary-text'><strong>Summary:</strong> $Summary</p>"; ?>
        
        <div class="correspondence-layout">
            <?php 
                for($i=1; $i<=13; $i++) {

                    $corr = "Correspondence".$i;
                    $ed = "EdComments".$i;
                    if (!empty($$corr) || !empty($$ed)) {
                        echo "<div class='comment-pair'>";
                        if (!empty($$corr)) echo "<p class='corr'><strong>Correspondence ($i):</strong> ".$$corr."</p>";
                        if (!empty($$ed)) echo "<p class='ed'><strong>Editorial Comment ($i):</strong> ".$$ed."</p>";
                        echo "</div>";
                    } else {
                    	$$corr = "";
                    	$$ed = "";
                    }
                }
            ?>
        <?php if (!empty($GeographicComment)) echo "<p><strong>Geographic Comment:</strong> $GeographicComment</p>"; ?>

        <!-- Synonymy / Misapplied names included in full-width row -->
        <?php if (!empty($TJMsynonyms) || !empty($OtherSynonyms)): ?>
            <div class="sub-data-section">
                <h4>TJM(1993) Synonymy</h4>
                <?php if (!empty($TJMsynonyms)) echo "<p><strong>Cited in TJM (1993):</strong> $TJMsynonyms</p>"; ?>
                <?php if (!empty($OtherSynonyms)) echo "<p><strong>Not cited in TJM:</strong> $OtherSynonyms</p>"; ?>
            </div>
        <?php endif; ?>

        <?php 

        if (!empty($TJMmisapplied) || !empty($JFPmisapplied)): ?>
            <div class="sub-data-section">
                <h4>Misapplied Names</h4>
                <?php if (!empty($TJMmisapplied)) echo "<p><strong>Misapplied in TJM (1993):</strong> $TJMmisapplied</p>"; ?>
                <?php if (!empty($JFPmisapplied)) echo "<p><strong>Current JFP Misapplied:</strong> $JFPmisapplied</p>"; ?>
            </div>
        <?php endif; ?>

		<?php if ( empty($Correspondence1) && empty($EdComments1) && empty($JFPmisapplied) && empty($TJMmisapplied) && empty($OtherSynonyms) && empty($TJMsynonyms) && empty($Summary) && empty($$corr) && empty($$ed) ): ?>
    		<p class="summary-text"><strong>No entries for this taxon.</strong></p>
		<?php endif; ?>

    </section>

    <!-- Citation Row -->
    <footer class="treatment-citation">
        <p><strong>Citation for this treatment:</strong> 
        Jepson Flora Project (eds.) <?php echo date("Y"); ?>, <?php echo $ScientificName; ?>, 
        in <em>Index to California Plant Names (ICPN)</em>, 
        /eflora/icpn/icpn_display.php?tid=<?php echo $TaxonID; ?>, accessed on <?php echo date("F d, Y"); ?>.</p>
    </footer>


<!-- Index Section -->
<section class="index-footer-wrap">
    <div class="search-group">
        <nav class="icpn-index-container" aria-labelledby="alpha-title">
            <!-- Alphabetical Index -->
            <h3 id="alpha-title" style="margin-top: 0;">Alphabetical Index to ICPN accepted names and synonyms</h3>
            <div class="index-bar" style="margin-bottom: 30px;">
                <?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/icpn/common/php/icpn_index_bar.html'); ?>
            </div>

            <!-- Numerical Index -->
            <h3 id="status-title">Index to Numerical Status Ranks for ICPN Scientific Names</h3>
            <div class="index-bar">
                <?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/icpn/common/php/status_index_bar.html'); ?>
            </div>
        </nav>
    </div>
</section>



    <!-- Feedback Area -->
    <section class="feedback-area center-text">
        <a class="googleForm" href="https://docs.google.com/forms/d/e/1FAIpQLSc_wrQXqB9gNPrOgUTZ9WN38Ub08JlmgaIha7Ua99sHGzMntA/viewform">
            Send us your feedback! Community input helps improve the Jepson eFlora.
        </a>
    </section>


</main> <!-- End eflora-main wrapper -->

<!-- Standardized Footer -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/eflora-footer.php'); ?>

</body>
</html>
<!--Eliminated Tables: Using a CSS Grid instead of <table> for layout is a major accessibility win. It allows the map to move below the text on mobile, preventing horizontal scrolling (WCAG Reflow).-->
<!--Sticky Map: On large screens, the map now stays visible while the user scrolls through long editorial notes (a great UX improvement).-->
<!--Semantic Headers: Each section uses logical <h3> and <h4> levels, helping screen reader users jump to specific data like "Source Notes" or "Correspondence."-->
<!--Italicized Taxonomy: Scientific names are consistently italicized throughout the template.-->
<!--Programmatic Labels: Every piece of data (Source, Correspondence, etc.) is clearly labeled with bold keys to meet AAA readability standards.-->
<!--Navigation Consistency: The top search and index bars match your other eFlora pages for a seamless user experience.-->
<!--PC View (Grid + Row): On large screens, the browser renders the detail-grid (Taxon Info + Map) as two columns. Once that div closes, the editorial-full-width section starts, which by default takes up 100% of the available horizontal space.-->
<!--Correspondence Layout: Inside the full-width editorial section, I added a grid-template-columns: 1fr 1fr for desktop. This allows the correspondence notes to sit side-by-side so the page doesn't become excessively long, while still using the full width of the screen.-->
<!--Mobile View: The media query display: block ensures that on phones, every single piece of data (Taxon info, Map, and Editorial notes) stacks in one single vertical column for easy scrolling.-->


<!--Visual Emphasis: Moving the Taxon name to its own full-width row makes it immediately obvious what the page is about.-->
<!--WCAG 2.2 AAA Contrast: The light gray background (#f8f9fa) with dark blue text provides a contrast ratio well above 7:1.-->
<!--Logical Flow: Users now see:-->
<!--What it is (Full-width Name/Family)-->
<!--How to navigate (Search/Index links)-->
<!--The specific data (Status & Map side-by-side)-->
<!--The deep history (Full-width Editorial Notes at bottom)-->
<!--Responsive Hierarchy: On mobile, the "Hero" header centers itself to act as a clear focal point before the user begins scrolling through the data.-->
<!--AAA Compliance: This maintains the 18px font size and ensures the map doesn't become too small, while providing high-contrast visual separation between the core taxon data and the lengthy editorial notes.-->


