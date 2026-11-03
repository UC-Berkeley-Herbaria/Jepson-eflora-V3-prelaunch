<?php
date_default_timezone_set('America/Los_Angeles');
$SearchTerm = $TaxonID = $TaxonName = "";

// define variables and set to empty values

//Security mod to prevent cross-site scripting attacks

  if (isset($_GET['icpn'])){

	$SearchTerm = $_GET['icpn'];
// 1. Remove Null Bytes first
	$SearchTerm = str_replace(chr(0), "", $SearchTerm);

// 2. Trim using the standard whitespace characters (space, tab, newline, etc.)
// PHP's default trim() already handles \t, \n, \r, \0, and \x0B.
	$SearchTerm = trim($SearchTerm);

// 3. Finally, escape for HTML output
	$SearchTerm = htmlspecialchars($SearchTerm, ENT_QUOTES, 'UTF-8');
	
//prep value for searching
	$SearchTerm = str_replace("%20", " ", $SearchTerm);
	$SearchTerm = str_replace("&times;", "", $SearchTerm);
	$SearchTerm = str_replace("+", " ", $SearchTerm);
	$SearchTerm = str_replace("_", " ", $SearchTerm);
	$SearchTerm = str_replace("  ", " ", $SearchTerm); 
	$SearchTerm = str_replace(" ssp ", " subsp. ", $SearchTerm);
	$SearchTerm = str_replace(" var ", " var. ", $SearchTerm);
	$SearchTerm = str_replace(" subsp ", " subsp. ", $SearchTerm);
	
  }

//connect to the database
require '../../herbariadb_data/eflora/config/config_eflora_mysql.php';
$db = mysqli_connect($db_host, $db_user, $db_pw, $db_name);

?>


 <!DOCTYPE html>
<html lang="en">
<head>

<title>ICPN Taxon Search - Jepson eFlora</title>
<meta charset="UTF-8">
<meta name="description" content="For vascular plants occurring in wildlands or otherwise outside of cultivation in California, the Jepson eFlora contains taxonomic treatments, distribution maps, illustrations, photographs, and identification keys.">
  <meta name="keywords" content="California Flora, Jepson eFlora, Flora of California, Vascular Plants of California, Jepson Flora Project, ">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Standardized CSS Links -->
    <link href="/eflora/common/css/eflora-header.css" rel="stylesheet" type="text/css">
    <link href="/eflora/common/css/jepson-main.css" rel="stylesheet" type="text/css">
    <link href="/eflora/icpn/common/css/icpn.css" rel="stylesheet" type="text/css">

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

<main class="eflora-main">
    <header class="page-title-section">
        <h1><a class="efTitle" href="/icpn/">Index to California Plant Names (ICPN)</a></h1>
        <h2>ICPN Search Page</h2>
        <h3 id="vascular-title">Vascular Plants of California</h3>
    </header>

    <!-- Index Bars -->
    <nav class="icpn-index-container" aria-labelledby="vascular-title">
        <div class="index-bar">
            <?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/icpn/common/php/icpn_index_bar.php'); ?>
        </div>
        <div class="index-bar">
            <?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/icpn/common/php/status_index_bar.php'); ?>
        </div>
    </nav>

    <!-- Search Section -->
    <section class="search-id-block center-text">
        <div class="search-centered-container">
            <div class="search-group">
                <form action="/eflora/search_icpn.php" method="get" class="centered-form">
                    <label for="icpn" class="search-label">ICPN Scientific Name Search:</label>
                    <input type="text" id="icpn" name="icpn" placeholder="Enter a scientific name..." required 
                           value="<?php echo $SearchTerm; ?>">
                    <div class="button-group">
                        <button type="submit" class="btn btn-submit">Submit Name</button>
                        <button type="reset" class="btn btn-reset">Reset</button>
                    </div>
                </form>
            </div>
        </div>
    </section>

    <!-- Results Section -->
    <section class="results-container">
<?php
        $pattern = '/^[A-Za-z \-\.]+$/';
        if (preg_match($pattern, $SearchTerm)) {
            echo '<h2 class="search-query-header">Results for: <em>' . $SearchTerm . '</em></h2>';

//perform a search that returns all names that start with a letter
//this is the same query as in search_eflora.php, but with a different WHERE clause

		$sql = "SELECT a.ScientificName as ScientificName, a.TaxonID as TaxonID";
		$sql.= ", a.Family as Family, a.CurrentStatus as Status, a.CurrentName as AcceptedName";
		$sql.= ", a.CurrentNameTID as AcceptedNameTID";
		$sql.= " FROM icpn a";
		$sql.= " LEFT OUTER JOIN icpn b on a.CurrentNameTID = b.TaxonID";
		$sql.= " WHERE a.ScientificName LIKE '".$SearchTerm."%'";
		$sql.= " ORDER BY Family, ScientificName";

//BEGIN temporary bug fix lines to add when needed
//echo '<br />'.$sql.'<br />';

		if(!mysqli_query($db, $sql)){
			die('Error: ' . mysqli_error($db));
		}

            $result = mysqli_query($db, $sql);
            
            if (mysqli_num_rows($result) > 0) {
                // AAA Table Structure
                echo '<div class="table-responsive">
                <table class="eFloraTable">
                    <thead>
                        <tr>
                            <th scope="col">Scientific Name</th>
                            <th scope="col">Family</th>
                            <th scope="col">ICPN Status</th>
                        </tr>
                    </thead>
                    <tbody>';

                while ($row = mysqli_fetch_array($result)) {

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
					$family = $row['Family'];
				}
				else{
					$family = null;
				}

				if (!empty($row['Status'])){
					$status = $row['Status'];
				}
				else{
					$status = null;
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
	  


                    if( (!empty($family)) && (!empty($status)) ){
                        echo '<tr>';
                        if( (!empty($accepted)) && (!empty($AcceptedTID)) ){
                            echo '<td><a href="/eflora/icpn/icpn_display.php?tid='.$TID.'">'.$SciName.'</a><br>
                                  <span class="synonym-note">(Under <a href="/eflora/icpn/icpn_display.php?tid='.$AcceptedTID.'">'.$accepted.'</a>)</span></td>';
                        } else {
                            echo '<td><a href="/eflora/icpn/icpn_display.php?tid='.$TID.'">'.$SciName.'</a></td>';
                        }
                        echo '<td>'.$family.'</td>';
                        echo '<td>'.$status.'</td>';
                        echo '</tr>';
                    }
                }
                echo '</tbody></table></div>';
            } else {
                echo '<p class="feedback-msg">No names found matching "'. $SearchTerm .'".</p>';
            }
        }
?>
    </section>

    <section class="feedback-section center-text">
        <a class="googleForm" href="https://docs.google.com/forms/d/e/1FAIpQLSc_wrQXqB9gNPrOgUTZ9WN38Ub08JlmgaIha7Ua99sHGzMntA/viewform">
            Please use this Google Form for Contact/Feedback
        </a>
    </section>
</main>

<!-- Begin footer -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/eflora-footer.php'); ?>


</body>
</html>
