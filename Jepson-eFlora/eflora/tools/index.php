<!DOCTYPE html>
 
<html lang="en"> 

<head>
<title>Jepson eFlora: Users Guide</title> 
<meta charset="UTF-8">
<meta name="description" content="For vascular plants occurring in wildlands or otherwise outside of cultivation in California, the Jepson eFlora contains taxonomic treatments, distribution maps, illustrations, photographs, and identification keys.">
  <meta name="keywords" content="California Flora, Jepson eFlora, Flora of California, Vascular Plants of California, Jepson Flora Project, ">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="/common/css/dropdowns.css" rel="stylesheet" type="text/css" />

<link href="/common/css/jepson_eflora.css" rel="stylesheet" type="text/css" />


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

<body>

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
                <li class="globalNav"><a class="globalNavSub" href="/CPD/algal_research.html">Silva Center for Phycological <br />Documentation</a></li>
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
				<li class="globalNav"><a class="globalNavSub" href="/seaweedflora/seaweedflora.html">Seaweed Flora of California<br />(Upcoming)</a></li>
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

	<h1>Jepson eFlora Tools</h1>

<p><a class="googleForm" href="https://docs.google.com/forms/d/e/1FAIpQLSc_wrQXqB9gNPrOgUTZ9WN38Ub08JlmgaIha7Ua99sHGzMntA/viewform">Please use this Google Form for Contact/Feedback</a>




<table align="center" width="100%">
<tr>
<td align="center"><a href="/eflora/clademap/clademap2.html"><img src="/common/images/pt.jpg"></a></td>
<td><a href="/eflora/eflora_display.php?tid=16772"><img src="/common/images/ijm_banner_2.jpg"  alt="Calochortus venustus, John C. Game"></a></td>
<td><a href="/eflora/eflora_display.php?tid=18403"><img src="/common/images/ijm_banner_5.jpg" alt="Caulanthus inflatus, John C. Game"></td>
<td><a href="/eflora/eflora_display.php?tid=79332"><img src="/common/images/ijm_banner_4.jpg" alt="Harmonia guggolziorum, John C. Game"></a></td>
</tr>
<tr>
<td align="center"><a href="/eflora/clademap/clademap2.html">Phylogenetic index<br>to families</td>
<td><img src="/common/images/ijm_banner_6.jpg" alt="Willis Linn Jepson in the Vaca Hills, 1942, Neat M. Tate"></td>
<td><a href="/eflora/eflora_display.php?tid=88878"><img src="/common/images/ijm_banner_1.jpg" alt="Arctostaphylos ohloneana, Neal Kramer"></a></td>
<td></td>
</tr>
</table>



<h2>Statistics and species lists</h2>
<ol>
<li class="pageAuthorLine"> <a href="/eflora/IJM_stats.html">Summary statistics</a></li>
<li class="pageAuthorLine"><a href="/eflora/tools/TJM_name_words.txt">Jepson Manual name words:</a>  Import this list of names to build custom dictionaries (for example, for <a href="http://www.google.com/search?client=safari&rls=en&q=Microsoft+Word+create+custom+dictionary&ie=UTF-8&oe=UTF-8">Word</a>).</li>
<li class="pageAuthorLine">Generate a list of taxa by bioregion (e.g., all species inferred from the eFlora to be present in the White and Inyo mountains)</li>
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
			<FORM action="/cgi-bin/get_JM_name_data" method=post>
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
	<li class="pageAuthorLine"><a href="/interchange/JMtoJMII.html">Dynamic concordance:</a> Use this search tool to look up names that were accepted in <em>The Jepson Manual</em> (1993). The return page will indicate how (or if) the name is treated in the <em>eFlora</em> (e.g., if it was accepted, excluded, or listed as a synonym under a newly adopted name). </li>
	<li class="pageAuthorLine"> <a href="/interchange/superseded_names.html">Superseded names:</a> Browse this list of names from <em>The Jepson Manual</em> (1993) that are no longer recognized in the <em>eFlora</em></li>
	<li class="pageAuthorLine"><a href="/eflora/IJM_family_dispo.html">Comparison of recognition and composition of families:</a> Learn about changes in families and genera.</li>


</td>
</tr>
</table>
</ol>



</div>
<hr class ="hr_line_grey">
<p class="footerText"><a href="/main/copyright.html"> Copyright</a> &copy; 2012 - <span id="currentYear"> </span>.  Regents of the University of California</p>
<p class="footerText">We encourage links to these pages, but the content may not be downloaded for reposting, repackaging, redistributing, or sale in any form, without written permission from The University and Jepson Herbaria &mdash; <a href="/eflora/termsofuse.html">Terms of Use</a>.</p>
<p class="footerText">Page last updated <span id='demo'></span>


</p>


<!-- Get current year for copyright statement -->
<script>
  var currentYear = new Date().getFullYear(); 
  document.getElementById("currentYear").innerText = currentYear; 
</script>
</body>
</html>

