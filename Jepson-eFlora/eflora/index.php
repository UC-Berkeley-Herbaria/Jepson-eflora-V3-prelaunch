
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>California Flora, Jepson eFlora Main Page</title> 
<meta name="description" content="The Jepson eFlora is the foremost authority on the native and naturalized vascular plants of California. For plants occurring in wildlands or otherwise outside of cultivation, the Jepson eFlora contains taxonomic treatments, distribution maps, illustrations, photographs, and identification keys."  />
	<meta name="keywords" content="Jepson eFlora, Jepson Flora Project, California Flora, Flora of California, Vascular Plants of California">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link href="/common/styles/dropdowns.css" rel="stylesheet" type="text/css" />

</head>

<body>

<!-- Begin banner -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/header_jeps.php'); ?>  
<!-- End banner -->

<!-- Beginning of horizontal menu -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/globalnav.php'); ?> 
<!-- End of horizontal menu -->

<!-- Start of sidebar menu-->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/localnav_jepsfriends.php'); ?>
<!-- End of sidebar --> 

<center>
<p>
       <span class="pageName"><font size=5>Jepson eFlora</font></span>
</p>
</center>

<table valign="top" align="center" width="100%" border=0>
<tr>
<td align="center"><img src="/common/images/ijm_banner_6.jpg" alt="Willis Linn Jepson in the Vaca Hills, 1942, Neat M. Tate"></td>
<td><img src="/common/images/ijm_banner_1.jpg" alt="Arctostaphylos ohloneana, Neal Kramer"></td>
<td><img src="/common/images/ijm_banner_2.jpg"  alt="Calochortus venustus, John C. Game"></td>
<td><img src="/common/images/ijm_banner_4.jpg" alt="Harmonia guggolziorum, John C. Game"></td>
<td><img src="/common/images/ijm_banner_5.jpg" alt="Caulanthus inflatus, John C. Game"></td>
<td align="left"><a href="/eflora/clademap/clademap2.html"><img src="/common/images/pt.jpg"></a></td>
</tr>
<tr>
<td colspan=5>
</td>
<td align="left"><a href="/eflora/clademap/clademap2.html">Phylogenetic index to families</a></td>
</tr>
</table>
<p class="bodyText">
The <i>Jepson eFlora</i> is the foremost authority on the native and naturalized vascular plants of California. For plants occurring in wildlands or otherwise outside of cultivation, the <i>Jepson eFlora</i> contains taxonomic treatments, distribution maps, illustrations, photographs, and identification keys.
<br><span class="smallText">Citation: Jepson Flora Project (eds.) <?php echo date("Y")?>. <i>Jepson eFlora</i>, <a href="index.html">http://ucjeps.berkeley.edu/eflora/</a> [accessed on 
<?php echo date ("M d, Y") ?>].</span>
</p>



<table border=0 cellpadding="10">
<tr>
<td width=35%>
<p class="pageAuthorLine">
Search the eFlora for a name:
</p>
</td>
<td width=35%>&nbsp;</td>
<td width="25%" valign=top rowspan=4 style="border: 1px solid black">
<p class="pageAuthorLine">Identify a plant from your region:</p>
<p class="bodyText"> Simplify plant identification with the new application <a href="filter_keys.html">KeyBase</a>, which filters keys based on Jepson regions: 
</p>
<form action="filter_keys.html">
        <input type="submit" value="Use filtered keys">
</form>
<center><a href="filter_keys.html"><img width=100px src="exploded_map.png"></a></center>
</td>
<td width=10%>&nbsp;</td>
</tr>
<tr>
<td valign="top" >
<form action="search_eflora.php?name=" method=POST>
<strong>Scientific Name</strong><br />
<input type="text" id="query_text" name="query" size=30>
<br />
<input type=submit value="Submit Name">
<input type=reset value=Reset>
</form>
</td>

<td valign="top">
<form action="/cgi-bin/get_cn2.pl"
method=post>
<strong>Common Name</strong><br />
<input name=common size=30>
<br />
<input type=hidden name="ijm" value="1">
<input type=submit value="Submit Name">
<input type=reset value=Reset>
</form>
</td>
</tr>

<tr><td colspan=2>
<p>
<?php include('common/front_page_index_bar.php'); ?>
</p>

</td></tr>

<tr><td>
	<p class="pageAuthorLine"><a href="tools/" ><b>eFlora Tools</b></a></p>
<p class="pageAuthorLine"> <a href="glossary.html" class="tocLink" >Glossary</a></p>
<p class="pageAuthorLine"> <a href="geography.html" class="tocLink" >Geographic subdivisions of California</a></p>

</td>
<td>
<p class="pageAuthorLine"> <a href="toc.html" class="tocLink" >Table of families and genera</a></p>
<p class="pageAuthorLine"> <a href="fam_key.html" class="tocLink" >Key to families</a></p>
<p class="pageAuthorLine"> <a href="/key_list.html" class="tocLink" >Keys to genera in families</a></p>

</td>
</tr>
</table>


<br />
<p><span class="pageMajorHeading">About the <i>Jepson eFlora</i></span></p>
<br />
<p class="bodyText">Treatments and keys in the <em>Jepson eFlora</em> were initially derived from <I>The Jepson Manual: Vascular Plants of California, Second Edition</I> (TJM2), available from <a href="https://www.ucpress.edu/book/9780520253124/the-jepson-manual">University of California Press</a>.  <!--old link For an explanation of conventions applying to the printed <i>Manual</i>, click here: <a href="conventions.html" class="tocLink" >User's Guide</a>-->
</p>
<p><span class="bodyText">The eFlora expands on the content of TJM2, including descriptions of taxa not included in the print book (e.g. waifs, agricultural weeds), substantive revisions of scientific content for some taxa, and many errata and other small changes made relative to the print book.</span></p>
  <ul>
	  <li><p class="bodyText">Summary of <a href="supplement_summary.html">Revision 1 (2013)</a>, <a href="supplement_summary.html#rev2">Revision 2 (2014)</a>, <a href="supplement_summary.html#rev3">Revision 3 (2015)</a>, <a href="supplement_summary.html#rev4">Revision 4 (2016)</a>, <a href="supplement_summary.html#rev5">Revision 5 (2017)</a>, <a href="supplement_summary.html#rev6">Revision 6 (2018)</a> and <a href="supplement_summary.html#rev7">Revision 7 (2019)</a>.</p></li>
	  
	  <li><p class="bodyText"><a href="errata.html">List of all errata and other small changes.</a></p></li>
  
  	  <li><p class="bodyText"><a href="philosophy.html" class="tocLink" >eFlora Philosophy</a></p>
	  <li><p class="bodyText"><a href="conventions.html" class="tocLink" >eFlora User's Guide</a></p>	  
</ul>
<br />	
<br />	
	
	
<span class="pageMajorHeading">Recent Major Updates</span>
<br />
<br />
<p><strong>Dec. 20, 2019:</strong> Revision 7 is posted online. <a href="supplement_summary.html#rev7">Summary of Revision 7</a>.
<p><strong>Sep. 21, 2018:</strong> Revision 6 is posted online. <a href="supplement_summary.html#rev6">Summary of Revision 6</a>.
<p><strong>Dec. 21, 2017:</strong> Revision 5 is posted online. <a href="supplement_summary.html#rev5">Summary of Revision 5</a>.
<p><strong>Dec. 23, 2016:</strong> Revision 4 is posted online. <a href="supplement_summary.html#rev4">Summary of Revision 4</a>.	
<p><strong>Feb. 26, 2016:</strong> Regional eFlora keys now available in <a href="filter_keys.html">KeyBase</a>. 
<p><strong>Dec. 18, 2015:</strong> Revision 3 is posted online. <a href="supplement_summary.html#rev3">Summary of Revision 3</a>.
<p><strong>Dec. 8, 2015: New eFlora taxon pages are now available</strong>, featuring illustrations, more photographs, and neater display and navigation.</p>
<p><strong>Sept. 21, 2015: </strong><a href="/eflora/KR_update.html">Geographic Subdivisions Map updated</a> to reflect Klamath Ranges geology.</p>
<br />
<p><strong>List of all updates.</strong><a href="/eflora/IJM_update_history.html"> Click here </a>for the comprehensive list (2011-2018) and to see when the eflora was last updated with minor corrections.</p>
<br />
<br />



<p class=bodyText><b>Editors</b></p>
<p class=bodyText><a href="../jepsonflora/staff.html#Baldwin">Bruce&nbsp;G. Baldwin</a>, Convening Editor, University and Jepson Herbaria</p>
<p class=bodyText><a href="../jepsonflora/staff.html#Keil">David J. Keil</a>, Professor Emeritus, California Polytechnic State University, San Luis Obispo</p>
<p class=bodyText><a href="../jepsonflora/staff.html#Markos">Staci&nbsp;Markos</a>, Assistant Director for Development &amp; Outreach, University and Jepson Herbaria</p>
<p class=bodyText><a href="../people/mishler.html">Brent D. Mishler</a>, Director, University and Jepson Herbaria</p>
<p class=bodyText><a href="../jepsonflora/staff.html#Patterson">Robert Patterson</a>, Department of Biology, San Francisco State University</p>
<p class=bodyText><a href="../jepsonflora/staff.html#Rosatti">Thomas&nbsp;J. Rosatti</a>,&nbsp;Scientific Editor, University and Jepson Herbaria</p>
<p class=bodyText><a href="../jepsonflora/staff.html#Wilken">Dieter H. Wilken</a>, Research Associate, Santa Barbara Botanic Garden</p>
<p class=bodyText><a href="policy.html"><b>eFlora Editorial Policy</b></a></p>
<p class=bodyText><a href="mailto:interchange@lists.berkeley.edu?subject=eFlora%20comment"><b>Contact/Feedback</b></a></p>

<p class="bodyText">The <i>Jepson eFlora</i> is a product of the <a href="../jepsonflora/index.html">Jepson Flora Project</a>.</p>
<!--
<hr width=30%>
We encourage links to these pages, but the content may not be downloaded for reposting, repackaging, redistributing, or sale in any form, without written permission from the Jepson Herbarium.
<br>
</span>
Copyright &copy; 2013 Regents of the University of California
</td>
<td>
&nbsp;
</td>
</tr>-->
</table>

<!-- Begin footer -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/footer.php'); ?>
<!-- End footer -->

<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-43909100-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

</body>
</html>
