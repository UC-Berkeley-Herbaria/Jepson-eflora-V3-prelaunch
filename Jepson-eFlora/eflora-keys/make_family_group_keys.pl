#<a name="Group1"></a><blockquote><h3><a name=Group1>Group 1</a>: Herbs; bulblets dispersed in place of seeds or frs; available specimens without fls</h3></blockquote>
open(IN, "all_family_key.html") || die;
open(OUT, ">IJM_fam_key.html") || die;

while(<IN>){
s!<a href="#Group(\d+)">!<a href="/IJM_keys/IJM_key_Group${1}.html">!g;
	if(m/<a name="Group(\d+)/){
		$gp=$1;
print OUT <<EOP;

        </section>

    <!-- Feedback Area -->
    <section class="feedback-area center-text">
        <a class="googleForm" href="https://docs.google.com/forms/d/e/1FAIpQLSc_wrQXqB9gNPrOgUTZ9WN38Ub08JlmgaIha7Ua99sHGzMntA/viewform">
            Send us your feedback! Community input helps improve the Jepson eFlora.
        </a>
    </section>


</main>

    <!-- FOOTER SECTION -->
    <!-- CITATION -->
    <footer class="treatment-citation" style="margin-top:40px; padding: 20px; background: #eee; border-left: 5px solid var(--ef-blue);">
        <p><strong>Citation:</strong> Jepson Flora Project (eds.) <?php echo date("Y"); ?>, <i><?php echo $ScientificName; ?></i>, in <em>Jepson eFlora</em>, accessed on <?php echo date("F d, Y"); ?>.</p>
    </footer>

</body>
</html>


<!--Flexbox Key Rows: Replaced <br> and id="keyText" with a key-row div using Flexbox. This ensures the couplet number (e.g., 1.) stays aligned to the left while the text wraps correctly on the right. -->
<!--CSS Indentation: Instead of fixed-width IDs, I used a modular padding system (indent-7, indent-14). This is fully responsive; if the screen is too small, a media query flattens the indentation so text doesn't become a tiny vertical sliver. -->
<!--Accessible Tooltips: The morphology tooltips (.dropdown-content) are now focusable via tabindex="0". This means keyboard users can "Tab" to a word like "bulbs" and see the definition/image. -->
<!--Semantic Headers: Intro text is now properly categorized under <h2> and <h3> tags for screen reader navigation. -->
<!--Touch Targets: Links to "Group 1", "Group 2", etc., are given the .key-link style to ensure they are large enough to be tapped easily on mobile devices. -->
<!--Skip Link: Added a "Skip to main content" link at the very top for users with motor disabilities who use keyboards to navigate. -->

<!--CSS Variables: Instead of 20 different IDs, I created a responsive padding system. On desktop, it honors your exact pixel requirements (5px, 25px, 35px, etc.). -->
<!--Mobile Flattening: On mobile screens, these indents are automatically reduced. This prevents the "skinny column" effect where text becomes unreadable on a phone. -->
<!--Hanging Indents: I used a Flexbox layout for the couplets. This ensures the numbers (1., 1', 2.) stay aligned to the left while the text wraps cleanly to the right, maintaining the botanical "hanging indent" look without using negative  text-indents which are prone to breaking. -->
<!--Accessible Tooltips: The morphological definitions (bulbs, sporangium) are now keyboard-accessible. A user can "Tab" into the word to see the image and description. -->


EOP
		open(OUT, ">IJM_key_Group${gp}.html") || die;
#<P class="keyText" style="padding-left : 7 ;"><a href="#12'">2.</a><a name="12."> </a> Bulblets [small bulbs or corms that are dispersed in place of seeds or fruits] formed in place of flowers in inflorescence or inflorescence-like cluster <a href="#Group1">.....&nbsp;Group 1</a>

		print OUT<<EOP;
<!DOCTYPE html>
 
<html lang="en"> 

<head>
<title>eFlora Family Key to Group $gp</title> 
<meta charset="UTF-8">
<meta name="description" content="For vascular plants occurring in wildlands or otherwise outside of cultivation in California, the Jepson eFlora contains taxonomic treatments, distribution maps, illustrations, photographs, and identification keys.">
  <meta name="keywords" content="California Flora, Jepson eFlora, Flora of California, Vascular Plants of California, Jepson Flora Project, ">
    <meta name="description" content="Dichotomous keys for the identification of all plant family groups in the Jepson eFlora.">
    
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

    <style>

    </style>
</head>

<body>

    <!-- ACCESSIBILITY: Skip to Content Link -->
    <a href="#main-content" class="visually-hidden">Skip to main content</a>

<!-- Header -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/eflora-header.php'); ?>  


    <main id="main-content" class="eflora-main">
        
        <section class="intro-copy">
            <h1>Jepson eFlora Family Key</h1>

            <div class="citation" style="margin: 20px 0;">
                <p><strong>Citation:</strong> Jepson Flora Project (eds.) <span id="currentYear"></span>. Jepson eFlora, https://ucjeps.berkeley.edu/eflora/ [accessed on <span id="DateA"></span>]</p>
            </div>
        </section>

        <!-- TEXT INTRO -->
        <article class="data-section" style="border: none; padding: 0;">
<p><a href="/eflora/keys/IJM_fam_key.php">Key to All Family Groups</a></p>
        </article>

        <!-- THE DICHOTOMOUS KEY -->
        <section class="key-container" aria-label="Family Key Groups">

<h3>Family key to Group $gp</h3>

EOP
}
print OUT;
}
print OUT <<EOP;

        </section>

    <!-- Feedback Area -->
    <section class="feedback-area center-text">
        <a class="googleForm" href="https://docs.google.com/forms/d/e/1FAIpQLSc_wrQXqB9gNPrOgUTZ9WN38Ub08JlmgaIha7Ua99sHGzMntA/viewform">
            Send us your feedback! Community input helps improve the Jepson eFlora.
        </a>
    </section>


</main>

    <!-- FOOTER SECTION -->
    <!-- CITATION -->
    <footer class="treatment-citation" style="margin-top:40px; padding: 20px; background: #eee; border-left: 5px solid var(--ef-blue);">
        <p><strong>Citation:</strong> Jepson Flora Project (eds.) <?php echo date("Y"); ?>, <i><?php echo $ScientificName; ?></i>, in <em>Jepson eFlora</em>, accessed on <?php echo date("F d, Y"); ?>.</p>
    </footer>

</body>
</html>


<!--Flexbox Key Rows: Replaced <br> and id="keyText" with a key-row div using Flexbox. This ensures the couplet number (e.g., 1.) stays aligned to the left while the text wraps correctly on the right. -->
<!--CSS Indentation: Instead of fixed-width IDs, I used a modular padding system (indent-7, indent-14). This is fully responsive; if the screen is too small, a media query flattens the indentation so text doesn't become a tiny vertical sliver. -->
<!--Accessible Tooltips: The morphology tooltips (.dropdown-content) are now focusable via tabindex="0". This means keyboard users can "Tab" to a word like "bulbs" and see the definition/image. -->
<!--Semantic Headers: Intro text is now properly categorized under <h2> and <h3> tags for screen reader navigation. -->
<!--Touch Targets: Links to "Group 1", "Group 2", etc., are given the .key-link style to ensure they are large enough to be tapped easily on mobile devices. -->
<!--Skip Link: Added a "Skip to main content" link at the very top for users with motor disabilities who use keyboards to navigate. -->

<!--CSS Variables: Instead of 20 different IDs, I created a responsive padding system. On desktop, it honors your exact pixel requirements (5px, 25px, 35px, etc.). -->
<!--Mobile Flattening: On mobile screens, these indents are automatically reduced. This prevents the "skinny column" effect where text becomes unreadable on a phone. -->
<!--Hanging Indents: I used a Flexbox layout for the couplets. This ensures the numbers (1., 1', 2.) stay aligned to the left while the text wraps cleanly to the right, maintaining the botanical "hanging indent" look without using negative  text-indents which are prone to breaking. -->
<!--Accessible Tooltips: The morphological definitions (bulbs, sporangium) are now keyboard-accessible. A user can "Tab" into the word to see the image and description. -->

EOP
