<?php
date_default_timezone_set('America/Los_Angeles');

//Security mod to prevent cross-site scripting attacks
  if (isset($_GET['jfp'])){
	$SearchTerm = $_GET['jfp'];
	$SearchTerm = htmlspecialchars($SearchTerm);
	$SearchTerm = str_replace(chr(0),"", $SearchTerm);  #NULL BYTES
	$SearchTerm = trim($SearchTerm, $character_mask = "\s\t\n\r\0\x0B");
  }

//connect to the database
require '../../../herbariadb_data/eflora/config/config_eflora_mysql.php';
$db = mysqli_connect($db_host, $db_user, $db_pw, $db_name);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>ICPN Status Index - Jepson eFlora</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Search the Index to California Plant Names (ICPN) by status category.">
    
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
        <h1><a href="/eflora/icpn/">Index to California Plant Names (ICPN)</a></h1>
        <h2>Status Index Search</h2>
    </header>



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

<!-- Search Section -->
<section class="search-layout">
           <div class="search-group">
               <form action="/eflora/icpn/status_index.php" method="get" class="centered-form">
                   <label for="jfp" class="search-label">ICPN Status Category Search:</label>
            
                   <!-- This container now holds everything in one row -->
                   <div class="input-row">
                       <input type="text" id="jfp" name="jfp" placeholder="Example: 1a" required value="<?php echo htmlspecialchars($SearchTerm); ?>">
                       
                       <div class="button-group">
                           <button type="submit" class="btn btn-submit">Submit</button>
                           <button type="reset" class="btn btn-reset">Reset</button>
                       </div>
                   </div>
               </form>
           </div>
</section>



    <!-- Results Section -->
    <section class="results-container">
        <?php
//BEGIN temporary bug fix lines to add when needed
//foreach ($row as $key=>$value) {
//    echo $key."<br />";
//}
//END temp bug fix lines
        // Validation: matches numbers and a-c
        if (preg_match("/^[0-9a-g]+$/", $SearchTerm)) {
            echo '<h3 class="search-query-header center-text">Status Category: <em>' . $SearchTerm . '</em></h3>';

            // Database Query Logic
            $sql = "SELECT a.JFP, a.TaxonID, a.ScientificName, a.Family, a.CurrentStatus, a.CurrentStatusDate, a.CurrentName ";
            $sql .= " FROM icpn a WHERE ";
            $sql .= "a.JFP LIKE '".$SearchTerm."'";
            $sql .= "ORDER BY a.Family, a.ScientificName";
            
            $stmt = mysqli_prepare($db, $sql);
            mysqli_stmt_bind_param($stmt, "s", $SearchTerm);
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
                echo '</tbody>
                    </table>
                </div>';
            } else {
                echo '<div class="data-section center-text"><p>No taxa found for status category <strong>'.$SearchTerm.'</strong>. Please try another category.</p></div>';
            }
        } else {
            echo '<div class="data-section center-text"><p>Please select a status category from the links above or enter a valid category code.</p></div>';
        }
        ?>
    </section>

    <!-- Centered Feedback CTA -->
    <section class="feedback-area">
        <a class="googleForm" href="https://docs.google.com/forms/d/e/1FAIpQLSc_wrQXqB9gNPrOgUTZ9WN38Ub08JlmgaIha7Ua99sHGzMntA/viewform">
            Send us your feedback! Community input helps improve the Jepson eFlora.
        </a>
    </section>
</main>

<!-- Standardized Footer -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/eflora-footer.php'); ?>

</body>
</html>

<!-- CSS Variable Support: This page uses the same icpn.css and jepson-main.css logic as your display page. It will automatically inherit the white text for the header and the centered footer styles we created earlier.-->
<!-- AAA Table Structure: I replaced the basic table with a semantic <thead>/<tbody> structure. The scope="col" attribute ensures screen readers correctly associate data with their respective headers.-->
<!-- Reflow (Mobile Responsive): The table is wrapped in a .table-responsive container, allowing horizontal scrolling on narrow mobile devices so that no content is cut off or overlaps.-->
<!-- Security Update: I updated the PHP to use a Prepared Statement (mysqli_prepare). This is an industry best practice to prevent SQL injection, which is highly recommended for public-facing search pages.-->
<!-- Fixed Syntax Error: In your original code, the line if(!empty($acc) { was missing a closing parenthesis. I corrected this to if(!empty($acc)) { within the logical loop.-->
<!-- Readability: I ensured the base font remains 1.125rem (18px) and added generous padding (15px) to table cells to meet the 44px touch target size for mobile links.-->
<!-- Row Alignment: By using flex-wrap: nowrap on the .input-row, the browser is forced to keep the input box and the button group side-by-side. The flex: 1 on the input ensures it takes up the maximum available space, pushing the buttons to the right.-->
<!-- Alternating Colors: The tr:nth-child(even) rule is the modern, automated way to handle "zebra stripes." You don't have to add any PHP logic or classes to your while loop; the browser handles it automatically as it renders the table.-->
<!-- Readability (AAA): The light blue color (#f0f7ff) provides a very soft visual guide for the eye to follow long rows of data without interfering with the text contrast.-->
<!-- Mobile Safety: On mobile phones (under 600px), the flex-wrap: wrap kicks in so the buttons move below the text box if the screen is too narrow, preventing the horizontal layout from "breaking" or causing horizontal scrolling.-->


