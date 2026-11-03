<?php
date_default_timezone_set('America/Los_Angeles');


//get user input from POST
if (isset($_POST['query'])) {
	$SearchTerm = $_POST['query'];
} elseif (isset($_GET['name'])) {
	$SearchTerm = $_GET['name'];
} else {
	echo '<br /><p><span class="feedbackLink">';
	echo '<i>' . $SearchTerm . '</i> --> Search term invalid.</span></p>';
	echo '<p><b>Try another search, or try searching the <a href="/interchange/">Jepson Online Interchange</a>.</p><br /><br />';
	$SearchTerm = "";
	exit;
}
//connect to the database
require 'config/config.php';
$db = new SQLite3($database_location);
?>
<!DOCTYPE html>

<html lang="en">

<head>
	<title>Search Page - Jepson eFlora</title>

	<meta charset="UTF-8">
	<meta name="description" content="For vascular plants occurring in wildlands or otherwise outside of cultivation in California, the Jepson eFlora contains taxonomic treatments, distribution maps, illustrations, photographs, and identification keys.">
	<meta name="keywords" content="California Flora, Jepson eFlora, Flora of California, Vascular Plants of California, Jepson Flora Project, ">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link href="/eflora/common/css/dropdowns.css" rel="stylesheet" type="text/css" />
	<link href="/eflora/common/css/jepson_eflora.css" rel="stylesheet" type="text/css" />
	<link rel="shortcut icon" href="/common/images/JepsonLogoSmall.png" type="image/x-icon" />
	<!--jquery script files-->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="/eflora/common/js/dh_custom.js"></script>


	<!-- Google tag (gtag.js) -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=G-T5YC99QF6Q"></script>
	<script>
		window.dataLayer = window.dataLayer || [];

		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());

		gtag('config', 'G-T5YC99QF6Q');
	</script>

	<!-- Begin banner -->
	<style>
		@media screen and (max-width: 600px) {
			.custom-eflora-table table tr:first-child {
				display: none;
			}

			.custom-eflora-table table tr {
				border-bottom: 3px solid #c7d4e1;
				display: block;
			}

			.eFloraTable.custom-eflora-table table td {
				border-bottom: 1px solid #c7d4e1;
				display: block;
				font-size: 12px;
				text-align: right;
				background-color: transparent;
				background: none;
				padding: 8px;
			}

			.custom-eflora-table table td::before {
				/*
    * aria-label has no advantage, it won't be read inside a table
    content: attr(aria-label);
    */
				content: attr(data-label);
				float: left;
				font-weight: bold;
			}

			.custom-eflora-table table td:last-child {
				border-bottom: 0;
			}
		}
	</style>

</head>

<body>
	<!-- Begin banner -->
	<?php include($_SERVER['DOCUMENT_ROOT'] . '/eflora/common/php/header_jeps.php'); ?>
	<!-- End banner -->

	<!-- Beginning of horizontal menu -->
	<?php include($_SERVER['DOCUMENT_ROOT'] . '/eflora/common/php/globalnav.php'); ?>
	<!-- End of horizontal menu -->


	<table width="100%"><!-- content table -->
		<tr>
			<td style="vertical-align: top;">
				<table id="sideLinks">
					<tr>
						<td style="vertical-align: top;"><!-- <<background test>> -->
							<!-- Start of sidebar menu-->
							<?php include($_SERVER['DOCUMENT_ROOT'] . '/eflora/common/php/localnav_eflora_primary.php'); ?>
							<!-- End of sidebar -->
						</td>
					</tr>
				</table>
			</td>
			<td style="padding-left: 15px;vertical-align: top;width=80%;">

				<h1><a href="/eflora/">Jepson eFlora:</a> Search Page</h1>
				<!-- Begin spacer block-->
				<div class="spacer_spacer_blue">
					<p class="pageMajorHeading"><a name="TOP" id="TOP">Vascular Plants of California</a></p>
					<p class="pageAuthorLine">
						<a href="/IJM_keys/IJM_fam_key.html">Key to families</a>
						|
						<a href="/IJM_keys/toc.html">Table of families and genera</a>
					</p>
				</div>
				<!-- Begin spacer block-->
				<div class="spacer_spacer_blue">
					<!--eFlora index-->
					<?php include($_SERVER['DOCUMENT_ROOT'] . '/eflora/common/php/eflora_index_bar.php'); ?>

				</div>
				<p>&nbsp;</p>
				<!-- Begin spacer block-->
				<div class="spacer_spacer_blue">

					<form action="/eflora/search_eflora.php" method="POST">
						<label><b>Scientific Name<br></b></label>
						<input type="text" id="query_text" name="query"></input>
						<input type="submit" value="Submit Name" />
					</form>
					<p>&nbsp;</p>
					<?php

					if (isset($SearchTerm)) {
						$SearchTerm = trim($SearchTerm, $character_mask = " \t\n\r\0\x0B");

						//Security mod to prevent cross-site scripting attacks
						$SearchTerm = preg_replace("/[^a-zA-Z-\s.]/", "", $SearchTerm);

						echo '<p class="bodyText">You searched for: "' . $SearchTerm . '"<p>';
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
						WHERE a.ScientificName LIKE '" . $SearchTerm . "%' OR b.ScientificName LIKE '%" . $SearchTerm . "%'
						ORDER BY ScientificName");
						$results = $stmt->execute();

						$resultWasEmpty = true;

						echo '<div class="eFloraTable custom-eflora-table"><table>';
						echo '<tr><th>Scientific Name</th><th>Common Name</th><th>Status</th></tr>';

						//	  echo '<div class="eFloraTable"><table border="1">';
						//		echo '<tr ><td><span class="tdTitle">Scientific Name</span></td><td><span class="tdTitle">Common Name</span></td><td><span class="tdTitle">Status</span></td></tr>';

						while ($row = $results->fetchArray()) {



							// If no results are found, echo a message and stop
							if ($row == false) {
								echo '<br /><p><span class="feedbackLink">';
								echo '<i>' . $SearchTerm . '</i> was not found in the eFlora name list.</span></p><br />';
								echo '<p><b>Try another search, or try searching the <a href="/interchange/">Jepson Online Interchange</a>.</p><br /><br />';
								exit;
							}

							$resultWasEmpty = false;

							if ($row['AcceptedNameTID']) { //if it has an AcceptedNameTID, then it's a synonym, so print the synonym line
								$row['Status'] = str_replace("Noted Name", "Mentioned in<br>a note", $row['Status']);
								echo '<tr><td data-label="Scientific Name"><a href="/eflora/eflora_display.php?tid=' . $row['AcceptedNameTID'] . '">' . $row['ScientificName'] . '</a><br>(Under ' . $row['AcceptedName'] . ')</td>';
								echo '<td data-label="Common Name">' . ($row['CommonName'] ? $row['CommonName'] : '&nbsp;') . '</td>';
								echo '<td data-label="Status">' . ($row['Status'] ? ucfirst(strtolower($row['Status'])) : '&nbsp;') . '</td>';
								echo '</tr>';
							} else { //else it is an accepted name, so print the full line
								echo '<tr><td data-label="Scientific Name"><a href="/eflora/eflora_display.php?tid=' . $row['TaxonID'] . '">' . $row['ScientificName'] . '</a>';
								if ($row['HasKey']) { //if it has a key, add the key text under the name
									echo '<br>&nbsp;&nbsp;<a href="/eflora/eflora_keys.php?key=' . $row['TaxonID'] . '">&#x21b3;&nbsp;&nbsp;Key to ' . $row['ScientificName'] . '</td>';
								} else {
									echo '</td>';
								}
								echo '<td data-label="Common Name">' . ($row['CommonName'] ? $row['CommonName'] : '&nbsp;') . '</td>';
								echo '<td data-label="Status">' . ($row['Status'] ? ucfirst(strtolower($row['Status'])) : '&nbsp;') . '</td>';
							}
						}

						echo '</table></div>';

						if ($resultWasEmpty) {
							echo '<br /><p><span class="feedbackLink">';
							echo $SearchTerm . ' was not found or is not a scientific name.</span></p><br />';
							echo '<p><b>Try another search, or try searching the <a href="/interchange/">Jepson Online Interchange</a>.</p><br /><br />';
						}


						#}
						#else {
						#	echo '<i>'.$SearchTerm.'</i> was not found in the eFlora name list.<br>
						#	Try another search, or try searching the <a href="/interchange/">Jepson Online Interchange</a>.<br>';
						#}
					} else {
						echo 'No search term entered. Please enter a search term above<br>';
					}

					?>
				</div>
				<p>&nbsp;</p>
				<!--<a href="mailto:interchange@lists.berkeley.edu"><span class="feedbackLink">Feedback/Contact<span></a><br>
-->
				<p class=bodyText><a href="https://docs.google.com/forms/d/e/1FAIpQLSc_wrQXqB9gNPrOgUTZ9WN38Ub08JlmgaIha7Ua99sHGzMntA/viewform">Please use this Google Form for Contact/Feedback</a>

			</td>
		</tr>
	</table>



	<!--Begin footer-->
	<?php include($_SERVER['DOCUMENT_ROOT'] . '/eflora/common/php/footer.php'); ?>
	<!--End footer-->



</body>

</html>