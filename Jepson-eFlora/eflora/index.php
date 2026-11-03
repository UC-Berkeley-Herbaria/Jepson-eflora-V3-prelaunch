<!DOCTYPE html>
 
<html lang="en">  
<head>

<title>California Flora, Jepson eFlora Main Page</title> 
<meta charset="UTF-8">
<meta name="description" content="The Jepson eFlora is the foremost authority on the native and naturalized vascular plants of California. For plants occurring in wildlands or otherwise outside of cultivation, the Jepson eFlora contains taxonomic treatments, distribution maps, illustrations, photographs, and identification keys."  />
	<meta name="keywords" content="Jepson eFlora, Jepson Flora Project, California Flora, Flora of California, Vascular Plants of California">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link href="/common/css/dropdowns.css" rel="stylesheet" type="text/css">
	<link rel="shortcut icon" href="/common/images/JepsonLogoSmall.png" type="image/x-icon">

<!-- Google tag (gtag.js) -->
<script async src="//www.googletagmanager.com/gtag/js?id=G-T5YC99QF6Q"></script>
<!-- Cloudflare Turnstile -->
<script src="//challenges.cloudflare.com/turnstile/v0/api.js" async defer></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-T5YC99QF6Q');
</script>

<style type="text/css">
 .bgcolor{
 	font-size: 4px;
 	background-color: lightgrey;
 	width: 100%;
 }


</style>

<!-- Begin banner -->

</head>

<body>

<!-- Begin banner -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/header_jeps.php'); ?>  
<!-- End banner -->

<!-- Beginning of horizontal menu -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/globalnav.php'); ?> 
<!-- End of horizontal menu -->

<table width="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr> 
	<td style="vertical-align: top;width:275px;">


<!-- Start of sidebar menu-->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/localnav_jepsfriends.php'); ?>
<!-- End of sidebar --> 
	</td>
	<td style="padding: 15px;vertical-align: top; width:100%;">

    <h1>Jepson eFlora</h1>

<!-- Begin spacer block-->
<div class="spacer_lightgrey">


<table valign="top" align="center" width="100%" border=0>
<tr>
<td align="center" style="padding: 0 15 0 0" ><img src="/common/images/ijm_banner_6.jpg" alt="Willis Linn Jepson in the Vaca Hills, 1942, Neat M. Tate"></td>
<td><a href="https://www.youtube.com/channel/UCbG--FtGxmPCvLIo0Fa1PHg/videos"><img src="/common/images/ijm_banner_7.png" alt="Jepson YouTube Channel"></a></td>
<td><img src="/common/images/ijm_banner_1.jpg" alt="Arctostaphylos ohloneana, Neal Kramer"></td>
<td><img src="/common/images/ijm_banner_2.jpg"  alt="Calochortus venustus, John C. Game"></td>
<!--<td><img src="/common/images/ijm_banner_4.jpg" alt="Harmonia guggolziorum, John C. Game"></td>-->
<td><img src="/common/images/ijm_banner_5.jpg" alt="Caulanthus inflatus, John C. Game"></td>
<td align="left"><a href="/eflora/clademap/"><img src="/common/images/pt.jpg" alt = "clademap image"></a></td>
</tr>
<tr>
<td colspan=5>
</td>
<td align="left"><a href="/eflora/clademap/clademap2.html">Phylogenetic index to families</a></td>
</tr>
</table>
<p class="bodyText">
The <i>Jepson eFlora</i> is the foremost authority on the native and naturalized vascular plants of California. For plants occurring in wildlands or otherwise outside of cultivation, the <i>Jepson eFlora</i> contains taxonomic treatments, distribution maps, illustrations, photographs, and identification keys.
<br><span class="smallText">Citation: Jepson Flora Project (eds.) <?php echo date("Y")?>. <i>Jepson eFlora</i>, <a href="/eflora/">https://ucjeps.berkeley.edu/eflora/</a> [accessed on 
<?php echo date ("M d, Y") ?>].</span>
</p>
</div>

<!-- Begin spacer block-->
<div class="spacer_lightgrey">

<p class=pageMajorHeading><u><b>Search the eFlora for a name:</b></u></p>
<!-- Turnstile Widget -->
<div class="cf-turnstile" data-sitekey="0x4AAAAAABe3TrbcyhMmtFuv" data-appearance="interaction-only"></div>
  <ul>
  	  <li><p class=bodyText>
<form action="/eflora/search_eflora.php?name=" method=POST>
<label><strong>Scientific Name</strong></label><br />
<input type="text" id="query_text" name="query" size=30>
<br />
<input type=submit value="Submit Name">
<input type=reset value=Reset>
</form>
	</p></li>

  	  <li><p class=bodyText>
<form action="/eflora/search_common.php?cn=" method=POST>
<label><strong>Common Name</strong></label><br />
<input type="text" id="cn" name="cn" size=30>
<br />
<input type=submit value="Submit Name">
<input type=reset value=Reset>
</form>
	</p></li>


  	  <li><p class=bodyText>
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/front_page_index_bar.php'); ?>
	</p>
	</li>
	
	<li><p><span class="pageAuthorLine">
				<a href="/IJM_keys/IJM_fam_key.html">Key to families</a>
				|
				<a href="/IJM_keys/toc.html">Table of families and genera</a>
			</span>
		</p>
	</li>
  </ul>
<p class=pageMajorHeading><u><b>Search eFlora Fields:</b></u> <a href="/eflora/search_advanced.php/" >Advanced Search Page</a></p>

</div>

<!-- Begin spacer block-->
<div class="spacer_lightgrey">

<p class=pageMajorHeading><u><b>Identify a plant from your region:</b></u></p>
  <ul>
  	<li><p class=bodyText><b>Keybase is archived and cannot be updated for revisions 10-13</b></p></li>
  	  <!--<li><p class=bodyText><b>Simplify plant identification with the new application <a href="/eflora/filter_keys.html">KeyBase</a>, which filters keys based on Jepson regions:</b></p></li>-->
<form action="/eflora/filter_keys.html">
        <input type="submit" value="Use filtered keys">
</form>
  	  <li><p class=bodyText><b>Click the map for more information about the status of Keybase:</b></p></li>
  	  
  	  <a href="/eflora/filter_keys.html"><img width=100px src="/common/images/exploded_map.png"></a>
  </ul>

</div>

<!-- Begin spacer block-->
<div class="spacer_lightgrey">

<p class=pageMajorHeading><u><b>Resources:</u></p>
  <ul>
  	  <li><p class=bodyText><a href="/eflora/tools/" ><b>eFlora Tools</b></a></p></li>
  	  <li><p class=bodyText><a href="/eflora/glossary.html"><b>Glossary</b></a></p></li>
  	  <li><p class=bodyText><a href="/eflora/geography.html"><b>Geographic subdivisions of California</b></a></p></li>
  </ul>

</div>

<!-- Begin spacer block-->
<div class="spacer_lightgrey">

<p><span class="pageMajorHeading"><u>Revisions:</u></span></p>
  <ul>
	  <li><p class="bodyText">Summary of <a href="/eflora/supplement_summary.html">Revision 1 (2013)</a>, <a href="/eflora/supplement_summary.html#rev2">Revision 2 (2014)</a>, <a href="/eflora/supplement_summary.html#rev3">Revision 3 (2015)</a>, 
	  <a href="/eflora/supplement_summary.html#rev4">Revision 4 (2016)</a>, 
	  <a href="/eflora/supplement_summary.html#rev5">Revision 5 (2017)</a>, 
	  <a href="/eflora/supplement_summary.html#rev6">Revision 6 (2018)</a>, 
	  <a href="/eflora/supplement_summary.html#rev7">Revision 7 (2019)</a>,
	  <a href="/eflora/supplement_summary.html#rev8">Revision 8 (2020)</a>,
	  <a href="/eflora/supplement_summary.html#rev9">Revision 9 (2021)</a>,
	  <a href="/eflora/supplement_summary.html#rev10">Revision 10 (2022)</a>,
	  <a href="/eflora/supplement_summary.html#rev11">Revision 11 (2022)</a>,
	  <a href="/eflora/supplement_summary.html#rev12">Revision 12 (2023)</a>,
	  and <a href="/eflora/supplement_summary.html#rev13">Revision 13 (2025)</a>.</p></li>

	  <li><p class="bodyText"><a href="https://docs.google.com/spreadsheets/d/174xfVhIT3PB4OUSrcoK6cfMxeIIKnK903f9LInf056Q/edit?usp=sharing">
	  Spreadsheet Summary of Revisions 1-13.</a></p></li>

	  <li><p class="bodyText"><a href="/eflora/errata.html">
	  List of all errata and other small changes.</a></p></li>

	  <li><p class="bodyText"><a href="/eflora/IJM_update_history.html"> 
	  Click here to see when the eflora was last updated with corrections.</a></p></li>
  </ul>

</div>

<!-- Begin spacer block-->
<div class="spacer_lightgrey">

<p class=pageMajorHeading><u><b>Editorial Board</b></u></p>
<p class=bodyText><a href="/jepsonflora/staff.html#Baldwin">Bruce&nbsp;G. Baldwin</a>, Convening Editor, University and Jepson Herbaria</p>
<p class=bodyText><a href="/jepsonflora/staff.html#Keil">David J. Keil</a>, Professor Emeritus, California Polytechnic State University, San Luis Obispo</p>
<p class=bodyText><a href="/jepsonflora/staff.html#Markos">Staci&nbsp;Markos</a>, Associate Director, University and Jepson Herbaria</p>
<p class=bodyText><a href="/people/mishler.html">Brent D. Mishler</a>, Director, University and Jepson Herbaria</p>
<p class=bodyText><a href="/jepsonflora/staff.html#Patterson">Robert Patterson</a>, Department of Biology, San Francisco State University</p>
<p class=bodyText><a href="/jepsonflora/staff.html#Rosatti">Thomas&nbsp;J. Rosatti</a>,&nbsp;Scientific Editor, University and Jepson Herbaria</p>
<p class=bodyText><a href="/jepsonflora/staff.html#Wilken">Dieter H. Wilken</a>, Research Associate, Santa Barbara Botanic Garden</p>
<p class=pageMajorHeading><u><b>Technical Editor</b></u></p>
<p class=bodyText><a href="/jepsonflora/staff.html#Alexander">Jason Alexander</a>, University and Jepson Herbaria</p>
<p class=pageMajorHeading><u><b>Managing Editor</b></u></p>
<p class=bodyText><a href="https://sites.google.com/view/neenbeeninthegreen/home?authuser=0">Nina House</a>, University and Jepson Herbaria</p>

</div>

<!-- Begin spacer block-->
<div class="spacer_lightgrey">

<p class=pageMajorHeading><u><b>Information for Contributors</b></u></p>
  <ul>
  	  <li><p class=bodyText><a href="/eflora/philosophy.html"><b>eFlora Philosophy</a></b></p></li>
	  <li><p class=bodyText><a href="/eflora/conventions.html"><b>eFlora User's Guide</b></a></p></li>
	  <li><p class=bodyText><a href="/eflora/policy.html"><b>eFlora Editorial Policy</b></a></p></li>
</ul>

</div>

<!-- Begin spacer block-->
<div class="spacer_lightgrey">

<p><span class="pageMajorHeading"><u>About the <i>Jepson eFlora</i></u></span></p>
<br />
<p class="bodyText">Treatments and keys in the <em>Jepson eFlora</em> were initially derived from <I>The Jepson Manual: Vascular Plants of California, Second Edition</I> (TJM2), available from <a href="https://www.ucpress.edu/book/9780520253124/the-jepson-manual">University of California Press</a>.  <!--old link For an explanation of conventions applying to the printed <i>Manual</i>, click here: <a href="conventions.html" class="tocLink" >User's Guide</a>-->
</p>
<p><span class="bodyText">The eFlora expands on the content of TJM2, 
including descriptions of taxa not included in the print book (e.g. waifs, agricultural weeds), 
substantive revisions of scientific content for some taxa, 
and many errata and other small changes made relative to the print book.</span></p>
<p class="pageMajorHeading">The <i>Jepson eFlora</i> is a product of the <a href="/jepsonflora/">Jepson Flora Project</a>.</p>

</div>
<!-- Begin spacer block-->
<div class="spacer_lightgrey">

<p class=pageMajorHeading><u><b>Feedback</b></u></p>

<p class=pageMajorHeading><a href="https://docs.google.com/forms/d/e/1FAIpQLSc_wrQXqB9gNPrOgUTZ9WN38Ub08JlmgaIha7Ua99sHGzMntA/viewform">Please use this Google Form for Contact/Feedback</a>

</div>
   </td>
  </tr>
</table> <!--close box outline table-->

<!-- Begin footer -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/footer.php'); ?>
<!-- End footer -->


</body>
</html>
