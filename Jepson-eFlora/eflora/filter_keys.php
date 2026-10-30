<html xmlns="http://www.w3.org/1999/xhtml">


<head><title>Jepson Herbarium: Jepson Flora Project: Jepson eFlora: Filter Keys</title> 
<link href="http://ucjeps.berkeley.edu/common/styles/dropdowns.css" rel="stylesheet" type="text/css" />
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

       <td width="100%"><span class="pageName"><a href="/IJM.html">Jepson eFlora:</a> Filtered Keys using KeyBase</span><br /><br />

</td>
</tr>
</table>


<!--<span class="pageName">Filtered Keys using KeyBase</span>-->
<P class=bodyText>
<a href="http://keybase.rbg.vic.gov.au">KeyBase</a> is a dichotomous key platform hosted by <a href="http://www.rbg.vic.gov.au">Royal Botanical Gardens, Victoria</a>, with an interface that allows one to easily navigate dichotomous keys and "filter" them with a checklist, removing key leads that do not pertain to any terminal taxa in the checklist.
</P>

<P class=bodyText>
The Jepson eFlora dichotomous keys are fully integrated into KeyBase, essentially making a regional flora available for any of the Jepson bioregions. Select the region in which you found your plant, and you will be taken to a simplified version of the eFlora keys in KeyBase. (e.g. <a href="http://keybase.rbg.vic.gov.au/projects/show/11?filter_id=55b17602c0f1b">Key to Plants of the Sierra Nevada</a>, <a href="http://keybase.rbg.vic.gov.au/projects/show/11?filter_id=55b2b2c2b012a">Key to Plants of the San Gabriel Mountains</a>) Taxon names in KeyBase link back to Jepson eFlora taxon pages. 
</P>

<p class="pageSubheading">
<b>Get Started: </b>
<select onchange="window.location=this.value">
<option>Select a region</option>
<?php 
$keybase_URL='http://keybase.rbg.vic.gov.au/projects/show/11?filter_id='; 

echo "<OPTION VALUE='".$keybase_URL."55b170288bcf6'>CA-FP"; 
echo "<OPTION VALUE='".$keybase_URL."55b170cba8466'>&nbsp;&nbsp;NW";
echo "<OPTION VALUE='".$keybase_URL."555f5b4bd9412'>&nbsp;&nbsp;&nbsp;&nbsp;NCo";
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

<p class="bodyText"><b>NOTE:</b> The KeyBase taxon filters are based on Jepson eFlora author's assertions of taxon ranges. As we have discovered from comparing <a href=http://ucjeps.berkeley.edu/consortium>Consortium of California Herbaria (CCH)</a> specimen records to eFlora authored ranges in the <a href=http://ucjeps.berkeley.edu/consortium/about_yellow.html>Yellow Flag project</a>, there are many plant populations that occur outside the eFlora authored ranges. If a filtered key does not bring you to an answer that matches the plant you are identifying, try using a more relaxed filter (e.g. use the <a href="http://keybase.rbg.vic.gov.au/projects/show/11?filter_id=55b17602c0f1b">Sierra Nevada filter</a> instead of the <a href="http://keybase.rbg.vic.gov.au/projects/show/11?filter_id=55b1786030b36">Central Sierra Nevada Foothills filter</a>), or use the full key if necessary.</p>

<p class="bodyText">For feedback regarding KeyBase software, contact Niels Klazenga (<a href="mailto:Niels.Klazenga@rbg.vic.gov.au">Niels.Klazenga@rbg.vic.gov.au</a>)
<br>
For feedback regarding how Jepson eFlora content is displayed in KeyBase, contact the Jepson Online Interchange (<a href="mailto:interchange@lists.berkeley.edu">interchange@lists.berkeley.edu</a>)
</p>

<hr width=90%><br>

<table>
<tr>
<td width=50% valign=top>
<!-- <img align="center" src="http://ucjeps.berkeley.edu/cgi-bin/new_jmap.pl?ffffffffff"> -->
<img align="center"  src="exploded_map.png">
</td>

<td width=25% valign=top>
<span class="bodyText"><b>CA-FP</b> California Floristic Province<br></span>
<br>
<b>&nbsp;&nbsp;NW</b> Northwestern California<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;KR</b> <br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NCo</b> North Coast<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NCoR</b> North Coast Ranges<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NCoRO</b> Outer North Coast Ranges<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NCoRI</b> Inner North Coast Ranges<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NCoRH</b> High North Coast Ranges<br>
<br>
<b>&nbsp;&nbsp;CaR</b> Cascade Ranges<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CaRF</b> Cascade Range Foothills<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CaRH</b> High Cascade Ranges<br>
<br>
<b>&nbsp;&nbsp;SN</b> Sierra Nevada<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNF</b> Sierra Nevada Foothills<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nSNF</b> northern Sierra Nevada Foothills<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cSNF</b> central Sierra Nevada Foothills<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sSNF</b> southern Sierra Nevada Foothills<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNH</b> High Sierra Nevada<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nSNH</b> northern High Sierra Nevada<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cSNH</b> central High Sierra Nevada<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sSNH</b> sourthern High Sierra Nevada<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Teh</b> Tehachapi Mountains Area<br>
<br>
<b>&nbsp;&nbsp;GV</b> Great Central Valley<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ScV</b> Sacramento Valley<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SnJV</b> San Joaquin Valley<br>
<br>
<b>&nbsp;&nbsp;CW</b> Central Western California<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CCo</b> <br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SnFrB</b> <br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SCoR</b> South Coast Ranges<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SCoRO</b> Outer South Coast Ranges<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SCoRI</b> Inner South Coast Ranges<br>
</td>
<td width=25% valign="top">
<b>&nbsp;&nbsp;SW</b> Southwestern California<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SCo</b> South Coast<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ChI</b> Channel Islands<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nChI</b> northern Channel Islands<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sChI</b> southern Channel Islands<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PR</b> Peninsular Ranges<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SnJt</b> San Jacinto Mountains<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PR exc SnJt</b> PR excluding SnJt<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TR</b> Transverse Ranges<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;WTR</b> Western Transverse Ranges<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SnGb</b> San Gabriel Mountains<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SnBr</b> San Bernardino Mountains<br>
<br><br><br>
<span class="bodyText"><b>GB</b> Great Basin Province<br></span>
<br>
<b>&nbsp;&nbsp;MP</b> Modoc Plateau<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Wrn</b> Warner Mountains<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MP exc Wrn</b> MP excluding Wrn<br>
<b>&nbsp;&nbsp;SNE</b> East of Sierra Nevada<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;W&amp;I</b> White and Inyo Mountains<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNE exc W&amp;I</b> SNE excluding W&amp;I<br>
<br><br><br>
<span class="bodyText"><b>D</b> Desert Province<br></span>
<br>
<b>&nbsp;&nbsp;DMoj</b> Mojave Desert<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DMtns</b> Desert Mountains<br>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DMoj exc DMtns</b> DMoj excluding DMtns<br>
<b>&nbsp;&nbsp;DSon</b> Sonoran Desert<br>
</td></tr>

<tr><td>&nbsp;</td></tr>
</table>

<P class=bodyText>
The Jepson eFlora divides California into 35 ecologically distinct "bioregions" for the purpose of indicating where plant taxa grow. These divisions are grouped into regions, which are grouped into three main "provinces", as shown in the maps above.
</P>

<P class=bodyText>
Each terminal taxon treatment in the Jepson eFlora indicates the treatments in which the taxon is asserted to occur. Using this information, a checklist for any subregion, region or province can be made (see the <a href="http://ucjeps.berkeley.edu/IJM_tools.html">eFlora Tools page</a> for a tool that does exactly that).
</P>
<br>

<P class=bodyText>
For full descriptions of each bioregion, see <a href="http://ucjeps.berkeley.edu/eflora/geography.html">Geographic Subdivisions of California</a>
</P>

</div>

<!-- Begin banner -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/footer.php'); ?>
<!-- End banner -->

</body>

</html>

