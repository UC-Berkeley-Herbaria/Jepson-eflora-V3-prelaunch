
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Filter Keys, Jepson eFlora</title>
    <meta name="description" content="Information regarding Filtered Keys and KeyBase integration for the Jepson eFlora.">
<meta name="description" content="For vascular plants occurring in wildlands or otherwise outside of cultivation in California, the Jepson eFlora contains taxonomic treatments, distribution maps, illustrations, photographs, and identification keys.">
  <meta name="keywords" content="California Flora, Jepson eFlora, Flora of California, Vascular Plants of California, Jepson Flora Project, ">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
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

   <header class="page-title-section">
        <h1>Jepson eFlora Filtered Keys using KeyBase</h1>
    </header>

    <!-- return home link -->
<div class="center-text" style="margin-top: 30px;">
    <a href="/eflora/" style="font-weight: bold;">&larr; Return to the <i>Jepson eFlora</i> Resource Portal</a>
</div>

        <!-- ALERT: Server Status -->
<!--        <div class="citation" style="border-left: 5px solid #d32f2f; background-color: #fff4f4; margin: 20px 0;">
<!--            <p style="color: #b71c1c;"><strong>Critical Note:</strong> The server supporting KeyBase was attacked in late 2021. UCJEPS was undergoing a major update at the time. While an archived version was restored, secure updates are currently disabled.</p>-->
<!--            <p style="color: #b71c1c; margin-top:10px;"><strong>Taxonomic Status:</strong> This version does not include new taxa or name changes from eFlora Revisions 10 through 13. Keys for unchanged taxa remain usable.</p>-->
<!--        </div>-->


<!--        <p class="bodyTextBlack">-->
<!--            <a href="https://keybase.rbg.vic.gov.au">KeyBase</a> is a dichotomous key platform hosted by Royal Botanical Gardens, Victoria. It allows you to "filter" keys with a regional checklist, automatically removing leads that do not pertain to your specific area.-->
<!--        </p>-->

    <section class="intro-copy">

        <!-- DROPDOWN SELECTOR -->
        <div class="search-group" style="padding: 25px; background: #f0f7ff;">
            <label for="region-select" style="font-weight: bold; display: block; margin-bottom: 10px;">Get Started: Select a Region</label>
            <select id="region-select" onchange="window.location=this.value" style="width: 100%; max-width: 500px; padding: 12px; height: 48px;">
                <option value="">Select a region...</option>
                <?php 
                $keybase_URL='https://keybase.rbg.vic.gov.au/projects/show/11?filter_id='; 
                echo "<option value='".$keybase_URL."65711209297e3'>CA-FP (California Floristic Province)</option>"; 
                echo "<option value='".$keybase_URL."65207c1c00253'>&nbsp;&nbsp;NW (Northwestern CA)</option>";
                echo "<option value='".$keybase_URL."6520bf5d52cd7'>&nbsp;&nbsp;SN (Sierra Nevada)</option>";
                echo "<h2> (Include all other options here following this pattern)</h2>";
                ?>
            </select>
        </div>
    </section>

    <!-- RESPONSIVE GRID: Map and List -->
    <div class="treatment-grid has-media-grid">
        
        <!-- Column 1: Map -->
        <div class="media-column" style="background: none; border: none;">
            <h3>Bioregion Map</h3>
            <img src="/eflora/common/images/exploded_map.png" alt="Exploded Map of California Bioregions" style="border: 1px solid #ccc;">
            
            <div class="citation" style="margin-top: 20px; text-align: left;">
                <p><strong>Note on Filters:</strong> KeyBase filters are based on authored range assertions. Many populations occur outside these ranges. If a filtered key fails, try using a more relaxed filter (e.g., use the full Sierra Nevada filter instead of a specific District).</p>
            </div>
        </div>

        <!-- Column 2: Hierarchical List -->
        <div class="data-section">
            <h3>Regional Key Links</h3>
            <p>Click on any link below to view the filtered key in KeyBase.</p>
            
            <div class="links-list" style="margin-top: 20px;">
                <!-- CA-FP -->
                <div style="margin-bottom: 15px;">
                    <a href="<?php echo $keybase_URL; ?>65711209297e3" style="font-size: 1.2rem;"><strong>CA-FP</strong> California Floristic Province</a>
                </div>

                <!-- Nested Example: NW -->
                <div style="padding-left: 20px; border-left: 2px solid #eee;">
                    <a href="<?php echo $keybase_URL; ?>65207c1c00253"><strong>NW</strong> Northwestern California</a>
                    <div style="padding-left: 20px; font-size: 0.95rem;">
                        <a href="<?php echo $keybase_URL; ?>65207c9ec5a68"><strong>NCo</strong> North Coast subregion</a><br>
                        <a href="<?php echo $keybase_URL; ?>65207d079cd58"><strong>NCoR</strong> North Coast Ranges</a>
                    </div>
                </div>

                <!-- Nested Example: SN -->
                <div style="padding-left: 20px; border-left: 2px solid #eee; margin-top: 15px;">
                    <a href="<?php echo $keybase_URL; ?>6520bf5d52cd7"><strong>SN</strong> Sierra Nevada</a>
                    <div style="padding-left: 20px; font-size: 0.95rem;">
                        <a href="<?php echo $keybase_URL; ?>6520c1d1d138d"><strong>nSN</strong> northern SN subregion</a><br>
                        <a href="<?php echo $keybase_URL; ?>6520c2623b603"><strong>cSN</strong> central SN subregion</a>
                    </div>
                </div>

                <h2> Add other groups (GV, CW, SW, GB, D) following the same structure </h2>
            </div>
        </div>
    </div>

    <!-- TEXT FOOTER CONTENT -->
    <section class="data-section" style="margin-top: 40px; border-top: 2px solid var(--berkeley-blue);">
        <p class="bodyTextBlack">
            The Jepson eFlora divides California into 35 ecologically distinct <strong>bioregions</strong>. These range from the finest scale (e.g., Sonoran Desert) to grouped districts within subregions. All regions are nested within three main provinces (CA-FP, GB, D).
        </p>

        <p class="bodyTextBlack">
            Each terminal taxon treatment in the eFlora indicates the bioregions where it is asserted to occur. You can generate custom checklists for any region using our <a href="/eflora/tools/">eFlora Tools</a>.
        </p>

        <div style="margin-top: 20px;">
            <a href="/eflora/geography.php" style="font-weight: bold;">Full Descriptions of Geographic Subdivisions &rarr;</a>
        </div>

        <div class="citation" style="margin-top: 30px;">
            <p><strong>Recent Update History</strong></p>
            <ul style="font-size: 0.9rem; list-style: none; padding: 0;">
                <li><strong>Oct. 20, 2023:</strong> Bioregion species lists NOT updated for Revision 11.</li>
                <li><strong>Apr. 20, 2022:</strong> Bioregion species lists NOT updated for Revision 10.</li>
                <li><strong>Dec. 23, 2021:</strong> Bioregion species lists updated for Revision 9.</li>
            </ul>
        </div>
    </section>

</main>

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
