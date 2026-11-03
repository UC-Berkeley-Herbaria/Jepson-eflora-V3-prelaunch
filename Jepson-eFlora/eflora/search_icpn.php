<?php
date_default_timezone_set('America/Los_Angeles');
$SearchTerm = $TaxonID = $TaxonName = "";

// define variables and set to empty values
$familyPart = "";
$genusPart  = "";
$speciesPart = "";
$infraPart  = "";

//Security mod to prevent cross-site scripting attacks

  if (isset($_GET['icpn'])){

	$SearchTerm = $_GET['icpn'];
// 1. Remove Null Bytes first
	$SearchTerm = str_replace(chr(0), "", $SearchTerm);

// 2. Finally, escape for HTML output
	$SearchTerm = htmlspecialchars($SearchTerm, ENT_QUOTES, 'UTF-8');
	
//prep value for searching
	$SearchTerm = str_replace("%20", " ", $SearchTerm);
	$SearchTerm = str_replace("&times;", "", $SearchTerm);
	$SearchTerm = str_replace("+", " ", $SearchTerm);
	$SearchTerm = str_replace("_", " ", $SearchTerm);
	$SearchTerm = str_replace(" X ", " x", $SearchTerm);
	$SearchTerm = str_replace(" x ", " x", $SearchTerm);
	$SearchTerm = str_replace(" ssp ", " subsp. ", $SearchTerm);
	$SearchTerm = str_replace(" ssp. ", " subsp. ", $SearchTerm);
	$SearchTerm = str_replace(" var ", " var. ", $SearchTerm);
	$SearchTerm = str_replace(" subsp ", " subsp. ", $SearchTerm);
	$SearchTerm = preg_replace('/\s+/', ' ', $SearchTerm);
	$SearchTerm = trim(preg_replace('/\s+/', ' ', $SearchTerm));

// 3. Trim using the standard whitespace characters (space, tab, newline, etc.)
// PHP's default trim() already handles \t, \n, \r, \0, and \x0B.
	$searchTerm = trim($SearchTerm);

// 1. CHECK FOR FAMILY (Ends in aceae)
// We use a case-insensitive check for 'aceae'
	if (preg_match('/aceae$/i', $searchTerm)) {
	    // If it's a family, make it ALL CAPS and clear other parts

	    $familyPart = strtoupper($searchTerm);
	    $genusPart   = null;
	    $speciesPart = null;
	    $infraPart   = null;

// Clean non-alpha characters (optional, based on your Perl logic)
		#$familyPart   = preg_replace('/[^A-Z]+/', '', $familyPart);

	} 
	else {
	    // 2. REGULAR PARSING (Genus, Species, Infra)

	    $parts = preg_split('/\s+/', $searchTerm);

	    $genusPart   = $parts[0] ?? '';
	    $speciesPart = $parts[1] ?? '';
	    $infraPart   = $parts[2] ?? '';
	    $fallThru    = $parts[3] ?? '';

	    // Handle rank indicators (var., subsp., etc.)
	    $ranks = ['var.', 'subsp.', 'ssp.', 'subspecies', 'f.'];
	    if (in_array(strtolower($infraPart), $ranks)) {
	        $infraPart = $fallThru;
	    }

// Clean non-alpha characters (optional, based on your Perl logic)
		$genusPart   = preg_replace('/[^A-Za-z-]/', '', $genusPart);
		$speciesPart = preg_replace('/[^A-Za-z-]/', '', $speciesPart);
		$infraPart   = preg_replace('/[^A-Za-z-]/', '', $infraPart);

		$genusPart = strtolower($genusPart);
		$speciesPart = strtolower($speciesPart);
		$infraPart = strtolower($infraPart);

	}
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
        <h1>Index to California Plant Names (ICPN) Search Page</h1>
    </header>

    <!-- return home link -->
<div class="center-text" style="margin-top: 30px;">
    <a href="/eflora/icpn/" style="font-weight: bold;">&larr; Return to the <i>ICPN</i> Search Page</a>
</div>

<!-- Search Section -->
        <div class="search-group" style="background: #f0f7ff; border: 1px solid var(--border-gray);">
            
			<div class="search-tip-box" role="note" aria-label="Search hint">
				<p>
				<strong class="tip-label">Note:</strong> 
				Partial name search ability (e.g., <em class="example-text">"Seq gig"</em>) is active. 
				Use the full family name (e.g., <em class="example-text">"Agavaceae"</em>) to search by family.
				</p>
			</div>
            <form action="/eflora/search_icpn.php" method="get" class="centered-form">
                <label for="icpn" class="search-label">Enter Scientific Name:</label>
                <div class="input-row">
                    <input type="text" id="icpn" name="icpn" placeholder="e.g., Quercus agrifolia" required>
                    <div class="button-group">
                        <button type="submit" class="btn btn-submit">Search ICPN</button>
                        <button type="reset" class="btn btn-reset">Clear</button>
                    </div>
                </div>
            </form>
        </div>



    <!-- Results Section -->
    <section class="results-container">
<?php
        $pattern = '/^[A-Za-z \-\.]+$/';
        if (preg_match($pattern, $SearchTerm)) {
            echo '<h2 class="search-query-header">Results for: <em>' . $SearchTerm . '</em></h2>';

//this is the same query as in search_eflora.php, but with a different WHERE clause
		#$sql = "SELECT a.ScientificName as ScientificName, a.TaxonID as TaxonID";
		#$sql.= ", a.Family as Family, a.CurrentStatus as Status, a.CurrentName as AcceptedName";
		#$sql.= ", a.CurrentNameTID as AcceptedNameTID";
		#$sql.= " FROM icpn a";
		#$sql.= " LEFT OUTER JOIN icpn b on a.CurrentNameTID = b.TaxonID";
		#$sql.= " WHERE a.ScientificName LIKE '".$SearchTerm."%'";
		#$sql.= " ORDER BY Family, ScientificName";

//Seq gig alternate search query
	$sql = "SELECT a.ScientificName, a.TaxonID as TaxonID";
	$sql.= ", a.Family, a.CurrentStatus as Status, a.CurrentName as AcceptedName";
	$sql.= ", a.CurrentNameTID as AcceptedNameTID";
	$sql.= " FROM icpn a";
	$sql.= " LEFT OUTER JOIN icpn b ON a.CurrentNameTID = b.TaxonID";
	$sql.= " WHERE 1=1";

	if (!empty($familyPart)) {
	    // Search by Family
	    $sql .= " AND a.Family LIKE '" . addslashes($familyPart) . "%'";
	} else {
	    // Search by Genus/Species/Infra
// Genus Prefix
	    if ($genusPart != '') {
	        $sql .= " AND a.Genus LIKE '" . addslashes($genusPart) . "%'";
	    }

// Species Prefix
	    if ($speciesPart != '') {
	        $sql .= " AND a.Species LIKE '" . addslashes($speciesPart) . "%'";
	    }

// Infraspecific Prefix
	    if ($infraPart != '') {
	        $sql .= " AND a.Infraspecies LIKE '" . addslashes($infraPart) . "%'";
	    }
	}

	$sql .= " ORDER BY a.Family, a.ScientificName";


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
<!-- End of Search Results Table -->

    <!-- SEPARATOR BAR HERE -->
    <hr class="footer-separator">

<!-- Index Section -->
<section class="index-footer-wrap">
    <div class="search-group">
        <nav class="icpn-index-container" aria-labelledby="alpha-title">
            <!-- Alphabetical Index -->
            <h3 id="alpha-title" style="margin-top: 0;">Alphabetical Index to ICPN accepted names and synonyms</h3>
            <div class="index-bar" style="margin-bottom: 30px;">
                <?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/icpn/common/php/icpn_index_bar.html'); ?>
            </div>

    <!-- full status index page link -->
<div class="center-text" style="margin-top: 30px;">
    <a href="/eflora/icpn/status_list.php" style="font-weight: bold;">View the full list of <i>ICPN</i> Status Ranks</a>
</div>

            <!-- Numerical Index -->
            <h3 id="status-title">Index to Numerical Status Ranks for ICPN Scientific Names</h3>
            <div class="index-bar">
                <?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/icpn/common/php/status_index_bar.html'); ?>
            </div>
        </nav>
    </div>
</section>

    <!-- Feedback CTA -->
    <section class="feedback-section center-text">
        <a class="googleForm" href="https://docs.google.com/forms/d/e/1FAIpQLSc_wrQXqB9gNPrOgUTZ9WN38Ub08JlmgaIha7Ua99sHGzMntA/viewform">
            Send us your feedback! Community input helps improve the Jepson eFlora.
        </a>
    </section>

</main> <!-- End of search_icpn -->

<!-- Begin footer -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/eflora-footer.php'); ?>


</body>
</html>

<!-- .input-row (Flexbox): Your jepson-main.css defines .input-row form as display: flex. By putting the input and buttons inside this wrapper, the browser automatically places them side-by-side.-->
<!-- flex: 1 (Spanning the width): Your CSS for input[type="text"] has flex: 1. This tells the search box to grow and fill all available space, pushing the buttons to the far right.-->
<!-- Responsiveness: Because you are using .input-row, your existing Media Query (at 768px) will automatically allow the buttons to stack below the search box on small mobile screens, ensuring you don't break the layout.-->
<!-- WCAG Compliance:-->
<!-- The min-height: 48px on the inputs and buttons (from jepson-main.css) ensures they meet WCAG 2.2 Pointer Target requirements.-->
<!-- The label remains explicitly linked to the id="icpn" for screen readers.-->
<!-- I added htmlspecialchars() to the PHP output of the search term to prevent potential XSS vulnerabilities, which is an accessibility and security best practice.-->
<!-- A Note on the outer container:-->
<!-- I changed the outer class to .search-layout. In your jepson-main.css, this class is already set to display: grid and width: 100%, which will ensure the entire search block spans the page correctly within your .eflora-main container.-->

<!--.search-group Usage: This class (from jepson-main.css) provides exactly the #f4f4f4 background, 1px solid #767676 border, and 25px padding that you used for your top search box.-->
<!--Unique IDs: I changed the id="vascular-title" to two unique IDs (alpha-title and status-title). In WCAG standards, IDs must be unique on a single page to prevent screen reader errors.-->
<!--75% Centering: Using width: 75% and margin: 0 auto ensures the box is centered on the page.-->
<!--Mobile Adjustments: The @media query ensures that on a phone, the box expands to 95% width. A 75% width box on a narrow phone screen often makes the index links (A-Z) too cramped to tap accurately.-->
<!--Index Bars: Wrapping the includes in the .index-bar class ensures they respect any layout rules you have for those lists of links.-->

<!--Detection: It uses preg_match('/aceae$/i', $searchTerm) to see if the string ends with "aceae" (case insensitive).-->
<!--Normalization: If it is a family, it runs strtoupper(). Because botanical families are often stored in ALL CAPS in databases (e.g., FABACEAE), this matches your requirement.-->
<!--Mutual Exclusion: If the family is found, the script skips the logic that splits the string into Genus/Species. This prevents the code from trying to search for a Genus named "Fabaceae".-->
<!--SQL Construction:-->
<!--If $familyPart is set, it adds AND a.Family LIKE 'FABACEAE%'.-->
<!--Otherwise, it builds the query using the 3-part name logic we established earlier.-->

<!--In your original SQL, you were searching against a.ScientificName. To make the "Seq gig" logic work efficiently:-->
<!--Column Separation: Your database table (icpn) should ideally have separate columns for Genus and Species.-->
<!--The "ScientificName" fallback: If you don't have separate columns and only have one long ScientificName column (e.g., "Sequoia gigantea"), the query would look like this:
<!--WHERE a.ScientificName LIKE 'Seq% gig%'-->
<!--However, this is less accurate than searching against specific Genus/Species columns.-->
<!--Summary of Changes:-->
<!--Perl split $\rightarrow$ PHP preg_split: This handles multiple spaces between words.-->
<!--LIKE 'Seq%': This mimics your Perl logic of "starts with."-->
<!--AND: By using AND, you ensure that the record must match both the Genus prefix and the Species prefix.-->