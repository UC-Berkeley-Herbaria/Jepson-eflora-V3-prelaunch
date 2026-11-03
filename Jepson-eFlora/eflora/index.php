

<!DOCTYPE html>
 
<html lang="en">  
<head>

<title>Jepson eFlora Main Page, California Flora</title> 
<meta charset="UTF-8">
<meta name="description" content="The Jepson eFlora is the foremost authority on the native and naturalized vascular plants of California. For plants occurring in wildlands or otherwise outside of cultivation, the Jepson eFlora contains taxonomic treatments, distribution maps, illustrations, photographs, and identification keys."  />
	<meta name="keywords" content="Jepson eFlora, Jepson Flora Project, California Flora, Flora of California, Vascular Plants of California">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="common/css/jepson-main.css" rel="stylesheet" type="text/css">
	<link href="common/css/eflora-header.css" rel="stylesheet" type="text/css">

	<link rel="shortcut icon" href="common/images/JepsonLogoSmall.png" type="image/x-icon">

<!-- Google tag (gtag.js) -->
<script async src="//www.googletagmanager.com/gtag/js?id=G-T5YC99QF6Q"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-T5YC99QF6Q');
</script>
</head>

<body>

<!-- Begin banner -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/eflora-header.php'); ?>  
<!-- End banner -->

<main>

<!-- Hero Banner -->
	<section class="eflora-hero" aria-labelledby="hero-title">
	    <!-- Hidden title for Screen Readers (AAA Accessibility) -->
	    <h1 id="hero-title" class="visually-hidden">The Jepson eFlora - Provided by the Jepson Herbarium, UC Berkeley</h1>
    
	    <div class="hero-container">
	        <img src="common/images/Front-page-banner.png" 
	             alt="The Jepson eFlora, Provided by the Jepson Herbarium, UC Berkeley" 
	             class="hero-graphic">
	    </div>
	</section>

    <!-- Main Content Container -->
    <main class="eflora-main">
        
        <!-- Intro Text -->
        <article class="intro-copy">
            <p>The Jepson eFlora is the foremost authority on the native and naturalized vascular plants of California. For plants occurring in wildlands or otherwise outside of cultivation, the Jepson eFlora contains taxonomic treatments, distribution maps, illustrations, photographs, and identification keys.</p>
            <p>The eFlora is revised annually. For a list of revisions since the printed second edition of The Jepson Manual: Vascular Plants of California (2012), see <a href="supplement_summary.php">Revisions 1-14 (2013-2026)</a>. Minor changes not included in the revisions can be found on the <a href="errata.php">Errata page</a>.</p>
            <p>The Jepson eFlora is a collaborative effort involving the Jepson Herbarium editors, the editorial board, taxonomic authors from around the world, and community members. Generous support is provided by the Friends of the Jepson Herbarium; special thanks to our Lifetime and Sustaining Members.</p>
        </article>

        <!-- Search & Identification Section -->
        <section class="search-id-block">
            <h3>Identification Keys & Search Names</h3>
            <div class="search-layout">
                <div class="search-forms">
                    <p class="search-label">Search for:</p>
                    

                    <div class="search-group">
							<form action="search_eflora.php" method="GET">
								<label for="name" class="visually-hidden">• Scientific Name</label>
								<input type="text" placeholder="Enter a scientific name..." id="name" name="name">
								<!-- Explicitly define the types -->
								<button type="submit" class="btn btn-submit">Submit Name</button>
								<button type="reset" class="btn btn-reset">Reset</button>
							</form>
                    </div>


                    <div class="search-group">
							<form action="search_common.php" method="GET">
								<label for="cn" class="visually-hidden">• Common Name</label>
								<input type="text" placeholder="Enter a common name..." id="cn" name="cn">
								<!-- Explicitly define the types -->
								<button type="submit" class="btn btn-submit">Submit Name</button>
								<button type="reset" class="btn btn-reset">Reset</button>
							</form>
                    </div>


                    <ul class="quick-links">
                        <li>Don't know what your plant is? Start with the 
                        Family Key link below or search the Jepson eFlora by entering a scientific or common name 
                        in the above search boxes.</li>
                        <li><a href="keys/IJM_fam_key.php">Key to families</a></li>
                        <li><a href="toc.php">List of families and genera</a></li>
                        <li><?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/front_page_index_bar.php'); ?></li>
                    </ul>
                </div>

                <div class="image-gallery">
                    <img src="common/images/TJM2.jpg" alt="Plant identification 1">
                    <img src="common/images/TJM2.jpg" alt="Plant identification 2">
                    <img src="common/images/TJM2.jpg" alt="Plant identification 3">
                    <img src="common/images/TJM2.jpg" alt="Manual Cover">
                </div>
            </div>
        </section>

        <hr class="section-divider">

<!-- ROW: Geography -->
<section class="geography-row-section">
    <div class="row-container center-text">
        <h3>Geography</h3>
        <p class="max-width-p">The Jepson bioregions provide an eco-geographic context for biodiversity that can aid in plant identification. The geographic system used in the Jepson eFlora combines features of natural landscapes and biota to delimit the geographic units. The bioregions reflect broad patterns of natural vegetation, geology, topography and climate.</p>
        
        <p><strong>What are the geographic subdivisions of California?</strong></p>
        
        <div class="map-feature">
            <a href="geography.php" aria-label="Explore California Bioregions Map">
                <img src="common/images/Bioregions.png" alt="Map of California Floristic Provinces and Bioregions">
            </a>
        </div>
    </div>
</section>

<!-- ROW: Keys Informed by Geography (KeyBase) -->
<section class="kb-row-section">
    <div class="row-container">
        <h3 class="center-text">Keys Informed by Geography</h3>
        <div class="kb-card">
            <a href="filter_keys.php" 
               aria-label="Access KeyBase Filter Keys">
                <img src="common/images/KeyBase-Logo.png" 
                     alt="KeyBase: Taxonomic key system logo">
            </a>
            <p>Keybase filter keys will be restored in a future update.</p>
        </div>
    </div>
</section>

<hr class="section-divider">



<!-- Tools Icon Section -->
<section class="tools-container" aria-label="Jepson eFlora Resources and Tools">
    <div class="tool-card">
        <a href="https://herbaria.berkeley.edu/floras/jepson-eflora/jepson-eflora-glossary/" aria-label="Open the Botanical Glossary">
            <div class="tool-image-wrapper">
                <img src="common/images/Glossary.png" alt="Close-up of a yellow flowering branch representing the Glossary">
            </div>
            <h4>Glossary</h4>
        </a>
    </div>

    <div class="tool-card">
        <a href="/eflora/tools/" aria-label="Open Jepson eFlora Tools">
            <div class="tool-image-wrapper">
                <img src="common/images/Jepson-eFlora-Tools.png" alt="Yellow and blue wildflowers representing eFlora Tools">
            </div>
            <h4>Jepson eFlora Tools</h4>
        </a>
    </div>

    <div class="tool-card">
        <a href="https://herbaria.berkeley.edu/floras/jepson-eflora/jepson-eflora-conventions/" aria-label="Open User's Guide">
            <div class="tool-image-wrapper">
                <img src="common/images/Users-Guide.png" alt="Researcher in a field of wildflowers representing the User's Guide">
            </div>
            <h4>User's Guide</h4>
        </a>
    </div>
</section>

        <!-- Project Info -->
        <footer class="project-info">
            <h3>The Jepson Flora Project</h3>
            <p>The Jepson eFlora is a product of the Jepson Flora Project. The Project brings together all of the floristic references and data of the Jepson Herbarium. 
            Resources of the Flora Project are directly linked to the Consortium of California Herbaria, CalPhotos, the California Native Plant Society, 
            California Exotic Pest Plant Council and many other external sites. The Friends of the Jepson Herbarium help the Jepson Flora project carry out its work. Visit our 
            <a href="https://herbaria.berkeley.edu/floras/jepson-eflora/jepson-eflora-staff-and-editors/">staff page</a> for more information about our editorial board and staff.</p>
            <p class="citation">Citation: Jepson Flora Project (eds.) <?php echo date("Y")?>. <i>Jepson eFlora</i>, <a href="/eflora/">https://herbariadb.berkeley.edu/eflora/</a> [Accessed <?php echo date ("M d, Y") ?>]</p>

<p>
<a class="googleForm" href="https://docs.google.com/forms/d/e/1FAIpQLSc_wrQXqB9gNPrOgUTZ9WN38Ub08JlmgaIha7Ua99sHGzMntA/viewform">
	Send us your feedback and/or questions! Community input helps improve the Jepson eFlora.
	
</a>
</p>

        </footer>
    </main>

    <!-- Social & Copyright Footer -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/eflora-footer.php'); ?>
<!-- End footer -->

</body>
</html>

<!--Color Contrast on Map/Icons: Ensure the text inside images (like the Map) is large enough to be read or provided in a text table below the image.-->
<!--Google Forms Link: I added googleForm class to your feedback link to make it look more like a button, which helps it stand out as a clear call to action.-->
<!--Why this meets AAA Readability:-->
<!--Font Size: 18px (1.125rem) is the high-visibility threshold.-->
<!--Line Height: 1.65 ensures that people with dyslexia or visual tracking issues can follow lines of text more easily.-->
<!--High Contrast: Every color used (Berkeley Blue, Black, Dark Gray) provides at least a 7:1 contrast ratio against a white background.-->
<!--Touch Targets: Every button and link has been padded so that a user with limited dexterity can click them without error.-->
