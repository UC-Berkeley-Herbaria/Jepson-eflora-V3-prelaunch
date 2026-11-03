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
require '../../herbariadb_data/eflora/config/config_eflora_mysql.php';
$db = mysqli_connect($db_host, $db_user, $db_pw, $db_name);


//START TAXON ID AND NAME SQL QUERY ASSIGNMENT


//perform a search that returns all names that start with a letter
//this is the same query as in search_eflora.php, but with a different WHERE clause
					//georeferenceRemarks
	if(!empty($TaxonID))  {

//$sql = "SELECT ID, TaxonID, ScientificName, TaxonAuthor, FormattedDisplayName, CommonName, Status, TJM2Author, ScientificEditor, Habit, PlantBody, Stem, SterileStem, FertileStem, Leaf, Spines, Inflorescence, StaminateHead, RayOrPistillateFlower, PistillateHead, StaminateInflorescence, PistillateOrBisexualInflorescence, PistillateInflorescence, Spikelet, FertileSpikelet, SterileSpikelet, DistalSpikelet, CentralSpikelet, LateralSpikelet, StaminateSpikelet, PistillateSpikelet, Flower, StaminateFlower, PistillateFlower, RayFlower, DiskFlower, Cone, PollenCone, SeedCone, BisexualFlower, Fruit, Seed, Sporangia, SporangiumCase, MaleSporangiumCase, FemaleSporangiumCase, Spores, Chromosomes, Ecology, RarityStatus, Elevation, BioregionalDistribution, OutsideCA, SpeciesInGenus, GeneraInFamily, Etymology, Toxicity, Synonyms, UnabridgedSynonyms, Reference, UnabridgedReference, Note, UnabridgedNote, FloweringTime, FloweringTimeCode, FruitingTime, Weediness, IsTerminalTaxon, HasKey, RevisionNumber, RevisionDate, DistCode 
		$sql = "SELECT t.*, t.taxonID AS TID, tax.sortID FROM eflora_taxa t JOIN eflora_taxonomy tax ON t.TaxonID = tax.TaxonID WHERE t.TaxonID=".$TaxonID." ";

//BEGIN temporary bug fix lines to add when needed
//echo '<br>'.$sql.'<br>';

		if(!mysqli_query($db, $sql)){
			die('Error: ' . mysqli_error($db));
		}

		$result = mysqli_query($db, $sql);

//query and assign variable to each table field
		if ($result && mysqli_num_rows($result) > 0) {
			$row = mysqli_fetch_assoc($result);
		//while ($row = mysqli_fetch_array($result)) {


	// Assigned safely here
    // ... rest of your display logic

//BEGIN temporary bug fix lines to add when needed
//foreach ($row as $key=>$value) {
//    echo $key."<br>";
//}
//END temp bug fix lines

			if (!empty($row['sortID'])){
				$ID = $row['sortID'];
			}
			else{
				$ID = null;
			}
	
			if (!empty($row['ScientificName'])){
				$ScientificName = $row['ScientificName'];
			}
			else{
				$ScientificName = null;
			}
	
			if (!empty($row['TaxonAuthor'])){
				$TaxonAuthor = $row['TaxonAuthor'];
			}
			else{
				$TaxonAuthor = null;
			}
	
			if (!empty($row['FormattedDisplayName'])){
				$FormattedDisplayName = $row['FormattedDisplayName'];
			}
			else{
				$FormattedDisplayName = null;
			}
	
			if (!empty($row['CommonName'])){
				$CommonName = $row['CommonName'];
			}
			else{
				$CommonName = null;
			}
	
			if (!empty($row['Status'])){
				$efloraStatus = $row['Status'];
			}
			else{
				$efloraStatus = null;
			}
	
			if (!empty($row['TJM2Author'])){
				$TJM2Author = $row['TJM2Author'];
			}
			else{
				$TJM2Author = null;
			}
	
			if (!empty($row['ScientificEditor'])){
				$ScientificEditor = $row['ScientificEditor'];
			}
			else{
				$ScientificEditor = null;
			}
	
			if (!empty($row['Habit'])){
				$Habit = $row['Habit'];
			}
			else{
				$Habit = null;
			}
	
			if (!empty($row['PlantBody'])){
				$PlantBody = $row['PlantBody'];
			}
			else{
				$PlantBody = null;
			}
	
			if (!empty($row['Stem'])){
				$Stem = $row['Stem'];
			}
			else{
				$Stem = null;
			}
	
			if (!empty($row['SterileStem'])){
				$SterileStem = $row['SterileStem'];
			}
			else{
				$SterileStem = null;
			}
	
			if (!empty($row['FertileStem'])){
				$FertileStem = $row['FertileStem'];
			}
			else{
				$FertileStem = null;
			}
	
			if (!empty($row['Leaf'])){
				$Leaf = $row['Leaf'];
			}
			else{
				$Leaf = null;
			}
	
			if (!empty($row['Spines'])){
				$Spines = $row['Spines'];
			}
			else{
				$Spines = null;
			}
	
			if (!empty($row['Inflorescence'])){
				$Inflorescence = $row['Inflorescence'];
			}
			else{
				$Inflorescence = null;
			}
	
			if (!empty($row['StaminateHead'])){
				$StaminateHead = $row['StaminateHead'];
			}
			else{
				$StaminateHead = null;
			}
	
			if (!empty($row['RayOrPistillateFlower'])){
				$RayOrPistillateFlower = $row['RayOrPistillateFlower'];
			}
			else{
				$RayOrPistillateFlower = null;
			}
	
			if (!empty($row['PistillateHead'])){
				$PistillateHead = $row['PistillateHead'];
			}
			else{
				$PistillateHead = null;
			}
	
			if (!empty($row['StaminateInflorescence'])){
				$StaminateInflorescence = $row['StaminateInflorescence'];
			}
			else{
				$StaminateInflorescence = null;
			}
	
			if (!empty($row['PistillateOrBisexualInflorescence'])){
				$PistillateOrBisexualInflorescence = $row['PistillateOrBisexualInflorescence'];
			}
			else{
				$PistillateOrBisexualInflorescence = null;
			}
	
			if (!empty($row['PistillateInflorescence'])){
				$PistillateInflorescence = $row['PistillateInflorescence'];
			}
			else{
				$PistillateInflorescence = null;
			}
	
			if (!empty($row['Spikelet'])){
				$Spikelet = $row['Spikelet'];
			}
			else{
				$Spikelet = null;
			}
	
			if (!empty($row['FertileSpikelet'])){
				$FertileSpikelet = $row['FertileSpikelet'];
			}
			else{
				$FertileSpikelet = null;
			}
	
			if (!empty($row['SterileSpikelet'])){
				$SterileSpikelet = $row['SterileSpikelet'];
			}
			else{
				$SterileSpikelet = null;
			}
	
			if (!empty($row['DistalSpikelet'])){
				$DistalSpikelet = $row['DistalSpikelet'];
			}
			else{
				$DistalSpikelet = null;
			}
	
			if (!empty($row['CentralSpikelet'])){
				$CentralSpikelet = $row['CentralSpikelet'];
			}
			else{
				$CentralSpikelet = null;
			}
	
			if (!empty($row['LateralSpikelet'])){
				$LateralSpikelet = $row['LateralSpikelet'];
			}
			else{
				$LateralSpikelet = null;
			}
	
			if (!empty($row['StaminateSpikelet'])){
				$StaminateSpikelet = $row['StaminateSpikelet'];
			}
			else{
				$StaminateSpikelet = null;
			}
	
			if (!empty($row['PistillateSpikelet'])){
				$PistillateSpikelet = $row['PistillateSpikelet'];
			}
			else{
				$PistillateSpikelet = null;
			}
	
			$Flower = $row['Flower'] ?? '';
			$Flower = trim($Flower);
	
			if (!empty($row['StaminateFlower'])){
				$StaminateFlower = $row['StaminateFlower'];
			}
			else{
				$StaminateFlower = null;
			}
	
			if (!empty($row['PistillateFlower'])){
				$PistillateFlower = $row['PistillateFlower'];
			}
			else{
				$PistillateFlower = null;
			}
	
			if (!empty($row['RayFlower'])){
				$RayFlower = $row['RayFlower'];
			}
			else{
				$RayFlower = null;
			}
	
			if (!empty($row['DiskFlower'])){
				$DiskFlower = $row['DiskFlower'];
			}
			else{
				$DiskFlower = null;
			}
	
			if (!empty($row['Cone'])){
				$Cone = $row['Cone'];
			}
			else{
				$Cone = null;
			}
	
			if (!empty($row['PollenCone'])){
				$PollenCone = $row['PollenCone'];
			}
			else{
				$PollenCone = null;
			}
	
			if (!empty($row['SeedCone'])){
				$SeedCone = $row['SeedCone'];
			}
			else{
				$SeedCone = null;
			}
	
			if (!empty($row['BisexualFlower'])){
				$BisexualFlower = $row['BisexualFlower'];
			}
			else{
				$BisexualFlower = null;
			}
	
			if (!empty($row['Fruit'])){
				$Fruit = $row['Fruit'];
			}
			else{
				$Fruit = null;
			}
	
			if (!empty($row['Seed'])){
				$Seed = $row['Seed'];
			}
			else{
				$Seed = null;
			}
	
			if (!empty($row['Sporangia'])){
				$Sporangia = $row['Sporangia'];
			}
			else{
				$Sporangia = null;
			}
	
			if (!empty($row['SporangiumCase'])){
				$SporangiumCase = $row['SporangiumCase'];
			}
			else{
				$SporangiumCase = null;
			}
	
			if (!empty($row['MaleSporangiumCase'])){
				$MaleSporangiumCase = $row['MaleSporangiumCase'];
			}
			else{
				$MaleSporangiumCase = null;
			}
	
			if (!empty($row['FemaleSporangiumCase'])){
				$FemaleSporangiumCase = $row['FemaleSporangiumCase'];
			}
			else{
				$FemaleSporangiumCase = null;
			}
	
			if (!empty($row['Spores'])){
				$Spores = $row['Spores'];
			}
			else{
				$Spores = null;
			}
	
			if (!empty($row['Chromosomes'])){
				$Chromosomes = $row['Chromosomes'];
			}
			else{
				$Chromosomes = null;
			}
	
			if (!empty($row['RarityStatus'])){
				$RarityStatus = $row['RarityStatus'];
			}
			else{
				$RarityStatus = null;
			}
	
			if (!empty($row['Ecology'])){
				$Ecology = $row['Ecology'];
			}
			else{
				$Ecology = null;
			}
	
			if (!empty($row['Elevation'])){
				$Elevation = $row['Elevation'];
			}
			else{
				$Elevation = null;
			}
	
			if (!empty($row['BioregionalDistribution'])){
				$BioregionalDistribution = $row['BioregionalDistribution'];
			}
			else{
				$BioregionalDistribution = null;
			}
	
			if (!empty($row['OutsideCA'])){
				$OutsideCA = $row['OutsideCA'];
			}
			else{
				$OutsideCA = null;
			}
	
			if (!empty($row['SpeciesInGenus'])){
				$SpeciesInGenus = $row['SpeciesInGenus'];
			}
			else{
				$SpeciesInGenus = null;
			}
	
			if (!empty($row['GeneraInFamily'])){
				$GeneraInFamily = $row['GeneraInFamily'];
			}
			else{
				$GeneraInFamily = null;
			}
	
			if (!empty($row['Etymology'])){
				$Etymology = $row['Etymology'];
			}
			else{
				$Etymology = null;
			}
	
			if (!empty($row['Toxicity'])){
				$Toxicity = $row['Toxicity'];
			}
			else{
				$Toxicity = null;
			}
	
			if (!empty($row['Synonyms'])){
				$Synonyms = $row['Synonyms'];
			}
			else{
				$Synonyms = null;
			}
	
			if (!empty($row['UnabridgedSynonyms'])){
				$UnabridgedSynonyms = $row['UnabridgedSynonyms'];
			}
			else{
				$UnabridgedSynonyms = null;
			}
	
			if (!empty($row['Reference'])){
				$Reference = $row['Reference'];
			}
			else{
				$Reference = null;
			}
	
			if (!empty($row['UnabridgedReference'])){
				$UnabridgedReference = $row['UnabridgedReference'];
			}
			else{
				$UnabridgedReference = null;
			}
	
			if (!empty($row['Note'])){
				$Note = $row['Note'];
			}
			else{
				$Note = null;
			}
	
			if (!empty($row['UnabridgedNote'])){
				$UnabridgedNote = $row['UnabridgedNote'];
			}
			else{
				$UnabridgedNote = null;
			}
	
			if (!empty($row['FloweringTime'])){
				$FloweringTime = $row['FloweringTime'];
			}
			else{
				$FloweringTime = null;
			}
	
			if (!empty($row['FloweringTimeCode'])){
				$TimeCode = $row['FloweringTimeCode'];
			}
			else{
				$TimeCode = null;
			}
	
			if (!empty($row['FruitingTime'])){
				$FruitingTime = $row['FruitingTime'];
			}
			else{
				$FruitingTime = null;
			}
	
	//$ConingTime = $row['ConingTime']; 
	//Remove this as there is no lines with this information
	//It has never been successfully printing online and it would be a duplicate of the data in the notes anyway
	
			if (!empty($row['Weediness'])){
				$Weediness = $row['Weediness'];
			}
			else{
				$Weediness = null;
			}
	
			if (!empty($row['IsTerminalTaxon'])){
				$IsTerminalTaxon  = $row['IsTerminalTaxon'];
			}
			else{
				$IsTerminalTaxon = null;
			}
	
			if (!empty($row['RevisionNumber'])){
				$RevisionNumber  = $row['RevisionNumber'];
			}
			else{
				$RevisionNumber = null;
			}
	
			if (!empty($row['RevisionDate'])){
				$RevisionDate  = $row['RevisionDate'];
			}
			else{
				$RevisionDate = null;
			}
	
			if (!empty($row['DistCode'])){
				$DistCode = $row['DistCode'];
			}
			else{
				$DistCode = null;
			}
	
			if (!empty($row['HasKey'])){
				$HasKey = $row['HasKey'];
			}
			else{
				$HasKey = null;
			}
	
			if (!empty($row['TID'])){
				$TID = $row['TID'];
			}
			else{
				$TID = null;
			}
	
	//var_dump($row); 
	/*var_dump prints the whole row in a databased format
	which is useful for seeing what you're getting
	but is pretty ugly
	*/
		} else {

			// 3. Fallback: TaxonID not found in eflora_taxa. Check eflora_synonymy.
			$syn_sql = "SELECT AcceptedNameTID FROM eflora_synonymy WHERE TaxonID = '" . $TaxonID . "' LIMIT 1";
			$syn_result = mysqli_query($db, $syn_sql);
			
			if ($syn_result && mysqli_num_rows($syn_result) > 0) {
			    $syn_row = mysqli_fetch_assoc($syn_result);
			    $acceptedTID = trim($syn_row['AcceptedNameTID']);
			    
			    // 4. Forward/Redirect to the search page URL with the accepted name
			    if (!empty($acceptedTID)) {
			        $encodedTID = urlencode($acceptedTID);
			        header("Location: https://herbariadb.berkeley.edu/eflora/eflora_display.php?tid=" . $encodedTID);
			        exit(); // Always call exit after a header redirect to stop further script execution
			    }
			} 
			
			// 5. Optional: If it's not in synonymy either, handle the "not found" error 
			// (This is what caused your initial PHP Notice / 9999999 error earlier)
			// Handle the error gracefully
				echo "<br><br><h1>The ID you are using is not in the eflora database name may be a synonym or removed from the database entirely. Please use this link and type in a name to search the eflora database:<br><br>";
				echo '<a href="/eflora/search_eflora.php?name=">Start a new search using this link</a></h1>';
			exit(); // Stop execution so lines 1165/1166 don't throw notices
		}
	}
	elseif(!empty($TaxonName))  {

//$sql = "SELECT ID, TaxonID, ScientificName, TaxonAuthor, FormattedDisplayName, CommonName, Status, TJM2Author, ScientificEditor, Habit, PlantBody, Stem, SterileStem, FertileStem, Leaf, Spines, Inflorescence, StaminateHead, RayOrPistillateFlower, PistillateHead, StaminateInflorescence, PistillateOrBisexualInflorescence, PistillateInflorescence, Spikelet, FertileSpikelet, SterileSpikelet, DistalSpikelet, CentralSpikelet, LateralSpikelet, StaminateSpikelet, PistillateSpikelet, Flower, StaminateFlower, PistillateFlower, RayFlower, DiskFlower, Cone, PollenCone, SeedCone, BisexualFlower, Fruit, Seed, Sporangia, SporangiumCase, MaleSporangiumCase, FemaleSporangiumCase, Spores, Chromosomes, Ecology, RarityStatus, Elevation, BioregionalDistribution, OutsideCA, SpeciesInGenus, GeneraInFamily, Etymology, Toxicity, Synonyms, UnabridgedSynonyms, Reference, UnabridgedReference, Note, UnabridgedNote, FloweringTime, FloweringTimeCode, FruitingTime, Weediness, IsTerminalTaxon, HasKey, RevisionNumber, RevisionDate, DistCode 
		//Calochortus amabilis, for example
		$sql = "SELECT t.*, t.taxonID AS TID, tax.sortID FROM eflora_taxa t JOIN eflora_taxonomy tax ON t.TaxonID = tax.TaxonID WHERE t.ScientificName LIKE '".$TaxonName."' ";
//BEGIN temporary bug fix lines to add when needed
//echo '<br>'.$sql.'<br>';

		if(!mysqli_query($db, $sql)){
			die('Error: ' . mysqli_error($db));
		}

		$result = mysqli_query($db, $sql);

//query and assign variable to each table field
		if ($result && mysqli_num_rows($result) > 0) {
			$row = mysqli_fetch_assoc($result);
		//while ($row = mysqli_fetch_array($result)) {


	// Assigned safely here
	// ... rest of your display logic

//BEGIN temporary bug fix lines to add when needed
//foreach ($row as $key=>$value) {
//    echo $key."<br>";
//}
//END temp bug fix lines

			if (!empty($row['sortID'])){
				$ID = $row['sortID'];
			}
			else{
				$ID = null;
			}
	
			if (!empty($row['ScientificName'])){
				$ScientificName = $row['ScientificName'];
			}
			else{
				$ScientificName = null;
			}
	
			if (!empty($row['TaxonAuthor'])){
				$TaxonAuthor = $row['TaxonAuthor'];
			}
			else{
				$TaxonAuthor = null;
			}
	
			if (!empty($row['FormattedDisplayName'])){
				$FormattedDisplayName = $row['FormattedDisplayName'];
			}
			else{
				$FormattedDisplayName = null;
			}
	
			if (!empty($row['CommonName'])){
				$CommonName = $row['CommonName'];
			}
			else{
				$CommonName = null;
			}
	
			if (!empty($row['Status'])){
				$efloraStatus = $row['Status'];
			}
			else{
				$efloraStatus = null;
			}
	
			if (!empty($row['TJM2Author'])){
				$TJM2Author = $row['TJM2Author'];
			}
			else{
				$TJM2Author = null;
			}
	
			if (!empty($row['ScientificEditor'])){
				$ScientificEditor = $row['ScientificEditor'];
			}
			else{
				$ScientificEditor = null;
			}
	
			if (!empty($row['Habit'])){
				$Habit = $row['Habit'];
			}
			else{
				$Habit = null;
			}
	
			if (!empty($row['PlantBody'])){
				$PlantBody = $row['PlantBody'];
			}
			else{
				$PlantBody = null;
			}
	
			if (!empty($row['Stem'])){
				$Stem = $row['Stem'];
			}
			else{
				$Stem = null;
			}
	
			if (!empty($row['SterileStem'])){
				$SterileStem = $row['SterileStem'];
			}
			else{
				$SterileStem = null;
			}
	
			if (!empty($row['FertileStem'])){
				$FertileStem = $row['FertileStem'];
			}
			else{
				$FertileStem = null;
			}
	
			if (!empty($row['Leaf'])){
				$Leaf = $row['Leaf'];
			}
			else{
				$Leaf = null;
			}
	
			if (!empty($row['Spines'])){
				$Spines = $row['Spines'];
			}
			else{
				$Spines = null;
			}
	
			if (!empty($row['Inflorescence'])){
				$Inflorescence = $row['Inflorescence'];
			}
			else{
				$Inflorescence = null;
			}
	
			if (!empty($row['StaminateHead'])){
				$StaminateHead = $row['StaminateHead'];
			}
			else{
				$StaminateHead = null;
			}
	
			if (!empty($row['RayOrPistillateFlower'])){
				$RayOrPistillateFlower = $row['RayOrPistillateFlower'];
			}
			else{
				$RayOrPistillateFlower = null;
			}
	
			if (!empty($row['PistillateHead'])){
				$PistillateHead = $row['PistillateHead'];
			}
			else{
				$PistillateHead = null;
			}
	
			if (!empty($row['StaminateInflorescence'])){
				$StaminateInflorescence = $row['StaminateInflorescence'];
			}
			else{
				$StaminateInflorescence = null;
			}
	
			if (!empty($row['PistillateOrBisexualInflorescence'])){
				$PistillateOrBisexualInflorescence = $row['PistillateOrBisexualInflorescence'];
			}
			else{
				$PistillateOrBisexualInflorescence = null;
			}
	
			if (!empty($row['PistillateInflorescence'])){
				$PistillateInflorescence = $row['PistillateInflorescence'];
			}
			else{
				$PistillateInflorescence = null;
			}
	
			if (!empty($row['Spikelet'])){
				$Spikelet = $row['Spikelet'];
			}
			else{
				$Spikelet = null;
			}
	
			if (!empty($row['FertileSpikelet'])){
				$FertileSpikelet = $row['FertileSpikelet'];
			}
			else{
				$FertileSpikelet = null;
			}
	
			if (!empty($row['SterileSpikelet'])){
				$SterileSpikelet = $row['SterileSpikelet'];
			}
			else{
				$SterileSpikelet = null;
			}
	
			if (!empty($row['DistalSpikelet'])){
				$DistalSpikelet = $row['DistalSpikelet'];
			}
			else{
				$DistalSpikelet = null;
			}
	
			if (!empty($row['CentralSpikelet'])){
				$CentralSpikelet = $row['CentralSpikelet'];
			}
			else{
				$CentralSpikelet = null;
			}
	
			if (!empty($row['LateralSpikelet'])){
				$LateralSpikelet = $row['LateralSpikelet'];
			}
			else{
				$LateralSpikelet = null;
			}
	
			if (!empty($row['StaminateSpikelet'])){
				$StaminateSpikelet = $row['StaminateSpikelet'];
			}
			else{
				$StaminateSpikelet = null;
			}
	
			if (!empty($row['PistillateSpikelet'])){
				$PistillateSpikelet = $row['PistillateSpikelet'];
			}
			else{
				$PistillateSpikelet = null;
			}
	
			$Flower = $row['Flower'] ?? '';
			$Flower = trim($Flower);
	
			if (!empty($row['StaminateFlower'])){
				$StaminateFlower = $row['StaminateFlower'];
			}
			else{
				$StaminateFlower = null;
			}
	
			if (!empty($row['PistillateFlower'])){
				$PistillateFlower = $row['PistillateFlower'];
			}
			else{
				$PistillateFlower = null;
			}
	
			if (!empty($row['RayFlower'])){
				$RayFlower = $row['RayFlower'];
			}
			else{
				$RayFlower = null;
			}
	
			if (!empty($row['DiskFlower'])){
				$DiskFlower = $row['DiskFlower'];
			}
			else{
				$DiskFlower = null;
			}
	
			if (!empty($row['Cone'])){
				$Cone = $row['Cone'];
			}
			else{
				$Cone = null;
			}
	
			if (!empty($row['PollenCone'])){
				$PollenCone = $row['PollenCone'];
			}
			else{
				$PollenCone = null;
			}
	
			if (!empty($row['SeedCone'])){
				$SeedCone = $row['SeedCone'];
			}
			else{
				$SeedCone = null;
			}
	
			if (!empty($row['BisexualFlower'])){
				$BisexualFlower = $row['BisexualFlower'];
			}
			else{
				$BisexualFlower = null;
			}
	
			if (!empty($row['Fruit'])){
				$Fruit = $row['Fruit'];
			}
			else{
				$Fruit = null;
			}
	
			if (!empty($row['Seed'])){
				$Seed = $row['Seed'];
			}
			else{
				$Seed = null;
			}
	
			if (!empty($row['Sporangia'])){
				$Sporangia = $row['Sporangia'];
			}
			else{
				$Sporangia = null;
			}
	
			if (!empty($row['SporangiumCase'])){
				$SporangiumCase = $row['SporangiumCase'];
			}
			else{
				$SporangiumCase = null;
			}
	
			if (!empty($row['MaleSporangiumCase'])){
				$MaleSporangiumCase = $row['MaleSporangiumCase'];
			}
			else{
				$MaleSporangiumCase = null;
			}
	
			if (!empty($row['FemaleSporangiumCase'])){
				$FemaleSporangiumCase = $row['FemaleSporangiumCase'];
			}
			else{
				$FemaleSporangiumCase = null;
			}
	
			if (!empty($row['Spores'])){
				$Spores = $row['Spores'];
			}
			else{
				$Spores = null;
			}
	
			if (!empty($row['Chromosomes'])){
				$Chromosomes = $row['Chromosomes'];
			}
			else{
				$Chromosomes = null;
			}
	
			if (!empty($row['RarityStatus'])){
				$RarityStatus = $row['RarityStatus'];
			}
			else{
				$RarityStatus = null;
			}
	
			if (!empty($row['Ecology'])){
				$Ecology = $row['Ecology'];
			}
			else{
				$Ecology = null;
			}
	
			if (!empty($row['Elevation'])){
				$Elevation = $row['Elevation'];
			}
			else{
				$Elevation = null;
			}
	
			if (!empty($row['BioregionalDistribution'])){
				$BioregionalDistribution = $row['BioregionalDistribution'];
			}
			else{
				$BioregionalDistribution = null;
			}
	
			if (!empty($row['OutsideCA'])){
				$OutsideCA = $row['OutsideCA'];
			}
			else{
				$OutsideCA = null;
			}
	
			if (!empty($row['SpeciesInGenus'])){
				$SpeciesInGenus = $row['SpeciesInGenus'];
			}
			else{
				$SpeciesInGenus = null;
			}
	
			if (!empty($row['GeneraInFamily'])){
				$GeneraInFamily = $row['GeneraInFamily'];
			}
			else{
				$GeneraInFamily = null;
			}
	
			if (!empty($row['Etymology'])){
				$Etymology = $row['Etymology'];
			}
			else{
				$Etymology = null;
			}
	
			if (!empty($row['Toxicity'])){
				$Toxicity = $row['Toxicity'];
			}
			else{
				$Toxicity = null;
			}
	
			if (!empty($row['Synonyms'])){
				$Synonyms = $row['Synonyms'];
			}
			else{
				$Synonyms = null;
			}
	
			if (!empty($row['UnabridgedSynonyms'])){
				$UnabridgedSynonyms = $row['UnabridgedSynonyms'];
			}
			else{
				$UnabridgedSynonyms = null;
			}
	
			if (!empty($row['Reference'])){
				$Reference = $row['Reference'];
			}
			else{
				$Reference = null;
			}
	
			if (!empty($row['UnabridgedReference'])){
				$UnabridgedReference = $row['UnabridgedReference'];
			}
			else{
				$UnabridgedReference = null;
			}
	
			if (!empty($row['Note'])){
				$Note = $row['Note'];
			}
			else{
				$Note = null;
			}
	
			if (!empty($row['UnabridgedNote'])){
				$UnabridgedNote = $row['UnabridgedNote'];
			}
			else{
				$UnabridgedNote = null;
			}
	
			if (!empty($row['FloweringTime'])){
				$FloweringTime = $row['FloweringTime'];
			}
			else{
				$FloweringTime = null;
			}
	
			if (!empty($row['FloweringTimeCode'])){
				$TimeCode = $row['FloweringTimeCode'];
			}
			else{
				$TimeCode = null;
			}
	
			if (!empty($row['FruitingTime'])){
				$FruitingTime = $row['FruitingTime'];
			}
			else{
				$FruitingTime = null;
			}
	
	//$ConingTime = $row['ConingTime']; 
	//Remove this as there is no lines with this information
	//It has never been successfully printing online and it would be a duplicate of the data in the notes anyway
	
			if (!empty($row['Weediness'])){
				$Weediness = $row['Weediness'];
			}
			else{
				$Weediness = null;
			}
	
			if (!empty($row['IsTerminalTaxon'])){
				$IsTerminalTaxon  = $row['IsTerminalTaxon'];
			}
			else{
				$IsTerminalTaxon = null;
			}
	
			if (!empty($row['RevisionNumber'])){
				$RevisionNumber  = $row['RevisionNumber'];
			}
			else{
				$RevisionNumber = null;
			}
	
			if (!empty($row['RevisionDate'])){
				$RevisionDate  = $row['RevisionDate'];
			}
			else{
				$RevisionDate = null;
			}
	
			if (!empty($row['DistCode'])){
				$DistCode = $row['DistCode'];
			}
			else{
				$DistCode = null;
			}
	
			if (!empty($row['HasKey'])){
				$HasKey = $row['HasKey'];
			}
			else{
				$HasKey = null;
			}
	
			if (!empty($row['TID'])){
				$TID = $row['TID'];
			}
			else{
				$TID = null;
			}
	
//var_dump($row); 
//var_dump prints the whole row in a databased format
//which is useful for seeing what you're getting
//but is pretty ugly

		} else {

			// 3. Fallback: TaxonID not found in eflora_taxa. Check eflora_synonymy.
			$syn_sql = "SELECT AcceptedNameTID FROM eflora_synonymy WHERE ScientificName LIKE '" . $TaxonName . "' ";
			$syn_result = mysqli_query($db, $syn_sql);
			
			if ($syn_result && mysqli_num_rows($syn_result) > 0) {
			    $syn_row = mysqli_fetch_assoc($syn_result);
			    $acceptedTID = trim($syn_row['AcceptedNameTID']);
			    
			    // 4. Forward/Redirect to the search page URL with the accepted name
			    if (!empty($acceptedTID)) {
			        $encodedTID = urlencode($acceptedTID);
			        header("Location: https://herbariadb.berkeley.edu/eflora/eflora_display.php?tid=" . $acceptedTID);
			        exit(); // Always call exit after a header redirect to stop further script execution
			    }
			}
			
			// 5. Optional: If it's not in synonymy either, handle the "not found" error 
			// (This is what caused your initial PHP Notice / 9999999 error earlier)
			// Handle the error gracefully
				echo "<br><br><h1>The name you are using is not in the eflora synonymy table and may be a synonym unknown to us or a name not recognized as part of the California flora. Please use this link and type in a name to make another search of the eflora database:<br><br>";
				echo '<a href="/eflora/search_eflora.php?name=">Start a new search using this link</a></h1>';
			exit(); // Stop execution so lines 1165/1166 don't throw notices
		}
	}
	else{

//Before doing anything, if the TID isn't recognized, give a plain error screen
//Security mod to prevent cross-site scripting attacks
		echo "<br><br><h1>The ID you are using is not an eflora accepted name and may be a synonym or removed from the database entirely. Please use this link and type in a name to search the eflora database:<br><br>";
		echo '<a href="/eflora/search_eflora.php?name=">Start a new search using this link</a></h1>';
		exit();
	}

//END TAXON ID AND NAME SQL QUERY ASSIGNMENT


//START previousID AND nextID SQL QUERY ASSIGNMENT
 if ( (empty($ID)) && (!empty($TaxonName)) ){
		//echo "Taxon not recognized NAME=".$TaxonName;
		header("Location: search_eflora.php?name=".$TaxonName, true, 301);
		exit();
 } else{
	//get previous and next info based on ID
		$previousID = $ID-1;
		$nextID = $ID+1;

		if (!empty($previousID)){
			$sql = "SELECT sortID, TaxonID, speciesName, infraName FROM eflora_taxonomy WHERE sortID=".$previousID." ";

//BEGIN temporary bug fix lines to add when needed
//echo '<br>'.$previousID.'<br>';

			if(!mysqli_query($db, $sql)){
				die('Error: ' . mysqli_error($db));
			}

			$result = mysqli_query($db, $sql);

//query and assign variable to each table field
			while ($row = mysqli_fetch_array($result)) {

// If no results are found, echo a message and stop
				if ($row == false){
					echo '<b>The previous ID was not found in the eflora taxon table.<br>Try another search.<br>';
    				exit;
				}
//BEGIN temporary bug fix lines to add when needed
//foreach ($row as $key=>$value) {
//    echo $key."<br>";
//}
//END temp bug fix lines
				// if (!empty($row(['TaxonID'])){    jg commented out
				if (!empty($row['TaxonID'])){
					$previousTaxonID = $row['TaxonID'];
				}
				else{
					$previousTaxonID = null;
				}

				if (!empty($row['SpeciesID'])){
					$previousSpecID = $row['SpeciesID'];
				}
				else{
					$previousSpecID = null;
				}

				if (!empty($row['infraName'])){
					$previousInfraName = $row['infraName'];
				}
				else{
					$previousInfraName = null;
				}

			}
		}

		if (!empty($nextID)){
			$sql = "SELECT sortID, TaxonID FROM eflora_taxonomy WHERE sortID=".$nextID." ";

//BEGIN temporary bug fix lines to add when needed
//echo '<br>'.$sql.'<br>';
//echo '<br>'.$nextID.'<br>';

			if(!mysqli_query($db, $sql)){
				die('Error: ' . mysqli_error($db));
			}

			$result = mysqli_query($db, $sql);

//query and assign variable to each table field
			while ($row = mysqli_fetch_array($result)) {

// If no results are found, echo a message and stop
				if ($row == false){
					echo '<b>The next ID was not found in the eflora taxon table.<br>Try another search.<br>';
    				exit;
				}
//BEGIN temporary bug fix lines to add when needed
//foreach ($row as $key=>$value) {
//    echo $key."<br>";
//}
//END temp bug fix lines
				// if (!empty($row(['TaxonID'])){    jg commented out
				if (!empty($row['TaxonID'])){
					$nextTaxonID = $row['TaxonID'];
				}
				else{
					$nextTaxonID = null;
				}

			}
		}
  }
//END previousID AND nextID SQL QUERY ASSIGNMENT



//START FAMILY SQL QUERY ASSIGNMENT

  //query and assign family info
  //Note that only Family has "GeneraInFamily" and "ScientificEditor"
  //included in query below as f.GeneraInFamily and f.ScientificEditor
		if (!empty($TID)){
				$sql = "SELECT t.TaxonID, t.FamilyID";
//Family
				$sql.= ", f.TaxonID, f.ScientificName, f.TaxonAuthor, f.CommonName";
				$sql.= ", f.TJM2Author, f.ScientificEditor, f.Habit, f.PlantBody, f.Stem";
				$sql.= ", f.SterileStem, f.FertileStem, f.Leaf, f.Spines, f.Inflorescence";
				$sql.= ", f.StaminateHead, f.RayOrPistillateFlower, f.PistillateHead, f.StaminateInflorescence";
				$sql.= ", f.PistillateOrBisexualInflorescence, f.PistillateInflorescence, f.Spikelet, f.FertileSpikelet";
				$sql.= ", f.SterileSpikelet, f.DistalSpikelet, f.CentralSpikelet, f.LateralSpikelet, f.StaminateSpikelet";
				$sql.= ", f.PistillateSpikelet, f.Flower, f.StaminateFlower, f.PistillateFlower, f.RayFlower, f.DiskFlower";
				$sql.= ", f.Cone, f.PollenCone, f.SeedCone, f.BisexualFlower, f.Fruit, f.Seed, f.Sporangia, f.SporangiumCase";
				$sql.= ", f.MaleSporangiumCase, f.FemaleSporangiumCase, f.Spores, f.Chromosomes, f.GeneraInFamily, f.Etymology";
				$sql.= ", f.Toxicity, f.Synonyms, f.UnabridgedSynonyms, f.Note, f.UnabridgedNote, f.RevisionNumber";
				$sql.= ", f.RevisionDate, f.HasKey";
				$sql.= " from eflora_taxonomy t, eflora_taxa f";
				$sql.= " WHERE t.TaxonID=".$TID." AND t.FamilyID=f.TaxonID";

//BEGIN temporary bug fix lines to add when needed
//echo '<br>'.$sql.'<br>';

			if(!mysqli_query($db, $sql)){
				die('Error: ' . mysqli_error($db));
			}

			$result = mysqli_query($db, $sql);

//query and assign variable to each table field
			while ($row = mysqli_fetch_array($result)) {

// If no results are found, echo a message and stop
				if ($row == false){
					echo '<b>Family was not found in the eflora taxon table.<br>Try another search.<br>';
    				exit;
				}
//BEGIN temporary bug fix lines to add when needed
//foreach ($row as $key=>$value) {
//    echo $key."<br>";
//}
//END temp bug fix lines

				if (!empty($row['ScientificName'])){
					$FamScientificName = $row['ScientificName'];
				}
				else{
					$FamScientificName = null;
				}
		
				if (!empty($row['TaxonAuthor'])){
					$FamTaxonAuthor = $row['TaxonAuthor'];
				}
				else{
					$FamTaxonAuthor = null;
				}
		
				if (!empty($row['FormattedDisplayName'])){
					$FamFormattedDisplayName = $row['FormattedDisplayName'];
				}
				else{
					$FamFormattedDisplayName = null;
				}
		
				if (!empty($row['CommonName'])){
					$FamCommonName = $row['CommonName'];
				}
				else{
					$FamCommonName = null;
				}
		
				if (!empty($row['TJM2Author'])){
					$FamTJM2Author = $row['TJM2Author'];
				}
				else{
					$FamTJM2Author = null;
				}
		
				if (!empty($row['ScientificEditor'])){
					$FamScientificEditor = $row['ScientificEditor'];
				}
				else{
					$FamScientificEditor = null;
				}
		
				if (!empty($row['Habit'])){
					$FamHabit = $row['Habit'];
				}
				else{
					$FamHabit = null;
				}
		
				if (!empty($row['PlantBody'])){
					$FamPlantBody = $row['PlantBody'];
				}
				else{
					$FamPlantBody = null;
				}
		
				if (!empty($row['Stem'])){
					$FamStem = $row['Stem'];
				}
				else{
					$FamStem = null;
				}
		
				if (!empty($row['SterileStem'])){
					$FamSterileStem = $row['SterileStem'];
				}
				else{
					$FamSterileStem = null;
				}
		
				if (!empty($row['FertileStem'])){
					$FamFertileStem = $row['FertileStem'];
				}
				else{
					$FamFertileStem = null;
				}
		
				if (!empty($row['Leaf'])){
					$FamLeaf = $row['Leaf'];
				}
				else{
					$FamLeaf = null;
				}
		
				if (!empty($row['Spines'])){
					$FamSpines = $row['Spines'];
				}
				else{
					$FamSpines = null;
				}
		
				if (!empty($row['Inflorescence'])){
					$FamInflorescence = $row['Inflorescence'];
				}
				else{
					$FamInflorescence = null;
				}
		
				if (!empty($row['StaminateHead'])){
					$FamStaminateHead = $row['StaminateHead'];
				}
				else{
					$FamStaminateHead = null;
				}
		
				if (!empty($row['RayOrPistillateFlower'])){
					$FamRayOrPistillateFlower = $row['RayOrPistillateFlower'];
				}
				else{
					$FamRayOrPistillateFlower = null;
				}
		
				if (!empty($row['PistillateHead'])){
					$FamPistillateHead = $row['PistillateHead'];
				}
				else{
					$FamPistillateHead = null;
				}
		
				if (!empty($row['StaminateInflorescence'])){
					$FamStaminateInflorescence = $row['StaminateInflorescence'];
				}
				else{
					$FamStaminateInflorescence = null;
				}
		
				if (!empty($row['PistillateOrBisexualInflorescence'])){
					$FamPistillateOrBisexualInflorescence = $row['PistillateOrBisexualInflorescence'];
				}
				else{
					$FamPistillateOrBisexualInflorescence = null;
				}
		
				if (!empty($row['PistillateInflorescence'])){
					$FamPistillateInflorescence = $row['PistillateInflorescence'];
				}
				else{
					$FamPistillateInflorescence = null;
				}
		
				if (!empty($row['Spikelet'])){
					$FamSpikelet = $row['Spikelet'];
				}
				else{
					$FamSpikelet = null;
				}
		
				if (!empty($row['FertileSpikelet'])){
					$FamFertileSpikelet = $row['FertileSpikelet'];
				}
				else{
					$FamFertileSpikelet = null;
				}
		
				if (!empty($row['SterileSpikelet'])){
					$FamSterileSpikelet = $row['SterileSpikelet'];
				}
				else{
					$FamSterileSpikelet = null;
				}
		
				if (!empty($row['DistalSpikelet'])){
					$FamDistalSpikelet = $row['DistalSpikelet'];
				}
				else{
					$FamDistalSpikelet = null;
				}
		
				if (!empty($row['CentralSpikelet'])){
					$FamCentralSpikelet = $row['CentralSpikelet'];
				}
				else{
					$FamCentralSpikelet = null;
				}
		
				if (!empty($row['LateralSpikelet'])){
					$FamLateralSpikelet = $row['LateralSpikelet'];
				}
				else{
					$FamLateralSpikelet = null;
				}
		
				if (!empty($row['StaminateSpikelet'])){
					$FamStaminateSpikelet = $row['StaminateSpikelet'];
				}
				else{
					$FamStaminateSpikelet = null;
				}
		
				if (!empty($row['PistillateSpikelet'])){
					$FamPistillateSpikelet = $row['PistillateSpikelet'];
				}
				else{
					$FamPistillateSpikelet = null;
				}
		
				if (!empty($row['Flower'])){
					$FamFlower = $row['Flower'];
				}
				else{
					$FamFlower = null;
				}
		
				if (!empty($row['StaminateFlower'])){
					$FamStaminateFlower = $row['StaminateFlower'];
				}
				else{
					$FamStaminateFlower = null;
				}
		
				if (!empty($row['PistillateFlower'])){
					$FamPistillateFlower = $row['PistillateFlower'];
				}
				else{
					$FamPistillateFlower = null;
				}
		
				if (!empty($row['RayFlower'])){
					$FamRayFlower = $row['RayFlower'];
				}
				else{
					$FamRayFlower = null;
				}
		
				if (!empty($row['DiskFlower'])){
					$FamDiskFlower = $row['DiskFlower'];
				}
				else{
					$FamDiskFlower = null;
				}
		
				if (!empty($row['Cone'])){
					$FamCone = $row['Cone'];
				}
				else{
					$FamCone = null;
				}
		
				if (!empty($row['PollenCone'])){
					$FamPollenCone = $row['PollenCone'];
				}
				else{
					$FamPollenCone = null;
				}
		
				if (!empty($row['SeedCone'])){
					$FamSeedCone = $row['SeedCone'];
				}
				else{
					$FamSeedCone = null;
				}
		
				if (!empty($row['BisexualFlower'])){
					$FamBisexualFlower = $row['BisexualFlower'];
				}
				else{
					$FamBisexualFlower = null;
				}
		
				if (!empty($row['Fruit'])){
					$FamFruit = $row['Fruit'];
				}
				else{
					$FamFruit = null;
				}
		
				if (!empty($row['Seed'])){
					$FamSeed = $row['Seed'];
				}
				else{
					$FamSeed = null;
				}
		
				if (!empty($row['Sporangia'])){
					$FamSporangia = $row['Sporangia'];
				}
				else{
					$FamSporangia = null;
				}
		
				if (!empty($row['SporangiumCase'])){
					$FamSporangiumCase = $row['SporangiumCase'];
				}
				else{
					$FamSporangiumCase = null;
				}
		
				if (!empty($row['MaleSporangiumCase'])){
					$FamMaleSporangiumCase = $row['MaleSporangiumCase'];
				}
				else{
					$FamMaleSporangiumCase = null;
				}
		
				if (!empty($row['FemaleSporangiumCase'])){
					$FamFemaleSporangiumCase = $row['FemaleSporangiumCase'];
				}
				else{
					$FamFemaleSporangiumCase = null;
				}
		
				if (!empty($row['Spores'])){
					$FamSpores = $row['Spores'];
				}
				else{
					$FamSpores = null;
				}
		
				if (!empty($row['Chromosomes'])){
					$FamChromosomes = $row['Chromosomes'];
				}
				else{
					$FamChromosomes = null;
				}
		
				if (!empty($row['RarityStatus'])){
					$FamRarityStatus = $row['RarityStatus'];
				}
				else{
					$FamRarityStatus = null;
				}
		
				if (!empty($row['Ecology'])){
					$FamEcology = $row['Ecology'];
				}
				else{
					$FamEcology = null;
				}
		
				if (!empty($row['Elevation'])){
					$FamElevation = $row['Elevation'];
				}
				else{
					$FamElevation = null;
				}
		
				if (!empty($row['BioregionalDistribution'])){
					$FamBioregionalDistribution = $row['BioregionalDistribution'];
				}
				else{
					$FamBioregionalDistribution = null;
				}
		
				if (!empty($row['OutsideCA'])){
					$FamOutsideCA = $row['OutsideCA'];
				}
				else{
					$FamOutsideCA = null;
				}

				if (!empty($row['GeneraInFamily'])){
					$FamGeneraInFamily = $row['GeneraInFamily'];
				}
				else{
					$FamGeneraInFamily = null;
				}
		
				if (!empty($row['Etymology'])){
					$FamEtymology = $row['Etymology'];
				}
				else{
					$FamEtymology = null;
				}
		
				if (!empty($row['Toxicity'])){
					$FamToxicity = $row['Toxicity'];
				}
				else{
					$FamToxicity = null;
				}
		
				if (!empty($row['Synonyms'])){
					$FamSynonyms = $row['Synonyms'];
				}
				else{
					$FamSynonyms = null;
				}
		
				if (!empty($row['UnabridgedSynonyms'])){
					$FamUnabridgedSynonyms = $row['UnabridgedSynonyms'];
				}
				else{
					$FamUnabridgedSynonyms = null;
				}
		
				if (!empty($row['Reference'])){
					$FamReference = $row['Reference'];
				}
				else{
					$FamReference = null;
				}
		
				if (!empty($row['UnabridgedReference'])){
					$FamUnabridgedReference = $row['UnabridgedReference'];
				}
				else{
					$FamUnabridgedReference = null;
				}
		
				if (!empty($row['Note'])){
					$FamNote = $row['Note'];
				}
				else{
					$FamNote = null;
				}
		
				if (!empty($row['UnabridgedNote'])){
					$FamUnabridgedNote = $row['UnabridgedNote'];
				}
				else{
					$FamUnabridgedNote = null;
				}
		
				if (!empty($row['FloweringTime'])){
					$FamFloweringTime = $row['FloweringTime'];
				}
				else{
					$FamFloweringTime = null;
				}
		
				if (!empty($row['FloweringTimeCode'])){
					$FamTimeCode = $row['FloweringTimeCode'];
				}
				else{
					$FamTimeCode = null;
				}
		
				if (!empty($row['FruitingTime'])){
					$FamFruitingTime = $row['FruitingTime'];
				}
				else{
					$FamFruitingTime = null;
				}
		
				if (!empty($row['Weediness'])){
					$FamWeediness = $row['Weediness'];
				}
				else{
					$FamWeediness = null;
				}
		
				if (!empty($row['IsTerminalTaxon'])){
					$FamIsTerminalTaxon  = $row['IsTerminalTaxon'];
				}
				else{
					$FamIsTerminalTaxon = null;
				}
		
				if (!empty($row['RevisionNumber'])){
					$FamRevisionNumber  = $row['RevisionNumber'];
				}
				else{
					$FamRevisionNumber = null;
				}
		
				if (!empty($row['RevisionDate'])){
					$FamRevisionDate  = $row['RevisionDate'];
				}
				else{
					$FamRevisionDate = null;
				}
		
				if (!empty($row['DistCode'])){
					$FamDistCode = $row['DistCode'];
				}
				else{
					$FamDistCode = null;
				}
		
				if (!empty($row['HasKey'])){
					$FamHasKey = $row['HasKey'];
				}
				else{
					$FamHasKey = null;
				}
		
				if (!empty($row['TaxonID'])){
					$FamTaxonID = $row['TaxonID'];
				}
				else{
					$FamTaxonID = null;
				}
			}
		}
		
//END FAMILY SQL QUERY ASSIGNMENT


//START GENUS SQL QUERY ASSIGNMENT


  //query and assign genus info
  //Note that only Genus has "SpeciesInGenus"
  //added as g.SpeciesInGenus
  //in text file, all genera should be checked if there is SpeciesInGenus line
  //GeneraInFamily and ScientificEditor removed
		if (!empty($TID)){
				$sql = "SELECT t.TaxonID, t.FamilyID";
//Genus
				$sql.= ", g.TaxonID, g.ScientificName, g.TaxonAuthor, g.CommonName";
				$sql.= ", g.TJM2Author, g.SpeciesInGenus, g.Habit, g.PlantBody, g.Stem";
				$sql.= ", g.SterileStem, g.FertileStem, g.Leaf, g.Spines, g.Inflorescence";
				$sql.= ", g.StaminateHead, g.RayOrPistillateFlower, g.PistillateHead, g.StaminateInflorescence";
				$sql.= ", g.PistillateOrBisexualInflorescence, g.PistillateInflorescence, g.Spikelet, g.FertileSpikelet";
				$sql.= ", g.SterileSpikelet, g.DistalSpikelet, g.CentralSpikelet, g.LateralSpikelet, g.StaminateSpikelet";
				$sql.= ", g.PistillateSpikelet, g.Flower, g.StaminateFlower, g.PistillateFlower, g.RayFlower, g.DiskFlower";
				$sql.= ", g.Cone, g.PollenCone, g.SeedCone, g.BisexualFlower, g.Fruit, g.Seed, g.Sporangia, g.SporangiumCase";
				$sql.= ", g.MaleSporangiumCase, g.FemaleSporangiumCase, g.Spores, g.Chromosomes, g.Etymology";
				$sql.= ", g.Toxicity, g.Synonyms, g.UnabridgedSynonyms, g.Note, g.UnabridgedNote, g.RevisionNumber";
				$sql.= ", g.RevisionDate, g.HasKey";
				$sql.= " from eflora_taxonomy t, eflora_taxa g";
				$sql.= " WHERE t.TaxonID=".$TID." AND t.GenusID=g.TaxonID";

//BEGIN temporary bug fix lines to add when needed
//echo '<br>'.$sql.'<br>';

			if(!mysqli_query($db, $sql)){
				die('Error: ' . mysqli_error($db));
			}

			$result = mysqli_query($db, $sql);

//query and assign variable to each table field
			while ($row = mysqli_fetch_array($result)) {

// If no results are found, echo a message and stop
				if ($row == false){
					echo '<b>Genus was not found in the eflora taxon table.<br>Try another search.<br>';
    				exit;
				}
//BEGIN temporary bug fix lines to add when needed
//foreach ($row as $key=>$value) {
//    echo $key."<br>";
//}
//END temp bug fix lines
				if (!empty($row['ScientificName'])){
					$GenScientificName = $row['ScientificName'];
				}
				else{
					$GenScientificName = null;
				}
		
				if (!empty($row['TaxonAuthor'])){
					$GenTaxonAuthor = $row['TaxonAuthor'];
				}
				else{
					$GenTaxonAuthor = null;
				}
		
				if (!empty($row['FormattedDisplayName'])){
					$GenFormattedDisplayName = $row['FormattedDisplayName'];
				}
				else{
					$GenFormattedDisplayName = null;
				}
		
				if (!empty($row['CommonName'])){
					$GenCommonName = $row['CommonName'];
				}
				else{
					$GenCommonName = null;
				}
		
				if (!empty($row['TJM2Author'])){
					$GenTJM2Author = $row['TJM2Author'];
				}
				else{
					$GenTJM2Author = null;
				}
		
				if (!empty($row['ScientificEditor'])){
					$GenScientificEditor = $row['ScientificEditor'];
				}
				else{
					$GenScientificEditor = null;
				}
		
				if (!empty($row['Habit'])){
					$GenHabit = $row['Habit'];
				}
				else{
					$GenHabit = null;
				}
		
				if (!empty($row['PlantBody'])){
					$GenPlantBody = $row['PlantBody'];
				}
				else{
					$GenPlantBody = null;
				}
		
				if (!empty($row['Stem'])){
					$GenStem = $row['Stem'];
				}
				else{
					$GenStem = null;
				}
		
				if (!empty($row['SterileStem'])){
					$GenSterileStem = $row['SterileStem'];
				}
				else{
					$GenSterileStem = null;
				}
		
				if (!empty($row['FertileStem'])){
					$GenFertileStem = $row['FertileStem'];
				}
				else{
					$GenFertileStem = null;
				}
		
				if (!empty($row['Leaf'])){
					$GenLeaf = $row['Leaf'];
				}
				else{
					$GenLeaf = null;
				}
		
				if (!empty($row['Spines'])){
					$GenSpines = $row['Spines'];
				}
				else{
					$GenSpines = null;
				}
		
				if (!empty($row['Inflorescence'])){
					$GenInflorescence = $row['Inflorescence'];
				}
				else{
					$GenInflorescence = null;
				}
		
				if (!empty($row['StaminateHead'])){
					$GenStaminateHead = $row['StaminateHead'];
				}
				else{
					$GenStaminateHead = null;
				}
		
				if (!empty($row['RayOrPistillateFlower'])){
					$GenRayOrPistillateFlower = $row['RayOrPistillateFlower'];
				}
				else{
					$GenRayOrPistillateFlower = null;
				}
		
				if (!empty($row['PistillateHead'])){
					$GenPistillateHead = $row['PistillateHead'];
				}
				else{
					$GenPistillateHead = null;
				}
		
				if (!empty($row['StaminateInflorescence'])){
					$GenStaminateInflorescence = $row['StaminateInflorescence'];
				}
				else{
					$GenStaminateInflorescence = null;
				}
		
				if (!empty($row['PistillateOrBisexualInflorescence'])){
					$GenPistillateOrBisexualInflorescence = $row['PistillateOrBisexualInflorescence'];
				}
				else{
					$GenPistillateOrBisexualInflorescence = null;
				}
		
				if (!empty($row['PistillateInflorescence'])){
					$GenPistillateInflorescence = $row['PistillateInflorescence'];
				}
				else{
					$GenPistillateInflorescence = null;
				}
		
				if (!empty($row['Spikelet'])){
					$GenSpikelet = $row['Spikelet'];
				}
				else{
					$GenSpikelet = null;
				}
		
				if (!empty($row['FertileSpikelet'])){
					$GenFertileSpikelet = $row['FertileSpikelet'];
				}
				else{
					$GenFertileSpikelet = null;
				}
		
				if (!empty($row['SterileSpikelet'])){
					$GenSterileSpikelet = $row['SterileSpikelet'];
				}
				else{
					$GenSterileSpikelet = null;
				}
		
				if (!empty($row['DistalSpikelet'])){
					$GenDistalSpikelet = $row['DistalSpikelet'];
				}
				else{
					$GenDistalSpikelet = null;
				}
		
				if (!empty($row['CentralSpikelet'])){
					$GenCentralSpikelet = $row['CentralSpikelet'];
				}
				else{
					$GenCentralSpikelet = null;
				}
		
				if (!empty($row['LateralSpikelet'])){
					$GenLateralSpikelet = $row['LateralSpikelet'];
				}
				else{
					$GenLateralSpikelet = null;
				}
		
				if (!empty($row['StaminateSpikelet'])){
					$GenStaminateSpikelet = $row['StaminateSpikelet'];
				}
				else{
					$GenStaminateSpikelet = null;
				}
		
				if (!empty($row['PistillateSpikelet'])){
					$GenPistillateSpikelet = $row['PistillateSpikelet'];
				}
				else{
					$GenPistillateSpikelet = null;
				}
		
				if (!empty($row['Flower'])){
					$GenFlower = $row['Flower'];
				}
				else{
					$GenFlower = null;
				}
		
				if (!empty($row['StaminateFlower'])){
					$GenStaminateFlower = $row['StaminateFlower'];
				}
				else{
					$GenStaminateFlower = null;
				}
		
				if (!empty($row['PistillateFlower'])){
					$GenPistillateFlower = $row['PistillateFlower'];
				}
				else{
					$GenPistillateFlower = null;
				}
		
				if (!empty($row['RayFlower'])){
					$GenRayFlower = $row['RayFlower'];
				}
				else{
					$GenRayFlower = null;
				}
		
				if (!empty($row['DiskFlower'])){
					$GenDiskFlower = $row['DiskFlower'];
				}
				else{
					$GenDiskFlower = null;
				}
		
				if (!empty($row['Cone'])){
					$GenCone = $row['Cone'];
				}
				else{
					$GenCone = null;
				}
		
				if (!empty($row['PollenCone'])){
					$GenPollenCone = $row['PollenCone'];
				}
				else{
					$GenPollenCone = null;
				}
		
				if (!empty($row['SeedCone'])){
					$GenSeedCone = $row['SeedCone'];
				}
				else{
					$GenSeedCone = null;
				}
		
				if (!empty($row['BisexualFlower'])){
					$GenBisexualFlower = $row['BisexualFlower'];
				}
				else{
					$GenBisexualFlower = null;
				}
		
				if (!empty($row['Fruit'])){
					$GenFruit = $row['Fruit'];
				}
				else{
					$GenFruit = null;
				}
		
				if (!empty($row['Seed'])){
					$GenSeed = $row['Seed'];
				}
				else{
					$GenSeed = null;
				}
		
				if (!empty($row['Sporangia'])){
					$GenSporangia = $row['Sporangia'];
				}
				else{
					$GenSporangia = null;
				}
		
				if (!empty($row['SporangiumCase'])){
					$GenSporangiumCase = $row['SporangiumCase'];
				}
				else{
					$GenSporangiumCase = null;
				}
		
				if (!empty($row['MaleSporangiumCase'])){
					$GenMaleSporangiumCase = $row['MaleSporangiumCase'];
				}
				else{
					$GenMaleSporangiumCase = null;
				}
		
				if (!empty($row['FemaleSporangiumCase'])){
					$GenFemaleSporangiumCase = $row['FemaleSporangiumCase'];
				}
				else{
					$GenFemaleSporangiumCase = null;
				}
		
				if (!empty($row['Spores'])){
					$GenSpores = $row['Spores'];
				}
				else{
					$GenSpores = null;
				}
		
				if (!empty($row['Chromosomes'])){
					$GenChromosomes = $row['Chromosomes'];
				}
				else{
					$GenChromosomes = null;
				}
		
				if (!empty($row['RarityStatus'])){
					$GenRarityStatus = $row['RarityStatus'];
				}
				else{
					$GenRarityStatus = null;
				}
		
				if (!empty($row['Ecology'])){
					$GenEcology = $row['Ecology'];
				}
				else{
					$GenEcology = null;
				}
		
				if (!empty($row['Elevation'])){
					$GenElevation = $row['Elevation'];
				}
				else{
					$GenElevation = null;
				}
		
				if (!empty($row['BioregionalDistribution'])){
					$GenBioregionalDistribution = $row['BioregionalDistribution'];
				}
				else{
					$GenBioregionalDistribution = null;
				}
		
				if (!empty($row['OutsideCA'])){
					$GenOutsideCA = $row['OutsideCA'];
				}
				else{
					$GenOutsideCA = null;
				}
		
				if (!empty($row['SpeciesInGenus'])){
					$GenSpeciesInGenus = $row['SpeciesInGenus'];
				}
				else{
					$GenSpeciesInGenus = null;
				}
		
				if (!empty($row['GeneraInFamily'])){
					$GenGeneraInFamily = $row['GeneraInFamily'];
				}
				else{
					$GenGeneraInFamily = null;
				}
		
				if (!empty($row['Etymology'])){
					$GenEtymology = $row['Etymology'];
				}
				else{
					$GenEtymology = null;
				}
		
				if (!empty($row['Toxicity'])){
					$GenToxicity = $row['Toxicity'];
				}
				else{
					$GenToxicity = null;
				}
		
				if (!empty($row['Synonyms'])){
					$GenSynonyms = $row['Synonyms'];
				}
				else{
					$GenSynonyms = null;
				}
		
				if (!empty($row['UnabridgedSynonyms'])){
					$GenUnabridgedSynonyms = $row['UnabridgedSynonyms'];
				}
				else{
					$GenUnabridgedSynonyms = null;
				}
		
				if (!empty($row['Reference'])){
					$GenReference = $row['Reference'];
				}
				else{
					$GenReference = null;
				}
		
				if (!empty($row['UnabridgedReference'])){
					$GenUnabridgedReference = $row['UnabridgedReference'];
				}
				else{
					$GenUnabridgedReference = null;
				}
		
				if (!empty($row['Note'])){
					$GenNote = $row['Note'];
				}
				else{
					$GenNote = null;
				}
		
				if (!empty($row['UnabridgedNote'])){
					$GenUnabridgedNote = $row['UnabridgedNote'];
				}
				else{
					$GenUnabridgedNote = null;
				}
		
				if (!empty($row['FloweringTime'])){
					$GenFloweringTime = $row['FloweringTime'];
				}
				else{
					$GenFloweringTime = null;
				}
		
				if (!empty($row['FloweringTimeCode'])){
					$GenTimeCode = $row['FloweringTimeCode'];
				}
				else{
					$GenTimeCode = null;
				}
		
				if (!empty($row['FruitingTime'])){
					$GenFruitingTime = $row['FruitingTime'];
				}
				else{
					$GenFruitingTime = null;
				}
		
				if (!empty($row['Weediness'])){
					$GenWeediness = $row['Weediness'];
				}
				else{
					$GenWeediness = null;
				}
		
				if (!empty($row['IsTerminalTaxon'])){
					$GenIsTerminalTaxon  = $row['IsTerminalTaxon'];
				}
				else{
					$GenIsTerminalTaxon = null;
				}
		
				if (!empty($row['RevisionNumber'])){
					$GenRevisionNumber  = $row['RevisionNumber'];
				}
				else{
					$GenRevisionNumber = null;
				}
		
				if (!empty($row['RevisionDate'])){
					$GenRevisionDate  = $row['RevisionDate'];
				}
				else{
					$GenRevisionDate = null;
				}
		
				if (!empty($row['DistCode'])){
					$GenDistCode = $row['DistCode'];
				}
				else{
					$GenDistCode = null;
				}
		
				if (!empty($row['HasKey'])){
					$GenHasKey = $row['HasKey'];
				}
				else{
					$GenHasKey = null;
				}
		
				if (!empty($row['TaxonID'])){
					$GenTaxonID = $row['TaxonID'];
				}
				else{
					$GenTaxonID = null;
				}
			}
		}



//END FAMILY SQL QUERY ASSIGNMENT


//START GENUS SQL QUERY ASSIGNMENT


  //query and assign species info
  //Species has neither GeneraInFamily, SpeciesInGenus nor ScientificEditor
  //SpeciesInGenus, GeneraInFamily and ScientificEditor removed
		if (!empty($TID)){
				$sql = "SELECT t.TaxonID, t.FamilyID, t.speciesName";
//Species
				$sql.= ", s.TaxonID, s.ScientificName, s.TaxonAuthor, s.CommonName";
				$sql.= ", s.TJM2Author, s.Habit, s.PlantBody, s.Stem";
				$sql.= ", s.SterileStem, s.FertileStem, s.Leaf, s.Spines, s.Inflorescence";
				$sql.= ", s.StaminateHead, s.RayOrPistillateFlower, s.PistillateHead, s.StaminateInflorescence";
				$sql.= ", s.PistillateOrBisexualInflorescence, s.PistillateInflorescence, s.Spikelet, s.FertileSpikelet";
				$sql.= ", s.SterileSpikelet, s.DistalSpikelet, s.CentralSpikelet, s.LateralSpikelet, s.StaminateSpikelet";
				$sql.= ", s.PistillateSpikelet, s.Flower, s.StaminateFlower, s.PistillateFlower, s.RayFlower, s.DiskFlower";
				$sql.= ", s.Cone, s.PollenCone, s.SeedCone, s.BisexualFlower, s.Fruit, s.Seed, s.Sporangia, s.SporangiumCase";
				$sql.= ", s.MaleSporangiumCase, s.FemaleSporangiumCase, s.Spores, s.Chromosomes, s.Etymology";
				$sql.= ", s.Toxicity, s.Synonyms, s.UnabridgedSynonyms, s.Note, s.UnabridgedNote, s.RevisionNumber";
				$sql.= ", s.RevisionDate, s.HasKey";
				$sql.= " from eflora_taxonomy t, eflora_taxa s";
				$sql.= " WHERE t.TaxonID=".$TID." AND t.SpeciesID=s.TaxonID";

//BEGIN temporary bug fix lines to add when needed
//echo '<br>'.$sql.'<br>';

			if(!mysqli_query($db, $sql)){
				die('Error: ' . mysqli_error($db));
			}

			$result = mysqli_query($db, $sql);

//query and assign variable to each table field
			while ($row = mysqli_fetch_array($result)) {

// If no results are found, echo a message and stop
				if ($row == false){
					echo '<b>Species was not found in the eflora taxon table.<br>Try another search.<br>';
    				exit;
				}
//BEGIN temporary bug fix lines to add when needed
//foreach ($row as $key=>$value) {
//    echo $key."<br>";
//}
//END temp bug fix lines
				if (!empty($row['speciesName'])){
					$SpecScientificName = $row['speciesName'];
				}
				else{
					$SpecScientificName = null;
				}
		
				if (!empty($row['TaxonAuthor'])){
					$SpecTaxonAuthor = $row['TaxonAuthor'];
				}
				else{
					$SpecTaxonAuthor = null;
				}
		
				if (!empty($row['FormattedDisplayName'])){
					$SpecFormattedDisplayName = $row['FormattedDisplayName'];
				}
				else{
					$SpecFormattedDisplayName = null;
				}
		
				if (!empty($row['CommonName'])){
					$SpecCommonName = $row['CommonName'];
				}
				else{
					$SpecCommonName = null;
				}
		
				if (!empty($row['TJM2Author'])){
					$SpecTJM2Author = $row['TJM2Author'];
				}
				else{
					$SpecTJM2Author = null;
				}
		
				if (!empty($row['Habit'])){
					$SpecHabit = $row['Habit'];
				}
				else{
					$SpecHabit = null;
				}
		
				if (!empty($row['PlantBody'])){
					$SpecPlantBody = $row['PlantBody'];
				}
				else{
					$SpecPlantBody = null;
				}
		
				if (!empty($row['Stem'])){
					$SpecStem = $row['Stem'];
				}
				else{
					$SpecStem = null;
				}
		
				if (!empty($row['SterileStem'])){
					$SpecSterileStem = $row['SterileStem'];
				}
				else{
					$SpecSterileStem = null;
				}
		
				if (!empty($row['FertileStem'])){
					$SpecFertileStem = $row['FertileStem'];
				}
				else{
					$SpecFertileStem = null;
				}
		
				if (!empty($row['Leaf'])){
					$SpecLeaf = $row['Leaf'];
				}
				else{
					$SpecLeaf = null;
				}
		
				if (!empty($row['Spines'])){
					$SpecSpines = $row['Spines'];
				}
				else{
					$SpecSpines = null;
				}
		
				if (!empty($row['Inflorescence'])){
					$SpecInflorescence = $row['Inflorescence'];
				}
				else{
					$SpecInflorescence = null;
				}
		
				if (!empty($row['StaminateHead'])){
					$SpecStaminateHead = $row['StaminateHead'];
				}
				else{
					$SpecStaminateHead = null;
				}
		
				if (!empty($row['RayOrPistillateFlower'])){
					$SpecRayOrPistillateFlower = $row['RayOrPistillateFlower'];
				}
				else{
					$SpecRayOrPistillateFlower = null;
				}
		
				if (!empty($row['PistillateHead'])){
					$SpecPistillateHead = $row['PistillateHead'];
				}
				else{
					$SpecPistillateHead = null;
				}
		
				if (!empty($row['StaminateInflorescence'])){
					$SpecStaminateInflorescence = $row['StaminateInflorescence'];
				}
				else{
					$SpecStaminateInflorescence = null;
				}
		
				if (!empty($row['PistillateOrBisexualInflorescence'])){
					$SpecPistillateOrBisexualInflorescence = $row['PistillateOrBisexualInflorescence'];
				}
				else{
					$SpecPistillateOrBisexualInflorescence = null;
				}
		
				if (!empty($row['PistillateInflorescence'])){
					$SpecPistillateInflorescence = $row['PistillateInflorescence'];
				}
				else{
					$SpecPistillateInflorescence = null;
				}
		
				if (!empty($row['Spikelet'])){
					$SpecSpikelet = $row['Spikelet'];
				}
				else{
					$SpecSpikelet = null;
				}
		
				if (!empty($row['FertileSpikelet'])){
					$SpecFertileSpikelet = $row['FertileSpikelet'];
				}
				else{
					$SpecFertileSpikelet = null;
				}
		
				if (!empty($row['SterileSpikelet'])){
					$SpecSterileSpikelet = $row['SterileSpikelet'];
				}
				else{
					$SpecSterileSpikelet = null;
				}
		
				if (!empty($row['DistalSpikelet'])){
					$SpecDistalSpikelet = $row['DistalSpikelet'];
				}
				else{
					$SpecDistalSpikelet = null;
				}
		
				if (!empty($row['CentralSpikelet'])){
					$SpecCentralSpikelet = $row['CentralSpikelet'];
				}
				else{
					$SpecCentralSpikelet = null;
				}
		
				if (!empty($row['LateralSpikelet'])){
					$SpecLateralSpikelet = $row['LateralSpikelet'];
				}
				else{
					$SpecLateralSpikelet = null;
				}
		
				if (!empty($row['StaminateSpikelet'])){
					$SpecStaminateSpikelet = $row['StaminateSpikelet'];
				}
				else{
					$SpecStaminateSpikelet = null;
				}
		
				if (!empty($row['PistillateSpikelet'])){
					$SpecPistillateSpikelet = $row['PistillateSpikelet'];
				}
				else{
					$SpecPistillateSpikelet = null;
				}
		
				if (!empty($row['Flower'])){
					$SpecFlower = $row['Flower'];
				}
				else{
					$SpecFlower = null;
				}
		
				if (!empty($row['StaminateFlower'])){
					$SpecStaminateFlower = $row['StaminateFlower'];
				}
				else{
					$SpecStaminateFlower = null;
				}
		
				if (!empty($row['PistillateFlower'])){
					$SpecPistillateFlower = $row['PistillateFlower'];
				}
				else{
					$SpecPistillateFlower = null;
				}
		
				if (!empty($row['RayFlower'])){
					$SpecRayFlower = $row['RayFlower'];
				}
				else{
					$SpecRayFlower = null;
				}
		
				if (!empty($row['DiskFlower'])){
					$SpecDiskFlower = $row['DiskFlower'];
				}
				else{
					$SpecDiskFlower = null;
				}
		
				if (!empty($row['Cone'])){
					$SpecCone = $row['Cone'];
				}
				else{
					$SpecCone = null;
				}
		
				if (!empty($row['PollenCone'])){
					$SpecPollenCone = $row['PollenCone'];
				}
				else{
					$SpecPollenCone = null;
				}
		
				if (!empty($row['SeedCone'])){
					$SpecSeedCone = $row['SeedCone'];
				}
				else{
					$SpecSeedCone = null;
				}
		
				if (!empty($row['BisexualFlower'])){
					$SpecBisexualFlower = $row['BisexualFlower'];
				}
				else{
					$SpecBisexualFlower = null;
				}
		
				if (!empty($row['Fruit'])){
					$SpecFruit = $row['Fruit'];
				}
				else{
					$SpecFruit = null;
				}
		
				if (!empty($row['Seed'])){
					$SpecSeed = $row['Seed'];
				}
				else{
					$SpecSeed = null;
				}
		
				if (!empty($row['Sporangia'])){
					$SpecSporangia = $row['Sporangia'];
				}
				else{
					$SpecSporangia = null;
				}
		
				if (!empty($row['SporangiumCase'])){
					$SpecSporangiumCase = $row['SporangiumCase'];
				}
				else{
					$SpecSporangiumCase = null;
				}
		
				if (!empty($row['MaleSporangiumCase'])){
					$SpecMaleSporangiumCase = $row['MaleSporangiumCase'];
				}
				else{
					$SpecMaleSporangiumCase = null;
				}
		
				if (!empty($row['FemaleSporangiumCase'])){
					$SpecFemaleSporangiumCase = $row['FemaleSporangiumCase'];
				}
				else{
					$SpecFemaleSporangiumCase = null;
				}
		
				if (!empty($row['Spores'])){
					$SpecSpores = $row['Spores'];
				}
				else{
					$SpecSpores = null;
				}
		
				if (!empty($row['Chromosomes'])){
					$SpecChromosomes = $row['Chromosomes'];
				}
				else{
					$SpecChromosomes = null;
				}
		
				if (!empty($row['RarityStatus'])){
					$SpecRarityStatus = $row['RarityStatus'];
				}
				else{
					$SpecRarityStatus = null;
				}
		
				if (!empty($row['Ecology'])){
					$SpecEcology = $row['Ecology'];
				}
				else{
					$SpecEcology = null;
				}
		
				if (!empty($row['Elevation'])){
					$SpecElevation = $row['Elevation'];
				}
				else{
					$SpecElevation = null;
				}
		
				if (!empty($row['BioregionalDistribution'])){
					$SpecBioregionalDistribution = $row['BioregionalDistribution'];
				}
				else{
					$SpecBioregionalDistribution = null;
				}
		
				if (!empty($row['OutsideCA'])){
					$SpecOutsideCA = $row['OutsideCA'];
				}
				else{
					$SpecOutsideCA = null;
				}
		
				if (!empty($row['Etymology'])){
					$SpecEtymology = $row['Etymology'];
				}
				else{
					$SpecEtymology = null;
				}
		
				if (!empty($row['Toxicity'])){
					$SpecToxicity = $row['Toxicity'];
				}
				else{
					$SpecToxicity = null;
				}
		
				if (!empty($row['Synonyms'])){
					$SpecSynonyms = $row['Synonyms'];
				}
				else{
					$SpecSynonyms = null;
				}
		
				if (!empty($row['UnabridgedSynonyms'])){
					$SpecUnabridgedSynonyms = $row['UnabridgedSynonyms'];
				}
				else{
					$SpecUnabridgedSynonyms = null;
				}
		
				if (!empty($row['Reference'])){
					$SpecReference = $row['Reference'];
				}
				else{
					$SpecReference = null;
				}
		
				if (!empty($row['UnabridgedReference'])){
					$SpecUnabridgedReference = $row['UnabridgedReference'];
				}
				else{
					$SpecUnabridgedReference = null;
				}
		
				if (!empty($row['Note'])){
					$SpecNote = $row['Note'];
				}
				else{
					$SpecNote = null;
				}
		
				if (!empty($row['UnabridgedNote'])){
					$SpecUnabridgedNote = $row['UnabridgedNote'];
				}
				else{
					$SpecUnabridgedNote = null;
				}
		
				if (!empty($row['FloweringTime'])){
					$SpecFloweringTime = $row['FloweringTime'];
				}
				else{
					$SpecFloweringTime = null;
				}
		
				if (!empty($row['FloweringTimeCode'])){
					$SpecTimeCode = $row['FloweringTimeCode'];
				}
				else{
					$SpecTimeCode = null;
				}
		
				if (!empty($row['FruitingTime'])){
					$SpecFruitingTime = $row['FruitingTime'];
				}
				else{
					$SpecFruitingTime = null;
				}
		
				if (!empty($row['Weediness'])){
					$SpecWeediness = $row['Weediness'];
				}
				else{
					$SpecWeediness = null;
				}
		
				if (!empty($row['IsTerminalTaxon'])){
					$SpecIsTerminalTaxon  = $row['IsTerminalTaxon'];
				}
				else{
					$SpecIsTerminalTaxon = null;
				}
		
				if (!empty($row['RevisionNumber'])){
					$SpecRevisionNumber  = $row['RevisionNumber'];
				}
				else{
					$SpecRevisionNumber = null;
				}
		
				if (!empty($row['RevisionDate'])){
					$SpecRevisionDate  = $row['RevisionDate'];
				}
				else{
					$SpecRevisionDate = null;
				}
		
				if (!empty($row['DistCode'])){
					$SpecDistCode = $row['DistCode'];
				}
				else{
					$SpecDistCode = null;
				}
		
				if (!empty($row['HasKey'])){
					$SpecHasKey = $row['HasKey'];
				}
				else{
					$SpecHasKey = null;
				}
		
				if (!empty($row['TaxonID'])){
					$SpecTaxonID = $row['TaxonID'];
				}
				else{
					$SpecTaxonID = null;
				}
			}
		}
		
		
//END Species SQL QUERY ASSIGNMENT


// START illustration SQL QUERY ASSIGNMENT

// 1. INITIALIZE VARIABLES (Prevents "Undefined Variable" errors)
$IllustrationFile = null;
$RevisedFileName = null;
$VIDEO = null;

if (!empty($TID)) {
    // Sanitize TID to prevent SQL injection
    $safeTID = mysqli_real_escape_string($db, $TID);
    
    $sql = "SELECT FileName, RevisedFileName, VideoURL FROM eflora_illustrations WHERE TaxonID='$safeTID'";

    $result = mysqli_query($db, $sql);

    if (!$result) {
        die('Error: ' . mysqli_error($db));
    }

    // 2. QUERY AND ASSIGN
    // If the record exists, these will be filled. If not, they stay NULL.
    while ($row = mysqli_fetch_array($result)) {
        if (!empty($row['FileName'])) {
            $IllustrationFile = $row['FileName'];
        }
        
        if (!empty($row['RevisedFileName'])) {
            $RevisedFileName = $row['RevisedFileName'];
        }
        
        if (!empty($row['VideoURL'])) {
            $VIDEO = $row['VideoURL'];
        }
    }
}

// 3. SET $hasMedia FLAG (Use this for your HTML logic)
$hasMedia = (!empty($IllustrationFile) || !empty($RevisedFileName) || !empty($VIDEO));

// END illustration SQL QUERY ASSIGNMENT

//Start JMAuthor pass down statements

  //assign the JM author and revision number
  //JMAuthor is inherited from the next highest up. 
	if (!empty($SpecTJM2Author)){ $JMAuthor = $SpecTJM2Author;}
	if (!empty($GenTJM2Author)){ $JMAuthor = $GenTJM2Author;}
	if (!empty($FamTJM2Author)){ $JMAuthor = $FamTJM2Author;}

	if (!empty($TJM2Author)){
		$JMAuthor = $TJM2Author;
	}
	else {
		if (!empty($SpecTJM2Author)){
			$JMAuthor = $SpecTJM2Author;
		}
		else{
			if (!empty($GenTJM2Author)){
				$JMAuthor = $GenTJM2Author;
			}
			else{
				if (!empty($FamTJM2Author)){
					$JMAuthor = $FamTJM2Author;
				}
				else{
					$JMAuthor = "Error CHECK eFlora Treatments";
				}
			}
		}
	}

  //JMAuthor is inherited from the next highest up. 
  //Note that "except where noted" will be inherited by terminals which might be unacceptable
  //it is removed here
  $JMAuthor = str_replace(", except as noted", "", $JMAuthor);

//END JMAuthor pass down statements


//START Reference pass down statements

//$Ref is inherited from the next highest up. 

	if (!empty($Reference)){
		$Ref = $Reference;
	//there are no species references, genus reference is always passed down
	}
	elseif (!empty($GenReference)){
		$Ref = $GenReference;
	}
	elseif (!empty($FamReference)){ 
		$Ref = $FamReference;
	}
	else {
		$Ref = null;
	}

	if (!empty($UnabridgedReference)){ 
		$UnabRef = $UnabridgedReference;
	//there are no species references, genus reference is always passed down
	}
	else {
		$UnabRef = null;
	}
	//elseif (!empty($GenUnabridgedReference)){ $UnabRef = $GenUnabridgedReference;}
	//elseif (!empty($FamUnabridgedReference)){ $UnabRef = $FamUnabridgedReference;}
	//the old method is coomented out, but the genus description link and family description link already pass this information
	//the data can be found by clikcing above, so why does it need to be displayed twice (although it is hidden by default)
	//all carex species pages are very long because of the extra long unabridged reference in the genus page

//END Reference pass down statements


//START Revision Number pass down statements

  //RevNumber is inherited by species or genus, but not from the family
  //Because a family revision does not affect all species/genera within the family
	if (!empty($RevisionNumber)){ 
		$RevNumber = $RevisionNumber;
	}
	elseif (!empty($SpecRevisionNumber)){ 
		$RevNumber = $SpecRevisionNumber;
	}
	elseif (!empty($GenRevisionNumber)){ 
		$RevNumber = $GenRevisionNumber;
	}
	else {
		$RevNumber = null;
	}
//END Revision Number pass down statements


//START Revision Date pass down statements

  //RevNumber is inherited by species or genus but not from the family
  //Because a family revision does not affect all species/genera within the family
	if (!empty($RevisionDate)){ 
		$RevDate = $RevisionDate;
	}
	elseif (!empty($SpecRevisionDate)){ 
		$RevDate = $SpecRevisionDate;
	}
	elseif (!empty($GenRevisionDate)){ 
		$RevDate = $GenRevisionDate;
	}
	else {
		$RevDate = "2012"; 
	//2012 is the defaut revision date; theoretically all revised taxa would fall into one of above
	}

//END Revision Date pass down statements

//Set default time zone for webpages

date_default_timezone_set('America/Los_Angeles');

?>



<!DOCTYPE html>
<html lang="en">
<head>
    <title><?php echo strip_tags($ScientificName); ?> - Jepson eFlora Taxon Page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- CSS Standardized -->
    <link href="/eflora/common/css/eflora-header.css" rel="stylesheet" type="text/css">
    <link href="/eflora/common/css/jepson-main.css" rel="stylesheet" type="text/css">
    <link href="/eflora/common/css/eflora.css" rel="stylesheet" type="text/css">

    <link rel="shortcut icon" href="/eflora/common/images/JepsonLogoSmall.png" type="image/x-icon" />

<!--mobile js script files-->
<script src="common/js/dh_custom.js"></script>


<script>
document.addEventListener('DOMContentLoaded', function() {
    // Select all buttons with the class 'tax-toggle-btn'
    const toggleButtons = document.querySelectorAll('.tax-toggle-btn');

    toggleButtons.forEach(button => {
        button.addEventListener('click', function() {
            // Get the ID of the description div based on the button's ID
            // e.g., 'familylink' matches with 'familydesc'
            const targetId = this.id.replace('link', 'desc');
            const targetDiv = document.getElementById(targetId);

            if (targetDiv) {
                // Check if the div is currently hidden
                if (targetDiv.style.display === 'block') {
                    targetDiv.style.display = 'none';
                    this.textContent = 'View Description';
                } else {
                    targetDiv.style.display = 'block';
                    this.textContent = 'Hide Description';
                }
            }
        });
    });
});
</script>
<!--jquery script files-->

	<script src="https://code.jquery.com/jquery-latest.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<!-- leaflet maps files and scripts -->

<link href='https://api.mapbox.com/mapbox.js/plugins/leaflet-fullscreen/v1.0.1/leaflet.fullscreen.css' rel='stylesheet' />

<!-- Include Leaflet CSS and JavaScript files -->
  <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
  <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
  
<script src='https://api.mapbox.com/mapbox.js/plugins/leaflet-fullscreen/v1.0.1/Leaflet.fullscreen.min.js'></script>

<script src='https://api.mapbox.com/mapbox.js/plugins/geojson-extent/v0.0.1/geojson-extent.js'></script>

<link rel="stylesheet" href="https://unpkg.com/leaflet-snap@0.0.4/leaflet.snap.js" />
<script src="https://unpkg.com/leaflet-snap@0.0.4/leaflet.snap.js"></script>



<script type="text/javascript">
    var MapName = <?php echo json_encode($TID); ?>; 
</script>


    <!-- Google Tag -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-T5YC99QF6Q"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());
      gtag('config', 'G-T5YC99QF6Q');
    </script>
</head>

<body onload="initialize()">

<!-- Header -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/eflora-header.php'); ?>  

<main class="eflora-main">

        <div style="margin-top: 20px;margin-bottom: 20px;">

    <!-- Hero Header Section -->
    <header class="hero-taxon">
        <h1>Jepson eFlora Taxon Page</h1>
    </header>

    <!-- warning link -->
<div class="center-text" style="margin-top: 30px;">
    <p style="font-weight: bolder; color: #5c3160;">&rarr; The <i>Jepson eFlora</i> has migrated to a new URL.  During this week, users may notice some features are not fully accessible.  Please continue to use the feedback link during this transition time.</p>
</div>


    <!-- return home link -->
<div class="center-text" style="margin-top: 30px;">
    <a href="/eflora/" style="font-weight: bold;">&larr; Return to <i>Jepson eFlora</i> Resource Portal</a>
</div>

    <!-- Feedback CTA -->
    <section class="feedback-section center-text">
        <a class="googleForm" href="https://docs.google.com/forms/d/e/1FAIpQLSc_wrQXqB9gNPrOgUTZ9WN38Ub08JlmgaIha7Ua99sHGzMntA/viewform">
            Send us your feedback! Community input helps improve the Jepson eFlora.
        </a>
    </section>
        </div>

    <!-- Navigation Block -->
    <nav class="icpn-nav-block" aria-label="Taxon Navigation">
        <div class="button-group" style="justify-content: space-between; width: 100%; display: flex; margin-bottom: 15px;">
            <?php 
                if (!empty($previousTaxonID)) echo '<a href="?tid='.$previousTaxonID.'" class="btn btn-reset">&larr; Previous Taxon</a>';
                echo '<div class="center-nav"><a href="/eflora/keys/IJM_fam_key.php">Key to Families</a> | <a href="/eflora/toc.php">Table of families and genera</a></div>';
                if (!empty($nextTaxonID)) echo '<a href="?tid='.$nextTaxonID.'" class="btn btn-reset">Next Taxon &rarr;</a>';
            ?>
        </div>
    </nav>

    <!-- Higher Taxonomy Toggles -->
    <?php if (!empty($FamScientificName)): ?>
    <section class="taxonomy-container">
        <div class="taxonomy-row">
            <strong>Family: <?php echo $FamScientificName; ?></strong>
			<?php if($FamScientificName !== $ScientificName) echo'<button class="tax-toggle-btn" id="familylink">View Description</button>';?>
            <?php if($FamHasKey) echo "<div class='center-text'><a href='/eflora/eflora_keys.php?key=$FamTaxonID'>Dichotomous Key</a></div>"; ?>
        </div>

		<div id="familydesc" class="initiallyHidden">
		<?php
			if (!empty($FamScientificName)) {
			echo "<p>";
//if there is no  family entries, skip this section
			if (!empty($FamCommonName)){ echo "<b>Common Name:</b> {$FamCommonName}<br>";}
			if (!empty($FamHabit)){ echo "<b>Habit:</b> {$FamHabit} ";}
			if (!empty($FamPlantBody)){ echo "<b>Plant Body:</b> {$FamPlantBody} ";}
			if (!empty($FamStem)){ echo "<b>Stem:</b> {$FamStem} ";}
			if (!empty($FamSterileStem)){ echo "<b>Sterile Stem:</b> {$FamSterileStem} ";}
			if (!empty($FamFertileStem)){ echo "<b>Fertile Stem:</b> {$FamFertileStem} ";}
			if (!empty($FamLeaf)){ echo "<b>Leaf:</b> {$FamLeaf} ";}
			if (!empty($FamSpines)){ echo "<b>Spines:</b> {$FamSpines} ";}
			if (!empty($FamInflorescence)){ echo "<b>Inflorescence:</b> {$FamInflorescence} ";}
			if (!empty($FamStaminateHead)){ echo "<b>Staminate Head:</b> {$FamStaminateHead} ";}
			if (!empty($FamRayOrPistillateFlower)){ echo "<b>Ray Or Pistillate Flower:</b> {$FamRayOrPistillateFlower} ";}
			if (!empty($FamPistillateHead)){ echo "<b>Pistillate Head:</b> {$FamPistillateHead} ";}
			if (!empty($FamStaminateInflorescence)){ echo "<b>Staminate Inflorescence:</b> {$FamStaminateInflorescence} ";}
			if (!empty($FamPistillateOrBisexualInflorescence)){ echo "<b>Pistillate Or Bisexual Inflorescence:</b> {$FamPistillateOrBisexualInflorescence} ";}
			if (!empty($FamPistillateInflorescence)){ echo "<b>Pistillate Inflorescence:</b> {$FamPistillateInflorescence} ";}
			if (!empty($FamSpikelet)){ echo "<b>Spikelet:</b> {$FamSpikelet} ";}
			if (!empty($FamFertileSpikelet)){ echo "<b>Fertile Spikelet:</b> {$FamFertileSpikelet} ";}
			if (!empty($FamSterileSpikelet)){ echo "<b>Sterile Spikelet:</b> {$FamSterileSpikelet} ";}
			if (!empty($FamDistalSpikelet)){ echo "<b>Distal Spikelet:</b> {$FamDistalSpikelet} ";}
			if (!empty($FamCentralSpikelet)){ echo "<b>Central Spikelet:</b> {$FamCentralSpikelet}";}
			if (!empty($FamLateralSpikelet)){ echo "<b>Lateral Spikelet:</b> {$FamLateralSpikelet}";}
			if (!empty($FamStaminateSpikelet)){ echo "<b>Staminate Spikelet:</b> {$FamStaminateSpikelet} ";}
			if (!empty($FamPistillateSpikelet)){ echo "<b>Pistillate Spikelet:</b> {$FamPistillateSpikelet} ";}
			if (!empty($FamFlower)){ echo "<b>Flower:</b> {$FamFlower} ";}
			if (!empty($FamStaminateFlower)){ echo "<b>Staminate Flower:</b> {$FamStaminateFlower} ";}
			if (!empty($FamPistillateFlower)){ echo "<b>Pistillate Flower:</b> {$FamPistillateFlower} ";}
			if (!empty($FamRayFlower)){ echo "<b>Ray Flower:</b> {$FamRayFlower} ";}
			if (!empty($FamDiskFlower)){ echo "<b>Disk Flower:</b> {$FamDiskFlower} ";}
			if (!empty($FamCone)){ echo "<b>Cone:</b> {$FamCone} ";}
			if (!empty($FamPollenCone)){ echo "<b>Pollen Cone:</b> {$FamPollenCone} ";}
			if (!empty($FamSeedCone)){ echo "<b>Seed Cone:</b> {$FamSeedCone} ";}
			if (!empty($FamBisexualFlower)){ echo "<b>Bisexual Flower:</b> {$FamBisexualFlower} ";}
			if (!empty($FamFruit)){ echo "<b>Fruit:</b> {$FamFruit} ";}
			if (!empty($FamSeed)){ echo "<b>Seed:</b> {$FamSeed} ";}
			if (!empty($FamSporangia)){ echo "<b>Sporangia:</b> {$FamSporangia} ";}
			if (!empty($FamSporangiumCase)){ echo "<b>Sporangium Case:</b> {$FamSporangiumCase} ";}
			if (!empty($FamMaleSporangiumCase)){ echo "<b>Male Sporangium Case:</b> {$FamMaleSporangiumCase} ";}
			if (!empty($FamFemaleSporangiumCase)){ echo "<b>Female Sporangium Case:</b> {$FamFemaleSporangiumCase} ";}
			if (!empty($FamSpores)){ echo "<b>Spores:</b> {$FamSpores} ";}
			if (!empty($FamChromosomes)){ echo "<b>Chromosomes:</b> {$FamChromosomes}";}
				echo "</p>"; //break between morphological fields and rest of fields
				echo "<p>";
			if (!empty($FamGeneraInFamily)){ echo "<b>Genera In Family:</b> {$FamGeneraInFamily} ";}
			if (!empty($FamEtymology)){ echo "<b>Etymology:</b> {$FamEtymology} ";}
			if (!empty($FamToxicity)){ echo "<b>Toxicity:</b> {$FamToxicity} ";}
			if (!empty($FamNote)){ echo "<b>Note:</b> {$FamNote} ";}
				echo "</p>";
				echo "<p>";
			if (!empty($FamUnabridgedNote)){ echo "<span class=\"blueTEXT\"><b>Unabridged Note:</b> {$FamUnabridgedNote}</span><br>";}
			if (!empty($FamTJM2Author)){ echo "<b>eFlora Treatment Author:</b> {$FamTJM2Author}<br>";}
			if (!empty($FamReference)){ echo "<b>Reference:</b> {$FamReference}<br>";}
			if (!empty($FamUnabridgedReference)){ echo "<span class=\"blueTEXT\"><b>Unabridged Reference:</b> {$FamUnabridgedReference}</span><br>";}
			if (!empty($FamScientificEditor)){ echo "<b>Scientific Editor:</b> {$FamScientificEditor}<br>";}
				echo "</p>";
		}

    	?>
		</div>

	<?php if (!empty($GenScientificName)): ?>
        <div class="taxonomy-row">
            <strong>Genus: <?php echo $GenScientificName; ?></strong>
			<?php if($GenScientificName !== $ScientificName) echo'<button class="tax-toggle-btn" id="genuslink">View Description</button>';?>
            <?php if($GenHasKey) echo "<div class='center-text'><a href='/eflora/eflora_keys.php?key=$GenTaxonID'>Dichotomous Key</a></div>"; ?>
        </div>

        <div id="genusdesc" class="initiallyHidden">
<?php		
		if (!empty($GenScientificName)){
			echo "<p>";
			if (!empty($GenCommonName)){ echo "<b>Common Name:</b> {$GenCommonName}<br>";}
			if (!empty($GenHabit)){ echo "<b>Habit:</b> {$GenHabit} ";}
			if (!empty($GenPlantBody)){ echo "<b>Plant Body:</b> {$GenPlantBody} ";}
			if (!empty($GenStem)){ echo "<b>Stem:</b> {$GenStem} ";}
			if (!empty($GenSterileStem)){ echo "<b>Sterile Stem:</b> {$GenSterileStem} ";}
			if (!empty($GenFertileStem)){ echo "<b>Fertile Stem:</b> {$GenFertileStem} ";}
			if (!empty($GenLeaf)){ echo "<b>Leaf:</b> {$GenLeaf} ";}
			if (!empty($GenSpines)){ echo "<b>Spines:</b> {$GenSpines} ";}
			if (!empty($GenInflorescence)){ echo "<b>Inflorescence:</b> {$GenInflorescence} ";}
			if (!empty($GenStaminateHead)){ echo "<b>Staminate Head:</b> {$GenStaminateHead} ";}
			if (!empty($GenRayOrPistillateFlower)){ echo "<b>Ray Or Pistillate Flower:</b> {$GenRayOrPistillateFlower} ";}
			if (!empty($GenPistillateHead)){ echo "<b>Pistillate Head:</b> {$GenPistillateHead} ";}
			if (!empty($GenStaminateInflorescence)){ echo "<b>Staminate Inflorescence:</b> {$GenStaminateInflorescence} ";}
			if (!empty($GenPistillateOrBisexualInflorescence)){ echo "<b>Pistillate Or Bisexual Inflorescence:</b> {$GenPistillateOrBisexualInflorescence} ";}
			if (!empty($GenPistillateInflorescence)){ echo "<b>Pistillate Inflorescence:</b> {$GenPistillateInflorescence} ";}
			if (!empty($GenSpikelet)){ echo "<b>Spikelet:</b> {$GenSpikelet} ";}
			if (!empty($GenFertileSpikelet)){ echo "<b>Fertile Spikelet:</b> {$GenFertileSpikelet} ";}
			if (!empty($GenSterileSpikelet)){ echo "<b>Sterile Spikelet:</b> {$GenSterileSpikelet} ";}
			if (!empty($GenDistalSpikelet)){ echo "<b>Distal Spikelet:</b> {$GenDistalSpikelet} ";}
			if (!empty($GenCentralSpikelet)){ echo "<b>Central Spikelet:</b> {$GenCentralSpikelet}";}
			if (!empty($GenLateralSpikelet)){ echo "<b>Lateral Spikelet:</b> {$GenLateralSpikelet}";}
			if (!empty($GenStaminateSpikelet)){ echo "<b>Staminate Spikelet:</b> {$GenStaminateSpikelet} ";}
			if (!empty($GenPistillateSpikelet)){ echo "<b>Pistillate Spikelet:</b> {$GenPistillateSpikelet} ";}
			if (!empty($GenFlower)){ echo "<b>Flower:</b> {$GenFlower} ";}
			if (!empty($GenStaminateFlower)){ echo "<b>Staminate Flower:</b> {$GenStaminateFlower} ";}
			if (!empty($GenPistillateFlower)){ echo "<b>Pistillate Flower:</b> {$GenPistillateFlower} ";}
			if (!empty($GenRayFlower)){ echo "<b>Ray Flower:</b> {$GenRayFlower} ";}
			if (!empty($GenDiskFlower)){ echo "<b>Disk Flower:</b> {$GenDiskFlower} ";}
			if (!empty($GenCone)){ echo "<b>Cone:</b> {$GenCone} ";}
			if (!empty($GenPollenCone)){ echo "<b>Pollen Cone:</b> {$GenPollenCone} ";}
			if (!empty($GenSeedCone)){ echo "<b>Seed Cone:</b> {$GenSeedCone} ";}
			if (!empty($GenBisexualFlower)){ echo "<b>Bisexual Flower:</b> {$GenBisexualFlower} ";}
			if (!empty($GenFruit)){ echo "<b>Fruit:</b> {$GenFruit} ";}
			if (!empty($GenSeed)){ echo "<b>Seed:</b> {$GenSeed} ";}
			if (!empty($GenSporangia)){ echo "<b>Sporangia:</b> {$GenSporangia} ";}
			if (!empty($GenSporangiumCase)){ echo "<b>Sporangium Case:</b> {$GenSporangiumCase} ";}
			if (!empty($GenMaleSporangiumCase)){ echo "<b>Male Sporangium Case:</b> {$GenMaleSporangiumCase} ";}
			if (!empty($GenFemaleSporangiumCase)){ echo "<b>Female Sporangium Case:</b> {$GenFemaleSporangiumCase} ";}
			if (!empty($GenSpores)){ echo "<b>Spores:</b> {$GenSpores} ";}
			if (!empty($GenChromosomes)){ echo "<b>Chromosomes:</b> {$GenChromosomes}";}
			echo "</p>"; //break between morphological fields and rest of fields
			echo "<p>";
			if (!empty($GenEtymology)){ echo "<b>Etymology:</b> {$GenEtymology} ";}
			if (!empty($GenToxicity)){ echo "<b>Toxicity:</b> {$GenToxicity} ";}
			if (!empty($GenNote)){ echo "<b>Note:</b> {$GenNote} ";}
			echo "</p>";
			echo "<p>";
			if (!empty($GenUnabridgedNote)){ echo "<span class=\"blueTEXT\"><b>Unabridged Note:</b> {$GenUnabridgedNote}</span><br>";}
			if (!empty($GenTJM2Author)){ echo "<b>eFlora Treatment Author:</b> {$GenTJM2Author}<br>";}
			if (!empty($GenReference)){ echo "<b>Reference:</b> {$GenReference}<br>";}
			if (!empty($GenUnabridgedReference)){ echo "<span class=\"blueTEXT\"><b>Unabridged Reference:</b> {$GenUnabridgedReference}</span><br>";}
			if (!empty($GenScientificEditor)){ echo "<b>Scientific Editor:</b> {$GenScientificEditor}<br>";}
			echo "</p>";
			
		}
		
?>
        </div>
    <?php endif; ?>

	<?php if (!empty($SpecScientificName)): ?>
		<?php if (strpos($ScientificName, 'var.') !== false || strpos($ScientificName, 'subsp.') !== false || strpos($ScientificName, 'nothosubsp.') !== false): ?>
		    <!-- Show this text when it contains 'var.' or 'subsp.' -->
		<?php
				$sql = "SELECT sortID, SpeciesID FROM eflora_taxonomy WHERE TaxonID=".$TID." ";
	
	//BEGIN temporary bug fix lines to add when needed
	//echo '<br>'.$sql.'<br>';
	//echo '<br>'.$nextID.'<br>';
	
				if(!mysqli_query($db, $sql)){
					die('Error: ' . mysqli_error($db));
				}
	
				$result = mysqli_query($db, $sql);
	
	//query and assign variable to each table field
				while ($row = mysqli_fetch_array($result)) {
	
	// If no results are found, echo a message and stop
					if ($row == false){
						echo '<b>The next ID was not found in the eflora taxon table.<br>Try another search.<br>';
	    				exit;
					}
	//BEGIN temporary bug fix lines to add when needed
	//foreach ($row as $key=>$value) {
	//    echo $key."<br>";
	//}
	//END temp bug fix lines
					// if (!empty($row(['TaxonID'])){    jg commented out
					if (!empty($row['SpeciesID'])){
						$currentSpecID = $row['SpeciesID'];
					}
					else{
						$currentSpecID = null;
					}
	
				}
				$prevSort = $ID-1;
				$sql = "SELECT sortID, SpeciesID FROM eflora_taxonomy WHERE sortID=".$prevSort." ";
	
	//BEGIN temporary bug fix lines to add when needed
	//echo '<br>'.$sql.'<br>';
	//echo '<br>'.$nextID.'<br>';
	
				if(!mysqli_query($db, $sql)){
					die('Error: ' . mysqli_error($db));
				}
	
				$result = mysqli_query($db, $sql);
	
	//query and assign variable to each table field
				while ($row = mysqli_fetch_array($result)) {
	
	// If no results are found, echo a message and stop
					if ($row == false){
						echo '<b>The next ID was not found in the eflora taxon table.<br>Try another search.<br>';
	    				exit;
					}
	//BEGIN temporary bug fix lines to add when needed
	//foreach ($row as $key=>$value) {
	//    echo $key."<br>";
	//}
	//END temp bug fix lines
					// if (!empty($row(['TaxonID'])){    jg commented out
					if (!empty($row['SpeciesID'])){
						$prevSpecID = $row['SpeciesID'];
					}
					else{
						$prevSpecID = null;
					}
	
				}




			?>
			
			<?php if ($currentSpecID == $prevSpecID): ?>
				<!--this is stray </i> is added because there is some stray <i> in the above data somewhere-->
        		</i><div class="taxonomy-row">
			        <strong>Species: <?php echo $SpecScientificName; ?></strong>
					<button class="tax-toggle-btn" id="specieslink">View Description</button>
			        <?php if($SpecHasKey) echo "<div class='center-text'><a href='/eflora/eflora_keys.php?key=$SpecTaxonID'>Dichotomous Key</a></div>"; ?>
				</div>
			
			    <div id="speciesdesc" class="initiallyHidden">
					<?php
					if (!empty($SpecScientificName)){
						echo "<p>";
						if (!empty($SpecCommonName)){ echo "<b>Common Name:</b> {$SpecCommonName}<br>";}
						if (!empty($SpecHabit)){ echo "<b>Habit:</b> {$SpecHabit} ";}
						if (!empty($SpecPlantBody)){ echo "<b>Plant Body:</b> {$SpecPlantBody} ";}
						if (!empty($SpecStem)){ echo "<b>Stem:</b> {$SpecStem} ";}
						if (!empty($SpecSterileStem)){ echo "<b>Sterile Stem:</b> {$SpecSterileStem} ";}
						if (!empty($SpecFertileStem)){ echo "<b>Fertile Stem:</b> {$SpecFertileStem} ";}
						if (!empty($SpecLeaf)){ echo "<b>Leaf:</b> {$SpecLeaf} ";}
						if (!empty($SpecSpines)){ echo "<b>Spines:</b> {$SpecSpines} ";}
						if (!empty($SpecInflorescence)){ echo "<b>Inflorescence:</b> {$SpecInflorescence} ";}
						if (!empty($SpecStaminateHead)){ echo "<b>Staminate Head:</b> {$SpecStaminateHead} ";}
						if (!empty($SpecRayOrPistillateFlower)){ echo "<b>Ray Or Pistillate Flower:</b> {$SpecRayOrPistillateFlower} ";}
						if (!empty($SpecPistillateHead)){ echo "<b>Pistillate Head:</b> {$SpecPistillateHead} ";}
						if (!empty($SpecStaminateInflorescence)){ echo "<b>Staminate Inflorescence:</b> {$SpecStaminateInflorescence} ";}
						if (!empty($SpecPistillateOrBisexualInflorescence)){ echo "<b>Pistillate Or Bisexual Inflorescence:</b> {$SpecPistillateOrBisexualInflorescence} ";}
						if (!empty($SpecPistillateInflorescence)){ echo "<b>Pistillate Inflorescence:</b> {$SpecPistillateInflorescence} ";}
						if (!empty($SpecSpikelet)){ echo "<b>Spikelet:</b> {$SpecSpikelet} ";}
						if (!empty($SpecFertileSpikelet)){ echo "<b>Fertile Spikelet:</b> {$SpecFertileSpikelet} ";}
						if (!empty($SpecSterileSpikelet)){ echo "<b>Sterile Spikelet:</b> {$SpecSterileSpikelet} ";}
						if (!empty($SpecDistalSpikelet)){ echo "<b>Distal Spikelet:</b> {$SpecDistalSpikelet} ";}
						if (!empty($SpecCentralSpikelet)){ echo "<b>Central Spikelet:</b> {$SpecCentralSpikelet}";}
						if (!empty($SpecLateralSpikelet)){ echo "<b>Lateral Spikelet:</b> {$SpecLateralSpikelet}";}
						if (!empty($SpecStaminateSpikelet)){ echo "<b>Staminate Spikelet:</b> {$SpecStaminateSpikelet} ";}
						if (!empty($SpecPistillateSpikelet)){ echo "<b>Pistillate Spikelet:</b> {$SpecPistillateSpikelet} ";}
						if (!empty($SpecFlower)){ echo "<b>Flower:</b> {$SpecFlower} ";}
						if (!empty($SpecStaminateFlower)){ echo "<b>Staminate Flower:</b> {$SpecStaminateFlower} ";}
						if (!empty($SpecPistillateFlower)){ echo "<b>Pistillate Flower:</b> {$SpecPistillateFlower} ";}
						if (!empty($SpecRayFlower)){ echo "<b>Ray Flower:</b> {$SpecRayFlower} ";}
						if (!empty($SpecDiskFlower)){ echo "<b>Disk Flower:</b> {$SpecDiskFlower} ";}
						if (!empty($SpecCone)){ echo "<b>Cone:</b> {$SpecCone} ";}
						if (!empty($SpecPollenCone)){ echo "<b>Pollen Cone:</b> {$SpecPollenCone} ";}
						if (!empty($SpecSeedCone)){ echo "<b>Seed Cone:</b> {$SpecSeedCone} ";}
						if (!empty($SpecBisexualFlower)){ echo "<b>Bisexual Flower:</b> {$SpecBisexualFlower} ";}
						if (!empty($SpecFruit)){ echo "<b>Fruit:</b> {$SpecFruit} ";}
						if (!empty($SpecSeed)){ echo "<b>Seed:</b> {$SpecSeed} ";}
						if (!empty($SpecSporangia)){ echo "<b>Sporangia:</b> {$SpecSporangia} ";}
						if (!empty($SpecSporangiumCase)){ echo "<b>Sporangium Case:</b> {$SpecSporangiumCase} ";}
						if (!empty($SpecMaleSporangiumCase)){ echo "<b>Male Sporangium Case:</b> {$SpecMaleSporangiumCase} ";}
						if (!empty($SpecFemaleSporangiumCase)){ echo "<b>Female Sporangium Case:</b> {$SpecFemaleSporangiumCase} ";}
						if (!empty($SpecSpores)){ echo "<b>Spores:</b> {$SpecSpores} ";}
						if (!empty($SpecChromosomes)){ echo "<b>Chromosomes:</b> {$SpecChromosomes}";}
						echo "</p>"; //break between morphological fields and rest of fields
						echo "<p>";
						if (!empty($SpecEtymology)){ echo "<b>Etymology:</b> {$SpecEtymology} ";}
						if (!empty($SpecToxicity)){ echo "<b>Toxicity:</b> {$SpecToxicity} ";}
						if (!empty($SpecNote)){ echo "<b>Note:</b> {$SpecNote} ";}
						echo "</p>";
						echo "<p>";
						if (!empty($SpecUnabridgedNote)){ echo "<span class=\"blueTEXT\"><b>Unabridged Note:</b> {$SpecUnabridgedNote}</span><br>";}
						if (!empty($SpecTJM2Author)){ echo "<b>eFlora Treatment Author:</b> {$SpecTJM2Author}<br>";}
						if (!empty($SpecReference)){ echo "<b>Reference:</b> {$SpecReference}<br>";}
						if (!empty($SpecUnabridgedReference)){ echo "<span class=\"blueTEXT\"><b>Unabridged Reference:</b> {$SpecUnabridgedReference}</span><br>";}
						echo "</p>";
					}
					?>
				</div>
			<?php elseif ( ($currentSpecID !== $previousSpecID) && ( (empty($previousInfraName)) || strpos($ScientificName, 'var.') !== false || strpos($ScientificName, 'subsp.') !== false || strpos($ScientificName, 'nothosubsp.') !== false) ): ?>
				<!--this is stray </i> is added because there is some stray <i> in the above data somewhere-->
        		</i>
        		<div class="taxonomy-row">
					<strong><strong>Species: <?php echo $SpecScientificName; ?></strong>
					<?php if($SpecHasKey) echo "<div class='center-text'><a href='/eflora/eflora_keys.php?key=$SpecTaxonID'>Dichotomous Key</a></div>"; ?>
				</div>

			<?php endif; ?>
		<?php elseif ($SpecScientificName !== $ScientificName): ?>
    <!-- Show this alternate text when the first condition is false, but this one is true -->
    <!-- Alternate text for when ScientificName does not match SpecScientificName. -->
				<!--this is stray </i> is added because there is some stray <i> in the above data somewhere-->
        		</i>
            	<div class="taxonomy-row">
		        </i><strong>Species:<?php echo $SpecScientificName; ?></strong>
		        <?php if($SpecHasKey) echo "<div class='center-text'><a href='/eflora/eflora_keys.php?key=$SpecTaxonID'>Dichotomous Key</a></div>"; ?>
			</div>
		
		    <div id="speciesdesc" class="initiallyHidden">
				<?php
				if (!empty($SpecScientificName)){
					echo "<p>";
					if (!empty($SpecCommonName)){ echo "<b>Common Name:</b> {$SpecCommonName}<br>";}
					if (!empty($SpecHabit)){ echo "<b>Habit:</b> {$SpecHabit} ";}
					if (!empty($SpecPlantBody)){ echo "<b>Plant Body:</b> {$SpecPlantBody} ";}
					if (!empty($SpecStem)){ echo "<b>Stem:</b> {$SpecStem} ";}
					if (!empty($SpecSterileStem)){ echo "<b>Sterile Stem:</b> {$SpecSterileStem} ";}
					if (!empty($SpecFertileStem)){ echo "<b>Fertile Stem:</b> {$SpecFertileStem} ";}
					if (!empty($SpecLeaf)){ echo "<b>Leaf:</b> {$SpecLeaf} ";}
					if (!empty($SpecSpines)){ echo "<b>Spines:</b> {$SpecSpines} ";}
					if (!empty($SpecInflorescence)){ echo "<b>Inflorescence:</b> {$SpecInflorescence} ";}
					if (!empty($SpecStaminateHead)){ echo "<b>Staminate Head:</b> {$SpecStaminateHead} ";}
					if (!empty($SpecRayOrPistillateFlower)){ echo "<b>Ray Or Pistillate Flower:</b> {$SpecRayOrPistillateFlower} ";}
					if (!empty($SpecPistillateHead)){ echo "<b>Pistillate Head:</b> {$SpecPistillateHead} ";}
					if (!empty($SpecStaminateInflorescence)){ echo "<b>Staminate Inflorescence:</b> {$SpecStaminateInflorescence} ";}
					if (!empty($SpecPistillateOrBisexualInflorescence)){ echo "<b>Pistillate Or Bisexual Inflorescence:</b> {$SpecPistillateOrBisexualInflorescence} ";}
					if (!empty($SpecPistillateInflorescence)){ echo "<b>Pistillate Inflorescence:</b> {$SpecPistillateInflorescence} ";}
					if (!empty($SpecSpikelet)){ echo "<b>Spikelet:</b> {$SpecSpikelet} ";}
					if (!empty($SpecFertileSpikelet)){ echo "<b>Fertile Spikelet:</b> {$SpecFertileSpikelet} ";}
					if (!empty($SpecSterileSpikelet)){ echo "<b>Sterile Spikelet:</b> {$SpecSterileSpikelet} ";}
					if (!empty($SpecDistalSpikelet)){ echo "<b>Distal Spikelet:</b> {$SpecDistalSpikelet} ";}
					if (!empty($SpecCentralSpikelet)){ echo "<b>Central Spikelet:</b> {$SpecCentralSpikelet}";}
					if (!empty($SpecLateralSpikelet)){ echo "<b>Lateral Spikelet:</b> {$SpecLateralSpikelet}";}
					if (!empty($SpecStaminateSpikelet)){ echo "<b>Staminate Spikelet:</b> {$SpecStaminateSpikelet} ";}
					if (!empty($SpecPistillateSpikelet)){ echo "<b>Pistillate Spikelet:</b> {$SpecPistillateSpikelet} ";}
					if (!empty($SpecFlower)){ echo "<b>Flower:</b> {$SpecFlower} ";}
					if (!empty($SpecStaminateFlower)){ echo "<b>Staminate Flower:</b> {$SpecStaminateFlower} ";}
					if (!empty($SpecPistillateFlower)){ echo "<b>Pistillate Flower:</b> {$SpecPistillateFlower} ";}
					if (!empty($SpecRayFlower)){ echo "<b>Ray Flower:</b> {$SpecRayFlower} ";}
					if (!empty($SpecDiskFlower)){ echo "<b>Disk Flower:</b> {$SpecDiskFlower} ";}
					if (!empty($SpecCone)){ echo "<b>Cone:</b> {$SpecCone} ";}
					if (!empty($SpecPollenCone)){ echo "<b>Pollen Cone:</b> {$SpecPollenCone} ";}
					if (!empty($SpecSeedCone)){ echo "<b>Seed Cone:</b> {$SpecSeedCone} ";}
					if (!empty($SpecBisexualFlower)){ echo "<b>Bisexual Flower:</b> {$SpecBisexualFlower} ";}
					if (!empty($SpecFruit)){ echo "<b>Fruit:</b> {$SpecFruit} ";}
					if (!empty($SpecSeed)){ echo "<b>Seed:</b> {$SpecSeed} ";}
					if (!empty($SpecSporangia)){ echo "<b>Sporangia:</b> {$SpecSporangia} ";}
					if (!empty($SpecSporangiumCase)){ echo "<b>Sporangium Case:</b> {$SpecSporangiumCase} ";}
					if (!empty($SpecMaleSporangiumCase)){ echo "<b>Male Sporangium Case:</b> {$SpecMaleSporangiumCase} ";}
					if (!empty($SpecFemaleSporangiumCase)){ echo "<b>Female Sporangium Case:</b> {$SpecFemaleSporangiumCase} ";}
					if (!empty($SpecSpores)){ echo "<b>Spores:</b> {$SpecSpores} ";}
					if (!empty($SpecChromosomes)){ echo "<b>Chromosomes:</b> {$SpecChromosomes}";}
					echo "</p>"; //break between morphological fields and rest of fields
					echo "<p>";
					if (!empty($SpecEtymology)){ echo "<b>Etymology:</b> {$SpecEtymology} ";}
					if (!empty($SpecToxicity)){ echo "<b>Toxicity:</b> {$SpecToxicity} ";}
					if (!empty($SpecNote)){ echo "<b>Note:</b> {$SpecNote} ";}
					echo "</p>";
					echo "<p>";
					if (!empty($SpecUnabridgedNote)){ echo "<span class=\"blueTEXT\"><b>Unabridged Note:</b> {$SpecUnabridgedNote}</span><br>";}
					if (!empty($SpecTJM2Author)){ echo "<b>eFlora Treatment Author:</b> {$SpecTJM2Author}<br>";}
					if (!empty($SpecReference)){ echo "<b>Reference:</b> {$SpecReference}<br>";}
					if (!empty($SpecUnabridgedReference)){ echo "<span class=\"blueTEXT\"><b>Unabridged Reference:</b> {$SpecUnabridgedReference}</span><br>";}
					echo "</p>";
				}
				?>
		    </div>
		<?php endif; ?>
	<?php endif; ?>

  </section>
  <?php endif; ?>


  <?php 
  	if (preg_match('/^[A-Za-z-]+aceae$|^[A-Za-z-]+$/', $ScientificName)) {

    //Hero Header Section for family and genus//
		echo '<header class="hero-taxon"> <h2>';
		echo $FormattedDisplayName;
		echo '</h2><p class="common-name">';
		echo $CommonName;
		echo '</p></header>';
	} else { 

// Hero Header Section for all other names
echo '<header class="hero-taxon">';

    // 1. Taxon Title & Common Name (Top Text)
    echo '<h2>' . $FormattedDisplayName . '</h2>';
    echo '<p class="common-name">' . $CommonName . '</p>';

    // 2. Top Jump Bar (Now placed at the bottom, right above the border line)
    echo '<nav class="eflora-jump-bar" aria-label="Taxon Section Jump Links">';
    echo '<span class="jump-label">Jump to:</span>';
    echo '<ul class="jump-links">';
    echo '<li><a href="#section-images">Images</a></li>';
    echo '<li><a href="#section-distribution">Distribution</a></li>';
    echo '<li><a href="#section-specimens">Specimens</a></li>';
    echo '<li><a href="#section-links">Links</a></li>';
    echo '</ul></nav>';

echo '</header>';
	}
  ?>


<?php
	if (isset($HasKey)){ echo "<p><b><a href='/eflora/eflora_keys.php?key=".$TID."'>Key to ".$ScientificName."</a></b></p>"; }
?>

<?php 
    // Check if any media exists
    $hasMedia = (!empty($VIDEO) || !empty($RevisedFileName) || !empty($IllustrationFile));
    // Determine the grid class: split-view or full-width
    $layoutClass = $hasMedia ? "has-media-grid" : "no-media-full";
?>

<!-- PRIMARY CONTENT GRID -->
<div class="treatment-grid <?php echo $layoutClass; ?>">
    
    <!-- This section will now span the full width if $hasMedia is false -->
    <article class="treatment-text data-section">
<!-- Target Section Examples -->
		<section id="section-description" class="data-section">
    <!-- Content -->

        <h3>Treatment Description</h3>
        <p><strong><?php echo $efloraStatus; ?></strong></p>
        <div class="morphology">

		<?php
		if (!empty($Habit)){ echo '<b>Habit:</b> '.$Habit.' ';}
		if (!empty($PlantBody)){ echo '<b>Plant Body:</b> '.$PlantBody.' ';}
		if (!empty($Stem)){ echo '<b>Stem:</b> '.$Stem.' ';}
		if (!empty($SterileStem)){ echo '<b>Sterile Stem:</b> '.$SterileStem.' ';}
		if (!empty($FertileStem)){ echo '<b>Fertile Stem:</b> '.$FertileStem.' ';}
		if (!empty($Leaf)){ echo '<b>Leaf:</b> '.$Leaf.' ';}
		if (!empty($Spines)){ echo '<b>Spines:</b> '.$Spines.' ';}
		if (!empty($Inflorescence)){ echo '<b>Inflorescence:</b> '.$Inflorescence.' ';}
		if (!empty($StaminateHead)){ echo '<b>Staminate Head:</b> '.$StaminateHead.' ';}
		if (!empty($RayOrPistillateFlower)){ echo '<b>Ray Or Pistillate Flower:</b> '.$RayOrPistillateFlower.' ';}
		if (!empty($PistillateHead)){ echo '<b>Pistillate Head:</b> '.$PistillateHead.' ';}
		if (!empty($StaminateInflorescence)){ echo '<b>Staminate Inflorescence:</b> '.$StaminateInflorescence.' ';}
		if (!empty($PistillateOrBisexualInflorescence)){ echo '<b>Pistillate Or Bisexual Inflorescence:</b> '.$PistillateOrBisexualInflorescence.' ';}
		if (!empty($PistillateInflorescence)){ echo '<b>Pistillate Inflorescence:</b> '.$PistillateInflorescence.' ';}
		if (!empty($Spikelet)){ echo '<b>Spikelet:</b> '.$Spikelet.' ';}
		if (!empty($FertileSpikelet)){ echo '<b>Fertile Spikelet:</b> '.$FertileSpikelet.' ';}
		if (!empty($SterileSpikelet)){ echo '<b>Sterile Spikelet:</b> '.$SterileSpikelet.' ';}
		if (!empty($DistalSpikelet)){ echo '<b>Distal Spikelet:</b> '.$DistalSpikelet.' ';}
		if (!empty($CentralSpikelet)){ echo '<b>Central Spikelet:</b> '.$CentralSpikelet.' ';}
		if (!empty($LateralSpikelet)){ echo '<b>Lateral Spikelet:</b> '.$LateralSpikelet.' ';}
		if (!empty($StaminateSpikelet)){ echo '<b>Staminate Spikelet:</b> '.$StaminateSpikelet.' ';}
		if (!empty($PistillateSpikelet)){ echo '<b>Pistillate Spikelet:</b> '.$PistillateSpikelet.' ';}
		if (!empty($Flower)){ echo '<b>Flower:</b> '.$Flower.' ';}
		if (!empty($StaminateFlower)){ echo '<b>Staminate Flower:</b> '.$StaminateFlower.' ';}
		if (!empty($PistillateFlower)){ echo '<b>Pistillate Flower:</b> '.$PistillateFlower.' ';}
		if (!empty($RayFlower)){ echo '<b>Ray Flower:</b> '.$RayFlower.' ';}
		if (!empty($DiskFlower)){ echo '<b>Disk Flower:</b> '.$DiskFlower.' ';}
		if (!empty($Cone)){ echo '<b>Cone:</b> '.$Cone.' ';}
		if (!empty($PollenCone)){ echo '<b>Pollen Cone:</b> '.$PollenCone.' ';}
		if (!empty($SeedCone)){ echo '<b>Seed Cone:</b> '.$SeedCone.' ';}
		if (!empty($BisexualFlower)){ echo '<b>Bisexual Flower:</b> '.$BisexualFlower.' ';}
		if (!empty($Fruit)){ echo '<b>Fruit:</b> '.$Fruit.' ';}
		if (!empty($Seed)){ echo '<b>Seed:</b> '.$Seed.' ';}
		if (!empty($Sporangia)){ echo '<b>Sporangia:</b> '.$Sporangia.' ';}
		if (!empty($SporangiumCase)){ echo '<b>Sporangium Case:</b> '.$SporangiumCase.' ';}
		if (!empty($MaleSporangiumCase)){ echo '<b>Male Sporangium Case:</b> '.$MaleSporangiumCase.' ';}
		if (!empty($FemaleSporangiumCase)){ echo '<b>Female Sporangium Case:</b> '.$FemaleSporangiumCase.' ';}
		if (!empty($Spores)){ echo '<b>Spores:</b> '.$Spores.' ';}
		if (!empty($Chromosomes)){ echo '<b>Chromosomes:</b> '.$Chromosomes.' ';}

 ?>
            </div>
            
            <div class="ecology-dist" style="margin-top:20px; padding-top:20px; border-top: 1px solid #eee;">
<?php 
		echo "<p>";
		if (!empty($Ecology)){ echo "<b>Ecology:</b> {$Ecology} ";}
		if (!empty($Elevation)){ echo "<b>Elevation:</b> {$Elevation} ";}
		if (!empty($BioregionalDistribution)){ echo "<b><a href=\"#MAP\">Bioregional Distribution:</a></b> {$BioregionalDistribution} ";}
		if (!empty($OutsideCA)){ echo "<b>Distribution Outside California:</b> {$OutsideCA} ";}
		if (!empty($SpeciesInGenus)){ echo "<b>Species In Genus:</b> {$SpeciesInGenus} ";}
		if (!empty($GeneraInFamily)){ echo "<b>Genera In Family:</b> {$GeneraInFamily} ";}
		if (!empty($Etymology)){ echo "<b>Etymology:</b> {$Etymology} ";}
		if (!empty($Toxicity)){ echo "<b>Toxicity:</b> {$Toxicity} ";}
		if (!empty($FloweringTime)){ echo "<b>Flowering Time:</b> {$FloweringTime} ";}
		if (!empty($FruitingTime)){ echo "<b>Fruiting Time:</b> {$FruitingTime} ";}
		if (!empty($Note)){ echo "<b>Note:</b> {$Note} ";}
		echo "</p>";
		echo "<p>";
		if (!empty($Synonyms)){ echo "<b>Synonyms:</b> {$Synonyms}<br>";}
		if (!empty($UnabridgedSynonyms)){ echo "<span class=\"blueTEXT\"><b>Unabridged Synonyms:</b> {$UnabridgedSynonyms}</span><br>";}
		if (!empty($UnabridgedNote)){ echo "<span class=\"blueTEXT\"><b>Unabridged Note:</b> {$UnabridgedNote}</span><br>";}
		if (!empty($JMAuthor)){ echo "<b>Jepson eFlora Author:</b> {$JMAuthor}<br>";}
		if (!empty($Ref)){ echo "<b>Reference:</b> {$Ref}<br>";}
		if (!empty($UnabRef)){ echo "<span class=\"blueTEXT\"><b>Unabridged Reference:</b> {$UnabRef}</span><br>";}
		if (!empty($ScientificEditor)){ echo "<b>Scientific Editor:</b> {$ScientificEditor}<br>";}
		echo "</p>";
 ?>

                <p><a href="/eflora/icpn/icpn_display.php?tid=<?php echo $TID; ?>"><strong>Index of California Plant Names (ICPN) Record</strong></a></p>


            </div>

		</section>

            <!-- Taxa Dropdown -->
            <div class="search-group" style="margin-top:30px;">
                <form>
                    <label for="taxa-select"><strong>List of taxa:</strong></label>
                    <select id="taxa-select" onchange="window.location=this.value" style="width:100%; min-height:48px;">
                        <option value="">Select a taxon...</option>
<?php 
//START LEFT SIDE BLOCK, FIRST ROW, create species drop down box using SQL Query statements

//get and print list of taxa within the genus (if a species or infra), or list of species within genus (if a genus)

  //if the rank is lower than genus
	if (!empty($GenTaxonID)){
		//echo '<p><form>';
		//echo '<label><b>List of species:</b><select WIDTH=20 onChange="window.location=this.value">';
		//echo '<OPTION VALUE="None">&nbsp;&nbsp;click here';
		//$GenTaxonID for focal taxon determined in an earlier query
		//$sql = "SELECT DISTINCT b.sortID as SORT, a.TaxonID as TaxonID, a.ScientificName as ScientificName, b.TaxonID as TID, b.GenusID as GenusID FROM eflora_taxa a";
		//$sql.= " INNER JOIN eflora_taxonomy b on TaxonID = TID";
		//$sql.= " WHERE GenusID=".$GenTaxonID." AND SORT IS NOT NULL";
		//$sql.= " ORDER BY SORT ";

		$sql = "SELECT DISTINCT b.sortID AS SORT, a.TaxonID, a.ScientificName, b.TaxonID AS TID, b.GenusID ";
		$sql .= "FROM eflora_taxa a ";
		$sql .= "INNER JOIN eflora_taxonomy b ON a.TaxonID = b.TaxonID ";
		$sql .= "WHERE b.GenusID = " . intval($GenTaxonID) . " AND b.sortID IS NOT NULL ";
		$sql .= "ORDER BY SORT";


//BEGIN temporary bug fix lines to add when needed
//echo '<br>'.$sql.'<br>';

			if(!mysqli_query($db, $sql)){
				die('Error: ' . mysqli_error($db));
			}

			$result = mysqli_query($db, $sql);

//query and assign variable to each table field
		while ($row = mysqli_fetch_array($result)) {

// If no results are found, echo a message and stop
			if ($row == false){
				echo '<b>Genus ID was not found in the eflora taxon table.<br>Try another search.<br>';
    			exit;
			}
//BEGIN temporary bug fix lines to add when needed
//foreach ($row as $key=>$value) {
//    echo $key."<br>";
//}
//END temp bug fix lines
			if (!empty($row['TaxonID'])){
				//echo ' <OPTION VALUE="/eflora/eflora_display.php?tid='.$row['TaxonID'].'">'.$row['ScientificName'];
				echo '<option value="/eflora/eflora_display.php?tid=' . $row['TaxonID'] . '">' . $row['ScientificName'] . '</option>';
			}

		}
	} else {
		if (preg_match('/aceae$/i', $ScientificName)) {
		//if (!empty($FamTaxonID)) { 
	//if the rank is otherwise lower than family, and therefore at rank genus
		//echo '<p><form>';
		//echo '<label><b>List of species:</b><select width=20 onchange="window.location=this.value">';
		//echo '<OPTION value="None">&nbsp;&nbsp;click here';

	// Assuming $currentFamilyTaxonID is the ID of the family the user is currently viewing
			$currentFamilyTaxonID = intval($TaxonID); 

			$sql = "SELECT DISTINCT b.sortID AS SORT, a.TaxonID, a.ScientificName, b.TaxonID AS TID, b.GenusID ";
			$sql .= "FROM eflora_taxa a ";
			$sql .= "INNER JOIN eflora_taxonomy b ON a.TaxonID = b.TaxonID "; // Join taxa to their corresponding genera/taxonomy records
			$sql .= "WHERE b.FamilyID = " . $currentFamilyTaxonID . " AND b.sortID IS NOT NULL ";
			$sql .= "ORDER BY SORT";


		//$sql = "SELECT DISTINCT b.sortID AS SORT, a.TaxonID, a.ScientificName, b.TaxonID AS TID, b.GenusID";
		//$sql .= "FROM eflora_taxa a ";
		//$sql .= "INNER JOIN eflora_taxonomy b ON a.TaxonID = b.$FamTaxonId ";
		//$sql .= "WHERE a.$TaxonID = " . intval($FamTaxonID) . " AND b.sortID IS NOT NULL ";
		//$sql .= "ORDER BY SORT";

		//$sql = "SELECT DISTINCT b.sortID as SORT, a.TaxonID as TaxonID, a.ScientificName as ScientificName, b.TaxonID as TID, b.GenusID as GenusID FROM eflora_taxa a";
		//$sql.= " INNER JOIN eflora_taxonomy b on TaxonID = TID";
		//$sql.= " WHERE GenusID=".$TID." AND SORT IS NOT NULL";
		//$sql.= " ORDER BY SORT ";

//The ON clause (TaxonID = TID):

//TID is an alias you created inside the SELECT statement. SQL processes the FROM and JOIN clauses before it looks at the SELECT clause, meaning TID doesn't exist yet when the JOIN runs.
//Fix: Changed it to use the actual column names from the tables: ON a.TaxonID = b.TaxonID.
//Ambiguous GenusID in the WHERE clause:

//You wrote GenusID= without specifying whether it belongs to table a or table b. If both tables happen to have a column named GenusID, MariaDB will throw an ambiguity error.
//Fix: Prefixed it with b.GenusID (assuming it belongs to the taxonomy table based on your SELECT clause).
//Using SORT in the WHERE clause:

//Just like aliases in JOIN, you cannot use a SELECT column alias (SORT) in a WHERE clause because WHERE runs before SELECT.
//Fix: Used the actual column name instead: b.sortID IS NOT NULL.
//Security Improvement (intval):

//If $TID is a number, passing it straight into the string makes your code vulnerable to SQL Injection. Wrapping it in intval($TID) ensures it's treated safely as an integer. (Note: If $TID is a string/text instead of a number, use your database //connection's real escape function instead).

//BEGIN temporary bug fix lines to add when needed
//echo '<br>'.$sql.'<br>';

			if(!mysqli_query($db, $sql)){
				die('Error: ' . mysqli_error($db));
			}

			$result = mysqli_query($db, $sql);

//query and assign variable to each table field
			while ($row = mysqli_fetch_array($result)) {

// If no results are found, echo a message and stop
				if ($row == false){
					echo '<b>Genus ID (2) was not found in the eflora taxon table.<br>Try another search.<br>';
    				exit;
				}
//BEGIN temporary bug fix lines to add when needed
//foreach ($row as $key=>$value) {
//    echo $key."<br>";
//}
//END temp bug fix lines
				if (!empty($row['TaxonID'])){
					//echo ' <OPTION VALUE="/eflora/eflora_display.php?tid='.$row['TaxonID'].'">'.$row['ScientificName'];
					echo '<option value="/eflora/eflora_display.php?tid=' . $row['TaxonID'] . '">' . $row['ScientificName'] . '</option>';

				}
			}
		} else {
	    echo '<option value="" disabled>No results available for this taxon</option>';
		}
	}

//END LEFT SIDE BLOCK, FIRST ROW, create species drop down box using SQL Query statements
 ?>

                    </select>
                </form>
            </div>
        </article>


<?php 
// 1. RE-EVALUATE $hasMedia right before the block
$hasMedia = (!empty($VIDEO) || !empty($RevisedFileName) || !empty($IllustrationFile));

if ($hasMedia): 
?>
    <!-- ASIDE ONLY SHOWS IF MEDIA EXISTS -->
    <aside class="media-column">
        <?php if (!empty($VIDEO)): ?>
            <div class="video-box" style="margin-bottom:30px;">
                <h4>Jepson Video for <i><?php echo str_replace(" var. ", "</i> var. <i>", $ScientificName); ?></i></h4>
                <p>Click to watch the video.</p>
                <a href="<?php echo $VIDEO; ?>" target="_blank">
                    <img src="/eflora/common/images/youtube_social_icon_red.png" alt="YouTube Video" style="width:64px;">
                </a>
            </div>
        <?php endif; ?>

        <?php 
        // 2. Determine which illustration to show
       
        if (!empty($RevisedFileName)): 
        ?>
            <div class="illus-box">
                <h4>Botanical Illustration for <i><?php echo str_replace(" var. ", "</i> var. <i>", $ScientificName); ?></i></h4>
                <?php
                   $imgPath = "/eflora/illustrations/revised/" . $RevisedFileName; 
                ?>
                <a href="<?php echo $imgPath; ?>" target="_blank">
                    <img src="<?php echo $imgPath; ?>" alt="Illustration of <?php echo strip_tags($ScientificName); ?>">
                </a>
            </div>
        <?php 
        elseif (!empty($IllustrationFile)): 
        ?>
            <div class="illus-box">
                <h4>Botanical Illustration for <i><?php echo str_replace(" var. ", "</i> var. <i>", $ScientificName); ?></i></h4>
                <?php
                   $imgPath = "/eflora/illustrations/" . $IllustrationFile; 
                ?>
                <a href="<?php echo $imgPath; ?>" target="_blank">
                    <img src="<?php echo $imgPath; ?>" alt="Illustration of <?php echo strip_tags($ScientificName); ?>">
                </a>
            </div>
        <?php endif; ?>

    </aside>
<?php endif; ?>

</div> <!-- End treatment-grid -->

    <!-- Navigation & Index Bars -->
    <nav class="icpn-nav-block" aria-label="eFlora Navigation">
		<!-- Index Section -->
		<section class="index-footer-wrap">
    		<div class="search-group">
        		<nav class="icpn-index-container" aria-labelledby="alpha-title">
            		<!-- Alphabetical Index -->
            		<h3 id="alpha-title" style="margin-top: 0;">Alphabetical Index to eFlora accepted names and synonyms</h3>
            		<div class="index-bar" style="margin-bottom: 10px;">
            			<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/eflora_index_bar.html'); ?>
        			</div>
        		</nav>
    		</div>
                <!-- Standardized Horizontal Search Form -->
        <div class="search-centered-container">
            <form action="search_eflora.php" method="get" class="centered-form">
                <label for="name" class="search-label">Scientific Name Search:</label>
                <div class="input-row">
                    <input type="text" id="name" name="name" placeholder="Enter a scientific name..." required>
                    <div class="button-group">
                        <button type="submit" class="btn btn-submit">Submit</button>
                        <button type="reset" class="btn btn-reset">Reset</button>
                    </div>
                </div>
            </form>
        </div>
        </section>
    </nav>




    <!-- CITATION -->
    <footer class="treatment-citation" style="margin-top:40px; padding: 20px; background: #eee; border-left: 5px solid var(--ef-blue);">
	<p><strong>Citation for this treatment:</strong> 
<?php echo preg_replace("/\[[^\]]+\]/","",$JMAuthor); 
	  if ($RevDate){ echo " ".$RevDate.", ";}
	  echo $ScientificName.", in Jepson Flora Project (eds.) <em>Jepson eFlora</em>, ";
	  if ($RevNumber){ echo $RevNumber.", ";}
	  echo "https://herbariadb.berkeley.edu/eflora/eflora_display.php?tid=".$TID.", accessed on "?> 
<?php echo date ("F d, Y")?>.
</p>

        <p><strong>Citation for the whole project:</strong> Jepson Flora Project (eds.) <?php echo date("Y"); ?>, <em>Jepson eFlora</em>, https://herbariadb.berkeley.edu/eflora/, accessed on <?php echo date("F d, Y"); ?>.</p>
    </footer>

<?php 
	if (preg_match('/^[A-Za-z-]+aceae$|^[A-Za-z-]+$/', $ScientificName)) {
	    // Your code here if it does NOT match
echo "</div></main>";



echo "    <!-- SEPARATOR BAR HERE -->";
echo "    <hr class=\"footer-separator\">";

echo "    <!-- Feedback CTA -->";
echo "    <section class=\"feedback-section center-text\">";
echo "        <a class=\"googleForm\" href=\"https://docs.google.com/forms/d/e/1FAIpQLSc_wrQXqB9gNPrOgUTZ9WN38Ub08JlmgaIha7Ua99sHGzMntA/viewform\">";
echo "            Send us your feedback! Community input helps improve the Jepson eFlora.";
echo "        </a></section>";

?>

<!-- Footer -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/eflora-footer.php'); ?>

</body>
</html>

<?php 
	} else {
?>
<!-- Middle Jump Bar -->
<nav class="eflora-jump-bar" aria-label="Taxon Section Jump Links - Middle">
    <span class="jump-label">Jump to:</span>
    <ul class="jump-links">
        <li><a href="#section-description">Description</a></li>
        <li><a href="#section-distribution">Distribution</a></li>
        <li><a href="#section-specimens">Specimens</a></li>
        <li><a href="#section-links">Links</a></li>
    </ul>
</nav>


    <!-- CALPHOTOS RESPONSIVE GALLERY -->
	<section class="photo-gallery-section">
	   <section id="section-images" class="data-section">
		<!-- Content -->
        <h3 class="center-text">Images courtesy of CalPhotos</h3>
        <div class="i-align">
<?php 
//photos from CalPhotos, set up a converison of the taxon name for the API below.
//not sure why this is placed here and not below
$cp_ssp_name = str_replace(" subsp. ", " ssp. ", $ScientificName); //CalPhotos uses "ssp." and not "subsp."
$cp_name = $cp_ssp_name;


//check for known synonyms that are not showing up with images in CalPhotos under the eFlora name
echo '<table id="calphotos"><tr><td>';
	echo '<div class="i-align">';

	$cp_search_name = str_replace(" ", "+", $cp_ssp_name);

$homepage = file_get_contents("https://calphotos.berkeley.edu/cgi/api_taxon?taxon=".$cp_search_name."&us_state=CA&s=eflora");
	$alreadyOutput = array();
	$delimiter = "\n";
	$splitcontents = explode($delimiter, $homepage);
		if (!empty($splitcontents)){ 
			foreach ( $splitcontents as $line ){
				$bits = explode("\t", $line);
				[$var0, $var1, $var2, $var3] = array_pad($bits, 4, null);

					foreach($bits as $key => $value) {
						//$raw_taxon = $bits[0];
						$raw_taxon = $var0;
						$taxon = str_replace(" ssp. ", " subsp. ", $raw_taxon);
						//$kwid = $bits[1];
						$kwid = $var1;
						//$copyright = $bits[2];
						$copyright = $var2;
						$enlarge = str_replace(" ", "+", $kwid); //full image links in format 0000+1111+2222+3333
						$kwidarray = explode(" ",$kwid);
						[$kwid0, $kwid1, $kwid2, $kwid3] = array_pad($kwidarray, 4, null);
						//$kwid4thumb = "{$kwidarray[0]}_{$kwidarray[1]}/{$kwidarray[2]}/{$kwidarray[3]}"; //thumbnail links in format 0000_1111/2222/3333
						$kwid4thumb = "{$kwid0}_{$kwid1}/{$kwid2}/{$kwid3}"; //thumbnail links in format 0000_1111/2222/3333
				
						

						if(in_array($kwid, $alreadyOutput)){
							continue;
						}
						$alreadyOutput[] = $kwid; 
						//echo $kwid . "<br>";
						
						echo '<div class="i-align">';
							if ( (!empty($taxon)) && (!empty($kwid)) ){
								echo '<div class="v-align">';
								echo '<div class="max-width-p"><i>';
								echo str_replace(" var. ", "&nbsp;&nbsp;<br></i> var. <i>", $taxon);
								echo '</i></div>';
			
								echo '<div>';
								echo '<a href="https://calphotos.berkeley.edu/cgi/img_query?query_src=ucjeps&enlarge='.$enlarge.'"><img border="0" src=https://calphotos.berkeley.edu/imgs/128x192/'.$kwid4thumb.'.jpeg alt="click for image enlargement"></img></a>';
								echo '</div>';

								echo '<div>';
								echo '&copy;';
								echo $copyright.'</div>';
								echo '</div>';
							}
							else{
								//echo 'BAD ENCODING';
							}
						echo '</div>';

  	// echo "<li>$key: $value</li>";
					}
			}

//Sagina apetala	0000 0000 0320 1497	2020 Keir Morse
	//echo "<p>FOUND-->".$cp_search_name."</p>";
		}
		else{//if there is no $kwid (i.e. no photos), do not print the "see more" link or the extra divider
			echo '<p class="max-width-p">No images found for <i>'.$ScientificName.'.</i></p>';
		}

echo "</td></tr></table>";


if (!empty($splitcontents)){ 
	$cp_search_name = str_replace(" ", "+", $cp_ssp_name);
	echo '<p class="max-width-p"><a href="https://calphotos.berkeley.edu/cgi/img_query?query_src=ucjeps&where-genre=Plant&where-taxon='.$cp_ssp_name.'&title_tag='.$ScientificName.'">See all photos of <i>'.$ScientificName.'</i> in CalPhotos</a></p>';
}


?>
        </div>
	   </section>
	</section>



    <!-- MAPS SECTION (Interactive hides on mobile) -->
    <section class="map-display-grid">
        <div class="static-map-box center-text data-section">

			<section id="section-distribution" class="data-section">
			<h3>eFlora Distribution Map</h3>

 
			<h4>This map presents a visual display of a taxon&prime;s distribution in the geographic subdivisions (bioregions) of California as indicated by the Jepson eFlora author. 
			</h4>
<h4><?php echo "<i>$ScientificName</i>&nbsp;&nbsp;&nbsp;&nbsp;";?>
 <?php
	$regname = str_replace(";", " ", $BioregionalDistribution);
	echo "$regname";
?></h4>
            <img src="/cgi-bin/eflora/new_jmap?<?php echo $DistCode; ?>" alt="Bioregional map" style="max-width:100%; height:auto; border:1px solid #ccc;">
<p>(Note: any qualifiers in the taxon distribution description, such as 'northern', 'southern', 'adjacent' etc., are not reflected in the map above, and in some cases indication of a taxon in a subdivision is based on a single collection or author-verified occurrence).
</p>

			</section>
        </div>
        


    <!-- RIGHT COLUMN: Specimen Map & Phenology -->
    <div class="bottom-column-right">

	  <section id="section-specimens" class="data-section">

        <!-- Box 3: Specimen Map & Text -->
        <section class="data-section specimen-map-container">
            <!-- Map hides on mobile via CSS -->

            <div class="interactive-map-wrapper">
            <h3>Specimen Distribution Map (Interactive)</h3>
<b><a name="EFMAP" id="EFMAP"></a>MAP CONTROLS</b>
<br>1. You can change the display of the base map in the upper right-hand corner.
<br>2. County and Jepson bioregions can be turned off and on by using the check boxes in the control box.
</p>

                <div id="map_canvas">
	<link href="/eflora/common/cluster/MarkerCluster.Default.css" type="text/css" rel=stylesheet />
	<link rel="stylesheet" type="text/css" href="/eflora/common/cluster/MapkeyIcons.css" />
	<link rel="stylesheet" type="text/css" href="/eflora/common/cluster/L.Icon.Mapkey.css" />
	<script src="/eflora/common/cluster/L.Icon.Mapkey.js"></script>
	<script src="/eflora/common/cluster/leaflet.markercluster.js"></script>

<script type="text/javascript"> 


latlng = L.latLng(37.5, -119.5);

var map = L.map('map_canvas', {
		center: latlng,
		zoom: 5
		});

map.addControl(new L.Control.Fullscreen());

	var jepsfill;
	var cntybnd;	
	var jepsreg;
	var geojsonLayerP;
	var FILL = L.layerGroup();
	var COUNTY = L.layerGroup();
	var REG = L.layerGroup();
	
	map.scrollWheelZoom.disable();

var cacount = "geojson/counties_TIGER2016.geojson"; //full json file for California County TIGER2016 
var regfill = "geojson/JepsonV7.geojson"; //full json file for Jepson regions
var CABND = "geojson/CA_BND_line.geojson"; //full json file for California Boundary line file
var bnd = "geojson/Jepson_regions_buffer_bnd.geojson"; //full json file for Jepson regions

//this section defines the version of geojson specimen dot map file to use

//$.getJSON('GEOJSON/'+MapName+'_2.geojson', function(data) { //March 2022
//$.getJSON('GEOJSON/'+MapName+'_3.geojson', function(data) { //Jan 2023
//$.getJSON('GEOJSON/'+MapName+'_4.geojson', function(data) { //Feb 2023
//$.getJSON('GEOJSON/'+MapName+'_5.geojson', function(data) { //Feb 2024
//$.getJSON('GEOJSON/'+MapName+'_6.geojson', function(data) { //MAR 2025
//$.getJSON('GEOJSON/'+MapName+'_8.geojson', function(data) { //MAY 2025        
//$.getJSON('GEOJSON/'+MapName+'_9.geojson', function(data) { //NOV 2025        
//$.getJSON('GEOJSON/'+MapName+'_1.geojson', function(data) { //DEC 2025
//$.getJSON('GEOJSON/'+MapName+'_2.geojson', function(data) { //MAR 2026
//$.getJSON('geojson/taxa/'+MapName+'_3.geojson', function(data) { //APR 2026
//$.getJSON('geojson/'+MapName+'_3.geojson', function(data) { //SEP 2026
$.getJSON('geojson/'+MapName+'_4.geojson', function(data) { //SEP 2026

//geojson specimen dot map configurations

	geojsonLayerP = L.geoJson(data, {
			// Make the popup
		pointToLayer: function (feature, latlng) {
			// Get the icon
			if (feature.properties.Flag_icon == 'Bmarker')
				return L.circleMarker(latlng, {stroke:true, radius: 3, weight: 1, color: 'black', fillColor: '#00008B', opacity:1,fillOpacity:1});
			else if (feature.properties.Flag_icon == 'Ymarker')
				return L.circleMarker(latlng, {stroke:true, radius: 3, weight: 1, color: 'black', fillColor: 'yellow', opacity:1,fillOpacity:1});
			else if (feature.properties.Flag_icon == 'Pmarker')
				return L.circleMarker(latlng, {stroke:true, radius: 3, weight: 1, color: 'black', fillColor: '#9370DB', opacity:1,fillOpacity:1});
		}
	}).addTo(map);

		
  map.on('zoomend', function() {
	var currentZoom = map.getZoom();
	
	  if (currentZoom <= 5) {

		geojsonLayerP = L.geoJson(data, {
			// Make the popup
			pointToLayer: function (feature, latlng) {
// Get the icon
				if (feature.properties.Flag_icon == 'Bmarker')
					return L.circleMarker(latlng, {stroke:true, radius: 3, weight: 1, color: 'black', fillColor: '#00008B', opacity:1,fillOpacity:1});
				else if (feature.properties.Flag_icon == 'Ymarker')
					return L.circleMarker(latlng, {stroke:true, radius: 3, weight: 1, color: 'black', fillColor: 'yellow', opacity:1,fillOpacity:1});
				else if (feature.properties.Flag_icon == 'Pmarker')
					return L.circleMarker(latlng, {stroke:true, radius: 3, weight: 1, color: 'black', fillColor: '#9370DB', opacity:1,fillOpacity:1});
		}
	  }).addTo(map);
	}
	else{
	
		if (currentZoom <= 6) {

			geojsonLayerP = L.geoJson(data, {
			// Make the popup
				pointToLayer: function (feature, latlng) {
// Get the icon
					if (feature.properties.Flag_icon == 'Bmarker')
						return L.circleMarker(latlng, {stroke:true, radius: 6, weight: 2, color: 'black', fillColor: '#00008B', opacity:1,fillOpacity:1});
					else if (feature.properties.Flag_icon == 'Ymarker')
						return L.circleMarker(latlng, {stroke:true, radius: 6, weight: 2, color: 'black', fillColor: 'yellow', opacity:1,fillOpacity:1});
					else if (feature.properties.Flag_icon == 'Pmarker')
						return L.circleMarker(latlng, {stroke:true, radius: 6, weight: 2, color: 'black', fillColor: '#9370DB', opacity:1,fillOpacity:1});

					//return L.marker(latlng, {
					//	icon:L.icon({
					//		iconUrl: 'common/icons/'+feature.properties.Flag_icon+'S.png',
					//		iconSize: [10,10],
					//		popupAnchor: [1, -25],    // point of the icon which will correspond to popup's location
					//		iconAnchor: [2, 8]   // point of the icon which will correspond to marker's location
					//	})
					//});
				}
			}).addTo(map);

		}
		else {
			if (currentZoom <= 7) {

				geojsonLayerP = L.geoJson(data, {
// Make the popup
			                                                        
//"DET": "Galium stellatum var. eremicum","CO": "San Bernardino","LOC"          
						onEachFeature: function (feature, layer) {
							// 1. Start with your default popup content (e.g., cchID)
							let popupContent = "<strong>"+feature.properties.DET+"</strong><br>"+ feature.properties.accid+"<br>"+feature.properties.CO+"<br>"+feature.properties.LOC+"<br>";

							// 2. Check if seiID exists and is not an empty string
							if (feature.properties.seiID && feature.properties.seiID.trim() !== "") {
							let url = "https://swbiodiversity.org/seinet/collections/individual/index.php?occid=" + feature.properties.seiID; 
							popupContent += '<a href="' + url + '"&clid=0" target="_blank">View SEINet Record</a>';
							}

							// 3. Check if seiID exists and is not an empty string
							if (feature.properties.cchID && feature.properties.cchID.trim() !== "") {
							let url = "https://cch2.org/portal/collections/individual/index.php?occid=" + feature.properties.cchID; 
							popupContent += '<a href="' + url + '"&clid=0" target="_blank">View CCH2 Record</a>';
							}
							
							// 4. Bind the complete content to the layer
							layer.bindPopup(popupContent);
						},
					//old code
					//onEachFeature: function (feature, layer) {
			        // layer.bindPopup(feature.properties.DET+"<br /><a href=/consortium/details.php?aid="+feature.properties.accid+">"+feature.properties.accid+"</a><br />"+feature.properties.CO+" County<br />"+feature.properties.LOC);
					//},
					pointToLayer: function (feature, latlng) {
			// Get the icon
						return L.marker(latlng, {
							icon:L.icon({
								iconUrl: 'common/icons/'+feature.properties.Flag_icon+'.png',
								iconSize: [14,14],
								popupAnchor: [1, -15],    // point of the icon which will correspond to popup's location
								iconAnchor: [7, 14]   // point of the icon which will correspond to marker's location
							})
						});
					}
				}).addTo(map);

			}
			else {
				if (currentZoom <= 9) {

					geojsonLayerP = L.geoJson(data, {
			// Make the popup

						onEachFeature: function (feature, layer) {
							// 1. Start with your default popup content (e.g., cchID)
							let popupContent = "<strong>"+feature.properties.DET+"</strong><br>"+ feature.properties.accid+"<br>"+feature.properties.CO+"<br>"+feature.properties.LOC+"<br>";

							// 2. Check if seiID exists and is not an empty string
							if (feature.properties.seiID && feature.properties.seiID.trim() !== "") {
							let url = "https://swbiodiversity.org/seinet/collections/individual/index.php?occid=" + feature.properties.seiID; 
							popupContent += '<a href="' + url + '"&clid=0" target="_blank">View SEINet Record</a>';
							}

							// 3. Check if seiID exists and is not an empty string
							if (feature.properties.cchID && feature.properties.cchID.trim() !== "") {
							let url = "https://cch2.org/portal/collections/individual/index.php?occid=" + feature.properties.cchID; 
							popupContent += '<a href="' + url + '"&clid=0" target="_blank">View CCH2 Record</a>';
							}
							
							// 4. Bind the complete content to the layer
							layer.bindPopup(popupContent);
						},
					//old code
						//onEachFeature: function (feature, layer) {
				        // layer.bindPopup(feature.properties.DET+"<br /><a href=/consortium/details.php?aid="+feature.properties.accid+">"+feature.properties.accid+"</a><br />"+feature.properties.CO+" County<br />"+feature.properties.LOC);
						//},
						pointToLayer: function (feature, latlng) {
			// Get the icon
							return L.marker(latlng, {
								icon:L.icon({
									iconUrl: 'common/icons/'+feature.properties.Flag_icon+'.png',
									iconSize: [20,20],
									popupAnchor: [1, -25],    // point of the icon which will correspond to popup's location
									iconAnchor: [10, 20]   // point of the icon which will correspond to marker's location
								})
							});
						}
					}).addTo(map);

				}
				else{

					geojsonLayerP = L.geoJson(data, {
					// Make the popup

						onEachFeature: function (feature, layer) {
							// 1. Start with your default popup content (e.g., cchID)
							let popupContent = "<strong>"+feature.properties.DET+"</strong><br>"+ feature.properties.accid+"<br>"+feature.properties.CO+"<br>"+feature.properties.LOC+"<br>";

							// 2. Check if seiID exists and is not an empty string
							if (feature.properties.seiID && feature.properties.seiID.trim() !== "") {
							let url = "https://swbiodiversity.org/seinet/collections/individual/index.php?occid=" + feature.properties.seiID; 
							popupContent += '<a href="' + url + '"&clid=0" target="_blank">View SEINet Record</a>';
							}

							// 3. Check if seiID exists and is not an empty string
							if (feature.properties.cchID && feature.properties.cchID.trim() !== "") {
							let url = "https://cch2.org/portal/collections/individual/index.php?occid=" + feature.properties.cchID; 
							popupContent += '<a href="' + url + '"&clid=0" target="_blank">View CCH2 Record</a>';
							}
							
							// 4. Bind the complete content to the layer
							layer.bindPopup(popupContent);
						},
					//old code
						//onEachFeature: function (feature, layer) {
				        // layer.bindPopup(feature.properties.DET+"<br /><a href=/consortium/details.php?aid="+feature.properties.accid+">"+feature.properties.accid+"</a><br />"+feature.properties.CO+" County<br />"+feature.properties.LOC);
						//},
						pointToLayer: function (feature, latlng) {
						// Get the icon
							return L.marker(latlng, {
								icon:L.icon({
									iconUrl: 'common/icons/'+feature.properties.Flag_icon+'.png',
									iconSize: [30,30],
									popupAnchor: [1, -25],    // point of the icon which will correspond to popup's location
									iconAnchor: [15, 30]   // point of the icon which will correspond to marker's location
								})
							});
						}
					}).addTo(map);

				}
			}
		}
	  }
  });

//add geojson specimen dot map to map window

  map.on('zoomstart', function() {

		map.eachLayer(function(layer) {
			if (map.hasLayer(geojsonLayerP)) {
				map.removeLayer(geojsonLayerP);
			}
		});
  });


});

//California Counties KMZ file configuration settings

// loading GeoJSON file - files resides in same folder
$.getJSON(cacount ,function(data){
// L.geoJson function is used to parse geojson file and load on to map
  cntybnd = L.geoJson(data, {
	style: function(feature) {
		switch (feature.properties.NAME) {
		case 'San Luis Obispo': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Glenn': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Santa Cruz': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Siskiyou': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'San Mateo': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Plumas': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Lake': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Amador': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Sutter': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Imperial': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Orange': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Stanislaus': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Tulare': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Merced': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Butte': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Nevada': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Alameda': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'San Joaquin': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Santa Clara': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Tehama': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Madera': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Fresno': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Del Norte': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Modoc': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Colusa': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: false
			};
		case 'Kern': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Riverside': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Humboldt': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'San Benito': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Yuba': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Yolo': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'El Dorado': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Alpine': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Contra Costa': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'San Bernardino': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Solano': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Tuolumne': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Mono': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Inyo': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Mendocino': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Trinity': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Monterey': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Shasta': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Napa': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Lassen': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Mariposa': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Marin': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'San Francisco': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Placer': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'San Diego': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Kings': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Calaveras': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Ventura': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Los Angeles': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Sonoma': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Santa Barbara': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Sacramento': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Sierra': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
        }
    }
	}).addTo(COUNTY); 
});


//Jepson Regions shapefile, REGION FILL version for click box, configuration settings

// loading GeoJSON file - files resides in same folder
$.getJSON(regfill ,function(data){
// L.geoJson function is used to parse geojson file and load on to map
  jepsfill = L.geoJson(data, {
	style: function(feature) {
		switch (feature.properties.JEPCODE) {
		case 'Wrn': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#ffa500",
				fillOpacity: 0.7
			};
		case 'MP': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#ecdea0",
				fillOpacity: 0.7
			};
		case 'KR': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#637c36",
				fillOpacity: 0.7
			};
		case 'CaRF': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#c2deac",
				fillOpacity: 0.7
			};
		case 'CaRH': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#618800",
				fillOpacity: 0.7
			};
		case 'NCo': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#006400",
				fillOpacity: 0.7
			};
		case 'NCoRI': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#89cc9f",
				fillOpacity: 0.7
			};
		case 'NCoRO': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#89cca9",
				fillOpacity: 0.7
			};
		case 'NCoRH': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#89cc95",
				fillOpacity: 0.7
			};
		case 'ScV': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#9acd32",
				fillOpacity: 0.7
			};
		case 'SnJV': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#d7ff86",
				fillOpacity: 0.7
			};
		case 'CCo': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#609a83",
				fillOpacity: 0.7
			};
		case 'SCoRO': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#6dd4c3",
				fillOpacity: 0.7
			};
		case 'SCoRI': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#6dd4b9",
				fillOpacity: 0.7
			};
		case 'SCo': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#9b30ff",
				fillOpacity: 0.7
			};
		case 'SnFrB': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#d1feed",
				fillOpacity: 0.7
			};
		case 'Teh': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#b1c5de",
				fillOpacity: 0.7
			};
		case 'nSNF': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#98c0ed",
				fillOpacity: 0.7
			};
		case 'cSNF': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#98c0f7",
				fillOpacity: 0.7
			};
		case 'sSNF': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#98c0ff",
				fillOpacity: 0.7
			};
		case 'nSNH': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#4ebeea",
				fillOpacity: 0.7
			};
		case 'cSNH': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#4ebef4",
				fillOpacity: 0.7
			};
		case 'sSNH': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#4ebefe",
				fillOpacity: 0.7
			};
		case 'SNE': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#e7ee06",
				fillOpacity: 0.7
			};
		case 'W&I': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#c6b247",
				fillOpacity: 0.7
			};
		case 'DMoj': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#fbf0c0",
				fillOpacity: 0.7
			};
		case 'DMtns': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#ff640d",
				fillOpacity: 0.7
			};
		case 'DSon': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#ebd864",
				fillOpacity: 0.7
			};
		case 'PR': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#cf7ba9",
				fillOpacity: 0.7
			};
		case 'SnJt': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#cf7bbd",
				fillOpacity: 0.7
			};
		case 'nChI': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#dda0dd",
				fillOpacity: 0.7
			};
		case 'sChI': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#dda0d3",
				fillOpacity: 0.7
			};
		case 'WTR': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#eccaeb",
				fillOpacity: 0.7
			};
		case 'SnGb': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#eccaf5",
				fillOpacity: 0.7
			};
		case 'SnBr': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#eccaff",
				fillOpacity: 0.7
			};
        }
    }
	}).addTo(FILL);
});


//Jepson Regions shapefile, Boundary Line version (default), configuration settings

// loading GeoJSON file
$.getJSON(bnd ,function(data){
// L.geoJson function is used to parse geojson file and load on to map
  jepsreg = L.geoJson(data, {
	style: function(feature) {
		switch (feature.properties.JEPCODE) {
		case 'Wrn': return {
				color: "#ffa500",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#ffa500",
				fillOpacity: 0.8
			};
		case 'MP': return {
				color: "#ecdea0",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#ecdea0",
				fillOpacity: 0.8
			};
		case 'KR': return {
				color: "#637c36",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#637c36",
				fillOpacity: 0.8
			};
		case 'CaRF': return {
				color: "#c2deac",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#c2deac",
				fillOpacity: 0.8
			};
		case 'CaRH': return {
				color: "#618800",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#618800",
				fillOpacity: 0.8
			};
		case 'NCo': return {
				color: "#006400",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#006400",
				fillOpacity: 0.8
			};
		case 'NCoRI': return {
				color: "#89cc9f",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#89cc9f",
				fillOpacity: 0.8
			};
		case 'NCoRO': return {
				color: "#89cca9",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#89cca9",
				fillOpacity: 0.8
			};
		case 'NCoRH': return {
				color: "#89cc95",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#89cc95",
				fillOpacity: 0.8
			};
		case 'ScV': return {
				color: "#9acd32",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#9acd32",
				fillOpacity: 0.8
			};
		case 'SnJV': return {
				color: "#d7ff86",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#d7ff86",
				fillOpacity: 0.8
			};
		case 'CCo': return {
				color: "#609a83",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#609a83",
				fillOpacity: 0.8
			};
		case 'SCoRO': return {
				color: "#6dd4c3",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#6dd4c3",
				fillOpacity: 0.8
			};
		case 'SCoRI': return {
				color: "#6dd4b9",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#6dd4b9",
				fillOpacity: 0.8
			};
		case 'SCo': return {
				color: "#9b30ff",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#9b30ff",
				fillOpacity: 0.8
			};
		case 'SnFrB': return {
				color: "#d1feed",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#d1feed",
				fillOpacity: 0.8
			};
		case 'Teh': return {
				color: "#b1c5de",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#b1c5de",
				fillOpacity: 0.8
			};
		case 'nSNF': return {
				color: "#98c0ed",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#98c0ed",
				fillOpacity: 0.8
			};
		case 'cSNF': return {
				color: "#98c0f7",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#98c0f7",
				fillOpacity: 0.8
			};
		case 'sSNF': return {
				color: "#98c0ff",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#98c0ff",
				fillOpacity: 0.8
			};
		case 'nSNH': return {
				color: "#4ebeea",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#4ebeea",
				fillOpacity: 0.8
			};
		case 'cSNH': return {
				color: "#4ebef4",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#4ebef4",
				fillOpacity: 0.8
			};
		case 'sSNH': return {
				color: "#4ebefe",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#4ebefe",
				fillOpacity: 0.8
			};
		case 'SNE': return {
				color: "#e7ee06",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#e7ee06",
				fillOpacity: 0.8
			};
		case 'W&I': return {
				color: "#c6b247",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#c6b247",
				fillOpacity: 0.8
			};
		case 'DMoj': return {
				color: "#fbf0c0",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#fbf0c0",
				fillOpacity: 0.8
			};
		case 'DMtns': return {
				color: "#ff640d",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#ff640d",
				fillOpacity: 0.8
			};
		case 'DSon': return {
				color: "#ebd864",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#ebd864",
				fillOpacity: 0.8
			};
		case 'PR': return {
				color: "#cf7ba9",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#cf7ba9",
				fillOpacity: 0.8
			};
		case 'SnJt': return {
				color: "#cf7bbd",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#cf7bbd",
				fillOpacity: 0.8
			};
		case 'nChI': return {
				color: "#dda0dd",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#dda0dd",
				fillOpacity: 0.8
			};
		case 'sChI': return {
				color: "#dda0d3",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#dda0d3",
				fillOpacity: 0.8
			};
		case 'WTR': return {
				color: "#eccaeb",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#eccaeb",
				fillOpacity: 0.8
			};
		case 'SnGb': return {
				color: "#eccaf5",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#eccaf5",
				fillOpacity: 0.8
			};
		case 'SnBr': return {
				color: "#eccaff",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#eccaff",
				fillOpacity: 0.8
			};
        }
    }
  }).addTo(REG);

});


//State Boundary shapefile, configuration settings
//Neither the county or the regions files have a modifiable state border

$.getJSON(CABND ,function(data){
// L.geoJson function is used to parse geojson file and load on to map


//  map.on('load', function() {
	L.geoJson(data, {
		style: function(feature) {
			switch (feature.properties.STATEFP) {
			case 'CA': return {
					color: "#00000f",
					weight: 1,
					opacity: 0.5,
					fill: false
				};
	        }
	    }
	}).addTo(map);
//  });

  map.on('zoom', function() {

   L.geoJson(data, {
		style: function(feature) {
			switch (feature.properties.STATEFP) {
			case 'CA': return {
					color: "#00000f",
					weight: 2,
					opacity: 0.5,
					fill: false
				};
	        }
	    }
	}).addTo(map);
  });


});



	// Adding open source layers, unlimited loads
	var streets = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
		attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
		type: 'streets'
	});


	var satellite = L.tileLayer(
	'https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
		attribution: '&copy; Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community',
		maxNativeZoom: 19,
		maxZoom: 25,
		opacity: 0.8
	}).addTo(map);

	var baseMaps = {
		"Streets": streets,
		"Satellite": satellite
	};
	
	var overlay = {
		"Add Jepson regions": REG,
		"Fill Jepson regions": FILL,
		"Add County Boundaries": COUNTY
	};

//"County boundaries": county
	L.control.layers(baseMaps, overlay).addTo(map);
	//L.control.layers(baseMaps).addTo(map);


  map.on('click', function() {

   L.geoJson(data, {
		style: function(feature) {
			switch (feature.properties.STATEFP) {
			case 'CA': return {
					color: "#00000f",
					weight: 2,
					opacity: 0.5,
					fill: false
				};
	        }
	    }
	}).addTo(map);
  });


</script>
                </div>
            </div>

            <div class="map-legend-text">
                <p class="smallText">Data provided by participants of the <a href="/consortium/about.html">Consortium of California Herbaria</a>.</p>
                <ul class="legend-list smallText">
                    <li><strong>Blue:</strong> Specimen maps to expected Jepson subdivision.</li>
                    <li><strong>Purple:</strong> Garden, greenhouse, or non-wild collection.</li>
                    <li><strong>Yellow:</strong> Flags for range revision or georeferencing issues.</li>
                    <li><a href="/consortium/about_yellow.html">Read more about yellow flags</a></li>
                </ul>

            <div class="export-notice smallText">
                <p>If you would like a custom query export of data from this map, please email <a href="mailto:jason_alexander@berkeley.edu">Jason Alexander</a>.</p>
            </div>


            </div>
          </section>

        <!-- Box 4: Phenology / Heath Bar (Below Specimen Map Text) -->
        <section class="data-section phenology-box">
<?php
//a.k.a. "heath bars"

//The original =hb script made modifications to the stripped ScientificName
//then made them lower case in order to match the values in the hb hash table
//There is no reason that this cannot be done with the taxon ID instead
//then there is no confusion matching by a modified taxon name if
//cch1 hash table has mistakes that do not match names in the eFlora

//the hb2 script takes the flowering/fruiting/spore/cone time as input, e.g. "&FT=3,4,5" for Mar-May. This is pre-loaded in the FLFRTimeCode field

?>

            <h3>Flowering & Fruiting Phenology</h3>
            <p class="smallText">Mapped specimen collections, sorted by month:</p>
            
            <div class="heath-bar-wrapper">
                <img src="/cgi-bin/eflora/hb2?id=<?php echo $TaxonID; ?>&FT=<?php echo $TimeCode; ?>" 
                     alt="Phenology monthly counts for <?php echo $ScientificName; ?>" 
                     class="heath-bar-img">
            </div>


            <ul class="smallText phenology-notes">
                <li>Duplicates counted once; synonyms included.</li>
                <li>Blue line denotes eFlora flowering/fruiting time.</li>
            </ul>

        </section>
	  </section>

	  <section id="section-links" class="data-section">
     <!-- EXTERNAL LINKS & PHENOLOGY -->
		<div class="links-legend-grid">
            <h3>External Resources</h3>
            <ul style="list-style: none; padding: 0;">
<?php

$displayName = htmlspecialchars($ScientificName);

//START LEFT SIDE BLOCK, SECOND ROW, CNPS rare plant link

	#the CNPS conversion in SQL is not working for subtaxa
	$CNPS_name = str_replace(" subsp. ", " ssp. ", $ScientificName);

		if (!empty($CNPS_name)){
			$CNPS_name = str_replace(" ", "+", $CNPS_name);
		}

		if (!empty($RarityStatus)){ 
			echo '<li><a href="https://rareplants.cnps.org/Plants/Details?taxon='.$CNPS_name.'"><b>Listed on CNPS Rare Plant Inventory</b></a></li>';
		}

//START LEFT SIDE BLOCK, FIRST ROW, weediness links

//old CDFA table retired, links are broken, so it is now just a list

	if (!empty($Weediness)){
		if (strstr($Weediness, 'SYMBOL 1') !== false){ 
			echo '<li><a href="https://www.cdfa.ca.gov/plant/IPC/encycloweedia/weedinfo/winfo_table-sciname.html"><b>Noxious Weed listed on the CDFA Weed Pest Ratings table</b></a></li>';
		}
//new CDFA weed ranking sheets, indexed by page number of some sort, not taxon name
//This has to be updated manually and added to a new table in eflora.db 
//so that the CDFA_ID variable can be found; set as null for now
		$CDFA_name = null;
		$CDFA_ID = null;
		$CDFA_url = null;
		$url = null;

		if (!empty($CDFA_ID)){
			if (strstr($Weediness, 'SYMBOL 1') !== false){
				$CDFAurl = "https://blogs.cdfa.ca.gov/Section3162/?p=".$CDFA_ID;
				echo '<li><a href="'.$CDFAurl.'"><b>Weed listed by Cal-IPC</b></a></li>';
			}
		}
		else{
			$CDFA_name = str_replace(" ", "+", $ScientificName);
			$CDFAurl = "https://blogs.cdfa.ca.gov/Section3162/?s=".$CDFA_name;
			echo '<li><a href="'.$CDFAurl.'"><b>View the CDFA Pest Rating page for <i>'.$ScientificName.'</i></b></a></li>';
		}
	
		if (strstr($Weediness, 'SYM') !== false){
			//convert scientific name to IPC name format for new website
			$IPC_name = str_replace(" subsp. ", "-ssp-", $ScientificName); //CalPhotos uses "ssp." and not "subsp."
			$IPC_name = str_replace(" nothosubsp. ", "-ssp-", $IPC_name);
			$hb_name = str_replace(" var. ", "-var-", $IPC_name);
			// convert the string to all lowercase
			$IPC_name = strtolower($IPC_name);
			//replace all other spaces in name with -
			$IPC_search_name = str_replace(" ", "-", $IPC_name);
		//fix some irregular formats in the calIPC website 
				$IPC_search_name = str_replace("lythrum-hyssopifolia", "lythrum-hyssopifolium", $IPC_search_name);
				$IPC_search_name = str_replace("ludwigia-peploides-ssp-montevidensis", "ludwigia-peploides", $IPC_search_name);
				$IPC_search_name = str_replace("ludwigia-peploides-ssp-peploides", "ludwigia-peploides", $IPC_search_name);
				$IPC_search_name = str_replace("phytolacca-americana-var.-americana", "phytolacca-americana", $IPC_search_name);
				$IPC_search_name = str_replace("phytolacca-americana-var-americana", "phytolacca-americana", $IPC_search_name);
				$IPC_search_name = str_replace("tetragonia-tetragonoides", "tetragonia-tetragonioides", $IPC_search_name);

			$url = 'https://www.cal-ipc.org//plants/profile/'.$IPC_search_name.'-profile/';
			echo '<li><a href="'.$url.'"><b>Weed listed by Cal-IPC</b></a></li>';
		}
	}
	else{
		$IPC_name = null;
		$url = null;
		$IPC_search_name = null;
		$CDFAurl = null;
		$hb_name = null;
		$Weediness = null;
	}
//END LEFT SIDE BLOCK, FIRST ROW, weediness links

//START LEFT SIDE BLOCK, FIRST ROW, Tropicos name links
// The Regex below is required by several links below the tropicos one
//Keep this even thouigh tropicos is blocking external search attempts
	$tropicos_name = preg_replace('/^([A-Z][a-z-]+) ([a-z-]+).*/', '$1%20$2', $displayName);
//END LEFT SIDE BLOCK, FIRST ROW, Tropicos name links

//START LEFT SIDE BLOCK, FIRST ROW, Calflora name links


	#Make the CalPhotos Name
	$CF_name = str_replace(' ', '+', $displayName);
	$CF_name = str_replace('subsp.', 'ssp.', $CF_name);


	echo '<li><a href="https://www.calflora.org/cgi-bin/species_query.cgi?where-taxon=';
	echo $CF_name;
	echo '">Calflora Taxon report</a></li>';


//END LEFT SIDE BLOCK, FIRST ROW, Calflora name links

//START LEFT SIDE BLOCK, FIRST ROW, calscape name links

	echo '<li><a href="https://calscape.org/search/?plant=';
	echo $tropicos_name;
	echo '">Calscape profile page</a></li>';


//END LEFT SIDE BLOCK, FIRST ROW, calscape name links


//START LEFT SIDE BLOCK, FIRST ROW, plantID.net name links

	echo '<li><a href="https://plantid.net/Gallery.aspx?Taxon=';
	echo $tropicos_name;
	echo '">PlantID.net profile page</a></li>';


//END LEFT SIDE BLOCK, FIRST ROW, Tropicos name links



//START LEFT SIDE BLOCK, FIRST ROW, Painter Common name links

	echo '<li>Elizabeth Painter&prime;s ';
	echo '<a href="/cgi-bin/eflora/get_painter_common?';
	echo $TaxonID;
	echo' ">common name index</a></li>';


//END LEFT SIDE BLOCK, FIRST ROW, Painter Common name links
?>
            </ul>

	    </div>
	  </section>


    </div>
</div>

</main>

    <!-- SEPARATOR BAR HERE -->
    <hr class="footer-separator">

<!-- Bottom Jump Bar -->
<nav class="eflora-jump-bar" aria-label="Taxon Section Jump Links - Bottom">
    <span class="jump-label">Jump to:</span>
    <ul class="jump-links">
        <li><a href="#section-description">Description</a></li>
        <li><a href="#section-images">Images</a></li>
        <li><a href="#section-distribution">Distribution</a></li>
        <li><a href="#section-specimens">Specimens</a></li>
    </ul>
</nav>


    <!-- Feedback CTA -->
    <section class="feedback-section center-text">
        <a class="googleForm" href="https://docs.google.com/forms/d/e/1FAIpQLSc_wrQXqB9gNPrOgUTZ9WN38Ub08JlmgaIha7Ua99sHGzMntA/viewform">
            Send us your feedback! Community input helps improve the Jepson eFlora.
        </a>
    </section>



<!-- Footer -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/eflora-footer.php'); ?>

</body>
</html>

<?php
}//close the else section that forces the maps to not display in genus and family pages
?>
<!--Removed Nested Tables: All sections are now wrapped in div, section, or article tags with a logical vertical flow.-->
<!--AAA Typography: The base font is handled by your jepson-main.css, and the hero header uses a massive 2.8rem size for the scientific name.-->
<!--Reflow (Mobile): On small screens, the Illustration moves below the Description, and the Specimen Map moves below the Static Map.-->
<!--Touch Targets: The jQuery toggles for higher taxonomy are now <button> elements with a minimum height and padding, making them easier to tap than the previous tiny blue links.-->
<!--Interactive Map: The Leaflet map (#map_canvas) is now width-responsive (100%), ensuring it doesn't break the page container on small devices.-->
<!--Accessibility (Images): All generated images now include meaningful alt text incorporating the PHP $ScientificName variable.-->
<!--Mobile Performance: Interactive Leaflet maps can be heavy to load and difficult to navigate with a thumb on small screens (often causing the user to get "stuck" in the map while trying to scroll down). Hiding it on mobile improves page speed and prevents scrolling issues.-->
<!--CalPhotos Column: On desktop, having 4-5 images per row makes the best use of the wide screen. On mobile, the vertical column (flex-direction: column) allows the user to see larger, clearer images of the plant without the text becoming squished or unreadable.-->
<!--WCAG AAA: By setting a max-width: 300px for the mobile image column, we ensure that the images don't stretch into pixelated versions, maintaining high visual quality.-->

<!--Logical Column Flow: On PC, Subdivisions and External Links stay grouped on the left. The Interactive Map and the Phenology (Heath Bar) stay grouped on the right.-->
<!--Sequential Right Column: The right side now flows: Map -> Legend Text -> Heath Bar -> Export Notice.-->
<!--Phenology Position: The Flowering/Fruiting map is now its own distinct section within the right column, placed exactly below the map legend as requested.-->
<!--Accessibility (AAA): Used !important on the footer CSS to override any lingering white-text rules, ensuring 100% compliance for black text on light backgrounds.-->
<!--Touch Targets: Links in the External Resources box are spaced out with gap: 12px to ensure they are easy to tap on mobile.-->

<!--Semantic Cleanup: By using if ($hasMedia), we prevent an empty <aside> tag from rendering at all. This is better for SEO and screen readers.-->
<!--CSS Grid Control: By default, a grid with grid-template-columns: 1fr will expand to fill all available horizontal space. On desktop, we only apply the 1.6fr 1fr split if the has-media-grid class is present.-->
<!--Future-Proof: If you ever add a new media type (like a 3D model or audio clip), you just add it to the $hasMedia check at the top, and the layout will automatically handle the columns correctly.-->
<!--Mobile-First: On mobile devices, both versions will look identical (stacked), which is the most accessible way to display content on small screens.-->

<!--HEATH BAR-->
<!--Padding Adjustment: On a desktop, 20px of padding looks nice. On a narrow phone, 20px on each side steals 40px of total width from the image. By dropping padding to 8px on mobile, the chart itself becomes significantly larger and easier to read.-->
<!--Width vs. Max-Width: Using width: 100% ensures that if the container grows (like when columns stack on mobile), the image grows with it immediately.-->
<!--Crisp Rendering: Phenology charts are often "line art" with small text (J, F, M, A...). The image-rendering properties prevent the browser from "blurring" the image when it scales it up, keeping the text readable for users with low vision.-->
<!--No Fixed Heights: By using height: auto, the image will never look squashed or distorted regardless of the device's aspect ratio.-->

<!--return to home link-->
<!--WCAG AAA Touch Targets: By wrapping the link in a div or using the button class, we ensure there is enough "hit area" for mobile users to tap without clicking something else.-->
<!--Breadcrumb Style: Adding the arrow (&larr;) in Option 1 helps users with cognitive disabilities understand that this link takes them "back" or "up" a level.-->
<!--Color Standards: Because you are using standard <a> tags or the .googleForm class, the colors will automatically use the AAA-compliant blue (#0058a3 or #003262) defined in your CSS.-->
<!--Centered: Using the .center-text class ensures it aligns with your 70% width search boxes and timeline image.-->


<!--Alphabetical index bar-->
<!--Large Targets: Every link is now a minimum of 44x44 pixels. It is impossible to miss, even with a thumb or a shaky cursor.-->
<!--No Pipes: By removing the | and using a list (<ul>), screen readers will say "List with 26 items" and then allow the user to jump letter by letter.-->
<!--Perfect Wrapping: Flexbox handles the layout. On a phone, it might show 6 letters per row; on a tablet 10; on a desktop all 26. It will never look broken.-->
<!--Visual Clarity: The light grey background makes it clear that these are interactive "zones," not just plain text.-->
<!--AAA Compliance: The colors meet the high contrast ratio, and the focus state (#FDB515 gold ring) is highly visible for keyboard-only users.-->