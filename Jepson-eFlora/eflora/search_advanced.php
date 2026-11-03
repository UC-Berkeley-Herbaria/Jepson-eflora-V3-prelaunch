<?php
date_default_timezone_set('America/Los_Angeles');

?>
<!DOCTYPE html>
 
<html lang="en">  
<head>
<title>Advanced Search Page - Jepson eFlora</title>

<meta charset="UTF-8">
<meta name="description" content="For vascular plants occurring in wildlands or otherwise outside of cultivation in California, the Jepson eFlora contains taxonomic treatments, distribution maps, illustrations, photographs, and identification keys.">
  <meta name="keywords" content="California Flora, Jepson eFlora, Flora of California, Vascular Plants of California, Jepson Flora Project, ">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="/common/css/dropdowns.css" rel="stylesheet" type="text/css" />
<link href="/common/css/jepson_eflora.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="/common/images/JepsonLogoSmall.png" type="image/x-icon" />

<!--mobile js script files-->
	<script src="/eflora/common/js/dh_custom.js"></script>

<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-T5YC99QF6Q"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-T5YC99QF6Q');
</script>

<!-- Begin banner -->


</head>

<body>
<!-- Begin banner -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/header_jeps.php'); ?>
<!-- End banner -->

<!-- Beginning of horizontal menu -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/globalnav.php'); ?> 
<!-- End of horizontal menu -->

<main>
    <div id="content-top">

<h1><a href="/eflora/">Jepson eFlora</h1></a> 
<h2>Advanced Search Page</h2>
<!-- Begin spacer block-->
	</div>

<div id="content">
	<div class="spacer_spacer_blue">
    <p class="pageMajorHeading"><a name="TOP" id="TOP">Vascular Plants of California</a></p>
			<p class="pageAuthorLine">
				<a href="/IJM_keys/IJM_fam_key.html">Key to families</a>
				|
				<a href="/IJM_keys/toc.html">Table of families and genera</a>
			</p>	  
	</div>
<!-- Begin spacer block-->
	<div class="spacer_spacer_blue">
<!--eFlora index-->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/eflora_index_bar.php'); ?>
	</div>
<!-- Begin spacer block-->
	<div class="spacer_spacer_blue">

<form action="/eflora/adv_list.php" method="GET">
<table width="100%">
	<tr>
	<td width="100%" valign="top">
<p><h3>CAUTION: Advanced queries take longer than simple queries
<br />Please allow extra time for query to finish....
</h3></p>

<p>

	<label><b>Scientific Name<br></label>		
		<input id="query_text" type="text" name="TAX" size = 75 MAXLENGTH = 100></input><br />

		<table>
		<tr>
				<td><span class="bodySmallerText" style="vertical-align: top;">
					&nbsp;&nbsp;&nbsp;Enter a whole name or part of a name to search eflora accepted names<br />
					&nbsp;&nbsp;&nbsp;Searching for a partial words is NOT allowed<br />
					&nbsp;&nbsp;&nbsp;You may also enter a value in one of the character fields below<br />
					&nbsp;&nbsp;&nbsp;<b>OR</b> enter a name value and a value in <b>one character</b> field below<br />
				</td>
		</tr>
		</table>
</p>
<p><b>Character Fields</b><br />
		<span class="bodySmallerText" style="vertical-align: top;">
		&nbsp;&nbsp;&nbsp;Enter a single word in one of these fields only to search eflora accepted names<br />
</p>
<p>
<label><b>1. Ecology<br></label>		
	<input id="query_text" type="text" name="ECO" size = 50 MAXLENGTH = 60></input><br />

<p><h3> More fields to be added soon...</h3></p>
<!--<b>2. Flower or Inflorescence<br></b>
	<input id="query_text" type="text" name="FLR" size = 50 MAXLENGTH = 60></input><br />
-->
<!--<b>3. Fruit, Cones, or Spore<br></b>		
	<input id="query_text" type="text" name="FRT" size = 50 MAXLENGTH = 60></input><br />
-->
</p>
	</td>
	</tr>
	
	<tr>
<!-- BEGIN USE TERMS LEFT-->
		<td style="height: 40px;padding: 10px;vertical-align: top;background-color:#FFFFFF;">
<hr>
			<p><input TYPE="submit" VALUE="Accept data-use terms, submit search" >&nbsp;&nbsp;&nbsp;&nbsp;</p>			
			<p><b><a href="/eflora/termsofuse.html">Read&nbsp;use&nbsp;terms</a></b>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input TYPE="reset" VALUE="Reset Form"></p>
		</td>
<!-- END USE TERMS LEFT-->
	</tr>
</p>

</td>
</tr>
</table>
</form>
</div>
</div>
<div class="spacer_spacer_blue">

<p class=bodyText><a href="https://docs.google.com/forms/d/e/1FAIpQLSc_wrQXqB9gNPrOgUTZ9WN38Ub08JlmgaIha7Ua99sHGzMntA/viewform">Please use this Google Form for Contact/Feedback</a>




<!--Begin footer-->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/footer.php'); ?>
<!--End footer-->

</div>

</body>
</html>
