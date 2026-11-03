<?php
date_default_timezone_set('America/Los_Angeles');

//old code
//$SearchTerm = htmlspecialchars($_GET["index"]);

//Security mod to prevent cross-site scripting attacks
if (isset($_GET['index'])) {
	$SearchTerm = $_GET['index'];
	$SearchTerm = htmlspecialchars($SearchTerm);
	$SearchTerm = str_replace(chr(0), "", $SearchTerm);  #NULL BYTES
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
	<title>Index Page, California Flora, Jepson eFlora</title>
	<meta charset="UTF-8">
	<meta name="keywords" content="California Flora, Jepson eFlora, Flora of California, Vascular Plants of California, Jepson Flora Project, ">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link href="/eflora/common/css/dropdowns.css" rel="stylesheet" type="text/css" />
	<link href="/eflora/common/css/jepson_eflora.css" rel="stylesheet" type="text/css" />
	<link rel="shortcut icon" href="/eflora/common/images/JepsonLogoSmall.png" type="image/x-icon" />

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




</head>

<style type="text/css">
	.large-image {
		box-shadow: 1px 1px 3px 3px rgba(127, 127, 127, 0.15);
		width: 140px;
		height: auto;
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

	.dropdown-content a:hover {
		background-color: black;
	}

	.dropdown:hover .dropdown-content {
		display: inline;
	}

	.dropdown:hover .dropbtn {
		background-color: black;
	}

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


<!-- Begin banner -->

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

				<h1><a href="/eflora/">Jepson eFlora:</a> Index Page<h1>

						<p class="pageMajorHeading"><a name="TOP" id="TOP">Vascular Plants of California</a></p>

						<p class="pageAuthorLine">
							<a href="/IJM_keys/IJM_fam_key.html">Key to families</a>
							|
							<a href="/IJM_keys/toc.html">Table of families and genera</a>
						</p>


						<form action="/eflora/search_eflora.php" method="POST">
							<label><b>Scientific Name</b></label><br />
							<input type="text" id="query_text" name="query">
							<input type="submit" value="Submit Name" />
						</form>

						<?php
						//$SearchTerm must be a single capital letter
						if (preg_match("/^[A-Z]$/", $SearchTerm)) {
							echo '<br /><p class="bodyText"><h1>Index Page: ' . $SearchTerm . '</h1></p>';

							//perform a search that returns all names that start with a letter
							//this is the same query as in search_eflora.php, but with a different WHERE clause
							$stmt = $db->prepare("SELECT a.ScientificName as ScientificName, a.TaxonID as TaxonID, a.CommonName as CommonName, a.Status as Status, a.IsTerminalTaxon as IsTerminalTaxon, a.HasKey as HasKey, a.AcceptedNameTID as AcceptedNameTID, b.ScientificName as AcceptedName
						FROM eflora_taxa a
						LEFT OUTER JOIN eflora_taxa b on a.AcceptedNameTID = b.TaxonID
						WHERE a.ScientificName LIKE '" . $SearchTerm . "%'
						ORDER BY ScientificName");
							$results = $stmt->execute();

							echo '<div class="eFloraTable custom-eflora-table"><table>';
							echo '<tr><th>Scientific Name</th><th>Common Name</th><th>Status</th></tr>';

							while ($row = $results->fetchArray()) {

								// If no results are found, echo a message and stop
								if ($row == false) {
									echo '<i>' . $SearchTerm . '</i> was not found in the eFlora name list.<br>';
									echo 'Try another search, or try searching the <a href="/interchange/">Jepson Online Interchange</a>.<br>';
									exit;
								}


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
							#}
							#else {
							#	echo '<i>'.$SearchTerm.'</i> was not found in the eFlora name list.<br>
							#	Try another search, or try searching the <a href="/interchange/">Jepson Online Interchange</a>.<br>';
							#}
							#	echo '</table></div>';
							#}
						} else {
							echo '<br /><p><span class="feedbackLink">';
							echo 'Invalid index URL. Please use the index links above.</p><br /><br /><span>';
						}

						?>
						<br>
						<p class=bodyText><a href="https://docs.google.com/forms/d/e/1FAIpQLSc_wrQXqB9gNPrOgUTZ9WN38Ub08JlmgaIha7Ua99sHGzMntA/viewform">Please use this Google Form for Contact/Feedback</a>

							<!-- End body section-->

			</td>
		</tr>
	</table> <!--close content table-->

	<!-- Begin footer -->
	<?php include($_SERVER['DOCUMENT_ROOT'] . '/eflora/common/php/footer.php'); ?>
	<!-- End footer -->



</body>

</html>