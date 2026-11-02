################
#Add errata paragraphs after __END__
################
#open (ERR, ">output/eflora_errata_printed_list.txt")|| die;
#The last of these files was produced in 2019; from 2020 onward, Tom no longer added page numbers to errata corrections
#so the printed list was retired

$/="";
$today=localtime();
$server_root = "\$_SERVER['DOCUMENT_ROOT']"; #because $_SERVER... is interpreted as a variable if entered directly in the print-to-EOP

$errata_file="input/TJM2_Errata.txt";
open(IN, "$errata_file") || die;
open(OUT, "> output/errata.html") || die;
$pagetop = <<EOP;
<?php

date_default_timezone_set('America/Los_Angeles');

?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<?php 
//add note or other code here for variables
?>

<head>
<title>Jepson eFlora Errata Page, Jepson Flora Project: Jepson Manual, Jepson Herbarium, California Flora</title> 
<meta charset="UTF-8">
<meta name="description" content="The Jepson eFlora is the foremost authority on the native and naturalized vascular plants of California. For plants occurring in wildlands or otherwise outside of cultivation, the Jepson eFlora contains taxonomic treatments, distribution maps, illustrations, photographs, and identification keys."  />
	<meta name="keywords" content="Jepson eFlora, Jepson Flora Project, California Flora, Flora of California, Vascular Plants of California">
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
	 <table style="background-color: #E6F3FF"><!-- content table -->
	  <tr>
	   <td>
<!-- Begin banner -->
<?php include($server_root.'/common/php/header_jeps.php'); ?>
<!-- End banner -->

<!-- Beginning of horizontal menu -->
<?php include($server_root.'/common/php/globalnav.php'); ?> 
<!-- End of horizontal menu -->
<div style="border-left-style: solid;border-left-color: #C0DFFD;border-right-style: solid;border-right-color: #C0DFFD;"><!-- Begin content divider -->
	<table style="background-color: #E6F3FF"><!-- content table -->
	 <tr>  
	  <td style="vertical-align: top;">
		<table id = "sideLinks" style="width:100%;">
		<tr>
			<td><!-- <<background test>> -->
<!-- Start of sidebar menu-->
<?php include($server_root.'/common/php/localnav_eflora_primary.php'); ?>
<!-- End of sidebar --> 
			</td>
		</tr>
		</table>
	  </td>
	  <td style="border-left-style: solid;border-left-color: #C0DFFD;"><img src="/common/images/common_spacer.gif" alt="" style="height:1px;width:15px;"></td>
	  <td style="padding-top: 5px;vertical-align: top;width=90vw;">
 <table id = "efTable">
  <tr>
    <td style="padding-top: 0;vertical-align: top;">
     <div id="content-top">

<p><span class="pageName">The Jepson Manual: Vascular Plants of California, Second Edition<br />
Errata
</span></p>
$today
<p>Please send questions or comments regarding the content of these pages to Tom Rosatti (<a href="mailto:rosatti@berkeley.edu">rosatti at berkeley.edu</a>).
</p>
<p><a href="errata_by_date.html">Display by date of correction</a></p>
<p>
Note: the word "unabridged" pertains to information that is displayed only on-line.
<br />Lines in blue are explanations, summaries, or details of the correction.
<br />
References to couplet and lead numbers refer to those numbers as they are in TJM2, first printing, some of which have been changed by this document, as indicated below, as appropriate.
</p>

EOP

$pagebottom = <<EOP;
<!-- End body section-->

		</td>
		</tr>
		</table><!--close eflora table-->


   </td>
  </tr>
</table> <!--close box outline table-->
</div>  <!--close content division-->
<!-- Begin footer -->
<?php include($server_root.'/common/php/footer.php'); ?>
<!-- End footer -->

 
 	</td>
   <td class="spacer1"><img src="/common/images/common_spacer.gif" alt="" style="height:1px;width:15px;"></td>
  </tr>
 </table> <!--close outside normal table-->

</body>
</html>
EOP

print OUT $pagetop;


$pagetop=~s!<a href="errata_by_date.html">Display by date of correction</a>! <a href="errata.html">Display by page number</a>!;

print OUT <<EOP;
<p>Search for "Beginning in 2020:" to find beginning point for corrections made in 2020 and beyond.</p>

<p>Entries marked "superseded by Supplement I" (Supplement II, etc.) are those in taxa (usually genera) that have been revised since TJM2 and thereby comprise "The Jepson Manual: Vascular Plants of California, Second Edition. Supplement I" (Supplement II, etc.).<br />  
(Supplement III, comprising revisions of Carex, Eriastrum, Juncus, and Linanthus, was posted 18 December 2015; 
Supplement (Revision) IV (2016) though Supplement (Revision) VIII (2020) have yet to be indicated for the appropriate entries below).<br />
An entry marked as having been superseded by a supplement could be identical to what is in TJM2 (except for the correction involved in that erratum) if the supplement (revision) involved no changes to that entry or, conversely, such an entry might bear very little resemblance to what is in TJM2 if the supplement (revision) involved extensive changes to that entry.  In some cases, the change involves the name of the plant itself (e.g., the entry for CHEILANTHES clevelandii has been superseded by Supplement II, where the taxon is treated as MYRIOPTERIS clevelandii), so the situation can be complex and confusing.
</p>
EOP
	while(<DATA>){
		@datelines=();

next if m/^#/;
next if m/^Beginning in 2020/;
next if m/^EFLORA ONLY/i;

if (m/\{[^}]+\}/){
	s/\{[^}]+\}//;
}

			if (m/^p+\. (\d+)/){
				$pageno=$1;
				s/^(p+\.)/<p>$1/;
				
			}
			elsif(m/^[A-Z][A-Z][A-Z]+/){
				$pageno="NULL";
				s/^([A-Z]+)/<p>$1/;
			}
			elsif(m/^Supplement I/){
				$pageno="NULL";
				s/^(Supplement I)/<p>$1/;
			}
			elsif(m/^p.[ uxvi]/){
				s/^(p. *([uxvi]+))/<p>$1/;
				$pageno="$1";
			}
			elsif(m/^\+\+\++/){
				#do not print
			}
			elsif(m/^\*\*\*+/){
				#do not print
			}
			else{
			print "BAD PAGE LINES: $_\n\n";
			}

	if(m/p2\n/){
		s/p2\n/Corrected in second printing<\/p>\n/;
	}
	elsif(m/(\d\d\d\d) (\d+) (\d+)\n/){
		s/(\d\d\d\d) (\d+) (\d+)\n/$1 $2 $3<\/p>\n/
	}


unless (m/\n\d\d\d\d \d\d \d\d/){
s/$/\n2012 04 06/;
#print;
}
@lines=split(/\n/);
foreach(@lines){

s/^[*+](.*)/<font color="blue">$1<\/font>/;

 if (m/(\xc2\xb1)/){
 	print "BAD CHARACHER ENCODING (1)==>$_\n"
 }
 if (m/(\xe2\x80\x94)/){
 	print "BAD CHARACHER ENCODING (2)==>$_\n"
 }
 if (m/(\xe2\x80\x93)/){
 	print "BAD CHARACHER ENCODING (3)==>$_\n"
 }
 if (m/(\xe2\x80\xa6)/){
 	print "BAD CHARACHER ENCODING (4)==>$_\n"
 }
 if (m/(\xe2\x80\x99)/){
 	print "BAD CHARACHER ENCODING (5)==>$_\n"
 }
 if (m/(\xe2\x80\x98)/){
 	print "BAD CHARACHER ENCODING (6)==>$_\n"
 }
 if (m/(\x0D\x0A)/){
 	print "BAD CHARACHER ENCODING (7)==>$_\n"
 }



#s/\xc2\xb1/+-/g;
#s/\xe2\x80\x94/--/g;
#s/\xe2\x80\x93/--/g;
#s/\xe2\x80\xa6/./g;
#s/\xe2\x80\x99/'/g;
#s/\xe2\x80\x98/'/g;
#s/\xc3\xba/&uacute;/g; 
#s/\x0D\x0A/\n/g;
#s/\x0D\x0A/\n/g; #remove stray windows line brea

s/\+-/&plusmn;/g;
s/---/&mdash;/g;
s/--/&ndash;/g;


while(s/_/<em>/){
s/_/<\/em>/;
}



print OUT "$_<br />\n";

	if(m/(\d\d\d\d) (\d+) (\d+)/){
		$date="$1$2$3";
	}

push(@datelines,"$_<br />");
}



$date_order{join("\n", @datelines)}=$date;
$pageno{join("\n", @datelines)}=$pageno;
}

print OUT $pagebottom;
close (OUT);

open(OUT, "> output/errata_by_date.html") || die;
$pagetop=~s/Errata/Errata (ordered by date)/g;
print OUT $pagetop;

print OUT <<EOP;
<p>Entries marked "superseded by Supplement I" (Supplement II, etc.) are those in taxa (usually genera) that have been revised since TJM2 and thereby comprise "The Jepson Manual: Vascular Plants of California, Second Edition. Supplement I" (Supplement II, etc.).<br />  
(Supplement III, comprising revisions of Carex, Eriastrum, Juncus, and Linanthus, was posted 18 December 2015; 
Supplement (Revision) IV (2016) though Supplement (Revision) VIII (2020) have yet to be indicated for the appropriate entries below).<br />
An entry marked as having been superseded by a supplement could be identical to what is in TJM2 (except for the correction involved in that erratum) if the supplement (revision) involved no changes to that entry or, conversely, such an entry might bear very little resemblance to what is in TJM2 if the supplement (revision) involved extensive changes to that entry.  In some cases, the change involves the name of the plant itself (e.g., the entry for CHEILANTHES clevelandii has been superseded by Supplement II, where the taxon is treated as MYRIOPTERIS clevelandii), so the situation can be complex and confusing.
</p>
EOP

next if m/^#/;
next if m/^SUPPLEMENT.+/; #display the supplement divisiond only on normal errata page.  It looks like an error when included on a sorted by date page
next if m/^eFlora only.+/i;
next if m/^Beginning in 2020/;
next if m/^\{/;

	foreach(sort {$date_order{$a} <=> $date_order{$b} || $pageno{$a} <=> $pageno{$b} }(keys(%date_order))){

		if(m/p2$/){
			s/p2$/Corrected in second printing<\/p>/;
		}
		elsif(m/(\d\d\d\d) (\d+) (\d+)/){
			s/(\d\d\d\d) (\d+) (\d+)/$1 $2 $3<\/p>/
		}


print OUT "$_<br />\n";
}

close(OUT);
print <<EOP;
OUTPUT: 
errata.html
errata_by_date.html

EOP
################
__END__
#Version Date: 18 Oct 2022    
#Old Version Dates: 20 March 2018, 10 April 2018; 17 April 2018; 24 April 2018; 1 May 2018; 8 May 2018; 15 May 2018; 22 May 2018; 29 May 2018; 5 June 2018; 12 June 2018; 26 June 2018; 10 July 2018; 17 July 2018; 1 Aug 2018; 6 Aug 2018; 14 Aug 2018; 28 Aug 2018; 4 Sep 2018; 11 Sep 2018; 9 Oct 2018; 16 Oct 2018; 23 Oct 2018; 9 Jan 2019; 15 Jan 2019; 17 Jan 2019; 22 Jan 2019; 29 Jan 2019; 5 Feb 2019; 12 Feb 2019;19 Feb 2019; 26 Feb 2019; 5 Mar 2019; 12 Mar 2019; 26 Mar 2019; 2 Apr 2019; 9 Apr 2019; 16 Apr 2019; 11 Jun 2019; 16 Jul 2019; 6 Aug 2019; 3 Sep 2019; 24 Sep 2019; 1 Oct 2019; 14 Oct 2019; 5 Nov 2019; 19 Nov 2019; 26 Nov 2019; 10 Dec 2019; 21 Jan 2020; 28 Jan 2020; 25 Feb 2020; 25 Mar 2020; 8 Apr 2020; 6 May 2020; 12 May 2020; 28 May 2020; 16 Jun 2020; 30 Jun 2020; 7 Jul 2020; 16 Jul 2020; 28 Jul 2020; 5 Aug 2020 (possibly a second copy was changed and uploaded after the first one on this date); 18 Aug 2020; 25 Aug 2020; 1 Sep 2020; 9 Sep 2020; 16 Sep 2020; 24 Sep 2020; 2 Oct 2020 (no changes made); 21 Oct 2020; 11 Nov 2020; 3 Dec 2020; 9 Dec 2020; 10 Dec 2020; 11 Dec 2020; 14 Dec 2020; 18 Dec 2020; 13 Jan 2021; 2 Feb 2021; 11 Feb 2021; 16 Feb 2021; 25 Feb 2021; 9 Mar 2021; 17 Mar 2021; 23 Mar 2021; 30 Mar 2021; 6 Apr 2021; 27 Apr 2021; 19 May 2021; 3 Jun 2021; 16 Jun 2021; 21 Jul 2021; 4 Aug 2021; 24 Aug 2021; 8 Sep 2021; 16 Sep 2021; 2 Nov 2021; 10 Nov 2021; 11 Nov 2021; 02 Dec 2021; 14 Dec 2021; 14 Jan 2022; 19 Jan 2022; 8 Mar 2022; 15 Mar 2022; 22 Mar 2022; 31 Mar 2022;3 May 2022; 1 Jun 2022; 14 Jun 2022; 21 Jun 2022; 7 Jul 2022; 13 Jul 2022; 20 Jul 2022; 21 Jul 2022 (correction to work done yesterday, 20 Jul 2022); 23 Aug 2022; 31 Aug 2022; 13 Oct 2022

#search for "Beginning in 2020:" to find beginning point for corrections made in 2020 and beyond

#8 May 2018 is the last day that corrections made to the eFlora and listed below were also made on hard-copy, as kept in a folder in Rosatti's office.

#Entries marked "superseded by Supplement I" (Supplement II, etc.) are those in taxa (usually genera) that have been revised since TJM2 and thereby comprise "The Jepson Manual: Vascular Plants of California, Second Edition. Supplement I" (Supplement II, etc.).  (Supplement III, comprising revisions of Carex, Eriastrum, Juncus, and Linanthus, was posted 18 December 2015; Supplement IV, posted in December 2016, and Supplement V, posted in December 2017, have yet to be indicated for the appropriate entries below)  An entry marked as having been superseded by a supplement could be identical to what is in TJM2 (except for the correction involved in that erratum) if the supplement (revision) involved no changes to that entry or, conversely, such an entry might bear very little resemblance to what is in TJM2 if the supplement (revision) involved extensive changes to that entry.  In some cases, the change involves the name of the plant itself (e.g., the entry for CHEILANTHES clevelandii has been superseded by Supplement II, where the taxon is treated as MYRIOPTERIS clevelandii), so the situation can be complex and confusing.

#Beginning chronologically with entries marked "2013 07 31", most abbreviations expanded to full words [reflecting situation in eFlora but not in TJM2, where abbreviations obviously are retained], except that abbreviations for the geographic subdivisions are retained.

{/for changes to changes, use ' [replaces change(s) made on 2012 06 15]'}

p. unnumbered, facing front inside cover
Geographic Subdivisions of California
+ Map legend, lower left, 'SnJt' and its color bar removed
+ Map legend, lower left, 'PR exc SnJt' made 'PR'
+ Map, unexpanded, bottom, 'PR' made 'PR (exc SnJt)'
+ Map, unexpanded, color of SnJt made the same as PR, which is now 'PR (exc SnJt)'
+ Map, expanded (spaces between regions), bottom, 'PR' made 'PR (exc SnJt)'
+ Map, expanded (spaces between regions), color of SnJt made the same as PR, which is now 'PR (exc SnJt)'
2014 01 07

p. viii
second paragraph from bottom, second line
+ 'Whitten Bulding' made 'Whitten Building'
2012 04 04
p2

p. xvii
AUTHORS CONTRIBUTING TO THE JEPSON MANUAL, SECOND EDITION
Edward Alverson, Oregon State University, Corvallis
+ 'Edward Alverson, Oregon State University, Corvallis' inserted, in alphabetical order by last name (i.e., after Ihsan A. Al-Shehbaz, before Edward F. Anderson) 

p. 11
THINGS TO REMEMBER WHEN USING THIS BOOK
Assumptions. Unless stated otherwise, number of flowers is per inflorescence, of petals is per flower, of seeds is per fruit (so if per chamber, that would be specified), etc. Also, unless stated otherwise, keys and descriptions refer to plant parts in their mature condition; that is, after they have expanded fully from their embryonic states, excluding any expansion subsequent to that, as happens for example when flower parts (e.g., ovary, sepals) expand in association with fruit set.
+ 'Also, unless stated otherwise, keys and descriptions refer to plant parts in their mature condition; that is, after they have expanded fully from their embryonic states, excluding any expansion subsequent to that, as happens for example when flower parts (e.g., ovary, sepals) expand in association with fruit set.' added
2013 11 19

p. 15
SYMBOLS
&#43;  1) after a number or range of numbers, it means "or more" (e.g., "6--10+ mm" means "6 to 10 or more mm"); 2) between words (e.g., plant structures, word elements in etymologies) it means "plus" (e.g., "tube + throat 12--16 mm" means that the tube and throat taken together are 12--16 mm)
+ inserted just below '1', just above '+-'
2012 03 27

p. 15
SYMBOLS
star  rare and/or endangered native taxon; see Conventions for further explanation
+ 'plant' made 'taxon'
2012 03 27

p. 15
SYMBOLS
diamond  weedy, alien taxon; see Conventions for further explanation
+ 'plant' made 'taxon'
2012 03 27

p. 15
SYMBOLS
broken diamond  weedy, alien taxon; see Conventions for further explanation
+ 'plant' made 'taxon'
2012 03 27

p. 17
GLOSSARY
abaxial. Side or surface of a structure away from the axis distal to the point at which the structure is borne (e.g., lower surface of a leaf, outer surface of a petal). (see adaxial)
+ 'away from the axis on which the structure' made 'away from the axis distal to the point at which the structure'
2012 07 12

p. 17
GLOSSARY
adaxial. Side or surface of a structure toward the axis distal to the point at which the structure is borne (e.g., upper surface of a leaf, inner surface of a petal). (see abaxial)
+ 'toward the axis on which the structure' made 'toward the axis distal to the point at which the structure'
2012 07 12

p. 17
GLOSSARY
acuminate. Having a long-tapered, sharp tip, the sides concave. (see acute, attenuate, awl-like)
+ '(see acute, awl-like)' made '(see acute, attenuate, awl-like)'
2014 05 13

p. 17
GLOSSARY
acute. Having a short-tapered, sharp tip, the sides convex or straight and converging at less than a right angle. (see acuminate, attenuate, awl-like, obtuse)
+ '(see acuminate, obtuse)' made '(see acuminate, attenuate, awl-like, obtuse)
2014 05 13

p. 18
GLOSSARY
aquatic. Growing under, in, or on water (generally fresh; if brackish, saline, or marine, so indicated), whether rooted in bottom or floating, and including plants with parts of shoots submersed but with other parts above water (e.g., _Potamogeton gramineus_); excluding plants of seeps or wet rocks. (see emersed, submersed)
+ '(e.g., _Potamogeton gramineus_)' moved
2012 03 27

p. 18
GLOSSARY
attenuate. Having a long-tapered, sharp tip. (see acuminate, acute, awl-like)
+ 'attenuate. Having a long-tapered, sharp tip. (see acuminate, acute, awl-like)' added to glossary
2014 05 13

p. 18
GLOSSARY
awl-like. Narrow throughout, but broader at the base and tapered to a sharp tip. (see acuminate, acute, attenuate)
+ '(see acuminate)' made '(see acuminate, acute, attenuate)'
2014 05 13

p. 22
GLOSSARY
ellipsoid. In the shape of a flattened or elongated sphere, widest at the middle and tapered equally to both ends, as a fruit; wider than linear. (see elliptic, linear, oblong)
+ 'circle' made 'sphere'; 'in three dimensions,' deleted
2012 03 27

p. 22
GLOSSARY
elliptic. In the shape of a flattened or elongated circle, widest at the middle and tapered equally to both ends, as a leaf; wider than linear. (see ellipsoid, linear, oblong)
+ 'in two dimensions (i.e., in one plane),' deleted
2012 03 27

p. 24
GLOSSARY
infraspecific. Below the species level or within a species; pertaining to variation within a species, whether taxonomically significant (e.g., characterizing subspecies or varieties) or not (e.g., characterizing forms or minor variants).
+ 'i.e.' made 'e.g.'
2012 03 27

p. 25
GLOSSARY
leaflet. Leaf-like unit of a compound leaf; distinguished from a leaf by the absence in its axil of a bud, branch, thorn, or flower; either simple (leaf 1-compound, with 1&deg; leaflets) or compound (leaf 2-compound, with 1&deg; and 2&deg; leaflets; 3-compound, with 1&deg;, 2&deg;, and 3&deg; leaflets; etc.).
+ comma made semicolon before 'etc.' near end [made on 2012 03 27]
+ 'lacking lateral, basal appendages (stipules);' deleted, after '...branch, thorn, or flower;'
2013 08 09 [in addition to change(s) made on 2012 03 27, above]

p. 27
GLOSSARY
mericarp. One of the generally dry, generally indehiscent, 1--few-seeded, 1-carpelled segments into which certain fruits separate at maturity (e.g., those of Apiaceae).
+ deleted +- repeated phrase '(generally dry, indehiscent, 1-seeded)'
2012 03 27

p. 28
GLOSSARY
ocrea, ochrea (ocreae, ochreae). In Polygonaceae, generally scarious sheath around the stem formed by the fusion of stipules.
+ 'ocrea (ocreae).' made 'ocrea, ochrea (ocreae, ochreae).'
2013 02 26

p. 28
GLOSSARY
papillate. Pertaining to a surface (e.g., of a leaf, stigma, fruit) bearing small, rounded or conic protuberances (papillae; singular papilla).
+ deleted comma after 'rounded'
2012 03 27

p. 30
GLOSSARY
pome. In Rosaceae, a fleshy, indehiscent fruit, such as an apple or pear; derived from a hypanthium (represented as outer fleshy material and skin) surrounding and +- fused to a compound ovary (represented as (1)2--5 papery-walled, radiating segments alternating with fleshy material, as in, e.g., _Amelanchier utahensis_ fruit) or to (1)2--5 free ovaries, each with a +- stony outer layer. (see berry, drupe)
+ moved 'e.g., _Amelanchier utahensis_ fruit'; added 'as in'
2012 03 27

p. 30
GLOSSARY
prickle. Sharp-pointed, stiff or somewhat flexible projection, originating at or near the surface and neither subtending an axillary bud or branch nor subtended by a leaf or leaf scar, without leaves, leaf scars, buds, or branches (e.g., _Rosa woodsii_ stem); loosely used for any sharp projection. (see armed, spine, thorn)
+ moved '(e.g., _Rosa woodsii_ stem)'
2012 03 27

p. 31
GLOSSARY
radiant head. In Asteraceae, a discoid head with a peripheral ring of flowers having much enlarged, often bilateral corollas.
+ '(p. 31)' deleted [in TJM2; page numbers not used, illustrations not presented, in eFlora]
2014 04 14

p. 31
GLOSSARY
radiate head. (p. 31) In Asteraceae, a head composed of central disk flowers and marginal ray flowers. (see disciform head, discoid head, liguliflorous head, radiant head)
+ '(p. 25)' made '(p. 31)' [in TJM2; page numbers not used, illustrations not presented, in eFlora]
2014 04 14

p. 32
GLOSSARY
spine. Sharp-pointed, usually stiff projection, derived from a leaf or leaf part (e.g., stipule, vein tip), and therefore often subtending an axillary bud or branch, without buds of its own (e.g., _Cirsium arvense_ leaf); loosely used for any sharp projection. (see armed, prickle, thorn)
+ moved '(e.g., _Cirsium arvense_ leaf)' [change made on 2012 03 27]
+ 'originating below the epidermis,' deleted, after 'usually stiff projection,'
+ '(e.g., _Cirsium arvense_ leaf)' made '(e.g., marginal spine of _Cirsium arvense_ leaf)'
2013 08 09 [in addition to change(s) made on 2012 03 27, above]

p. 33
GLOSSARY
stipe. 1. In ferns, a leaf stalk (analogous to a petiole of a leaf), connecting blade to rhizome. 2. In some Polygonaceae, a stalk-like base of a flower or of a hypanthium, distal to pedicel (stipe and pedicel separated by line of dehiscence or a bulge, or differences in thickness; if no such demarcation exists, the structure throughout is a pedicel, not in part a stipe).
+ '1.' inserted before 'In ferns', definition 2. added [change made on 2012 07 16]
+ 'a stalk-like flower or hypanthium base' made 'a stalk-like base of a flower or of a hypanthium'
2013 08 09 [in addition to change(s) made on 2012 07 16, above]

p. 33
GLOSSARY
thorn. Sharp-pointed, usually stiff projection, derived from a branch and therefore often subtended by a leaf or leaf scar, sometimes with leaf scars and buds of its own (e.g., _Castela emoryi_); loosely used for any sharp projection. (see armed, prickle, spine)
+ moved '(e.g., _Castela emoryi_)' [change made on 2012 03 27]
+ 'originating below the epidermis,' deleted, after 'usually stiff projection,'
2013 08 09 [in addition to change(s) made on 2012 03 27, above]

p. 34
GLOSSARY
utricle. Mostly dry, dehiscent or indehiscent fruit from a generally compound pistil in which a balloon- or bladder-like ovary wall loosely encloses (or, in some Chenopodiaceae, is adherent to) a single seed.
+ 'Amaranthaceae' made 'Chenopodiaceae'
2013 09 26

p. 34
GLOSSARY
valve. 1. In legumes or capsules opening by longitudinal lines, one of the parts into which the fruit is dehiscent (such fruits valvate). 2. In anthers, the flap of tissue resulting from dehiscence by a curved line (e.g., Lauraceae, some Berberidaceae). 3. In Ophioglossaceae, one of the parts into which the sporangium is dehiscent.
+ period added before '3.'
2012 03 27

p. 34
GLOSSARY
vein. 1. Tissue specialized for transport of substances within a plant: water and dissolved inorganic substances (e.g., mineral nutrients) through the xylem; energy-rich, organic compounds (products of photosynthesis) through the phloem. 2. Strand of such tissue, often seen as a line in surface view and as a bundle in transverse section.
+ comma made semicolon after 'xylem'
2012 03 27

p. 38
Klamath Ranges Subregion (KR). In the east, the boundary between the predominantly metamorphic KR and the volcanic CaR lies east and north of Shasta Lake, incorporating the McCloud and Hosselkus limestone formations. In the southeast, the boundary generally excludes the chaparral and foothill-pine/blue-oak woodland vegetation of the Inner North Coast Ranges District (NCoRI) in southwestern Shasta and northwestern Tehama counties.
+ 'In the east, the boundary between the predominantly metamorphic KR and the volcanic CaR is interpreted to be near Interstate 5. In the southeast, the boundary generally excludes the chaparral and pine/oak woodland vegetation of the Inner North Coast Ranges District (NCoRI) in western Shasta and Tehama counties.' made 'In the east, the boundary between the predominantly metamorphic KR and the volcanic CaR lies east and north of Shasta Lake, incorporating the McCloud and Hosselkus limestone formations. In the southeast, the boundary generally excludes the chaparral and foothill-pine/blue-oak woodland vegetation of the Inner North Coast Ranges District (NCoRI) in southwestern Shasta and northwestern Tehama counties.'
2016 01 26

p. 38
CASCADE RANGES REGION (CaR). This region, characterized by volcanics, is bounded to the north by Oregon, to the west by the predominantly metamorphic KR, to the southwest by agricultural land or grassland of the GV, to the southeast by the Sierra Nevada Region (SN), and to the east by the juniper woodland of the GB.
+ 'This region, characterized by volcanics, is bounded to the north by Oregon, to the west by the pre- dominantly metamorphic KR (generally along Interstate 5) and NCoRI (along the Sacramento River between Redding and Red Bluff), to the southwest by agricultural land or grassland of the GV, to the southeast by the Sierra Nevada Region (SN), and to the east by the juniper woodland of the GB.' made 'This region, characterized by volcanics, is bounded to the north by Oregon, to the west by the predominantly metamorphic KR, to the southwest by agricultural land or grassland of the GV, to the southeast by the Sierra Nevada Region (SN), and to the east by the juniper woodland of the GB.'
2016 01 26

p. 39
Cascade Range Foothills Subregion (CaRF).  This subregion, in the southwestern part of CaR, is characterized by chaparral and blue-oak/foothill-pine woodland at about 100--500 m in elevation. The northern CaRF and northern NCoRI combined with the southern KR form a continuous horseshoe-shaped band of similar foothill vegetation along the northern margin of the GV.
+ 'This subregion, in the southwestern part of CaR, is characterized by chaparral and blue-oak/foothill-pine woodland at about 100--500 m in elevation. The CaRF and the adjacent NCoRI and northern Sierra Nevada Foothills District (n SNF) comprise a horseshoe-shaped area of similar foothill vegetation around the northern boundaries of the GV.' made 'This subregion, in the southwestern part of CaR, is characterized by chaparral and blue-oak/foothill-pine woodland at about 100--500 m in elevation. The northern CaRF and northern NCoRI combined with the southern Kr form a continuous horseshoe-shaped band of similar foothill vegetation along the northern margin of the GV.'
2016 01 26

p. 43
Geographic Subdivisions of California
+ Map legend, lower left, 'SnJt' and its color bar removed
+ Map legend, lower left, 'PR exc SnJt' made 'PR'
+ Map, unexpanded, bottom, 'PR' made 'PR (exc SnJt)'
+ Map, unexpanded, color of SnJt made the same as PR, which is now 'PR (exc SnJt)'
+ Map, expanded (spaces between regions), bottom, 'PR' made 'PR (exc SnJt)'
+ Map, expanded (spaces between regions), color of SnJt made the same as PR, which is now 'PR (exc SnJt)'
2014 01 07

p. 46
San Gabriel Mountains District (SnGb), line 1
+ 'This is a topographically well-defined ...' made 'This district is a topographically well-defined ...'
2013 02 15

p. 46
San Jacinto Mountains District (SnJt), line 1
+ 'The only district recognized in the PR, this is an area with ...' made 'This district in the PR is an area with ...'
2013 02 15

p. 47
MODOC PLATEAU REGION (MP), line 6
+ delete 'A single subregion is recognized within the MP.'
2013 02 15 

p. 53
lines 15--16
+ 'continued well into the Tertiary' made 'continued well into the Cenozoic'
2012 03 27

p. 54
line 7
+ 'Cretaceous-Tertiary extinction' made 'Cretaceous-Paleogene extinction'
2012 03 27

p. 70
KEY TO FAMILIES, Group 1
2. Pl with strong odor of onion or garlic; bulblets in head or umbel .....-> ALLIACEAE ([_Allium sativum_], _Allium vineale_)
2' Pl unscented; bulblets in spike- or panicle-like cluster
3. Lvs stiff, sword-like, vertically folded, attached "edge-on" to st, < 60 mm wide .....-> IRIDACEAE (_Watsonia meriana_)
3' Lvs soft, flat or folded, not attached "edge-on" to st, 1--2 mm wide .....-> POACEAE (_Poa bulbosa_ subsp. _vivipara_)
1' Lvs linear-elliptic to round, entire, toothed, or palmately lobed, not sheathing at base
4. Lvs opposite, +- fleshy .....-> MONTIACEAE (_Montia chamissoi_)
4' Lvs alternate or all basal, not fleshy
+ couplet 3 moved to under lead 2', from under lead 1'; couplet 4 moved to under lead 1', from under 3'
2012 03 27
p2

p. 74 
(superseded by Supplement I)
KEY TO FAMILIES, Group 3
5' Sporangia underground, each embedded in adaxial face of widened lf base or several enclosed in hard, spheric sporangium case near lf base
+ 'Sporangia underground, embedded in adaxial faces of widened lf bases or enclosed in hard, spheric sporangium case near lf base' made 'Sporangia underground, each embedded in adaxial face of widened lf base or several enclosed in hard, spheric sporangium case near lf base' [in TJM2; not abbreviated in eFlora]
2013 08 08 [replaces changes made on 2012 03 27]
p2

p. 74 
(superseded by Supplement I)
KEY TO FAMILIES, Group 3
14' Pinnae [some or all of them] conspicuously toothed, lobed, or compound
+ 'toothed or lobed' made 'toothed, lobed, or compound' 
2012 03 27

p. 77
KEY TO FAMILIES, Group 6
20. Ocreae present, persistent or not; nodes gen swollen .....-> POLYGONACEAE {G2,8,15,16,19}
+ 'Ochreae' made 'Ocreae'
2013 02 26

p. 77
KEY TO FAMILIES, Group 6
20' Ocreae 0; nodes gen not swollen
+ 'Ochreae' made 'Ocreae'
2013 02 26

p. 82
KEY TO FAMILIES, Group 8
28. Ocreae present, persistent or not; nodes gen +- swollen .....-> POLYGONACEAE {G2,6,15,16,19}
+ 'Ochreae' made 'Ocreae'
2013 02 26

p. 82
KEY TO FAMILIES, Group 8
28' Ocreae 0; nodes gen not swollen
+ 'Ochreae' made 'Ocreae'
2013 02 26

p. 84
KEY TO FAMILIES, Group 9
26' Lvs petioled; blades green, crenate or serrate, resin-dotted; fls subtended by 2--4 bractlets; fr a papillate, wax-coated drupe, free of subtending bractlets, or an achene enclosed by and falling together with a pair of spongy bractlets.....-> MYRICACEAE {G7,11}
+ comma added after 'subtending bractlets'
2012 03 27
p2

p. 84
KEY TO FAMILIES, Group 9
27. Styles or stigmas repeatedly branched into >> 4 fine, thread-like divisions; ovary 3-lobed, maturing as a capsule; stems brittle; shrub .....-> EUPHORBIACEAE (_Acalypha_) {G7,11}
+ 'Styles repeatedly branched into many' made 'Styles or stigmas repeatedly branched into >> 4' 
2014 02 06

p. 84
KEY TO FAMILIES, Group 9
27' Styles, style branches, or stigmas 2--4, generally not further divided; ovary generally unlobed, the frs various, incl capsules; sts mostly not brittle; shrub or tree
+ 'Styles or style branches' made 'Styles, style branches, or stigmas'
+ 'the frs various' made 'the frs various, incl capsules' [in TJM2; not abbreviated in eFlora]
2014 02 06

p. 85
KEY TO FAMILIES, Group 10
2. Hypanthium present .....-> ROSACEAE (4) {G15,21,22,23}
+ '20,' removed
2013 08 21

p. 86
KEY TO FAMILIES, Group 10
19' Flowers clustered; seeds without arils .....-> ROSACEAE (4) {G15,21,22,23}
+ '20,' removed
2013 08 21

p. 86
KEY TO FAMILIES, Group 10
20. Hypanthium present .....-> ROSACEAE (4) {G15,21,22,23}
+ '20,' removed
2013 08 21

p. 86
KEY TO FAMILIES, Group 10
27' Herb .....-> ROSACEAE (4) {G15,21,22,23}
+ '20,' removed
2013 08 21

p. 88
KEY TO FAMILIES, Group 12
27. Lvs fleshy, cylindric to +- flat .....-> CHENOPODIACEAE (_Suaeda_)
+ 'Lf' made 'Lvs'
2012 03 27
p2

p. 88
KEY TO FAMILIES, Group 12
31. Perianth parts 2--10 cm; ovules many --- sepals actually present in bud, but early-deciduous, 0 in open flower .....-> PAPAVERACEAE (Papaveroideae) {G15,20,22,24}
+ 'parts 2--3 cm, bright yellow' made 'parts 2--10 cm'; ' (_Dendromecon_)' made '(Papaveroideae) {G15,20,22,24}'
2013 08 21

p. 88
KEY TO FAMILIES, Group 12
31' Perianth parts generally < 1.5 cm; ovules 1--2 per chamber
+ ', generally not yellow and petal-like' removed
2013 08 21

p. 89
KEY TO FAMILIES, Group 13
4' Leaves narrowly linear; perianth parts scale-like, green to brown or +- purple-black or tinged +- red-purple
+ 'perianth parts scale-like, green to +- red or brown' made 'perianth parts scale-like, green to brown or +- purple-black or tinged +- red-purple'
2014 12 05

p. 91
KEY TO FAMILIES, Group 15
11. Perianth parts 6(8) --- sepals actually present in bud, but early-deciduous, 0 in open flower .....-> PAPAVERACEAE (2) (Papaveroideae) {G12,20,22,24}
+ 'PAPAVERACEAE (2) {G20,22,24}' made 'PAPAVERACEAE (2) (Papaveroideae) {G12,20,22,24}'
2013 08 21

p. 91
KEY TO FAMILIES, Group 15
13' Leaves of a pair equal; stipules 0; fruit 5-valved .....-> MYRSINACEAE (_Lysimachia maritima_)
+ '_Glaux_' made '_Lysimachia maritima_)'
2015 05 07

p. 92
KEY TO FAMILIES, Group 15
18. Fr a 3-angled achene; perianth parts 6 [actually in 2 whorls of 3, but this may not be evident in open fls] .....-> <sup>3</sup>POLYGONACEAE {G2,6,8,16,19}
+ brackets replaced improper use of em dash
2012 03 27
p2

p. 92
KEY TO FAMILIES, Group 15
18' Fr not 3-angled; perianth parts <= 5
+ '5 or fewer' made '<= 5'
2012 03 27
p2

p. 92
KEY TO FAMILIES, Group 15
22. Sepals erect, linear, fused below and hardened around ovary; stamens fused to calyx; slender ann, gen <= 15 cm; lvs narrowly linear, <= 15 mm .....-> CARYOPHYLLACEAE (_Scleranthus_) {G14}
+ '15 cm or less' made '<= 15 cm'
2012 03 27

p. 92
KEY TO FAMILIES, Group 15
22' Sepals erect or spreading, free, not hardened around ovary (sepals gen 0 in pistillate fls of _Atriplex_, which has a pair of +- hardened bractlets around fr); stamens free from calyx; pls often larger, ann or per; lvs various
+ 'fr enclosed between pair of +- hardened bractlets' made 'which has a pair of +- hardened bractlets around fr'
2012 03 27
p2

p. 92
KEY TO FAMILIES, Group 15
37. Perianth parts 4 or 6, free; stigmas 1--many, generally sessile; fruit a capsule --- sepals actually present in bud, but early-deciduous, 0 in open flower .....-> PAPAVERACEAE (2) (Papaveroideae) {G12,20,22,24}
+ 'PAPAVERACEAE (2) {G20,22,24}' made 'PAPAVERACEAE (2) (Papaveroideae) {G12,20,22,24}'
2013 08 21

p. 92
KEY TO FAMILIES, Group 15
41' Fls unisexual; hairs harshly stellate, central branches often long, spreading, bristle-like; fr dehiscent .....-> EUPHORBIACEAE (_Croton setiger_)
+ 'setigerus' made 'setiger'
2012 04 11

p. 93
KEY TO FAMILIES, Group 15
43' Bracts subtending fls 0 or not scarious or scarious-margined .....-> <sup>3</sup>CHENOPODIACEAE {G6,7,8,9,11}
+ '0 or' inserted
2012 03 27

p. 93
KEY TO FAMILIES, Group 16
9. St nodes with small, dry, sometimes spiny-spurred, scale-like lvs that subtend 1--20 thread-like, needle-like, or ovate, lf-like branchlets --- erect to sprawling herb, sub-shrub, or twining vine ..... ASPARAGACEAE
+ rewritten from '9. True lvs all scale-like, subtending thread-like to ovate lf-like branchlets --- erect to sprawling herb or twining vine .....-> ASPARAGACEAE'
2012 03 27

p. 93
KEY TO FAMILIES, Group 16
9' St nodes without small, dry scale-like lvs that subtend lf-like branches
+ rewritten from '9' True lvs not scale-like (exc sometimes infl bracts or basal lvs), not subtending lf-like sts'
2012 03 27

pp. 93--95
KEY TO FAMILIES, Group 16
20. Stamens many .....-> HYDRANGEACEAE (_Carpenteria_) {G21, 22}
20' Stamens 2--9
+ couplet inserted after 19.; the number of each couplet from 20 through 54 increased by 1, making them 21 through 55 (leads 12' and 19' not changed)
2012 03 27

p. 94
KEY TO FAMILIES, Group 16
27. Shrub, tree, or densely lfy rosette pl; lvs +- sword-like or +- grass-like, fibrous and/or fleshy, persisting > 1 yr
28. Ovules 2 per chamber
29. Fls bisexual; fr a berry .....-> LAXMANNIACEAE
29' Fls gen unisexual (occ some bisexual); fr a papery capsule .....-> RUSCACEAE (_Nolina_) {G6,7,8,9}
28' Ovules 3--many per chamber
30. Perianth orange or red .....-> ASPHODELACEAE
30' Perianth +- white
31. Lvs sword-like; style 1 or stigmas sessile .....-> AGAVACEAE (2)
31' Lvs grass-like; styles 3 .....-> MELANTHIACEAE (_Xerophyllum_)
+ replaces lead 26. and couplets 27--30 as originally numbered in TJM2, but replaces lead 27. and couplets 28--31 after insertion of a new couplet 20 on 2012 03 27 and renumbering [in TJM2; not abbreviated in eFlora]
2015 03 12 [replaces correction made on 2014 12 04, which was: '(grass-like in _Kniphofia_)' added]
2019 01 15 [lead 28' made 28., and lead 28. made 28']

p. 94
KEY TO FAMILIES, Group 16
35. [36. in eFlora] Perianth parts scale-like, green to brown or +- purple-black or tinged +- red-purple
+ 'Perianth parts gen green to +- brown (red or white), scale-like' made 'Perianth parts scale-like, green to brown or +- purple-black or tinged +- red-purple'
2014 12 05

p. 94
KEY TO FAMILIES, Group 16
35' [36' in eFlora] Perianth parts petal-like, gen not green to brown or +- purple-black or tinged +- red-purple
+ 'Perianth parts petal-like in color and texture' made 'Perianth parts petal-like, gen not green to brown or +- purple-black or tinged +- red-purple' [in TJM2; not abbreviated in eFlora]
2014 12 04

p. 94
KEY TO FAMILIES, Group 16
39' [40' in eFlora] 40' Plant without onion odor; inflorescence bracts (2)3 or more, not wholly enclosing immature inflorescence, and some formed among pedicels; stems and leaves arising from corm .....-> THEMIDACEAE
+ 'inflorescence bracts 3 or more,' made 'inflorescence bracts (2)3 or more,'
2019 02 05

p. 95
KEY TO FAMILIES, Group 16
48' [49' in eFlora] Filaments glabrous (or expanded filament base puberulent)
+ '(or expanded filament base puberulent)' added
2012 03 27

p. 98
KEY TO FAMILIES, Group 19
16' True corolla present, not constricted above ovary, base not persistent as hardened or winged structure around ovary; stigmas, ovary chambers, and ovules > 1; fr various
+ 'frs' made 'fr'
2012 03 27
p2

p. 98
KEY TO FAMILIES, Group 19
31' Herb; flowers in scapose umbels, white to pink or purple; stems and leaves glabrous or glandular-hairy .....-> PRIMULACEAE (_Primula_)
+ '_Dodecatheon_' made '_Primula_'
2013 08 21

p. 99
KEY TO FAMILIES, Group 19
49. Stigma 1, gen undivided
+ 'gen' inserted
2013 02 28

p. 100
KEY TO FAMILIES, Group 19
55. Herb .....-> <sup>2</sup>GENTIANACEAE {G24}
+ pre-superscript 2 added
2012 03 27
p2

p. 100
KEY TO FAMILIES, Group 20
5. Main axis of leaf bearing many small leaflets or lobes in addition to main leaflets .....-> ROSACEAE (_Chamaebatia_)
+ '{G10,15,21,22,23}' made '(_Chamaebatia_)'
2013 08 21

p. 100
KEY TO FAMILIES, Group 20
10. Infl a raceme ..... RANUNCULACEAE (_Actaea_, _Consolida_)
10' Infl a cyme or fls solitary
11. Petals 5; sepals present in open fl ..... NITRARIACEAE {G22}
11' Petals 4 or 6 (very rarely 5); sepals deciduous as fl opens, 0 in open fl ..... PAPAVERACEAE (Papaveroideae) {G12,15,22,24}
+ replaces couplets 10--11 [in TJM2; not abbreviated in eFlora]
2013 08 21

p. 101
KEY TO FAMILIES, Group 20
17' Petals 4--6
+ '4 or 5' made '4--6'
2012 03 27

p. 101
KEY TO FAMILIES, Group 20
25. Petals 4; sepals 2 .....-> <sup>2</sup>PAPAVERACEAE (Fumarioideae)
+ pre-superscript 2 added
2013 08 21

p. 101
KEY TO FAMILIES, Group 20
36' Leaflets not gland-dotted; fruit a capsule, berry, or drupe
+ 'fruit a capsule or berry' made 'fruit a capsule, berry, or drupe'
2018 07 17

p. 102
KEY TO FAMILIES, Group 21
5. Ovary only 1/2 inferior, the free portion conic, esp in fr .....-> HYDRANGEACEAE (_Carpenteria_) {G16,22}
+ '{G22}' made '{G16,22}'
2012 03 27

p. 102
KEY TO FAMILIES, Group 21
8' Leaves alternate; fruit a pome .....-> ROSACEAE (2) {G10,15,20,22,23}
+ '{G10,15,20,22,23}' made '{G10,15,22,23}
2013 08 22

p. 103
KEY TO FAMILIES, Group 21
17. Stamens (4)5, free; leaves ovate or obovate to round, generally palmately 3--5-lobed, generally toothed; glands stalked or 0 .....-> GROSSULARIACEAE (2)
+ 'Stamens 5' made 'Stamens (4)5'
2015 02 11

p. 103
KEY TO FAMILIES, Group 21
19. Pl a non-desert, sprawling, woody vine (fl sts +- erect); lvs smooth, dark green, often palmately lobed; infl a cluster of umbels; fr a berry .....-> ARALIACEAE (_Hedera_)
+ commas added after 'non-desert' and 'sprawling'[comma after 'non-desert' still missing for second printing]
2012 03 27
p2

p. 103
KEY TO FAMILIES, Group 21
24. Leaves alternate; hypanthium well developed; fruit a pome .....-> ROSACEAE (2) {G10,15,22,23}
+ '{G10,15,20,22,23}' made '{G10,15,22,23}'
2013 08 22

p. 103
KEY TO FAMILIES, Group 22
4. Flowers +- radial; petals generally 5, oblanceolate to +- round, not recurved .....-> ROSACEAE (2) {G10,15, 21,23}
+ '{G10,15,20,21,23}' made '{G10,15,21,23}
2013 08 22

p. 103
KEY TO FAMILIES, Group 22
7. Sepals 2--3 (fused into conical cap in _Eschscholzia_), early-deciduous, 0 in open flower; latex generally present [at least in roots], generally milky or colored .....-> PAPAVERACEAE (Papaveroideae) {G12,15,20,24}
+ 'PAPAVERACEAE {G15,20,24}' made 'PAPAVERACEAE (Papaveroideae) {G12,15,20,24}'
2013 08 22

p. 104
KEY TO FAMILIES, Group 22
17. Shrub --- ovary actually 1/2 inferior but easily interpreted as superior .....-> HYDRANGEACEAE (_Carpenteria_) {G16,21}
+ '{G21}' made '{G16,21}'
2012 03 27

p. 104
KEY TO FAMILIES, Group 22
18. Hypanthium present .....-> ROSACEAE (2) {G10,15,21,23}
+ '{G10,15,20,21,23}' made '{G10,15,21,23}'
2013 08 22

p. 104
KEY TO FAMILIES, Group 23
4' Tree or large shrub; stigmas 2(3), +- sessile; ovary 2(3)-winged; mericarps winged, beaks 0 .....-> SAPINDACEAE (_Acer_) {G7,12}
+ 'beak' made 'beaks'
2012 03 27
p2

p. 104
KEY TO FAMILIES, Group 23
6. Stamens > in number than petals .....-> RUTACEAE (_Cneoridium_)
6' Stamens = in number to petals
7. Petals opposite stamens, gen +- cupped .....-> RHAMNACEAE {G12,21}
7' Petals alternate stamens, gen +- flat
8. Lvs opposite .....-> CELASTRACEAE
8' Lvs +- whorled at some nodes, alternate at others .....-> PITTOSPORACEAE
+ replaced couplets 6--8
2013 02 07

p. 105
KEY TO FAMILIES, Group 23
20. Hypanthium present, well developed, tubular or cup-shaped .....-> ROSACEAE {G10,15,21,22}
+ '{G10,15,20,21,22}' made '{G10,15,21,22}
2013 08 22

p. 105
KEY TO FAMILIES, Group 24
3' Lf peltate; ovary chambers 3, 1-seeded; fr breaking into 3 1-seeded mericarps .....-> TROPAEOLACEAE
+ 'one-seeded' made '1-seeded' in both places
2012 03 27
p2

p. 106
KEY TO FAMILIES, Group 24
22' Leaves not fleshy; sepals early-deciduous, 0 in open flower and fruit .....-> PAPAVERACEAE (Papaveroideae) {G12,15,20,22}
+ 'PAPAVERACEAE {G15,20,22}' made 'PAPAVERACEAE (Papaveroideae) {G12,15,20,22}'
2013 08 22

p. 107
KEY TO FAMILIES, Group 24
38. Sepals free or nearly so
39. Petals without fringed nectary pits .....-> CARYOPHYLLACEAE (4) {G6,8,15}
39' Base or center of each petal with 2 fringed nectary pits (sometimes appearing as 1 due to overlapping fringes) --- petals actually fused but easily misinterpreted as free .....-> GENTIANACEAE (_Swertia_)
38' Sepals evidently fused above base
40. Style 1, unbranched .....-> LYTHRACEAE (3) {G22}
40' Style or style branches >1
41. Leaf +- linear, acute .....-> CARYOPHYLLACEAE (4) {G6,8,15}
41' Leaf oblong to obovate, obtuse, margin often curled under and leaf appearing narrower .....-> FRANKENIACEAE (2)
+ leads 38. and 38' switched in position; couplet 40 renumbered 39; couplet 40 added; couplets 39, 40 stay numbered 39, 40; couplet 39 renumbered 41
2017 06 28

p. 107
KEY TO FAMILIES, Group 24
34' Leaves alternate, sometimes all basal
42. Style 1, unbranched .....-> LYTHRACEAE (3) {G22}
42' Styles, style branches, or sessile stigmas >= 2
43. Leaf linear, entire
44. Leaves cauline; flowers solitary or in racemes, panicles, or cymes .....-> LINACEAE (2)
44' Leaves all basal; flowers in scapose heads .....-> PLUMBAGINACEAE (_Armeria_)
43' Leaf wider, often toothed or lobed
45. Leaf covered with long, gland-tipped, insect-trapping hairs .....-> DROSERACEAE
45' Leaf without insect-trapping hairs
46. Styles, style branches, or stigmas 2--4
47. Flowers solitary; stamens alternating with toothed or fringed staminodes; stigmas 4 .....-> PARNASSIACEAE
47' Flowers 2--many; staminodes 0; stigmas 2--3
48. Annual; leaf veins pinnate or lateral veins obscure; hypanthium 0; ovary unlobed .....-> LINACEAE (2)
48' Perennial herb; leaf veins +- palmate; hypanthium present; ovary generally 2--3-lobed distally .....-> SAXIFRAGACEAE (2) {G10,20,21}
46' Styles or style branches 5 or more
49. Filaments fused in tube around style; petals thread-like .....-> MALVACEAE (_Ayenia_)
49' Filaments free or fused only at base; petals wider
50. Style elongating, forming a beak; fruit breaking into 5 one-seeded mericarps, each tipped with a coiled beak segment; flowers in umbels .....-> GERANIACEAE (2)
50' Styles not elongating and forming a beak; fruit not breaking into mericarps; flowers in a raceme, cyme, or panicle-like inflorescence
51. Sepals free, +- green; fruit a capsule, 5- or 10-seeded; flowers in a raceme or cyme .....-> LINACEAE (_Linum_)
51' Sepals fused, generally pink to blue; fruit indehiscent, 1-seeded; flowers in a panicle-like inflorescence .....-> PLUMBAGINACEAE (_Limonium_)
+ couplet 42 added; couplets 41 through 49 renumbered, each increased by 2
2017 06 28

p. 109
ISOETES howellii
ELEVATION: generally < 1500(2900) m.
+ '(2900)' added
2013 10 08

p. 109
ISOETES howellii
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaR, SNF, n SNH, GV, CCo, SnFrB, SCoR, SCo, PR;
+ 'n SNH,', 'CCo,' added 
2013 10 02

p. 109
ISOETES nuttallii
ELEVATION: generally < 1500(2760) m.
+ '(2760)' added
2013 10 08

p. 110
ISOETES orcuttii
BIOREGIONAL DISTRIBUTION: NCoRI, (Howell Mtn, Napa Co.), CaR, n&c SNF, SNH, GV, CCo, SnFrB, SCo, PR;
+ 'CaR, n&c SNF,' added, 'n&s SNH' made 'SNH,' 
2013 10 02

p. 110
LYCOPODIUM clavatum
BIOREGIONAL DISTRIBUTION: NCo, NCoRO;
+ ', NCoRO' added 
2015 04 14

p. 110
SELAGINELLACEAE
GENERA IN FAMILY: 1 genus, +- 700 spp.: worldwide, gen trop, warm temp.
+ '1 genus.' made '1 genus, +- 700 spp.: worldwide, gen trop, warm temp.'
2012 09 27

p. 110
SELAGINELLA
SPECIES IN GENUS: +- 700 spp.: worldwide, gen trop, warm temp.
+ '+- 700 spp.: worldwide, gen trop, warm temp.' deleted
2012 09 27

p. 111
SELAGINELLA bigelovii
BIOREGIONAL DISTRIBUTION: s NW, s SN, SnJV, CW, SW, sw edge DMoj;
+ 'SnJV,' added 
2013 10 16

p. 111
SELAGINELLA bigelovii
BIOREGIONAL DISTRIBUTION: s NW, s SN, SnJV, CW, SW, sw edge DMoj, DSon;
+ ', DSon' added 
2015 04 14

p. 111
SELAGINELLA hansenii
BIOREGIONAL DISTRIBUTION: s NCoRI, CaR, SN, ScV (Sutter Buttes), SnJV, n SCoR.
+ 'SnJV,' added 
2013 10 16

p. 111
SELAGINELLA wallacei
BIOREGIONAL DISTRIBUTION: NW, CaRF, n SNF (Butte Co.), n SNH, n SnFrB (Marin Co.);
+ 'CaRF,' added 
2013 10 16

p. 114
AZOLLA filiculoides
BIOREGIONAL DISTRIBUTION: CA-FP, GB, DMoj(?);
+ ', DMoj(?)' added 
2015 04 16

p. 115
AZOLLA filiculoides (bottom of page, middle figure, upper right)
+ 'staminate sporangium' made 'male sporangium'
2014 07 11

p. 117
DRYOPTERIS
2. Stipe generally > 1/3 leaf length; longest pinnae generally near blade base; veins into segment teeth, adaxially obscure; scales of pinna midribs lance-ovate to lanceolate; blade, indusial glands sparse to +- dense; blades thick; NW, SN, ScV, CW, SW, MP, s DMoj .....-> D. arguta
+ ', s DMoj' added 
2015 04 23

p. 117
DRYOPTERIS arguta
BIOREGIONAL DISTRIBUTION: NW, SN, ScV (Sutter Buttes), CW, SW, MP (caves in Lava Beds National Monument), s DMoj;
+ ', s DMoj' added 
2015 04 23

p. 117
POLYSTICHUM californicum
BIOREGIONAL DISTRIBUTION: NCoRI, NCoRO, s CaRF, SN (3 sites), CW (exc SCoRI), SnBr (1 site);
+ 'NCoRI,' added 
+ 's CaRF,' added 
2015 04 23

p. 117
POLYSTICHUM imbricans
NOTE: Some plants from Butte, Tehama cos. difficult to assign to subsp. Hybridizes with _Polystichum dudleyi_ (forming both sterile diploids and fertile allotetraploids called _Polystichum californicum_), _Polystichum lemmonii_ (forming fertile allopolyploids called _Polystichum scopulinum_), _Polystichum munitum_.
+ 'Hybridizes with _Polystichum dudleyi_ (called _Polystichum californicum_), _Polystichum lemmonii_ (called _Polystichum scopulinum_), _Polystichum munitum_.' made 'Hybridizes with _Polystichum dudleyi_ (forming both sterile diploids and fertile allotetraploids called _Polystichum californicum_), _Polystichum lemmonii_ (forming fertile allopolyploids called _Polystichum scopulinum_), _Polystichum munitum_.'  [in TJM2; not abbreviated in eFlora]
2015 10 21

p. 117
POLYSTICHUM imbricans subsp. imbricans
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaRH, n SNF, SNH, SnFrB, SCoRO, TR, PR, MP;
+ 'WTR' made 'TR' 
+ 'PR,' added 
2015 04 23

p. 118
POLYSTICHUM munitum
BIOREGIONAL DISTRIBUTION: NW, CaR, n SNF, n&s SNH, CW, n ChI, TR, MP (caves in Lava Beds National Monument);
+ 'TR,' added 
2015 04 23

p. 118
POLYSTICHUM munitum
BIOREGIONAL DISTRIBUTION: NW, n SNF, n&s SNH, CW, n ChI, TR, MP (caves in Lava Beds National Monument);
+ 'CaR,' deleted 
2015 08 26

p. 118
POLYSTICHUM scopulinum
BIOREGIONAL DISTRIBUTION: KR, NCoRO, NCoRH, CaRH, SNH, SnGb, SnBr, SnJt, MP, DMtns (Surprise Canyon, Panamint Range);
+ 'SnGb,' added 
2015 04 23

p. 118
EQUISETUM arvense
BIOREGIONAL DISTRIBUTION: NW (exc NCoRH), CaR, SN (exc Teh), GV, CCo, SnFrB, SCoRO, SW (exc ChI), MP, SNE, DMoj (exc DMtns);
+ 'CaRH' made 'CaR' 
+ 'SCoRO,' added 
+ 'W&I (White Mtns)' made 'SNE' 
2015 04 14

p. 118
EQUISETUM hyemale L. subsp. affine
BIOREGIONAL DISTRIBUTION: NCo, KR, NCoRH, NCoRO, CaR, SN (exc Teh), GV, CW (exc SCoRI), SW (exc s ChI), Wrn, SNE, D;
+ 'CaRH' made 'CaR' 
+ 'NCoRH,' added 
+ 'n&c SN, s SNH' made 'SN (exc Teh)' 
2015 04 14

p. 119
EQUISETUM laevigatum
BIOREGIONAL DISTRIBUTION: NW, CaR, SN (exc Teh), GV, CW (exc SCoRI), SW, GB (exc Wrn), D;
+ 'CaRH' made 'CaR' 
2015 04 14

p. 119
PILULARIA americana
BIOREGIONAL DISTRIBUTION: NCoRI, CaR, SNF, n SNH, GV, CCo, SnFrB, SCoR, SCo, WTR, PR, MP;
+ 'CCo,' added  
2015 04 23

p. 120
BOTRYCHIUM
10. Middle pinnae spreading, +- perpendicular to rachis; pinna texture delicate, outer margins gen finely crenate to dentate; basal sporophore branches often downturned, occurring in or near saturated substrate .....-> B. crenulatum (2)
+ 'outer margins finely toothed or crenulate' made 'outer margins gen finely crenate to dentate'
2012 10 05

p. 120
BOTRYCHIUM
10' Middle pinnae ascending; pinna texture firm, outer margins entire to wavy to coarsely toothed; basal sporophore branches gen not downturned
+ 'outer margin entire to wavy to coarsely toothed' made 'outer margins entire to wavy to coarsely toothed'
2012 10 05

p. 120
BOTRYCHIUM
13. Pinnae fan-shaped, texture delicate, deep green, outer margins gen finely crenate to dentate; occurring in or near saturated substrate .....-> B. crenulatum (2) (sun pls)
+ '; outer margins finely toothed or crenate' made ', outer margins gen finely crenate to dentate'
2012 10 05

p. 120
BOTRYCHIUM
13' Pinnae oblong or rounded without a sharp angle between side and outer margin, texture thick, yellow-green, outer margins entire or shallowly cleft; occurring in well-drained sites .....-> B. tunux
+ '; outer margin entire or shallowly cleft' made ', outer margins entire or shallowly cleft'
2012 10 05

p. 122
BOTRYCHIUM paradoxum
ELEVATION: +- 4000 m.
+ '4000--4200' made  '+- 4000'
2012 08 21

p. 123
OPHIOGLOSSUM californicum
BIOREGIONAL DISTRIBUTION: n&c SNF, GV, CCo, SCo, sw PR;
+ 'SnJV' made 'GV' 
+ ', sw PR' added 
2015 04 23

p. 124
POLYPODIUM scouleri
BIOREGIONAL DISTRIBUTION: NCo, NCoRO, CCo, SnFrB, SCo;
+ 'NCo, NCoRO, CCo, SnFrB, SCo, n ChI;' made 'NCo, NCoRO, CCo, SnFrB, SCo;' 
2013 02 01

p. 124
PTERIDACEAE
TJM2 AUTHOR: Ruth E.B. Kirkpatrick, Alan R. Smith & Thomas Lemieux, except as noted
+ ', except as noted' added
2012 09 24

p. 125
ADIANTUM aleuticum
BIOREGIONAL DISTRIBUTION: NW, CaR, SNH, CCo, SnFrB, SCoRO, n ChI, TR, SnJt;
+ 'CCo,' added  
2015 04 16

p. 125
ADIANTUM capillus-veneris
BIOREGIONAL DISTRIBUTION: NCoR, CaRF, n SNF, s SNH, SnJV, CCo, SCoRO, SW, GB, D;
+ 'SW (exc SCo),' made 'SW,' 
2015 04 16

p. 125
ADIANTUM capillus-veneris
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaRF, n SNF, s SNH, SnJV, CCo, SCoRO, SW, GB, D;
+ 'KR,' added 
2015 06 12

p. 127
+ added to plate were 'Polypodiaceae', bottom left (beginning under Polypodium calirhiza), and 'Pteridaceae', bottom right (beginning under Adiantum capillus-veneris)
2012 03 27

p. 128 
(superseded by Supplement II)
CHEILANTHES clevelandii 
BIOREGIONAL DISTRIBUTION: SCo, n ChI, PR;
+ 'N ChI' made 'n ChI' 
+ 'SCo,' added 
2015 04 22

p. 128 
(superseded by Supplement II)
CHEILANTHES clevelandii 
NOTE: n ChI pls more robust, with more highly dissected segment scales.
+ 'N ChI' made 'n ChI' 
2015 04 22

p. 128
(superseded by Supplement II)
CHEILANTHES cooperae
BIOREGIONAL DISTRIBUTION: KR, NCoRI, SN, SnFrB, SCoRO, SCo (Slover Mtn, San Bernardino Co.), TR.
+ 'KR,' added 
+ 'CaR,' deleted 
2015 06 16

p. 128
(superseded by Supplement II)
CHEILANTHES covillei 
BIOREGIONAL DISTRIBUTION: NCoR, SN, ScV (Sutter Buttes), SnFrB, SCoR, SCo(?), TR, PR, SNE, DMtns;
+ 'SCo(?),' added 
2015 04 22

p. 128
(superseded by Supplement II)
CHEILANTHES covillei
BIOREGIONAL DISTRIBUTION: NCoR, SN, ScV (Sutter Buttes), SnFrB, SCoR, e SCo, TR, PR, SNE, w edge DMoj, DMtns, w DSon;
+ 'SCo(?)' made 'e SCo'
+ 'w edge DMoj,' added
+ ', w DSon' added
2016 05 24

p. 128
(superseded by Supplement II)
CHEILANTHES intertexta 
BIOREGIONAL DISTRIBUTION: NCoR, SNH, SnFrB, SCoR, SnBr(?), MP, W&I;
+ 'NCoRO, NCoRH,' made 'NCoR,' 
+ 'SnBr(?),' added 
2015 04 22

p. 129
(superseded by Supplement II)
CHEILANTHES viscida 
BIOREGIONAL DISTRIBUTION: e edge SnBr, e PR (incl SnJt), DMoj, w edge DSon;
+ 'e edge SnBr, e PR, DMtns, w edge DSon' made 'e edge SnBr, e PR (incl SnJt), DMoj, w edge DSon' 
2014 08 05

p. 129
CRYPTOGRAMMA
TJM2 AUTHOR: Ruth E.B. Kirkpatrick, Alan R. Smith, Thomas Lemieux & Edward Alverson
+ TJM2 authors added
2012 09 24

p. 129
NOTHOLAENA californica
BIOREGIONAL DISTRIBUTION: SCo, s ChI, TR, PR, DMtns, DSon;
+ 'SnGb, SnBr,' made 'TR,' 
+ 'SCo,' added 
2015 04 22

p. 129
NOTHOLAENA californica
BIOREGIONAL DISTRIBUTION: SCo, s ChI, TR, PR, DSon;
+ 'DMtns,' deleted
2019 04 16

p. 130
PELLAEA breweri
BIOREGIONAL DISTRIBUTION: KR, CaRH, SNH, SnBr, GB, DMtns;
+ 'SnBr,' added 
2015 04 23

p. 130
PELLAEA mucronata var. mucronata
BIOREGIONAL DISTRIBUTION: NCoR, CaR, SN, GV (Sutter Buttes), CW, SW, SNE, DMoj (desert mtns and lower montane slopes, canyons);
+ 'DMtns' made 'DMoj (desert mtns and lower montane slopes, canyons)' 
2014 08 15

p. 130
PELLAEA mucronata var. mucronata
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaR, SN, GV (Sutter Buttes), CW, SW, SNE, DMoj (desert mtns and lower montane slopes, canyons);
+ 'KR,' added 
2015 08 25

p. 130
PENTAGRAMMA
1. Stipe dark brown to generally +- black; leaf blade adaxially with white exudate; CaRF, SN, ScV(?), SCoRI .....-> P. pallida
+ 'CaRF,' added 
+ 'ScV(?),' added 
2015 04 23

p. 130
PENTAGRAMMA pallida
BIOREGIONAL DISTRIBUTION: CaRF, SN, ScV(?), SCoRI.
+ 'CaRF,' added 
+ 'ScV(?),' added 
2015 04 23

p. 133
WOODSIACEAE
2' Indusium cup-like, of many segmented hair- or scale-like fragments or lobes encircling sorus from below, often obscure in age; pinnae sides +- equal; lf, blade axes abaxially with (without) short-stalked glands or gland-tipped hairs 0.1--1 mm .....-> WOODSIA
+ 'Indusia cup-like' made 'Indusium cup-like'
2012 09 26

p. 134
ATHYRIUM filix-femina (L.) Roth var. cyclosorum
BIOREGIONAL DISTRIBUTION: CA-FP (exc Teh, ScV, SCoRI, SCo, WTR, PR exc SnJt), MP;
+ 'PR' made 'PR exc SnJt' 
2015 04 16

p. 134
CYSTOPTERIS fragilis
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaR, n&c SNF, SNH, Teh, SnFrB, SCoR, n ChI (Santa Cruz Island), TR, PR, GB, DMtns;
+ 'n ChI (Santa Cruz Island),' added 
+ 'Teh,' added 
2015 04 16

p. 139
JUNIPERUS californica
BIOREGIONAL DISTRIBUTION: NCoRI, SNF, ScV (Sutter Buttes), SnFrB, SCoR, TR, PR, D;
+ 'DMtns' made 'D' 
2014 08 15

p. 139
SEQUOIA sempervirens
BIOREGIONAL DISTRIBUTION: NCo, w KR, NCoRO, w NCoRI, n&c CCo, SnFrB, n SCoRO;
+ 'NCo,' added
2017 08 16

p. 139
SEQUOIADENDRON giganteum
BIOREGIONAL DISTRIBUTION: SNH, probably naturalizing in nw SnJt (nw Black Mtn).
+ 'SNH.' made 'SNH, probably naturalizing in nw SnJt (nw Black Mtn).' 
2012 11 07

p. 139
SEQUOIADENDRON giganteum
BIOREGIONAL DISTRIBUTION: SNH, naturalized in northwestern San Jacinto Mountains (Black Mountain), possibly naturalizing in San Gabriel Mountains, San Bernardino Mountains.
+ 'SNH, probably naturalizing in nw SnJt (nw Black Mtn).' made 'SNH, naturalized in northwestern San Jacinto Mountains (Black Mountain), possibly naturalizing in San Gabriel Mountains, San Bernardino Mountains.' 
2014 04 09

p. 139
SEQUOIADENDRON giganteum
UNABRIDGED NOTE: Schmid & Schmid (2011. Madrono 58:202-203; 2012. Aliso 30:19-32) rigorously documented that at least 157 pls (seedlings to saplings), some up to 30 yrs old (although not yet reproducing), on nw flank of Black Mtn, nw SnJt, have descended naturally from plantings made nearby in 1974, and suggested that the same may occur from planted pls that are persisting in SnGB, SnBr. 
+ 'Schmid & Schmid (2011. Madrono 58:202-203; 2012. Aliso 30:19-32) rigorously documented that at least 157 pls (seedlings to saplings), some up to 30 yrs old (although not yet reproducing), on nw flank of Black Mtn, nw SnJt, have descended naturally from plantings made nearby in 1974, and suggested that the same may occur from planted pls that are persisting in SnGB, SnBr.' added [in eFlora; no unabridged notes in TJM2]
2012 11 07

p. 139
SEQUOIADENDRON giganteum
UNABRIDGED NOTE: Schmid & Schmid (2011. Madro&ntilde;o 58:202-203; 2012. Aliso 30:19-32) rigorously documented that at least 157 plants (seedlings to saplings), some up to 40 years old (and reproducing), on northwestern flank of Black Mountain, northwestern San Jacinto Mountains, have descended naturally from plantings made nearby in 1974, and suggested that the same may occur from planted plants that are persisting in San Gabriel Mountains, San Bernardino Mountains.
+ 'some up to 30 years old (although not yet reproducing),' made 'some up to 40 years old (and reproducing),' [in eFlora; no unabridged notes in TJM2]
2014 04 09

p. 142
EPHEDRA viridis
BIOREGIONAL DISTRIBUTION: s SNF, c SNH (e edge), s SNH, Teh, SnJV, SCoR, TR, SnJt, PR exc SnJt (se corner), GB, DMoj, DSon (n&e edge);
+ 's SNF, Teh, SnJV, SCoR, TR, SnJt, GB, DMtns;' made 's SNF, c SNH (e edge), s SNH, Teh, SnJV, SCoR, TR, SnJt, PR exc SnJt (se corner), GB, DMoj, DSon (n&e edge);
2017 08 16

p. 145
PINUS contorta
STEM: mature bark scaly, thin; trunk < 34 m (extremely variable at maturity).
+ 'trunk 2--34 m' made 'trunk < 34 m'
2015 10 27

p. 145
PINUS coulteri
STEM: trunk < 42 m, < 1.5 m wide; young bark dark brown to +- black, with irregular furrows, mature with +- yellow plates; mature crown branches thick, lower reaching ground or not.
+ 'trunk < 42 m, 1.5 m wide' made 'trunk < 42 m, < 1.5 m wide'
2015 10 27

p. 145
PINUS flexilis
STEM: trunk < 20 m, < 2.9 m wide; mature bark dark brown, deep-furrowed, in rectangular plates; mature crown branches reaching ground or not.
+ 'trunk < 20 m, 2.9 m wide' made 'trunk < 20 m, < 2.9 m wide
2015 10 27

p. 145
PINUS jeffreyi
STEM: trunk < 53 m, < 2.3 m wide; mature bark gen red-brown, furrows close-spaced, deep, outer scales with +- pink inner surfaces, crevices with definite odor of vanilla/banana, esp on warm days; mature crown rounded; buds not resinous, scales light brown, white-hairy.
+ 'trunk < 53 m, 2.3 m wide' made 'trunk < 53 m, < 2.3 m wide'
2015 10 27

p. 145
PINUS ponderosa
STEM: trunk gen < 68 m, gen < 2.2 m wide; branched in lower 1/2 when mature or not; mature bark furrows shallow, well spaced, forming plates, outer scales with +- yellow inner surfaces; mature crown short, conic or flat-topped; buds resinous, scales red-brown, dark-hairy.
+ 'trunk gen < 68 m, gen 2.2 m wide' made 'trunk gen < 68 m, gen < 2.2 m wide'  [in TJM2; not abbreviated in eFlora] 
2015 10 27

p. 146
PINUS ponderosa var. pacifica
LEAF: 15--28 cm, thin, deep green, shiny, not glaucous; sheath persistent?.
+ 'thin, not glaucous, deep green, shiny, not glaucous;' made 'thin, deep green, shiny, not glaucous;'
2018 05 29

p. 146
PINUS ponderosa var. pacifica
NOTE: Some very large-coned plants in Santa Cruz Mountains ...
+ 'larged-coned' made 'large-coned'
2013 07 31

p. 146
PINUS quadrifolia
STEM: trunk < 16 m, < 70 cm wide; mature bark red-brown.
+ 'trunk < 16 m, 70 cm wide' made 'trunk < 16 m, < 70 cm wide'
2015 10 27

p. 146
PINUS torreyana subsp. torreyana
STEM: trunk < 23 m; mature crown +- open, generally taller than wide on sheltered pls, branches well-spaced.
+ 'trunk < 23' made 'trunk < 23 m'
2015 10 27

p. 148
TORREYA californica
BIOREGIONAL DISTRIBUTION: NCo, NCoR, CaR, SN, CCo, SnFrB, SCoR.
+ 'CaRF' made 'CaR', 'CCo' added  
2013 09 30

p. 151
BRASENIA schreberi
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaRH, SNH, ScV, MP (exc Wrn);
+ 'KR,' added 
2015 06 12

p. 152
NYMPHAEA odorata
BIOREGIONAL DISTRIBUTION: CaRF, n SNF, SNH (Lake Tahoe), ScV (Butte Co.), SnGb, expected elsewhere;
+ 'CaRF, n SNF,' added  
2013 10 01

p. 153
ARISTOLOCHIA californica
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaR, n&c SNF, ScV, n SnJV, CCo, SnFrB, n SCoRO.
+ 'KR,' added, 'CaRF' made 'CaR'  
2013 09 30

p. 153
ARISTOLOCHIA californica
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaRF, n&c SNF, ScV, n SnJV, CCo, SnFrB, n SCoRO.
+ 'CaR' made 'CaRF' 
2015 06 12

p. 153
ASARUM caudatum
BIOREGIONAL DISTRIBUTION: NW, CaRH, CCo, SnFrB;
+ 'CCo' added  
2013 09 30

p. 155
UMBELLULARIA californica
BIOREGIONAL DISTRIBUTION: NW, CaRF, SNF, SNH, ScV (Sutter Buttes), deltaic SnJV, CCo, SnFrB, SCoRO, SCoRI, SCo, scattered TR, PR;
+ 'SNH,', 'deltaic SnJV, CCo,', 'SCoRI, SCo,' added 
2013 09 30

p. 155
ANEMOPSIS californica
BIOREGIONAL DISTRIBUTION: CaRH, s SN, Teh(?), sw ScV, SnJV, CW, SCo, ChI, WTR, SnGb(?), SnBr(?), PR, SNE, DMoj, DSon(?);
+ 'Teh(?),', 'WTR, SnGb(?), SnBr(?),', ', DSon(?)' added 
2013 10 07

p. 159
AVICENNIA
FRUIT: ellipsoid to ovoid, often asymmetric, 1-chambered, gen indehiscent; stalk not flat.
+ 'elipsoid' made 'ellipsoid'
2012 03 27
p2

p. 160
JUSTICIA californica
BIOREGIONAL DISTRIBUTION: e PR, D;
+ 'w PR (San Diego River e of Wildcat Canyon), DSon' made 'e PR, D' 
2013 10 04

p. 162
CONICOSIA
HABIT+: Perennial herb, generally short-lived; roots diffuse or tuberous.
+ 'short lived' made 'short-lived'
2013 07 31

p. 163
TETRAGONIA tetragonoides
+ 'tetragonioides' made 'tetragonoides'
2014 05 20

p. 164
AMARANTHACEAE
NOTE: Amaranthaceae including Chenopodiaceae by some. Polycnemoideae, represented in California by _Nitrophila_, formerly considered subfamily of Chenopodiaceae, but needs further research. _Guilleminea densa_ (Willd.) Moq. var. _aggregata_ Uline & W.L. Bray is a waif. _Froelichia gracilis_ (Hook.) Moq. possibly naturalized.
+ '_Froelichia gracilis_ (Hook.) Moq. is an historical waif.' made '_Froelichia gracilis_ (Hook.) Moq. possibly naturalized.'
2016 06 26

p. 166
AMARANTHUS
SPECIES IN GENUS: +- 70 spp.: worldwide; weeds, ornamentals, food pls.
NOTE: Hybrids common, F1 gen with numerous, densely packed bractlets beneath gen sterile pistillate fls, abnormal-shaped infl with dense, twisted or fan-shaped branches. Unless otherwise noted, descriptions of bracts and fl parts are of pistillate fls.
+ 'weeds, ornamentals, food pls' moved to correct position, from NOTE to SPECIES IN GENUS
2012 03 27
p2

p. 167
AMARANTHUS retroflexus
LEAF: petiole 25--80 mm; blade 20--150 mm, 10--70 mm wide, ovate to rhombic-ovate, base wedge-shaped, tip obtuse to acute.
+ 'blade 20--150 cm, 10--70 cm wide' made 'blade 20--150 mm, 10--70 mm wide'
2017 08 22

p. 170
ANACARDIACEAE
FRUIT: drupe, generally +- flat, sticky or not, hairs short or 0; pulp +- resinous, aromatic or not.
+ 'drupe-like' made 'drupe'
2018 07 17

p. 171
RHUS aromatica
BIOREGIONAL DISTRIBUTION: CA-FP, DMoj (exc c), n DSon;
+ 'CA-FP, DMtns' made 'CA-FP, DMoj (exc c), n DSon' 
2014 08 05

p. 171
RHUS integrifolia
TAXON AUTHOR: (Nutt.) Benth. & Hook. f. ex W.H. Brewer & S. Watson
+ 'ex Rothr.' made 'ex W.H. Brewer & S. Watson'
2019 02 26

p. 171
SCHINUS
FRUIT: spheric, leathery, shiny, generally pink to red; pulp resinous to oily, aromatic.
+ 'drupe,' deleted
2018 07 17

p. 175
ANGELICA hendersonii
UNABRIDGED SYNONYMS: Angelica tomentosa var. hendersonii (J.M. Coult. & Rose) DiTomaso
+ 'hendersoni' made 'hendersonii' [in eFlora; unabridged synonyms not in TJM2]
2013 03 28

p. 176
CICUTA
1. Fr gen round, rib width >> intervals between; areas defined by major veinlets on abaxial lf surface large, gen elongate .....-> C. douglasii
+ 'areas surrounded by veins on abaxial lf surface rough-textured, gen some elongate' made 'areas defined by major veinlets on abaxial lf surface large, gen elongate' [in TJM2; not abbreviated in eFlora]
2015 12 16 [correction of correction made 2015 12 10]

p. 176
CICUTA
1' Fr gen ovate, rib width gen <= intervals between; areas defined by major veinlets on abaxial lf surface small, gen +- circular or +- square, less often +- elongate .....-> C. maculata
+ 'areas surrounded by veins on abaxial lf surface smooth, gen rounded or square' made 'areas defined by major veinlets on abaxial lf surface small, gen +- circular or +- square, less often +- elongate' [in TJM2; not abbreviated in eFlora]
2015 12 16 [correction of correction made 2015 12 10]

p. 176
CICUTA douglasii
LEAF: 1.5--4.5 dm, narrowly ovate to triangular-ovate, 1--2(3)-pinnate; lflets 1--10(15) cm, linear to widely lanceolate, acute or acuminate, +- entire to coarsely serrate, areas defined by major veinlets on abaxial surface large, gen elongate.
+ 'areas surrounded by veins on abaxial surface rough-textured, gen some elongate' made 'areas defined by major veinlets on abaxial surface large, gen elongate' [in TJM2; not abbreviated in eFlora]
2015 12 16 [correction of correction made 2015 12 10]

p. 176
CICUTA douglasii
BIOREGIONAL DISTRIBUTION: KR, NCo, NCoRH, NCoRI, CaRH, s SNF, SNH, CCo, SCo, GB;
+ 'KR,' added 
2015 06 16

p. 176
CICUTA maculata
LEAF: 1--4 dm, ovate to triangular-ovate, 1--2-pinnate; leaflets 2--10 cm, lanceolate, acute or acuminate, coarsely to sparsely serrate, areas defined by major veinlets on abaxial surface small, gen +- circular or +- square, less often +- elongate.
+ 'areas surrounded by veins on abaxial surface smooth, gen rounded or square' made 'areas defined by major veinlets on abaxial surface small, gen +- circular or +- square, less often +- elongate' [in TJM2; not abbreviated in eFlora]
2015 12 16 [correction of correction made 2015 12 10]

p. 176
CONIOSELINUM pacificum
HABIT+: Plant 3--15 dm.
+ '10--40' made '3--15'
2018 06 05

p. 178
CONIUM maculatum
BIOREGIONAL DISTRIBUTION: CA-FP, GB (uncommon);
+ 'uncommon GB' made 'GB (uncommon)'
2015 12 17

p. 187
LOMATIUM
45' Leaf green, shiny, petiole sheathing to +- middle; bractlets free, inconspicuous; KR .....-> L. hallii
+ '45.' made '45'' [leads of couplet reversed to accomplish alphabetization after epithet change from 'plummerae' to 'austiniae'. Couplet 43 in TJM2.]
2018 04 24

p. 187
LOMATIUM
45. Leaf +- gray, dull, petiole +- sheathing throughout; bractlets fused at base into 1-sided scarious cup; CaRH, n SNH, GB .....-> L. austiniae
+ '45'' made '45.'  [leads of couplet reversed to accomplish alphabetization after epithet change from 'plummerae' to 'austiniae'. Couplet 43 in TJM2.]
+ 'plummerae' made 'austiniae'
2018 04 24

p. 187
LOMATIUM
50. Corolla yellow; KR, CaRF, NCoRI, n&c SNF, n SNH, ScV .....-> var. marginatum
+ 'interior foothills' made 'KR, CaRF, NCoRI, n&c SNF, n SNH, ScV' 
2015 08 31

p. 187
LOMATIUM
50' Corolla +- red-purple; NCoR .....-> var. purpureum
+ 'coast ranges' made 'NCoR' 
2015 08 31

p. 187
LOMATIUM bicolor (S. Watson) J.M. Coult. & Rose var. leptocarpum
BIOREGIONAL DISTRIBUTION: KR, CaRH, MP;
+ 'KR,' added 
2015 08 19

p. 188
LOMATIUM caruifolium var. caruifolium
BIOREGIONAL DISTRIBUTION: NCoR (Mendocino Co.), c&s SNF, CCo, SnFrB, SCoR, ChI.
+ 'CCo,' added 
2012 10 15

p. 188
LOMATIUM caruifolium var. denticulatum
BIOREGIONAL DISTRIBUTION: KR, NCoRH, CaRF, ScV.
+ 'KR,' added 
2015 08 19

p. 189
LOMATIUM marginatum var. marginatum
BIOREGIONAL DISTRIBUTION: KR, CaRF, NCoRI, n&c SNF, n SNH, ScV.
+ 'CaR' made 'CaRF'; 'NCoRI,' added; 'n SNH,' added 
2015 08 19

p. 190
LOMATIUM austiniae
+'plummerae' made 'austiniae' [treatment moved to accomplish alphabetization, to position before Lomatium bicolor, p. 187]
UNABRIDGED SYNONYMS: Lomatium plummerae (J.M. Coult. & Rose) J.M. Coult. & Rose; Lomatium plummerae var. austiniae (J.M. Coult. & Rose) Mathias; Lomatium plummerae var. sonnei (J.M. Coult. & Rose) Jeps.
+ 'Lomatium plummerae (J.M. Coult. & Rose) J.M. Coult. & Rose;' added
2018 04 24

p. 190 [location or approximate location where treatment would have appeared in TJM2 had the vars. been included by then] (added to flora in Supplement V)
LOMATIUM ravenii var. paiutense
BIOREGIONAL DISTRIBUTION: e MP exc Wrn (eastern Lassen Co., southeastern Modoc Co.);
+ 'exc Wrn' added [in eFlora; statement in TJM2, for LOMATIUM ravenii (no infraspecific taxa recognized), edited to say 'e MP exc Wrn (e Lassen Co., se Modoc Co.)'
2018 01 23

p. 190 [location or approximate location where treatment would have appeared in TJM2 had the vars. been included by then] (added to flora in Supplement V)
LOMATIUM ravenii var. ravenii
BIOREGIONAL DISTRIBUTION: e MP exc Wrn (Ravendale vicinity and Painters Flat, eastern Lassen Co.).
+ 'exc Wrn' added [in eFlora; statement in TJM2, for LOMATIUM ravenii (no infraspecific taxa recognized), edited to say 'e MP exc Wrn (e Lassen Co., se Modoc Co.)'
2018 01 23

p. 190
LOMATIUM tracyi
LEAF: petiole 2.5--8 cm, scarious, gen sheathing throughout; blade 4.5--10 cm, oblong to ovate, ternate-pinnately or 2-pinnately dissected, segments 1--7 mm, thread-like to oblong, acute or obtuse, gen overlapping.
+ 'petiole 2.5--8, scarious' made 'petiole 2.5--8 cm, scarious'
2012 09 25

p. 193
OREONANA vestita
FLOWERING TIME: Mar--Jul
+ 'Jun--Jul' made 'Mar--Jul'
2012 04 11

p. 199
SANICULA saxatilis
BIOREGIONAL DISTRIBUTION: e&s SnFrB (Mount Diablo, Contra Costa Co.; Mount Hamilton, Mount Umunhum, Santa Clara Co.).
+ 'Mount Umunhum,' added
2018 08 28

p. 199
SANICULA tuberosa
BIOREGIONAL DISTRIBUTION: NW, CaR, SN, ScV (Sutter Buttes), SnFrB, SCoR, TR, PR;
+ 'NCo, NCoR' made 'NW'; 'WTR' made 'TR' 
2015 08 26

p. 199 [page number in TJM2 where SPHENOSCIADIUM capitellatum A. Gray is treated; in eFlora, taxon is treated as ANGELICA capitellata]
SPHENOSCIADIUM capitellatum
BIOREGIONAL DISTRIBUTION: NCoRH, CaR, SNH, TR, PR, GB;
+ 'NCoRI' made 'NCoRH'
2018 01 31

p. 200
TAUSCHIA howellii
BIOREGIONAL DISTRIBUTION: KR (Salmon Mtns), n SNH;
+ 'KR (Salmon Mtns);' made 'KR (Salmon Mtns), n SNH;' 
2012 06 29

p. 200
TAUSCHIA kelloggii
BIOREGIONAL DISTRIBUTION: NW, s CaR, n SN, ScV (Sutter Buttes), n CCo, SnFrB;
+ 'NCo, NCoR' made 'NW'; 'n SNF' made 'n SN';  'ScV (Sutter Buttes),' added 
2015 08 26

p. 203 
(superseded by Supplement I)
APOCYNUM
COMMON NAME: DOGBANE
+ ', INDIAN HEMP' deleted
2017 06 22

p. 203 
(superseded by Supplement I)
APOCYNUM cannabinum
COMMON NAME: HEMP DOGBANE
+ 'INDIAN HEMP' made 'HEMP DOGBANE'
2017 06 22

p. 203 
(superseded by Supplement I)
ASCLEPIAS
NOTE: Fresh fls gen better for determining relative positions of parts; hoods may have near anther head 2 +- sickle shaped lobes each that may +- resemble horns. _A. linaria_ not outside cultivation in CA, so deleted here; previous inclusion in TJM2 (2012) based on faulty locality data.
+ '_A. linaria_ not outside cultivation in CA, so deleted here; previous inclusion in TJM2 (2012) based on faulty locality data.' added
2012 11 05

p. 204 
(superseded by Supplement I)
ASCLEPIAS
14' Leaves elliptic, lanceolate, or ovate, tip obtuse to acuminate
+ 'tip acute to acuminate' made 'tip obtuse acuminate' [in 14' of TJM2; in 13' of Supplement I and eFlora]
2014 06 30

p. 204 
(superseded by Supplement I)
ASCLEPIAS cordifolia  
BIOREGIONAL DISTRIBUTION: NW, CaR, SN, ScV (Sutter Buttes), CCo, n SnFrB, MP;
+ ', n SnFrB, MP' added 
2014 07 30

p. 204 
(superseded by Supplement I)
ASCLEPIAS eriocarpa
LEAF: opposite or whorled in 3s or 4s; petiole short to 0; blade elliptic, lanceolate, or ovate, base tapered to obtuse (to cordate), tip obtuse to short-acuminate, margins generally not wavy, generally entire.
+ 'tip obtuse to short-acuminate,' added 
2014 06 30

p. 206
(superseded by Supplement I)
ASCLEPIAS fascicularis 
BIOREGIONAL DISTRIBUTION: CA (exc NCo, n CCo);
+ 'CA (exc NCo, CCo, SCo)' made 'CA (exc NCo, n CCo)' 
2014 07 29

p. 206 
(superseded by Supplement I)
ASCLEPIAS linaria
BIOREGIONAL DISTRIBUTION: D (excluded from CA in note under genus);
'(excluded from CA in note under genus)' added [in TJM2]
2012 11 05

p. 208
ILEX aquifolium
BIOREGIONAL DISTRIBUTION: NCo, KR?, NCoRO, CCo, SnFrB, expected elsewhere;
+ 'KR?, NCoRO,' added 
2013 10 04

p. 210
HEDERA canariensis
DISTRIBUTION OUTSIDE CALIFORNIA: widely cultivated, native to Macaronesia, northern Africa.
+ 'Macronesia' made 'Macaronesia'
2013 07 31

p. 210
HEDERA helix
TOXICITY: Sap can cause contact dermatitis; berries and lvs TOXIC when eaten.
+ 'Sap' capitalized
2012 03 27
p2

p. 211
ASTERACEAE, Key to Groups
5' Receptacle bristly or bearing long, bristle-like scales (free or fused at base) .....-> Group 4
+ 'of long, bristle-like scales' made 'bearing long, bristle-like scales'
2013 11 15

p. 214
ASTERACEAE, Group 3
5' Lf linear or dissected into linear lobes .....-> [THELESPERMA]
+ '[Thelesperma megapotamicum]' made '[THELESPERMA]'
2012 03 27

p. 217
ASTERACEAE, Group 6
35. Fls 2(3); ann; pappus bristles plumose .....-> DIMERESIA
35' Fls 10--many; per; pappus bristles minutely barbed
36. Abaxial lf face glabrous or glandular to short bristly .....-> AGERATINA (2)
36' Abaxial lf face white-tomentose .....-> LUINA
+ key to members of Asteraceae, Group 6, couplet 35, replaced with the above [in TJM2; not abbreviated in eFlora, where "per" expanded to "perennial herb"], couplets previously numbered 36--64 renumbered, with 1 added to each
2013 08 08

p. 218
ASTERACEAE, Group 6
66. Distal lf blades 1.5--4 cm; phyllary tips green or red .....-> PACKERA {G15}
66' Distal lf blades 6--25 cm; phyllary tips black or green .....-> SENECIO (2) {G2,15}
+ key to members of Asteraceae, Group 6, couplets 65 and 66, replaced with the above [in TJM2; not abbreviated in eFlora], couplet previously numbered 65 removed, couplet previously numbered 66 still numbered 66 due to insertion of 1 couplet under couplet previously numbered 35
2013 08 08 

p. 220
ASTERACEAE, Group 8
26. Corollas white, cream, pink, or lavender
+ 'Corollas white to pink or lavender' made 'Corollas white, cream, pink, or lavender'
2018 05 29

p. 220
ASTERACEAE, Group 8
27. Fruit beaked; corollas white or cream, often rose-tinged .....-> RAFINESQUIA
+ 'corollas white or cream, sometimes red-veined' made 'corollas white or cream, often rose-tinged'
2018 05 29

p. 220
ASTERACEAE, Group 8
27' Fruit beak 0; corollas lavender, pink, or white .....-> STEPHANOMERIA
+ 'corollas pink to pale lavender' made 'corollas lavender, pink, or white'
2018 05 29

p. 222
ASTERACEAE, Group 11
15' Lvs opposite; ray fls sterile .....-> COREOPSIS
+ '.....-> COREOPSIS' added; couplet 16 deleted, couplets after 10' reduced in number by one (10' stays 10')
2012 03 27

p. 224
ASTERACEAE, Group 12
21. Lf 1--3-pinnately dissected; heads few to many in rounded to +- flat-topped clusters
+ 'short-peduncled,' deleted
2012 03 27

p. 224
ASTERACEAE, Group 12
21' Lf entire, serrate, or pinnately lobed; heads solitary or few in open, cyme-like cluster
+ 'serrate or pinnately' made 'serrate, or pinnately'; '+- long-peduncled,' deleted
2012 03 27 ['+- long-peduncled,' deleted from eFlora on 2012 03 27, but it was not actually deleted from this page until 2014 04 10]

p. 224
ASTERACEAE, Group 12
40. Lvs glabrous or sparsely tomentose; involucre gen 5--9 mm .....-> BLENNOSPERMA (2)
+ 'Involucre gen 5--9 mm; lvs glabrous or sparsely tomentose' made 'Lvs glabrous or sparsely tomentose; involucre gen 5--9 mm' [in TJM2; not abbreviated in eFlora]
2013 11 15

p. 224
ASTERACEAE, Group 12
40' Lvs puberulent and/or glandular; involucre 7--20 mm
+ 'Involucre 10--20 mm; lvs puberulent and/or glandular' made 'Lvs puberulent and/or glandular; involucre 7--20 mm'  [in TJM2; not abbreviated in eFlora]
2013 11 15

p. 230
ACHILLEA millefolium
CHROMOSOMES: 2n=[18,27],36,45,54,[63,72].
+ '2n=[18,27]36,45,54,63,72.' made '2n=[18,27],36,45,54,[63,72].'
2013 07 31

p. 232
AGERATINA shastensis
BIOREGIONAL DISTRIBUTION: KR.
+ 'CaR' made 'KR'  
2015 06 12

p. 234
AGOSERIS apargioides var. maritima
TAXON AUTHOR: (E. Sheld.) Cronquist
+ 'G. I. Baird' made 'Cronquist'
2012 08 09

p. 238 [location or approximate location where note would appear in TJM2 were it not unabridged and therefore only in eFlora]
AMBROSIA
UNABRIDGED NOTE: Spines of bur derived from paleae, not phyllaries.
+ 'paleas' made 'paleae'
2018 05 29

p. 242
ANISOCARPUS scabridus
BIOREGIONAL DISTRIBUTION: KR, NCoRH, CaRH.
+ 'KR,' added 
2015 06 12

p. 244
ANTENNARIA microphylla
BIOREGIONAL DISTRIBUTION: KR, CaRH, SNH, SnBr, SnJt, SNE;
+ 'KR, CaRH, SNH, SnBr, SnJt,' added 
2016 05 11

p. 244
ANTENNARIA rosea subsp. confinis
BIOREGIONAL DISTRIBUTION: KR, NCoRH, CaRH, SNH, SnGb, SnBr, SnJt, GB;
+ 'NCoRH,' added
2017 10 17

p. 244
ANTENNARIA rosea
NOTE: _Antennaria rosea_ subsp. _arida_ (E.E. Nelson) R.J. Bayer, _Antennaria rosea_ subsp. _pulvinata_ (Greene) R.J. Bayer in adjacent states, expected in CA.
+ terminal period added
2012 03 27
p2

p. 249
ARNICA parryi
ELEVATION: 500--3630 m.
+ '2400' made '3630'
2015 05 28

p. 250
ARNICA venosa
BIOREGIONAL DISTRIBUTION: KR.
+ 'CaRH' deleted 
2015 06 12

p. 250
ARTEMISIA
NOTE: Reports of _Artemisia campestris_ L. subsp. _pacifica_ (Nutt.) H.M. Hall & Clem. for CA unconfirmed. _Artemisia arbuscula_ var. _thermopola_ Beetle not in CA. _Artemisia absinthium_ L. often cult, may persist, perhaps naturalizing in ne CA. Recent studies place _Sphaeromeria_ in the _Artemisia_ clade (Garcia et al. 2011 Am J Bot).
+ comma before '2011' deleted
2012 03 27
p2

p. 250
ARTEMISIA
NOTE: Reports of _Artemisia campestris_ L. subsp. _pacifica_ (Nutt.) H.M. Hall & Clem. for CA unconfirmed. _Artemisia arbuscula_ var. _thermopola_ Beetle not in CA. _Artemisia absinthium_ L. often cult, may persist, perhaps naturalizing in ne CA. Recent studies place _Sphaeromeria_ in the _Artemisia_ clade (Garcia et al. 2011 Amer J Bot).
+ 'Am J Bot' made 'Amer J Bot'
2014 05 04

p. 251
ARTEMISIA biennis
COMMON NAME: BIENNIAL WORMWOOD
+ 'WORMWORD' made 'WORMWOOD'
2012 03 27

p. 253
ARTEMISIA tridentata subsp. tridentata
BIOREGIONAL DISTRIBUTION: KR, CaRH, SNH, Teh, s SnJV, SCoRI, TR, PR, GB, DMtns;
+ 'KR,' added 
+ 'SNH, Teh,' added 
+ 'PR,' added 
2016 05 11

p. 254
BACCHARIS glutinosa
BIOREGIONAL DISTRIBUTION: NCo, w KR, NCoRI, NCoRO, CaRF, SNF, GV, CW, SW;
+ 'NCoRI,' added  
2015 10 22

p. 254
BACCHARIS glutinosa
NOTE: The name _B. glutinosa_ was mistakenly treated as a synonym of, rather than as a name that had been misapplied to, _B. salicifolia_ in TJM (1993) and elsewhere previously.
+ 'The name _B. glutinosa_ was misapplied by N.Am botanists to _B. salicifolia_ for many yrs (prior to TJM (1993)).' made 'The name _B. glutinosa_ was mistakenly treated as a synonym of, rather than as a name that had been misapplied to, _B. salicifolia_ in TJM (1993) and elsewhere previously.'
2013 12 10 

p. 254
BACCHARIS pilularis subsp. consanguinea
BIOREGIONAL DISTRIBUTION: NW, CaRF, n SNF, ScV, w CW, SCo, ChI, WTR, PR;
+ 'SNF' made 'n SNF'
2018 01 31

p. 256
BACCHARIS salicifolia subsp. salicifolia
BIOREGIONAL DISTRIBUTION: NW, CaRF, SNF, s SNH, Teh, GV, CW, SW, D;
+ 's SNH,' added  
2015 10 22

p. 260
BENITOA occidentalis
ECOLOGY: Grassland, foothill woodland, vertic clay, occ serpentine;
+ 'serpentine-derived soils' made 'vertic clay, occ serpentine' [in TJM2; not abbreviated in eFlora]
2015 11 12

p. 261
BIDENS laevis
INFLORESCENCE: heads radiate, erect in fl, often nodding in fr; peduncle 2--10 cm; involucre 1--2 cm diam, bell-shaped; outer phyllaries 6--8, 1--2 cm, lance-linear, sparsely ciliate; inner phyllaries 8--16 mm, obovate; paleae 6--8 mm, tips +- red.
+ 'outer phyllaries 6--8, 1--2 mm' made 'outer phyllaries 6--8, 1--2 cm'
2013 10 05

p. 261
BIDENS tripartita
BIOREGIONAL DISTRIBUTION: c SNH, GV;
+ 'SnJV' made 'GV'  
2014 05 06

p. 264
BRICKELLIA atractyloides var. arguta
BIOREGIONAL DISTRIBUTION: D;
+ 'DMoj' made 'D'  
2014 05 07

p. 264
BRICKELLIA atractyloides A. Gray var. odontolepis
BIOREGIONAL DISTRIBUTION: s DMoj, DSon;
+ 'D' made 's DMoj, DSon' 
2014 05 07

p. 264
BRICKELLIA desertorum
BIOREGIONAL DISTRIBUTION: s SN, e SCo, SnGb, SnBr (Whitewater Canyon), PR, D;
+ 's SN, e SCo, SnGb, SnBr (Whitewater Canyon), PR,' added 
2016 05 11

p. 265
BRICKELLIA microphylla var. microphylla
UNABRIDGED SYNONYMS: _Bulbostylis microphylla_ Nutt.; _Brickellia grayana_ Hieron.; _Coleosanthus microphyllus_ (Nutt.) Kuntze; _Brickellia watsonii_ B.L. Rob.; _Brickellia microphylla_ (Nutt.) A. Gray var. _watsonii_ (B.L. Rob.) S.L. Welsh
+ 'Brickellia microphylla (Nutt.) Kuntzei' made 'Brickellia microphylla (Nutt.) A. Gray' ; 'S.L. Welch' made 'S.L. Welsh' [in eFlora; unabridged synonyms not in TJM2]
2012 03 27

p. 265
CACALIOPSIS nardosmia
BIOREGIONAL DISTRIBUTION: KR, NCoR;
+ ', CaRH' deleted 
2015 06 12

p. 266
CALYCADENIA fremontii
BIOREGIONAL DISTRIBUTION: NW, CaR, n SNF, ScV, MP (Ash Creek vicinity, alien?);
+ ', MP (Ash Creek vicinity, alien?)' added
2018 07 10

p. 268
CARDUUS pycnocephalus subsp. pycnocephalus
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaRF, SNF, ScV, CW, SCo, TR, PR;
+ 'KR,' added 
2015 06 12

p. 269
BLEPHARIPAPPUS scaber (top of page, middle figure, scale bar with fr in lower right)
+ '2 mm' made '1 mm' 
2013 02 13

p. 272
CENTAUREA stoebe L. subsp. micranthos
SYNONYMS: Centaurea maculosa Lam.
+ 'L.' made 'Lam.'
2013 11 22 [correction made on earlier, unknown date]

p. 274
CENTROMADIA fitchii
BIOREGIONAL DISTRIBUTION: e KR, NCoRO, NCoRI, CaR, n&c SNF, GV, SnFrB, SCoR, n ChI (Santa Cruz Island, alien), n SnBr;
+ 'e KR,' added 
2015 06 15

p. 274
CENTROMADIA parryi subsp. rudis
BIOREGIONAL DISTRIBUTION: s NCoRI (rare), n&c GV, MP (Ash Creek vicinity, alien?).
+ ', MP (Ash Creek vicinity, alien?)' added
2018 07 10

p. 275
CHAENACTIS
4' Longest phyllaries 14--18 mm, outer generally glandular-hairy, other hairs 0 or scarce; e KR .....-> C. suffrutescens (2)
+ ', n CaRH' deleted 
2015 08 27

p. 277
CHAENACTIS stevioides
ELEVATION: -30--2100(2800) m.
+ '2400' made '2800'
2019 11 12

p. 278
CHAENACTIS suffrutescens
BIOREGIONAL DISTRIBUTION: e KR.
+ ', n CaRH' deleted 
2015 06 15

p. 280
CHONDRILLA juncea
BIOREGIONAL DISTRIBUTION: KR, CaRH, SNF, SNH, GV, CW, n SCo, s WTR, Wrn;
+ 'NCo,' deleted 
+ 'KR,' added 
+ 'SNF, SNH,' added 
+ 'SnFrB, SCoRO' made 'CW' 
+ ', s WTR, Wrn' added 
2015 06 16

p. 286
CIRSIUM fontinale var. campylon
COMMON NAME: MOUNT HAMILTON THISTLE
+ 'MOUNT HAMILTON FOUNTAIN THISTLE' made 'MOUNT HAMILTON THISTLE'
2019 09 24

p. 286
CIRSIUM fontinale var. fontinale
COMMON NAME: FOUNTAIN THISTLE
+ 'CRYSTAL SPRINGS FOUNTAIN THISTLE' made 'FOUNTAIN THISTLE'
2019 09 24

p. 286
CIRSIUM fontinale var. obispoense
COMMON NAME: CHORRO CREEK BOG THISTLE
+ 'SAN LUIS OBISPO FOUNTAIN THISTLE' made 'CHORRO CREEK BOG THISTLE'
2019 09 24

p. 288
CIRSIUM quercetorum
NOTE: Variable; geographic races may warrant taxonomic recognition; needs study. Hybrids known with _Cirsium fontinale_ var. _fontinale_, _Cirsium remotifolium_ var. _odontolepis_. Related to _Cirsium scariosum_, differing in having longer lifespan, runner roots.
+ 'differing in per habit and runner roots' made 'differing in having longer lifespan, runner roots'
2013 11 22

p. 289
CIRSIUM remotifolium var. odontolepis
SYNONYMS: Cirsium amblylepis Petr.; Cirsium callilepis (Greene) Jeps.; Cirsium callilepis var. pseudocarlinoides (Petr.) J.T. Howell
+ 'pseudocarlinioides' made 'pseudocarlinoides'
2013 03 28

p. 290
CORETHROGYNE filaginifolia
BIOREGIONAL DISTRIBUTION: NCo, KR, NCoRO, c&s SN, Teh, ,CW, SW, w DMoj;
+ 'Teh,' added 
2013 03 28

p. 291
CIRSIUM scariosum (bottom of page, middle figure)
+ 'Cirsium scariosum var. citrinum' made 'Cirsium scariosum var. loncholepis' 
2012 03 27

p. 292 [location or approximate location where key would have appeared in TJM2 were it not unabridged (due to unabridged, second species) and therefore only in eFlora]
COSMOS
1.  Plant glabrous or puberulent; ray white to pink or purple; leaf sessile or short-petioled, 1--2 &times; divided into linear segments <= 1.5 mm wide; outer phyllaries 9--13 mm; fruit 7--16 mm .....-> C. bipinnatus
1'  Plant +- stiffly hairy; ray yellow to red-orange; leaf petioled, 2--3 &times; divided into linear to lanceolate segments 2--5 mm wide; outer phyllaries 5--7 mm; fruit 16--28 mm .....-> [C. sulphureus] + key added to eFlora
2016 03 29

p. 292
COTULA coronopifolia
BIOREGIONAL DISTRIBUTION: NCo, NCoRI, n SNF, ScV, CW, SCo, ChI, WTR, PR;
+ 'ChI, WTR,' added 
2014 07 15

p. 292
CREPIS
LEAF: generally basal and cauline, alternate, base narrowed, often winged, blade entire or toothed to pinnately lobed or divided.
+ 'basal or cauline,' made 'generally basal and cauline'
2018 05 29

p. 294
CREPIS capillaris
BIOREGIONAL DISTRIBUTION: NW, CaR, n&c SN, CCo, SnFrB, SCo;
+ 'CCo' moved from after to before 'SnFrB' 
2012 03 27
p2

p. 295
CREPIS runcinata
RARITY STATUS: SYMBOL 1
+ 'SYMBOL 1' added [meaning that a star symbol was added to TJM2, while 'Listed on CNPS Rare Plant Inventory' was added to the eFlora]
2016 01 20

p. 295
CREPIS runcinata subsp. hallii
RARITY STATUS:
+ 'SYMBOL 1' deleted [meaning that a star symbol was removed from TJM2, while 'Listed on CNPS Rare Plant Inventory' was removed from the eFlora]
2016 01 20

p. 299
DEINANDRA halliana
ECOLOGY: Grasslands, open slopes, sink edges, vertic clay, rarely serpentine;
+ 'Clayey, +- alkaline soils of grassland, open slopes, sink edges;' made 'Grasslands, open slopes, sink edges, vertic clay, rarely serpentine;'
2015 11 12

p. 299
DEINANDRA paniculata
BIOREGIONAL DISTRIBUTION: s CCo/SCoRO, s SCoRO, SCo, WTR (e Santa Ynez Mtns), PR;
+ 's CCo/SCoRO,' and 'WTR (e Santa Ynez Mtns),' inserted 
2012 04 25

p. 303
(superseded by Supplement II)
DITTRICHIA graveolens 
RAY FLOWER: 10--12; ray 2--5(--7) mm, erect or spreading.
+ 'ray 4--7 mm' made 'ray 2--5(--7) mm'
2014 05 30

p. 303
(superseded by Supplement II)
DITTRICHIA graveolens 
BIOREGIONAL DISTRIBUTION: KR, s NCoRI, s NCoRO, CaRF, n SN, GV, CCo, SnFrB, n SCoRI, SCo, w PR, expected elsewhere;
+ 'n SNF, GV, CCo, SnFrB, SCo, expected elsewhere' made 'KR, s NCoRI, s NCoRO, CaRF, n SN, GV, CCo, SnFrB, n SCoRI, SCo, w PR, expected elsewhere' 
2015 08 27 [changes originally made on 2015 05 08; 'KR,' added and 'n CaRH,' deleted on 2015 08 27]

p. 303
EASTWOODIA elegans
FLOWER: 30--180+; corolla <= 6 mm, cylindric to funnel-shaped, yellow; style branch appendages lanceolate.
+ '30--40' made '30--180+'
2014 05 30

p. 304
ENCELIA californica
BIOREGIONAL DISTRIBUTION: s CCo, SCo, ChI, WTR, w PR;
+ 's CCo, SCo, WTR, w PR;' made 's CCo, SCo, ChI, WTR, w PR;'
2017 08 29

p. 306
ENCELIOPSIS covillei
BIOREGIONAL DISTRIBUTION: n DMtns (w side Panamint Range), adjacent DMoj.
+ ', adjacent DMoj' added 
2014 07 30

p. 306
ENCELIOPSIS nudicaulis
BIOREGIONAL DISTRIBUTION: W&I, DMtns, e DMoj;
+ 'e DMoj' added 
2014 07 30

p. 308
ERICAMERIA bloomeri
BIOREGIONAL DISTRIBUTION: KR, CaR, SN, MP;
+ 'KR' inserted 
2014 05 08

p. 309
ERICAMERIA greenei
SYNONYMS: Chrysothamnus g. (A. Gray) E. Greene
+ 'Chrysothamnus g. (A. Gray) E. Greene' added [in TJM2; not abbreviated in eFlora]
2014 03 11

p. 309
ERICAMERIA greenei
SYNONYMS: 
+ SYNONYMS deleted [addition of 2014 03 11 in error]
2015 06 01

p. 309
ERICAMERIA nauseosa
TAXON AUTHOR: (Pursh) G.L. Nesom & G.I. Baird
+ 'Pall.' made 'Pursh'
2014 03 11

p. 309
ERICAMERIA nauseosa
SYNONYMS: Chrysothamnus n. (Pursh) Britton
+ 'Chrysothamnus n. (Pursh) Britton' added [in TJM2; not abbreviated in eFlora]
2014 03 11

p. 309
ERICAMERIA nauseosa var. bernardina
BIOREGIONAL DISTRIBUTION: s SN, TR, n PR (incl SnJt), W&I;
+ 'n PR' made 'n PR (incl SnJt)' 
2014 07 25

p. 310
ERICAMERIA nauseosa var. mohavensis
BIOREGIONAL DISTRIBUTION: SnFrB (Mount Hamilton Range), SCoRO, s SCoRI, TR, SNE, DMoj;
+ 'SNE,' added
2017 08 16

p. 310
ERICAMERIA nauseosa var. oreophila
BIOREGIONAL DISTRIBUTION: CaRH, SN (e slope), Teh, s SCoRI, WTR, SnGb, SnBr, PR, GB, DMtns (Death Valley), w edge DMoj;
+ 'CaRH,' added
+ 'WTR, SnGb,' added
+ ', DMtns (Death Valley), w edge DMoj' added
2016 07 26

p. 310 [location or approximate location where note would appear in TJM2 were the note not unabridged and therefore only in eFlora]
ERICAMERIA nauseosa var. speciosa
UNABRIDGED NOTE: If recognized taxonomically, plants with large, wide leaves assignable to _Chrysothamnus nauseosus_ var. _macrophyllus_ J.T. Howell or _Chrysothamnus californicus_ Greene.
+ 'Plants with large, wide leaves have been called _Chrysothamnus nauseosus_ var. _macrophyllus_ J.T. Howell or _Chrysothamnus californicus_ Greene.' made 'If recognized taxonomically, plants with large, wide leaves assignable to _Chrysothamnus nauseosus_ var. _macrophyllus_ J.T. Howell or _Chrysothamnus californicus_ Greene.' [as UNABRIDGED NOTE not in TJM2; not abbreviated in eFlora]
2015 04 30

p. 310
ERICAMERIA nauseosa var. speciosa
BIOREGIONAL DISTRIBUTION: NW, CaR, SN, SnFrB, MP, SNE, DMtns (Panamint Canyon);
+ 'NW, CaR, SN, W&I;' made 'NW, CaR, SN, SnFrB, MP, SNE, DMtns (Panamint Canyon);
2017 08 16

p. 310
ERICAMERIA parryi
SYNONYMS: Chrysothamnus p. (A. Gray) E. Greene
+ 'Chrysothamnus p. (A. Gray) E. Greene' added [in TJM2; not abbreviated in eFlora]
2014 03 11

p. 312
ERICAMERIA suffruticosa
HABIT+: Pl 10--4 dm.
+ '10--4' made '1--4'
2012 03 27

p. 312
ERICAMERIA teretifolia
BIOREGIONAL DISTRIBUTION: Teh, TR, e PR (exc SnJt), SNE, DMoj;
+ 'SnJt' made 'e PR (exc SnJt)' 
2014 02 27

p. 312
ERICAMERIA teretifolia
NOTE: Records in SnJt unconfirmed.
+ 'Records in SnJt unconfirmed.' added 
2014 02 27

p. 313
ERIGERON
13' Ann, bien or short-lived per; pappus bristles 6--9(12) or 15--20
+ '; pappus bristles 6--9(12) or 15--20' added
2012 09 25

p. 313
ERIGERON
14. Pappus bristles 15--20; biennial or short-lived perennial herb .....-> E. calvus
+ 'short lived' made 'short-lived'
2013 07 31

p. 315
ERIGERON
65' Ray flowers 20--165 (80--300+ in _E. glaucus_)
+ '20--165' made '20--165 (80--300+ in _E. glaucus_)'
2014 06 02

p. 317
ERIGERON blochmaniae
LEAF: cauline, 1--5.5 cm, linear to narrowly oblanceolate, evenly sized and spaced, densely puberulent or short-soft-hairy.
+ '1--3 cm' made '1--5.5 cm'
2013 10 11

p. 317
ERIGERON bonariensis
BIOREGIONAL DISTRIBUTION: NCoRI, CaRF, n&c SNF, GV, CW, SW, DMtns;
+ 'NCoRI,' added 
2014 06 26

p. 318
ERIGERON compositus
BIOREGIONAL DISTRIBUTION: KR, NCoRH, CaRH, SNH, SnBr, Wrn, SNE;
+ 'SNH, Wrn, SNE;' made 'KR, NCoRH, CaRH, SNH, SnBr, Wrn, SNE;' 
2014 04 28

p. 320
ERIGERON foliosus var. foliosus
BIOREGIONAL DISTRIBUTION: NCoRI, n SNF, n&c  SNH, s SN, Teh, SnJV, s CCo, SnFrB, SCoR, SCo, ChI, TR, PR, DMtns;
+ 'n SNH, s SN, SnJV, SnFrB, SCoRO, TR, PR, DMtns;' made 'NCoRI, n SNF, n&c  SNH, s SN, Teh, SnJV, s CCo, SnFrB, SCoR, SCo, ChI, TR, PR, DMtns;'
2017 08 16

p. 320
ERIGERON glaucus
RAY FLOWER: 80--300+; ray 8--15 mm, white to pink or purple, coiled when dry.
+ '80--165' made '80--300+'
2014 06 02

p. 320
ERIGERON inornatus var. keilii
BIOREGIONAL DISTRIBUTION: s SN (Fresno, Tulare cos.).
+ ' (Tulare Co.)' made ' (Fresno, Tulare cos.)'
2015 03 18

p. 321
ERIGERON oxyphyllus
+ '(Son)' made '(SON)' [in TJM2; 'Sonora' in eFlora]
2013 07 31

p. 322
ERIGERON pygmaeus
BIOREGIONAL DISTRIBUTION: SNH, SNE;
+ 'c SNH, SNE;' made 'SNH, SNE;'
2017 08 16

p. 325
ERIOPHYLLUM
16' Ray fls gen 9--13; phyllaries 9--15, keeled to flat; lvs entire to nearly compound, margins flat or rolled under
+ 'Ray fls gen 9--13, keeled or flat;' made 'Ray fls gen 9--13; phyllaries 9--15, keeled to flat;'
2012 09 26

p. 325
ERIOPHYLLUM
18' Ray 6--7 mm; c&s SNH, SnBr .....-> var. obovatum
+ 's SNH' made 'c&s SNH'
2016 07 26

p. 326
ERIOPHYLLUM lanatum var. obovatum
BIOREGIONAL DISTRIBUTION: c&s SNH, SnBr.
+ 's SNH' made 'c&s SNH'
2016 07 26

p. 328
EUCEPHALUS vialis
ELEVATION: 1500--5000 m.
+ '1500--5000' made '455--1525'
2013 04 05

p. 330
EURYBIA integrifolia
BIOREGIONAL DISTRIBUTION: KR, CaR, SN, Wrn;
+ 'KR,' added; ', Wrn' added 
2015 08 12

p. 336
GRINDELIA
8' Involucres 7--25 mm diam; rays 8--20 mm; NCoR, GV, CW, SCo, TR .....-> G. hirsutula
+ ', SCo, TR' added 
2014 07 15

p. 336
GRINDELIA camporum
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaRF, SNF, n SNH, Teh, GV, SnFrB, SCoRO, SW, SNE, DMoj;
+ 'KR,' added  
2015 08 12

p. 337
GRINDELIA hirsutula
BIOREGIONAL DISTRIBUTION: NCoR, GV, CW, SCo, TR.
+ ', SCo, TR' added 
2014 07 15

p. 338
HARMONIA guggolziorum
BIOREGIONAL DISTRIBUTION: e edge NCoRO (Hopland, Mendocino Co.).
+ 'w NCoRI' made 'e edge NCoRO' 
2013 09 25

p. 341
HEDYPNOIS rhagadioloides
+ 'cretica' made 'rhagadioloides'
TAXON AUTHOR: (L.) F. W. Schmidt
+ '(L.) Dum. Cours.' made '(L.) F. W. Schmidt'
SYNONYMS: H. cretica (L.) Dum. Cours.
+ SYNONYMS added [in TJM2; not abbreviated in eFlora]
2014 08 20

p. 342
HELIANTHELLA californica var. californica
BIOREGIONAL DISTRIBUTION: NCoR, SnFrB.
+ 'NCoR' made  'NCoR, SnFrB' 
2013 01 29

p. 345
HEDYPNOIS rhagadioloides (middle row, figure at right)
+ 'cretica' made 'rhagadioloides' 
2014 08 20

p. 346
HEMIZONELLA minima
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaR, SN, se SnFrB, SCoRO (Hanging Valley, Santa Lucia Mtns), TR, PR, MP;
+ 'SCoRO (Hanging Valley, Santa Lucia Mtns),' inserted 
2012 04 23

p. 346
HEMIZONELLA minima
STEM: decumbent to erect, branches often widely divergent, minutely coarse-hairy, stalked-glandular.
+ '+- erect' made 'decumbent to erect'
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaR, SN, se SnFrB, SCoRI (San Benito Mtn), SCoRO (Hanging Valley, Santa Lucia Mtns), TR, PR, MP;
+ 'SCoRI (San Benito Mtn),' added
2016 06 07

p. 347
HEMIZONIA congesta subsp. congesta
COMMON NAME: CONGESTED-HEADED HAYFIELD TARPLANT
+ 'PALE-YELLOW HAYFIELD TARPLANT' made 'CONGESTED-HEADED HAYFIELD TARPLANT'
2015 01 12

p. 350
HETEROTHECA
3. Lvs of branches gen > 13 mm, > 3 mm wide, sparsely hairy; outer phyllaries lance-deltate; NW, CW .....-> var. oregona
+ 'CaR,' deleted 
2015 08 31

p. 350
HETEROTHECA
4' St gen loosely branched distal to middle; lvs short-bristly, appearing green; NW, n SNF, CW .....-> var. rudis
+ 'CaR,' deleted 
2015 08 31

p. 350
HETEROTHECA
4' St gen loosely branched distal to middle; lvs short-bristly, appearing green; NW, n SNF, n ScV, CW .....-> var. rudis
+ 'n ScV,' added 
2016 01 25

p. 350
HETEROTHECA
13. Head not subtended by leaf-like bracts; distal leaves +- white, stiff; SCo, TR, PR, w D >= 100 m .....-> subsp. fastigiata
+ 'TR, PR, w DMoj, w DSon > 100 m' made 'SCo, TR, PR, w D >= 100 m' 
2016 01 25

p. 350
HETEROTHECA
13' Head subtended by large leaf-like bracts; distal leaves green, not stiff; s CCo, SCo < 60 m .....-> subsp. sessiliflora
+ '<= 60 m' made '< 60 m'
2016 01 25

p. 351
HETEROTHECA oregona var. oregona
BIOREGIONAL DISTRIBUTION: NW, CW;
+ 'CaR,' deleted 
2015 08 31

p. 351
HETEROTHECA oregona var. rudis
BIOREGIONAL DISTRIBUTION: NW, n SNF, CW.
+ 'CaR,' deleted 
2015 08 12

p. 351
HETEROTHECA oregona var. rudis
BIOREGIONAL DISTRIBUTION: NW, n SNF, n ScV, CW.
+ 'n ScV,' added 
2016 01 25

p. 351
HETEROTHECA sessiliflora subsp. fastigiata
BIOREGIONAL DISTRIBUTION: SCo, TR, PR, w D.
+ 'TR, c PR, SnJt, w D' made 'SCo, TR, PR, w D' 
2016 01 25

p. 353
HOLOCARPHA virgata subsp. virgata
BIOREGIONAL DISTRIBUTION: NCoRI, s CaRF, n&c SNF, GV, SnFrB (mostly e), c SCoRO, SCoRI.
+ ', c&s SCo, PR (exc SnJt)' deleted
2018 10 09

p. 356
GNAPHALIUM palustre
ELEVATION: < 3590 m.
+ '3000' made '3590'
2016 09 28

p. 356
HULSEA heterochroma
BIOREGIONAL DISTRIBUTION: SN, SnFrB, SCoR, TR, n PR (incl SnJt), n DMtns (Panamint, Argus ranges);
+ 'n PR' made 'n PR (incl SnJt)' 
2014 07 28

p. 356
HULSEA vestita subsp. callicarpha
BIOREGIONAL DISTRIBUTION: n PR (incl SnJt).
+ 'n PR' made 'n PR (incl SnJt)' 
2014 07 28

p. 360
ISOCOMA menziesii var. menziesii
ECOLOGY: Roadbanks, hill toeslopes, creek terrace cliffs, shale, vertic clay, occ serpentine;
+ 'Soils from sandstone or granite, landward side of dunes, hillsides, arroyos' made 'Roadbanks, hill toeslopes, creek terrace cliffs, shale, vertic clay, occ serpentine' [in TJM2; not abbreviated in eFlora]
2015 12 09

p. 363
LACTUCA virosa
BIOREGIONAL DISTRIBUTION: KR, SnFrB, n SCoRO;
+ 'KR,' added
2019 10 14

p. 364 [location or approximate location where treatment would have appeared in TJM2 had the species been described and included by then] (added to flora in Supplement II)
LAGOPHYLLA diabolensis
ECOLOGY: Grassy openings in woodland, vertic clay;
+ ', vertic clay' added
2015 10 29

p. 369
LAYIA carnosa
BIOREGIONAL DISTRIBUTION: n NCo, CCo;
+ 'n NCo, CCo.' made 'n NCo, CCo;' 
2014 08 09

p. 369
LAYIA carnosa
DISTRIBUTION OUTSIDE CALIFORNIA: sw OR.
+ 'sw OR.' added 
2014 08 09

p. 369
LAYIA chrysanthemoides
BIOREGIONAL DISTRIBUTION: NCo, e&s edge NCoRO, NCoRI, GV, CW;
'CW.' made 'CW;' 
2014 08 09

p. 369
LAYIA chrysanthemoides
DISTRIBUTION OUTSIDE CALIFORNIA: sw OR.
+ 'sw OR.' added 
2014 08 09

p. 369
LAYIA discoidea
ECOLOGY: Chaparral, talus, outcrops, rocky soil, serpentine, graywacke;
+ 'Open serpentine soil or talus' made 'Chaparral, talus, outcrops, rocky soil, serpentine, graywacke'
2016 04 26

p. 370
LAYIA platyglossa
DISTRIBUTION OUTSIDE CALIFORNIA: sw OR, Baja CA.
'to Baja CA' made 'sw OR, Baja CA' 
2014 08 09

p. 370
LAYIA septentrionalis
BIOREGIONAL DISTRIBUTION: c&s NCoRI, ScV (Sutter Buttes);
+ 'c&s NCoRI, ScV (Sutter Buttes).' made 'c&s NCoRI, ScV (Sutter Buttes);' 
2014 08 09

p. 370
LAYIA septentrionalis
DISTRIBUTION OUTSIDE CALIFORNIA: sw OR.
+ 'sw OR.' added 
2014 08 09

p. 378
LOGFIA gallica
BIOREGIONAL DISTRIBUTION: NW (exc NCoRH), CaRF, SNF, w SNH, GV, CW, SW;
+ '(exc KR, NCoRH)' made '(exc NCoRH)' 
2015 08 19

p. 378
LUINA
DISK FLOWER: generally 11--23; corolla white to cream [yellow], tube > throat; anther base short-tailed, tip narrowly lanceolate; style branches rounded-truncate.
+ 'corolla +- yellow' made 'corolla white to cream [yellow]'
2013 08 08

p. 378
LUINA hypoleuca
FLOWER: 11--15(23); corolla gen 8--10 mm, tube 3--4 mm, throat slightly expanded, lobes 1--2 mm, erect.
+ 'corolla gen 8--10 mm, creamy yellow, tube 3--4 mm' made 'corolla gen 8--10 mm, tube 3--4 mm'  [in TJM2; not abbreviated in eFlora]
2013 08 08

p. 378
LUINA hypoleuca
BIOREGIONAL DISTRIBUTION: KR, NCoR, sw SnFrB;
+ 'CaRH,' deleted 
2015 08 25

p. 381
MADIA radiata
ECOLOGY: Grassy or open slopes, vertic clay, rarely serpentine;
+ ', gen clayey soils or shale;' made ', vertic clay, rarely serpentine;' [in TJM2; not abbreviated in eFlora]
2015 11 12

p. 381
MADIA sativa
DISK FLOWER: 11--45+, bisexual; corolla 2--5 mm, hairy; anthers +- dark purple.
+ '11--14' made '11--45+'
2015 07 01

p. 383
MALACOTHRIX glabrata
BIOREGIONAL DISTRIBUTION: SnJV, SCoRO, WTR, SNE, D (exc DMtns);
+ 'D' made 'D (exc DMtns)'
2019 09 03

p. 384
MALACOTHRIX saxatilis var. tenuifolia
UNABRIDGED SYNONYMS: _Malacothrix saxatilis_ var. _altissima_ (Greene) Ferris
+ 'saxitalis' made 'saxatilis' [in eFlora; unabridged synonyms not in TJM2]
2012 03 27

p. 386
MATRICARIA
2. Tip of fr entire, pappus 0 or crown +- entire; pl (1)10--30(50) cm; peduncle <= 1.5 cm; disturbed places .....-> M. discoidea
+ 'pappus crown narrow' made 'pappus 0 or crown +- entire'
2013 03 15

p. 386
MATRICARIA
2. Tip of fruit entire, pappus 0 or crown +- entire; plant (1)10--30(50) cm; peduncle <= 1.5(2.5) cm; disturbed places .....-> M. discoidea
+ 'peduncle <= 1.5 cm' made 'peduncle <= 1.5(2.5) cm'
2013 07 31

p. 386
NATIVE
MATRICARIA discoidea
+ 'NATURALIZED' made 'NATIVE'  [font in TJM2 changed from that indicating NATURALIZED to that indicating NATIVE]
2013 07 31

p. 386
MATRICARIA discoidea
FRUIT: 3--5-veined, with narrow brown glands extending down to +- bottom of fr; tip truncate; pappus 0 or crown +- entire.
+ '3--5-veined; tip truncate; pappus a narrow crown, with linear, brown glands extending nearly length of fr.' made '3--5-veined, with narrow brown glands extending down to +- bottom of fr; tip truncate; pappus 0 or crown +- entire.'
2013 03 15

p. 386
MATRICARIA occidentalis
FRUIT: angled, with wide brown glands extending down to +- middle of fr; tip 2-lobed; pappus crown 2-lobed.
+ 'angled; tip and pappus crown 2-lobed, with wide brown gland extending from tip of each lobe to +- middle of fr.' made 'angled, with wide brown glands extending down to +- middle of fr; tip 2-lobed; pappus crown 2-lobed.'
2013 03 15

p. 386
MICROPUS
INFLORESCENCE: heads disciform, +- sessile, 1 or 2--5 per dense group; involucre +- cup-like; phyllaries 4--6, equal, obovate, rounded, << paleae, scarious, persistent; receptacle length 0.5--1.8 &times; width, depressed or obovoid, glabrous; paleae of pistillate flowers each enclosing flower, deciduous with fruit, +- compressed-obovoid, obtuse, distally bulged out and hood- or helmet-like, generally woolly abaxially, obscurely parallel-veined (veins 5+), margin +- reflexed distally as scarious wing (wing adaxially +- lateral, projected upward or inward, +- visible in head); paleae of disk flowers 0, or 1--3, reduced, erect, +- folded, lanceolate, acute, papery, scarious, glabrous.
+ '1 or 2--5 perennial herb (dense) group;' made '1 or 2--5 per dense group;'  [in eFlora, where "per" had been incorrectly expanded to "perennial herb"; abbreviations retained in TJM2, where "per" means "perennial herb" in some cases, and "per" in others (e.g., in this case, where the number of heads per dense group is intended -- also, parentheses around "dense" removed).]
2014 06 18

p. 389
MONOPTILON
RAY FLOWER: (7)12--21; ray white to purple, often dark-veined, esp abaxially.
+ '12--21' made '(7)12--21
2012 04 16

p. 389
MONOLOPIA congdonii
ECOLOGY: Grassland, sandy soils;
+ 'Sandy grassland, alkali sinks' made 'Grassland, sandy soils'
2015 12 09

p. 389
MONOLOPIA major
ECOLOGY: Grassland, vertic clay, occ serpentine;
+ 'bare clay' made 'vertic clay, occ serpentine' [in TJM2; not abbreviated in eFlora]
2015 11 12

p. 390
ONCOSIPHON pilulifer
BIOREGIONAL DISTRIBUTION: SnJV (se of Taft), SCo, PR, DSon;
+ 'SnJV (se of Taft),' added
2018 10 16

p. 390
ONCOSIPHON pilulifer
+ 'piluliferum' made 'pilulifer'
SYNONYMS: Matricaria globifera (Thunb.) Fenzl ex Harv.; ; Oncosiphon piluliferum (L. f.) K&auml;llersj&ouml;, orth. var.
+ '; Oncosiphon piluliferum (L. f.) K&auml;llersj&ouml;, orth. var.' added
2018 08 01

p. 392
ONOPORDUM
HABIT+: Gen bien, coarse.
'Bien, coarse.' made 'Gen bien, coarse.' [in TJM2; not abbreviated in eFlora]
2013 07 31

p. 392
ONOPORDUM acanthium subsp. acanthium
HABIT+: Bien, per <= 30 dm, +- canescent-tomentose.
+ 'Pl' made 'Bien, per' [in TJM2; not abbreviated in eFlora, where "per" expanded to "perennial herb"] 
2013 07 31

p. 394 [location or approximate location where synonym would have appeared in TJM2 had it not been listed in TJM1and therefore subsequently included only in eFlora]
PACKERA clevelandii
SYNONYMS: Senecio clevelandii Greene; Packera clevelandii (Greene) W.A. Weber & Á.Löve var. heterophylla (Hoover) D.W. Taylor
+ 'Packera clevelandii (Greene) W.A. Weber & &Aacute;. L&ouml;ve' made 'Packera clevelandii (Greene) W.A. Weber & Á.Löve var. heterophylla (Hoover) D.W. Taylor'
2016 12 20

p. 406
PSEUDOGNAPHALIUM microcephalum
BIOREGIONAL DISTRIBUTION: SnFrB, SCoRO, SCo, n ChI, WTR, PR;
+ 'WTR,' added 
2014 07 11

p. 406
PSEUDOGNAPHALIUM stramineum
BIOREGIONAL DISTRIBUTION: NCo, CCo, SnFrB, SCoRO, SCo, ChI, SnBr;
+ 'ChI,' added 
2014 07 11

p. 406
PSEUDOGNAPHALIUM stramineum
BIOREGIONAL DISTRIBUTION: CA (exc MP);
+ 'NCo, CCo, SnFrB, SCoRO, SCo, ChI, SnBr' made 'CA (exc MP)'
2019 04 09

p. 407
PSEUDOGNAPHALIUM thermale
BIOREGIONAL DISTRIBUTION: KR, NCoRO, CaRH, c&s SNF, SNH, SnGb, SnBr, SnJt, PR (Cuyamaca Mtns), SNE;
+ 'KR, NCoRO, CaRH, c&s SNF, SNH, SNE;' made 'KR, NCoRO, CaRH, c&s SNF, SNH, SnGb, SnBr, SnJt, PR (Cuyamaca Mtns), SNE;' 
2012 07 25

p. 410
PYRROCOMA
14' Involucre 5--7 mm diam, phyllaries green-tipped, leathery, ciliate (exc recurved tip), margin translucent .....-> var. _sessiliflora_
+ 'cviliate' made 'ciliate'
2012 03 27
p2

p. 418
SENECIO quadridentatus
SYNONYMS: Erechtites quadridentatus (Labill.) DC.
+ 'quadridentata' made 'quadridentatus' [in eFlora; abbreviated to 'q.' in TJM2]

p. 421
SOLIDAGO guiradonis
ECOLOGY: Perennial stream banks and seeps, serpentine;
+ 'Near streams in asbestos-laden soils' made 'Perennial stream banks and seeps, serpentine'
2015 12 03

p. 422
SOLIDAGO spectabilis
UNABRIDGED SYNONYMS: Solidago guiradonis A. Gray var. spectabilis D.C. Eaton; Solidago missouriensis Nutt., misappl.
+ 'Solidago confinis var. spectabilis D.C. Eaton' made 'Solidago guiradonis A. Gray var. spectabilis D.C. Eaton' [in eFlora; unabridged synonyms not in TJM2]
2015 12 03 [change actually made on some unknown date previous to 2015 12 03]

p. 426
STEPHANOMERIA exigua
TAXON AUTHOR: Nutt.
+ 'Nutt' made 'Nutt.' [in TJM2; it was already correct in eFlora]
2013 09 03

p. 427
STYLOCLINE
INFLORESCENCE: heads disciform, +- sessile, 2--10 per dense group; involucre 0 or vestigial, simulated by paleae, or +- cup-like (then phyllaries 1--4, +- unequal, like reduced paleae); receptacle length (2.8)4--8 &times; width, +- cylindric to club-shaped, glabrous; paleae of pistillate flowers each generally enclosing flower, or outermost open, deciduous with fruit, +- boat-shaped, acute to obtuse, +- woolly abaxially, obscurely parallel-veined (veins 5+), margin reflexed distally or fully as scarious wing, wing terminal, erect to curved inward, visible in head; paleae of disk flowers generally 2--5, reduced, erect, +- folded, lanceolate, acute, papery, scarious, glabrous or cobwebby.
+ '2--10 perennial herb (dense) group;' made '2--10 per dense group;' [in eFlora, where "per" had been incorrectly expanded to "perennial herb"; abbreviations retained in TJM2, where "per" means "perennial herb" in some cases, and "per" in others (e.g., in this case, where the number of heads per dense group is intended -- also, parentheses around "dense" removed).]
2014 06 26

p. 430
SYMPHYOTRICHUM bracteolatum
BIOREGIONAL DISTRIBUTION: KR, CaR, SN, GB;
+ 'KR,' added 
2015 08 26

p. 431
SYMPHYOTRICHUM frondosum
BIOREGIONAL DISTRIBUTION: KR, CaR, SN, n CW, TR, PR, GB;
+ 'KR,' added 
2015 08 26

p. 431
SYMPHYOTRICHUM subulatum var. elongatum
DISTRIBUTION OUTSIDE CALIFORNIA: Baja CA; native to se US, West Indies.
+ 'native to to se US' made ''native to se US' 
2012 03 27

p. 432
SYNTRICHOPAPPUS lemmonii
RAY FLOWER: ray 2--3(4) mm.
+ '2--3 mm' made '2--3(4) mm'
2012 06 12

p. 436 [location or approximate location where treatment would appear in TJM2 were it not unabridged and therefore only in eFlora]
UNABRIDGED
THELESPERMA
INFLORESCENCE: heads 1--few, radiate or discoid; involucre bell-shaped to hemispheric; phyllaries in 2 series, outer spreading, thick, free, inner erect, thin, +- fused; receptacle flat, paleate; paleae curved around disk fls.
+ 'radiate or discoid;' made 'discoid [radiate];' [in eFlora; unabridged treatments not included in TJM2]
2012 03 27

p. 436 [location or approximate location where treatment would appear in TJM2 were it not unabridged and therefore only in eFlora]
UNABRIDGED
THELESPERMA
+ key to species deleted [from eFlora; unabridged treatments not included in TJM2]
2012 03 27

p. 436 [location or approximate location where treatment would appear in TJM2 were it not unabridged and therefore only in eFlora]
UNABRIDGED
WAIF
THELESPERMA simplicifolium var. simplicifolium
+ entire treatment deleted [from eFlora; unabridged treatments not included in TJM2]
2012 03 27

p. 436
TOLPIS barbata
BIOREGIONAL DISTRIBUTION: NCoRO, CCo, SnFrB;
+ ', SnFrB' added
2019 07 16

p. 442
WYETHIA glabra
BIOREGIONAL DISTRIBUTION: KR, s NCoR, CW.
+ 'KR,' added 
2015 08 26

p. 444
IMPATIENS balfourii
BIOREGIONAL DISTRIBUTION: NCo, n CCo, s SnFrB, ne SCo, SnBr;
+ ', SnBr' added 
2015 02 27

p. 448
BETULACEAE
PISTILLATE FLOWER: sepals 0--4; petals 0; stamens 0; pistil 1, ovary inferior or superior, chambers 2, each 1-ovuled by abortion, stigmas 2.
+ 'ovary inferior' made 'ovary inferior or superior'
2012 03 27

p. 448
BETULACEAE
1. Lf base oblique-cordate; frs 1--2 per catkin, not winged, each enclosed in a papery involucre of 2 fused bracts; pistillate calyx present, ovary inferior .....-> CORYLUS
+ '; pistillate calyx present, ovary inferior' added
2012 03 27

p. 448
BETULACEAE
1' Lf base subcordate, rounded, +- truncate, or tapered; frs many per catkin, winged, each subtended but not enclosed by 1 bract; pistillate calyx 0, ovary superior
+ '; pistillate calyx 0, ovary superior' added
2012 03 27

p. 450
CATALPA
ETYMOLOGY: (Muscogee: winged head, for corolla)
+ '(Spelling error for Catawba, North America native name for the tree)' made '(Muscogee: winged head, for corolla)'
2015 02 10

p. 450
CATALPA
UNABRIDGED ETYMOLOGY: (Muscogee: kutúhlpa, winged head, for corolla; corrupted to "Cataba" and "Catawba" based on erroneous attribution to a different tribe of Native Americans; both "Caltalpah" and "Catalpa" used by Catesby, who introduced the plant to England in 1726; Linnaeus published _Bignonia catalpa_ in 1753; Scopoli established the genus _Catalpa_ in 1777)
+ '(Spelling error for Catawba, Native American name for the tree (tribal totem), made by Scopoli in formally describing the genus)' made '(Muscogee: kutúhlpa, winged head, for corolla; corrupted to "Cataba" and "Catawba" based on erroneous attribution to a different tribe of Native Americans; both "Caltalpah" and "Catalpa" used by Catesby, who introduced the plant to England in 1726; Linnaeus published _Bignonia catalpa_ in 1753; Scopoli established the genus _Catalpa_ in 1777) [in eFlora; no unabridged etymology in TJM2]
2015 02 10

p. 450
CATALPA speciosa
BIOREGIONAL DISTRIBUTION: n SNF, ScV, PR;
+ 'ScV,' added 
2013 10 07

p. 450
CHILOPSIS linearis (Cav.) Sweet subsp. arcuata
BIOREGIONAL DISTRIBUTION: SCo, e TR, e PR, D;
+ 'D, adjacent TR, PR' made 'SCo, e TR, e PR, D' 
2013 10 07

p. 450 
(superseded by Supplement I)
BORAGINACEAE
LEAF: basal and/or cauline, generally simple, generally alternate.
+ 'simple or compound' made 'generally simple' [in TJM2; not abbreviated in eFlora]
2014 04 16

p. 454
AMSINCKIA lycopsoides
BIOREGIONAL DISTRIBUTION: NW, CaRF, SNF, GV, CW, SCo, ChI, PR;
+ 'SnFrB, CCo, SCoR' collapsed to 'CW' 
2012 03 27
p2

p. 455
ASPERUGO procumbens
LEAF: +- cauline, opposite at base, alternate above, petioled to sessile above; blades 2--7 cm, oblanceolate to elliptic, scabrous.
+ 'simple, +- cauline' made '+- cauline'
2014 04 16

p. 458
CRYPTANTHA
77. Bracts present; nutlets 1.2--1.5 mm
+ 'nutlets 1.2--1.4(1.5) mm' made 'nutlets 1.2--1.5 mm'
2015 01 07

p. 458
CRYPTANTHA
80. Nutlets 1.5--2 mm, tubercle tips not translucent; nutlets 1--4, lance-ovate to ovate .....-> C. barbigera var. barbigera
80' Nutlets +- 3 mm, tubercle tips translucent; nutlets 3--4, triangular-ovate .....-> C. clokeyi
+ leads placed in alphabetical order
2012 04 18

p. 460
CRYPTANTHA decipiens
BIOREGIONAL DISTRIBUTION: se SNH, Teh, SnJV, SnFrB, SCoR, ne SCo, WTR, n SnGb, ne SnBr, e PR, W&I, D;
+ 'SnJV, SnFrB, SCoR, ne SCo, WTR,' added
2016 08 30

p. 462
CRYPTANTHA fendleri
COMMON NAME: SAND DUNE CRYPTANTHA
+ 'SANDDUNE' made 'SAND DUNE'
2012 11 14

p. 463
CRYPTANTHA holoptera
LEAF: 3--6 cm; basal, lower cauline gen few, elliptic to lanceolate, short-petioled, long-lived; upper sessile; short-rough-bulbous-based-bristly, bristles sparse abaxially.
+ 'bristles parse abaxially' made 'bristles sparse abaxially'
2013 02 21 ['bristles parse abaxially' made 'bristles sparse abaxially' in eFlora on 2013 02 21, but the change was not actually made on this page until 2014 04 11]

p. 464
CRYPTANTHA microstachys
TAXON AUTHOR: (Greene ex A. Gray) Greene
+ '(Greene ex A. Gray) Greene.' made '(Greene ex A. Gray) Greene' [correction made only in eFlora; already correct in TJM2]
2018 06 05

p. 468
DRAPERIA systyla
LEAF: cauline, opposite; lower petioled, upper sessile; blade 1--7 cm, ovate, entire.
+ 'simple, cauline' made 'cauline'
2014 04 16

p. 468
DRAPERIA systyla
FRUIT: capsule, 2--3 mm wide, spheric, long-hairy.
+ 'capsule,' added
2013 03 27

p. 468
DRAPERIA systyla
FLOWERING TIME: Jun--Jul
+ 'Jun--Jul' made 'May--Oct'
2013 03 27

p. 470
ECHIUM plantagineum
WEEDINESS: Potentially problematic weed
+ 'Potentially problematic weed' added [to replace removed broken diamond symbol in TJM2 (as a note), and 'Weed listed by Cal-IPC' in eFlora]
2013 08 07

p. 470
EMMENANTHE penduliflora
LEAF: basal and cauline, alternate; lower short-petioled, upper sessile, generally clasping, 1--12 cm, generally < 3 cm wide, toothed to deep-pinnate-lobed.
+ 'simple, basal, cauline' made 'basal and cauline'
2014 04 16

p. 470
EMMENANTHE penduliflora
FLOWER: calyx lobes 4--11 mm, 1--4 mm wide, lanceolate to ovate, glandular; corolla 6--15 mm, bell-shaped, white, yellow, or pink, glandular-hairy, persistent in age, withering, papery, enclosing fr; stamens incl, gen equal, attached +- at same level; ovary chambers appearing 2, style incl, 1--4 mm, lobes 2.
+ 'lanceolate' made 'lanceolate to ovate'; 'persistent, in age' made 'persistent in age'; 'lobes 2, 1--4 mm.' made '1--4 mm, lobes 2.'
2013 03 27

p. 470
EMMENANTHE penduliflora
1. Corolla yellow to cream; fr oblong .....-> var. penduliflora
+ '; fr oblong' added
2013 03 27

p. 470
EMMENANTHE penduliflora
1' Corolla white to pink; fr ovoid .....-> var. rosea
+ '; fr ovoid' added
2013 03 27

p. 470
ERIODICTYON
LEAF: cauline, alternate.
+ 'simple, cauline' made 'cauline'
2014 04 16

p. 471
ERIODICTYON parryi
LEAF: dense, sessile; blade 4--30 cm, lanceolate, entire or toothed, margins of upper occasionally rolled under.
+ 'dense, simple, cauline, alternate, sessile' made 'dense, sessile'
2014 04 16

p. 471
ERIODICTYON parryi
NOTE: Move from _Turricula_ based on molecular data; causes severe contact dermatitis in some people.
+ '; causes severe contact dermatitis in some people' inserted
2013 07 31

p. 472
EUCRYPTA
LEAF: 1--3-pinnate-lobed; lower cauline opposite, petioled, upper alternate, upward smaller, sessile, clasping; petioles generally narrow-winged, ciliate.
+ 'simple, 1--3-pinnate-lobed' made '1--3-pinnate-lobed'
2014 04 16

p. 472
EUCRYPTA
FLOWER: calyx < 1/2-fused, bell-shaped, glandular, lobes oblong to ovate to spoon-shaped, ciliate; corolla bell-shaped, gen >= calyx, with or without V-shaped transverse fold between each pair of filaments below throat; stamens incl, equal, equally attached; ovary chamber 1 (or appearing +- 5 from complex, enlarged placenta), ovules on both sides of placenta, style 1, stigmas 2.
+ 'lobes oblong to spoon-shaped' made 'lobes oblong to ovate to spoon-shaped'; 'with V-shaped transverse fold' made 'with or without V-shaped transverse fold'
2013 03 27

p. 472
EUCRYPTA chrysanthemifolia
FLOWER: calyx 2--4 mm, lobes spreading, not enclosing fr; corolla 2--6 mm, V-shaped fold 0, lobes hairy abaxially; style < 3 mm.
+ ', V-shaped fold 0' inserted
2013 03 27

p. 472
EUCRYPTA micrantha
FLOWER: calyx 2--5 mm, lobes erect, enclosing fr, gen black-glandular; corolla 2--4 mm, white or blue-purple, tube yellow, V-shaped fold present; style 1--2 mm.
+ ', V-shaped fold present' inserted
2013 03 27

p. 474
HACKELIA brevicula
BIOREGIONAL DISTRIBUTION: W&I (Mono, n Inyo cos.).
+ '(Mono Co.)' made '(Mono, n Inyo cos.)'
2016 01 22

p. 475
HARPAGONELLA
SPECIES IN GENUS: 2 spp.: southern California, southern Arizona, northern Baja California, northern Sonora.
+ '1 sp.' made '2 spp.: southern California, southern Arizona, northern Baja California, northern Sonora.'
2017 06 22

p. 475
HARPAGONELLA palmeri
DISTRIBUTION OUTSIDE CALIFORNIA: northern Baja California.
+ 'southwestern Arizona, northwestern Mexico.' made 'northern Baja California.'
2017 06 22

p. 476
HESPEROCHIRON
LEAF: in basal rosette, spreading or ascending; blade tapered to petiole, generally entire, generally ciliate.
+ 'simple, in basal rosette' made 'in basal rosette'
2014 04 16

p. 476
HESPEROCHIRON
FLOWER: calyx lobes 2--9 mm, gen unequal, glabrous to hairy, ciliate; corolla scales 0, tube gen dense-hairy inside, throat gen yellow, lobes glabrous to hairy, white or +- blue, gen tinged or marked with lavender or purple; stamens incl, gen unequal, filament base widened; ovary hairy, chamber 1, style 1, stigmas 2, 2--5 mm.
+ 'scales 0,' inserted after 'corolla'
2012 04 06

p. 476
HESPEROCHIRON
FLOWER: calyx lobes 2--9 mm, gen not alike, glabrous to hairy, ciliate; corolla scales 0, tube gen dense-hairy inside, throat gen yellow, lobes glabrous to hairy, white or +- blue, gen tinged or marked with lavender or purple; stamens incl, gen unequal, filament base widened; ovary hairy, chamber 1, style 1, 2--5 mm, stigmas 2.
+ 'gen unequal' made 'gen not alike'; 'stigmas 2, 2--5 mm.' made '2--5 mm, stigmas 2.'
2013 03 27

p. 476
HESPEROCHIRON
FRUIT: capsule, 5--11 mm, ovoid, hairy.
+ 'capsule,' inserted
2013 03 27

p. 476
HESPEROCHIRON californicus
INFLORESCENCE: fls gen > 5 per pl.
+ 'per pl' added [in TJM2; not abbreviated in eFlora]
2013 11 04

p. 476
HESPEROCHIRON californicus
FLOWERING TIME: May--Jul
+ 'May--Jul' made 'Apr--Jul'
2013 03 27

p. 476
HESPEROCHIRON pumilus
INFLORESCENCE: fls gen1--8 per pl.
+ 'per pl' added [in TJM2; not abbreviated in eFlora]
2013 11 04

p. 476
HESPEROCHIRON pumilus
BIOREGIONAL DISTRIBUTION: KR, NCoRI, CaRH, SNH, Teh, WTR, GB (exc W&I), n DMoj (Death Valley);
+ 'MP, SNE' collapsed to 'GB' 
2012 03 27
p2

p. 480
NAMA
LEAF: cauline, generally alternate, margin crenate-dentate or generally entire, wavy, flat, or rolled under.
+ 'simple, margin crenate-dentate' made 'margin crenate-dentate'
2014 04 16

p. 480
NAMA
4. Style 1, lobed < 1/2 length
5. Corolla limb > 3.5 mm diam, lobes >= 2 mm wide .....-> N. aretioides
6. Style 1--2 mm .....-> var. californica
6' Style 3--7 mm .....-> var. multiflora
5' Corolla limb < 3.5 mm diam, lobes < 2 mm wide .....-> N. densa 
7. Pl gray-canescent, hairs gen spreading, rough; style 0.3--1 mm .....-> var. densa
7' Pl green, hairs gen sparse-bristly-strigose; style (0.6)1--2.5 mm .....-> var. parviflora 
4' Styles 2
+ key to members of Nama, between and including leads 4. and 4', replaced with the above [in TJM2; not abbreviated in eFlora], in which in addition 'um' terminations made 'a' terminations in plant names
2013 07 31

pp. 480-481
NAMA
+ 'um' terminations made 'a' terminations in all plant names
2013 07 31

p. 481
NEMOPHILA
LEAF: cauline, lower generally opposite, upper opposite or alternate, generally reduced; petiole generally bristly-ciliate; blade pinnate-toothed or -lobed, generally bristly.
+ 'simple, cauline' made 'cauline'
2014 04 16

p. 482
NEMOPHILA maculata
FLOWERING TIME: Mar--Jul
+ 'May' made 'Mar'
2016 04 21

p. 484
PECTOCARYA
FLOWER: basal cleistogamous fls gen 0; calyx gen < fr, lobes free, not arched over 1 nutlet, with hooked or straight prickles, in fr +- equal or, if unequal, upper 2 > others; corolla funnel-shaped, white, limb 0.5--2.5 mm diam, appendages white or yellow; style attached to receptacle, unbranched, gen persistent, stigma 1, head-like.
+ 'appendages white' made 'appendages white or yellow'
2012 03 27

p. 485 
(superseded by Supplement I)
PHACELIA
ETYMOLOGY: (Greek: cluster, from dense infl)
TOXICITY: Bristly hairs may cause dermatitis.
REFERENCE: Gilbert et al. 2005 Syst Bot 30:627--634
+ 'Bristly hairs may cause dermatitis.', as TOXICITY, moved to proper position
2012 03 27
p2

p. 486 
(superseded by Supplement I)
PHACELIA, Group 2
26. Calyx lobes +- not alike, especially in fruit; seeds 1--2(4) [couplet not present in TJM2]
+ 'seeds 1--2' made 'seeds 1--2(4)' 
2015 09 30

p. 487 
(superseded by Supplement I; changes below correspond to eFlora, but to couplet 32 in TJM2, which was changed for Supplement I)
PHACELIA, Group 2
33. Pedicels +- thread-like, > 5 mm in fruit .....-> P. pedicellata
+ 'Calyx lobes 1--1.5 mm > fruit; pedicels +- thread-like' made 'Pedicels +- thread-like, > 5 mm in fruit'
33' Pedicels stout, < 5 mm in fruit
+ 'Calyx lobes +- = fruit; pedicels stout' made 'Pedicels stout, < 5 mm in fruit'
2016 03 23

p. 490 
(superseded by Supplement I)
PHACELIA
66' [62' in eFlora] Corolla tube white to lavender, lobes generally purple; leaf veins impressed; fruit beaked; calyx lobes not alike; e KR, n&c SNF, SNH .....-> P. vallicola
+ 's CaR, n&c SN' made 'e KR, n&c SNF, SNH'
2016 08 23

p. 490 
(superseded by Supplement I)
PHACELIA argentea
COMMON NAME: SAND DUNE PHACELIA
+ 'SANDDUNE' made 'SAND DUNE'
2012 11 14

p. 492 
(superseded by Supplement I)
PHACELIA breweri
ECOLOGY: Chaparral, talus, rocky soils, slopes;
+ 'Rocky soils, slopes, chaparral, oak woodland' made 'Chaparral, talus, rocky soils, slopes'
2016 04 26

p. 492 
(superseded by Supplement I)
PHACELIA campanularia subsp. vasiformis
TAXON AUTHOR: G. W. Gillett
+ 'G. Gillett' made 'G. W. Gillett'
2012 09 10

p. 492 
(superseded by Supplement I)
PHACELIA cicutaria var. hispida
TAXON AUTHOR: (A. Gray) J.T. Howell
+ 'J.T. Howell' made '(A. Gray) J.T. Howell'
2012 09 10

p. 493
(superseded by Supplement I)
PHACELIA corymbosa
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaRH, n SNH;
+ ', n SNH' added
2016 08 23

p. 493 
(superseded by Supplement I)
PHACELIA dalesiana
SYNONYMS: Howellanthus d. (J.T. Howell) Walden & R. Patt.
+ 'Howellanthus d. (J.T. Howell) Walden & R. Patt.' added [in TJM2; not abbreviated in eFlora]
2012 03 27

p. 493 
(superseded by Supplement I)
PHACELIA distans
HABIT+: Ann 5--80 cm. 
+ '15--80' made '5--80'
LEAF: 20--100(150) mm; blade > petiole, gen 1--2-compound, segments toothed.
+ 'blade >> petiole' made 'blade > petiole'  [in TJM2; not abbreviated in eFlora]
FLOWER: calyx lobes 3--6 mm, 4--8 mm in fr, gen not alike, linear to ovate to oblong to oblanceolate, densely hairy, glandular; corolla 6--9 mm, funnel- to bell-shaped, throat marked with dark lavender spots opposite scales if corolla blue, spots 0 if corolla white, scales fused to filament bases, ovate; stamens 8--12 mm, incl to exserted, glabrous, filaments white or purple; style 3.5--7 mm, incl to exserted in fl, cleft 2/3--3/4, glabrous to +- hairy below.
+ 'stamens 8--12 mm, gen incl or +- = corolla' made 'stamens 8--12 mm, incl to exserted' [in TJM2; not abbreviated in eFlora]
+ 'style 3.5--7 mm, gen incl or +- = corolla in fl, cleft 2/3--3/4, glabrous.' made 'style 3.5--7 mm, incl to exserted in fl, cleft 2/3--3/4, glabrous to +- hairy below.' [in TJM2; not abbreviated in eFlora]
FRUIT: 2--3.1 mm, +- spheric to oblong, puberulent.
+ '2--3 mm, +- spheric, puberulent.' made '2--3.1 mm, +- spheric to oblong, puberulent.
SEED: 1--2(4), 2--3.1 mm, pitted.
+ '2--3 mm' made '2--3.1 mm'
2015 09 30

p. 500 [location where treatment appears in TJM2, but correction only to eFlora because group numbers not given in Phacelia in TJM2] 
(superseded by Supplement I)
PHACELIA ramosissima
TAXON AUTHOR: Lehm. (Group 1)
+ 'Group 3' made 'Group 1'
2014 10 29

p. 500
(superseded by Supplement I)
PHACELIA vallicola
BIOREGIONAL DISTRIBUTION: e KR, n&c SNF, SNH.
+ 's CaR, n&c SNF, SNH.' made 'e KR, n&c SNF, SNH.'
2016 08 23

p. 501
PHOLISTOMA
LEAF: cauline, lower opposite, upper alternate; petioles generally winged, clasping; blade pinnate-lobed, uppermost reduced, short-petioled, generally deltate, 3-lobed, with small, sharp bristles both surfaces.
+ 'simple, cauline' made 'cauline'
2014 04 16

p. 501
PHOLISTOMA
FRUIT: capsule, spheric, stout-bristly-hairy.
+ 'capsule,' inserted
2013 03 27

p. 501
PHOLISTOMA
2. Petiole narrow-winged; style 1--3 mm; seeds 1--2 mm .....-> P. racemosum
+ '; seeds 1--2 mm' inserted
2013 03 27

p. 501
PHOLISTOMA
2' Petiole wide-winged; style 4--8 mm; seeds 2--3 mm .....-> P. auritum
+ '; seeds 2--3 mm' inserted
2013 03 27

p. 502
PLAGIOBOTHRYS
LEAF: simple, cauline or basal and cauline, 0.5--10 cm, generally smaller tipward, linear to oblanceolate.
+ 'simple, cauline or basal and cauline' made 'cauline or basal and cauline'
2014 04 16

p. 502
PLAGIOBOTHRYS
20' Nutlet not papillate or regularly papillate, cross-ribs prominent; c&s SN, SNH, Teh, SnBr .....-> P. torreyi
+ 's SCoRO,' deleted
2017 10 03

p. 503
PLAGIOBOTHRYS
28. Nutlet abaxially with large prickles, barb-tipped or not, or rarely +- without
+ 'rarely +- 0' made 'rarely +- without'
2014 07 14

p. 503
PLAGIOBOTHRYS
30. Nutlet shiny; prickles (0)few, on ridges abaxially .....-> P. austiniae
+ 'prickles few' made 'prickles (0)few' 
2014 07 14

p. 504
PLAGIOBOTHRYS acanthocarpus
FRUIT: nutlet 1--1.8 mm, ovate, dull to shiny; abaxial cross-ribs prominent, irregular-net-like, prickles (0)few--many, slender, barb-tipped, +- in columns, 0 adaxially; scar near base, +- triangular, 25--60% fruit length, deep-concave.
+ 'prickles few--many' made 'prickles (0)few--many'
2014 07 14

p. 504
PLAGIOBOTHRYS austiniae
FRUIT: nutlet 2--3 mm, ovate, acuminate, +- granular, shiny; abaxial ridge, lateral ridges prominent, cross-ribs 0 to obscure, prickles (0 or) on ridges, few, stout, barb-tipped, +- 0 adaxially; scar near base, +- triangular, deep-concave.
+ 'prickles on ridges, few' made 'prickles (0 or) on ridges, few'
2014 07 14

p. 505
PLAGIOBOTHRYS glyptocarpus var. glyptocarpus
BIOREGIONAL DISTRIBUTION: NCoRI, CaRF, n&c SNF, n ScV;
+ 'CaR' made 'CaRF' 
2016 05 11

p. 506
PLAGIOBOTHRYS kingii var. harknessii
BIOREGIONAL DISTRIBUTION: c SNH, GB;
+ 'MP, SNE' collapsed to 'GB' 
2012 03 27
p2

p. 509
PLAGIOBOTHRYS torreyi var. perplexans
BIOREGIONAL DISTRIBUTION: c&s SN.
+ ', s SCoRO' deleted
2017 10 03

p. 509
ROMANZOFFIA
HABIT+: Per [ann], +- scapose, base bulb-like or from tubers [taproot]; herbage +- glabrous to gen sparse-soft-hairy.
+ 'Ann, per' made 'Per [ann]'; 'or from tubers' made 'or from tubers [taproot]'
2013 03 27

p. 509
ROMANZOFFIA
LEAF: simple; basal long-petioled, reniform to round, shallow-lobed or toothed; cauline few, reduced, alternate [gen opposite].
+ 'alternate' made 'alternate [gen opposite]'
2013 03 27

p. 509
ROMANZOFFIA
LEAF: basal long-petioled, reniform to round, shallow-lobed or toothed; cauline few, reduced, alternate [gen opposite].
+ 'simple; basal long-petioled' made 'basal long-petioled'
2014 04 16

p. 509
ROMANZOFFIA
FRUIT: capsule, oblong to ovoid to obovoid.
+ 'oblong to ovoid' made 'oblong to ovoid to obovoid'
2013 03 27

p. 509
ROMANZOFFIA californica
HABIT+: Pl 10--40 cm; tubers clustered, ovoid, green to brown, tomentose.
+ 'brown' made 'green to brown'
2013 03 27

p. 509
ROMANZOFFIA californica
FLOWER: calyx lobes 2--5 mm, lance-linear, gen acute, occ glabrous, glandular or not; corolla 5--12 mm; ovary sparse-soft-hairy, glandular; style 4--7 mm.
+ 'glabrous' made 'occ glabrous'
2013 03 27

p. 509
ROMANZOFFIA tracyi
DISTRIBUTION OUTSIDE CALIFORNIA: to BC.
+ 'WA' made 'BC' 
2013 03 27

p. 510
TIQUILIA canescens var. canescens
BIOREGIONAL DISTRIBUTION: se DMoj, DSon;
+ 'DMtns' made 'se DMoj'  
2015 04 30

p. 510
TRICARDIA watsonii
LEAF: gen in basal rosette, petioled, 2--9 cm, 5--25 mm wide; cauline alternate, lower short-petioled, upper sessile, 6--20 mm, 3--15 mm wide, entire.
+ 'simple, gen in basal rosette' made 'gen in basal rosette' [in TJM2; not abbreviated in eFlora]
2014 04 16

p. 510
TRICARDIA watsonii
FLOWER: calyx lobes 5, unequal, not alike, enlarged in fr, outer 3 cordate, 5--9 mm, 9--25 mm in fr, scarious, veiny, green to +- purple, inner 2 +- 4 mm, linear; corolla 4--8 mm, bell-shaped to rotate, white to cream, gen marked lavender; stamens incl, unequal, equally attached; ovary chamber appearing 1, style 1, 3--4 mm, tip 2-lobed.
+ ', not alike, enlarged in fr' inserted; '9--25 mm in fr, wide, scarious' made '9--25 mm in fr, scarious'; 'linear, enlarged in fr;' made 'linear;'
2013 03 27

p. 510
TRICARDIA watsonii
FRUIT: capsule, 7--9 mm, glabrous.
+ 'capsule,' inserted
2013 03 27

p. 520
ARABIS blepharophylla
FLOWER: sepals 5--7 mm; petals (12)14--18 mm, 4--7 mm wide, widely spoon-shaped, rose-purple.
+ 'petals (12)14--18 cm' made 'petals (12)14--18 mm'
2014 10 27

p. 520
ARMORACIA rusticana
TAXON AUTHOR: G. Gaertn. et al.
+ 'P. Gaertn.' made 'G. Gaertn.'  [In eFlora, 'G. Gaertn. et al.' expanded to 'G. Gaertn., B. Mey., & Scherb.']
2016 01 14

p. 526
BOECHERA arcuata
BIOREGIONAL DISTRIBUTION: SNF, s SCoR, SCo, TR.
+ 'CW' made 's SCoR'
2018 01 09

p. 526
BOECHERA breweri subsp. shastaensis
BIOREGIONAL DISTRIBUTION: e KR, NCoRI, CaRF, n SNF, ScV (Sutter Buttes);
+ 'CaR' made 'CaRF' 
2015 06 12

p. 526
BOECHERA californica
BIOREGIONAL DISTRIBUTION: CCo, SW;
+ 'CCo,' added
2017 12 19

p. 528
BOECHERA inyoensis
ELEVATION: 1200--4000 m.
+ '3500' made '4000'
2019 11 19

p. 530
BOECHERA retrofracta
ELEVATION: 900--3312 m.
+ '2900' made '3312'
2018 08 01

p. 532
BRASSICA tournefortii
COMMON NAME: Sahara mustard
+ COMMON NAME added
2017 07 12

p. 535
CARDAMINE hirsuta
ELEVATION: < 800 m.
+ '600--800 m' made '< 800 m'
2014 06 10

p. 535
CARDAMINE pachystigma
BIOREGIONAL DISTRIBUTION: KR, NCoR, n SNF, SNH, s SCoRO.
+ 'KR,' added; 'CaR,' deleted 
2015 06 12

p. 535 [location or approximate location where treatment would appear in TJM2 were it not unabridged and therefore only in eFlora]
WAIF
CARRICHTERA annua
ELEVATION: < 100 m.
+ ELEVATION added [to eFlora, waifs not fully treated in TJM2]
2014 06 10

p. 535 [location or approximate location where treatment would appear in TJM2 were it not unabridged and therefore only in eFlora]
WAIF
CARRICHTERA annua
BIOREGIONAL DISTRIBUTION: CCo, SCo;
+ ',SCo' added [to eFlora, waifs not fully treated in TJM2]
2014 06 10

p. 536
CAULANTHUS anceps
ECOLOGY: Slopes, plains, roadsides, alkaline or not, vertic clay, rarely serpentine;
+ 'Open slopes, plains, generally alkaline soil, roadsides, hillsides' made 'Slopes, plains, roadsides, alkaline or not, vertic clay, rarely serpentine'
2016 04 26

p. 536
CAULANTHUS californicus
BIOREGIONAL DISTRIBUTION: s SnJV, WTR, formerly widespread in CA.
+ 's SnJV, WTR, formerly widespread in CA.' made 's SnJV, WTR.' 
2014 05 16

p. 536
CAULANTHUS californicus
NOTE: Formerly more widespread in s San Joaquin Valley.
+ NOTE added
2014 05 16

p. 536
CAULANTHUS flavescens
ECOLOGY: Dry, exposed slopes, open hillsides, vertic clay, often serpentine;
+ 'Dry, exposed slopes, gen on serpentine, open hillsides;' made 'Dry, exposed slopes, open hillsides, vertic clay, often serpentine;' [in TJM2; not abbreviated in eFlora]
2015 11 12

p. 542
DESCURAINIA nelsonii
RARITY STATUS:
+ 'SYMBOL 1' deleted [meaning that a star symbol was removed from TJM2, while 'Listed on CNPS Rare Plant Inventory' was removed from the eFlora]
2013 10 03

p. 542
DESCURAINIA pinnata
FLOWER: petals 1--3 mm.
+ 'petals, bright yellow to cream.' made 'petals 1--3 mm.'
2018 05 29

p. 542
DESCURAINIA pinnata
NOTE: _Descurainia pinnata_ subsp. _halictorum_ (Cockerell) Detling, _Descurainia pinnata_ subsp. _intermedia_ (Rydb.) Detling, _Descurainia pinnata_ subsp. _menziesii_ (DC.) Detling represent a heterogeneous mixture of intermediates within _Descurainia pinnata_ and its hybrids with other species.
+ 'species' made 'species.' [in eFlora; 'Descurainia pinnata' not included with above subspp. names in TJM2]
2013 07 31

p. 544
DRABA aureola
BIOREGIONAL DISTRIBUTION: CaRH (Lassen Volcanic National Park), e KR (Mount Eddy);
+ 'CaRH (Lassen Volcanic National Park),' added 
2015 03 03

p. 545
DRABA lonchocarpa
BIOREGIONAL DISTRIBUTION: c SNH (Convict Creek Basin, Mono Co.), n W&I (White Mtns);
+ ', n W&I (White Mtns)' added 
2016 01 25

p. 548
ERYSIMUM ammophilum
BIOREGIONAL DISTRIBUTION: c CCo (Monterey Bay), n ChI (San Miguel, Santa Rosa islands).
+ '(Santa Rosa Island)' made '(San Miguel, Santa Rosa islands)'
2015 02 11

p. 548
ERYSIMUM capitatum
TAXON AUTHOR: (Douglas ex Hook.) Greene
+ 'Erysimum capitatum' deleted [from eFlora only; already correct in TJM2]
2018 06 26

p. 548
ERYSIMUM cheiri
STEM: 1.5--8 dm, woody at base.
+ 'mm' made 'dm'
2014 12 09

p. 548
ERYSIMUM concinnum
RARITY STATUS: SYMBOL 1
+ 'SYMBOL 1' added [meaning that a star symbol was added to TJM2, while 'Listed on CNPS Rare Plant Inventory' was added to the eFlora]
2014 05 14

p. 549
ERYSIMUM menziesii
RARITY STATUS: SYMBOL 1
+ 'SYMBOL 1' added [meaning that a star symbol was added to TJM2, while 'Listed on CNPS Rare Plant Inventory' was added to the eFlora]
2015 02 11

p. 549
ERYSIMUM teretifolium
BIOREGIONAL DISTRIBUTION: sw SnFrB (Santa Cruz Sandhills, Santa Cruz Co.).
+ '(Santa Cruz Co.)' made '(Santa Cruz Sandhills, Santa Cruz Co.)'
2015 01 12

p. 552
LEPIDIUM
17' Pl puberulent or glabrous; mid-cauline lvs entire to serrate, dentate, lobed, or divided
+ 'mid-cauline lvs entire or dentate to serrate' made 'mid-cauline lvs entire to serrate, dentate, lobed, or divided'
2013 01 09

p. 553
LEPIDIUM campestre
WEEDINESS: Potentially problematic weed
+ 'Potentially problematic weed' added [to replace removed broken diamond symbol in TJM2 (as a note), and 'Weed listed by Cal-IPC' in eFlora]
2013 08 07

p. 554
LEPIDIUM heterophyllum
BIOREGIONAL DISTRIBUTION: KR, CaR;
+ 'KR,' added 
2015 08 12

p. 554
LEPIDIUM jaredii
ECOLOGY: Alkali bottoms, slopes, washes, dry hillsides, vertic clay, acidic, gypsiferous;
+ ', vertic clay, acidic, gypsiferous' added
2015 10 29

p. 556
NATURALIZED
LEPIDIUM strictum
+ 'NATIVE' made 'NATURALIZED' [font in TJM2 changed from that indicating NATIVE to that indicating NATURALIZED]
2016 01 20

p. 556
LEPIDIUM virginicum
LEAF: not rosetted, early-deciduous, (1)2.5--10(15) cm, obovate or spoon-shaped to oblanceolate, pinnately lobed to dentate; mid-cauline short-petioled, 1--6 cm, oblanceolate or linear, entire to serrate, lobed, or divided, base tapered, not lobed.
+ 'entire to serrate' made 'entire to serrate, lobed, or divided'
2013 01 09

p. 556
LEPIDIUM virginicum
NOTE: Generally divided into many subspecies based on poorly defined, inconsistent characters.
+ 'varieties' made 'subspecies'
2017 07 12

p. 558
NOCCAEA fendleri subsp. glauca
UNABRIDGED SYNONYMS: Thlaspi alpestre L. var. glaucum A. Nelson; Noccaea glauca (A. Nelson) Holub; Thlaspi fendleri var. glaucum (A. Nelson) C.L. Hitchc.
+ 'Thlaspi fendleri var. glauca' made 'Thlaspi fendleri var. glaucum' [in eFlora; unabridged synonyms not in TJM2]
2014 04 15 [on 2014 04 15, page number corrected, from p. 576 in original listing (which was posted on 2013 03 28)]

p. 558
PHYSARIA cordiformis
ECOLOGY: Steep hillsides, dry sandy, gravelly soils, juniper and sagebrush areas, rocky ridges, Bristlecone-pine forest;
+ ', Bristlecone-pine forest' added
2014 01 15

p. 558
PHYSARIA cordiformis
ELEVATION: 3200--3660 m.
+ '1500--2500' made '3200--3660'
2014 01 15

p. 558
PHYSARIA cordiformis
BIOREGIONAL DISTRIBUTION: W&I;
+ 'n DMtns (Clark, Grapevine mtns)' made 'W&I' 
2014 01 15

p. 558
PHYSARIA cordiformis
DISTRIBUTION OUTSIDE CALIFORNIA: NV.
+ 'to OR, ID, UT, AZ' made 'NV' 
2014 01 15

p. 560
PLANODES
SPECIES IN GENUS: 2 spp.: N. Am.
+ '1 sp.' made '2 spp.' 
2014 07 25

p. 560
NATURALIZED
PLANODES virginica
+ 'NATIVE' made 'NATURALIZED' [font in TJM2 changed from that indicating NATIVE to that indicating NATURALIZED]
2016 01 20

p. 560
PLANODES virginica
+ 'virginicum' made 'virginica'
2014 07 25

p. 561
RAPISTRUM
HABIT+: Ann [per]; hairs simple [or 0].
+ '[Ann] per' made 'Ann [per]' [in TJM2; not abbreviated in eFlora, where "per" expanded to "perennial herb"]
2014 07 23

p. 561
RAPISTRUM rugosum
HABIT+: Pl erect; hairs stiff.
+ 'Ann, erect' made 'Pl erect' [in TJM2; not abbreviated in eFlora]
2014 07 23

p. 561
RAPHANUS sativus
FRUIT: fusiform or lanceolate, occ ovoid; proximal segment 1--3.5 mm; terminal segment (1)3--15(25) cm, (5)7--13(15) mm wide, corky; pedicel spreading to ascending, 0.5--4 cm.
SEED: 2.5--4 mm, spheric to ovoid.
+ '(0.5)0.7--1.3(1.5) cm, corky' made '(5)7--13(15) mm wide, corky'

p. 562
RORIPPA curvisiliqua
LEAF: basal rosetted or not, early-deciduous; proximal, mid-cauline (2)3--9(13) cm, petioled or sessile, base lobed, oblong to oblanceolate, spoon-shaped, or obovate, pinnately lobed or divided; lateral lobes linear to oblong or ovate, entire or dentate.
+ 'basal not rosetted' made 'basal rosetted or not'
2015 03 19

p. 569
STREPTANTHUS bernardinus
UNABRIDGED NOTE: Restricted in Baja California to Sierra Juarez and Sierra San Pedro Martir.
+ 'Restricted in the United States to San Bernardino and San Diego cos., and in Baja California to Sierra Juarez and Sierra San Pedro Martir.' made 'Restricted in Baja California to Sierra Juarez and Sierra San Pedro Martir.'  [in eFlora; no unabridged notes in TJM2]
2014 02 05

p. 570
STREPTANTHUS glandulosus subsp. glandulosus
BIOREGIONAL DISTRIBUTION: s NCoRO (uncommon), s NCoRH, c&s NCoRI, SnFrB, SCoRO (uncommon), n&c SCoRI.
+ 's NCoRI' made 'c&s s NCoRI' 
2015 05 18

p. 570
STREPTANTHUS glandulosus subsp. hoffmanii
UNABRIDGED SYNONYMS: Streptanthus glandulosus var. hoffmanii Kruckeb.
+ 'hoffmannii' made 'hoffmanii' [in eFlora; unabridged synonyms not in TJM2]
2013 03 28

p. 572
STREPTANTHUS insignis subsp. insignis
ECOLOGY: Openings in chaparral, badlands, rock outcrops, talus, graywacke, shale, often serpentine;
+ 'oak woodland, talus, gen serpentine' made 'badlands, rock outcrops, talus, graywacke, shale, often serpentine' [in TJM2; not abbreviated in eFlora]
2015 12 09

p. 572
STREPTANTHUS longisiliquus
BIOREGIONAL DISTRIBUTION: e KR, CaR.
+ 'e KR,' added 
2015 08 26

p. 573 [location or approximate location where treatment would have appeared in TJM2 had the genus included any members considered naturalized by then]
TEESDALIA
+ 'UNABRIDGED' removed [from above genus name in eFlora; both member species had been treated as waifs so there was no treatment in TJM2; with changing the status of one species to naturalized, a treatment for the genus will appear in future printings or revisions of TJM2]
2016 04 12

p. 573 [location or approximate location where treatment would have appeared in TJM2 had the genus included any members considered naturalized by then]
TEESDALIA
+ 'UNABRIDGED KEY' removed [from above key to members of genus in eFlora; both member species had been treated as waifs so there was no treatment in TJM2; with changing the status of one species to naturalized, a treatment for the genus will appear in future printings or revisions of TJM2]
2016 04 12

p. 573 [location or approximate location where treatment would have appeared in TJM2 had the genus included any members considered naturalized by then]
TEESDALIA
1' Petals unequal; stamens 6; leaf lobes obtuse .....-> T. nudicaulis
+ '[T. nudicaulis]' made 'T. nudicaulis' [square brackets removed because species now considered to be naturalized in CA and therefore deserving of full treatment]
2016 04 12

p. 573 [location or approximate location where treatment would have appeared in TJM2 had the genus included any members considered naturalized by then]
NATURALIZED
TEESDALIA nudicaulis
+ 'WAIF' made 'NATURALIZED' [font in future printings or revisions of TJM2 will be that indicating NATURALIZED]
2016 04 12

p. 576 
(superseded by Supplement I)
THYSANOCARPUS
NOTE: Revised taxonomy, too late for full treatment here, incl _Thysanocarpus desertorum_ A. Heller [_Thysanocarpus laciniatus_ var. _hitchcockii_], _Thysanocarpus rigidus_ (Munz) P.J. Alexander & Windham [_Thysanocarpus laciniatus_ var. _rigidus_], 5 subspp. of _Thysanocarpus curvipes_ (Alexander et al. 2010 Syst Bot 35:559--577).
+ 'Heller' made 'A. Heller'
2012 05 09

p. 576 
(superseded by Supplement I)
THYSANOCARPUS curvipes
UNABRIDGED NOTE:
+ UNABRIDGED NOTE deleted [in eFlora; no unabridged notes in TJM2]
2012 03 27

p. 578
CACTACEAE
FLOWER: gen 1 per areole, bisexual [unisexual], sessile, radial [bilateral]; perianth parts gen many [5], scale-like to petal-like; stamens many; ovary inferior [superior], style 1, stigma lobes gen several [3].
+ 'stigma lobes gen several [3]' made 'stigma lobes gen several [many]'
2012 03 27

p. 580
CORYPHANTHA chlorantha
BIOREGIONAL DISTRIBUTION: D (e San Bernardino Co.);
+ 'DMtns' made 'D' 
2016 01 25

p. 581[location or approximate location where treatment would have appeared in TJM2 had the species been described and included by then] (added to flora in Supplement II)
CYLINDROPUNTIA chuckwallensis
BIOREGIONAL DISTRIBUTION: DMoj (Joshua Tree National Park and nearby), c DSon; 
+ 'w DSon' made 'DMoj (Joshua Tree National Park and nearby), c DSon;' 
2015 01 22

p. 581 
(superseded by Supplement II)
CYLINDROPUNTIA munzii
SYNONYMS: C. &times;munzii (C.B. Wolf) Backeb.; Opuntia munzii C.B. Wolf; O. &times;munzii
+ 'C. &times;munzii (C.B. Wolf) Backeb.;' added [in TJM2; not abbreviated in eFlora]
2015 01 22

p. 581 
(superseded by Supplement II)
CYLINDROPUNTIA munzii
NOTE: Most localities in United States +- inaccessible.
+ 'Possible hybrid of _C. bigelovii_ and _C. echinocarpa_.' deleted [in TJM2; not abbreviated in eFlora]
2015 01 22

p. 582
ECHINOCEREUS mojavensis
BIOREGIONAL DISTRIBUTION: SnBr, W&I, D;
+ 'SnBr,' added 
2016 01 25

p. 584
FEROCACTUS cylindraceus
BIOREGIONAL DISTRIBUTION: e PR, D (esp e DMoj, w DSon);
+ 'e PR,' added 
2016 01 25

p. 584
MAMMILLARIA dioica
HABIT+: Pl with fls gen either all bisexual or all pistillate.
+ 'gen' inserted
2012 03 27

p. 585
OPUNTIA
ETYMOLOGY: (Possibly from Papago name ("opun") for this food pl; or for a spiny plant of Opus, Greece)
+ 'Indian' deleted
2017 06 22

p. 585
OPUNTIA
11. Longest spines gen 25--50 mm; style white when fresh; seed 3 mm; e PR, DMoj (desert mtns and lower montane slopes, canyons) .....-> O. chlorotica
+ 'DMtns' made 'DMoj (desert mtns and lower montane slopes, canyons)' 
2016 01 25

p. 585
OPUNTIA chlorotica
BIOREGIONAL DISTRIBUTION: e PR, DMoj (desert mtns and lower montane slopes, canyons);
+ 'DMtns' made 'DMoj (desert mtns and lower montane slopes, canyons)' 
2016 01 25

p. 585
OPUNTIA chlorotica
NOTE: If recognized taxonomically, stabilized hybrids with _Opuntia phaeacantha_ in DMtns (New York Mountains, eastern San Bernardino Co.), southern Nevada, western Arizona assignable to _Opuntia curvispina_ Griffiths (2n=44).
+ '_Opuntia &times;curvispina_' made '_Opuntia curvispina_'
2016 09 28

p. 586
OPUNTIA engelmannii var. engelmannii
BIOREGIONAL DISTRIBUTION: SnJt, e PR, DMtns;
+ 'e PR,' added 
2016 01 25

p. 586
OPUNTIA phaeacantha
UNABRIDGED NOTE: According to David J. Keil (pers. comm.), on dunes of sw San Luis Obispo and nw Santa Barbara cos. (s CCo).
+ UNABRIDGED NOTE added [in eFlora; no unabridged notes in TJM2]
2012 03 27

p. 586
OPUNTIA phaeacantha
NOTE: Hybrids with _Opuntia ficus-indica_ uncommon or rare; stabilized hybrids with _Opuntia chlorotica_ in DMtns (New York Mountains, eastern San Bernardino Co.), southern Nevada, western Arizona called _Opuntia curvispina_ Griffiths (2n=44).
+ '_Opuntia &times;curvispina_' made '_Opuntia curvispina_'
2016 09 28

p. 586
OPUNTIA vaseyi
+ '&times;vaseyi' made 'vaseyi'
2016 09 28

p. 586
OPUNTIA vaseyi
SYNONYMS: Opuntia &times;vaseyi (J. M. Coult.) Britton & Rose
+ SYNONYMS added
2016 09 28

p. 588
ASYNEUMA prenanthoides
BIOREGIONAL DISTRIBUTION: NW, CaRH, nw&n-c SN, s SNH, CCo, w SnFrB, n SCoRO;
+ 'CCo,' added 
2015 05 07

p. 589
CAMPANULA angustiflora
BIOREGIONAL DISTRIBUTION: NCo, NCoRI, SnFrB, SCoRO.
+ 'NCo,' added  
2015 05 07

p. 589
CAMPANULA angustiflora
BIOREGIONAL DISTRIBUTION: NCo, NCo/NCoRO, NCoRI, n SNH, SnFrB, SCoRO.
+ 'NCo/NCoRO,' 'n SHN,' added
2018 08 28

p. 592 p. 1283  [location or approximate location where statement would appear in TJM2 were it not relative only to and therefore only in eFlora]
GITHOPSIS pulchella subsp. pulchella
NOTE: Includes Githopsis pulchella var. glabra (Jeps.) Morin, Githopsis pulchella Vatke var. pulchella.
+ 'The subsp. include the following 2 varieties.' made 'Includes Githopsis pulchella var. glabra (Jeps.) Morin, Githopsis pulchella Vatke var. pulchella.'
2016 04 21

p. 595
NEMACLADUS
HABIT+: Ann, from taproot.
+ semicolon after 'Ann' made comma
2012 03 27
p2

p. 595
NEMACLADUS
8. Corolla white or cream with darker marks, divided +- to base, tube 0
+ 'with dark maroon or +- brown marks' made 'with darker marks'
2015 04 14

p. 595
NEMACLADUS
18' Anthers 0.1--0.3 mm, filaments 0.7--2 mm; bracts 2--9 mm, erect or appressed; corolla white or +- pink; fr bulging near base or not, tip acute
+ 'near base or base' made 'near base or not'
2012 03 27
p2

p. 596
NEMACLADUS capillaris
FLOWER: not inverted; hypanthium +- 1 mm; sepals +- 0.5 mm, elliptic to lanceolate, erect; corolla conspicuously 2-lipped, divided +- to base, white, lobes oblanceolate, glabrous, 3 adaxial erect, with +- pink area at tip and sometimes other darker markss as well, +- 0.7 mm, 2 abaxial spreading, 1 mm; filaments declined, +- 1 mm, tip +- curved, glabrous, appendage cells 2, directly attached to base of filaments, 0.1 mm, blunt, anthers 0.1--0.2 mm; ovary 1/2-inferior.
+ 'with +- pink spot on tip' made 'with +- pink area at tip and sometimes other darker marks as well' 
2015 04 14

p. 596
NEMACLADUS capillaris
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaR, n SNF, SNH, SCoRO, WTR, MP;
+ 'KR,' added; 'CaRH' made 'CaR' 
2015 08 25

p. 596
NEMACLADUS interior
BIOREGIONAL DISTRIBUTION: SNF, SNH, Teh, SnJV, SnBr.
+ 'n&c SNF' made 'SNF' 
2014 04 28

p. 596
NEMACLADUS orientalis
BIOREGIONAL DISTRIBUTION: SCoRI, SnGb, n SnBr, SNE, D;
+ 'n SnBr,' added 
2014 04 28

p. 601
LONICERA
6. Plant 6--9 dm; corolla yellow, tube +- wider upward; stigma exserted; KR, NCoRH, CaRH, SN, MP .....-> var. involucrata
+ 'mtns' made 'KR, NCoRH, CaRH' 
2015 08 31

p. 601
LONICERA
6' Plant 15--36 dm; corolla yellow, strongly tinged orange or red, tube cylindric; stigma included or +- exserted; NCo, NCoRH, NCoRI, CCo .....-> var. ledebourii
+ 'coastal' made 'NCo, NCoRH, NCoRI, CCo' 
2015 08 31

p. 601
LONICERA hispidula
FLOWER: corolla 12--16 mm, strongly 2-lipped, generally pink, glandular-hairy or hairy, upper lip shallowly 4-lobed; stamens, stigma exserted.
+ 'glandular-hairy,' made 'glandular-hairy or hairy,'
2014 10 27

p. 601
LONICERA involucrata var. involucrata
BIOREGIONAL DISTRIBUTION: KR, NCoRH, CaRH, SN, MP;
+ 'KR, NCoRH, CaRH,' added 
2015 08 25

p. 602
SYMPHORICARPOS albus (L.) S.F. Blake var. laevigatus
FLOWERING TIME: May--Jul(Sep)
+ '(Sep)' added
2015 10 06

p. 604
CARYOPHYLLACEAE
14' Calyx tube 9--25 mm, lanceolate to oblong-cylindric or cylindric to urn-shaped, green, not scarious between sepals
+ 'ovoid to widely cylindric' made 'lanceolate to oblong-cylindric or cylindric to urn-shaped'
2015 03 18 [correction of a correction made 2014 10 28]

p. 604
CARYOPHYLLACEAE
14' Calyx tube 7.5--20 mm, lanceolate to oblong or cylindric to urn-shaped, green, not scarious between sepals
+ '9--25' made '7.5--20'
2015 03 18

p. 604
CARYOPHYLLACEAE
21' Fruit +- ovoid or spheric to cylindric-oblong, not curved in upper 1/2, opening by 6 (8 or 10) valves
+ 'Fruit spheric to +- ovoid' made 'Fruit +- ovoid or spheric to cylindric-oblong' [in TJM2; not abbreviated in eFlora]
2014 10 27

p. 606
CERASTIUM
FLOWER: sepals (4)5, 3--12 mm, free, lanceolate to ovate, hairy to glandular-hairy, hairs generally not exceeding tip; petals 0 or (4)5, 2.5--15 mm, +- 2-lobed, white [purple tinged]; stamens (4,5)10; styles (4)5, 0.5--3.3 mm.
+ ', white [purple tinged]' added
2015 05 11

p. 607
EREMOGONE
8' Leaf blade 1--6 cm; sepals in flower 3--5.5(6.5) mm; KR, CaR, n SN, MP
+ 'KR,' added
2016 07 26

p. 608
EREMOGONE aculeata
BIOREGIONAL DISTRIBUTION: KR, CaR, MP;
+ 'KR,' added
2016 07 26

p. 608
EREMOGONE congesta var. crassula
RARITY STATUS:
+ 'SYMBOL 1' deleted [meaning that a star symbol was removed from TJM2, while 'Listed on CNPS Rare Plant Inventory' was removed from the eFlora]
2013 09 26

p. 608
EREMOGONE ursina
COMMON NAME: BEAR VALLEY SANDWORT
+ 'BIG' deleted
2012 03 27

p. 609
SYMPHORICARPOS rotundifolius var. rotundifolius (top of page, figure at right)
+ illustration must be modified to show corolla 'tube inside hairy in middle 1/3, otherwise glabrous' as indicated on p. 602, at 4' in key to members of Symphoricarpos as well as in description of Symphoricarpos rotundifolius var. rotundifolius
2015 02 25

p. 611
LYCHNIS coronaria
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaRF (Butte Co.), CaRH (Plumas Co.), n SNF, n SNH (Butte Co.), c SNH, SnFrB, SCo, WTR;
+ 'KR,' added 
2015 08 25

p. 611
MINUARTIA
4. Petals < sepals or 0; pl 1--5 cm; lf, sepal with gen 1, often faint vein .....-> M. pusilla
+ 'pls 1--5 cm; lf, sepal vein gen 1, often faint' made 'pl 1--5 cm; lf, sepal with gen 1, often faint vein' [in TJM2; not abbreviated in eFlora]
2015 03 15

p. 611
MINUARTIA
4' Petals 1--1.8 &times; sepals; pl (1)2--20(25) cm; lf abaxially with 1 faint vein or 3 veins with 1 prominent, sepal with +- 3 faint veins or 3 or 5 prominent ribs
+ 'pls gen 5--25 cm; lvs, sepals with veins +- 3, faint, or ribs 3 or 5, prominent' made 'pl (1)2--20(25) cm; lf abaxially with 1 faint vein or 3 veins with 1 prominent, sepal with +- 3 faint veins or 3 or 5 prominent ribs' [in TJM2; not abbreviated in eFlora]
2015 03 15

p. 611
MINUARTIA
5. Petals 1.5--1.8 &times; sepals; lf vein1, faint abaxially; sepal with 3 faint veins, lateral pair rarely extending to tip .....-> M. californica
+ 'sepal veins 3, faint, lateral pair rarely extending to tip .....-> M. californica' made 'lf vein1, faint abaxially; sepal with 3 faint veins, lateral pair rarely extending to tip' [in TJM2; not abbreviated in eFlora]
2015 03 15

p. 611
MINUARTIA
5' Petals 1--1.3 &times; sepals; lf veins 3, 1 prominent abaxially; sepal with 3 or 5 prominent ribs, lateral pair converging with midrib at tip .....-> M. cismontana
+ 'sepal ribs 3 or 5, prominent, lateral pair converging with midrib at tip' made 'lf veins 3, 1 prominent abaxially; sepal with 3 or 5 prominent ribs, lateral pair converging with midrib at tip' [in TJM2; not abbreviated in eFlora]
2015 03 15

p. 614
MOENCHIA erecta subsp. erecta
TAXON AUTHOR: (L.) G. Gaertn. et al.
+ 'P. Gaertn.' made 'G. Gaertn.' [In eFlora, 'G. Gaertn. et al.' expanded to 'G. Gaertn., B. Mey., & Scherb.']
2016 01 14

p. 614
PETRORHAGIA dubia
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaRF, n SNF, n&c SNH, ScV, CCo, SCoRO, PR;
+ 'KR,' added 
2015 08 26

p. 616
SAPONARIA
FLOWER: sepals 5, fused, tube prominent, 15--20 mm, 4--8 mm diam, lanceolate to oblong-cylindric, rounded, veins 20, obscure, lobes 5, 1.5--5 mm, triangular-acuminate; petals 5, 25--40 mm, claw long, limb entire to +- obcordate, appendages 2; stamens fused with petals to ovary stalk; styles 2, 12--15 mm.
+ 'lanceolate to oblong' made 'lanceolate to oblong-cylindric'
2015-03-18

p. 620
SILENE bolanderi
ECOLOGY: Serpentine and non-serpentine soils, oak, conifer woodland;
+ 'Non-serpentine soils' made 'Serpentine and non-serpentine soils'
2014 07 16

p. 620
SILENE bolanderi
NOTE: Segregation from _S. hookeri_ discussed by Nelson et al. (2006 Madro&ntilde;o 53:72--76).
+ 'Reasons for treating _Silene bolanderi_ and _Silene hookeri_ as separate species given by Nelson et al. (2006 Madro&ntilde;o 53:72--76).' made 'Segregation from _Silene hookeri_ discussed by Nelson et al. (2006 Madro&ntilde;o 53:72--76).'  [in TJM2; not abbreviated in eFlora. Also, changed from UNABRIDGED NOTE to NOTE.]
2014 10 06

p. 620
SILENE campanulata subsp. glandulosa
BIOREGIONAL DISTRIBUTION: KR, NCoR;
+ ', n CaR' deleted 
2015 08 26

p. 620
SILENE coniflora
UNABRIDGED NOTE: Rautenberg et al. (Syst. Bot. 37:226--237. 2012) reported morphological and molecular data that they think show that _Silene multinervia_ is "clearly not synonymous" with _Silene coniflora_.
+ UNABRIDGED NOTE added [in eFlora; no unabridged notes in TJM2]
2012 03 27

p. 622
SPERGULA
FLOWER: sepals 5, +- free, 2.5--5 mm, elliptic to +- ovate, glandular-hairy; petals 5, 2.5--4 mm, entire, white; stamens 5 or 10; styles 5, 0.3--0.6 mm.
+ 'petals 5, 2.5--4 mm, entire' made 'petals 5, 2.5--4 mm, entire, white' 
2014 10 28

p. 625
STELLARIA
STEM: 4-angled or round.
+ 'or round' added.
2012 03 27

p. 626
STELLARIA longifolia
LEAF: +- evenly spaced; blade 15--35 mm, linear to lance-linear; margin papillate, flat, dull, ciliate near base or not.
+ '15---35 cm' made '15--35 mm'
2014 07 28

p. 626
STELLARIA longipes subsp. longipes
LEAF: +- evenly spaced; blade 10--40 mm, linear to lance-linear; margin not papillate, flat, shiny, sometimes ciliate near base.
+ '10--40 cm' made '10--40 mm'
2014 07 28

p. 628
MORTONIA utahensis
ELEVATION: 350--2100 m.
+ '750' made '350'
2014 04 16 [on 2014 04 16, rounded to nearest 10 m (in conformance with JFP editorial policy), to 350 from 351 in original listing (which was posted on 2013 10 04)]

p. 628
MORTONIA utahensis
BIOREGIONAL DISTRIBUTION: n DMoj;
+ 'n DMtns' made 'n DMoj' 
2013 10 04

p. 629 
(superseded by Supplement I)
CHENOPODIACEAE
HABIT+: Ann to shrub; hairs simple, stellate or glandular; pls scaly, mealy, or powdery from collapsed glands; gen monoecious.
+ 'pls gen scaly or powdery from collapsed inflated salt gland cells' made 'pls gen scaly, mealy, or powdery from collapsed glands' 
2012 03 27

p. 629 
(superseded by Supplement I)
CHENOPODIACEAE
GENERA IN FAMILY: 100 genera, 1500 spp.: worldwide, esp deserts, saline or alkaline soils; some cult for food (_Beta vulgaris_ subsp. _vulgaris_, beet, Swiss chard; _Spinacia oleracea_ L., spinach; _Chenopodium quinoa_ Willd., quinoa); and some worldwide, naturalized ruderal or noxious agricultural weeds.
+ '_Beta vulgaris_, beet' made '_Beta vulgaris_ subsp. _vulgaris_, beet, Swiss chard'; '_Spinacia oleraceae_ L., spinach, Swiss chard' made '_Spinacea oleraceae_ L., spinach' 
2012 03 27

p. 629 
(superseded by Supplement I)
CHENOPODIACEAE
5' Lvs thread-like to +- cylindric, acute; bracts awl-like to ovate, gen spine-tipped; calyx in fr abaxially gen tubercled to winged .....-> SALSOLA
+ 'bracts wide-lanceolate, spine-tipped' made 'bracts awl-like to ovate, gen spine-tipped'
2012 03 27

p. 629 
(superseded by Supplement I)
CHENOPODIACEAE
9' Pistillate, bisexual fls gen with calyx (sometimes 0 if pistillate in _Monolepis_), not enclosed by 2 bracts
+ 'not enclosed by 2 bracts.' made 'not enclosed by 2 bracts'
2012 05 15

p. 629 
(superseded by Supplement I)
CHENOPODIACEAE
10. Pl gen with glands that collapse and become mealy or scaly; fr bracts variously shaped, gen thickened, tubercled and appendaged or not .....-> ATRIPLEX
+ 'spheric hairs' made 'glands'
2012 03 27

p. 633 
(superseded by Supplement I)
ATRIPLEX covillei
SYNONYMS: Atriplex phyllostegia (Torr. ex S. Watson) S. Watson sensu TJM (1993), in part
+ 'Atriplex phyllostegia (Torr. ex S. Watson) S. Watson' made 'Atriplex phyllostegia (Torr. ex S. Watson) S. Watson sensu TJM (1993), in part' [in TJM2; also done in eFlora, but under Stutzia covillei in a revised treatment]
2013 07 31 [replaces change made on 2012 06 15]

p. 633 
(superseded by Supplement I)
ATRIPLEX depressa
LEAF: gen opposite, blade 2.5--8(10) mm, ovate to cordate, gen densely white-scaly, tip acute.
+ 'tip acute;' made 'tip acute.'
2012 05 15

p. 639
CHENOPODIUM
8. Calyx tube > lobes; stamen 1 .....-> C. chenopodioides
+ 'Vertical seeds enclosed by calyx tube' made 'Calyx tube > lobes'
2015 04 02

p. 639
CHENOPODIUM
8' Calyx tube < lobes; stamens 2--3 .....-> C. rubrum
+ 'Vertical seeds subtended by calyx lobes, lobes fused only at base' made 'Calyx tube < lobes'
2015 04 02

p. 639
CHENOPODIUM
10. Fls 1 or in cymes, arranged in axillary and terminal panicles or branched spikes; lf blade glabrous to +- powdery abaxially .....-> _C. simplex_
+ '_C. simplex_' added
2012 03 27

p. 639
CHENOPODIUM
15. Lf powdery in youth, esp abaxially, or gen glabrous; fr wall scale-like at 20&times;; seed margin sharply angled .....-> _C. murale_
+ 'glabrous' made 'powdery in youth, esp abaxially, or gen glabrous'
2012 03 27

p. 641
CHENOPODIUM murale
LEAF: 0.8--4 cm, deltate or +- diamond-shaped to ovate, toothed, dark green, powdery in youth, esp abaxially, or gen glabrous, shiny, base wedge-shaped.
+ 'glabrous' made 'powdery in youth, esp abaxially, or gen glabrous'
2012 03 27

p. 645
MONOLEPIS
LEAF: gen reduced distally on st, +- lanceolate to oblanceolate or spoon-shaped, entire or not, tip obtuse to rounded.
+ 'gen entire' made 'entire or not'  [in TJM2; not abbreviated in eFlora]
2014 07 31

p. 645
MONOLEPIS spathulata
ELEVATION: 2000--3450 m.
+ '2700' made '3450'
2019 11 12

p. 645
MONOLEPIS
1. Proximal lvs with >= 2 teeth near base, hastate or not, distal +- entire; fr 1.1--1.5 mm, wall minutely pitted, adherent to seed .....-> M. nuttalliana
+ 'Proximal lvs 2-toothed to hastate near base' made 'Proximal lvs with >= 2 teeth near base, hastate or not, distal +- entire' [in TJM2; not abbreviated in eFlora]
2014 07 31

p. 645
MONOLEPIS nuttalliana
LEAF: 10--30(40) mm, +- lanceolate, fleshy, proximal with >= 2 teeth near base, hastate or not, distal +- entire.
+ 'proximal 2-toothed to hastate near base, distal lvs +- entire' made 'proximal with >= 2 teeth near base, hastate or not, distal +- entire' [in TJM2; not abbreviated in eFlora]
2014 07 31

p. 649
(superseded by Supplement I)
CISTACEAE 
2. Per or subshrub (sometimes fl in first year); basal lvs 0, cauline gen alternate; style < 2 mm .....-> CROCANTHEMUM
2' Ann; basal lvs in rosette, often withering early, proximal cauline gen opposite, distal 0--few, alternate; style 0 .....-> TUBERARIA
+ couplet 2 in key to genera of Cistaceae replaced with the above [in TJM2; not abbreviated in eFlora, where "per" expanded to "perennial herb"]
2013 07 31

p. 650
CISTUS incanus
NOTE: Possibly naturalizing in KR on I-5 median north of Shasta Lake.
+ NOTE added  [in TJM2; not abbreviated in eFlora]
2015 04 22

p. 650
(superseded by Supplement I)
HELIANTHEMUM 
NOTE: CA spp. esp abundant after fire, here retained in _Helianthemum_ (polyphyletic) in lieu of combination in _Crocanthemum_ (or _Hudsonia_) for _Helianthemum greenei_.
+ '_Husonia_' made '_Hudsonia_'
2012 10 09

p. 650
(superseded by Supplement I)
HELIANTHEMUM greenei
STEM: 15--68 cm.
+ '30' made '68'
2016 06 07

p. 650
TUBERARIA
LEAF: basal in rosette, often withering early; proximal cauline gen opposite, distal 0--few, alternate; petioled or not; stipuled or not.
+ 'cauline gen opposite' made 'proximal cauline gen opposite, distal 0--few, alternate' [in TJM2; not abbreviated in eFlora]
2013 07 31

p. 654
COMANDRACEAE
FLOWER: bisexual [unisexual]; perianth lobes [4]5(6); stamens opposite petals, on fleshy disk; ovary inferior, chamber 1, ovules 2--4, suspended from top of free-central placenta, style 1, stigma lobes 2--4.
+ 'calyx 0; petals 4--6;' made 'perianth lobes [4]5(6)'
2018 09 04

p. 654
COMANDRA
FLOWER: subtended by bractlet; perianth tube bell- or urn-shaped, lobes 5(6); stamen base hair-tufted.
+ 'calyx tube' made 'perianth tube'
2018 09 04

p. 654
COMANDRA umbellata (L.) Nutt. subsp. californica
FLOWER: 2--3.5 mm; perianth lobes lanceolate to narrow-ovate, +- white; anthers +- 0.5 mm.
+ 'calyx lobes' made 'perianth lobes'
2018 09 04

p. 654
CONVOLVULACEAE
5. Stigma lobes oblong, tips obtuse; calyx 7--25 mm; corolla 20--75 mm .....-> CALYSTEGIA
+ 'Stigma lobes oblong, not flat, tip obtuse;' made 'Stigma lobes oblong, tips obtuse;'
2012 12 11

p. 654
CONVOLVULACEAE
5' Stigma lobes linear to narrowly spoon-shaped, tips acute; calyx 3--10 mm; corolla <= 40 mm .....-> CONVOLVULUS
+ 'Stigma lobes linear to narrowly spoon-shaped, +- flat, tip acute;' made 'Stigma lobes linear to narrowly spoon-shaped, tips acute;'
2012 12 11

p. 655
CALYSTEGIA
FLOWER: gen showy; corolla glabrous, white or yellow to pink or purple; ovary chamber 1, style 1, stigma lobes 2, oblong, tips obtuse.
+ 'stigma lobes 2, oblong, swollen.' made 'stigma lobes 2, oblong, tips obtuse.'
2012 12 11

p. 655
CALYSTEGIA
2. Pl glabrous or nearly so
+ 'Pl glabrous' made 'Pl glabrous or nearly so' [in TJM2; not abbreviated in eFlora]
2015 02 19

p. 656
CALYSTEGIA macrostegia subsp. arida
BIOREGIONAL DISTRIBUTION: SnGb, SnBr, n PR (incl SnJt).
+ 'n PR' made 'n PR (incl SnJt)' 
2014 07 25

p. 656
CALYSTEGIA macrostegia subsp. cyclostegia
BIOREGIONAL DISTRIBUTION: CCo, SCoRO, n SCo, s ChI (Santa Catalina Island), WTR, PR.
+ 'SCoRO,' added 
+ 's ChI (Santa Catalina Island), WTR, PR' added 
2016 05 11

p. 656
CALYSTEGIA macrostegia subsp. intermedia
BIOREGIONAL DISTRIBUTION: SCo, s ChI, s WTR, SnGb, n PR (incl SnJt).
+ 'n PR' made 'n PR (incl SnJt)' 
2014 07 25

p. 656
CALYSTEGIA macrostegia subsp. intermedia
FLOWER: sepals 9--16 mm; corolla 32--40 mm.
+ 'corolla 2--40 mm' made 'corolla 32--40 mm'
2015 03 12

p. 658
CALYSTEGIA peirsonii
BIOREGIONAL DISTRIBUTION: WTR, n SnGb, adjacent DMoj.
+ 'WTR,' added 
2016 05 11

p. 659
CONVOLVULUS
FLOWER: gen showy; corolla gen funnel-shaped, pleated, 5-angled or -lobed; stamens incl; ovary chambers 2, septa complete, stigma lobes 2, linear to narrowly spoon-shaped, tips acute.
+ 'stigma lobes 2, linear to narrowly spoon-shaped, +- flat.' made 'stigma lobes 2, linear to narrowly spoon-shaped, tips acute.'
2012 12 11

p. 659
CUSCUTA
FLOWER: bisexual, radial, parts generally in 4s or 5s; calyx generally divided 2/5--3/5, persistent, generally +- cream-white; corolla generally +- white, persistent (withered in fruit) or not, tube cup-shaped to cylindric, bulged or horizontally ridged below lobes or generally not, generally with scales subtending stamens, lobes alternate stamens, erect to reflexed; ovary superior, chambers 2, each 2-ovuled, styles 2, generally free, persistent, stigmas 2, generally spheric, persistent.
+ 'calyx generally divided 2/5--3/5, persistent generally +- cream-white;' made 'calyx generally divided 2/5--3/5, persistent, generally +- cream-white;'
2017 10 31

p. 661 [location or approximate location where treatment would appear in TJM2 were it not unabridged and therefore only in eFlora]
UNABRIDGED
URBAN WEED EXPECTED IN WILDLANDS
CUSCUTA japonica Choisy var. formosana
BIOREGIONAL DISTRIBUTION: ScV, CCo, and spreading;
+ ', CCo,' added [in eFlora only, where unabbreviated]
2014 07 25

p. 662
NATURALIZED
CUSCUTA suaveolens
+ 'NATIVE' made 'NATURALIZED' [font in TJM2 changed from that indicating NATIVE to that indicating NATURALIZED]
2013 11 15

p. 662
CUSCUTA subinclusa
BIOREGIONAL DISTRIBUTION: NCoR, SN, GV, SnFrB, SCoR, SCo, SnJt, GB;
+ 'NCoR, SN, GV, SnFrB, SCoR, SCo, SnJt, GB;' made 'NCoR, CaR, SN, GV, CCo, SnFrB, SCoR, SCo, n ChI (Santa Cruz Island), TR, PR, SnJt, GB;'
2017 08 29

p. 662
CUSCUTA veatchii
RARITY STATUS:
+ 'SYMBOL 1' deleted [meaning that a star symbol was removed from TJM2, while 'Listed on CNPS Rare Plant Inventory' was removed from the eFlora]
2013 10 03

p. 662
CUSCUTA veatchii
BIOREGIONAL DISTRIBUTION: DSon (San Diego Co.; extirpated);
+ 'extirpated, San Diego Co.' made 'San Diego Co.; extirpated'
2013 10 03

p. 664
DICHONDRA occidentalis
HABIT+: Plant hairs dense exc on lvs, soft, white to pale brown.
+ 'exc on lvs' added [in TJM2; not abbreviated in eFlora]
2014 08 08

p. 664 [location or approximate location where treatment would appear in TJM2 were it not unabridged and therefore only in eFlora]
IPOMOEA purpurea
ECOLOGY: Disturbed or waste places, fields, orchards;
+ 'Disturbed, fields, orchards' made 'Disturbed or waste places, fields, orchards'
2014 11 12

p. 664
CORNUS sericea subsp. sericea
BIOREGIONAL DISTRIBUTION: CA-FP, GB (uncommon s CA).
+ 'W&I' made 'GB' 
2013 10 04

p. 666
DUDLEYA
COMMON NAME: DUDLEYA, LIVEFOREVER
+ common names alphabetized
2012 03 27
p2

p. 667
DUDLEYA
6' Leaves generally > 15, glaucous or +- so; n ChI (Santa Rosa Island) .....-> subsp. insularis
+ 'insularis (2)' made 'insularis'
2013 07 31

p. 667
DUDLEYA
13' Leaves +- wide-elliptic in &times;-section in upper 1/2, 20--50, 6--25 cm, 10--32 mm wide; peduncle 6--70 cm, erect .....-> subsp. insularis
+ 'insularis (2)' made 'insularis'
2013 07 31

p. 670
DUDLEYA densiflora
CHROMOSOMES: 2n=34.
+ '24' made '34'
2016 01 14

p. 672
DUDLEYA lanceolata
BIOREGIONAL DISTRIBUTION: Teh, c CCo (s Santa Cruz Co.), SnFrB, SCoR, SCo, TR, PR, DMtns, DMoj (w edge);
+ 'c CCo (s Santa Cruz Co.), SnFrB, SCoR, TR, PR, DMtns;' made 'Teh, c CCo (s Santa Cruz Co.), SnFrB, SCoR, SCo, TR, PR, DMtns, DMoj (w edge);'
2017 08 29

p. 672
DUDLEYA saxosa subsp. aloides
BIOREGIONAL DISTRIBUTION: e SnBr, PR, s DMoj, DMtns, DSon;
+ 'PR, DMtns, DSon;' made 'e SnBr, PR, s DMoj, DMtns, DSon;'
2017 08 29

p. 673
DUDLEYA virens
LEAF: evergreen, 3--25 cm, 15--30 mm wide, oblong, 4--6 mm thick, in &times;-section +- elliptic or in upper 1/2 round, glaucous or not, +- fragrant or not.
+ '8--20 cm' made '3--25 cm'
2013 10 21

p. 673
DUDLEYA virens subsp. hassei
LEAF: 15--30, outer ascending to erect, 3--10(15) cm, 5--10(15) mm wide, 2--4 mm thick, +- round in &times;-section in upper 1/2, linear-oblong to -lanceolate, base 8--15 mm wide, generally glaucous.
+ '15--30, 3--10(15) cm, outer ascending to erect, 5--10(15) mm wide,' made '15--30, outer ascending to erect, 3--10(15) cm, 5--10(15) mm wide,'
2013 10 21

p. 673
SEDELLA
HABIT+: Annual, erect, glabrous, branches 0 or near base.
+ 'Annual, erect, 2--10(17) cm, glabrous, branches 0 or near base.' made 'Annual, erect, glabrous, branches 0 or near base.'
2014 10 31

p. 673
SEDELLA
SPECIES IN GENUS: 3 spp.: CA.
+ '4' made '3' [in TJM2; not abbreviated in eFlora] 
2014 08 11

p. 674
SEDELLA pumila
BIOREGIONAL DISTRIBUTION: se NCoRO, NCoRI, CaRF, SNF, c SNH, GV, SCoRI;
+ 'SCoRI.' made 'SCoRI;' 
2015 04 15

p. 674
SEDELLA pumila
DISTRIBUTION OUTSIDE CALIFORNIA: OR.
+ DISTRIBUTION OUTSIDE CALIFORNIA added 
2015 04 15

p. 678
BRANDEGEA bigelovii
BIOREGIONAL DISTRIBUTION: D (exc DMtns);
+ 'D' made 'D (exc DMtns)'
2019 03 26

p. 680
CUCURBITA pepo var. pepo
UNABRIDGED NOTE: _Cucurbita pepo_ widely cult; _Cucurbita argyrosperma_ Huber (cult squash), _Cucurbita ficifolia_ Bouch&eacute; (chilacayote), _Cucurbita moschata_ Duchesne (chicamita), _Cucurbita pepo_ var. _medullosa_ Alef. (calabaza corriente) often escape cult but are not naturalized in CA Cultivars may be derived from ancient widespread distribution of wild populations incl _Cucurbita pepo_ subsp. _fraterna_ (L.H. Bailey) Lira et al., a native of c Mex (Decker-Walters 2002 Syst Bot 27:19--28). There are Consortium records that, if verified, would voucher elevations up to 600 m. The following (and possibly other) accessions, if verified, would represent range extensions (as indicated): UCR95500 (PR).
+ 'calabasa corriente' made 'calabaza corriente' [in eFlora; no unabridged notes in TJM2]
2012 10 24

p. 680
MARAH watsonii
BIOREGIONAL DISTRIBUTION: KR, NCoRI, s CaR, n SN, ScV.
+ 'NCoRI, CaRF, n SNF, ScV' made 'KR, NCoRI, s CaR, n SN, ScV' 
2015 08 25

p. 681
DIPSACUS fullonum
BIOREGIONAL DISTRIBUTION: NCo, KR, NCoRO, c&s SNF, CCo, SnFrB;
+ 'NCoRO,', 'CCo' added  
2013 09 30

p. 681
DIPSACUS sativus
BIOREGIONAL DISTRIBUTION: NCo, NCoRO, CW, PR;
+ 'CCo, SnFrB, SCoR' collapsed to 'CW' 
2012 03 27
p2

p. 681
SCABIOSA atropurpurea
BIOREGIONAL DISTRIBUTION: NCoRO, NCoRI, CCo, SnFrB, SCoRO, SnBr, PR;
+ 'NCoRO, NCoRI,' added  
2013 09 30

p. 684
BERGIA texana
TAXON AUTHOR: (Hook.) Seub.
+ 'Seub. ex Walp.' made 'Seub.'
2019 11 19

p. 685
ERICACEAE
FLOWER: generally bisexual, generally radial, bell-shaped, cylindric, or urn-shaped; sepals generally (0)4--5, generally free; petals generally (0)4--5, free or fused; stamens (2--5)8--10, free, filaments rarely appendaged, anthers awned or not, dehiscing by pores or slits; nectary generally present at ovary base, generally disk-like; ovary superior or inferior, chambers generally 1--5, placentas axile or parietal, ovules 1--many per chamber, style 1, stigma head- to funnel-like or lobed.
+ 'stamens 8--10, free' made 'stamens (2--5)8--10, free'
2013 07 31

p. 685
ERICACEAE
FLOWER: generally bisexual, generally radial, bell-shaped, cylindric, or urn-shaped; sepals generally (0)4--5, generally free; petals generally (0)4--5, free or fused; stamens (2--5)8--10, free, filaments rarely appendaged, anthers dehiscing by pores or slits, awns 0 or 2(4), seemingly abaxial, reduced or elongate, generally curved; nectary generally present at ovary base, generally disk-like; ovary superior or inferior, chambers generally 1--5, placentas axile or parietal, ovules 1--many per chamber, style 1, stigma head- to funnel-like or lobed.
+ 'anthers awned or not, dehiscing by pores or slits;' made 'anthers dehiscing by pores or slits, awns 0 or 2(4), seemingly abaxial, reduced or elongate, generally curved;'
2013 11 07

p. 686
ARBUTUS menziesii
BIOREGIONAL DISTRIBUTION: NW, CaR, n SNF, n&c SNH, ScV, CW, n ChI (Santa Cruz Island), WTR, SnGb, PR; 
+ 'CaRH' made 'CaR', 'n SNF,', 'ScV,' added 
2013 10 04

p. 686
ARCTOSTAPHYLOS
FLOWER: radial; sepals 5(4), free, persistent; corolla conic to urn-shaped, lobes in number = sepals, short, rounded, curved back, white to pink; stamens 2 &times; number of sepals, included, filaments swollen, generally hairy at base, anthers dark red, awns elongate; ovary on disk, 4--10-chambered, ovule 1 per chamber.
+ 'with 2 curved back dorsal awns;' made 'awns elongate'
2013 11 07

p. 686
ARCTOSTAPHYLOS
FLOWER: radial; sepals 5(4), free, persistent; corolla conic to urn-shaped, lobes in number = sepals, short, rounded, curved back, white to pink; stamens 2 &times; number of sepals, included, filaments swollen, generally hairy at base, anthers dark red, awns elongate; ovary superior, on disk, 4--10-chambered, ovule 1 per chamber.
+ 'ovary on disk,' made 'ovary superior, on disk,'
2014 04 11

p. 687
ARCTOSTAPHYLOS
2' Leaves with stomata on both surfaces, occasionally fewer adaxially, surfaces generally the same in color and/or hairiness (except _Arctostaphylos pacifica_)
+ 'Artostaphylos' made 'Arctostaphylos'
2014 02 24

p. 687
ARCTOSTAPHYLOS
7' Pl erect; burls at base of main st; fr depressed-spheric; lf blades oblong-ovate to lance-oblong; NCoRI, CW, n ChI.....-> _A. crustacea_
+ 'CCo, SnFrB, SCoRO, n ChI' made 'NCoRI, CW, n ChI' 
{/explanation: BIOREGIONAL DISTRIBUTION of ARCTOSTAPHYLOS crustacea in key at 7' WAS 'CCo, SnFrB, SCoRO, n ChI'. BIOREGIONAL DISTRIBUTION of combined subspp. in descriptions IS 'NCoRI, CW, CCo (Fort Ord; Mount Toro; Lake Merced, San Francisco Co.; Santa Lucia Range, Monterey Co.), s CCo/SCoRO (nw Santa Barbara Co.), sw SnFrB (Santa Cruz Mtns), n ChI'. So, for 7', the BIOREGIONAL DISTRIBUTION of combined subspp. as indicated by descriptions was selected (the JFP policy is to resolve such conflicts in favor of descriptions) and collapsed to 'NCoRI, CW, n ChI'}
2014 05 16 [on 2014 05 16, 's CCo/SCoRO (nw Santa Barbara Co.),' deleted from this entry and the eFlora; on 2012 03 27, it was mistakenly included in original listing of this entry and the eFlora, but should not have been because it is included in CW]

p. 687
ARCTOSTAPHYLOS
17' Glands black or clear (pink), on short and long hairs; burl hemispheric; NCo, KR, NCoR, CCo, SnFrB, SCoR, s SCo, TR, PR .....-> A. glandulosa (in part) (2)
+ 'NCo,' added 
+ 'CCo,' added 
+ 'w SnBr,' made 's SCo, TR,' 
2016 05 04

p. 687
ARCTOSTAPHYLOS
19. Twig gen glandular; NCo, KR, NCoR, CCo, SnFrB, SCoR, s SCo, TR, PR .....-> subsp. glandulosa
+ 'NCo,' added 
+ 'CCo,' added 
+ 's SCo, TR,' added 
2016 05 04

p. 687
ARCTOSTAPHYLOS
21. Stones generally free; fruit dark mahogany-brown; SNF, SNH .....-> A. mewukka subsp. mewukka
+ 'SNF, n SNH' made 'SNF, SNH'
2017 05 09

p. 687
ARCTOSTAPHYLOS
26' Lvs green, yellow-, or gray-green; KR, NCoR, SnFrB, SCoR, SCo (San Diego Co.), TR, PR
+ deleted 's' from 's SCoR' 
{/explanation: because of disagreement of key with description and lower part of key, where there is no s for s SCoR, deleted 's' from 's SCoR' in 26'}
2012 03 27

pp. 687-690
ARCTOSTAPHYLOS
+ Couplets 6, 15, 25, 35, 39, 42, 52, 56, 60, 65, & 93 put in alphabetical order.
+ Lead 17., with 4 taxa, reversed with 17', with only one taxon (even though the change puts the leads out of alphabetical order)
+ Lead 18., with 2 taxa, reversed with 18', with only one taxon (even though the change puts the leads out of alphabetical order)
2012 03 27

p. 688
ARCTOSTAPHYLOS
33' Pl prostrate to erect; lf blade 1--2.2 cm, 0.8--1.8 cm wide, round to round-ovate; coastal prairie, maritime chaparral, closed-cone forest; c NCo/NCoRO (Mendocino Co.).....-> subsp. _nummularia_
+ 'c&s NCoRO' made 'c NCo/NCoRO (Mendocino Co.)' 
{/explanation: differences in bioregions resolved in favor of description, in accordance with JFP policy}
2012 03 27

p. 688
ARCTOSTAPHYLOS
51' Twig sparsely short-nonglandular-hairy; old sts +- red, without +- gray or +- glaucous patches; n CCo, s SnFrB (s Santa Cruz Mtns), SCoR, SnBr, PR, e DMtns
+ 's SnFrB (s Santa Cruz Mtns)' added
{/explanation: added 's SnFrB (s Santa Cruz Mtns)' from 52'}
2012 03 27

p. 689
ARCTOSTAPHYLOS
56. Petiole 1--4 mm; lf glabrous or gen short-nonglandular-hairy, base lobed; ovary, fr glabrous, not sticky; n SCoRI (n&c Gabilan Range, San Benito, Monterey cos.) .....-> A. gabilanensis
+ 'lf gen short-nonglandular-hairy' made 'lf glabrous or gen short-nonglandular-hairy' [in TJM2; not abbreviated in eFlora; was lead 56' in TJM2 before reversal for alphabetical order]
2015 02 17

p. 689
ARCTOSTAPHYLOS
56' Petiole 7--15 mm; lf glabrous, base rounded, truncate, or +- lobed; ovary, fr glandular-sticky; Teh, SnFrB, SCoR, SCo, TR, PR, sw DMtns (Little San Bernardino Mtns) .....-> A. glauca
+ 'Teh,' added 
+ 'SCo,' added 
2016 05 11

p. 691
ARCTOSTAPHYLOS andersonii
FRUIT: 6--8 mm wide, +- depressed-spheric, sticky; stones free.
+ '+- spheric-spheric' made '+- depressed-spheric'
2015 02 12

p. 691
ARCTOSTAPHYLOS crustacea subsp. crinita
BIOREGIONAL DISTRIBUTION: CCo (Fort Ord, Mount Toro), sw SnFrB (Santa Cruz Mtns).
+ 'CCo (Fort Ord, Mount Toro)' moved ahead of 'sw SnFrB (Santa Cruz Mtns)' 
2012 03 27

p. 692
ARCTOSTAPHYLOS crustacea subsp. rosei
BIOREGIONAL DISTRIBUTION: CCo (Lake Merced, San Francisco Co.; Santa Lucia Range, Monterey Co.).
+ 'Mtns' made 'Range'
2012 03 27
p2

p. 692
ARCTOSTAPHYLOS franciscana
BIOREGIONAL DISTRIBUTION: n CCo (San Francisco).
+ 'c CCo' made 'n CCo' 
2012 03 27

p. 692
ARCTOSTAPHYLOS glandulosa subsp. glandulosa
STEM: twig gen glandular- and short-nonglandular-hairy, glands black or clear (0 or pink).
+ 'twig glandular- and gen short-nonglandular-hairy' made 'twig gen glandular- and short-nonglandular-hairy' [in TJM2; not abbreviated in eFlora]
2015 02 13

p. 692
ARCTOSTAPHYLOS glandulosa subsp. glandulosa
BIOREGIONAL DISTRIBUTION: NCo, KR, NCoR, CCo, SnFrB, SCoR, s SCo, TR, PR;
+ 'NCo,' added 
+ 'CCo,' added 
+ 's SCo, TR,' added 
2016 05 04

p. 694
ARCTOSTAPHYLOS glauca
BIOREGIONAL DISTRIBUTION: Teh, SnFrB, SCoR, SCo, TR, PR, sw DMtns (Little San Bernardino Mtns);
+ 'Teh,' added 
+ 'SCo,' added 
2016 05 11

p. 694
ARCTOSTAPHYLOS hookeri subsp. hookeri
FRUIT: 3--8 mm wide.
+ '4--8' made '3--8'
2015 02 05

p. 695
ARCTOSTAPHYLOS mewukka subsp. mewukka
BIOREGIONAL DISTRIBUTION: SNF, SNH.
+ 'SNF, n SNH' made 'SNF, SNH'
2017 05 09

p. 696
ARCTOSTAPHYLOS parryana subsp. desertica
ELEVATION: 1200--2300 m.
+ '1600' made '2300'
2012 09 13

p. 696
ARCTOSTAPHYLOS parryana subsp. tumescens
BIOREGIONAL DISTRIBUTION: SnGb, SnBr.
+ 'SnGb' added 
2012 09 13

p. 698
ARCTOSTAPHYLOS patula
BIOREGIONAL DISTRIBUTION: KR, NCoRH, CaRH, SNH, TR, SnJt;
+ 'KR,' added  
+ 'SnGb, SnBr,' made 'TR,'  
2016 05 03

p. 698
ARCTOSTAPHYLOS patula
BIOREGIONAL DISTRIBUTION: KR, NCoRH, NCoRO, CaR, SNH, SCoRO, TR, SnJt, e PR, MP;
+ 'CaRH' made 'CaR' 
+ ', SCoRO' added 
+ ', e PR, MP' added 
2016 05 04
+ ', NCoRO' added
2019 02 19

p. 699
ARCTOSTAPHYLOS silvicola
HABIT+: Erect, 1--3(5) m.
+ '(5)' added
2012 03 27

p. 699
ARCTOSTAPHYLOS silvicola
BIOREGIONAL DISTRIBUTION: sw SnFrB (Santa Cruz Sandhills, Santa Cruz Co.).
+ '(s Santa Cruz Mtns)' made '(Santa Cruz Sandhills, Santa Cruz Co.)'
2015 01 12

p. 699
ARCTOSTAPHYLOS tomentosa subsp. bracteosa
BIOREGIONAL DISTRIBUTION: c CCo (Jacks Peak and Fort Ord, Monterey Co.), SCoRO.
+ ', SCoRO' added 
2016 05 18

p. 700
CHIMAPHILA menziesii
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaRH, n SNF, SNH, SCoRO, SnGb, SnBr, PR, MP;
+ 'n SNF,', 'MP' added 
2013 10 02

p. 700
CHIMAPHILA umbellata
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaRH, SN, SnBr, SnJt, MP; 
+ 'KR,', 'CaRH,', ', MP' added 
2013 10 02

p. 702
GAULTHERIA
FLOWER: sepals generally 5, fused; petals 5, fused, cylindric, urn-, or bell-shaped, white to red; stamens (5,8)10, anthers dehiscing by 2 short, slit-like to rounded pores, awns (0,2)4, sometimes reduced; ovary superior or 1/2-inferior, chambers (4)5, placentas axile, at top.
+ 'awns (1)2 pairs, sometimes reduced or 0;' made 'awns (0,2)4, sometimes reduced;'
2013 11 07

p. 702
GAULTHERIA ovatifolia
BIOREGIONAL DISTRIBUTION: KR, NCoRO, n NCoRH, CaRH, n SNH;
+ 'NCoRO,' added 
2013 10 07

p. 702
HEMITOMES congestum
BIOREGIONAL DISTRIBUTION: NCo, KR, NCoRO, CaRH, n&s SNH, CCo, SnFrB, SCoRO; 
+ 'CCo,' added 
2013 10 04

p. 702
KALMIA polifolia
BIOREGIONAL DISTRIBUTION: KR, NCoRO, CaRH, SNH, Wrn;
+ 'NCoRO,' added 
2013 10 07

p. 702
KALMIA polifolia
COMMON NAME: SWAMP LAUREL, BOG LAUREL
+ 'BOX' made 'BOG'
2018 08 14

p. 703
MENZIESIA ferruginea
BIOREGIONAL DISTRIBUTION: NCo, KR, NCoRO;
+ 'NCoRO,' added 
2013 10 07

p. 703
MONOTROPA hypopitys
BIOREGIONAL DISTRIBUTION: NW (exc NCoRI), CaRH;
+ ', CaRH' added 
2013 10 04

p. 703
MONOTROPA uniflora
BIOREGIONAL DISTRIBUTION: NCo, KR, NCoRO;
+ ',NCoRO' added 
2013 10 04

p. 704
ORTHILIA secunda
BIOREGIONAL DISTRIBUTION: KR, NCoRH, NCoRO, s CaRH, SNH, SnBr, SnJt, MP, SNE (exc W&I);
+ 'NCoRO,', 'SNE (exc W&I)' added, 'Wrn' made 'MP' 
2013 10 02

p. 704
PHYLLODOCE breweri
BIOREGIONAL DISTRIBUTION: s CaRH (Lassen Peak and nearby), SNH, SnBr;
+ 'SnBr.' made SnBr;' 
2015 02 25

p. 704
PHYLLODOCE breweri
DISTRIBUTION OUTSIDE CALIFORNIA: NV.
+ DISTRIBUTION OUTSIDE CALIFORNIA added 
2015 02 25

p. 704
PTEROSPORA andromedea
BIOREGIONAL DISTRIBUTION: KR, NCoRH, CaR, SNH, Teh, TR, PR, MP, SNE (exc W&I); 
+ 'CaRH' made 'CaR', 'SnJt' made 'PR', 'Wrn' made 'MP', 'SNE (exc W&I)' added 
2013 10 04

p. 706
PYROLA
4' Leaf +- 0 or generally 4--10 cm, ovate to elliptic, veins white-bordered, or oblanceolate, veins not white-bordered; petals +- green, cream-white, or pink; sepals generally >> 2 mm, ovate, acute; NW, CaR, SN, CCo, SnFrB, SCoRO, TR, PR, MP .....-> P. picta
+ 'CCo,' added, 'Wrn' made 'MP' 
2013 10 02

p. 706
PYROLA asarifolia subsp. asarifolia
BIOREGIONAL DISTRIBUTION: KR, CaRH, SNH, TR, MP, SNE (exc W&I); 
+ 'SnBr' made 'TR' 
+ ', SNE (exc W&I)' added 
2013 10 02

p. 706
PYROLA asarifolia subsp. bracteata
BIOREGIONAL DISTRIBUTION: NCo, KR, NCoRO, NCoRH, n SNH; 
+ 'NCoRH' added 
2013 10 02

p. 706
PYROLA minor
BIOREGIONAL DISTRIBUTION: KR, SNH, SnBr, SnJt, Wrn, SNE (exc W&I);
+ 'c&s SNH' made 'SNH', 'SNE (exc W&I)' added 
2013 10 02

p. 706
PYROLA minor
DISTRIBUTION OUTSIDE CALIFORNIA: circumboreal, to AK, e N.Am, also Eurasia.
+ 'N.Am; Eurasia' made 'N.Am, also Eurasia' 
2013 10 02

p. 706
PYROLA picta
BIOREGIONAL DISTRIBUTION: NW, CaR, SN, CCo, SnFrB, SCoRO, TR, PR, MP; 
+ 'CCo,' added, 'Wrn' made 'MP' 
2013 10 02

p. 708
RHODODENDRON columbianum
BIOREGIONAL DISTRIBUTION: NCo, KR, s NCoRO, CaRH, s SNF, SNH, CCo, SnFrB, n SCoRI, Wrn, SNE;
+ 's SNF,' added 
2013 10 07

p. 708
RHODODENDRON macrophyllum
BIOREGIONAL DISTRIBUTION: NCo, KR, NCoRO, CCo, SnFrB;
+ 'NCoRO,' added 
2013 10 07

p. 708
RHODODENDRON occidentale
BIOREGIONAL DISTRIBUTION: NW (exc NCoRH), CaRH, n SNF, SNH, GV, CCo, SnFrB, n SCoRI, PR;
+ 'n SNF,' 'GV,' added 
2013 10 07

p. 708
SARCODES sanguinea
BIOREGIONAL DISTRIBUTION: KR, NCoRO, NCoRH, CaRH, SNH, SCoRO, TR, PR, MP;
+ ',SCoRO,' added 
2013 10 04

p. 708
SARCODES sanguinea
DISTRIBUTION OUTSIDE CALIFORNIA: sw OR, NV, n Baja CA.
+ 'NV,' added  
2015 02 26

p. 708
VACCINIUM
ETYMOLOGY: (Latin: for _Vaccinium myrtillus_ L.)
+ '_Vacinnium_' made '_Vaccinium_'
2012 03 27
p2

p. 709
VACCINIUM ovatum
BIOREGIONAL DISTRIBUTION: NCo, KR, NCoRO, NCoRI, CW, n ChI (Santa Cruz, Santa Rosa islands), WTR, PR (uncommon);
+ 'NCoRI,' added, 'CCo, SnFrB' made 'CW' 
2013 10 14

p. 709
VACCINIUM parvifolium
BIOREGIONAL DISTRIBUTION: NCo, KR, NCoRO, n&c SNH, SnFrB;
+ 'CaRH,' deleted 
2015 08 26

p. 709
VACCINIUM scoparium
BIOREGIONAL DISTRIBUTION: KR, NCoRO, CaRH;
+ 'NCoRO, CaRH' added 
2013 10 04

p. 709
VACCINIUM uliginosum L. subsp. occidentale
BIOREGIONAL DISTRIBUTION: NCo, KR, NCoRH, CaR, SNH;
+ 'NCoRH,' added, 'CaRH' made 'CaR' 
2013 10 04

p. 709
XYLOCOCCUS bicolor
BIOREGIONAL DISTRIBUTION: SCo, s ChI (Santa Catalina Island), PR (exc SnJt); 
+ ', PR (exc SnJt)' added 
2013 10 04

p. 710
(superseded by Supplement I)
CHAMAESYCE 
INFLORESCENCE: fl-like, gen 1 per node; involucre +- bell-shaped, bracts 5, fused; glands gen 4, distal appendages gen colorful, petal-like; fls central.
+ 'glands 4' made 'glands gen 4'
2013 01 30

p. 710
ACALYPHA californica
BIOREGIONAL DISTRIBUTION: s SCo (near San Diego), PR, w DSon;
+ 's SCo (near San Diego),' added 
2015 03 11

p. 712 [location or approximate location where name would have appeared in TJM2 had the correction been made then, when the taxon was still in CHAMAESYCE; the taxon presently is in EUPHORBIA in the eFlora] 
EUPHORBIA
42' Seed smooth to wrinkled; involucre gland appendage narrower than gland .....-> E. serpillifolia subsp. serpillifolia
+ 'E. serpyllifolia subsp. serpyllifolia' made 'E. serpillifolia subsp. serpillifolia'
2018 02 07

p. 714
CROTON
1. Ann; monoecious; ovary 1-chambered, style 1, simple .....-> C. setiger
+ 'setigerus' made 'setiger'
2012 04 11

p. 714
CROTON
2. Seed 3.5--5.5 mm; pedicels in fruit 1--1.5(3) mm; staminate sepals +- 2--2.5 mm; Teh, SnJV, CCo, SCoR, SCo, s ChI (Santa Catalina Island), TR, PR, D .....-> C. californicus
+ 'CCo, SCo, s ChI, D' made 'Teh, SnJV, CCo, SCoR, SCo, s ChI (Santa Catalina Island), TR, PR, D'
2016 08 30

p. 714
CROTON
2' Seed 6.5--7 mm; pedicels in fruit 4--7 mm; staminate sepals 2.5--3 mm; se DSon (se Imperial Co.) .....-> C. wigginsii
+ 'se DSon' made 'se DSon (se Imperial Co.)'
2016 08 30

p. 714
CROTON californicus
BIOREGIONAL DISTRIBUTION: Teh, SnJV, CCo, SCoR, SCo, s ChI (Santa Catalina Island), TR, PR, D;
+ 'CCo, SCo, s ChI (Santa Catalina Island), D;' made 'Teh, SnJV, CCo, SCoR, SCo, s ChI (Santa Catalina Island), TR, PR, D;'
2016 08 30

p. 714
CROTON setiger
+ 'setigerus' made 'setiger'
2012 04 11

p. 714
CROTON setiger
COMMON NAME: DOVEWEED, TURKEY-MULLEIN
+ 'DOVEWEED,' added
2017 07 12

p. 714
CROTON setiger
SYNONYMS: Eremocarpus setiger (Hook.) Benth.
+ 'setigerus' made 'setiger' [in eFlora; abbreviated to 's' in TJM2]
2013 10 31

p. 714 [location or approximate location where name would have appeared in TJM2 had the correction been made then, when the taxon was still in CHAMAESYCE; the taxon presently is in EUPHORBIA in the eFlora] 
EUPHORBIA serpillifolia
+ 'serpyllifolia' made 'serpillifolia'
2018 02 07

p. 714 [location or approximate location where name would have appeared in TJM2 had the correction been made then, when the taxon was still in CHAMAESYCE; the taxon presently is in EUPHORBIA in the eFlora] 
EUPHORBIA serpillifolia subsp. hirtula
+ 'serpyllifolia' made 'serpillifolia'
2018 02 07

p. 714 [location or approximate location where name would have appeared in TJM2 had the correction been made then, when the taxon was still in CHAMAESYCE; the taxon presently is in EUPHORBIA in the eFlora] 
EUPHORBIA serpillifolia subsp. serpillifolia
+ 'serpyllifolia' made 'serpillifolia'
2018 02 07

p. 715
DITAXIS neomexicana
ELEVATION: < 1000 m.
+ '300' made '1000'
2013 01 14

p. 716 
(superseded by Supplement I)
EUPHORBIA eriantha
ELEVATION: < 1000 m.
+ '100' made '1000'
2013 04 04

p. 718
MERCURIALIS
HABIT+: Annual [perennial herb], generally glabrous; sap clear; (monoecious) dioecious.
+ '[monoecious]' made '(monoecious)'
2015 09 24

p. 718
MERCURIALIS annua
HABIT+: Annual, 1--3 dm.
+ 'Annual, 1--3 dm; dioecious.' made 'Annual, 1--3 dm.' [in TJM2; not abbreviated in eFlora]
2015 09 24

p. 718
STILLINGIA
2. Spikes exceeding lvs, open in proximal 1/3, pistillate fls well separated; base of lf blade entire; seeds +- 2 mm .....-> _S. linearifolia_
+ 'Spikes not projecting above lvs' made 'Spikes exceeding lvs' in eFlora; for second printing, 'projecting above' retained, incorrectly {/'not' intentionally moved to 2'}
2012 03 27

p. 718
STILLINGIA
2' Spikes not exceeding lvs, dense in proximal 1/3, pistillate fls crowded; base of lf blade few-toothed; seeds 2.5--3 mm .....-> _S. paucidentata_
+ 'Spikes projecting above lvs' made 'Spikes not exceeding lvs' in eFlora; for second printing, 'projecting above' retained, incorrectly {/'not' intentionally moved to 2'}
2012 03 27

p. 718
STILLINGIA linearifolia
BIOREGIONAL DISTRIBUTION: SnJV (Monocline Ridge, Fresno County), SW, D;
+ 'SnJV (Monocline Ridge, Fresno County),' added
2016 06 07

p. 721
Group 3: Papilionoideae
18. Lflets 0, but stipules lflet-like --- lf axis ending as a tendril .....-> [_Lathyrus aphaca_]
+ '<sup>3</sup>LATHYRUS' made '[_Lathyrus aphaca_]'
2012 03 27

p. 721
Group 3: Papilionoideae
26. Lflets 2; main lf axis ending as tendril or bristle .....-> <sup>2</sup>LATHYRUS
+ pre-superscript '3' made '2'
2012 03 27

p. 721
Group 3: Papilionoideae
40. Style +- flat, puberulent near +- middle for +- 1/3--1/2 length adaxially; lflets +- rolled in bud .....-> <sup>2</sup>LATHYRUS
+ pre-superscript '3' made '2'
2012 03 27

p. 723
ACACIA baileyana
LEAF: 2-pinnate, < 4 cm, silver-blue; petiole < 2 mm, glabrous; axis with raised glands at distal pairs of 1&deg; lflets; 1&deg; lflets 2--5 pairs, 10--28 mm; 2&deg; lflets 8--24 pairs, 3.5--7.5 mm, 0.8--1.3 mm wide, linear.
+ 'l' made '1' after 'raised glands at distal pairs of'
2012 03 27
p2

p. 723
ACACIA baileyana
BIOREGIONAL DISTRIBUTION: CCo, SnFrB, SCo, WTR, SnGb, PR;
+ ', PR' added
2018 05 08

p. 723
ACACIA dealbata
LEAF: 2-pinnate, < 17 cm, silver-blue; petiole 8--22 mm, short-hairy; main axis with raised glands at each pair of 1&deg; lflets; 1&deg; lflet 6--30 pairs, 15--55 mm; 2&deg; lflets 15--70 pairs, 2--5 mm, 0.4--0.8 mm wide, linear.
+ 'l' made '1' after 'raised glands at each pair of'
2012 03 27
p2

p. 723
ACACIA dealbata
BIOREGIONAL DISTRIBUTION: NCo, KR, NCoRO, ScV, CCo, SnFrB, SCo, WTR, SnGb, PR;
+ 'NCo, KR,' and ', PR' added
2018 05 08

p. 723
ACACIA longifolia
BIOREGIONAL DISTRIBUTION: CCo, SnFrB, SCo, WTR, SnGb, PR;
+ 'WTR,' added
2018 05 08

p. 724
ACMISPON
17. Annual, perennial herb, prostrate, decumbent, or ascending; young growth +- not hairy; corolla 3--7 mm; fruit exserted; SCoR, SW, generally s of Los Angeles
+ 'Annual' made 'Annual, perennial herb'
2016 06 07

p. 724
ACMISPON
30. Pls gen ascending to erect (some on immediate coast prostrate), bushy-branched, 5--20 dm; st sparsely lfy; corolla yellow; calyx lobes gen 1--2 mm, not curved outward; coastal and inland .....-> A. glaber (2)
+ 'st +- woody (yet green), sparsely lfy' made 'st sparsely lfy' [in TJM2; not abbreviated in eFlora]
2014 02 14

p. 724
ACMISPON
30' Pls prostrate or low-ascending, < 10 dm; st lfy; corolla pink-white or yellow; calyx lobes gen < 1 mm or curved outward; esp coastal
+ 'st not woody, lfy' made 'st lfy' [in TJM2; not abbreviated in eFlora]
2014 02 14

p. 726
ACMISPON glaber
HABIT+: Subshrub, glabrous or finely strigose, hairs straight or +- wavy.
+ 'Perennial herb, often shrubby' made 'Subshrub'
2014 02 14

p. 726
ACMISPON glaber
FRUIT: indehiscent, spreading or pendent, much exserted, 1--1.5 cm, oblong, curved, not flat; beak curved, 2--3 mm.
+ 'much exserted, included, 1--1.5 cm,' made 'much exserted, 1--1.5 cm,'
2014 02 10

p. 726
ACMISPON grandiflorus var. grandiflorus
BIOREGIONAL DISTRIBUTION: NW, s SN, CW, SW.
+ 'NW, s SN, CW, SW (exc ChI).' made 'NW, s SN, CW, SW.' 
2014 04 29

p. 726
ACMISPON grandiflorus var. macranthus
BIOREGIONAL DISTRIBUTION: KR, n&c SN.
+ 'CaR' made 'KR' 
2015 06 12

p. 726
ACMISPON junceus
HABIT+: Subshrub (or fl 1st yr, appearing ann), finely strigose, hairs straight.
+ 'Per (or fl 1st year, appearing ann)' made 'Subshrub (or fl 1st year, appearing ann)' [in TJM2; not abbreviated in eFlora]
2014 02 14

p. 728
ACMISPON parviflorus
BIOREGIONAL DISTRIBUTION: NW, CaR, n&c SN, s SNF, ScV, CW, SCo, n ChI, TR, PR;
+ 'NCo, NCoR, n&c SN, ScV, CW, SCo, n ChI, PR;' made 'NW, CaR, n&c SN, s SNF, ScV, CW, SCo, n ChI, TR, PR;' 
2016 05 11

p. 728
ACMISPON prostratus
HABIT+: Annual, perennial herb, glabrous or strigose.
+ 'Annual' made 'Annual, perennial herb'
2016 06 07

p. 729
AMORPHA californica var. californica
BIOREGIONAL DISTRIBUTION: KR, NCoRI, n SNF, ScV, SCoR, SCo, TR, n&e PR.
+ 'CaRF,' deleted 
2015 06 12

p. 729
ASTRAGALUS
COMMON NAME: LOCOWEED, MILKVETCH
+ common names alphabetized
2012 03 27
p2

p. 730
ASTRAGALUS
10. Fruit on erect peduncle; seeds pitted; NCoR, ce SCoRI .....-> A. rattanii varieties.
+ ', ce SCoRI' added
2017 12 19

p. 738
ASTRAGALUS austiniae
TAXON AUTHOR: A. Gray
+ 'Brewer & S. Watson' made 'A. Gray'
2013 12 06

p. 740
RUNNING HEADER: 740 (EUDICOTS) Fabaceae (Astragalus)
+ 'Fabaceaez' made 'Fabaceae'
2012 03 27

p. 744
ASTRAGALUS lentiginosus var. floribundus
BIOREGIONAL DISTRIBUTION: n SNH, s MP, SNE;
+ comma added after 'n SNH'
2012 03 27
p2

p. 749
ASTRAGALUS pulsiferae var. suksdorfii
DISTRIBUTION OUTSIDE CALIFORNIA: s WA.
+ ', NV' deleted 
2015 02 26

p. 749
ASTRAGALUS rattanii var. jepsonianus
ECOLOGY: Grasslands, grassy openings in woodland and chaparral, vertic clay, often serpentine;
+ 'Often on serpentine soil' made 'Grasslands, grassy openings in woodland and chaparral, vertic clay, often serpentine'
2015 12 09

p. 749
ASTRAGALUS rattanii var. jepsonianus
BIOREGIONAL DISTRIBUTION: s NCoRI, ce SCoRI (n edge of New Idria serpentine mass).
+ ', ce SCoRI (n edge of New Idria serpentine mass)' added
2017 12 19

p. 753
CERCIS occidentalis
BIOREGIONAL DISTRIBUTION: NW, CaR, SN, GV, SnFrB, SCoRO, SnGb, SnBr, PR, MP;
+ 'SnFrB, SCoRO,' added 
2014 07 03

p. 753
CERCIS occidentalis
DISTRIBUTION OUTSIDE CALIFORNIA: to sw OR, UT, TX.
+ 'sw OR,' added 
2014 07 03

p. 756
GENISTA monspessulana
BIOREGIONAL DISTRIBUTION: NCo, KR, NCoRO, NCoRI, CaRF, s CaRH, n SN, CCo, SnFrB, SCoRO, SCo, s ChI, WTR, PR (San Diego Co.);
+ 'NCo, KR,' added; 's CaRH,' added; 'n SNH' made 'n SN'; 'CCo,' added; 'SCo,' added 
2015 08 12

p. 757
HOFFMANNSEGGIA glauca
FLOWER: petals spreading, 10--18 mm wide, gen yellow, with some orange-red.
+ 'orange-red' made 'gen yellow, with some orange-red'
2013 03 26

p. 758
HOSACKIA crassifolia var. crassifolia
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaRH, SN, SnFrB, SCoR, SCo, TR, PR, MP;
+ 'n PR (Riverside Co.),' made 'PR' 
2014 07 28

p. 760
LATHYRUS
NOTE: Some spp. variable, intergrading with others; some hybridization probable. _Lathyrus aphaca_ L. (lflets 0, stipules lflet-like) not naturalized in CA.
+ inserted '(lflets 0, stipules lflet-like)'
2012 03 27

p. 760
LATHYRUS
3' Inflorescence 2--4-fld; wings of st, petiole < 2 mm wide
+ '1--4-fld' made '2--4-fld'  [in TJM2; not abbreviated in eFlora]
2014 11 19

p. 761 [location or approximate location where treatment would have appeared in TJM2 had the species been described and included by then] 
UNABRIDGED
WAIF
LATHYRUS aphaca
TAXON AUTHOR: L.
HABIT+: Annual, glabrous.
STEM: angled or flanged but not winged.
LEAF: stipules 1--5 cm, leaflet-like, lanceolate to ovate, hastate-sagittate at base; leaflets 0; tendril coiled, not branched.
INFLORESCENCE: 1(2)-flowered; peduncle 2--3 cm.
FLOWER: calyx lobes +- 2 &times; tube; corolla 10--14 mm, yellow.
FRUIT: 2--4 cm, glabrous.
CHROMOSOMES: 2n=14.
ECOLOGY: Uncommon. Disturbed places;
ELEVATION: especially < 500 m.
BIOREGIONAL DISTRIBUTION: n NCo, s NCoRI;
DISTRIBUTION OUTSIDE CALIFORNIA: to WA, e US; native to Eurasia, Africa.
FLOWERING TIME: Apr--Jun
+ entire treatment above added [in eFlora; no description in TJM2]
2016 03 09

p. 761
LATHYRUS jepsonii var. californicus
HABIT+: Pl gen puberulent, occ glabrous, +- not robust, with st << 2.5 m.
+ '+- not robust, << 2.5 m' made '+- not robust, with st << 2.5 m' [in TJM2; not abbreviated in eFlora]
2014 11 19

p. 762
LATHYRUS torreyi
BIOREGIONAL DISTRIBUTION: NCo, NCoR, SnFrB;
+ 'n SnFrB' made 'SnFrB' 
2015 11 04

p. 764
LOTUS
1. Annual, hairy; inflorescence 1--3-flowered; corolla 5--8(12) mm .....-> L. angustissimus
+ 'corolla 5--8(12)' made 'corolla 5--8(12) mm'
2017 08 08

p. 764
LUPINUS
REFERENCE: Barneby 1989 Intermountain Flora 3(B):237--267; Isely 1998 Native and Naturalized Leguminosae (Fabaceae) US. M.L. Bean Museum, Brigham Young University
+ 'Univ' made 'University'
{/explanation: Univ not in list of abbreviations}
2012 03 27
p2

p. 764
LUPINUS
TJM2 AUTHOR: Teresa Sholars & Rhonda Riggins
+ '& Rhonda Riggins' added
2018 01 16

p. 766
LUPINUS
54' Leaf hairy but not woolly or shaggy-hairy; NCoR, SNF, CW, SCo, n ChI
+ 'NCoR, SNF, CW, SCo, n ChI' made 'NW, SN, CW, s SCoRO, SCo, ChI, WTR, SnGb, PR 
2015 08 31

p. 766
LUPINUS
55. Bract 4--8 mm; NW, SN, CW, SCo, ChI, WTR, SnGb, PR .....-> var. albifrons
+ 'NCoR, SNF, CW, SCo' made 'NW, SN, CW, SCo, ChI, WTR, SnGb, PR' 
2015 08 31

p. 766
LUPINUS
55' Bract 10--24 mm; CCo, nw SnFrB, s SCoRO, ChI, w WTR .....-> var. douglasii
+ 'CCo, nw SnFrB, n ChI' made 'CCo, nw SnFrB, s SCoRO, ChI, w WTR' 
2014 07 15

p. 767
LUPINUS
71. Fl 14--18 mm --- Teh, SnGb, SnBr .....-> <sup>2</sup>_L. excubitus_ var. _austromontanus_
+ 'cm' made 'mm'
2012 03 27
p2

p. 767
LUPINUS
71' Fl 10--16 mm
+ 'cm' made 'mm'
2012 03 27
p2

p. 768
LUPINUS
103. Fl 9--12 mm; NW, SNH, WTR, SnBr, SNE .....-> _L. andersonii_
+ 'SNE' deleted
2012 03 27

p. 768
LUPINUS
116. Fl 10--13 mm .....-> var. _glarecola_
116' Fl (13)16--18 mm .....-> var. _magnificus_
+ leads placed in alphabetical order
2012 03 27

p. 768
LUPINUS
123. Pl 4--7 dm; fl 13--15 mm; ne DMtns (Last Chance Range, Grapevine Mtns, Inyo Co.) .....-> _L. holmgrenianus_
+ 'Grapevine mtns' made 'Grapevine Mtns'
2012 03 27
p2

p. 769
LUPINUS albifrons var. albifrons
BIOREGIONAL DISTRIBUTION: NW, SN, CW, SCo, ChI, WTR, SnGb, PR;
+ 'NCoR, SNF, CW, SCo' made 'NW, SN, CW, SCo, ChI, WTR, SnGb, PR' 
2015 08 25

p. 769
LUPINUS albifrons var. douglasii
BIOREGIONAL DISTRIBUTION: CCo, nw SnFrB, s SCoRO, ChI, w WTR.
+ 'CCo, nw SnFrB, n ChI' made 'CCo, nw SnFrB, s SCoRO, ChI, w WTR' 
2014 07 15

p. 769
LUPINUS argenteus
NOTE: Highly variable; vars. intergrade. _Lupinus argenteus_ var. _rubricaulis_ (Greene) S.L. Welsh probably not in CA.
+ 'Welsh' made 'S.L. Welsh' 
2012 03 27
p2

p. 770
LUPINUS arizonicus
BIOREGIONAL DISTRIBUTION: e DMoj exc DMtns, DSon;
+ 'e DMoj' made 'e DMoj exc DMtns'
2019 03 12

p. 773
LUPINUS lepidus var. lobbii
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaRH, SNH, Wrn, SNE;
+ 'c SNH, SNE' made 'KR, NCoR, CaRH, SNH, Wrn, SNE'  
2015 08 25

p. 778
LUPINUS tidestromii
UNABRIDGED NOTE: If recognized taxonomically, shaggier plants from s NCo assignable to _Lupinus tidestromii_ var. _layneae_ (Eastw.) Munz, Point Reyes lupine.
+ 'shaggier pls from n NCo' made 'shaggier pls from s NCo' [in eFlora; no unabridged notes in TJM2]
2015 02 20

p. 778
LUPINUS uncialis
LEAF: stipule free blades < 1 mm; petiole 0.4--1.5 cm; leaflets (3)5, 0.2--0.7 cm, oblanceolate to narrowly obovate, hairy.
+ 'leaflets, (3)5, 0.2--0.7 cm,' made 'leaflets (3)5, 0.2--0.7 cm,'
2018 05 29

p. 779 [location or approximate location where information would appear in TJM2 were it not unabridged and therefore only in eFlora]
MEDICAGO polymorpha
SYNONYMS: Medicago hispida Gaertn.; Medicago hispida var. confinis (W.D.J. Koch) Burnat; Medicago hispida var. hispida; Medicago polymorpha L. var. brevispina (Benth.) Heyn; Medicago minima (L.) Bartal. var. brevispina Benth.; Medicago minima subsp. brevispina (Benth.) Ponert
+ 'confinus' made 'confinis'
2018 03 20

p. 780
MELILOTUS officinalis
FRUIT: 3--5 mm, plump, irregularly cross-ridged.
+ '3--5 mm, plump, 3--4 mm, irregularly cross-ridged' made '3--5 mm, plump, irregularly cross-ridged'
2014 12 03

p. 788
SENNA multiglandulosa
WEEDINESS: Potentially problematic weed
+ 'Potentially problematic weed' added [to replace removed broken diamond symbol in TJM2 (as an addition to existing note), and 'Weed listed by Cal-IPC' in eFlora]
2013 08 08

p. 788
SPARTIUM junceum
BIOREGIONAL DISTRIBUTION: KR, NCoRO, CaRF, SNF, ScV, SnFrB, SCoRO, SCo, s ChI, WTR;
+ 'KR,' added
2018 01 09

p. 789
THERMOPSIS gracilis
BIOREGIONAL DISTRIBUTION: KR, NCoR;
+ ', CaR' deleted  
2015 08 26

p. 789
TRIFOLIUM, Group 1
12. Corolla 5--10 mm, <= (rarely +- >) calyx; stalk-like fr base < 1 mm; infl gen bristly from calyx lobes .....-> T. barbigerum
+ '+- >= calyx' made '<= (rarely +- >) calyx' [in TJM2; not abbreviated in eFlora] 
2014 12 04

p. 789
TRIFOLIUM, Group 1
13. Involucre vestigial or bracts 2--5, inconspicuous, gen +- free, 1--3 mm; infl 1--6-fld .....-> T. monanthum
+ 'inconspicouous' made 'inconspicuous' [in TJM2; not abbreviated in eFlora] 
2014 12 04

p. 790
TRIFOLIUM Group 2
9. Inflorescence star-shaped, 1--2.5 cm; flower bracts reduced .....-> T. resupinatum
+ '[T. resupinatum]' made 'T. resupinatum' [brackets removed due to change in status from waif to naturalized]
2019 09 24

p. 791
TRIFOLIUM Group 2
26. Leaflet obovate to obcordate, length 1.5--2.5 &times; width; CA-FP, DMoj .....-> T. gracilentum
+ '(except ChI)' deleted
2018 03 20

p. 792
44' Calyx 8--14 mm, lobes 6.5--12 mm .....-> T. columbinum
+ 'T. olivaceum' made 'T. columbinum'
2019 01 22

p. 792
TRIFOLIUM barbigerum
FLOWER: calyx tube 5-veined, gen 2--3 mm, < lobes, lobes simple, entire, terminal bristle 3--4 mm, plumose, or lower lobes divided near base into 2--3 bristles, each 3--4 mm, gen plumose; corolla 5--10 mm, <= (rarely +- >) calyx, pink-purple (white) or 2-colored, lower part of banner inflated in fr.
+ 'corolla 5--10 mm, +- = calyx' made 'corolla 5--10 mm, <= (rarely +- >) calyx' [in TJM2; not abbreviated in eFlora]
2014 12 04

p. 794
TRIFOLIUM buckwestiorum
ELEVATION: < 710 m.
+ '200' made '710'
BIOREGIONAL DISTRIBUTION: sw SnFrB (Mendocino, Monterey, Santa Cruz cos.).
+ 'sw SnFrB (Santa Cruz Co.)' made 'sw SnFrB (Mendocino, Monterey, Santa Cruz cos.)
2015 03 04

p. 794
TRIFOLIUM ciliolatum
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaR, SN, GV, CW, SW, MP exc Wrn;
+ 'KR,' added; 'ScV' made 'GV'; ', MP exc Wrn' added  
2015 08 26

p. 795
TRIFOLIUM gracilentum
BIOREGIONAL DISTRIBUTION: CA-FP, DMoj;
+ '(exc Chi)' deleted
2018 03 20

p. 795
TRIFOLIUM longipes subsp. atrorubens
BIOREGIONAL DISTRIBUTION: NCoRH, SN, SnBr, SnJt.
+ 'NCoRH,' added
2017 10 17

p. 796
TRIFOLIUM microcephalum
ELEVATION: 0--2700 m.
BIOREGIONAL DISTRIBUTION: NW, SN, GV, SnFrB, SCoRO, SCo, ChI, WTR, SnBr, PR, DMoj;
+ 'SCoRO,' 'WTR,' added  
2014 07 11

p. 796
TRIFOLIUM microdon
FLOWER: calyx 2--3 mm, tube 10-veined, lobes < 1/2 tube, triangular, not bristle-tipped; corolla 4--6 mm, white to pink.
+ 'tube 10-veined, < 1/2 tube,' made 'tube 10-veined, lobes < 1/2 tube,'
2018 03 20

p. 796
TRIFOLIUM columbinum
+ 'TRIFOLIUM olivaceum' made 'TRIFOLIUM columbinum' [and treatment moved for names to be in alphabetical order]
2019 01 22

p. 796
TRIFOLIUM columbinum [previously TRIFOLIUM olivaceum]
SYNONYMS: Trifolium olivaceum Greene; Trifolium albopurpureum Torr. & A. Gray var. olivaceum (Greene) Isely
+ 'Trifolium olivaceum Greene;' added
2019 01 22

p. 798
NATURALIZED
TRIFOLIUM resupinatum
+ 'UNABRIDGED' deleted
+ 'WAIF' made 'NATURALIZED'
2019 09 24

p. 798
TRIFOLIUM resupinatum
FLOWER: calyx glabrous or sparsely hairy, upper lip inflated in fruit, veins connected by cross veins; corolla becoming reflexed, pink to purple, banner notched at tip.
+ 'calyx glabrous, inflated in fruit,' made 'calyx glabrous or sparsely hairy, upper lip inflated in fruit,'
2019 10 01

p. 798
TRIFOLIUM striatum
ELEVATION: 0--685 m.
+ '500' made '685'
2013 11 04

p. 798
TRIFOLIUM trichocalyx
BIOREGIONAL DISTRIBUTION: w-c NCoRO (Mendocino Co.), CCo (Monterey Peninsula).
+ 'w-c NCoRO (Mendocino Co.),' added  
2015-02-12

p. 802
FAGACEAE
SCIED: Scientific Editors: Thomas J. Rosatti, Bruce G. Baldwin.
+ 'Scientific Editor: Thomas J. Rosatti.' made 'Scientific Editors: Thomas J. Rosatti, Bruce G. Baldwin. [eFlora only]
2015 02 10

p. 803
NOTHOLITHOCARPUS densiflorus
FRUIT: mature yr 2; nut 1, 20--35 mm, ovoid to +- spheric, partly enclosed by cup-like involucre (cup), remnants of perianth and style persistent as small point at tip; cup (1.5)2--3 cm diam, saucer-shaped, scales slender, +- tapered, reflexed to spreading.
+ ', remnants of perianth and style persistent as small point at tip' added [in TJM2; not abbreviated in eFlora]
2014 10 06

p. 804
QUERCUS
22' Rays of stellate hairs on lf abaxially gen 6--8, < 0.3 mm; KR, NCoRI, CaR, SN, SnFrB, SCoRO, ne WTR, MP .....-> var. semota
+ 'CaRH' made 'CaR' 
+ 'SN (exc c SNH)' made 'SN' 
2015 10 22

p. 804
QUERCUS
23. Shrub, tree gen > 5 m; lvs 2--6 cm, oblong to obovate, entire or +- toothed, adaxially green to blue-green
+ 'Tree gen > 5 m' made 'Shrub, tree gen > 5 m' [in TJM2; not abbreviated in eFlora] 
2014 09 19

p. 804
QUERCUS
24. Shrub, small tree 5--6(10) m; lf blade (10)20--35(60) mm, adaxially shiny green to dull blue-green, margin entire, dentate, or wavy-dentate .....-> Q. &times;acutidens (2)
+ 'Shrub to small tree, 5--6(10) m' made 'Shrub, small tree 5--6(10) m' [in TJM2; not abbreviated in eFlora] 
2014 09 19

p. 804
QUERCUS
24' Tree 5--18 m; lf blade (20)30--60(80) mm, adaxially blue-green, dull, margin wavy-dentate to gen entire .....-> Q. engelmannii
+ 'Tree, 5--18 m' made 'Tree 5--18 m' [in TJM2; not abbreviated in eFlora] 
2014 09 19

p. 804
QUERCUS agrifolia var. agrifolia
FLOWERING TIME: Mid Jan--Apr
+ 'Mar' made 'Mid Jan'
2016 06 21

p. 806
QUERCUS cedrosensis
LEAF: 0.6--2(3.5) cm; petiole 1.5--2.5 mm; blade lanceolate, ovate, oblong, elliptic, or subround, adaxially flat or convex, glossy green, glabrous, abaxially glaucous, glabrous, veins white, base rounded or cordate, tip acute to widely rounded, gen spine-like, margin entire or with few irregular spine-tipped teeth.
+ '6--20 (35) mm' made '0.6--2(3.5) cm' [in TJM2; not abbreviated in eFlora] 
2015 02 17

p. 806
QUERCUS douglasii
BIOREGIONAL DISTRIBUTION: KR, NCoRO, NCoRI, CaRF, SNF, Teh, ScV (Sutter Buttes), SnJV, SnFrB, SCoR, s ChI (Santa Catalina Island), WTR (n slope), MP.
+ 'KR,' added   
2015 05 07

p. 806
QUERCUS durata var. gabrielensis
NOTE: Hybridizes with _Q. engelmannii_ (_Q. &times;ewanii_ I.M. Turner, replacement name for _Q. &times;grandidentata_ Ewan, a later homonym), _Q. lobata_ N&eacute;e (_Q. &times;townei_ Palmer).
+ '(_Q. &times;grandidentata_ Ewan)' made '(_Q. &times;ewanii_ I.M. Turner, replacement name for _Q. &times;grandidentata_ Ewan, a later homonym)' [in TJM2; not abbreviated in eFlora] 
2015 04 15

p. 806
QUERCUS garryana var. semota
BIOREGIONAL DISTRIBUTION: KR, NCoRI, CaR, SN, SnFrB, SCoRO, ne WTR (Sierra Pelona Ridge), MP.
+ 'CaRH' made 'CaR' 
+ 'SN (exc c SNH)' made 'SN' 
2015 10 22

p. 807
QUERCUS kelloggii
FLOWERING TIME: Mid Feb--May
+ 'Apr' made 'Mid Feb'
2016 06 21

p. 807
QUERCUS lobata
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaRF, SNF, s SNH, Teh, GV, SnFrB, SCoR, nw SCo, ChI (Santa Cruz, Santa Catalina islands), WTR, w SnGb.
+ 'KR,' added   
2015 05 07 

p. 807
QUERCUS parvula var. tamalpaisensis
NOTE: Phylogenetic and population genetic analyses  (Am. J. Bot. 104(10):1581-1595. 2017) inconsistent with treatment as var. of Q. parvula; hybrid origin via successive backcrosses between Q. parvula var. shrevei and Q. wislizeni instead suggested.
+ NOTE added
2018 05 15

p. 807
QUERCUS vacciniifolia
DISTRIBUTION OUTSIDE CALIFORNIA: OR, NV.
+ 'OR.' made 'OR, NV.' 
2015 02 25

p. 808
QUERCUS wislizeni var. frutescens
NOTE: Phylogenetic and population genetic analyses  (Am. J. Bot. 104(10):1581-1595. 2017) inconsistent with treatment as var. of Quercus wislizeni; three samples from south of TR form a clade distinct from the other Q. wislizeni samples but are neither morphologically distinct nor consistent with morphology of Q. wislizeni var. frutescens.
+ NOTE added
2018 05 15

p. 808
QUERCUS wislizeni var. wislizeni
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaRF, SNF, s SNH, Teh, ScV (Sutter Buttes), SnFrB, SCoR, TR, PR, SNE;
+ 'KR,' added   
2015 05 07 

p. 808
QUERCUS wislizeni var. wislizeni
FLOWERING TIME: Early Feb--May
+ 'Mar' made 'Early Feb'
2016 06 21

p. 808
FRANKENIA
ETYMOLOGY: (Johann Frankenius, 1590--1661, Swedish botanist)
+ 'colleague of Linnaeus' made '1590--1661, Swedish botanist'
2018 01 16

p. 810
GARRYACEAE
PISTILLATE FLOWER: 1--3 per bract; pedicel +- 0 or short; perianth 0 or vestigial with 2 small appendages; ovary inferior, chamber 1, styles 2(3).
+ '(1)3 per bract' made '1--3 per bract'
2015 02 25

p. 810
GARRYA congdonii
BIOREGIONAL DISTRIBUTION: NW, CaRH, n&c SNF, SnFrB.
+ 'CaRH,' added  
2013 10 04

p. 810
GARRYA elliptica
BIOREGIONAL DISTRIBUTION: NCo, KR, NCoRO, n SNF, CW (exc SCoRI);
+ 'KR,' added, 'n SNF?' made 'n SNF', 'ScV (cult?),' deleted  
2013 10 04

p. 810
GARRYA flavescens
BIOREGIONAL DISTRIBUTION: NW, SN, SnJV, CW, SW, DMoj;
+ 'SnJV,' added, 'DMtns' made 'DMoj' 
2013 10 04

p. 810
GARRYA fremontii
BIOREGIONAL DISTRIBUTION: NW, CaR, n&s SNF, n&c SNH, ScV, SnFrB, PR, Wrn;
+ 'n SNF' made 'n&s SNF'  
2013 10 04

p. 812 [location or approximate location where treatment would appear in TJM2 were it not unabridged and therefore only in eFlora]
UNABRIDGED
WAIF 
CENTAURIUM pulchellum
NOTE: A few plants reported in 2012 from a qualifying habitat (coastal sage scrub) in South Coast (San Diego Co.), with no evidence of having been planted; additional reports of such populations elsewhere in the state and/or confirmation that the reported population has persisted would qualify the species as naturalized.
+ 'Found once in California (Stanislaus Co.); no recent records, but to be expected.' made 'A few plants reported in 2012 from a qualifying habitat (coastal sage scrub) in South Coast (San Diego Co.), with no evidence of having been planted; additional reports of such populations elsewhere in the state and/or confirmation that the reported population has persisted would qualify the species as naturalized.' [in eFlora; no description in TJM2]
2013 08 01

p. 814
FRASERA puberulenta
BIOREGIONAL DISTRIBUTION: c&s SNH, W&I.
+ 'W&I.' made 'W&I;' 
2015 02 26

p. 814
FRASERA puberulenta
DISTRIBUTION OUTSIDE CALIFORNIA: NV.
+ DISTRIBUTION OUTSIDE CALIFORNIA added 
2015 02 25

p. 818
GERANIACEAE
2. Fertile stamens gen 10; lf palmately lobed to divided .....-> GERANIUM
+ 'lf palmately lobed or divided' made 'lf palmately lobed to divided' [in eFlora; no description in TJM2]
2015 01 12

p. 818
GERANIACEAE
2' Fertile stamens gen 5; lf crenate to shallowly +- palmately lobed or gen pinnately lobed to compound
+ 'lf gen pinnately lobed to compound' made 'lf crenate to shallowly +- palmately lobed or gen pinnately lobed to compound' [in eFlora; no description in TJM2]
2015 01 12

p. 818
CALIFORNIA macrophylla
LEAF: simple, 10--15 cm, cauline opposite; blade << petiole, reniform, cordate, or ovate, crenate to shallowly +- palmately lobed, puberulent.
+ 'blade << petiole, reniform, crenate to shallowly lobed, puberulent, base cordate to truncate' made 'blade << petiole, reniform, cordate, or ovate, crenate to shallowly +- palmately lobed, puberulent' 
2015 01 12

p. 818
CALIFORNIA macrophylla
ECOLOGY: Open sites, grassland, scrub, vertic clay, occ serpentine;
+ ', vertic clay, occ serpentine' added  [in TJM2; not abbreviated in eFlora]
2015 11 12

p. 818
CALIFORNIA macrophylla
BIOREGIONAL DISTRIBUTION: NCoRI, s SNF, Teh, GV, CW, SCo, ChI (Santa Cruz, Santa Catalina islands), WTR, PR;
+ 'Teh,' added
2018 05 08

p. 820
GERANIUM
LEAVES: palmately lobed to divided, +- hairy; segments gen palmately lobed and/or toothed; upper alternate or opposite; blade gen round in outline, base gen cordate.
+ 'palmately lobed or divided' made 'palmately lobed to divided'
2015 01 12

p. 822
GERANIUM rotundifolium
FLOWER: pedicel 7--20 mm; sepals 4.5--6 mm, smooth, short-awned; petals 6--7 mm, rounded, rose-purple.
+ 'sepals 4.5--6, smooth,' made 'sepals 4.5--6 mm, smooth,'
2012 11 15

p. 826
RIBES malvaceum
HABIT+: Plant < 2 m.
+ 'm' added
2018 04 10

p. 826
RIBES montigenum
BIOREGIONAL DISTRIBUTION: KR, NCoRH, CaRH, SNH, TR, SnJt, Wrn, n DMtns;
+ 'NCoRH,' added
2017 10 17

p. 827
GUNNERA tinctoria
WEEDINESS: Potentially problematic weed
+ 'Potentially problematic weed' added [to replace removed broken diamond symbol in TJM2 (as an addition to existing note), and 'Weed listed by Cal-IPC' in eFlora]
2013 08 07

p. 830
PHILADELPHUS microphyllus
SYNONYMS: Philadelphus microphyllus var. stramineus (Rydb.) Henrickson; Philadelphus microphyllus subsp. pumilus (Rydb.) C.L. Hitchc.; Philadelphus microphyllus var. pumilus (Rydb.) Henrickson; Philadelphus microphyllus subsp. stramineus (Rydb.) C.L. Hitchc.; Philadelphus pumilus Rydb.; Philadelphus stramineus Rydb.
+ 'Philadelphus microphyllus var. pumilus (Rydb.) Henrickson;' added
2017 06 22

p. 830
PHILADELPHUS microphyllus
ELEVATION: 1340--3350 m.
+ '2840' made '3350'
2019 11 26

p. 830
HYPERICUM
3' Shrub or subshrub
+ 'Evergreen shrub or subshrub' made 'Shrub or subshrub'
2017 11 14

p. 830
HYPERICUM canariense
HABIT+: Deciduous shrub, generally 2--5 m.
'Evergreen' made 'Deciduous'
2017 11 14

p. 833
JUGLANS hindsii
BIOREGIONAL DISTRIBUTION: s NCoRI, s ScV, n SnJV, SnFrB;
'SnFrB.' made 'SnFrB;'  
2014 06 18

p. 833
JUGLANS hindsii
DISTRIBUTION OUTSIDE CALIFORNIA: sw OR.
+ 'sw OR.' added 
2014 06 18

p. 834 
(superseded by Supplement I)
LAMIACEAE
16' Ann or per (to subshrub, the corolla then salmon-orange)
+ improper use of em dash corrected, from 'Ann or per (to subshrub) --- corolla salmon-orange' to 'Ann or per (to subshrub, the corolla then salmon-orange)'
2012 03 27'
p2

p. 836
ACANTHOMINTHA
2' Upper stamens fertile; anthers hairy; CW, WTR
+ 'CCo, SnFrB, SCoR' collapsed to 'CW'
2012 03 27
p2

p. 836
ACANTHOMINTHA lanceolata
ECOLOGY: Woodland, chaparral, talus, rocky slopes, outcrops, occ serpentine;
+ 'Arid, rocky slopes, openings in scrub or woodland, generally on serpentine' made 'Woodland, chaparral, talus, rocky slopes, outcrops, occ serpentine' [in TJM2; not abbreviated in eFlora]
2015 12 03

p. 836
ACANTHOMINTHA obovata subsp. cordata
ECOLOGY: Grassy slopes, oak woodland, chaparral, vertic clay;
+ ', vertic clay' added
2016 04 26

p. 836
ACANTHOMINTHA obovata subsp. obovata
ECOLOGY: Grassy slopes, oak woodland, chaparral, vertic clay, occ serpentine;
+ ', vertic clay, occ serpentine' added [in TJM2; not abbreviated in eFlora]
2015 11 12

p. 837
CLINOPODIUM douglasii
UNABRIDGED NOTE: There are Consortium records that, if verified, would voucher elevations up to 1219 m. The following (and possibly other) accessions, if verified, would represent range extensions (as indicated): CHSC43961 (CaRH); CHSC59325, CHSC62566 (n SNH); UC175313 (c SNH). According to Moe (e-mail of 14 May 2012; archived in Eudora mailbox "Moe"), the voucher for 1219 m actually was collected in Idaho (Osier Ridge).
+ 'According to Moe (e-mail of 14 May 2012; archived in Eudora mailbox "Moe"), the voucher for 1219 m actually was collected in Idaho (Osier Ridge).' added [in eFlora; no unabridged notes in TJM2]
2012 05 22

p. 839
MARRUBIUM vulgare
BIOREGIONAL DISTRIBUTION: CA (exc W&I);
+ 'CA-FP, uncommon DMtns' made 'CA (exc W&I)' 
2014 08 07

p. 843
MONARDELLA
15. Bracts generally broadly ovate, strongly acuminate, not or only sparsely cross-veined, generally purple-tinted; SnFrB, SCoR, WTR .....-> subsp. breweri
+ 'WTR, SCoR, SnFrB' made 'SnFrB, SCoR, WTR' 
2015 08 31

p. 843
MONARDELLA
15' Bracts +- lance-ovate or narrower, acute, weakly to strongly cross-veined, occasionally purple tinted; KR, CaRF, s CaRH, SN, s SCoRO, SW
+ 'KR,' added 
2015 08 31

p. 844
MONARDELLA
33. Bracts 10--15 mm, >= 5 mm wide; PR, sw DMtns (Little San Bernardino Mtns), s DMoj .....-> subsp. linoides
+ 'PR, sw DMtns' made 'PR, sw DMtns (Little San Bernardino Mtns), s DMoj' 
2012 04 17

p. 844
MONARDELLA
34' St 20--60 cm; bracts broadly lanceolate to ovate; s SNF, c&s SNH, SNE, n DMoj
+ 'SN, n DMoj' made 's SNF, c&s SNH, SNE, n DMoj' 
2012 04 17

p. 844
MONARDELLA
35. Bracts 15--25 mm, 10--14 mm wide; peduncle stout, gen 5--15 cm (from distal-most lvs to fl cluster), 1--1.5 mm diam just proximal to fl cluster; fl cluster 20--30 mm wide; s SNF, s SNH (Kern, Tulare cos.) .....-> subsp. anemonoides
+ 's SNF, s SNH' made 's SNF, s SNH (Kern, Tulare cos.)' 
2012 04 17

p. 845
MONARDELLA breweri subsp. lanceolata
BIOREGIONAL DISTRIBUTION: KR, CaRF, s CaRH, SN, s SCoRO, SW;
+ 'KR,' added 
2015 08 25

p. 845
MONARDELLA douglasii
STEM: 10--30 cm, slender.
+ 'mm' made 'cm'
2015 01 07

p. 845
MONARDELLA douglasii
ECOLOGY: Grassland, openings in woodland and chaparral, serpentine, occ vertic clay;
+ 'Grassland, oak woodland, chaparral, serpentine outcrops' made 'Grassland, openings in woodland and chaparral, serpentine, occ vertic clay' [in TJM2; not abbreviated in eFlora]
2015 12 03

p. 848
MONARDELLA mojavensis
BIOREGIONAL DISTRIBUTION: e DMtns, incl edges (Old Woman, Granite, Old Dad, Providence mtns);
+ ', incl edges' added [in TJM2; not abbreviated in eFlora]
2014 07 29

p. 848
MONARDELLA odoratissima
NOTE: Ashy-gray, pale, chaffy-bracted, puberulent pls of ne Siskiyou Co. that have been identified as _M. odoratissima_ subsp. _o._ intergrade or are intermediate in morphology between subspecies _glauca_ and _pallida_; if recognized taxonomically, pls in NCoRH with spreading, soft, wavy lf hairs (and highly variable bract morphology) assignable to _Monardella odoratissima_ subsp. _pinetorum_ (Heller) Epling (study needed).
+ 'that have been called _Monardella odoratissima_ subsp. _odoratissima_' made 'that have been identified as _Monardella odoratissima_ subsp. _odoratissima_' [in TJM2; not abbreviated in eFlora]
+ 'plants in NCoRH with spreading, soft, wavy leaf hairs (and highly variable bract morphology) have been called _Monardella odoratissima_ subsp. _pinetorum_ (Heller) Epling (more study needed).' made 'if recognized taxonomically, plants in NCoRH with spreading, soft, wavy leaf hairs (and highly variable bract morphology) assignable to _Monardella odoratissima_ subsp. _pinetorum_ (Heller) Epling (study needed).' [in TJM2; not abbreviated in eFlora]
2015 04 30

p. 848 [location or approximate location where note would appear in TJM2 were it not unabridged and therefore only in eFlora]
MONARDELLA odoratissima
UNABRIDGED NOTE: Intergrades with _Monardella purpurea_ (in KR, NCoR), _Monardella linoides_, _Monardella eremicola_, and possibly _Monardella follettii_. Type specimen of _Monardella odoratissima_ subsp. _odoratissima_ is from northern Washington; if recognized taxonomically, ashy-gray, pale, chaffy-bracted, puberulent plants of northeastern Siskiyou Co. assignable to subsp. _odoratissima_. The distribution of this variant is generally from Little Mount Hoffman (Siskiyou Co.) northeastern to Oregon; more study needed. Variation in California generally as follows: conical glands on stems widespread, but lacking in Wrn and northern SN (southwestern Plumas and northern Sierra cos.); leaf hairs most dense in NCoRH (Glenn and Tehama cos.) and central SN (Madera, Tulare, and northeastern El Dorado cos.); serrate leaves occur in the vicinity of Sonora Pass (Mono and Tuolumne cos.) and near Camel Peak (Plumas Co.), possibly reflecting intergradation with _Monardella sheltonii_. Leaf blade length-to-width ratio generally < 2 in NCoRH, southern CaR, and northern SN at < 2000 m elevation; leaf blade length-to-width ratio > 3.8 in central SN at > 2000 m elevation (leaf blade width generally negatively correlated with elevation); bract hairs generally least dense in central SN (Mono Co.), most dense in northern NCoRH and lower elevations of southern SN (Madera and Tulare cos.). Plants with only scarious bracts common in Wrn and eastern CaR of Siskiyou Co.
+ 'ashy-gray, pale, chaffy-bracted, puberulent plants of northeastern Siskiyou Co. have been called subsp. _odoratissima_.' made 'if recognized taxonomically, ashy-gray, pale, chaffy-bracted, puberulent plants of northeastern Siskiyou Co. assignable to subsp. _odoratissima_.' [as UNABRIDGED NOTE not in TJM2; not abbreviated in eFlora]
2015 04 30

p. 848
MONARDELLA odoratissima subsp. glauca
BIOREGIONAL DISTRIBUTION: KR, NCoRH, CaR, SNH, GB;
+ 'KR,' added 
2015 08 25

p. 848
MONARDELLA robisonii
BIOREGIONAL DISTRIBUTION: s DMoj.
+ 'sw DMtns (Little San Bernardino Mtns)' made 's DMoj' 
2014 07 29

p. 849
MONARDELLA sheltonii
BIOREGIONAL DISTRIBUTION: KR, s CaR, n SN.
+ 'KR,' added 
2015 08 25

p. 855
SALVIA mohavensis
BIOREGIONAL DISTRIBUTION: DMoj (exc n&w), DSon (Whipple Mtns);
+ 'DMtns' made 'DMoj (exc n&w)' 
2014 08 05

p. 858
SCUTELLARIA tuberosa
BIOREGIONAL DISTRIBUTION: CA-FP (only Sutter Buttes in GV);
+ terminal period made semicolon
2012 03 27
p2

p. 858
STACHYS
STEM: decumbent to erect, 0.1--2.5 m.
+ '1' made '0.1'
2012 03 27

p. 858
STACHYS ajugoides
STEM: gen decumbent, 0.1--0.6 m, soft-hairy.
+ '1' made '0.1'
2012 03 27

p. 858
STACHYS ajugoides
BIOREGIONAL DISTRIBUTION: NW, ScV, CW, SW;
+ 'c SNH' deleted 
2014 04 07

p. 859
STACHYS pilosa
STEM: erect, 0.3--0.9 m, gen branched.
+ '3--9 dm' made '0.3--0.9 m'
2012 03 27

p. 860
TRICHOSTEMA rubisepalum
ECOLOGY: Seasonal seeps and gravelly streambeds, serpentine;
+ 'Gravelly streambeds' made 'Seasonal seeps and gravelly streambeds, serpentine'
2015 12 03

p. 864
LIMNANTHES
7' Sepals glabrous or sparsely hairy; fruit smooth to sharply tubercled; KR, CaRF, n&c SN .....-> L. alba subsp. versicolor
+ 'KR,' added; 'n&c SNF, n SNH' made 'n&c SN' 
2015 08 19

p. 864
LIMNANTHES alba subsp. versicolor
BIOREGIONAL DISTRIBUTION: KR, CaRF, n&c SN.
+ 'KR,' added; 'n&c SNF, n SNH' made 'n&c SN' 
2015 08 19

p. 866
HESPEROLINON breweri
BIOREGIONAL DISTRIBUTION: s NCoRI (Napa, Solano cos.), nw SnJV, ne SnFrB (Mount Diablo, Contra Costa Co.).
+ 'nw SnJV,' added 
2014 06 04

p. 866
HESPEROLINON californicum
BIOREGIONAL DISTRIBUTION: c&s NCoRI, s CaRF, n SNF, ScV, CCo (around San Francisco Bay), e SnFrB, ne SCoRI.
+ 'ScV, CCo (around San Francisco Bay),' added 
2014 06 04

p. 866
HESPEROLINON clevelandii
BIOREGIONAL DISTRIBUTION: NCoRO, c&s NCoRI, s NCoRH, e SnFrB.
+ 'c&s NCoRI, e SnFrB.' made 'NCoRO, c&s NCoRI, s NCoRH, e SnFrB.' 
2014 06 05

p. 866
HESPEROLINON congestum
BIOREGIONAL DISTRIBUTION: n CCo, nw SnFrB.
+ 'n CCo,' added 
2014 06 05

p. 866
HESPEROLINON disjunctum
ECOLOGY: Openings in chaparral, serpentine, vertic clay;
+ 'Serpentine, chaparral' made 'Openings in chaparral, serpentine, vertic clay'
2015 12 09

p. 866
HESPEROLINON drymarioides
BIOREGIONAL DISTRIBUTION: c NCoRI (Colusa, Glenn, Lake cos.), NCoRH.
+ ', NCoRH' added 
2014 06 05

p. 866
HESPEROLINON micranthum
BIOREGIONAL DISTRIBUTION: CA-FP, MP;
+ ', MP' added 
2014 06 05

p. 866
HESPEROLINON tehamense
BIOREGIONAL DISTRIBUTION: n&c NCoRI (Tehama, Glenn cos.), e NCoRH.
+ ', e NCoRH' added 
2014 06 05

p. 871
MENTZELIA involucrata
BIOREGIONAL DISTRIBUTION: D (exc DMtns);
+ 'D' made 'D (exc DMtns)'
2019 09 24

p. 872
MENTZELIA micrantha
BIOREGIONAL DISTRIBUTION: KR, NCoR, CW, SW;
+ 'SnFrB, SCoR,' made 'CW,'
2018 01 09

p. 872
MENTZELIA montana
TAXON AUTHOR: (Davidson) Davidson & Moxley
+ 'Davidson' made '(Davidson) Davidson & Moxley'
2015 01 30

p. 872
MENTZELIA oreophila
BIOREGIONAL DISTRIBUTION: W&I, DMoj, e DSon;
+ 'W&I, DMtns, e DSon' made 'W&I, DMoj, e DSon' 
2014 08 05

p. 872
MENTZELIA polita
BIOREGIONAL DISTRIBUTION: e DMoj (ne Clark Mtn Range);
+ 'e DMtns (Clark Mtn Range)' made 'e DMoj (ne Clark Mtn Range)' 
2014 08 05

p. 872
MENTZELIA pterosperma
BIOREGIONAL DISTRIBUTION: e-c DMoj;
+ 'e DMtns' made 'e-c DMoj' 
2014 07 29

p. 880
AYENIA compacta
BIOREGIONAL DISTRIBUTION: PR (desert slope), e&s DMoj (rare), w&c DSon;
+ 'e DMtns (Providence, Eagle mtns)' made 'e&s DMoj (rare)' 
2015 05 18

p. 880
EREMALCHE rotundifolia
BIOREGIONAL DISTRIBUTION: D exc DMtns;
+ 'D' made 'D exc DMtns'
2019 04 02

p. 881
FREMONTODENDRON californicum
DISTRIBUTION OUTSIDE CALIFORNIA: sw OR, AZ, n Baja CA.
+ 'sw OR,' added 
2014 06 03

p. 882
ILIAMNA rivularis
RARITY STATUS:
+ 'SYMBOL 1' deleted [meaning that a star symbol was removed from TJM2, while 'Listed on CNPS Rare Plant Inventory' was removed from the eFlora]
2013 10 11

p. 882
ILIAMNA rivularis
NOTE: Inclusion in flora in error; occurrence in CA based on misidentification.
+ 'Probably extirpated in CA.' made 'Inclusion in flora in error; occurrence in CA based on misidentification.' [in TJM2; not abbreviated in eFlora]
2015 06 09

p. 886
MALVA
1' Ann to per (subshrub), st 0.1--3 m; fls showy or not; petals 0.4--3 cm; calyx < 10 mm; segments 6--15
+ 'shrub' made 'subshrub'
2013 03 20

p. 886
MALVA pseudolavatera
HABIT+: Ann, bien, subshrub, sparsely stellate hairy.
+ 'subshrub' added
2013 03 20

p. 886
MALVA pseudolavatera
STEM: 10--30 dm; base woody or not.
+ 'base not woody' made 'base woody or not'
2013 03 20

p. 891
SIDALCEA
43' Basal lf blade gen > 2 cm; upper lvs lobed or unlobed; st base, stipules, calyx gen not +- purple; fl stalk stouter than hair-like; coastal or not, incl c&s NCo, n CCo, or not
+ 'fl stalk stouter then hair-like' made 'fl stalk stouter than hair-like' [in TJM2; not abbreviated in eFlora]
2016 01 21

p. 891
SIDALCEA asprella
SYNONYMS: 
+ 'Sidalcea malviflora subsp. asprella (Greene) C.L. Hitchc.' removed from SYNONYMS

p. 894
SIDALCEA oregana subsp. eximia
NOTE: Intergrades with _Sidalcea oregana_ subsp. _spicata_, _Sidalcea setosa_.
+ '_Sildalcea oregana_' made '_Sidalcea oregana_'
2012 03 27
p2

p. 896
SPHAERALCEA emoryi var. emoryi
BIOREGIONAL DISTRIBUTION: SCo, s PR, s DMoj, DSon;
+ 'SCo, s PR,' added 
2014 07 31

p. 897
SPHAERALCEA rusbyi A. Gray var. eremicola
BIOREGIONAL DISTRIBUTION: n DMtns (Death Valley region, e Inyo Co.; Clark Mtn Range, ne San Bernardino Co.), e DMoj exc DMtns.
+ ', e DMoj exc DMtns' added  
2014 08 05

p. 900  
(superseded by Supplement II)
MONTIACEAE
NOTE: All CA genera previously included in Portulacaceae; details of flowers, seeds require 20&times; magnification.
+ 'Details of fls, seeds require 20&times; magnification.' made 'All CA genera previously incl in Portulacaceae; details of fls, seeds require 20&times; magnification.' [in TJM2; not abbreviated in eFlora]
2014 09 03

p. 901 
(superseded by Supplement II)
CALANDRINIA breweri
BIOREGIONAL DISTRIBUTION: NCoR, c SNF, c&s SNH, CCo, SnFrB, SCoRO, SCo, n ChI, TR, PR;
+ 'c&s SNH,' added 
+ 'WTR' made 'n ChI, TR, PR' 
2016 05 18

p. 901 
(superseded by Supplement II)
CALANDRINIA ciliata
NOTE: Up to 30 seeds not uncommon at Pinnacles National Monument according to Sara Reid (pers. comm. to editors).
+ NOTE added
2012 04 20

p. 901 
(superseded by Supplement II)
CALYPTRIDIUM
3. Style 1--2 mm; seeds 1--3, 0.7--0.9 mm; c SN .....-> C. pulchellum
+ 'Anthers yellow' made 'Style 1--2 mm'
2014 07 18

p. 901 
(superseded by Supplement II)
CALYPTRIDIUM
3' Style < 0.5 mm; seeds >= 4, 0.4--0.8 mm; widespread, incl e slope SNH (for _C. roseum_) but otherwise exc c SN
+ 'Anthers pink to rose' made 'Style < 0.5 mm'
+ 'widespread' made 'widespread, incl e slope SNH (for _C. roseum_) but otherwise exc c SN' 
2014 07 18

p. 901 
(superseded by Supplement II)
CALYPTRIDIUM
8' Seed generally 0.5--0.7 mm, papillae throughout or marginal; fruit < 6 mm; sw SnFrB, n SCoR, s SCoRO, TR, SnJt, SNE, DMtns  .....-> C. parryi
+ 'n SCoR,' added 
2015 12 16

p. 901 
(superseded by Supplement II)
CALYPTRIDIUM
9' Seed papillae marginal; sw SnFrB, n SCoR, SNE, DMtns
+ 'n SCoR,' added 
2015 12 16

p. 901 
(superseded by Supplement II)
CALYPTRIDIUM
10. Seed 0.5--0.6 mm; sepals ovate, with generally narrowly scarious margin; 600--1050 m, sw SnFrB, n SCoR' .....-> var. hesseae
+ ', n SCoR' added 
2015 12 16

p. 901 
(superseded by Supplement II)
CALYPTRIDIUM monandrum
FLOWER: sepals 1--2 mm, ovate to deltate, fleshy, narrowly white on margin in flower, scarious throughout in fruit; petals generally 3, 1--3 mm, pink to +- red; stamen 1; stigma sessile.
+ ', anther pink' deleted [in TJM2; not abbreviated in eFlora]
2014 09 03

p. 902  
(superseded by Supplement II)
CALYPTRIDIUM monospermum
FLOWER: sepals 3--8 mm, +- round, scarious; petals 4, 3--7 mm, rose to white; stamens 3; style 2--4 mm, thread-like, exserted, falling with fruit cap.
+ ', anthers pink to rose' deleted [in TJM2; not abbreviated in eFlora]
2014 09 03

p. 902  
(superseded by Supplement II)
CALYPTRIDIUM parryi
FLOWER: sepals 2--5 mm, generally unequal (outer >, wider than inner), round, ovate, or reniform, generally scarious on margin or becoming scarious throughout; petals 4, 1.5--3 mm, generally white; stamens (1)3; style 0.5--1 mm, stigma +- sessile.
+ ', anthers pink' deleted [in TJM2; not abbreviated in eFlora]
2014 09 03

p. 902  
(superseded by Supplement II)
CALYPTRIDIUM parryi var. hesseae
BIOREGIONAL DISTRIBUTION: sw SnFrB, n SCoR.
+ ', nSCoR' added [in TJM2; already included in eFlora as part of Supplement II]
2015 12 16

p. 902  
(superseded by Supplement II)
CALYPTRIDIUM pulchellum
FLOWER: sepals 3--4 mm, +- reniform to round, scarious; petals 4, +- 3 mm, rose; stamens 3, anthers yellow; style 1--2 mm, thread-like, generally included.
+ ', anthers yellow' deleted [in TJM2; not abbreviated in eFlora]
2014 09 03

p. 902  
(superseded by Supplement II)
CALYPTRIDIUM pulchellum
FLOWERING TIME: Apr--May
+ 'Apr--Jul' made 'Apr--May'
2018 06 12

p. 902  
(superseded by Supplement II)
CALYPTRIDIUM pygmaeum
BIOREGIONAL DISTRIBUTION: c&s SNH, SnBr.
+ 's SNH' made 'c&s SNH'  
2014 08 18

p. 902  
(superseded by Supplement II)
CALYPTRIDIUM umbellatum
FLOWER: sepals 3--8 mm, +- round, scarious; petals 4, 3--8 mm, white; stamens 3; style 2--4 mm, thread-like, exserted.
+ ', yellow to red' deleted [in TJM2; not abbreviated in eFlora]
2014 09 03

p. 902
CISTANTHE
SEED: 6--many, shiny or dull, black or gray [dark brownish red].
+ 'dull to shiny, black.' made 'shiny or dull, black or gray [dark brownish red]'
2018 08 06

p. 902
CISTANTHE ambigua
SEED: 6--15, 1--2 mm wide, +- elliptic to ovate, shiny, glabrous, black.
+ 'smooth, shiny, black' made 'shiny, glabrous, black'
2018 08 06

p. 902
CISTANTHE maritima
SEED: 20--40, 0.5--1 mm wide, +- elliptic, dull, with short, white hairs, gray.
+ 'smooth, dull gray, with short, white hairs, black' made 'dull, with short, white hairs, gray'
2018 08 06

p. 905
CLAYTONIA lanceolata
BIOREGIONAL DISTRIBUTION: KR, NCoRH, CaRH, n&c SNH, SnGb, SnBr, MP, DMtns (Panamint Range);
+ 'SnBr,' added 
2013 10 28

p. 907
LEWISIA cantelovii
BIOREGIONAL DISTRIBUTION: KR, n&s SNH.
+ 'CaRH,' deleted 
2015 08 19

p. 907
LEWISIA cotyledon var. cotyledon
BIOREGIONAL DISTRIBUTION: KR;
+ ', CaRH' deleted 
2015 08 19

p. 907
LEWISIA cotyledon var. howellii
BIOREGIONAL DISTRIBUTION: KR;
+ ', CaRH' deleted 
2015 08 19

p. 907
LEWISIA glandulosa
TAXON AUTHOR: (Rydb.) S. Clay
+ 'Dempster' made 'S. Clay'
2015 06 02

p. 907
LEWISIA glandulosa
SYNONYMS:  L. glandulosa (Rydb.) Dempster, illeg.
+ SYNONYMS added [in TJM2; not abbreviated in eFlora]
2015 06 02

p. 908
LEWISIA leeana
BIOREGIONAL DISTRIBUTION: KR, NCoRH, CaR, c&s SNH;
+ 'c SNH' made 'c&s SNH' 
2014 10 23

p. 910
MONTIA fontana
FLOWERING TIME: Feb--Jul
+ 'Jul--Aug' made 'Feb--Jul'
2013 01 04

p. 910
MONTIA linearis
DISTRIBUTION OUTSIDE CALIFORNIA: western North America, alien in eastern United States, Europe.
+ 'to western Canada, Montana, Utah.' made 'western North America, alien in eastern United States, Europe.'
2018 08 06

p. 911
FICUS carica
BIOREGIONAL DISTRIBUTION: KR, CaRF, SNF, GV, SnFrB, SCo, TR, PR;
+ 'KR, CaRF,' added
+ ', TR, PR' added
2016 05 24

p. 912 [location or approximate location where note would appear in TJM2 were it not unabridged and therefore only in eFlora]
MYRSINACEAE
UNABRIDGED NOTE: Recent molecular work has redefined Ericales. Non-rosette, terrestrial members of Primulaceae s.l. are now widely treated in Myrsinoideae or Myrsinaceae, which are further characterized by synapomorphies of dark dots or streaks on stems, leaves, or flowers, short corolla tubes, seeds immersed in the placenta, and -- for woody members -- wood lacking rays or with only multiseriate rays. Primulaceae, Myrsinaceae, Theophrastaceae, and Maesaceae (a recent segregate of tropical trees) constitute a closely related, monophyletic group. _Lysimachia_ has been recognized (even by Linnaeus) as a rather complex group with close affinities to other genera (_Glaux_, for instance, has been shown to be an apetalous sp. of _Lysimachia_). Phylogenetic research (by Arne A. Anderberg and colleagues in Europe) on this and related genera indicated that they were actually specialized taxa that had evolved within _Lysimachia_, so that all California members of Myrsinaceae now have been transferred to _Lysimachia_ (Manns & Anderberg 2009 Willdenowia 39:49--54 and Cholewa 2014 Phytoneuron 2014-28: 1--2), as reflected in this revised treatment that now includes _Lysimachia arvensis_, _Lysimachia europaea_, _Lysimachia latifolia_, _Lysimachia maritima_, _Lysimachia minima_, and _Lysimachia monelli_, in addition to the two species previously treated in the genus.
+ 'this revised treatment that now includes _Lysimachia arvensis_, _Lysimachia europaea_, _Lysimachia latifolia_, _Lysimachia maritima_, and _Lysimachia minima_.' made 'this revised treatment that now includes _Lysimachia arvensis_, _Lysimachia europaea_, _Lysimachia latifolia_, _Lysimachia maritima_, _Lysimachia minima_, and _Lysimachia monelli_, in addition to the two species previously treated in the genus.' [not abbreviated in eFlora]
2015 02 05

p. 912
ANAGALLIS arvensis
BIOREGIONAL DISTRIBUTION: CA-FP, D;
+ 'DMoj' made 'D'  
2013 10 01

p. 912
ANAGALLIS  minima
BIOREGIONAL DISTRIBUTION: NW, CaRF, n SNF, GV, CW, SCo, n ChI, PR;
+ 'SnJV (Merced Co.)' made 'GV'  
2013 10 01

p. 912 [location or approximate location where treatment would appear in TJM2 were it not unabridged and therefore only in eFlora]
UNABRIDGED
WAIF
ANAGALLIS monelli
BIOREGIONAL DISTRIBUTION: KR, CCo, SnFrB, SCoRO, SCo, WTR;
+ 'CCo,', 'SCo, WTR' added [not abbreviated in eFlora; no description in TJM2]
2013 10 01

p. 912
GLAUX maritima
BIOREGIONAL DISTRIBUTION: NCo, deltaic GV, CCo, SnFrB, SNE, MP (exc Wrn); 
+ ', MP (exc Wrn)' added 
2013 10 01

p. 913
TRIENTALIS latifolia
BIOREGIONAL DISTRIBUTION: NW, CaR, n&c SN, ScV, CW; 
+ 'CaRH (Mount Shasta)' made 'CaR'  
2013 10 01

p. 913
EUCALYPTUS
SPECIES IN GENUS: +- 700 species: most endemic to Australia; > 250 species cult in California; important for oils, tannins, timber, orns.
+ '; > 250 species. Cult in California;' made '; > 250 species cult in California;'
2018 08 06

p. 916
LEPTOSPERMUM
FLOWER: calyx lobes, petals, 5, free; hypanthium gen widely cup-shaped; petals white, pink, or red; stamens many; chambers 5--many; style extending to or exceeded by stamens.
+ 'locules 5--many' made 'chambers 5--many' 
2015 03 12

p. 917
ABRONIA
9. Perianth tube 2--3.5 cm, limb (1)1.5--1.8 cm wide; fr wings each with 1 prolonged, acute lobe distally .....-> var. aurita
+ 'Fr wings exceeding fr body; fl limb (1)1.5--1.8 cm wide' made 'Perianth tube 2--3.5 cm, limb (1)1.5--1.8 cm wide; fr wings each with 1 prolonged, acute lobe distally'
2013 04 04

p. 917
ABRONIA
9' Perianth tube 1.3--2 cm, limb 0.6--1.2(1.5) cm wide; fr wings each with 0 or 1 shallow, rounded lobe distally .....-> var. villosa
+ 'Fr wings 0 or not or barely exceeding fr body; fl limb 0.6--1.2(1.5) cm wide' made 'Perianth tube 1.3--2 cm, limb 0.6--1.2(1.5) cm wide; fr wings each with 0 or 1 shallow, rounded lobe distally'
2013 04 04

p. 917
ABRONIA alpina
FLOWERING TIME: May--Sep
+ 'Jul--Aug' made 'May--Sep'
2013 11 21

p. 918
ABRONIA umbellata var. umbellata
BIOREGIONAL DISTRIBUTION: NCo (Sonoma Co.), CCo, SCo, ChI, DSon;
+ 'ChI,' added  
2014 08 05

p. 918
ABRONIA villosa var. aurita
BIOREGIONAL DISTRIBUTION: c&s SCo, PR, w DSon.
+ 'PR, ' added
2019 03 05

p. 918
ABRONIA villosa var. villosa
BIOREGIONAL DISTRIBUTION: D (exc DMtns);
+ 'D' made 'D (exc DMtns)'
2019 11 12

p. 919
BOERHAVIA coccinea
BIOREGIONAL DISTRIBUTION: s SnJV, SCo, PR, DSon;
+ 'PR (Santa Ana Mtns)' made 'PR'  
2012 10 19

p. 919
BOERHAVIA coulteri (Hook. f.) S. Watson var. palmeri
ELEVATION: < 1450 m.
+ '1150' made '1450'
BIOREGIONAL DISTRIBUTION: ChI (possibly introduced), se DMoj (desert mtns and lower montane slopes), DSon;
+ 'DMtns (Clark Mtn Range)' made 'se DMoj (desert mtns and lower montane slopes)'   
2014 08 15

p. 919
BOERHAVIA triquetra S. Watson var. intermedia
BIOREGIONAL DISTRIBUTION: e PR, e DMtns (Clark, Ivanpah mtns, Kingston Range), se DMoj exc DMtns, e DSon;
+ ', se DMoj exc DMtns' added 
2014 08 05

p. 923
FRAXINUS dipetala
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaR, SNF, c&s SN, CW, TR, PR.
+ 'KR,' added; 'CaRF' made 'CaR' 
2015 08 12

p. 924
LIGUSTRUM lucidum
WEEDINESS: Potentially problematic weed
+ 'Potentially problematic weed' added [to replace removed broken diamond symbol in TJM2 (as a note), and 'Weed listed by Cal-IPC' in eFlora]
2013 08 07

p. 924
LIGUSTRUM ovalifolium
WEEDINESS: Potentially problematic weed
+ 'Potentially problematic weed' added [to replace removed broken diamond symbol in TJM2 (as a note), and 'Weed listed by Cal-IPC' in eFlora]
2013 08 07

p. 924
MENODORA spinescens var. spinescens
BIOREGIONAL DISTRIBUTION: SnBr (n slope), s SNE, n&e DMoj exc DMtns;
+ 'DMtns' made 'n&e DMoj exc DMtns' 
2014 08 05

p. 925
OLEA europaea
LEAF: petiole 2--7 mm; blade 20--70 mm, 6--16 mm wide, narrowly elliptical to oblanceolate, green adaxially, closely silver-scaly abaxially.
+ 'closely silver-scaly adaxially' made 'closely silver-scaly abaxially'
2015 10 27

p. 925
ONAGRACEAE
9. Per; fr cylindric-ovoid, +- straight or slightly curved, +- angled to nearly smooth, lacking pointed wing near center top of each valve, walls generally thin, distended by seeds; sterile projection of ovary persistent with fertile part in fr, without abscission line at juncture between hypanthium and fertile part of ovary .....-> TARAXIA
+ 'without abscission lines' made 'without abscission line' 
2014 12 19

p. 926
CAMISSONIA
INFLORESCENCE: bracted; spike or raceme, nodding in bud, erect in fr, fls only at distal nodes.
+ 'spike, nodding in bud, fl only at distal nodes' made 'spike or raceme, nodding in bud, erect in fr, fls only at distal nodes' [in TJM2; not abbreviated in eFlora]
2014 04 28

p. 926
CAMISSONIA
FRUIT: +- cylindric, straight to wavy, distorted by seeds at maturity, dehiscent throughout most of its length; pedicel +- 0 or <= 2(15) mm, shorter or 0 in fl.
+ ', gen sessile.' made '; pedicel +- 0 or <= 2(15) mm, 0 or shorter in fl.' [in TJM2; not abbreviated in eFlora]
2014 04 28

p. 926
CAMISSONIA
1. Infl spike or raceme; pedicel in fr +- 0--15 mm; sepals all separating when fl opens
+ 'Sepals all separating when fl opens' made 'Infl spike or raceme; pedicel in fr +- 0--15 mm; sepals all separating when fl opens' [in TJM2; not abbreviated in eFlora]
2014 04 28

p. 926
CAMISSONIA
3. Pl +- open, sparsely spreading-hairy, sparsely glandular-hairy; lvs not clustered at base; pedicel in fr +- 0--5 mm .....-> subsp. gilmanii
+ 'pedicel 0--5 mm' made 'pedicel in fr +- 0--5 mm' [in TJM2; not abbreviated in eFlora]
2014 04 28

p. 926
CAMISSONIA
3' Pl compact, densely spreading-hairy, sparsely glandular-hairy; lvs clustered at base; pedicel in fr 3--15 mm .....-> subsp. kernensis
+ 'pedicel 3--15 mm' made 'pedicel in fr 3--15 mm' [in TJM2; not abbreviated in eFlora]
2014 04 28

p. 926
CAMISSONIA
1' Infl spike; pedicel in fr +- 0; sepals gen remaining fused in pairs when fl opens
+ 'Sepals gen remaining fused in pairs when fl opens' made 'Infl spike; pedicel in fr +- 0; sepals gen remaining fused in pairs when fl opens' [in TJM2; not abbreviated in eFlora]
2014 04 28

p. 926
CAMISSONIA
13' Sepals 2.5--4 mm; petals 3--5 mm
+ 'Sepals 1.6--4 mm; petals 2--4(5) mm' made 'Sepals 2.5--4 mm; petals 3--5 mm'
2014 12 09

p. 927
CAMISSONIA benitensis
ECOLOGY: Woodland, chaparral, sandy serpentine and graywacke soils;
+ 'Sandy or gravelly serpentine soil' made 'Woodland, chaparral, sandy serpentine and graywacke soils'
2016 04 26

p. 927
CAMISSONIA kernensis
FRUIT: 22--37 mm, 1.5--1.7 mm wide, +- swollen by seeds, straight or wavy; pedicel +- 0--15 mm.
+ 'pedicel 0--15 mm' made 'pedicel +- 0--15 mm'
2014 04 28

p. 927
CAMISSONIA kernensis subsp. gilmanii
FRUIT: pedicel +- 0--5 mm.
+ 'pedicel 0--5 mm' made 'pedicel +- 0--5 mm'
2014 04 28

p. 927
CAMISSONIA parvula
FRUIT: +- 20--30 mm, 0.6--0.9 mm wide, +- swollen by seeds, straight or wavy; pedicel +- 0--2 mm.
+ ', +- sessile' made '; pedicel +- 0--2 mm'
2014 04 28

p. 927
CAMISSONIA pubens
FRUIT: (18)26--50 mm, 0.8--1.2 mm wide, +- swollen by seeds, straight or wavy; pedicel +- 0--2 mm.
+ 'pedicel 0--2 mm' made 'pedicel +- 0--2 mm'
2014 04 28

p. 927
CAMISSONIA pusilla
FRUIT: 18--32 mm, 0.6--0.9 mm wide, +- swollen by seeds, straight or wavy; pedicel +- 0--2 mm.
+ 'pedicel 0--2 mm' made 'pedicel +- 0--2 mm'
2014 04 28

p. 927
CAMISSONIA sierrae
FRUIT: 20--30 mm, 0.5--0.7 mm wide, +- swollen by seeds, straight or wavy, +- sessile.
+ ', sessile' made ', +- sessile'
2014 04 28

p. 928
CAMISSONIOPSIS
7. Fruit 1.3--1.6 mm wide, +- cylindric, drying +- 4-angled; SCoR (Monterey, San Luis Obispo cos.) .....-> C. hardhamiae
+ 'SCoRO' made 'SCoR'
2018 01 16

p. 930
CAMISSONIOPSIS hardhamiae
BIOREGIONAL DISTRIBUTION: SCoR (Monterey, San Luis Obispo cos.).
+ 'SCoRO' made 'SCoR'
2018 01 16

p. 930
CAMISSONIOPSIS micrantha
ECOLOGY: Canyons, coastal dunes, beaches, sandy fields, washes;
+ 'Coastal dunes, beaches, sandy fields, washes' made 'Canyons, coastal dunes, beaches, sandy fields, washes'
2013 08 01

p. 930
CAMISSONIOPSIS micrantha
ELEVATION: <  300(800) m.
+ '< 300 m' made '<  300(800) m'
2013 08 01

p. 933
CHYLISMIELLA pterosperma
BIOREGIONAL DISTRIBUTION: W&I, DMtns (Panamint Range);
+ 'W&I (Inyo Mtns),' made 'W&I,'
2019 11 05

p. 934
CLARKIA
11. Seeds brown; s SNF, CCo, SCoRO, SCo, WTR, SnGb, nw PR .....-> C. bottae
+ 's SCoRO (San Luis Obispo Co. and s)' made 's SNF, CCo, SCoRO'
+ 'SnGb,' added 
2016 05 18

p. 934
CLARKIA
27. Infl dense; ovary gen > distal internode
+ 'ovary at fl > distal internode' made 'ovary gen > distal internode' [in TJM2; not abbreviated in eFlora]
2015 02 18

p. 934
CLARKIA
27' Infl open; ovary gen < distal internode
+ 'ovary at fl < distal internode' made 'ovary gen < distal internode' [in TJM2; not abbreviated in eFlora]
2015 02 18

p. 934
CLARKIA
39. Seed 1.8--2.5 mm; se KR, CaRF .....-> subsp. arida
+ 'se KR,' added  
2015 08 27

p. 937
CLARKIA borealis subsp. arida
BIOREGIONAL DISTRIBUTION: se KR, CaRF.
+ 'se KR,' added  
+ '(only at type locality, s Shasta Co.)' deleted 
2015 06 16

p. 937
CLARKIA bottae
BIOREGIONAL DISTRIBUTION: s SNF, CCo, SCoRO, SCo, WTR, SnGb, nw PR.
+ 's SCoRO' made 's SNF, CCo, SCoRO' 
+ 'SnGb,' added 
2016 05 18

p. 937
CLARKIA breweri
ECOLOGY: Chaparral, talus, occ serpentine;
+ 'Openings in woodland, chaparral' made 'Chaparral, talus, occ serpentine'  [in TJM2; not abbreviated in eFlora]
2016 04 26

p. 937
CLARKIA dudleyana
BIOREGIONAL DISTRIBUTION: SNF, c&s SNH, Teh, e SCo,TR, PR.
+ 'c&s SNF' made 'SNF, c&s SNH' 
+ 'e SCo,' added 
+ ', PR' added 
2016 05 18

p. 938
CLARKIA imbricata
FLOWER: hypanthium 10--15 mm, conspicuously veined; sepals fused to tip in bud, all coming free; corolla bowl-shaped, petals 20--25 mm, fan-shaped, lavender shading paler near middle, with large wedge-shaped purple-red spot distally; stamens 8, anthers alike; ovary > distal internode, 8-grooved, stigma exserted beyond anthers.
+ 'ovary at fl > distal internode' made 'ovary > distal internode'
2015 02 18

p. 938
CLARKIA jolonensis
BIOREGIONAL DISTRIBUTION: n SCoRO (Monterey Co.).
+ 'near Jolon,' deleted
2016 05 18

p. 940
CLARKIA purpurea subsp. purpurea
FLOWER: petals 10--25 mm, lavender to purple or purple-red, often lighter proximally, often with a darker spot distally; stigma exserted beyond anthers; ovary > distal internode.
+ 'ovary at fl > distal internode' made 'ovary > distal internode'
2015 02 18

p. 940
CLARKIA purpurea subsp. viminea
FLOWER: petals 15--25 mm, lavender to purple, with darker distal spot, darker proximally or not; stigma exserted beyond anthers, ovary < distal internode.
+ 'ovary at fl < internode above' made 'ovary < distal internode'
2015 02 18

p. 940
CLARKIA speciosa subsp. immaculata
FLOWER: petals red-lavender shading to pale yellow or white proximally, spot 0; ovary gen < distal internode.
+ '; ovary gen < distal internode' added
2015 02 18

p. 941
CLARKIA unguiculata
BIOREGIONAL DISTRIBUTION: NCoR, s CaRF, SN, ScV (Sutter Buttes), SnJV, s CCo, SnFrB, SCoR, SCo, ChI, TR, PR.
+ 'NCoR, SNF, Teh, ScV (Sutter Buttes), SnFrB, SCoR, SCo, WTR, PR.' made 'NCoR, s CaRF, SN, ScV (Sutter Buttes), SnJV, s CCo, SnFrB, SCoR, SCo, ChI, TR, PR.'
2016 08 23

p. 941
EPILOBIUM
1' Per to subshrub from caudex, taproot 0; lvs gen opposite up to infl, gen narrowly lanceolate to ovate; proximal st not peeling (exc _Epilobium rigidum_)
+ 'gen (narrowly) lanceolate to ovate' made 'gen narrowly lanceolate to ovate' [in TJM2; not abbreviated in eFlora]
2015 02 19

p. 941
EPILOBIUM
3. Fr wall tough, gen splitting only on distal 1/3; seeds in 2 rows per chamber; basal branches gen prostrate or decumbent
+ '(sect. _Epilobiopsis_)' deleted
2015 02 20

p. 941
EPILOBIUM
3' Fr wall flexible, splitting to base; seeds in 1 row per chamber or compressed into 1 staggered row per capsule; basal branches ascending or 0
+ 'compressed to 1 row per capsule' made 'compressed into 1 staggered row per capsule'
+ '(sect. _Boisduvalia_)' deleted
2015 02 18

p. 941
EPILOBIUM
6. Hypanthium 1.5--3 mm, sepals 2--6 mm, petals 3--10 mm; fr 10--21 mm; seeds compressed into 1 staggered row per capsule, 1.8--2.3 mm .....-> E. pallidum
+ 'seeds in 1 staggered row, 1.8--2.3 mm' made 'seeds compressed into 1 staggered row per capsule, 1.8--2.3 mm'
2015 02 18

p. 941
EPILOBIUM
6' Hypanthium 0.4--1 mm, sepals 0.7--2 mm, petals 1--3.2 mm; fr 8--14 mm; seeds in 1 row per chamber, 0.9--1.6 mm .....-> E. torreyi
+ 'seeds in 4 rows, 0.9--1.6 mm' made 'seeds in 1 row per chamber, 0.9--1.6 mm'
2015 02 18

p. 941
EPILOBIUM
9. Hypanthium 17--34 mm; corolla red-orange, +- bilateral 
+ '(sect. _Zauschneria_)' deleted
2015 02 20

p. 941
EPILOBIUM
9' Hypanthium gen 0.4--8(16) mm; corolla white or cream-yellow to purple
+ ' (sect. _Epilobium_)' deleted
2015 02 20

p. 941
EPILOBIUM
10' Clumped perennial herb to subshrub 1--12 dm; all leaves alike, generally not white-canescent, glandular or not; widespread CA-FP, D .....-> E. canum
+ ', D' added
2017 08 16

p. 942
31. Inflorescence +- nodding; pedicel in fruit 10--55 mm; seed 0.7--1.4 mm .....-> E. anagallidifolium
+ ', netted' deleted
2017 10 17

p. 942
31' Inflorescence erect; pedicel in fruit 2--18 mm; seed 1.5--2.1 mm .....-> E. clavatum
+ ', papillate' deleted
2017 10 17

p. 942
EPILOBIUM brachycarpum
ECOLOGY: Common. Dry or seasonally moist, often disturbed ground in open woods, meadows, prairies, esp on roadsides, streambanks;
+ 'Dry open or disturbed woodland, grassland, roadsides' made 'Dry or seasonally moist, often disturbed ground in open woods, meadows, prairies, esp on roadsides, streambanks;'
2017 10 17

p. 943
EPILOBIUM canum subsp. latifolium
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaR, SN, SCo, TR, PR, DMoj, DSon (n&w edge);
+ 'KR, NCoRH, CaR, SN, TR, PR, DMtns;' made 'KR, NCoR, CaR, SN, SCo, TR, PR, DMoj, DSon (n&w edge);'
2017 08 16

p. 943
EPILOBIUM ciliatum subsp. ciliatum
LEAF: narrowly lanceolate, distal reduced.
+ 'lanceolate' made 'narrowly lanceolate'
2015 02 19

p. 943
EPILOBIUM ciliatum subsp. glandulosum
LEAF: narrowly ovate to ovate (lanceolate), little reduced upward.
+ 'gen ovate' made 'narrowly ovate to ovate (lanceolate)' [in TJM2; not abbreviated in eFlora]
2015 02 19

p. 943
EPILOBIUM ciliatum subsp. watsonii
LEAF: lanceolate to subovate, distal not much reduced.
+ 'lanceolate to ovate' made 'lanceolate to subovate'
2015 02 19

p. 943
EPILOBIUM clavatum
SEED: 1.5--2.1 mm, netted.
+ 'papillate' made 'netted'
2017 10 17

p. 943
EPILOBIUM cleistogamum
SEED: in 2 rows per chamber, 1--1.5 mm, netted, glabrous, hair-tuft 0.
+ 'per cell' made 'per chamber' 
2015 02 19

p. 952
OENOTHERA cavernae
LEAF: (0.5)2.5--13(19.5) cm, (0.2)0.6--2.3(2.7) cm wide, oblanceolate to elliptic-oblanceolate or lyre-shaped and pinnately lobed to nearly entire, green to red-green, lustrous, gen with numerous scattered red-purple splotches, minutely glandular-hairy, sometimes also sparsely rough-coarse-hairy, finely crenate-dentate to entire.
+ 'crenulate-dentate' made 'finely crenate-dentate'
2012 10 05

p. 952
OENOTHERA cespitosa subsp. marginata
BIOREGIONAL DISTRIBUTION: GB, D;
+ 'MP, SNE' collapsed to 'GB' 
2012 03 27
p2

p. 953
OENOTHERA suffrutescens
BIOREGIONAL DISTRIBUTION: s DMoj (DMtns and surrounding lowlands) (naturalized Teh, SW);
+ 'DMtns' made 's DMoj (DMtns and surrounding lowlands)'
2017 05 09

p. 954
TARAXIA
HABIT+: Per, from thick taproot that may branch in age producing multiple rosettes, st 0.
+ 'Per, st 0, from thick taproot that may branch in age producing multiple rosettes.' made 'Per, from thick taproot that may branch in age producing multiple rosettes, st 0.' [in TJM2; not abbreviated in eFlora]
2014 09 18

p. 954
TETRAPTERON
HABIT+: Ann, from taproot, sts rarely present, to 25 mm.
+ 'Ann, st 0, from taproot.' made 'Ann, from taproot, sts rarely present, to 25 mm.' [in TJM2; not abbreviated in eFlora]
2014 09 18

p. 954
TETRAPTERON graciliflorum
STEM: to 25 mm, not swollen, not peeling.
+ 'to 25 mm' made 'to 25 mm, not swollen, not peeling'
2014 09 11

p. 954
TETRAPTERON palmeri
STEM: to 20 mm, swollen, peeling.
+ 'to 25 mm' made 'to 20 mm'
2014 09 11

p. 959
CASTILLEJA affinis subsp. affinis
BIOREGIONAL DISTRIBUTION: c NCo (Mendocino Co.), KR, NCoRO, NCoRI, n CaRF, SNF, CW, SW;
+ 'KR,' added 
2015 06 15

p. 959
CASTILLEJA applegatei subsp. martinii
BIOREGIONAL DISTRIBUTION: KR, NCoRO, NCoRI, e SnFrB, SCoR, SW (exc ChI), SNE, DMtns;
+ 'SCoRI' made 'SCoR'  
2014 07 11

p. 960
CASTILLEJA densiflora
UNABRIDGED SYNONYMS: Orthocarpus densiflorus Benth.
+ 'densiflora' made 'densiflorus' [in eFlora; unabridged synonyms not in TJM2]
2013 03 28

p. 962
CASTILLEJA gleasoni
CHROMOSOMES:
CHROMOSOMES deleted
2015 02 19

p. 962
CASTILLEJA linariifolia
BIOREGIONAL DISTRIBUTION: CaR, e slope SNH, TR, GB, DMoj;
+ 'DMtns' made 'DMoj' 
2014 07 30

p. 962
CASTILLEJA lineariloba
INFLORESCENCE: 2--5 cm, 2.5--4 cm wide; bracts 12--25 mm, lobes 5--7, linear, tipped cream to pale yellow (pale purple).
+ '20--50 cm' made '2--5 cm'
2018 05 22

p. 963
CASTILLEJA minor subsp. spiralis
BIOREGIONAL DISTRIBUTION: NCoR, c&s SNF, s SNH, Teh, SnJV, CCo, n SnFrB, SW.
+ 's SNH, Teh,' added; 'SCo' made 'SW' 
2014 08 05

p. 963
CASTILLEJA pilosa
UNABRIDGED SYNONYMS: Castilleja pilosa subsp. jusselii (Eastw.) Munz; Castilleja psittacina (Eastw.) Pennell
+ 'jussellii' made 'jusselii' [in eFlora; unabridged synonyms not in TJM2]
2013 03 28

p. 964
CHLOROPYRON
3. Stem generally much-branched, distal branches generally > central spike; seeds +- 2 mm; SCo .....-> subsp. maritimum
+ 's CCo,' deleted
2019 09 03

p. 964
CHLOROPYRON
3' Stem 0--few-branched, branches <= central spike; seeds 2--3 mm; NCo, CCo .....-> subsp. palustre
+ 'n CCo' made 'CCo (Marin, Sonoma, San Luis Obispo cos.)'
2019 09 03

p. 964
CHLOROPYRON maritimum subsp. maritimum
BIOREGIONAL DISTRIBUTION: SCo;
+ 's CCo (Morro Bay),' deleted
2019 09 03

p. 964
CHLOROPYRON maritimum (Nutt. ex Benth.) A. Heller subsp. palustre
BIOREGIONAL DISTRIBUTION: n NCo (Humboldt Co.), CCo (Marin, Sonoma, San Luis Obispo cos.);
+ 'n CCo (Marin, Sonoma cos.)' made 'CCo (Marin, Sonoma, San Luis Obispo cos.)'
2019 09 03

p. 965
Castilleja nana and Castilleja pilosa (bottom of plate)
+ bract indicated for Castilleja nana is instead bract of Castilleja pilosa, and vice versa
2015 09 01

p. 966
CORDYLANTHUS
INFLORESCENCE: short dense spike (subtended by bracts), < 2(5) cm or fls 1, scattered or often clustered but not in spikes (each subtended by outer bract); outer bracts +- lf-like; inner bract calyx-like (formerly confused with calyx), 0--7-lobed.
+ 'fls 1 (each subtended by outer bract)' made 'fls 1, scattered or often clustered but not in spikes (each subtended by outer bract)' [in TJM2; not abbreviated in eFlora]
2015 02 12

p. 966
CORDYLANTHUS
6' Fls 1 or 2--4 in loose clusters; lower corolla lip << upper; inner bract gen entire; e DMtns .....-> C. parviflorus
+ 'Fls solitary, scattered' made 'Fls 1 or 2--4 in loose clusters' [in TJM2; not abbreviated in eFlora]
2015 02 12

p. 966
CORDYLANTHUS
11. Middle lobe of outer bract linear, tip wider, notched, thickened, maroon, marginal bristles > 2 &times; lobe width --- SCoRO, SW .....-> subsp. setiger
+ 'setigerus' made 'setiger'
2013 10 31

p. 967
CORDYLANTHUS parviflorus
INFLORESCENCE: fls 1 or 2--4 in loose clusters; outer bract gen 1, 5--15 mm, 3--5-lobed, tips obtuse, ciliate, densely glandular; inner bract 10--12 mm.
+ 'fls gen 1, scattered' made 'fls 1 or 2--4 in loose clusters' [in TJM2; not abbreviated in eFlora]
2015 02 12

p. 967
CORDYLANTHUS pilosus
INFLORESCENCE: fls 1 or 2--3 in loose clusters; outer bracts 1--4, 15--20 mm, linear, entire or 3-lobed in distal 2/3, tips > 1.5 mm wide, angled to slightly 3-lobed, often ivory-thickened; inner bract 15--22 mm, tip abruptly pointed to notched.
+ 'fls 1--3 in loose clusters' made 'fls 1 or 2--3 in loose clusters' [in TJM2; not abbreviated in eFlora]
2015 02 12

p. 968
CORDYLANTHUS pringlei
INFLORESCENCE: fls 2--4 in head-like clusters; outer bracts 1--3, 5--8 mm, fan-shaped, shallowly 3--7-lobed; inner bract 8--10 mm, tip rough-papillate.
+ 'fls 1 or 2--4 in head-like clusters' made 'fls 2--4 in head-like clusters' [in TJM2; not abbreviated in eFlora]
2015 02 12

p. 968
CORDYLANTHUS ramosus
INFLORESCENCE: fls 3--7 in spike-like clusters, clusters 15--25 mm; outer bract 1 per fl, 10--20 mm, entire to 7-lobed, sometimes bristly, segments +- thread-like; inner bract 10--20 mm, entire.
+ 'fls solitary; clusters spike-like, 15--25 mm, 3--7-fld' made 'fls 3--7 in spike-like clusters, clusters 15--25 mm' [in TJM2; not abbreviated in eFlora]
2015 02 12

p. 968
CORDYLANTHUS rigidus
INFLORESCENCE: fls 5--15 in +- compact, head-like clusters; outer bract gen 1 per fl, 5--20 mm, gen 3-lobed; inner bract 14--20 mm.
+ 'fls solitary, 5--15 in +- compact, head-like clusters' made 'fls 5--15 in +- compact, head-like clusters' [in TJM2; not abbreviated in eFlora]
2015 02 12

p. 968
CORDYLANTHUS rigidus (Benth.) Jeps. subsp. setiger
+ 'setigerus' made 'setiger'
2013 10 31

p. 971
OROBANCHE
15. St delicate; +- 500 m; s CCo, SCoRI, SCoRO, w WTR .....-> subsp. condensa
+ 'SCoRI' made 's CCo, SCoRI, SCoRO, w WTR' 
2015 06 23

p. 971
OROBANCHE californica subsp. condensa
BIOREGIONAL DISTRIBUTION: s CCo, SCoRI, SCoRO, w WTR.
+ 'SCoRI' made 's CCo, SCoRO, w WTR' 
2015 06 23

p. 977
OXALIDACEAE
GENERA IN FAMILY: 5 genera, number of spp. uncertain: esp temp.
+ '+- 880 spp.' made 'number of spp. uncertain'
2012 03 27

p. 977
OXALIS
5. Petals gen < 8 mm; taproot fibrous; st rooting at nodes .....-> O. corniculata
5' Petals gen 8--12 mm; taproot +- woody; st not rooting at nodes (sometimes rooting at nodes in _O. pilosa_)
+ replaces couplet 5 [in TJM2; not abbreviated in eFlora]
2014 04 02

p. 977
OXALIS articulata Savigny subsp. rubra
SYNONYMS: Oxalis rubra A. St.-Hil.
+ 'A. St. Hil.' made 'A. St.-Hil.' [in eFlora; still correct in TJM2]
2018 08 06

p. 978
OXALIS pilosa
STEM: erect to decumbent, < 40 cm, rooting at nodes or not, hairs 0.7--1.2 mm, dense, gen spreading.
+ 'not rooting at nodes' made 'rooting at nodes or not' [in TJM2; not abbreviated in eFlora]
2014 12 19

p. 978
PAEONIA brownii
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaR, n&n-c SN, se SnFrB (Mount Hamilton), MP, n SNE;
+ 'n&n-c SN, se SnFrB (Mount Hamilton), MP, n SNE;' added, 'n to WA, WY, NV.' deleted  
2013 09 30

p. 978
PAEONIA brownii
DISTRIBUTION OUTSIDE CALIFORNIA: to WA, WY, NV.
+ 'to WA, WY, NV.' added  
2013 09 30

p. 978
PAEONIA californica
BIOREGIONAL DISTRIBUTION: s CCo, SCoR, SCo, TR, PR;
+ 'SCo' added  
2013 09 30

p. 980
ARCTOMECON
+ Added 'ARCTOMECON' above description and below key to genera of Papaveraceae
2012 03 27
p2

p. 981
DENDROMECON rigida
BIOREGIONAL DISTRIBUTION: s NW, CaR, SN, CW (exc ChI), SW, w edge DSon;
+ 'CaRF' made 'CaR'  
+ 'SNF' made 'SN'  
+ ', w edge DSon' added  
2016 05 11

p. 984
ESCHSCHOLZIA parishii
BIOREGIONAL DISTRIBUTION: s DMoj exc DMtns, DSon;
+ 's DMoj' made 's DMoj exc DMtns'
2019 11 19

p. 984
FUMARIA capreolata
NOTE: Identity of specimens from many other places in CA in need of confirmation.
+ 'Possibly naturalized.' made 'Identity of specimens from many other places in CA in need of confirmation.' [in TJM2; not abbreviated in eFlora] 
2015 07 06

p. 985
MECONELLA oregana
BIOREGIONAL DISTRIBUTION: CCo (Fort Ord), SnFrB (Berkeley Hills, Mount Hamilton);
+ 'SnFrB (Berkeley Hills, Mount Hamilton);' made 'CCo (Fort Ord), SnFrB (Berkeley Hills, Mount Hamilton);'  
2013 08 01

p. 986
PARNASSIA cirrata var. intermedia
BIOREGIONAL DISTRIBUTION: KR;
+ ', CaRH' deleted  
2015 08 25

p. 990
MIMULUS
37. Rhizomatous per to shrub; calyx 1.7--4.5 cm; lf edges flat to +- rolled under; main lf axils gen with clusters of smaller lvs
+ 'calyx 1.5--5 cm' made 'calyx 1.7--4.5 cm'  [in TJM2; not abbreviated in eFlora]
2015 02 17

p. 990
MIMULUS
38' Subshrub or shrub, > 1 inflorescence per stem; leaf adaxially glabrous; calyx base not swollen; corolla pale yellow to +- yellow or yellow-brown, yellow-orange, orange, or red; fruit splitting only along upper suture .....-> M. aurantiacus
+ 'corolla pale yellow to +- yellow or yellow-brown, orange, orange, or red' made 'corolla pale yellow to +- yellow or yellow-brown, yellow-orange, orange, or red'
2013 11 01

p. 990
MIMULUS
39. Lower lf surface puberulent to densely hairy, gen paler than upper
+ 'upper gen paler' made 'gen paler than upper' [in TJM2; not abbreviated in eFlora] 
2015 02 17

p. 990
MIMULUS
39' Lower lf surface glabrous, not paler than upper
+ 'Lvs glabrous, uniformly green' made 'Lower lf surface glabrous, not paler than upper'
2015 02 17

p. 991
MIMULUS aurantiacus
FLOWER: calyx 17--45 mm, not swollen at base, glabrous to hairy, lobes unequal, 2--11 mm, acute to acuminate; corolla persistent, +- yellow, orange, or red, tube-throat 25--57 mm; placentas parietal.
+ 'calyx 17--46 mm' made 'calyx 17--45 mm'
2015 02 17

p. 992
MIMULUS aurantiacus var. aurantiacus
FLOWER: calyx 18--36 mm, tube glabrous, distally appressed to corolla tube; corolla +- yellow-orange to orange (cream), tube-throat 26--38 mm, lobes entire to 2-lobed distally; anthers included.
+ 'corolla +- yellow-orange to orange' made 'corolla +- yellow-orange to orange (cream)'
2013 11 01

p. 992
MIMULUS aurantiacus var. puniceus
FLOWER: calyx 19--27 mm, tube glabrous, distally appressed to corolla tube; corolla dark yellow-orange to orange or red, tube-throat 27--35 mm, lobes entire to 2-lobed; anthers included or +- exserted.
+ 'tube; dark yellow-orange to orange or red' made 'tube; corolla dark yellow-orange to orange or red'
2015 06 23

p. 992
MIMULUS bolanderi
BIOREGIONAL DISTRIBUTION: KR, NCoR, SN (common c SNF), CW, WTR.
+ 'KR,' added 
2015 08 25

p. 996
MIMULUS shevockii
BIOREGIONAL DISTRIBUTION: s SNF (Cortez, Cyrus canyons, Kern Co.), s SNH, w edge DMoj (Kelso Creek).
+ 's SNH,' added 
2016 05 18

p. 1001
PITTOSPORUM undulatum
ECOLOGY: Uncommon but aggressively spreading. Disturbed areas, coastal scrub;
+ 'Uncommon. Disturbed areas;' made 'Uncommon but aggressively spreading. Disturbed areas, coastal scrub;'
2012 08 14

p. 1001
PITTOSPORUM undulatum
UNABRIDGED NOTE: A decline in sp. richness, cover of native herbaceous pls, shrubs documented from communities invaded by this taxon in Australia, according to Rejmanek (2012 Cal-IPC News 20(4):in press), so that its establishment in CA is a serious threat to native coastal scrub in the state.
+ UNABRIDGED NOTE added [in eFlora; no unabridged notes in TJM2]
2012 08 14

p. 1001
PLANTAGINACEAE
7. Lvs gen alternate (exc proximal gen opposite in _Antirrhinum_, _Cymbalaria_, _Mohavea_, _Pseudorontium_; proximal-most opposite on seedlings in _Maurandella_), not all basal
+ '(exc proximal opposite in _Cymbalaria_, _Pseudorontium_)' made '(exc proximal gen opposite in _Antirrhinum_, _Cymbalaria_, _Mohavea_, _Pseudorontium_; proximal-most opposite on seedlings in _Maurandella_)'
2013 03 12

p. 1003
ANTIRRHINUM
8. Corolla veins violet; swollen lower lip base with dense, cylindric hairs to 1 mm; KR, NCoRI, w CaR, n ScV .....-> A. cornutum
+ 'KR,' added 
2015 08 26

p. 1003
ANTIRRHINUM
16. Branchlets subtending flowers with 1 leaf at proximal-most node; KR, NCoR, CaRF .....-> subsp. breweri
+ 'KR, n NCoRO, NCoRH, c CaRH' made 'KR, NCoR, CaRF' 
2015 06 12

p. 1003
ANTIRRHINUM cornutum
BIOREGIONAL DISTRIBUTION: KR, NCoRI, w CaR, n ScV.
+ 'KR,' added 
2015 06 12

p. 1003
ANTIRRHINUM filipes
HABIT+: Ann, glabrous exc st woolly at base.
+ 'exc st wooly at base' added
STEM: vine-like, climbing, 9--100 cm.
+ ',woolly at base, nonglandular' deleted
2012 03 27

p. 1004
ANTIRRHINUM multiflorum
TAXON AUTHOR: Pennell, illeg.
+ ', illeg.' added
2014 08 19

p. 1004
ANTIRRHINUM multiflorum
NOTE: _A. m._ a later homonym; legitimate name in _A._ evidently not available.
+ NOTE added [in TJM2; not abbreviated in eFlora]
2014 08 19

p. 1004
ANTIRRHINUM nuttallianum
NOTE: Subspp. hybridize near coast.
+ 'Sspp.' made 'Subspp.' [in TJM2; not abbreviated in eFlora]
2013 08 01

p. 1004
ANTIRRHINUM vexillocalyculatum subsp. breweri
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaRF;
+ 'KR, n NCoRO, NCoRH, c CaRH;' made 'KR, NCoR, CaRF;' 
2015 06 12

p. 1008
COLLINSIA
21. Lateral corolla lobes exceeding lowest by 1--2 mm
+ rewritten, from '21. Lowest corolla lobe 1--2 mm, < lateral lobes'
2012 03 27

p. 1008
COLLINSIA
21' Lateral corolla lobes exceeding lowest by << 1 mm, or not exceeding it
+ rewritten, from '21' Lowest corolla lobe +- = lateral lobes'
2012 03 27

p. 1009
COLLINSIA torreyi var. brevicarinata
FLOWER: corolla gen 6--9 mm.
+ ', lowest lobe 1--2 mm, < lateral lobes' deleted
2012 03 27

p. 1010
COLLINSIA torreyi var. latifolia
FLOWER: corolla gen 6--9 mm, upper lip with projections bulging +- 0.5 mm away from throat opening at base of each lobe.
+ ', lowest lobe +- = lateral' deleted
2012 03 27

p. 1010
COLLINSIA torreyi var. latifolia
ECOLOGY: Conifer forest, often in sandy soil;
+ ', granitic' deleted
2012 03 27

p. 1010
COLLINSIA torreyi var. torreyi
FLOWER: corolla gen 6--9 mm, upper lip with projections bulging +- 0.5 mm away from throat opening at base of each lobe.
+ ', lowest lobe +- = lateral' deleted
2012 03 27

p. 1010
COLLINSIA torreyi var. wrightii
FLOWER: corolla gen 4--6 mm.
+ ', lowest lobe +- 1 mm, < lateral lobes' deleted
2012 03 27

p. 1010
CYMBALARIA muralis
TAXON AUTHOR: G. Gaertn. et al.
+ 'P. Gaertn.' made 'G. Gaertn.' [in TJM2; in eFlora, 'G. Gaertn. et al.' expanded to 'G. Gaertn., B. Mey., & Scherb.']
2016 01 14

p. 1013
KECKIELLA antirrhinoides var. microphylla
UNABRIDGED NOTE: As _Penstemon antirrhinoides_ Benth. subsp. _microphyllus_ (A.Gray) D.D.Keck, indicated as well for Baja CA by Wiggins (1980. Flora of Baja California).
+ UNABRIDGED NOTE added [in eFlora; no unabridged notes in TJM2]
2012 03 27

p. 1013
KECKIELLA breviflora var. glabrisepala
BIOREGIONAL DISTRIBUTION: NCoRI, s CaR, SN, ScV, SCoRI, n SNE exc W&I;
+ 's CaR,' added; ', n SNE exc W&I' added 
2015 08 12

p. 1013
KECKIELLA lemmonii
DISTRIBUTION OUTSIDE CALIFORNIA: OR, NV.
+ 'OR.' made 'OR, NV.' 
2015 02 25

p. 1014
KICKXIA
SPECIES IN GENUS: +- 9 species: Europe, Mediterranean, western Asia.
+ 'Mediterranean.,' made 'Mediterranean,' [in eFlora; 'Medit.' made 'Medit' in TJM2]
2018 08 28

p. 1016
MOHAVEA
LEAF: proximal gen opposite, distal alternate; lanceolate, entire; veins pinnate.
+ 'alternate, widely lanceolate, entire; veins pinnate.' made 'proximal gen opposite, distal alternate; lanceolate, entire; veins pinnate.'
2013 03 12

p. 1020
PENSTEMON azureus var. angustissimus
BIOREGIONAL DISTRIBUTION: KR, NCoRH, CaR, n&c SN.
+ 'KR,' added 
2015 08 25

p. 1022
PENSTEMON filiformis
ELEVATION: 400--1700 m.
BIOREGIONAL DISTRIBUTION: KR (n Trinity, nw Shasta cos.), w CaRH (Mount Shasta).
+ 'e KR' made 'KR' 
2015 08 25

p. 1022
PENSTEMON filiformis
BIOREGIONAL DISTRIBUTION: KR (n Trinity, nw Shasta cos.).
+ ', w CaRH (Mount Shasta)' deleted  
2016 01 14

p. 1022
PENSTEMON fruticiformis var. amargosae
ELEVATION: gen 1000--1750 m.
+ '300--1750' made 'gen 1000--1750' [in TJM2; not abbreviated in eFlora]
2014 08 05

p. 1022
PENSTEMON fruticiformis var. amargosae
BIOREGIONAL DISTRIBUTION: n DMoj;
+ 'n DMtns' made 'n DMoj' 
2014 08 05

p. 1022
PENSTEMON fruticiformis var. fruticiformis
ELEVATION: gen 1000--1700 m.
+ '1200--1700' made 'gen 1000-1700' [in TJM2; not abbreviated in eFlora]
2014 08 05

p. 1022
PENSTEMON fruticiformis var. fruticiformis
BIOREGIONAL DISTRIBUTION: s SNE, n DMoj.
+ 'n DMtns' made 'n DMoj' 
2014 08 05

p. 1025
PENSTEMON newberryi var. newberryi
BIOREGIONAL DISTRIBUTION: KR, CaRH, SNH, n Teh;
+ 'KR,' added 
2015 08 25

p. 1025
PENSTEMON pseudospectabilis
ELEVATION: gen 100--1750 m.
+ '100--1400' made 'gen 100--1750' [in TJM2; not abbreviated in eFlora]
2014 08 05

p. 1025
PENSTEMON pseudospectabilis
BIOREGIONAL DISTRIBUTION: D;
+ 'DMtns, DSon' made 'D' 
2014 08 05

p. 1026
PENSTEMON rydbergii A. Nelson var. oreocharis
BIOREGIONAL DISTRIBUTION: KR, NCoRH, CaR, SNH, GB;
+ 'KR, NCoRH,' added 
2015 08 25

p. 1028
PLANTAGO arenaria
SYNONYMS: Plantago indica L., nom. superfl.; Plantago psyllium L., nom. rejic.
+ 'Plantago psyllium L., nom. ambig.' made 'Plantago psyllium L., nom. rejic.'
NOTE: Often used for bird seed, poultry feed.
+ '; correct name probably _Plantago psyllium_, which should be rejected as ambiguous' deleted
UNABRIDGED NOTE: 
+ UNABRIDGED NOTE deleted
2015 08 03

p. 1030
PLANTAGO eriopoda
BIOREGIONAL DISTRIBUTION: KR, n CaR;
+ deleted 'SNE (Mono Co.)' 
2012 03 27
p2

p. 1032
VERONICA
NOTE: _V. beccabunga_ L., _V. chamaedrys_ L. not in CA; _V. filiformis_ Sm., _V. hederifolia_ L. occ as lawn weeds. _V. biloba_ L., native to e Eur, Asia, a waif in s SNF, MP, differs from _V. persica_ in ways incl shorter styles (< 1 mm).
+ 'Pls from MP resembling _V. persica_ reported as _V. biloba_ L. (bracts < lvs, style < 1 mm).' made '_V. biloba_ L., native to e Eur, Asia, a waif in s SNF, MP, differs from _V. persica_ in ways incl shorter styles (< 1 mm).' [in TJM2; not abbreviated in eFlora]
2013 08 01

p. 1032
VERONICA americana
FLOWER: sepals +- 3 mm, lanceolate, acute; corolla 7--10 mm, violet-blue, dark-lined; style 1.5--3(4) mm.
+ 'oblanceolate' made 'lanceolate'
2013 11 05

p. 1032
VERONICA catenata
BIOREGIONAL DISTRIBUTION: CA-FP, MP;
+ ', MP' added
2017 06 22

p. 1032
VERONICA peregrina L. subsp. xalapensis
+ inserted space before note, after 'S.Am.'
2012 03 27
p2

p. 1034
VERONICA scutellata
FRUIT: 3--4 mm, wider than long; deeply notched 0.4--1 mm.
+ 'longer than wide' made 'wider than long'
2018 10 16

p. 1034
VERONICA serpyllifolia L. subsp. humifusa
+ inserted space before note, after 'Eurasia.'
2012 03 27
p2

p. 1035
LIMONIUM
INFLORESCENCE: panicle, branched +- at plant base, flowers in sessile, 1--3(5)-flowered spike-like clusters, each 3-bracted at base, clusters evenly spaced along branches to crowded at branch tips.
+ '1--3(5) flowered' made '1--3(5)-flowered'
2018 09 04

p. 1040
COLLOMIA
1' Annual from taproot
+ 'tap root' made 'taproot'
2013 08 01

p. 1041
(superseded by Supplement III)
ERIASTRUM
1' Annual (occasionally short-lived perennial herb)
+ 'short lived' made 'short-lived'
2013 08 01

p. 1041
(superseded by Supplement III)
ERIASTRUM
9' Corolla lobes white, lavender, or variously blue
+ 'or blue' made 'or variously blue'
2014 06 02

p. 1042
(superseded by Supplement III)
ERIASTRUM
13. Flowers 3+ per cluster; corolla lobes dark to royal blue, pale blue, or white; calyx, bracts occasionally +- glandular, woolly .....-> subsp. dasyanthum
+ 'corolla lobes royal to dark blue' made 'corolla lobes dark to royal blue, pale blue, or white'
2014 06 02

p. 1042
(superseded by Supplement III)
ERIASTRUM
19' Corolla 9--14 mm; st gen not wiry; pls erect, woolly-hairy to occ subglabrous; lvs entire or 1--7-lobed near base; SNH, GB, n DMtns .....-> E. wilcoxii
+ 'Corolla gen 15--22 mm' made 'Corolla 9--14 mm' [in TJM2; not abbreviated in eFlora]
2014 03 27

p. 1043
GILIA
LEAF: simple, 1--3-pinnate-lobed or -dissected, generally alternate, margins entire, toothed, or lobed, tips acute, acuminate, or mucronate; basal generally in rosette; cauline generally reduced.
+ '1--2-pinnate-lobed' made '1--3-pinnate-lobed'
+ 'margins entire, toothed, or lobed,' inserted before 'tips acute'
+ 'basal generally in rosette, entire, toothed, or 1--2-pinnate-lobed;' made 'basal generally in rosette;'
2013 10 22

p. 1044
GILIA
12. Corolla 9--35 mm, 2--7 &times; calyx
+ 'Corolla 10--35 mm' made 'Corolla 9--35 mm'
2012 05 21

p. 1046
GILIA
40' Corolla throat purple-marked but without 2 spots below each lobe
+ 'node' made 'lobe'
2012 03 27
p2

p. 1049
GILIA latiflora subsp. latiflora
FLOWER: calyx 4--5 mm; corolla 15--22 mm, tube +- exserted, white-veined, throat widely expanded, purple at base, otherwise white with yellow spots near base.
+ 'purple with yellow spots at base' made 'purple at base, otherwise white with yellow spots near base'
2014 05 07

p. 1052
GILIA stellata
BIOREGIONAL DISTRIBUTION: SNE, D;
+ 'W&I' made 'SNE'
2016 11 30

p. 1057
LEPTOSIPHON ciliatus
BIOREGIONAL DISTRIBUTION: CA-FP, MP.
+ ', MP' added  
2015 07 31

p. 1057
LEPTOSIPHON croceus
TAXON AUTHOR: (Eastw.) Strother & Kersh
+ 'J.M. Porter & L.A. Johnson' made 'Strother & Kersh'
NOTE: The combination Leptosiphon croceus (Eastw.) J.M. Porter & L.A. Johnson is not considered to have been validly published because the place of publication of the basionym was incorrectly cited by Porter & Johnson, a situation corrected by Strother & Kersh (Phytoneuron 2016-21: 1--2).
+ NOTE added
2016 03 03

p. 1057
LEPTOSIPHON filipes
BIOREGIONAL DISTRIBUTION: NCoR, CaRF, SN.
+ 'SNF' made 'SN' 
2015 08 12

p. 1057
LEPTOSIPHON liniflorus
BIOREGIONAL DISTRIBUTION: CA-FP, w DMoj;
+ 'n&c CA-FP' made 'CA-FP' 
2012 04 12

p. 1058
LEPTOSIPHON montanus
BIOREGIONAL DISTRIBUTION: SNF.
+ 'c&s' deleted 
2015 07 31

p. 1058
LEPTOSIPHON nudatus
BIOREGIONAL DISTRIBUTION: s SN, Teh.
+ 's SHN' made 's SN' 
2015 07 31

p. 1058
LEPTOSIPHON oblanceolatus
BIOREGIONAL DISTRIBUTION: c&s SNH.
+ 's SNH' made 'c&s SNH' 
2015 07 31

p. 1058
LEPTOSIPHON rattanii
BIOREGIONAL DISTRIBUTION: NCoRH, NCoRO.
+ ', NCoRO' added 
2015 07 31

p. 1058
LEPTOSIPHON serrulatus
BIOREGIONAL DISTRIBUTION: s SN.
+ 's SNF' made 's SN' 
2015 07 31

p. 1058
(superseded by Supplement III)
LINANTHUS
HABIT+: Ann, per, subshrub.
+ ', subshrub' added
2015 05 01

p. 1058
(superseded by Supplement III)
LINANTHUS
1. Per, subshrub; lf lobes sharp-tipped
+ 'base woody' made 'subshrub'
2015 05 01

p. 1059
(superseded by Supplement III)
LINANTHUS arenicola
BIOREGIONAL DISTRIBUTION: s SNE, DMoj;
+ 's SNE,' added 
2015 07 31

p. 1059
(superseded by Supplement III)
LINANTHUS bigelovii
BIOREGIONAL DISTRIBUTION: se SnFrB, SCoRI, WTR, SnGb (e edge), SnBr (e edge), SNE exc W&I, PR, D.
+ 'se SnFrB, SCoRI, WTR, W&I, D' made 'se SnFrB, SCoRI, WTR, SnGb (e edge), SnBr (e edge), SNE exc W&I, PR, D' 
2014 07 07

p. 1059
(superseded by Supplement III)
LINANTHUS californicus
HABIT+: Subshrub.
+ 'Per, base woody.' made 'Subshrub.' [in TJM2; not abbreviated in eFlora]
2015 05 01

p. 1059
(superseded by Supplement III)
LINANTHUS californicus
BIOREGIONAL DISTRIBUTION: s CCo, s SCoRO, n&c SW.
+ 's CCo,' added 
2014 07 02

p. 1059
(superseded by Supplement III)
LINANTHUS californicus
SYNONYMS: Leptodactylon californicum Hook. & Arn.; Leptodactylon californicum Hook. & Arn. subsp. brevitrichomum Gordon-Reedy; Leptodactylon californicum Hook. & Arn. subsp. californicum; Leptodactylon californicum Hook. & Arn. subsp. glandulosum (Eastw.) H. Mason; Leptodactylon californicum Hook. & Arn. subsp. leptotrichomum Gordon-Reedy; Leptodactylon californicum Hook. & Arn. subsp. tomentosum Gordon-Reedy, listed on CNPS Rare Plant Inventory
+ 'Leptodactylon californicum Hook. & Arn. subsp. tomentosum Gordon-Reedy' made 'Leptodactylon californicum Hook. & Arn. subsp. tomentosum Gordon-Reedy, listed on CNPS Rare Plant Inventory' [a star symbol was added to TJM2, while 'Listed on CNPS Rare Plant Inventory' was added to the eFlora]
2016 01 20

p. 1060
(superseded by Supplement III)
LINANTHUS demissus
BIOREGIONAL DISTRIBUTION: SNE, DMoj, DSon (ne corner);
+ ', DSon (ne corner)' added 
2014 07 02

p. 1060
(superseded by Supplement III)
LINANTHUS dianthiflorus
BIOREGIONAL DISTRIBUTION: SCo, ChI, WTR, s SnBr, PR;
+ 's SnBr,' added 
2014 07 07

p. 1060
(superseded by Supplement III)
LINANTHUS filiformis
BIOREGIONAL DISTRIBUTION: SNE, D;
+ 'W&I, DMoj' made 'SNE, D' 
2014 07 02

p. 1060
(superseded by Supplement III)
LINANTHUS filiformis
ELEVATION: 300--2800 m.
+ '1800' made '2800'
2019 11 12

p. 1060
(superseded by Supplement III)
LINANTHUS jaegeri
HABIT+: Per, subshrub, cespitose, 2--10 cm; stem, leaves, calyx lobes glandular-hairy.
+ 'Pl cespitose, 2--10 cm;' made 'Per, subshrub, cespitose, 2--10 cm;' [in TJM2; not abbreviated in eFlora]
2015 05 01

p. 1060
(superseded by Supplement III)
LINANTHUS maculatus
BIOREGIONAL DISTRIBUTION: DMtns (Little San Bernardino Mtns), DMoj exc DMtns (sw corner), w DSon.
+ 'DMoj exc DMtns (sw corner),' added  
2014 07 02

p. 1060
(superseded by Supplement III)
LINANTHUS orcuttii
FLOWER: calyx 6--10 mm, membrane as wide as lobes; corolla funnel-shaped, tube 5--15 mm, stout, white grading to purple (on any given tube), throat 3--5 mm, white or yellow, lobes 5--8 mm, gen pink, with 2 purple marks at base, 1 at each sinus; stamens incl or at mouth.
+ 'with 2 purple marks at,' made 'with 2 purple marks at base,'
2012 05 08

p. 1060
(superseded by Supplement III)
LINANTHUS parryae
BIOREGIONAL DISTRIBUTION: s SN, Teh, s SnJV, SCoRI, WTR, SNE exc W&I, DMoj.
+ 's SNF, s SnJV, SCoRI, WTR, DMoj' made 's SN, Teh, s SnJV, SCoRI, WTR, SNE exc W&I, DMoj' 
2014 07 02

p. 1060
(superseded by Supplement III)
LINANTHUS pungens
HABIT+: Per, subshrub, gen hairy, glandular or not.
+ 'Pl gen hairy, glandular or not.' made 'Per, subshrub, gen hairy, glandular or not.' [in TJM2; not abbreviated in eFlora]
2015 05 01

p. 1062
LOESELIASTRUM matthewsii
FLOWER: calyx (except bristles) 1/2--3/4 corolla tube, lobes bristle-tipped; corolla strongly bilateral, 11--21 mm, white to deep rose-purple, upper lip 5--11 mm, 3/4 to > tube, < longer stamens, lobe bases with bright maroon arches and white blotch, rarely suffused with yellow, lower lip 4--7 mm, lobe tips truncate, 3-toothed, or notched, gen with inward-directed projections in sinuses on either side of middle lobe of upper lip.
+ 'lobe bases with bright maroon arches and white blotch,' made 'lobe bases with bright maroon arches and white blotch, rarely suffused with yellow,'
2015 10 29

p. 1063 
(superseded by Supplement I)
NAVARRETIA
22' Mature infl dense cyme, fls subsessile or short-pedicelled; pl gen not prostrate (exc _Navarretia leucocephala_); calyx tube gen not long-soft-wavy-hairy (exc _Navarretia fossalis_)
+ 'leucocephela' made 'leucocephala'
2013 02 04

p. 1064 
(superseded by Supplement I)
NAVARRETIA
45. Corolla 5--7 mm, = calyx, lobes light blue .....-> N. mellita
+ 'Corolla lobes 5--7 mm, = calyx, light blue' made 'Corolla 5--7 mm, = calyx, lobes light blue'
2015 01 09

p. 1064 
(superseded by Supplement I)
NAVARRETIA
45' Corolla 9--12 mm, > calyx, lobes dark blue .....-> N. squarrosa
+ 'Corolla lobes 9--12 mm, > calyx, dark blue' made 'Corolla 9--12 mm, > calyx, lobes dark blue'
2015 01 09

p. 1064 
(superseded by Supplement I)
NAVARRETIA atractyloides
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaRH, c SNF, s SNH, CW, ChI, TR, PR, MP;
+ 'CCo, SnFrB, SCoR' collapsed to 'CW' 
2012 03 27
p2

p. 1064 
(superseded by Supplement I)
NAVARRETIA capillaris
NOTE: See note under _Navarretia leptalea_ subsp. _bicolor_.
+ 'subp.' made 'subsp.'
2012 03 27
p2

p. 1065
NAVARRETIA leptalea
NOTE: Forms large showy populations. Subspecies intergrade.
+ 'Intergrade' made 'intergrade'
2013 08 01

p. 1070
PHLOX hirsuta
BIOREGIONAL DISTRIBUTION: ne KR.
+ 'n CaRH (Siskiyou Co.)' made 'ne KR'  
2014 07 07

p. 1071
POLEMONIUM micranthum
LEAF: basal and cauline, < 5 cm, 5--11 mm wide, cauline not reduced, soft-glandular-hairy; petioles 5--13 mm, bases not membranous, not sheathing; leaflets 5--15, 2--7 mm, 1--3 mm wide, lanceolate, entire, terminal fused to adjacent pair.
+ '1--3 mm wide, entire, lanceolate, entire, terminal' made '1--3 mm wide, lanceolate, entire, terminal'
2018 05 29

p. 1072
SALTUGILIA splendens
INFLORESCENCE: distal branches ascending; pedicel 3--20 mm.
+ 'mm' added
2015 05 11

p. 1074
POLYGONACEAE
INFLORESCENCE: fl clusters in axillary to terminal cyme-, panicle-, raceme-, spike-, umbel- or head-like arrangements, entire infl or main infl branches gen subtended by bracts ("infl bracts"); peduncles present or 0; fl clusters in Eriogoneae-Eriogonoideae subtended by involucre of >= 1 free or +- fused, sometimes awn-tipped bracts ("involucre bracts") or, in Polygonoideae and rarely in Eriogonoideae, not (if bracts completely fused, involucre "tubular"); pedicels in Eriogoneae each often subtended by 2 free, transparent, linear bractlets or in Polygonoideae all subtended by 2+ fused, membranous, wide bractlets.
+ 'often' inserted after 'pedicels in Eriogoneae each'
2012 03 27
p2

p. 1074
POLYGONACEAE
TJM2 AUTHOR: Mihai Costea, except as noted
+ 'Mihai Costea & James L. Reveal, family description, key to genera; treatment of genera revised in consultation with James L. Reveal, except as noted' made 'Mihai Costea, except as noted'
2015 02 10

p. 1074
POLYGONACEAE
SCIED: Scientific Editors: Thomas J. Rosatti, Bruce G. Baldwin.
+ 'Scientific Editor: Thomas J. Rosatti.' made 'Scientific Editors: Thomas J. Rosatti, Bruce G. Baldwin.'
2015 02 10

p. 1074
POLYGONACEAE
7. Fl base stalk-like; outer perianth parts winged (keeled in _Fallopia convolvulus_); lf blade base sagittate, hastate, cordate, truncate, or ovate; ocrea papery, not 2-lobed distally .....-> FALLOPIA
+ 'lf blade sagittate or cordate' made 'lf blade base sagittate, hastate, cordate, truncate, or ovate'  [in TJM2; not abbreviated in eFlora]
2015 01 09

p. 1074
POLYGONACEAE
7' Fl base not stalk-like; outer perianth parts keeled; lf blade base tapered (ovate); ocrea generally translucent, 2-lobed distally .....-> POLYGONUM (2)
+ 'lf blade not sagittate or cordate' made 'lf blade base tapered (ovate)' [in TJM2; not abbreviated in eFlora]
2015 01 09

p. 1074
POLYGONACEAE
9. Ocreae gen translucent, glabrous, 2-lobed, fibrous in age .....-> <sup>2</sup>POLYGONUM
+ 'transparent' made 'translucent'
2012 03 27
p2

p. 1076
ACANTHOSCYPHUS
TJM2 AUTHOR: James L. Reveal & Thomas J. Rosatti
+ TJM2 AUTHOR added
2015 02 10

p. 1076
ACONOGONON
TJM2 AUTHOR:
+ TJM2 AUTHOR deleted
2015 02 10

p. 1077
ACONOGONON newberryi
BIOREGIONAL DISTRIBUTION: KR, CaRH (esp Mount Shasta), n&c SNH, MP;
+ 'KR,' added  
2015 06 12

p. 1077
ARISTOCAPSA
TJM2 AUTHOR: James L. Reveal & Thomas J. Rosatti
+ TJM2 AUTHOR added
2015 02 10

p. 1077
BISTORTA
TJM2 AUTHOR:
+ TJM2 AUTHOR deleted
2015 02 10

p. 1077
CENTROSTEGIA
TJM2 AUTHOR: James L. Reveal & Thomas J. Rosatti
+ TJM2 AUTHOR added
2015 02 10

p. 1077 
(superseded by Supplement II)
CHORIZANTHE
TJM2 AUTHOR: James L. Reveal & Thomas J. Rosatti
+ TJM2 AUTHOR added
2015 02 10

p. 1078 
(superseded by Supplement II)
CHORIZANTHE
15' Involucre tube 1--2.5(3) mm, densely hairy; fl 2--3.5 mm
+ 'fl 2--3 mm' made 'fl 2--3.5 mm'  [in TJM2; not abbreviated in eFlora]
2015 01 08

p. 1078 
(superseded by Supplement II)
CHORIZANTHE
24. Outer and inner perianth lobes fringed --- SW, w DSon (San Felipe Valley) .....-> C. fimbriata
+ ', w DSon (San Felipe Valley)' added
2016 05 24

p. 1079  [location or approximate location where lead appeared in TJM2, prior to Supplement II]
(superseded by Supplement II)
CHORIZANTHE
38. Perianth lobes minutely jagged; s CCo, n SCo (San Luis Obispo, Santa Barbara cos.) .....-> C. angustifolia (2)
+ 'CCo (Monterey and Santa Cruz cos. south to Santa Barbara Co.)' made 's CCo, n SCo (San Luis Obispo, Santa Barbara cos.)'
2019 02 26

p. 1079
(superseded by Supplement II)
CHORIZANTHE angustifolia
BIOREGIONAL DISTRIBUTION: s CCo, n SCo (San Luis Obispo, Santa Barbara cos.).
+ ', n SCo' added
2019 02 26

p. 1079  
(superseded by Supplement II)
CHORIZANTHE biloba var. immemora
ECOLOGY: Serpentine, gravel, vertic clay;
+ 'Sand, gravel, clay' made 'Serpentine, gravel, vertic clay'
2015 12 03

p. 1080 
(superseded by Supplement II)
CHORIZANTHE fimbriata var. fimbriata
BIOREGIONAL DISTRIBUTION: e&s SCo, w PR, w DSon (San Felipe Valley);
+ 'e&s SCo,' added 
+ ', w DSon (San Felipe Valley)' added
2016 05 24

p. 1080 
(superseded by Supplement II)
CHORIZANTHE pungens
HABIT+: Plant prostrate to erect, 0.5--2.5 dm diam, hairy.
+ '0.5--10 dm' made '0.5--2.5 dm'
2015 02 04

p. 1080 
(superseded by Supplement II)
CHORIZANTHE pungens var. hartwegiana
HABIT+: Plant ascending to erect, 0.5--2.5 dm.
+ '0.5--2.5 cm' made '0.5--2.5 dm'
2015 02 04

p. 1080 
(superseded by Supplement II)
CHORIZANTHE pungens var. hartwegiana
BIOREGIONAL DISTRIBUTION: sw SnFrB (Santa Cruz Sandhills, Santa Cruz Co.).
+ 'CCo (Ben Lomond sand hills, Santa Cruz Co.)' made 'sw SnFrB (Santa Cruz Sandhills, Santa Cruz Co.)'
2015 02 13 (supersedes correction made on 2015 01 12)

p. 1080 
(superseded by Supplement II)
CHORIZANTHE pungens var. pungens
HABIT+: Pl prostrate to ascending, 0.5--1.5 dm.
+ 'prostrate or ascending' made 'prostrate to ascending'
ELEVATION: 0--65 m.
+ '< 65 m.' made '0--65 m.'
2015 01 08

p. 1081 
(superseded by Supplement II)
Chorizanthe fimbriata (bottom middle-right of plate)
+ deleted 'outer' and 'inner' from perianth lobes of varieties
2012 03 27

p. 1082 
(superseded by Supplement II)
CHORIZANTHE robusta var. hartwegii
BIOREGIONAL DISTRIBUTION: s SnFrB (Scotts Valley, Santa Cruz Co.).
+ 'Scott Valley' made 'Scotts Valley'
2015 02 04

p. 1082 
(superseded by Supplement II)
CHORIZANTHE xanti
INFLORESCENCE: bracts 2, awns 0.5--1 mm, straight; involucre 3--4.5 mm, 3-angled, 6-ribbed, teeth 6, 0.7--1.5 mm, awns 0.5--1 mm, hooked.
+ 'teeth 6, 0.7--1.5,' made 'teeth 6, 0.7--1.5 mm,'
2015 01 08

p. 1082
DEDECKERA
TJM2 AUTHOR: James L. Reveal & Thomas J. Rosatti
+ TJM2 AUTHOR added
2015 02 10

p. 1083
DODECAHEMA
TJM2 AUTHOR: James L. Reveal & Thomas J. Rosatti
+ TJM2 AUTHOR added
2015 02 10

p. 1083
EMEX
TJM2 AUTHOR:
+ TJM2 AUTHOR deleted
2015 02 10

p. 1083
ERIOGONUM
TJM2 AUTHOR: James L. Reveal & Thomas J. Rosatti
+ TJM2 AUTHOR added
2015 02 10

p. 1083
ERIOGONUM
1' Per to shrub
+ 'to shrub' added [not abbreviated in eFlora]
2019 02 12

p. 1084
ERIOGONUM, Group 1
12. Involucres 1--2 mm, if 2 mm then outer perianth lobes fan-shaped or +- hastate (exc oblong to oblong-ovate in _Eriogonum baileyi_)
+ 'Involucres 1--1.5 mm (exc 2--4 mm in _Eriogonum baileyi_), if 2 mm then outer perianth lobes fan-shaped or +- hastate' made 'Involucres 1--2 mm, if 2 mm then outer perianth lobes fan-shaped or +- hastate (exc oblong to oblong-ovate in _Eriogonum baileyi_)'
2012 08 17

p. 1084
ERIOGONUM, Group 1
14' Flowers white to rose, 1--2 mm; SNF, Teh, SnFrB, SCoR, TR, GB, w DMoj
+ 's SCoR' made 'SCoR'  
2014 08 10

p. 1084
ERIOGONUM, Group 1
21. Involucres (3.5)4--5 mm; outer perianth lobes narrowly obovate to oblong; fruit 1.8--2(2.2) mm; NW, SN, ScV (e edge), SnJV, CW, TR .....-> E. roseum
+ 'NW, SNF, Teh, CW, TR' made 'NW, SN, ScV (e edge), SnJV, CW, TR'
2017 05 09

p. 1085
ERIOGONUM, Group 2
5' Involucre not densely tomentose, 1.8--2 mm; flower 2--2.5 mm; s SN, SnJV, SCoR, TR, DMoj .....-> E. gracillimum
+ 's SN, SCoR, TR.' made 's SN, SnJV, SCoR, TR, DMoj'
2017 08 22

p. 1086
ERIOGONUM, Group 2
36' Flowers yellow, if in age +- white then outer perianth lobes sac-like basally, glandular or short-stiff hairy, without a tuft of long white hairs adaxially; s SNF, s SNH, Teh, SCoRI, TR, PR (e edge), GB, D
+ 'SCoRI, WTR, GB, D' made 's SNF, s SNH, Teh, SCoRI, TR, PR (e edge), GB, D'
2017 08 22

p. 1086
ERIOGONUM, Group 2
37' Outer perianth lobes oblong-elliptic to obovate or ovate, not sac-like basally, yellow; involucres 1--2 mm, glabrous or glandular-hairy; s SNF, s SNH, Teh, SCoRI, TR, PR (e edge), GB, D
+ 'SCoRI, WTR, GB, D' made 's SNF, s SNH, Teh, SCoRI, TR, PR (e edge), GB, D'
2017 08 22

p. 1086
ERIOGONUM, Group 2
38. Involucres glandular-hairy; s SNF, s SNH, Teh, SCoRI, TR, PR (e edge), GB, D .....-> E. pusillum
+ 'SCoRI, WTR, GB, D' made 's SNF, s SNH, Teh, SCoRI, TR, PR (e edge), GB, D'
2017 08 22

p. 1086
ERIOGONUM, Group 3
Group 3: Per to shrub; fl stipe present, sometimes weakly so, not winged; infl bracts 2--13+ (subg. _Oligogonum_)
+ 'to shrub' added [not abbreviated in eFlora]
2019 02 12

p. 1086
ERIOGONUM, Group 3
9' Involucre teeth 8--10, 1--3 mm; SN (see also 29') .....-> <sup>2</sup>_E. prattenianum_
+ '(see also 10 above)' made '(see also 29')'
2012 03 27
p2

p. 1086
ERIOGONUM, Group 3
36. Flowers white to red, glandular-hairy with a tuft of long white hairs adaxially; SCo, TR, e PR, s DMoj, DSon; outer perianth lobes generally fan-shaped .....-> E. thurberi
+ 'e PR, s DMoj, DSon' made 'SCo, TR, e PR, s DMoj, DSon'
2017 05 09

p. 1087
17. Leaf blades narrow-elliptic to -oblong, 0.3--0.6(0.8) cm wide; subshrub; KR .....-> E. congdonii
+ ', CaRH' deleted 
2015 08 27

p. 1087
20' Flowers 4--6 mm, pale yellow (or yellow); fruit 3--3.5 mm; KR, s CaR, n SN .....-> var. ursinum
+ 'KR,' added 

p. 1088
ERIOGONUM, Group 3
39. Lf blades sparsely tomentose abaxially; subshrub --- SN, GB, nw DMoj .....-> var. nevadense (2)
+ 'Lf blades sparsely tomentose to glabrous adaxially;' made 'Lf blades sparsely tomentose abaxially;'
2012 06 27

p. 1088
ERIOGONUM, Group 3
39' Lf blades densely white-tomentose or tomentose abaxially; subshrub or spreading to prostrate mat
+ 'Lf blades densely white-tomentose or tomentose abaxially, less so to glabrous adaxially;' made 'Lf blades densely white-tomentose or tomentose abaxially;'
2014 04 22 [on 2014 04 22, ', less so to glabrous adaxially' deleted from this entry; on 2012 06 27, it was deleted from eFlora but not actually deleted from corrected statement in original listing of this entry (which was posted on 2012 06 27)]

p. 1088
ERIOGONUM, Group 3
43' Lf blades tomentose to densely so abaxially; KR, CaR, SN, MP, DMtns
+ 'NCoRO,' deleted 
2013 08 01

p. 1088
ERIOGONUM, Group 3
44. Inflorescence branches (2.5)3--10(15) cm; KR, CaR, n SN, MP .....-> var. modocense
+ 'KR,' added 
2015 08 27

p. 1088
ERIOGONUM, Group 3
44' Infl branches 1--2.5(4) cm; KR, s SNH, DMtns
+ 's SN' made 's SNH' 
2013 08 01

p. 1088
ERIOGONUM, Group 3
56. Shrub, densely branched --- KR, n SNF, n SNH/CaRH
+ 'KR,' added 
2015 08 27

p. 1088
ERIOGONUM, Group 3
56. Shrub, densely branched --- KR, NCoRH, n SNF, n SNH/CaRH, MP
+ 'KR, n SNF, n SNH/CaRH' made 'KR, NCoRH, n SNF, n SNH/CaRH, MP'
2017 05 09

p. 1089
ERIOGONUM, Group 4
Group 4: Per to shrub; fl stipe 0 or +- winged; infl bracts gen 3 (mainly subg. _Eucycla_)
+ 'to shrub' added [not abbreviated in eFlora]
2019 02 12

p. 1089
ERIOGONUM, Group 4
22' Lf blades not obovate, 0.3--1(1.4) cm, 0.15--0.4(0.6) cm wide; st 0.2--0.6(0.8) dm, glabrous; involucres glabrous or sparsely tomentose .....-> _E. prociduum_
+ deleted 'var. _prociduum_' from end
2012 03 27

p. 1089
ERIOGONUM, Group 4
24. Fr tomentose; SNE, n DMtns (Last Chance Range) .....-> _E. shockleyi_ var. _shockleyi_
+ 'var. _shockleyi_' added
2012 03 27

p. 1090
ERIOGONUM, Group 4
48' Lf blades tomentose abaxially, less so to glabrous adaxially; involucres 1--5; NW, deltaic GV (Contra Costa Co.), CW
+ 'NW, CW' made 'NW, deltaic GV (Contra Costa Co.), CW'
2012 09 25

p. 1090
ERIOGONUM, Group 4
49. Involucres solitary; stem inflated; flowers white to yellow, glabrous; w edge SnJV, e SCoRI .....-> var. indictum
+ 'w edge SnJV,' added 
2016 01 28

p. 1090
ERIOGONUM, Group 4
49' Involucres 1--5 on same pl; st not or +- inflated; fls white to pink (or +- yellow), glabrous or hairy; NW, deltaic GV (Contra Costa Co.), CW
+ 'NW, CW' made 'NW, deltaic GV (Contra Costa Co.), CW'
2012 09 25

p. 1091
ERIOGONUM, Group 4
61. Leaves thinly white-tomentose abaxially, glabrous adaxially; flowers, involucres generally glabrous; plant generally decumbent; CCo, SCoR, SCo, ChI (Santa Catalina Island), WTR, SnBr, PR, DMoj (se edge) .....-> var. fasciculatum
+ 'CCo' made 'CCo, SCoR, SCo, ChI (Santa Catalina Island), WTR, SnBr, PR, DMoj (se edge)'
2017 08 29

p. 1091
ERIOGONUM, Group 4
63' Inflorescence head- to umbel-like (or cyme-like); leaves gray-hairy on both surfaces or densely gray-tomentose abaxially, gray-hairy adaxially, margins not or occasionally rolled under; s SN, SCoRI, e SCo, TR, e PR, SNE, D .....-> var. polifolium
+ 's SN, SCoRI, e SCo, TR, e PR, SNE, D;' made 'SnJV, CCo, SCoRO, s SN, SCoRI, e SCo, TR, e PR, SnJt, SNE, D'
2017 08 29

p. 1091
77' Petiole bases not forming ring around stem; leaf blades 0.5--3 cm, 0.2--1 cm wide; NW, n SNF, DMoj
+ 's CaR,' deleted 
2015 08 27

p. 1091
78. Leaf blades 1.5--3 cm, 0.5--1 cm wide; involucres 2--4 mm; flowers 2.5--4 mm; NW, n SNF .....-> var. trachygonum
+ 's CaR,' deleted 
2015 08 27

p. 1092
ERIOGONUM, Group 4
94' Plant erect to spreading subshrub or shrub, 0.2--15 dm; leaf blades (0.3)1--3.5 cm, margins flat, or if rolled under; widespread .....-> E. microtheca
+ 'microthecum' made 'microtheca' [Eriogonum microthecum changed to Eriogonum microtheca in four places in TJM2, noted in these errata, and another 21 places in the eFlora, without further note.]
2018 04 10

p. 1092
ERIOGONUM, Group 4
97. Hairs +- white (see also _Eriogonum microtheca_ var. _alpinum_) or stem, inflorescence rarely glabrous
+ 'microthecum' made 'microtheca' [Eriogonum microthecum changed to Eriogonum microtheca in four places in TJM2, noted in these errata, and another 21 places in the eFlora, without further note.]
2018 04 10

p. 1092
ERIOGONUM, Group 4
97' Hairs +- brown or +- red (generally white in _Eriogonum microtheca_ var. _alpinum_) or stems, inflorescence generally glabrous
+ 'microthecum' made 'microtheca' [Eriogonum microthecum changed to Eriogonum microtheca in four places in TJM2, noted in these errata, and another 21 places in the eFlora, without further note.]
2018 04 10

p. 1092
ERIOGONUM, Group 4
102' Lf blades 0.3--0.7(0.8) cm, 0.1--0.4 cm wide; involucres 2.5--3.5 mm; fls (1.5)2--3.5 mm; s W&I .....-> var. lapidicola
+ ' 0.1--0.4. cm wide' made ' 0.1--0.4 cm wide'
2013 04 09

p. 1094
ERIOGONUM argillosum
ECOLOGY: Steep clay slopes, occ serpentine;
+ 'Clay or serpentine' made 'Steep clay slopes, occ serpentine' [in TJM2; not abbreviated in eFlora]
2015 12 03

p. 1094
ERIOGONUM baileyi
INFLORESCENCE: 5--35(45) cm, glabrous or tomentose; peduncles 0; involucres appressed, 1--2 mm, 0.5--1 mm wide.
+ 'involucres appressed, 2--4 mm' made 'involucres appressed, 1--2 mm'
2012 08 17

p. 1094
ERIOGONUM butterworthianum
BIOREGIONAL DISTRIBUTION: n SCoRO (“The Indians”, Santa Lucia Range, c Monterey Co.).
+ 'The Indians,' made '“The Indians,”'
2017 06 22

p. 1095
ERIOGONUM congdonii
BIOREGIONAL DISTRIBUTION: KR.
+ ', CaRH' deleted
2015 08 11

p. 1096
ERIOGONUM fasciculatum var. fasciculatum
BIOREGIONAL DISTRIBUTION: CCo;
+ 'CCo;' made 'CCo, SCoR, SCo, ChI (Santa Catalina Island), WTR, SnBr, PR, DMoj (se edge);'
2017 08 29

p. 1098
ERIOGONUM fasciculatum var. polifolium
BIOREGIONAL DISTRIBUTION: SnJV, CCo, SCoRO, s SN, SCoRI, e SCo, TR, e PR, SnJt, SNE, D;
+ 's SN, SCoRI, e SCo, TR, e PR, SNE, D;' made 'SnJV, CCo, SCoRO, s SN, SCoRI, e SCo, TR, e PR, SnJt, SNE, D;'
2017 08 29

p. 1098
ERIOGONUM gracillimum
BIOREGIONAL DISTRIBUTION: s SN, SnJV, SCoR, TR, DMoj.
+ 's SN, SCoR, TR.' made 's SN, SnJV, SCoR, TR, DMoj.'
2017 08 22

p. 1099
ERIOGONUM heermannii var. occidentale
ECOLOGY: Gravel bars, steep, clay slopes, often serpentine;
+ 'Clay or shale' made 'Gravel bars, steep, clay slopes, often serpentine'
2015 12 03

p. 1100
ERIOGONUM maculatum
BIOREGIONAL DISTRIBUTION: s SN, TR, GB, D;
+ 'D' added 
2014 07 02 [on 2014 07 02 this date added to this entry, for which no date was previously indicated]

p. 1102
ERIOGONUM microtheca
+ 'microthecum' made 'microtheca' [Eriogonum microthecum changed to Eriogonum microtheca in four places in TJM2, noted in these errata, and another 21 places in the eFlora, without further note.]
2018 04 10

p. 1103
ERIOGONUM nudum var. decurrens
BIOREGIONAL DISTRIBUTION: s SnFrB (Santa Cruz Sandhills, Santa Cruz Co.).
+ '(Ben Lomond Hills, Santa Cruz Co.)' made '(Santa Cruz Sandhills, Santa Cruz Co.)'
2015 01 12

p. 1103
ERIOGONUM nudum var. indictum
BIOREGIONAL DISTRIBUTION: w edge SnJV, e SCoRI.
+ 'w edge SnJV,' added 
2016 01 28

p. 1103
ERIOGONUM nutans var. nutans
BIOREGIONAL DISTRIBUTION: n SNH (e Mono Co.), s MP (ne Lassen Co.);
+ 's MP (ne Lassen Co.), n SNH (e Mono Co.);' made 'n SNH (e Mono Co.), s MP (ne Lassen Co.);' 
2014 04 23 [on 2014 04 23, indicated changes to this entry made; on 2012 04 17, they were made in eFlora but not actually made in corrected statement in original listing of this entry (which was posted on 2012 04 17)]

p. 1106
ERIOGONUM roseum
BIOREGIONAL DISTRIBUTION: NW, SN, ScV (e edge), SnJV, CW, TR;
+ 'NW, SNF, Teh, CW, TR' made 'NW, SN, ScV (e edge), SnJV, CW, TR'
2017 05 09

p. 1106
ERIOGONUM pusillum
LEAF: basal; blades 0.5--2.5(3) cm, 0.4--2(2.5) cm wide, oblong-ovate to +- round, tomentose abaxially, hairy to +- glabrous adaxially.
+ 'wide to +- round' made 'oblong-ovate to +- round'
2012 04 10

p. 1106
ERIOGONUM pusillum
BIOREGIONAL DISTRIBUTION: s SNF, s SNH, Teh, SCoRI, TR, PR (e edge), GB, D;
+ 'SCoRI, WTR, GB, D' made 's SNF, s SNH, Teh, SCoRI, TR, PR (e edge), GB, D'
2017 08 22

p. 1106
ERIOGONUM pyrolifolium
LEAF: basal; blades 1--2.5(4) cm, 0.8--2 cm wide, ovate to +- round, tomentose abaxially, glabrous adaxially or glabrous on both surfaces.
+ 'wide to +- round' made 'ovate to +- round'
2012 04 10

p. 1107
ERIOGONUM strictum
+ deleted flowering time
2012 03 27
p2

p. 1107
ERIOGONUM thurberi
BIOREGIONAL DISTRIBUTION: SCo, TR, e PR, s DMoj, DSon;
+ 'e PR, s DMoj, DSon' made 'SCo, TR, e PR, s DMoj, DSon'
2017 05 09

p. 1108
ERIOGONUM umbellatum var. dumosum
SYNONYMS: Eriogonum umbellatum var. polyanthum (Benth.) M.E. Jones, misappl., in part
+ ', in part' added
2014 04 23

p. 1110
ERIOGONUM umbellatum var. modocense
BIOREGIONAL DISTRIBUTION: KR, CaR, n SN, MP;
+ 'KR,' added 
2015 08 11

p. 1110
ERIOGONUM umbellatum var. modocense
SYNONYMS: Eriogonum umbellatum var. polyanthum (Benth.) M.E. Jones, misappl., in part
+ ', in part' added
2014 04 23

p. 1110
ERIOGONUM umbellatum var. nevadense
LEAF: blades 1--2(2.5) cm, 0.5--1.5 cm wide, sparsely tomentose abaxially, sparsely tomentose to glabrous adaxially.
+ 'gen hairy abaxially,' made 'sparsely tomentose abaxially,'
2012 06 27

p. 1110
ERIOGONUM umbellatum var. polyanthum
BIOREGIONAL DISTRIBUTION: KR, n SNH/CaRH.
+ 'KR,' added 
2015 08 11

p. 1110
ERIOGONUM umbellatum var. polyanthum
BIOREGIONAL DISTRIBUTION: KR, NCoRH, n SNH/CaRH, MP.
+ 'KR, n SNH/CaRH' made 'KR, NCoRH, n SNH/CaRH, MP'
2017 05 09

p. 1110
ERIOGONUM umbellatum var. polyanthum
RARITY STATUS:
+ 'SYMBOL 1' deleted [meaning that a star symbol was removed from TJM2, while 'Listed on CNPS Rare Plant Inventory' was removed from the eFlora]
2013 10 03

p. 1110
ERIOGONUM umbellatum var. polyanthum
NOTE:
+ NOTE, 'Not collected in > 100 years.', deleted
2014 04 23

p. 1110
ERIOGONUM ursinum var. ursinum
BIOREGIONAL DISTRIBUTION: KR, s CaR, n SN.
+ 'KR,' added 
2015 08 11

p. 1111
ERIOGONUM wrightii var. trachygonum
BIOREGIONAL DISTRIBUTION: NW, n SNF.
+ 's CaR,' deleted
2015 08 11

p. 1111
FALLOPIA
TJM2 AUTHOR:
+ TJM2 AUTHOR deleted
2015 02 10

p. 1111
FALLOPIA baldschuanica
WEEDINESS: Potentially problematic weed
+ 'Potentially problematic weed' added [to replace removed broken diamond symbol in TJM2 (as a note), and 'Weed listed by Cal-IPC' in eFlora]
2013 08 07

p. 1112
GILMANIA
TJM2 AUTHOR: James L. Reveal & Thomas J. Rosatti
+ TJM2 AUTHOR added
2015 02 10

p. 1112
GOODMANIA
TJM2 AUTHOR: James L. Reveal & Thomas J. Rosatti
+ TJM2 AUTHOR added
2015 02 10

p. 1112
HOLLISTERIA
TJM2 AUTHOR: James L. Reveal & Thomas J. Rosatti
+ TJM2 AUTHOR added
2015 02 10

p. 1112
JOHANNESHOWELLIA
TJM2 AUTHOR: James L. Reveal & Thomas J. Rosatti
+ TJM2 AUTHOR added
2015 02 10

p. 1112
JOHANNESHOWELLIA
LEAF: basal; blades obovate to +- round [+- reniform], awns 0; ocreae 0.
+ 'wide to +- round' made 'obovate to +- round [+- reniform]'
2012 04 10

p. 1112
JOHANNESHOWELLIA puberula
LEAF: blades 0.5--1.5 cm.
+ ', +- round' deleted
2012 04 10

p. 1112
LASTARRIAEA
TJM2 AUTHOR: James L. Reveal & Thomas J. Rosatti
+ TJM2 AUTHOR added
2015 02 10

p. 1112
MUCRONEA
TJM2 AUTHOR: James L. Reveal & Thomas J. Rosatti
+ TJM2 AUTHOR added
2015 02 10

p. 1114
MUEHLENBECKIA
TJM2 AUTHOR:
+ TJM2 AUTHOR deleted
2015 02 10

p. 1114
NEMACAULIS
TJM2 AUTHOR: James L. Reveal & Thomas J. Rosatti
+ TJM2 AUTHOR added
2015 02 10

p. 1114
OXYRIA
TJM2 AUTHOR: James L. Reveal & Thomas J. Rosatti
+ TJM2 AUTHOR added
2015 02 10

p. 1114
OXYTHECA
TJM2 AUTHOR: James L. Reveal & Thomas J. Rosatti
+ TJM2 AUTHOR added
2015 02 10

p. 1115
PERSICARIA
TJM2 AUTHOR:
+ TJM2 AUTHOR deleted
2015 02 10

p. 1115
PERSICARIA amphibia
TAXON AUTHOR: (L.) Delarbre
+ 'Gray' made 'Delarbre'
2012 08 27

p. 1116
PERSICARIA lapathifolia
TAXON AUTHOR: (L.) Delarbre
+ 'Gray' made 'Delarbre'
2012 09 04

p. 1116
POLYGONUM
TJM2 AUTHOR:
+ TJM2 AUTHOR deleted
2015 02 10

p. 1119
POLYGONUM aviculare subsp. depressum
INFLORESCENCE: pedicels included, 1--2.5 mm; flowers 2--7, crowded distally or not.
+ '1--2.5 mm flowers; 2--7,' made '1--2.5 mm; flowers 2--7,'
2017 06 22

p. 1120
POLYGONUM douglasii
BIOREGIONAL DISTRIBUTION: CA (esp mtns);
+ '(esp mtns, coast)' made '(esp mtns)' 
2012 07 05

p. 1120
POLYGONUM majus
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaR, SN, SnBr, w MP;
+ 'KR,' added 
2015 08 26

p. 1120
POLYGONUM parryi
NOTE:
+ NOTE, 'Some pls from sw SnFrB (Santa Cruz Co.) have ocrea fibers +- like P. californi- cum and fr +- 2.5 mm, less shiny.', deleted
2013 10 08

p. 1121
PTEROSTEGIA
TJM2 AUTHOR: James L. Reveal & Thomas J. Rosatti
+ TJM2 AUTHOR added
2015 02 10

p. 1124
RUMEX dentatus
WEEDINESS: Potentially problematic weed
+ 'Potentially problematic weed' added [to replace removed broken diamond symbol in TJM2 (as a note), and 'Weed listed by Cal-IPC' in eFlora]
2013 08 08

p. 1125
RUMEX occidentalis
STEM: gen erect, 5--25 dm, stout, branched.
+ '5--10(14)' made '5--25'
2012 09 12

p. 1126
SIDOTHECA
TJM2 AUTHOR: James L. Reveal & Thomas J. Rosatti
+ TJM2 AUTHOR added
2015 02 10

p. 1126
SYSTENOTHECA
TJM2 AUTHOR: James L. Reveal & Thomas J. Rosatti
+ TJM2 AUTHOR added
2015 02 10

p. 1130 
(superseded by Supplement I)
DODECATHEON redolens
BIOREGIONAL DISTRIBUTION: c&s SNH, SnGb, SnBr, SnJt, SNE, DMtns;
+ 'SnGb' added 
2012 08 15

p. 1130 
(superseded by Supplement I)
DODECATHEON subalpinum
NOTE: Evidently a high elevation ecotype, but possibly more appropriately treated as a var. of _Dodecatheon hendersonii_, for which the name _Dodecatheon hendersonii_ var. _yosemitanum_ H. Mason is available.
+ 'H.L. Mason' made 'H. Mason'
2012 03 27

p. 1130
PROTEACEAE
HABIT+: [(Perennial herb, subshrub) shrub] tree; evergreen.
+ 'Herb' made 'Perennial herb' 
2017 11 14

p. 1133
ANEMONE tuberosa
BIOREGIONAL DISTRIBUTION: e DMtns, e DMoj, ne DSon;
', e DMoj, ne DSon' added 
2014 07 30

p. 1133
AQUILEGIA
INFLORESCENCE: few-fld raceme or fl 1, terminal; axis, pedicels glabrous to glandular; fls gen nodding.
+ 'fl buds gen pendent' made 'fls gen nodding' [in TJM2; not abbreviated in eFlora]
2015 02 18

p. 1133
AQUILEGIA
1' Fl pendent; spurs gen < 25 mm; sepals red
+ 'Fl pendent' made 'Fl nodding' [in TJM2; not abbreviated in eFlora]
2015 02 18

p. 1134
AQUILEGIA eximia
INFLORESCENCE:
INFLORESCENCE deleted
2015 02 18

p. 1134
AQUILEGIA formosa
INFLORESCENCE:
INFLORESCENCE deleted
2015 02 18

p. 1134
AQUILEGIA shockleyi
INFLORESCENCE:
INFLORESCENCE deleted
2015 02 18

p. 1136
DELPHINIUM
FLOWER: bilateral; sepals 5, petal-like, generally spreading, generally +- dark blue, uppermost spurred; petals 4, << sepals, upper 2 with nectar-secreting spurs enclosed in uppermost sepal, lower 2 clawed, with blades (limbs) generally 4--8 mm, 2-lobed, generally +- perpendicular to claws, generally colored like sepals, generally obviously hairy especially on lobes proximally, inner and outer lobes of each blade gen equally hairy; pistils 3(5).
+ ', inner and outer lobes of each blade gen equally hairy' added [in TJM2; not abbreviated in eFlora]
2014 10 30

p. 1136
DELPHINIUM
3' Sepals gen variously blue, occ white, green-white, lavender, maroon, purple, or pink but not red or yellow; blade of lower petals angled 60--130&deg; to claw, hairs apparent to naked eye
+ 'Sepals occ maroon or pink, not red or yellow' made 'Sepals gen variously blue, occ white, green-white, lavender, maroon, purple, or pink but not red or yellow'
2012 05 08

p. 1137
DELPHINIUM
13' Leaf with <= 5 lobes > 50% to petiole, generally > 7 mm wide; pedicels glabrous to glandular or glandular-puberulent (if > 5 lobes > 50% to petiole, then pedicels puberulent); SN, SCoRI and s (also s KR, s CaR for _Delphinium gracilentum_)
+ '(also s KR, s CaR for _Delphinium gracilentum_)' added 
2015 08 27

p. 1137
DELPHINIUM
30. Blade of each lower petal hairier on inner lobe than outer; proximal stem +- striate --- lateral sepals 7--16 mm; seeds winged; sepals not reflexed; pedicels ascending at < 45&deg; angle; NW, CaRF, ScV, SnFrB, SCoRI, PR .....-> D. hesperium
+ 'Blades of lower petals hairier adaxially than abaxially' made 'Blade of each lower petal hairier on inner lobe than outer'
2014 10 30

p. 1137
DELPHINIUM
30' Blade of each lower petal equally hairy on inner and outer lobe; proximal stem not striate
+ 'Blades of lower petals equally hairy adaxially, abaxially' made 'Blade of each lower petal equally hairy on inner and outer lobe'
2014 10 30

p. 1138
DELPHINIUM antoninum
FLOWER: sepals blue, lateral spreading to reflexed, 11--13 mm, spur 12--16 mm; lower petal blades 3--5 mm, each hairier on inner lobe than outer.
+ 'lower petal blades 3--5 mm, hairier on lobes adaxially' made 'lower petal blades 3--5 mm, each hairier on inner lobe than outer'
2014 10 30

p. 1138
DELPHINIUM bakeri
FLOWER: sepals dark blue, lateral 9--11 mm, spur 9--13 mm; lower petal blades each hairier on inner lobe than outer.
+ 'proximal petals hairier on lobes adaxially' made 'lower petal blades each hairier on inner lobe than outer'
2014 10 30

p. 1138
DELPHINIUM decorum
FLOWER: sepals generally not reflexed, dark blue-purple (generally faded, mottled on herbarium specimens), puberulent abaxially; each gen hairier on inner lobe than outer.
+ 'lower petal blades 6--11 mm, generally hairier on lobes adaxially' made 'lower petal blades 6--11 mm, each gen hairier on inner lobe than outer' [in TJM2; not abbreviated in eFlora]
2014 10 30

p. 1140
DELPHINIUM gracilentum
FLOWER: sepals reflexed, pale blue to white or pink, glabrous, lateral 7--13 mm, spur 9--14 mm; lower petal blades 3--5 mm, each hairier on inner lobe than outer.
+ 'lower petal blades 3--5 mm, hairier on lobes adaxially' made 'lower petal blades 3--5 mm, each hairier on inner lobe than outer'
2014 10 30

p. 1140
DELPHINIUM gracilentum
BIOREGIONAL DISTRIBUTION: s KR, s CaR, SN.
+ 's KR, s CaR,' added 
2015 06 16

p. 1140
DELPHINIUM hansenii
FLOWER: sepals spreading to forward-pointing, lateral 7--13 mm, spur 6--16 mm; lower petal blades each gen hairier on inner lobe than outer.
+ 'lower petal blades gen hairier on lobes adaxially' made 'lower petal blades each gen hairier on inner lobe than outer' [in TJM2; not abbreviated in eFlora]
2014 10 30

p. 1140
DELPHINIUM hesperium
FLOWER: lower petal blades each hairier on inner lobe than outer.
+ 'lower petals hairier on lobes adaxially' made 'lower petal blades each hairier on inner lobe than outer'
2014 10 30

p. 1140
DELPHINIUM hutchinsoniae
FLOWER: lateral sepals 12--24 mm, spur 11--19 mm, tip generally down-curved > 3 mm; lower petal blades 5--10 mm, hairs on each few but more on inner lobe than outer, 0 on margin.
+ 'lower petal blades 5--10 mm, hairs few, more common on lobes adaxially, 0 on margin' made 'lower petal blades 5--10 mm, hairs on each few but more on inner lobe than outer, 0 on margin'
2014 10 30

p. 1140
DELPHINIUM nudicaule
LEAF: generally on proximal 1/3 of stem, +- glabrous; lobes 3--10, generally > 6 mm wide.
+ 'wide' added
2014 09 26

p. 1141
DELPHINIUM parishii subsp. pallidum
LEAF: generally basal, cauline much-reduced; lobes 3--7, generally > 6 mm wide.
+ 'wide' added
2014 09 26

p. 1141
DELPHINIUM parryi
LEAF: generally curly-puberulent; lobes 5--27, generally < 6 mm wide.
+ 'wide' added
2014 09 26

p. 1141
DELPHINIUM parryi subsp. maritimum
LEAF: basal, cauline present in flower; lobes 5--10, generally > 6 mm wide.
+ 'wide' added
2014 09 26

p. 1141 
DELPHINIUM patens Benth. subsp. patens
FLOWER: lateral sepals 9--20 mm, spur 10--15 mm; lower petal blades 4--6 mm, each gen hairier on inner lobe than outer.
+ 'lower petal blades 4--6 mm, gen hairier on lobes adaxially' made 'lower petal blades 4--6 mm, each gen hairier on inner lobe than outer' [in TJM2; not abbreviated in eFlora]
2014 10 30

p. 1141
DELPHINIUM polycladon
LEAF: generally on proximal 1/3 of stem, glabrous; lobes generally > 6 mm wide.
+ 'wide' added
2014 09 26

p. 1142
DELPHINIUM trolliifolium
LEAF: glabrous; lobes > 1 cm wide, tips sharply, irregularly cut.
+ 'wide' added
2014 09 26

p. 1142
DELPHINIUM uliginosum
FLOWER: lateral sepals 9--14 mm, spur 10--14 mm; lower petal blades each hairier on inner lobe than outer.
+ 'lower petals hairier on lobes adaxially' made 'lower petal blades each hairier on inner lobe than outer'
2014 10 30

p. 1142
DELPHINIUM variegatum
FLOWER: spur 10--19 mm, straight or down-curved < 3 mm at tip; lower petal blades each hairier on inner lobe than outer, and hairier on margins.
+ 'lower petals hairier on lobes adaxially, margins' made 'lower petal blades each hairier on inner lobe than outer, and hairier on margins'
2014 10 30

p. 1142
DELPHINIUM variegatum subsp. variegatum
BIOREGIONAL DISTRIBUTION: NCo, se KR, NCoR, CaR, SNF, GV, SnFrB, SCoR.
+ 'se KR,' added 
2015 06 16

p. 1144
MYOSURUS apetalus var. montanus
BIOREGIONAL DISTRIBUTION: SNH, SnBr, MP, W&I (White Mtns);
+ ', W&I (White Mtns)' added
2019 11 19

p. 1144
RANUNCULUS
HABIT+: Ann to per, occ from stolons or caudices, terrestrial or aquatic; roots gen fibrous.
+ 'Ann, per' made 'Ann to per'  [in TJM2; not abbreviated in eFlora]
2015 04 16

p. 1144
RANUNCULUS
14. Stems prostrate to decumbent or creeping, rooting at nodes, or floating in water, rootless
+ 'rootless.' made 'rootless'
2014 01 07

p. 1144
RANUNCULUS
FLOWER: sepals 3--5(6), gen early-deciduous, gen green to yellow or purple; petals 0--17[(150)], shiny, gen yellow, occ white or purple, nectaries near base, pocket-like or with flap-like scale; anthers yellow; pistils gen many.
+ 'petals 5--17' made 'petals 0--17[(150)]'
2013 02 22

p. 1145
RANUNCULUS
28. Fr faces papillate to spiny
+ 'papillate or spiny' made 'papillate to spiny'
2015 01 08

p. 1145
RANUNCULUS
31.  Sepals spreading; achenes 5-9 in a single whorl, faces and margins spiny .....-> R. arvensis 
31'  Sepals reflexed; achenes 10-60 in ovoid to globose heads, faces papillate to spiny (smooth), margins smooth
+ leads 31. and 31' in key to members of Ranunculus replaced with the above
2015 01 08

p. 1146
RANUNCULUS bonariensis Poir. var. trisepalus
HABIT+: Ann 4--20(30) cm, decumbent, rooting at most proximal nodes, or erect.
+ 'Decumbent, rooting at most proximal nodes, or erect.' made 'Ann 4--20(30) cm, decumbent, rooting at most proximal nodes, or erect.' [in TJM2; not abbreviated in eFlora]
2015 04 16

p. 1146
RANUNCULUS cymbalaria
HABIT+: Per 3--20(30) cm, with stolons.
+ 'Pl with stolons.' made 'Per 3--20(30) cm, with stolons.' [in TJM2; not abbreviated in eFlora]
2015 04 16

p. 1147
RANUNCULUS eschscholtzii var. oxynotus
LEAF: basal 0.5--1.5 cm, 0.8--2 cm wide, reniform, shallowly 5--9-lobed or occasionally 3-parted, lateral segment again lobed, base truncate, middle segment unlobed, ultimate segments rounded or obtuse.
+ 'basal 1.5--1.5 cm' made 'basal 0.5--1.5 cm'
2013 10 04

p. 1147
RANUNCULUS hystriculus
HABIT+: Per 8--25 cm, erect from short caudex.
+ 'Erect from short caudex.' made 'Per 8--25 cm, erect from short caudex.' [in TJM2; not abbreviated in eFlora]
2015 04 16

p. 1147
RANUNCULUS muricatus
FRUIT: body 5--5.5 mm, 3--3.5 mm wide, disk-like, faces spiny, margins smooth, beak 2--2.5 mm, curved, lanceolate.
+ '13--16 mm wide' made 3--3.5 mm wide'
+ 'wall coarsely papillate, each papilla tipped with hooked bristle' made 'faces spiny, margins smooth'
2015 01 08

p. 1148
RANUNCULUS orthorhynchus
LEAF: basal, proximal cauline 2.8--12.5 cm, 2.5--14 cm wide, ultimate segments round to linear, entire to dentate or crenate, tip rounded to narrowly acute; distal cauline much-reduced, deeply parted or compound.
+ 'basal, proximal cauline 2.8--12.5 mm' made 'basal, proximal cauline 2.8--12.5 cm'
2019 01 15

p. 1148
RANUNCULUS parviflorus
HABIT+: Ann 8--40 cm, +- erect, not bulbous-based; roots basal, not tuberous.
+ 'Erect to +- erect, not bulbous-based' made 'Ann 8--40 cm, +- erect, not bulbous-base' [in TJM2; not abbreviated in eFlora]
2015 04 16

p. 1148
RANUNCULUS parviflorus
BIOREGIONAL DISTRIBUTION: NW, SnFrB;
+ ', SnFrB' added 
2015 11 04

p. 1148
RANUNCULUS testiculatus
HABIT+: Ann 1--6(10) cm, erect or ascending, not rooting at nodes.
+ 'Erect or ascending, not rooting at nodes.' made 'Ann 1--6(10) cm, erect or ascending, not rooting at nodes.' [in TJM2; not abbreviated in eFlora]
2015 04 16

p. 1152
OLIGOMERIS linifolia
BIOREGIONAL DISTRIBUTION: SnJV, SW, D;
+ 'SnJV,' added  
2013 10 04

p. 1152
RESEDA luteola
BIOREGIONAL DISTRIBUTION: NCo, NCoR, n SNF, CCo, SnFrB, s SCo (San Diego);
+ 'n SNF,', 'SnFrB,' added 
2013 10 04

p. 1152 [location or approximate location where treatment would appear in TJM2 were it not unabridged and therefore only in eFlora]
UNABRIDGED
WAIF
RESEDA odorata
BIOREGIONAL DISTRIBUTION: CCo, SCo;
+ 'CCo,' added [not abbreviated in eFlora; no description in TJM2]
2013 10 04

p. 1153
CEANOTHUS
HABIT+: Shrub, tree-like or not, gen erect or mat- to mound-like.
+ changed from 'Shrub, small tree, gen erect or mat- to mound-like.'
2012 05 10

p. 1156
CEANOTHUS
65. Twigs angled distally; lf blade abaxial veins +- raised .....-> <sup>2</sup>_C. thyrsiflorus_
+ 'dark,' deleted
2012 03 27

p. 1156
CEANOTHUS
65' Twigs not angled distally; lf blade abaxial veins +- not raised
+ 'not dark,' deleted
2012 03 27

p. 1156
CEANOTHUS
70. Infl 5--30 cm; twigs papillate; lf blade abaxial veins +- not raised .....-> _C. cyaneus_
+ 'not dark,' deleted
2012 03 27

p. 1156
CEANOTHUS
70' Infl 1.5--7 cm; twigs not papillate; lf blade abaxial veins +- raised .....-> <sup>2</sup>_C. thyrsiflorus_
+ 'dark,' deleted
2012 03 27

p. 1156 [eFlora only]
CEANOTHUS
73. Leaf blade flat or generally wavy, +- folded lengthwise; petiole 1--3 mm; fruit 3--4 mm wide .....-> C. foliosus (2)
+ '72.' made '73.'
2017 06 22

p. 1156
CEANOTHUS arcuatus
BIOREGIONAL DISTRIBUTION: KR, n NCoR, s CaRH, n&c SNH;
+ 's CaRH,' added 
2013 09 04

p. 1156
CEANOTHUS cordulatus
BIOREGIONAL DISTRIBUTION: KR, n NCoR, CaRH, n SNF, SNH, TR, SnJt, MP, DMtns (Panamint Range);
+ 'CaRH, n SNF,' added 
2017 12 19 [correction actually made to eFlora 2017 12 19, whereas this erratum was produced and posted much earlier, on 2016 05 11]

p. 1156
CEANOTHUS cuneatus
TAXON AUTHOR: (Hook.) Nutt.
+ 'Nutt.' made '(Hook.) Nutt.' {/done also for CEANOTHUS cuneatus var. cuneatus as formatting issue in raw file}
2013 09 27

p. 1158
CEANOTHUS lemmonii
BIOREGIONAL DISTRIBUTION: KR, NCoRI, CaR, n&c SN.
+ 'CaRF' made 'CaR' 
2015 06 15

p. 1158
CEANOTHUS oliganthus var. sorediatus
BIOREGIONAL DISTRIBUTION: KR, NCoR, n SNH, CW, TR, PR.
+ 'KR,' added 
+ 'n SNH,' added 
2015 06 15

p. 1160
CEANOTHUS purpureus
BIOREGIONAL DISTRIBUTION: s NCoRO/NCoRI, s NCoRI, n SnFrB.
+ 'NCoRI.' made 's NCoRO/NCoRI, s NCoRI, n SnFrB.' 
2013 09 04

p. 1162
CEANOTHUS spinosus
BIOREGIONAL DISTRIBUTION: s CCo, s SCoRO, SCo, WTR, PR;
+ 's CCo,' added 
+ 'SCo,' added 
2017 12 19 [correction actually made to eFlora 2017 12 19, whereas this erratum was produced and posted much earlier, on 2016 05 11]

p. 1162
CEANOTHUS thyrsiflorus
LEAF: alternate, evergreen; stipules scale-like; petiole 3--9 mm; blade 10--39 mm, 5--20 mm wide, oblong-ovate, ovate, or widely elliptic, +- firm, adaxially dark green, glabrous, abaxially paler, glabrous to puberulent between veins or not, veins +- raised, sparsely puberulent, tip obtuse to rounded, margin +- gland-toothed.
+ 'veins dark, +- raised' made 'veins +- raised'
2012 03 27

p. 1164
FRANGULA purshiana
TAXON AUTHOR: (DC.) A. Gray
+ 'J.G. Cooper' made 'A. Gray'
2016 10 18

p. 1164
FRANGULA purshiana
TAXON AUTHOR: (DC.) A. Gray ex J.G. Cooper
+ 'A. Gray' made 'A. Gray ex J.G. Cooper' [citation would be contracted to 'J.G. Cooper' in any future printings of TJM2]
2018 02 07

p. 1164
FRANGULA purshiana subsp. ultramafica
COMMON NAME: CARIBOU COFFEE BERRY
+ 'COFFEEBERRY' made 'COFFEE BERRY'
2012 03 27
p2

p. 1164
RHAMNUS
2. Lf blade 20--60 mm, elliptic or ovate to lance-ovate; sepals 5; fr black, 3-stoned --- CCo (Monterey Co.), SCo (Newport Back Bay), expected elsewhere .....-> [_R. alaternus_]
+ '_R. alaterna_' made '_R. alaternus_'
2012 03 27

p. 1164 [location or approximate location where treatment would appear in TJM2 were it not unabridged and therefore only in eFlora]
UNABRIDGED
WAIF
RHAMNUS alaternus
BIOREGIONAL DISTRIBUTION: CCo (Monterey Co.), SnFrB, SCo (Newport Back Bay), expected elsewhere;
+ 'SnFrB,' added [in eFlora only, where unabbreviated]
2014 07 25

p. 1166
ROSACEAE
8. Lvs +- 2-ternately dissected, segments linear; fr follicles .....-> <sup>2</sup>LUETKEA
+ 'St long-trailing to decumbent; lvs ternately dissected, segments linear' made 'Lvs +- 2-ternately dissected, segments linear; fr follicles' 
2014 04 23 [on 2012 03 27, stated change made to eFlora; on 2012 03 27, change made to corrected statement in original listing of this entry was only partial, it was completed on 2014 04 23 by adding '; fr follicles']

p. 1166
ROSACEAE
8' Lvs simple to compound, ternately compound or not but not ternately dissected, segments linear or not or 0; fr achenes, sometimes fleshy-coated (_Rubus_) or on fleshy receptacle (_Duchesnea_, _Fragaria_)
+ 'St gen ascending to erect (prostrate in some _Rubus_); lvs simple to compound, not ternately dissected' made 'Lvs simple to compound, ternately compound or not but not ternately dissected, segments linear or not or 0; fr achenes, sometimes fleshy-coated (_Rubus_) or on fleshy receptacle (_Duchesnea_, _Fragaria_)' 
2014 04 23 [on 2012 03 27, stated change made to eFlora; on 2012 03 27, change made to corrected statement in original listing of this entry was only partial, it was completed on 2014 04 23 by adding '; fr achenes, sometimes fleshy-coated (_Rubus_) or on fleshy receptacle (_Duchesnea_, _Fragaria_)']

p. 1169
ADENOSTOMA fasciculatum var. fasciculatum
DISTRIBUTION OUTSIDE CALIFORNIA: sw OR, Baja California.
+ 'sw OR,' added 
2014 06 10

p. 1172
AMELANCHIER utahensis
BIOREGIONAL DISTRIBUTION: NW, CaR, SN, CW, SW, MP, SNE, DMtns;
+ 'MP,' added 
2016 05 18

p. 1171
CERCOCARPUS ledifolius var. intermontanus
BIOREGIONAL DISTRIBUTION: KR, NCoRH, CaRH, SNH, Teh, TR, n PR (incl SnJt), GB, DMtns;
+ 'n PR' made 'n PR (incl SnJt)' 
2014 07 25

p. 1178
FALLUGIA paradoxa
BIOREGIONAL DISTRIBUTION: e DMoj;
+ 'e DMtns' made 'e DMoj'
2017 07 12

p. 1178
FRAGARIA chiloensis
FLOWER: gen 20--40 mm wide; hypanthium bractlets unlobed; sepals 6--10 mm; petals (8)10--18 mm.
+ 'hypantheum' made 'hypanthium'  [in TJM2; not abbreviated in eFlora, where correction made previously, by unknown person, without note]
2015 03 11

p. 1178
FRAGARIA vesca
FLOWER: gen +- 15 mm wide; hypanthium bractlets often 2-lobed; sepals gen 4--8 mm; petals gen 5--8 mm.
+ 'hypantheum' made 'hypanthium'  [in TJM2; not abbreviated in eFlora, where correction made previously, by unknown person, without note]
2015 03 11

p. 1178
FRAGARIA virginiana
FLOWER: +- 10--20 mm wide; hypanthium bractlets unlobed; sepals 3--6 mm; petals 4--9 mm.
+ 'hypantheum' made 'hypanthium'  [in TJM2; not abbreviated in eFlora, where correction made previously, by unknown person, without note]
2015 03 11

p. 1180
HORKELIA
4' Petal generally narrow-oblanceolate, generally >= sepal; hypanthium generally 2--3.5 mm wide, inner wall generally glabrous; e KR, CaR, SN, MP .....-> var. tridentata
+ 'e KR,' added 
2015 08 31

p. 1180
HORKELIA
13. Lflets +- gray, lobes 2--5, 1--3 mm wide; petal 2--4 mm wide; pedicels nonglandular .....-> var. _daucifolia_
+ 'petioles' made 'pedicels'
2012 03 27

p. 1180
HORKELIA
13' Lflets green, lobes 5--15, < 1 mm wide; petal 4--8 mm wide; pedicels glandular .....-> var. _indicta_
+ 'petioles' made 'pedicels'
2012 03 27

p. 1183
HORKELIA tridentata var. tridentata
BIOREGIONAL DISTRIBUTION: e KR, CaR, SN, MP;
+ 'e KR,' added 
2015 08 12

p. 1184
HORKELIELLA congdonis
BIOREGIONAL DISTRIBUTION: c SNH (e slope), w SNE, DMtns (Coso Range).
+ ', DMtns (Coso Range)' added 
2013 08 01

p. 1184
IVESIA
+ 'UNABRIDGED ETYMOLOGY: (Eli Ives, Yale University, Connecticut pharmacologist, participant in Pacific Railroad Survey, 1779--1861)' deleted [in eFlora; no unabridged etymologies in TJM2]
2018 10 09

p. 1191
POTENTILLA
23. St 5--20 cm; lf 2--15 cm, petiole gen < blade; CaRH, ne-most SNH, GB; 900--2000 m .....-> _P. millefolia_
+ 'GH' made 'GB'
2012 03 27
p2

p. 1194
POTENTILLA glaucophylla var. glaucophylla
BIOREGIONAL DISTRIBUTION: c&s SNH, W&I (White Mtns);
+ ', W&I (White Mtns)' added
2019 12 11

p. 1194
POTENTILLA hickmanii
BIOREGIONAL DISTRIBUTION: c CCo (San Mateo, Monterey cos.).
+ '(San Mateo, Monterey cos.)' added
2015 03 04

p. 1194
POTENTILLA jepsonii
BIOREGIONAL DISTRIBUTION: c&s SNH, n W&I;
+ 'c SNH' made 'c&s SNH'
2016 11 15

p. 1195
POTENTILLA multijuga
FLOWER: hypanthium 4--6 mm wide; petals 4.5--10 mm; filaments 1.5--4.5 mm, anthers +- 1 mm; pistils 5--10, style 2--3 mm, slender.
+ 'pistils +- 5' made 'pistils 5--10'
2015 03 04

p. 1195
POTENTILLA rivalis
BIOREGIONAL DISTRIBUTION: s NCoRO, CaRH, SN, GV, CW, SnBr, PR, MP, DSon;
+ 'PR,' and ', DSon' added 
2015 03 25

p. 1196
PRUNUS
INFLORESCENCE: raceme, umbel-like or subsessile cluster, or fls 1; pedicel bractlets 0.
+ 'raceme, cluster, or fls 1' made 'raceme, umbel-like or subsessile cluster, or fls 1' [in TJM2; not abbreviated in eFlora]
2015 03 04

p. 1196
PRUNUS
1' Infl a short, +- flat-topped raceme of (3)6--12 fls, or umbel-like to subsessile cluster of 2--5 fls, or fls 1
+ 'Infl a short, +- flat-topped raceme or umbel-like to subsessile cluster, fls 1--12' made 'Infl a short, +- flat-topped raceme of (3)6--12 fls, or umbel-like to subsessile cluster of 2--5 fls, or fls 1'  [in TJM2; not abbreviated in eFlora]
2015 03 04

p. 1196
PRUNUS
5. Infl a raceme; sepal entire; fr 7--14 mm; twigs with true terminal bud .....-> P. emarginata
+ 'Infl raceme' made 'Infl a raceme' [in TJM2; not abbreviated in eFlora]
2015 03 04

p. 1196
PRUNUS
5' Infl an umbel-like cluster or fls 1; sepal gland-toothed to nearly entire; fr 15--30 mm; twigs with false terminal bud
+ 'Infl umbel-like' made 'Infl an umbel-like cluster or fls 1' [in TJM2; not abbreviated in eFlora]
2015 03 04

p. 1196
PRUNUS andersonii
INFLORESCENCE: umbel-like cluster or not; fls 1--2; pedicels (1)4--12 mm.
+ 'umbel-like, fls 1--2' made 'umbel-like cluster or not; fls 1--2' [in TJM2; not abbreviated in eFlora]
2015 03 04

p. 1196
PRUNUS cerasifera
INFLORESCENCE:  (umbel-like clusters) or not; fls 1(2); pedicels (4)10--18 mm.
+ 'umbel-like, fls 1(2)' made '(umbel-like clusters) or not; fls 1(2)' [in TJM2; not abbreviated in eFlora]
2015 03 04

p. 1196
PRUNUS dulcis
INFLORESCENCE: subsessile cluster or not; fls 1--2; pedicels 1--5 mm.
+ 'subsessile cluster; fls 1--2' made 'subsessile cluster or not; fls 1--2' [in TJM2; not abbreviated in eFlora]
2015 03 04

p. 1198
PRUNUS eremophila
INFLORESCENCE: subsessile cluster or not; fls 1--2; pedicels 0--3 mm.
+ 'subsessile cluster, fls 1--2' made 'subsessile cluster or not; fls 1--2' [in TJM2; not abbreviated in eFlora]
2015 03 04

p. 1198
PRUNUS fasciculata
INFLORESCENCE: subsessile cluster or not; fls 1--2; pedicels 0--4 mm.
+ 'subsessile cluster, fls 1--2' made 'subsessile cluster or not; fls 1--2' [in TJM2; not abbreviated in eFlora]
2015 03 04

p. 1198
PRUNUS fremontii
INFLORESCENCE: umbel-like cluster or not; fls 1--3; pedicels 2--12 mm.
+ 'umbel-like, fls 1--3' made 'umbel-like cluster or not; fls 1--3' [in TJM2; not abbreviated in eFlora]
2015 03 04

p. 1198
PRUNUS persica
INFLORESCENCE: (subsessile cluster) or not; fls 1(2); pedicels 0--3 mm.
+ 'subsessile cluster; fls 1(2)' made '(subsessile cluster) or not; fls 1(2)' [in TJM2; not abbreviated in eFlora]
2015 03 04

p. 1198
PRUNUS subcordata
INFLORESCENCE: umbel-like cluster; fls 2--5; pedicels 5--15 mm.
+ 'umbel-like, fls 2--5' made 'umbel-like cluster; fls 2--5' [in TJM2; not abbreviated in eFlora]
2015 03 04

p. 1199 [location or approximate location where treatment would appear in TJM2 were it not unabridged and therefore only in eFlora]
UNABRIDGED
WAIF
PYRACANTHA atalantioides
HABIT+: Plant < 6 m, erect, yellow-brown-hairy, glabrous in age.
+ 'Plant < 6, erect' made 'Plant < 6 m, erect' [in eFlora only]
2013 12 04

p. 1200
ROSA
1' Prickles few to many, 2--7 mm, slender, internodal prickles generally 0 in inflorescence; CaRH, n SNH, MP, n SNE .....-> subsp. ultramontana
+ 'Prickes' made 'Prickles'
2014 05 01

p. 1201
ROSA spithamea
FLOWER: hypanthium gen 4--5 mm wide at fl, stalked-glandular, neck 3--4 mm wide; sepals gen glandular, entire, tip gen +- = body, entire; petals 10--15 mm, pink to red; pistils 10--20.
+ 'hypanthium ... glabrous, stalked-glandular' made 'hypanthium ... stalked-glandular'
2013 02 28

p. 1204
RUBUS laciniatus
WEEDINESS: Potentially problematic weed
+ 'Potentially problematic weed' added [to replace removed broken diamond symbol in TJM2 (as an addition to existing note), and 'Weed listed by Cal-IPC' in eFlora]
2013 08 08

p. 1206
SPIRAEA splendens
DISTRIBUTION OUTSIDE CALIFORNIA: to BC, NV.
+ ', NV' added 
2015 02 26

p. 1206
CRUCIANELLA angustifolia
BIOREGIONAL DISTRIBUTION: s KR, NCoRI, s CaR, n SN, e ScV;
+ 's KR,' added 
+ 'CaRF' made 's CaR' 
+ 'n SNF' made 'n SN' 
2015 06 16

p. 1206 [location or approximate location where treatment would appear in TJM2 were it not unabridged and therefore only in eFlora]
UNABRIDGED
WAIF
COPROSMA repens
WEEDINESS: Potentially problematic weed
+ 'Potentially problematic weed' added [to replace 'Weed listed by Cal-IPC' in eFlora; no description in TJM2]
2013 08 07

p. 1206
GALIUM
HABIT+: Ann, per, occ subshrub, glabrous to hairy, gen scabrous; dioecious, bisexual, or fls unisexual and bisexual.
+ 'occ +- shrubby' made 'occ subshrub' [in TJM2; not abbreviated in eFlora]
2015 07 06

p. 1211
GALIUM aparine
NOTE: Weedy in gardens; if recognized taxonomically, small pls with slender, pointed lvs, +- yellow petals assignable to _Galium spurium_ L.
+ 'small pls with slender, pointed lvs, +- yellow petals called _Galium spurium_ L.' made 'if recognized taxonomically, small pls with slender, pointed lvs, +- yellow petals assignable to _Galium spurium_ L.' [in TJM2; not abbreviated in eFlora]
2015 04 29

p. 1211
GALIUM bolanderi
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaR, SN, n SCoRI, MP.
+ 'NCoRH, NCoRI,' made 'NCoR,'
+ 'SNF, n SNH, Teh' made 'SN,'
2017 07 12

p. 1212
GALIUM hallii
HABIT+: Subshrub 30--60 cm, climbing to sprawling, +- gray-hairy, base, sts woody; dioecious.
+ 'Per' made 'Subshrub' [in TJM2; not abbreviated in eFlora]
+ 'dioecious.' made 'dioecious, occ monoecious.' [in TJM2; not abbreviated in eFlora]
2015 07 06

p. 1212
GALIUM hallii
BIOREGIONAL DISTRIBUTION: s SNH, s SCoRI (Caliente Range), s SCoRO (Sierra Madre Range), TR.
+ 's SNH, TR' made 's SNH, s SCoRI (Caliente Range), s SCoRO (Sierra Madre Range), TR'  
2015 07 06

p. 1212
GALIUM hardhamiae
HABIT+: Per, low, matted, hairs stiff, +- dense on sts, sparser on lvs, fls; dioecious.
+ 'hairs few' made 'hairs stiff, +- dense on sts, sparser on lvs, fls'  [in TJM2; not abbreviated in eFlora]
LEAF: in whorls of 6, 1--3 mm, lanceolate to ovate, fleshy, bright green, margin strongly rolled-under; petiole distinct, +- white.
+ '1--3 mm' made '1--5 mm'
INFLORESCENCE: long, lfy, fls few in axillary and terminal clusters.
+ 'fls few in axils' made 'fls few in axillary and terminal clusters'  [in TJM2; not abbreviated in eFlora]
2015 12 17

p. 1214
GALIUM hypotrichium subsp. inyoense
BIOREGIONAL DISTRIBUTION: s SNH, W&I.
+ ', W&I' added
2018 07 17

p. 1215
GALIUM sparsiflorum subsp. glabrius
BIOREGIONAL DISTRIBUTION: KR, NCoRH, NCoRI, CaRF.
+ 'KR,' added 
2015 08 12

p. 1215
GALIUM sparsiflorum subsp. sparsiflorum
BIOREGIONAL DISTRIBUTION: KR, SN.
+ 'KR,' added
2019 10 14

p. 1215
NATURALIZED
GALIUM tricornutum
+ 'NATIVE' made 'NATURALIZED' [font in TJM2 changed from that indicating NATIVE to that indicating NATURALIZED]
2013 10 31

p. 1215
GALIUM tricornutum
BIOREGIONAL DISTRIBUTION: NCoR, n&c SNF, n SNH, GV, SnFrB, SCoRO;
+ '.' made ';'
2013 10 31

p. 1215
GALIUM tricornutum
DISTRIBUTION OUTSIDE CALIFORNIA: native to Europe.
+ 'native to Europe.' added 
2013 10 31

p. 1215
GALIUM trifidum subsp. subbiflorum
TAXON AUTHOR: (Wiegand) Puff
+ 'Puff.' made 'Puff'
2012 04 18

p. 1216
CNEORIDIUM dumosum
BIOREGIONAL DISTRIBUTION: s SCo, s ChI (San Clemente Island), PR (exc SnJt);
+ ', PR (exc SnJt)' added
2016 08 30

p. 1216
PTELEA crenulata
BIOREGIONAL DISTRIBUTION: KR, NCoRI, CaR, SNF, ScV (Sutter Buttes), SnJV, SnFrB, PR.
+ 'e KR,' added; 'CaRF' made 'CaR'; 'SnJV,' added 
2015 08 26

p. 1218
POPULUS angustifolia
NOTE: Specimens reported as _Populus angustifolia_ from SnBr, W&I belong instead to _Populus trichocarpa_; those from DMtns not seen.
+ 'SnBr,' inserted
2012 03 27

p. 1223
SALIX, Key to Pistillate Plants
2' Fl bracts gen persistent, +- tan to black, gen hairy, tips entire
+ 'gen hairy,' inserted
2012 04 18

p. 1223
SALIX, Key to Pistillate Plants
20. Petioles not glandular at distal end; lf margins with 0-4 teeth/cm, abaxial surface hairy .....-> S. exigua (2)
20' Petioles glandular at distal end; lf margins with 5-14 teeth/cm, abaxial surface sparsely hairy or gen glabrous
21. Bud scale margins free, overlapping; petioles with a pair of glands; lf with white hairs .....-> S. gooddingii (2)
21' Bud scale margins fused; petioles gen with a cluster of glands; lf with gen a mixture of white and rusty hairs .....-> S. lasiandra (2)
+ couplets 20 and 21 in SALIX, Key to Pistillate Plants, replaced with the above [in TJM2; not abbreviated in eFlora]
2014 03 28

p. 1228
SALIX laevigata
HABIT+: Tree < +- 20 m.
+ '15' made '+- 20'
2012 11 o6

p. 1228
SALIX lasiandra
PISTILLATE FLOWER: ovary glabrous, stalk 0.8--4 mm, style 0.2--0.8 mm; nectary adaxial.
+ 'nectary adaxial;' deleted from beginning of statement, before 'ovary glabrous ...' (stating it once is sufficient)
2012 08 27

p. 1231
AESCULUS californica
BIOREGIONAL DISTRIBUTION: c&s NW, s CaR, SNF, n&c SNH, Teh, GV (scattered near foothills), n&c CW, WTR, sw DMoj;
+ 'n&c SNH,', 'WTR,' added 
2013 10 04

p. 1231
AESCULUS californica
FLOWERING TIME: May--Jun(Aug)
+ '(Aug)' added
2015 10 06

p. 1231
AESCULUS californica
BIOREGIONAL DISTRIBUTION: c&s NW, s CaR, w edge s SNH, SNF, n&c SNH, Teh, GV (scattered near foothills), n&c CW, WTR;
+ 'w edge s SNH,' added; ', sw DMoj' deleted
2019 10 22

p. 1232
SARCOBATUS vermiculatus
UNABRIDGED SYNONYMS: Batis vermiculata Hook.; Fremontia vermiculata (Hook.) Torr.; Sarcobatus maximilianii Nees
+ 'maximillianii' made 'maximilianii' [in eFlora; unabridged synonyms not in TJM2]
2013 08 01

p. 1236
CHRYSOSPLENIUM glechomifolium
RARITY STATUS: SYMBOL 1
+ 'SYMBOL 1' added [meaning that a star symbol was added to TJM2, while 'Listed on CNPS Rare Plant Inventory' was added to the eFlora]
2016 01 20

p. 1239
LITHOPHRAGMA bolanderi
BIOREGIONAL DISTRIBUTION: KR, NCoRO, NCoRI, CaR, SN, s ScV (Sutter Buttes, rare elsewhere), n SnJV, SnFrB, WTR, SnGb.
+ 'KR,' added 
2015 08 19

p. 1245
BUDDLEJA davidii
WEEDINESS: Potentially problematic weed
+ 'Potentially problematic weed' added [to replace removed broken diamond symbol in TJM2 (as an addition to existing note), and 'Weed listed by Cal-IPC' in eFlora]
2013 08 07

p. 1246
MYOPORUM
FLOWER: bisexual, radial [to bilateral]; calyx 5-lobed, lobes +- equal; corolla lobes equal [distal < proximal]; stamens 4 [5--8], anthers gen exserted; ovary [2]4-loculed, ovules 1--2 per chamber, style 1, stigmas 1--2.
+ 'ovary [2]4-loculed' made 'ovary [2]4-chambered'
2015 03 12

p. 1249
SIMMONDSIACEAE
GENERA IN FAMILY: 1 genus, 1 sp.: sw US, Mex.
+ '1 genus: sw US, Mex.' made '1 genus, 1 sp.: sw US, Mex.'
2012 09 27

p. 1249
SIMMONDSIA
SPECIES IN GENUS: 1 sp.
+ '1 sp.' deleted
2012 09 27

p. 1250 [location or approximate location where treatment would appear in TJM2 were it not unabridged and therefore only in eFlora]
UNABRIDGED
WAIF
CESTRUM parqui
WEEDINESS: Potentially problematic weed
+ 'Potentially problematic weed' added [to replace 'Weed listed by Cal-IPC' in eFlora; no description in TJM2]
2013 08 07

p. 1254
NICOTIANA obtusifolia
HABIT+: Per 2--8 dm, glandular-hairy, base often +- woody.
+ 'Per+ 2--8 dm' made 'Per 2--8 dm' [in TJM2; not abbreviated in eFlora]
2013 08 05

p. 1254
PHYSALIS
10' Corolla yellow, 7--8 mm wide; leaf teeth 0 or < 3 mm; anthers 1--2 mm .....-> P. lanceifolia
+ 'lancifolia' made 'lanceifolia'
2018 09 11

p. 1254 [location or approximate location where treatment would appear in TJM2 were it not unabridged and therefore only in eFlora]
UNABRIDGED
WAIF
NICOTIANA sylvestris
HABIT+: Per 10--15 dm, glandular-puberulent.
+ 'Per 1--1.5 dm' made 'Per 10--15 dm' [in TJM2; not abbreviated in eFlora, where "per" expanded to "perennial herb']
2015 03 16

p. 1254
PETUNIA
UNABRIDGED NOTE: Expanded author citation: _Petunia axillaris_ (Lam.) Britton, Sterns & Poggenb. Evidence from chloroplast DNA, morphology, and ecology was used by Fregonezi et al. [Taxon 61:120--130. 2012] to support segregation of _Calibrachoa_ from _Petunia_, as well as recognition of _Calibrachoa parviflora_ (Juss.) D'Arcy, which was said to occur "in North America and Europe, probably as a result of introduction from South America and subsequent naturalization".  
+ 'Evidence from chloroplast DNA, morphology, and ecology was used by Fregonezi et al. [Taxon 61:120--130. 2012] to support segregation of Calibrachoa from Petunia, as well as recognition of Calibrachoa parviflora (Juss.) D'Arcy, which was said to occur "in North America and Europe, probably as a result of introduction from South America and subsequent naturalization".' added [in eFlora; no unabridged notes in TJM2]
2012 03 27

p. 1254
PETUNIA parviflora
NOTE: Widely treated in _Calibrachoa_, which is the sister group of _Petunia_ [Kulcheski et al. 2006 Genetica 126:3--14]; treated in _Calibrachoa_ also by Fregonezi et al. [Taxon 61:120--130. 2012], who regarded it as native to S. Am, naturalized in N. Am, Eur.
+ '; treated in _Calibrachoa_ also by Fregonezi et al. [Taxon 61:120--130. 2012], who regarded it as probably native to S.Am, naturalized in N.Am, Eur' inserted.
2012 04 04

p. 1255
PHYSALIS lanceifolia
+ 'lancifolia' made 'lanceifolia'
SYNONYMS: Physalis angulata L. var. lanceifolia (Nees) Waterf.; Physalis lancifolia Nees, orth. var.
+ 'lancifolia' made 'lanceifolia'; '; Physalis lancifolia Nees, orth. var.' added
2018 09 11

p. 1256
SOLANUM americanum
BIOREGIONAL DISTRIBUTION: CA-FP, DMoj (uncommon);
+ 'uncommon DMoj' made 'DMoj (uncommon)'
2015 12 17

p. 1258
SOLANUM rostratum
COMMON NAME: BUFFALOBUR
+ 'BUFFALO BERRY' made 'BUFFALOBUR'
2015 02 13

p. 1258
SOLANUM xanti
DISTRIBUTION OUTSIDE CALIFORNIA: NV, Baja CA.
+ 'NV,' added 
2015 02 26

p. 1258
STAPHYLEA bolanderi
BIOREGIONAL DISTRIBUTION: e KR, CaR, c&s SN.
+ 'e KR,' added 
2015 08 26

p. 1259
STYRAX redivivus
BIOREGIONAL DISTRIBUTION: KR, NCoRH, NCoRI, CaR, SN, ScV, SCoRO, SCo, TR, PR, DMoj;
+ 'NCoRH, NCoRI, CaR, SN, SCoRO, TR, PR.' made 'KR, NCoRH, NCoRI, CaR, SN, ScV, SCoRO, SCo, TR, PR, DMoj;' 
2014 06 03

p. 1259
STYRAX redivivus
DISTRIBUTION OUTSIDE CALIFORNIA: sw OR.
'sw OR.' added 
2014 06 03

p. 1262
BOEHMERIA
SPECIES IN GENUS: +- 50 spp.: esp trop, subtrop; _Boehmeria nivea_ (L.) Gaudich., ramie, cult for fiber.
+ 'subtrop.; _Boehmeria_' made 'subtrop; _Boehmeria_'  [in TJM2; not abbreviated in eFlora]
2013 08 01

p. 1263
PARIETARIA hespera var. hespera
BIOREGIONAL DISTRIBUTION: s SNF, c&s CCo, SCoRO, SW, s W&I, DMoj exc DMtns, DSon;
+ ', SCoRO' added; 'DMtns' made 'DMoj exc DMtns' 
2014 08 05

p. 1264
CENTRANTHUS ruber
BIOREGIONAL DISTRIBUTION: s NCo, KR, NCoRO, SNF, GV, CCo, SnFrB, SW, cultivated elsewhere;
+ 'KR, NCoRO,' added 
2013 10 07

p. 1265
VALERIANA californica
BIOREGIONAL DISTRIBUTION: KR, NCoRH, CaR, SNH, MP, SNE (exc W&I);
+ ', SNE (exc W&I)' added 
2013 10 07

p. 1265
VALERIANA occidentalis
BIOREGIONAL DISTRIBUTION: MP;
+ 'Wrn' made 'MP' 
2013 10 07

p. 1265
VALERIANA pubicarpa
BIOREGIONAL DISTRIBUTION: c SNH, n SNE, expected W&I;
+ 'c SNH,' added 
2013 10 07

p. 1265
VALERIANA sitchensis subsp. scouleri
SYNONYMS: _Valeriana hookeri_ Shuttlew.; _Valeriana scouleri_ Rydb., illeg.
+ period added after 'Shuttlew'
2012 03 27
p2

p. 1266
VALERIANELLA locusta
BIOREGIONAL DISTRIBUTION: KR, NCoRO, CaRH, n SN, n ScV, CCo, SnFrB;
+ 'CaRH,', 'CCo,' added 
2013 10 07

p. 1266
ALOYSIA wrightii
BIOREGIONAL DISTRIBUTION: e&s DMtns, e DSon;
+ ', e DSon' added 
2014 08 05

p. 1271
VIOLA langsdorffii
COMMON NAME: ALASKA VIOLET, LANGSDORFF'S VIOLET
+ 'LANGSDORF'S' made 'LANGSDORFF'S'
2012 03 27

p. 1272
VIOLA praemorsa subsp. linguifolia
BIOREGIONAL DISTRIBUTION: NW, CaR, n&c SNH, MP;
+ 'Wrn' made 'MP' 
2014 08 05

p. 1275
VISCACEAE
TJM2 AUTHOR: Job Kuijt
+ 'Job Kuijt, Frank G. Hawksworth & Delbert Wiens, family description, key to genera; treatment of genera by Job Kuijt, except as noted' made 'Job Kuijt'
2012 08 15

p. 1276 
(superseded by Supplement I)
PHORADENDRON
2. St canescent, esp at tip, +- red to green, rigid; spike with 1--3(7) fertile internodes; on (_Larrea_), _Olnyea_, _Parkinsonia_, _Prosopis_, _Senegalia_, _Simmondsia_; < 1200 m .....-> P. californicum
+ 'on _Acacia_, _Cercidium_, (_Larrea_), _Olnyea_, _Prosopis_;' made 'on (_Larrea_), _Olnyea_, _Parkinsonia_, _Prosopis_, _Senegalia_, _Simmondsia_;'
2012 06 22

p. 1276 
(superseded by Supplement I)
PHORADENDRON californicum
ECOLOGY: Desert, on (_Larrea_), _Olnyea_, _Parkinsonia_, _Prosopis_, _Senegalia_, _Simmondsia_;
+ 'Desert, on _Acacia_, (_Larrea_), _Olneya_, _Parkinsonia_, _Prosopis_, _Simmondsia_;' made 'Desert, on (_Larrea_), _Olneya_, _Parkinsonia_, _Prosopis_, _Senegalia_, _Simmondsia_;'
2012 06 22

p. 1276 
(superseded by Supplement I)
PHORADENDRON juniperinum
ECOLOGY: Pinyon/juniper woodland, ponderosa-pine forest, on _Calocedrus_, _Juniperus_;
+ '_Calocedrus decurrens_' made '_Calocedrus_'
2012 06 22

p. 1276
(superseded by Supplement I)
PHORADENDRON leucarpum subsp. tomentosum
ECOLOGY: Gen on _Quercus_, rarely on _Adenostoma_, _Arctostaphylos_, _Cercocarpus ledifolius_, _Rhus_, _Umbellularia_;
+ '_Cercocarpus ledifolius_,' added
2015 03 26 

p. 1276
VISCUM
TJM2 AUTHOR:
+ 'Job Kuijt, Frank G. Hawksworth & Delbert Wiens' deleted
2014 04 24 [on 2014 04 24, 'Job Kuijt, Frank G. Hawksworth & Delbert Wiens' deleted from this entry; on 2012 08 15, it was deleted from eFlora but not actually deleted from corrected statement in original listing of this entry (which was posted on 2012 08 15)]

p. 1279
NATIVE
KALLSTROEMIA parviflora
+ 'NATURALIZED' made 'NATIVE'  [font in TJM2 changed from that indicating NATURALIZED to that indicating NATIVE]
2013 12 11

p. 1279
KALLSTROEMIA parviflora
DISTRIBUTION OUTSIDE CALIFORNIA: to c US, c Mex.
+ 'native AZ to c US, c Mex' made 'to c US, c Mex'  
2015 04 02

p. 1282
THYMELAEACEAE
FLOWER: bisexual [not], [3]4[6]-parted; hypanthium tubular or funnel- to bell-shaped, corolla-like; calyx lobes overlapped or not, or +- 0; petals small, alternate sepals; stamens [2,4]8[many]; disk gen present; ovary superior [1/2-inferior], 1-chambered, 1-ovuled, style 1, stigma dot-like.
+ '1-loculed' made '1-chambered'
2015 03 12

p. 1283  [location or approximate location where information would appear in TJM2 were it not unabridged and therefore only in eFlora]
DAMASONIUM californicum
SYNONYMS: Machaerocarpus californicus (Torr. ex Benth.) Small
+ 'Damasonium californicum Torr. ex Benth.;' removed [from eFlora; not included in TJM2]
2016 04 21

p. 1284
CAMASSIA quamash (Pursh) Greene subsp. breviflora
UNABRIDGED NOTE: The following accessions, if verified, would represent range extensions (as indicated): UC1613512 (c SNF); UC1076526 (c SNH); UC1191233, UC421787, UC421788, UC421789, UC71741, UC72484, CHSC85122, RSA488030, JEPS55581, UC1036049, UC1004347, UC1037228, UC1036051, CHSC88127, CHSC88387 (MP). According to Doreen Smith (e-mail of 22 May 2012; archived in Eudora mailbox "Smith Doreen"), Marin Flora (Howell et al., 2007, as _Camassia quamash_ (Pursh) Greene var. _linearis_ (Gould) J.T. Howell), and Jeff Greenhouse (pers. comm., 23 May 2012), occurs on Pt. Reyes (CCo).
+ 'According to Doreen Smith (e-mail of 22 May 2012; archived in Eudora mailbox "Smith Doreen"), Marin Flora (Howell et al., 2007, as _Camassia quamash_ (Pursh) Greene var. _linearis_ (Gould) J.T. Howell), and Jeff Greenhouse (pers. comm., 23 May 2012), occurs on Pt. Reyes (CCo).' added [in eFlora; no unabridged notes in TJM2]
2012 05 23

p. 1286
HESPEROCALLIS undulata
BIOREGIONAL DISTRIBUTION: D (exc DMtns);
+ 'D' made 'D (exc DMtns)'
2019 03 05

p. 1290
ALLIUM
10' Stamens incl 
+ 'including' made 'included' [in eFlora; abbreviation 'incl' retained in TJM2]
2012 04 04}

p. 1293
ALLIUM burlewii
ECOLOGY: Sandy, gravelly soils, granite, serpentine;
+ 'Granitic sands on dry slopes, ridges' made 'Sandy, gravelly soils, granite, serpentine'
2015 12 03

p. 1293
ALLIUM hickmanii
BIOREGIONAL DISTRIBUTION: c CCo.
+ '(Monterey Peninsula; Arroyo de la Cruz, San Luis Obispo Co.)' deleted
2018 05 29

p. 1293
ALLIUM howellii var. clokeyi
ECOLOGY: Locally common. Open slopes, sagebrush scrub, vertic clay;
+ ', vertic clay' added
2016 04 26

p. 1294
ALLIUM howellii var. sanbenitense
TAXON AUTHOR: (Traub) McNeal & T.D. Jacobsen
+ 'Traub & Ownbey' made 'McNeal & T.D. Jacobsen
2012 03 27
p2

p. 1294
ALLIUM howellii var. sanbenitense
RARITY STATUS: SYMBOL 1
+ 'SYMBOL 1' added [meaning that a star symbol was added to TJM2, while 'Listed on CNPS Rare Plant Inventory' was added to the eFlora]
2019 03 12

p. 1294
ALLIUM howellii var. sanbenitense
ECOLOGY: Uncommon. Grassy openings in chaparral, vertic clay;
+ 'Grassy slopes' made 'Grassy openings in chaparral, vertic clay'
2015 12 03

p. 1296
ALLIUM peninsulare
FLOWER: 8--15 mm; perianth parts erect, lanceolate to elliptic, red-purple, entire to inner dentate, tips +- spreading; ovary crests 3, minute, 2-lobed, central.
+ 'entire or inner dentate' made 'entire to inner dentate'
2014 12 05

p. 1297 [location or approximate location where treatment would appear in TJM2 were it not unabridged and therefore only in eFlora]
UNABRIDGED
LEUCOJUM aestivum
FLOWERING TIME: Dec--Jun
+ 'Mar--Jun' made 'Dec--Jun'
2013 01 11

p. 1298
NARCISSUS tazetta
STEM: 25--45 cm.
+ '25--23' made '25--45'
2016 01 22

p. 1301
LYSICHITON americanus
BIOREGIONAL DISTRIBUTION: NCo, CCo;
+ 'SnFrB' made 'CCo' 
2012 08 22

p. 1302
WOLFFIA brasiliensis
BIOREGIONAL DISTRIBUTION: ScV (near Sacramento River), SnFrB;
+ ', SnFrB' added 
2015 03 19

p. 1302
WOLFFIA columbiana
BIOREGIONAL DISTRIBUTION: SnJV, CCo, SnFrB, SCoRO, SCo;
+ 'SnFrB,' added 
2015 03 19

p. 1303
PHOENIX canariensis
TAXON AUTHOR: H. Wildpret, nom. cons.
+ 'Chabaud' made 'H. Wildpret, nom. cons.'
SYNONYMS: Phoenix canariensis Chabaud, nom. rej.
+ SYNONYMS added
2019 08 06

p. 1303
WASHINGTONIA filifera
TAXON AUTHOR: (Linden ex Andr&eacute;) H. Wendl. ex de Bary
+ 'H. Wendl. ex de Bary.' made 'H. Wendl. ex de Bary'
2019 01 17

p. 1303
ASPARAGACEAE
STEM: branchlets lf-like, many, thread-like or flat, functioning as lvs.
+ 'branchlets many' made 'branchlets lf-like, many'
2012 03 27

p. 1303
ASPARAGACEAE
LEAF: scale-like, papery, with a spiny spur at base or not.
+ 'gen with a spiny spur at base' made 'with a spiny spur at base or not'
2012 03 27

p. 1303
ASPARAGACEAE
INFLORESCENCE: raceme, umbel, or fls 1.
+ rewritten from 'raceme, umbel [or fls 1].'
2012 03 27

p. 1303
ASPARAGUS
1. Lf-like branchlets 6--20 mm wide .....-> _A. asparagoides_
+ 'Branchlets' made 'Lf-like branchlets'
2012 03 27

p. 1303
ASPARAGUS
1' Lf-like branchlets < 1 mm wide [<= 3 mm wide in _A. aethiopicus_]
+ rewritten from 'Branchlets < 1 mm wide'
2012 04 04

p. 1303
ASPARAGUS asparagoides
TAXON AUTHOR: (L.) W. Wight
+ 'Druce' made 'W. Wight'
SYNONYMS: Asparagus asparagoides (L.) Druce
+ SYNONYMS added
2019 08 16

p. 1303
ASPARAGUS asparagoides
INFLORESCENCE: axillary, umbels or fls 1.
+ rewritten from 'axillary umbels.'
2012 03 27

p. 1304
ASPHODELUS fistulosus
BIOREGIONAL DISTRIBUTION: s SnJV, CCo, SCo, s ChI (San Clemente Island), expected elsewhere;
+ 'CCo' inserted 
2013 02 21

p. 1305
COMMELINA
HABIT+: Ann [per].
+ 'Ann, [per]' made 'Ann [per]' [in TJM2; not abbreviated in eFlora, where "per" expanded to "perennial herb']
2013 11 22

p. 1305
CYPERACEAE
FLOWER: unisexual or bisexual, small, generally wind-pollinated; perianth 0 or generally bristle like; stamens generally 3, anthers attached at base, 4 chambered; ovary superior, chamber 1, ovule 1, style 2--3(4)-branched.
+ 'style 2--3-branched' made 'style 2--3(4)-branched'
2019 01 17

p. 1310
(superseded by Supplement III)
CAREX, Group 1
17' Pistillate flower bracts elliptic to elliptic-obovate, green or pale red-brown, midrib green; peri green or gold-green to pale brown, occasionally red-dotted but not purple-splotched; often on serpentine, 60--1200 m, NCoR (Mendocino, Lake cos.), CaR, n&c SN .....-> C. hirtissima
+ 'CaR,' added 
2015 03 03

p. 1311
(superseded by Supplement III)
CAREX, Group 2
23. Pistillate fl bracts, lower staminate fl bracts green, red, or purple with white margin 0.4--0.8 mm wide; terminal spikelet staminate on taller infls; sts bisexual; KR, CaRH .....-> C. inops subsp. inops
+ 'KR,' added 
2016 05 03

p. 1313
(superseded by Supplement III)
CAREX, Group 6
6. Peri abruptly narrowed to distinct beak
+ 'Peri gradually narrowed to a distinct beak' made 'Peri abruptly narrowed to distinct beak'
2013 10 24

p. 1313
(superseded by Supplement III)
CAREX, Group 6
6' Peri tapered to indistinct beak
+ 'Peri tapered to tip, beak +- 0' made 'Peri tapered to indistinct beak'
2013 10 24

p. 1317
(superseded by Supplement III)
CAREX, Group 11
2. Contraligule 3--13 mm .....-> Group 11B
+ '(sleeve-like sheath extension above and opposite blade junction)' deleted
{/explanation: contraligule defined under genus, used throughout, no need to repeat in key}
2012 03 27
p2

p. 1319
(superseded by Supplement III)
CAREX, Group 11D
7. Peri gen widest near or above middle; infl gen dense, spikelets overlapped; lf sheath mouth white; subalpine to alpine, 2500--4000 m
+ 'alpine to subalpine' made 'subalpine to alpine'
2016 01 25

p. 1319
(superseded by Supplement III)
CAREX, Group 11D
10' Peri +- shiny at 10&times;, beak tip cylindric, entire; inflorescence ovoid, dense, generally brown or coppery; coastal, insular, or montane, < 900 m .....-> C. harfordii
+ 'coastal, < 600 m' made 'coastal, insular, or montane, < 900 m

p. 1321
(superseded by Supplement III)
CAREX, Group 11H
15' Peri beaks of 1 kind, gen cylindric, smooth entire part > 0.4 mm; seasonally wet soil; < 900 m, NCo, NCoRO, CW, SCo, n ChI, WTR .....-> <sup>2</sup>_C. subbracteata_
+ 'CCo, SnFrB, SCoR' collapsed to 'CW' 
2012 03 27
p2

p. 1321
(superseded by Supplement III)
CAREX alma
BIOREGIONAL DISTRIBUTION: c&s SNH, Teh, SnJV, SCoRO, SCo, TR, PR, DMoj;
+ 'Teh,' added 
+ ',DMoj' added 
2015 02 27

p. 1321
(superseded by Supplement III)
CAREX amplifolia
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaR, SNH, CCo, SnFrB, MP;
+ 'CaRH' made 'CaR' 
2015 03 02

p. 1321
(superseded by Supplement III)
CAREX aquatilis var. dives
TAXON AUTHOR: (Holm) K&uuml;k.
+ 'T. Holm' made 'Holm'
2012 03 27

p. 1321
(superseded by Supplement III)
CAREX aquatilis var. dives
BIOREGIONAL DISTRIBUTION: NCo, KR, NCoRO, CaRH (Butte Co.), CCo;
+ 'CaRH (Butte Co.),' deleted 
2016 05 03

p. 1322
(superseded by Supplement III)
CAREX aurea
BIOREGIONAL DISTRIBUTION: KR, NCoRH, NCoRI, CaR, SNH, TR, MP, n SNE (Bodie), W&I, DMtns;
+ 'KR,' added 
+ 'CaRH' made 'CaR' 
2015 03 02

p. 1322
(superseded by Supplement III)
CAREX barbarae
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaRF, SNF, c SNH, GV, CW, SCo, n ChI (Santa Cruz Island), WTR, PR;
+ ',PR' added 
2015 03 02

p. 1322
(superseded by Supplement III)
CAREX bolanderi
BIOREGIONAL DISTRIBUTION: NW, CaR, n SNF, SNH, CCo, SnFrB, SCoRO, SW, MP;
+ 'CaRH' made 'CaR' 
+ 'n SNF,' added 
+ 'SCoRO,' added 
+ ', MP' added 
2015 03 02

p. 1322
(superseded by Supplement III)
CAREX brainerdii
BIOREGIONAL DISTRIBUTION: KR, NCoRH, NCoRO, CaRH, n&c SNH, SCoRO (San Luis Obispo Co.);
+ 'NCoRH,' added 
2015 03 02

p. 1322
(superseded by Supplement III)
CAREX buxbaumii
ELEVATION: < 3300 m.
BIOREGIONAL DISTRIBUTION: KR, SNH, CCo;
+ 'NCo, NCoR, c&s SNH, CCo' made 'KR, SNH, CCo 
2015 03 02

p. 1322
CAREX comosa
(superseded by Supplement III)
BIOREGIONAL DISTRIBUTION: KR, NCoRI, CaRH, GV, n CCo (Bodega Bay), SnFrB, SnBr, MP (Shasta Co.);
+ 'KR,' added 
2016 05 03

p. 1324
(superseded by Supplement III)
CAREX cusickii
BIOREGIONAL DISTRIBUTION: NCo, KR, CaR, n&c SNH, CCo, SnFrB, MP;
+ 'CaR,' added 
+ ', SnFrB, MP' added 
2015 03 02

p. 1324
(superseded by Supplement III)
CAREX densa
BIOREGIONAL DISTRIBUTION: NW, CaR, SN, GV, CCo, SnFrB, SCoRO, SCo, SnGb, PR;
+ 'SCoRO,' added [in TJM2; not abbreviated in eFlora; see also change made later, on 2015 03 02]
2014 07 29

p. 1324
(superseded by Supplement III)
CAREX densa
BIOREGIONAL DISTRIBUTION: NW, CaR, SN, GV, CCo, SnFrB, SCoRO, SCo, WTR, SnGb, PR;
+ 'WTR,' added [in TJM2; not abbreviated in eFlora; see also change made earlier, on 2014 07 29]
2015 03 02

p. 1324
(superseded by Supplement III)
CAREX diandra
BIOREGIONAL DISTRIBUTION: CaRH, SNH, MP;
+ 'n&c SNH' made 'SNH' 
2015 03 02

p. 1324
(superseded by Supplement III)
CAREX diandra
BIOREGIONAL DISTRIBUTION: KR, CaRH, SNH, MP;
+ 'KR,' added 
2016 05 03

p. 1324
(superseded by Supplement III)
CAREX douglasii
BIOREGIONAL DISTRIBUTION: KR, CaR, SNH, SnJV, SCoR, TR, PR, GB, DMtns (Cottonwood Mtns);
+ 'CaR,' added 
2015 03 02

p. 1325
(superseded by Supplement III)
CAREX exsiccata
BIOREGIONAL DISTRIBUTION: NCo, s KR, CCo, SnFrB;
+ 'NCoRO,' added 
+ 'n SNH (Plumas Co.),' deleted  
+ ', SnFrB' added  

p. 1325
(superseded by Supplement III)
CAREX geyeri
COMMON NAME: GEYER'S SEDGE (Group 3)
+ '(Group 3)' added
2012 09 26

p. 1325
(superseded by Supplement III)
CAREX gracilior
BIOREGIONAL DISTRIBUTION: NCoRO, CaRH, n SN, ScV, CW (exc SCoRI).
+ '(exc (SCoRI)' made '(exc SCoRI)' [in TJM2; not abbreviated in eFlora; see also changes made later, on 2015 03 02]
{/comment: looks like a global replace error; see also p. 1475}
2012 03 27
p2

p. 1325
(superseded by Supplement III)
CAREX gracilior
BIOREGIONAL DISTRIBUTION: NCoRO, CaR, n SN, ScV, CW (exc SCoRI), nw SCo, w WTR.
+ 'CaRH' made 'CaR' [in TJM2; not abbreviated in eFlora; see also change made earlier, on 2012 03 27]
+ ', nw SCo, w WTR' added [in TJM2; not abbreviated in eFlora; see also change made earlier, on 2012 03 27]
2015 03 02

p. 1326
(superseded by Supplement III)
CAREX harfordii
BIOREGIONAL DISTRIBUTION: NCo, NCoRO, CW, ChI;
+ 'NCo,' added  
2015 03 02

p. 1326
(superseded by Supplement III)
CAREX haydeniana
BIOREGIONAL DISTRIBUTION: SNH, Wrn, W&I, DMtns;
+ 'c&s SNH' made 'SNH' 
2015 03 02

p. 1326
(superseded by Supplement III)
CAREX hirtissima
BIOREGIONAL DISTRIBUTION: NCoR (Mendocino, Lake cos.), CaR, n&c SN.
+ 'CaR,' added 
2015 03 02

p. 1326
(superseded by Supplement III)
CAREX hoodii
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaRH, SNH, SnBr, MP, W&I;
+ 'Wrn' made 'MP' 
2015 03 02

p. 1328
(superseded by Supplement III)
CAREX inops subsp. inops
BIOREGIONAL DISTRIBUTION: KR, CaRH;
+ 'KR,' added 
2016 05 03

p. 1328
(superseded by Supplement III)
CAREX integra
BIOREGIONAL DISTRIBUTION: KR, NCoRH, CaRH, SNH, SnBr, Wrn;
+ 'NCoRH,' added 
2015 03 02

p. 1328
(superseded by Supplement III)
CAREX laeviculmis
BIOREGIONAL DISTRIBUTION: KR, NCoRH, NCoRO, s CaRH, n&c SNH, Wrn;
+ 'NCoRH,' added 
+ 's CaRH,' added 
2015 03 02

p. 1328
(superseded by Supplement III)
CAREX lasiocarpa
BIOREGIONAL DISTRIBUTION: KR, CaRH, n SNH (s Plumas Co.).
+ 'KR,' added 
2016 05 03

p. 1330
(superseded by Supplement III)
CAREX lenticularis var. limnophila
TAXON AUTHOR: (Holm) Cronquist
+ 'T. Holm' made 'Holm'
2012 03 27

p. 1330
(superseded by Supplement III)
CAREX lenticularis var. lipocarpa
TAXON AUTHOR: (Holm) Cronquist
+ 'T. Holm' made 'Holm'
2012 03 27

p. 1330
(superseded by Supplement III)
CAREX leptalea
BIOREGIONAL DISTRIBUTION: NCo, KR, NCoRO, CCo (extirpated);
+ 'KR,' added 
2015 03 03

p. 1330
(superseded by Supplement III)
CAREX leptopoda
BIOREGIONAL DISTRIBUTION: NW, CaR, n SNF, SNH, CCo, SnFrB, SW;
+ 'CaRH' made 'CaR'  
+ ', n SNF' added 
2015 03 03

p. 1330
(superseded by Supplement III)
CAREX limosa
BIOREGIONAL DISTRIBUTION: KR, CaRH, SNH, Wrn;
+ 'SNH' made 'KR, CaRH, SNH, Wrn'  
2015 03 03

p. 1332
(superseded by Supplement III)
CAREX mariposana
BIOREGIONAL DISTRIBUTION: NCoR, CaRH, SNH, SnBr;
+ 'NCoRO, NCoRH' made 'NCoR' 
2015 03 03

p. 1332
(superseded by Supplement III)
CAREX mertensii
TAXON AUTHOR: J.D. Prescott
+ 'Bong.' made 'J.D. Prescott'
UNABRIDGED NOTE: Expanded author citation: Carex mertensii J.D. Prescott ex Bong.
+ UNABRIDGED NOTE deleted [in eFlora; no unabridged notes in TJM2]
2019 06 11

p. 1332
(superseded by Supplement III)
CAREX multicaulis
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaR, n&c SNF, SNH, SCoR, TR, PR, MP;
+ 'CaRH, SNH' made 'CaR, n&c SNF, SNH' 
2015 03 03

p. 1332
(superseded by Supplement III)
CAREX nebrascensis
BIOREGIONAL DISTRIBUTION: KR, CaRH, SNH, GV, WTR, SnBr, SnJt, GB, n DMtns;
+ 'SnBr,' added 
+ 'DMtns' made 'n DMtns' 
2015 03 03

p. 1332
(superseded by Supplement III)
CAREX nudata
BIOREGIONAL DISTRIBUTION: NCo, KR, NCoRO, SNH, ScV, CW, WTR;
+ 'CCo, SnFrB, SCoR' collapsed to 'CW' [in TJM2; not abbreviated in eFlora; see also change made later, on 2015 03 03]
2012 03 27
p2

p. 1332
(superseded by Supplement III)
CAREX nudata
BIOREGIONAL DISTRIBUTION: NCo, KR, NCoRI, NCoRO, CaRF, SNF, SNH, ScV, CW, WTR;
+ 'NCoRI,' added  [in TJM2; not abbreviated in eFlora; see also change made earlier, on 2012 03 27]
+ 'CaRF, SNF,' added [in TJM2; not abbreviated in eFlora; see also change made earlier, on 2012 03 27]
2015 03 03

p. 1333
(superseded by Supplement III)
CAREX pansa
COMMON NAME: SAND DUNE SEDGE (Group 7)
+ 'SANDDUNE' made 'SAND DUNE'
2012 11 14

p. 1333
(superseded by Supplement III)
CAREX pendula
WEEDINESS: Potentially problematic weed
+ 'Potentially problematic weed' added [to replace removed broken diamond symbol in TJM2 (as an addition to existing note), and 'Weed listed by Cal-IPC' in eFlora]
2013 08 07

p. 1334
(superseded by Supplement III)
CAREX praegracilis
BIOREGIONAL DISTRIBUTION: CA exc DSon;
+ 'CA-FP, W&I, DMtns' made 'CA exc DSon'  
2015 03 03

p. 1334
(superseded by Supplement III)
CAREX scabriuscula
SYNONYMS: _Carex gigas_ (Holm) Mack.
+ 'T. Holm' made 'Holm'
2012 03 27

p. 1336
(superseded by Supplement III)
CAREX scopulorum Holm var. bracteosa
+ 'T. Holm' made 'Holm'
2012 03 27

p. 1337
(superseded by Supplement III)
CAREX stevenii
TAXON AUTHOR: (Holm) Kalela
+ 'T. Holm' made 'Holm'
2012 03 27

p. 1337
(superseded by Supplement III)
CAREX subbracteata
BIOREGIONAL DISTRIBUTION: NCo, NCoRO, CW, SCo, n ChI, WTR;
+ 'CCo, SnFrB, SCoR' collapsed to 'CW' 
2012 03 27
p2

p. 1337
(superseded by Supplement III)
CAREX subfusca
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaRH, n SNF, SNH, SnFrB, SCoRO, TR, PR, MP, W&I, DMtns;
+ 'NCoRH' made 'NCoR' 
+ 'SnFrB,' added 
+ 'Wrn' made 'MP' 
2015 03 03

p. 1337
(superseded by Supplement III)
CAREX subnigricans
STEM: 2.5--20 cm.
+ '5' made '2.5'
2016 06 07

p. 1340
CYPERUS
15. Fr body +- as long as wide
+ 'Fr body 1.5--3 &times; longer than wide' made 'Fr body +- as long as wide'
2012 09 20

p. 1340
CYPERUS
15' Fr body 1.5--3 &times; longer than wide
+ 'Fr body +- as long as wide' made 'Fr body 1.5--3 &times; longer than wide'
2012 09 20

p. 1340
CYPERUS niger
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaR, SNF, n SNH, GV, CW, SCo, PR, SNE;
+ 'KR,' added
+ 'CaRF' made 'CaR' 
2015 08 11

p. 1346
(superseded by Supplement II)
ERIOPHORUM crinigerum 
BIOREGIONAL DISTRIBUTION: NW;
+ ', CaR' deleted
2015 08 12

p. 1346
ERIOPHORUM gracile
BIOREGIONAL DISTRIBUTION: KR, CaR, n&c SNH, SnFrB (extirpated);
+ 'KR,' added 
2015 08 12

p. 1348
ISOLEPIS levynsiana
BIOREGIONAL DISTRIBUTION: NCo (Mendocino, Sonoma cos.);
+ '(Sonoma, Mendocino cos.)' made '(Mendocino, Sonoma cos.)'
2012 04 02

p. 1353
NATURALIZED
SCIRPUS cyperinus
+ 'NATIVE' made 'NATURALIZED'  [font in TJM2 changed from that indicating NATIVE to that indicating NATURALIZED]
2012 03 27

p. 1353
SCIRPUS cyperinus
UNABRIDGED NOTE: Evidently first collected in CA in 1976; several records in CCH (Mariposa Co.), most recently 2003; confirmed as "naturalized in wildlands" by Hrusa et al. (Madro&ntilde;o 49:61--98 2002), but also  considered possibly native to CA; study of nativity needed.
+ 'now considered' made 'also considered', 'study needed' made 'study of nativity needed' [in eFlora; no unabridged notes in TJM2]
2012 03 27

p. 1353
TRICHOPHORUM pumilum
DISTRIBUTION OUTSIDE CALIFORNIA: AK to MT, also QC, Eur, c Asia.
+ 'AK to MT; QB, Eur, c Asia.' made 'AK to MT, also QC, Eur, c Asia.' 
2013 08 05

p. 1354
ELODEA bifoliata
ELEVATION: 1300--1800 m
+ '365--375 m' made '1300--1800 m' [in eFlora; '1300--1800 m' added in TJM2, where no elevation was given at all]
2012 03 27

p. 1355 (middle row, figure second from right)
SCIRPUS microcarpus
+ 'upper inflorescence' made 'terminal inflorescence'
2015 04 02

p. 1356
IRIDACEAE
7. Fl st bent +- 90&deg; below lowest fl, spike 1-ranked; lf axils without bulblets after fl .....-> [Freesia leichtlinii subsp. alba]
+ '[Freesia alba]' made '[Freesia leichtlinii subsp. alba]'
2012 06 25

p. 1356 [location or approximate location where treatment would appear in TJM2 were it not unabridged and therefore only in eFlora]
UNABRIDGED
WAIF
FREESIA leichtlinii Klatt subsp. alba
+ 'FREESIA alba' made 'FREESIA leichtlinii Klatt subsp. alba' [in eFlora; no description in TJM2]
2012 06 25

p. 1356 [location or approximate location where treatment would appear in TJM2 were it not unabridged and therefore only in eFlora]
UNABRIDGED
WAIF
FREESIA leichtlinii Klatt subsp. alba [corrected from 'FREESIA alba']
TAXON AUTHOR: (G.L. Mey.) J.C. Manning & Goldblatt
+ 'Gumbl.' made 'J.C. Manning & Goldblatt' [in eFlora; no description in TJM2]
2012 06 25

p. 1356 [location or approximate location where treatment would appear in TJM2 were it not unabridged and therefore only in eFlora]
UNABRIDGED
WAIF
FREESIA leichtlinii Klatt subsp. alba [corrected from 'FREESIA alba']
SYNONYMS: Freesia alba (G.L. Mey.) Gumbl.
+ 'Freesia alba (G.L. Mey.) Gumbl.' added [in eFlora; no description in TJM2]
2012 06 25

p. 1359
IRIS pseudacorus
BIOREGIONAL DISTRIBUTION: NCoRI, n&c SNF, w edge c SNH, GV, CW, SCo, TR;
+ 'w edge c SNH,' added 
2014 07 29

p. 1359
IRIS pseudacorus
BIOREGIONAL DISTRIBUTION: KR, NCoRI, n&c SNF, w edge c SNH, GV, CW, SCo, TR;
+ 'KR,' added 
2016 05 03

p. 1361
WATSONIA meriana
SYNONYMS: Watsonia bulbillifera J.W. Mathews & L. Bolus
+ 'Watsonia bulbillifer Mathews & L. Bolus' made 'Watsonia bulbillifera J.W. Mathews & L. Bolus'
2012 04 04
p2

p. 1361
JUNCACEAE
FLOWER: gen bisexual, radial; sepals and petals similar, persistent, scale-like, green to brown or +- purple-black; stamens gen 3 or 6, anthers linear, persistent; pistil 1, ovary superior, chambers gen 1 or 3, placentas 1 and basal or 3 and axile or parietal, stigmas gen > style.
+ 'sepals and petals similar, persistent, green to brown or +- purple-black' made 'sepals and petals similar, persistent, scale-like, green to brown or +- purple-black'
2014 12 05

p. 1362
(superseded by Supplement III)
JUNCUS, Group 1
2. Sepals 2--4 mm
3. Fls scattered along st, 1 per node .....-> J. bufonius var. occidentalis
3' Fls terminal, 3--10(25) per cluster
4. Perianth green to red or pale brown; lowest bract > infl .....-> J. capitatus (2)
4' Perianth dark brown to +- black; lowest bract < infl .....-> J. planifolius
2' Sepals gen 4--10 mm
+ replaces couplets 2--4 [not abbreviated in eFlora; couplet 4 moved from under 2' to under 3', 4. and 4' reversed for alphabetical order, '.....-> J. planifolius (2)' removed from 3', and '(2)' removed from 'J. planifolius (2)' at 4' (previously 4.)]
2013 08 05

p. 1362
(superseded by Supplement III)
JUNCUS, Group 1
1' St not branched, lfless, lvs basal; infl or fls terminal; stamens 2--3(--5)
+ 'stamens 2 or 3' made 'stamens 2--3(--5)'
2013 11 13

p. 1362
(superseded by Supplement III)
JUNCUS, Group 1
15' Infl bractlets 1--2, tips acute to blunt, ovate to rounded, not sheathing stem; stamens 2--4
+ 'stamens gen 2--4' made 'stamens 2--4'
2013 11 13

p. 1362
(superseded by Supplement III)
JUNCUS, Group 1
19' Perianth +- = and same color as capsule; > 40 seeds per capsule; seed 0.3--0.6 mm, striations obvious at 30&times;
+ 'Perianth gen < and same color as capsule' made 'Perianth +- = and same color as capsule'
2015 03 05

p. 1362
(superseded by Supplement III)
JUNCUS, Group 2
2. Blades well developed on some upper sheaths, > 5 cm, st-like .....-> _J. mexicanus_
+ comma added after 'sheaths'
2012 03 27
p2

p. 1362
(superseded by Supplement III)
JUNCUS, Group 2
2' Blades 0 or < 1 cm, not st-like
+ 'Blades 0, < 1 cm' made 'Blades 0 or < 1 cm'
2012 03 27
p2

p. 1366
(superseded by Supplement III)
JUNCUS, Group 4
Group 4: Per; lf blades flattened, iris-like, crosswalls gen incomplete
+ 'crosswalls often incomplete' made 'crosswalls gen incomplete' [in TJM2; not abbreviated in eFlora]
2015 03 05

p. 1366
(superseded by Supplement III)
JUNCUS, Group 4
5. Stamens gen 3; perianth gen dark brown to black .....-> J. ensifolius
+ 'Stamens 3' made 'Stamens gen 3' [in TJM2; not abbreviated in eFlora]
2015 03 05

p. 1366
(superseded by Supplement III)
JUNCUS, Group 4
5' Stamens gen 6; perianth gen green to red-tipped or brown
+ 'Stamens 6' made 'Stamens gen 6' [in TJM2; not abbreviated in eFlora]
2015 03 05

p. 1365
(superseded by Supplement III)
JUNCUS, Group 5
1. Perianth black-striped, tips blunt, hooded, incurved; anthers >> filaments; rhizomatous; coastal salt marshes .....-> J. gerardi subsp. gerardi
+ 'J. gerardii subsp. gerardii' made 'J. gerardi subsp. gerardi'
2014 01 14

p. 1365 [location where following information would appear in TJM2 were it not unabridged and therefore only in eFlora]
(superseded by Supplement III)
JUNCUS, Group 5
6. Leaf sheath appendages generally rounded, +- opaque below, 0.2--0.6 mm; bractlets acuminate, generally bristle-tipped; stem with 2--6 strong ridges per side; DMtns .....-> J. interior
6' Leaf sheath appendages generally acute to acuminate, +- translucent, generally 1--8 mm until late in season when generally smaller or absent; bractlets generally acute to blunt; stem with or without strong ridges per side; widespread
+ UNABRIDGED KEY LEADS 6a. and 6a' deleted  [from eFlora; unabridged key leads not included in TJM2]
2014 09 09

p. 1366
(superseded by Supplement III)
JUNCUS ambiguus
BIOREGIONAL DISTRIBUTION: NCo, KR, CaRF, SnJV, CCo, SnFrB, SCo, ChI, SnGb, MP (exc Wrn);
+ 'KR,' added
2016 06 15

p. 1367
(superseded by Supplement III)
JUNCUS capitatus
INFLORESCENCE: cluster 1(15) per st; fls 2--6(25); lower bracts 5--15 mm, gen > infl, lf-like, +- keeled.
+ 'cluster 1(15) per st' made 'clusters 1(5) per st' [in TJM2; not abbreviated in eFlora]
2013 11 13

p. 1367
(superseded by Supplement III)
JUNCUS covillei
BIOREGIONAL DISTRIBUTION: NW, SN, n CCo, SnFrB, TR;
+ 'CaR,' deleted
2016 06 15

p. 1367
JUNCUS dubius
BIOREGIONAL DISTRIBUTION: KR, NCoRO, CaRF, n&c SNH, ScV, SnFrB, SCoRO, SnGb, PR, DMoj;
+ 'KR,' added
2016 06 15

p. 1368
(superseded by Supplement III)
JUNCUS effusus
FLOWER: perianth parts 1.8--4.2 mm, +- equal, generally pale brown; stamens 3, filaments <= to > anthers.
+ 'filaments > anthers' made 'filaments <= to > anthers'
2014 0902

p. 1368
(superseded by Supplement III)
JUNCUS effusus subsp. austrocalifornicus
SEED: 0.4--0.6 mm, 0.2--0.25 mm wide, asymmetrical, netted, vertical lines more obvious than horizontal.
+ '3.5--5 mm, 2--2.2 mm wide' made '0.4--0.6 mm, 0.2--0.25 mm wide'
2012 09 28

p. 1368
(superseded by Supplement III)
JUNCUS effusus subsp. pacificus
SEED: 0.35--0.6 mm, 0.2--0.25 mm wide, brown, netted, +- asymmetrical.
+ '3.5--4.5 mm, 2--2.8 mm wide' made '0.35--0.6 mm, 0.2--0.25 mm wide'
2012 09 28

p. 1368
(superseded by Supplement III)
JUNCUS exiguus
SEED: 0.35--0.6 mm, 0.2--0.25 mm wide, netted.
+ '3--4 mm, 1.8--2.2 mm widee' made '0.35--0.6 mm, 0.2--0.25 mm wide'
2012 09 28

p. 1368
(superseded by Supplement III)
JUNCUS gerardi subsp. gerardi
+ 'JUNCUS gerardii subsp. gerardii' made 'JUNCUS gerardi subsp. gerardi'
2014 01 14

p. 1370
(superseded by Supplement III)
JUNCUS hesperius
SEED: 0.4--0.6 mm, 0.2--0.3 mm wide, netted.
+ '4--5 mm, 2--2.2 mm wide' made '0.4--0.6 mm, 0.2--0.3 mm wide'
2012 09 28

p. 1371
(superseded by Supplement III)
JUNCUS oxymeris
BIOREGIONAL DISTRIBUTION: KR, NCoRO, NCoRI, CaRF, SN, GV, TR, PR;
+ 'KR,' added
2016 05 24

p. 1372
(superseded by Supplement III)
JUNCUS supiniformis
FRUIT: > perianth, oblong, tip acute to acuminate.
+ ', 3.5--6.1 mm' deleted
2012 03 27

p. 1372
(superseded by Supplement III)
JUNCUS uncialis
FLOWER: perianth parts (4)6(8), 1.7--5.3 mm, sepals gen > petals, dull; stamens 2--3, filaments > anthers, anthers < 0.7 mm.
+ 'perianth parts 4--8' made 'perianth parts (4)6(8)'
2012 09 28

p. 1374
LUZULA
5. Cauline lf tips microscopically gen not thickened or rounded
+ 'Cauline lvs acute, gen not thickened' made 'Cauline lf tips microscopically gen not thickened or rounded'
2012 10 10

p. 1374
LUZULA
5' Cauline lf tips microscopically gen thickened and rounded
+ 'Cauline lvs obtuse, gen thickened' made 'Cauline lf tips microscopically gen thickened and rounded'
2012 10 10

p. 1375
LUZULA parviflora subsp. parviflora
BIOREGIONAL DISTRIBUTION: NW (exc NCoRI), CaRH, SN, Wrn;
+ 'CaRH,' added 
2015 02 27

p. 1375
JUNCAGINACEAE
FLOWER: gen bisexual; perianth parts gen 6 in 2 whorls (0, 1) [3, 4], free, +- green or tinged +- red-purple; stamens 0, 1, 3, or 6, filaments short, +- fused to perianth; pistil 1, carpels 1, 6 [3, 4], +- fused, separating in fr [or not], each with 1 chamber and 1 ovule or 3 carpels fertile, 3 sterile, placentas basal, stigmas gen +- sessile.
+ 'perianth parts gen 6 in 2 whorls (0, 1) [3, 4], free, +- green or tinged +- red-purple' made 'perianth parts gen 6 in 2 whorls (0, 1) [3, 4], free, scale-like, +- green or tinged +- red-purple' [in TJM2; not abbreviated in eFlora]
2014 12 05

p. 1376
CORDYLINE australis
ECOLOGY: Disturbed and/or formerly cult areas;
+ 'Disturbed and/or formerly cult areas;' added
2012 04 04

p. 1378
LILIACEAE
7. Fls 1--7 in terminal clusters, without sharp bend at juncture of peduncle, pedicel; lf base acute to cordate, clasping or not .....-> PROSARTES
+ 'Fls gen >= 2' made 'Fls 1--7' [in TJM2; not abbreviated in eFlora]
2014 12 10

p. 1378
LILIACEAE
7' Fls 1(2) in lf axils, with sharp bend at juncture of peduncle, pedicel; lf base cordate, clasping .....-> STREPTOPUS
+ 'Fls gen 1(2)' made 'Fls 1(2)'  [in TJM2; not abbreviated in eFlora]
2014 12 10

p. 1378
CALOCHORTUS
1' Flower erect to spreading; perianth open, bell- or cup-shaped or +- rotate
+ 'bell-shaped or +- rotate' made 'bell- or cup-shaped or +- rotate'
2019 01 17

p. 1378
CALOCHORTUS
3. Sepal appressed to petals; lower nectary membrane 1/3--2/3 petal width; petal generally white to pink; s CaRF, n&c SN, CW, n ChI, TR, PR .....-> C. albus
+ 'n&c SNF, CW, n ChI, WTR, SnBr, PR' made 's CaRF, n&c SN, CW, n ChI, TR, PR' 
2014 08 07

p. 1378
CALOCHORTUS
3' Sepal spreading, not appressed to petals; lower nectary membrane +- = petal width; petal rose; c&s SN (Madera, Fresno cos.) .....-> C. amoenus
+ 'c SNF (Madera, Fresno cos.), s SN' made 'c&s SN (Madera, Fresno cos.)' 
2014 08 07

p. 1378
CALOCHORTUS
9. Cauline leaves +- 0; s CaRH, SNH .....-> C. minimus
+ 's CaRH,' added 
2014 08 07

p. 1379
CALOCHORTUS
10' Stem generally < 5 cm, generally simple, bulblets present; NW, CaRH, n&c CCo, SnFrB .....-> C. uniflorus
+ 'CaRH,' added 
2014 08 07

p. 1379
CALOCHORTUS
11. Petal deep yellow --- CaRF, sw CaRH, n&c SN .....-> C. monophyllus
+ 'CaRF, n&c SNF, n SNH' made 'CaRF, sw CaRH, n&c SN' 
2014 08 07

p. 1379
CALOCHORTUS
13. Petal obovate to wedge-shaped; stem simple or branched; NW, CaR, n SN, n ScV, n CCo, SnFrB .....-> C. tolmiei
+ 'NW, CaRH, n ScV, n CCo, SnFrB' made 'NW, CaR, n SN, n ScV, n CCo, SnFrB' 
2014 08 07

p. 1379
CALOCHORTUS
24. Nectary +- round, clearly to +- depressed, encircled by fringed membrane
+ 'clearly depressed' made 'clearly to +- depressed'
2014 12 09

p. 1379
CALOCHORTUS
24' Nectary not simultaneously +- round, clearly to +- depressed, encircled by fringed membrane (but occ 1 of these)
+ 'round, depressed, and surrounded by fringed membrane' made '+- round, clearly to +- depressed, encircled by fringed membrane'
2014 12 09

p. 1379
CALOCHORTUS
29. Petal with red or purple arch above nectary; nectary in yellow spot; n SNH, e edges c&s SNH, MP, s SNE .....-> C. bruneaunis
+ 'e edges c&s SNH,' added 
2014 08 07

p. 1380
CALOCHORTUS
39' Petal lavender to deep purple, base generally purple-spotted, not yellow-hairy; c&s NCoRI, w edge SnJV, CW, w SW, SnJt, w edge DSon .....-> C. splendens (2)
+ 'w edge SnJV,' added; ', w edge DSon' added 
2014 08 07

p. 1380
CALOCHORTUS
45. Anther sagittate --- CaRH, SNH, MP, SNE .....-> C. leichtlinii
+ ', SNE' added 
2014 08 07

p. 1380
CALOCHORTUS
53. Nectary hairs orange; petal light yellow basally; basal leaves generally persistent; KR, CaR (The Cove, Shasta Co.) .....-> C. syntrophus
+ 'KR,' added 
2015 08 27

p. 1380
CALOCHORTUS albus
BIOREGIONAL DISTRIBUTION: s CaRF, n&c SN, CW, n ChI, TR, PR.
+ 'n&c SNF, CW, n ChI, WTR, SnBr, PR' made 's CaRF, n&c SN, CW, n ChI, TR, PR' 
2014 08 06

p. 1380
CALOCHORTUS amoenus
BIOREGIONAL DISTRIBUTION: c&s SN (Madera, Fresno cos.).
+ 'c SNF (Madera, Fresno cos.), s SN' made 'c&s SN (Madera, Fresno cos.)'  
2014 08 06

p. 1381
CALOCHORTUS bruneaunis
BIOREGIONAL DISTRIBUTION: n SNH, e edges c&s SNH, MP, s SNE;
+ 'e edges c&s SNH,' added 
2014 08 06

p. 1381
CALOCHORTUS catalinae
BIOREGIONAL DISTRIBUTION: s CCo, s SCoRO, w SCo, esp ChI, w edge WTR, SnGb, n PR.
+ 's SCoRO,' added; ', w edge WTR, SnGb, n PR' added 
2014 08 06

p. 1382
CALOCHORTUS invenustus
BIOREGIONAL DISTRIBUTION: s SNF, c&s SNH, Teh, se SnFrB, SCoR, SW, DMoj.
+ 's SNF,' added 
2014 08 06

p. 1382
CALOCHORTUS leichtlinii
BIOREGIONAL DISTRIBUTION: CaRH, SNH, MP, SNE;
+ ', SNE' added 
2014 08 06

p. 1382
CALOCHORTUS luteus
BIOREGIONAL DISTRIBUTION: c&s NW, CaRH, SNF, ScV, CW, n ChI.
+ 'n ChI.' made 'n ChI;'  
2014 06 03

p. 1382
CALOCHORTUS luteus
DISTRIBUTION OUTSIDE CALIFORNIA: sw OR.
+ 'sw OR.' added 
2014 06 03

p. 1382
CALOCHORTUS luteus
BIOREGIONAL DISTRIBUTION: c&s NW, CaR, SNF, GV, CW, n ChI.
+ 'c&s NW, CaRH, SNF, ScV, CW, n ChI' made 'c&s NW, CaR, SNF, GV, CW, n ChI' 
2014 08 06

p. 1382
CALOCHORTUS minimus
BIOREGIONAL DISTRIBUTION: s CaRH, SNH.
+ 's CaRH,' added 
2014 08 06

p. 1382
CALOCHORTUS monophyllus
BIOREGIONAL DISTRIBUTION: CaRF, sw CaRH, n&c SN;
+ 'CaRF, n&c SNF, n SNH' made 'CaRF, sw CaRH, n&c SN' 
2014 08 06

p. 1382
CALOCHORTUS nudus
BIOREGIONAL DISTRIBUTION: KR, CaRH, n SNH;
+ 'KR, CaRH' made 'KR, CaRH, nSNH' 
2015 02 17

p. 1383
CALOCHORTUS obispoensis
BIOREGIONAL DISTRIBUTION: c CCo (e of Morro Bay), s SCoRO (San Luis Obispo Co.).
+ 'c CCo (e of Morro Bay),' added 
2014 08 06 ['of Morro Bay' added 2016 02 19]

p. 1383
CALOCHORTUS plummerae
BIOREGIONAL DISTRIBUTION: SCo, TR, PR.
+ 'TR,' added 
2014 08 06

p. 1383
CALOCHORTUS splendens
BIOREGIONAL DISTRIBUTION: c&s NCoRI, w edge SnJV, CW, w SW, SnJt, w edge DSon;
+ 'w edge SnJV,' added; ', w edge DSon' added 
2014 08 06

p. 1383
CALOCHORTUS striatus
BIOREGIONAL DISTRIBUTION: s SNF, w DMoj;
+ 's SNF,' added 
2014 08 06

p. 1383
CALOCHORTUS superbus
FLOWER: perianth bell-shaped, base narrowed, parts centrally dark-blotched in bright yellow zone; sepals 20--40 mm; petals 20--40 mm, white to +- yellow or lavender, generally purple-lined near base, sparsely short-hairy near nectary, nectary not depressed, 1 crescent or chevron densely short-brown-hairy; filaments 7--9 mm, slender to dilated below, anthers 8--10 mm, lance-linear to -oblong, acute to obtuse, white to light yellow.
+ 'perianth bell-shaped, based narrowed' made 'perianth bell-shaped, base narrowed'
2013 08 05

p. 1384
CALOCHORTUS syntrophus
BIOREGIONAL DISTRIBUTION: KR, CaR (The Cove, Shasta Co.).
+ 'KR,' added 
2015 06 12

p. 1384
CALOCHORTUS tolmiei
BIOREGIONAL DISTRIBUTION: NW, CaR, n SN, n ScV, n CCo, SnFrB;
+ 'NW, CaRH, n ScV, n CCo, SnFrB' made 'NW, CaR, n SN, n ScV, n CCo, SnFrB; 
2014 08 06

p. 1384
CALOCHORTUS uniflorus
COMMON NAME: PINK STAR-TULIP
+ 'LARGE-FLOWERED MARIPOSA LILY' made 'PINK STAR-TULIP'
2013 08 05

p. 1384
CALOCHORTUS uniflorus
BIOREGIONAL DISTRIBUTION: NW, CaRH, n&c CCo, SnFrB;
+ 'CaRH,' added 
2014 08 07

p. 1384 
CALOCHORTUS venustus
BIOREGIONAL DISTRIBUTION: SNF, c&s SNH, Teh, CW, WTR, SnGb.
+ 's SNH' made 'c&s SHN' 
+ 'Teh,' added 
2014 08 07

p. 1386
ERYTHRONIUM californicum
BIOREGIONAL DISTRIBUTION: KR, NCoR.
+ ', CaRH' deleted
2015 08 12

p. 1387
ERYTHRONIUM multiscapideum
BIOREGIONAL DISTRIBUTION: KR, CaR, n&c SNF, n SNH.
+ 'KR,' added; 'CaRF' made 'CaR'; ', n SNH' added 
2015 08 12

p. 1388
FRITILLARIA
12. Perianth generally > 2 cm, generally clearly yellow- or purple-mottled, margins wavy --- NW, CaRF, n SNF, CW (except SCoRI) .....-> F. affinis
+ 'CaR' made 'CaRF' 
2015 08 31

p. 1388
FRITILLARIA
13. Style branches not or +- recurved; perianth +- green to yellow to red, tips generally recurved or flared; nectary green, gold, or yellow; KR, CaR (Shasta, Tehama, Butte cos.) .....-> F. eastwoodiae
+ 'KR,' added 
2015 08 31

p. 1388
FRITILLARIA affinis
BIOREGIONAL DISTRIBUTION: NW, CaRF, n SNF, CW (exc SCoRI);
+ 'CaR' made 'CaRF' 
2015 08 12

p. 1388
FRITILLARIA agrestis
ECOLOGY: Clay, often vertic, occ serpentine;
+ 'Clay (gen serpentine) banks, depressions' made 'Clay, often vertic, occ serpentine' [in TJM2; not abbreviated in eFlora]
2015 12 03

p. 1390
FRITILLARIA eastwoodiae
BIOREGIONAL DISTRIBUTION: KR, CaR (Shasta, Tehama, Butte cos.).
+ 'KR,' added 
2015 08 12

p. 1390
FRITILLARIA ojaiensis
BIOREGIONAL DISTRIBUTION: s SCoRO (San Luis Obispo, Santa Barbara cos.), WTR (Ventura Co.).
+ 's SCoRO (San Luis Obispo, Santa Barbara cos.),' added 
2014 12 12

p. 1390
FRITILLARIA ojaiensis
NOTE: _F. affinis_ sometimes misidentified as _F. ojaiensis_.
+ 'Possibly closely related to _F. affinis_.' made '_F. affinis_ sometimes misidentified as _F. ojaiensis_.' [in TJM2; not abbreviated in eFlora]
2014 12 12

p. 1390
FRITILLARIA viridea
ECOLOGY: Shrub understory, serpentine;
+ 'Serpentine slopes' made 'Shrub understory, serpentine'
2015 12 03

p. 1390
LILIUM
FLOWER: generally radial, generally bell- or funnel-shaped; perianth parts 6 in 2 petal-like whorls, +- lanceolate, base narrowed, generally red-purple-spotted adaxially; stamens 6, gen exceeding to much exceeding perianth, anthers attached at middle (measures are after dehiscence); style 1, stigma 3-lobed.
+ 'gen exceeding to much exceeding perianth,' added after 'stamens 6,'
2013 10 10

p. 1391
LILIUM
4' Perianth aging +- white (light pink); perianth 7.9--11.3 cm; KR, CaR, SN .....-> subsp. washingtonianum
+ 'KR,' added 
2015 08 31

p. 1391
LILIUM bolanderi
FLOWER: narrowly bell-shaped, not fragrant; perianth parts 3--4.7 cm, +- recurved in distal 20--40%, red or magenta (salmon, pale yellow), adaxially basal 30--50% often +- yellow; stamens exceeded by to held at same level as perianth, filaments +- parallel, anthers 3--8 mm, +- red or magenta, pollen red-brown, orange, or yellow; pistil 2--3.5 cm.
+ 'stamens <= perianth' made 'stamens exceeded by to held at same level as perianth'
2013 10 10

p. 1391
LILIUM columbianum
FLOWER: widely bell-shaped, not fragrant; perianth parts 3.4--7.1 cm, reflexed in distal 50--60%, orange (often +- red abaxially); stamens +- exceeding perianth, filaments spreading, anthers 5--13 mm, +- yellow, pollen orange or yellow; pistil 2.4--3.7 cm.
+ 'stamens +- > perianth' made 'stamens +- exceeding perianth'
2013 10 10

p. 1391
LILIUM humboldtii
FLOWER: +- widely bell-shaped, not fragrant; perianth parts generally 5.6--9.5 cm, reflexed in distal 80%, orange or yellow, adaxially ridged basally; filaments diverging widely, anthers 11--19 mm, purple, pollen red-brown to tan-yellow; pistil 4.5--7.1 cm.
+ 'stamens >> perianth,' deleted
2013 10 10

p. 1392
LILIUM kelleyanum
FLOWER: +- widely bell-shaped, mild-fragrant; perianth parts 4.2--6 cm, reflexed in distal 60%, yellow or yellow-orange; filaments diverging, anthers 3--6 mm, magenta or dull red, pollen orange, tan-orange, or red-brown; pistil 2.5--3.5 cm.
+ 'stamens > perianth,' deleted
2013 10 10

p. 1392
LILIUM kelloggii
FLOWER: +- widely bell-shaped, fragrant; perianth parts 3.2--7.2 cm, reflexed in distal 67%, pink to white, generally aging pink, midrib yellow; filaments diverging, anthers 5--14 mm, pale red-orange or magenta, pollen orange; pistil 2.9--4 .2 cm.
+ 'stamens > perianth,' deleted
2013 10 10

p. 1392
LILIUM maritimum
FLOWER: bell-shaped, not fragrant; perianth parts 3.4--5 cm, elliptic, reflexed or rolled in distal 20--50%, red or red-orange, darker spots concentrated mid-basally, surrounded by light orange (or yellow-green); stamens held at same level as perianth, filaments +- parallel, anthers 4--12 mm, light magenta, pollen orange; pistil 2.2--3.2 cm.
+ 'stamens = perianth' made 'stamens held at same level as perianth'
2013 10 10

p. 1392
LILIUM occidentale
FLOWER: +- widely bell-shaped, not fragrant; perianth parts 4.3--8.1 cm, reflexed in distal 60%, +- 2-toned, adaxially red to maroon (orange) on distal 50--60%, base yellow to green, with a band of orange or yellow between or not, abaxially strongly green on basal 40--50%; filaments +- parallel, anthers 5--14 mm, dull red or magenta, pollen generally red-brown (+- orange); pistil 3--5.5 cm.
+ 'stamens > perianth,' deleted
2013 10 10

p. 1392
LILIUM pardalinum
FLOWER: +- widely bell-shaped, generally not fragrant; perianth parts 3.4--10.4 cm, reflexed in distal 67--75%, generally +- 2-toned, adaxially generally pale orange to red on distal 25--60%, lighter near base, with maroon spots near tip margined yellow or orange, abaxially paler and green on basal +- 20%; filaments +- widely diverging, anthers 6--2.2 mm, +- magenta to orange or yellow, turning darker, pollen red-brown to yellow, turning lighter; pistil 3--8 cm.
+ 'stamens > or >> perianth,' deleted
2013 10 10

p. 1392
LILIUM pardalinum
FLOWER: +- widely bell-shaped, generally not fragrant; perianth parts 3.4--10.4 cm, reflexed in distal 67--75%, generally +- 2-toned, adaxially generally pale orange to red on distal 25--60%, lighter near base, with maroon spots near tip margined yellow or orange, abaxially paler and green on basal +- 20%; filaments +- widely diverging, anthers 5--22 mm, +- magenta to orange or yellow, turning darker, pollen red-brown to yellow, turning lighter; pistil 3--8 cm.
+ 'anthers 6--2.2 mm' made 'anthers 5--22 mm'
2014 07 02

p. 1392
LILIUM parryi
FLOWER: generally +- bilateral, funnel-shaped, strongly fragrant; perianth parts 7.7--10.7 cm (inner wider), +- oblanceolate, recurved in distal 40%, bright yellow, maroon spots generally sparse, minute; stamens +- exceeding perianth, filaments +- parallel, anthers 8--14 mm, pale magenta-brown, pollen rusty- or brown-orange; pistil 5.3--9.3 cm.
+ 'stamens +- > perianth' made 'stamens +- exceeding perianth'
2013 10 10

p. 1392
LILIUM parvum
FLOWER: +- bilateral or not, +- funnel-shaped, not fragrant; perianth parts 3.2--4.2 cm (outer wider), +- recurved in distal 33--40%, adaxially light orange to red (+- pink) on distal 40%, lighter near base, uniformly light orange or not (yellow), abaxially paler; stamens +- exceeding perianth, filaments +- diverging, anthers 3--8 mm, pale yellow, +- orange, or magenta, pollen +- yellow to red-orange; pistil 2.3--3.7 cm.
+ 'stamens +- > perianth' made 'stamens +- exceeding perianth'
2013 10 10

p. 1392
LILIUM rubescens
FLOWER: funnel-shaped, fragrant; perianth parts 4.2--6.6 cm (inner wider, strongly oblanceolate), recurved in distal 33--50%, adaxially white, turning pink-purple, magenta spots minute, abaxially often +- red or +- purple; stamens held at same level as perianth, filaments +- parallel except distally, anthers 4--8 mm, pale yellow, pollen yellow; pistil 2.7--3.8 cm.
+ 'stamens = perianth' made 'stamens held at same level as perianth'
2013 10 10

p. 1392
LILIUM washingtonianum
FLOWER: generally +- bilateral, +- funnel-shaped, strongly fragrant; perianth parts generally 6.2--11.3 cm (inner wider, strongly oblanceolate), recurved in distal 25--33%, white, turning deep pink or not, magenta spots minute; stamens +- exceeding perianth, filaments +- parallel, anthers 8--15 mm, off-white or cream, pollen yellow or cream; pistil 7.5--10.4 cm.
+ 'stamens +- > perianth' made 'stamens +- exceeding perianth'
2013 10 10

p. 1394
LILIUM washingtonianum subsp. washingtonianum
BIOREGIONAL DISTRIBUTION: KR, CaR, SN.
+ 'KR,' added 
2015 08 19

p. 1394
STREPTOPUS
INFLORESCENCE: fls 1(2) in lf axils, with sharp bend at juncture of peduncle, pedicel.
+ 'fls gen 1(2) in lf axils' made 'fls 1(2) in lf axils'  [in TJM2; not abbreviated in eFlora]
2014 12 10

p. 1395
TOXICOSCORDION
TOXICITY: All taxa highly TOXIC (gen unpalatable) to livestock, humans from alkaloids (esp in bulbs).
+ 'All taxa highly TOXIC (gen unpalatable) to livestock, humans from alkaloids (esp in bulbs); caused serious illness to some members of Lewis and Clark Expedition.' made 'All taxa highly TOXIC (gen unpalatable) to livestock, humans from alkaloids (esp in bulbs).'
2014 04 22 [on 2014 04 22, '; caused serious illness to some members of Lewis and Clark Expedition' deleted from this entry; on 2013 01 07, it was deleted from eFlora but not actually deleted from corrected statement in original listing of this entry (which was posted on 2013 01 07)]

p. 1397
TRILLIUM
3. Stamens < 1.25 &times; pistil; fl odor gen musty or fetid; w KR, SN (exc Teh), s CCo, SCoRO .....-> T. angustipetalum
+ 'ovary' made 'pistil'
2013 03 15

p. 1397
TRILLIUM
3' Stamens +- 2 &times; pistil; fl odor gen sweet rose-like or +- spicy; NW, CaR, n SN, SnFrB
+ 'ovary' made 'pistil'
2013 03 15

p. 1397
TRILLIUM
4' Ovary, tissue between anther sacs purple; petals yellow to pink to dark purple, occasionally white; KR, NCoRI, SnFrB .....-> T. chloropetalum
+ 'KR,' added 
2015 08 26

p. 1397
TRILLIUM
4' Ovary, tissue between anther sacs purple; petals yellow to pink to dark purple, occasionally white; KR, NCoRI, CCo, SnFrB .....-> T. chloropetalum
+ 'CCo,' added
2016 07 26

p. 1397
TRILLIUM chloropetalum
BIOREGIONAL DISTRIBUTION: KR, NCoRI, SnFrB.
+ 'KR,' added 
2015 08 26

p. 1397
TRILLIUM chloropetalum
BIOREGIONAL DISTRIBUTION: KR, NCoRI, CCo, SnFrB.
+ 'CCo,' added
2016 07 26

p. 1398
ORCHIDACEAE
NOTE: _Platanthera_ may be paraphyletic without inclusion of _Piperia_ (Bateman et al. 2009 Ann Bot 104:431--445); study needed.
+ NOTE added
2013 08 05

p. 1401
CYPRIPEDIUM fasciculatum
BIOREGIONAL DISTRIBUTION: NW, n SN, sw SnFrB;
+ 'CaR,' deleted 
2015 06 16

p. 1402
PIPERIA
1. Spur 6--18 mm (2.5--9 mm in _Piperia cooperi_, keyed only under 1')
+ '(2.5--9 mm in _Piperia cooperi_, keyed only under 1')' added
2014 12 09

p. 1404
PIPERIA candida
LEAF: basal 5--18 cm, 11--35 mm wide.
+ 'cm' added
2014 10 01

p. 1404
PIPERIA cooperi
FLOWERING TIME: Mar--Jun
+ 'Jun--Aug' made 'Mar--Jun'
2015 05 28

p. 1404
PIPERIA michaelii
LEAF: basal 7--30 cm, 10--40(65) mm wide.
+ '78--30 cm' made '7--30 cm'
2014 12 09

p. 1404
PIPERIA yadonii
FLOWER: fragrant in daytime, harsh to honey-like; upper sepal green with white margin, +- erect, lower white, midvein faintly green; lateral petals +- erect, sickle-shaped, green, white margins unequal, outer much wider than inner, lip 2.5--5 mm, lance-deltate, pointed down toward spur, white, spur 2.5--5 mm, pointed down.
+ 'spur 2.5--5, pointed down' made 'spur 2.5--5 mm, pointed down' 
2015 03 04

p. 1405
PLATANTHERA yosemitensis
BIOREGIONAL DISTRIBUTION: c SNH (Yosemite National Park), s SNH.
+ ', s SNH' added 
2014 07 30

p. 1405
POACEAE 
FRUIT: grain, sometimes achene- or utricle-like.
+ 'grain (rarely achene-like)' made 'grain, sometimes achene- or utricle-like'
2013 09 25

p. 1406
POACEAE
1. Lf blade base constricted above sheath, forming false petiole; st woody .....-> [PHYLLOSTACHYS]
+ 'Lf base constricted to form false petiole' made 'Lf blade base constricted above sheath, forming false petiole'
2012 04 04

p. 1406
POACEAE
1' Lf blade base not constricted, not forming false petiole, forming open or closed tubular sheath; st gen herbaceous
+ 'Lf base forming open or closed tubular sheath' made 'Lf blade base not constricted, not forming false petiole, forming open or closed tubular sheath'
2012 04 04

p. 1406
POACEAE
4' Lf blades gen soft, rounded to acute, but not sharp-pointed (exc _Blepharidachne_, _Munroa_), not conspicuously arranged in 2 vertical rows (exc _Muhlenbergia asperifolia_)
+ '(exc _Muhlenbergia asperifolia_)' added
2012 03 27

p. 1408
POACEAE 
29. Annual or short-live perennial herb without stolons or rhizomes; upper floret compressed side-to-side; naturalized, disturbed areas, slopes, NCoRO, SnJV, s CCo, SCoRO, SCo, WTR, PR .....-> MELINIS
29' Perennial herb from stolons or rhizomes; upper floret compressed front-to-back; native, sandy soils, dunes, e SCo, D .....-> Panicum urvilleanum
+ couplet inserted after 28'; the number of each couplet from 29 through 59 increased by 1, making them 30 through 60
2013 11 07

p. 1408 [location or approximate location where lead would appear in TJM2 had it been added before the most recent printing of TJM2; as it is, the lead is present only in eFlora]
POACEAE
29' Perennial herb from stolons or rhizomes; upper floret compressed front-to-back; native, sandy soils, dunes, e SCo, D .....-> Panicum urvilleanum
+ 'ret compressed front-to-back; native, sandy soils, dunes, e SCo, D .....-> Panicum urvilleanum' deleted (duplicate text deleted after having been mistakenly added to the end of the lead, probably in the action of 2013 11 07)
2018 02 07

p. 1409
POACEAE, Group 2
6. Inflorescence spike-like; spikelet bases +/- embedded in 1 side of flattened, thickened axis -----> STENOTAPHRUM
6' Inflorescence panicle-like or a series of paired, digitate, or racemose branches; spikelets not embedded, on 1 or more sides of rounded, unthickened axes
+ couplet inserted after 1'; the number of each couplet from 6 through 10 increased by 1, making them 7 through 11
2013 11 07

p. 1410
POACEAE, Group 3
9. Glume 1 (exc in uppermost spikelets; 0 in _Elymus californicus_)
+ '(exc in uppermost spikelets)' made '(exc in uppermost spikelets; 0 in _Elymus californicus_)' [in TJM2; not abbreviated in eFlora]
2013 11 08

p. 1412
POACEAE, Group 6
4' Lemma awned (sometimes awnless in _Avena sativa_)
+ '(sometimes awnless in _Avena sativa_)' added 
2013 11 08

p. 1412
POACEAE, Group 6
26' Lf sheath open for at least 1/2 its length (exc in _Festuca rubra_); spikelet gen < 1 cm; lemma tip entire, occ minutely 2-toothed; ovary tip glabrous or hairy .....-> FESTUCA (2)
+ 'lemma tip entire' made 'lemma tip entire, occ minutely 2-toothed' [in TJM2; not abbreviated in eFlora]
+ 'ovary tip glabrous' made 'ovary tip glabrous or hairy'
2013 10 30

p. 1415
AGROSTIS elliottiana
BIOREGIONAL DISTRIBUTION: KR, NCoRI, CaRF, n SNF, n ScV;
+ 'KR,' added 
2015 06 12

p. 1415
AGROSTIS humilis
HABIT+: Per, cespitose, occ rhizomatous; 56--50 cm, erect to ascending.
+ '56--50 cm' made '5--50 cm'
2012 08 20

p. 1416
AGROSTIS stolonifera
BIOREGIONAL DISTRIBUTION: NW, CaR, n SNF, SNH, SN, CW, SW (exc ChI), SNE, DMtns;
+ 'n SN' made 'n SNF, SNH'; 'W&I' made 'SNE' 
2014 07 29

p. 1419
ANTHOXANTHUM aristatum subsp. aristatum
BIOREGIONAL DISTRIBUTION: NW, CCo, SnFrB;
+ 'NCo, NCoR, n CaRF, CCo, SnFrB;' made 'NW, CCo, SnFrB;' 
2015 06 12

p. 1419
ANTHOXANTHUM odoratum
BIOREGIONAL DISTRIBUTION: NCo, KR, NCoRO, NCoRI, n&c SN, CCo, SnFrB;
+ 'KR,' added 
2015 06 12

p. 1421
ARRHENATHERUM elatius
WEEDINESS: Potentially problematic weed
+ 'Potentially problematic weed' added [to replace removed broken diamond symbol in TJM2 (as an addition to existing note), and 'Weed listed by Cal-IPC' in eFlora]
2013 08 06

p. 1422
ARUNDO donax
BIOREGIONAL DISTRIBUTION: NCo, KR, c SNF, GV, CCo, SCoR, SCo, SnGb, D;
+ 'KR,' added 
2015 06 12

p. 1423
middle left of plate
+ 'Anthoxanthum nitens subsp. nitens' made 'Anthoxanthum odoratum'
2013 11 20

p. 1423
middle of plate
+ 'Anthoxanthum odoratum' made 'Anthoxanthum nitens subsp. nitens'
+ 'spikelet' deleted
+ 'glume' made 'sterile floret' (in 2 places)
2013 11 20

p. 1423
middle of plate (for Anthoxanthum occidentale)
+ 'spikelet' deleted
+ 'glume' made 'sterile floret' (in 2 places)
2013 11 20

p. 1426
BRIZA maxima
BIOREGIONAL DISTRIBUTION: NW, w CaR, n SN, ScV, CW (exc SCoRI), SCo, WTR, PR (upper San Diego River), ne MP;
+ 'NCo, NCoRO, n SNF, n CCo, n&c SCoRO, n SCo' made 'NW, w CaR, n SN, ScV, CW (exc SCoRI), SCo, WTR, PR (upper San Diego River), ne MP' 
2014 03 13

p. 1426
BRIZA minor
BIOREGIONAL DISTRIBUTION: NW, CaRF, SN, GV, CW (exc SCoRI), SCo, WTR, PR, DSon (Rancho Mirage);
+ 'NCo, NCoRO, n&c SNF, s ScV, n SnJV, CCo, SnFrB, n SCoRO, DSon (Rancho Mirage)' made 'NW, CaRF, SN, GV, CW (exc SCoRI), SCo, WTR, PR, DSon (Rancho Mirage)' 
2014 03 13

p. 1426
BROMUS
6' Inflorescence loose to compact, at least some pedicels > spikelets; spikelets not crowded or overlapping, stalk often visible; stem 30--120 cm, erect; stem, leaves often hairy; ligule generally < 4 mm
+ 'stem 50--120 cm' made 'stem 30--120 cm'
2014 08 09

p. 1429
NATURALIZED
BROMUS berteroanus
+ 'NATIVE' made 'NATURALIZED' [font in TJM2 changed from that indicating NATIVE to that indicating NATURALIZED]
2012 04 10

p. 1429
BROMUS berteroanus
HABIT+: Ann 30--60 cm, often tufted.
+ '15--20' made '30--60'
2012 08 21

p. 1429
BROMUS berteroanus
SPIKELET: 15--20 mm, not strongly flattened; glumes glabrous, lower 8--16 mm, 1(3)-veined, upper 10--18 mm, 3(5)-veined; florets 3--9; lemma 6--15 mm, back rounded, hairy, teeth 1--3 mm, awn-like to acuminate, awn (7)14--22 mm, bent, twisted below middle.
+ 'teeth 3--5 mm, awn-like' made 'teeth 1--3 mm, awn-like'
2012 08 21

p. 1429
BROMUS catharticus var. catharticus
SPIKELET: 15--30 mm; glumes glabrous, scabrous, or occ hairy, lower 6--12 mm, upper 8--14 mm, 5--7(9)-veined; lemma 10--17 mm, glabrous or slightly hairy, veins (9)11--13-veined, prominent for most of their length; awn 0--3.5 mm; anthers 0.5--1.3 mm.
+ 'awn 0.5--3.5 mm' made 'awn 0--3.5 mm'
2013 02 22

p. 1430
BROMUS madritensis subsp. madritensis
FLOWERING TIME: Apr--Jun
+ 'Jan' made 'Jun'
2012 03 27

p. 1430
BROMUS maritimus
HABIT+: Perennial herb 20--80 cm.
+ '22--80' made '20--80'
2014 08 09
	
p. 1430
BROMUS maritimus
INFLORESCENCE: 9--20 cm, dense, spikelets overlapping; branches ascending to erect, < spikelets.
+ '45--150 cm' made '9--20 cm'
2014 07 08

p. 1431
BROMUS sterilis
SPIKELET: 20--35 mm, not strongly flattened; glumes glabrous or scabrous, upper 7.5--21 mm, 3(5)-veined, lower 6--14 mm, 1(3)-veined; florets 6--11; lemma 13--20 mm, back rounded, glabrous to scabrous, teeth 1--3 mm, awn 15--30 mm, straight; anthers 0.5--2 mm.
+ 'teeth 0--22 mm' made 'teeth 1--3 mm' [was incorrectly made 'teeth 0--2 mm' on 2019 01 17]
2019 01 29

p. 1432
CALAMAGROSTIS
12' Glumes scabrous across entire surface, rarely smooth, projections along keel often bent, tips acuminate; spikelets (3.5)4--4.5(5.2) mm .....-> var. _langsdorffii_
+ '_langsdorfii_' made '_langsdorffii_'
2012 03 27

p. 1432
CALAMAGROSTIS canadensis (Michx.) P. Beauv. var. langsdorffii
+ '_langsdorfii_' made '_langsdorffii_'
2012 04 04

p. 1436
CORTADERIA
+ delete 'COMMON NAME: PURPLE PAMPAS GRASS, JUBATA GRASS'
2012 03 27
p2

p. 1436
CRYPSIS
FRUIT: utricle-like, when wet gelatinous with seed emergent from split ovary wall.
+ entire FRUIT statement added
2013 09 25

p. 1436
CRYPSIS alopecuroides
INFLORESCENCE: 15--65 mm, 4--6 mm wide, cylindric, exserted from subtending sheath.
+ '15--65 cm' made '15--65 mm'
2013 11 15

p. 1436
CRYPSIS schoenoides
BIOREGIONAL DISTRIBUTION: KR, NCoRI, CaR, n SNF, GV, CW, SCo, WTR, SnGb, PR, MP, w DMoj;
+ 'KR,' added 
2015 06 16

p. 1436
CRYPSIS vaginiflora
UNABRIDGED SYNONYMS: Crypsis niliaca Fig. & De Not.
+ 'niliacea' made 'niliaca' [in eFlora; unabridged synonyms not in TJM2]
2014 03 14

p. 1436
CORTADERIA jubata
COMMON NAME: PURPLE PAMPAS GRASS, JUBATA GRASS
+ COMMON NAME added
2012 03 27
p2

p. 1437
DACTYLOCTENIUM
FRUIT: utricle-like, seed falling free from outer wall.
+ 'utricle' made 'utricle-like'
2014 07 24

p. 1440
DESCHAMPSIA danthonioides
BIOREGIONAL DISTRIBUTION: CA-FP (exc Teh, n ChI), MP, DMoj (uncommon);
+ 'uncommon DMoj' made 'DMoj (uncommon)'
2015 12 17

p. 1441
DISSANTHELIUM californicum
NOTE: Presumed extinct in TJM (1993); rediscovered on Santa Catalina Island in 2005, on San Clemente Island in 2010.
+ 'Believed extirpated on San Clemente Island' made 'Presumed extinct in TJM (1993)'
2012 03 27

p. 1441
DISTICHLIS
SPIKELET: unisexual; pistillate generally = staminate, generally laterally compressed; glumes unequal (0), firm, awns 0, lower 3(5)-veined, upper 5--7(9)-veined; axis breaking above glumes and between florets; florets 3--20; lemma wide narrowing to acuminate tip, 7--11-veined, awn 0; palea +- = lemma; keel minutely hairy or scabrous.
+ 'palea < or > lemma' made 'palea +- = lemma'

p. 1441
DISTICHLIS littoralis
SPIKELET: 8--13 mm, generally concealed by leaves; glumes 0; lemma veins 7--9; florets 3--5, 1--2 fertile, sterile above; lower lemma firmly enclosing flower and fruit.
+ '; palea +- = lemma' deleted
2019 01 15

p. 1441
DISTICHLIS spicata
BIOREGIONAL DISTRIBUTION: NCo, KR, NCoRI, NCoRO, CaR, SN, GV, CW, SW, GB (exc Wrn, W&I), D (exc DMtns);
+ 'KR,' added; 'NCoRO, CaR,' added 
2015 08 11

p. 1441
DISTICHLIS spicata
SPIKELET: 2--20 per inflorescence, 6--20(25) mm, straw-colored to +- purple; glumes 2, 1.5--4 mm; florets 5--15; lemma 3--6 mm; keel ciliate in pistillate florets.
+ 'palea +- = lemma,' deleted
2019 01 15

p. 1442
ECHINOCHLOA
1. Lower lemma generally unawned; spikelets, especially those near the base of inflorescence, not breaking free at maturity; upper lemma > upper glume in length, width .....-> [E. esculenta]
+ 'upper lemma wider, > upper glume at maturity, exposed at maturity' made 'upper lemma > upper glume in length, width'
2013 11 19

p. 1442
ECHINOCHLOA
1' Lower lemma often awned; spikelets breaking free at maturity; upper lemma < to +- > upper glume in length, width
+ 'upper lemma not or scarcely exceeding upper glume in length and width at maturity' made 'upper lemma < to +- > upper glume in length, width'
2013 11 19

p. 1442
ECHINOCHLOA colona
SPIKELET: 2--3 mm, 1--1.5 mm wide, pubescent to strigose; lower glume 1--1.5 mm; upper glume +- = spikelet; florets +- equal; lower floret sterile (staminate); lower lemma unawned; upper lemma with a strongly differentiated, early withering tip; palea +- = lemma.
+ 'upper lemma +- = upper glume with a strongly differentiated, early withering tip' made 'upper lemma with a strongly differentiated, early withering tip'
2013 11 19

p. 1442
ECHINOCHLOA colona
BIOREGIONAL DISTRIBUTION: e KR, e NCoRI, s SNF, n SNH, GV, CCo, s SnFrB, SW, n DMtns, DSon;
+ 'e KR,' added; 'CaR,' deleted 
2015 08 11

p. 1442
ECHINOCHLOA crus-pavonis (Kunth) Schult. var. crus-pavonis
SPIKELET: 2.5--3.4 mm, 1.2--1.4 mm wide; lower glume 1--1.75 mm; upper glume +- = spikelet; lower floret +- = upper, sterile; lower lemma awn (0)3--10(15) mm, curved; upper lemma narrowly elliptic, acute or obtuse, with a well-differentiated, early-withering tip; lower palea > 1/2 lower lemma length.
+ 'upper lemma narrowly elliptic, not or scarcely > upper glume, acute or obtuse, with a well-differentiated, early-withering tip' made 'upper lemma narrowly elliptic, acute or obtuse, with a well-differentiated, early-withering tip'
2013 11 19

p. 1442
SPIKELET: 3.7--7 mm, 2--2.5 mm wide, broadly ovate to ovate; lower glume 0.9--2.8(4) mm, upper glume +- = spikelet; lower floret slightly < upper, sterile; lower lemma +- = spikelet, awn generally to 5 cm; upper lemma broadly elliptic with +- green tip; lower palea well developed.
+ ', upper lemma +- = to upper glume, broadly elliptic with +- green tip' made '; upper lemma broadly elliptic with +- green tip'
2013 11 19

p. 1444
ELEUSINE
FRUIT: utricle-like, seed free from thin ovary wall.
+ 'utricle' made 'utricle-like'
2013 09 25

p. 1444
ELYMUS
SPIKELET: compressed laterally, glumes gen lanceolate to awn-like, occ 0, awned from tip or not; florets 1--11; breaking apart above glumes and between florets; lemma gen > glumes, gen rounded, 5--7-veined, tip acute to awned, awn straight or curved outward; palea <, =, or > lemma or 0; anthers 3(1), 1--8 mm.
+ 'lemma ... tip acute to awned' made 'lemma ... tip gen acute to awned'
2013 02 26

p. 1444
ELYMUS
NOTE: References to number of spikelets per node is best understood as "most, if not all" and best determined by examining nodes in middle of infl. Intergeneric and interspecific hybrids, along with effects of soil moisture on pl growth, render keys even more challenging and frustrating than usual. As treated here, genus incl taxa previously assigned to _Agropyron_ (in part), _Elytrigia_, _Leymus_, _Pascopyrum_, _Pseudoroegneria_, and _Taeniatherum_. _Elymus &times;aristatus_ Merr., _Elymus arizonicus_ (Scribn. & J.G. Sm.) Gould, _Elymus canadensis_ L., _Elymus interruptus_ Buckley, _Agropyron junceum_ (L.) P. Beauv. [_Thinopyrum junceum_ (L.) &Aacute;. L&ouml;ve], and _Elymus pycnanthus_ (Godr.) Melderis [_Thinopyrum pycnanthum_ (Godr.) Barkworth] have been reported for CA, may occur sporadically, but do not appear to have become naturalized. Intergeneric hybrids involving _Hordeum_ constitute the genus &times;_Elyhordeum_ and are cited in spp. descriptions.  _Elymus farctus_ (Viv.) Melderis subsp. _boreo-atlanticus_ (Simonet & Guin.) Melderis [_Elytrigia juncea_ (L.) Nevski subsp. _boreo-atlantica_ (Simonet & Guin.) Hylander] naturalized, under eradication at Oceano Dunes.
+ '_Elytrigia juncea_ (L.) Nevski subsp. _boreali-atlantica_ (Simonet & Guin.) Hylander,' deleted (from list of taxa that do not appear to have become naturalized)
+ 'Intergeneric hybrids involving _Hordeum_ constitute the genus &times;_Elyhordeum_. They are cited in spp. descriptions.' made 'Intergeneric hybrids involving _Hordeum_ constitute the genus &times;_Elyhordeum_ and are cited in spp. descriptions.'
+ '_Elymus farctus_ (Viv.) Melderis subsp. _boreo-atlanticus_ (Simonet & Guin.) Melderis [_Elytrigia juncea_ (L.) Nevski subsp. _boreo-atlantica_ (Simonet & Guin.) Hylander] naturalized, under eradication at Oceano Dunes.' added
2012 08 17

p. 1447 [location where UNABRIDGED SYNONYMS would appear in TJM2 were they not unabridged and therefore only in eFlora]
ELYMUS spicatus
UNABRIDGED SYNONYMS: Agropyron spicatum (Pursh) Scribn. & J.G. Sm.; &times
+ '; _Pseudelymus saxicola_ (Scribn. & J.G. Sm.) Barkworth & D.R. Dewey; Agropyron saxicola (Scribn. & J.G. Sm.) Piper' deleted
2015 06 29

p. 1446
ELYMUS glaucus subsp. glaucus
LEAF: sheath, blade +- glabrous, scabrous, or sparsely to densely hairy.
+ 'sheath, blade +- glabrous or scabrous' made 'sheath, blade +- glabrous, scabrous, or sparsely to densely hairy'
2016 07 07

p. 1447
ELYMUS scribneri
SPIKELET: 9--15 mm, appressed or ascending; glumes 4--9 mm, awn 10--30 mm, curving strongly outward; florets 2--12; lemma 7--10 mm, awn 15--30 mm, curving outward; palea > lemma; anthers 1--1.6 mm.
+ 'pales > lemma;' made 'palea > lemma;'
2018 07 10

p. 1447
ELYMUS spicatus
NOTE: If recognized taxonomically, hybrids with _Elymus elymoides_ assignable to _Elymus &times;saxicola_ Scribn. & J.G. Sm. (_Pseudelymus saxicola_ (Scribn. & J.G. Sm.) Barkworth & D.R. Dewey; _Agropyron saxicola_ (Scribn. & J.G. Sm.) Piper)
+ '[ _Pseudelymus saxicola_ (Scribn. & J.G. Sm.) Barkworth & D.R. Dewey; _Agropyron saxicola_ (Scribn. & J.G. Sm.) Piper].' added [to eFlora only]
2015 06 29

p. 1447
ELYMUS triticoides
COMMON NAME: BEARDLESS WILD-RYE
+ 'WILD RYE' made 'WILD-RYE'
2019 01 15

p. 1448
ENNEAPOGON desvauxii
BIOREGIONAL DISTRIBUTION: e DMoj;
+ 'e DMtns' made 'e DMoj' 
2014 08 05

p. 1451
FESTUCA
TJM2 AUTHOR: James P. Smith, Jr. & Susan G. Aiken
+ 'Susan Aikin' made 'Susan G. Aiken'
2013 08 05

p. 1451
FESTUCA
SPIKELET: glumes 2, < lowest floret, unequal, lower sometimes minute, 1--3-veined, upper 3--5-veined; axis breaking above glumes and between florets, florets (1)2--10(17), gen bisexual; lemma 3--5(7)-veined, base gen glabrous, tip entire, occ minutely 2-toothed, awn 0 or terminal, gen straight, glabrous; palea +- = lemma; stamens 3 or 1.
+ 'lemma base gen glabrous, 3--5(7)-veined, not converging at tip; awn (when present) gen terminal, straight, glabrous;' made 'lemma 3--5(7)-veined, base gen glabrous, tip entire, occ minutely 2-toothed, awn 0 or terminal, gen straight, glabrous;' [in TJM2; not abbreviated in eFlora]
2013 11 08

p. 1451
FESTUCA
NOTE: As treated here, incl &times;_Festulpia_, &times;_Festulolium_, _Leucopoa_, _Lolium_, &times;_Schedolium_, &times;_Schedololium_, _Schedonorus_, and _Vulpia_. _Lolium rigidum_ Gaudin (combination in _Festuca_ evidently not available), native to Europe and Africa, has been found sporadically as an urban and agricultural weed, but has not been collected in recent yrs and is doubtfully naturalized.
+ '_Festuca rigida_ (Gaudin) Columbus & J.P. Smith [_Lolium rigidum_ Gaudin], native to Europe and Africa, has been found sporadically as an urban and agricultural weed, but has not been collected in recent yrs and is doubtfully naturalized.' made '_Lolium rigidum_ Gaudin (combination in _Festuca_ evidently not available), native to Europe and Africa, has been found sporadically as an urban and agricultural weed, but has not been collected in recent yrs and is doubtfully naturalized.'  [in TJM2; not abbreviated in eFlora]
2013 08 05

p. 1451
FESTUCA
1. Inflorescence spike-like (sometimes sparingly branched); glume 1 except 2 in uppermost spikelet (subg. _Lolium_)
+ 'glume 1 except 0 in uppermost spikelet (subg. _Lolium_)' made 'glume 1 except 2 in uppermost spikelet (subg. _Lolium_)'
2019 01 22

p. 1451
FESTUCA
7' Lower glume generally > 3 mm, >= 1/2 upper glume (2--3 mm, < 1/2 upper glume in some _Festuca microstachys_)
+ '> 1/2 upper glume' made '>= 1/2 upper glume'
2013 11 26

p. 1452
FESTUCA bromoides
SPIKELET: 5--10 mm; lower glume 3.5--5 mm, upper 4.5--8 mm; florets 4--7; lemma 5.5--8 mm, awn 2.5--12 mm, scabrous.
+ 'glumes 3.5--8 mm, +- equal' made 'lower glume 3.5--5 mm, upper 4.5--8 mm'
2013 11 26

p. 1454
FESTUCA myuros
SPIKELET: 5--11.5 mm; lower glume generally < 2 mm, upper +- 2.5--5.5 mm; florets 3--6; lemma 4.5--6.5 mm, awn 5--15 mm.
+ 'lemma 4.5--6.5, awn 5--15 mm.' made 'lemma 4.5--6.5 mm, awn 5--15 mm.'
2019 01 09

p. 1454
FESTUCA pratensis
WEEDINESS: Potentially problematic weed
+ 'Potentially problematic weed' added [to replace removed broken diamond symbol in TJM2 (as an addition to existing note), and 'Weed listed by Cal-IPC' in eFlora]
2013 08 07

p. 1454
FESTUCA trachyphylla
ELEVATION: generally 1000--1800 m.
BIOREGIONAL DISTRIBUTION: KR, NCoRO, CaR, n SNH, expected elsewhere;
+ 'KR,' added; 'CaR,' added 
2015 08 12

p. 1455
GLYCERIA declinata
BIOREGIONAL DISTRIBUTION: n NCo, KR, NCoR, CaR, SNF, GV, CCo, SCo, expected elsewhere;
+ 'n NCo, KR,' added; 'CCo,' added 
2015 08 12

p. 1458
HORDEUM
2. Infl axis gen remaining intact at maturity; lateral spikelets sessile (stalked in sterile pls); glume margins not ciliate .....-> [H. vulgare]
2' Infl axis breaking apart at maturity; lateral spikelets stalked; glume margins ciliate .....-> H. murinum
+ Lead 2., _H. murinum_, reversed with 2', [_H. vulgare_], because subspp. murinum, glaucum, and leporinum (couplets 3 & 4) belong to (as well as under) _H. murinum_ (even though the change puts the leads out of alphabetical order, the shorter lead still comes first)
2012 05 09

p. 1458
HORDEUM
LATERAL SPIKELET: sterile or staminate (bisexual in _Hordeum vulgare_), generally short-stalked; floret 1, sessile; glumes awn-like, > floret; lemma generally awned.
+ '> floret, lemma generally awned.' made '> floret; lemma generally awned.'
2019 01 09

p. 1459
HORDEUM jubatum subsp. jubatum
SYNONYMS: Hordeum jubatum var. caespitosum (Scribn.) Hitchc.
+ 'cespitosum' made 'caespitosum'
2013 03 28

p. 1460
KOELERIA
1. Annual; inflorescence axis, branches glabrous; glumes, lower lemmas papillate to coarse-hairy on back .....-> K. gerardi
+ 'K. gerardii' made 'K. gerardi'
2014 01 14

p. 1460
KOELERIA gerardi
+ 'KOELERIA gerardii' made 'KOELERIA gerardi'
2014 01 14

LUPINUS polyphyllus var. humicola
TAXON AUTHOR: (A. Nelson) Barneby
+ 'TAXON AUTHOR.' made 'TAXON AUTHOR:'
2022 06 01

p. 1468
ORCUTTIA inaequalis
SYNONYMS: Orcuttia californica var. inaequalis (Hoover) Hoover
+ 'ineaqualis' made 'inaequalis'
2012 08 17

p. 1470
PANICUM dichotomiflorum subsp. dichotomiflorum
BIOREGIONAL DISTRIBUTION: e KR, CaRF, w CaRH, SNF, SNH, GV, SnFrB, SCo, PR;
+ 'e KR,' added; 'w CaRH,' added 
2015 08 25

p. 1470
PANICUM oligosanthes Schult. var. scribnerianum
BIOREGIONAL DISTRIBUTION: NW;
+ ', n CaR' deleted 
2015 08 25

p. 1471
PASPALUM distichum
STEM: 5--63 cm, erect; nodes glabrous.
+ '0.5--6.3 dm' made '5--63 cm'
2013 02 21

p. 1471
PASPALUM urvillei
STEM: 50--220 cm, erect; nodes glabrous or pubescent.
+ '0.5--2.2 m' made '50--220 cm'
2013 02 21

p. 1471
PASPALUM urvillei
WEEDINESS: Potentially problematic weed
+ 'Potentially problematic weed' added [to replace removed broken diamond symbol in TJM2 (as a note), and 'Weed listed by Cal-IPC' in eFlora]
2013 08 07

p. 1471
PASPALUM vaginatum
STEM: 10--79 cm, erect; nodes glabrous.
+ '1--7.9 dm' made '10--79 cm'
2013 02 21

p. 1472
PENNISETUM clandestinum
LEAF: sheath 1--10 cm, glabrous or hairy, +- inflated; ligule +- 1--2 mm; blade 1.5--15 cm, 1--6 mm wide, upper surface glabrous to short-hairy, flat or folded, tip obtuse.
+ 'blade 1.5--3 cm' made 'blade 1.5--15 cm'
2019 02 19

p. 1472
PHALARIS
LEAF: sheath open, glabrous, occ recurved; ligule membranous, glabrous, entire, acuminate or truncate; blade gen 2--5 dm, 1--2.5 cm wide, flat.
+ 'blade gen 2--5 dm, 1--2.5 cm, flat' made 'blade gen 2--5 dm, 1--2.5 cm wide, flat' ('wide' inserted)
2013 02 21

p. 1473
NEOSTAPFIA colusana (top of page, figure at right)
+ 'glume' made 'lemma' in 2 (both) places
2013 02 28

p. 1474
PHALARIS aquatica
STEM: 4--20 dm, swollen at base.
+ '4--2 dm' made '4--20 dm'
2012 03 27
p2

p. 1474
PHALARIS brachystachys
INFLORESCENCE: 1.5--5 cm, +- 1.5--1.8 cm wide.
+ 'mm' made 'cm' in both places
2013 09 26

p. 1474
PHALARIS minor
ELEVATION: < 1000 m.
+ '300' made '1000'
2013 11 05

p. 1474
PHALARIS paradoxa
INFLORESCENCE: 3--9 cm, 1--2 cm wide, obovate to oblong; base tapered; tip truncate to acuminate; spikelets in clusters of 6--7, cluster falling as 1 unit; fertile spikelet gen surrounded by 5--6(7) sterile spikelets; sterile spikelet reduced, vestigial or = fertile.
+ '3--9 cm, 1--2 mm wide' made '3--9 cm, 1--2 cm wide'
2013 02 21

p. 1475
UNABRIDGED
PHYLLOSTACHYS
LEAF: main st lvs early-deciduous, auricles and bristles present or 0; blade glossy, thickened, indistinctly cross-veined, base constricted above sheath, forming false petiole.
+ ', base constricted above sheath, forming false petiole' inserted
2012 04 04

p. 1475
UNABRIDGED
JFP-4
PHYLLOSTACHYS aurea
NOTE: There is no clear evidence that pls reproduce by seed in CA. Seldom, if ever, fls in cult in CA. Golden bamboo can be a misleading common name because many plants grown in shady areas will remain green.
+ 'is NATURALIZED in the traditional sense of the term (i.e., reproducing by seed)' made 'pls reproduce by seed in CA'; 'Seldom, if ever, fls in cult in CA.' inserted.
2012 04 04

p. 1475
PLEUROPOGON californicus
UNABRIDGED NOTE: Expanded author citation: Pleuropogon californicus (Nees) Benth. ex Vasey
+ 'Benth' made 'Benth.' [in eFlora; no unabridged notes in TJM2]
2012 07 12

p. 1475
PLEUROPOGON californicus var. californicus
BIOREGIONAL DISTRIBUTION: NW, CaRF, n&c SNF, GV, CW (exc SCoRI).
+ '(exc (SCoRI)' made '(exc SCoRI)' 
2012 03 27
p2

p. 1476
POA
2. Callus glabrous --- upper fls of spikelet often pistillate
+ '2. Callus glabrous; upper fls of spikelet often pistillate' made '2. Callus glabrous --- upper fls of spikelet often pistillate'
2012 04 18

p. 1477
POA
18. St-lf blades strongly reduced upward, uppermost < 1/8 sheath length; lemma keel and marginal veins clearly hairy; pl densely cespitose (see 31. for subspp.) .....-> P. fendleriana (2)
+ '(see 31' for subspp.)' made '(see 31. for subspp.)'
2012 09 25

p. 1478
POA atropurpurea
ELEVATION: 1250--2320 m.
+ '1500--2200' made '1250--2320'
2018 04 17

p. 1479
POA fendleriana subsp. longiligula
BIOREGIONAL DISTRIBUTION: SNH, SnBr, PR, GB, DMtns;
+ 'SnBr, PR' added 
2012 09 04 

p. 1480
POA palustris
BIOREGIONAL DISTRIBUTION: KR, CaRH, n&c SNH, SnGb, SnBr, GB;
+ 'KR,' added 
2015 08 26

p. 1480
POA pratensis subsp. pratensis
NOTE: Widely planted as lawn or pasture grass. _Poa pratensis_ subsp. _agassizensis_ (B. Boivin & D. L&ouml;ve) R.L. Taylor & MacBryde is widespread and hypothetically native in CA and N.Am, has dense infl < 6 cm with smooth branches, lf firm and folded, sterile shoot blade upper surface often sparsely soft-hairy; _Poa pratensis_ subsp. _angustifolia_ (L.) Lej., native of Medit Eurasia, probably introduced in CA, has long, folded sterile +- firm shoots gen < 0.5 mm wide, sometimes hairy as in _Poa pratensis_ subsp. _agassizensis_, narrowly triangular open infl with smooth ascending branches.
+ 'MacBryd' made 'MacBryde'
2012 11 01

p. 1480
POA secunda
SPIKELET: +- cylindric or little compressed; upper internodes generally > 1.2 mm; callus glabrous or with a ring of short hairs; lemma 3.5--5 mm, weakly keeled to rounded across lower back, glabrous to +- evenly short-hairy across body (rarely soft-hairy only on veins), smooth to scabrous.
+ 'lemma 3.5--5 mm' made 'lemma 3.5--6 mm'
2019 07 16

p. 1480
POA secunda subsp. juncifolia
NOTE: _Poa &times;limosa_ Scribn. & T.A. Williams (Lassen Co. blue grass) is a set of hybrids between _Poa secunda_ subsp. _juncifolia_ and _Poa pratensis_; 2n=63--64; low ground, often saline meadows; 800--2000 m; range of subsp. _juncifolia_.
+ 'blue-grass' made 'blue grass'
2012 03 27
p2

p. 1482
POLYPOGON
LEAF: sheath open, loosely enclosing st, glabrous; ligule thinly membranous, obtuse to truncate, minutely ciliate to toothed; blades +- cauline, flat, scabrous, veins minutely prickly at 10&times;.
+ 'at 10&times;' made 'at 10&times;.'
2012 10 10

p. 1482
NATIVE
POLYPOGON interruptus
+ 'NATURALIZED' made 'NATIVE'  [font in TJM2 changed from that indicating NATURALIZED to that indicating NATIVE]
2019 03 12

p. 1483
PUCCINELLIA
7. Cauline leaf blade inrolled, 1--2 mm wide when flat; lemma tip acute, margin near tip generally entire, sometimes sparsely finely scabrous or scabrous-serrate at 10&times;; anthers of lowest floret 1--2 mm .....-> P. lemmonii
+ 'at 10&times; anthers' made 'at 10&times;; anthers'
2017 06 22

p. 1483
PUCCINELLIA
7' Cauline leaf blade flat to inrolled, 1--6 mm wide when flat; lemma tip acute to obtuse, margin near tip scabrous-serrate at 10&times;; anthers of lowest floret 0.5--2 mm
+ 'at 10&times; anthers' made 'at 10&times;; anthers'
2017 06 22

p. 1484
PUCCINELLIA simplex
RARITY STATUS: SYMBOL 1
+ 'SYMBOL 1' added [meaning that a star symbol was added to TJM2, while 'Listed on CNPS Rare Plant Inventory' was added to the eFlora]
2016 01 20

p. 1484
RYTIDOSPERMA
1. Upper and lower lemma hairs (except callus) in 2 continuous rows of tufts .....-> R. caespitosum
+ '[R. caespitosum]' made 'R. caespitosum'
2015 04 29

p. 1484 [location or approximate location where full treatment would appear in TJM2 were it not previously unabridged (taxon as waif) and therefore only in eFlora]
NATURALIZED
RYTIDOSPERMA caespitosum
+ 'WAIF' made 'NATURALIZED' [in eFlora; full treatment probably too long to fit into any future printings of TJM2]
2015 04 29

p. 1484 [location or approximate location where full treatment would appear in TJM2 were it not previously unabridged (taxon as waif) and therefore only in eFlora]
RYTIDOSPERMA caespitosum
NOTE: Changed from waif (as in TJM2) based on reports that populations in Black Mountain Open Space Park, San Diego, and probably elsewhere are expanding.
+ NOTE added  [in eFlora; full treatment probably too long to fit into any future printings of TJM2]
2015 04 29

p. 1486
SETARIA
4. Spikelet +- 2 mm; panicle 3--8 cm; lf blades 3--12 mm wide .....-> S. viridis
+ 'lf blades 4--12 mm wide' made 'lf blades 3--12 mm wide'
2012 11 01

p. 1486
SETARIA
5' Rhizomes present; upper glume > 0.5 &times; upper lemma; spikelet gen < 2.8 mm, gen <= 1.5 mm wide
+ 'width gen <= 1.5 mm wide' made 'gen <= 1.5 mm wide'
2013 02 21

p. 1488
SPARTINA
FRUIT: achene-like, seed free from thin ovary wall.
+ entire FRUIT statement added
2013 09 25

p. 1489
SPHENOPHOLIS obtusata
BIOREGIONAL DISTRIBUTION: n SNF (Amador Co.), s SNH (Fresno Co.), ne SCo (Santa Ana River), SnBr, s-c PR (Cuyamaca Mtns), SNE;
+ 'W&I' made 'SNE' 
2013 10 04

p. 1489
SPOROBOLUS
FRUIT: utricle-like, when wet gelatinous with seed emergent from split ovary wall.
+ '1--3 mm, generally falling from floret, generally gelatinous when wet' made 'utricle-like, when wet gelatinous with seed emergent from split ovary wall'
2013 09 25

p. 1489
SPOROBOLUS cryptandrus
SYNONYMS: _Sporobolus nealleyi_ Vasey misappl. from San Luis Obispo Co.
+ 'Sprolobolus' made 'Sporobolus' [in eFlora; abbreviated to 'S.' in TJM2 so not an issue there]
2012 04 04

p. 1490
STENOTAPHRUM
INFLORESCENCE: spike-like, infl branches, pedicels reduced, +- embedded, with spikelet bases, in flattened, straight or wavy, thickened axis.
+ 'raceme- to panicle-like; 1&deg; branches appressed, axis straight or wavy, tip awl-like; spikelets short-stalked to embedded in axis, subtended by 1+ bristles.' made 'spike-like, infl branches, pedicels reduced, +- embedded, with spikelet bases, in flattened, straight or wavy, thickened axis.'
2013 11 07

p. 1494
STIPA miliacea var. miliacea
SYNONYMS: Piptatherum miliaceum (L.) Coss.
+ 'Piptatherum miliaceum (L.) Coss. subsp. miliaceum' made 'Piptatherum miliaceum (L.) Coss.'
2012 05 17

p. 1494
STIPA miliacea var. miliacea
UNABRIDGED SYNONYMS: Oryzopsis miliacea (L.) Benth. & Hook. f. ex Asch. & Schweinf.'; Piptatherum miliaceum (L.) Coss. subsp. miliaceum
+ '; Piptatherum miliaceum (L.) Coss. subsp. miliaceum' added [in eFlora; unabridged synonyms not in TJM2]
2012 05 17

p. 1494
STIPA speciosa
BIOREGIONAL DISTRIBUTION: s SN, Teh, SnJV, SCoR, SW, GB, D;
+ ', D' added 
2015 10 22

p. 1496
TRIDENS muticus var. muticus
BIOREGIONAL DISTRIBUTION: ne PR, D;
+ 'ne PR,' added 
2014 07 30

p. 1497
TRISETUM projectum
+ 'Per' moved to after common name
2012 04 04

p. 1497
4' Panicle 2.5--7(10) cm, not interrupted; leaves glabrous or densely soft-hairy; upper glumes 4--5 mm .....-> T. spicatum
+ 'Panicle 2.5--7(10) mm' made 'Panicle 2.5--7(10) cm'
2016 07 26

p. 1498
VAHLODEA atropurpurea
BIOREGIONAL DISTRIBUTION: KR (Marble Mtns, Trinity Alps), CaRH (Mount Shasta);
+ ', W&I (White Mtns)' deleted 
2012 03 27

p. 1498
VENTENATA dubia
BIOREGIONAL DISTRIBUTION: KR, NCoRH (Lake Co.), CaRH, n SNH (Nevada Co.), MP;
+ 'KR' moved from before CaRH to correct position in sequence 
2012 03 27
p2

p. 1501
POTAMOGETON
20. Lvs thin, not conspicuously 2-ranked, vein 1, not fine .....-> <sup>2</sup>_P. diversifolius_
+ 'veins not fine' made 'vein 1, not fine'
2012 03 27
p2

p. 1502
POTAMOGETON crispus
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaR, s SN, n SNH, GV, CCo, SnFrB, SCo, ChI, SnGb, SnBr, PR, D;
+ 'KR,' added; 'CaR, s SN,' added; 'DMoj;' made 'PR, D;' 
2015 08 26

p. 1502
POTAMOGETON diversifolius
LEAF: submersed sessile, +- 6 cm, 1--5 mm wide, linear, thin, tip acute, vein 1; stipules sheath-like basally, liguled, < 1 cm, fused to blade base for +- 1/4--1/2 stipule length, or 1--15 mm; floating petiole < 2 &times; blade, blade 0.5--3 cm, 0.3--0.8 mm wide, elliptic, tapered at base, tapered or rounded at tip.
+ 'tip acute, veins, stipules sheath-like basally' made 'tip acute, vein 1; stipules sheath-like basally' in eFlora; for second printing, comma used instead of semicolon, incorrectly
2012 03 27
p2

p. 1502
POTAMOGETON foliosus subsp. fibrillosus
NOTE: All pls in Yellowstone National Park sampled for DNA are hybrids between _Potamogeton foliosus_ and _Potamogeton pusillus_.
+ 'Yosemite' made 'Yellowstone'
2012 04 06

p. 1506
NOLINA bigelovii
BIOREGIONAL DISTRIBUTION: se PR, s DMoj, DMtns, DSon;
+ 'se PR, s DMoj,' added 
2014 05 22

p. 1506
NOLINA parryi
BIOREGIONAL DISTRIBUTION: s SNF, s SNH (Kern Plateau), e SnBr, e PR, D.
+ 's SNH (Kern Plateau), e SnBr, PR, DMtns, DSon.' made 's SNF, s SNH (Kern Plateau), e SnBr, e PR, D.' 
2014 05 22

p. 1506
SCHEUCHZERIACEAE
GENERA IN FAMILY: 1 genus, 1 sp.: w&e N.Am, Eurasia.
+ '1 genus, 1 sp.' made '1 genus, 1 sp.: w&e N.Am, Eurasia.'
2012 09 27

p. 1510
BRODIAEA
16' Perianth lobes violet (white); staminodes oblong, margins incurved, often to tip (flat or incurved below tip in _Brodiaea coronaria_)
+ ', often to tip (flat or incurved below tip in _Brodiaea coronaria_)' added
2014 12 10

p. 1510
BRODIAEA californica
BIOREGIONAL DISTRIBUTION: KR, CaRF, n ScV;
+ 'KR,' added 
2015 06 12

p. 1511
BRODIAEA rosea
BIOREGIONAL DISTRIBUTION: KR, NCoRI.
+ 'KR,' added 
2015 06 12

p. 1512
MUILLA
1. Anthers yellow, green, blue, purple, or white; perianth lobes green-white with +- brown midvein; filaments thread-like or wider at base but not dilated .....-> M. maritima
+ 'Anthers green, blue, or purple;' made 'Anthers yellow, green, blue, purple, or white;'
2018 04 17

p. 1513
TRITELEIA bridgesii
ELEVATION: < 1200 m.
+ '< 100' made '< 1200'
2019 11 26

p. 1513
TRITELEIA grandiflora
NOTE: Possibly extirpated in CA.
+ 'possibly' made 'Possibly'
2012 03 27
p2

p. 1516
SPARGANIUM
2. Stigmas 2(3--4) on +- (40)60--100% of pistillate fls; fr body exc beak 8--9 mm, 5--7 mm wide, distally +- truncate to low-rounded .....-> var. eurycarpum
+ 'low-hemispheric' made 'low-rounded'
2012 08 21

p. 1516
SPARGANIUM
2' Stigmas 2 on +- 5--40% of pistillate fls; fr body exc beak 5--8 mm, 3--6 mm wide, distally rounded to gen tapered .....-> var. greenei
+ 'hemispheric' made 'rounded to gen tapered'
2012 08 21

p. 1516
SPARGANIUM eurycarpum var. eurycarpum
FRUIT: body 8--9 mm, 5--7 mm wide, distally +- truncate to low-rounded.
+ 'low-hemispheric' made 'low-rounded'
2012 08 21

p. 1516
SPARGANIUM eurycarpum var. greenei
FRUIT: body 5--8 mm, 3--6 mm wide, distally rounded to gen tapered.
+ 'hemispheric' made 'rounded to gen tapered'
2012 08 21

p. 1516
SPARGANIUM natans
BIOREGIONAL DISTRIBUTION: e KR, CaRH, n&c SNH, MP;
+ 'e KR,' added 
2015 08 26

p. 1517
ZANNICHELLIA palustris
ELEVATION: < 3090 m.
+ '2200' made '3090'
2018 08 28

p. 1518
ZOSTERA
REFERENCE: Coyer et al. 2008 Ann Bot 101:73--87; Dean et al. 2008
+ 'Dean et al' made 'Dean et al.'
2012 03 27

p. 1518
ZOSTERA pacifica
FLOWERING TIME: (May)Aug
+ 'Aug' made (May)Aug

p. 1523
INDEX
+ pertaining to first paragraph, second sentence: 'It does not include scientific names of accepted species or infraspecific taxa, which are arranged alphabetically in the text (within the genus or species to which they belong).' made 'It does not include scientific names of accepted species or infraspecific taxa, which are arranged alphabetically in the text (within the genus or species to which they belong), unless such names appear in places other than the main entry for the taxa involved.' [in TJM2; Index not relevant to eFlora]
2014 06 09

p. 1535
INDEX
CRYPTANTHA
sand dune, 462
+ 'sanddune, 462' made 'sand dune, 462' [in TJM2; Index not relevant to eFlora]
2012 11 14

p. 1536
INDEX
Cymodoceaceae, 1283
+ 'Cymodoceaceae, 1280' made 'Cymodoceaceae, 1283' [in TJM2; Index not relevant to eFlora]
2015 09 23

p. 1537
INDEX
Ebenaceae, 159
+ 'Ebenaceae, 156' made 'Ebenaceae, 159' [in TJM2; Index not relevant to eFlora]
2015 09 23

p. 1543
INDEX
Halodule wrightii, 1283
+ 'Halodule wrightii, 1280' made 'Halodule wrightii, 1283'  [in TJM2; Index not relevant to eFlora]
2015 09 23

p. 1554
INDEX
PHACELIA
sand dune, 490
+ 'sanddune, 490' made 'sand dune, 490' [in TJM2; Index not relevant to eFlora]
2012 11 14

p. 1561
INDEX
SEDGE
sand dune, 1333
+ 'sanddune, 1333' made 'sand dune, 1333' [in TJM2; Index not relevant to eFlora]
2012 11 14

p. 1564
INDEX
+ pertaining to entry for Thelesperma: moved '214' from 'megapotamicum' to 'Thelesperma'; deleted 'simplicifolium var. simplicifolium, 222' [in TJM2; Index not relevant to eFlora]
2012 04 04

p. [1570]
SCALE BAR
'meters' made 'feet'; 'feet' made 'meters'
2012 03 27
p2

SUPPLEMENTS: Changes to a treatment for which there is a supplement are indicated above, for TJM2 and the eFlora, when the change occurs before the supplement in question is published.  Once that supplement is published, changes to it are indicated below, but also above if there is a way to do so that makes sense or is not too confusing (i.e., if the supplement is not too different from the treatment in TJM2; unlike the changes indicated here, changes associated with Supplements are not separately documented, and in some cases are extensive, so that it may become too cumbersome to indicate how a change to a supplement translates into a change to TJM2).

SUPPLEMENT I

Supplement I, p. 22
EXTRIPLEX
1. Perennial herb; stems spreading to decumbent; leaf blade lanceolate to elliptic; fruit bracts 3--4.5 mm, +- free, ovate to +- round, smooth .....-> E. californica
+ 'Perennial herb, spreading to decumbent;' made 'Perennial herb; stems spreading to decumbent;'
2015 03 31

Supplement I, p. 22
EXTRIPLEX
1' Annual; stems ascending to +- erect; leaf blade ovate to deltate; fruit bracts 2--4 mm, free to fused proximally, narrowly elliptic to deltate, ribbed .....-> E. joaquinana
+ 'Annual, erect;' made 'Annual; stems ascending to +- erect;'
2015 03 31

Supplement I, p. 22
EXTRIPLEX californica
STEM:
+ STEM deleted [from Supplement I and eFlora; not relevant in TJM2]
2015 03 31

Supplement I, p. 22
EXTRIPLEX joaquinana
STEM: 
+ STEM deleted [from Supplement I and eFlora; not relevant in TJM2]
2015 03 31

Supplement I, p. 48
CROCANTHEMUM greenei
STEM: 15--68 cm.
+ '30' made '68'
2016 06 07

Supplement I, p. 67
PHACELIA
31. Fr hairs sparse, not bulb-based .....-> P. vallis-mortae
+ 'short,' deleted
2015 04 03

Supplement I, p. 67
PHACELIA
31' Fr hairs dense, bulb-based .....-> P. cicutaria
+ 'long,' deleted
2015 04 03

Supplement I, p. 70
PHACELIA
62' Corolla tube white to lavender, lobes generally purple; leaf veins impressed; fruit beaked; calyx lobes not alike; e KR, n&c SNF, SNH .....-> P. vallicola
+ 's CaR, n&c SN' made 'e KR, n&c SNF, SNH'
2016 08 23

Supplement I, p. 72
PHACELIA brachyloba
HABIT+: Annual 7--60 cm, aromatic.
+ '8--60' made '7--60'
2015 04 14

Supplement I, p. 75
PHACELIA corymbosa
BIOREGIONAL DISTRIBUTION: KR, NCoR, CaRH, n SNH;
+ ', n SNH' added
2016 08 23

Supplement I, p. 91
PHACELIA vallicola
BIOREGIONAL DISTRIBUTION: e KR, n&c SNF, SNH.
+ 's CaR, n&c SNF, SNH.' made 'e KR, n&c SNF, SNH.'
2016 08 23

SUPPLEMENT II

Supplement II, p. 7
MYRIOPTERIS covillei
BIOREGIONAL DISTRIBUTION: NCoR, SN, ScV (Sutter Buttes), SnFrB, SCoR, e SCo, TR, PR, SNE, w edge DMoj, DMtns, w DSon;
+ 'e SCo,' added
+ 'w edge DMoj,' added
+ ', w DSon' added
2016 05 24

SUPPLEMENT III

Supplement III (no page number in Supplement III because the taxon was not included, because there were no changes to it in association with Supplement III).
JUNCUS ambiguus
BIOREGIONAL DISTRIBUTION: NCo, KR, CaRF, SnJV, CCo, SnFrB, SCo, ChI, SnGb, MP (exc Wrn);
+ 'KR,' added
2016 06 15

Supplement III (no page number in Supplement III because the taxon was not included, because there were no changes to it in association with Supplement III).
JUNCUS covillei
BIOREGIONAL DISTRIBUTION: NW, SN, n CCo, SnFrB, TR;
+ 'CaR,' deleted
2016 06 15

Supplement III (no page number in Supplement III because the taxon was not included, because there were no changes to it in association with Supplement III).
JUNCUS dubius
BIOREGIONAL DISTRIBUTION: KR, NCoRO, CaRF, n&c SNH, ScV, SnFrB, SCoRO, SnGb, PR, DMoj;
+ 'KR,' added
2016 06 15

Supplement III (no page number in Supplement III because the taxon was not included, because there were no changes to it in association with Supplement III).
JUNCUS oxymeris
BIOREGIONAL DISTRIBUTION: KR, NCoRO, NCoRI, CaRF, SN, GV, TR, PR;
+ 'KR,' added
2016 05 24

eFlora only

HEDYCHIUM flavescens
BIOREGIONAL DISTRIBUTION: SnFrB (Santa Cruz Co.); 
+ 'CCo (Santa Cruz Co.)' made 'SnFrB (Santa Cruz Co.)'  
2013 09 30

PRIMULA tetrandra
SYNONYMS: Primula tetrandra (Suksd. ex Greene) Mast & Reveal; Dodecatheon alpinum (A. Gray) Greene; Dodecatheon alpinum subsp. alpinum; Dodecatheon alpinum subsp. majus H.J. Thomps.; Dodecatheon jeffreyi Van Houtte var. alpinum (A. Gray) A. Gray; Dodecatheon tetrandrum Suksd. ex Greene
+ 'Dodecatheon tetrandum' made 'Dodecatheon tetrandrum'
2019 02 19

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
*****************************************************************


Beginning in 2020:

EFLORA ONLY: On 21 Jan 2020 I made the decision to list further changes to the eflora here, with no reference to page numbers in TJM2 or the various Supplements. Indicated dates are the dates the changes were made to the underlying eFlora file, which appear in the eFlora online after the next update of the eFlora, which normally happens within a month or two.  If there is a correction that can be written in to a hardcopy of TJM2 as well, users should be able to figure that out from what is presented below. Entries are listed alphabetically by genus.

ABRONIA maritima
BIOREGIONAL DISTRIBUTION: c&s CCo, SCo, ChI;
+ 's CCo' made 'c&s CCo'
2022 06 01

ABRONIA umbellata
HABIT+: Perennial herb, +- glabrous to glandular-hairy.
+ 'Annual,' made 'Perennial herb,'
2022 03 31

ACMISPON
34. Stem, especially near tip, generally with spreading or obliquely directed, often straight, stiff hairs < 0.5 mm; corolla 4--6 mm; coastal and inland .....-> A. tomentosus
+ 'A. heermannii' made 'A. tomentosus'
35. Corolla generally 4--5 mm; ovary generally finely strigose; SCo, SnBr, PR, DSon .....-> var. var. glabriusculus
+ 'var. heermannii' made 'var. glabriusculus'
35' Corolla generally 5--6 mm; ovary generally soft spreading-hairy; NCo, NCoRO, CCo, SCoRO .....-> var. tomentosus
+ 'var. orbicularis' made 'var. tomentosus'
36. Fruit included or +- exserted; leaflet hairs generally straight, tangled in age, generally obscuring surface; leaves silky-silvery .....-> A. argophyllus (2)
+ '36'' made '36.'
37. Inflorescence generally < 1 cm wide, 4--8-flowered; corolla 6--10 mm; especially c SN and s .....-> var. argophyllus
+ '38.' made '37.'
37' Inflorescence often +- 1.5 cm wide, 10--15-flowered; corolla 8--12 mm; n SN .....-> var. fremontii
+ '38'' made '37''
36' Fruit exserted; leaflet hairs generally wavy, not obscuring surface; leaves gray or green .....-> A. decumbens
+ '36.' made '36''
+ 'nevadensis' made 'decumbens'
38. Flowers generally 3--5 per inflorescence; calyx 6--7 mm, appearing blocky; banner abruptly upcurved 90&deg; TR, ne PR .....-> var. davidsonii
+ '37.' made '38.'
38' Flowers generally 5--12 per inflorescence; calyx 5--10 mm, not appearing blocky; banner upcurved 30--90&deg; KR, NCoR, CaR, SN, CCo, SCo, w PR, DMtns .....-> var. decumbens
+ '37'' made '38''
+ 'var. nevadensis' made 'decumbens'
2022 08 23

ACMISPON decumbens
+ 'nevadensis' made 'decumbens'
TAXON AUTHOR: (Benth.) Govaerts
+ '(S. Watson) Brouillet' made '(Benth.) Govaerts'
SYNONYMS: Acmispon nevadensis (S. Watson) Brouillet, superfl.; Lotus nevadensis (S. Watson) Greene
+ 'Acmispon nevadensis (S. Watson) Brouillet, superfl.;' added
+ entry made alphabetical
2022 08 23 

ACMISPON decumbens var. davidsonii
+ 'nevadensis var. davidsonii' made 'decumbens var. davidsonii'
TAXON AUTHOR: (Greene) Govaerts
+ '(Greene) Brouillet' made '(Greene) Govaerts'
SYNONYMS: Acmispon nevadensis (S. Watson) Brouillet var. davidsonii (Greene) Brouillet, superfl.; Lotus davidsonii Greene; Lotus nevadensis (S. Watson) Greene var. davidsonii (Greene) Isely
+ 'Acmispon nevadensis (S. Watson) Brouillet var. davidsonii (Greene) Brouillet, superfl.;' added
+ entry made alphabetical
2022 08 23

ACMISPON decumbens var. decumbens
+ 'nevadensis var. nevadensis' made 'decumbens var. decumbens'
TAXON AUTHOR: (Benth.) Govaerts
+ '(S. Watson) Brouillet' made '(Benth.) Govaerts'
SYNONYMS: Acmispon nevadensis (S. Watson) Brouillet var. nevadensis, superfl.; Lotus douglasii Greene; Lotus nevadensis (S. Watson) Greene var. douglasii (Greene) Ottley; Lotus nevadensis var. nevadensis
+ 'Acmispon nevadensis (S. Watson) Brouillet var. nevadensis, superfl.;' added
+ entry made alphabetical
2022 08 23

ACMISPON tomentosus
+ 'heermannii' made 'tomentosus'
TAXON AUTHOR: (Hook. & Arn.) Govaerts
+ '(Durand & Hilg.) Brouillet' made '(Hook. & Arn.) Govaerts'
SYNONYMS: Acmispon heermannii  (Durand & Hilg.) Brouillet, superfl.; Lotus heermannii (Durand & Hilg.) Greene
+ 'Acmispon heermannii  (Durand & Hilg.) Brouillet, superfl.;' added
+ entry made alphabetical
2022 08 23

ACMISPON tomentosus var. glabriusculus
+ 'heermannii var. heermannii' made 'tomentosus var. glabriusculus'
TAXON AUTHOR: (Hook. & Arn.) Govaerts
+ '(Durand & Hilg.) Brouillet' made '(Hook. & Arn.) Govaerts'
SYNONYMS: Acmispon heermannii  (Durand & Hilg.) Brouillet var. heermannii, superfl.; Lotus heermannii var. heermannii
+ 'Acmispon heermannii  (Durand & Hilg.) Brouillet var. heermannii, superfl.;' added
+ entry made alphabetical
2022 08 23

ACMISPON tomentosus var. tomentosus
+ 'heermannii var. orbicularis' made 'tomentosus var. tomentosus
TAXON AUTHOR: (A. Gray) Brouillet
+ '(A. Gray) Brouillet' made '(Hook. & Arn.) Govaerts'
SYNONYMS: Acmispon heermannii (Durand & Hilg.) Brouillet var. orbicularis (A. Gray) Brouillet, superfl.; Lotus heermannii (Durand & Hilg.) Greene var. eriophorus (Greene) Ottley; Lotus heermannii var. orbicularis (A. Gray) Isely
+ 'Acmispon heermannii (Durand & Hilg.) Brouillet var. orbicularis (A. Gray) Brouillet, superfl.;' added
+ entry made alphabetical
2022 08 23

ACTAEA rubra
BIOREGIONAL DISTRIBUTION: NW, CaR, SN (exc Teh), CCo, SnFrB, SCoRO, SnBr, MP;
+ 'CCo,' added
+ ', MP' added
2020 04 08

ADOXACEAE
+ 'ADOXACEAE' made 'VIBURNACEAE'
NOTE: Incl in Caprifoliaceae in TJM (1993), and possibly in future. Viburnaceae adopted as a conserved name in 2016 [Taxon 65(4):878-879, August 2016], so must be used instead of Adoxaceae for all taxa previously said to belong to Adoxaceae.
+ 'Viburnaceae adopted as a conserved name in 2016 [Taxon 65(4):878-879, August 2016], so must be used instead of Adoxaceae for all taxa previously said to belong to Adoxaceae.' added.
UNABRIDGED NOTE: Incl in Caprifoliaceae in TJM (1993), and possibly in future according to the Angiosperm Phylogeny Website (http://www.mobot.org/MOBOT/Research/APweb/welcome.html), which states, in part, "The whole lot might usefully be combined in a Caprifoliaceae s.l. (see also APG 2003), since similarities between the families are considerable and differences are mostly slight." Viburnaceae adopted as a conserved name in 2016 [Taxon 65(4):878-879, August 2016], so must be used instead of Adoxaceae for all taxa previously said to belong to Adoxaceae.
+ 'Viburnaceae adopted as a conserved name in 2016 [Taxon 65(4):878-879, August 2016], so must be used instead of Adoxaceae for all taxa previously said to belong to Adoxaceae.' added.
2022 03 08


AGROSTIS microphylla
BIOREGIONAL DISTRIBUTION: NCo, s NCoR, GV, CCo, SCoRO, SCo;
+ 'SCoRO,' added
2021 05 19

AMSINCKIA lycopsoides
NOTE: Homostylous. Hybridizes with _Amsinckia intermedia_.
+ '_Amsinckia menziesii_ var. _intermedia_.' Made '_Amsinckia intermedia_.'
UNABRIDGED NOTE: Largest flowered populations restricted to northwestern ScV. In California often confused with _Amsinckia intermedia_.
+ '_Amsinckia menziesii_ var. _intermedia_.' Made '_Amsinckia intermedia_.'
2021 02 11

AMSINCKIA retrorsa
UNABRIDGED NOTE: Occasionally hybridizes with _Amsinckia intermedia_. _Amsinckia retrorsa_ is confused with the very distinctive and uncommon _Amsinckia menziesii_; generally occurring as solitary individuals to occasionally small colonies.
+ '_Amsinckia menziesii_ var. _intermedia_' Made '_Amsinckia intermedia_'; '_Amsinckia menziesii_ var. _menziesii_' made '_Amsinckia menziesii_'
2021 02 11

ARCTOSTAPHYLOS
57' Nascent inflorescence bracts glabrous or nonglandular- or glandular-hairy; KR, NCoRI (Colusa, Mendocino, Shasta, Trinity cos.; possibly Sonoma Co.), c&s NCoRO
+ '(Sonoma, Colusa, Shasta, Trinity cos.)' made '(Colusa, Mendocino, Shasta, Trinity cos.; possibly Sonoma Co.)'
2021 08 24

ARCTOSTAPHYLOS
60. Leaf blade glaucous, canescent or densely white-tomentose, in age glabrous; ovary densely nonglandular-hairy; KR, NCoRI (Colusa, Mendocino, Shasta, Trinity cos.; possibly Sonoma Co.) .....-> A. malloryi
+ '(Sonoma, Colusa, Shasta, Trinity cos.)' made '(Colusa, Mendocino, Shasta, Trinity cos.; possibly Sonoma Co.)'
2021 08 24

ARCTOSTAPHYLOS malloryi
BIOREGIONAL DISTRIBUTION: KR, NCoRI (Colusa, Mendocino, Shasta, Trinity cos.; possibly Sonoma Co.).
+ '(Sonoma, Colusa, Shasta, Trinity cos.)' made '(Colusa, Mendocino, Shasta, Trinity cos.; possibly Sonoma Co.)'
2021 08 24

ARISTOLOCHIA californica
BIOREGIONAL DISTRIBUTION: KR, NCoRI, NCoRO, CaRF, n&c SNF, ScV, CCo, SnFrB.
+ 'NCoR' made 'NCoRI, NCoRO'; 'n SnJV,' deleted; ', n SCoRO' deleted
2021 03 23

ASTRAGALUS, Group 1:
66' Flowers generally (8)10--40 per inflorescence, spreading or reflexed; fruit ascending or reflexed; stem > 15 cm; SNE, SNF, NCoRO, SnFrB
+ ', SnFrB' added
67. Plant +- glabrous, especially at base, +- green; calyx 6.5--9 mm; corolla white; NCoRO, SnFrB .....-> A. agnicidus
+ ', SnFrB' added
2022 03 31

ASTRAGALUS agnicidus
BIOREGIONAL DISTRIBUTION: NCoRO (s Humboldt, Mendocino cos.), SnFrB (Ben Lomond Mtn, Santa Cruz Co.).
+ ', SnFrB (Ben Lomond Mtn, Santa Cruz Co.)' added
2022 03 31

BELLARDIA trixago
COMMON NAME: MEDITERRANEAN LINESEED
+ 'LINSEED' made 'LINESEED'
2021 04 27

BRODIAEA kinkiensis
INFLORESCENCE: scapes 20--30 cm, slender; pedicels <= 8 cm.
+ '2--3 cm' made '20-30 cm'
2021 04 27

CALANDRINIA menziesii
BIOREGIONAL DISTRIBUTION: CA-FP, DMoj (exc DMtns);
+ 'CA-FP, w MP, s SNE, n DMtns (Coso Range);' made 'CA-FP, DMoj (exc DMtns);
2020 05 06

CALOCHORTUS greenei
BIOREGIONAL DISTRIBUTION: e KR, nw CaRH;
+ 'nw CaR' made 'nw CaRH'; ', w MP' deleted
2020 08 25

CALOCHORTUS macrocarpus
BIOREGIONAL DISTRIBUTION: n CaR, MP;
+ 'GB' made 'MP'
2022 07 13

CALYSTEGIA malacophylla subsp. malacophylla
BIOREGIONAL DISTRIBUTION: KR, CaR, SN.
+ 'KR,' added
2021 02 02

CARDAMINE nuttallii
LEAF: simple or compound, leaflets 3(5), terminal leaflet or simple leaf (0.9)1.3--4(5.2) cm, reniform to +- round, ovate, or oblong, base cordate to obtuse, margin crenate to dentate or 5--7-lobed; petiole (2)3--18(21) cm; cauline 1--3, leaflets 3(5), petioled, terminal 1--3.5(6) cm, widely ovate to oblong or linear.
+ 'rhizome simple or compound' made 'simple or compound'
2021 03 17

CAULANTHUS anceps
BIOREGIONAL DISTRIBUTION: s SNF, Teh, sw SnJV, se SCoRO, SCoRI, n WTR.
+ 'Teh,' added
2020 04 08

CAULANTHUS lemmonii
SYNONYMS: Caulanthus coulteri S. Watson var. lemmonii (S. Watson) Munz; Streptanthus coulteri (S. Watson) A. Gray ex Greene var. lemmonii (S. Watson) Jeps.
+ '; Streptanthus lemmonii Jepson 1920, non S. Watson 1890' added
2020 01 28

CEANOTHUS pendletonensis
FLOWERING TIME: Mar--Jun
+ 'Apr' made "Jun'
2022 06 21

CENCHRUS
2' Sheaths compressed, but not strongly keeled; bracts 8--40, broader at base, 1--3 mm; spikelets 3.5--5.9 mm .....-> C. spinifex
+ 'C. incertus' made 'C. spinifex' [Conveniently, the leads of couple 2 were in reverse order, but made correct by this name change.]
2020 08 18

CENCHRUS spinifex
+ 'incertus' made 'spinifex' [Treatment moved to the position after CENCHRUS longispinus to maintain alphabetical order.]
TAXON AUTHOR: Cav.
+ 'M.A. Curtis' made 'Cav.'
BIOREGIONAL DISTRIBUTION: GV, s CCo, SCoRO, SCo, PR, DMoj (near Daggett), DSon;
+ 's CCo, SCoRO,' added
2020 08 18

CENTAUREA
15. Involucre 10--13 mm .....-> C. stoebe subsp. australis
+ 'micranthos' made 'australis'
2022 10 18

CENTAUREA stoebe L. subsp. australis
+ 'micranthos' made 'australis'
TAXON AUTHOR: (Pančić ex A.Kern.) Greuter
+ '(Gugler) Hayek' made '(Pančić ex A.Kern.) Greuter'
SYNONYMS: Centaurea maculosa Lam.; Centaurea australis Pančić ex A.Kern.; Centaurea sublanata Boiss. subsp. australis (Pančić ex A.Kern.) Nyman; Centaurea biebersteinii DC. subsp. australis (Pančić ex A.Kern.) Dostál; Centaurea stoebe L. subsp. micranthos (Griseb.) Hayek; Centaurea maculosa Lam. subsp. biebersteinii (DC.) Nyman
+ '; Centaurea australis Pančić ex A.Kern.; Centaurea sublanata Boiss. subsp. australis (Pančić ex A.Kern.) Nyman; Centaurea biebersteinii DC. subsp. australis (Pančić ex A.Kern.) Dostál; Centaurea stoebe L. subsp. micranthos (Griseb.) Hayek; Centaurea maculosa Lam. subsp. biebersteinii (DC.) Nyman' added
2022 10 18

CHLOROGALUM pomeridianum var. pomeridianum
ELEVATION: < 1900 m.
+ '1500' made '1900'
BIOREGIONAL DISTRIBUTION: NW, CaRF, SNF, n SNH, Teh, w GV, CW, SW;
+ 'CaRF,' 'Teh,' added
2022 01 19

CHORIZANTHE diffusa
INFLORESCENCE: bracts 2, awns 0; involucre 2--2.5 mm, 3-angled, 6-ribbed, teeth 6, 0.5--1 mm, margins white, abaxial longest, awns 1--2 mm, hooked.
FLOWER: 1, 2.5--3 mm, glabrous; perianth 2-colored, tube lemon-yellow, lobes white, entire; stamens 3--9.
+ 'margins white or +- pink to purple,' made 'margins white,'
2021 11 02

CLARKIA
32. Flowers many on well-developed branches; c&s SNF, Teh .....-> C. speciosa subsp. polyantha
+ 's SNF' made 'c&s SNF'
2021 06 16

CLARKIA speciosa subsp. polyantha
BIOREGIONAL DISTRIBUTION: c&s SNF, Teh.
+ 's SNF' made 'c&s SNF'
2021 06 16

CLAYTONIA perfoliata
COMMON NAME: MINER'S LETTUCE
+ 'MINER'S LETTUCE' made 'ROOREH'
2022 05 03

CLEMATIS lasiantha
BIOREGIONAL DISTRIBUTION: KR, NCoRI, NCoRO, CaRF, SNF, ScV (Sutter Buttes), CW, SW;
+ 'NCoRO,' added
2020 06 16

CLEMATIS ligusticifolia
BIOREGIONAL DISTRIBUTION: CA (exc MP, DSon);
+ 'CA' made 'CA (exc MP, DSon)'
2020 06 16

CLEMATIS pauciflora
BIOREGIONAL DISTRIBUTION: SW, s DMoj;
+ 'DMtns (Little San Bernardino Mtns)' made 's DMoj'
2020 06 16

CORNUS sericea subsp. sericea
BIOREGIONAL DISTRIBUTION: CA-FP, GB (uncommon s CA);
+ '(uncommon s CA).' made '(uncommon s CA);'
DISTRIBUTION OUTSIDE CALIFORNIA: to Alaska, eastern Canada, Virginia, New Mexico, northern Mexico, introduced in western Europe.
+ DISTRIBUTION OUTSIDE CALIFORNIA added
2021 11 02

CRUCIANELLA angustifolia
BIOREGIONAL DISTRIBUTION: s KR, NCoRI, s CaR, n SN, e ScV, SCoRO;
+ ', SCoRO' added
2020 07 16

CUSCUTA
11' Calyx, corolla lobe tips similar, both either acute to long-acuminate or obtuse to rounded
+ 'Calyx, corolla lobes tips' made 'Calyx, corolla lobe tips'
2020 12 03

CYNARA cardunculus L. subsp. flavescens
LEAF: lobes tipped with needle-like spines 1--3 cm.
+ 'spines 1--3 cm margin.' Made 'spines 1--3 cm.'
2021 02 11

CYPRIPEDIUM californicum
BIOREGIONAL DISTRIBUTION: KR, NCoRH, NCoRO, w CaR, n SN, nw SnFrB;
+ 'NCoRH,' added
2021 03 23

CYPRIPEDIUM montanum
BIOREGIONAL DISTRIBUTION: NW (exc NCo), CaR, n&c SNH, sw SnFrB, MP;
+ 'NW' made 'NW (exc NCo)'; 'n&c SN' made 'n&c SNH'
2020 11 11

CYPRIPEDIUM parviflorum Salisb. var. makasin
BIOREGIONAL DISTRIBUTION: n SNH;
+ 'SN' made 'n SNH'
2020 11 11

CYSTOPTERIDACEAE
LEAF: spirally arranged, short-spaced or distant, 5--40 cm, +- alike; stipe firm or fleshy, with 2 vascular strands, often expanded at base ("trophopods"); blade 2--3-pinnate-pinnately lobed, thin-herbaceous, broadest at the base or lanceolate, veins free, extending to leaf margin.
+ 'fleshly' made 'fleshy'
2021 09 16

DELPHINIUM
26. Basal leaves generally 0 in flower; cauline leaves >= 3; NCoRI, CaRF, SNF, c&s SNH, ScV, e SnFrB .....-> subsp. hansenii
+ ', e SnFrB' added
2021 04 06

DELPHINIUM decorum Fisch. & C.A. Mey. subsp. decorum
BIOREGIONAL DISTRIBUTION: NCo, n CCo, SnFrB.
+ 'n CCo,' added
2020 04 08

DENDROMECON rigida
BIOREGIONAL DISTRIBUTION: s NW (exc NCo, NCoRH), CaR, SN, CW (exc ChI), SW, w edge DSon;
+ 's NW' made 's NW (exc NCo, NCoRH)'
2020 06 16

DIPLACUS mephiticus
SYNONYMS: Eunanus angustifolius Greene; Mimulus angustifolius (Greene) A.L. Grant; Mimulus coccineus Congdon; Mimulus coccineus var. wolfii (Eastw.) D.W. Taylor; Mimulus densus A.L. Grant; Mimulus mephiticus Greene; Mimulus nanus Hook. & Arn. var. mephiticus (Greene) D.M. Thomps.; Mimulus reifschneiderae Edwin; Mimulus stamineus A.L. Grant; Mimulus washoensis Edwin; Mimulus wolfii Eastw.
+ 'Mimulus nanus (Hook. & Arn.) var. mephiticus (Greene) D.M. Thomps.' Made 'Mimulus nanus Hook. & Arn. var. mephiticus (Greene) D.M. Thomps.'
2020 07 28
ELEVATION: 470-3975 m.
+ '1520--3445' made '470-3975'
2022 07 13

DOWNINGIA
7. Upper corolla lobes densely hairy adaxially near tips .....-> var. mirabilis
+ 'eximia' made 'mirabilis'
2022 03 22

DOWNINGIA ornatissima var. mirabilis
+ 'eximia' made 'mirabilis'
TAXON AUTHOR: (J. T. Howell) Schultheis & Zarucchi
+ '(Hoover) McVaugh' made '(J. T. Howell) Schultheis & Zarucchi'
SYNONYMS: Downingia mirabilis J.T. Howell; Downingia mirabilis J.T. Howell var. eximia Hoover; Downingia ornatissima Greene var. eximia (Hoover) McVaugh
+ '; Downingia ornatissima Greene var. eximia (Hoover) McVaugh' added
NOTE: Name correction discussed in Novon 25:488, 2016-2017.
+ NOTE added
2022 03 22

DRYOPTERIS arguta
TAXON AUTHOR: (Kaulf.) Watt
+ 'Maxon' made 'Watt'
2021 03 30

DUDLEYA
11. Leaves in &times;-section round nearly to base, 2--4 mm thick .....-> D. attenuata subsp. orcuttii
+ 'attenuata' made 'orcuttii'
2022 07 20

DUDLEYA attenuata subsp. orcuttii
+ 'DUDLEYA attenuata subsp. attenuata' made 'DUDLEYA attenuata subsp. orcuttii'
TAXON AUTHOR: (Rose) Moran
+ '(S. Watson) Moran' made '(Rose) Moran'
SYNONYMS: Dudleya attenuata subsp. attenuata, misappl. in TJM2
+ 'Dudleya attenuata subsp. orcuttii (Rose) Moran' made 'Dudleya attenuata subsp. attenuata, misappl. in TJM2'
UNABRIDGED NOTE: _Dudleya attenuata_ subsp. _attenuata_ and _Dudleya attenuata_ subsp. _australis_ Moran in northern Baja California.
+ '_Dudleya attenuata_ subsp. _australis_ Moran in northern Baja California.' made '_Dudleya attenuata_ subsp. _attenuata_ and _Dudleya attenuata_ subsp. _australis_ Moran in northern Baja California.'
2022 07 20

EHRHARTA calycina
BIOREGIONAL DISTRIBUTION: s NCoRO, s NCoRI, ScV, CCo, SCoRO, SW;
+ 'CCo,' added
2020 10 21

ERIGERON bloomeri var. bloomeri
BIOREGIONAL DISTRIBUTION: KR, CaR, n SNH, GB;
+ 'KR,' added
2022 08 31

ERIOPHYLLUM congdonii
BIOREGIONAL DISTRIBUTION: c SN (Mariposa Co.).
+ 'c SNF' made 'c SN'
2022 06 21

ERODIUM
SPECIES IN GENUS: 79 species: temperate America, Eurasia, northern Africa, Australia.
+ '+- 74 species' made '79 species'
2022 05 03

ERODIUM cicutarium
TAXON AUTHOR: (L.) L'H&eacute;r.
+ 'Aiton' made 'L'H&eacute;r.'
2020 09 16

ERODIUM malacoides
TAXON AUTHOR: (L.) L'H&eacute;r.
+ 'Aiton' made 'L'H&eacute;r.'
2020 09 16

ERODIUM moschatum
TAXON AUTHOR: (L.) L'H&eacute;r.
+ 'Aiton' made 'L'H&eacute;r.'
2020 09 16

ERYTHRANTHE arvensis
FLOWER: cleistogamous or open; pedicel 5--40(--90) mm; calyx (7--)9--14 mm, asymmetrically swollen in fruit, glabrous to hairy, lobes unequal, lowest 2 upcurved in fruit; corolla yellow, tube-throat 8--12 mm, exserted 1--3 mm beyond calyx.
+ 'exserted 1--3 beyond calyx' made 'exserted 1--3 mm beyond calyx'
2020 11 11

ERYTHRANTHE breweri
BIOREGIONAL DISTRIBUTION: NW, CaR, SNH, SCoRO, TR, SnJt, MP, W&I (White Mtns);
+ ', W&I (White Mtns)' added
2020 01 21

ERYTHRANTHE microphylla
BIOREGIONAL DISTRIBUTION: CA;
+ 'NW, CaRH, SNH, WTR, SnBr, SnJt, n SNE (Sweetwater Mtns), W&I;' made 'CA'
2021 02 16

ERYTHRANTHE moschata
BIOREGIONAL DISTRIBUTION: CA-FP (except GV), GB;
+ 'NW, CaR, MP;' made 'CA-FP (except GV), GB;'
2021 02 16

ERYTHRANTHE nasuta
SYNONYMS: Mimulus nasutus Greene; Mimulus bakeri Gand.; Mimulus cuspidatus Greene; Mimulus erosus Greene; Mimulus guttatus DC. var. gracilis (A. Gray) G.R. Campbell; Mimulus guttatus var. nasutus (Greene) Jeps.; Mimulus langsdorffii Greene var. nasutus (Greene) Jeps.; Mimulus luteus L. var. gracilis A. Gray; Mimulus puncticalyx Gandoger; Mimulus sookensis B.G. Benedict, Modliszewski, Sweigart, N.H. Martin, Ganders & John H. Willis; Mimulus subreniformis Greene
+ 'Mimulus bakeri Gandoger' made 'Mimulus bakeri Gand.'
2020 07 28

ERYTHRANTHE pardalis
SYNONYMS: Mimulus pardalis Pennell; Mimulus cupriphilus Macnair; Mimulus guttatus DC. var. pardalis (Pennell) D.W. Taylor; Mimulus guttatus DC. var. cupriphilus (Macnair) D.W. Taylor
+ '; Mimulus guttatus DC. var. pardalis (Pennell) D.W. Taylor; Mimulus guttatus DC. var. cupriphilus (Macnair) D.W. Taylor' added
2020 07 28

ERYTHRANTHE rhodopetra
FLOWERING TIME: Mar--May
+ 'Jun--May' made 'Mar--May'
2021 02 16

EUPHORBIA albomarginata
BIOREGIONAL DISTRIBUTION: s SN, Teh, s SnJV, SW, W&I, D;
+ 's SnJV, SW, D;' made 's SN, Teh, s SnJV, SW, W&I, D;'
2021 09 16

FILAGO pyramidata var. pyramidata
BIOREGIONAL DISTRIBUTION: NCoRI, n CCo, SnFrB;
+ 'n&c SnFrB' made 'SnFrB'
2021 06 03

FRITILLARIA biflora
COMMON NAME: CHOCOLATE LILY
+ ', MISSION BELLS' deleted
2022 05 03

GARRYA
2. Leaf margin +- to strongly wavy and often +- to strongly rolled under; pistillate flowers (1)3 per bract; inflorescence in fruit 18--28 mm wide; NCo, NCoRO, ScV, CCo, SnFrB, SCoRO .....-> G. elliptica
+ 'n SNF,' deleted
2020 01 21

GARRYA elliptica
BIOREGIONAL DISTRIBUTION: NCo, KR, NCoRO, CW (exc SCoRI);
+ 'n SNF,' deleted
2020 01 21

GERANIACEAE
GENERA IN FAMILY: 6 genera, 709 species: temperate, +- tropics. Some cultivated for ornamental, perfume oils.
+ '+- 750 species' made '709 species'
2022 05 03

GERANIUM
SPECIES IN GENUS: 307 species: temperate, tropical mountains.
+ '+- 400 species' made '307 species'
2022 05 03

GILIA tenuiflora subsp. tenuiflora
BIOREGIONAL DISTRIBUTION: CCo, s SnFrB, SCoR.
+ 's SnFrB,' added
2021 02 25

GITHOPSIS
STEM: gen erect, 2--40 cm, 4-angled, branched or not.
+ 'erect' made 'gen erect'
2020 06 30

GITHOPSIS diffusa subsp. candida
STEM: 4--20 cm; upper 0.4--1 mm wide.
+ 'erect,' deleted
2020 06 30

GITHOPSIS diffusa subsp. diffusa
STEM: decumbent to erect, 3--30 cm; upper 0.4--0.8 mm wide.
+'often decumbent' made 'decumbent to erect'
2020 06 30

GITHOPSIS diffusa subsp. robusta
STEM: 2--25 cm; upper 0.4--1 mm wide.
+ 'erect,' deleted
2020 06 30

GITHOPSIS pulchella
STEM: 4--40 cm.
+ 'erect,' deleted
2020 06 30

GITHOPSIS specularioides
STEM: 2--40 cm.
+ 'erect,' deleted
2020 06 30

GRATIOLA ebracteata
FLOWER: sepals free, equal, 4--7 mm, 6--15 mm in fruit, lanceolate, acuminate; corolla 5--8 mm, throat +- yellow, limb white, +- pink-tinged.
+ 'white +- pink-tinged' made 'white, +- pink-tinged'
2021 02 25

HESPEROCYPARIS pigmaea
+ 'pygmaea' made 'pigmaea'
SYNONYMS: Callitropsis pygmaea (Lemmon) D.P. Little, orth. var.; Cupressus goveniana Gordon subsp. pygmaea (Lemmon) A. Camus, orth. var.; Cupressus goveniana Gordon subsp. pygmaea (Lemmon) Bartel, superfl., orth. var.; Cupressus goveniana subsp. pigmaea; Cupressus pygmaea (Lemmon) Sarg., orth. var.; Cupressus goveniana Gordon var. pygmaea Lemmon, orth. var.; Cupressus goveniana subsp. pygmaea (Lemmon) A. Camus, orth. var.; Cupressus goveniana Gordon var. pygmaea Lemmon, orth. var.
+ ', orth. var.' added to all names spelled 'pygmaea', deleted from Cupressus goveniana subsp. pigmaea
2021 12 02

HETEROTHECA villosa var. minor
SYNONYMS: Heterotheca villosa var. hispida (Hook.) V.L. Harms; Heterotheca villosa var. villosa, misappl.; Chrysopsis villosa (Pursh) Nutt. ex DC. var. villosa, misappl.
+ '; Chrysopsis villosa (Pursh) Nutt. ex DC. var. villosa, misappl.' added
2020 08 05

HOOVERIA purpurea var. reducta
+ 'reductum' made 'reducta'
2022 01 19

HORDEUM depressum
BIOREGIONAL DISTRIBUTION: CA-FP, western edge of DMoj exc DMtns;
+ 'CA (exc GB, DSon);' made 'CA-FP, western edge of DMoj exc DMtns;'
2021 11 11

HOSACKIA stipularis var. stipularis
BIOREGIONAL DISTRIBUTION: NCo, NCoR, CW.
+ 'CCo, SCoR' made 'CW'
2020 05 12

JUSTICIA californica
BIOREGIONAL DISTRIBUTION: e PR, D (exc DMtns);
+ 'D' made 'D (exc DMtns)'
2020 02 25

KEY TO FAMILIES, Group 17
19. Leaves compound .....-> VIBURNACEAE (_Sambucus_)
+ 'ADOXACEAE' made 'VIBURNACEAE'
20. Leaves 3--5-veined from base .....-> VIBURNACEAE (_Viburnum_)
+ 'ADOXACEAE' made 'VIBURNACEAE'
2022 03 08

LEERSIA oryzoides
BIOREGIONAL DISTRIBUTION: CA-FP (exc SCoR);
+ 'CA-FP (exc CW);' made 'CA-FP (exc SCoR);'
2021 03 23

LEPIDIUM latipes
STEM: erect to decumbent, 1 or several from base, 0.2--1.5(3.8) dm, simple or branched.
+ 'erect decumbent' made 'erect to decumbent'
2020 02 25

LEPIDIUM oblongum
STEM: erect to decumbent, generally several from base, (5)1--2.4(3.2) dm, branched distally.
+ '(5)1--2.4(3.2) dm' made '(0.5)1--2.4(3.2) dm'
2020 02 25

LOBELIA cardinalis L. var. pseudosplendens
BIOREGIONAL DISTRIBUTION: SnGb, SnBr, PR, s W&I (Inyo Mtns), DMtns (Panamint Range);
+ ', s W&I (Inyo Mtns)' added
2021 01 13

LOMATIUM caruifolium
FRUIT: 6--13 mm, ovate to obovate, glabrous; wings < body in width.
+ '+- thick,' deleted
2020 06 30

MALVA
6' Involucel < calyx; leaves sparsely stellate hairy; petals pale pink to white generally with 3 dark veins; stem base not woody .....-> M. multiflora
+ 'M. pseudolavatera' made 'M. multiflora'
2022 07 13

MALVA multiflora
+ 'pseudolavatera' made 'multiflora' [and description moved to conform to alphabetical order]
TAXON AUTHOR: (Cav.) Soldano, Banfi & Galasso
+ 'Webb & Berthel.' made '(Cav.) Soldano, Banfi & Galasso'
SYNONYMS: Lavatera cretica L.; Malva linnaei M.F. Ray superfl.; Malva pseudolavatera Webb. & Berthel.
+ '; Malva pseudolavatera Webb. & Berthel.' added
2022 07 13

MARAH fabacea
BIOREGIONAL DISTRIBUTION: CA-FP (exc n NW, n CaR), w DMoj exc DMtns.
+ 'DMoj' made 'w DMoj exc DMtns'
2020 06 30

MICROPUS
NOTE: Our species (sect. _Rhyncholepis_) may comprise a separate North American genus.
+ 'America.' made 'American'
2022 01 14

MONOTROPA uniflora
BIOREGIONAL DISTRIBUTION: NCo, KR, NCoRO, s SnFrB;
+ ', s SnFrB' added
2021 02 16

MONTIA linearis
TAXON AUTHOR: (Douglas) Greene
'Hook.' made 'Douglas'
2021 05 19

NAVARRETIA
45' Corolla 9--12 mm, > calyx, lobes dark to light blue to +- pink or +- white .....-> N. squarrosa
+ 'dark blue' made 'dark to light blue to +- pink or +- white'
2020 09 16

NAVARRETIA atractyloides
NOTE: Like _Navarretia hamata_, but bracts without grappling hook-like tips.
+ 'Like _Navarretia hamata_, but odor not skunk-like, bracts without grappling hook-like tips.' made 'Like _Navarretia hamata_, but bracts without grappling hook-like tips.'
2020 09 16

NAVARRETIA squarrosa
FLOWER: calyx 7--10 mm, lobes narrowly lanceolate; corolla 9--12 mm, > calyx, dark to light blue to +- pink or +- white, lobes 2 mm; stamens attached in tube, included; style included, stigmas 3, in mid tube, below anthers.
+ 'dark blue' made 'dark to light blue to +- pink or +- white'
2020 09 16

OENANTHE sarmentosa
LEAF: petiole 2--35 cm; blade 7--30 cm, 6--25 cm wide, generally 2-pinnate, leaflets 1--6 cm, +- ovate, serrate to lobed; basal leaveslong-petioled, ± oblong-lanceolate, cauline shorter-petioled, ± triangular-ovate.
+ 'petiole 1--3.5 dm' made 'petiole 2--35 cm'
+ 'blade 1--3 dm' made 'blade 7--30 cm'
+ 'cauline leaves like basal' made 'basal leaves long-petioled, ± oblong-lanceolate, cauline shorter-petioled, ± triangular-ovate'
2022 10 13

OLEACEAE
FLOWER: generally bisexual, generally radial; calyx generally minute (0), tube cup-shaped, teeth or lobes 4--15; petals (0)4--6(8), generally fused; nectar disk often present; stamens (0)2(4--5), epipetalous; pistil 1, ovary superior, chambers 2, each 2--4 ovuled, placenta axile, style 1, stigma generally 2-lobed.
+ 'calyx generally minute (0), tube cup-shaped, lobes 4--15' made 'calyx generally minute (0), tube cup-shaped, teeth or lobes 4--15'
2020 07 16

OREOCARYA subretusa
TAXON AUTHOR: (I.M. Johnst.) Abrams
+ 'I.M. Johnst.' made '(I.M. Johnst.) Abrams'
2022 06 01

PACKERA multilobata
ELEVATION: 1100--3445 m.
+ '3000' made '3445'
2022 01 14

PELARGONIUM
SPECIES IN GENUS: 280 species: southern Africa, St. Helena, Asia Minor, Madagascar, Australia.
+ '+- 300 species' made '280 species'
2022 05 03


PENSTEMON centranthifolius
TAXON AUTHOR: (Benth.) Benth. 
+ 'Benth.' made '(Benth.) Benth.'
2021 12 02

PHALARIS
5. Panicle lanceolate, branched, lobed, often +- purple; glumes 4--5 mm; fertile lemma 2.5--4 mm, sterile lemma 1.5--2 mm .....-> P. arundinacea
+ 'occasionally' made 'often'
2020 12 18

PHALARIS arundinacea
INFLORESCENCE: 5--40 cm, 2--15 cm wide, lanceolate, interrupted near base, lobed and branched, often +- purple.
+ 'branched in age' made 'branched'
2020 12 18

PHRYMACEAE
3. Annual, calyx lobes +-= tube, with faint unraised midribs; plant hairs dense, long, soft, wavy .....-> MIMETANTHE
+ 'calyx lobes longer than the calyx tube' made 'calyx lobes +-= tube'
3' Annual or perennial herb, calyx lobes generally << tube, with prominent midribs, plants hairy or glabrous .....-> ERYTHRANTHE
+ 'calyx lobes shorter than the calyx tube' made 'calyx lobes generally << tube'
2020 11 11

PINUS sabiniana
TAXON AUTHOR: Douglas
+ 'D. Don' made 'Douglas'
2022 01 19

PLAGIOBOTHRYS scriptus
COMMON NAME: SCRIBE'S POPCORNFLOWER
+ 'SCRIDGEE'S' made 'SCRIBE'S'

PRIMULA clevelandii var. patula
BIOREGIONAL DISTRIBUTION: CaRF, SNF, c SNH, GV, CW.
+ 'CaRF,' added
2021 03 23

PRIMULA hendersonii
BIOREGIONAL DISTRIBUTION: NW, CaR, SNF, SNH, GV, SnFrB, CW, SnBr;
+ 'n SHN' made 'SNH'
2021 03 23

PSEUDOGNAPHALIUM beneolens
BIOREGIONAL DISTRIBUTION: KR, NCoRO, NCoRI, SNF, n&s SNH, ScV, CW, SW;
+ 'KR, NCoRO, NCoRI, SNF, s SNH, ScV, SnFrB, SCoRO, SCo, SnGb, PR;' made 'KR, NCoRO, NCoRI, SNF, n&s SNH, ScV, CW, SW;'
2021 11 11

PSEUDOGNAPHALIUM biolettii
TAXON AUTHOR: Anderb. ex G. L. Nesom
+ 'Anderb.' made 'Anderb. ex G. L. Nesom'
2022 01 19

PSEUDOTSUGA menziesii var. menziesii
BIOREGIONAL DISTRIBUTION: NCo, KR, NCoR, CaRH, n&c SNH, CCo, SnFrB, SCoRO;
+ 'NCo,' added
2020 07 07

PYROLA picta
SYNONYMS: 
+ 'Pyrola picta Sm. f. aphylla (Sm.) Camp; Pyrola picta subsp. dentata (Sm.) Piper' deleted
2021 08 04

QUERCUS vacciniifolia
TAXON AUTHOR: Hittell
+ 'Kellogg' made 'Hittell'
2020 09 16

RHODODENDRON occidentale
BIOREGIONAL DISTRIBUTION: NW (exc NCoRH), CaRH, n SNF, SNH, CCo, SnFrB, n SCoRI, PR;
+ 'GV,' deleted
2020 05 28

RORIPPA columbiae
BIOREGIONAL DISTRIBUTION: CaRH, MP;
+ 'CaRH,' added
2020 04 08

SALICORNIA depressa
BIOREGIONAL DISTRIBUTION: CCo, SCo, w edge DMoj;
+ 'MP,' deleted
2020 12 09

SALIX lemmonii
BIOREGIONAL DISTRIBUTION: KR, s NCoRO (Lake Co.), s NCoRI (Sonoma Co.), CaRH, SNH, SnBr, SnJt, Wrn;
+ ', Wrn' added
2022 07 07

SARCODES sanguinea
BIOREGIONAL DISTRIBUTION: KR, NCoRO, NCoRH, CaRH, SNH, SCoRO, TR, e PR;
+ 'PR' made 'e PR'; ', MP' deleted
2020 09 01

SCORZONERA hispanica
BIOREGIONAL DISTRIBUTION: KR, NCoRO, w SnFrB;
+ ', w SnFrB' added
2021 06 16

SCROPHULARIACEAE
FLOWER: generally bisexual; calyx lobes 4--5; corolla bilateral to radial, lobes 4--5; stamens epipetalous, 4--5[6--8], 5th a staminode in _Scrophularia_; pistil 1, ovary superior, chambers generally 2, placentas axile, style 1, stigma lobes generally 2.
+ 'stamens epipetalous, 4--5,' made 'stamens epipetalous, 4--5[6--8],' 
2022 03 15

SEDUM paradisum subsp. paradisum
TAXON AUTHOR: (Denton) Denton ex B.L. Wilson
+ '(Denton) Denton ex B.L. Wilson' added
2022 08 31

SEDUM praealtum
BIOREGIONAL DISTRIBUTION: CCo (Santa Cruz Co.);
+ 'mouth of San Lorenzo River,' deleted
2020 11 11

SOLIDAGO elongata
UNABRIDGED NOTE: _Solidago elongata_ Nutt. conserved against _Solidago elongata_ P&eacute;pin (ICN 2018, Shenzhen Code).
+ '_Solidago elongata_ Nutt. is proposed for conservation against _Solidago elongata_ P&eacute;pin.' made '_Solidago elongata_ Nutt. conserved against _Solidago elongata_ P&eacute;pin (ICN 2018, Shenzhen Code).'
2021 09 08

SPERGULARIA rubra
BIOREGIONAL DISTRIBUTION: NW, CaR, c SNF, n&c SNH, GV, CW, SCo, SnGb, PR, DMtns;
+ 'ScV' made 'GV'
2020 05 12

STIPA
14' Leaf blade 2--10 mm wide, flat; panicle 10--40 cm, proximal inflorescence nodes generally 3--7-branched .....-> S. miliacea var. miliacea
+ '3--7 branched' made '3--7-branched'
2021 03 17

STREPTANTHUS glandulosus
NOTE: 8 subspecies recognized, all in California, most local.
+ '8 subspecies recognized, 7 in California, most local.' made '8 subspecies recognized, all in California, most local.
UNABRIDGED NOTE: _Streptanthus glandulosus_ subsp. _josephinensis_ endemic to southwestern Oregon, northwestern California.
+ 'endemic to southwestern Oregon.' made 'endemic to southwestern Oregon, northwestern California.'  
2021 07 21

STREPTANTHUS tortuosus
SYNONYMS: Streptanthus lemmonii S. Watson; Streptanthus tortuosus var. flavescens Jeps.; Streptanthus tortuosus var. orbiculatus (Greene) H.M. Hall; Streptanthus tortuosus var. suffrutescens (Greene) Jeps.; Streptanthus tortuosus var. oblongus Jeps.; Streptanthus tortuosus var. optatus Jeps.; Streptanthus tortuosus var. pallidus Jeps.; Streptanthus tortuosus var. tortuosus; Streptanthus tortuosus var. foliosus (Greene) D.W. Taylor
+ 'Streptanthus lemmonii S. Watson;' added
2020 01 28

STRUTHIOPTERIS spicant
TAXON AUTHOR: (L.) Weiss
+ 'F.W. Weiss' made 'Weiss'
2021 03 30

THALICTRUM fendleri
TAXON AUTHOR: Engelm. in A. Gray
+ 'ex' made 'in'
2022 03 31

TORREYA californica
BIOREGIONAL DISTRIBUTION: NCo, NCoR, CaRF, s CaRH, SN, CCo, SnFrB, n SCoRI.
+ 'SCoR' made 'n SCoRI'; 'CCo,' added; 's CaRH,' added
2020 09 24

TOXICODENDRON diversilobum
ELEVATION: < 2000 m.
+ '1650' made '2000'
BIOREGIONAL DISTRIBUTION: CA-FP;
+ ', sw edge DMoj' deleted
2020 07 07

TRIANTHEMA portulacastrum
BIOREGIONAL DISTRIBUTION: SnJV, e SCo, PR, D;
+ 'e SCo,' added; 'PR,' added
2021 01 13

TRIFOLIUM, Group 2
13. Flowers generally 1--5 per inflorescence, bracts generally inconspicuous; corolla white to lavender-striate; plant generally small (see Group 1, couplet 13 for subspecies) .....-> T. monanthum (2)
+ 'varieties' made 'subspecies'
2022 01 14

TRIFOLIUM, Group 2
47. Inflorescence < 1 cm wide, flowers generally 1--5, erect (see Group 1, couplet 13, for subspecies) .....-> T. monanthum (2)
+ 'varieties' made 'subspecies'
2022 01 14

TRISETUM
3. Spikelets generally to base of panicle branches; lower inflorescence branches ascending to erect; lower glume 3--5 mm .....-> T. canescens
+ 'Florets' made 'Spikelets'
3' Spikelets only at tips of panicle branches; lower inflorescence branches generally spreading; lower glume < 3 mm .....-> T. cernuum
+ 'Florets' made 'Spikelets'
2021 06 03

TRITELEIA laxa
FLOWERING TIME: Mar--Jun
+ 'Apr' made 'Mar'
2020 04 08

URTICA dioica subsp. holosericea
NOTE: Plants in shade tend to have wider leaves, fewer hairs, so approach _Urtica dioica_ subsp. _gracilis_. This name is a later homonym and therefore illegitimate, so that a new combination in Urtica dioica at the rank of subsp. needs to be made.
+ 'This name is a later homonym and therefore illegitimate, so that a new combination in Urtica dioica at the rank of subsp. needs to be made.' added
2022 03 31
 
VACCINIUM ovatum
BIOREGIONAL DISTRIBUTION: NCo, KR, NCoRO, CCo, SnFrB, SCoRO, n ChI (Santa Cruz, Santa Rosa islands), WTR, PR (uncommon);
+ 'SCoRO,' added
2020 07 07

NATIVE
VERONICA catenata
+ 'NATURALIZED' made 'NATIVE'
DISTRIBUTION OUTSIDE CALIFORNIA: widespread United States, adjacent Canada.
+ '; native to Europe' deleted
2020 08 25

VINCA major
ELEVATION: 2--1600 m.
+ '200' made '1600'
2022 06 14

YUCCA
2. Stem +- 0 or short-decumbent, rosettes at tips, +- at ground; perianth parts 5--13 cm, fused > 1 mm; e D .....-> Y. baccata var. baccata
+ 'e DMtns' made 'e D'
2020 03 25

YUCCA
2' Stem erect, rosettes at tips, well above ground; perianth parts 3--5 cm, free or fused < 1 mm; SW (exc WTR & SnGb & ChI), s DMoj, nw DSon .....-> Y. schidigera
+ 's SW (San Diego Co.), s DMoj, nw DSon' made 'SW (exc WTR & SnGb & ChI), s DMoj, nw DSon
2020 03 25

YUCCA baccata var. baccata
ELEVATION: 800--1800 m.
+ '1300' made '1800'
BIOREGIONAL DISTRIBUTION: e D;
+ 'e DMtns;' made 'e D;'
2020 03 25

YUCCA baccata var. baccata
BIOREGIONAL DISTRIBUTION: e DMoj;
+ 'e D' made 'e DMoj'
2020 04 08

YUCCA schidigera
BIOREGIONAL DISTRIBUTION: SW (exc ChI, WTR & SnGb), s DMoj, nw DSon;
+ 's SW (San Diego Co.), s DMoj, nw DSon' made 'SW (exc ChI, WTR & SnGb), s DMoj, nw DSon
[position of ChI in string corrected 2020 04 08]
2020 03 25
