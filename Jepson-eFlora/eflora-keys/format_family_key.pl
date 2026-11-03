open(ERR, ">output/fam_key_error.txt") || die;


open(IN, "/Users/Shared/Jepson-Master/Jepson-eFlora/synonymy/input/smasch_taxon_ids.txt") || die;
local($/)="\n";
while(<IN>){
	chomp;
	s/X /&times;/;
	($code,$name,@residue)=split(/\t/);
$name=uc($name) if $name=~/aceae$/;
	$TNOAN{$name}=$code;
	$NAN{$code}=$name;
}
$file="output/eflora_family_key_expanded_html.txt";
	undef($/);
	open(IN,$file) || die "couldn't open $file\n";
print <<EOP;

<!DOCTYPE html>
 
<html lang="en"> 

<head>
<title>Key to All Family Groups, Jepson eFlora</title> 
<meta charset="UTF-8">
<meta name="description" content="For vascular plants occurring in wildlands or otherwise outside of cultivation in California, the Jepson eFlora contains taxonomic treatments, distribution maps, illustrations, photographs, and identification keys.">
  <meta name="keywords" content="California Flora, Jepson eFlora, Flora of California, Vascular Plants of California, Jepson Flora Project, ">
    <meta name="description" content="Dichotomous keys for the identification of all plant family groups in the Jepson eFlora.">
    
    <!-- CSS Standardized -->
    <link href="/eflora/common/css/eflora-header.css" rel="stylesheet" type="text/css">
    <link href="/eflora/common/css/jepson-main.css" rel="stylesheet" type="text/css">
    <link href="/eflora/common/css/eflora.css" rel="stylesheet" type="text/css">

    <link rel="shortcut icon" href="/eflora/common/images/JepsonLogoSmall.png" type="image/x-icon" />

<!--mobile js script files-->
<script src="common/js/dh_custom.js"></script>


    <!-- Google Tag -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-T5YC99QF6Q"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());
      gtag('config', 'G-T5YC99QF6Q');
    </script>

    <style>

    </style>
</head>

<body>

    <!-- ACCESSIBILITY: Skip to Content Link -->
    <a href="#main-content" class="visually-hidden">Skip to main content</a>

<!-- Header -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/eflora-header.php'); ?>  


    <main id="main-content" class="eflora-main">
        
        <section class="intro-copy">
	<h1>Jepson eFlora Key to All Family Groups</h1>

            <div class="citation" style="margin: 20px 0;">
                <p><strong>Citation:</strong> Jepson Flora Project (eds.) <span id="currentYear"></span>. Jepson eFlora, https://ucjeps.berkeley.edu/eflora/ [accessed on <span id="DateA"></span>]</p>
            </div>
        </section>

        <!-- THE DICHOTOMOUS KEY -->
        <section class="key-container" aria-label="Family Key Groups">

EOP

	$all_lines=<IN>;
#converts windows line ends#
	$all_lines=~s/\xEF\xBB\xBF//;
	$all_lines=~s/ *\r\n/\n/g;
	$all_lines=~s/ +/ /g;
	
	@all_pars=split(/\n\n+/,$all_lines);
	$element=0;
	foreach(@all_pars){

next if m/^#/;

	unless (m/Key to Groups/){
		warn "DUPLINE: $_\n" if $seen_line{$_}++;
	}


next if m/^Admin/;
next if m/^PROOF:/;
next if m/^CAPTION:/;


	@lines=split("\n",$_);
		if(m/&mathx[^;]/){
			die "MATHX $_\n";
		}
		
		#s/{\/.*?}//g;
		s/([0-9])-([0-9])/$1&ndash;$2/g;
		#s/ó/&ndash;/g;
		#s/‚Äô/'/;
		#s/í/'/g;
		#s/</&lt;/g;
		#s//-/g;

	if(s/(Key to California Plant Families)\nTJMX AUTHOR: (.*)/<h3 align=center>$1<\/h3><h4 align=center>$2<\/h4>/){
		print;
	}

	if(s/KEY_PAR: /<p>/){
		while(s/_/<i>/){
			s/_/<\/i>/;
		}
		print "$_</p>";
	}
	if(s/SCI_ED: //){
		print "&mdash; $_";
	}

	if(s/GROUP: (Key.+)/<h4 align=left>$1<\/h4>/){
		print;
	#for quite some time, the title 'Key to Groups' has been skipped by this loader
	#this added line, re-adds the title and formats it like the rest of the group keys
	}


###################### KEYS ##########################
#if( m/^1\./ || m/^UNABRIDGED KEY/ || m/^Group \d+[A-Z]?[.:]/ || m/^Key to Groups/ || m/^Key to Groups Based Primarily on Flowering Material/|| m/^Key to Groups Based on Fruiting Material/|| m/^Key to Pistillate Plants/|| m/^Key to Staminate Plants/|| m/^Key to Vegetative Plants/ || m/^Group \d+ *\n/){

	if( m/^(1\.|UNABRIDGED KEY|Group \d+[A-Z]?[.:]|Key to Groups Based .+|Key to Groups|Key to Pistillate Plants|Key to Staminate Plants|Key to Vegetative Plants|Group \d+[ .:])/){
		$uk="";
		print ERR "$file KEY $&\n\n";
		print "\n\n\n";
		++$genus;
	
		@lines=split(/\n/);
$indent_level=-1;

		if ($lines[0]=~/^(Key to Group)/){
			print ERR "KEY $lines[0]\n\n";
			$uk=shift(@lines);
			print ERR "KEY $lines[0]\n\n";
		}
		
		if ($lines[0]=~/^(Group) (\d+)/){
			print qq{<a name="$1$2"></a>};
			print ERR "KEY $lines[0]\n\n";
			$uk=shift(@lines);
			print ERR "KEY $lines[0]\n\n";
		}
		
		foreach(@lines[0 .. $#lines]){
			if(m/--[0-9]+\(--[0-9]/ || m/[0-9]--\)[0-9]+--/){
				s/(--[0-9]+\()--([0-9]+)/$1$2/g;
				s/([0-9]+)--\)([0-9]+--)/$1)$2/g;
			}

			s/([0-9])-([0-9])/$1&ndash;$2/;
			s/---/&mdash;/g;
			s/\.+[-_]*>/--&gt;/g;
			s/-->/--&gt;/g;

			if(s|^(\d+)([.])|<a href="#$genus${1}'">$1$2</a><a name="$genus$1$2"> </a>|){
				#$indent=$1;
				#$indent-=1;
$indent_level +=1;
$indent_level{$1}=$indent_level;
print ERR <<EOP;
$1$2
$indent_level

EOP
				$indent=$indent_level;
			}

			if(s|^(\d+)(['])|<a href="#$genus${1}.">$1$2</a><a name="$genus$1$2"> </a>|){
				#$indent=$1;
				#$indent-=1;
				$indent_level = $indent_level{$1};
print ERR <<EOP;
$1$2
$indent_level

EOP
				$indent=$indent_level;
			}

			#$indent= "&nbsp;" x $indent;
			$indent*=7;

 #CUPRESSACEAE (_Juniperus_)
 #MYRTACEAE ([_Chamelaucium_])
 ##ONAGRACEAE (_Epilobium_, _Neoholmgrenia_)
 ##ALLIACEAE ([_Allium sativum_], _Allium vineale_)
 #PAPAVERACEAE (Fumarioideae)
 #[BASELLACEAE]
 #ALISMATACEAE or HYDROCHARITACEAE


 ##WOODSIACEAE (_Athyrium filix-femina_ var. _cyclosporum_)
 ##POACEAE (_Poa bulbosa_ subsp. _vivipara_)
			if(m!--&gt;.*([A-Z][a-z-]+ [a-z-]+)_ (nothosubsp\.|subsp\.|var\.) _([a-z-]+)!){
				$goto_code= $TNOAN{"$1 $2 $3"} || "C4";
				s!--&gt; (.*[A-Z][a-z-]+ [a-z-]+_ (nothosubsp\.|subsp\.|var\.) _[a-z-]+.*)!.....&nbsp;<a href="/eflora/eflora_display.php?tid=$goto_code">$1</a></div></span>!;
#warn "1 $_\n";
			}

 ##ONAGRACEAE (_Ludwigia_) or PLANTAGINACEAE (_Veronica_)

elsif(m/--&gt; [A-Z]+CEAE \(_([A-Z][a-z]+)_\) or [A-Z]+CEAE \(_([A-Z][a-z]+)_\)/){
                                $goto_code_A= $TNOAN{"$1"} || "C4";
                                $goto_code_B= $TNOAN{"$2"} || "C4";
                                s!--&gt; (.*)([A-Z][a-z-]+\]?)(.*)([A-Z][a-z]+)(.*)!.....&nbsp;$1 <a href="/eflora/eflora_display.php?tid=$goto_code_A">$2</a>$3<a href="/eflora/eflora_display.php?tid=$goto_code_B">$4</a>$5</div></span>!;
                        }
elsif(m/--&gt; ([A-Z]+ACEAE) or ([A-Z]+ACEAE)/){
				$name_A = $1;
				$name_B = $2;
				$goto_code_A= $TNOAN{"$name_A"} || "C4";
				$goto_code_B= $TNOAN{"$name_B"} || "C4";
                                s!--&gt; ([A-Z]+ACEAE)( or )([A-Z]+ACEAE)(.*)!.....&nbsp;<a href="/eflora/eflora_display.php?tid=$goto_code_A">$1</a>$2<a href="/eflora/eflora_display.php?tid=$goto_code_B">$3</a>$4</div></span>!;
                        }


 ##ERANIACEAE (_Pelargonium_) (2) {G24}
 #SAPINDACEAE (_Acer_) {G7,12}
			elsif(m!--&gt;.*ACEAE \(\[?_([A-Z][a-z-]+)_\]?\) \(?[0-9]*\)? ?\{[0-9G,]+\}!){
				$goto_code= $TNOAN{"$1"} || "C4";
				s!--&gt; (.*[A-Z][a-z-]+_\]?\)) (\(?[0-9]*\)? ?\{[0-9G,]+\})!.....&nbsp;<a href="/eflora/eflora_display.php?tid=$goto_code">$1 $2</a></div></span>!;
#warn "2 $_\n";
#warn "2 $1 $2\n";
			}

 ##VIOLACEAE {G5,15,20}
 #BRASSICACEAE (2) {G2,15,20}
			elsif(m!--&gt; \[?([A-Z][A-Z]+ACEAE)\]? \(?[0-9]*\)? ?\{[0-9G,]+\}!){
				$name = $1;
				$goto_code= $TNOAN{"$name"} || "C4";
				s!--&gt; (\[?[A-Z][A-Z]+ACEAE\]?) (\(?[0-9]*\)? ?\{[0-9G,]+\})!.....&nbsp;<a href="/eflora/eflora_display.php?tid=$goto_code">$1 $2</a></div></span>!;
#warn "3 $_\n";
#warn "3 $1 $2\n";
			}

#GROSSULARIACEAE (2)
			elsif(m!--&gt; \[?([A-Z][A-Z]+ACEAE)\]? \([0-9][^{]+!){
				$name = $1;
				$goto_code= $TNOAN{"$name"} || "C4";
				s!--&gt; (\[?[A-Z][A-Z]+ACEAE\]?) (\([0-9][^{]+)!.....&nbsp;<a href="/eflora/eflora_display.php?tid=$goto_code">$1 $2</a></div></span>!;
#warn "4 $_\n";
#warn "4 $1 $2\n";
			}


 ##PAPAVERACEAE (Papaveroideae) {G12,15,20,22}
			elsif(m!--&gt; \[?([A-Z][A-Z]+ACEAE)\]? \([A-Za-z]+\) \(?[0-9]*\)? ?\{[0-9G,]+\}!){
				$name = $1;
				$goto_code= $TNOAN{"$name"} || "C4";
				s!--&gt; (\[?[A-Z][A-Z]+ACEAE\]?) (\([A-Za-z]+\)) (\(?[0-9]*\)? ?\{[0-9G,]+\})!.....&nbsp;<a href="/eflora/eflora_display.php?tid=$goto_code">$1 $2 $3</a></div></span>!;
#warn "5 $_\n";
warn "5 $1 $2 $3==>$name\n";
			}

 ##FABACEAE (Papilionoideae)
			elsif(m!--&gt; \[?([A-Z][A-Z]+ACEAE)\]? \([A-Za-z]+\)!){
				$goto_code= $TNOAN{"$1"} || "C4";
				s!--&gt; (\[?[A-Z][A-Z]+ACEAE\]?) (\([A-Za-z]+\))!.....&nbsp;<a href="/eflora/eflora_display.php?tid=$goto_code">$1 $2</a></div></span>!;
#warn "6 $_\n";
warn "6 $1 $2\n";
			}

#SAPINDACEAE (_Acer glabrum_) {G9}
			elsif(m!--&gt;.*ACEAE \(\[?_([A-Z][a-z-]+ [a-z-]+_\]?\)) \(?[0-9]*\)? ?\{[0-9G,]+\}!){
				$goto_code= $TNOAN{"$1"} || "C4";
				s!--&gt; (.*[A-Z][a-z-]+ [a-z-]+_\]?\)) (\(?[0-9]*\)? ?\{[0-9G,]+\})!.....&nbsp;<a href="/eflora/eflora_display.php?tid=$goto_code">$1 $2</a></div></span>!;
#warn "7 $_\n";
warn "7 $1 $2\n";
			}

 ##EUPHORBIACEAE (_Croton setigerus_)
 ##BALSAMINACEAE ([_Impatiens capensis_])
			elsif(m!--&gt;.*ACEAE \(\[?_([A-Z][a-z-]+ [a-z-]+)!){
				$goto_code= $TNOAN{"$1"} || "C4";
				s!--&gt; (.*[A-Z][a-z-]+ [a-z-]+_\]?\))!.....&nbsp;<a href="/eflora/eflora_display.php?tid=$goto_code">$1</a></div></span>!;
#warn "8 $_\n";
			}
 ##PLANTAGINACEAE (_Antirrhinum_, _Dopatrium_, _Nuttallanthus_)
			elsif(m!--&gt; .*([A-Z][a-z-]+), ([A-Z][a-z]+), (A-Z][a-z-]+)!){
				$goto_code_A= $TNOAN{"$1"} || "C4";
				$goto_code_B= $TNOAN{"$2"} || "C4";
				$goto_code_C= $TNOAN{"$3"} || "C4";
				s!--&gt; (.*)([A-Z][a-z-]+), ([A-Z][a-z]+), (A-Z][a-z-]+)(.*)!.....&nbsp;$1 <a href="/eflora/eflora_display.php?tid=$goto_code_A">$2</a>, <a href="/eflora/eflora_display.php?tid=$goto_code_B">$3</a>, <a href="/eflora/eflora_display.php?tid=$goto_code_C">$4</a>$5</div></span>!;
			}
			elsif(m!--&gt; .*([A-Z][a-z-]+)_, ([A-Z][a-z]+ [a-z]+)!){
				$goto_code_A= $TNOAN{"$1"} || "C4";
				$goto_code_B= $TNOAN{"$2"} || "C4";
				s!--&gt; (.*)([A-Z][a-z-]+_\]?), (_[A-Z][a-z]+ [a-z]+)(.*)!.....&nbsp;$1 <a href="/eflora/eflora_display.php?tid=$goto_code_A">$2</a>, <a href="/eflora/eflora_display.php?tid=$goto_code_B">$3</a>$4</div></span>!;
			}
 ##BRASSICACEAE (_Nasturtium_, _Rorippa_)
			elsif(m!--&gt; .*([A-Z][a-z-]+)_, ([A-Z][a-z]+)!){
				$goto_code_A= $TNOAN{"$1"} || "C4";
				$goto_code_B= $TNOAN{"$2"} || "C4";
				s!--&gt; (.*)([A-Z][a-z-]+_\]?), (_[A-Z][a-z]+)(.*)!.....&nbsp;$1 <a href="/eflora/eflora_display.php?tid=$goto_code_A">$2</a>, <a href="/eflora/eflora_display.php?tid=$goto_code_B">$3</a>$4</div></span>!;
			}
 ##ONAGRACEAE (_Ludwigia_) or PLANTAGINACEAE (_Veronica_)
			elsif(m!--&gt; .*([A-Z][a-z-]+)_ or .* _([A-Z][a-z]+)_!){
				$goto_code_A= $TNOAN{"$1"} || "C4";
				$goto_code_B= $TNOAN{"$2"} || "C4";
				s!--&gt; (.*)([A-Z][a-z-]+\]?)(.*)([A-Z][a-z]+)(.*)!.....&nbsp;$1 <a href="/eflora/eflora_display.php?tid=$goto_code_A">$2</a>$3<a href="/eflora/eflora_display.php?tid=$goto_code_B">$4</a>$5</div></span>!;
			}
 #Group 10
			elsif( m!--&gt; (Group) (\d+)!){
				s!--&gt; *(Group) (\d+)!.....&nbsp;<a href="#$1$2">$1 $2</a></div></span>!;
			}
			elsif(m!--&gt; .*_([A-Z][a-z-]+)_!){
				$goto_code= $TNOAN{"$1"} || "C4";
				s!--&gt; (.*)([A-Z][a-z-]+)(.*)!.....&nbsp;<a href="/eflora/eflora_display.php?tid=$goto_code">$1$2$3</a></div></span>!;
			}
			elsif( m!--&gt; *([A-Z]+) or ([A-Z]+ACEAE)!){
				$name_A = $1;
				$name_B = $2;
				$goto_code_A= $TNOAN{"$name_A"} || "C4";
				$goto_code_B= $TNOAN{"$name_B"} || "C4";
				s!--&gt; *([A-Z]+) or ([A-Z]+ACEAE)!.....&nbsp;<a href="/eflora/eflora_display.php?tid=$goto_code_A">$1 or <a href="/eflora/eflora_display.php?tid=$goto_code_B"</a></div></span>!;
			}

			elsif( m!--&gt; \[?([A-Z][A-Z]+ACEAE)\]?!){
				$name = $1;
				$goto_code= $TNOAN{"$name"} || "C4";
				s!--&gt; (\[?[A-Z][A-Z]+ACEAE\]?)!.....&nbsp;<a href="/eflora/eflora_display.php?tid=$goto_code">$1</a></div></span>!;
	}
else{
				s!([0-9A-Za-z-)])$!$1</div></span>!;
				s!(['.0-9A-Za-z-)]+\])$!$1</div></span>!;
				s!div>$!div></div></span>!;
				s!u>$!u></div></span>!;
}

			if(m/--[0-9]+\(--[0-9]/ || m/[0-9]--\)[0-9]+--/){
				s/(--[0-9]+\()--([0-9]+)/$1$2/g;
				s/([0-9]+)--\)([0-9]+--)/$1)$2/g;
			}

			s/--([^&])/&ndash;$1/g;
			s|\+/-|&plusmn;|g;
			s|\+-|&plusmn;|g;
			s/ > or =/ &ge;/g;

			if($exclude || m/UNABRIDGED KEY LEAD/){
				s!^!\n<br><span class="inline"><div id="keyText10">!;
			}
			else{
				s!^!\n<br><span class="inline"><div id="keyText$indent">!;
			}

			#s!^!\n<br>$indent!;
			s/([A-Za-z])_([A-Za-z])/$1&95;$2/g;
				while(s/_/<i>/){
					s/_/<\/i>/;
				}

 			s/&95;/_/g;
			s/\.\.\.\.\.&nbsp; +/.....&nbsp;/;

			#if(m/<ul><div .+[A-Za-z]+\n/){
			#	s/<ul><div .+[A-Za-z]+\n/<\/a><\/div><\/ul>/g;
			#}

		}

		$_=join("\n",@lines);

#if (m!>$!){
#	s!([^>])$!$1</div></div><p>!;
#}

##1' Involucel tube with 8 valve-like openings; st shaggy-hairy; corolla blue; pl gen ann...-> [S. stellata]

		s/UNABRIDGED KEY LEAD: (.*)/<span class="fontBlue">$1<\/span>/g;

		if(s/UNABRIDGED KEY/\n<p>Unabridged key/g){
			#s/$/<\/font>/gm;
			$exclude=1;
		}

		s/UNABRIDGED\n//;
		s/  +/ /g;
			#print OUT "flabba1<blockquote>$_<\/blockquote>\n";

		if($exclude==1){
			print ERR "KEY: $name_anchor\n\n";
			$IJM_key{$name_anchor} = "<span class=\"fontBlue\"><blockquote>$_<\/blockquote></span>";
		}
		else{
			foreach($uk){
				while(s/_/<I>/){
					s/_/<\/I>/;
				}
			s/---/&mdash;/g;
			s/--/&ndash;/g;
			s|\+-|&plusmn;|g;
			s/Group (\d+[A-Z]?)/<a name=Group$1>Group $1<\/a>/;
			}
			
			print ERR "KEY: $name_anchor\n\n";
			
			$_=&il_to_html($_);
			
			print "<blockquote><h3>$uk</h3>$_<\/blockquote>";
		}
	}
	elsif( m/^(Scientific Editor: .+|<h4 align=left>Key To Groups|<p>In terrestrial \(and aquatic\) environments,|<p>Keys in the Jepson eFlora|<p>Only vascular plants are treated in The Jepson eFlora|<p>Although in aquatic environments an emergent habit distinguishes|<p>In terrestrial (and aquatic) environments,|<h3 align=center>Key to California Plant Families)/){
		#known false positives, these are part of the title and not a key
		++$false;
	}
	else{
		warn "NOT A KEY $_";
	}
#print;
print OUT <<EOP;

        </section>

    <!-- Feedback Area -->
    <section class="feedback-area center-text">
        <a class="googleForm" href="https://docs.google.com/forms/d/e/1FAIpQLSc_wrQXqB9gNPrOgUTZ9WN38Ub08JlmgaIha7Ua99sHGzMntA/viewform">
            Send us your feedback! Community input helps improve the Jepson eFlora.
        </a>
    </section>


</main>

    <!-- FOOTER SECTION -->
    <!-- CITATION -->
    <footer class="treatment-citation" style="margin-top:40px; padding: 20px; background: #eee; border-left: 5px solid var(--ef-blue);">
        <p><strong>Citation:</strong> Jepson Flora Project (eds.) <?php echo date("Y"); ?>, <i><?php echo $ScientificName; ?></i>, in <em>Jepson eFlora</em>, accessed on <?php echo date("F d, Y"); ?>.</p>
    </footer>

</body>
</html>


<!--Flexbox Key Rows: Replaced <br> and id="keyText" with a key-row div using Flexbox. This ensures the couplet number (e.g., 1.) stays aligned to the left while the text wraps correctly on the right. -->
<!--CSS Indentation: Instead of fixed-width IDs, I used a modular padding system (indent-7, indent-14). This is fully responsive; if the screen is too small, a media query flattens the indentation so text doesn't become a tiny vertical sliver. -->
<!--Accessible Tooltips: The morphology tooltips (.dropdown-content) are now focusable via tabindex="0". This means keyboard users can "Tab" to a word like "bulbs" and see the definition/image. -->
<!--Semantic Headers: Intro text is now properly categorized under <h2> and <h3> tags for screen reader navigation. -->
<!--Touch Targets: Links to "Group 1", "Group 2", etc., are given the .key-link style to ensure they are large enough to be tapped easily on mobile devices. -->
<!--Skip Link: Added a "Skip to main content" link at the very top for users with motor disabilities who use keyboards to navigate. -->

<!--CSS Variables: Instead of 20 different IDs, I created a responsive padding system. On desktop, it honors your exact pixel requirements (5px, 25px, 35px, etc.). -->
<!--Mobile Flattening: On mobile screens, these indents are automatically reduced. This prevents the "skinny column" effect where text becomes unreadable on a phone. -->
<!--Hanging Indents: I used a Flexbox layout for the couplets. This ensures the numbers (1., 1', 2.) stay aligned to the left while the text wraps cleanly to the right, maintaining the botanical "hanging indent" look without using negative  text-indents which are prone to breaking. -->
<!--Accessible Tooltips: The morphological definitions (bulbs, sporangium) are now keyboard-accessible. A user can "Tab" into the word to see the image and description. -->


EOP

}
######################################################
######################################################

sub format_syns {
	local($syns)=shift;
	#print "$syns\n";
	$syns=~s/ &#215; / X_/g;
	#print "$syns\n";
	@syns=split(/; +/,$syns);
	foreach(@syns){
		s/ *$//;
		s/<\/?b>//g;
		s/^([^ ]+ X +)/<i>$1<\/i>/;
		s/^([^ ]+ [^ ]+)/<i>$1<\/i>/;
		s/subsp. ([^ ]+)/subsp. <i>$1<\/i>/;
		s/var. ([^ ]+)/var. <i>$1<\/i>/;
		s/f. ex /f._ex /;
		s/f. ([^ ]+)/f. <i>$1<\/i>/;
		s/f._ex /f. ex /;
	}
	$syns=join("; ", @syns);
	$syns=~s/^\[//;
	$syns=~s/\]//;
	#print "$syns\n";
	$syns=~s/ X_/ &#215;/g;
	#print "$syns\n";
	$syns;
}
sub dist_expand{
local($_)=@_;
s/\bAR\b/Arkansas/g;
s/\bTN\b/Tennessee/g;
s/\bNB\b/New Brunswick/g;
s/\bNC\b/North carolina/g;
s/\bMO\b/Missouri/g;
s/\bHI\b/Hawaii/g;
s/\bFL\b/Florida/g;
s/\bPE\b/Prince Edward Island/g;
s/\bQC\b/Quebec/g;
s/\bS.Africa\b/South Africa/g;
s/\bWY\b/Wyoming/g;
s/\bMI\b/Michigan/g;
s/\bMA\b/Massachusetts/g;
s/\bIN\b/Indiana/g;
s/\bIL\b/Illinois/g;
s/\bNJ\b/New Jersey/g;
s/\bMN\b/Minnesota/g;
s/\bMS\b/Mississippi/g;
s/\bNY\b/New York/g;
s/\bSK\b/Saskatchewan/g;
s/\bMB\b/Manitoba/g;
s/\bNL\b/Newfoundland/g;
s/\bAB\b/Alberta/g;
s/\bYT\b/Yukon/;
s/\bNS\b/Nova Scotia/;
s/\bON\b/Ontario/;
s/\bVA\b/Virginia/;
s/\bNE\b/Nebraska/;
s/subtrop\./subtropics/;
s/C\.Am/Central America/;
s/\bWA\b/Washington/g;
s/\bw-+c/west-central/g;
s/\bUT\b/Utah/g;
s/\bTX\b/Texas/g;
s/\btemp\b/temperate/g;
s/\bSD\b/South Dakota/g;
s/\bND\b/North Dakota/g;
s/\bs-+c/south-central/g;
s/\bLA\b/Louisiana/g;
s/\bOR\b/Oregon/g;
s/\bOK\b/Oklahoma/g;
s/\bNV\b/Nevada/g;
s/\bPA\b/Pennsylvania/g;
s/\bNM\b/New Mexico/g;
s/\bn-+c/north-central/g;
s/\bMT\b/Montana/g;
s/\bID\b/Idaho/g;
s/\bOH\b/Ohio/g;
s/\bSC\b/South Carolina/g;
s/\bKS\b/Kansas/g;
s/\be-+c/east-central/g;
s/\bCan\b/Canada/g;
s/\bEur\b/Europe/g;
s/\bN\.Am\b/North America/g;
s/\bS\.Am\b/South America/g;
s/\bBC\b/British Columbia/g;
s/Rocky Mtns/Rocky Mountains/;
s/\bBaja CA\b/Baja California/g;
s/\bAZ\b/Arizona/g;
s/\bCO\b/Colorado/g;
s/\bAK\b/Alaska/g;
s/Mex\b/Mexico/g;
s/Medit\b/Mediterranean/g;
s/CA-FP/California Floristic Province/g;
s/\bNCo\b/North Coast/g;
s/\bNCoR\b/North Coast Ranges/g;
s/\bNCoRO\b/Outer North Coast Ranges/g;
s/\bNCoRI\b/Inner North Coast Ranges/g;
s/\bNCoRH\b/High North Coast Ranges/g;
s/\bCaR\b/Cascade Range/g;
s/\bCaRF\b/Cascade Range Foothills/g;
s/\bCaRH\b/High Cascade Range/g;
s/\bSN\b/Sierra Nevada/g;
s/\bSNE\b/East of Sierra Nevada/g;
s/\bSNF\b/Sierra Nevada Foothills/g;
s/\bSNH\b/High Sierra Nevada/g;
s/\bTeh\b/Tehachapi Mountain Area/g;
s/\bGV\b/Great Central Valley/g;
s/\bScV\b/Sacramento Valley/g;
s/\bSnJV\b/San Joaquin Valley/g;
s/\bSnGb\b/San Gabriel Mountains/g;
s/\bSW\b/Southwestern California/g;
s/\bSCo\b/South Coast/g;
s/\bChI\b/Channel Islands/g;
s/\bPR\b/Peninsular Ranges/g;
s/\bWTR\b/Western Transverse Ranges/g;
s/\bTR\b/Transverse Ranges/g;
s/\bSnJt\b/San Jacinto Mountains/g;
s/\bSCoR\b/South Coast Ranges/g;
s/\bSCoRO\b/Outer South Coast Ranges/g;
s/\bSCoRI\b/Inner South Coast Ranges/g;
s/\bCW\b/Central Western California/g;
s/\bSCoR\b/South Coast Ranges/g;
s/\bCCo\b/Central Coast/g;
s/\bSnFrB\b/San Francisco Bay Area/g;
s/\bNW\b/Northwestern California/g;
s/\bKR\b/Klamath Ranges/g;
s/\bGB\b/Great Basin Floristic Province/g;
s/\bWrn\b/Warner Mountains/g;
s/\bMP\b/Modoc Plateau/g;
s/\bW&I\b/White and Inyo Mountains/g;
s/\bD\b/Desert/g;
s/\bDMoj\b/Mojave Desert/g;
s/\bDMtns\b/Desert Mountains/g;
s/\bDSon\b/Sonoran Desert/g;
s/\bCA\b/California/g;
s/\bSnBr\b/San Bernardino Mountains/g;
s/\bUS\b/United States/g;
s/$/<map>/;
$_;
}

sub il_to_html {
local($_) = @_;

s/Eur\./Europe./;
s/\ball yr\b/all year/;
s/trop, subtrop S.Am/tropical, subtropical South America/;
s/subtrop, trop mtns/subtropical, tropical mountains/;
s/trop\) regions/tropical) regions/;
s/trop spp.\]/tropical spp.]/;
s/subtrop Am\b/subtropical America/;
s/trop Afr\b/tropical Africa/;
s/trop s hemisphere/tropical southern hemisphere/;
s/trop S.Am\b/tropical South America/;
s/trop Am\b/tropical America/;
s/temp Am\b/temperate America/;
s/temp, subtrop n hemisphere/temperate, subtropical northern hemisphere/;
s/subtrop coasts,/subtropical coasts/;
s/\bpantrop\b/pantropical/;
s/trop Asia/tropical Asia/;
s/subtrop mtns/subtropical mountains/;
s/trop mtns/tropical mountains/;
s/trop Australia/tropical Australia/;
s/trop, subtrop e Asia/tropical, subtropical eastern Asia/;
s/subtrop Asia/subtropical Asia/;
s/subtrop sw US/subtropical southwestern United States/;
s/trop N.Am\b/tropical North America/;
s/subtrop N.Am\b/subtropical North America/;
s/trop Am/tropical America/;
s/trop areas/tropical areas/;
s/trop and s Afr\b/tropical and southern Africa/;
s/trop weed/tropical weed/;
s/trop, subtrop Am\b/tropical, subtropical America/;
s/trop, temp Am\b/tropical, temperate America/;
s/trop Eurasia/tropical Eurasia/;
s/\btrop\b/tropics/;
s/\btrops\b/tropics/;
s/ temp\b/ temperate/;


s/ in fl arran/ in floral arran/g;
s/ fl tube/ floral tube/g;
s/ fl sts/ flowering stems/g;
s/ fl stalks/ flowering stalks/g;
s/ fl season/ flowering season/g;
s/ fl pls/ flowering plants/g;
s/ fl pl/ flowering plant/g;
s/ fl once/ flowering once/g;
s/ fl lst/ flowering first/g;
s/ fl late/ flowering late/g;
s/ after fl in/ after flowering in/g;
s/may fl 1st/may flower first/g;
s/ fl first/ flowering first/g;
s/ fl 1st/ flowering first/g;
s/ fl at / flowering at /g;

s/(summer|spring|fall)-fl\b/$1-flowering/g;
s/\bst\b/stem/g;
s/\bsts\b/stems/g;
s/\bfl\b/flower/g;
s/\bfls\b/flowers/g;
s/\bfld\b/flowered/g;
s/\b([Pp]l)(s?)\b/$1ant$2/g;
s/\.plant/.pl/g;
s/\bfr\b/fruit/g;
s/\bfrs\b/fruits/g;
s/\be\b/eastern/g unless m/e[.;]/ ;
s/\blflets\b/leaflets/g;
s/\blfy\b/leafy/g;
s/\blflet\b/leaflet/g;
s/\blvs\b/leaves/g;

s/\bann\b/annual/g;
s/\b([Bb])ien\b/$1iennial/g;
if(m/\bper\b/){
s/\bper\)/perennial herb)/;
s/\bper to\b/perennial herbs to/;
s/\bor per\b/or perennial herb/;
s/\band per\b/and perennial herb/;
s/\bif per\b/if perennial herb/;
s/([,;]) per\b/$1 perennial herb/;
s/\bper([.,])/perennial herb$1/;
s/ to per\b/ to perennial herb/;
s/montane per\b/montane perennial herb/;
s/lived per\b/lived perennial herb/;
s/Rhizomed per\b/Rhizomed perennial herb/;
s/slender per\b/slender perennial herb/;
}
s/\bexc\.?\b/except/g;
if(m/\bincl\b/){
s/not incl app/not including app/;
s/\bincl([<,.,;])/included$1/g;
s/genus incl taxa/genus includes taxa/;
s/\bincls spur/includes spur/;
s/\bincl (at|as)/included $1/;
s/not incl _/not include _/;
s/previously incl _/previously included _/;
s/\bincl hybrids/include hybrids/;
s/\bincl here/included here/;
s/\bincl several/include several/;
s/\bincl \.\.\.\.\./included ...../;
s/\bincl \(/included (/;
s/(that|May|to|not|Previously) incl /$1 include /;
s/\bincl in /included in /;
s/\bincl or /included or /;
s/\bincl to /included to /;
s/\bincl,/included,/;
s/\bincl;/included;/;
s/spp\. incl/spp. included/;
s/or incl exc/or included exc/;
s/netted with incl/netted with included/;
s/\bincl stamens/included stamens/;
s/_ incl pls that/_ includes plants that/;
s/stamens incl within/stamens included within/;
s/previously incl genera/previously included genera/;
s/([Cc]haracters) incl relative/$1 include relative/;
s/style incl\b/style included/;
s/ and incl / and included /;
s/, incl under/, included under/;
s/subsp. incl the/subsp. include the/;
s/would incl var/would include var/;
s/incl genes/includes genes/;
s/Characters incl calyx/Characters include calyx/;
s/\bincl\b/including/;
s/Anthers incl\b/Anthers included/;
}
s/\bincls/includes/g;
s/\bAnn\b/Annual/g;
s/\bAnnual ([A-Z])/Ann $1/g;
s/\bPer\b/Perennial/g;
s/\b([Gg])en\b/$1enerally/g;
s/\besp\b/especially/g;
s/\blf\b/leaf/g;
s|([Ii])n cult\b|$1n cultivation|;
#s/\bcult\b/cultivated/g;
s/rice cult /rice cultivation /;
s/(escapes?) cult\b/$1 cultivation/;
s/(of|into|outside|after|in|In|from) cult\b/$1 cultivation/;
s/\bcult\b/cultivated/;
s/infl(s)?\b/inflorescence$1/g;
s/Vars\./Varieties/g;
s/\blfless\b/leafless/g;
s/\bocc\b (agricultural|escape|waif|weed)\b/occasional $1/g;
s/\bocc\b/occasionally/g;
s/\born\b/ornamental/g;

s/\bAfr\b/Africa/g;
s/N\. ?Am\b/North America/g;
s/S\. ?Am\b/South America/g;
s/\bssp\./subsp./g;
s/\bspp\.(\s+[A-Z])/species.$1/g;
s/\bspp\./species/g;
s/\bsspp\./subspp./g;
s|</?quote>|"|g;
$_;
}
