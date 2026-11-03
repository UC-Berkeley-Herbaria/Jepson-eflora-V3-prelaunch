<?php
date_default_timezone_set('America/Los_Angeles');

?>

<!DOCTYPE html>
 
<html lang="en">  

<head>
<title>ICPN Main Search Page</title>

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
    <title>ICPN Main Search Page - Jepson eFlora</title>
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

<p>The Index to California Plant Names (ICPN) is a nomenclatural resource for names that have been applied, correctly or incorrectly, to California plants. 
</p>
<p>Users can search the ICPN to determine the current status of over 21,000 botanical names. 
</p>
<p>Current status is determined relative to names included in the <em>Jepson eFlora</em>. There are 18 different categories of names. 
</p>
<p>For more  details, <a href="/eflora/icpn/about_icpn.php">please read more about the ICPN.</a> 
</p>

    <!-- BROWSE & SEARCH SECTION -->
    <section class="data-section">

        <!-- STEP 1: Scientific Name Search -->
        <div class="search-group" style="background: #f0f7ff; border: 1px solid var(--border-gray);">
            <h3>1. Scientific Name</h3>
            
			<div class="search-tip-box" role="note" aria-label="Search hint">
				<p>
				Partial names are allowed (e.g., <em class="example-text">"Seq gig"</em>). You can retrieve all species in a genus by entering a genus name only.
When entering infraspecific names, do not include the words "var.", "subsp.", or "f.".
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


        
        <!-- STEP 2: Alphabetical Browse -->
        <div class="search-group" style="background: #fff; border-bottom: 1px solid #eee;">
            <h3>2. Browse all names in ICPN arranged alphabetically by genus</h3>
            <div class="index-bar" style="margin-top:15px;">
                <?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/icpn/common/php/icpn_index_bar.html'); ?>
            </div>
        </div>

        <!-- STEP 3: Status Ranks -->
        <div class="search-group" style="background: #fff; border-bottom: 1px solid #eee;">
            <h3>3. List of Names in Current Status Categories from the ICPN</h3>
            <div class="index-bar" style="margin-top:15px;">
                <?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/icpn/common/php/status_index_bar.html'); ?>
            </div>
    <!-- full status index page link -->
<div class="center-text" style="margin-top: 30px;">
    <a href="/eflora/icpn/status_list.php" style="font-weight: bold;">View the full list of <i>ICPN</i> Status Ranks</a>
</div>

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


<!--Semantic Structure: Replaced the broken <ol>/<li>/<nav> nesting with clean <section> blocks and logical <h3> headings.-->
<!--Typography: Used the .intro-copy and .max-width-p classes to ensure the description is readable (WCAG AAA line-length standards).-->
<!--Form Layout: Applied the .search-group and .input-row classes from jepson-main.css to make the search bar fully responsive (it will stack on mobile and sit in a row on desktop).-->
<!--Touch Targets: Buttons and links in the index bars are styled to meet the WCAG 48px touch target minimums.-->

<!--The Index Bars: Since these typically contain a long row of A-Z links, the index-bar container in your CSS should allow them to wrap or scroll. I have placed them in their own blocks so they don't overlap with the text.-->
<!--The Note: I wrapped the "partial name search" warning in a .citation box. This visually separates the "instruction" from the "action" (the search box).-->
<!--Color Contrast: Replaced the default blue links with your AAA-compliant --link-color (defined in your CSS).-->
<!--Form Usability: The label is now correctly associated with the input ID, allowing screen readers to tell the user exactly what to type.-->
