

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
    <section class="eflora-hero">
        <div class="hero-overlay">
            <h2>The Jepson eFlora</h2>
            <p class="hero-sub">Provided by the Jepson Herbarium</p>

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
                        <label>• Scientific Name</label>
                        <div class="input-row">

							<form action="search_eflora.php" method="get">
								<input type="text" id="name" name="name" placeholder="Enter a scientific name..." required>
                            	<button class="btn btn-submit">Submit Name</button>
                            	<button class="btn btn-reset">Reset</button>
							</form>
                        </div>
                    </div>

                    <div class="search-group">
						<label>• Common Name</label>
							<div class="input-row">
								<form action="search_common.php" method="GET">
								<input type="text"  placeholder="Enter a common name..." id="cn" name="cn"></input>
                            	<button class="btn btn-submit">Submit Name</button>
                            	<button class="btn btn-reset">Reset</button>
							
								</form>
							</div>
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

        <!-- Geography Section -->
        <section class="geography-grid">
            <div class="geo-info">
                <h3>Geography</h3>
                <p>The Jepson bioregions provide an eco-geographic context for biodiversity that can aid in plant identification. 
                The geographic system used in the Jepson eFlora combines features of natural landscapes and biota to delimit the geographic units. 
                The bioregions reflect broad patterns of natural vegetation, geology, topography and climate.</p>
                <div class="map-feature">
                    <a href="https://herbariadb.berkeley.edu/eflora/geography.php" class="efloradb-nav-link"><img src="common/images/exploded_map.png" alt="California Bioregions Map"></a>
                    <p><strong>What are the geographic subdivisions of California?</strong></p>
                </div>
            </div>
            
            <div class="keybase-feature">
                <div class="kb-card">
                    <a href="https://herbariadb.berkeley.edu/eflora/filter_keys.php" class="efloradb-nav-link"><img src="common/images/KeyBase.png" alt="KeyBase Logo"></a>
                    <p>Keybase filter keys will be restore in a future update</p>
                    <!--<p>Use the Jepson Bioregions to narrow the number of taxa included in a taxonomic key.</p>-->
                </div>
            </div>
        </section>

        <hr class="section-divider">

        <!-- Tools Icon Section -->
        <section class="tools-container">
            <div class="tool-card">
                <a href="https://herbaria.berkeley.edu/floras/jepson-eflora/jepson-eflora-glossary/"><img src="Glossary.png" alt="Glossary"></a>
                <h4>Glossary</h4>
            </div>
            <div class="tool-card">
                <a href="/eflora/tools/"><img src="icon-tools.png" alt="Tools"></a>
                <h4>Jepson eFlora Tools</h4>
            </div>
            <div class="tool-card">
                <a href="https://herbaria.berkeley.edu/floras/jepson-eflora/jepson-eflora-conventions/"><img src="Users-Guide.png" alt="User Guide"></a>
                <h4>User's Guide</h4>
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
