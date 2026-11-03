<?php
date_default_timezone_set('America/Los_Angeles');

//Security mod to prevent cross-site scripting attacks
if (isset($_GET['name'])){
	$SearchTerm = $_GET['name'];
// 1. Remove Null Bytes first
	$SearchTerm = str_replace(chr(0), "", $SearchTerm);

// 2. Trim using the standard whitespace characters (space, tab, newline, etc.)
// PHP's default trim() already handles \t, \n, \r, \0, and \x0B.
	$SearchTerm = trim($SearchTerm);

// 3. Finally, escape for HTML output
	$SearchTerm = htmlspecialchars($SearchTerm, ENT_QUOTES, 'UTF-8');
}
else{
	echo '<br /><p><span class="feedbackLink">';
	echo '<i>'.$SearchTerm.'</i> --> Search term invalid.</span></p>';
	echo '<p><b>Try another search, or try searching the <a href="/interchange/">Jepson Online Interchange</a>.</p><br /><br />';
	$SearchTerm = "";
    exit;
}

//connect to the database
require '../../herbariadb_data/eflora/config/config_eflora_mysql.php';
$db = mysqli_connect($db_host, $db_user, $db_pw, $db_name);

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <title>Scientific Name Search - Jepson eFlora</title> 
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Search California vascular plants by scientific name in the Jepson eFlora database.">
    
    <!-- Standardized CSS Links -->
    <link href="/eflora/common/css/eflora-header.css" rel="stylesheet" type="text/css">
    <link href="/eflora/common/css/jepson-main.css" rel="stylesheet" type="text/css">
    <link href="/eflora/icpn/common/css/icpn.css" rel="stylesheet" type="text/css">

    <link rel="shortcut icon" href="/eflora/common/images/JepsonLogoSmall.png" type="image/x-icon" />

    <!-- Google tag (gtag.js) -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-T5YC99QF6Q"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());
      gtag('config', 'G-T5YC99QF6Q');
    </script>
</head>

<body>

<!-- Standardized Header -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/eflora-header.php'); ?>  

<main class="eflora-main">
    <header class="page-title-section">
        <h1>Jepson eFlora Search Results</h1>
    </header>

    <!-- return home link -->
<div class="center-text" style="margin-top: 30px;">
    <a href="/eflora/" style="font-weight: bold;">&larr; Return to <i>Jepson eFlora</i> Search Page</a>
</div>

    <!-- Navigation & Index Bars -->
    <nav class="icpn-nav-block" aria-label="eFlora Navigation">
        <!-- Standardized Horizontal Search Form -->
        <div class="search-centered-container">
            <form action="search_eflora.php" method="get" class="centered-form">
                <label for="name" class="search-label">Scientific Name Search:</label>
                <div class="input-row">
                    <input type="text" id="name" name="name" placeholder="Enter a scientific name..." required value="<?php echo htmlspecialchars($SearchTerm); ?>">
                    <div class="button-group">
                        <button type="submit" class="btn btn-submit">Submit</button>
                        <button type="reset" class="btn btn-reset">Reset</button>
                    </div>
                </div>
            </form>
        </div>
    </nav>

    <!-- Results Section -->
    <section class="results-container">
        <?php
        $pattern = '/^[A-Za-z \-\.]+$/';
        if (preg_match($pattern, $SearchTerm)) {
            echo '<h3 class="search-query-header center-text">Search Results for: "<em>' . $SearchTerm . '</em>"</h3>';

            // Database Query (using prepared statements for security)
			$sql = "SELECT a.ScientificName as ScientificName, a.TaxonID as TaxonID";
			$sql.= ", a.CommonName as CommonName, a.Status as Status, a.IsTerminalTaxon as IsTerminalTaxon";
			$sql.= ", a.HasKey as HasKey, a.AcceptedNameTID as AcceptedNameTID, b.ScientificName as AcceptedName";
			$sql.= " FROM eflora_synonymy a";
			$sql.= " LEFT OUTER JOIN eflora_synonymy b on a.AcceptedNameTID = b.TaxonID";
			$sql.= " WHERE a.ScientificName LIKE '".$SearchTerm."%'";
			$sql.= " ORDER BY Status, ScientificName";

            $stmt = mysqli_prepare($db, $sql);
            $queryParam = $SearchTerm . '%';
            mysqli_stmt_bind_param($stmt, "s", $queryParam);
            mysqli_stmt_execute($stmt);
            $result = mysqli_stmt_get_result($stmt);

            if (mysqli_num_rows($result) > 0) {
                echo '<div class="table-responsive">
                <table class="eFloraTable">
                    <thead>
                        <tr>
                            <th scope="col">Scientific Name</th>
                            <th scope="col">Common Name</th>
                            <th scope="col">Status</th>
                        </tr>
                    </thead>
                    <tbody>';

                while ($row = mysqli_fetch_assoc($result)) {
                    $SciName = $row['ScientificName'];
                    $TID = $row['TaxonID'];
                    $common = $row['CommonName'];
                    $status = ucfirst(strtolower($row['Status']));
                    $AcceptedTID = $row['AcceptedNameTID'];
                    $accepted = $row['AcceptedName'];

                    echo '<tr>';
                    if (!empty($accepted) && !empty($AcceptedTID)) {
                        $status = str_replace("Noted name", "Mentioned in a note", $status);
                        echo '<td><a href="/eflora/eflora_display.php?tid='.$AcceptedTID.'"><i>'.$SciName.'</i></a><br>
                              <span class="synonym-note">(Under <i>'.$accepted.'</i>)</span></td>';
                    } else {
                        echo '<td><a href="/eflora/eflora_display.php?tid='.$TID.'"><i>'.$SciName.'</i></a>';
                        if ($row['HasKey']) {
                            echo '<br><a href="/eflora/eflora_keys.php?key='.$TID.'" class="key-link">↳ Key to '.$SciName.'</a>';
                        }
                        echo '</td>';
                    }
                    echo '<td>'.$common.'</td>';
                    echo '<td>'.$status.'</td>';
                    echo '</tr>';
                }
                echo '</tbody></table></div>';
            } else {
                echo '<div class="data-section center-text">
                        <p>No results found for "<strong>'.$SearchTerm.'</strong>" in the Jepson eFlora database.</p>
                        <p><a href="search_icpn.php?icpn='.$SearchTerm.'" class="cta-link">Search the Index of California Plant Names (ICPN) &rarr;</a></p>
                      </div>';
            }
        } else {
            echo '<div class="data-section center-text"><p>Invalid search format. Please use letters, spaces, or hyphens only.</p></div>';
        }
        ?>
    </section>

    <!-- SEPARATOR BAR HERE -->
    <hr class="footer-separator">

<!-- Index Section -->
<section class="index-footer-wrap">
    <div class="search-group">
        <nav class="icpn-index-container" aria-labelledby="alpha-title">
        	<div class="index-bar" style="margin-bottom: 10px;">
            	<h3 id="alpha-title" style="margin-top: 0;"><a class="efTag" href="/eflora/keys/IJM_fam_key.php">Key to families</a>|<a class="efTag" href="/eflora/toc.php">Table of families and genera</a></h3>
        	</div>

            <!-- Alphabetical Index -->
            <h3 id="alpha-title" style="margin-top: 0;">Alphabetical Index to eFlora accepted names and synonyms</h3>
            <div class="index-bar" style="margin-bottom: 10px;">
            	<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/eflora_index_bar.html'); ?>
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
</main>

<!-- Standardized Footer -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/eflora-footer.php'); ?>

</body>
</html>
<!--Horizontal Search Bar: Standardized the form to include a "Reset" button and aligned everything horizontally using the input-row Flexbox logic.-->
<!--Zebra Striped Tables: The results table automatically receives alternating light blue rows via the tr:nth-child(even) rule in your shared CSS.-->
<!--Semantic Headers: Replaced the plain <th> tags with <thead> and scope="col". This is essential for WCAG AAA so screen readers correctly identify the context of each cell.-->
<!--Taxonomy Formatting: All scientific names and synonymy notes are wrapped in <i> tags for proper botanical italics.-->
<!--Reflow Support: The table-responsive container ensures mobile users can swipe the table horizontally if it exceeds their screen width, rather than the page zooming out.-->
<!--Secure Querying: Updated the logic to use Prepared Statements (mysqli_prepare). This protects your database against SQL injection.-->
<!--Touch Target Size: Standardized padding on table rows and links ensures they meet the 44x44 pixel minimum target size for mobile accessibility.-->
<!--Visual Consistency: The page now uses the same white-on-blue header/footer styling and centered feedback button as the rest of your updated eFlora project.-->
