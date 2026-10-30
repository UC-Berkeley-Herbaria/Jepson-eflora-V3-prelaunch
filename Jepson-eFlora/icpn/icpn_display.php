
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
	
			if (!empty($row['Source'])){
				$Source = $row['Source'];
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
	
			if (!empty($row['Literature'])){
				$Literature = $row['Literature'];
			}
			else{
				$Literature = null;
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

<title> <?php echo "$ScientificName" ?> ICPN Page</title>
<meta charset="UTF-8">
<meta name="description" content="For vascular plants occurring in wildlands or otherwise outside of cultivation in California, the Jepson eFlora contains taxonomic treatments, distribution maps, illustrations, photographs, and identification keys.">
  <meta name="keywords" content="California Flora, Jepson eFlora, Flora of California, Vascular Plants of California, Jepson Flora Project, ">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="common/css/icpn.css" rel="stylesheet" type="text/css" />
	<link href="/eflora/common/css/eflora-header.css" rel="stylesheet" type="text/css">
	<link href="/eflora/common/css/jepson-main.css" rel="stylesheet" type="text/css">

<link rel="shortcut icon" href="/eflora/common/images/JepsonLogoSmall.png" type="image/x-icon" />

<!--mobile js script files-->
<script src="/eflora/common/js/dh_custom.js"></script>

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

<!-- Begin banner -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/eflora-header.php'); ?>  
<!-- End banner -->

<main>
	<div id="content-top">
		<h1><a class="efTitle" href="/eflora/icpn/">Index to California Plant Names (ICPN)</a></h1>
		<h2>Scientific Name Details Page</h2>
<br>
<h2><a name="TOP" id="TOP">Vascular Plants of California</a></h2>
			<p class="keyLinkBoxText">
<!--icpn index-->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/icpn/common/php/icpn_index_bar.php'); ?>
			</p>	  

			<p class="keyLinkBoxText">
<!--status index-->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/icpn/common/php/status_index_bar.php'); ?>

			</p>	  


<!--ICPN index-->
<br>
	<form action="/eflora/search_icpn.php" method="get">
		<label for="name">ICPN Scientific Name Search:</label>
		<input type="text" id="icpn" name="icpn" placeholder="Enter a scientific name..." required>
		<input type="submit" value="Submit Name">
		<INPUT type=reset value=Reset>
	</form>
			</div><!--close spacer_grey div-->
		</div><!--close index-container div-->
<!--end ICPN index-->

<!--ICPN status index-->

	</div><!--end top content div-->

	<div id="content">

<?php
//START TAXON treatment table
//define based on presence of RIGHT SIDE BLOCK MAP section

//if dist code exists, there are two table cells, else there is one
	if (!empty($DistCode)){
		echo '<table id = "EF_right"><tr><td>';
	}
	else {
		$DistCode = null;
		echo '<table id = "EF_citation"><tr><td>';
	}

//END illustration/video type section

//START LEFT SIDE BLOCK, FIRST ROW, taxon descriptions

//print the focal taxon block
	echo '<div class="pageMajorHeading"><h3><b>'.$ScientificName.'</b></h3><br></div>';
	echo '<div class="pageMajorHeading"><h3><b>'.$Family.'</b></h3><br></div>';
	echo '<div class="spacer_grey"><span class="BodyText">';
		if (!empty($IsAccepted)){ 
			echo '<b>'.$ScientificName.'</b> is a Jepson eFlora accepted name<br>';
			echo '<p><a href="/eflora/eflora_display.php?tid='.$TaxonID.'">Click here to view the Jepson eFlora page for '.$ScientificName.'</a>.</p>';
		} else {
			if (!empty($CurrentName)){ 
				echo '<b>'.$ScientificName.'</b> is a synonym or orthographic variant<br>';
				echo '<b>Current Accepted Name: </b>'.$CurrentName.'<br>';
			} else {
				echo '<b>'.$ScientificName.'</b> is an ICPN accepted name, not in the Jepson eFlora<br>';
			}
		}
		if (!empty($CurrentStatus)){ echo '<b>Current Status:</b> '.$CurrentStatus.'<br>';}
		if (!empty($CurrentStatusDate)){ echo '<b>Date of Editorial Analysis:</b> '.$CurrentStatusDate.'<br>';}
		if (!empty($CurrentStatusAuthority)){ echo '<b>Current Status Authority:</b> '.$CurrentStatusAuthority.'<br>';}
	echo '</span><br></div>';
	echo '<div class="pageMajorHeading"><h3>Source and Publication Notes</h3></div><br>';
	echo '<div class="spacer_grey"><span class="BodyText">';
		if (!empty($Source)){ echo '<b>Source:</b> '.$Source.'<br>';}
		if (!empty($SourceComments)){ echo '<b>Source Comments:</b> '.$SourceComments.'<br>';}
		if (!empty($AuthorNotes)){ echo '<b>Author Notes:</b> '.$AuthorNotes.'<br>';}
		if (!empty($PublicationNotes)){ echo '<b>Publication Notes:</b> '.$PublicationNotes.'<br>';}
		//if (!empty($TypesInfo)){ echo '<b>UC/JEPS Type Info:</b> '.$TypesInfo.'<br>';}
		if (!empty($LiteratureA)){ echo '<b>Recent Literature:</b> '.$LiteratureA.'<br>';}
		if (!empty($LiteratureB)){ echo '<b>Recent Literature(2):</b> '.$LiteratureB.'<br>';}
		if (!empty($LiteratureC)){ echo '<b>Recent Literature(3):</b> '.$LiteratureC.'<br>';}
		if (!empty($LiteratureD)){ echo '<b>Recent Literature(4):</b> '.$LiteratureD.'<br>';}
	echo '</span><br></div>';
	echo '<div class="pageMajorHeading"><h3>Editorial Analysis, Correspondence, and Comments</h3></div><br>';
	echo '<div class="spacer_grey"><span class="BodyText">';
		if (!empty($Summary)){ echo '<b>Editorial Summary:</b> '.$Summary.'<br><br>';}
		if (!empty($Correspondence1)){ echo '<b>&nbsp;&nbsp;Correspondence(1):</b> '.$Correspondence1.'<br>';}
		if (!empty($EdComments1)){ echo '<b>&nbsp;&nbsp;Editorial Comments(1):</b> '.$EdComments1.'<br>';}
		if (!empty($Correspondence2)){ echo '<b>&nbsp;&nbsp;Correspondence(2):</b> '.$Correspondence2.'<br>';}
		if (!empty($EdComments2)){ echo '<b>&nbsp;&nbsp;Editorial Comments(2):</b> '.$EdComments2.'<br>';}
		if (!empty($Correspondence3)){ echo '<b>&nbsp;&nbsp;Correspondence(3):</b> '.$Correspondence3.'<br>';}
		if (!empty($EdComments3)){ echo '<b>&nbsp;&nbsp;Editorial Comments(3):</b> '.$EdComments3.'<br>';}
		if (!empty($Correspondence4)){ echo '<b>&nbsp;&nbsp;Correspondence(4):</b> '.$Correspondence4.'<br>';}
		if (!empty($EdComments4)){ echo '<b>&nbsp;&nbsp;Editorial Comments(4):</b> '.$EdComments4.'<br>';}
		if (!empty($Correspondence5)){ echo '<b>&nbsp;&nbsp;Correspondence(5):</b> '.$Correspondence5.'<br>';}
		if (!empty($EdComments5)){ echo '<b>&nbsp;&nbsp;Editorial Comments(5):</b> '.$EdComments5.'<br>';}
		if (!empty($Correspondence6)){ echo '<b>&nbsp;&nbsp;Correspondence(6):</b> '.$Correspondence6.'<br>';}
		if (!empty($EdComments6)){ echo '<b>&nbsp;&nbsp;Editorial Comments(6):</b> '.$EdComments6.'<br>';}
		if (!empty($Correspondence7)){ echo '<b>&nbsp;&nbsp;Correspondence(7):</b> '.$Correspondence7.'<br>';}
		if (!empty($EdComments7)){ echo '<b>&nbsp;&nbsp;Editorial Comments(7):</b> '.$EdComments7.'<br>';}
		if (!empty($Correspondence8)){ echo '<b>&nbsp;&nbsp;Correspondence(8):</b> '.$Correspondence8.'<br>';}
		if (!empty($EdComments8)){ echo '<b>&nbsp;&nbsp;Editorial Comments(8):</b> '.$EdComments8.'<br>';}
		if (!empty($Correspondence9)){ echo '<b>&nbsp;&nbsp;Correspondence(9):</b> '.$Correspondence9.'<br>';}
		if (!empty($EdComments9)){ echo '<b>&nbsp;&nbsp;Editorial Comments(9):</b> '.$EdComments9.'<br>';}
		if (!empty($Correspondence10)){ echo '<b>&nbsp;&nbsp;Correspondence(10):</b> '.$Correspondence10.'<br>';}
		if (!empty($EdComments10)){ echo '<b>&nbsp;&nbsp;Editorial Comments(10):</b> '.$EdComments10.'<br>';}
		if (!empty($Correspondence11)){ echo '<b>&nbsp;&nbsp;Correspondence(11):</b> '.$Correspondence11.'<br>';}
		if (!empty($EdComments11)){ echo '<b>&nbsp;&nbsp;Editorial Comments(11):</b> '.$EdComments11.'<br>';}
		if (!empty($Correspondence12)){ echo '<b>&nbsp;&nbsp;Correspondence(12):</b> '.$Correspondence12.'<br>';}
		if (!empty($EdComments12)){ echo '<b>&nbsp;&nbsp;Editorial Comments(12):</b> '.$EdComments12.'<br>';}
		if (!empty($Correspondence13)){ echo '<b>&nbsp;&nbsp;Correspondence(13):</b> '.$Correspondence13.'<br>';}
		if (!empty($EdComments13)){ echo '<b>&nbsp;&nbsp;Editorial Comments(13):</b> '.$EdComments13.'<br>';}

		if (!empty($GeographicComment)){ echo '<b>Geographic Comment:</b> '.$GeographicComment.'<br>';}
	echo '</span><br></div>';
  if( (!empty($TJMsynonyms)) || (!empty($OtherSynonyms)) ){
	echo '<div class="pageMajorHeading"><h3>TJM(1993) Synonymy</h3></div><br>';
	echo '<div class="spacer_grey"><span class="BodyText">';
		if (!empty($TJMsynonyms)){ echo '<b>Synonyms Cited in The Jepson Manual (1993):</b> '.$TJMsynonyms.' ';}
		if (!empty($OtherSynonyms)){ echo '<b>Synonyms Not Cited in The Jepson Manual:</b> '.$OtherSynonyms.' ';}
	echo '</span><br></div>';
  }
  if( (!empty($TJMmisapplied)) || (!empty($JFPmisapplied)) ){
	echo '<div class="pageMajorHeading"><h3>Misapplied Names</h3></div><br>';
	echo '<div class="spacer_grey"><span class="BodyText">';
		if (!empty($TJMmisapplied)){ echo '<b>Misapplied Names Cited in The Jepson Manual (1993):</b> '.$TJMmisapplied.' ';}
		if (!empty($JFPmisapplied)){ echo '<b>Current Jepson Flora Project Misapplied Names:</b> '.$JFPmisapplied.' ';}
	echo '</span><br></div>';
  }
  
//END LEFT SIDE BLOCK, FIRST ROW, taxon descriptions

//END RIGHT SIDE BLOCK, FIRST ROW, Geographic subdivisions title & MAP
///usr/local/web/herbariadb_cgi/eflora/new_jmap


//if (!empty($DistCode)) {
//    echo '</td><td>';
//    echo '<p class="smallText">';
    
    // The 'src' points to your proxy script, carrying the SQL value in the URL
//    echo '<img src="new_jmap_proxy.php?code=' . urlencode($DistCode) . '" border="0" alt="map of California distribution of ' . htmlspecialchars($ScientificName) . '">';
    
//    echo '</p></td>';
//} else {
//    echo '</td>';
//}

	if (!empty($DistCode)) {
		echo '</td><td>';
		echo '<p class=smallText>';
		//echo '<img src="new_jmap_proxy.php?code='.$DistCode.'" border="0" alt="map of California distribution of '.$ScientificName.'">';
		echo '<img src="/cgi-bin/eflora/new_jmap?'.$DistCode.'" border="0" alt="map of California distribution of '.$ScientificName.'">';
		echo '</p></td>';
	}
	else{
		$DistCode = null;
		echo '<p class=smallText>NO CODE</p></td>';
		echo '</td>';
	}


echo '</tr></table>';

?>

<!--END FIRST ROW Description SECTION, CLOSE TABLE-->
</div>

<!--START SECOND ROW Citation SECTION-->

<div class="spacer_grey">

<p>
<a class="googleForm" href="https://docs.google.com/forms/d/e/1FAIpQLSc_wrQXqB9gNPrOgUTZ9WN38Ub08JlmgaIha7Ua99sHGzMntA/viewform">
	Send us your feedback and/or questions! Community input helps improve the Jepson eFlora.
	
</a>
</p>


<p class=smallText>

<?php 
	echo "Citation for this treatment: ";
	  echo "Jepson Flora Project (eds.) ";
	  echo date ("Y");
	  echo ", <i>".$ScientificName."</i>, ";
	  echo "in <em>Index to California Plant Names (ICPN)</em>, ";
	  echo "/eflora/icpn/icpn_display.php?tid=".$TaxonID.", accessed on "; 
	  echo date ("F d, Y");
	  echo ".";
	  
?>

</p>
</div>
<!--END SECOND ROW Citation SECTION-->


</div>
</main>
<!--CLOSE ALL Main divisions -->
<div class="spacer_grey">
<!--begin footer-->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/eflora-footer.php'); ?>
<!--end footer-->
</div>

</body>
</html>
