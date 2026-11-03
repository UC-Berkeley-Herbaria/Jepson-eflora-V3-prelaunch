<?php
date_default_timezone_set('America/Los_Angeles');

//Security mod to prevent cross-site scripting attacks
if (isset($_GET['cn'])){
	$SearchTerm = $_GET['cn'];
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
    <title>Common Name Search - Jepson eFlora</title> 
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Search California vascular plants by common name in the Jepson eFlora database.">
    
    <!-- Standardized CSS Links -->
    <link href="/eflora/common/css/eflora-header.css" rel="stylesheet" type="text/css">
    <link href="/eflora/common/css/jepson-main.css" rel="stylesheet" type="text/css">
    <link href="/eflora/common/css/eflora.css" rel="stylesheet" type="text/css">

    <link rel="shortcut icon" href="/common/images/JepsonLogoSmall.png" type="image/x-icon" />

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
        <h1>Jepson eFlora Common Name Search Results</h1>
    </header>

    <!-- Navigation & Index Bars -->
    <nav class="icpn-nav-block" aria-label="eFlora Navigation">
        <!-- Standardized Horizontal Search Form -->
        <div class="search-centered-container">
            <form action="search_common.php" method="get" class="centered-form">
                <label for="cn" class="search-label">Common Name Search:</label>
                <div class="input-row">
                    <input type="text" id="cn" name="cn" placeholder="Enter a common name..." required value="<?php echo htmlspecialchars($SearchTerm); ?>">
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

            // Clean search term for SQL
            $QueryTerm = str_replace(" ", "%", $SearchTerm);
            $QueryTerm = str_replace("+", "%", $QueryTerm);

            // Database Query (using prepared statements for security)
            $sql = "SELECT a.ScientificName, a.TaxonID, a.CommonName, a.Status, a.HasKey, a.AcceptedNameTID, b.ScientificName as AcceptedName";
            $sql .= " FROM eflora_synonymy a";
            $sql .= " LEFT OUTER JOIN eflora_synonymy b on a.AcceptedNameTID = b.TaxonID";
            $sql .= " WHERE a.CommonName LIKE ? OR a.CommonName LIKE ? ORDER BY CommonName";

            $stmt = mysqli_prepare($db, $sql);
            $p1 = $QueryTerm . '%';
            $p2 = '% ' . $QueryTerm . '%';
            mysqli_stmt_bind_param($stmt, "ss", $p1, $p2);
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
                        <p><a href="/cgi-bin/icpn/get_painter_common?'.$SearchTerm.'" class="cta-link">Search the Painter Common Names database &rarr;</a></p>
                      </div>';
            }
        } else {
            echo '<div class="data-section center-text"><p>Invalid search format. Please use letters only.</p></div>';
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
            <h3 id="alpha-title" style="margin-top: 0;">Alphabetical Index to eFlora scientific names</h3>
            <div class="index-bar" style="margin-bottom: 10px;">
            	<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/eflora_index_bar.php'); ?>
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

<!--Horizontal Search Layout: The search field, Submit button, and Reset button are now aligned in a single row on desktop, using the same input-row Flexbox logic as your other pages.-->
<!--Zebra Striping: The results table now utilizes the tr:nth-child(even) CSS we added to jepson-main.css, giving it alternating light blue rows for better line-tracking.-->
<!--Semantic Table: Added <thead> and scope="col" to the result table. This ensures that screen readers correctly announce which column a piece of data belongs to (Scientific Name vs. Common Name).-->
<!--Taxon Formatting: Scientific names in the results and the synonymy notes are wrapped in <i> tags for correct botanical formatting.-->
<!--Touch Targets: The padding on all links and buttons is standardized to ensure they meet the 44x44 pixel minimum target size.-->
<!--Reflow/Mobile Support: The table is wrapped in a .table-responsive container. On narrow screens, the table remains legible through horizontal scrolling rather than squishing the text or breaking the layout.-->
<!--Sanitized Security: I implemented Prepared Statements (mysqli_prepare) for the search query. This prevents SQL injection attacks, which is a critical standard for any search field.-->
<!--Link Cleanup: Fixed the logic for the "Painter Common Names" database link at the end of the script, ensuring it generates a valid URL if no results are found.-->
