

<!DOCTYPE html>
 
<html lang="en">  
<head>

<title>Jepson eFlora Tools Page</title> 
<meta charset="UTF-8">
<meta name="description" content="The Jepson eFlora is the foremost authority on the native and naturalized vascular plants of California. For plants occurring in wildlands or otherwise outside of cultivation, the Jepson eFlora contains taxonomic treatments, distribution maps, illustrations, photographs, and identification keys."  />
	<meta name="keywords" content="Jepson eFlora, Jepson Flora Project, California Flora, Flora of California, Vascular Plants of California">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="/eflora/common/css/jepson-main.css" rel="stylesheet" type="text/css">
	<link href="/eflora/common/css/eflora-header.css" rel="stylesheet" type="text/css">

	<link rel="shortcut icon" href="/eflora/common/images/JepsonLogoSmall.png" type="image/x-icon">

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

    <main id="main-content" class="eflora-main">

        <section class="intro-copy">
            <h1>Jepson eFlora Key Tools Page</h1>

    <!-- return home link -->
<div class="center-text" style="margin-top: 30px;">
    <a href="/eflora/" style="font-weight: bold;">&larr; Return to the <i>Jepson eFlora</i> Resource Portal</a>
</div>

<h2>Jepson eFlora Resource Links</h2>
  <ul>
	  <li><a href="https://herbaria.berkeley.edu/floras/jepson-eflora/jepson-eflora-abbreviations-and-symbols/"><b>Jepson eFlora Abbreviations and Symbols</b></a> </li>
	  <li><a href="https://herbaria.berkeley.edu/floras/jepson-eflora/jepson-eflora-conventions/"><b>Jepson eFlora Convention</b></a> </li>
	  <li><a href="https://herbaria.berkeley.edu/floras/jepson-eflora/jepson-eflora-glossary/"><b>Jepson eFlora Glossary</b></a> </li>
  	  <li><a href="https://herbaria.berkeley.edu/floras/jepson-eflora/jepson-eflora-philosophy/"><b>Jepson eFlora Philosophy</a></b> </li>
	  <li><a href="https://herbaria.berkeley.edu/floras/jepson-eflora/jepson-eflora-editorial-policy/"><b>Jepson eFlora Editorial Policy</b></a> </li>
	  <li><a href="https://herbaria.berkeley.edu/floras/jepson-eflora/jepson-eflora-staff-and-editors/"><b>Jepson eFlora Staff and Editors</b></a> </li>
</ul>

<h2>Statistics and species lists</h2>
<ol>
<li><a href="/eflora/IJM_stats.php">Summary statistics</a></li>
<li><a href="TJM_name_words.txt">Jepson Manual name words:</a>  Import this list of names to build custom dictionaries (for example, for <b>Microsoft Word</b>).</li>
<li>Generate a list of taxa by bioregion (e.g., all species inferred from the eFlora to be present in the White and Inyo mountains)</li>


<table>
<tr>
<td>

<form action="/eflora/region_list.php">
<select name=region>
<OPTION VALUE="CA_FP">CA-FP
<OPTION VALUE="NW">&nbsp;&nbsp;NW
<OPTION VALUE="NCo">&nbsp;&nbsp;&nbsp;&nbsp;NCo
<OPTION VALUE="NCoR">&nbsp;&nbsp;&nbsp;&nbsp;NCoR
<OPTION VALUE="NCoRO">&nbsp;&nbsp;&nbsp;&nbsp;NCoRO
<OPTION VALUE="NCoRI">&nbsp;&nbsp;&nbsp;&nbsp;NCoRI
<OPTION VALUE="NCoRH">&nbsp;&nbsp;&nbsp;&nbsp;NCoRH
<OPTION VALUE="KR">&nbsp;&nbsp;&nbsp;&nbsp;KR
<OPTION VALUE="CaR">&nbsp;&nbsp;CaR
<OPTION VALUE="CaRF">&nbsp;&nbsp;&nbsp;&nbsp;CaRF
<OPTION VALUE="CaRH">&nbsp;&nbsp;&nbsp;&nbsp;CaRH
<OPTION VALUE="SN">&nbsp;&nbsp;SN
<OPTION VALUE="SNF">&nbsp;&nbsp;&nbsp;&nbsp;SNF
<OPTION VALUE="nSNF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nSNF
<OPTION VALUE="cSNF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cSNF
<OPTION VALUE="sSNF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sSNF
<OPTION VALUE="SNH">&nbsp;&nbsp;&nbsp;&nbsp;SNH
<OPTION VALUE="nSNH">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nSNH
<OPTION VALUE="cSNH">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cSNH
<OPTION VALUE="sSNH">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sSNH
<OPTION VALUE="Teh">&nbsp;&nbsp;&nbsp;&nbsp;Teh
<OPTION VALUE="GV">&nbsp;&nbsp;GV
<OPTION VALUE="ScV">&nbsp;&nbsp;&nbsp;&nbsp;ScV
<OPTION VALUE="SnJV">&nbsp;&nbsp;&nbsp;&nbsp;SnJV
<OPTION VALUE="CW">&nbsp;&nbsp;CW
<OPTION VALUE="SCoR">&nbsp;&nbsp;&nbsp;&nbsp;SCoR
<OPTION VALUE="SCoRO">&nbsp;&nbsp;&nbsp;&nbsp;SCoRO
<OPTION VALUE="SCoRI">&nbsp;&nbsp;&nbsp;&nbsp;SCoRI
<OPTION VALUE="CCo">&nbsp;&nbsp;&nbsp;&nbsp;CCo
<OPTION VALUE="SnFrB">&nbsp;&nbsp;&nbsp;&nbsp;SnFrB
<OPTION VALUE="SW">&nbsp;&nbsp;SW
<OPTION VALUE="SCo">&nbsp;&nbsp;&nbsp;&nbsp;SCo
<OPTION VALUE="ChI">&nbsp;&nbsp;&nbsp;&nbsp;ChI
<OPTION VALUE="nChI">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nChI
<OPTION VALUE="sChI">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sChI
<OPTION VALUE="PR">&nbsp;&nbsp;&nbsp;&nbsp;PR
<OPTION VALUE="PRexcSnJt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PR exc SnJt
<OPTION VALUE="SnJt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SnJt
<OPTION VALUE="TR">&nbsp;&nbsp;&nbsp;&nbsp;TR
<OPTION VALUE="WTR">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;WTR
<OPTION VALUE="SnGb">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SnGb
<OPTION VALUE="SnBr">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SnBr
<OPTION VALUE="GB">GB
<OPTION VALUE="MP">&nbsp;&nbsp;MP
<OPTION VALUE="Wrn">&nbsp;&nbsp;&nbsp;&nbsp;Wrn
<OPTION VALUE="MPexcWrn">&nbsp;&nbsp;&nbsp;&nbsp;MP exc Wrn
<OPTION VALUE="SNE">&nbsp;&nbsp;SNE
<OPTION VALUE="WaI">&nbsp;&nbsp;&nbsp;&nbsp;W&amp;I
<OPTION VALUE="SNEexcWaI">&nbsp;&nbsp;&nbsp;&nbsp;SNE exc W&amp;I
<OPTION VALUE="D">D
<OPTION VALUE="DMoj">&nbsp;&nbsp;DMoj
<OPTION VALUE="DMojexcDMtns">&nbsp;&nbsp;&nbsp;&nbsp;DMoj exc DMtns
<OPTION VALUE="DMtns">&nbsp;&nbsp;&nbsp;&nbsp;DMtns
<OPTION VALUE="DSon">&nbsp;&nbsp;DSon
</select>
<INPUT type=submit value="Submit bioregion">
<!-- <INPUT TYPE=CHECKBOX NAME="NO">Natives only-->

</FORM>
</td> 
</tr>
</table>
</ol>

<h2>Retrieve names from eFlora</h2>
	
	<table border=0>
			<tr>
			<td class="pageSubheading">Please Note: Hold down the Ctrl (windows) / Command (Mac) button to select multiple options.<br /><br /><br /></td> 
			</tr>
			
			<tr>
			<td class="pageSubheading">For best results, select one or more scientific name fields first (Genus & Species, Name without authors, Name with authors), then select one or more additional fields.</td>
			</tr>

		<tr><td>
			nativity | family | genus | species | species_author | infraspecific_rank | infraspecific_epithet | infraspecific_author | name_minus_authors | name_plus_authors | expanded_name | synonyms | common_names | TJM1/TJM2 | major_clade
		</td>
		</tr>

		<tr>
		<td valign="top"  >
			<FORM action="/cgi-bin/eflora/get_JM_name_data" method=post>
			<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<SELECT NAME="fields" size=16 multiple>
<OPTION VALUE="0" SELECTED>All data</option>
<OPTION VALUE="1">Nativity
<OPTION VALUE="2">Family
<OPTION VALUE="3">Genus
<OPTION VALUE="4">Species
<OPTION VALUE="5">Species author
<OPTION VALUE="6">Infraspecific rank
<OPTION VALUE="7">Infraspecific epithet
<OPTION VALUE="8">Infraspecific author
<OPTION VALUE="9">Name without authors
<OPTION VALUE="10">Name with authors
<OPTION VALUE="11">Name with expanded authorship
<OPTION VALUE="12">Synonyms
<OPTION VALUE="13">Common names
<OPTION VALUE="14">Use in TJM1
<OPTION VALUE="15">Major clade
			</SELECT>	

		<table border=0>
			<tr>
				<td class="pageSubheading">Native taxa only </td>
				<td class="pageSubheading" bgcolor="#eeeeee">Naturalized taxa only</td>
				<td class="pageSubheading">All taxa</td>
			</tr>
			<tr>
						<td class="pageSubheading" valign="top" align="center">
						<input type="radio" name="nativity" value="1">
						</td>
						<td class="pageSubheading" valign="top" align="center" bgcolor="#eeeeee">
						<input type="radio" name="nativity" value="2">
						<br>
						</td>
						<td class="pageSubheading" valign="top" align="center">
						<input type="radio" name="nativity" value="0">
						</td>
			</tr>
			<tr>
				<td>
					<input TYPE="submit" VALUE="Retrieve names" >&nbsp;&nbsp;&nbsp;&nbsp;			
					</FORM>
				</td>
			</tr>
		</table>
		</td>
		</tr>
	</table>


<h2>Tools comparing TJM (1993) to TJM2 (2012): </h2>
<ol>
	<li class="pageAuthorLine"><a href="/archive/tjm93/JMtoJMII.html">Dynamic concordance:</a> Use this search tool to look up names that were accepted in <em>The Jepson Manual</em> (1993). The return page will indicate how (or if) the name is treated in the <em>eFlora</em> (e.g., if it was accepted, excluded, or listed as a synonym under a newly adopted name). </li>
	<li class="pageAuthorLine"> <a href="/archive/tjm93/superseded_names.html">Superseded names with authors:</a> Browse this list of names from <em>The Jepson Manual</em> (1993) that are no longer recognized in the <em>eFlora</em></li>
	<li class="pageAuthorLine"> <a href="/archive/tjm93/superseded_names_noauts.html">Superseded names no authors:</a> Browse this list of names from <em>The Jepson Manual</em> (1993) that are no longer recognized in the <em>eFlora</em></li>
	<li class="pageAuthorLine"><a href="/archive/tjm93/IJM_family_dispo.html">Comparison of recognition and composition of families:</a> Learn about changes in families and genera.</li>
</ol>

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

