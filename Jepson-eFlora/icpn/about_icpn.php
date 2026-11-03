<?php
date_default_timezone_set('America/Los_Angeles');

?>

<!DOCTYPE html>
 
<html lang="en">  

<head>
<title>ICPN About Page</title>

<meta charset="UTF-8">
<meta name="description" content="For vascular plants occurring in wildlands or otherwise outside of cultivation in California, the Jepson eFlora contains taxonomic treatments, distribution maps, illustrations, photographs, and identification keys.">
  <meta name="keywords" content="California Flora, Jepson eFlora, Flora of California, Vascular Plants of California, Jepson Flora Project, ">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="/common/css/dropdowns.css" rel="stylesheet" type="text/css" />

<link href="common/css/jepson_eflora.css" rel="stylesheet" type="text/css" />

<link rel="shortcut icon" href="/common/images/JepsonLogoSmall.png" type="image/x-icon" />

<!--mobile js script files-->
<script src="/common/js/dh_custom.js"></script>

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
<div class="spacer_grey">

<!-- Begin banner -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/header.php'); ?>
<!-- End banner -->



<!DOCTYPE html>
<html lang="en">
<head>
    <title>ICPN About Page - Jepson eFlora</title>
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

<main id="main-content" class="eflora-main">
    
    <!-- PAGE TITLE -->
    <header class="page-title-section">
        <h1>Index to California Plant Names (ICPN)</h1>
        <p class="hero-sub">The nomenclatural resource for California botanical names</p>
    </header>

    <!-- INTRODUCTORY TEXT -->
    <section class="intro-copy">

<p>The Index to California Plant Names (ICPN) includes  over 21,000 names from a variety of sources (e.g., specimens, checklists, floras) that have been applied, correctly or incorrectly, to California plants. 
</p>
<p>The majority of the names presently included in ICPN appeared in The Jepson Manual (1993) as accepted names, names of minor variants, or synonyms; most of the remainder have come into use, or come back into use, correctly or incorrectly since that time. 
</p>
<p>The primary intention of ICPN is to account for names people are likely to encounter and to summarize the status of these names with respect to the Jepson eFlora.
</p>
<p>Jepson Flora Project staff survey the literature for scientific names for plants occurring in California (outside of cultivation) and add those names to ICPN as soon as possible. 
</p>
<p>Decisions whether or not to accept the potential changes to this list are made by the Authors and Editors of the Jepson eFlora. 

<p>Each entry in ICPN includes the scientific name with author citation, the family in which the taxon is included according to classification adopted by the Jepson eFlora.
</p>

<h2>Current Status</h2>
<p></p>
<h2>Source of Report for California
<p>A statement about how or if the name was used in one or more of the various treatments of the flora of California.
</p>
<h23>Editorial Summary</h2>
 
<p><em>Editorial Summary</em> is an attempt to summarize whether the name is or is likely to be accepted or rejected as a name representing a native or naturalized plant in California (i.e., as part of the flora)
</p>
Each <em>Correspondence</em> is given sequentially a number (e.g., Correspondence 1), the date and contributor are indicated, the comments are stored in the database but not actually displayed, and the Editor provides <em>Editorial Comments</em> with the same number (e.g., Editorial Comments 1). Such <em>Editorial Comments</em> include summary and paraphrasing of the contribution, as well as a statement about the effects that the information has or might have on the <em>Editorial Summary and Current Status,</em> which are adjusted (or not) as appropriate.

For example, names with an “Editorial Summary” that reads "addition, for taxon described since TJM" and one that reads "addition, in different genus since TJM" may both have a “Current Status” category of JFP-1, accepted name for taxon native to CA. Conversely, names with the same “Editorial Summary” statements (e.g., "addition, in different genus since TJM") may have different “Current Status” categories (e.g., for Tetraneuris acaulis (Pursh) Greene, JFP-1, accepted name for taxon native to CA)


    <!-- BROWSE & SEARCH SECTION -->
    <section class="data-section">

        <!-- STEP 1: Scientific Name Search -->
        <div class="search-group" style="background: #f0f7ff; border: 1px solid var(--border-gray);">
            <h2>Search by Scientific Name</h2>
            
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


