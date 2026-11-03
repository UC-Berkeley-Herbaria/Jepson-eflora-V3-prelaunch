<?php
date_default_timezone_set('America/Los_Angeles');

//Security mod to prevent cross-site scripting attacks
$TaxonID = htmlspecialchars($_GET["key"]);
$TaxonID = str_replace(chr(0), "", $TaxonID);  #NULL BYTES
$TaxonID = trim($TaxonID, $character_mask = " \t\n\r\0\x0B");
$TaxonID = preg_replace("/[^0-9]/", "", $TaxonID);


require 'config/config.php';
$db = new SQLite3($database_location);

$results = $db->query('SELECT ID, TaxonID, ScientificName, HasKey, KeyText
						FROM eflora_keys
						WHERE TaxonID=' . $TaxonID . ''); //16711 is the TaxonID for Calochortus amabilis, for example

while ($row = $results->fetchArray()) {


	$ID = $row['ID'];
	$TID = $row['TaxonID'];
	$ScientificName = $row['ScientificName'];
	$FormattedKey = $row['KeyText'];
	$has_key = $row['HasKey'];

	//var_dump($row);
	/*var_dump prints the whole row in a databased format
which is useful for seeing what you're getting
but is pretty ugly
*/
}


//Before doing anything, if the TID isn't recognized, give a plain error screen
if (!$TID) { //if TaxonID (pulled from URL) did not match a line in the database...
	echo "Taxon not recognized TID=" . $TaxonID;


	header("Location: https://ucjeps.berkeley.edu/cgi-bin/get_cpn?" . $TaxonID, true, 301);
	exit();
}
?>


<?php

date_default_timezone_set('America/Los_Angeles');

?>
<!DOCTYPE html>

<html lang="en">
<?php
// TID is passed to JS by using PHP to echo the value of $TaxonID to a JS variable TaxID
// Apparently there are better ways to do this using AJAX

?>
<html lang="en">

<head>
	<title><?php echo "$ScientificName" ?> key to species, California Flora, Jepson eFlora</title>
	<meta charset="UTF-8">
	<meta name="keywords"
		content="California Flora, Jepson eFlora, Flora of California, Vascular Plants of California, Jepson Flora Project, ">
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
	</style>

	<script>
		window.onload = setInterval(clock, 1000);

		function clock() {
			var d = new Date();
			var yr = d.getFullYear();
			var month = d.getMonth();
			var monthArr = ["January", "February", "March", "April", "May", "June", "July", "August", "September",
				"October", "November", "December"
			];
			month = monthArr[month];
			var date = d.getDate();
			document.getElementById("year").innerHTML = yr;
			document.getElementById("month").innerHTML = month + " " + yr;
			document.getElementById("day").innerHTML = date;
		}
	</script>

	<!-- Begin banner -->

</head>

<body>
	<table id="normaltable">
		<tr>
			<td></td>
			<td>
				<table>
					<!-- content table -->
					<tr>
						<td>
							<div>
								<!-- Begin banner -->
								<?php include($_SERVER['DOCUMENT_ROOT'] . '/eflora/common/php/header_jeps.php'); ?>
								<!-- End banner -->

								<!-- Beginning of horizontal menu -->
								<?php include($_SERVER['DOCUMENT_ROOT'] . '/eflora/common/php/globalnav.php'); ?>
								<!-- End of horizontal menu -->
							</div>

							<div
								style="border-left-style: solid;border-left-color: #C0DFFD;border-right-style: solid;border-right-color: #C0DFFD;">
								<!-- Begin content divider -->
								<table style="background-color: #E6F3FF">
									<!-- content table -->
									<tr>
										<td style="vertical-align: top;">
											<table id="sideLinks" style="width=10vw;">
												<tr>
													<td style="vertical-align: top;">
														<!-- <<background test>> -->
														<!-- Start of sidebar menu-->
														<?php include($_SERVER['DOCUMENT_ROOT'] . '/eflora/common/php/localnav_eflora_primary.php'); ?>
														<!-- End of sidebar -->
													</td>
												</tr>
											</table>
										</td>
										<td style="border-left-style: solid;border-left-color: #C0DFFD;"></td>
										<td style="padding-top: 5px;vertical-align: top;width=90vw;">
											<table>
												<tr>
													<td style="padding-top: 0;vertical-align: top;">
														<div id="content-top">
															<table border="0">
																<tr>
																	<td><span class="pageName"><a href="/eflora/">Jepson
																				eFlora:</a> Key page</span></td>

																</tr>
																<tr>
																	<td><span class="pageMajorHeading"><a name="TOP"
																				id="TOP">Vascular Plants of
																				California</a></span>
																		<br>
																		<span class="pageAuthorLine">
																			<a href="/IJM_keys/IJM_fam_key.html">Key to
																				families</a>
																			|
																			<a href="/IJM_keys/toc.html">Table of
																				families and genera</a>
																		</span>
																	</td>
																</tr>
															</table>
															<p>
																<?php
																$pattern = '/aceae$/';

																if (isset($FormattedKey)) {
																	echo '<h1>Key to ' . $ScientificName . '</h1>';
																	echo '<p class=bodyText><a href="/eflora/eflora_display.php?tid=' . $TID . '"><h3>View taxon page for ' . $ScientificName . '</h3></a></p>';

																	if (preg_match($pattern, $ScientificName)) {
																		echo "<p class=bodyText>&nbsp;</p>";
																	} else {
																		echo '<p class=bodyText>(For a list of species in ' . $ScientificName . ', use the above link.)</p>';
																	}
																	echo '<p class=bodyText>Jepson Manual glossary definitions can be seen by moving your cursor over words underlined with dots.</p>';
																	echo $FormattedKey;
																	echo '<p class=bodyText>&nbsp;</p>';
																}
																?>
															</p>
															<!--<p class=bodyText>-->
															<!--<a href="&#109;&#97;&#105;&#108;to:rosatti&#064;berkeley.edu?subject=eFlora comment">Contact/Feedback</a></p>-->
															<p class=bodyText><a
																	href="https://docs.google.com/forms/d/e/1FAIpQLSc_wrQXqB9gNPrOgUTZ9WN38Ub08JlmgaIha7Ua99sHGzMntA/viewform">Please
																	use this Google Form for Contact/Feedback</a>


															<p class="bodyText">Citation for the whole project: Jepson
																Flora Project (eds.) <span id="year"></span>. Jepson
																eFlora, https://ucjeps.berkeley.edu/eflora/ [accessed on
																<span id="day"></span> <span id="month"></span>]
															</p>

															<p class=bodyText>
																Citation for an individual treatment: [Author of taxon
																treatment] [year]. [Taxon name] in Jepson Flora Project
																(eds.) <em>Jepson eFlora</em>, [URL for treatment].
																Accessed on <span id="day"></span> <span
																	id="month"></span> <span id="year">.</p>

															<p class=bodyText>
																We encourage links to these pages, but the content may
																not be downloaded for reposting, repackaging,
																redistributing, or sale in any form, without written
																permission from The Jepson Herbarium.
															</p>



															<!-- End body section-->

														</div>
													</td>
												</tr>
											</table>
											<!--close box outline table-->

											<!-- Begin footer -->
											<?php include($_SERVER['DOCUMENT_ROOT'] . '/eflora/common/php/footer.php'); ?>
											<!-- End footer -->


										</td>
										<td>
											<hr class="hr_line_blue">
										</td>
									</tr>
								</table>
								<!--close outside normal table-->




</body>

</html>