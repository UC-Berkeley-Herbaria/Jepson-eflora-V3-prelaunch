
<html lang="en">
<html lang="en"><head>

<title>Filter Key Intro: Jepson eFlora - Jepson Herbarium - Jepson Flora Project</title>
<meta charset="UTF-8">
<meta name="description" content="The Jepson eFlora is the foremost authority on the native and naturalized vascular plants of California. For plants occurring in wildlands or otherwise outside of cultivation, the Jepson eFlora contains taxonomic treatments, distribution maps, illustrations, photographs, and identification keys."  />
	<meta name="keywords" content="Jepson eFlora, Jepson Flora Project, California Flora, Flora of California, Vascular Plants of California">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link href="/eflora/common/css/dropdowns.css" rel="stylesheet" type="text/css" />
	<link rel="shortcut icon" href="eflora/common/images/JepsonLogoSmall.png" type="image/x-icon" />
	<!--jquery script files-->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="/eflora/common/js/dh_custom.js"></script>

<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-T5YC99QF6Q"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-T5YC99QF6Q');
</script>


</head>

<body>

<!-- Begin banner -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/header_jeps.php'); ?>
<!-- End banner -->

<!-- Beginning of horizontal menu -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/globalnav.php'); ?>
<!-- End of horizontal menu -->
<table style="vertical-align: top;width:100%;">
  <tr>
	<td style="vertical-align: top;width:200px;border-right-style: solid;border-right-color: #9090AA;border-left-style: solid;border-left-color: #9090AA;">
		<div style="border-bottom-style: solid;">
<!-- Start of sidebar menu-->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/localnav_media.php'); ?>
<!-- End of sidebar -->
		</div>
	</td>
	<td style="padding: 5px;vertical-align: top; width:100%;">

<!-- Begin body section-->



<h1><a href="/eflora/">Jepson eFlora:</a> Filtered Keys using KeyBase</h1>



<!--<span class="pageName">Filtered Keys using KeyBase</span>-->
<p class=bodyText>
<a href="https://keybase.rbg.vic.gov.au">KeyBase</a> is a dichotomous key platform hosted by <a href="https://www.rbg.vic.gov.au">
Royal Botanical Gardens, Victoria</a>, with an interface that allows one to easily navigate dichotomous keys and "filter" them with a
checklist, removing key leads that do not pertain to any terminal taxa in the checklist.
</p>

<p class=bodyText>
The Jepson eFlora dichotomous keys are fully integrated into KeyBase, essentially making a regional flora available for any of the
Jepson bioregions. Select the region in which you found your plant, and you will be taken to a simplified version of the eFlora keys in
KeyBase. (e.g. <a href="https://keybase.rbg.vic.gov.au/projects/show/11?filter_id=6520bf5d52cd7">Key to Plants of the Sierra Nevada</a>,
<a href="https://keybase.rbg.vic.gov.au/projects/show/11?filter_id=6521048e2d094">Key to Plants of the San Gabriel Mountains</a>)
Taxon names in KeyBase link back to Jepson eFlora taxon pages.
</p>

<p class="pageSubheading">
<b>Get Started: </b>
<select onchange="window.location=this.value">
<option>Select a region</option>
<?php
$keybase_URL='https://keybase.rbg.vic.gov.au/projects/show/11?filter_id=';

echo "<OPTION VALUE='".$keybase_URL."65711209297e3'>CA-FP";
echo "<OPTION VALUE='".$keybase_URL."65207c1c00253'>&nbsp;&nbsp;NW";
echo "<OPTION VALUE='".$keybase_URL."65207c9ec5a68'>&nbsp;&nbsp;&nbsp;&nbsp;NCo";
echo "<OPTION VALUE='".$keybase_URL."65207d079cd58'>&nbsp;&nbsp;&nbsp;&nbsp;NCoR";
echo "<OPTION VALUE='".$keybase_URL."65207d66824d4'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NCoRH";
echo "<OPTION VALUE='".$keybase_URL."65207db2945b7'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NCoRI";
echo "<OPTION VALUE='".$keybase_URL."65207dfcbabe9'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NCoRO";
echo "<OPTION VALUE='".$keybase_URL."65207e3f8f49e'>&nbsp;&nbsp;&nbsp;&nbsp;KR";
echo "<OPTION VALUE='".$keybase_URL."65207e8abafa9'>&nbsp;&nbsp;CaR";
echo "<OPTION VALUE='".$keybase_URL."65207ebad5ea1'>&nbsp;&nbsp;&nbsp;&nbsp;CaRF";
echo "<OPTION VALUE='".$keybase_URL."65207f0443b12'>&nbsp;&nbsp;&nbsp;&nbsp;CaRH";
echo "<OPTION VALUE='".$keybase_URL."6520bf5d52cd7'>&nbsp;&nbsp;SN";
echo "<OPTION VALUE='".$keybase_URL."6520c1d1d138d'>&nbsp;&nbsp;&nbsp;nSN (nSNF + nSNH)";
echo "<OPTION VALUE='".$keybase_URL."6520c2623b603'>&nbsp;&nbsp;&nbsp;cSN (cSNF + cSNH)";
echo "<OPTION VALUE='".$keybase_URL."6520c2c402349'>&nbsp;&nbsp;&nbsp;sSN (sSNF + sSNH)";
echo "<OPTION VALUE='".$keybase_URL."6520bff351cf9'>&nbsp;&nbsp;&nbsp;&nbsp;SNF";
echo "<OPTION VALUE='".$keybase_URL."6520c0d3223ba'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nSNF";
echo "<OPTION VALUE='".$keybase_URL."6520c2623b603'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cSNF";
echo "<OPTION VALUE='".$keybase_URL."6520c3dfe9e57'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sSNF";
echo "<OPTION VALUE='".$keybase_URL."6520c2623b603'>&nbsp;&nbsp;&nbsp;&nbsp;SNH";
echo "<OPTION VALUE='".$keybase_URL."6520c5617a2e3'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nSNH";
echo "<OPTION VALUE='".$keybase_URL."6520c5b64970b'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cSNH";
echo "<OPTION VALUE='".$keybase_URL."6520c61adbc83'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sSNH";
echo "<OPTION VALUE='".$keybase_URL."6520c4ec0b0a3'>&nbsp;&nbsp;&nbsp;&nbsp;Teh";
echo "<OPTION VALUE='".$keybase_URL."6520d30f6664e'>&nbsp;&nbsp;GV";
echo "<OPTION VALUE='".$keybase_URL."6520d418b4dca'>&nbsp;&nbsp;&nbsp;&nbsp;ScV";
echo "<OPTION VALUE='".$keybase_URL."6520d4843ea7d'>&nbsp;&nbsp;&nbsp;&nbsp;SnJV";
echo "<OPTION VALUE='".$keybase_URL."6520de133613b'>&nbsp;&nbsp;CW";
echo "<OPTION VALUE='".$keybase_URL."6520da49e1811'>&nbsp;&nbsp;&nbsp;&nbsp;CCo";
echo "<OPTION VALUE='".$keybase_URL."6520dab067adb'>&nbsp;&nbsp;&nbsp;&nbsp;SnFrB";
echo "<OPTION VALUE='".$keybase_URL."6520d83790ef4'>&nbsp;&nbsp;&nbsp;&nbsp;SCoR";
echo "<OPTION VALUE='".$keybase_URL."6520dc5a92deb'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SCoRI";
echo "<OPTION VALUE='".$keybase_URL."6520dcaf5fd8a'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SCoRO";
echo "<OPTION VALUE='".$keybase_URL."6520ddb40ec8e'>&nbsp;&nbsp;SW";
echo "<OPTION VALUE='".$keybase_URL."6520de133613b'>&nbsp;&nbsp;&nbsp;&nbsp;SCo";
echo "<OPTION VALUE='".$keybase_URL."6520de618c9c3'>&nbsp;&nbsp;&nbsp;&nbsp;ChI";
echo "<OPTION VALUE='".$keybase_URL."6520dea365752'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nChI";
echo "<OPTION VALUE='".$keybase_URL."6520dee4e7e1d'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sChI";
echo "<OPTION VALUE='".$keybase_URL."6521024e2acb9'>&nbsp;&nbsp;&nbsp;&nbsp;PR";
echo "<OPTION VALUE='".$keybase_URL."652102c289bd4'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SnJt";
echo "<OPTION VALUE='".$keybase_URL."6520e00b58d75'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PR exc SnJt";
echo "<OPTION VALUE='".$keybase_URL."65210323a95a7'>&nbsp;&nbsp;&nbsp;&nbsp;TR";
echo "<OPTION VALUE='".$keybase_URL."6521039dc40c6'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;WTR";
echo "<OPTION VALUE='".$keybase_URL."6521048e2d094'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SnGb";
echo "<OPTION VALUE='".$keybase_URL."6521051d85aef'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SnBr";
echo "<OPTION VALUE='".$keybase_URL."6521059c33e2b'>GB";
echo "<OPTION VALUE='".$keybase_URL."65210e54b3803'>&nbsp;&nbsp;MP";
echo "<OPTION VALUE='".$keybase_URL."65210ebc301ca'>&nbsp;&nbsp;&nbsp;&nbsp;Wrn";
echo "<OPTION VALUE='".$keybase_URL."653bf1c1a1ac6'>&nbsp;&nbsp;&nbsp;&nbsp;MP exc Wrn";
echo "<OPTION VALUE='".$keybase_URL."65210fd3166e5'>&nbsp;&nbsp;SNE";
echo "<OPTION VALUE='".$keybase_URL."65210f4367643'>&nbsp;&nbsp;&nbsp;&nbsp;W&amp;I";
echo "<OPTION VALUE='".$keybase_URL."6521112535f22'>&nbsp;&nbsp;&nbsp;&nbsp;SNE exc W&amp;I";
echo "<OPTION VALUE='".$keybase_URL."657115d8c4dfd'>D";
echo "<OPTION VALUE='".$keybase_URL."657117619f1cf'>&nbsp;&nbsp;DMoj";
echo "<OPTION VALUE='".$keybase_URL."657116826fa05'>&nbsp;&nbsp;&nbsp;&nbsp;DMtns";
echo "<OPTION VALUE='".$keybase_URL."65711986f0e41'>&nbsp;&nbsp;&nbsp;&nbsp;DMoj exc DMtns";
echo "<OPTION VALUE='".$keybase_URL."65711823a7da4'>&nbsp;&nbsp;DSon";
?>
</select>
</p>

<p class="bodyText"><b>NOTE:</b> The KeyBase taxon filters are based on Jepson eFlora author's assertions of taxon ranges.
As we have discovered from comparing <a href="/consortium/">Consortium of California Herbaria (CCH)</a>
specimen records to eFlora authored ranges in the <a href="/consortium/about_yellow.html">Yellow Flag project</a>,
there are many plant populations that occur outside the eFlora authored ranges.
If a filtered key does not bring you to an answer that matches the plant you are identifying,
try using a more relaxed filter (e.g. use the
<a href="https://keybase.rbg.vic.gov.au/projects/show/11?filter_id=6520bf5d52cd7">Sierra Nevada filter</a>
instead of the <a href="https://keybase.rbg.vic.gov.au/projects/show/11?filter_id=6520bff351cf9">Central Sierra Nevada Foothills filter</a>),
 or use the full key if necessary.</p>

<p class="bodyText">For feedback regarding KeyBase software, contact Niels Klazenga
(<a href="mailto:Niels.Klazenga@rbg.vic.gov.au">Niels.Klazenga@rbg.vic.gov.au</a>)
</p>
<p  class="bodyText">For feedback regarding how Jepson eFlora content is displayed in KeyBase, contact Jason Alexander
(<a href="mailto:jason_alexander@berkeley.edu">jason_alexander@berkeley.edu</a>)
</p>
<p  class="bodyText"><b>Recent Update History</b>
<br /><strong>Oct. 20, 2023:</strong> <a href="/eflora/region_updates_2023.html">Bioregion species lists</a> updated for <a href="/eflora/supplement_summary.html#rev11">Revision 11</a>.
<br /><strong>Apr. 20, 2022:</strong> <a href="/eflora/region_updates_2022.html">Bioregion species lists</a> updated for <a href="/eflora/supplement_summary.html#rev10">Revision 10</a>.
<br /><strong>Dec. 23, 2021:</strong> <a href="/eflora/region_updates_2021.html">Bioregion species lists</a> updated for <a href="/eflora/supplement_summary.html#rev9">Revision 9</a>.
</p>

<hr width=95%>
<table width=100% valign=top>
<tr>
<td width=45% valign=top>
<!-- <img align="center" src="http://ucjeps.berkeley.edu/cgi-bin/new_jmap.pl?ffffffffff"> -->
<img align="center"  src="/eflora/common/images/exploded_map.png">
</td>

<td width=50% valign=top>

<table><tr><td valign="top">
<p class="bodyText"><b>List California Provinces, Regions and Subregions</p>
<p class="bodyText"<b>(click on any link on the list below to view the filtered key)</p>
</td></tr>
<tr><td>

<table><tr><td width=270px valign="top">
<?php
$keybase_URL='https://keybase.rbg.vic.gov.au/projects/show/11?filter_id=';
echo '<p style="font-size:1.2em">';
echo '<b>CA-FP</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'65711209297e3">California Floristic Province</a><br />';
echo '</p>';
echo '<p>';
echo '<b>&nbsp;&nbsp;NW</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'65207c1c00253">Northwestern California</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;NCo</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'65207c9ec5a68">North Coast subregion</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;NCoR</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'65207d079cd58">North Coast Ranges subregion</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NCoRH</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'65207d66824d4">High North Coast Ranges district</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NCoRI</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'65207db2945b7">Inner North Coast Ranges district</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NCoRO</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'65207dfcbabe9">Outer North Coast Ranges district</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;KR</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'65207e3f8f49e">Klamath Ranges subregion</a><br />';
echo '</p>';
echo '<p>';
echo '<b>&nbsp;&nbsp;CaR</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'65207e8abafa9">Cascade Ranges</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;CaRF</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'65207ebad5ea1">Cascade Range Foothills</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;CaRH</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'65207f0443b12">High Cascade Ranges</a><br />';
echo '</p>';
echo '<p>';
echo '<b>&nbsp;&nbsp;SN</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6520bf5d52cd7">Sierra Nevada</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;nSN</b>&nbsp;&nbsp;&nbsp;<a href="'.$keybase_URL.'6520c1d1d138d">northern Sierra Nevada subregion (nSNF + nSNH)</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;cSN</b>&nbsp;&nbsp;&nbsp;<a href="'.$keybase_URL.'6520c2623b603">central Sierra Nevada subregion (cSNF + cSNH)</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;sSN</b>&nbsp;&nbsp;&nbsp;<a href="'.$keybase_URL.'6520c2c402349">southern Sierra Nevada subregion (sSNF + sSNH)</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;SNF</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6520bff351cf9">Sierra Nevada Foothills subregion</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nSNF</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6520c0d3223ba">northern Sierra Nevada Foothills</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cSNF</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6520c2623b603">central Sierra Nevada Foothills</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sSNF</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6520c3dfe9e57">southern Sierra Nevada Foothills</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;SNH</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6520c490b9942">High Sierra Nevada subregion</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nSNH</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6520c5617a2e3">northern High Sierra Nevada</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cSNH</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6520c5b64970b">central High Sierra Nevada</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sSNH</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6520c61adbc83">southern High Sierra Nevada</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;Teh</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6520c4ec0b0a3">Tehachapi Mountains subregion</a><br />';
echo '</p>';
echo '<p>';
echo '<b>&nbsp;&nbsp;GV</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6520d30f6664e">Great Central Valley</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;ScV</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6520d418b4dca">Sacramento Valley</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;SnJV</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6520d4843ea7d">San Joaquin Valley</a><br />';
echo '</p>';
echo '<p>';
echo '<b>&nbsp;&nbsp;CW</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6520d83790ef4">Central Western California</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;CCo</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6520da49e1811">Central Coast subregion</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;SnFrB</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6520dab067adb">San Francisco Bay Area subregion</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;SCoR</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6520db10f001d">South Coast Ranges subregion</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SCoRI</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6520dc5a92deb">Inner South Coast Ranges district</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SCoRO</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6520dcaf5fd8a">Outer South Coast Ranges district</a><br />';
echo '<p/>';
echo '</td>';


echo '<td width=320px valign="top">';
echo '<p>';
echo '<b>&nbsp;&nbsp;SW</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6520ddb40ec8e">Southwestern California</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;SCo</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6520de133613b">South Coast</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;ChI</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6520de618c9c3">Channel Islands</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nChI</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6520dea365752">northern Channel Islands</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sChI</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6520dee4e7e1d">southern Channel Islands</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;PR</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6521024e2acb9">Peninsular Ranges</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SnJt</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'652102c289bd4">San Jacinto Mountains</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PR exc SnJt</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6520e00b58d75">Peninsular Ranges excluding San Jacinto Mtns</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;TR</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'65210323a95a7">Transverse Ranges</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;WTR</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6521039dc40c6">Western Transverse Ranges</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SnGb</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6521048e2d094">San Gabriel Mountains</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SnBr</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6521051d85aef">San Bernardino Mountains</a><br />';
echo '</p>';


echo '<p style="font-size:1.2em">';
echo '<b>GB</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6521059c33e2b">Great Basin Province</a><br />';
echo '</p>';
echo '<p>';
echo '<b>&nbsp;&nbsp;MP</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'65210e54b3803">Modoc Plateau</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;Wrn</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'65210ebc301ca">Warner Mountains</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;MP exc Wrn</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'653bf1c1a1ac6">Modoc Plateau excluding Warner Mtns</a><br />';
echo '<b>&nbsp;&nbsp;SNE</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'65210fd3166e5">East of Sierra Nevada</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;W&amp;I</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'65210f4367643">White and Inyo Mountains</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;SNE exc W&amp;I</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'6521112535f22">East of Sierra Nevada excluding White &amp; Inyo Mtns</a><br />';
echo '</p>';


echo '<p style="font-size:1.2em">';
echo '<b>D</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'657115d8c4dfd">Desert Province</a><br />';
echo '</p>';
echo '<p>';
echo '<b>&nbsp;&nbsp;DMoj</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'657117619f1cf">Mojave Desert</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;DMtns</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'657116826fa05">Desert Mountains</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;DMoj exc DMtns</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'65711986f0e41">Mojave Desert excluding Desert Mtns</a><br />';
echo '<b>&nbsp;&nbsp;DSon</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'65711823a7da4">Sonoran Desert</a><br />';
?>
</p>
</td></tr>
</table>

</td></tr>
</table>

</td></tr>
</table>

<p class=bodyText>
The Jepson eFlora divides California into 35 ecologically distinct <em>bioregions</em> for the purpose of indicating where plant taxa grow.
The smallest subdivision defined as a distinct <em>bioregions</em>,
depends on how finely each region is ecologically divided.
One bioregion, the Sonoran Desert, is at the finest scale at the region-level, and is not divided into subregions.
The other nine regions are further divided into two or more subregions.
Seven subregions are further divided into two or more districts.
All regions are grouped into three main <em>provinces</em>, as shown in the maps above.
</p>

<p class=bodyText>
Each terminal taxon treatment in the Jepson eFlora indicates the treatments in which the taxon is asserted to occur.
Using this information, a checklist for any subregion, region or province can be made (see the <a href="/eflora/tools/">eFlora Tools page</a>
 for a tool that does exactly that).
</p>


<p class=bodyText>
For full descriptions of each bioregion, see <a href="/eflora/geography.html">Geographic Subdivisions of California</a>
</p>

   </td>
  </tr>
</table> <!--close box outline table-->

<!-- Begin footer -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/footer.php'); ?>
<!-- End footer -->


</body>
</html>


