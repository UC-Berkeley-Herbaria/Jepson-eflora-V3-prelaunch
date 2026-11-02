<html xmlns="http://www.w3.org/1999/xhtml">


<head><title>Jepson Herbarium: Jepson Flora Project: Jepson eFlora: Filter Keys</title> 
<link href="/common/styles/dropdowns.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-27128382-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
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
</head>

<body>

<!-- Begin banner -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/header_jeps.php'); ?>
<!-- End banner -->

<!-- Beginning of horizontal menu -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/globalnav.php'); ?>
<!-- End of horizontal menu -->

<!-- Start of sidebar menu-->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/localnav_media.php'); ?>
<!-- End of sidebar --> 

 <table border="0">
   <tr>

       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
     </tr>
   <tr>
       <td>&nbsp;</td>
       <td>&nbsp;</td>

       <td width="100%"><span class="pageName"><a href="/eflora/">Jepson eFlora:</a> Filtered Keys using KeyBase</span><br /><br />

</td>
</tr>
</table>


<!--<span class="pageName">Filtered Keys using KeyBase</span>-->
<P class=bodyText>
<a href="https://keybase.rbg.vic.gov.au">KeyBase</a> is a dichotomous key platform hosted by <a href="https://www.rbg.vic.gov.au">
Royal Botanical Gardens, Victoria</a>, with an interface that allows one to easily navigate dichotomous keys and "filter" them with a 
checklist, removing key leads that do not pertain to any terminal taxa in the checklist.
</P>

<P class=bodyText>
The Jepson eFlora dichotomous keys are fully integrated into KeyBase, essentially making a regional flora available for any of the 
Jepson bioregions. Select the region in which you found your plant, and you will be taken to a simplified version of the eFlora keys in 
KeyBase. (e.g. <a href="https://keybase.rbg.vic.gov.au/projects/show/11?filter_id=55b17602c0f1b">Key to Plants of the Sierra Nevada</a>, 
<a href="https://keybase.rbg.vic.gov.au/projects/show/11?filter_id=55b2b2c2b012a">Key to Plants of the San Gabriel Mountains</a>) 
Taxon names in KeyBase link back to Jepson eFlora taxon pages. 
</P>

<p class="pageSubheading">
<b>Get Started: </b>
<select onchange="window.location=this.value">
<option>Select a region</option>
<?php 
$keybase_URL='https://keybase.rbg.vic.gov.au/projects/show/11?filter_id='; 

echo "<OPTION VALUE='".$keybase_URL."55b170288bcf6'>CA-FP"; 
echo "<OPTION VALUE='".$keybase_URL."55b170cba8466'>&nbsp;&nbsp;NW";
echo "<OPTION VALUE='".$keybase_URL."55aff8e88ef27'>&nbsp;&nbsp;&nbsp;&nbsp;NCo";
echo "<OPTION VALUE='".$keybase_URL."55b17156b4fee'>&nbsp;&nbsp;&nbsp;&nbsp;NCoR";
echo "<OPTION VALUE='".$keybase_URL."55b171ec82777'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NCoRO";
echo "<OPTION VALUE='".$keybase_URL."55b1724878ef5'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NCoRI";
echo "<OPTION VALUE='".$keybase_URL."55b172bf8d639'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NCoRH";
echo "<OPTION VALUE='".$keybase_URL."55b1733fc8519'>&nbsp;&nbsp;&nbsp;&nbsp;KR";
echo "<OPTION VALUE='".$keybase_URL."55b1745e144c1'>&nbsp;&nbsp;CaR";
echo "<OPTION VALUE='".$keybase_URL."55b1749a9a0d4'>&nbsp;&nbsp;&nbsp;&nbsp;CaRF";
echo "<OPTION VALUE='".$keybase_URL."55b174ce78354'>&nbsp;&nbsp;&nbsp;&nbsp;CaRH";
echo "<OPTION VALUE='".$keybase_URL."55b17602c0f1b'>&nbsp;&nbsp;SN";
echo "<OPTION VALUE='".$keybase_URL."55b1766392974'>&nbsp;&nbsp;&nbsp;&nbsp;SNF";
echo "<OPTION VALUE='".$keybase_URL."55b176ac57912'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nSNF";
echo "<OPTION VALUE='".$keybase_URL."55b1770d1550d'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cSNF";
echo "<OPTION VALUE='".$keybase_URL."55b177750bbe9'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sSNF";
echo "<OPTION VALUE='".$keybase_URL."55b177d35eb66'>&nbsp;&nbsp;&nbsp;&nbsp;SNH";
echo "<OPTION VALUE='".$keybase_URL."55b1781c9b6d5'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nSNH";
echo "<OPTION VALUE='".$keybase_URL."55b1786030b36'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cSNH";
echo "<OPTION VALUE='".$keybase_URL."55b178a9a0308'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sSNH";
echo "<OPTION VALUE='".$keybase_URL."55b178e43e258'>&nbsp;&nbsp;&nbsp;&nbsp;Teh";
echo "<OPTION VALUE='".$keybase_URL."55b1792650e5b'>&nbsp;&nbsp;GV";
echo "<OPTION VALUE='".$keybase_URL."55b1797f9cfb5'>&nbsp;&nbsp;&nbsp;&nbsp;ScV";
echo "<OPTION VALUE='".$keybase_URL."55b179de3bbf5'>&nbsp;&nbsp;&nbsp;&nbsp;SnJV";
echo "<OPTION VALUE='".$keybase_URL."55b17a31cf863'>&nbsp;&nbsp;CW";
echo "<OPTION VALUE='".$keybase_URL."55b17a781edc3'>&nbsp;&nbsp;&nbsp;&nbsp;SCoR";
echo "<OPTION VALUE='".$keybase_URL."55b17ab2d18ce'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SCoRO";
echo "<OPTION VALUE='".$keybase_URL."55b17af48f89c'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SCoRI";
echo "<OPTION VALUE='".$keybase_URL."55b17b2b4727a'>&nbsp;&nbsp;&nbsp;&nbsp;CCo";
echo "<OPTION VALUE='".$keybase_URL."55b17b6f8c990'>&nbsp;&nbsp;&nbsp;&nbsp;SnFrB";
echo "<OPTION VALUE='".$keybase_URL."55b2adfc61694'>&nbsp;&nbsp;SW";
echo "<OPTION VALUE='".$keybase_URL."55b2ae37417d0'>&nbsp;&nbsp;&nbsp;&nbsp;SCo";
echo "<OPTION VALUE='".$keybase_URL."55b2ae717f0da'>&nbsp;&nbsp;&nbsp;&nbsp;ChI";
echo "<OPTION VALUE='".$keybase_URL."55b2afde641a1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nChI";
echo "<OPTION VALUE='".$keybase_URL."55b2b0267f3ef'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sChI";
echo "<OPTION VALUE='".$keybase_URL."55b2b0d0049d1'>&nbsp;&nbsp;&nbsp;&nbsp;PR";
echo "<OPTION VALUE='".$keybase_URL."55b2b1f07ea5c'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SnJt";
echo "<OPTION VALUE='".$keybase_URL."55b2b1734dfe2'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PR exc SnJt";
echo "<OPTION VALUE='".$keybase_URL."55b2b21d85db8'>&nbsp;&nbsp;&nbsp;&nbsp;TR";
echo "<OPTION VALUE='".$keybase_URL."55b2b2515699c'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;WTR";
echo "<OPTION VALUE='".$keybase_URL."55b2b2c2b012a'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SnGb";
echo "<OPTION VALUE='".$keybase_URL."55b2b2ed1e60a'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SnBr";
echo "<OPTION VALUE='".$keybase_URL."55b2b328a6c33'>GB";
echo "<OPTION VALUE='".$keybase_URL."55b2b354ce822'>&nbsp;&nbsp;MP";
echo "<OPTION VALUE='".$keybase_URL."55b2b395be910'>&nbsp;&nbsp;&nbsp;&nbsp;Wrn";
echo "<OPTION VALUE='".$keybase_URL."55b2bc673cc71'>&nbsp;&nbsp;&nbsp;&nbsp;MP exc Wrn";
echo "<OPTION VALUE='".$keybase_URL."55b2c44e2c5b0'>&nbsp;&nbsp;SNE";
echo "<OPTION VALUE='".$keybase_URL."55b2c47fccb83'>&nbsp;&nbsp;&nbsp;&nbsp;W&amp;I";
echo "<OPTION VALUE='".$keybase_URL."55b2c4b0161d1'>&nbsp;&nbsp;&nbsp;&nbsp;SNE exc W&amp;I";
echo "<OPTION VALUE='".$keybase_URL."55b2c4e100452'>D";
echo "<OPTION VALUE='".$keybase_URL."55b2c685e9f88'>&nbsp;&nbsp;DMoj";
echo "<OPTION VALUE='".$keybase_URL."55b2c6c106634'>&nbsp;&nbsp;&nbsp;&nbsp;DMtns";
echo "<OPTION VALUE='".$keybase_URL."55b2c6ec0cf79'>&nbsp;&nbsp;&nbsp;&nbsp;DMoj exc DMtns";
echo "<OPTION VALUE='".$keybase_URL."55b2c7111acde'>&nbsp;&nbsp;DSon";
?>
</select>
</p>

<p class="bodyText"><b>NOTE:</b> The KeyBase taxon filters are based on Jepson eFlora author's assertions of taxon ranges. 
As we have discovered from comparing <a href="/consortium/">Consortium of California Herbaria (CCH)</a> 
specimen records to eFlora authored ranges in the <a href="/consortium/about_yellow.html">Yellow Flag project</a>, 
there are many plant populations that occur outside the eFlora authored ranges. 
If a filtered key does not bring you to an answer that matches the plant you are identifying, 
try using a more relaxed filter (e.g. use the 
<a href="https://keybase.rbg.vic.gov.au/projects/show/11?filter_id=55b17602c0f1b">Sierra Nevada filter</a> 
instead of the <a href="https://keybase.rbg.vic.gov.au/projects/show/11?filter_id=55b1786030b36">Central Sierra Nevada Foothills filter</a>),
 or use the full key if necessary.</p>

<p class="bodyText">For feedback regarding KeyBase software, contact Niels Klazenga 
(<a href="mailto:Niels.Klazenga@rbg.vic.gov.au">Niels.Klazenga@rbg.vic.gov.au</a>)
<br>
For feedback regarding how Jepson eFlora content is displayed in KeyBase, contact Jason Alexander 
(<a href="mailto:jason_alexander@berkeley.edu">jason_alexander@berkeley.edu</a>)
</p>

<hr width=95%><br />
<table width=100% valign=top>
<tr>
<td width=45% valign=top>
<!-- <img align="center" src="http://ucjeps.berkeley.edu/cgi-bin/new_jmap.pl?ffffffffff"> -->
<img align="center"  src="/images/exploded_map.png">
</td>

<td width=50% valign=top>

<table><tr><td valign="top">
<p><span class="bodyText"><b>List California Floristic Provinces, Regions and Bioregions<br /></span>
<b>(click on any link on the list below to view the filtered key)<br /><br /></span></p>
</td></tr>
<tr><td>

<table><tr><td width=270px valign="top">
<?php 
$keybase_URL='https://keybase.rbg.vic.gov.au/projects/show/11?filter_id=';
echo '<p style="font-size:1.2em">';
echo '<b>CA-FP</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'55b170288bcf6">California Floristic Province</a><br />';
echo '</p>';
echo '<p>';
echo '<b>&nbsp;&nbsp;NW</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'55b170cba8466">Northwestern California</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;NCo</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'55aff8e88ef27">North Coast</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;NCoR</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'55b17156b4fee">North Coast Ranges</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NCoRO</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'55b171ec82777">Outer North Coast Ranges</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NCoRI</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'55b1724878ef5">Inner North Coast Ranges</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NCoRH</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'55b172bf8d639">High North Coast Ranges</a><br />';
echo '<b>&nbsp;&nbsp;&nbsp;&nbsp;KR</b>&nbsp;&nbsp;<a href="'.$keybase_URL.'55b1733fc8519">Klamath Ranges</a><br />';
echo '</p>';
?>
<p>
<b>&nbsp;&nbsp;CaR</b>&nbsp;&nbsp;Cascade Ranges<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;CaRF</b>&nbsp;&nbsp;Cascade Range Foothills<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;CaRH</b>&nbsp;&nbsp;High Cascade Ranges<br>
</p>
<p>
<b>&nbsp;&nbsp;SN</b>&nbsp;&nbsp;Sierra Nevada<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;SNF</b>&nbsp;&nbsp;Sierra Nevada Foothills<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nSNF</b>&nbsp;&nbsp;northern Sierra Nevada Foothills<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cSNF</b>&nbsp;&nbsp;central Sierra Nevada Foothills<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sSNF</b>&nbsp;&nbsp;southern Sierra Nevada Foothills<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;SNH</b>&nbsp;&nbsp;High Sierra Nevada<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nSNH</b>&nbsp;&nbsp;northern High Sierra Nevada<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cSNH</b>&nbsp;&nbsp;central High Sierra Nevada<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sSNH</b>&nbsp;&nbsp;sourthern High Sierra Nevada<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;Teh</b>&nbsp;&nbsp;Tehachapi Mountains Area<br>
</p>
<p>
<b>&nbsp;&nbsp;GV</b>&nbsp;&nbsp;Great Central Valley<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;ScV</b>&nbsp;&nbsp;Sacramento Valley<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;SnJV</b>&nbsp;&nbsp;San Joaquin Valley<br>
</p>
<p>
<b>&nbsp;&nbsp;CW</b>&nbsp;&nbsp;Central Western California<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;CCo</b>&nbsp;&nbsp;Central Coast<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;SnFrB</b>&nbsp;&nbsp;San Francisco Bay Area<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;SCoR</b>&nbsp;&nbsp;South Coast Ranges<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SCoRO</b>&nbsp;&nbsp;Outer South Coast Ranges<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SCoRI</b>&nbsp;&nbsp;Inner South Coast Ranges<br>
<p/>
</td>
<td width=320px valign="top">
<p>
<b>&nbsp;&nbsp;SW</b>&nbsp;&nbsp;Southwestern California<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;SCo</b>&nbsp;&nbsp;South Coast<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;ChI</b>&nbsp;&nbsp;Channel Islands<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nChI</b>&nbsp;&nbsp;northern Channel Islands<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sChI</b>&nbsp;&nbsp;southern Channel Islands<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;PR</b>&nbsp;&nbsp;Peninsular Ranges<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SnJt</b>&nbsp;&nbsp;San Jacinto Mountains<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PR exc SnJt</b>&nbsp;&nbsp;Peninsular Ranges excluding SnJt<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;TR</b>&nbsp;&nbsp;Transverse Ranges<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;WTR</b>&nbsp;&nbsp;Western Transverse Ranges<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SnGb</b>&nbsp;&nbsp;San Gabriel Mountains<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SnBr</b>&nbsp;&nbsp;San Bernardino Mountains<br>
</p>
<p style="font-size:1.2em">
<b>GB</b>&nbsp;&nbsp;Great Basin Province<br>
</p>
<p>
<b>&nbsp;&nbsp;MP</b>&nbsp;&nbsp;Modoc Plateau<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;Wrn</b>&nbsp;&nbsp;Warner Mountains<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;MP exc Wrn</b>&nbsp;&nbsp;Modoc Plateau excluding Wrn<br>
<b>&nbsp;&nbsp;SNE</b>&nbsp;&nbsp;East of Sierra Nevada<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;W&amp;I</b>&nbsp;&nbsp;White and Inyo Mountains<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;SNE exc W&amp;I</b>&nbsp;&nbsp;East of Sierra Nevada excluding W&amp;I<br>
</p>
<p style="font-size:1.2em">
<b>D</b>&nbsp;&nbsp;Desert Province<br>
</p>
<p>
<b>&nbsp;&nbsp;DMoj</b>&nbsp;&nbsp;Mojave Desert<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;DMtns</b>&nbsp;&nbsp;Desert Mountains<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;DMoj exc DMtns</b>&nbsp;&nbsp;Mojave Desert excluding DMtns<br>
<b>&nbsp;&nbsp;DSon</b>&nbsp;&nbsp;Sonoran Desert<br>
</p>
</td></tr>
</table>

</td></tr>
</table>

</td></tr>

<tr><td>&nbsp;</td></tr>
</table>

<P class=bodyText>
The Jepson eFlora divides California into 35 ecologically distinct "bioregions" for the purpose of indicating where plant taxa grow. 
These divisions are grouped into regions, which are grouped into three main "provinces", as shown in the maps above.
</P>

<P class=bodyText>
Each terminal taxon treatment in the Jepson eFlora indicates the treatments in which the taxon is asserted to occur. 
Using this information, a checklist for any bioregion, region or province can be made (see the <a href="/eflora/tools/">eFlora Tools page</a>
 for a tool that does exactly that).
</P>
<br>

<P class=bodyText>
For full descriptions of each bioregion, see <a href="/eflora/geography.html">Geographic Subdivisions of California</a>
</P>

</div>

<!--Begin footer-->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/eflora_footer.php'); ?>
<!--End footer-->

</body>

</html>

