<?php
date_default_timezone_set('America/Los_Angeles');

//Security mod to prevent cross-site scripting attacks
  if (isset($_GET['jfp'])){
	$SearchTerm = $_GET['jfp'];
	$SearchTerm = htmlspecialchars($SearchTerm);
	$SearchTerm = str_replace(chr(0),"", $SearchTerm);  #NULL BYTES
	$SearchTerm = trim($SearchTerm, $character_mask = "\s\t\n\r\0\x0B");
  }

//connect to the database
require '../../../herbariadb_data/eflora/config/config_eflora_mysql.php';
$db = mysqli_connect($db_host, $db_user, $db_pw, $db_name);

?>

<!DOCTYPE html>
 
<html lang="en">  

<head>
<title>ICPN Status Index Page</title> 
<meta charset="UTF-8">
<meta name="description" content="The Jepson eFlora is the foremost authority on the native and naturalized vascular plants of California. For plants occurring in wildlands or otherwise outside of cultivation, the Jepson eFlora contains taxonomic treatments, distribution maps, illustrations, photographs, and identification keys."  />
	<meta name="keywords" content="Jepson eFlora, Jepson Flora Project, California Flora, Flora of California, Vascular Plants of California">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="common/css/icpn.css" rel="stylesheet" type="text/css">
	<link href="/eflora/common/css/eflora-header.css" rel="stylesheet" type="text/css">

	<link rel="shortcut icon" href="/eflora/common/images/JepsonLogoSmall.png" type="image/x-icon">

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
		<h2>Status Index Page</h2>

<h2><a name="TOP" id="TOP">Vascular Plants of California</a></h2>
			<p class="keyLinkBoxText">
<!--icpn index-->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/icpn/common/php/icpn_index_bar.php'); ?>

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

<!--ICPN status-->
<br>
	<form action="/eflora/icpn/icpn_index.php" method="get">
		<label for="name">ICPN Status Category Search:</label>
		<input type="text" id="jfp" name="jfp" placeholder="Enter an alpha-numeric status..." required>
		<input type="submit" value="Submit Name">
		<INPUT type=reset value=Reset>
	</form>
			</div><!--close spacer_grey div-->
		</div><!--close index-container div-->
<!--end ICPN status-->

 </div>
<!-- Begin spacer block-->
		<div class="spacer_grey">

<p>
<a class="googleForm" href="https://docs.google.com/forms/d/e/1FAIpQLSc_wrQXqB9gNPrOgUTZ9WN38Ub08JlmgaIha7Ua99sHGzMntA/viewform">
	Send us your feedback and/or questions! Community input helps improve the Jepson eFlora.
	
</a>
</p>

<?php
//$SearchTerm must be a single capital letter
	if (preg_match("/^[0-9a-c]+$/", $SearchTerm)) {
		echo '<br><p class="BodyText"><h2>Status Index Page: '.$SearchTerm.'</h2></p>';
//perform a search that returns all names that start with a letter
//this is the same query as in search_eflora.php, but with a different WHERE clause

		$sql = "SELECT a.TaxonID, a.ScientificName, a.Family, ";
		$sql.= " a.CurrentStatus, a.CurrentStatusDate, a.CurrentName, a.CurrentNameTID ";
		$sql.= " FROM icpn a";
		$sql.= " LEFT JOIN eflora_taxa c ON a.TaxonID = c.TaxonID";
		$sql.= " WHERE a.CurrentStatus LIKE '".$SearchTerm."' ";//1a, for example
		$sql.= " ORDER BY a.Family, a.ScientificName";

//BEGIN temporary bug fix lines to add when needed
//echo '<br />'.$sql.'<br />';

		if(!mysqli_query($db, $sql)){
			die('Error: ' . mysqli_error($db));
		}


		$result = mysqli_query($db, $sql);
		
		echo '<table class="eFloraTable"><tr><th>Family</th><th>Scientific Name</th><th>Status</th><th>Status Date</th><th>CurrentName</th></tr>';

		// Check if any rows were returned
		if (mysqli_num_rows($result) > 0) {
		// If rows exist, loop through them
			while ($row = mysqli_fetch_array($result)) {

//BEGIN temporary bug fix lines to add when needed
//foreach ($row as $key=>$value) {
//    echo $key."<br />";
//}
//END temp bug fix lines
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

				if (!empty($row['Family'])){
					$fam = $row['Family'];
				}
				else{
					$fam = null;
				}

				if (!empty($row['CurrentStatus'])){
					$status = $row['CurrentStatus'];
				}
				else{
					$status = null;
				}

				if (!empty($row['CurrentStatusDate'])){
					$date = $row['CurrentStatusDate'];
				}
				else{
					$date = null;
				}

				if (!empty($row['CurrentName'])){
					$acc = $row['CurrentName'];
				}
				else{
					$acc = null;
				}

	  				if( (!empty($family)) && (!empty($status)) ){
	  				//if the record does not have family or status lines
	  				//then it is incomplete and we do not want it displayed online
						if( (!empty($SciName)) && (!empty($TID)) ){ //if it has an ScientificName and a Taxon ID, then it's a valid name line
							if(!empty($acc) {
								echo '<tr><td><a href="/eflora/icpn/icpn_display.php?tid='.$TID.'">'.$SciName.'</a>';
								echo '</td>';
								echo '<td>'.$fam.'</td>';
								echo '<td>'.$status.'</td>';
								echo '<td>'.$date.'</td>';
								echo '<td>'.$acc.'</td>';
								echo '</tr>';
							}else{
								echo '<tr><td><a href="/eflora/icpn/icpn_display.php?tid='.$TID.'">'.$SciName.'</a>';
								echo '</td>';
								echo '<td>'.$fam.'</td>';
								echo '<td>'.$status.'</td>';
								echo '<td>'.$date.'</td>';
								echo '<td>accepted</td>';
								echo '</tr>';
							}
						}
					}
				//do not print incomplete entries without both a tid, a name, a family and a status,
				//they are errors that need fix
			}//close while loop

		} else {
			//close eflora table
			echo '</table><br><br>';
			echo '<p class="feedbackLink">'.$SearchTerm;
			echo ' was not found in the ICPN database.<br><br>';
			echo 'There is currently nothing assigned to this JFP Status Category. Please select another status category above.</p><br><br>';
		}
	} else {
		echo '<br><p class="feedbackLink">';
		echo 'Invalid Status Category. Please select another status link above.</p><br><br>';
	}

	//close eflora table
	echo '</table>';
?>

	</div> 


</main>
<!--CLOSE ALL Main divisions, tables -->

	<div class ="spacer_grey">
<!--begin footer-->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/eflora-footer.php'); ?>
<!--end footer-->
	</div>
</body>
</html>


