
use BerkeleyDB::Hash;
#use warnings;
#use strict;
use BerkeleyDB;
use lib "/Users/Shared/Jepson-Master/Jepson-eFlora/Modules/";
use flatten;
use CCH;

my %TNOAN;
my %IJM_key;
my %HEX;
my %KEYTABLE;
my %CNPS;
my @lines;
my @FT;
my %TID;
my %monthno;
my %seen;
my ($genus_test, $smasch_code, $smasch_name, @residue,$gen_count) = "";
my ($taxon_id, $genus, $gr_lines, $fam_lines,$fam_id) = "";
my ($count_lines, $count, $family, $group, %FAM,%combine) = "";



open(IN, "/Users/Shared/Jepson-Master/Jepson-eFlora/synonymy/input/smasch_taxon_ids.txt") || die;
while(<IN>){
	chomp;
	s/X /&times;/;
	next if m/^#/;
	($smasch_code,$smasch_name,@residue)=split(/\t/);

	$smasch_name =~ s/Encelia farinosa &times;Encelia frutescens/Encelia farinosa &times; Encelia frutescens/;

	$TNOAN{$smasch_name}=$smasch_code;
	$TID{$smasch_code}=$smasch_name;
	
}
close(IN);

#this function indicates the record delimiter. In this case, an empty line
#as such, it needs to be designated after the other files are processed
$/="";

open(OUT, ">output/toc.html") || die;


print OUT <<EOP;

<?php

date_default_timezone_set('America/Los_Angeles');

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>Table of Contents: Jepson eFlora, Jepson Herbarium </title>
<meta charset="UTF-8">
<meta name="description" content="For vascular plants occurring in wildlands or otherwise outside of cultivation in California, the Jepson eFlora contains taxonomic treatments, distribution maps, illustrations, photographs, and identification keys.">
  <meta name="keywords" content="California Flora, Jepson eFlora, Flora of California, Vascular Plants of California, Jepson Flora Project, ">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="/common/styles/dropdowns.css" rel="stylesheet" type="text/css" />
<link href="/common/css/jepson_eflora.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="/common/images/JepsonLogoSmall.png" type="image/x-icon" />



<style type="text/css" media="screen">

#ckboxes {	/* pushes checkbox a little from sidebar left edge */
	padding-left: 10px;
}


</style>

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
<?php include(\$_SERVER['DOCUMENT_ROOT'].'/common/php/header_jeps.php'); ?>
<!-- End banner -->

<!-- Beginning of horizontal menu -->
<?php include(\$_SERVER\['DOCUMENT_ROOT'].'/common/php/globalnav.php'); ?> 
<!-- End of horizontal menu -->

<!-- Start of sidebar menu-->
<?php include(\$_SERVER['DOCUMENT_ROOT'].'/common/php/localnav_media.php'); ?>
<!-- End of sidebar --> 

	 <table align="center" width="100%">
	  <tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>
<!--eFlora index-->

<?php include(\$_SERVER['DOCUMENT_ROOT'].'/common/php/front_page_index_bar.php'); ?>

<!--end eFlora index-->
    <td>&nbsp;</td>
    <td>&nbsp;</td>
   </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>

    <td width="100%"><span class="pageName"><a href="/eflora/">Jepson eFlora:</a> Table of families and genera</span><br /><br />

<div id="content">

<table width="95%" border="2" align="center" cellpadding="1" cellspacing="0" bordercolor="#C0DFFD">
<tr><th class="pageSubheading">Section</th><th valign="middle" class="pageSubheading">Family</th>
<th class="pageSubheading" width="60%">Genera</th>
</tr>


EOP

#first construct the combining of all genera per family in one line separated by '|'
my $file="../eflora_database/input/eflora_treatments.txt";
	open(IN,$file) || die "couldn't open $file\n";

while(<IN>){
     next if m/^#/; #skip lines that are commented out
     next if m/^Admin/;	#skip lines that start with Admin

++$count_lines;
#replace underscore italics indicators with HTML italics tags. Maybe this should be done in PHP?
	s/_n_/<i>n<\/i>/g;

	s/ _/ <i>/g;
	s/\(_/\(<i>/g;
	s/"_/"<i>/g;
	s/\[_/\[<i>/g;
	s/\/_/\/<i>/g;
	s/,_/,<i>/g;
	s/;_/;<i>/g;
	
	s/_ /<\/i> /g;
	s/_"/<\/i>"/g;
	s/_\]/\]<\/i>/g;
	s/_,/<\/i>,/g;
	s/_\./<\/i>./g;
	s/_\)/<\/i>\)/g;
	s/_;/<\/i>;/g;
	s/_:/<\/i>:/g;
	s/_-/<\/i>-/g;
	s/_\//<\/i>\//g;
	s/_\n/<\/i>\n/g;

#Escaping single quotes for SQL insert
	s/'/''/g;

if(m/([A-Z]+ACEAE)/){ #when it encounters a CAPS string ending in ACEAE
$family=$1; #that word is assigned to $family (until it gets reassigned)
++$fam_lines;
}

if(m/CAPTION: ([A-Z]+) \(/){ #when it encounters a Caption string
$group=$1; #that word is assigned to $group (until it gets reassigned)
++$gr_lines;
}


	my $taxon_name= &get_taxon_name($_);
	my $genus= &get_genus_name($_);

#test the values extracted
if ($taxon_name !~ /^[A-Z]+ACEAE/i){
#print $taxon_name."\n";
	if ($taxon_name =~ /^([A-Z-]+)$/){
		#print $1."\n";
		$genus_test = $1;
	}
}

	if($genus =~/^[A-Z-]+$/){ #if the first line contains...
		if( $genus !~/^[A-Z-]ACEAE/){ #if the first is not a family...
        	if($genus !~/^(POSSIBLY|CULTIVATED|WAIF|EXTIRPATED|HISTORICAL|SPONTANEOUS|AGRICULTURAL|GARDEN|URBAN|NATIVE|NATURAL)/){
				++$gen_count;
			}
			else{
				print "BAD==>".$genus."\n"; #don't return anything for that paragraph
			}
    	}
    }


$genus_test=ucfirst(lc($genus_test));

$genus=ucfirst(lc($genus));

$family=ucfirst(lc($family));

$group=ucfirst(lc($group));

#Some families have alternate names in parens, e.g. "Asteraceae (Compositae)"
#first, make sure the alternate name is capitalized correctly
if ($family =~ /([A-Z][a-z]+aceae) \((.*)\)/){ #can't have the parens as part of $2, otherwise the ucfirst function will target the open paren
	$family = $1; 
} 

next if $genus =~ m/^[A-Z][a-z-]+ [a-z-]+/;
next if $genus =~ m/^[A-Z][a-z-]+ X [a-z-]+/;
next if $genus =~ m/^[A-Z][a-z-]+ &times;[a-z-]+/;

$taxon_id = $TNOAN{$genus};
$fam_id = $TNOAN{$family};



	unless ($taxon_id =~ m/^\d+$/){
			next if $genus =~ m/^(NULL| *)$/i;
			print "TAXON_ID (GEN) non numerical or NULL: $genus==>$taxon_id\n";
	}

	unless ($fam_id =~ m/^\d+$/){
			next if $family =~ m/^(NULL| *)$/i;
			print "TAXON_ID (FAM) non numerical or NULL: $family==>$fam_id\n";
	}

	
	next unless $taxon_id;

	$FAM{$genus}=$family;

		if ($genus ne $genus_test){
			#print "BAD?: $family==>$genus\n" unless $seen{$genus}++;
		}

#print out the plain matched taxon names to file used by synonymy script
#print "$group FOUND: $family==>$genus\n" unless $seen{$genus}++;

	if ($genus !~ m/^[A-Z][a-z-]+aceae$/){
		foreach ($genus){
				++$count;
			if ($family eq $FAM{$genus}){
				$combine{$family} .= "<a href='/eflora/eflora_display.php?tid=".$taxon_id."'>".$genus."</a>&nbsp;|&nbsp;"; 
			}
		}
	}


}

close (IN);


# now process the file again to produce the webpage and eliminate any duplicate genus lines
my %seen;
my ($genus_test,$taxon_id, $genus,$fam_id) = "";
my ($count_lines, $family, $group,$fam_lines,$gr_lines) = "";


my $file="/Users/Shared/Jepson-Master/Jepson-eFlora/eflora_database/input/eflora_treatments.txt";
	open(IN,$file) || die "couldn't open $file\n";

while(<IN>){
     next if m/^#/; #skip lines that are commented out
     next if m/^Admin/;	#skip lines that start with Admin

++$count_lines;
#replace underscore italics indicators with HTML italics tags. Maybe this should be done in PHP?
	s/_n_/<i>n<\/i>/g;

	s/ _/ <i>/g;
	s/\(_/\(<i>/g;
	s/"_/"<i>/g;
	s/\[_/\[<i>/g;
	s/\/_/\/<i>/g;
	s/,_/,<i>/g;
	s/;_/;<i>/g;
	
	s/_ /<\/i> /g;
	s/_"/<\/i>"/g;
	s/_\]/\]<\/i>/g;
	s/_,/<\/i>,/g;
	s/_\./<\/i>./g;
	s/_\)/<\/i>\)/g;
	s/_;/<\/i>;/g;
	s/_:/<\/i>:/g;
	s/_-/<\/i>-/g;
	s/_\//<\/i>\//g;
	s/_\n/<\/i>\n/g;

#Escaping single quotes for SQL insert
	s/'/''/g;

if(m/([A-Z]+ACEAE)/){ #when it encounters a CAPS string ending in ACEAE
$family=$1; #that word is assigned to $family (until it gets reassigned)
++$fam_lines;
}

if(m/CAPTION: ([A-Z]+) \(/){ #when it encounters a Caption string
$group=$1; #that word is assigned to $group (until it gets reassigned)
++$gr_lines;
}


	my $taxon_name= &get_taxon_name($_);
	my $genus= &get_genus_name($_);

if ($taxon_name !~ /^[A-Z]+ACEAE/i){
#print $taxon_name."\n";
	if ($taxon_name =~ /^([A-Z-]+)$/){
		#print $1."\n";
		$genus_test = $1;
	}
}

$genus_test=ucfirst(lc($genus_test));

$genus=ucfirst(lc($genus));

$family=ucfirst(lc($family));

$group=ucfirst(lc($group));

#Some families have alternate names in parens, e.g. "Asteraceae (Compositae)"
#first, make sure the alternate name is capitalized correctly
if ($family =~ /([A-Z][a-z]+aceae) \((.*)\)/){ #can't have the parens as part of $2, otherwise the ucfirst function will target the open paren
	$family = $1; 
} 

$taxon_id = $TNOAN{$genus};
$fam_id = $TNOAN{$family};
	
	next unless $taxon_id;

			if ($group =~ m/^Lycophytes/i){
				unless ($seen{$family}++){#one line per family
					print OUT "<tr bgcolor='#dddddd'><td>".$group."</td><td valign='middle'>";
					print OUT "<a href='/eflora/eflora_display.php?tid=".$fam_id."'>".$family."</a></td>";
					print OUT "<td valign='middle'>".$combine{$family}."</td></tr>\n";
				}
			}
			
			if ($group =~ m/^Ferns/i){
				unless ($seen{$family}++){#one line per family
					print OUT "<tr><td>".$group."</td><td valign='middle'>";
					print OUT "<a href='/eflora/eflora_display.php?tid=".$fam_id."'>".$family."</a></td>";
					print OUT "<td valign='middle'>".$combine{$family}."</td></tr>\n";
				}
			}

			if ($group =~ m/^GYMNOSPERMS/i){
				unless ($seen{$family}++){#one line per family
					print OUT "<tr bgcolor='#dddddd'><td>".$group."</td><td valign='middle'>";
					print OUT "<a href='/eflora/eflora_display.php?tid=".$fam_id."'>".$family."</a></td>";
					print OUT "<td valign='middle'>".$combine{$family}."</td></tr>\n";
				}
			}

			if ($group =~ m/^NYMPHAEALES/i){
				unless ($seen{$family}++){#one line per family
					print OUT "<tr><td>".$group."</td><td valign='middle'>";
					print OUT "<a href='/eflora/eflora_display.php?tid=".$fam_id."'>".$family."</a></td>";
					print OUT "<td valign='middle'>".$combine{$family}."</td></tr>\n";
				}
			}

			if ($group =~ m/^MAGNOLIIDS/i){
				unless ($seen{$family}++){#one line per family
					print OUT "<tr bgcolor='#dddddd'><td>".$group."</td><td valign='middle'>";
					print OUT "<a href='/eflora/eflora_display.php?tid=".$fam_id."'>".$family."</a></td>";
					print OUT "<td valign='middle'>".$combine{$family}."</td></tr>\n";
				}
			}

			if ($group =~ m/^CERATOPHYLLALES/i){
				unless ($seen{$family}++){#one line per family
					print OUT "<tr><td>".$group."</td><td valign='middle'>";
					print OUT "<a href='/eflora/eflora_display.php?tid=".$fam_id."'>".$family."</a></td>";
					print OUT "<td valign='middle'>".$combine{$family}."</td></tr>\n";
				}
			}

			if ($group =~ m/^EUDICOTS/i){
				unless ($seen{$family}++){#one line per family
					print OUT "<tr bgcolor='#dddddd'><td>".$group."</td><td valign='middle'>";
					print OUT "<a href='/eflora/eflora_display.php?tid=".$fam_id."'>".$family."</a></td>";
					print OUT "<td valign='middle'>".$combine{$family}."</td></tr>\n";
				}
			}

			if ($group =~ m/^MONOCOTS/i){
				unless ($seen{$family}++){#one line per family
					print OUT "<tr><td>".$group."</td><td valign='middle'>";
					print OUT "<a href='/eflora/eflora_display.php?tid=".$fam_id."'>".$family."</a></td>";
					print OUT "<td valign='middle'>".$combine{$family}."</td></tr>\n";
				}
			}


}



print <<EOP;
TOTAL lines in eflora_treatments: $count_lines

Family line count: $fam_lines
Group line count: $gr_lines
Genera added to TOC: $count

This count above should match the genus count on the summary stats page


END EFLORA TOC STATS
EOP

print OUT <<EOP;
		</table>
	</div>
	</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
   </tr>
</table>

<!--Begin footer-->
<?php include(\$_SERVER['DOCUMENT_ROOT'].'/common/php/eflora_footer.php'); ?>
<!--End footer-->

</body>
</html>

EOP

close (OUT);
close (IN);

###########################################

sub format_for_SQLite {
	#given exactly one variable
	#if the variable has contents, put single quotes around the string
	#else, return "NULL" without quotes
	my ($input) = @_;
	if ($input){
		return "\'$input\'";
	}
	else {
		return "NULL";
	}
}

sub basic_get {
	#for tags that don't require any special processing
	#the following basic formula is used
	#given the tage name as a second variable
	my($paragraph, $tag) = @_;
	if($paragraph =~ /$tag: *(.*)/){
		return "\'$1\'";
	}
	else {
		return "NULL";
	}
}

sub get_taxon_name {
    my $par = shift; #each paragraph is separated by a blank line
    @lines=split(/\n/,$par); #the array of lines within a paragraph are values separated by a new line
	if($lines[1]=~/^(POSSIBLY IN CA|CULTIVATED PLANT|WAIF|EXTIRPATED ALIEN|EXTIRPATED WAIF|EXTIRPATED WEED|EXTIRPATED|HISTORICAL WAIF|SPONTANEOUS HYBRID|AGRICULTURAL WEED|GARDEN WEED|URBAN WEED|GARDEN AND URBAN WEED|AGRICULTURAL, GARDEN, OR URBAN WEED|URBAN WEED EXPECTED IN WILDLANDS)/){
        return $lines[2]; #elsif the second line starts with any of the above values, the name is what's on the third line
		#ASCLEPIAS curassavica is also an anomaly here as Line 0 is UNABRIDGED and Line 1 CULTIVATED PLANT
		#this was also not parsing correctly in the old way
    }
    elsif( $lines[0]=~/^WAIF/){ #if the first line starts with...
        return $lines[1]; #the name is what's on the second line
    }
    elsif( $lines[0]=~/^(NATIVE|NATURALIZED)/){ #if the first line starts with...
        return $lines[1]; #the name is the contents of the second line
        #The name for Zeltnera arizonica is on line 2, Line 0 is NATIVE and line 1 is EXTIRPATED
        #in the old code, this was first as 'if', but Zeltnera arizonica was always and error, 
        #since line 1 is not the name
    }
    elsif($lines[0]=~/UNABRIDGED/){ #elsif the first line starts with "UNABRIDGED"
        return $lines[1]; #the name is what's on the second line
    }
    elsif( $lines[0]=~/^(CAPTION|LYCOPHYTES|FERNS|gymnosperms|nymphaeales|magnoliids|ceratophyllales|eudicots)/i){ #skip the caption lines
        return "NULL"; #don't return anything for that paragraph
    }
    elsif( $lines[0]=~/^[A-Z][A-Z][A-Z]/){ #elsif the first line starts with three capital letters...
        return $lines[0] #the name is what's on the first line
    }
    else{ #otherwise...
        return "NULL"; #don't return anything for that paragraph
    }
}

sub get_genus_name {
    my $par = shift; #each paragraph is separated by a blank line
    @lines=split(/\n/,$par); #the array of lines within a paragraph are values separated by a new line
	if( $lines[0]=~/^[A-Z-]+$/){ #if the first line contains...
		if( $lines[0]!~/^[A-Z-]ACEAE/){ #if the first is not a family...

			if( $lines[1]=~/^(COMMON|TJM.+AUTHOR|HABIT)/){ #if the SECOND line starts with...
        		return $lines[0]; #the name is the contents of the first line
    		}
    		else{ #otherwise...
        			if($lines[1]!~/^(POSSIBLY|CULTIVATED|WAIF|EXTIRPATED|HISTORICAL|SPONTANEOUS|AGRICULTURAL|GARDEN|URBAN|NATIVE|NATURAL)/){
						return $lines[1]; #don't return anything for that paragraph
					}
					else{
						return "NULL"; #don't return anything for that paragraph
					}
    		}
    	}
    }
    else{ #otherwise...
        return "NULL"; #don't return anything for that paragraph
    }
}

sub strip_name{
local($_) = @_;

s/"//g;
$_=ucfirst($_);

s/  +/ /g;
s/^ +//;
s/ +$//;

#encelioides (Cav.) Benth. & Hook. f. ex A. Gray subsp. exauriculata
s/Hook\. f\. ex A\. Gray/Hook. filius ex A. Gray/i;

#add additional 'filial' authorities at this point so they parse correctly, JAA
s/Ait\. f\./Ait. filius/g;
s/Backh\. f\./Backh. filius/g;
s/Baker f\./Baker filius/g;
s/Bakh\. f\./Bakh. filius/g;
s/Balf\. f\./Balf. filius/g;
s/Burm\. f\./Burm. filius/g;
s/Brunner,? f\./Brunner filius/g;
s/Celakovsky f\./L.F. Celak./g;
s/Delar\. f\./Delar. filius/g;
s/Forst\. f\./Forst. filius/g;
s/Gaertn\. f\./Gaertn. filius/g;
s/Gagnaire f\./Gagnaire filius/g;
s/Haage f\./Haage filius/g;
s/Haller f\./Haller filius/g;
s/Hallier f\./Hallier filius/g;
s/Harr\. f\./Harr. filius/g;
s/Hedw\. f\./Hedw. filius/g;
s/Hirats\. f\./Hirats. filius/g;
s/Hook\. f\./Hook. filius/g;
s/Hooker f\./Hooker filius/g; #some people dont abbreviate Hooker
s/Jacq\. f\./Jacq. filius/g;
s/Kickx f\./Kickx filius/g;
s/Kampm\. f\./Kampm. filius/g;
s/Keng f\./Keng filius/g;
s/Klokov f\./Klokov filius/g;
#s/L\. f\. sulcat/f. sulcat/g;

s/L\. f\. var./L. filius var./g;
s/L\. f\. subsp./L. filius subsp./g;
s/L\. f\./L. filius/g;
s/L\. *filius azure/L. f. azure/g; #fix special cases where L. f. is a forma name not filius, Anagallis arvensis L. f. azurea Hyl.
s/L\. *filius vine/L. f. vine/g; #fix special cases where L. f. is a forma name not filius, Allium vineale L. f. vineale
s/L\. *filius comp/L. f. comp/g; #fix special cases where L. f. is a forma name not filius, Allium vineale L. f. compactum L.
s/L\. *filius tome/L. f. tome/g; #fix special cases where L. f. is a forma name not filius, Acer rubrum L. f. tomemtosum L. 
s/L\. *filius sang/L. f. sang/g; #fix special cases where L. f. is a forma name not filius, Acer negundo L. f. sanguineum L. Martin
s/L\. *filius masc/L. f. masc/g; #fix special cases where L. f. is a forma name not filius, Orchis morio L. f. mascula L.
s/L\. *filius lute/L. f. lute/g; #fix special cases where L. f. is a forma name not filius, Ophrys insectifera L. f. luteomarginata L. Lewis
s/L\. *filius micr/L. f. micr/g; #fix special cases where L. f. is a forma name not filius, Jasminum humile L. f. microphyllum L.C. Chia
s/L\. *filius sask/L. f. sask/g; #fix special cases where L. f. is a forma name not filius, Carex capillaris L. f. saskatschewana (Boeckeler) L.H. Bailey
s/L\. *filius negl/L. f. negl/g; #fix special cases where L. f. is a forma name not filius, Celtis occidentalis L. f. neglecta L.
s/L\. *filius duri/L. f. duri/g; #fix special cases where L. f. is a forma name not filius, Eryngium campestre L. f. duriberum L.
s/L\. *filius glab/L. f. glab/g; #fix special cases where L. f. is a forma name not filius, Dioscorea villosa L. f. glabrata L.
s/L\. *filius prae/L. f. prae/g; #fix special cases where L. f. is a forma name not filius, Silphium trifoliatum L. f. praecisum L.M. Perry
s/L\. *filius pinn/L. f. pinn/g; #fix special cases where L. f. is a forma name not filius, Quercus alba L. f. pinntifida L.
s/L\. *filius sulc/L. f. sulc/g; #fix special cases where L. f. is a forma name not filius, Zostera marina L. f. sulcatifolia Setchell
s/L\. *filius pinn/L. f. vill/g; #fix special cases where L. f. is a forma name not filius, Cardiospermum corindum L. f. villosum (Mill.) Radlk
s/Lestib\. f\./Lestib. filius/g;
s/Lindb\. f\./Lindb. filius/g;
s/Lindm\. f\./Lindm. filius/g;
s/Luer f\./Luer filius/g;
s/Michx\. f\./F. Michx./g;
s/Michaux f\./F. Michx./g;
s/Occhioni f\./Occhioni filius/g;
s/Pearsall f\./Pearsall filius/g;
s/Phil\. f\./Phil. filius/g;
s/Rchb\. f\./Rchb. filius/g;
s/Rech\. f\./Rech. filius/g;
s/Rehb\. f\./Rehb. filius/g;
s/Reichenb\. f\./Reichenb. filius/g;
s/Reichenbach f\./Reichenbach filius/g;
s/Scheuchzer f\./Scheuchzer filius/g;
s/Schultes f\./Schultes filius/g;
s/Schult\. f\./Schult. filius/g;
s/Wallr\. f\./Wallr. filius/g;
s/Wendl\. f\./Wendl. filius/g;



s/,//g; #delete stray commas
s/^([A-Z][A-Za-z-]+) (\b[-a-z]+) [\w&;'().\- ]+ (\bsubvar\.|\bsubsp\.|\bvar\.|\bf\.|\bnothosubsp\.) (\b[a-z-]+) [\w&;'().\- ]+/$1 $2 $3 $4/ ||
s/^([A-Z][A-Za-z-]+) (\b[-a-z]+) [\w&;'().\- ]+ (\bsubvar\.|\bsubsp\.|\bvar\.|\bf\.|\bnothosubsp\.) ([-a-z]+)/$1 $2 $3 $4/ ||
s/^([A-Z][A-Za-z-]+) (\b[-a-z]+) (\bsubvar\.|\bsubsp\.|\bvar\.|\bf\.|\bnothosubsp\.) ([-a-z]+) [\w&;'().\- ]+/$1 $2 $3 $4/ ||
s/^([A-Z][A-Za-z-]+) (\b[-a-z]+) (\bsubvar\.|\bsubsp\.|\bvar\.|\bf\.|\bnothosubsp\.) ([-a-z]+)/$1 $2 $3 $4/ ||
s/^([A-Z][A-Za-z-]+) (\b&times;)([-a-z]+) [\w&;'().\- ]+/$1 $2$3/||
s/^([A-Z][A-Za-z-]+) (\b&times;)([-a-z]+)/$1 $2$3/||
s/^([A-Z][A-Za-z-]+) (\b[-a-z]+) [\w&;'().\- ]+/$1 $2/||
s/^([A-Z][A-Za-z-]+) (\b[-a-z]+)/$1 $2/||
s/^(&times;)([A-Z]?[A-Za-z-]+) (\b[-a-z]+) [\w&;'().\- ]+/$1$2 $3/||
s/^(&times;)([A-Z]?[A-Za-z-]+) (\b[-a-z]+)/$1$2 $3/;
s/ +/ /;
s/ +$//;
s/^ +//;


#s/^([A-Z][A-Za-z-]+) ([-a-z]+) ?.* (subvar\.|subsp\.|var\.|f\.|nothosubsp\.) ([-a-z]+).*/$1 $2 $3 $4/ ||
#s/^([A-Z][A-Za-z-]+) (&times;)([-a-z]+) .+/$1 $2$3/||
#s/^([A-Z][A-Za-z-]+) (&times;)([-a-z]+)/$1 $2$3/||
#s/^([A-Z][A-Za-z-]+) (&times;) ([-a-z]+) .+/$1 $2$3/||
#s/^([A-Z][A-Za-z-]+) (&times;) ([-a-z]+)/$1 $2$3/||
#s/^([A-Z][A-Za-z-]+) ([-a-z]+) .+/$1 $2/||
#s/^([A-Z][A-Za-z-]+) ([-a-z]+)/$1 $2/||
#s/^(&times;)([A-Z][a-z-]+) ([-a-z]+) (.+)/$1$2 $3/||
#s/^(&times;)([A-Z][a-z-]+) ([-a-z]+)/$1$2 $3/;
#s/  +/ /;
#s/^ +//;
#s/ +$//;


#print "$_ \n";
$_;
}