<?php
date_default_timezone_set('America/Los_Angeles');

//Security mod to prevent cross-site scripting attacks
  if (isset($_GET['index'])){
	$SearchTerm = $_GET['index'];
	$SearchTerm = htmlspecialchars($SearchTerm);
	$SearchTerm = str_replace(chr(0),"", $SearchTerm);  #NULL BYTES
	$SearchTerm = trim($SearchTerm, $character_mask = "\s\t\n\r\0\x0B");
	//$SearchTerm = preg_replace("/[^0-9]/", "", $SearchTerm);
  }

//connect to the database
require '../../../herbariadb_data/eflora/config/config_eflora_mysql.php';
$db = mysqli_connect($db_host, $db_user, $db_pw, $db_name);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>ICPN Index Search Page- Jepson eFlora</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Browse the Index to California Plant Names (ICPN) alphabetically by scientific name.">
    
    <!-- Standardized CSS Links -->
    <link href="/eflora/common/css/eflora-header.css" rel="stylesheet" type="text/css">
    <link href="/eflora/common/css/jepson-main.css" rel="stylesheet" type="text/css">
    <link href="common/css/icpn.css" rel="stylesheet" type="text/css" />

    <link rel="shortcut icon" href="/eflora/common/images/JepsonLogoSmall.png" type="image/x-icon" />

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

<!-- Standardized Header -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/eflora-header.php'); ?>  

<main class="eflora-main">
    <header class="page-title-section">
        <h1>Index to California Plant Names (ICPN) Index Search Page</h1>
    </header>

    <!-- return home link -->
<div class="center-text" style="margin-top: 30px;">
    <a href="/eflora/icpn/" style="font-weight: bold;">&larr; Return to the <i>ICPN</i> Search Page</a>
</div>

    <!-- Navigation & Search Section -->
    <nav class="icpn-nav-block" aria-label="ICPN Navigation">        
        <div class="search-centered-container">
            <!-- Name Search Form -->
            <div class="search-group">
                <form action="/eflora/search_icpn.php" method="get" class="centered-form">
                    <label for="icpn" class="search-label">ICPN Scientific Name Search:</label>
                    <div class="input-row">
                        <input type="text" id="icpn" name="icpn" placeholder="Enter a scientific name..." required>
                        <div class="button-group">
                            <button type="submit" class="btn btn-submit">Submit</button>
                            <button type="reset" class="btn btn-reset">Reset</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </nav>

    <!-- Results Section -->
    <section class="results-container">
        <?php
        // Validation: SearchTerm must be a single capital letter for the Alphabetical Index
        if (preg_match("/^[A-Z]$/", $SearchTerm)) {
            echo '<h2 class="search-query-header center-text">Alphabetical Index Search: <em>' . $SearchTerm . '</em></h2>';

            // Database Query Logic
            $sql = "SELECT a.TaxonID, a.ScientificName, a.Family, a.CurrentStatus, a.CurrentStatusDate, a.CurrentName ";
            $sql .= " FROM icpn a WHERE a.ScientificName LIKE ? ORDER BY a.Family, a.ScientificName";
            
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
                            <th scope="col">Family</th>
                            <th scope="col">Scientific Name</th>
                            <th scope="col">Status</th>
                            <th scope="col">Status Date</th>
                            <th scope="col">Accepted Name</th>
                        </tr>
                    </thead>
                    <tbody>';

                while ($row = mysqli_fetch_assoc($result)) {
                    $acc_name = (!empty($row['CurrentName'])) ? $row['CurrentName'] : '<em>Accepted</em>';
                    
                    echo '<tr>';
                    echo '<td>' . $row['Family'] . '</td>';
                    echo '<td><a href="/eflora/icpn/icpn_display.php?tid='.$row['TaxonID'].'">' . $row['ScientificName'] . '</a></td>';
                    echo '<td>' . $row['CurrentStatus'] . '</td>';
                    echo '<td>' . $row['CurrentStatusDate'] . '</td>';
                    echo '<td>' . $acc_name . '</td>';
                    echo '</tr>';
                }
                echo '</tbody></table></div>';
            } else {
                echo '<div class="data-section center-text"><p>No names starting with "<strong>'.$SearchTerm.'</strong>" were found. Please try another letter.</p></div>';
            }
        } else {
            echo '<div class="data-section center-text"><p>Please select a letter from the Alphabetical Index links above.</p></div>';
        }
        ?>
    </section>

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
</main>

<!-- Standardized Footer -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/eflora-footer.php'); ?>

</body>
</html>


<!-- Form Layout: The search input and buttons now sit in a single horizontal row on desktop using the input-row flexbox container, matching your status_index layout. -->
<!-- Zebra Striping: By using the shared icpn.css, the table will automatically render with the light blue alternating rows (nth-child(even)). -->

<!-- Removed a redundant/conflicting SQL block from your original file that was attempting to query eflora_synonymy and icpn simultaneously. -->
<!-- Fixed the missing parenthesis in the if(!empty($acc)) statement. -->
<!-- Security: Implemented Prepared Statements (mysqli_stmt_bind_param) to protect against SQL injection. -->
<!-- AAA Compliance: -->
<!-- Added scope="col" to <th> tags for screen reader compatibility. -->
<!-- Added a visually-hidden label helper for the search field. -->
<!-- Ensured all links meet the 44px touch target minimum via the shared CSS padding rules. -->
<!-- Responsive Table: The table-responsive wrapper ensures that users on mobile devices can swipe to see all five columns of data without breaking the page layout. -->
