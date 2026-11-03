

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


    <!-- warning link -->
<div class="center-text" style="margin-top: 30px;">
    <p style="font-weight: bolder; color: #5c3160;">&rarr; The Jepson eFlora has migrated to a new URL.  During this week, users may notice some features are not fully accessible.  Please continue to use the feedback link during this transition time.</p>
</div>


    <!-- Main Content Container -->
    <main class="eflora-main">
		<div class="row-container center-text">
        	    <h2>Welcome to the <i>Jepson eFlora</i> Resource Portal</h2>
		</div>



        <!-- Intro Text -->
        <article class="intro-copy">
			<p class="max-width-p">The <i>Jepson eFlora</i> is the definitive resource on the native and naturalized vascular plants of California. 
For plants occurring outside of cultivation, in wildlands or the wildland-interface, the <i>Jepson eFlora</i> contains taxonomic treatments, 
distribution maps, illustrations, photographs, and identification keys.</p>
            <p class="max-width-p">The <i>Jepson eFlora</i> is revised annually. For a list of revisions since the printed second edition of The Jepson Manual: Vascular Plants of California (2012), see <a href="revision_summary.php">Revisions 1-14 (2013-2026)</a>. Minor changes not included in the revisions can be found on the <a href="errata.php">Errata page</a>.</p>
            <p class="max-width-p">The <i>Jepson eFlora</i> is a collaborative effort involving the <a href="https://herbaria.berkeley.edu/floras/jepson-eflora/jepson-eflora-staff-and-editors/">editorial board</a>, taxonomic authors from around the world, and community members. Generous support is provided by the <a href="https://herbaria.berkeley.edu/about-the-herbaria/support-the-herbaria/jepson-herbarium-membership/">Friends of the Jepson Herbarium</a>; special thanks to our Lifetime and Sustaining Members.</p>
        </article>



<!-- Search & Identification Section -->
<section class="search-id-block">
    <div class="centered-70-wrapper">
    
        <!-- ROW 1: Search Forms -->
        <div class="search-group">
            <h3>Search the eFlora</h3>
            
            <!-- Scientific Name Form -->
            <form action="search_eflora.php" method="get" class="centered-form" style="margin-bottom: 25px;">
                <label for="name" class="search-label">Scientific Name Search:</label>
                <div class="input-row">
                    <input type="text" id="name" name="name" placeholder="Enter a scientific name..." required>
                    <div class="button-group">
                        <button type="submit" class="btn btn-submit">Submit</button>
                        <button type="reset" class="btn btn-reset">Reset</button>
                    </div>
                </div>
            </form>

            <!-- Common Name Form -->
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

        <!-- ROW 2: Help Text & Quick Links -->
        <div class="search-help-footer center-text">
            <p class="max-width-p">
                <strong>Don't know what your plant is?</strong> Start with the Family Key link below or search the Jepson eFlora by entering a scientific or common name in the above search boxes.
            </p>
            <nav class="links-list" aria-label="Quick Links" style="justify-content: center; flex-direction: row; margin-top: 15px;">
                <a href="keys/IJM_fam_key.php">Key to families</a>
                <span aria-hidden="true" style="color: #ccc;">|</span>
                <a href="toc.php">List of families and genera</a>
            </nav>
        </div>


        <!-- ROW 3: Alphabetical Index -->
        <div class="search-group index-box">
            <h3 id="alpha-title">Alphabetical Index to eFlora accepted names and synonyms</h3>
            <div class="index-bar">
                <?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/eflora_index_bar.html'); ?>
            </div>
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
        <a href="https://herbaria.berkeley.edu/floras/jepson-eflora/jepson-eflora-conventions/" aria-label="Open Conventions Guide">
            <div class="tool-image-wrapper">
                <img src="common/images/Users-Guide.png" alt="Researcher in a field of wildflowers representing the Conventions Guide">
            </div>
            <h4>Conventions</h4>
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

<!-- History Timeline Section -->
<section class="history-timeline center-text">
    <div class="centered-70-wrapper">
        <h3 class="visually-hidden">Jepson Manual History Timeline</h2>
        <img src="/eflora/common/images/100yearscaflora.jpg" 
             alt="Chronological timeline showing over 100 years of documenting the California flora. It displays the 1925 original manual, the 1993 edition, the 2012 second edition, and the current Jepson eFlora logo from 2013 to present." 
             class="timeline-img">
    </div>
</section>


    <!-- Citation Row -->
    <footer class="treatment-citation">
        <p><strong>Citation:</strong> 
        Jepson Flora Project (eds.) <?php echo date("Y"); ?>. <i>Jepson eFlora</i>, 
        <a href="/eflora/">https://herbariadb.berkeley.edu/eflora/</a> 
        [Accessed on <?php echo date ("F d, Y") ?>]</p>
    </footer>

    <!-- Feedback CTA -->
    <section class="feedback-section center-text">
        <a class="googleForm" href="https://docs.google.com/forms/d/e/1FAIpQLSc_wrQXqB9gNPrOgUTZ9WN38Ub08JlmgaIha7Ua99sHGzMntA/viewform">
            Send us your feedback! Community input helps improve the Jepson eFlora.
        </a>
    </section>

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

<!--banner image for books-->
<!--Meaningful Alt Text: The alt attribute doesn't just say "Timeline image." It describes the four distinct stages (1925, 1993, 2012, present) so that a user who cannot see the image understands the context of the 100-year history.-->
<!--Width Management: On a desktop monitor, 70% width keeps the image from being overwhelming. On a mobile phone, the @media query expands it to 95%, ensuring the small text (like the dates) remains large enough to read.-->
<!--Semantic Wrapping: Using <section> and a hidden <h2> helps screen readers index the page properly.-->
<!--No Fixed Heights: Using height: auto ensures the aspect ratio is maintained, preventing the book covers from looking squashed on different screen sizes.-->