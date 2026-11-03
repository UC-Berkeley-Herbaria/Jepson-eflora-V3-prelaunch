<?php
date_default_timezone_set('America/Los_Angeles');

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


require '../../ucjeps_data/ucjeps_data/config/config_eflora.php';
//require 'config/config.php';
$db = new SQLite3($database_location);


  if(isset($_GET['tid'])){

	#$results = $db->query("SELECT ID, TaxonID, ScientificName, TaxonAuthor, FormattedDisplayName, CommonName, Status, TJM2Author, ScientificEditor, Habit, PlantBody, Stem, SterileStem, FertileStem, Leaf, Spines, Inflorescence, StaminateHead, RayOrPistillateFlower, PistillateHead, StaminateInflorescence, PistillateOrBisexualInflorescence, PistillateInflorescence, Spikelet, FertileSpikelet, SterileSpikelet, DistalSpikelet, CentralSpikelet, LateralSpikelet, StaminateSpikelet, PistillateSpikelet, Flower, StaminateFlower, PistillateFlower, RayFlower, DiskFlower, Cone, PollenCone, SeedCone, BisexualFlower, Fruit, Seed, Sporangia, SporangiumCase, MaleSporangiumCase, FemaleSporangiumCase, Spores, Chromosomes, Ecology, RarityStatus, Elevation, BioregionalDistribution, OutsideCA, SpeciesInGenus, GeneraInFamily, Etymology, Toxicity, Synonyms, UnabridgedSynonyms, Reference, UnabridgedReference, Note, UnabridgedNote, FloweringTime, FloweringTimeCode, FruitingTime, Weediness, IsTerminalTaxon, HasKey, RevisionNumber, RevisionDate, DistCode 
	$results = $db->query("SELECT * FROM eflora_taxa WHERE TaxonID=".$TaxonID." "); //16711 is the TaxonID for Calochortus amabilis, for example


	while ($row = $results->fetchArray()) {

		if (isset($row['ID'])){
			$ID = $row['ID'];
		}
		else{
			$ID = null;
		}

		if (isset($row['ScientificName'])){
			$ScientificName = $row['ScientificName'];
		}
		else{
			$ScientificName = null;
		}

		if (isset($row['TaxonAuthor'])){
			$TaxonAuthor = $row['TaxonAuthor'];
		}
		else{
			$TaxonAuthor = null;
		}

		if (isset($row['FormattedDisplayName'])){
			$FormattedDisplayName = $row['FormattedDisplayName'];
		}
		else{
			$FormattedDisplayName = null;
		}

		if (isset($row['CommonName'])){
			$CommonName = $row['CommonName'];
		}
		else{
			$CommonName = null;
		}

		if (isset($row['Status'])){
			$efloraStatus = $row['Status'];
		}
		else{
			$efloraStatus = null;
		}

		if (isset($row['TJM2Author'])){
			$TJM2Author = $row['TJM2Author'];
		}
		else{
			$TJM2Author = null;
		}

		if (isset($row['ScientificEditor'])){
			$ScientificEditor = $row['ScientificEditor'];
		}
		else{
			$ScientificEditor = null;
		}

		if (isset($row['Habit'])){
			$Habit = $row['Habit'];
		}
		else{
			$Habit = null;
		}

		if (isset($row['PlantBody'])){
			$PlantBody = $row['PlantBody'];
		}
		else{
			$PlantBody = null;
		}

		if (isset($row['Stem'])){
			$Stem = $row['Stem'];
		}
		else{
			$Stem = null;
		}

		if (isset($row['SterileStem'])){
			$SterileStem = $row['SterileStem'];
		}
		else{
			$SterileStem = null;
		}

		if (isset($row['FertileStem'])){
			$FertileStem = $row['FertileStem'];
		}
		else{
			$FertileStem = null;
		}

		if (isset($row['Leaf'])){
			$Leaf = $row['Leaf'];
		}
		else{
			$Leaf = null;
		}

		if (isset($row['Spines'])){
			$Spines = $row['Spines'];
		}
		else{
			$Spines = null;
		}

		if (isset($row['Inflorescence'])){
			$Inflorescence = $row['Inflorescence'];
		}
		else{
			$Inflorescence = null;
		}

		if (isset($row['StaminateHead'])){
			$StaminateHead = $row['StaminateHead'];
		}
		else{
			$StaminateHead = null;
		}

		if (isset($row['RayOrPistillateFlower'])){
			$RayOrPistillateFlower = $row['RayOrPistillateFlower'];
		}
		else{
			$RayOrPistillateFlower = null;
		}

		if (isset($row['PistillateHead'])){
			$PistillateHead = $row['PistillateHead'];
		}
		else{
			$PistillateHead = null;
		}

		if (isset($row['StaminateInflorescence'])){
			$StaminateInflorescence = $row['StaminateInflorescence'];
		}
		else{
			$StaminateInflorescence = null;
		}

		if (isset($row['PistillateOrBisexualInflorescence'])){
			$PistillateOrBisexualInflorescence = $row['PistillateOrBisexualInflorescence'];
		}
		else{
			$PistillateOrBisexualInflorescence = null;
		}

		if (isset($row['PistillateInflorescence'])){
			$PistillateInflorescence = $row['PistillateInflorescence'];
		}
		else{
			$PistillateInflorescence = null;
		}

		if (isset($row['Spikelet'])){
			$Spikelet = $row['Spikelet'];
		}
		else{
			$Spikelet = null;
		}

		if (isset($row['FertileSpikelet'])){
			$FertileSpikelet = $row['FertileSpikelet'];
		}
		else{
			$FertileSpikelet = null;
		}

		if (isset($row['SterileSpikelet'])){
			$SterileSpikelet = $row['SterileSpikelet'];
		}
		else{
			$SterileSpikelet = null;
		}

		if (isset($row['DistalSpikelet'])){
			$DistalSpikelet = $row['DistalSpikelet'];
		}
		else{
			$DistalSpikelet = null;
		}

		if (isset($row['CentralSpikelet'])){
			$CentralSpikelet = $row['CentralSpikelet'];
		}
		else{
			$CentralSpikelet = null;
		}

		if (isset($row['LateralSpikelet'])){
			$LateralSpikelet = $row['LateralSpikelet'];
		}
		else{
			$LateralSpikelet = null;
		}

		if (isset($row['StaminateSpikelet'])){
			$StaminateSpikelet = $row['StaminateSpikelet'];
		}
		else{
			$StaminateSpikelet = null;
		}

		if (isset($row['PistillateSpikelet'])){
			$PistillateSpikelet = $row['PistillateSpikelet'];
		}
		else{
			$PistillateSpikelet = null;
		}

		$Flower = $row['Flower'] ?? '';
		$Flower = trim($Flower);

		if (isset($row['StaminateFlower'])){
			$StaminateFlower = $row['StaminateFlower'];
		}
		else{
			$StaminateFlower = null;
		}

		if (isset($row['PistillateFlower'])){
			$PistillateFlower = $row['PistillateFlower'];
		}
		else{
			$PistillateFlower = null;
		}

		if (isset($row['RayFlower'])){
			$RayFlower = $row['RayFlower'];
		}
		else{
			$RayFlower = null;
		}

		if (isset($row['DiskFlower'])){
			$DiskFlower = $row['DiskFlower'];
		}
		else{
			$DiskFlower = null;
		}

		if (isset($row['Cone'])){
			$Cone = $row['Cone'];
		}
		else{
			$Cone = null;
		}

		if (isset($row['PollenCone'])){
			$PollenCone = $row['PollenCone'];
		}
		else{
			$PollenCone = null;
		}

		if (isset($row['SeedCone'])){
			$SeedCone = $row['SeedCone'];
		}
		else{
			$SeedCone = null;
		}

		if (isset($row['BisexualFlower'])){
			$BisexualFlower = $row['BisexualFlower'];
		}
		else{
			$BisexualFlower = null;
		}

		if (isset($row['Fruit'])){
			$Fruit = $row['Fruit'];
		}
		else{
			$Fruit = null;
		}

		if (isset($row['Seed'])){
			$Seed = $row['Seed'];
		}
		else{
			$Seed = null;
		}

		if (isset($row['Sporangia'])){
			$Sporangia = $row['Sporangia'];
		}
		else{
			$Sporangia = null;
		}

		if (isset($row['SporangiumCase'])){
			$SporangiumCase = $row['SporangiumCase'];
		}
		else{
			$SporangiumCase = null;
		}

		if (isset($row['MaleSporangiumCase'])){
			$MaleSporangiumCase = $row['MaleSporangiumCase'];
		}
		else{
			$MaleSporangiumCase = null;
		}

		if (isset($row['FemaleSporangiumCase'])){
			$FemaleSporangiumCase = $row['FemaleSporangiumCase'];
		}
		else{
			$FemaleSporangiumCase = null;
		}

		if (isset($row['Spores'])){
			$Spores = $row['Spores'];
		}
		else{
			$Spores = null;
		}

		if (isset($row['Chromosomes'])){
			$Chromosomes = $row['Chromosomes'];
		}
		else{
			$Chromosomes = null;
		}

		if (isset($row['RarityStatus'])){
			$RarityStatus = $row['RarityStatus'];
		}
		else{
			$RarityStatus = null;
		}

		if (isset($row['Ecology'])){
			$Ecology = $row['Ecology'];
		}
		else{
			$Ecology = null;
		}

		if (isset($row['Elevation'])){
			$Elevation = $row['Elevation'];
		}
		else{
			$Elevation = null;
		}

		if (isset($row['BioregionalDistribution'])){
			$BioregionalDistribution = $row['BioregionalDistribution'];
		}
		else{
			$BioregionalDistribution = null;
		}

		if (isset($row['OutsideCA'])){
			$OutsideCA = $row['OutsideCA'];
		}
		else{
			$OutsideCA = null;
		}

		if (isset($row['SpeciesInGenus'])){
			$SpeciesInGenus = $row['SpeciesInGenus'];
		}
		else{
			$SpeciesInGenus = null;
		}

		if (isset($row['GeneraInFamily'])){
			$GeneraInFamily = $row['GeneraInFamily'];
		}
		else{
			$GeneraInFamily = null;
		}

		if (isset($row['Etymology'])){
			$Etymology = $row['Etymology'];
		}
		else{
			$Etymology = null;
		}

		if (isset($row['Toxicity'])){
			$Toxicity = $row['Toxicity'];
		}
		else{
			$Toxicity = null;
		}

		if (isset($row['Synonyms'])){
			$Synonyms = $row['Synonyms'];
		}
		else{
			$Synonyms = null;
		}

		if (isset($row['UnabridgedSynonyms'])){
			$UnabridgedSynonyms = $row['UnabridgedSynonyms'];
		}
		else{
			$UnabridgedSynonyms = null;
		}

		if (isset($row['Reference'])){
			$Reference = $row['Reference'];
		}
		else{
			$Reference = null;
		}

		if (isset($row['UnabridgedReference'])){
			$UnabridgedReference = $row['UnabridgedReference'];
		}
		else{
			$UnabridgedReference = null;
		}

		if (isset($row['Note'])){
			$Note = $row['Note'];
		}
		else{
			$Note = null;
		}

		if (isset($row['UnabridgedNote'])){
			$UnabridgedNote = $row['UnabridgedNote'];
		}
		else{
			$UnabridgedNote = null;
		}

		if (isset($row['FloweringTime'])){
			$FloweringTime = $row['FloweringTime'];
		}
		else{
			$FloweringTime = null;
		}

		if (isset($row['FloweringTimeCode'])){
			$TimeCode = $row['FloweringTimeCode'];
		}
		else{
			$TimeCode = null;
		}

		if (isset($row['FruitingTime'])){
			$FruitingTime = $row['FruitingTime'];
		}
		else{
			$FruitingTime = null;
		}

//$ConingTime = $row['ConingTime']; 
//Remove this as there is no lines with this information
//It has never been successfully printing online and it would be a duplicate of the data in the notes anyway

		if (isset($row['Weediness'])){
			$Weediness = $row['Weediness'];
		}
		else{
			$Weediness = null;
		}

		if (isset($row['IsTerminalTaxon'])){
			$IsTerminalTaxon  = $row['IsTerminalTaxon'];
		}
		else{
			$IsTerminalTaxon = null;
		}

		if (isset($row['RevisionNumber'])){
			$RevisionNumber  = $row['RevisionNumber'];
		}
		else{
			$RevisionNumber = null;
		}

		if (isset($row['RevisionDate'])){
			$RevisionDate  = $row['RevisionDate'];
		}
		else{
			$RevisionDate = null;
		}

		if (isset($row['DistCode'])){
			$DistCode = $row['DistCode'];
		}
		else{
			$DistCode = null;
		}

		if (isset($row['HasKey'])){
			$HasKey = $row['HasKey'];
		}
		else{
			$HasKey = null;
		}

		if (isset($row['TaxonID'])){
			$TID = $row['TaxonID'];
		}
		else{
			$TID = null;
		}

//var_dump($row); 
/*var_dump prints the whole row in a databased format
which is useful for seeing what you're getting
but is pretty ugly
*/
	}

//Before doing anything, if the TID isn't recognized, give a plain error screen
//Security mod to prevent cross-site scripting attacks
	if (!isset($TID)){ //if TaxonID (pulled from URL) did not match a line in the database...
		//echo "Taxon not recognized TID=".$TaxonID;
		header("Location: search_icpn.php?tid=".$TaxonID, true, 301);
		exit();
	}
  }
  elseif (isset($_GET['name'])){

	#$results = $db->query("SELECT ID, TaxonID, ScientificName, TaxonAuthor, FormattedDisplayName, CommonName, Status, TJM2Author, ScientificEditor, Habit, PlantBody, Stem, SterileStem, FertileStem, Leaf, Spines, Inflorescence, StaminateHead, RayOrPistillateFlower, PistillateHead, StaminateInflorescence, PistillateOrBisexualInflorescence, PistillateInflorescence, Spikelet, FertileSpikelet, SterileSpikelet, DistalSpikelet, CentralSpikelet, LateralSpikelet, StaminateSpikelet, PistillateSpikelet, Flower, StaminateFlower, PistillateFlower, RayFlower, DiskFlower, Cone, PollenCone, SeedCone, BisexualFlower, Fruit, Seed, Sporangia, SporangiumCase, MaleSporangiumCase, FemaleSporangiumCase, Spores, Chromosomes, Ecology, RarityStatus, Elevation, BioregionalDistribution, OutsideCA, SpeciesInGenus, GeneraInFamily, Etymology, Toxicity, Synonyms, UnabridgedSynonyms, Reference, UnabridgedReference, Note, UnabridgedNote, FloweringTime, FloweringTimeCode, FruitingTime, Weediness, IsTerminalTaxon, HasKey, RevisionNumber, RevisionDate, DistCode 
	$results = $db->query("SELECT * FROM eflora_taxa 
						WHERE ScientificName LIKE '".$TaxonName."' "); //16711 is the TaxonID for Calochortus amabilis, for example

	while ($row = $results->fetchArray()) {

		if (isset($row['ID'])){
			$ID = $row['ID'];
		}
		else{
			$ID = null;
		}

		if (isset($row['ScientificName'])){
			$ScientificName = $row['ScientificName'];
		}
		else{
			$ScientificName = null;
		}

		if (isset($row['TaxonAuthor'])){
			$TaxonAuthor = $row['TaxonAuthor'];
		}
		else{
			$TaxonAuthor = null;
		}

		if (isset($row['FormattedDisplayName'])){
			$FormattedDisplayName = $row['FormattedDisplayName'];
		}
		else{
			$FormattedDisplayName = null;
		}

		if (isset($row['CommonName'])){
			$CommonName = $row['CommonName'];
		}
		else{
			$CommonName = null;
		}

		if (isset($row['Status'])){
			$efloraStatus = $row['Status'];
		}
		else{
			$efloraStatus = null;
		}

		if (isset($row['TJM2Author'])){
			$TJM2Author = $row['TJM2Author'];
		}
		else{
			$TJM2Author = null;
		}

		if (isset($row['ScientificEditor'])){
			$ScientificEditor = $row['ScientificEditor'];
		}
		else{
			$ScientificEditor = null;
		}

		if (isset($row['Habit'])){
			$Habit = $row['Habit'];
		}
		else{
			$Habit = null;
		}

		if (isset($row['PlantBody'])){
			$PlantBody = $row['PlantBody'];
		}
		else{
			$PlantBody = null;
		}

		if (isset($row['Stem'])){
			$Stem = $row['Stem'];
		}
		else{
			$Stem = null;
		}

		if (isset($row['SterileStem'])){
			$SterileStem = $row['SterileStem'];
		}
		else{
			$SterileStem = null;
		}

		if (isset($row['FertileStem'])){
			$FertileStem = $row['FertileStem'];
		}
		else{
			$FertileStem = null;
		}

		if (isset($row['Leaf'])){
			$Leaf = $row['Leaf'];
		}
		else{
			$Leaf = null;
		}

		if (isset($row['Spines'])){
			$Spines = $row['Spines'];
		}
		else{
			$Spines = null;
		}

		if (isset($row['Inflorescence'])){
			$Inflorescence = $row['Inflorescence'];
		}
		else{
			$Inflorescence = null;
		}

		if (isset($row['StaminateHead'])){
			$StaminateHead = $row['StaminateHead'];
		}
		else{
			$StaminateHead = null;
		}

		if (isset($row['RayOrPistillateFlower'])){
			$RayOrPistillateFlower = $row['RayOrPistillateFlower'];
		}
		else{
			$RayOrPistillateFlower = null;
		}

		if (isset($row['PistillateHead'])){
			$PistillateHead = $row['PistillateHead'];
		}
		else{
			$PistillateHead = null;
		}

		if (isset($row['StaminateInflorescence'])){
			$StaminateInflorescence = $row['StaminateInflorescence'];
		}
		else{
			$StaminateInflorescence = null;
		}

		if (isset($row['PistillateOrBisexualInflorescence'])){
			$PistillateOrBisexualInflorescence = $row['PistillateOrBisexualInflorescence'];
		}
		else{
			$PistillateOrBisexualInflorescence = null;
		}

		if (isset($row['PistillateInflorescence'])){
			$PistillateInflorescence = $row['PistillateInflorescence'];
		}
		else{
			$PistillateInflorescence = null;
		}

		if (isset($row['Spikelet'])){
			$Spikelet = $row['Spikelet'];
		}
		else{
			$Spikelet = null;
		}

		if (isset($row['FertileSpikelet'])){
			$FertileSpikelet = $row['FertileSpikelet'];
		}
		else{
			$FertileSpikelet = null;
		}

		if (isset($row['SterileSpikelet'])){
			$SterileSpikelet = $row['SterileSpikelet'];
		}
		else{
			$SterileSpikelet = null;
		}

		if (isset($row['DistalSpikelet'])){
			$DistalSpikelet = $row['DistalSpikelet'];
		}
		else{
			$DistalSpikelet = null;
		}

		if (isset($row['CentralSpikelet'])){
			$CentralSpikelet = $row['CentralSpikelet'];
		}
		else{
			$CentralSpikelet = null;
		}

		if (isset($row['LateralSpikelet'])){
			$LateralSpikelet = $row['LateralSpikelet'];
		}
		else{
			$LateralSpikelet = null;
		}

		if (isset($row['StaminateSpikelet'])){
			$StaminateSpikelet = $row['StaminateSpikelet'];
		}
		else{
			$StaminateSpikelet = null;
		}

		if (isset($row['PistillateSpikelet'])){
			$PistillateSpikelet = $row['PistillateSpikelet'];
		}
		else{
			$PistillateSpikelet = null;
		}

		$Flower = $row['Flower'] ?? '';
		$Flower = trim($Flower);

		if (isset($row['StaminateFlower'])){
			$StaminateFlower = $row['StaminateFlower'];
		}
		else{
			$StaminateFlower = null;
		}

		if (isset($row['PistillateFlower'])){
			$PistillateFlower = $row['PistillateFlower'];
		}
		else{
			$PistillateFlower = null;
		}

		if (isset($row['RayFlower'])){
			$RayFlower = $row['RayFlower'];
		}
		else{
			$RayFlower = null;
		}

		if (isset($row['DiskFlower'])){
			$DiskFlower = $row['DiskFlower'];
		}
		else{
			$DiskFlower = null;
		}

		if (isset($row['Cone'])){
			$Cone = $row['Cone'];
		}
		else{
			$Cone = null;
		}

		if (isset($row['PollenCone'])){
			$PollenCone = $row['PollenCone'];
		}
		else{
			$PollenCone = null;
		}

		if (isset($row['SeedCone'])){
			$SeedCone = $row['SeedCone'];
		}
		else{
			$SeedCone = null;
		}

		if (isset($row['BisexualFlower'])){
			$BisexualFlower = $row['BisexualFlower'];
		}
		else{
			$BisexualFlower = null;
		}

		if (isset($row['Fruit'])){
			$Fruit = $row['Fruit'];
		}
		else{
			$Fruit = null;
		}

		if (isset($row['Seed'])){
			$Seed = $row['Seed'];
		}
		else{
			$Seed = null;
		}

		if (isset($row['Sporangia'])){
			$Sporangia = $row['Sporangia'];
		}
		else{
			$Sporangia = null;
		}

		if (isset($row['SporangiumCase'])){
			$SporangiumCase = $row['SporangiumCase'];
		}
		else{
			$SporangiumCase = null;
		}

		if (isset($row['MaleSporangiumCase'])){
			$MaleSporangiumCase = $row['MaleSporangiumCase'];
		}
		else{
			$MaleSporangiumCase = null;
		}

		if (isset($row['FemaleSporangiumCase'])){
			$FemaleSporangiumCase = $row['FemaleSporangiumCase'];
		}
		else{
			$FemaleSporangiumCase = null;
		}

		if (isset($row['Spores'])){
			$Spores = $row['Spores'];
		}
		else{
			$Spores = null;
		}

		if (isset($row['Chromosomes'])){
			$Chromosomes = $row['Chromosomes'];
		}
		else{
			$Chromosomes = null;
		}

		if (isset($row['RarityStatus'])){
			$RarityStatus = $row['RarityStatus'];
		}
		else{
			$RarityStatus = null;
		}

		if (isset($row['Ecology'])){
			$Ecology = $row['Ecology'];
		}
		else{
			$Ecology = null;
		}

		if (isset($row['Elevation'])){
			$Elevation = $row['Elevation'];
		}
		else{
			$Elevation = null;
		}

		if (isset($row['BioregionalDistribution'])){
			$BioregionalDistribution = $row['BioregionalDistribution'];
		}
		else{
			$BioregionalDistribution = null;
		}

		if (isset($row['OutsideCA'])){
			$OutsideCA = $row['OutsideCA'];
		}
		else{
			$OutsideCA = null;
		}

		if (isset($row['SpeciesInGenus'])){
			$SpeciesInGenus = $row['SpeciesInGenus'];
		}
		else{
			$SpeciesInGenus = null;
		}

		if (isset($row['GeneraInFamily'])){
			$GeneraInFamily = $row['GeneraInFamily'];
		}
		else{
			$GeneraInFamily = null;
		}

		if (isset($row['Etymology'])){
			$Etymology = $row['Etymology'];
		}
		else{
			$Etymology = null;
		}

		if (isset($row['Toxicity'])){
			$Toxicity = $row['Toxicity'];
		}
		else{
			$Toxicity = null;
		}

		if (isset($row['Synonyms'])){
			$Synonyms = $row['Synonyms'];
		}
		else{
			$Synonyms = null;
		}

		if (isset($row['UnabridgedSynonyms'])){
			$UnabridgedSynonyms = $row['UnabridgedSynonyms'];
		}
		else{
			$UnabridgedSynonyms = null;
		}

		if (isset($row['Reference'])){
			$Reference = $row['Reference'];
		}
		else{
			$Reference = null;
		}

		if (isset($row['UnabridgedReference'])){
			$UnabridgedReference = $row['UnabridgedReference'];
		}
		else{
			$UnabridgedReference = null;
		}

		if (isset($row['Note'])){
			$Note = $row['Note'];
		}
		else{
			$Note = null;
		}

		if (isset($row['UnabridgedNote'])){
			$UnabridgedNote = $row['UnabridgedNote'];
		}
		else{
			$UnabridgedNote = null;
		}

		if (isset($row['FloweringTime'])){
			$FloweringTime = $row['FloweringTime'];
		}
		else{
			$FloweringTime = null;
		}

		if (isset($row['FloweringTimeCode'])){
			$TimeCode = $row['FloweringTimeCode'];
		}
		else{
			$TimeCode = null;
		}

		if (isset($row['FruitingTime'])){
			$FruitingTime = $row['FruitingTime'];
		}
		else{
			$FruitingTime = null;
		}

//$ConingTime = $row['ConingTime']; 
//Remove this as there is no lines with this information
//It has never been successfully printing online and it would be a duplicate of the data in the notes anyway

		if (isset($row['Weediness'])){
			$Weediness = $row['Weediness'];
		}
		else{
			$Weediness = null;
		}

		if (isset($row['IsTerminalTaxon'])){
			$IsTerminalTaxon  = $row['IsTerminalTaxon'];
		}
		else{
			$IsTerminalTaxon = null;
		}

		if (isset($row['RevisionNumber'])){
			$RevisionNumber  = $row['RevisionNumber'];
		}
		else{
			$RevisionNumber = null;
		}

		if (isset($row['RevisionDate'])){
			$RevisionDate  = $row['RevisionDate'];
		}
		else{
			$RevisionDate = null;
		}

		if (isset($row['DistCode'])){
			$DistCode = $row['DistCode'];
		}
		else{
			$DistCode = null;
		}

		if (isset($row['HasKey'])){
			$HasKey = $row['HasKey'];
		}
		else{
			$HasKey = null;
		}

		if (isset($row['TaxonID'])){
			$TID = $row['TaxonID'];
		}
		else{
			$TID = null;
		}

 if ( (isset($TaxonName)) && (is_null($row['TaxonID'])) && (is_null($row['Inflorescence'])) && (is_null($row['Spines'])) && (is_null($row['Leaf'])) && (is_null($row['FertileStem'])) && (is_null($row['SterileStem'])) && (is_null($row['Stem'])) && (is_null($row['PlantBody'])) && (is_null($row['Habit'])) && (is_null($row['ScientificEditor'])) && (is_null($row['TJM2Author'])) && (is_null($row['CommonName'])) && (is_null($row['FormattedDisplayName'])) && (is_null($row['TaxonAuthor'])) ){

// if ( (isset($TaxonName)) && (!isset($row['TaxonID'])) && (!isset($row['Inflorescence'])) && (!isset($row['Spines'])) && (!isset($row['Leaf'])) && (!isset($row['FertileStem'])) && (!isset($row['SterileStem'])) && (!isset($row['Stem'])) && (!isset($row['PlantBody'])) && (!isset($row['Habit'])) && (!isset($row['ScientificEditor'])) && (!isset($row['TJM2Author'])) && (!isset($row['CommonName'])) && (!isset($row['FormattedDisplayName'])) && (!isset($row['TaxonAuthor'])) && (!isset($row['ScientificName']))  ){
		//var_dump($row); 
		header("Location: search_icpn.php?name=".$TaxonName, true, 301);
		exit();
 }
//var_dump($row); 
/*var_dump prints the whole row in a databased format
which is useful for seeing what you're getting
but is pretty ugly
*/
	}


//Before doing anything, if the TID isn't recognized, give a plain error screen
//Security mod to prevent cross-site scripting attacks
	if (!isset($ScientificName)){
		//echo "Taxon not recognized NAME=".$TaxonName;
		header("Location: search_icpn.php?name=".$TaxonName, true, 301);
		exit();
	}

  }

 if ( (empty($ID)) && (!empty($TaxonName)) ){
		//echo "Taxon not recognized NAME=".$TaxonName;
		header("Location: search_icpn.php?name=".$TaxonName, true, 301);
		exit();
 }
 else{
	//get previous and next info based on ID
  $previousID = $ID-1;
  $nextID = $ID+1;

  $results = $db->query('SELECT TaxonID, ScientificName
						FROM eflora_taxa
						WHERE ID='.$previousID.' ');

	while ($row = $results->fetchArray()) {

		if (isset($row['TaxonID'])){
			$previousTaxonID = $row['TaxonID'];
		}
		else{
			$previousTaxonID = null;
		}

		if (isset($row['ScientificName'])){
			$previousName = $row['ScientificName'];
		}
		else{
			$previousName = null;
		}

	}

  $results = $db->query('SELECT TaxonID, ScientificName
						FROM eflora_taxa
						WHERE ID='.$nextID.'');

	while ($row = $results->fetchArray()) {

		if (isset($row['TaxonID'])){
			$nextTaxonID = $row['TaxonID'];
		}
		else{
			$nextTaxonID = null;
		}

		if (isset($row['ScientificName'])){
			$nextName = $row['ScientificName'];
		}
		else{
			$nextName = null;
		}

	}


  //query and assign family info
  //Note that only Family has "GeneraInFamily" and "ScientificEditor"
  $results = $db->query('SELECT t.TaxonID, t.FamilyID, f.TaxonID, f.ScientificName, f.TaxonAuthor, f.CommonName, f.TJM2Author, f.ScientificEditor, f.Habit, f.PlantBody, f.Stem, f.SterileStem, f.FertileStem, f.Leaf, f.Spines, f.Inflorescence, f.StaminateHead, f.RayOrPistillateFlower, f.PistillateHead, f.StaminateInflorescence, f.PistillateOrBisexualInflorescence, f.PistillateInflorescence, f.Spikelet, f.FertileSpikelet, f.SterileSpikelet, f.DistalSpikelet, f.CentralSpikelet, f.LateralSpikelet, f.StaminateSpikelet, f.PistillateSpikelet, f.Flower, f.StaminateFlower, f.PistillateFlower, f.RayFlower, f.DiskFlower, f.Cone, f.PollenCone, f.SeedCone, f.BisexualFlower, f.Fruit, f.Seed, f.Sporangia, f.SporangiumCase, f.MaleSporangiumCase, f.FemaleSporangiumCase, f.Spores, f.Chromosomes, f.GeneraInFamily, f.Etymology, f.Toxicity, f.Synonyms, f.UnabridgedSynonyms, f.Note, f.UnabridgedNote, f.RevisionNumber, f.RevisionDate, f.HasKey
						from eflora_taxonomy t, eflora_taxa f
						WHERE t.TaxonID='.$TID.' AND t.FamilyID=f.TaxonID');

	while ($row = $results->fetchArray()) {

		if (isset($row['ScientificName'])){
			$FamScientificName = $row['ScientificName'];
		}
		else{
			$FamScientificName = null;
		}

		if (isset($row['TaxonAuthor'])){
			$FamTaxonAuthor = $row['TaxonAuthor'];
		}
		else{
			$FamTaxonAuthor = null;
		}

		if (isset($row['FormattedDisplayName'])){
			$FamFormattedDisplayName = $row['FormattedDisplayName'];
		}
		else{
			$FamFormattedDisplayName = null;
		}

		if (isset($row['CommonName'])){
			$FamCommonName = $row['CommonName'];
		}
		else{
			$FamCommonName = null;
		}

		if (isset($row['TJM2Author'])){
			$FamTJM2Author = $row['TJM2Author'];
		}
		else{
			$FamTJM2Author = null;
		}

		if (isset($row['ScientificEditor'])){
			$FamScientificEditor = $row['ScientificEditor'];
		}
		else{
			$FamScientificEditor = null;
		}

		if (isset($row['Habit'])){
			$FamHabit = $row['Habit'];
		}
		else{
			$FamHabit = null;
		}

		if (isset($row['PlantBody'])){
			$FamPlantBody = $row['PlantBody'];
		}
		else{
			$FamPlantBody = null;
		}

		if (isset($row['Stem'])){
			$FamStem = $row['Stem'];
		}
		else{
			$FamStem = null;
		}

		if (isset($row['SterileStem'])){
			$FamSterileStem = $row['SterileStem'];
		}
		else{
			$FamSterileStem = null;
		}

		if (isset($row['FertileStem'])){
			$FamFertileStem = $row['FertileStem'];
		}
		else{
			$FamFertileStem = null;
		}

		if (isset($row['Leaf'])){
			$FamLeaf = $row['Leaf'];
		}
		else{
			$FamLeaf = null;
		}

		if (isset($row['Spines'])){
			$FamSpines = $row['Spines'];
		}
		else{
			$FamSpines = null;
		}

		if (isset($row['Inflorescence'])){
			$FamInflorescence = $row['Inflorescence'];
		}
		else{
			$FamInflorescence = null;
		}

		if (isset($row['StaminateHead'])){
			$FamStaminateHead = $row['StaminateHead'];
		}
		else{
			$FamStaminateHead = null;
		}

		if (isset($row['RayOrPistillateFlower'])){
			$FamRayOrPistillateFlower = $row['RayOrPistillateFlower'];
		}
		else{
			$FamRayOrPistillateFlower = null;
		}

		if (isset($row['PistillateHead'])){
			$FamPistillateHead = $row['PistillateHead'];
		}
		else{
			$FamPistillateHead = null;
		}

		if (isset($row['StaminateInflorescence'])){
			$FamStaminateInflorescence = $row['StaminateInflorescence'];
		}
		else{
			$FamStaminateInflorescence = null;
		}

		if (isset($row['PistillateOrBisexualInflorescence'])){
			$FamPistillateOrBisexualInflorescence = $row['PistillateOrBisexualInflorescence'];
		}
		else{
			$FamPistillateOrBisexualInflorescence = null;
		}

		if (isset($row['PistillateInflorescence'])){
			$FamPistillateInflorescence = $row['PistillateInflorescence'];
		}
		else{
			$FamPistillateInflorescence = null;
		}

		if (isset($row['Spikelet'])){
			$FamSpikelet = $row['Spikelet'];
		}
		else{
			$FamSpikelet = null;
		}

		if (isset($row['FertileSpikelet'])){
			$FamFertileSpikelet = $row['FertileSpikelet'];
		}
		else{
			$FamFertileSpikelet = null;
		}

		if (isset($row['SterileSpikelet'])){
			$FamSterileSpikelet = $row['SterileSpikelet'];
		}
		else{
			$FamSterileSpikelet = null;
		}

		if (isset($row['DistalSpikelet'])){
			$FamDistalSpikelet = $row['DistalSpikelet'];
		}
		else{
			$FamDistalSpikelet = null;
		}

		if (isset($row['CentralSpikelet'])){
			$FamCentralSpikelet = $row['CentralSpikelet'];
		}
		else{
			$FamCentralSpikelet = null;
		}

		if (isset($row['LateralSpikelet'])){
			$FamLateralSpikelet = $row['LateralSpikelet'];
		}
		else{
			$FamLateralSpikelet = null;
		}

		if (isset($row['StaminateSpikelet'])){
			$FamStaminateSpikelet = $row['StaminateSpikelet'];
		}
		else{
			$FamStaminateSpikelet = null;
		}

		if (isset($row['PistillateSpikelet'])){
			$FamPistillateSpikelet = $row['PistillateSpikelet'];
		}
		else{
			$FamPistillateSpikelet = null;
		}

		if (isset($row['Flower'])){
			$FamFlower = $row['Flower'];
		}
		else{
			$FamFlower = null;
		}

		if (isset($row['StaminateFlower'])){
			$FamStaminateFlower = $row['StaminateFlower'];
		}
		else{
			$FamStaminateFlower = null;
		}

		if (isset($row['PistillateFlower'])){
			$FamPistillateFlower = $row['PistillateFlower'];
		}
		else{
			$FamPistillateFlower = null;
		}

		if (isset($row['RayFlower'])){
			$FamRayFlower = $row['RayFlower'];
		}
		else{
			$FamRayFlower = null;
		}

		if (isset($row['DiskFlower'])){
			$FamDiskFlower = $row['DiskFlower'];
		}
		else{
			$FamDiskFlower = null;
		}

		if (isset($row['Cone'])){
			$FamCone = $row['Cone'];
		}
		else{
			$FamCone = null;
		}

		if (isset($row['PollenCone'])){
			$FamPollenCone = $row['PollenCone'];
		}
		else{
			$FamPollenCone = null;
		}

		if (isset($row['SeedCone'])){
			$FamSeedCone = $row['SeedCone'];
		}
		else{
			$FamSeedCone = null;
		}

		if (isset($row['BisexualFlower'])){
			$FamBisexualFlower = $row['BisexualFlower'];
		}
		else{
			$FamBisexualFlower = null;
		}

		if (isset($row['Fruit'])){
			$FamFruit = $row['Fruit'];
		}
		else{
			$FamFruit = null;
		}

		if (isset($row['Seed'])){
			$FamSeed = $row['Seed'];
		}
		else{
			$FamSeed = null;
		}

		if (isset($row['Sporangia'])){
			$FamSporangia = $row['Sporangia'];
		}
		else{
			$FamSporangia = null;
		}

		if (isset($row['SporangiumCase'])){
			$FamSporangiumCase = $row['SporangiumCase'];
		}
		else{
			$FamSporangiumCase = null;
		}

		if (isset($row['MaleSporangiumCase'])){
			$FamMaleSporangiumCase = $row['MaleSporangiumCase'];
		}
		else{
			$FamMaleSporangiumCase = null;
		}

		if (isset($row['FemaleSporangiumCase'])){
			$FamFemaleSporangiumCase = $row['FemaleSporangiumCase'];
		}
		else{
			$FamFemaleSporangiumCase = null;
		}

		if (isset($row['Spores'])){
			$FamSpores = $row['Spores'];
		}
		else{
			$FamSpores = null;
		}

		if (isset($row['Chromosomes'])){
			$FamChromosomes = $row['Chromosomes'];
		}
		else{
			$FamChromosomes = null;
		}

		if (isset($row['RarityStatus'])){
			$FamRarityStatus = $row['RarityStatus'];
		}
		else{
			$FamRarityStatus = null;
		}

		if (isset($row['Ecology'])){
			$FamEcology = $row['Ecology'];
		}
		else{
			$FamEcology = null;
		}

		if (isset($row['Elevation'])){
			$FamElevation = $row['Elevation'];
		}
		else{
			$FamElevation = null;
		}

		if (isset($row['BioregionalDistribution'])){
			$FamBioregionalDistribution = $row['BioregionalDistribution'];
		}
		else{
			$FamBioregionalDistribution = null;
		}

		if (isset($row['OutsideCA'])){
			$FamOutsideCA = $row['OutsideCA'];
		}
		else{
			$FamOutsideCA = null;
		}

		if (isset($row['SpeciesInGenus'])){
			$FamSpeciesInGenus = $row['SpeciesInGenus'];
		}
		else{
			$FamSpeciesInGenus = null;
		}

		if (isset($row['GeneraInFamily'])){
			$FamGeneraInFamily = $row['GeneraInFamily'];
		}
		else{
			$FamGeneraInFamily = null;
		}

		if (isset($row['Etymology'])){
			$FamEtymology = $row['Etymology'];
		}
		else{
			$FamEtymology = null;
		}

		if (isset($row['Toxicity'])){
			$FamToxicity = $row['Toxicity'];
		}
		else{
			$FamToxicity = null;
		}

		if (isset($row['Synonyms'])){
			$FamSynonyms = $row['Synonyms'];
		}
		else{
			$FamSynonyms = null;
		}

		if (isset($row['UnabridgedSynonyms'])){
			$FamUnabridgedSynonyms = $row['UnabridgedSynonyms'];
		}
		else{
			$FamUnabridgedSynonyms = null;
		}

		if (isset($row['Reference'])){
			$FamReference = $row['Reference'];
		}
		else{
			$FamReference = null;
		}

		if (isset($row['UnabridgedReference'])){
			$FamUnabridgedReference = $row['UnabridgedReference'];
		}
		else{
			$FamUnabridgedReference = null;
		}

		if (isset($row['Note'])){
			$FamNote = $row['Note'];
		}
		else{
			$FamNote = null;
		}

		if (isset($row['UnabridgedNote'])){
			$FamUnabridgedNote = $row['UnabridgedNote'];
		}
		else{
			$FamUnabridgedNote = null;
		}

		if (isset($row['FloweringTime'])){
			$FamFloweringTime = $row['FloweringTime'];
		}
		else{
			$FamFloweringTime = null;
		}

		if (isset($row['FloweringTimeCode'])){
			$FamTimeCode = $row['FloweringTimeCode'];
		}
		else{
			$FamTimeCode = null;
		}

		if (isset($row['FruitingTime'])){
			$FamFruitingTime = $row['FruitingTime'];
		}
		else{
			$FamFruitingTime = null;
		}

		if (isset($row['Weediness'])){
			$FamWeediness = $row['Weediness'];
		}
		else{
			$FamWeediness = null;
		}

		if (isset($row['IsTerminalTaxon'])){
			$FamIsTerminalTaxon  = $row['IsTerminalTaxon'];
		}
		else{
			$FamIsTerminalTaxon = null;
		}

		if (isset($row['RevisionNumber'])){
			$FamRevisionNumber  = $row['RevisionNumber'];
		}
		else{
			$FamRevisionNumber = null;
		}

		if (isset($row['RevisionDate'])){
			$FamRevisionDate  = $row['RevisionDate'];
		}
		else{
			$FamRevisionDate = null;
		}

		if (isset($row['DistCode'])){
			$FamDistCode = $row['DistCode'];
		}
		else{
			$FamDistCode = null;
		}

		if (isset($row['HasKey'])){
			$FamHasKey = $row['HasKey'];
		}
		else{
			$FamHasKey = null;
		}

		if (isset($row['TaxonID'])){
			$FamTaxonID = $row['TaxonID'];
		}
		else{
			$FamTaxonID = null;
		}
	}

  //query and assign genus info
  //Note that only Genus has "SpeciesInGenus"
  $results = $db->query('SELECT t.TaxonID, t.GenusID, g.TaxonID, g.ScientificName, g.TaxonAuthor, g.CommonName, g.TJM2Author, g.Habit, g.PlantBody, g.Stem, g.SterileStem, g.FertileStem, g.Leaf, g.Spines, g.Inflorescence, g.StaminateHead, g.RayOrPistillateFlower, g.PistillateHead, g.StaminateInflorescence, g.PistillateOrBisexualInflorescence, g.PistillateInflorescence, g.Spikelet, g.FertileSpikelet, g.SterileSpikelet, g.DistalSpikelet, g.CentralSpikelet, g.LateralSpikelet, g.StaminateSpikelet, g.PistillateSpikelet, g.Flower, g.StaminateFlower, g.PistillateFlower, g.RayFlower, g.DiskFlower, g.Cone, g.PollenCone, g.SeedCone, g.BisexualFlower, g.Fruit, g.Seed, g.Sporangia, g.SporangiumCase, g.MaleSporangiumCase, g.FemaleSporangiumCase, g.Spores, g.Chromosomes, g.SpeciesInGenus, g.Etymology, g.Toxicity, g.Synonyms, g.UnabridgedSynonyms, g.Reference, g.UnabridgedReference, g.Note, g.UnabridgedNote, g.RevisionNumber, g.RevisionDate, g.HasKey
						from eflora_taxonomy t, eflora_taxa g
						WHERE t.TaxonID='.$TID.' AND t.GenusID=g.TaxonID');

	while ($row = $results->fetchArray()) {

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

  //query and assign species info
  //Species has neither GeneraInFamily nor SpeciesInGenus
  $results = $db->query('SELECT t.TaxonID, t.SpeciesID, s.TaxonID, s.ScientificName, s.TaxonAuthor, s.CommonName, s.TJM2Author, s.Habit, s.PlantBody, s.Stem, s.SterileStem, s.FertileStem, s.Leaf, s.Spines, s.Inflorescence, s.StaminateHead, s.RayOrPistillateFlower, s.PistillateHead, s.StaminateInflorescence, s.PistillateOrBisexualInflorescence, s.PistillateInflorescence, s.Spikelet, s.FertileSpikelet, s.SterileSpikelet, s.DistalSpikelet, s.CentralSpikelet, s.LateralSpikelet, s.StaminateSpikelet, s.PistillateSpikelet, s.Flower, s.StaminateFlower, s.PistillateFlower, s.RayFlower, s.DiskFlower, s.Cone, s.PollenCone, s.SeedCone, s.BisexualFlower, s.Fruit, s.Seed, s.Sporangia, s.SporangiumCase, s.MaleSporangiumCase, s.FemaleSporangiumCase, s.Spores, s.Chromosomes, s.Etymology, s.Toxicity, s.Synonyms, s.UnabridgedSynonyms, s.Reference, s.UnabridgedReference, s.Note, s.UnabridgedNote, s.RevisionNumber, s.RevisionDate, s.HasKey
						from eflora_taxonomy t, eflora_taxa s
						WHERE t.TaxonID='.$TID.' AND t.SpeciesID=s.TaxonID');

	while ($row = $results->fetchArray()) {

		if (isset($row['ScientificName'])){
			$SpecScientificName = $row['ScientificName'];
		}
		else{
			$SpecScientificName = null;
		}

		if (isset($row['TaxonAuthor'])){
			$SpecTaxonAuthor = $row['TaxonAuthor'];
		}
		else{
			$SpecTaxonAuthor = null;
		}

		if (isset($row['FormattedDisplayName'])){
			$SpecFormattedDisplayName = $row['FormattedDisplayName'];
		}
		else{
			$SpecFormattedDisplayName = null;
		}

		if (isset($row['CommonName'])){
			$SpecCommonName = $row['CommonName'];
		}
		else{
			$SpecCommonName = null;
		}

		if (isset($row['TJM2Author'])){
			$SpecTJM2Author = $row['TJM2Author'];
		}
		else{
			$SpecTJM2Author = null;
		}

		if (isset($row['ScientificEditor'])){
			$SpecScientificEditor = $row['ScientificEditor'];
		}
		else{
			$SpecScientificEditor = null;
		}

		if (isset($row['Habit'])){
			$SpecHabit = $row['Habit'];
		}
		else{
			$SpecHabit = null;
		}

		if (isset($row['PlantBody'])){
			$SpecPlantBody = $row['PlantBody'];
		}
		else{
			$SpecPlantBody = null;
		}

		if (isset($row['Stem'])){
			$SpecStem = $row['Stem'];
		}
		else{
			$SpecStem = null;
		}

		if (isset($row['SterileStem'])){
			$SpecSterileStem = $row['SterileStem'];
		}
		else{
			$SpecSterileStem = null;
		}

		if (isset($row['FertileStem'])){
			$SpecFertileStem = $row['FertileStem'];
		}
		else{
			$SpecFertileStem = null;
		}

		if (isset($row['Leaf'])){
			$SpecLeaf = $row['Leaf'];
		}
		else{
			$SpecLeaf = null;
		}

		if (isset($row['Spines'])){
			$SpecSpines = $row['Spines'];
		}
		else{
			$SpecSpines = null;
		}

		if (isset($row['Inflorescence'])){
			$SpecInflorescence = $row['Inflorescence'];
		}
		else{
			$SpecInflorescence = null;
		}

		if (isset($row['StaminateHead'])){
			$SpecStaminateHead = $row['StaminateHead'];
		}
		else{
			$SpecStaminateHead = null;
		}

		if (isset($row['RayOrPistillateFlower'])){
			$SpecRayOrPistillateFlower = $row['RayOrPistillateFlower'];
		}
		else{
			$SpecRayOrPistillateFlower = null;
		}

		if (isset($row['PistillateHead'])){
			$SpecPistillateHead = $row['PistillateHead'];
		}
		else{
			$SpecPistillateHead = null;
		}

		if (isset($row['StaminateInflorescence'])){
			$SpecStaminateInflorescence = $row['StaminateInflorescence'];
		}
		else{
			$SpecStaminateInflorescence = null;
		}

		if (isset($row['PistillateOrBisexualInflorescence'])){
			$SpecPistillateOrBisexualInflorescence = $row['PistillateOrBisexualInflorescence'];
		}
		else{
			$SpecPistillateOrBisexualInflorescence = null;
		}

		if (isset($row['PistillateInflorescence'])){
			$SpecPistillateInflorescence = $row['PistillateInflorescence'];
		}
		else{
			$SpecPistillateInflorescence = null;
		}

		if (isset($row['Spikelet'])){
			$SpecSpikelet = $row['Spikelet'];
		}
		else{
			$SpecSpikelet = null;
		}

		if (isset($row['FertileSpikelet'])){
			$SpecFertileSpikelet = $row['FertileSpikelet'];
		}
		else{
			$SpecFertileSpikelet = null;
		}

		if (isset($row['SterileSpikelet'])){
			$SpecSterileSpikelet = $row['SterileSpikelet'];
		}
		else{
			$SpecSterileSpikelet = null;
		}

		if (isset($row['DistalSpikelet'])){
			$SpecDistalSpikelet = $row['DistalSpikelet'];
		}
		else{
			$SpecDistalSpikelet = null;
		}

		if (isset($row['CentralSpikelet'])){
			$SpecCentralSpikelet = $row['CentralSpikelet'];
		}
		else{
			$SpecCentralSpikelet = null;
		}

		if (isset($row['LateralSpikelet'])){
			$SpecLateralSpikelet = $row['LateralSpikelet'];
		}
		else{
			$SpecLateralSpikelet = null;
		}

		if (isset($row['StaminateSpikelet'])){
			$SpecStaminateSpikelet = $row['StaminateSpikelet'];
		}
		else{
			$SpecStaminateSpikelet = null;
		}

		if (isset($row['PistillateSpikelet'])){
			$SpecPistillateSpikelet = $row['PistillateSpikelet'];
		}
		else{
			$SpecPistillateSpikelet = null;
		}

		if (isset($row['Flower'])){
			$SpecFlower = $row['Flower'];
		}
		else{
			$SpecFlower = null;
		}

		if (isset($row['StaminateFlower'])){
			$SpecStaminateFlower = $row['StaminateFlower'];
		}
		else{
			$SpecStaminateFlower = null;
		}

		if (isset($row['PistillateFlower'])){
			$SpecPistillateFlower = $row['PistillateFlower'];
		}
		else{
			$SpecPistillateFlower = null;
		}

		if (isset($row['RayFlower'])){
			$SpecRayFlower = $row['RayFlower'];
		}
		else{
			$SpecRayFlower = null;
		}

		if (isset($row['DiskFlower'])){
			$SpecDiskFlower = $row['DiskFlower'];
		}
		else{
			$SpecDiskFlower = null;
		}

		if (isset($row['Cone'])){
			$SpecCone = $row['Cone'];
		}
		else{
			$SpecCone = null;
		}

		if (isset($row['PollenCone'])){
			$SpecPollenCone = $row['PollenCone'];
		}
		else{
			$SpecPollenCone = null;
		}

		if (isset($row['SeedCone'])){
			$SpecSeedCone = $row['SeedCone'];
		}
		else{
			$SpecSeedCone = null;
		}

		if (isset($row['BisexualFlower'])){
			$SpecBisexualFlower = $row['BisexualFlower'];
		}
		else{
			$SpecBisexualFlower = null;
		}

		if (isset($row['Fruit'])){
			$SpecFruit = $row['Fruit'];
		}
		else{
			$SpecFruit = null;
		}

		if (isset($row['Seed'])){
			$SpecSeed = $row['Seed'];
		}
		else{
			$SpecSeed = null;
		}

		if (isset($row['Sporangia'])){
			$SpecSporangia = $row['Sporangia'];
		}
		else{
			$SpecSporangia = null;
		}

		if (isset($row['SporangiumCase'])){
			$SpecSporangiumCase = $row['SporangiumCase'];
		}
		else{
			$SpecSporangiumCase = null;
		}

		if (isset($row['MaleSporangiumCase'])){
			$SpecMaleSporangiumCase = $row['MaleSporangiumCase'];
		}
		else{
			$SpecMaleSporangiumCase = null;
		}

		if (isset($row['FemaleSporangiumCase'])){
			$SpecFemaleSporangiumCase = $row['FemaleSporangiumCase'];
		}
		else{
			$SpecFemaleSporangiumCase = null;
		}

		if (isset($row['Spores'])){
			$SpecSpores = $row['Spores'];
		}
		else{
			$SpecSpores = null;
		}

		if (isset($row['Chromosomes'])){
			$SpecChromosomes = $row['Chromosomes'];
		}
		else{
			$SpecChromosomes = null;
		}

		if (isset($row['RarityStatus'])){
			$SpecRarityStatus = $row['RarityStatus'];
		}
		else{
			$SpecRarityStatus = null;
		}

		if (isset($row['Ecology'])){
			$SpecEcology = $row['Ecology'];
		}
		else{
			$SpecEcology = null;
		}

		if (isset($row['Elevation'])){
			$SpecElevation = $row['Elevation'];
		}
		else{
			$SpecElevation = null;
		}

		if (isset($row['BioregionalDistribution'])){
			$SpecBioregionalDistribution = $row['BioregionalDistribution'];
		}
		else{
			$SpecBioregionalDistribution = null;
		}

		if (isset($row['OutsideCA'])){
			$SpecOutsideCA = $row['OutsideCA'];
		}
		else{
			$SpecOutsideCA = null;
		}

		if (isset($row['SpeciesInGenus'])){
			$SpecSpeciesInGenus = $row['SpeciesInGenus'];
		}
		else{
			$SpecSpeciesInGenus = null;
		}

		if (isset($row['GeneraInFamily'])){
			$SpecGeneraInFamily = $row['GeneraInFamily'];
		}
		else{
			$SpecGeneraInFamily = null;
		}

		if (isset($row['Etymology'])){
			$SpecEtymology = $row['Etymology'];
		}
		else{
			$SpecEtymology = null;
		}

		if (isset($row['Toxicity'])){
			$SpecToxicity = $row['Toxicity'];
		}
		else{
			$SpecToxicity = null;
		}

		if (isset($row['Synonyms'])){
			$SpecSynonyms = $row['Synonyms'];
		}
		else{
			$SpecSynonyms = null;
		}

		if (isset($row['UnabridgedSynonyms'])){
			$SpecUnabridgedSynonyms = $row['UnabridgedSynonyms'];
		}
		else{
			$SpecUnabridgedSynonyms = null;
		}

		if (isset($row['Reference'])){
			$SpecReference = $row['Reference'];
		}
		else{
			$SpecReference = null;
		}

		if (isset($row['UnabridgedReference'])){
			$SpecUnabridgedReference = $row['UnabridgedReference'];
		}
		else{
			$SpecUnabridgedReference = null;
		}

		if (isset($row['Note'])){
			$SpecNote = $row['Note'];
		}
		else{
			$SpecNote = null;
		}

		if (isset($row['UnabridgedNote'])){
			$SpecUnabridgedNote = $row['UnabridgedNote'];
		}
		else{
			$SpecUnabridgedNote = null;
		}

		if (isset($row['FloweringTime'])){
			$SpecFloweringTime = $row['FloweringTime'];
		}
		else{
			$SpecFloweringTime = null;
		}

		if (isset($row['FloweringTimeCode'])){
			$SpecTimeCode = $row['FloweringTimeCode'];
		}
		else{
			$SpecTimeCode = null;
		}

		if (isset($row['FruitingTime'])){
			$SpecFruitingTime = $row['FruitingTime'];
		}
		else{
			$SpecFruitingTime = null;
		}

		if (isset($row['Weediness'])){
			$SpecWeediness = $row['Weediness'];
		}
		else{
			$SpecWeediness = null;
		}

		if (isset($row['IsTerminalTaxon'])){
			$SpecIsTerminalTaxon  = $row['IsTerminalTaxon'];
		}
		else{
			$SpecIsTerminalTaxon = null;
		}

		if (isset($row['RevisionNumber'])){
			$SpecRevisionNumber  = $row['RevisionNumber'];
		}
		else{
			$SpecRevisionNumber = null;
		}

		if (isset($row['RevisionDate'])){
			$SpecRevisionDate  = $row['RevisionDate'];
		}
		else{
			$SpecRevisionDate = null;
		}

		if (isset($row['DistCode'])){
			$SpecDistCode = $row['DistCode'];
		}
		else{
			$SpecDistCode = null;
		}

		if (isset($row['HasKey'])){
			$SpecHasKey = $row['HasKey'];
		}
		else{
			$SpecHasKey = null;
		}

		if (isset($row['TaxonID'])){
			$SpecTaxonID = $row['TaxonID'];
		}
		else{
			$SpecTaxonID = null;
		}
	}

  //get the illustration
  $results = $db->query('SELECT FileName, LargeFileName, VideoURL
						FROM eflora_illustrations
						WHERE TaxonID='.$TID.''); //16711 is the TID for Calochortus amabilis, for example

	while ($row = $results->fetchArray()) {

		if (!empty($row['FileName'])){
			$IllustrationFile = $row['FileName'];
		}
		#else{
		#	$IllustrationFile = null;
		#}
		
		if (!empty($row['LargeFileName'])){
			$IllustrationLarge = $row['LargeFileName'];
		}
		#else{
		#	$IllustrationLarge = null;
		#}
		
		if (!empty($row['VideoURL'])){
			$VIDEO = $row['VideoURL'];
		}
		#else{
		#	$VIDEO = null;
		#}
	}

  //assign the JM author and revision number
  //JMAuthor is inherited from the next highest up. Note that "except where noted" will be inherited by terminals which might be unacceptable
  if (isset($SpecTJM2Author)){ $JMAuthor = $SpecTJM2Author;}
  if (isset($GenTJM2Author)){ $JMAuthor = $GenTJM2Author;}
  if (isset($FamTJM2Author)){ $JMAuthor = $FamTJM2Author;}

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
	
  $JMAuthor = str_replace(", except as noted", "", $JMAuthor);

  if (isset($Reference)){ $Ref = $Reference;}#there are no species references, genus reference is always passed down
	elseif (isset($GenReference)){ $Ref = $GenReference;}
	elseif (isset($FamReference)){ $Ref = $FamReference;}
	else {$Ref = null;}

  if (isset($UnabridgedReference)){ $UnabRef = $UnabridgedReference;}#there are no species references, genus reference is always passed down
	#elseif (isset($GenUnabridgedReference)){ $UnabRef = $GenUnabridgedReference;}
	#elseif (isset($FamUnabridgedReference)){ $UnabRef = $FamUnabridgedReference;}
	#the old method is above, but the genus description link and family description link already pass this information
	#the data can be found by clikcing above, so why does it need to be displayed twice (although it is hidden by default)
	#all carex species pages are very long because of the extra long unabridged reference in the genus page
	else {$UnabRef = null;}


  //RevNumber is inherited by species or genus, but not from the family
  //Because a family revision does not affect all species/genera within the family
  if (isset($RevisionNumber)){ $RevNumber = $RevisionNumber;}
	elseif (isset($SpecRevisionNumber)){ $RevNumber = $SpecRevisionNumber;}
	elseif (isset($GenRevisionNumber)){ $RevNumber = $GenRevisionNumber;}
	else {$RevNumber = null;}

  //RevNumber is inherited by species or genusbut not from the family
  //Because a family revision does not affect all species/genera within the family
  if (isset($RevisionDate)){ $RevDate = $RevisionDate;}
	elseif (isset($SpecRevisionDate)){ $RevDate = $SpecRevisionDate;}
	elseif (isset($GenRevisionDate)){ $RevDate = $GenRevisionDate;}
	else {$RevDate = "2012";} //2012 is the defaut revision date; theoretically all revised taxa would fall into one of above
	
 }
 
?>

<?php

date_default_timezone_set('America/Los_Angeles');

?>
<!DOCTYPE html>
<html lang="en">
<head>
<?php 
// TID is passed to JS by using PHP to echo the value of $TaxonID to a JS variable TaxID 
// Apparently there are better ways to do this

?>


<title><?php echo "$ScientificName"?></title>
<meta charset="UTF-8">
  <meta name="keywords" content="California Flora, Jepson eFlora, Flora of California, Vascular Plants of California, Jepson Flora Project, ">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="/common/css/dropdowns.css" rel="stylesheet" type="text/css" />
<link href="/common/css/jepson_eflora.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="/common/images/JepsonLogoSmall.png" type="image/x-icon" />

<!--mobile js script files-->
	<script src="/eflora/common/js/dh_custom.js"></script>


<!--jquery script files-->
	<script src="//code.jquery.com/jquery-latest.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
	<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<!-- leaflet maps files and scripts -->

<link href='https://api.mapbox.com/mapbox.js/plugins/leaflet-fullscreen/v1.0.1/leaflet.fullscreen.css' rel='stylesheet' />

<!-- Include Leaflet CSS and JavaScript files -->
  <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
  <script src="//unpkg.com/leaflet/dist/leaflet.js"></script>
  
<script src='https://api.mapbox.com/mapbox.js/plugins/leaflet-fullscreen/v1.0.1/Leaflet.fullscreen.min.js'></script>

<script src='https://api.mapbox.com/mapbox.js/plugins/geojson-extent/v0.0.1/geojson-extent.js'></script>

<link rel="stylesheet" href="https://unpkg.com/leaflet-snap@0.0.4/leaflet.snap.js" />
<script src="//unpkg.com/leaflet-snap@0.0.4/leaflet.snap.js"></script>



<script type="text/javascript">
    var MapName = <?php echo json_encode($TID); ?>; 
</script>

<style type="text/css" media="screen">

img {
	max-width: 600px; 
}

</style>

<!-- Google tag (gtag.js) -->
<script async src="//www.googletagmanager.com/gtag/js?id=G-T5YC99QF6Q"></script>
<script async src="//www.googletagmanager.com/gtag/js?id=G-T5YC99QF6Q"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-T5YC99QF6Q');
</script>

<!-- jquery functions -->
<script>
//jquery ui functions that make the hidden higher taxonomy descriptions appear
$(document).ready(function(){
    $("#familylink").click(function(){
        $("#familydesc").slideToggle(500);
    });
    $("#genuslink").click(function(){
        $("#genusdesc").slideToggle(500);
    });
    $("#specieslink").click(function(){
        $("#speciesdesc").slideToggle(500);
    });
});

$(document).ready(function(){
//jquery functions that grab the column widths from the hidden table
//so they can be applied as a standard to the higher taxonomy table, which is made up of three separate tables
	var width1 = $("#check1").width() + 1; // width() function turns out to be one pixel too small, so add 1
	var width2 = $("#check2").width() + 1;
	var width3 = $("#check3").width() + 1;
	$(".column1").attr("width", width1);
	$(".column2").attr("width", width2);
	$(".column3").attr("width", width3);
});
</script>


</head>

<body onload="initialize()">


<!-- Begin banner -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/header_jeps.php'); ?>
<!-- End banner -->



<!-- Beginning of horizontal menu -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/globalnav.php'); ?> 
<!-- End of horizontal menu -->


<main>
    <div id="content-top">
		<h1><a href="/eflora/">Jepson eFlora</a></h1>
		<h2>Taxon Page</h2>
	<div>

	<table id = "efTable" style="vertical-align: top;width=90vw;">
		<tr>
		<td>
			<?php echo '<a href="/eflora/eflora_display.php?tid='.$previousTaxonID.'"><IMG SRC="/common/images/icons/left.gif" BORDER=2 ALT="Previous taxon"></a>'?>
		</td>

		<td><span class="pageMajorHeading"><a name="TOP" id="TOP">Vascular Plants of California</a></span>
		<br>
			<span class="pageAuthorLine">
				<a href="/IJM_keys/IJM_fam_key.html">Key to families</a>
				|
				<a href="/IJM_keys/toc.html">Table of families and genera</a>
			</span>	  
		</td>
		<td align = "right">
			<?php echo '<a href="/eflora/eflora_display.php?tid='.$nextTaxonID.'"><IMG SRC="/common/images/icons/right.gif" BORDER=2 ALT="Next taxon"></a>'?>
		</td>
	 </tr>
	 </table>

	 <table >
		<td>
<!--eFlora index-->

<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/eflora_index_bar.php'); ?>

<!--end eFlora index-->
		</td>
	  </tr>
	 </table>

	 </div>
<div id="content">

<table align="center" width="100%">
	<tr>
		<td>
<h1>
<p class="pageLargeHeading" style="text-align: center;"><?php echo "{$ScientificName}"?></p>
<p class="pageMajorHeading" style="text-align: center;"><?php echo "{$CommonName}"?></p>
</h1>
		</td>
	</tr>
</table>
<br />
<table width="100%">
	<tr>
		<td>
<!-- this hidden table provides the column width values (check1 through check3) which are used to assign consistent widths to the actual higher taxonomy tables-->
	<div class="hidden">
	<table class="taxonomy_table" style="padding: 5px;">
	<tr><td id='check1'><b>Family: <?php if(isset($FamScientificName)){ echo"{$FamScientificName}";}?></b></td><td id='check2'><b><a href="#">View Description</a></b></td><td id='check3'><a href='#'>Dichotomous Key</a></td></tr>
	<tr><td><b>Genus: <?php if(isset($GenScientificName)){ echo"{$GenScientificName}";}?></b></td><td><b><a href="#">View Description</a></b></td><td><a href='#'>Dichotomous Key</a></td></tr>
	<tr><td><b>Species: <?php if(isset($SpecScientificName)){ echo"{$SpecScientificName}";}?></b></td><td><b><a href="#">View Description</a></b></td><td><a href='#'>Dichotomous Key</a></td></tr>
	</table>
	</div>
		</td>
	</tr>
	<tr>
		<td>
<?php
//actual higher taxonomy table
//if there is no higher taxonomy (i.e. family entries), skip this section
if (!empty($FamScientificName)){
	echo '<table><tr><td width=100%>';
	echo "<div class='pageMajorHeading'><b>Higher Taxonomy</b><br></div>";
	echo "<table class='taxonomy_table'><tr><td class='column1'><b>Family: {$FamScientificName}</b></td><td class='column2'><a id='familylink'>View Description</a></b></td>";
	
	if (!empty($FamHasKey)){
		echo "<td class='column3'><a href='/eflora/eflora_keys.php?key={$FamTaxonID}'>Dichotomous Key</a></td></tr></table>";
	}
	else{ 
		$FamHasKey = null;
		echo "<td class='column3'>&nbsp;</td></tr></table>"; 
	}
		
		echo '<table><tr>';
		echo '<td><div id="familydesc" class="initiallyHidden">';
		echo "<blockquote class='bodyText'>";
	if (isset($FamCommonName)){ echo "<b>Common Name:</b> {$FamCommonName}<br>";}
	if (isset($FamHabit)){ echo "<b>Habit:</b> {$FamHabit} ";}
	if (isset($FamPlantBody)){ echo "<b>Plant Body:</b> {$FamPlantBody} ";}
	if (isset($FamStem)){ echo "<b>Stem:</b> {$FamStem} ";}
	if (isset($FamSterileStem)){ echo "<b>Sterile Stem:</b> {$FamSterileStem} ";}
	if (isset($FamFertileStem)){ echo "<b>Fertile Stem:</b> {$FamFertileStem} ";}
	if (isset($FamLeaf)){ echo "<b>Leaf:</b> {$FamLeaf} ";}
	if (isset($FamSpines)){ echo "<b>Spines:</b> {$FamSpines} ";}
	if (isset($FamInflorescence)){ echo "<b>Inflorescence:</b> {$FamInflorescence} ";}
	if (isset($FamStaminateHead)){ echo "<b>Staminate Head:</b> {$FamStaminateHead} ";}
	if (isset($FamRayOrPistillateFlower)){ echo "<b>Ray Or Pistillate Flower:</b> {$FamRayOrPistillateFlower} ";}
	if (isset($FamPistillateHead)){ echo "<b>Pistillate Head:</b> {$FamPistillateHead} ";}
	if (isset($FamStaminateInflorescence)){ echo "<b>Staminate Inflorescence:</b> {$FamStaminateInflorescence} ";}
	if (isset($FamPistillateOrBisexualInflorescence)){ echo "<b>Pistillate Or Bisexual Inflorescence:</b> {$FamPistillateOrBisexualInflorescence} ";}
	if (isset($FamPistillateInflorescence)){ echo "<b>Pistillate Inflorescence:</b> {$FamPistillateInflorescence} ";}
	if (isset($FamSpikelet)){ echo "<b>Spikelet:</b> {$FamSpikelet} ";}
	if (isset($FamFertileSpikelet)){ echo "<b>Fertile Spikelet:</b> {$FamFertileSpikelet} ";}
	if (isset($FamSterileSpikelet)){ echo "<b>Sterile Spikelet:</b> {$FamSterileSpikelet} ";}
	if (isset($FamDistalSpikelet)){ echo "<b>Distal Spikelet:</b> {$FamDistalSpikelet} ";}
	if (isset($FamCentralSpikelet)){ echo "<b>Central Spikelet:</b> {$FamCentralSpikelet}";}
	if (isset($FamLateralSpikelet)){ echo "<b>Lateral Spikelet:</b> {$FamLateralSpikelet}";}
	if (isset($FamStaminateSpikelet)){ echo "<b>Staminate Spikelet:</b> {$FamStaminateSpikelet} ";}
	if (isset($FamPistillateSpikelet)){ echo "<b>Pistillate Spikelet:</b> {$FamPistillateSpikelet} ";}
	if (isset($FamFlower)){ echo "<b>Flower:</b> {$FamFlower} ";}
	if (isset($FamStaminateFlower)){ echo "<b>Staminate Flower:</b> {$FamStaminateFlower} ";}
	if (isset($FamPistillateFlower)){ echo "<b>Pistillate Flower:</b> {$FamPistillateFlower} ";}
	if (isset($FamRayFlower)){ echo "<b>Ray Flower:</b> {$FamRayFlower} ";}
	if (isset($FamDiskFlower)){ echo "<b>Disk Flower:</b> {$FamDiskFlower} ";}
	if (isset($FamCone)){ echo "<b>Cone:</b> {$FamCone} ";}
	if (isset($FamPollenCone)){ echo "<b>Pollen Cone:</b> {$FamPollenCone} ";}
	if (isset($FamSeedCone)){ echo "<b>Seed Cone:</b> {$FamSeedCone} ";}
	if (isset($FamBisexualFlower)){ echo "<b>Bisexual Flower:</b> {$FamBisexualFlower} ";}
	if (isset($FamFruit)){ echo "<b>Fruit:</b> {$FamFruit} ";}
	if (isset($FamSeed)){ echo "<b>Seed:</b> {$FamSeed} ";}
	if (isset($FamSporangia)){ echo "<b>Sporangia:</b> {$FamSporangia} ";}
	if (isset($FamSporangiumCase)){ echo "<b>Sporangium Case:</b> {$FamSporangiumCase} ";}
	if (isset($FamMaleSporangiumCase)){ echo "<b>Male Sporangium Case:</b> {$FamMaleSporangiumCase} ";}
	if (isset($FamFemaleSporangiumCase)){ echo "<b>Female Sporangium Case:</b> {$FamFemaleSporangiumCase} ";}
	if (isset($FamSpores)){ echo "<b>Spores:</b> {$FamSpores} ";}
	if (isset($FamChromosomes)){ echo "<b>Chromosomes:</b> {$FamChromosomes}";}
		echo "<br />"; //break between morphological fields and rest of fields

	if (isset($FamGeneraInFamily)){ echo "<b>Genera In Family:</b> {$FamGeneraInFamily} ";}
	if (isset($FamEtymology)){ echo "<b>Etymology:</b> {$FamEtymology} ";}
	if (isset($FamToxicity)){ echo "<b>Toxicity:</b> {$FamToxicity} ";}
	if (isset($FamNote)){ echo "<b>Note:</b> {$FamNote} ";}
		echo "<br />";

	if (isset($FamUnabridgedNote)){ echo "<span class=\"blueTEXT\"><b>Unabridged Note:</b> {$FamUnabridgedNote}</span><br>";}
	if (isset($FamTJM2Author)){ echo "<b>eFlora Treatment Author:</b> {$FamTJM2Author}<br>";}
	if (isset($FamReference)){ echo "<b>Reference:</b> {$FamReference}<br>";}
	if (isset($FamUnabridgedReference)){ echo "<span class=\"blueTEXT\"><b>Unabridged Reference:</b> {$FamUnabridgedReference}</span><br>";}
	if (isset($FamScientificEditor)){ echo "<b>Scientific Editor:</b> {$FamScientificEditor}<br>";}
		echo "</blockquote></div></td>";

	if (isset($GenScientificName)){
		echo "<table class='taxonomy_table'><tr><td class='column1'><b>Genus: {$GenScientificName}</b></td><td class='column2'><a id='genuslink'>View Description</a></b></td>";
		if (isset($GenHasKey)){
			echo "<td class='column3'><a href='/eflora/eflora_keys.php?key={$GenTaxonID}'>Dichotomous Key</a></td></tr></table>";
		}
		else{ 
			$GenHasKey = null;
			echo "<td class='column3'>&nbsp;</td></tr></table>"; 
		}

		echo '<table><tr>';
		echo '<td><div id="genusdesc" class="initiallyHidden">';
		echo "<blockquote class='bodyText'><br>";
	if (isset($GenCommonName)){ echo "<b>Common Name:</b> {$GenCommonName}<br>";}
	if (isset($GenHabit)){ echo "<b>Habit:</b> {$GenHabit} ";}
	if (isset($GenPlantBody)){ echo "<b>Plant Body:</b> {$GenPlantBody} ";}
	if (isset($GenStem)){ echo "<b>Stem:</b> {$GenStem} ";}
	if (isset($GenSterileStem)){ echo "<b>Sterile Stem:</b> {$GenSterileStem} ";}
	if (isset($GenFertileStem)){ echo "<b>Fertile Stem:</b> {$GenFertileStem} ";}
	if (isset($GenLeaf)){ echo "<b>Leaf:</b> {$GenLeaf} ";}
	if (isset($GenSpines)){ echo "<b>Spines:</b> {$GenSpines} ";}
	if (isset($GenInflorescence)){ echo "<b>Inflorescence:</b> {$GenInflorescence} ";}
	if (isset($GenStaminateHead)){ echo "<b>Staminate Head:</b> {$GenStaminateHead} ";}
	if (isset($GenRayOrPistillateFlower)){ echo "<b>Ray Or Pistillate Flower:</b> {$GenRayOrPistillateFlower} ";}
	if (isset($GenPistillateHead)){ echo "<b>Pistillate Head:</b> {$GenPistillateHead} ";}
	if (isset($GenStaminateInflorescence)){ echo "<b>Staminate Inflorescence:</b> {$GenStaminateInflorescence} ";}
	if (isset($GenPistillateOrBisexualInflorescence)){ echo "<b>Pistillate Or Bisexual Inflorescence:</b> {$GenPistillateOrBisexualInflorescence} ";}
	if (isset($GenPistillateInflorescence)){ echo "<b>Pistillate Inflorescence:</b> {$GenPistillateInflorescence} ";}
	if (isset($GenSpikelet)){ echo "<b>Spikelet:</b> {$GenSpikelet} ";}
	if (isset($GenFertileSpikelet)){ echo "<b>Fertile Spikelet:</b> {$GenFertileSpikelet} ";}
	if (isset($GenSterileSpikelet)){ echo "<b>Sterile Spikelet:</b> {$GenSterileSpikelet} ";}
	if (isset($GenDistalSpikelet)){ echo "<b>Distal Spikelet:</b> {$GenDistalSpikelet} ";}
	if (isset($GenCentralSpikelet)){ echo "<b>Central Spikelet:</b> {$GenCentralSpikelet}";}
	if (isset($GenLateralSpikelet)){ echo "<b>Lateral Spikelet:</b> {$GenLateralSpikelet}";}
	if (isset($GenStaminateSpikelet)){ echo "<b>Staminate Spikelet:</b> {$GenStaminateSpikelet} ";}
	if (isset($GenPistillateSpikelet)){ echo "<b>Pistillate Spikelet:</b> {$GenPistillateSpikelet} ";}
	if (isset($GenFlower)){ echo "<b>Flower:</b> {$GenFlower} ";}
	if (isset($GenStaminateFlower)){ echo "<b>Staminate Flower:</b> {$GenStaminateFlower} ";}
	if (isset($GenPistillateFlower)){ echo "<b>Pistillate Flower:</b> {$GenPistillateFlower} ";}
	if (isset($GenRayFlower)){ echo "<b>Ray Flower:</b> {$GenRayFlower} ";}
	if (isset($GenDiskFlower)){ echo "<b>Disk Flower:</b> {$GenDiskFlower} ";}
	if (isset($GenCone)){ echo "<b>Cone:</b> {$GenCone} ";}
	if (isset($GenPollenCone)){ echo "<b>Pollen Cone:</b> {$GenPollenCone} ";}
	if (isset($GenSeedCone)){ echo "<b>Seed Cone:</b> {$GenSeedCone} ";}
	if (isset($GenBisexualFlower)){ echo "<b>Bisexual Flower:</b> {$GenBisexualFlower} ";}
	if (isset($GenFruit)){ echo "<b>Fruit:</b> {$GenFruit} ";}
	if (isset($GenSeed)){ echo "<b>Seed:</b> {$GenSeed} ";}
	if (isset($GenSporangia)){ echo "<b>Sporangia:</b> {$GenSporangia} ";}
	if (isset($GenSporangiumCase)){ echo "<b>Sporangium Case:</b> {$GenSporangiumCase} ";}
	if (isset($GenMaleSporangiumCase)){ echo "<b>Male Sporangium Case:</b> {$GenMaleSporangiumCase} ";}
	if (isset($GenFemaleSporangiumCase)){ echo "<b>Female Sporangium Case:</b> {$GenFemaleSporangiumCase} ";}
	if (isset($GenSpores)){ echo "<b>Spores:</b> {$GenSpores} ";}
	if (isset($GenChromosomes)){ echo "<b>Chromosomes:</b> {$GenChromosomes}";}
		echo "<br />"; //break between morphological fields and rest of fields

	if (isset($GenGeneraInFamily)){ echo "<b>Genera In Family:</b> {$GenGeneraInFamily} ";}
	if (isset($GenEtymology)){ echo "<b>Etymology:</b> {$GenEtymology} ";}
	if (isset($GenToxicity)){ echo "<b>Toxicity:</b> {$GenToxicity} ";}
	if (isset($GenNote)){ echo "<b>Note:</b> {$GenNote} ";}
		echo "<br />";

	if (isset($GenUnabridgedNote)){ echo "<span class=\"blueTEXT\"><b>Unabridged Note:</b> {$GenUnabridgedNote}</span><br>";}
	if (isset($GenTJM2Author)){ echo "<b>eFlora Treatment Author:</b> {$GenTJM2Author}<br>";}
	if (isset($GenReference)){ echo "<b>Reference:</b> {$GenReference}<br>";}
	if (isset($GenUnabridgedReference)){ echo "<span class=\"blueTEXT\"><b>Unabridged Reference:</b> {$GenUnabridgedReference}</span><br>";}
	if (isset($GenScientificEditor)){ echo "<b>Scientific Editor:</b> {$GenScientificEditor}<br>";}

		echo "</div></td>";
	
	}
	
	//if (isset($SpecScientificName)){ 
	//	echo "<table class='taxonomy_table'><tr><td class='column1'><b>Species: {$SpecScientificName}</b></td><td class='column2'><a id='specieslink'>View Description</a></b></td><td class='column3'>&nbsp;</td></tr></table>";
	//	echo '<table><tr>';
	//	echo '<td><div id="speciesdesc" class="initiallyHidden">';
	//	echo "<blockquote class='bodyText'>";
		
		
	if (isset($SpecScientificName)){
		echo "<table class='taxonomy_table'><tr><td class='column1'><b>Species: {$SpecScientificName}</b></td><td class='column2'><a id='specieslink'>View Description</a></b></td>";
		if (isset($SpecHasKey)){
			echo "<td class='column3'><a href='/eflora/eflora_keys.php?key={$SpecTaxonID}'>Dichotomous Key</a></td></tr></table>";
		}
		else{ 
			$SpecHasKey = null;
			echo "<td class='column3'>&nbsp;</td></tr></table>"; 
		}

		echo '<table><tr>';
		echo '<td><div id="speciesdesc" class="initiallyHidden">';
		echo "<blockquote class='bodyText'><br>";		

	if (isset($SpecCommonName)){ echo "<b>Common Name:</b> {$SpecCommonName}<br>";}
	if (isset($SpecHabit)){ echo "<b>Habit:</b> {$SpecHabit} ";}
	if (isset($SpecPlantBody)){ echo "<b>Plant Body:</b> {$SpecPlantBody} ";}
	if (isset($SpecStem)){ echo "<b>Stem:</b> {$SpecStem} ";}
	if (isset($SpecSterileStem)){ echo "<b>Sterile Stem:</b> {$SpecSterileStem} ";}
	if (isset($SpecFertileStem)){ echo "<b>Fertile Stem:</b> {$SpecFertileStem} ";}
	if (isset($SpecLeaf)){ echo "<b>Leaf:</b> {$SpecLeaf} ";}
	if (isset($SpecSpines)){ echo "<b>Spines:</b> {$SpecSpines} ";}
	if (isset($SpecInflorescence)){ echo "<b>Inflorescence:</b> {$SpecInflorescence} ";}
	if (isset($SpecStaminateHead)){ echo "<b>Staminate Head:</b> {$SpecStaminateHead} ";}
	if (isset($SpecRayOrPistillateFlower)){ echo "<b>Ray Or Pistillate Flower:</b> {$SpecRayOrPistillateFlower} ";}
	if (isset($SpecPistillateHead)){ echo "<b>Pistillate Head:</b> {$SpecPistillateHead} ";}
	if (isset($SpecStaminateInflorescence)){ echo "<b>Staminate Inflorescence:</b> {$SpecStaminateInflorescence} ";}
	if (isset($SpecPistillateOrBisexualInflorescence)){ echo "<b>Pistillate Or Bisexual Inflorescence:</b> {$SpecPistillateOrBisexualInflorescence} ";}
	if (isset($SpecPistillateInflorescence)){ echo "<b>Pistillate Inflorescence:</b> {$SpecPistillateInflorescence} ";}
	if (isset($SpecSpikelet)){ echo "<b>Spikelet:</b> {$SpecSpikelet} ";}
	if (isset($SpecFertileSpikelet)){ echo "<b>Fertile Spikelet:</b> {$SpecFertileSpikelet} ";}
	if (isset($SpecSterileSpikelet)){ echo "<b>Sterile Spikelet:</b> {$SpecSterileSpikelet} ";}
	if (isset($SpecDistalSpikelet)){ echo "<b>Distal Spikelet:</b> {$SpecDistalSpikelet} ";}
	if (isset($SpecCentralSpikelet)){ echo "<b>Central Spikelet:</b> {$SpecCentralSpikelet}";}
	if (isset($SpecLateralSpikelet)){ echo "<b>Lateral Spikelet:</b> {$SpecLateralSpikelet}";}
	if (isset($SpecStaminateSpikelet)){ echo "<b>Staminate Spikelet:</b> {$SpecStaminateSpikelet} ";}
	if (isset($SpecPistillateSpikelet)){ echo "<b>Pistillate Spikelet:</b> {$SpecPistillateSpikelet} ";}
	if (isset($SpecFlower)){ echo "<b>Flower:</b> {$SpecFlower} ";}
	if (isset($SpecStaminateFlower)){ echo "<b>Staminate Flower:</b> {$SpecStaminateFlower} ";}
	if (isset($SpecPistillateFlower)){ echo "<b>Pistillate Flower:</b> {$SpecPistillateFlower} ";}
	if (isset($SpecRayFlower)){ echo "<b>Ray Flower:</b> {$SpecRayFlower} ";}
	if (isset($SpecDiskFlower)){ echo "<b>Disk Flower:</b> {$SpecDiskFlower} ";}
	if (isset($SpecCone)){ echo "<b>Cone:</b> {$SpecCone} ";}
	if (isset($SpecPollenCone)){ echo "<b>Pollen Cone:</b> {$SpecPollenCone} ";}
	if (isset($SpecSeedCone)){ echo "<b>Seed Cone:</b> {$SpecSeedCone} ";}
	if (isset($SpecBisexualFlower)){ echo "<b>Bisexual Flower:</b> {$SpecBisexualFlower} ";}
	if (isset($SpecFruit)){ echo "<b>Fruit:</b> {$SpecFruit} ";}
	if (isset($SpecSeed)){ echo "<b>Seed:</b> {$SpecSeed} ";}
	if (isset($SpecSporangia)){ echo "<b>Sporangia:</b> {$SpecSporangia} ";}
	if (isset($SpecSporangiumCase)){ echo "<b>Sporangium Case:</b> {$SpecSporangiumCase} ";}
	if (isset($SpecMaleSporangiumCase)){ echo "<b>Male Sporangium Case:</b> {$SpecMaleSporangiumCase} ";}
	if (isset($SpecFemaleSporangiumCase)){ echo "<b>Female Sporangium Case:</b> {$SpecFemaleSporangiumCase} ";}
	if (isset($SpecSpores)){ echo "<b>Spores:</b> {$SpecSpores} ";}
	if (isset($SpecChromosomes)){ echo "<b>Chromosomes:</b> {$SpecChromosomes}";}
		echo "<br />"; //break between morphological fields and rest of fields

	if (isset($SpecGeneraInFamily)){ echo "<b>Genera In Family:</b> {$SpecGeneraInFamily} ";}
	if (isset($SpecEtymology)){ echo "<b>Etymology:</b> {$SpecEtymology} ";}
	if (isset($SpecToxicity)){ echo "<b>Toxicity:</b> {$SpecToxicity} ";}
	if (isset($SpecNote)){ echo "<b>Note:</b> {$SpecNote} ";}
		echo "<br />";

	if (isset($SpecUnabridgedNote)){ echo "<span class=\"blueTEXT\"><b>Unabridged Note:</b> {$SpecUnabridgedNote}</span><br>";}
	if (isset($SpecTJM2Author)){ echo "<b>eFlora Treatment Author:</b> {$SpecTJM2Author}<br>";}
	if (isset($SpecReference)){ echo "<b>Reference:</b> {$SpecReference}<br>";}
	if (isset($SpecUnabridgedReference)){ echo "<span class=\"blueTEXT\"><b>Unabridged Reference:</b> {$SpecUnabridgedReference}</span><br>";}
	if (isset($SpecScientificEditor)){ echo "<b>Scientific Editor:</b> {$SpecScientificEditor}<br>";}

		echo "</div></td>";
	}
	
	echo "<br />";
	echo '</tr></table>';
}


echo '</tr></table>';

//if illustration exists, there are two table cells, else there is one
	if (!empty($IllustrationFile)){
		echo '<table id = "EF_right"><tr><td>';
		#echo '<table width="100%"><tr><td width="60%" valign="top">';
		#if (isset($VIDEO)){
		#	echo '<p>VIDEO TEST FOUND</p>';
		#}
	}
	#elseif (isset($IllustrationLarge)){
	#	echo '<table width="100%"><tr><td width="60%" valign="top">';
	#}
	elseif (!empty($VIDEO)){
		echo '<table id = "EF_right"><tr><td>';
	}
	else {
		$IllustrationFile = null;
		$VIDEO = null;
		$IllustrationLarge = null;
		echo '<table id = "EF_citation"><tr><td>';
	}


//then finally, print the focal taxonID block
echo '<div class="pageMajorHeading"><b>'.$FormattedDisplayName.'</b><br></div>';
echo "<div class='bodyText'>";
	if (!empty($efloraStatus)){ echo '<b>'.$efloraStatus.'</b><br>';}

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
echo "<br />"; //break between morphological fields and rest of fields

	if (isset($Ecology)){ echo "<b>Ecology:</b> {$Ecology} ";}
	if (isset($Elevation)){ echo "<b>Elevation:</b> {$Elevation} ";}
	if (isset($BioregionalDistribution)){ echo "<b><a href=\"#MAP\">Bioregional Distribution:</a></b> {$BioregionalDistribution} ";}
	if (isset($OutsideCA)){ echo "<b>Distribution Outside California:</b> {$OutsideCA} ";}
	if (isset($SpeciesInGenus)){ echo "<b>Species In Genus:</b> {$SpeciesInGenus} ";}
	if (isset($GeneraInFamily)){ echo "<b>Genera In Family:</b> {$GeneraInFamily} ";}
	if (isset($Etymology)){ echo "<b>Etymology:</b> {$Etymology} ";}
	if (isset($Toxicity)){ echo "<b>Toxicity:</b> {$Toxicity} ";}
	if (isset($FloweringTime)){ echo "<b>Flowering Time:</b> {$FloweringTime} ";}
	if (isset($FruitingTime)){ echo "<b>Fruiting Time:</b> {$FruitingTime} ";}
//if ($ConingTime){ echo "<b>Coning Time:</b> {$ConingTime} ";}
//Remove as the data was a duplicate of that in Notes
	if (isset($Note)){ echo "<b>Note:</b> {$Note} ";}
echo "<br />";

	if (isset($Synonyms)){ echo "<b>Synonyms:</b> {$Synonyms}<br>";}
	if (isset($UnabridgedSynonyms)){ echo "<span class=\"blueTEXT\"><b>Unabridged Synonyms:</b> {$UnabridgedSynonyms}</span><br>";}
	if (isset($UnabridgedNote)){ echo "<span class=\"blueTEXT\"><b>Unabridged Note:</b> {$UnabridgedNote}</span><br>";}
	if (isset($JMAuthor)){ echo "<b>Jepson eFlora Author:</b> {$JMAuthor}<br>";}
	if (isset($Ref)){ echo "<b>Reference:</b> {$Ref}<br>";}
	if (isset($UnabRef)){ echo "<span class=\"blueTEXT\"><b>Unabridged Reference:</b> {$UnabRef}</span><br>";}
	if (isset($ScientificEditor)){ echo "<b>Scientific Editor:</b> {$ScientificEditor}<br>";}
echo '<a href="/cgi-bin/get_cpn?'.$TID.'"><b>Index of California Plant Names (ICPN; linked via the Jepson Online Interchange)</b></a><br>';
	if (isset($HasKey)){ echo "<b><a href='/eflora/eflora_keys.php?key=".$TID."'>Key to <i>".$ScientificName."</i></a></b></br>"; }

//old CDFA table, links are broken, so it is now just a list
	if (isset($Weediness)){
		if (strstr($Weediness, 'SYMBOL 1') !== false){ 
			echo '<a href="https://www.cdfa.ca.gov/plant/IPC/encycloweedia/weedinfo/winfo_table-sciname.html"><b>Noxious Weed listed on the CDFA Weed Pest Ratings table</b></a><br>';
		}

//new CDFA weed ranking sheets, indexed by page number of some sort, not taxon name
//This has to be updated manually and added to a new table in eflora.db 
//so that the CDFA_ID variable can be found; set as null for now
$CDFA_name = null;
$CDFA_ID = null;
$CDFA_url = null;
$url = null;

		if (isset($CDFA_ID)){
			if (strstr($Weediness, 'SYMBOL 1') !== false){
				$CDFAurl = "https://blogs.cdfa.ca.gov/Section3162/?p=".$CDFA_ID;
				echo '<a href="'.$CDFAurl.'"><b>Weed listed by Cal-IPC</b></a><br />';
			}
		}
		else{
			$CDFA_name = str_replace(" ", "+", $ScientificName);
			$CDFAurl = "https://blogs.cdfa.ca.gov/Section3162/?s=".$CDFA_name;
			echo '<a href="'.$CDFAurl.'"><b>View the CDFA Pest Rating page for <i>'.$ScientificName.'</i></b></a><br />';
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
				$IPC_search_name = str_replace("acacia-dealbata", "acacia_dealbata", $IPC_search_name);
				$IPC_search_name = str_replace("acacia-melanoxylon", "acacia_melanoxylon", $IPC_search_name);
				$IPC_search_name = str_replace("lythrum-hyssopifolia", "lythrum-hyssopifolium", $IPC_search_name);
				$IPC_search_name = str_replace("ludwigia-peploides-ssp-montevidensis", "ludwigia-peploides", $IPC_search_name);
				$IPC_search_name = str_replace("ludwigia-peploides-ssp-peploides", "ludwigia-peploides", $IPC_search_name);
				$IPC_search_name = str_replace("phytolacca-americana-var.-americana", "phytolacca-americana", $IPC_search_name);
				$IPC_search_name = str_replace("phytolacca-americana-var-americana", "phytolacca-americana", $IPC_search_name);
				$IPC_search_name = str_replace("tetragonia-tetragonoides", "tetragonia-tetragonioides", $IPC_search_name);

			$url = 'https://www.cal-ipc.org//plants/profile/'.$IPC_search_name.'-profile/';
			echo '<a href="'.$url.'"><b>Weed listed by Cal-IPC</b></a> <br>';
//these codes create a lag, but will print a link only if the page exists.
//page loading lag is about the same time it takes for a page to load in Cal-IPC, so this is a Cal_IPC issue during checking to see if the page exists
//using just this echo line above does not check the eflora treatments text to see if the author was correct in placing a SYMBOL 2 in WEEDINESS
//nor does is check to see if the page of the NOXIOUS WEED exists in Cal-IPC
//note sure which is better, but all of the WEEDINESS records need some type of reporting function to see if the page still exists or has been changed in Cal_IPC
//the web page url changes in Cal_IPC happens at least once per year, but not to all taxon pages at once in the past 3 years.
//variant code 1
		//$headers=get_headers($url, 1);
		//	if ($headers[0]!='HTTP/1.1 200 OK'){
		//		echo "<a href='https://www.cal-ipc.org/plants/profile/$IPC_search_name-profile/'><b>Weed listed by Cal-IPC</b></a> <br>";
		//	}
		//	else{
		//		echo "<b>CHECK URL at Cal-IPC - poorly formatted weed url</b><br />";
		//	}

//variant code 2
			//function get_http_response_code($url) {
			//	$headers = get_headers($url);
			//	return substr($headers[0], 9, 3);
			//}

		//if(intval(get_http_response_code($url)) < 400){
			// File exists, huzzah!
		//	echo "<a href='https://www.cal-ipc.org/plants/profile/$IPC_search_name-profile/'><b>Weed listed by Cal-IPC</b></a> <br>";
		//}
		//else{
		//	echo "<b>CHECK URL at Cal-IPC - poorly formatted weed url</b><br />";
		//}

//variant code 3
		//ini_set("default_socket_timeout","05");
		//set_time_limit(5);
		//$f=fopen($url,"r");
		//$r=fread($f,500);
		//fclose($f);
		//	if(strlen($r)>1) {
			//echo("<span class='online'>Online</span>");
			// File exists, huzzah!
		//	echo "<a href='https://www.cal-ipc.org/plants/profile/$IPC_search_name-profile/'><b>Weed listed by Cal-IPC</b></a> <br>";
		//	}
		//	else {
				//echo("<span class='offline'>Offline</span>");
		//		echo "<b>CHECK URL at Cal-IPC - poorly formatted weed url</b><br />";
		//	}

//variant code 4
		//if(! @(file_get_contents($url))){
		//	echo "<b>CHECK URL at Cal-IPC - poorly formatted weed url</b><br />";
		//}
		//else{
		//	echo "<a href='https://www.cal-ipc.org/plants/profile/$IPC_search_name-profile/'><b>Weed listed by Cal-IPC</b></a> <br>";
		//}

//variant code 5
		//if (fopen($url, "r")){
		//	echo "<a href='https://www.cal-ipc.org/plants/profile/$IPC_search_name-profile/'><b>Weed listed by Cal-IPC</b></a> <br>"; 
		//}
		//else{
		//	echo "<b>CHECK URL at Cal-IPC - poorly formatted weed url</b><br />";
		//}
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
		
#the CNPS conversion in SQL is not working for subtaxa
$CNPS_name = str_replace(" subsp. ", " ssp. ", $ScientificName);

		if (!empty($CNPS_name)){
			$CNPS_name = str_replace(" ", "+", $CNPS_name);
		}

	if (!empty($RarityStatus)){ 
		if (strpos($RarityStatus, '+') !== false){ echo '<a href="https://rareplants.cnps.org/Plants/Details?taxon='.$CNPS_name.'"><b>Listed on CNPS Rare Plant Inventory</b></a><br>';}
		else { echo '<a href="http://www.rareplants.cnps.org/detail/'.$RarityStatus.'.html"><b>Listed on CNPS Rare Plant Inventory</b></a><br>';}
	}
?>


<?php //photos from CalPhotos.

$cp_ssp_name = str_replace(" subsp. ", " ssp. ", $ScientificName); //CalPhotos uses "ssp." and not "subsp."
$cp_name = $cp_ssp_name;

?>




<?php //get and print list of taxa within the genus (if a species or infra), or list of species within genus (if a genus)
if (!empty($GenTaxonID)) { //i.e. if the rank is lower than genus
echo '<p><form>';
echo '<label><b>List of species:</b><select WIDTH=20 onChange="window.location=this.value">';
echo '<OPTION VALUE="None">&nbsp;&nbsp;click here';

$results = $db->query('SELECT DISTINCT a.TaxonID as TaxonID, a.ScientificName as ScientificName, b.TaxonID, b.GenusID as GenusID
						FROM eflora_taxa a
						INNER JOIN eflora_taxonomy b on a.TaxonID = b.TaxonID
						WHERE GenusID='.$GenTaxonID.''); //$GenTaxonID for focal taxon determined in an earlier query
	while ($row = $results->fetchArray()) {
		if ($row['TaxonID']){
			echo ' <OPTION VALUE="/eflora/eflora_display.php?tid='.$row['TaxonID'].'">'.$row['ScientificName'];
		}

	}
echo '</select></label></form></p>';
}
elseif (!empty($FamTaxonID)) { //i.e. if the rank is otherwise lower than family, and therefore at rank genus
echo '<p><form>';
echo '<label><b>List of species:</b><select width=20 onchange="window.location=this.value">';
echo '<OPTION value="None">&nbsp;&nbsp;click here';
$results = $db->query('SELECT DISTINCT a.TaxonID as TaxonID, a.ScientificName as ScientificName, b.TaxonID, b.GenusID as GenusID
						FROM eflora_taxa a
						INNER JOIN eflora_taxonomy b on a.TaxonID = b.TaxonID
						WHERE GenusID='.$TID.''); //$in this case, the $TaxonID is the ID for a genus
	while ($row = $results->fetchArray()) {
		if ($row['TaxonID']){
			echo ' <OPTION VALUE="/eflora/eflora_display.php?tid='.$row['TaxonID'].'">'.$row['ScientificName'];
		}

	}
echo '</select></label></form></p>';	
}
else {
	echo '<br />';
}
?>

<?php //Next-Previous taxon links
if (isset ($previousTaxonID)) { //i.e. always, except for the very first page
	echo '<a href="/eflora/eflora_display.php?tid='.$previousTaxonID.'">Previous taxon: '.$previousName.'</a><br>';
}
if (isset ($nextTaxonID)) { //i.e. always, except for the very last page
	echo '<a href="/eflora/eflora_display.php?tid='.$nextTaxonID.'">Next taxon: '.$nextName.'</a><br>';
}
?>

<?php //Search box, which probably needs some flavour and/or relocation 
?>
<br />
<form action="/eflora/search_eflora.php" method="POST">
<label><b>Name Search:</b><input type="text" id="query_text" name="query"></input>
</label>
		<input type="submit" value="Submit Name" /></input>

</form>





<?php

  if (!empty($VIDEO)) {
	echo '</td><td>';
//display another section for records with videos

	echo "<table>";
	echo "<tr>";
	echo '<td><p class=smallText><b>Jepson Video for <i>';
	echo str_replace(" var. ", "</i> var. <i>", $ScientificName);
	echo '</i>Click to watch the video.</b><br /><br />';
	echo '<a href="'.$VIDEO.'"><img height="88px" src="/common/images/youtube_social_icon_red.png" ALT="YouTube Video Icon"></img></a><br />';
	echo '</p></td>';	


	if (!empty($IllustrationFile)) {
		if (!empty($IllustrationLarge)) {
			echo '</tr><tr>';
			echo '<td>';
			echo '<p class=smallText><b>Botanical illustration including <i>'.$ScientificName.'</i></b>';	
	//this uses a symbolic link for /usr/local/web/ucjeps_data/ucjeps_data/illustrations/, where all the illustration files were moved some time before 2015
			echo '<a href="/images/illustrations/revised/'.$IllustrationLarge.'" target="_blank" title="botanical illustration including '.$ScientificName.' "><img src="/images/illustrations/revised/'.$IllustrationFile.'" alt="botanical illustration including '.$ScientificName.' "></a>';
			echo '</p></td>';
			echo "</tr></table>";
			echo '</td>';
		}
		else{
			$IllustrationLarge = null;
			echo '</tr><tr>';
			echo '<td>';
			echo '<p class=smallText><b>Botanical illustration including <i>'.$ScientificName.'</i></b>';	
	//this uses a symbolic link for /usr/local/web/ucjeps_data/ucjeps_data/illustrations/, where all the illustration files were moved some time before 2015
	//old version 2017 - echo '<center><img src="/images/illustrations/'.$IllustrationFile.'" alt="botanical illustration including <i>'.$ScientificName.'</i>" height="475" border="0" align="center"/></center>';
	//old version 2015 - echo '<center><img src="'.$ILLUS.'" alt="botanical illustration including '.$ScientificName.'" height="475" border="0" align="center"/></center>';
			echo '<a href="/images/illustrations/'.$IllustrationFile.'" target="_blank" title="botanical illustration including '.$ScientificName.' "><img src="/images/illustrations/'.$IllustrationFile.'" alt="botanical illustration including '.$ScientificName.' "></a>';
			echo '</p></td>';
			echo "</tr></table>";
			echo '</td>';
		}
	}
	else{
		$IllustrationFile = null;
		echo "</tr></table>";
		echo '</td>';
	}
  }
  else{
	echo '</td><td>';
	$VIDEO = null;
   	 
	if (!empty($IllustrationFile)) {
//add second cell for illustration, if one is available
		if (!empty($IllustrationLarge)) {
			echo '<p class=smallText><b>Botanical illustration including <i>'.$ScientificName.'</i></b>';	
	//this used a symbolic link for /usr/local/web/ucjeps_data/ucjeps_data/illustrations/, where all the illustration files were moved some time before 2015
			echo '<a href="/images/illustrations/revised/'.$IllustrationLarge.'" target="_blank" title="botanical illustration including '.$ScientificName.' "><img src="/images/illustrations/revised/'.$IllustrationFile.'" alt="botanical illustration including '.$ScientificName.' "></a>';
			echo '</p></td>';
		}
		else{
			$IllustrationLarge = null;
			echo '<p class=smallText><b>Botanical illustration including <i>'.$ScientificName.'</i></b>';	
	//this used a symbolic link for /usr/local/web/ucjeps_data/ucjeps_data/illustrations/, where all the illustration files were moved some time before 2015
	//old version 2017 - echo '<center><img src="/images/illustrations/'.$IllustrationFile.'" alt="botanical illustration including <i>'.$ScientificName.'</i>" height="475" border="0" align="center"/></center>';
	//old version 2015 - echo '<center><img src="'.$ILLUS.'" alt="botanical illustration including '.$ScientificName.'" height="475" border="0" align="center"/></center>';
			echo '<a href="/images/illustrations/'.$IllustrationFile.'" target="_blank" title="botanical illustration including '.$ScientificName.' "><img src="/images/illustrations/'.$IllustrationFile.'" alt="botanical illustration including '.$ScientificName.' "></a>';
			echo '</p></td>';
		}
	}
	else{
		$IllustrationFile = null;
		echo '</td>';
	}
  }

?>

</tr>
</table>
</div>
<br />

<table id="EF_citation">
<tr style="background-color:grey">
<td>
</td>
</tr>
<tr>
<td>


<!--<a href="&#109;&#97;&#105;&#108;to:interchange&#064;lists.berkeley.edu?subject=new eFlora comment"><font size=3 color="red">Contact/Feedback</span></a>
-->
<p>
<a href="https://docs.google.com/forms/d/e/1FAIpQLSc_wrQXqB9gNPrOgUTZ9WN38Ub08JlmgaIha7Ua99sHGzMntA/viewform">
	<span class="commentText">Please use this Google Form for Contact/Feedback
	</span>
</a>
</p>
<p class=bodyText>

<?php echo "Citation for this treatment: ";
	  echo preg_replace("/\[[^\]]+\]/","",$JMAuthor); 
	  if ($RevDate){ echo " ".$RevDate.", ";}
	  echo "<i>".$ScientificName."</i>, ";
	  echo "in Jepson Flora Project (eds.) <em>Jepson eFlora</em>, ";
	  	if ($RevNumber){ echo $RevNumber.", ";}
	  echo "https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=".$TID.", accessed on "?> <?php echo date ("F d, Y")?>.
</p>
<p class=bodyText>Citation for the whole project: Jepson Flora Project (eds.) <?php echo date ("Y") ?>, <em>Jepson eFlora</em>,  https://ucjeps.berkeley.edu/eflora/, accessed on <?php echo date ("F d, Y")?>.</p>


<?php
	if (empty($GenTaxonID)){//i.e. if the rank is higher than genus, there is no genus taxon ID
//, otherwords at the family level
//for family treatments, distribution and image pages are now excluded, they use to be displayed
		//<!--Begin footer-->
		include($_SERVER['DOCUMENT_ROOT'].'/common/php/eflora_footer.php');
		//<!--End footer-->

		exit();
	}
	elseif(empty($FamTaxonID)){//i.e. if the rank is higher than family, there is no family taxon ID
//for family treatments, photos and distribution pages are excluded
//so exit out at this point
		//<!--Begin footer-->
		include($_SERVER['DOCUMENT_ROOT'].'/common/php/eflora_footer.php');
		//<!--End footer-->
		exit();
	}
	else{
	//do nothing, proceed
	}
?>

</td></tr></table>

<div id="content-top">


<table id="EF_citation">
<tr>
<td>


<?php 
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


					foreach($bits as $key => $value) {
						$raw_taxon = $bits[0];
						$taxon = str_replace(" ssp. ", " subsp. ", $raw_taxon);
						$kwid = $bits[1];
						$copyright = $bits[2];
						$enlarge = str_replace(" ", "+", $kwid); //full image links in format 0000+1111+2222+3333
						$kwidarray = explode(" ",$kwid);
						$kwid4thumb = "{$kwidarray[0]}_{$kwidarray[1]}/{$kwidarray[2]}/{$kwidarray[3]}"; //thumbnail links in format 0000_1111/2222/3333
						
						

						if(in_array($kwid, $alreadyOutput)){
							continue;
						}
						$alreadyOutput[] = $kwid; 
						//echo $kwid . "<br />";
						
						echo '<div class="i-align">';
							if ( (!empty($taxon)) && (!empty($kwid)) ){
								echo '<div class="v-align">';
								echo '<div class=bodyText><i>';
								echo str_replace(" var. ", "&nbsp;&nbsp;<br /></i> var. <i>", $taxon);
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
	//echo "<p class=bodyText>FOUND-->".$cp_search_name."</p>";
		}
		else{//if there is no $kwid (i.e. no photos), do not print the "see more" link or the extra divider
			echo '<p class=bodyText style="color:#BBBBB">No expert verified images found for <i>'.$ScientificName.'.</i></p>';
		}

echo "</td></tr></table>";


if (!empty($splitcontents)){ 
	$cp_search_name = str_replace(" ", "+", $cp_ssp_name);
	echo '<p class=bodyText><a href="https://calphotos.berkeley.edu/cgi/img_query?query_src=ucjeps&where-genre=Plant&where-taxon='.$cp_ssp_name.'&title_tag='.$ScientificName.'">More photos of <i>'.$ScientificName.'</i><br /> in CalPhotos</a></p>';
}


?>

</td></tr></table>
</div>
<br />
<!--distribution panes-->
<div id="content">
<table id="EF_bottom">
<tr><td>
<br />
<span class=smallText>
<a name="MAP" id="MAP"></a>Geographic subdivisions for <a href="#TOP"><?php echo "$ScientificName"?></a>:

<br />

<?php 
$regname = str_replace(";", " ", $BioregionalDistribution);
echo "$regname"?>
</span>
</td>
<td>
<span class=smallText>
<b><a name="EFMAP" id="EFMAP"></a>MAP CONTROLS</b>
<br />1. You can change the display of the base map layer control box in the upper right-hand corner.
<br />2. County and Jepson Region polygons can be turned off and on using the check boxes.
</span>
</td></tr>
<tr>
<td valign="top">
<span class=smallText>
<?php echo '<img src="/cgi-bin/new_jmap?'.$DistCode.'" border="0" alt="map of distribution 1">' ?>
</span>
</td>
<td>
	<div id="map_canvas"></div>
	<link href="common/cluster/MarkerCluster.Default.css" type="text/css" rel=stylesheet />
	<link rel="stylesheet" type="text/css" href="common/cluster/MapkeyIcons.css" />
	<link rel="stylesheet" type="text/css" href="common/cluster/L.Icon.Mapkey.css" />
	<script src="common/cluster/L.Icon.Mapkey.js"></script>
	<script src="common/cluster/leaflet.markercluster.js"></script>

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

var cacount = "counties_TIGER2016.geojson"; //full json file for California County TIGER2016 
var regfill = "JepsonV7.geojson"; //full json file for Jepson regions
var CABND = "CA_BND_line.geojson"; //full json file for California Boundary line file
var bnd = "Jepson_regions_buffer_bnd.geojson"; //full json file for Jepson regions


//$.getJSON('GEOJSON/'+MapName+'_2.geojson', function(data) { //March 2022
//$.getJSON('GEOJSON/'+MapName+'_3.geojson', function(data) { //Jan 2023
//$.getJSON('GEOJSON/'+MapName+'_4.geojson', function(data) { //Feb 2023
//$.getJSON('GEOJSON/'+MapName+'_5.geojson', function(data) { //Feb 2024
//$.getJSON('GEOJSON/'+MapName+'_6.geojson', function(data) { //MAR 2025
//$.getJSON('GEOJSON/'+MapName+'_8.geojson', function(data) { //MAY 2025        
//$.getJSON('GEOJSON/'+MapName+'_9.geojson', function(data) { //NOV 2025        
$.getJSON('GEOJSON/'+MapName+'_1.geojson', function(data) { //DEC 2025

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
			         layer.bindPopup(feature.properties.DET+"<br /><a href=/consortium/details.php?aid="+feature.properties.accid+">"+feature.properties.accid+"</a><br />"+feature.properties.CO+" County<br />"+feature.properties.LOC);
					},
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
				         layer.bindPopup(feature.properties.DET+"<br /><a href=/consortium/details.php?aid="+feature.properties.accid+">"+feature.properties.accid+"</a><br />"+feature.properties.CO+" County<br />"+feature.properties.LOC);
						},
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
				         layer.bindPopup(feature.properties.DET+"<br /><a href=/consortium/details.php?aid="+feature.properties.accid+">"+feature.properties.accid+"</a><br />"+feature.properties.CO+" County<br />"+feature.properties.LOC);
						},
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


  map.on('zoomstart', function() {

		map.eachLayer(function(layer) {
			if (map.hasLayer(geojsonLayerP)) {
				map.removeLayer(geojsonLayerP);
			}
			//if (this.checked) { map.addLayer(layer); }
//else { map.removeLayer(layer); }
			//if( layer instanceof L.GeoJSON ) {
			//	map.removeLayer(layer);
				
			//}

		});
  });


});

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


</td>
</tr>


<tr><td valign="top">
<p class=smallText>(Note: any qualifiers in the taxon distribution description, such as 'northern', 'southern', 'adjacent' etc., are not reflected in the map above, and in some cases indication of a taxon in a subdivision is based on a single collection or author-verified occurrence).
</p>
<br />
<br />
<br />
<br />
<br />
&nbsp;<br />
<?php 
//a.k.a. "heath bars"
//infra rank must be removed for the heath bar script

$hb_value = "&times;";
$hb_name = str_replace(" nothosubsp.", "", $ScientificName);
$hb_name = str_replace(" subsp.", "", $hb_name);
$hb_name = str_replace(" var.", "", $hb_name);
$hb_name = str_replace($hb_value, "", $hb_name);
//$hb_name = str_replace($hb_value, "X ", $ScientificName);

// convert names to hybrid form that are compatible for taxon synonym tables
//echo '<a href="/cgi-bin/map_cch_elev.pl?taxon_name='.$hb_name.'&t=&g="><h3>View elevation by latitude chart</h3></a>'
?>
<br />
</td>
<td valign="top"><p class=smallText>
Data provided by the participants of the&nbsp;
<?php echo '<a href="/consortium/about.html">Consortium of California Herbaria</a>'?>.
</p>
<p class=smallText><b>MAP LEGEND</b>
<br />
<!--<?php
echo '<a href="/consortium/list.php?taxon_name='.$hb_name.'"">View all CCH records</a>'
?>
-->
<ul>
<li>Due to persistent denial-of-service attacks caused by aggressive bot traffic,<br> the search interface for CCH1 is no longer publicly accessible.</span></li>
<br>
<li>If you would like a custom query export of the data from this map,<br>
please e-mail Jason Alexander &nbsp;&nbsp;(<a class="CCHtable" href="mailto:jason_alexander@berkeley.edu">jason_alexander@berkeley.edu</a>).</span></li>
</ul>

<br />All markers link to CCH specimen records. The original determination is shown in the popup window.
<br />Blue markers indicate specimens that map to one of the expected Jepson geographic subdivisions (see left map). Purple markers indicate specimens collected from a garden, greenhouse, or other non-wild location.
<br />Yellow markers indicate records that may provide evidence for eFlora range revision or may have georeferencing or identification issues.
<br /><b><a href="/consortium/about_yellow.html">READ ABOUT YELLOW FLAGS</a></b>
</p>
<p class=smallText>
CCH collections by month
<?php
//a.k.a. "heath bars"
//infra rank must be removed for the heath bar script
$hb_name = str_replace(" nothosubsp.", "", $hb_name);
$hb_name = str_replace(" subsp.", "", $hb_name);
$hb_name = str_replace(" var.", "", $hb_name);

//the hb2 script takes the flowering/fruiting/spore/cone time as input, e.g. "&FT=3,4,5" for Mar-May. This is pre-loaded in the FLFRTimeCode field
if (isset($TimeCode)){
	echo '<img border=1 src="/cgi-bin/hb2?name='.$hb_name.'&FT='.$TimeCode.'" ALT="Flowering-Fruiting Monthly Counts">';
}	
else {
	echo '<img border=1 src="/cgi-bin/hb2?name='.$hb_name.'&FT=" ALT="Flowering-Fruiting Monthly Counts">';
}	
?>
</p>
<p class=smallText>Duplicates counted once; synonyms included.<br />
Species do not include records of infraspecific taxa, if there are more than 1 infraspecific taxon in CA.<br />
Blue line denotes eFlora flowering time (fruiting time in some monocot genera).</p>

</td></tr></table>	
</div>
</main>

<!--begin footer-->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/eflora_footer.php'); ?>
<!--end footer-->


</body>
</html>
