
<!DOCTYPE html>
 
<html lang="en"> 

<head>
<title>Jepson eFlora: Summary Page</title> 
<meta charset="UTF-8">
<meta name="description" content="For vascular plants occurring in wildlands or otherwise outside of cultivation in California, the Jepson eFlora contains taxonomic treatments, distribution maps, illustrations, photographs, and identification keys.">
 <meta name="keywords" content="California Flora, Jepson eFlora, Flora of California, Vascular Plants of California, Jepson Flora Project, ">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="/common/css/dropdowns.css" rel="stylesheet" type="text/css">
	<link href="/common/css/jepson_eflora.css" rel="stylesheet" type="text/css">
		<link rel="shortcut icon" href="/common/images/JepsonLogoSmall.png" type="image/x-icon">


<!-- Google tag (gtag.js) -->
<script async src="//www.googletagmanager.com/gtag/js?id=G-T5YC99QF6Q"></script>
<script>
 window.dataLayer = window.dataLayer || [];
 function gtag(){dataLayer.push(arguments);}
 gtag('js', new Date());

 gtag('config', 'G-T5YC99QF6Q');
</script>

 <script>
  function myFunction() {
   var x = document.lastModified;
   document.getElementById("demo").innerHTML = x;

	var objToday = new Date(),
		domEnder = function() { var a = objToday; if (/1/.test(parseInt((a + "").charAt(0)))) return "th"; a = parseInt((a + "").charAt(1)); return 1 == a ? "st" : 2 == a ? "nd" : 3 == a ? "rd" : "th" }(),
		dayOfMonth = today + ( objToday.getDate() < 10) ? '0' + objToday.getDate() + domEnder : objToday.getDate() + domEnder,
		months = new Array('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'),
		curMonth = months[objToday.getMonth()],
		curYear = objToday.getFullYear();
	var today = dayOfMonth + " " + curMonth + " " + curYear;

	document.getElementById("DateA").innerHTML = today; 
	document.getElementById("DateB").innerHTML = today; 

  }
 </script>


</head>

<body onload="myFunction()">

<div class="header">
<header>
 <table style="background-color: #003366;">
 <tr>
	<td style="width:100vw;">

  <div class="section1" style="display: inline-block">
		<div style="display: block">
      <a href="/jeps/" title="Jepson Herbarium">
        <img class="JEPS" src="/common/images/JepsonLogoSmall.png" alt="Jepson Herbarium (JEPS) logo image" title="Jepson Herbarium">
      </a>
		</div>
		<div style="margin-bottom: 5px; display: block">
  	<span class="logoText">Jepson&nbsp;Herbarium</span>
		</div>
  </div>

  <div class="section2" style="display: inline-block">
			<div class="titleTextHead">The University and Jepson Herbaria</div>
			<div class="titleTextTag">University of California, Berkeley</div>
  </div>

</td></tr>
</table>
</header>
</div>

	<nav aria-label="global navigation menu" tabindex="0">
<table class="horizMenu" align="center">
<tr>
<td>
	<ul >
  	<li class="globalNav"><a class="globalNav" href="/">Home</a></li>
    <li class="globalNav"><a class="globalNav" href="/main/collections.html">About &#x25BE;</a>
    	<ul>
        <li class="globalNav"><a class="globalNavSub" href="/main/collections.html#UC">About the Collections</a></li>
        <li class="globalNav"><a class="globalNavSub" href="/main/directory.html">People</a></li>
        <li class="globalNav"><a class="globalNavSub" href="/main/guidelines.html">Visiting the Herbaria</a></li>
        <li class="globalNav"><a class="globalNavSub" href="/main/volunteer.html">Volunteering</a></li>
        <li class="globalNav"><a class="globalNavSub" href="/main/policies.html">Policies</a></li>
        <li class="globalNav"><a class="globalNavSub" href="/history/">History</a></li>
      </ul>
    </li>
    <li class="globalNav"><a class="globalNav" href="/main/research/">Research &#x25BE;</a>
    	<ul>
      	<li class="globalNav"><a class="globalNavSub" href="/main/research/faculty.html">Faculty Research Programs</a></li>
        <li class="globalNav"><a class="globalNavSub" href="/jepsonflora/Herb_Pubs.html">Herbarium Publications</a></li>
        <li class="globalNav"><a class="globalNavSub" href="/jepsonflora/">Jepson Flora Project</a></li>
        <li class="globalNav"><a class="globalNavSub" href="/CPD/algal_research.html">Silva Center for Phycological <br>Documentation</a></li>
        <li class="globalNav"><a class="globalNavSub" href="/bryolab/CPPP/">California Plant Phylodiversity Project</a></li>
      </ul>
    </li>
    <li class="globalNav"><a class="globalNav" href="/main/databases.html">Databases &#x25BE;</a>
    	<ul>
      	<li class="globalNav"><a class="globalNavSub" href="https://webapps.cspace.berkeley.edu/ucjeps/publicsearch/publicsearch/">UC/JEPS Specimen Portal</a></li>
      	<li class="globalNav"><a class="globalNavSub" href="https://webapps.cspace.berkeley.edu/ucjeps/searchmedia/search/">UC/JEPS Slide Image Collection</a></li>
        <li class="globalNav"><a class="globalNavSub" href="/consortium/">Consortium of California Herbaria</a></li>
        <li class="globalNav"><a class="globalNavSub" href="/interchange/">Jepson Online Interchange</a></li>
        <li class="globalNav"><a class="globalNavSub" href="/db/icpn/">Index of California Plant Names</a></li>
        <li class="globalNav"><a class="globalNavSub" href="/INA.html">Index Nominum Algarum</a></li>
        <li class="globalNav"><a class="globalNavSub" href="/db/JPNI.html">Jepson Place Name Index</a></li>
        <li class="globalNav"><a class="globalNavSub" href="/baker/">Baker Seed Collection</a></li>
      </ul>
    </li>
    <li class="globalNav"><a class="globalNav" href="">eFloras &#x25BE;</a>
    	<ul>
      	<li class="globalNav"><a class="globalNavSub" href="/eflora/">Jepson eFlora</a></li>
        <li class="globalNav"><a class="globalNavSub" href="/CA_moss_eflora/">California Moss eFlora</a></li>
				<li class="globalNav"><a class="globalNavSub" href="/seaweedflora/seaweedflora.html">Seaweed Flora of California<br>(Upcoming)</a></li>
       	<li class="globalNav"><a class="globalNavSub" href="/efc/">Ecological Flora of California</a></li>
      </ul>
    </li>
    <li class="globalNav"><a class="globalNav" href="/main/education.html">Education &amp; Outreach &#x25BE;</a>
    	<ul>
      	<li class="globalNav"><a class="globalNavSub" href="/workshops/">Public Workshops</a></li>
        <li class="globalNav"><a class="globalNavSub" href="/main/opportunities.html">Academic Opportunities</a></li>
        <li class="globalNav"><a class="globalNavSub" href="/news/botanylunch/">Botany Lunch Seminar</a></li>
        <li class="globalNav"><a class="globalNavSub" href="/jeps/globe/"><i>The Jepson Globe</i></a></li>
        <li class="globalNav"><a class="globalNavSub" href="/media/">Videos and Educational Resources</a></li>
      </ul>
    </li>
    <li class="globalNav"><a class="globalNav" href="/main/archives/">Archives &#x25BE;</a>
    	<ul>
      	<li class="globalNav"><a class="globalNavSub" href="/main/archives/archives_overview.html">Collections Overview</a></li>
        <li class="globalNav"><a class="globalNavSub" href="/archon/">Archives Database</a></li>
        <li class="globalNav"><a class="globalNavSub" href="/main/archives/images.html">Images</a></li>
        <li class="globalNav"><a class="globalNavSub" href="/images/fieldbooks/jepson_fieldbooks.html">Jepson Field Books</a></li>
      </ul>
    </li>
    <li class="globalNav"><a class="globalNav" href="/main/directory.html">Contact</a></li>
    <li class="globalNav"><a class="globalNav" href="/jeps/friends/donate/">Donate</a></li>
  </ul>

</td>
</tr>
</table>
</nav>


<div class="efBody">

	<h1>Jepson eFlora Supplement Summary Page</h1>


<p class="bodyTextBlack">
In the sections that follow are summaries of revisions that have been published online since the publication of the second edition of The Jepson Manual. 
These major revisions are published one or two times a year. The information in these revisions is intended to supersede that in the printed Manual (TJM2). 
The revised treatments can be found in the Jepson eFlora (<a href="/eflora/">https://ucjeps.berkeley.edu/eflora/</a>). Highlighted text in the summaries below will take you to an eFlora species page.
<br><br>
For a list of errata and small changes in treatments that are not included here, please see: <a href="/eflora/errata.html">https://ucjeps.berkeley.edu/eflora/errata.html</a>.
<br><br>
All previous versions of the Jepson eFlora treatments are archived according to date. Previous versions of treatments can be provided upon request. For further details, please e-mail <b>Jason Alexander (<a href="mailto:jason_alexander@berkeley.edu">jason_alexander@berkeley.edu)</b></a>
</p>
</blockquote>

<p class="bodyTextBlack">
<hr>
<!-- BEGIN revision block 1-->
<hr>
<h2 align="center"><p class="bodyTextBlack">
Revision 1
<br>
July 2013
</p></h2>

<blockquote class="bodyTextBlack">
Revision 1 involves treatments that have changed taxonomically (e.g., taxa added or deleted) since the publication of the second edition of <i>The Jepson Manual</i> (2012). A summary of the changes incorporated in the <i>eFlora</i> and in the PDF version of the supplement to the print book is presented below.
<br>
&nbsp;
<br>


<p class=bodyText>
<b>Brief Summary of Changes in Revision 1</b>
<br>	
	<br><b>FERNS</b>
<br><b>Cyatheaceae:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=98705"><i>Sphaeropteris cooperi</i></a> added to flora as naturalized, requiring treatment of <a href="/eflora/eflora_display.php?tid=5">Cyatheaceae</a> as well as its placement in Family Key, Group 3.	
<br>	
	<br><b>ANGIOSPERMS</b>
<br><b>Asteraceae:</b>	
<br>&nbsp;&nbsp;<i>Arida</i></a> changed to <a href="/eflora/eflora_display.php?tid=68775"><i>Leucosyris</i></a>, which has nomenclatural priority; <i>Arida</i> changed to <i>Leucosyris</i> in keys to genera of Asteraceae: in key to genera of Asteraceae, Group 6.
<br>&nbsp;&nbsp;<i>Arida carnosa</i> changed to <a href="/eflora/eflora_display.php?tid=98683"><i>Leucosyris carnosa</i></a> at key lead 15 and the leads reversed for alphabetical order (p. 217 in TJM2); in key to genera of Asteraceae, Group 14.
<br>&nbsp;&nbsp;<i>Arida arizonica</i> changed to <a href="/eflora/eflora_display.php?tid=98682"><i>Leucosyris arida</i></a> at key lead 26, and the leads reversed for alphabetical order (p. 227 in TJM2).
<br>&nbsp;&nbsp;Note under <i>Machaeranthera</i> changed to: Other taxa in TJM (1993) moved to <i>Arida</i> in TJM2 (2012); taxa included in <i>Arida</i> in TJM2 (2012) moved to <i>Leucosyris</i>. <i>Arida</i> names included in illustrations on page 247 in TJM2 to be changed to follow revised taxonomy.

<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=81020"><i>Gamochaeta argyrinea</i></a>, added as naturalized in California, with incorporation into key to species of <i>Gamochaeta</i>.
	
<br><b>Apocynaceae:</b>	
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=9996"><i>Asclepias linaria</i></a> deleted (previous inclusion based on faulty locality data), with removal from key to members of <i>Asclepias</i> as well.

<br><b>Boraginaceae:</b>
<br>&nbsp;&nbsp;Segregation of <i>Phacelia dalesiana</i></a> to <a href="/eflora/eflora_display.php?tid=95351"><i>Howellanthus dalesianus</i></a>; thorough revision of remainder of <i>Phacelia</i> including some taxonomic changes. 	

<br><b>Brassicaceae:</b>	
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=46552"><i>Thysanocarpus curvipes</i></a> divided into five subspecies.
<br>&nbsp;&nbsp;<i>Thysanocarpus laciniatus</i> var. <i>hitchcockii</i> elevated to species rank as <a href="/eflora/eflora_display.php?tid=82409"><i>Thysanocarpus desertorum</i></a>.
<br>&nbsp;&nbsp;<i>Thysanocarpus laciniatus</i> var. <i>rigidus</i> elevated to species rank as <a href="/eflora/eflora_display.php?tid=46552"><i>Thysanocarpus rigidus</i></a>, leaving no varieties in <a href="/eflora/eflora_display.php?tid=46555"><i>Thysanocarpus laciniatus</i></a>

<br><b>Chenopodiaceae:</b>	
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=11490"><i>Atriplex</i></a>: Three taxa moved to new genera <a href="/eflora/eflora_display.php?tid=95360"><i>Extriplex</i></a> and <a href="/eflora/eflora_display.php?tid=95036"><i>Stutzia</i></a>, the rest retained in <i>Atriplex</i>, with incorporation of new genera into key to genera of Chenopodiaceae. 

<br><b>Cistaceae:</b>
<br>&nbsp;&nbsp;All members of <i>Helianthemum</i> transferred to <a href="/eflora/eflora_display.php?tid=68330"><i>Crocanthemum</i></a>, with change from <i>Helianthemum</i> to <i>Crocanthemum</i> in key to genera of Cistaceae. <i>Helianthemum scoparium</i> split into four terminal taxa. 	
	
<br><b>Euphorbiaceae:</b>	
<br>&nbsp;&nbsp;<i>Chamaesyce</i> transferred to <a href="/eflora/eflora_display.php?tid=9260"><i>Euphorbia</i></a>, with unification under the latter in key to genera of Euphorbiaceae, and incorporation into one key of taxa treated in keys to members of <i>Chamaesyce</i> and <i>Euphorbia</i> in TJM2, into one key; the revision for Supplement I also includes addition of a species new to science, <i>E. jaegeri</i>, as well as partial treatment of taxa shown to occur as waifs in the state, <i>E. myrsinites</i> and <i>E. rigida</i>, which previously had not been included at all on the grounds that they were garden weeds that had not escaped cultivation.

<br><b>Lamiaceae:</b>
<br>&nbsp;&nbsp;<i>Hyptis emoryi</i> becomes <a href="/eflora/eflora_display.php?tid=98461"><i>Condea emoryi</i></a>, leaving no <i>Hyptis</i> in California. 	

<br><b>Polemoniaceae:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=98885"><i>Navarretia paradoxiclara</i></a> newly described, added, as native.
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=98884"><i>Navarretia paradoxinota</i></a> newly described, added, as native.
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=34455"><i>Navarretia intertexta</i></a> and <a href="/eflora/eflora_display.php?tid=80960"><i>Navarretia sinistra</i></a> recircumscribed.	
	
<br><b>Primulaceae:</b>
<br>&nbsp;&nbsp;<i>Dodecatheon</i>transferred to <a href="/eflora/eflora_display.php?tid=10710"><i>Primula</i></a>, expanding the latter in California from one to twelve taxa. 
 
<br><b>Viscaceae:</b> 
<br>&nbsp;&nbsp;<i>Phoradendron</i></a>: ruling by nomenclature committee resulted in change from <i>P. serotinum</i> and subspp. to <a href="/eflora/eflora_display.php?tid=37905"><i>P. leucarpum</i></a> and subspp., with corresponding changes in key to members of <i>Phoradendron</i>. 
</blockquote>
</p>


<p class="bodyTextBlack">
<H2 align="center"><a href="/eflora/TJM2_Supplement.pdf">Download Supplement 1 PDF</a></H2>
<!-- END revision block 1 -->

<!-- BEGIN revision block 2-->
<hr>
<h2 align="center"><p class="bodyTextBlack">
<a name="rev2" id="rev2"></a>Revision 2
<br>
December 2014
</p></h2>

<blockquote class="bodyTextBlack">
Revision 2 involves treatments that have changed taxonomically (e.g., taxa added or deleted) since the publication of the second edition of <i>The Jepson Manual</i> (2012). A summary of the changes incorporated in the <i>eFlora</i> and in the PDF version of the second supplement to the print book is presented below.
<br>
&nbsp;
<br>


<P class=bodyText>
<b>Brief Summary of Changes in Revision 2</b>
<br>
	<br><b>FERNS</b>
<br><b>Pteridaceae:</b> 
<br>&nbsp;&nbsp;All CA members of <i>Cheilanthes</i> transferred to <a href="/eflora/eflora_display.php?tid=Myriopteris"><i>Myriopteris</i></a> 
<br>
	<br><b>ANGIOSPERMS</b>
<br><b>Adoxaceae:</b> 
<br>&nbsp;&nbsp;<i><a href="/eflora/eflora_display.php?tid=48036">Viburnum opulus</a></i> added, as naturalized, replacing <i>Viburnum edule</i>
<br>&nbsp;&nbsp;<i><a href="/eflora/eflora_display.php?tid=81254">Viburnum rigidum</a></i> added, as naturalized
<br><b>Asteraceae:</b> 
<br>&nbsp;&nbsp;<i><a href="/eflora/eflora_display.php?tid=2456">Dittrichia viscosa</a></i> added, as naturalized
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99213"><i>Lagophylla diabolensis</i></a> newly described, added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=98665"><i>Pallenis maritima</i></a> added, as naturalized
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=95226"><i>Volutaria canariensis</i></a> added, as naturalized

<br><b>Boraginaceae:</b>
<br>&nbsp;&nbsp;<i>Hydrophyllum capitatum</i> var. <i>alpinum</i> changed to <a href="/eflora/eflora_display.php?tid=99771"><i>Hydrophyllum alpestre</i></a>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=48535"><i>Wigandia urens</i></a> added, as naturalized

<br><b>Cactaceae:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=80391"><i>Cylindropuntia acanthocarpa</i> var. <i>acanthocarpa</i></a> becomes the accepted name for <i>Cylindropuntia acanthocarpa</i> var. <i>coloradensis</i>, with the latter as a synonym</span>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99695"><i>Cylindropuntia chuckwallensis</i></a> newly described, added, as native</span>
<br>&nbsp;&nbsp;<i>Cylindropuntia &times;fosbergii</i> changed to <a href="/eflora/eflora_display.php?tid=80396"><i>Cylindropuntia fosbergii</i></a>

<br><b>Ericaceae:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=40453"><i>Pyrola aphylla</i></a> added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99776"><i>Pyrola crypta</i></a> newly described, added, as native 
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=40456"><i>Pyrola dentata</i></a> added, as native

<br><b>Fagaceae:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=40723"><i>Quercus robur</i></a> added, as waif

<br><b>Montiaceae:</b>
<br>&nbsp;&nbsp;<i>Calandrinia ciliata</i> replaced by <a href="/eflora/eflora_display.php?tid=95066"><i>Calandrinia menziesii</i></a> added, as native
<br>&nbsp;&nbsp;<i>Calyptridium parryi</i> A. Gray var. <i>arizonicum</i> changed to <a href="/eflora/eflora_display.php?tid=95389"><i>Calyptridium arizonicum</i></a>, as native

<br><b>Myrsinaceae:</b>
<br>&nbsp;&nbsp;<i>Anagallis arvensis</i> changed to <a href="/eflora/eflora_display.php?tid=99404"><i>Lysimachia arvensis</i></a>, as naturalized
<br>&nbsp;&nbsp;<i>Anagallis minima</i> changed to <a href="/eflora/eflora_display.php?tid=99408"><i>Lysimachia minima</i></a>, as native
<br>&nbsp;&nbsp;<i>Anagallis monelli</i> changed to <a href="/eflora/eflora_display.php?tid=99409"><i>Lysimachia monelli</i></a>, as waif
<br>&nbsp;&nbsp;<i>Anagallis</i> transferred to <a href="/eflora/eflora_display.php?tid=10709"><i>Lysimachia</i></a>, leaving no <i>Anagallis</i> in California	
<br>&nbsp;&nbsp;<i>Glaux maritima</i> changed to <a href="/eflora/eflora_display.php?tid=99407"><i>Lysimachia maritima</i></a>, as native
<br>&nbsp;&nbsp;<i>Glaux</i> transferred to <a href="/eflora/eflora_display.php?tid=10709"><i>Lysimachia</i></a>, leaving no <i>Glaux</i> in California
<br>&nbsp;&nbsp;<i>Trientalis europaea</i> changed to <a href="/eflora/eflora_display.php?tid=99405"><i>Lysimachia europaea</i></a>, as native
<br>&nbsp;&nbsp;<i>Trientalis latifolia</i> changed to <a href="/eflora/eflora_display.php?tid=99406"><i>Lysimachia latifolia</i></a>, as native
<br>&nbsp;&nbsp;<i>Trientalis</i> transferred to <a href="/eflora/eflora_display.php?tid=10709"><i>Lysimachia</i></a>, leaving no <i>Trientalis</i> in California
	
<br><b>Polemoniaceae:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99435"><i>Polemonium eddyense</i></a> newly described, added, as native
<br>&nbsp;&nbsp;<i>Polemonium occidentale</i> subsp. <i>occidentale</i> no longer recognized, treated as synonym of <a href="/eflora/eflora_display.php?tid=38984"><i>Polemonium occidentale</i></a>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99202"><i>Polemonium pulcherrimum</i> var. <i>shastense</i></a> recognized, added, as native
	
<br><b>Polygonaceae:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99777"><i>Chorizanthe minutiflora</i></a> newly described, added, as native

	<br><b>Rosaceae:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=65314"><i>Rosa woodsii</i> var. <i>glabrata</i></a> added, as native and belonging to <a href="/eflora/eflora_display.php?tid=87494"><i>Rosa woodsii</i> subsp. <i>gratissima</i></a>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=65315"><i>Rosa woodsii</i> var. <i>gratissima</i></a> added, as native and belonging to <a href="/eflora/eflora_display.php?tid=87494"><i>Rosa woodsii</i> subsp. <i>gratissima</i></a>
<br>	
<br><b>MONOCOTS</b>
<br><b>Cyperaceae:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=98894"><i>Calliscirpus brachythrix</i></a> newly described, added, as native
<br>&nbsp;&nbsp;<i>Eriophorum crinigerum</i> transferred to <a href="/eflora/eflora_display.php?tid=98942"><i>Calliscirpus</i></a>, as <a href="/eflora/eflora_display.php?tid=98895"><i>Calliscirpus criniger</i></a>, as native
	
	
<br><b>Poaceae:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=98887"><i>Agrostis lacuna-vernalis</i></a> newly described, added, as native
<br>
<br>

<h3 align="center"><a href="/eflora/TJM2_Supplement_II.pdf">Download Supplement 2 PDF</a></h3>
</blockquote>

<!-- END revision block 2 -->

<!-- BEGIN revision block 3-->
<hr>
<h2 align="center"><p class="bodyTextBlack">
<a name="rev3" id="rev3"></a>Revision 3
<br>
December 2015
</p></h2>


<blockquote class="bodyTextBlack">
Revision 3 involves treatments that have changed taxonomically (e.g., taxa added or deleted) since the publication of the second edition of <i>The Jepson Manual</i> (2012). A summary of the changes incorporated in the <i>eFlora</i> and in the PDF version of the third supplement to the print book is presented below.
<br>
&nbsp;
<br>



<b>Brief Summary of Changes in Revision 3</b><br>
	
<br><b>ANGIOSPERMS</b>
<br><b>Polemoniaceae:</b> 
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99214"><i>Eriastrum ertterae</i></a> newly described, added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99215"><i>Eriastrum rosamondense</i></a> newly described, added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99455"><i>Linanthus bernardinus</i></a> newly described, added, as native
<br>
<br><b>MONOCOTS</b>
<br><b>Cyperaceae:</b> 
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99296"><i>Carex cyrtostachya</i></a> newly described, added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=98712"><i>Carex orestera</i></a> newly described, added, as native, replacing <i>Carex albonigra</i>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99775"><i>Carex xerophila</i></a> newly described, added, as native
<br>&nbsp;&nbsp;Plants called <i>Carex albonigra</i> in TJM2 are <a href="/eflora/eflora_display.php?tid=98712"><i>Carex orestera</i></a>; <i>Carex albonigra</i> is not in California
<br><b>Juncaceae:</b> 
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=29620"><i>Juncus bulbosus</i></a> added, as naturalized
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=29639"><i>Juncus dichotomus</i></a> added, as naturalized
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=101077"><i>Juncus elliottii</i></a> added, as naturalized
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=98862"><i>Juncus trilocularis</i></a> newly described, added, as native, replacing <i>Juncus brachyphyllus</i>
<br>&nbsp;&nbsp;Plants called <i>Juncus brachyphyllus</i> in TJM2; are <a href="/eflora/eflora_display.php?tid=98862"><i>Juncus trilocularis</i></a>; <i>Juncus brachyphyllus</i> is not in California	
</p>
<br><br>
	
<h3 align="center"><a href="/eflora/TJM2_Supplement_III.pdf">Download Supplement 3 PDF</a></h3>
</blockquote>
	
<!-- END revision block 3 -->

<!-- BEGIN revision block 4-->
<hr>
<h2 align="center"><p class="bodyTextBlack">
<a name="rev4" id="rev4"></a>Revision 4
<br>
December 2016
</p></h2>

<blockquote class="bodyTextBlack">
Revision 4 involves treatments that have changed taxonomically (e.g., taxa added or deleted) since the publication of the second edition of <i>The Jepson Manual</i> (2012). A summary of the changes incorporated in the <i>eFlora</i> is presented below.
<br>
&nbsp;
<br>	
	
<p class="bodyTextBlack">
<b>Brief Summary of Changes in Revision 4</b><br>
<br>
	<br><b>FERNS</b>

<br><b>Athyriaceae:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=10761"><i>Athyrium</i></a> transferred to <a href="/eflora/eflora_display.php?tid=79419">Athyriaceae</a> from Woodsiaceae

<br><b>Blechnaceae:</b>
<br>&nbsp;&nbsp;<i>Blechnum spicant</i> transferred to <a href="/eflora/eflora_display.php?tid=69297"><i>Struthiopteris</i></a>, as <a href="/eflora/eflora_display.php?tid=45778"><i>Struthiopteris spicant</i></a>, leaving no <i>Blechnum</i> in California

<br><b>Cystopteridaceae:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=10766"><i>Cystopteris</i></a> transferred to <a href="/eflora/eflora_display.php?tid=101729">Cystopteridaceae</a> from Woodsiaceae

<br><b>Pteridaceae:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=100476"><i>Adiantum shastense</i></a> newly described, added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=101693"><i>Pentagramma glanduloviscida</i></a> newly described, added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=100960"><i>Pentagramma maxonii</i></a>, elevated to species rank from <i>Pentagramma triangularis</i> subsp. <i>maxonii</i>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=101694"><i>Pentagramma rebmanii</i></a>, elevated to species rank from <i>Pentagramma triangularis</i> subsp. <i>rebmanii</i> (which was mentioned in a note under <i>Pentagramma triangularis</i> subsp. <i>triangularis</i> in TJM2)
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=100961"><i>Pentagramma viscosa</i></a>, elevated to species rank from <i>Pentagramma triangularis</i> subsp. <i>viscosa</i>.
<br>
<br><b>ANGIOSPERMS</b>
	
<br><b>Asteraceae:</b>
<br>&nbsp;&nbsp;<i>Bahia neomexicana</i> transferred to <a href="/eflora/eflora_display.php?tid=555"><i>Picradeniopsis</i></a>, changed to <a href="/eflora/eflora_display.php?tid=101696"><i>Picradeniopsis multiflora</i></a>, leaving no <i>Bahia</i> in California
<br>&nbsp;&nbsp;<i>Amauriopsis dissecta</i> transferred to <a href="/eflora/eflora_display.php?tid=482"><i>Hymenothrix</i></a>, changed to <a href="/eflora/eflora_display.php?tid=101695"><i>Hymenothrix dissecta</i></a>, leaving no <i>Amauriopsis</i> in California	
	
<br><b>Boraginaceae:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=94699"><i>Eriodictyon sessilifolium</i></a> new to California, added, as native

<br><b>Rhamnaceae:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=100793"><i>Ceanothus decornutus</i></a> newly described, added as native, a segregate of <i>Ceanothus jepsonii</i>
<br>&nbsp;&nbsp;Plants called <i>Ceanothus vestitus</i> in TJM2 are <a href="/eflora/eflora_display.php?tid=94455"><i>Ceanothus pauciflorus</i></a>; <i>Ceanothus vestitus</i> is a synonym of <i>C. pauciflorus</i>
</p>
<br><br>
</blockquote>

<!-- END revision block 4 -->

<!-- BEGIN revision block 5 -->
<hr>
<h2 align="center"><p class="bodyTextBlack">
<a name="rev5" id="rev5"></a>Revision 5
<br>
December 2017
</p></h2>

<blockquote class="bodyTextBlack"><p class="bodyTextBlack">
Revision 5 involves treatments that have changed taxonomically (e.g., taxa added or deleted) since Revision 4 of the <i>Jepson eFlora</i> (2017). A summary of the changes incorporated in the <i>eFlora</i> is presented below.
</p>
<br>
&nbsp;
<br>	
	
<b>Brief Summary of Changes in Revision 5</b><br>
<br>
	<br><b>LYCOPHYTES</b>

<br><b>Selaginellaceae:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=44058"><i>Selaginella kraussiana</i></a> added, as naturalized
<br>
<br><b>ANGIOSPERMS</b>

<br><b>Apiaceae:</b>
<br>&nbsp;&nbsp;<i>Lomatium dissectum</i> var. <i>multifidum</i> elevated to species rank as <a href="/eflora/eflora_display.php?tid=103317"><i>Lomatium multifidum</i></a>, leaving no varieties in <a href="/eflora/eflora_display.php?tid=31405"><i>Lomatium dissectum</i></a>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=103334"><i>Lomatium ravenii</i> var. <i>piutense</i></a> newly described, added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=103335"><i>Lomatium ravenii</i> var. <i>ravenii</i></a> recognized, as native
<br>&nbsp;&nbsp;<i>Orogenia</i> transferred to <a href="/eflora/eflora_display.php?tid=10198"><i>Lomatium</i></a>, <i>Orogenia fusiformis</i> changed to <a href="/eflora/eflora_display.php?tid=103316"><i>Lomatium fusiformis</i></a>
<br>&nbsp;&nbsp;<i>Sphenosciadium</i> transferred to <a href="/eflora/eflora_display.php?tid=10358"><i>Angelica</i></a>, <i>Sphenosciadium capitellatum</i> changed to <a href="/eflora/eflora_display.php?tid=101118"><i>Angelica capitellata</i></a>

	
<br><b>Asteraceae:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=101119"><i>Antennaria sawyeri</i></a> newly described, added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99395"><i>Helianthus winteri</i></a> newly described, added, as native

<br><b>Crassulaceae:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=100425"><i>Sedum citrinum</i></a> newly described, added, as native

<br><b>Ericaceae:</b>
<br>&nbsp;&nbsp;<i>Pyrola chlorantha</i></a> removed, not in California
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=100790"><i>Vaccinium shastense</i></a> newly described, added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=100788"><i>Vaccinium shastense</i> subsp. <i>nevadense</i></a> newly described, added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=100789"><i>Vaccinium shastense</i> subsp. <i>shastense</i></a> recognized, as native

<br><b>Linaceae:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=31174"><i>Linum trigynum</i></a> added, as naturalized

<br><b>Onagraceae:</b>
<br>&nbsp;&nbsp;<i>Oenothera primiveris</i> subsp. <i>bufonis</i> no longer recognized, leaving no subspecies in <a href="/eflora/eflora_display.php?tid=35043"><i>Oenothera primiveris</i></a>

<br><b>Orobanchaceae:</b>
<br>&nbsp;&nbsp;All native taxa of <i>Orobanche</i> transferred to <a href="/eflora/eflora_display.php?tid=103351"><i>Aphyllon</i></a>
<br>&nbsp;&nbsp;<i>Orobanche ramosa</i> changed to <a href="/eflora/eflora_display.php?tid=103318"><i>Phelipanche ramosa</i></a>, leaving no <i>Orobanche</i> in California
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=103326"><i>Aphyllon epigalium</i></a> newly described, added as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=103327"><i>Aphyllon epigalium</i> subsp. <i>epigalium</i></a> recognized, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=103328"><i>Aphyllon epigalium</i> subsp. <i>notocalifornicum</i></a> newly described, added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=103313"><i>Aphyllon robbinsii</i></a> newly described, added as native
<br>&nbsp;&nbsp;<i>Orobanche bulbosa</i> changed to <a href="/eflora/eflora_display.php?tid=13614"><i>Aphyllon tuberosum</i></a>
<br>&nbsp;&nbsp;<i>Orobanche californica</i> changed to <a href="/eflora/eflora_display.php?tid=103319"><i>Aphyllon californicum</i></a>
<br>&nbsp;&nbsp;<i>Orobanche californica</i> subsp. <i>californica</i> changed to <a href="/eflora/eflora_display.php?tid=103320"><i>Aphyllon californicum</i> subsp. <i>californicum</i></a>
<br>&nbsp;&nbsp;<i>Orobanche californica</i> subsp. <i>condensa</i> changed to <a href="/eflora/eflora_display.php?tid=103321"><i>Aphyllon californicum</i> subsp. <i>condensum</i></a>
<br>&nbsp;&nbsp;<i>Orobanche californica</i> subsp. <i>feudgei</i> changed to <a href="/eflora/eflora_display.php?tid=103322"><i>Aphyllon californicum</i> subsp. <i>feudgei</i></a>
<br>&nbsp;&nbsp;<i>Orobanche californica</i> subsp. <i>grandis</i> changed to <a href="/eflora/eflora_display.php?tid=103323"><i>Aphyllon californicum</i> subsp. <i>grande</i></a>
<br>&nbsp;&nbsp;<i>Orobanche californica</i> subsp. <i>grayana</i> changed to <a href="/eflora/eflora_display.php?tid=103324"><i>Aphyllon californicum</i> subsp. <i>grayanum</i></a>
<br>&nbsp;&nbsp;<i>Orobanche californica</i> subsp. <i>jepsonii</i> changed to <a href="/eflora/eflora_display.php?tid=103325"><i>Aphyllon californicum</i> subsp. <i>jepsonii</i></a>
<br>&nbsp;&nbsp;<i>Orobanche cooperi</i> changed to <a href="/eflora/eflora_display.php?tid=13615"><i>Aphyllon cooperi</i></a>
<br>&nbsp;&nbsp;<i>Orobanche corymbosa</i> changed to <a href="/eflora/eflora_display.php?tid=103309"><i>Aphyllon corymbosum</i></a>
<br>&nbsp;&nbsp;<i>Orobanche fasciculata</i> changed to <a href="/eflora/eflora_display.php?tid=100018"><i>Aphyllon fasciculatum</i></a>
<br>&nbsp;&nbsp;<i>Orobanche parishii</i> changed to <a href="/eflora/eflora_display.php?tid=103329"><i>Aphyllon parishii</i></a>
<br>&nbsp;&nbsp;<i>Orobanche parishii</i> subsp. <i>brachyloba</i> changed to <a href="/eflora/eflora_display.php?tid=103330"><i>Aphyllon parishii</i> subsp. <i>brachylobum</i></a>
<br>&nbsp;&nbsp;<i>Orobanche parishii</i> subsp. <i>parishii</i> changed to <a href="/eflora/eflora_display.php?tid=103331"><i>Aphyllon parishii</i> subsp. <i>parishii</i></a>
<br>&nbsp;&nbsp;<i>Orobanche pinorum</i> changed to <a href="/eflora/eflora_display.php?tid=13618"><i>Aphyllon pinorum</i></a>
<br>&nbsp;&nbsp;<i>Orobanche uniflora</i> (misapplied; not in California) changed to <a href="/eflora/eflora_display.php?tid=103312"><i>Aphyllon purpureum</i></a>
<br>&nbsp;&nbsp;<i>Orobanche valida</i> changed to <a href="/eflora/eflora_display.php?tid=103314"><i>Aphyllon validum</i></a>
<br>&nbsp;&nbsp;<i>Orobanche valida</i> subsp. <i>howellii</i> changed to <a href="/eflora/eflora_display.php?tid=103332"><i>Aphyllon validum</i> subsp. <i>howellii</i></a>
<br>&nbsp;&nbsp;<i>Orobanche valida</i> subsp. <i>valida</i> changed to <a href="/eflora/eflora_display.php?tid=103333"><i>Aphyllon validum</i> subsp. <i>validum</i></a>
<br>&nbsp;&nbsp;<i>Orobanche vallicola</i> changed to <a href="/eflora/eflora_display.php?tid=103315"><i>Aphyllon vallicolum</i></a>

<br><b>Themidaceae:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99705"><i>Triteleia piutensis</i></a> newly described, added, as native
<br><br>	
</blockquote>

<!-- END revision block 5 -->

<!-- BEGIN revision block 6 -->
<hr>
<h2 align="center"><p class="bodyTextBlack">
<a name="rev6" id="rev6"></a>Revision 6
<br>
September 2018
</p></h2>

<blockquote class="bodyTextBlack">
Revision 6 involves treatments that have changed taxonomically (e.g., taxa added or deleted) since Revision 5 of the <i>Jepson eFlora</i>. A summary of the changes incorporated in the <i>eFlora</i> is presented below.
<br>
&nbsp;
<br>	
	
<b>Brief Summary of Changes in Revision 6</b><br>
<br>

<br><b>ANGIOSPERMS</b>

<br><b>Liliaceae:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=100791"><i>Erythronium shastense</i></a> newly described, added, as native.
<br>
<br><b>Phrymaceae:</b>
<br>&nbsp;&nbsp;All taxa of <a href="/eflora/eflora_display.php?tid=11384"><i>Mimulus</i></a> except <a href="/eflora/eflora_display.php?tid=33706"><i>Mimulus ringens</i></a> transferred to <a href="/eflora/eflora_display.php?tid=11356"><i>Diplacus</i></a>, <a href="/eflora/eflora_display.php?tid=68484"><i>Erythranthe</i></a>, or <a href="/eflora/eflora_display.php?tid=11383"><i>Mimetanthe</i></a>.
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=23081"><i>Diplacus australis</i></a> added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=23082"><i>Diplacus calycinus</i></a> added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99049"><i>Diplacus cusickioides</i></a> newly described, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=103819"><i>Diplacus graniticola</i></a> newly described, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=23088"><i>Diplacus linearis</i></a> added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99076"><i>Diplacus thompsonii</i></a> newly described, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99084"><i>Erythranthe acutidens</i></a> added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99089"><i>Erythranthe arenaria</i></a> added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99090"><i>Erythranthe arenicola</i></a> added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99091"><i>Erythranthe arvensis</i></a> added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99093"><i>Erythranthe barbata</i></a> added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99104"><i>Erythranthe calcicola</i></a> newly described, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99106"><i>Erythranthe carsonensis</i></a> newly described, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99109"><i>Erythranthe corallina</i></a> added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99110"><i>Erythranthe cordata</i></a> added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99116"><i>Erythranthe diffusa</i></a> added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99117"><i>Erythranthe discolor</i></a> added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=100565"><i>Erythranthe erubescens</i></a> newly described, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99121"><i>Erythranthe filicifolia</i></a> added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99124"><i>Erythranthe geniculata</i></a> added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99129"><i>Erythranthe grandis</i></a> added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=98707"><i>Erythranthe hardhamiae</i></a> newly described, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99150"><i>Erythranthe marmorata</i></a> added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99152"><i>Erythranthe microphylla</i></a> added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99158"><i>Erythranthe nasuta</i></a> added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99166"><i>Erythranthe pardalis</i></a> added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99171"><i>Erythranthe percaulis</i></a> newly described, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=103336"><i>Erythranthe ptilota</i></a> newly described, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99212"><i>Erythranthe rhodopetra</i></a> newly described, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=98967"><i>Erythranthe sierrae</i></a> newly described, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=101121"><i>Erythranthe taylorii</i></a> newly described, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=101724"><i>Erythranthe trinitiensis</i></a> newly described, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99193"><i>Erythranthe utahensis</i></a> added, as native
<br>&nbsp;&nbsp;<i>Mimulus alsinoides</i> changed to <a href="/eflora/eflora_display.php?tid=99085"><i>Erythranthe alsinoides</i></a>
<br>&nbsp;&nbsp;<i>Mimulus androsaceus</i> changed to <a href="/eflora/eflora_display.php?tid=99088"><i>Erythranthe androsacea</i></a>
<br>&nbsp;&nbsp;<i>Mimulus angustatus</i> changed to <a href="/eflora/eflora_display.php?tid=99029"><i>Diplacus angustatus</i></a>
<br>&nbsp;&nbsp;<i>Mimulus aurantiacus</i> var. <i>aridus</i> changed to <a href="/eflora/eflora_display.php?tid=23076"><i>Diplacus aridus</i></a>
<br>&nbsp;&nbsp;<i>Mimulus aurantiacus</i> var. <i>aurantiacus</i> changed to <a href="/eflora/eflora_display.php?tid=23077"><i>Diplacus aurantiacus</i></a>
<br>&nbsp;&nbsp;<i>Mimulus aurantiacus</i> var. <i>grandiflorus</i> changed to <a href="/eflora/eflora_display.php?tid=23096"><i>Diplacus grandiflorus</i></a>
<br>&nbsp;&nbsp;<i>Mimulus aurantiacus</i> var. <i>parviflorus</i> changed to <a href="/eflora/eflora_display.php?tid=23092"><i>Diplacus parviflorus</i></a>
<br>&nbsp;&nbsp;<i>Mimulus aurantiacus</i> var. <i>pubescens</i> changed to <a href="/eflora/eflora_display.php?tid=23090"><i>Diplacus longiflorus</i></a>
<br>&nbsp;&nbsp;<i>Mimulus aurantiacus</i> var. <i>puniceus</i> changed to <a href="/eflora/eflora_display.php?tid=23093"><i>Diplacus puniceus</i></a>
<br>&nbsp;&nbsp;<i>Mimulus bicolor</i> changed to <a href="/eflora/eflora_display.php?tid=99095"><i>Erythranthe bicolor</i></a>
<br>&nbsp;&nbsp;<i>Mimulus bigelovii</i> var. <i>bigelovii</i> changed to <a href="/eflora/eflora_display.php?tid=99037"><i>Diplacus bigelovii</i> var. <i>bigelovii</i></a>
<br>&nbsp;&nbsp;<i>Mimulus bigelovii</i> var. <i>cuspidatus</i> changed to <a href="/eflora/eflora_display.php?tid=99038"><i>Diplacus bigelovii</i> var. <i>cuspidatus</i></a>
<br>&nbsp;&nbsp;<i>Mimulus bolanderi</i> changed to <a href="/eflora/eflora_display.php?tid=99039"><i>Diplacus bolanderi</i></a>
<br>&nbsp;&nbsp;<i>Mimulus breviflorus</i> changed to <a href="/eflora/eflora_display.php?tid=99099"><i>Erythranthe breviflora</i></a>
<br>&nbsp;&nbsp;<i>Mimulus brevipes</i> changed to <a href="/eflora/eflora_display.php?tid=99041"><i>Diplacus brevipes</i></a>
<br>&nbsp;&nbsp;<i>Mimulus breweri</i> changed to <a href="/eflora/eflora_display.php?tid=99101"><i>Erythranthe breweri</i></a>
<br>&nbsp;&nbsp;<i>Mimulus cardinalis</i> changed to <a href="/eflora/eflora_display.php?tid=25147"><i>Erythranthe cardinalis</i></a>
<br>&nbsp;&nbsp;<i>Mimulus clevelandii</i> changed to <a href="/eflora/eflora_display.php?tid=23083"><i>Diplacus clevelandii</i></a>
<br>&nbsp;&nbsp;<i>Mimulus congdonii</i> changed to <a href="/eflora/eflora_display.php?tid=99046"><i>Diplacus congdonii</i></a>
<br>&nbsp;&nbsp;<i>Mimulus constrictus</i> changed to <a href="/eflora/eflora_display.php?tid=99047"><i>Diplacus constrictus</i></a>
<br>&nbsp;&nbsp;<i>Mimulus dentatus</i> changed to <a href="/eflora/eflora_display.php?tid=99113"><i>Erythranthe dentata</i></a>
<br>&nbsp;&nbsp;<i>Mimulus douglasii</i> changed to <a href="/eflora/eflora_display.php?tid=99051"><i>Diplacus douglasii</i></a>
<br>&nbsp;&nbsp;<i>Mimulus evanescens</i> changed to <a href="/eflora/eflora_display.php?tid=99137"><i>Erythranthe inflatula</i></a>
<br>&nbsp;&nbsp;<i>Mimulus exiguus</i> changed to <a href="/eflora/eflora_display.php?tid=99119"><i>Erythranthe exigua</i></a>
<br>&nbsp;&nbsp;<i>Mimulus filicaulis</i> changed to <a href="/eflora/eflora_display.php?tid=99120"><i>Erythranthe filicaulis</i></a>
<br>&nbsp;&nbsp;<i>Mimulus floribundus</i> changed to <a href="/eflora/eflora_display.php?tid=99122"><i>Erythranthe floribunda</i></a>
<br>&nbsp;&nbsp;<i>Mimulus fremontii</i> var. <i>fremontii</i> changed to <a href="/eflora/eflora_display.php?tid=99052"><i>Diplacus fremontii</i></a>
<br>&nbsp;&nbsp;<i>Mimulus fremontii</i> var. <i>vandenbergensis</i> changed to <a href="/eflora/eflora_display.php?tid=99080"><i>Diplacus vandenbergensis</i></a>
<br>&nbsp;&nbsp;<i>Mimulus glaucescens</i> changed to <a href="/eflora/eflora_display.php?tid=99127"><i>Erythranthe glaucescens</i></a>
<br>&nbsp;&nbsp;<i>Mimulus gracilipes</i> changed to <a href="/eflora/eflora_display.php?tid=99128"><i>Erythranthe gracilipes</i></a>
<br>&nbsp;&nbsp;<i>Mimulus guttatus</i> changed to <a href="/eflora/eflora_display.php?tid=99131"><i>Erythranthe guttata</i></a>
<br>&nbsp;&nbsp;<i>Mimulus inconspicuus</i> changed to <a href="/eflora/eflora_display.php?tid=99135"><i>Erythranthe inconspicua</i></a>
<br>&nbsp;&nbsp;<i>Mimulus johnstonii</i> changed to <a href="/eflora/eflora_display.php?tid=99057"><i>Diplacus johnstonii</i></a>
<br>&nbsp;&nbsp;<i>Mimulus kelloggii</i> changed to <a href="/eflora/eflora_display.php?tid=99058"><i>Diplacus kelloggii</i></a>
<br>&nbsp;&nbsp;<i>Mimulus laciniatus</i> changed to <a href="/eflora/eflora_display.php?tid=99142"><i>Erythranthe laciniata</i></a>
<br>&nbsp;&nbsp;<i>Mimulus latidens</i> changed to <a href="/eflora/eflora_display.php?tid=99144"><i>Erythranthe latidens</i></a>
<br>&nbsp;&nbsp;<i>Mimulus latifolius</i> changed to <a href="/eflora/eflora_display.php?tid=99040"><i>Diplacus brandegeei</i></a>
<br>&nbsp;&nbsp;<i>Mimulus layneae</i> changed to <a href="/eflora/eflora_display.php?tid=99059"><i>Diplacus layneae</i></a>
<br>&nbsp;&nbsp;<i>Mimulus leptaleus</i> changed to <a href="/eflora/eflora_display.php?tid=99060"><i>Diplacus leptaleus</i></a>
<br>&nbsp;&nbsp;<i>Mimulus lewisii</i> changed to <a href="/eflora/eflora_display.php?tid=99145"><i>Erythranthe lewisii</i></a>
<br>&nbsp;&nbsp;<i>Mimulus mohavensis</i> changed to <a href="/eflora/eflora_display.php?tid=99065"><i>Diplacus mohavensis</i></a>
<br>&nbsp;&nbsp;<i>Mimulus montioides</i> changed to <a href="/eflora/eflora_display.php?tid=99155"><i>Erythranthe montioides</i></a>
<br>&nbsp;&nbsp;<i>Mimulus moschatus</i> changed to <a href="/eflora/eflora_display.php?tid=99156"><i>Erythranthe moschata</i></a>
<br>&nbsp;&nbsp;<i>Mimulus nanus</i> var. <i>jepsonii</i> changed to <a href="/eflora/eflora_display.php?tid=99056"><i>Diplacus jepsonii</i></a>
<br>&nbsp;&nbsp;<i>Mimulus nanus</i> var. <i>mephiticus</i> changed to <a href="/eflora/eflora_display.php?tid=99064"><i>Diplacus mephiticus</i></a>
<br>&nbsp;&nbsp;<i>Mimulus nanus</i> var. <i>nanus</i> changed to <a href="/eflora/eflora_display.php?tid=99066"><i>Diplacus nanus</i></a>
<br>&nbsp;&nbsp;<i>Mimulus norrisii</i> changed to <a href="/eflora/eflora_display.php?tid=99161"><i>Erythranthe norrisii</i></a>
<br>&nbsp;&nbsp;<i>Mimulus nudatus</i> changed to <a href="/eflora/eflora_display.php?tid=99162"><i>Erythranthe nudata</i></a>
<br>&nbsp;&nbsp;<i>Mimulus palmeri</i> changed to <a href="/eflora/eflora_display.php?tid=99165"><i>Erythranthe palmeri</i></a>
<br>&nbsp;&nbsp;<i>Mimulus parishii</i> changed to <a href="/eflora/eflora_display.php?tid=98851"><i>Erythranthe parishii</i></a>
<br>&nbsp;&nbsp;<i>Mimulus parryi</i> changed to <a href="/eflora/eflora_display.php?tid=99068"><i>Diplacus parryi</i></a>
<br>&nbsp;&nbsp;<i>Mimulus pictus</i> changed to <a href="/eflora/eflora_display.php?tid=99069"><i>Diplacus pictus</i></a>
<br>&nbsp;&nbsp;<i>Mimulus pilosus</i> changed to <a href="/eflora/eflora_display.php?tid=33500"><i>Mimetanthe pilosa</i></a>
<br>&nbsp;&nbsp;<i>Mimulus primuloides</i> var. <i>linearifolius</i> changed to <a href="/eflora/eflora_display.php?tid=99146"><i>Erythranthe linearifolia</i></a>
<br>&nbsp;&nbsp;<i>Mimulus primuloides</i> var. <i>primuloides</i> changed to <a href="/eflora/eflora_display.php?tid=99147"><i>Erythranthe primuloides</i></a>
<br>&nbsp;&nbsp;<i>Mimulus pulchellus</i> changed to <a href="/eflora/eflora_display.php?tid=99070"><i>Diplacus pulchellus</i></a>
<br>&nbsp;&nbsp;<i>Mimulus pulsiferae</i> changed to <a href="/eflora/eflora_display.php?tid=99176"><i>Erythranthe pulsiferae</i></a>
<br>&nbsp;&nbsp;<i>Mimulus purpureus</i> changed to <a href="/eflora/eflora_display.php?tid=99177"><i>Erythranthe purpurea</i></a>
<br>&nbsp;&nbsp;<i>Mimulus pygmaeus</i> changed to <a href="/eflora/eflora_display.php?tid=99071"><i>Diplacus pygmaeus</i></a>
<br>&nbsp;&nbsp;<i>Mimulus rattanii</i> changed to <a href="/eflora/eflora_display.php?tid=99072"><i>Diplacus rattanii</i></a>
<br>&nbsp;&nbsp;<i>Mimulus rubellus</i> changed to <a href="/eflora/eflora_display.php?tid=99179"><i>Erythranthe rubella</i></a>
<br>&nbsp;&nbsp;<i>Mimulus rupicola</i> changed to <a href="/eflora/eflora_display.php?tid=99074"><i>Diplacus rupicola</i></a>
<br>&nbsp;&nbsp;<i>Mimulus shevockii</i> changed to <a href="/eflora/eflora_display.php?tid=99183"><i>Erythranthe shevockii</i></a>
<br>&nbsp;&nbsp;<i>Mimulus suksdorfii</i> changed to <a href="/eflora/eflora_display.php?tid=99186"><i>Erythranthe suksdorfii</i></a>
<br>&nbsp;&nbsp;<i>Mimulus tilingii</i> changed to <a href="/eflora/eflora_display.php?tid=99191"><i>Erythranthe tilingii</i></a>
<br>&nbsp;&nbsp;<i>Mimulus torreyi</i> changed to <a href="/eflora/eflora_display.php?tid=99077"><i>Diplacus torreyi</i></a>
<br>&nbsp;&nbsp;<i>Mimulus traskiae</i> changed to <a href="/eflora/eflora_display.php?tid=99078"><i>Diplacus traskiae</i></a>
<br>&nbsp;&nbsp;<i>Mimulus tricolor</i> changed to <a href="/eflora/eflora_display.php?tid=99079"><i>Diplacus tricolor</i></a>
<br>&nbsp;&nbsp;<i>Mimulus viscidus</i> var. <i>compactus</i> changed to <a href="/eflora/eflora_display.php?tid=99045"><i>Diplacus compactus</i></a>	
<br>&nbsp;&nbsp;<i>Mimulus viscidus</i> var. <i>viscidus</i> changed to <a href="/eflora/eflora_display.php?tid=99081"><i>Diplacus viscidus</i></a>	
<br>&nbsp;&nbsp;<i>Mimulus whitneyi</i> changed to <a href="/eflora/eflora_display.php?tid=103264"><i>Diplacus bicolor</i></a>
<br><br>	
</blockquote>
<!-- END revision block 6 -->

<!-- BEGIN revision block 7 -->
<hr>

<h2 align="center"><p class="bodyTextBlack">
<a name="rev7" id="rev7"></a>Revision 7
<br>
December 2019
</p></h2>

<blockquote class="bodyTextBlack"><p class=bodyText>
Revision 7 involves treatments that have changed taxonomically (e.g., taxa added or deleted) since Revision 6 of the <i>Jepson eFlora</i>. A summary of the changes incorporated in the <i>eFlora</i> is presented below.</p>
<br>
&nbsp;
<br>	
	
<b>Brief Summary of Changes in Revision 7</b>
<br>
<br>
<br><b>ANGIOSPERMS</b>

<br><b>ASTERACEAE:</b>
<br>&nbsp;&nbsp;<i>Acroptilon</i> transferred to <a href="/eflora/eflora_display.php?tid=103801"><i>Rhaponticum</i></a>.
<br>&nbsp;&nbsp;<i>Acroptilon repens</i> changed to <a href="/eflora/eflora_display.php?tid=103802"><i>Rhaponticum repens</i></a>, leaving no <i>Acroptilon</i> in California (or elsewhere).
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=4236"><i>Parthenium hysterophorus</i></a> added, as naturalized.
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=101237"><i>Volutaria tubuliflora</i></a> added, as naturalized, replacing <i>Volutaria canariensis</i>, misapplied.
<br>
<br><b>CACTACEAE:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=108600"><i>Opuntia &times;charlestonensis</i></a> added, as native.
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=89064"><i>Opuntia curvispina</i></a> added, as native.
<br>
<br><b>EBENACEAE:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=23042"><i>Diospyros virginiana</i></a> added, as naturalized.
<br>
<br><b>LINDERNIACEAE:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=11373"><i>Lindernia</i></a> transferred to <a href="/eflora/eflora_display.php?tid=108558">Linderniaceae</a> from <a href="/eflora/eflora_display.php?tid=220">Plantaginaceae</a>.
<br>
<br><b>NYCTAGINACEAE:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=81378"><i>Boerhavia coulteri</i> var. <i>coulteri</i></a> added, as native.
<br>
<br><b>POACEAE:</b>
<br>&nbsp;&nbsp;<i>Bromus madritensis</i> subsp. <i>madritensis</i> recognized at species rank as <a href="/eflora/eflora_display.php?tid=16263"><i>Bromus madritensis</i></a>.
<br>&nbsp;&nbsp;<i>Bromus madritensis</i> subsp. <i>rubens</i> recognized at species rank as <a href="/eflora/eflora_display.php?tid=16281"><i>Bromus rubens</i></a>.
<br>&nbsp;&nbsp;<i>Bromus carinatus</i> recognized at varietal rank as <a href="/eflora/eflora_display.php?tid=108589"><i>Bromus sitchensis</i> var. <i>carinatus</i></a>.
<br>&nbsp;&nbsp;<i>Bromus marginatus</i> recognized at varietal rank as <a href="/eflora/eflora_display.php?tid=108590"><i>Bromus sitchensis</i> var. <i>marginatus</i></a>.
<br>&nbsp;&nbsp;<i>Bromus maritimus</i> recognized at varietal rank as <a href="/eflora/eflora_display.php?tid=108591"><i>Bromus sitchensis</i> var. <i>maritimus</i></a>.
<br>&nbsp;&nbsp;<i>Bromus polyanthus</i> recognized at varietal rank as <a href="/eflora/eflora_display.php?tid=108592"><i>Bromus sitchensis</i> var. <i>polyanthus</i></a>.
<br>&nbsp;&nbsp;<i>Bromus sitchensis</i> recognized at varietal rank as <a href="/eflora/eflora_display.php?tid=108593"><i>Bromus sitchensis</i> var. <i>sitchensis</i></a>.
<br>
<br><b>THEMIDACEAE:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=95364"><i>Brodiaea matsonii</i></a> newly described, as native.
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=101701"><i>Brodiaea rosea</i> subsp. <i>rosea</i></a> recognized, as native.
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=100439"><i>Brodiaea rosea</i> subsp. <i>vallicola</i></a> newly described, as native.
<br>&nbsp;&nbsp;<i>Dichelostemma capitatum</i> changed to <a href="/eflora/eflora_display.php?tid=108599"><i>Dipterostemon capitatus</i></a>, as native.
<br>&nbsp;&nbsp;<i>Dichelostemma capitatum</i> subsp. <i>capitatum</i> changed to <a href="/eflora/eflora_display.php?tid=108595"><i>Dipterostemon capitatus</i> subsp. <i>capitatus</i></a>, as native.	
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=108596"><i>Dipterostemon capitatus</i> subsp. <i>lacuna-vernalis</i></a> recognized, as native. <br>&nbsp;&nbsp;&nbsp;&nbsp;[synonym <i>Dichelostemma capitatum</i> subsp. <i>lacuna-vernalis</i>, previously treated as a synonym of <i>Dichelostemma capitatum</i> subsp. <i>capitatum</i>].
<br>&nbsp;&nbsp;<i>Dichelostemma capitatum</i> subsp. <i>pauciflorum</i> changed to <a href="/eflora/eflora_display.php?tid=108597"><i>Dipterostemon capitatus</i> subsp. <i>pauciflorus</i></a>, as native.
	
<br><br>
</blockquote>
<!-- END revision block 7 -->

<!-- BEGIN revision block 8 -->
<hr>

<h2 align="center"><p class="bodyTextBlack">
<a name="rev8" id="rev8"></a>Revision 8
<br>
December 2020
</p></h2>

<blockquote class="bodyTextBlack"><p class="bodyTextBlack">
Revision 8 involves treatments that have changed taxonomically (e.g., taxa added or deleted) since Revision 7 of the <i>Jepson eFlora</i>. A summary of the changes incorporated in the <i>eFlora</i> is presented below.</p>
<br>
&nbsp;
<br>	
<b>Brief Summary of Changes in Revision 8</b>
<br>
<br>
<br><b>ANGIOSPERMS</b>
<br><b>AGAVACEAE:</b>
<br>&nbsp;&nbsp;<i>Chlorogalum</i>: Three taxa moved to new genus <a href="/eflora/eflora_display.php?tid=108964"><i>Hooveria</i></a>, the rest retained in <a href="/eflora/eflora_display.php?tid=9498"><i>Chlorogalum</i></a>
<br>&nbsp;&nbsp;<i>Chlorogalum parviflorum</i> changed to <a href="/eflora/eflora_display.php?tid=108965"><i>Hooveria parviflora</i></a>
<br>&nbsp;&nbsp;<i>Chlorogalum purpureum </i>changed to <a href="/eflora/eflora_display.php?tid=108966"><i>Hooveria purpurea</i></a>
<br>&nbsp;&nbsp;<i>Chlorogalum purpureum</i> var. <i>purpureum</i> changed to <a href="/eflora/eflora_display.php?tid=108968"><i>Hooveria purpurea</i> var. <i>purpurea</i></a>
<br>&nbsp;&nbsp;<i>Chlorogalum purpureum</i> var. <i>reductum</i> changed to <a href="/eflora/eflora_display.php?tid=108967"><i>Hooveria purpurea</i> var. <i>reducta</i></a>
<br>
<br><b>ASTERACEAE:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=2411"><i>Crepis pulchra</i></a> added, as naturalized
<br>&nbsp;&nbsp;<i>Eucephalus</i> transferred to <a href="/eflora/eflora_display.php?tid=68414"><i>Doellingeria</i></a>, leaving no species of <i>Eucephalus</i>
<br>&nbsp;&nbsp;<i>Eucephalus breweri</i> changed to <a href="/eflora/eflora_display.php?tid=108971"><i>Doellingeria breweri</i></a>
<br>&nbsp;&nbsp;<i>Eucephalus engelmannii</i> changed to <a href="/eflora/eflora_display.php?tid=108969"><i>Doellingeria engelmannii</i></a>
<br>&nbsp;&nbsp;<i>Eucephalus glabratus</i> changed to <a href="/eflora/eflora_display.php?tid=108970"><i>Doellingeria glabrata</i></a>
<br>&nbsp;&nbsp;<i>Eucephalus ledophyllus</i> var. <i>covillei</i> changed to <a href="/eflora/eflora_display.php?tid=108973"><i>Doellingeria ledophylla</i> var. <i>covillei</i></a>
<br>&nbsp;&nbsp;<i>Eucephalus tomentellus</i> changed to <a href="/eflora/eflora_display.php?tid=108975"><i>Doellingeria tomentella</i></a>
<br>&nbsp;&nbsp;<i>Eucephalus vialis</i> removed, not in California
<br>&nbsp;&nbsp;<i>Helianthus exilis</i> rejected, a synonym of <a href="/eflora/eflora_display.php?tid=3251"><i>Helianthus bolanderi</i></a>
<br>
<br><b>FABACEAE:</b>
<br>&nbsp;&nbsp;<i>Lupinus excubitus</i> var. <i>austromontanus</i> changed to <a href="/eflora/eflora_display.php?tid=101519"><i>Lupinus albifrons</i> var. <i>austromontanus</i></a>
<br>&nbsp;&nbsp;<i>Lupinus excubitus</i> var. <i>hallii</i> changed to <a href="/eflora/eflora_display.php?tid=79077"><i>Lupinus albifrons</i> var. <i>hallii</i></a>
<br>&nbsp;&nbsp;<i>Lupinus excubitus</i> var. <i>johnstonii</i> changed to <a href="/eflora/eflora_display.php?tid=101377"><i>Lupinus albifrons </i>var. <i>johnstonii</i></a>
<br>&nbsp;&nbsp;<i>Lupinus excubitus</i> var. <i>medius</i> changed to <a href="/eflora/eflora_display.php?tid=61193"><i>Lupinus albifrons</i> var. <i>medius</i></a>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=61356"><i>Lupinus lepidus</i> var. <i>aridus</i></a> added, as native
<br>&nbsp;&nbsp;<i>Lupinus variicolor</i> changed to <a href="/eflora/eflora_display.php?tid=80538"><i>Lupinus littoralis</i> var. <i>variicolor</i></a>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=61387"><i>Lupinus magnificus</i> var. <i>hesperius</i></a> added, as native
<br>&nbsp;&nbsp;<i>Lupinus holmgrenianus</i> changed to <a href="/eflora/eflora_display.php?tid=61431"><i>Lupinus polyphyllus</i> var. <i>humicola</i></a>
<br>&nbsp;&nbsp;<i>Lupinus latifolius</i> var. <i>barbatus</i> rejected, a synomym of <a href="/eflora/eflora_display.php?tid=76666"><i>Lupinus latifolius</i> var. <i>viridifolius</i></a>
<br>&nbsp;&nbsp;<i>Lupinus latifolius</i> var. <i>columbianus</i> moved to <a href="/eflora/eflora_display.php?tid=75772"><i>Lupinus latifolius</i> var. <i>latifolius</i></a>
<br>&nbsp;&nbsp;<i>Lupinus saxosus</i> changed to <a href="/eflora/eflora_display.php?tid=61430"><i>Lupinus polyphyllus</i> var. <i>saxosus</i></a>
<br>
<br><b>PLANTAGINACEAE:</b>
<br>&nbsp;&nbsp;<i>Antirrhinum multiflorum</i>, an illegitimate name, replaced by <a href="/eflora/eflora_display.php?tid=108978"><i>Antirrhinum thompsonii</i></a>
<br>&nbsp;&nbsp;<i>Mohavea</i> transferred to <a href="/eflora/eflora_display.php?tid=9184"><i>Antirrhinum</i></a>, leaving no species of <i>Mohavea</i>
<br>&nbsp;&nbsp;<i>Mohavea confertiflora</i> changed to <a href="/eflora/eflora_display.php?tid=102116"><i>Antirrhinum confertiflorum</i></a>
<br>&nbsp;&nbsp;<i>Mohavea breviflora</i> changed to <a href="/eflora/eflora_display.php?tid=108977"><i>Antirrhinum mohavea</i></a>
<br>
<br><b>RHAMNACEAE:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=103737"><i>Ceanothus foliosus</i> var. <i>viejasensis</i></a> newly described, added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=103540"><i>Ceanothus pendletonensis</i></a> newly described, added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=108979"><i>Ceanothus thyrsiflorus</i> var. <i>obispoensis</i></a> newly described, added, as native
<br>
<br>
</p></blockquote>
<!-- END revision block 8 -->


<!-- BEGIN revision block 9-->
<hr>

<h2 align="center"><p class="bodyTextBlack">
<a name="rev9" id="rev9"></a>Revision 9
<br>
December 2021
</p></h2>
<blockquote class="bodyTextBlack">
<p class="bodyTextBlack">
Revision 9 involves treatments that have changed taxonomically (e.g., taxa added or deleted) since Revision 8 of the <i>Jepson eFlora</i>. A summary of the changes incorporated in the <i>eFlora</i> is presented below.</p>
<br>
&nbsp;	
<b>Brief Summary of Changes in Revision 9</b>
<br>
<br><b>FERNS</b>
<br><b>THELYPTERIDACEAE:</b>
<br>&nbsp;&nbsp;<i>Thelypteris</i>: Californian taxa moved to <a href="/eflora/eflora_display.php?tid=79421"><i>Amauropelta</i></a> and <a href="/eflora/eflora_display.php?tid=84701"><i>Pelazoneuron</i></a>, leaving no taxa of <i>Thelypteris</i> in California
<br>&nbsp;&nbsp;<i>Thelypteris nevadensis</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=79421"><i>Amauropelta</i></a>, as <a href="/eflora/eflora_display.php?tid=84700"><i>Amauropelta nevadensis</i></a>
<br>&nbsp;&nbsp;<i>Thelypteris puberula</i> var. <i>sonorensis</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=84701"><i>Pelazoneuron</i></a>, as <a href="/eflora/eflora_display.php?tid=84703"><i>Pelazoneuron puberulum</i> var. <i>sonorensis</i></a>
<br>
<br><b>ANGIOSPERMS</b>
<br><b>BORAGINACEAE:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=10465"><i>Cryptantha</i></a>: 
	Some Californian taxa transferred to <a href="/eflora/eflora_display.php?tid=68467"><i>Eremocarya</i></a>, 
	<a href="/eflora/eflora_display.php?tid=68572"><i>Greeneocharis</i></a>, 
	<a href="/eflora/eflora_display.php?tid=99958"><i>Johnstonella</i></a>, 
	and <a href="/eflora/eflora_display.php?tid=68980"><i>Oreocarya</i></a>
<br>&nbsp;&nbsp;<i>Cryptantha angustifolia</i> 
	transferred to <a href="/eflora/eflora_display.php?tid=99958"><i>Johnstonella</i></a>, 
	as <a href="/eflora/eflora_display.php?tid=99829"><i>Johnstonella angustifolia</i></a>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=84709"><i>Cryptantha catalinensis</i></a> 
	newly described, added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=84710"><i>Cryptantha clementina</i></a> 
	newly described, added, as native
<br>&nbsp;&nbsp;<i>Cryptantha celosioides</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68980"><i>Oreocarya</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=84102"><i>Oreocarya glomerata</i></a>
<br>&nbsp;&nbsp;<i>Cryptantha cinerea</i> var. <i>abortiva</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68980"><i>Oreocarya</i></a> 
	 and treated at species rank, 
	 as <a href="/eflora/eflora_display.php?tid=35401"><i>Oreocarya abortiva</i></a>
<br>&nbsp;&nbsp;<i>Cryptantha circumscissa</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68572"><i>Greeneocharis</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=27310"><i>Greeneocharis circumscissa</i></a>
<br>&nbsp;&nbsp;<i>Cryptantha circumscissa</i> var. <i>circumscissa</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68572"><i>Greeneocharis</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=72447"><i>Greeneocharis circumscissa</i> var. <i>circumscissa</i></a>
<br>&nbsp;&nbsp;<i>Cryptantha circumscissa</i> var. <i>rosulata</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68572"><i>Greeneocharis</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=101725"><i>Greeneocharis circumscissa</i> var. <i>rosulata</i></a>
<br>&nbsp;&nbsp;<i>Cryptantha confertiflora</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68980"><i>Oreocarya</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=35404"><i>Oreocarya confertiflora</i></a>
<br>&nbsp;&nbsp;<i>Cryptantha costata</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=99958"><i>Johnstonella</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=99830"><i>Johnstonella costata</i></a>
<br>&nbsp;&nbsp;<i>Cryptantha crymophila</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68980"><i>Oreocarya</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=35405"><i>Oreocarya crymophila</i></a>
<br>&nbsp;&nbsp;<i>Cryptantha flavoculata</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68980"><i>Oreocarya</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=35408"><i>Oreocarya flavoculata</i></a>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=21210"><i>Cryptantha hispidissima</i></a> 
	recognized, added, as native
<br>&nbsp;&nbsp;<i>Cryptantha hoffmannii</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68980"><i>Oreocarya</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=35411"><i>Oreocarya hoffmannii</i></a>
<br>&nbsp;&nbsp;<i>Cryptantha holoptera</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=99958"><i>Johnstonella</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=99838"><i>Johnstonella holoptera</i></a>
<br>&nbsp;&nbsp;<i>Cryptantha humilis</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68980"><i>Oreocarya</i></a> 
	 and treated at subspecies rank, 
	 as <a href="/eflora/eflora_display.php?tid=70434"><i>Oreocarya humilis</i> subsp. <i>humilis</i></a>
<br>&nbsp;&nbsp;<i>Cryptantha inaequata</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=99958"><i>Johnstonella</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=101945"><i>Johnstonella inaequata</i></a>
<br>&nbsp;&nbsp;<i>Cryptantha intermedia</i> var. <i>hendersonii</i> treated at species rank, 
	as <a href="/eflora/eflora_display.php?tid=21250"><i>Cryptantha hendersonii</i></a>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=94663"><i>Cryptantha intermedia</i> var. <i>johnstonii</i></a> 
	recognized, added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=84664"><i>Cryptantha kinkiensis</i></a> 
	recently described, added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=57138"><i>Cryptantha maritima</i> var. <i>maritima</i></a> 
	recognized, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=57139"><i>Cryptantha maritima</i> var. <i>pilosa</i></a> 
	recognized, added, as native
<br>&nbsp;&nbsp;<i>Cryptantha micrantha</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68467"><i>Eremocarya</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=24552"><i>Eremocarya micrantha</i></a>
<br>&nbsp;&nbsp;<i>Cryptantha micrantha</i> var. <i>lepida</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68467"><i>Eremocarya</i></a> 
	 and treated at species rank, 
	 as <a href="/eflora/eflora_display.php?tid=99770"><i>Eremocarya lepida</i></a>
<br>&nbsp;&nbsp;<i>Cryptantha micrantha</i> var. <i>micrantha</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68467"><i>Eremocarya</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=72227"><i>Eremocarya micrantha</i> var. <i>micrantha</i></a>
<br>&nbsp;&nbsp;<i>Cryptantha nevadensis</i> var. <i>nevadensis</i> 
	treated at species rank, 
	as <a href="/eflora/eflora_display.php?tid=21272"><i>Cryptantha nevadensis</i></a>
<br>&nbsp;&nbsp;<i>Cryptantha nevadensis</i> var. <i>rigida</i> 
	treated at species rank, 
	as <a href="/eflora/eflora_display.php?tid=103476"><i>Cryptantha juniperensis</i></a>
<br>&nbsp;&nbsp;<i>Cryptantha nubigena</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68980"><i>Oreocarya</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=35416"><i>Oreocarya nubigena</i></a>
<br>&nbsp;&nbsp;<i>Cryptantha pterocarya</i> var. <i>cycloptera</i> 
	treated at species rank, 
	as <a href="/eflora/eflora_display.php?tid=101132"><i>Cryptantha cycloptera</i></a>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=57156"><i>Cryptantha pterocarya</i> var. <i>stenoloba</i></a> 
	recognized, added, as native
<br>&nbsp;&nbsp;<i>Cryptantha racemosa</i> 
	transferred to <a href="/eflora/eflora_display.php?tid=99958"><i>Johnstonella</i></a>, 
	as <a href="/eflora/eflora_display.php?tid=101946"><i>Johnstonella racemosa</i></a>
<br>&nbsp;&nbsp;<i>Cryptantha roosiorum</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68980"><i>Oreocarya</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=101727"><i>Oreocarya roosiorum</i></a>
<br>&nbsp;&nbsp;<i>Cryptantha schoolcraftii</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68980"><i>Oreocarya</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=101728"><i>Oreocarya schoolcraftii</i></a>
<br>&nbsp;&nbsp;<i>Cryptantha similis</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68572"><i>Greeneocharis</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=99295"><i>Greeneocharis similis</i></a>
<br>&nbsp;&nbsp;<i>Cryptantha sobolifera</i> added, 
	transferred to <a href="/eflora/eflora_display.php?tid=68980"><i>Oreocarya</i></a>, 
	as <a href="/eflora/eflora_display.php?tid=82802"><i>Oreocarya sobolifera</i></a>, as native
<br>&nbsp;&nbsp;<i>Cryptantha subretusa</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68980"><i>Oreocarya</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=35422"><i>Oreocarya subretusa</i></a>
<br>&nbsp;&nbsp;<i>Cryptantha tumulosa</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68980"><i>Oreocarya</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=35426"><i>Oreocarya tumulosa</i></a>
<br>&nbsp;&nbsp;<i>Cryptantha virginensis</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=68980"><i>Oreocarya</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=35427"><i>Oreocarya virginensis</i></a>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=95261"><i>Cryptantha wigginsii</i></a> 
	new to California, added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=10466"><i>Cynoglossum</i></a>: 
	Native Californian taxa</i> transferred to 
	<a href="/eflora/eflora_display.php?tid=103202"><i>Adelinia</i></a> 
	 and <a href="/eflora/eflora_display.php?tid=103733"><i>Andersonglossum</i></a>, 
	 leaving one naturalized taxon of <a href="/eflora/eflora_display.php?tid=10466"><i>Cynoglossum</i></a> in California
<br>&nbsp;&nbsp;<i>Cynoglossum grande</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=103202"><i>Adelinia</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=101954"><i>Adelinia grandis</i></a>
<br>&nbsp;&nbsp;<i>Cynoglossum occidentale</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=103733"><i>Andersonglossum</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=100787"><i>Andersonglossum occidentale</i></a>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99828"><i>Johnstonella angelica</i></a> 
	new to California, added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=8762"><i>Pectocarya</i></a>: 
	One species transferred to <a href="/eflora/eflora_display.php?tid=84715"><i>Gruvelia</i></a>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=76583"><i>Pectocarya anisocarpa</i></a> 
	newly described, added, as native
<br>&nbsp;&nbsp;<i>Pectocarya pusilla</i>
	 transferred to <a href="/eflora/eflora_display.php?tid=84715"><i>Gruvelia</i></a>, 
	 as <a href="/eflora/eflora_display.php?tid=105901"><i>Gruvelia pusilla</i></a>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=8764"><i>Plagiobothrys</i></a>: 
	One species transferred to each of three genera, 
	<a href="/eflora/eflora_display.php?tid=84705"><i>Amsinckiopsis</i></a>, 
	<a href="/eflora/eflora_display.php?tid=82940"><i>Simpsonanthus</i></a>, 
	and <a href="/eflora/eflora_display.php?tid=84716"><i>Sonnea</i></a>
<br>&nbsp;&nbsp;<i>Plagiobothrys hispidus</i> 
	transferred to <a href="/eflora/eflora_display.php?tid=84716"><i>Sonnea</i></a>, 
	as <a href="/eflora/eflora_display.php?tid=107795"><i>Sonnea hispida</i></a>
<br>&nbsp;&nbsp;<i>Plagiobothrys jonesii</i> 
	transferred to <a href="/eflora/eflora_display.php?tid=82940"><i>Simpsonanthus</i></a>, 
	as <a href="/eflora/eflora_display.php?tid=82941"><i>Simpsonanthus jonesii</i></a>
<br>&nbsp;&nbsp;<i>Plagiobothrys kingii</i> 
	transferred to <a href="/eflora/eflora_display.php?tid=84705"><i>Amsinckiopsis</i></a>, 
	as <a href="/eflora/eflora_display.php?tid=84706"><i>Amsinckiopsis kingii</i></a>
<br>&nbsp;&nbsp;<i>Plagiobothrys kingii</i> var. <i>harknessii</i>
	 transferred to 
	<a href="/eflora/eflora_display.php?tid=84705"><i>Amsinckiopsis</i></a>, 
	as <a href="/eflora/eflora_display.php?tid=84707">Amsinckiopsis kingii</i> var. <i>harknessii</i></a>
<br>&nbsp;&nbsp;<i>Plagiobothrys kingii</i> var. <i>kingii</i> 
	transferred to <a href="/eflora/eflora_display.php?tid=84705"><i>Amsinckiopsis</i></a>, 
	as <a href="/eflora/eflora_display.php?tid=84708"><i>Amsinckiopsis kingii</i> var. <i>kingii</i></a>
<br><b>EHRETIACEAE:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=8768"><i>Tiquilia</i></a> 
	transferred to <a href="/eflora/eflora_display.php?tid=84713">Ehretiaceae</a> 
	from <a href="/eflora/eflora_display.php?tid=69">Boraginaceae</a>
<br><b>HELIOTROPIACEAE:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=10473"><i>Heliotropium</i></a> 
	transferred to <a href="/eflora/eflora_display.php?tid=227">Heliotropiaceae</a> 
	from <a href="/eflora/eflora_display.php?tid=69">Boraginaceae</a>
<br><b>HYDROPHYLLACEAE:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=9645"><i>Draperia</i></a>,
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
<br>&nbsp;&nbsp;<i>Emmenanthe penduliflora</i> var. <i>penduliflora</i> treated at species rank, 
	as <a href="/eflora/eflora_display.php?tid=24223"><i>Emmenanthe penduliflora</i></a>
<br>&nbsp;&nbsp;<i>Emmenanthe penduliflora</i> var. <i>rosea</i> treated at species rank, 
	as <a href="/eflora/eflora_display.php?tid=24224"><i>Emmenanthe rosea</i></a>
<br>&nbsp;&nbsp;<i>Hesperochiron californicus</i> 
	changed to <a href="/eflora/eflora_display.php?tid=102667"><i>Hesperochiron nanus</i></a>, 
	with nomenclatural priority
<br><b>LENNOACEAE:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=10567"><i>Pholisma</i></a> 
	transferred to <a href="/eflora/eflora_display.php?tid=171">Lennoaceae</a>
<br><b>NAMACEAE:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=9648"><i>Eriodictyon</i></a>, 
	<a href="/eflora/eflora_display.php?tid=9653"><i>Nama</i></a>, 
	and <a href="/eflora/eflora_display.php?tid=10340"><i>Wigandia</i></a> 
	transferred to <a href="/eflora/eflora_display.php?tid=84714">Namaceae</a>
<br><b>POLEMONIACEAE:</b>
<br>&nbsp;&nbsp;<i>Leptosiphon acicularis</i> 
	changed to <a href="/eflora/eflora_display.php?tid=84733"><i>Leptosiphon aureus</i></a> Benth., 
	with nomenclatural priority
<br>&nbsp;&nbsp;<i>Leptosiphon aureus</i> (Nutt.) Benth. ex E. Vilm., 
	an illegitimate name (later homonym of <i>Leptosiphon aureus</i> Benth.), 
	changed to <a href="/eflora/eflora_display.php?tid=103483"><i>Leptosiphon chrysanthus</i></a>
<br>&nbsp;&nbsp;<i>Leptosiphon aureus</i> subsp. <i>aureus</i> 
	changed to <a href="/eflora/eflora_display.php?tid=101708"><i>Leptosiphon chrysanthus</i> subsp. <i>chrysanthus</i></a>
<br>&nbsp;&nbsp;<i>Leptosiphon aureus</i> subsp. <i>decorus</i> 
	changed to <a href="/eflora/eflora_display.php?tid=101707"><i>Leptosiphon chrysanthus</i> subsp. <i>decorus</i></a>
<br>&nbsp;&nbsp;<i>Linanthus bigelovii</i> 
	in California treated as newly described subspecies, 
	<a href="/eflora/eflora_display.php?tid=103462"><i>Linanthus bigelovii</i> subsp. <i>johnsonii</i></a>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=81158"><i>Linanthus californicus</i> subsp. <i>californicus</i></a>, 
	newly recognized, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=81157"><i>Linanthus californicus</i> subsp. <i>glandulosus</i></a>, 
	newly recognized, added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=81179"><i>Linanthus californicus</i> subsp. <i>tomentosus</i></a>, 
	newly recognized, added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=103271"><i>Linanthus dichotomus</i> subsp. <i>pattersonii</i></a>, 
	newly described, added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=101716"><i>Linanthus maculatus</i> subsp. <i>emaculatus</i></a>, 
	newly described, added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=101717"><i>Linanthus maculatus</i> subsp. <i>maculatus</i></a>, 
	newly recognized, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=81161"><i>Linanthus pungens</i> subsp. <i>hallii</i></a>, 
	newly recognized, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=98684"><i>Linanthus pungens</i> subsp. <i>pulchriflorus</i></a>, 
	newly recognized, as native 
<br>
<br>
</p></blockquote>
<!-- END revision block 9 -->

<!-- BEGIN revision block 10-->
<hr>

<h2 align="center"><p class="bodyTextBlack">
<a name="rev10" id="rev10"></a>Revision 10
<br>
April 2022
</p></h2>
<blockquote class="bodyTextBlack">
<p class="bodyTextBlack">
Revision 10 involves treatments that have changed taxonomically (e.g., taxa added or deleted) since Revision 9 of the <i>Jepson eFlora</i>. A summary of the changes incorporated in the <i>eFlora</i> is presented below.</p>
<br>
&nbsp;	
<b>Brief Summary of Changes in Revision 10</b>

<br><b>ANGIOSPERMS</b>
<br><b>ADOXACEAE:</b>
<br>&nbsp;&nbsp;Adoxaceae changed to <a href="/eflora/eflora_display.php?tid=76399">Viburnaceae</a> (conserved name)

<br><b>AGAVACEAE:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=89180"><i>Yucca jaegeriana</i></a> added, as native

<br><b>CACTACEAE:</b>
<br>&nbsp;&nbsp;<i>Cylindropuntia californica</i> var. <i>parkeri</i> changed to <a href="/eflora/eflora_display.php?tid=84765"><i>Cylindropuntia bernardina</i></a>

<br><b>CAMPANULACEAE:</b>
<br>&nbsp;&nbsp;<i>Downingia ornatissima</i> var. <i>eximia</i> changed to <a href="/eflora/eflora_display.php?tid=84766"><i>Downingia ornatissima</i> var. <i>mirabilis</i></a> (replacement name)

<br><b>CRASSULACEAE:</b>
<br>&nbsp;&nbsp;<i>Sedum laxum</i> subsp. <i>eastwoodiae</i> changed to <a href="/eflora/eflora_display.php?tid=76622">Sedum eastwoodiae</i></a>
<br>&nbsp;&nbsp;<i>Sedum laxum</i> subsp. <i>flavidum</i> changed to <a href="/eflora/eflora_display.php?tid=82981">Sedum flavidum</i></a>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=82854"><i>Sedum marmorense</i></a> added, as native
<br>&nbsp;&nbsp;<i>Sedum obtusatum</i> subsp. <i>boreale</i> changed to <a href="/eflora/eflora_display.php?tid=100467">Sedum kiersteadiae</i></a>
<br>&nbsp;&nbsp;<i>Sedum obtusatum</i> subsp. <i>paradisum</i> changed to <a href="/eflora/eflora_display.php?tid=76621">Sedum paradisum</i></a>
<br>&nbsp;&nbsp;<i>Sedum obtusatum</i> subsp. <i>retusum</i> changed to <a href="/eflora/eflora_display.php?tid=76624">Sedum sanhedrinum</i></a>
<br>&nbsp;&nbsp;<i>Sedum oreganum</i> removed, not in California
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=108792"><i>Sedum paradisum</i> subsp. <i>paradisum</i></a> recognized, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=108791"><i>Sedum paradisum</i> subsp. <i>subroseum</i></a> added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=84356"><i>Sedum patens</i></a>, added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=52942"><i>Sedum radiatum</i> subsp. <i>depauperatum</i></a> added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=52943"><i>Sedum radiatum</i> subsp. <i>radiatum</i></a> recognized, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=84357"><i>Sedum rubiginosum</i></a> added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=52950"><i>Sedum stenopetalum</i> subsp. <i>ciliosum</i></a> added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=52953"><i>Sedum stenopetalum</i> subsp. <i>stenopetalum</i></a> recognized, as native

<br><b>POLYGONACEAE:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=103862"><i>Chorizanthe aphanantha</i></a> added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=82842"><i>Chorizanthe eastwoodiae</i></a> added, as native
	
<br><b>ROSACEAE:</b>
<br>&nbsp;&nbsp;<i>Acaena pinnatifida</i> var. <i>californica</i> changed to <a href="/eflora/eflora_display.php?tid=11685"><i>Acaena californica</i></a>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=84767"><i>Holodiscus discolor</i> var. <i>cedrorum</i></a> added, as native

<br><b>VIBURNACEAE:</b>
<br>&nbsp;&nbsp;<i>Sambucus nigra</i> subsp. <i>caerulea</i> changed to <a href="/eflora/eflora_display.php?tid=43127"><i>Sambucus mexicana</i></a> (name with priority)


<br>
<br>
</p></blockquote>
<!-- END revision block 10 -->
<!-- BEGIN revision block 11-->
<hr>

<h2 align="center"><p class="bodyTextBlack">
<a name="rev11" id="rev11"></a>Revision 11
<br>
December 2022
</p></h2>
<blockquote class="bodyTextBlack">
<p class="bodyTextBlack">
Revision 11 involves treatments that have changed taxonomically (e.g., taxa added or deleted) since Revision 10 of the <i>Jepson eFlora</i>. A summary of the changes incorporated in the <i>eFlora</i> is presented below.</p>
<br>
&nbsp;	
<b>Brief Summary of Changes in Revision 11</b>

<br><b>ANGIOSPERMS</b>
<br><b>ASTERACEAE:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=84883"><i>Layia erubescens</i></a> added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_keys.php?key=545"><i>Pectis prostrata</i></a> added to key, as waif

<br><b>CARYOPHYLLACEAE:</b>
<br>&nbsp;&nbsp;<i>Minuartia californica</i> changed to <a href="/eflora/eflora_display.php?tid=99696"><i>Sabulina californica</i></a>
<br>&nbsp;&nbsp;<i>Minuartia cismontana</i> changed to <a href="/eflora/eflora_display.php?tid=99697"><i>Sabulina cismontana</i></a>
<br>&nbsp;&nbsp;<i>Minuartia decumbens</i> changed to <a href="/eflora/eflora_display.php?tid=99698"><i>Sabulina decumbens</i></a>
<br>&nbsp;&nbsp;<i>Minuartia douglasii</i> changed to <a href="/eflora/eflora_display.php?tid=99699"><i>Sabulina douglasii</i></a>
<br>&nbsp;&nbsp;<i>Minuartia howellii</i> changed to <a href="/eflora/eflora_display.php?tid=99700"><i>Sabulina howellii</i></a>
<br>&nbsp;&nbsp;<i>Minuartia nuttallii</i> changed to <a href="/eflora/eflora_display.php?tid=99704"><i>Sabulina nuttallii</i></a>
<br>&nbsp;&nbsp;<i>Minuartia nuttallii</i> var. <i>fragilis</i> changed to <a href="/eflora/eflora_display.php?tid=99701"><i>Sabulina nuttallii</i> var. <i>fragilis</i></a>
<br>&nbsp;&nbsp;<i>Minuartia nuttallii</i> var. <i>gracilis</i> changed to <a href="/eflora/eflora_display.php?tid=99702"><i>Sabulina nuttallii</i> var. <i>gracilis</i></a>
<br>&nbsp;&nbsp;<i>Minuartia nuttallii</i> var. <i>gregaria</i> changed to <a href="/eflora/eflora_display.php?tid=99703"><i>Sabulina nuttallii</i> var. <i>gregaria</i></a>
<br>&nbsp;&nbsp;<i>Minuartia obtusiloba</i> removed (misapplied, not in California), replaced by <a href="/eflora/eflora_display.php?tid=103774"><i>Cherleria biflora</i></a>
<br>&nbsp;&nbsp;<i>Minuartia pusilla</i> changed to <a href="/eflora/eflora_display.php?tid=99706"><i>Sabulina pusilla</i></a>
<br>&nbsp;&nbsp;<i>Minuartia rosei</i> changed to <a href="/eflora/eflora_display.php?tid=99707"><i>Sabulina rosei</i></a>
<br>&nbsp;&nbsp;<i>Minuartia rubella</i> changed to <a href="/eflora/eflora_display.php?tid=99708"><i>Sabulina rubella</i></a>
<br>&nbsp;&nbsp;<i>Minuartia stolonifera</i> changed to <a href="/eflora/eflora_display.php?tid=99709"><i>Sabulina stolonifera</i></a>
<br>&nbsp;&nbsp;<i>Minuartia stricta</i> changed to <a href="/eflora/eflora_display.php?tid=42531"><i>Sabulina stricta</i></a>, leaving no <i>Minuartia</i> in California
<br>&nbsp;&nbsp;<i>Pseudostellaria jamesiana</i> changed to <a href="/eflora/eflora_display.php?tid=85152"><i>Schizotechium jamesianum</i></a>
<br>&nbsp;&nbsp;<i>Pseudostellaria sierrae</i> changed to <a href="/eflora/eflora_display.php?tid=82773"><i>Hartmaniella sierrae</i></a>, leaving no <i>Pseudostellaria</i> in California
<br>&nbsp;&nbsp;<i>Silene armeria</i> changed to <a href="/eflora/eflora_display.php?tid=102156"><i>Atocion armeria</i></a>
<br>&nbsp;&nbsp;<i>Silene campanulata</i> (an illegitimate name) changed to <a href="/eflora/eflora_display.php?tid=85148"><i>Silene greenei</i></a>
<br>&nbsp;&nbsp;<i>Silene campanulata</i> subsp. <i>campanulata</i> changed to <a href="/eflora/eflora_display.php?tid=85149"><i>Silene greenei</i> subsp. <i>angustifolia</i></a>
<br>&nbsp;&nbsp;<i>Silene campanulata</i> subsp. <i>glandulosa</i> changed to <a href="/eflora/eflora_display.php?tid=85150"><i>Silene greenei</i> subsp. <i>greenei</i></a>
<br>&nbsp;&nbsp;<i>Silene coniflora</i> removed (misapplied, not in California), replaced by <a href="/eflora/eflora_display.php?tid=44540"><i>Silene multinervia</i></a>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=99774"><i>Silene krantzii</i></a> added, as native
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=82643"><i>Silene nelsonii</i></a> added, as native
<br>&nbsp;&nbsp;<i>Silene pendula</i> removed (not in California), a historical waif
<br>&nbsp;&nbsp;<i>Stellaria obtusa</i> changed to <a href="/eflora/eflora_display.php?tid=85185"><i>Engellaria obtusa</i></a>
<br>&nbsp;&nbsp;<i>Vaccaria hispanica</i> changed to <a href="/eflora/eflora_display.php?tid=82771"><i>Gypsophila vaccaria</i></a>, leaving no species of <i>Vaccaria</i>
<br>&nbsp;&nbsp;<i>Velezia rigida</i> changed to <a href="/eflora/eflora_display.php?tid=85151"><i>Dianthus nudiflorus</i></a>, leaving no <i>Velezia</i> in California

<br><b>CHENOPODIACEAE:</b>
<br>&nbsp;&nbsp;<i>Kochia americana</i> changed to <a href="/eflora/eflora_display.php?tid=91853"><i>Neokochia americana</i></a>
<br>&nbsp;&nbsp;<i>Kochia californica</i> changed to <a href="/eflora/eflora_display.php?tid=102842"><i>Neokochia californica</i></a>
<br>&nbsp;&nbsp;<i>Kochia scoparia</i> subsp. <i>scoparia</i> changed to <a href="/eflora/eflora_display.php?tid=80290"><i>Bassia scoparia</i></a>, leaving no <i>Kochia</i> in California

<br><b>FABACEAE:</b>
<br>&nbsp;&nbsp;<i>Acmispon heermannii</i> (a superfluous name) changed to <a href="/eflora/eflora_display.php?tid=82705"><i>Acmispon tomentosus</i></a>
<br>&nbsp;&nbsp;<i>Acmispon heermannii</i> var. <i>heermannii</i> changed to <a href="/eflora/eflora_display.php?tid=82704"><i>Acmispon tomentosus</i> var. <i>glabriusculus</i></a>
<br>&nbsp;&nbsp;<i>Acmispon heermannii</i> var. <i>orbicularis</i> changed to <a href="/eflora/eflora_display.php?tid=82706"><i>Acmispon tomentosus</i> var. <i>tomentosus</i></a>
<br>&nbsp;&nbsp;<i>Acmispon nevadensis</i> (a superfluous name) changed to <a href="/eflora/eflora_display.php?tid=82702"><i>Acmispon decumbens</i></a>
<br>&nbsp;&nbsp;<i>Acmispon nevadensis</i> var. <i>davidsonii</i> changed to <a href="/eflora/eflora_display.php?tid=82700"><i>Acmispon decumbens</i> var. <i>davidsonii</i></a>
<br>&nbsp;&nbsp;<i>Acmispon nevadensis</i> var. <i>nevadensis</i> changed to <a href="/eflora/eflora_display.php?tid=82701"><i>Acmispon decumbens</i> var. <i>decumbens</i></a>

<br><b>OROBANCHACEAE:</b>
<br>&nbsp;&nbsp;<a href="/eflora/eflora_display.php?tid=84892"><i>Aphyllon franciscanum</i></a> added, as native

<br><b>POLYGALACEAE:</b>
<br>&nbsp;&nbsp;<i>Polygala acanthoclada</i> changed to <a href="/eflora/eflora_display.php?tid=107534"><i>Rhinotropis acanthoclada</i></a>
<br>&nbsp;&nbsp;<i>Polygala californica</i> changed to <a href="/eflora/eflora_display.php?tid=107535"><i>Rhinotropis californica</i></a>
<br>&nbsp;&nbsp;<i>Polygala cornuta</i> changed to <a href="/eflora/eflora_display.php?tid=107536"><i>Rhinotropis cornuta</i></a>
<br>&nbsp;&nbsp;<i>Polygala cornuta</i> var. <i>cornuta</i> changed to <a href="/eflora/eflora_display.php?tid=84291"><i>Rhinotropis cornuta</i> var. <i>cornuta</i></a>
<br>&nbsp;&nbsp;<i>Polygala cornuta</i> var. <i>fishiae</i> changed to <a href="/eflora/eflora_display.php?tid=99817"><i>Rhinotropis cornuta</i> var. <i>fishiae</i></a>
<br>&nbsp;&nbsp;<i>Polygala heterorhyncha</i> changed to <a href="/eflora/eflora_display.php?tid=107537"><i>Rhinotropis heterorhyncha</i></a>
<br>&nbsp;&nbsp;<i>Polygala intermontana</i> changed to <a href="/eflora/eflora_display.php?tid=107538"><i>Rhinotropis intermontana</i></a>
<br>&nbsp;&nbsp;<i>Polygala subspinosa</i> changed to <a href="/eflora/eflora_display.php?tid=107539"><i>Rhinotropis subspinosa</i></a>, leaving no <i>Polygala</i> in California



<br>
<br>
</p></blockquote>
<!-- END revision block 11 -->

<!-- BEGIN revision block 12-->
<hr>

<h2 align="center"><p class="bodyTextBlack">
<a name="rev12" id="rev12"></a>Revision 12
<br>
December 2023
</p></h2>
<blockquote class="bodyTextBlack">
<p class="bodyTextBlack">
Revision 12 involves treatments that have changed taxonomically 
(e.g., taxa added or deleted) since Revision 11 of the Jepson eFlora. 
A summary of the changes (including strictly nomenclatural changes)
 incorporated in the eFlora is presented below.
<br>
&nbsp;	
<b>Brief Summary of Changes in Revision 12</b>

<br><b>ANGIOSPERMS</b>
<br><b>ALLIACEAE</b>

<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=53796">Allium geyeri</i> var. <i>tenerum</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=8613">Allium incomptum</a></i> added, as native


<br><b>APIACEAE</b>
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=93913">Eryngium montereyense</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=8623">Lomatium kogholiini</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=31455">Lomatium roseanum</a></i> added, as native


<br><b>ASTERACEAE</b>
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=7214">Encelia farinosa</i> var. <i>phenicodonta</a></i> added, as native 
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=83605">Erigeron conditii</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=8622">Erigeron incomptus</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=4183">Mycelis muralis</a></i> added, as naturalized
<br>&nbsp;&nbsp;<i>Perityle intricata</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=30213">Laphamia intricata</a></i>
<br>&nbsp;&nbsp;<i>Perityle inyoensis</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=30210">Laphamia inyoensis</a></i> 
<br>&nbsp;&nbsp;<i>Perityle megalocephala</i> var. <i>megalocephala</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=102736">Laphamia megalocephala</i> var. <i>megalocephala</a></i>
<br>&nbsp;&nbsp;<i>Perityle megalocephala</i> var. <i>oligophylla</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=8612">Laphamia megalocephala</i> var. <i>oligophylla</a></i>
<br>&nbsp;&nbsp;<i>Perityle villosa</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=30221">Laphamia villosa</a></i>
<br>&nbsp;&nbsp;Viguiera purisimae</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=98476">Aldama purisimae</a></i>, leaving no <i>Viguiera</i> in California
<br>&nbsp;&nbsp;Xanthium strumarium</i> (misapplied) changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=5618">Xanthium orientale</a></i>

<br><b>BRASSICACEAE</b>
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82882">Streptanthus anomalus</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=95352">Streptanthus glandulosus</i> subsp. <i>arkii</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=89788">Streptanthus glandulosus</i> subsp. <i>josephinensis</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=95354">Streptanthus glandulosus</i> subsp. <i>raichei</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=84809">Streptanthus juneae</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=84754">Streptanthus medeirosii</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=8624">Streptanthus polygaloides</i> subsp. <i>alternans</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=8625">Streptanthus polygaloides</i> subsp. <i>aureus</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=8626">Streptanthus polygaloides</i> subsp. <i>bicolor</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=8627">Streptanthus polygaloides</i> subsp. <i>liber</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=8628">Streptanthus polygaloides</i> subsp. <i>polygaloides</a></i> recognized, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=8629">Streptanthus polygaloides</i> subsp. <i>purpureus</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=8630">Streptanthus polygaloides</i> subsp. <i>undulatus</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=99437">Streptanthus tortuosus</i> var. <i>foliosus</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=66861">Streptanthus tortuosus</i> var. <i>oblongus</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=66858">Streptanthus tortuosus</i> var. <i>optatus</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=66859">Streptanthus tortuosus</i> var. <i>orbiculatus</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=66860">Streptanthus tortuosus</i> var. <i>pallidus</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=66863">Streptanthus tortuosus</i> var. <i>tortuosus</a></i> recognized, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=101680">Streptanthus tortuosus</i> subsp. <i>truei</a></i> added, as native

<br><b>CACTACEAE</b>
<br>&nbsp;&nbsp;<i>Coryphantha alversonii</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=25220">Escobaria alversonii</a></i>
<br>&nbsp;&nbsp;<i>Coryphantha chlorantha</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=8631">Escobaria chlorantha</a></i>
<br>&nbsp;&nbsp;<i>Coryphantha vivipara</i> var. rosea</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=58926">Escobaria vivipara</i> var. <i>rosea</a></i>


<br><b>CARYOPHYLLACEAE</b>
<br>&nbsp;&nbsp;<i>Polycarpon depressum</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=103582">Polycarpon tetraphyllum</i> subsp. <i>depressum</a></i>
<br>&nbsp;&nbsp;<i>Polycarpon tetraphyllum</i> var. tetraphyllum</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=80560">Polycarpon tetraphyllum</i> subsp. <i>tetraphyllum</a></i>
<br>&nbsp;&nbsp;<i>Schizotechium jamesianum</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=8633">Torreyostellaria jamesiana</a></i>, leaving no <i>Schizotechium</i> in California


<br><b>CHENOPODIACEAE</b>
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82625">Atriplex flavida</a></i> added, as native

<br><b>CLEOMACEAE</b>
<br>&nbsp;&nbsp;<i>Carsonia sparsifolia</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82749">Cleomella sparsifolia</a></i>, leaving no <i>Carsonia</i> in California
<br>&nbsp;&nbsp;<i>Peritoma arborea</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=101653">Cleomella arborea</a></i>
<br>&nbsp;&nbsp;<i>Peritoma arborea</i> var. <i>angustata</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=101652">Cleomella arborea</i> var. <i>angustata</a></i>
<br>&nbsp;&nbsp;<i>Peritoma arborea</i> var. <i>arborea</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108340">Cleomella arborea</i> var. <i>arborea</a></i>
<br>&nbsp;&nbsp;<i>Peritoma arborea</i> var. <i>globosa</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=101654">Cleomella arborea</i> var. <i>globosa</a></i>
<br>&nbsp;&nbsp;<i>Peritoma jonesii</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=8620">Cleomella jonesii</a></i>
<br>&nbsp;&nbsp;<i>Peritoma lutea</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82743">Cleomella lutea</a></i>
<br>&nbsp;&nbsp;<i>Peritoma platycarpa</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82746">Cleomella platycarpa</a></i>
<br>&nbsp;&nbsp;<i>Peritoma serrulata</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82748">Cleomella serrulata</a></i>, leaving no <i>Peritoma</i> in California
<br>&nbsp;&nbsp;<i>Oxystylis lutea</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82744">Cleomella oxystyloides</a></i>, leaving no <i>Oxystylis</i> in California
<br>&nbsp;&nbsp;<i>Wislizenia refracta</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82747">Cleomella refracta</a></i>
<br>&nbsp;&nbsp;<i>Wislizenia refracta</i> subsp. <i>californica</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82742">Cleomella californica</a></i>
<br>&nbsp;&nbsp;<i>Wislizenia refracta</i> subsp. <i>palmeri</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82745">Cleomella palmeri</a></i>
<br>&nbsp;&nbsp;<i>Wislizenia refracta</i> subsp. <i>refracta</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82747">Cleomella refracta</a></i>, leaving no <i>Wislizenia</i> in California

<br><b>CORNACEAE</b>
<br>&nbsp;&nbsp;<i>Cornus canadensis</i> (misapplied, not in California) changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=20413">Cornus unalaschkensis</a></i>


<br><b>ERICACEAE</b>
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=103234">Arctostaphylos patula</i> subsp. <i>gankinii</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=69997">Arctostaphylos patula</i> subsp. <i>patula</a></i> recognized, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=103260">Arctostaphylos purissima</i> subsp. <i>globosa</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=103259">Arctostaphylos purissima</i> subsp. <i>purissima</a></i> recognized, as native


<br><b>FABACEAE</b>
<br>&nbsp;&nbsp;<i>Albizia lophantha</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=36246">Paraserianthes lophantha</a></i>
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=14967">Astragalus nyensis</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=62831">Oxytropis oreophila var. <i>juniperina</a></i> added, as native
<br>&nbsp;&nbsp;<i>Prosopis glandulosa</i> var.<i> torreyana changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=8634">Neltuma odorata</a></i>
<br>&nbsp;&nbsp;<i>Prosopis pubescens</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=107913">Strombocarpa pubescens</a></i>
<br>&nbsp;&nbsp;<i>Prosopis strombulifera</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=107914">Strombocarpa strombulifera</a></i>
<br>&nbsp;&nbsp;<i>Prosopis velutina</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=34496">Neltuma velutina</a></i>, leaving no <i>Prosopis</i> in California
<br>&nbsp;&nbsp;<i>Trifolium gymnocarpon</i> subsp. <i>plummerae</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=47090">Trifolium gymnocarpon</a></i>
<br>&nbsp;&nbsp;<i>Trifolium kingii</i> subsp. <i>dedeckerae</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=47070">Trifolium dedeckerae</a></i>
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=100530">Trifolium piorkowskii</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=47175">Trifolium suffocatum</a></i> added, as naturalized
<br>&nbsp;&nbsp;<i>Trifolium variegatum</i> var. <i>geminiflorum</i> not recognized, subsumed into <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=47179">Trifolium variegatum</a></i>
<br>&nbsp;&nbsp;<i>Trifolium variegatum</i> var. <i>major</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=47180">Trifolium appendiculatum</a></i>
<br>&nbsp;&nbsp;<i>Trifolium variegatum</i> var. <i>variegatum</i> not recognized, subsumed into <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=47179">Trifolium variegatum</a></i>


<br><b>HYDROPHYLLACEAE</b>
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=8616">Phacelia damnationensis</a></i> added, as native


<br><b>JUNCACEAE</b>
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=100423">Luzula cascadensis</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=100427">Luzula macrantha</a></i> added, as native
<br>&nbsp;&nbsp;<i>Luzula parviflora</i> subsp. <i>fastigiata</i> not recognized, subsumed into <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=32163">Luzula parviflora</a></i>
<br>&nbsp;&nbsp;<i>Luzula parviflora</i> subsp. <i>parviflora</i> not recognized, subsumed into <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=32163">Luzula parviflora</a></i>
<br>&nbsp;&nbsp;<i>Luzula spicata</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=70347">Luzula spicata</i> subsp. <i>spicata</a></i>


<br><b>LOASACEAE</b>
<br>&nbsp;&nbsp;<i>Mentzelia laevicaulis</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=61864">Mentzelia laevicaulis</i> var. <i>laevicaulis</a></i>
<br>&nbsp;&nbsp;<i>Mentzelia longiloba</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=98666">Mentzelia longiloba</i> var. <i>longiloba</a></i>
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=98888">Mentzelia monoensis</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=93888">Mentzelia pectinata</i> var. <i>chrysopetala</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=93887">Mentzelia pectinata</i> var. <i>pectinata</a></i> recognized, as native


<br><b>MALVACAEAE</b>
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=32518">Malacothamnus arcuatus</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108344">Malacothamnus arcuatus</i> var. <i>arcuatus</a></i> recognized, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108342">Malacothamnus astrotentaculatus</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=72825">Malacothamnus densiflorus</i> var. <i>densiflorus</a></i> recognized, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=61705">Malacothamnus densiflorus</i> var. <i>viscidus</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108348">Malacothamnus discombobulatus</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108347">Malacothamnus eastwoodiae</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=83990">Malacothamnus enigmaticus</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=61707">Malacothamnus fasciculatus</i> var. <i>laxiflorus</a></i> added, as native
<br>&nbsp;&nbsp;<i>Malacothamnus fasciculatus</i> var. <i>nuttallii</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82437">Malacothamnus nuttallii</a></i>
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=32522">Malacothamnus foliosus</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108343">Malacothamnus fremontii</i> var. <i>exfibulosus</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108341">Malacothamnus fremontii</i> var. <i>fremontii</a></i> recognized, as native
<br>&nbsp;&nbsp;<i>Malacothamnus hallii</i> changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108345">Malacothamnus arcuatus</i> var. <i>elmeri</a></i>
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108350">Malacothamnus jonesii</i> var. <i>gracilis</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108349">Malacothamnus jonesii</i> var. <i>jonesii</a></i> recognized, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108346">Malacothamnus jonesii</i> var. <i>niveus</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=84610">Malacothamnus lucianus</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=32520">Malacothamnus mendocinensis</a></i> added, as native
<br>&nbsp;&nbsp;<i>Malacothamnus palmeri</i> var. <i>involucratus </i>changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=84609">Malacothamnus involucratus</a></i>
<br>&nbsp;&nbsp;<i>Malacothamnus palmeri</i> var. <i>palmeri</i> not recognized, subsumed into <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=32531">Malacothamnus palmeri</a></i>

<br><b>ORCHIDACEAE</b>
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=8621">Spiranthes perexilis</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=8680">Spiranthes &times;sierrae</a></i> added, as native (spontaneous hybrid)
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=8679">Spiranthes &times;stellata</a></i> added, as native (spontaneous hybrid)


<br><b>OROBANCHACEAE</b>
<br>&nbsp;&nbsp;<i>Parentucellia viscosa</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=103729">Bellardia viscosa</a></i>
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=101305">Pedicularis aurantiaca</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=101305">Pedicularis rigginsiae</a></i> added, as native

<br><b>OXALIDACEAE</b>
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=8615">Oxalis smalliana</a></i> added, as native


<br><b>PAPAVERACEAE</b>
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=99652">Eschscholzia androuxii</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=25207">Eschscholzia mexicana</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=50498">Eschscholzia minutiflora</i> subsp. <i>covillei</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=50499">Eschscholzia minutiflora</i> subsp. <i>minutiflora</a></i> recognized, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=50500">Eschscholzia minutiflora</i> subsp. <i>twisselmannii</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=99712">Eschscholzia papastillii</a></i> added, as native


<br><b>PINACEAE</b>
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=95349">Abies magnifica</i> var. <i>critchfieldii</a></i> added, as native


<br><b>POACEAE</b>
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=34079">Muhlenbergia emersleyi</a></i> added, as native


<br><b>POLEMONIACEAE</b>
<br>&nbsp;&nbsp;<i>Eriastrum brandegeeae</i> not recognized, subsumed into <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=24598">Eriastrum tracyi</a></i>
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=103302">Eriastrum calocyanum</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=103303">Eriastrum densifolium</i> subsp. <i>patens</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=103304">Eriastrum diffusum</i> subsp. <i>coachellae</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=70154">Eriastrum diffusum</i> subsp. <i>diffusum</a></i> recognized, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=103307">Eriastrum pluriflorum</i> subsp. <i>albifaux<a> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=50341">Eriastrum sapphirinum</i> subsp. <i>ambiguum</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=26905">Gilia mexicana</a></i> added, as native
<br>&nbsp;&nbsp;<i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=8614">Gilia tenuiflora</i> subsp. <i>docmilleri</a></i> added, as native


<br><b>Nomenclatural Changes</b>
<br>&nbsp;&nbsp;<i>Epilobium foliosum</i>, an illegitimate name (later homonym of <i>Epilobium foliosum</i> Heyn.), changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=85244">Epilobium ravenii</a></i>
<br>&nbsp;&nbsp;<i>Lupinus milo-bakeri</i>, with incorrect hyphenation, changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=85144">Lupinus milobakeri</a></i>
<br>&nbsp;&nbsp;<i>Lupinus padre-crowleyi</i>, with incorrect hyphenation, changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=109654">Lupinus padrecrowleyi</a></i>
<br>&nbsp;&nbsp;<i>Oenothera californica</i>, an illegitimate name (later homonym of <i>Oenothera californica</i> D. Dietr.), changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=34980">Oenothera avita</a></i>
<br>&nbsp;&nbsp;<i>Oenothera californica</i> subsp. <i>avita</i>, an illegitimate name, changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=70421">Oenothera avita</i> subsp. avita</a></i> 
<br>&nbsp;&nbsp;<i>Oenothera californica</i> subsp. <i>californica</i>, an illegitimate name, changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=85245">Oenothera avita</i> subsp. <i>californica</a></i>
<br>&nbsp;&nbsp;<i>Oenothera californica</i> subsp. <i>eurekensis</i>, an illegitimate name, changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=51708">Oenothera avita</i> subsp. <i>eurekensis</a></i>
<br>&nbsp;&nbsp;<i>Schinus polygamus</i>, with incorrect Latin termination, changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=107627">Schinus polygama</a></i>
<br>&nbsp;&nbsp;<i>Schinus terebinthifolius</i>, with incorrect Latin termination, changed to <i><a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=85243">Schinus terebinthifolia</a></i>



<br>
<br>
</p></blockquote>
<!-- END revision block 12 -->

<!-- BEGIN revision block 13-->
<hr>

<h2 align="center"><p class="bodyTextBlack">
<a name="rev13" id="rev13"></a>Revision 13
<br>
February 2025
</p></h2>
<blockquote class="bodyTextBlack">
<p class="bodyTextBlack">
Revision 13 involves treatments that have changed taxonomically (e.g., taxa added or deleted) or strictly nomenclaturally since Revision 12 of the Jepson eFlora. A summary of the changes incorporated in the eFlora is presented below.
<br>
&nbsp;	
<b>Brief Summary of Changes in Revision 13</b>


<br><b>ASTERACEAE</b>
<br>&nbsp;&nbsp;<i>Enceliopsis nudicaulis</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=7225"><i>Enceliopsis nudicaulis</i> var. <i>nudicaulis</i></a>
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=61646"><i>Lygodesmia grandiflora</i> var. dianthopsis</i></a> added, as native
<br>&nbsp;&nbsp;<i>Senecio jacobaea</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82779"><i>Jacobaea vulgaris</i> subsp. <i>vulgaris</i></a>
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=84360"><i>Senecio angustifolius</i></a> added, as naturalized

<br><b>CAMPANULACEAE</b>
<br>&nbsp;&nbsp;<i>Campanula angustiflora</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=84838"><i>Ravenella angustiflora</i></a>
<br>&nbsp;&nbsp;<i>Campanula californica</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=84953"><i>Eastwoodiella californica</i></a>
<br>&nbsp;&nbsp;<i>Campanula exigua</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=84837"><i>Ravenella exigua</i></a>
<br>&nbsp;&nbsp;<i>Campanula griffinii</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=84836"><i>Ravenella griffinii</i></a>
<br>&nbsp;&nbsp;<i>Campanula sharsmithiae</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108392"><i>Ravenella sharsmithiae</i></a>
<br>&nbsp;&nbsp;<i>Campanula prenanthoides</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=84760"><i>Smithiastrum prenanthoides</i></a>
<br>&nbsp;&nbsp;<i>Campanula wilkinsiana</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=84762"><i>Smithiastrum wilkinsianum</i></a>

<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108388"><i>Nemacladus bellus</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=84860"><i>Nemacladus eastwoodiae</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=84859"><i>Nemacladus inyoensis</i></a> added, as native

<br>&nbsp;&nbsp;<i>Nemacladus longiflorus</i> var. <i>breviflorus</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108389"><i>Nemacladus breviflorus</i></a>
<br>&nbsp;&nbsp;<i>Nemacladus longiflorus</i> var. <i>longiflorus</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=34507"><i>Nemacladus longiflorus</i></a>

<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=84858"><i>Nemacladus matsonii</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108390"><i>Nemacladus morefieldii</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=84857"><i>Nemacladus parikhiae</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=84856"><i>Nemacladus richardsiae</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=84855"><i>Nemacladus twisselmannii</i> var. <i>botanywomaniae</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108391"><i>Nemacladus twisselmannii</i> var. <i>twisselmannii</i></a> recognized, as native 
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=48484"><i>Wahlenbergia marginata</i></a> added, as naturalized

<br><b>CRASSULACEAE</b>
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108393"><i>Dudleya chasmophyta</i></a> added, as native

<br><b>GERANIACEAE</b>
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108400"><i>Geranium incanum</i> subsp. <i>incanum</i></a> added, as naturalized
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=89275"><i>Geranium yeoi</i></a> added, as naturalized

<br><b>LENTIBULARIACEAE</b>
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=98827"><i>Utricularia bisquamata</i></a> added, as naturalized

<br><b>LYTHRACEAE</b>
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=103525"><i>Lythrum junceum</i></a> added, as naturalized

<br><b>MALVACEAE</b>
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=11576"><i>Abutilon abutiloides</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=11586"><i>Abutilon grandifolium</i></a> added, as naturalized
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=11592"><i>Abutilon incanum</i></a> added, as native
<br>&nbsp;&nbsp;<i>Iliamna rivularis</i> removed, not in California
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=98687"><i>Malva assurgentiflora</i> subsp. assurgentiflora</i></a> newly recognized, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=98688"><i>Malva assurgentiflora</i> subsp. glabra</i></a> added, as native

<br><b>MELANTHIACEAE</b>
<br>&nbsp;&nbsp;<i>Trillium ovatum subsp. oettingeri changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108399"><i>Trillium oettingeri</i></a>
<br>&nbsp;&nbsp;<i>Trillium ovatum subsp. ovatum changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=47239"><i>Trillium ovatum</i></a>

<br><b>MOLLUGINACEAE</b>
<br>&nbsp;&nbsp;<i>Mollugo cerviana</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=84885"><i>Hypertelis umbellata</i></a>

<br><b>MONTIACEAE</b>
<br>&nbsp;&nbsp;<i>Cistanthe ambigua</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82680"><i>Thingia ambigua</i></a>
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108394"><i>Claytonia crawfordii</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=99211"><i>Claytonia obovata</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=103475"><i>Claytonia panamintensis</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=103301"><i>Claytonia peirsonii</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=84985"><i>Claytonia peirsonii</i> subsp. <i>bernardinus</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=103273"><i>Claytonia peirsonii</i> subsp. <i>californacis</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=103274"><i>Claytonia peirsonii</i> subsp. <i>peirsonii</i></a> recognized, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=103278"><i>Claytonia peirsonii</i> subsp. <i>yorkii</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=103537"><i>Claytonia serpenticola</i></a> added, as native

<br><b>NAMACEAE</b>
<br>&nbsp;&nbsp;<i>Eriodictyon traskiae</i> subsp. <i>smithii</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=101942">Eriodictyon traskiae</i> var. <i>smithii</i></a>
<br>&nbsp;&nbsp;<i>Eriodictyon traskiae</i> subsp.<i> traskiae</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=101943">Eriodictyon traskiae</i> var. <i>traskiae</i></a>

<br><b>ONAGRACEAE</b>
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108401"><i>Eremothera nevadensis</i></a> added, as native

<br><b>OPHIOGLOSSACEAE</b>
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=15919"><i>Botrychium hesperium</i></a> added, as native
<br>&nbsp;&nbsp;<i>Botrychium lineare</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108406"><i>Botrychium campestre </i>var. <i>lineare</i></a>
<br>&nbsp;&nbsp;<i>Botrychium lunaria</i> removed, not in California
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108408"><i>Botrychium neolunaria</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=15940"><i>Botrychium pedunculosum </i></a>added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108409"><i>Botrychium rubellum</i></a> added, as native
<br>&nbsp;&nbsp;<i>Botrychium simplex</i> var. <i>compositum </i>changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=15946"><i>Botrychium simplex</i></a>
<br>&nbsp;&nbsp;<i>Botrychium simplex</i> var. <i>simplex</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=15946"><i>Botrychium simplex</i></a>

<br><b>POACEAE</b>
<br>&nbsp;&nbsp;<i>Crypsis alopecuroides</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82871"><i>Sporobolus alopecuroides</i></a>
<br>&nbsp;&nbsp;<i>Crypsis schoenoides</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82879"><i>Sporobolus schoenoides</i></a>
<br>&nbsp;&nbsp;<i>Crypsis vaginiflora</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82876"><i>Sporobolus niliacus</i></a>, leaving no <i>Crypsis</i> in California
<br>&nbsp;&nbsp;<i>Dissanthelium californicum</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=98407"><i>Poa thomasii</i></a>, leaving no <i>Dissanthelium</i> in California
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=89094"><i>Poa bulbosa</i> var. <i>bulbosa</i></a> recognized, as waif
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=89093"><i>Poa bulbosa</i> var. <i>vivipara</i></a> added, as naturalized
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=84232"><i>Poa iconia</i> var. <i>iconia</i></a> added, as naturalized
<br>&nbsp;&nbsp;<i>Poa leptocoma</i> subsp. <i>leptocoma</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=38844"><i>Poa leptocoma</i></a>
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108410"><i>Poa secunda</i> var. <i>ampla</i></a>, added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108412"><i>Poa secunda</i> var. <i>gracillima</i></a>, added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82642"><i>Poa secunda</i> var. <i>juncifolia</i></a>, added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108411"><i>Poa secunda</i> var. <i>nevadensis</i></a>, added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108413"><i>Poa secunda</i> var. <i>scabrella</i></a>, added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=75969"><i>Poa secunda</i> var. <i>secunda</i></a>, recognized, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108414"><i>Poa trivialis</i> subsp. <i>sylvicola</i></a>, added, as waif
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=99448"><i>Poa trivialis</i> subsp. <i>trivialis</i></a> recognized, as naturalized
<br>&nbsp;&nbsp;<i>Scribneria bolanderi</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108404"><i>Deschampsia bolanderi</i></a>, leaving no <i>Scribneria</i> in California
<br>&nbsp;&nbsp;<i>Spartina alterniflora</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82872"><i>Sporobolus alterniflorus</i></a>
<br>&nbsp;&nbsp;<i>Spartina densiflora</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108405"><i>Sporobolus densiflorus</i></a>
<br>&nbsp;&nbsp;<i>Spartina foliosa</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82873"><i>Sporobolus foliosus</i></a>
<br>&nbsp;&nbsp;<i>Spartina gracilis</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82874"><i>Sporobolus hookerianus</i></a>
<br>&nbsp;&nbsp;<i>Spartina patens</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82878"><i>Sporobolus pumilus</i></a>, leaving no <i>Spartina</i> in California
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=81363"><i>Sporobolus creber</i></a> added, as naturalized
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=81834"><i>Tribolium obliterum</i></a> added, as naturalized

<br><b>RUSCACEAE</b>
<br>&nbsp;&nbsp;<i>Maianthemum racemosum</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=51514"><i>Maianthemum racemosum</i> subsp. <i>amplexicaule</i></a>

<br><b>SOLANACEAE</b>
<br>&nbsp;&nbsp;<i>Chamaesaracha coronopus</i> (misapplied) changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108395"><i>Chamaesaracha arida</i></a>
<br>&nbsp;&nbsp;<i>Chamaesaracha nana</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=30803"><i>Leucophysalis nana</i></a>
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=18893"><i>Chamaesaracha sordida</i></a> added, as naturalized
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=22382"><i>Datura quercifolia</i></a> added, as waif
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=28719"><i>Hyoscyamus niger </i></a>added, as waif 
<br>&nbsp;&nbsp;<i>Lycium brevipes</i> var. <i>brevipes</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=32220"><i>Lycium brevipes</i></a>
<br>&nbsp;&nbsp;<i>Lycium brevipes</i> var. <i>hassei</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=32220"><i>Lycium brevipes</i></a>
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=32209"><i>Lycium chinense</i></a> added, as waif
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=32211"><i>Lycium exsertum</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=86339"><i>Lycium ferocissimum</i></a> added, as naturalized 
<br>&nbsp;&nbsp;<i>Lycium verrucosum</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=32220"><i>Lycium brevipes</i></a>
<br>&nbsp;&nbsp;<i>Lycopersicon esculentum</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=44817"><i>Solanum lycopersicon</i></a>
<br>&nbsp;&nbsp;<i>Lycopersicon peruvianum</i> (changed to <i>Solanum peruvianum</i>) removed, an historic waif, leaving no <i>Lycopersicon</i> in California
<br>&nbsp;&nbsp;<i>Petunia parviflora</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=16635"><i>Calibrachoa parviflora</i></a>, leaving no <i>Petunia</i> in California
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=38055"><i>Physalis greenei</i></a> added, as native
<br>&nbsp;&nbsp;<i>Physalis hederifolia</i> var. <i>fendleri</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=38057"><i>Physalis hederifolia</i></a>
<br>&nbsp;&nbsp;<i>Physalis hederifolia</i> var. <i>palmeri</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=38057"><i>Physalis hederifolia</i></a>
<br>&nbsp;&nbsp;<i>Physalis lanceifolia</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=38043"><i>Physalis angulata</i></a>
<br>&nbsp;&nbsp;<i>Physalis lobata</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=40783"><i>Quincula lobata</i></a> 
<br>&nbsp;&nbsp;<i>Physalis longifolia</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=38055"><i>Physalis longifolia</i> var. <i>longifolia</i></a>
<br>&nbsp;&nbsp;<i>Physalis pubescens</i> var. <i>grisea</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=38084"><i>Physalis pubescens</i></a>
<br>&nbsp;&nbsp;<i>Physalis pubescens</i> var. <i>integrifolia</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=38084"><i>Physalis pubescens</i></a>
<br>&nbsp;&nbsp;<i>Solanum aviculare</i> (misapplied) changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=44826"><i>Solanum laciniatum</i></a>
<br>&nbsp;&nbsp;<i>Solanum carolinense</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=66500"><i>Solanum carolinense</i> var. <i>carolinense</i></a>
<br>&nbsp;&nbsp;<i>Solanum dimidiatum</i> treated, removed, as unabridged urban weed (putatively extirpated)
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=44876"><i>Solanum marginiatum</i></a> added, as naturalized 
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=44877"><i>Solanum mauritianum</i></a> added, as waif 
<br>&nbsp;&nbsp;<i>Solanum parishii</i> (misapplied) changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108397"><i>Solanum umbelliferum</i> var. <i>spencerae </i></a>
<br>&nbsp;&nbsp;<i>Solanum physalifolium</i> var. <i>nitidibaccatum</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=103838"><i>Solanum nitidibaccatum</i></a>
<br>&nbsp;&nbsp;<i>Solanum sisymbriifolium</i> removed, a historic waif
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=84759"><i>Solanum umbelliferum</i> var. <i>clokeyi</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=66522"><i>Solanum umbelliferum</i> var. <i>glabrescens</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108396"><i>Solanum umbelliferum</i> var. <i>hoffmannii</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=66523"><i>Solanum umbelliferum</i> var. <i>incanum</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=84382"><i>Solanum umbelliferum</i> var. <i>obispoense</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108398"><i>Solanum umbelliferum</i> var. <i>tenuilobatum</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=66524"><i>Solanum umbelliferum</i> var. <i>umbelliferum</i></a> recognized, as native
<br>&nbsp;&nbsp;<i>Solanum wallacei</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=84758">Solanum umbelliferum</i> var. <i>wallacei</i></a>
<br>&nbsp;&nbsp;<i>Solanum xanti</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=84383">Solanum umbelliferum </i>var. <i>xanti</i></a>

<br><b>URTICACEAE</b>
<br>&nbsp;&nbsp;<i>Urtica dioica</i> subsp. <i>gracilis</i>  changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=70675"><i>Urtica gracilis</i> subsp. <i>gracilis</i></a>
<br>&nbsp;&nbsp;<i>Urtica dioica</i> subsp. <i>holosericea</i>  changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=53304"><i>Urtica gracilis</i> subsp. <i>holosericea</i></a>

<br><b>Nomenclatural Changes</b>
<br>&nbsp;&nbsp;<i>Astragalus trichopodus</i> var. <i>phoxus </i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82724"><i>Astragalus trichopodus</i> var. <i>antisellii</i> </a>(name with priority)
<br>&nbsp;&nbsp;<i>Dudleya caespitosa</i>, with incorrect spelling, <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=103226"><i>Dudleya cespitosa</i> </a>

<br>&nbsp;&nbsp;<i>Psorothamnus arborescens</i> var. <i>simplicifolius </i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=108403"><i>Psorothamnus arborescens</i> var. <i>californicus</i> </a>(name with priority)
<!-- END revision block 13 -->

<!-- End body section-->


<br>
<br>
</p></blockquote>
<!-- END revision block 13 -->

<!-- BEGIN revision block 14-->
<hr>

<h2 align="center"><p class="bodyTextBlack">
<a name="rev14" id="rev14"></a>Revision 14
<br>
March 2026
</p></h2>
<blockquote class="bodyTextBlack">
<p class="bodyTextBlack">
Revision 14 involves treatments that have changed taxonomically (e.g., taxa added or deleted) or strictly nomenclaturally since Revision 13 of the <i>Jepson eFlora</i>. A summary of the changes incorporated in the <i>eFlora</i> is presented below
<br>
&nbsp;	
<b>Brief Summary of Changes in Revision 14</b>

<br>
<br><b>ASTERACEAE</b>
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=76299"><i>Xylorhiza panamintensis</i></a> added, as native
<br>
<br><b>CACTACEAE</b>
<br>&nbsp;&nbsp;<i>Echinocactus polycephalus</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=76305"><i>Homalocephala polycephala</i></a>, leaving no <i>Echinocactus</i> in California
<br>
<br><b>CHENOPODIACEAE</b>
<br>&nbsp;&nbsp;<i>Chenopodiaceae</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=46">Amaranthaceae</a>
<br>&nbsp;&nbsp;<i>Atriplex cordulata</i> var. <i>cordulata</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=15199"><i>Atriplex cordulata</i></a>
<br>&nbsp;&nbsp;<i>Atriplex cordulata</i> var. <i>erecticaulis</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=77582"><i>Atriplex erecticaulis</i></a>
<br>&nbsp;&nbsp;<i>Atriplex coronata</i> var. <i>vallicola</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=15284"><i>Atriplex vallicola</i></a>
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=76300"><i>Atriplex gypsophila</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=93873"><i>Chenopodium aureum</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=84973"><i>Chenopodium brandegeeae</i></a> added, as native
<br>&nbsp;&nbsp;<i>Chenopodium californicum</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=100040"><i>Blitum californicum</i></a>
<br>&nbsp;&nbsp;<i>Chenopodium capitatum</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=15762"><i>Blitum capitatum</i></a>
<br>&nbsp;&nbsp;<i>Chenopodium capitatum</i> var. <i>capitatum</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=15762"><i>Blitum capitatum</i></a>
<br>&nbsp;&nbsp;<i>Chenopodium capitatum</i> var. <i>parvicapitatum</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=76302"><i>Blitum hastatum</i></a>
<br>&nbsp;&nbsp;<i>Chenopodium chenopodioides</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=107007"><i>Oxybasis chenopodioides</i></a>
<br>&nbsp;&nbsp;<i>Chenopodium desiccatum</i> removed, not in California
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=93874"><i>Chenopodium eastwoodiae</i></a> added, as native
<br>&nbsp;&nbsp;<i>Chenopodium foliosum</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=15763"><i>Blitum virgatum</i></a>
<br>&nbsp;&nbsp;<i>Chenopodium glaucum</i> var. <i>salinum</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82811"><i>Oxybasis salina</i></a>
<br>&nbsp;&nbsp;<i>Chenopodium hians</i> removed, not in California
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=93875"><i>Chenopodium howellii</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=76927"><i>Chenopodium incognitum</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=93876"><i>Chenopodium lineatum</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=93877"><i>Chenopodium luteum</i></a> added, as native
<br>&nbsp;&nbsp;<i>Chenopodium macrospermum</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82806"><i>Oxybasis macrosperma</i></a>
<br>&nbsp;&nbsp;<i>Chenopodium murale</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=100067"><i>Chenopodiastrum murale</i></a>
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=100438"><i>Chenopodium nitens</i></a> added, as native
<br>&nbsp;&nbsp;<i>Chenopodium polyspermum</i> var. <i>acutifolium</i> removed, not in California
<br>&nbsp;&nbsp;<i>Chenopodium rubrum</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=107008"><i>Oxybasis rubra</i></a>
<br>&nbsp;&nbsp;<i>Chenopodium rubrum</i> var. <i>humile</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82809"><i>Oxybasis rubra</i> var. <i>humilis</i></a>
<br>&nbsp;&nbsp;<i>Chenopodium rubrum</i> var. <i>rubrum</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82810"><i>Oxybasis rubra</i> var. <i>rubra</i></a>
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=93878"><i>Chenopodium sandersii</i></a> added, as native
<br>&nbsp;&nbsp;<i>Chenopodium simplex</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=76301"><i>Chenopodiastrum simplex</i></a>
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=93879"><i>Chenopodium simpsonii</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=93880"><i>Chenopodium twisselmannii</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=93881"><i>Chenopodium wahlii</i></a> added, as native
<br>&nbsp;&nbsp;<i>Chenopodium watsonii</i> removed, not in California
<br>&nbsp;&nbsp;<i>Cycloloma atriplicifolium</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=76303"><i>Dysphania atriplicifolia</i></a>, leaving no </i>Cycloloma</i> in California
<br>&nbsp;&nbsp;<i>Monolepis nuttalliana</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82731"><i>Blitum nuttallianum</i></a>
<br>&nbsp;&nbsp;<i>Monolepis spathulata</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=76304"><i>Neomonolepis spathulata</i></a>, leaving no <i>Monolepis</i> in California
<br>
<br><b>EPHEDRACEAE</b>
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=24285"><i>Ephedra torreyana</i></a> added, as native
<br>
<br><b>ERICACEAE</b>
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=76307"><i>Arctostaphylos nipumu</i></a> added, as native
<br>
<br><b>FABACEAE</b>
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=101366"><i>Hoffmannseggia peninsularis</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=66310"><i>Senna pendula</i> var. <i>glabrata</i></a> added, as waif
<br>
<br><b>LIMNANTHACEAE</b>
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=99400"><i>Limnanthes douglasii</i> subsp. <i>ornduffii</i></a> added, as native
<br>
<br><b>LINACEAE</b>
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82128"><i>Hesperolinon sharsmithiae</i></a> added, as native
<br>
<br><b>ORCHIDACEAE</b>
<br>&nbsp;&nbsp;<i>Listera banksiana</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82796"><i>Neottia banksiana</i></a>
<br>&nbsp;&nbsp;<i>Listera convallarioides</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=103442"><i>Neottia convallarioides</i></a>
<br>&nbsp;&nbsp;<i>Listera cordata</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=106862"><i>Neottia cordata</i></a>, leaving no <i>Listera</i> in California
<br>&nbsp;&nbsp;<i>Piperia candida</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82965"><i>Platanthera ephemerantha</i></a>
<br>&nbsp;&nbsp;<i>Piperia colemanii</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=107274"><i>Platanthera colemanii</i></a>
<br>&nbsp;&nbsp;<i>Piperia cooperi</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=38610"><i>Platanthera cooperi</i></a>
<br>&nbsp;&nbsp;<i>Piperia elegans</i> subsp. <i>decurtata</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82964"><i>Platanthera elegans</i> subsp. <i>decurtata</i></a>
<br>&nbsp;&nbsp;<i>Piperia elegans</i> subsp. <i>elegans</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=76273"><i>Platanthera elegans</i> subsp. <i>elegans</i></a>
<br>&nbsp;&nbsp;<i>Piperia elongata</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=107276"><i>Platanthera elongata</i></a>
<br>&nbsp;&nbsp;<i>Piperia leptopetala</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=107278"><i>Platanthera leptopetala</i></a>
<br>&nbsp;&nbsp;<i>Piperia michaelii</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=107279"><i>Platanthera michaelii</i></a>
<br>&nbsp;&nbsp;<i>Piperia transversa</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=107280"><i>Platanthera transversa</i></a>
<br>&nbsp;&nbsp;<i>Piperia unalascensis</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=38611"><i>Platanthera unalascensis</i></a>
<br>&nbsp;&nbsp;<i>Piperia yadonii</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=107283"><i>Platanthera yadonii</i></a>, leaving no <i>Piperia</i> in California
<br>
<br><b>PLANTAGINACEAE</b>
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=76309"><i>Collinsia metamorphica</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=76310"><i>Collinsia parkii</i></a> added, as native
<br>&nbsp;&nbsp;<i>Collinsia torreyi</i> var. <i>brevicarinata</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=20010"><i>Collinsia wrightii</i></a>
<br>&nbsp;&nbsp;<i>Collinsia torreyi</i> var. <i>latifolia</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=76308"><i>Collinsia latifolia</i></a>
<br>&nbsp;&nbsp;<i>Collinsia torreyi</i> var. <i>torreyi</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=20009"><i>Collinsia torreyi</i></a>
<br>&nbsp;&nbsp;<i>Collinsia torreyi</i> var. <i>wrightii</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=20010"><i>Collinsia wrightii</i></a>
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=76311"><i>Collinsia wakahlmae</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=47967"><i>Veronica hederifolia</i></a> added, as naturalized
<br>&nbsp;&nbsp;<i>Synthyris cordata</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=76312"><i>Veronica californica</i></a>
<br>&nbsp;&nbsp;<i>Synthyris missurica</i> subsp. <i>missurica</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82668"><i>Veronica missurica</i> subsp. <i>missurica</i></a>
<br>&nbsp;&nbsp;<i>Synthyris reniformis</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=82889"><i>Veronica regina-nivalis</a>, leaving no <i>Synthyris</i> in California
<br>
<br><b>POACEAE</b>
<br>&nbsp;&nbsp;<i>Ammophila arenaria</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=76320"><i>Calamagrostis arenaria</i> subsp. <i>arenaria</i></a>, leaving no <i>Ammophila</i> in CA
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=8640">Calamagrostis breviligulata</i> subsp. <i>breviligulata</i></a> (<i>Ammophila breviligulata</i>) added, as naturalized
<br>&nbsp;&nbsp;<i>Andropogon glomeratus</i> var. <i>scabriglumis</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=76317"><i>Anatherum eremicum</i></a>
<br>&nbsp;&nbsp;<i>Andropogon virginicus</i> var. <i>virginicus</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=76318"><i>Anatherum virginicum</i> var. <i>virginicum</i></a>, leaving no <i>Andropogon</i> in California
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=76322"><i>Catabrosa aquatica</i> subsp. <i>aquatica</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=100958"><i>Pentameris airoides</i> subsp. <i>airoides</i></a> added, as naturalized
<br>
<br><b>POLEMONIACEAE</b>
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=103798"><i>Navarretia aeroides</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=103800"><i>Navarretia crystallina</i></a> added, as native
<br>&nbsp;&nbsp;<i>Navarretia divaricata</i> subsp. <i>divaricata</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=34447"><i>Navarretia divaricata</i></a>
<br>&nbsp;&nbsp;<i>Navarretia divaricata</i> subsp. <i>vividior</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=103796"><i>Navarretia vividior</i></a>
<br>&nbsp;&nbsp;<i>Navarretia leucocephala</i> subsp. <i>minima</i> (misapplied) changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=76313"><i>Navarretia leucocephala</i> subsp. <i>suksdorfii </i></a>
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=103803"><i>Navarretia miwukensis</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=103797"><i>Navarretia modocensis</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=103795"><i>Navarretia panochensis</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=103799"><i>Navarretia torreyella</i></a> added, as nativ
<br>
<br><b>RANUNCULACEAE</b>
<br>&nbsp;&nbsp;<i>Consolida ajacis</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=22431"><i>Delphinium ajacis</i></a>, leaving no <i>Consolida</i> in California
<br></i></a>
<br><b>RHAMNACEAE</b>
<br>&nbsp;&nbsp;<i>Ziziphus obtusifolia</i> var. <i>canescens</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=76314"><i>Condaliopsis divaricata</i></a>
<br>&nbsp;&nbsp;<i>Ziziphus parryi</i> var. <i>parryi</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=84262"><i>Pseudoziziphus parryi</i> var. <i>parryi</i></a>
<br>&nbsp;&nbsp;<i>Ziziphus zizyphus</i> (nom. rej.) changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=48940"><i>Ziziphus jujuba</i></a>
<br>
<br><b>ROSACEAE</b>
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=76315"><i>Crataegus rhodamae-loveae</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=110174"><i>Crataegus &times;suksdorfii</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=107561"><i>Rosa gymnocarpa</i> subsp. <i>gymnocarpa</i></a> added, as native
<br>&nbsp;&nbsp;<a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=99721"><i>Rosa gymnocarpa</i> subsp. <i>helleri</i></a> added, as native
<br>
<br><b>RUBIACEAE</b></i></a>
<br>&nbsp;&nbsp;<i>Galium catalinense</i> subsp. <i>acrispum</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=76316"><i>Galium acrispum</i></a>
<br>&nbsp;&nbsp;<i>Galium catalinense</i> subsp. <i>catalinense</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=26327"><i>Galium catalinense</i></a>
<br>
<br><b>Nomenclatural Changes</b></i></a>
<br>&nbsp;&nbsp;<i>Symphyotrichum spathulatum</i> var. <i>intermedium</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=76296"><i>Symphyotrichum occidentale</i> var. <i>intermedius</i></a>
<br>&nbsp;&nbsp;<i>Symphyotrichum spathulatum</i> var. <i>spathulatum</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=76297"><i>Symphyotrichum occidentale</i> var. <i>occidentale</i></a>
<br>&nbsp;&nbsp;<i>Symphyotrichum spathulatum</i> var. <i>yosemitanum</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=76298"><i>Symphyotrichum occidentale</i> var. <i>yosemitanum</i></a>
<br>&nbsp;&nbsp;<i>Pinus ponderosa</i> var. <i>pacifica</i> changed to <a href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=103000"><i>Pinus ponderosa</i> var. <i>benthamiana</i></a> (name with priority)

<!-- END revision block 14 -->

<!-- End body section-->

</span>
	</div>
  </td>
 </tr>



</table> <!--close box outline table-->


</div>
<div class ="hr_line_grey">
<p class="footerText"><a href="/main/copyright.html"> Copyright</a> &copy; 2012 - <span id="currentYear"> </span>. Regents of the University of California</p>
<p class="footerText">We encourage links to these pages, but the content may not be downloaded for reposting, repackaging, redistributing, or sale in any form, without written permission from The University and Jepson Herbaria &mdash; <a href="/eflora/termsofuse.html">Terms of Use</a>.</p>
<p class="footerText">Page last updated <span id='demo'></span>
</p>
</div>

<!-- Get current year for copyright statement -->
<script>
 var currentYear = new Date().getFullYear(); 
 document.getElementById("currentYear").innerText = currentYear; 
</script>
</body>
</html>
