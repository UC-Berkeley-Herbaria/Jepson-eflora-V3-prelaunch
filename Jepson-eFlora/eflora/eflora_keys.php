<?php

date_default_timezone_set('America/Los_Angeles');

//Security mod to prevent cross-site scripting attacks
//Security mod to prevent cross-site scripting attacks
  if (isset($_GET['key'])){

	$TaxonID = htmlspecialchars($_GET['key']);
	$TaxonID = str_replace(chr(0),"", $TaxonID);  #NULL BYTES
	$TaxonID = trim($TaxonID, $character_mask = " \t\n\r\0\x0B");
  }

//connect to the database
require '../../herbariadb_data/eflora/config/config_eflora_mysql.php';
$db = mysqli_connect($db_host, $db_user, $db_pw, $db_name);


//$SearchTerm must be a single capital letter
	if (preg_match("/^[0-9]+$/", $TaxonID)) {
//perform a search that returns the key that has that taxon ID

		$sql = "SELECT * ";
		$sql.= " FROM eflora_keys";
		$sql.= " WHERE TaxonID='".$TaxonID."'";

//BEGIN temporary bug fix lines to add when needed
//echo '<br />'.$sql.'<br />';

		if(!mysqli_query($db, $sql)){
			die('Error: ' . mysqli_error($db));
		}


		$result = mysqli_query($db, $sql);
		
		// Check if any rows were returned
		if (mysqli_num_rows($result) > 0) {
		// If rows exist, loop through them
			while ($row = mysqli_fetch_array($result)) {

//BEGIN temporary bug fix lines to add when needed
//foreach ($row as $key=>$value) {
//    echo $key."<br />";
//}
//END temp bug fix lines, ScientificName, HasKey, KeyText
				if (!empty($row['ScientificName'])){
					$SciName = $row['ScientificName'];
				}
				else{
					$SciName = null;
				}

				if (!empty($row['Title'])){
					$Title = $row['Title'];
				}
				else{
					$Title = null;
				}


				if (!empty($row['TaxonID'])){
					$TID = $row['TaxonID'];
				}
				else{
					$TID = null;
				}

				if (!empty($row['HasKey'])){
					$has_key = $row['HasKey'];
				} else{
					$has_key = null;
				}

				if (!empty($row['KeyText'])){
					$FormattedKey = $row['KeyText'];
				} else{
					$FormattedKey = null;
				}

//var_dump($row); 
/*var_dump prints the whole row in a databased format
which is useful for seeing what you're getting
but is pretty ugly
*/
			}
		}
	}
	
//Before doing anything, if the TID isn't recognized, give a plain error screen
if (!$TID){ //if TaxonID (pulled from URL) did not match a line in the database...
  echo "A key does not exits for this TID=".$TaxonID;

exit();
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <?php 
    // Prepare a clean name for the <title> tag
    $plainName = strip_tags($SciName); 
    ?>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $plainName; ?> key to species, Jepson eFlora</title>
    <title>Jepson eFlora: Geographic Subdivisions</title>
    <meta name="description" content="Geographic subdivisions of California for the Jepson eFlora.">

    
    <!-- CSS Standardized -->
    <link href="/eflora/common/css/eflora-header.css" rel="stylesheet" type="text/css">
    <link href="/eflora/common/css/jepson-main.css" rel="stylesheet" type="text/css">
    <link href="/eflora/common/css/eflora.css" rel="stylesheet" type="text/css">

    <link rel="shortcut icon" href="/eflora/common/images/JepsonLogoSmall.png" type="image/x-icon" />

<!--mobile js script files-->
<script src="common/js/dh_custom.js"></script>


    <!-- Google Tag -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-T5YC99QF6Q"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());
      gtag('config', 'G-T5YC99QF6Q');
    </script>
</head>

<body>

    <!-- ACCESSIBILITY: Skip to Content Link -->
    <a href="#main-content" class="visually-hidden">Skip to main content</a>

<!-- Header -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/eflora-header.php'); ?>  


    <main id="main-content" class="eflora-main">
        
        
        <section class="intro-copy">
            <h1>Jepson eFlora Key page for <?php echo $plainName; ?></h1>

            <!-- Key Navigation Links -->
            <nav class="search-group" aria-label="Key Navigation" style="background: #f8f9fa; border: 1px solid #ddd; padding: 20px; margin-top: 30px;">
		       <p style="margin-bottom: 10px; font-weight: bold; color: var(--berkeley-blue);">Vascular Plants of California</p>
                <div style="display: flex; gap: 20px; flex-wrap: wrap; border-bottom: 2px solid var(--berkeley-blue); padding-bottom: 20px;">
                    <a href="/eflora/keys/IJM_fam_key.php">Key to families</a>
                    <span aria-hidden="true" style="color: #ccc;">|</span>
                    <a href="/eflora/toc.php">Table of families and genera</a><span aria-hidden="true" style="color: #ccc;">|</span>
                    <a href="/eflora/" style="font-weight: bold;">Return to <i>Jepson eFlora</i> Resource Portal</a>
                </div>
		          <div class="search-centered-container" style="padding-top: 20px;">
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
            </nav>
        </section>

        <!-- MAIN KEY CONTENT -->
        <section class="data-section">
            <?php 
            $pattern = '/aceae$/';

            if(!empty($FormattedKey)): 
            ?>
                <h2 style="border-bottom: 2px solid var(--berkeley-blue); padding-bottom: 10px;">
                    <?php echo $Title; ?>
                </h2>

			<?php if (stripos($SciName, ' Group ') === false): ?>
                <div style="margin: 20px 0;">
                    <a href="/eflora/eflora_display.php?tid=<?php echo $TID; ?>" style="font-size: 1.25rem; font-weight: bold;">
                        View taxon page for <?php echo $SciName; ?>
                    </a>
                </div>

                <?php if (!preg_match($pattern, $SciName)): ?>
                    <p class="bodyTextBlack">(For a list of taxa in <i><?php echo $SciName; ?></i>, use the above link.)</p>
                <?php endif; ?>

			<?php endif; ?>


                <!-- Glossary Usage Instructions -->
                <div class="citation" style="margin: 30px 0; background-color: #f0f7ff;">
                    <p><strong>Glossary:</strong> Jepson Manual glossary definitions can be seen by moving your cursor over words underlined with dots.</p>
                </div>

                <!-- The Formatted Key Output -->
                <div class="key-content-wrapper">
                    <?php echo $FormattedKey; ?>
                </div>

            <?php endif; ?>
        </section>


    <!-- Feedback Area -->
    <section class="feedback-area center-text">
        <a class="googleForm" href="https://docs.google.com/forms/d/e/1FAIpQLSc_wrQXqB9gNPrOgUTZ9WN38Ub08JlmgaIha7Ua99sHGzMntA/viewform">
            Send us your feedback! Community input helps improve the Jepson eFlora.
        </a>
    </section>

    <!-- FOOTER SECTION -->
    <!-- CITATION -->
    <footer class="treatment-citation" style="margin-top:40px; padding: 20px; background: #eee; border-left: 5px solid var(--ef-blue);">
        <p><strong>Citation:</strong> Jepson Flora Project (eds.) <?php echo date("Y"); ?>, <i><?php echo $ScientificName; ?></i>, in <em>Jepson eFlora</em>, accessed on <?php echo date("F d, Y"); ?>.</p>
    </footer>

</main>

<!-- Footer -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/eflora-footer.php'); ?>

</body>
</html>

<!--Skip Link: Added <a href="#main-content"> which is essential for keyboard users to bypass the long header.-->
<!--Corrected Link Syntax: Fixed the original code where an <h3> was placed inside an <a>. In modern HTML, links should be styled to look like headings rather than nesting heading tags inside links for better SEO and accessibility.-->
<!--Aria-Hidden: Added aria-hidden="true" to the pipe (|) separator. This prevents screen readers from announcing "Vertical Bar" between every navigation link.-->
<!--Mobile Navigation: Integrated the hamburger menu code from your header CSS so the blue navigation bar works correctly on phones.-->
<!--Scientific Notation: Used <i> tags for scientific names throughout the logic.-->