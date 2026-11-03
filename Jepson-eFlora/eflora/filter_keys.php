
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




    <!-- TEXT FOOTER CONTENT -->
    <section class="data-section" style="margin-top: 40px; border-top: 2px solid var(--berkeley-blue);">

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
