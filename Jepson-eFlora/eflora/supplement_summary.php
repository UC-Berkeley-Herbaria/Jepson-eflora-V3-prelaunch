<?php

date_default_timezone_set('America/Los_Angeles');

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<?php 
// TID is passed to JS by using PHP to echo the value of $TaxonID to a JS variable TaxID 
// Apparently there are better ways to do this using AJAX

?>

<head>
<head>
<title>Jepson eFlora Summary Page</title> 
<meta charset="UTF-8">
<meta name="description" content="The Jepson eFlora is the foremost authority on the native and naturalized vascular plants of California. For plants occurring in wildlands or otherwise outside of cultivation, the Jepson eFlora contains taxonomic treatments, distribution maps, illustrations, photographs, and identification keys."  />
  <meta name="keywords" content="California Flora, Jepson eFlora, Flora of California, Vascular Plants of California, Jepson Flora Project, ">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link href="/common/styles/dropdowns.css" rel="stylesheet" type="text/css" />
	<link href="/common/css/jepson_eflora.css" rel="stylesheet" type="text/css" />
		<link rel="shortcut icon" href="/common/images/JepsonLogoSmall.png" type="image/x-icon" />



<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-43909100-4"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-43909100-4');
</script>

</head>

<body>
<table id="normaltable">
  <tr>
   <td class="spacer1"><img src="/common/images/common_spacer.gif" alt="" style="height:1px;width:5px;"></td>
	<td>
	 <table><!-- content table -->
	  <tr>
	   <td>
<div>
<!-- Begin banner -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/header_jeps.php'); ?>
<!-- End banner -->

<!-- Beginning of horizontal menu -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/globalnav.php'); ?>
<!-- End of horizontal menu -->
</div>

<div style="border-left-style: solid;border-left-color: #C0DFFD;border-right-style: solid;border-right-color: #C0DFFD;"><!-- Begin content divider -->
	<table style="background-color: #E6F3FF"><!-- content table -->
	 <tr>  
	  <td style="vertical-align: top;">
		<table id = "sideLinks" style="width=10vw;">
		<tr>
			<td style="vertical-align: top;"><!-- <<background test>> -->
<!-- Start of sidebar menu-->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/localnav_eflora_primary.php'); ?>
<!-- End of sidebar --> 
			</td>
		</tr>
		</table>
	  </td>
	  <td style="border-left-style: solid;border-left-color: #C0DFFD;"><img src="/common/images/common_spacer.gif" alt="" style="height:1px;width:15px;"></td>
	  <td style="padding-top: 5px;vertical-align: top;width=90vw;">
 <table>
  <tr>
    <td style="padding-top: 0;vertical-align: top;">
     <div id="content-top">
<p>
       <span class="pageName"><font size=5><a href="/eflora/">Jepson eFlora</a></font></span><br />
        <span class="pageName"><font size=5>Supplement Summary Page</font></span>
</p>


<p>
In the sections that follow are summaries of revisions that have been published online since the publication of the second edition of The Jepson Manual. 
These major revisions are published one or two times a year.  The information in these revisions is intended to supersede that in the printed Manual (TJM2). 
The revised treatments can be found in the Jepson eFlora (<a href="/eflora/">https://ucjeps.berkeley.edu/eflora/</a>).  Highlighted text in the summaries below will take you to an eFlora species page.
<br /><br />
For a list of errata and small changes in treatments that are not included here, please see: <a href="/eflora/errata.html">https://ucjeps.berkeley.edu/eflora/errata.html</a>.
<br /><br />
All previous versions of the Jepson eFlora treatments are archived according to date.  Previous versions of treatments can be provided upon request.  For further details, please e-mail <b>Jason Alexander (<a href="mailto:jason_alexander@berkeley.edu">jason_alexander@berkeley.edu)</b></a>
</p>
</blockquote>

<p>
<hr>
<!-- BEGIN revision block 1-->
<hr>
<h2 align="center"><p>
Revision 1
<br />
July 2013
</p></h2>

<blockquote class="bodyText">
Revision 1 involves treatments that have changed taxonomically (e.g., taxa added or deleted) since the publication of the second edition of <i>The Jepson Manual</i> (2012). A summary of the changes incorporated in the <i>eFlora</i> and in the PDF version of the supplement to the print book is presented below.
<br />
&nbsp;
<br />


<p class=bodyText>
<b>Brief Summary of Changes in Revision 1</b>
<br />	
	<br /><b>FERNS</b>
<br /><b>Cyatheaceae:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=98705"><i>Sphaeropteris cooperi</i></a> added to flora as naturalized, requiring treatment of <a href="/eflora/eflora_display.php?tid=5">Cyatheaceae</a> as well as its placement in Family Key, Group 3.	
<br />	
	<br /><b>ANGIOSPERMS</b>
<br /><b>Asteraceae:</b>	
<br />&nbsp;&nbsp;<i>Arida</i></a> changed to <a href="/eflora/eflora_display.php?tid=68775"><i>Leucosyris</i></a>, which has nomenclatural priority; <i>Arida</i> changed to <i>Leucosyris</i> in keys to genera of Asteraceae: in key to genera of Asteraceae, Group 6.
<br />&nbsp;&nbsp;<i>Arida carnosa</i> changed to <a href="/eflora/eflora_display.php?tid=98683"><i>Leucosyris carnosa</i></a> at key lead 15 and the leads reversed for alphabetical order (p. 217 in TJM2); in key to genera of Asteraceae, Group 14.
<br />&nbsp;&nbsp;<i>Arida arizonica</i> changed to <a href="/eflora/eflora_display.php?tid=98682"><i>Leucosyris arida</i></a> at key lead 26, and the leads reversed for alphabetical order (p. 227 in TJM2).
<br />&nbsp;&nbsp;Note under <i>Machaeranthera</i> changed to: Other taxa in TJM (1993) moved to <i>Arida</i> in TJM2 (2012); taxa included in <i>Arida</i> in TJM2 (2012) moved to <i>Leucosyris</i>. <i>Arida</i> names included in illustrations on page 247 in TJM2 to be changed to follow revised taxonomy.

<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=81020"><i>Gamochaeta argyrinea</i></a>, added as naturalized in California, with incorporation into key to species of <i>Gamochaeta</i>.
	
<br /><b>Apocynaceae:</b>	
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=9996"><i>Asclepias linaria</i></a> deleted (previous inclusion based on faulty locality data), with removal from key to members of <i>Asclepias</i> as well.

<br /><b>Boraginaceae:</b>
<br />&nbsp;&nbsp;Segregation of <i>Phacelia dalesiana</i></a> to <a href="/eflora/eflora_display.php?tid=95351"><i>Howellanthus dalesianus</i></a>; thorough revision of remainder of <i>Phacelia</i> including some taxonomic changes. 	

<br /><b>Brassicaceae:</b>	
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=46552"><i>Thysanocarpus curvipes</i></a> divided into five subspecies.
<br />&nbsp;&nbsp;<i>Thysanocarpus laciniatus</i> var. <i>hitchcockii</i> elevated to species rank as <a href="/eflora/eflora_display.php?tid=82409"><i>Thysanocarpus desertorum</i></a>.
<br />&nbsp;&nbsp;<i>Thysanocarpus laciniatus</i> var. <i>rigidus</i> elevated to species rank as <a href="/eflora/eflora_display.php?tid=46552"><i>Thysanocarpus rigidus</i></a>, leaving no varieties in <a href="/eflora/eflora_display.php?tid=46555"><i>Thysanocarpus laciniatus</i></a>

<br /><b>Chenopodiaceae:</b>	
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=11490"><i>Atriplex</i></a>: Three taxa moved to new genera <a href="/eflora/eflora_display.php?tid=95360"><i>Extriplex</i></a> and <a href="/eflora/eflora_display.php?tid=95036"><i>Stutzia</i></a>, the rest retained in <i>Atriplex</i>, with incorporation of new genera into key to genera of Chenopodiaceae. 

<br /><b>Cistaceae:</b>
<br />&nbsp;&nbsp;All members of <i>Helianthemum</i> transferred to <a href="/eflora/eflora_display.php?tid=68330"><i>Crocanthemum</i></a>, with change from <i>Helianthemum</i> to <i>Crocanthemum</i> in key to genera of Cistaceae. <i>Helianthemum scoparium</i> split into four terminal taxa. 	
	
<br /><b>Euphorbiaceae:</b>	
<br />&nbsp;&nbsp;<i>Chamaesyce</i> transferred to <a href="/eflora/eflora_display.php?tid=9260"><i>Euphorbia</i></a>, with unification under the latter in key to genera of Euphorbiaceae, and incorporation into one key of taxa treated in keys to members of <i>Chamaesyce</i> and <i>Euphorbia</i> in TJM2, into one key; the revision for Supplement I also includes addition of a species new to science, <i>E. jaegeri</i>, as well as partial treatment of taxa shown to occur as waifs in the state, <i>E. myrsinites</i> and <i>E. rigida</i>, which previously had not been included at all on the grounds that they were garden weeds that had not escaped cultivation.

<br /><b>Lamiaceae:</b>
<br />&nbsp;&nbsp;<i>Hyptis emoryi</i> becomes <a href="/eflora/eflora_display.php?tid=98461"><i>Condea emoryi</i></a>, leaving no <i>Hyptis</i> in California. 	

<br /><b>Polemoniaceae:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=98885"><i>Navarretia paradoxiclara</i></a> newly described, added, as native.
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=98884"><i>Navarretia paradoxinota</i></a> newly described, added, as native.
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=34455"><i>Navarretia intertexta</i></a> and <a href="/eflora/eflora_display.php?tid=80960"><i>Navarretia sinistra</i></a> recircumscribed.	
	
<br /><b>Primulaceae:</b>
<br />&nbsp;&nbsp;<i>Dodecatheon</i>transferred to <a href="/eflora/eflora_display.php?tid=10710"><i>Primula</i></a>, expanding the latter in California from one to twelve taxa. 
  
<br /><b>Viscaceae:</b> 
<br />&nbsp;&nbsp;<i>Phoradendron</i></a>: ruling by nomenclature committee resulted in change from <i>P. serotinum</i> and subspp. to <a href="/eflora/eflora_display.php?tid=37905"><i>P. leucarpum</i></a> and subspp., with corresponding changes in key to members of <i>Phoradendron</i>. 
</blockquote>
</p>


<p>
<H2 align="center"><a href="/eflora/TJM2_Supplement.pdf">Download Supplement 1 PDF</a></H2>
<!-- END revision block 1 -->

<!-- BEGIN revision block 2-->
<hr>
<h2 align="center"><p>
<a name="rev2" id="rev2"></a>Revision 2
<br />
December 2014
</p></h2>

<blockquote class="bodyText">
Revision 2 involves treatments that have changed taxonomically (e.g., taxa added or deleted) since the publication of the second edition of  <i>The Jepson Manual</i> (2012). A summary of the changes incorporated in the <i>eFlora</i> and in the PDF version of the second supplement to the print book is presented below.
<br />
&nbsp;
<br />


<P class=bodyText>
<b>Brief Summary of Changes in Revision 2</b>
<br />
	<br /><b>FERNS</b>
<br /><b>Pteridaceae:</b> 
<br />&nbsp;&nbsp;All CA members of <i>Cheilanthes</i> transferred to <a href="/eflora/eflora_display.php?tid=Myriopteris"><i>Myriopteris</i></a> 
<br />
	<br /><b>ANGIOSPERMS</b>
<br /><b>Adoxaceae:</b> 
<br />&nbsp;&nbsp;<i><a href="/eflora/eflora_display.php?tid=48036">Viburnum opulus</a></i> added, as naturalized, replacing <i>Viburnum edule</i>
<br />&nbsp;&nbsp;<i><a href="/eflora/eflora_display.php?tid=81254">Viburnum rigidum</a></i> added, as naturalized
<br /><b>Asteraceae:</b> 
<br />&nbsp;&nbsp;<i><a href="/eflora/eflora_display.php?tid=2456">Dittrichia viscosa</a></i> added, as naturalized
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99213"><i>Lagophylla diabolensis</i></a> newly described, added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=98665"><i>Pallenis maritima</i></a> added, as naturalized
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=95226"><i>Volutaria canariensis</i></a> added, as naturalized

<br /><b>Boraginaceae:</b>
<br />&nbsp;&nbsp;<i>Hydrophyllum capitatum</i> var. <i>alpinum</i> changed to <a href="/eflora/eflora_display.php?tid=99771"><i>Hydrophyllum alpestre</i></a>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=48535"><i>Wigandia urens</i></a> added, as naturalized

<br /><b>Cactaceae:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=80391"><i>Cylindropuntia acanthocarpa</i> var. <i>acanthocarpa</i></a> becomes the accepted name for <i>Cylindropuntia acanthocarpa</i> var. <i>coloradensis</i>, with the latter as a synonym</span>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99695"><i>Cylindropuntia chuckwallensis</i></a> newly described, added, as native</span>
<br />&nbsp;&nbsp;<i>Cylindropuntia &times;fosbergii</i> changed to <a href="/eflora/eflora_display.php?tid=80396"><i>Cylindropuntia fosbergii</i></a>

<br /><b>Ericaceae:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=40453"><i>Pyrola aphylla</i></a> added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99776"><i>Pyrola crypta</i></a> newly described, added, as native 
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=40456"><i>Pyrola dentata</i></a> added, as native

<br /><b>Fagaceae:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=40723"><i>Quercus robur</i></a> added, as waif

<br /><b>Montiaceae:</b>
<br />&nbsp;&nbsp;<i>Calandrinia ciliata</i> replaced by <a href="/eflora/eflora_display.php?tid=95066"><i>Calandrinia menziesii</i></a> added, as native
<br />&nbsp;&nbsp;<i>Calyptridium parryi</i> A. Gray var. <i>arizonicum</i> changed to <a href="/eflora/eflora_display.php?tid=95389"><i>Calyptridium arizonicum</i></a>, as native

<br /><b>Myrsinaceae:</b>
<br />&nbsp;&nbsp;<i>Anagallis arvensis</i> changed to <a href="/eflora/eflora_display.php?tid=99404"><i>Lysimachia arvensis</i></a>, as naturalized
<br />&nbsp;&nbsp;<i>Anagallis minima</i> changed to <a href="/eflora/eflora_display.php?tid=99408"><i>Lysimachia minima</i></a>, as native
<br />&nbsp;&nbsp;<i>Anagallis monelli</i> changed to <a href="/eflora/eflora_display.php?tid=99409"><i>Lysimachia monelli</i></a>, as waif
<br />&nbsp;&nbsp;<i>Anagallis</i> transferred to <a href="/eflora/eflora_display.php?tid=10709"><i>Lysimachia</i></a>, leaving no <i>Anagallis</i> in California	
<br />&nbsp;&nbsp;<i>Glaux maritima</i> changed to <a href="/eflora/eflora_display.php?tid=99407"><i>Lysimachia maritima</i></a>, as native
<br />&nbsp;&nbsp;<i>Glaux</i> transferred to <a href="/eflora/eflora_display.php?tid=10709"><i>Lysimachia</i></a>, leaving no <i>Glaux</i> in California
<br />&nbsp;&nbsp;<i>Trientalis europaea</i> changed to <a href="/eflora/eflora_display.php?tid=99405"><i>Lysimachia europaea</i></a>, as native
<br />&nbsp;&nbsp;<i>Trientalis latifolia</i> changed to <a href="/eflora/eflora_display.php?tid=99406"><i>Lysimachia latifolia</i></a>, as native
<br />&nbsp;&nbsp;<i>Trientalis</i> transferred to <a href="/eflora/eflora_display.php?tid=10709"><i>Lysimachia</i></a>, leaving no <i>Trientalis</i> in California
	
<br /><b>Polemoniaceae:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99435"><i>Polemonium eddyense</i></a> newly described, added, as native
<br />&nbsp;&nbsp;<i>Polemonium occidentale</i> subsp. <i>occidentale</i> no longer recognized, treated as synonym of <a href="/eflora/eflora_display.php?tid=38984"><i>Polemonium occidentale</i></a>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99202"><i>Polemonium pulcherrimum</i> var. <i>shastense</i></a> recognized, added, as native
	
<br /><b>Polygonaceae:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99777"><i>Chorizanthe minutiflora</i></a> newly described, added, as native

	<br /><b>Rosaceae:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=65314"><i>Rosa woodsii</i> var. <i>glabrata</i></a> added, as native and belonging to <a href="/eflora/eflora_display.php?tid=87494"><i>Rosa woodsii</i> subsp. <i>gratissima</i></a>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=65315"><i>Rosa woodsii</i> var. <i>gratissima</i></a> added, as native and belonging to <a href="/eflora/eflora_display.php?tid=87494"><i>Rosa woodsii</i> subsp. <i>gratissima</i></a>
<br />	
<br /><b>MONOCOTS</b>
<br /><b>Cyperaceae:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=98894"><i>Calliscirpus brachythrix</i></a> newly described, added, as native
<br />&nbsp;&nbsp;<i>Eriophorum crinigerum</i> transferred to <a href="/eflora/eflora_display.php?tid=98942"><i>Calliscirpus</i></a>, as <a href="/eflora/eflora_display.php?tid=98895"><i>Calliscirpus criniger</i></a>, as native
	
	
<br /><b>Poaceae:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=98887"><i>Agrostis lacuna-vernalis</i></a> newly described, added, as native
<br />
<br />

<h3 align="center"><a href="/eflora/TJM2_Supplement_II.pdf">Download Supplement 2 PDF</a></h3>
</blockquote>

<!-- END revision block 2 -->

<!-- BEGIN revision block 3-->
<hr>
<h2 align="center"><p>
<a name="rev3" id="rev3"></a>Revision 3
<br />
December 2015
</p></h2>


<blockquote class="bodyText">
Revision 3 involves treatments that have changed taxonomically (e.g., taxa added or deleted) since the publication of the second edition of <i>The Jepson Manual</i> (2012). A summary of the changes incorporated in the <i>eFlora</i> and in the PDF version of the third supplement to the print book is presented below.
<br />
&nbsp;
<br />



<b>Brief Summary of Changes in Revision 3</b><br />
	
<br /><b>ANGIOSPERMS</b>
<br /><b>Polemoniaceae:</b> 
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99214"><i>Eriastrum ertterae</i></a> newly described, added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99215"><i>Eriastrum rosamondense</i></a> newly described, added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99455"><i>Linanthus bernardinus</i></a> newly described, added, as native
<br />
<br /><b>MONOCOTS</b>
<br /><b>Cyperaceae:</b> 
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99296"><i>Carex cyrtostachya</i></a> newly described, added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=98712"><i>Carex orestera</i></a> newly described, added, as native, replacing <i>Carex albonigra</i>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99775"><i>Carex xerophila</i></a> newly described, added, as native
<br />&nbsp;&nbsp;Plants called <i>Carex albonigra</i> in TJM2 are <a href="/eflora/eflora_display.php?tid=98712"><i>Carex orestera</i></a>; <i>Carex albonigra</i> is not in California
<br /><b>Juncaceae:</b> 
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=29620"><i>Juncus bulbosus</i></a> added, as naturalized
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=29639"><i>Juncus dichotomus</i></a> added, as naturalized
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=101077"><i>Juncus elliottii</i></a> added, as naturalized
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=98862"><i>Juncus trilocularis</i></a> newly described, added, as native, replacing <i>Juncus brachyphyllus</i>
<br />&nbsp;&nbsp;Plants called <i>Juncus brachyphyllus</i> in TJM2; are <a href="/eflora/eflora_display.php?tid=98862"><i>Juncus trilocularis</i></a>; <i>Juncus brachyphyllus</i> is not in California	
</p>
<br /><br />
	
<h3 align="center"><a href="/eflora/TJM2_Supplement_III.pdf">Download Supplement 3 PDF</a></h3>
</blockquote>
	
<!-- END revision block 3 -->

<!-- BEGIN revision block 4-->
<hr>
<h2 align="center"><p>
<a name="rev4" id="rev4"></a>Revision 4
<br />
December 2016
</p></h2>

<blockquote class="bodyText">
Revision 4 involves treatments that have changed taxonomically (e.g., taxa added or deleted) since the publication of the second edition of <i>The Jepson Manual</i> (2012). A summary of the changes incorporated in the <i>eFlora</i> is presented below.
<br />
&nbsp;
<br />	
	
<p>
<b>Brief Summary of Changes in Revision 4</b><br />
<br />
	<br /><b>FERNS</b>

<br /><b>Athyriaceae:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=10761"><i>Athyrium</i></a> transferred to <a href="/eflora/eflora_display.php?tid=79419">Athyriaceae</a> from Woodsiaceae

<br /><b>Blechnaceae:</b>
<br />&nbsp;&nbsp;<i>Blechnum spicant</i> transferred to <a href="/eflora/eflora_display.php?tid=69297"><i>Struthiopteris</i></a>, as <a href="/eflora/eflora_display.php?tid=45778"><i>Struthiopteris spicant</i></a>, leaving no <i>Blechnum</i> in California

<br /><b>Cystopteridaceae:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=10766"><i>Cystopteris</i></a> transferred to <a href="/eflora/eflora_display.php?tid=101729">Cystopteridaceae</a> from Woodsiaceae

<br /><b>Pteridaceae:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=100476"><i>Adiantum shastense</i></a> newly described, added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=101693"><i>Pentagramma glanduloviscida</i></a> newly described, added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=100960"><i>Pentagramma maxonii</i></a>, elevated to species rank from <i>Pentagramma triangularis</i> subsp. <i>maxonii</i>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=101694"><i>Pentagramma rebmanii</i></a>, elevated to species rank from <i>Pentagramma triangularis</i> subsp. <i>rebmanii</i>  (which was mentioned in a note under <i>Pentagramma triangularis</i> subsp. <i>triangularis</i> in TJM2)
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=100961"><i>Pentagramma viscosa</i></a>, elevated to species rank from <i>Pentagramma triangularis</i> subsp. <i>viscosa</i>.
<br />
<br /><b>ANGIOSPERMS</b>
	
<br /><b>Asteraceae:</b>
<br />&nbsp;&nbsp;<i>Bahia neomexicana</i> transferred to <a href="/eflora/eflora_display.php?tid=555"><i>Picradeniopsis</i></a>, changed to <a href="/eflora/eflora_display.php?tid=101696"><i>Picradeniopsis multiflora</i></a>, leaving no <i>Bahia</i> in California
<br />&nbsp;&nbsp;<i>Amauriopsis dissecta</i> transferred to <a href="/eflora/eflora_display.php?tid=482"><i>Hymenothrix</i></a>, changed to <a href="/eflora/eflora_display.php?tid=101695"><i>Hymenothrix dissecta</i></a>, leaving no <i>Amauriopsis</i> in California	
	
<br /><b>Boraginaceae:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=94699"><i>Eriodictyon sessilifolium</i></a> new to California, added, as native

<br /><b>Rhamnaceae:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=100793"><i>Ceanothus decornutus</i></a> newly described, added as native, a segregate of <i>Ceanothus jepsonii</i>
<br />&nbsp;&nbsp;Plants called <i>Ceanothus vestitus</i> in TJM2 are <a href="/eflora/eflora_display.php?tid=94455"><i>Ceanothus pauciflorus</i></a>; <i>Ceanothus vestitus</i> is a synonym of <i>C. pauciflorus</i>
</p>
<br /><br />
</blockquote>

<!-- END revision block 4 -->

<!-- BEGIN revision block 5 -->
<hr>
<h2 align="center"><p>
<a name="rev5" id="rev5"></a>Revision 5
<br />
December 2017
</p></h2>

<blockquote class="bodyText"><p>
Revision 5 involves treatments that have changed taxonomically (e.g., taxa added or deleted) since Revision 4 of the <i>Jepson eFlora</i> (2016). A summary of the changes incorporated in the <i>eFlora</i> is presented below.
</p>
<br />
&nbsp;
<br />	
	
<b>Brief Summary of Changes in Revision 5</b><br />
<br />
	<br /><b>LYCOPHYTES</b>

<br /><b>Selaginellaceae:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=44058"><i>Selaginella kraussiana</i></a> added, as naturalized
<br />
<br /><b>ANGIOSPERMS</b>

<br /><b>Apiaceae:</b>
<br />&nbsp;&nbsp;<i>Lomatium dissectum</i> var. <i>multifidum</i> elevated to species rank as <a href="/eflora/eflora_display.php?tid=103317"><i>Lomatium multifidum</i></a>, leaving no varieties in <a href="/eflora/eflora_display.php?tid=31405"><i>Lomatium dissectum</i></a>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=103334"><i>Lomatium ravenii</i> var. <i>piutense</i></a> newly described, added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=103335"><i>Lomatium ravenii</i> var. <i>ravenii</i></a> recognized, as native
<br />&nbsp;&nbsp;<i>Orogenia</i> transferred to <a href="/eflora/eflora_display.php?tid=10198"><i>Lomatium</i></a>, <i>Orogenia fusiformis</i> changed to <a href="/eflora/eflora_display.php?tid=103316"><i>Lomatium fusiformis</i></a>
<br />&nbsp;&nbsp;<i>Sphenosciadium</i> transferred to <a href="/eflora/eflora_display.php?tid=10358"><i>Angelica</i></a>, <i>Sphenosciadium capitellatum</i> changed to <a href="/eflora/eflora_display.php?tid=101118"><i>Angelica capitellata</i></a>

	
<br /><b>Asteraceae:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=101119"><i>Antennaria sawyeri</i></a> newly described, added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99395"><i>Helianthus winteri</i></a> newly described, added, as native

<br /><b>Crassulaceae:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=100425"><i>Sedum citrinum</i></a> newly described, added, as native

<br /><b>Ericaceae:</b>
<br />&nbsp;&nbsp;<i>Pyrola chlorantha</i></a> removed, not in California
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=100790"><i>Vaccinium shastense</i></a> newly described, added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=100788"><i>Vaccinium shastense</i> subsp. <i>nevadense</i></a> newly described, added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=100789"><i>Vaccinium shastense</i> subsp. <i>shastense</i></a> recognized, as native

<br /><b>Linaceae:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=31174"><i>Linum trigynum</i></a> added, as naturalized

<br /><b>Onagraceae:</b>
<br />&nbsp;&nbsp;<i>Oenothera primiveris</i> subsp. <i>bufonis</i> no longer recognized, leaving no subspecies in <a href="/eflora/eflora_display.php?tid=35043"><i>Oenothera primiveris</i></a>

<br /><b>Orobanchaceae:</b>
<br />&nbsp;&nbsp;All native taxa of <i>Orobanche</i> transferred to <a href="/eflora/eflora_display.php?tid=103351"><i>Aphyllon</i></a>
<br />&nbsp;&nbsp;<i>Orobanche ramosa</i> changed to <a href="/eflora/eflora_display.php?tid=103318"><i>Phelipanche ramosa</i></a>, leaving no <i>Orobanche</i> in California
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=103326"><i>Aphyllon epigalium</i></a> newly described, added as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=103327"><i>Aphyllon epigalium</i> subsp. <i>epigalium</i></a> recognized, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=103328"><i>Aphyllon epigalium</i> subsp. <i>notocalifornicum</i></a> newly described, added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=103313"><i>Aphyllon robbinsii</i></a> newly described, added as native
<br />&nbsp;&nbsp;<i>Orobanche bulbosa</i> changed to <a href="/eflora/eflora_display.php?tid=13614"><i>Aphyllon tuberosum</i></a>
<br />&nbsp;&nbsp;<i>Orobanche californica</i> changed to <a href="/eflora/eflora_display.php?tid=103319"><i>Aphyllon californicum</i></a>
<br />&nbsp;&nbsp;<i>Orobanche californica</i> subsp. <i>californica</i> changed to <a href="/eflora/eflora_display.php?tid=103320"><i>Aphyllon californicum</i> subsp. <i>californicum</i></a>
<br />&nbsp;&nbsp;<i>Orobanche californica</i> subsp. <i>condensa</i> changed to <a href="/eflora/eflora_display.php?tid=103321"><i>Aphyllon californicum</i> subsp. <i>condensum</i></a>
<br />&nbsp;&nbsp;<i>Orobanche californica</i> subsp. <i>feudgei</i> changed to <a href="/eflora/eflora_display.php?tid=103322"><i>Aphyllon californicum</i> subsp. <i>feudgei</i></a>
<br />&nbsp;&nbsp;<i>Orobanche californica</i> subsp. <i>grandis</i> changed to <a href="/eflora/eflora_display.php?tid=103323"><i>Aphyllon californicum</i> subsp. <i>grande</i></a>
<br />&nbsp;&nbsp;<i>Orobanche californica</i> subsp. <i>grayana</i> changed to <a href="/eflora/eflora_display.php?tid=103324"><i>Aphyllon californicum</i> subsp. <i>grayanum</i></a>
<br />&nbsp;&nbsp;<i>Orobanche californica</i> subsp. <i>jepsonii</i> changed to <a href="/eflora/eflora_display.php?tid=103325"><i>Aphyllon californicum</i> subsp. <i>jepsonii</i></a>
<br />&nbsp;&nbsp;<i>Orobanche cooperi</i> changed to <a href="/eflora/eflora_display.php?tid=13615"><i>Aphyllon cooperi</i></a>
<br />&nbsp;&nbsp;<i>Orobanche corymbosa</i> changed to <a href="/eflora/eflora_display.php?tid=103309"><i>Aphyllon corymbosum</i></a>
<br />&nbsp;&nbsp;<i>Orobanche fasciculata</i> changed to <a href="/eflora/eflora_display.php?tid=100018"><i>Aphyllon fasciculatum</i></a>
<br />&nbsp;&nbsp;<i>Orobanche parishii</i> changed to <a href="/eflora/eflora_display.php?tid=103329"><i>Aphyllon parishii</i></a>
<br />&nbsp;&nbsp;<i>Orobanche parishii</i> subsp. <i>brachyloba</i> changed to <a href="/eflora/eflora_display.php?tid=103330"><i>Aphyllon parishii</i> subsp. <i>brachylobum</i></a>
<br />&nbsp;&nbsp;<i>Orobanche parishii</i> subsp. <i>parishii</i> changed to <a href="/eflora/eflora_display.php?tid=103331"><i>Aphyllon parishii</i> subsp. <i>parishii</i></a>
<br />&nbsp;&nbsp;<i>Orobanche pinorum</i> changed to <a href="/eflora/eflora_display.php?tid=13618"><i>Aphyllon pinorum</i></a>
<br />&nbsp;&nbsp;<i>Orobanche uniflora</i> (misapplied; not in California) changed to <a href="/eflora/eflora_display.php?tid=103312"><i>Aphyllon purpureum</i></a>
<br />&nbsp;&nbsp;<i>Orobanche valida</i> changed to <a href="/eflora/eflora_display.php?tid=103314"><i>Aphyllon validum</i></a>
<br />&nbsp;&nbsp;<i>Orobanche valida</i> subsp. <i>howellii</i> changed to <a href="/eflora/eflora_display.php?tid=103332"><i>Aphyllon validum</i> subsp. <i>howellii</i></a>
<br />&nbsp;&nbsp;<i>Orobanche valida</i> subsp. <i>valida</i> changed to <a href="/eflora/eflora_display.php?tid=103333"><i>Aphyllon validum</i> subsp. <i>validum</i></a>
<br />&nbsp;&nbsp;<i>Orobanche vallicola</i> changed to <a href="/eflora/eflora_display.php?tid=103315"><i>Aphyllon vallicolum</i></a>

<br /><b>Themidaceae:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99705"><i>Triteleia piutensis</i></a> newly described, added, as native
<br /><br />	
</blockquote>

<!-- END revision block 5 -->

<!-- BEGIN revision block 6 -->
<hr>
<h2 align="center"><p>
<a name="rev6" id="rev6"></a>Revision 6
<br />
September 2018
</p></h2>

<blockquote class="bodyText">
Revision 6 involves treatments that have changed taxonomically (e.g., taxa added or deleted) since Revision 5 of the <i>Jepson eFlora</i>. A summary of the changes incorporated in the <i>eFlora</i> is presented below.
<br />
&nbsp;
<br />	
	
<b>Brief Summary of Changes in Revision 6</b><br />
<br />

<br /><b>ANGIOSPERMS</b>

<br /><b>Liliaceae:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=100791"><i>Erythronium shastense</i></a> newly described, added, as native.
<br />
<br /><b>Phrymaceae:</b>
<br />&nbsp;&nbsp;All taxa of <a href="/eflora/eflora_display.php?tid=11384"><i>Mimulus</i></a> except <a href="/eflora/eflora_display.php?tid=33706"><i>Mimulus ringens</i></a> transferred to <a href="/eflora/eflora_display.php?tid=11356"><i>Diplacus</i></a>, <a href="/eflora/eflora_display.php?tid=68484"><i>Erythranthe</i></a>, or <a href="/eflora/eflora_display.php?tid=11383"><i>Mimetanthe</i></a>.
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=23081"><i>Diplacus australis</i></a> added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=23082"><i>Diplacus calycinus</i></a> added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99049"><i>Diplacus cusickioides</i></a>  newly described, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=103819"><i>Diplacus graniticola</i></a>  newly described, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=23088"><i>Diplacus linearis</i></a> added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99076"><i>Diplacus thompsonii</i></a>  newly described, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99084"><i>Erythranthe acutidens</i></a> added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99089"><i>Erythranthe arenaria</i></a> added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99090"><i>Erythranthe arenicola</i></a> added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99091"><i>Erythranthe arvensis</i></a> added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99093"><i>Erythranthe barbata</i></a> added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99104"><i>Erythranthe calcicola</i></a>  newly described, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99106"><i>Erythranthe carsonensis</i></a>  newly described, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99109"><i>Erythranthe corallina</i></a> added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99110"><i>Erythranthe cordata</i></a> added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99116"><i>Erythranthe diffusa</i></a> added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99117"><i>Erythranthe discolor</i></a> added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=100565"><i>Erythranthe erubescens</i></a>  newly described, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99121"><i>Erythranthe filicifolia</i></a> added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99124"><i>Erythranthe geniculata</i></a> added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99129"><i>Erythranthe grandis</i></a> added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=98707"><i>Erythranthe hardhamiae</i></a>  newly described, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99150"><i>Erythranthe marmorata</i></a> added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99152"><i>Erythranthe microphylla</i></a> added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99158"><i>Erythranthe nasuta</i></a> added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99166"><i>Erythranthe pardalis</i></a> added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99171"><i>Erythranthe percaulis</i></a>  newly described, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=103336"><i>Erythranthe ptilota</i></a>  newly described, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99212"><i>Erythranthe rhodopetra</i></a>  newly described, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=98967"><i>Erythranthe sierrae</i></a>  newly described, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=101121"><i>Erythranthe taylorii</i></a>  newly described, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=101724"><i>Erythranthe trinitiensis</i></a>  newly described, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99193"><i>Erythranthe utahensis</i></a> added, as native
<br />&nbsp;&nbsp;<i>Mimulus alsinoides</i> changed to <a href="/eflora/eflora_display.php?tid=99085"><i>Erythranthe alsinoides</i></a>
<br />&nbsp;&nbsp;<i>Mimulus androsaceus</i> changed to <a href="/eflora/eflora_display.php?tid=99088"><i>Erythranthe androsacea</i></a>
<br />&nbsp;&nbsp;<i>Mimulus angustatus</i> changed to <a href="/eflora/eflora_display.php?tid=99029"><i>Diplacus angustatus</i></a>
<br />&nbsp;&nbsp;<i>Mimulus aurantiacus</i> var. <i>aridus</i> changed to <a href="/eflora/eflora_display.php?tid=23076"><i>Diplacus aridus</i></a>
<br />&nbsp;&nbsp;<i>Mimulus aurantiacus</i> var. <i>aurantiacus</i> changed to <a href="/eflora/eflora_display.php?tid=23077"><i>Diplacus aurantiacus</i></a>
<br />&nbsp;&nbsp;<i>Mimulus aurantiacus</i> var. <i>grandiflorus</i> changed to <a href="/eflora/eflora_display.php?tid=23096"><i>Diplacus grandiflorus</i></a>
<br />&nbsp;&nbsp;<i>Mimulus aurantiacus</i> var. <i>parviflorus</i> changed to <a href="/eflora/eflora_display.php?tid=23092"><i>Diplacus parviflorus</i></a>
<br />&nbsp;&nbsp;<i>Mimulus aurantiacus</i> var. <i>pubescens</i> changed to <a href="/eflora/eflora_display.php?tid=23090"><i>Diplacus longiflorus</i></a>
<br />&nbsp;&nbsp;<i>Mimulus aurantiacus</i> var. <i>puniceus</i> changed to <a href="/eflora/eflora_display.php?tid=23093"><i>Diplacus puniceus</i></a>
<br />&nbsp;&nbsp;<i>Mimulus bicolor</i> changed to <a href="/eflora/eflora_display.php?tid=99095"><i>Erythranthe bicolor</i></a>
<br />&nbsp;&nbsp;<i>Mimulus bigelovii</i> var. <i>bigelovii</i> changed to <a href="/eflora/eflora_display.php?tid=99037"><i>Diplacus bigelovii</i> var. <i>bigelovii</i></a>
<br />&nbsp;&nbsp;<i>Mimulus bigelovii</i> var. <i>cuspidatus</i> changed to <a href="/eflora/eflora_display.php?tid=99038"><i>Diplacus bigelovii</i> var. <i>cuspidatus</i></a>
<br />&nbsp;&nbsp;<i>Mimulus bolanderi</i> changed to <a href="/eflora/eflora_display.php?tid=99039"><i>Diplacus bolanderi</i></a>
<br />&nbsp;&nbsp;<i>Mimulus breviflorus</i> changed to <a href="/eflora/eflora_display.php?tid=99099"><i>Erythranthe breviflora</i></a>
<br />&nbsp;&nbsp;<i>Mimulus brevipes</i> changed to <a href="/eflora/eflora_display.php?tid=99041"><i>Diplacus brevipes</i></a>
<br />&nbsp;&nbsp;<i>Mimulus breweri</i> changed to <a href="/eflora/eflora_display.php?tid=99101"><i>Erythranthe breweri</i></a>
<br />&nbsp;&nbsp;<i>Mimulus cardinalis</i> changed to <a href="/eflora/eflora_display.php?tid=25147"><i>Erythranthe cardinalis</i></a>
<br />&nbsp;&nbsp;<i>Mimulus clevelandii</i> changed to <a href="/eflora/eflora_display.php?tid=23083"><i>Diplacus clevelandii</i></a>
<br />&nbsp;&nbsp;<i>Mimulus congdonii</i> changed to <a href="/eflora/eflora_display.php?tid=99046"><i>Diplacus congdonii</i></a>
<br />&nbsp;&nbsp;<i>Mimulus constrictus</i> changed to <a href="/eflora/eflora_display.php?tid=99047"><i>Diplacus constrictus</i></a>
<br />&nbsp;&nbsp;<i>Mimulus dentatus</i> changed to <a href="/eflora/eflora_display.php?tid=99113"><i>Erythranthe dentata</i></a>
<br />&nbsp;&nbsp;<i>Mimulus douglasii</i> changed to <a href="/eflora/eflora_display.php?tid=99051"><i>Diplacus douglasii</i></a>
<br />&nbsp;&nbsp;<i>Mimulus evanescens</i> changed to <a href="/eflora/eflora_display.php?tid=99137"><i>Erythranthe inflatula</i></a>
<br />&nbsp;&nbsp;<i>Mimulus exiguus</i> changed to <a href="/eflora/eflora_display.php?tid=99119"><i>Erythranthe exigua</i></a>
<br />&nbsp;&nbsp;<i>Mimulus filicaulis</i> changed to <a href="/eflora/eflora_display.php?tid=99120"><i>Erythranthe filicaulis</i></a>
<br />&nbsp;&nbsp;<i>Mimulus floribundus</i> changed to <a href="/eflora/eflora_display.php?tid=99122"><i>Erythranthe floribunda</i></a>
<br />&nbsp;&nbsp;<i>Mimulus fremontii</i> var. <i>fremontii</i> changed to <a href="/eflora/eflora_display.php?tid=99052"><i>Diplacus fremontii</i></a>
<br />&nbsp;&nbsp;<i>Mimulus fremontii</i> var. <i>vandenbergensis</i> changed to <a href="/eflora/eflora_display.php?tid=99080"><i>Diplacus vandenbergensis</i></a>
<br />&nbsp;&nbsp;<i>Mimulus glaucescens</i> changed to <a href="/eflora/eflora_display.php?tid=99127"><i>Erythranthe glaucescens</i></a>
<br />&nbsp;&nbsp;<i>Mimulus gracilipes</i> changed to <a href="/eflora/eflora_display.php?tid=99128"><i>Erythranthe gracilipes</i></a>
<br />&nbsp;&nbsp;<i>Mimulus guttatus</i> changed to <a href="/eflora/eflora_display.php?tid=99131"><i>Erythranthe guttata</i></a>
<br />&nbsp;&nbsp;<i>Mimulus inconspicuus</i> changed to <a href="/eflora/eflora_display.php?tid=99135"><i>Erythranthe inconspicua</i></a>
<br />&nbsp;&nbsp;<i>Mimulus johnstonii</i> changed to <a href="/eflora/eflora_display.php?tid=99057"><i>Diplacus johnstonii</i></a>
<br />&nbsp;&nbsp;<i>Mimulus kelloggii</i> changed to <a href="/eflora/eflora_display.php?tid=99058"><i>Diplacus kelloggii</i></a>
<br />&nbsp;&nbsp;<i>Mimulus laciniatus</i> changed to <a href="/eflora/eflora_display.php?tid=99142"><i>Erythranthe laciniata</i></a>
<br />&nbsp;&nbsp;<i>Mimulus latidens</i> changed to <a href="/eflora/eflora_display.php?tid=99144"><i>Erythranthe latidens</i></a>
<br />&nbsp;&nbsp;<i>Mimulus latifolius</i> changed to <a href="/eflora/eflora_display.php?tid=99040"><i>Diplacus brandegeei</i></a>
<br />&nbsp;&nbsp;<i>Mimulus layneae</i> changed to <a href="/eflora/eflora_display.php?tid=99059"><i>Diplacus layneae</i></a>
<br />&nbsp;&nbsp;<i>Mimulus leptaleus</i> changed to <a href="/eflora/eflora_display.php?tid=99060"><i>Diplacus leptaleus</i></a>
<br />&nbsp;&nbsp;<i>Mimulus lewisii</i> changed to <a href="/eflora/eflora_display.php?tid=99145"><i>Erythranthe lewisii</i></a>
<br />&nbsp;&nbsp;<i>Mimulus mohavensis</i> changed to <a href="/eflora/eflora_display.php?tid=99065"><i>Diplacus mohavensis</i></a>
<br />&nbsp;&nbsp;<i>Mimulus montioides</i> changed to <a href="/eflora/eflora_display.php?tid=99155"><i>Erythranthe montioides</i></a>
<br />&nbsp;&nbsp;<i>Mimulus moschatus</i> changed to <a href="/eflora/eflora_display.php?tid=99156"><i>Erythranthe moschata</i></a>
<br />&nbsp;&nbsp;<i>Mimulus nanus</i> var. <i>jepsonii</i> changed to <a href="/eflora/eflora_display.php?tid=99056"><i>Diplacus jepsonii</i></a>
<br />&nbsp;&nbsp;<i>Mimulus nanus</i> var. <i>mephiticus</i> changed to <a href="/eflora/eflora_display.php?tid=99064"><i>Diplacus mephiticus</i></a>
<br />&nbsp;&nbsp;<i>Mimulus nanus</i> var. <i>nanus</i> changed to <a href="/eflora/eflora_display.php?tid=99066"><i>Diplacus nanus</i></a>
<br />&nbsp;&nbsp;<i>Mimulus norrisii</i> changed to <a href="/eflora/eflora_display.php?tid=99161"><i>Erythranthe norrisii</i></a>
<br />&nbsp;&nbsp;<i>Mimulus nudatus</i> changed to <a href="/eflora/eflora_display.php?tid=99162"><i>Erythranthe nudata</i></a>
<br />&nbsp;&nbsp;<i>Mimulus palmeri</i> changed to <a href="/eflora/eflora_display.php?tid=99165"><i>Erythranthe palmeri</i></a>
<br />&nbsp;&nbsp;<i>Mimulus parishii</i> changed to <a href="/eflora/eflora_display.php?tid=98851"><i>Erythranthe parishii</i></a>
<br />&nbsp;&nbsp;<i>Mimulus parryi</i> changed to <a href="/eflora/eflora_display.php?tid=99068"><i>Diplacus parryi</i></a>
<br />&nbsp;&nbsp;<i>Mimulus pictus</i> changed to <a href="/eflora/eflora_display.php?tid=99069"><i>Diplacus pictus</i></a>
<br />&nbsp;&nbsp;<i>Mimulus pilosus</i> changed to <a href="/eflora/eflora_display.php?tid=33500"><i>Mimetanthe pilosa</i></a>
<br />&nbsp;&nbsp;<i>Mimulus primuloides</i> var. <i>linearifolius</i> changed to <a href="/eflora/eflora_display.php?tid=99146"><i>Erythranthe linearifolia</i></a>
<br />&nbsp;&nbsp;<i>Mimulus primuloides</i> var. <i>primuloides</i> changed to <a href="/eflora/eflora_display.php?tid=99147"><i>Erythranthe primuloides</i></a>
<br />&nbsp;&nbsp;<i>Mimulus pulchellus</i> changed to <a href="/eflora/eflora_display.php?tid=99070"><i>Diplacus pulchellus</i></a>
<br />&nbsp;&nbsp;<i>Mimulus pulsiferae</i> changed to <a href="/eflora/eflora_display.php?tid=99176"><i>Erythranthe pulsiferae</i></a>
<br />&nbsp;&nbsp;<i>Mimulus purpureus</i> changed to <a href="/eflora/eflora_display.php?tid=99177"><i>Erythranthe purpurea</i></a>
<br />&nbsp;&nbsp;<i>Mimulus pygmaeus</i> changed to <a href="/eflora/eflora_display.php?tid=99071"><i>Diplacus pygmaeus</i></a>
<br />&nbsp;&nbsp;<i>Mimulus rattanii</i> changed to <a href="/eflora/eflora_display.php?tid=99072"><i>Diplacus rattanii</i></a>
<br />&nbsp;&nbsp;<i>Mimulus rubellus</i> changed to <a href="/eflora/eflora_display.php?tid=99179"><i>Erythranthe rubella</i></a>
<br />&nbsp;&nbsp;<i>Mimulus rupicola</i> changed to <a href="/eflora/eflora_display.php?tid=99074"><i>Diplacus rupicola</i></a>
<br />&nbsp;&nbsp;<i>Mimulus shevockii</i> changed to <a href="/eflora/eflora_display.php?tid=99183"><i>Erythranthe shevockii</i></a>
<br />&nbsp;&nbsp;<i>Mimulus suksdorfii</i> changed to <a href="/eflora/eflora_display.php?tid=99186"><i>Erythranthe suksdorfii</i></a>
<br />&nbsp;&nbsp;<i>Mimulus tilingii</i> changed to <a href="/eflora/eflora_display.php?tid=99191"><i>Erythranthe tilingii</i></a>
<br />&nbsp;&nbsp;<i>Mimulus torreyi</i> changed to <a href="/eflora/eflora_display.php?tid=99077"><i>Diplacus torreyi</i></a>
<br />&nbsp;&nbsp;<i>Mimulus traskiae</i> changed to <a href="/eflora/eflora_display.php?tid=99078"><i>Diplacus traskiae</i></a>
<br />&nbsp;&nbsp;<i>Mimulus tricolor</i> changed to <a href="/eflora/eflora_display.php?tid=99079"><i>Diplacus tricolor</i></a>
<br />&nbsp;&nbsp;<i>Mimulus viscidus</i> var. <i>compactus</i> changed to <a href="/eflora/eflora_display.php?tid=99045"><i>Diplacus compactus</i></a>	
<br />&nbsp;&nbsp;<i>Mimulus viscidus</i> var. <i>viscidus</i> changed to <a href="/eflora/eflora_display.php?tid=99081"><i>Diplacus viscidus</i></a>	
<br />&nbsp;&nbsp;<i>Mimulus whitneyi</i> changed to <a href="/eflora/eflora_display.php?tid=103264"><i>Diplacus bicolor</i></a>
<br /><br />	
</blockquote>
<!-- END revision block 6 -->

<!-- BEGIN revision block 7 -->
<hr>

<h2 align="center"><p>
<a name="rev7" id="rev7"></a>Revision 7
<br />
December 2019
</p></h2>

<blockquote class="bodyText"><p class=bodyText>
Revision 7 involves treatments that have changed taxonomically (e.g., taxa added or deleted) since Revision 6 of the <i>Jepson eFlora</i>. A summary of the changes incorporated in the <i>eFlora</i> is presented below.</p>
<br />
&nbsp;
<br />	
	
<b>Brief Summary of Changes in Revision 7</b>
<br />
<br />
<br /><b>ANGIOSPERMS</b>

<br /><b>ASTERACEAE:</b>
<br />&nbsp;&nbsp;<i>Acroptilon</i> transferred to <a href="/eflora/eflora_display.php?tid=103801"><i>Rhaponticum</i></a>.
<br />&nbsp;&nbsp;<i>Acroptilon repens</i> changed to <a href="/eflora/eflora_display.php?tid=103802"><i>Rhaponticum repens</i></a>, leaving no <i>Acroptilon</i> in California (or elsewhere).
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=4236"><i>Parthenium hysterophorus</i></a> added, as naturalized.
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=101237"><i>Volutaria tubuliflora</i></a> added, as naturalized, replacing <i>Volutaria canariensis</i>, misapplied.
<br />
<br /><b>CACTACEAE:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=108600"><i>Opuntia &times;charlestonensis</i></a> added, as native.
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=89064"><i>Opuntia curvispina</i></a> added, as native.
<br />
<br /><b>EBENACEAE:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=23042"><i>Diospyros virginiana</i></a> added, as naturalized.
<br />
<br /><b>LINDERNIACEAE:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=11373"><i>Lindernia</i></a> transferred to <a href="/eflora/eflora_display.php?tid=108558">Linderniaceae</a> from <a href="/eflora/eflora_display.php?tid=220">Plantaginaceae</a>.
<br />
<br /><b>NYCTAGINACEAE:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=81378"><i>Boerhavia coulteri</i> var. <i>coulteri</i></a> added, as native.
<br />
<br /><b>POACEAE:</b>
<br />&nbsp;&nbsp;<i>Bromus madritensis</i> subsp. <i>madritensis</i> recognized at species rank as <a href="/eflora/eflora_display.php?tid=16263"><i>Bromus madritensis</i></a>.
<br />&nbsp;&nbsp;<i>Bromus madritensis</i> subsp. <i>rubens</i> recognized at species rank as <a href="/eflora/eflora_display.php?tid=16281"><i>Bromus rubens</i></a>.
<br />&nbsp;&nbsp;<i>Bromus carinatus</i> recognized at varietal rank as <a href="/eflora/eflora_display.php?tid=108589"><i>Bromus sitchensis</i> var. <i>carinatus</i></a>.
<br />&nbsp;&nbsp;<i>Bromus marginatus</i> recognized at varietal rank as <a href="/eflora/eflora_display.php?tid=108590"><i>Bromus sitchensis</i> var. <i>marginatus</i></a>.
<br />&nbsp;&nbsp;<i>Bromus maritimus</i> recognized at varietal rank  as <a href="/eflora/eflora_display.php?tid=108591"><i>Bromus sitchensis</i> var. <i>maritimus</i></a>.
<br />&nbsp;&nbsp;<i>Bromus polyanthus</i> recognized at varietal rank  as <a href="/eflora/eflora_display.php?tid=108592"><i>Bromus sitchensis</i> var. <i>polyanthus</i></a>.
<br />&nbsp;&nbsp;<i>Bromus sitchensis</i> recognized at varietal rank  as <a href="/eflora/eflora_display.php?tid=108593"><i>Bromus sitchensis</i> var. <i>sitchensis</i></a>.
<br />
<br /><b>THEMIDACEAE:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=95364"><i>Brodiaea matsonii</i></a> newly described, as native.
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=101701"><i>Brodiaea rosea</i> subsp. <i>rosea</i></a> recognized, as native.
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=100439"><i>Brodiaea rosea</i> subsp. <i>vallicola</i></a> newly described, as native.
<br />&nbsp;&nbsp;<i>Dichelostemma capitatum</i> changed to <a href="/eflora/eflora_display.php?tid=108599"><i>Dipterostemon capitatus</i></a>, as native.
<br />&nbsp;&nbsp;<i>Dichelostemma capitatum</i> subsp. <i>capitatum</i> changed to <a href="/eflora/eflora_display.php?tid=108595"><i>Dipterostemon capitatus</i> subsp. <i>capitatus</i></a>, as native.	
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=108596"><i>Dipterostemon capitatus</i> subsp. <i>lacuna-vernalis</i></a> recognized, as native. <br />&nbsp;&nbsp;&nbsp;&nbsp;[synonym <i>Dichelostemma capitatum</i> subsp. <i>lacuna-vernalis</i>, previously treated as a synonym of <i>Dichelostemma capitatum</i> subsp. <i>capitatum</i>].
<br />&nbsp;&nbsp;<i>Dichelostemma capitatum</i> subsp. <i>pauciflorum</i> changed to <a href="/eflora/eflora_display.php?tid=108597"><i>Dipterostemon capitatus</i> subsp. <i>pauciflorus</i></a>, as native.
	
<br /><br />
</blockquote>
<!-- END revision block 7 -->

<!-- BEGIN revision block 8 -->
<hr>

<h2 align="center"><p>
<a name="rev8" id="rev8"></a>Revision 8
<br />
December 2020
</p></h2>

<blockquote class="bodyText"><p>
Revision 8 involves treatments that have changed taxonomically (e.g., taxa added or deleted) since Revision 7 of the <i>Jepson eFlora</i>. A summary of the changes incorporated in the <i>eFlora</i> is presented below.</p>
<br />
&nbsp;
<br />	
<b>Brief Summary of Changes in Revision 8</b>
<br />
<br />
<br /><b>ANGIOSPERMS</b>
<br /><b>AGAVACEAE:</b>
<br />&nbsp;&nbsp;<i>Chlorogalum</i>: Three taxa moved to new genus <a href="/eflora/eflora_display.php?tid=108964"><i>Hooveria</i></a>, the rest retained in <a href="/eflora/eflora_display.php?tid=9498"><i>Chlorogalum</i></a>
<br />&nbsp;&nbsp;<i>Chlorogalum parviflorum</i> changed to <a href="/eflora/eflora_display.php?tid=108965"><i>Hooveria parviflora</i></a>
<br />&nbsp;&nbsp;<i>Chlorogalum purpureum </i>changed to <a href="/eflora/eflora_display.php?tid=108966"><i>Hooveria purpurea</i></a>
<br />&nbsp;&nbsp;<i>Chlorogalum purpureum</i> var. <i>purpureum</i> changed to <a href="/eflora/eflora_display.php?tid=108968"><i>Hooveria purpurea</i> var. <i>purpurea</i></a>
<br />&nbsp;&nbsp;<i>Chlorogalum purpureum</i> var. <i>reductum</i> changed to <a href="/eflora/eflora_display.php?tid=108967"><i>Hooveria purpurea</i> var. <i>reducta</i></a>
<br />
<br /><b>ASTERACEAE:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=2411"><i>Crepis pulchra</i></a> added, as naturalized
<br />&nbsp;&nbsp;<i>Eucephalus</i> transferred to <a href="/eflora/eflora_display.php?tid=68414"><i>Doellingeria</i></a>, leaving no species of <i>Eucephalus</i>
<br />&nbsp;&nbsp;<i>Eucephalus breweri</i> changed to <a href="/eflora/eflora_display.php?tid=108971"><i>Doellingeria breweri</i></a>
<br />&nbsp;&nbsp;<i>Eucephalus engelmannii</i> changed to <a href="/eflora/eflora_display.php?tid=108969"><i>Doellingeria engelmannii</i></a>
<br />&nbsp;&nbsp;<i>Eucephalus glabratus</i> changed to <a href="/eflora/eflora_display.php?tid=108970"><i>Doellingeria glabrata</i></a>
<br />&nbsp;&nbsp;<i>Eucephalus ledophyllus</i> var. <i>covillei</i> changed to <a href="/eflora/eflora_display.php?tid=108973"><i>Doellingeria ledophylla</i> var. <i>covillei</i></a>
<br />&nbsp;&nbsp;<i>Eucephalus tomentellus</i> changed to <a href="/eflora/eflora_display.php?tid=108975"><i>Doellingeria tomentella</i></a>
<br />&nbsp;&nbsp;<i>Eucephalus vialis</i> removed, not in California
<br />&nbsp;&nbsp;<i>Helianthus exilis</i> rejected, a synonym of <a href="/eflora/eflora_display.php?tid=3251"><i>Helianthus bolanderi</i></a>
<br />
<br /><b>FABACEAE:</b>
<br />&nbsp;&nbsp;<i>Lupinus excubitus</i> var. <i>austromontanus</i> changed to <a href="/eflora/eflora_display.php?tid=101519"><i>Lupinus albifrons</i> var. <i>austromontanus</i></a>
<br />&nbsp;&nbsp;<i>Lupinus excubitus</i> var. <i>hallii</i> changed to <a href="/eflora/eflora_display.php?tid=79077"><i>Lupinus albifrons</i> var. <i>hallii</i></a>
<br />&nbsp;&nbsp;<i>Lupinus excubitus</i> var. <i>johnstonii</i> changed to <a href="/eflora/eflora_display.php?tid=101377"><i>Lupinus albifrons </i>var. <i>johnstonii</i></a>
<br />&nbsp;&nbsp;<i>Lupinus excubitus</i> var. <i>medius</i> changed to <a href="/eflora/eflora_display.php?tid=61193"><i>Lupinus albifrons</i> var. <i>medius</i></a>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=61356"><i>Lupinus lepidus</i> var. <i>aridus</i></a> added, as native
<br />&nbsp;&nbsp;<i>Lupinus variicolor</i> changed to <a href="/eflora/eflora_display.php?tid=80538"><i>Lupinus littoralis</i> var. <i>variicolor</i></a>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=61387"><i>Lupinus magnificus</i> var. <i>hesperius</i></a> added, as native
<br />&nbsp;&nbsp;<i>Lupinus holmgrenianus</i> changed to <a href="/eflora/eflora_display.php?tid=61431"><i>Lupinus polyphyllus</i> var. <i>humicola</i></a>
<br />&nbsp;&nbsp;<i>Lupinus latifolius</i> var. <i>barbatus</i> rejected, a synomym of <a href="/eflora/eflora_display.php?tid=76666"><i>Lupinus latifolius</i> var. <i>viridifolius</i></a>
<br />&nbsp;&nbsp;<i>Lupinus latifolius</i> var. <i>columbianus</i> moved to <a href="/eflora/eflora_display.php?tid=75772"><i>Lupinus latifolius</i> var. <i>latifolius</i></a>
<br />&nbsp;&nbsp;<i>Lupinus saxosus</i> changed to <a href="/eflora/eflora_display.php?tid=61430"><i>Lupinus polyphyllus</i> var. <i>saxosus</i></a>
<br />
<br /><b>PLANTAGINACEAE:</b>
<br />&nbsp;&nbsp;<i>Antirrhinum multiflorum</i>, an illegitimate name, replaced by <a href="/eflora/eflora_display.php?tid=108978"><i>Antirrhinum thompsonii</i></a>
<br />&nbsp;&nbsp;<i>Mohavea</i> transferred to <a href="/eflora/eflora_display.php?tid=9184"><i>Antirrhinum</i></a>, leaving no species of  <i>Mohavea</i>
<br />&nbsp;&nbsp;<i>Mohavea confertiflora</i> changed to <a href="/eflora/eflora_display.php?tid=102116"><i>Antirrhinum confertiflorum</i></a>
<br />&nbsp;&nbsp;<i>Mohavea breviflora</i> changed to <a href="/eflora/eflora_display.php?tid=108977"><i>Antirrhinum mohavea</i></a>
<br />
<br /><b>RHAMNACEAE:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=103737"><i>Ceanothus foliosus</i> var.  <i>viejasensis</i></a> newly described, added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=103540"><i>Ceanothus pendletonensis</i></a> newly described, added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=108979"><i>Ceanothus thyrsiflorus</i> var.  <i>obispoensis</i></a> newly described, added, as native
<br />
<br />
</p></blockquote>
<!-- END revision block 8 -->


<!-- BEGIN revision block 9-->
<hr>

<h2 align="center"><p>
<a name="rev9" id="rev9"></a>Revision 9
<br />
December 2021
</p></h2>
<blockquote class="bodyText">
<p>
Revision 9 involves treatments that have changed taxonomically (e.g., taxa added or deleted) since Revision 8 of the <i>Jepson eFlora</i>. A summary of the changes incorporated in the <i>eFlora</i> is presented below.</p>
<br />
&nbsp;	
<b>Brief Summary of Changes in Revision 9</b>
<br />
<br /><b>FERNS</b>
<br /><b>THELYPTERIDACEAE:</b>
<br />&nbsp;&nbsp;<i>Thelypteris</i>: Californian taxa moved to <a href="/eflora/eflora_display.php?tid=79421"><i>Amauropelta</i></a> and <a href="/eflora/eflora_display.php?tid=84701"><i>Pelazoneuron</i></a>, leaving no taxa of <i>Thelypteris</i> in California
<br />&nbsp;&nbsp;<i>Thelypteris nevadensis</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=79421"><i>Amauropelta</i></a>, as <a href="/eflora/eflora_display.php?tid=84700"><i>Amauropelta nevadensis</i></a>
<br />&nbsp;&nbsp;<i>Thelypteris puberula</i> var. <i>sonorensis</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=84701"><i>Pelazoneuron</i></a>, as <a href="/eflora/eflora_display.php?tid=84703"><i>Pelazoneuron puberulum</i> var. <i>sonorensis</i></a>
<br />
<br /><b>ANGIOSPERMS</b>
<br /><b>BORAGINACEAE:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=10465"><i>Cryptantha</i></a>: 
	Some Californian taxa transferred to <a href="/eflora/eflora_display.php?tid=68467"><i>Eremocarya</i></a>, 
	<a href="/eflora/eflora_display.php?tid=68572"><i>Greeneocharis</i></a>, 
	<a href="/eflora/eflora_display.php?tid=99958"><i>Johnstonella</i></a>, 
	and <a href="/eflora/eflora_display.php?tid=68980"><i>Oreocarya</i></a>
<br />&nbsp;&nbsp;<i>Cryptantha angustifolia</i> 
	transferred to <a href="/eflora/eflora_display.php?tid=99958"><i>Johnstonella</i></a>, 
	as <a href="/eflora/eflora_display.php?tid=99829"><i>Johnstonella angustifolia</i></a>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=84709"><i>Cryptantha catalinensis</i></a> 
	newly described, added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=84710"><i>Cryptantha clementina</i></a> 
	newly described, added, as native
<br />&nbsp;&nbsp;<i>Cryptantha celosioides</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68980"><i>Oreocarya</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=84102"><i>Oreocarya glomerata</i></a>
<br />&nbsp;&nbsp;<i>Cryptantha cinerea</i> var. <i>abortiva</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68980"><i>Oreocarya</i></a> 
	 and treated at species rank, 
	 as <a href="/eflora/eflora_display.php?tid=35401"><i>Oreocarya abortiva</i></a>
<br />&nbsp;&nbsp;<i>Cryptantha circumscissa</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68572"><i>Greeneocharis</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=27310"><i>Greeneocharis circumscissa</i></a>
<br />&nbsp;&nbsp;<i>Cryptantha circumscissa</i> var. <i>circumscissa</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68572"><i>Greeneocharis</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=72447"><i>Greeneocharis circumscissa</i> var. <i>circumscissa</i></a>
<br />&nbsp;&nbsp;<i>Cryptantha circumscissa</i> var. <i>rosulata</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68572"><i>Greeneocharis</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=101725"><i>Greeneocharis circumscissa</i> var. <i>rosulata</i></a>
<br />&nbsp;&nbsp;<i>Cryptantha confertiflora</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68980"><i>Oreocarya</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=35404"><i>Oreocarya confertiflora</i></a>
<br />&nbsp;&nbsp;<i>Cryptantha costata</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=99958"><i>Johnstonella</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=99830"><i>Johnstonella costata</i></a>
<br />&nbsp;&nbsp;<i>Cryptantha crymophila</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68980"><i>Oreocarya</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=35405"><i>Oreocarya crymophila</i></a>
<br />&nbsp;&nbsp;<i>Cryptantha flavoculata</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68980"><i>Oreocarya</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=35408"><i>Oreocarya flavoculata</i></a>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=21210"><i>Cryptantha hispidissima</i></a> 
	recognized, added, as native
<br />&nbsp;&nbsp;<i>Cryptantha hoffmannii</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68980"><i>Oreocarya</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=35411"><i>Oreocarya hoffmannii</i></a>
<br />&nbsp;&nbsp;<i>Cryptantha holoptera</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=99958"><i>Johnstonella</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=99838"><i>Johnstonella holoptera</i></a>
<br />&nbsp;&nbsp;<i>Cryptantha humilis</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68980"><i>Oreocarya</i></a> 
	 and treated at subspecies rank, 
	 as <a href="/eflora/eflora_display.php?tid=70434"><i>Oreocarya humilis</i> subsp. <i>humilis</i></a>
<br />&nbsp;&nbsp;<i>Cryptantha inaequata</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=99958"><i>Johnstonella</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=101945"><i>Johnstonella inaequata</i></a>
<br />&nbsp;&nbsp;<i>Cryptantha intermedia</i> var. <i>hendersonii</i> treated at species rank, 
	as <a href="/eflora/eflora_display.php?tid=21250"><i>Cryptantha hendersonii</i></a>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=94663"><i>Cryptantha intermedia</i> var. <i>johnstonii</i></a> 
	recognized, added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=84664"><i>Cryptantha kinkiensis</i></a> 
	recently described, added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=57138"><i>Cryptantha maritima</i> var. <i>maritima</i></a> 
	recognized, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=57139"><i>Cryptantha maritima</i> var. <i>pilosa</i></a> 
	recognized, added, as native
<br />&nbsp;&nbsp;<i>Cryptantha micrantha</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68467"><i>Eremocarya</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=24552"><i>Eremocarya micrantha</i></a>
<br />&nbsp;&nbsp;<i>Cryptantha micrantha</i> var. <i>lepida</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68467"><i>Eremocarya</i></a> 
	 and treated at species rank, 
	 as <a href="/eflora/eflora_display.php?tid=99770"><i>Eremocarya lepida</i></a>
<br />&nbsp;&nbsp;<i>Cryptantha micrantha</i> var. <i>micrantha</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68467"><i>Eremocarya</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=72227"><i>Eremocarya micrantha</i> var. <i>micrantha</i></a>
<br />&nbsp;&nbsp;<i>Cryptantha nevadensis</i> var. <i>nevadensis</i> 
	treated at species rank, 
	as <a href="/eflora/eflora_display.php?tid=21272"><i>Cryptantha nevadensis</i></a>
<br />&nbsp;&nbsp;<i>Cryptantha nevadensis</i> var. <i>rigida</i> 
	treated at species rank, 
	as <a href="/eflora/eflora_display.php?tid=103476"><i>Cryptantha juniperensis</i></a>
<br />&nbsp;&nbsp;<i>Cryptantha nubigena</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68980"><i>Oreocarya</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=35416"><i>Oreocarya nubigena</i></a>
<br />&nbsp;&nbsp;<i>Cryptantha pterocarya</i> var. <i>cycloptera</i> 
	treated at species rank, 
	as <a href="/eflora/eflora_display.php?tid=101132"><i>Cryptantha cycloptera</i></a>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=57156"><i>Cryptantha pterocarya</i> var. <i>stenoloba</i></a> 
	recognized, added, as native
<br />&nbsp;&nbsp;<i>Cryptantha racemosa</i> 
	transferred to <a href="/eflora/eflora_display.php?tid=99958"><i>Johnstonella</i></a>, 
	as <a href="/eflora/eflora_display.php?tid=101946"><i>Johnstonella racemosa</i></a>
<br />&nbsp;&nbsp;<i>Cryptantha roosiorum</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68980"><i>Oreocarya</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=101727"><i>Oreocarya roosiorum</i></a>
<br />&nbsp;&nbsp;<i>Cryptantha schoolcraftii</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68980"><i>Oreocarya</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=101728"><i>Oreocarya schoolcraftii</i></a>
<br />&nbsp;&nbsp;<i>Cryptantha similis</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68572"><i>Greeneocharis</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=99295"><i>Greeneocharis similis</i></a>
<br />&nbsp;&nbsp;<i>Cryptantha sobolifera</i> added, 
	transferred to <a href="/eflora/eflora_display.php?tid=68980"><i>Oreocarya</i></a>, 
	as <a href="/eflora/eflora_display.php?tid=82802"><i>Oreocarya sobolifera</i></a>, as native
<br />&nbsp;&nbsp;<i>Cryptantha subretusa</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68980"><i>Oreocarya</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=35422"><i>Oreocarya subretusa</i></a>
<br />&nbsp;&nbsp;<i>Cryptantha tumulosa</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68980"><i>Oreocarya</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=35426"><i>Oreocarya tumulosa</i></a>
<br />&nbsp;&nbsp;<i>Cryptantha virginensis</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68980"><i>Oreocarya</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=35427"><i>Oreocarya virginensis</i></a>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=95261"><i>Cryptantha wigginsii</i></a> 
	new to California, added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=10466"><i>Cynoglossum</i></a>: 
	Native Californian taxa</i> transferred to 
	<a href="/eflora/eflora_display.php?tid=103202"><i>Adelinia</i></a> 
	 and <a href="/eflora/eflora_display.php?tid=103733"><i>Andersonglossum</i></a>, 
	 leaving one naturalized taxon of <a href="/eflora/eflora_display.php?tid=10466"><i>Cynoglossum</i></a> in California
<br />&nbsp;&nbsp;<i>Cynoglossum grande</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=103202"><i>Adelinia</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=101954"><i>Adelinia grandis</i></a>
<br />&nbsp;&nbsp;<i>Cynoglossum occidentale</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=103733"><i>Andersonglossum</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=100787"><i>Andersonglossum occidentale</i></a>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99828"><i>Johnstonella angelica</i></a> 
	new to California, added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=8762"><i>Pectocarya</i></a>: 
	One species transferred to <a href="/eflora/eflora_display.php?tid=84715"><i>Gruvelia</i></a>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=76583"><i>Pectocarya anisocarpa</i></a> 
	newly described, added, as native
<br />&nbsp;&nbsp;<i>Pectocarya pusilla</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=84715"><i>Gruvelia</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=105901"><i>Gruvelia pusilla</i></a>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=8764"><i>Plagiobothrys</i></a>: 
	One species transferred to each of three genera, 
	<a href="/eflora/eflora_display.php?tid=84705"><i>Amsinckiopsis</i></a>, 
	<a href="/eflora/eflora_display.php?tid=82940"><i>Simpsonanthus</i></a>, 
	and <a href="/eflora/eflora_display.php?tid=84716"><i>Sonnea</i></a>
<br />&nbsp;&nbsp;<i>Plagiobothrys hispidus</i> 
	transferred to <a href="/eflora/eflora_display.php?tid=84716"><i>Sonnea</i></a>, 
	as <a href="/eflora/eflora_display.php?tid=107795"><i>Sonnea hispida</i></a>
<br />&nbsp;&nbsp;<i>Plagiobothrys jonesii</i> 
	transferred to <a href="/eflora/eflora_display.php?tid=82940"><i>Simpsonanthus</i></a>, 
	as <a href="/eflora/eflora_display.php?tid=82941"><i>Simpsonanthus jonesii</i></a>
<br />&nbsp;&nbsp;<i>Plagiobothrys kingii</i> 
	transferred to <a href="/eflora/eflora_display.php?tid=84705"><i>Amsinckiopsis</i></a>, 
	as <a href="/eflora/eflora_display.php?tid=84706"><i>Amsinckiopsis kingii</i></a>
<br />&nbsp;&nbsp;<i>Plagiobothrys kingii</i> var. <i>harknessii</i>
	 transferred to 
	<a href="/eflora/eflora_display.php?tid=84705"><i>Amsinckiopsis</i></a>, 
	as <a href="/eflora/eflora_display.php?tid=84707">Amsinckiopsis kingii</i> var. <i>harknessii</i></a>
<br />&nbsp;&nbsp;<i>Plagiobothrys kingii</i> var. <i>kingii</i> 
	transferred to <a href="/eflora/eflora_display.php?tid=84705"><i>Amsinckiopsis</i></a>, 
	as <a href="/eflora/eflora_display.php?tid=84708"><i>Amsinckiopsis kingii</i> var. <i>kingii</i></a>
<br /><b>EHRETIACEAE:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=8768"><i>Tiquilia</i></a> 
	transferred to <a href="/eflora/eflora_display.php?tid=84713">Ehretiaceae</a> 
	from <a href="/eflora/eflora_display.php?tid=69">Boraginaceae</a>
<br /><b>HELIOTROPIACEAE:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=10473"><i>Heliotropium</i></a> 
	transferred to <a href="/eflora/eflora_display.php?tid=227">Heliotropiaceae</a> 
	from <a href="/eflora/eflora_display.php?tid=69">Boraginaceae</a>
<br /><b>HYDROPHYLLACEAE:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=9645"><i>Draperia</i></a>,
	 <a href="/eflora/eflora_display.php?tid=9647"><i>Emmenanthe</i></a>, 
	 <a href="/eflora/eflora_display.php?tid=9649"><i>Eucrypta</i></a>, 
	 <a href="/eflora/eflora_display.php?tid=9650"><i>Hesperochiron</i></a>, 
	 <a href="/eflora/eflora_display.php?tid=95350"><i>Howellanthus</i></a>, 
	 <a href="/eflora/eflora_display.php?tid=9652"><i>Hydrophyllum</i></a>, 
	 <a href="/eflora/eflora_display.php?tid=9654"><i>Nemophila</i></a>, 
	 <a href="/eflora/eflora_display.php?tid=9655"><i>Phacelia</i></a>, 
	 <a href="/eflora/eflora_display.php?tid=9656"><i>Pholistoma</i></a>, 
	 <a href="/eflora/eflora_display.php?tid=10337"><i>Romanzoffia</i></a>, 
	 and <a href="/eflora/eflora_display.php?tid=10338"><i>Tricardia</i></a> 
	 transferred to <a href="/eflora/eflora_display.php?tid=157">Hydrophyllaceae</a>
<br />&nbsp;&nbsp;<i>Emmenanthe penduliflora</i> var. <i>penduliflora</i> treated at species rank, 
	as <a href="/eflora/eflora_display.php?tid=24223"><i>Emmenanthe penduliflora</i></a>
<br />&nbsp;&nbsp;<i>Emmenanthe penduliflora</i> var. <i>rosea</i> treated at species rank, 
	as <a href="/eflora/eflora_display.php?tid=24224"><i>Emmenanthe rosea</i></a>
<br />&nbsp;&nbsp;<i>Hesperochiron californicus</i> 
	changed to <a href="/eflora/eflora_display.php?tid=102667"><i>Hesperochiron nanus</i></a>, 
	with nomenclatural priority
<br /><b>LENNOACEAE:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=10567"><i>Pholisma</i></a> 
	transferred to <a href="/eflora/eflora_display.php?tid=171">Lennoaceae</a>
<br /><b>NAMACEAE:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=9648"><i>Eriodictyon</i></a>, 
	<a href="/eflora/eflora_display.php?tid=9653"><i>Nama</i></a>, 
	and <a href="/eflora/eflora_display.php?tid=10340"><i>Wigandia</i></a> 
	transferred to <a href="/eflora/eflora_display.php?tid=84714">Namaceae</a>
<br /><b>POLEMONIACEAE:</b>
<br />&nbsp;&nbsp;<i>Leptosiphon acicularis</i> 
	changed to <a href="/eflora/eflora_display.php?tid=84733"><i>Leptosiphon aureus</i></a> Benth., 
	with nomenclatural priority
<br />&nbsp;&nbsp;<i>Leptosiphon aureus</i> (Nutt.) Benth. ex E. Vilm., 
	an illegitimate name (later homonym of <i>Leptosiphon aureus</i> Benth.), 
	changed to <a href="/eflora/eflora_display.php?tid=103483"><i>Leptosiphon chrysanthus</i></a>
<br />&nbsp;&nbsp;<i>Leptosiphon aureus</i> subsp. <i>aureus</i> 
	changed to <a href="/eflora/eflora_display.php?tid=101708"><i>Leptosiphon chrysanthus</i> subsp. <i>chrysanthus</i></a>
<br />&nbsp;&nbsp;<i>Leptosiphon aureus</i> subsp. <i>decorus</i> 
	changed to <a href="/eflora/eflora_display.php?tid=101707"><i>Leptosiphon chrysanthus</i> subsp. <i>decorus</i></a>
<br />&nbsp;&nbsp;<i>Linanthus bigelovii</i> 
	in California treated as newly described subspecies, 
	<a href="/eflora/eflora_display.php?tid=103462"><i>Linanthus bigelovii</i> subsp. <i>johnsonii</i></a>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=81158"><i>Linanthus californicus</i> subsp. <i>californicus</i></a>, 
	newly recognized, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=81157"><i>Linanthus californicus</i> subsp. <i>glandulosus</i></a>, 
	newly recognized, added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=81179"><i>Linanthus californicus</i> subsp. <i>tomentosus</i></a>, 
	newly recognized, added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=103271"><i>Linanthus dichotomus</i> subsp. <i>pattersonii</i></a>, 
	newly described, added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=101716"><i>Linanthus maculatus</i> subsp. <i>emaculatus</i></a>, 
	newly described, added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=101717"><i>Linanthus maculatus</i> subsp. <i>maculatus</i></a>, 
	newly recognized, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=81161"><i>Linanthus pungens</i> subsp. <i>hallii</i></a>, 
	newly recognized, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=98684"><i>Linanthus pungens</i> subsp. <i>pulchriflorus</i></a>, 
	newly recognized, as native 
<br />
<br />
</p></blockquote>
<!-- END revision block 9 -->

<!-- BEGIN revision block 10-->
<hr>

<h2 align="center"><p>
<a name="rev10" id="rev10"></a>Revision 10
<br />
April 2022
</p></h2>
<blockquote class="bodyText">
<p>
Revision 10 involves treatments that have changed taxonomically (e.g., taxa added or deleted) since Revision 8 of the <i>Jepson eFlora</i>. A summary of the changes incorporated in the <i>eFlora</i> is presented below.</p>
<br />
&nbsp;	
<b>Brief Summary of Changes in Revision 10</b>

<br /><b>ANGIOSPERMS</b>
<br /><b>ADOXACEAE:</b>
<br />&nbsp;&nbsp;Adoxaceae changed to <a href="/eflora/eflora_display.php?tid=76399">Viburnaceae</a> (conserved name)

<br /><b>AGAVACEAE:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=89180"><i>Yucca jaegeriana</i></a>  added, as native

<br /><b>CACTACEAE:</b>
<br />&nbsp;&nbsp;<i>Cylindropuntia californica</i> var. <i>parkeri</i> changed to <a href="/eflora/eflora_display.php?tid=84765"><i>Cylindropuntia bernardina</i></a>

<br /><b>CAMPANULACEAE:</b>
<br />&nbsp;&nbsp;<i>Downingia ornatissima</i> var. <i>eximia</i> changed to <a href="/eflora/eflora_display.php?tid=84766"><i>Downingia ornatissima</i> var. <i>mirabilis</i></a> (replacement name)

<br /><b>CRASSULACEAE:</b>
<br />&nbsp;&nbsp;<i>Sedum laxum</i> subsp. <i>eastwoodiae</i> changed to <a href="/eflora/eflora_display.php?tid=76622">Sedum eastwoodiae</i></a>
<br />&nbsp;&nbsp;<i>Sedum laxum</i> subsp. <i>flavidum</i> changed to <a href="/eflora/eflora_display.php?tid=82981">Sedum flavidum</i></a>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=82854"><i>Sedum marmorense</i></a> added, as native
<br />&nbsp;&nbsp;<i>Sedum obtusatum</i> subsp. <i>boreale</i> changed to <a href="/eflora/eflora_display.php?tid=100467">Sedum kiersteadiae</i></a>
<br />&nbsp;&nbsp;<i>Sedum obtusatum</i> subsp. <i>paradisum</i> changed to <a href="/eflora/eflora_display.php?tid=76621">Sedum paradisum</i></a>
<br />&nbsp;&nbsp;<i>Sedum obtusatum</i> subsp. <i>retusum</i> changed to <a href="/eflora/eflora_display.php?tid=76624">Sedum sanhedrinum</i></a>
<br />&nbsp;&nbsp;<i>Sedum oreganum</i>removed, not in California
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=108792"><i>Sedum paradisum</i> subsp. <i>paradisum</i></a> recognized, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=108791"><i>Sedum paradisum</i> subsp. <i>subroseum</i></a> added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=84356"><i>Sedum patens</i></a>, added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=52942"><i>Sedum radiatum</i> subsp. <i>depauperatum</i></a> added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=52943"><i>Sedum radiatum</i> subsp. <i>radiatum</i></a> recognized, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=84357"><i>Sedum rubiginosum</i></a> added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=52950"><i>Sedum stenopetalum</i> subsp. <i>ciliosum</i></a> added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=52953"><i>Sedum stenopetalum</i> subsp. <i>stenopetalum</i></a> recognized, as native

<br /><b>POLYGONACEAE:</b>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=103862"><i>Chorizanthe aphanantha</i></a> added, as native
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=82842"><i>Chorizanthe eastwoodiae</i></a> added, as native
	
<br /><b>ROSACEAE:</b>
<br />&nbsp;&nbsp;<i>Acaena pinnatifida</i> var. <i>californica</i> changed to <a href="/eflora/eflora_display.php?tid=11685"><i>Acaena californica</i></a>
<br />&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=84767"><i>Holodiscus discolor</i> var. <i>cedrorum</i></a> added, as native

<br /><b>VIBURNACEAE:</b>
<br />&nbsp;&nbsp;<i>Sambucus nigra</i> subsp. <i>caerulea</i> changed to <a href="/eflora/eflora_display.php?tid=43127"><i>Sambucus mexicana</i></a> (name with priority)


<br />
<br />
</p></blockquote>
<!-- END revision block 10 -->
<!-- End body section-->



</span>
	</div>
   </td>
  </tr>
</table> <!--close box outline table-->
  
<!-- Begin footer -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/footer.php'); ?>
<!-- End footer -->

 
 	</td>
   <td class="spacer1"><img src="/common/images/common_spacer.gif" alt="" style="height:1px;width:15px;"></td>
  </tr>
 </table> <!--close outside normal table-->




</body>
</html>
