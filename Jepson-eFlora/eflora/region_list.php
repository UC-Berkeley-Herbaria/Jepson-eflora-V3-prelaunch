<?php
date_default_timezone_set('America/Los_Angeles');
$input_region = htmlspecialchars($_GET["region"]);

require 'config/config.php';
$db = new SQLite3($database_location);

/*
bioregion presence/absence for a taxon id is recorded in the eflora_distributions table
This script contains a translation table for each bioregion hierarchy item
For example, CCo is position 0
CW is positions 0, 16, 27, 27 
etc.
*/

//establish lowest level array and hierarchy
$lowest_level_array = array("CCo", "CaRF", "CaRH", "CaRH", "nChI", "sChI", "DMojexcDMtns", "DMtns", "DSon", "KR", "MPexcWrn", "NCo", "NCoRH", "NCoRI", "NCoRO", "PRexcSnJt", "SCo", "SCoRI", "SCoRO", "SNEexcWaI", "nSNF", "cSNF", "sSNF", "nSNH", "cSNH", "sSNH", "ScV", "SnBr", "SnFrB", "SnGb", "SnJV", "SnJt", "Teh", "WTR", "WaI", "Wrn");
$NCoR = array("NCoRO", "NCoRI", "NCoRH");
$CaR = array("CaRF", "CaRH");
$SNF = array("nSNF", "cSNF", "sSNF");
$SNH = array("nSNH", "cSNH", "sSNH");
$SN = array("nSNF", "cSNF", "sSNF", "nSNH", "cSNH", "sSNH", "Teh");
$GV = array("ScV", "SnJV");
$TR = array("WTR", "SnGb", "SnBr");
$ChI = array("nChI", "sChI");
$PR = array("PRexcSnJt", "SnJt");
$SW = array("SCo", "nChI", "sChI", "PRexcSnJt", "SnJt", "WTR", "SnGb", "SnBr");
$SCoR = array("SCoRO", "SCoRI");
$CW = array("SCoRO", "SCoRI", "CCo", "SnFrB");
$NW = array("NCoRO", "NCoRI", "NCoRH", "KR", "NCo");
$MP = array("Wrn", "MPexcWrn");
$SNE = array("WaI", "SNEexcWaI");
$GB = array("Wrn", "MPexcWrn", "WaI", "SNEexcWaI");
$DMoj = array("DMojexcDMtns", "DMtns");
$D = array("DMojexcDMtns", "DMtns", "DSon");
$CA_FP = array("NCoRO", "NCoRI", "NCoRH", "KR", "NCo", "CaRF", "CaRH", "nSNF", "cSNF", "sSNF", "nSNH", "cSNH", "sSNH", "Teh", "ScV", "SnJV", "SCoRO", "SCoRI", "CCo", "SnFrB", "SCo", "nChI", "sChI", "PRexcSnJt", "SnJt", "WTR", "SnGb", "SnBr");
//$CA = array("DMojexcDMtns", "DMtns", "DMojexcDMtns", "DMtns", "DSon", "NCoRO", "NCoRI", "NCoRH", "KR", "NCo", "CaRF", "CaRH", "nSNF", "cSNF", "sSNF", "nSNH", "cSNH", "sSNH", "Teh", "ScV", "SnJV", "SCoRO", "SCoRI", "CCo", "SnFrB", "SCo", "nChI", "sChI", "PRexcSnJt", "SnJt", "WTR", "SnGb", "SnBr");


//establish the $region_array based on the input, or give n error
if (in_array($input_region, $lowest_level_array)) {
	$region_array = $input_region;
} 
elseif ($input_region == "NCoR") {$region_array = $NCoR;}
elseif ($input_region == "CaR") {$region_array = $CaR;}
elseif ($input_region == "SNF") {$region_array = $SNF;}
elseif ($input_region == "SNH") {$region_array = $SNH;}
elseif ($input_region == "SN") {$region_array = $SN;}
elseif ($input_region == "GV") {$region_array = $GV;}
elseif ($input_region == "TR") {$region_array = $TR;}
elseif ($input_region == "ChI") {$region_array = $ChI;}
elseif ($input_region == "PR") {$region_array = $PR;}
elseif ($input_region == "SW") {$region_array = $SW;}
elseif ($input_region == "SCoR") {$region_array = $SCoR;}
elseif ($input_region == "CW") {$region_array = $CW;}
elseif ($input_region == "NW") {$region_array = $NW;}
elseif ($input_region == "MP") {$region_array = $MP;}
elseif ($input_region == "SNE") {$region_array = $SNE;}
elseif ($input_region == "GB") {$region_array = $GB;}
elseif ($input_region == "DMoj") {$region_array = $DMoj;}
elseif ($input_region == "D") {$region_array = $D;}
elseif ($input_region == "CA_FP") {$region_array = $CA_FP;}
else {
	echo "<p>Input region \"$input_region\" not valid</p>";
	echo "<p>Click here to return to the <a href='/eflora/IJM_tools.html'>eFlora tools page</a></p>";
	exit;
}

echo "<p> checklist for Jepson eFlora region $input_region</p>";

//construct SQLite "WHERE" clause based on region array
if (is_array ($region_array)) { // if it's an array, make it an SQL-syntax-delimited string
	$delimited_array_string = implode(" IS NOT NULL OR d.", $region_array);
//	$region_array = implode(" IS NOT NULL OR d.", $region_array);
	$where_clause = "WHERE d.".$delimited_array_string." IS NOT NULL";
}
else {
	$where_clause = "WHERE d.".$region_array." IS NOT NULL";
}

//execute query, and print
$stmt = $db->prepare("SELECT t.ScientificName as ScientificName, t.TaxonID as TaxonID
					FROM eflora_taxa t
					LEFT OUTER JOIN eflora_distributions d on t.TaxonID = d.TaxonID
					$where_clause
					ORDER BY ScientificName");
$results = $stmt->execute();

while ($row = $results->fetchArray()) {
	echo '<a href="/eflora/eflora_display.php?tid='.$row['TaxonID'].'">'.$row['ScientificName'].'</a><br>';
}
exit();