#formatter for eFlora that expects input with expanded abbreviations
use lib '/Users/Shared/Jepson-Master/Jepson-eFlora/Modules';
use flatten;

open(warn_cnps, ">/Users/Shared/Jepson-Master/Jepson-eFlora/eflora_database/output/CNPS_warning.txt") || die;
#warn <<EOP;
#NEED TO ADD IN AUTHORS WHERE THEY WERE DEEMED UNNECESSARY FOR PRINTED BOOK
#EOP
use BerkeleyDB;
open (ERR, ">output/IJM_log.txt") || die;

$genus="AA";
#$unlinked= unlink 'IJM.hash', 'IJM_key.hash';
#$unlinked= unlink 'IJM.hash';


open (OUT, ">input/eflora_keys.txt") || die;
open (FORMAT, ">input/eflora_keys_formatted.txt") || die;
open (KEY, ">input/eflora_keys_for_keybase.txt") || die;

my ($id,$name,$cnps,$g,$mod);
#open(IN, "/Users/Shared/Jepson-Master/Interchange/input/CNPS/CNPS_ID_master.txt") || die;
open(IN, "/Users/Shared/Jepson-Master/Interchange/input/CNPS/CNPS-ID-EFLORA-converted.txt") || die;
while(<IN>){
	chomp;
#1124	Sidalcea pedata	1B.1	G1	05-26-2021
	next if (m/^#/);

	($id,$name,$cnps,$g,$mod)=split(/\t/);
#$name=~s/ssp\./subsp./;
	#$CNPS_URL{$name}="http://www.rareplants.cnps.org/detail/".$id.".html"
	$CNPS_URL{$name}="https://rareplants.cnps.org/Plants/Details/".$id;
}
close(IN);

open(IN, "/Users/Shared/Jepson-Master/Jepson-eFlora/synonymy/input/smasch_taxon_ids.txt") || die;
local($/)="\n";
while(<IN>){
	chomp;
	
	next if m/^#/;
	
	($code,$name,@residue)=split(/\t/);

$name=~s/ X / &times;/;

$name=~s/Encelia farinosa &times;Encelia frutescens/Encelia farinosa &times; Encelia frutescens/;


	$NAME_TO_CODE{$name}=$code;
	$CODE_TO_NAME{$code}=$name;
}

#	foreach(keys(%NAME_TO_CODE)){
#print <<EOP;
#		name: $_
#		code: $NAME_TO_CODE{$_}
#
#EOP
#	}

#die;


foreach(keys(%NAME_TO_CODE)){
print "$_\n" if m/acutidens/;

#print "$_\n" if m/&times;/;
#print "$_\n";
}
#die;

close(IN);


#tie(%IJM, "BerkeleyDB::Hash", -Filename=>"output/IJM.hash", -Flags      => DB_CREATE)|| die "Stopped; couldnt open IJM\n";
#%IJM=();

#IJM hash was created only at this point for the taxonomic sequence - familyId genusID, taxonID,
#it has now become unreliable because it is no longer needed to create species pages used by the eflora website.

#foreach(keys(%IJM)){
#print "$_\n" if m/&times;/;
#print "$_\n";
#}

my $file = "/Users/Shared/Jepson-Master/Jepson-eFlora/eflora_database/output/accepted_name_list.txt";

open(IN, "< $file") or die "Can't open $file for read: $!";
local($/)="\n";
while(<IN>){
	chomp;
$accepted2=$_;
#$accepted2 =~ s/&times;/X /;

	$IJM{$accepted2}++;

foreach(keys(%IJM)){
#print "EFACC: $accepted2\n" if $accepted2 =~ m/acutidens/;

#print "EFACC: $accepted2==>$_\n" if m/&times;/;
#print "$_\n";
}

}
close(IN);



$file="/Users/Shared/Jepson-Master/Jepson-eFlora/eflora_database/input/eflora_treatments.txt";
	undef($/);
	open(IN,$file) || die "couldn't open $file\n";
warn "reading from $file\n";

	$all_lines=<IN>;
		
	@all_pars=split(/\n\n+/,$all_lines);

	$element=0;

foreach(@all_pars){

next if m/^#/;

	unless (m/(Key to Groups|Group \d:)/){
		warn "DUPLINE: $_\n" if $seen_line{$_}++;
	}


next if m/^Admin/;
next if m/^PROOF:/;
next if m/^CAPTION:/;

		$nds=$hc="";
		
		@lines=split("\n",$_);
		
		$last_tag="UNABRIDGED KEY LEAD";
		
		s/([0-9])-([0-9])/$1&ndash;$2/g;

#foreach(@all_pars){
###################### KEYS ##########################
		#if( m/^(1\./ || m/^UNABRIDGED KEY/ || m/^Group \d+[A-Z]?[.:]/ || m/^Key to Groups Based Primarily on Flowering Material/|| m/^Key to Groups Based on Fruiting Material/ || m/^Key to Groups/ || m/^Key to Pistillate Plants/ || m/^Key to Staminate Plants/|| m/^Key to Vegetative Plants/ || m/^Group \d+ *\n/){
		if( m/^(1\.|UNABRIDGED KEY|Group \d+[A-Z]?[.:]|Key to Groups Based .+|Key to Groups|Key to Pistillate Plants|Key to Staminate Plants|Key to Vegetative Plants|Group \d+[ .:])/){
			$uk="";
			print ERR "$file KEY $&\n\n";
			++$genus;
			@lines=split(/\n/);
			$lines[$#lines]="" if $lines[$#lines]=~/^PROOF:/;
			$indent_level=-1;
			
				if ($lines[0]=~s/UNABRIDGED KEY/Unabridged key/){
					#print "$lines[0]\n";
					$uk=shift(@lines);
					print ERR "UK: $uk\n\n";
					$exclude=1;
				}
				if ($lines[0]=~/Group \d+/ && $lines[1]=~/^[A-Z]/){
					print ERR "KEY $lines[0] $lines[0]\n\n";
					$uk=shift(@lines);
					$uk .= " ";
					$uk .= shift(@lines);
					print ERR "KEY $lines[0] $lines[0]]\n\n";
				}
				if ($lines[0]=~/Key to (Groups|genera|California|pistillate|staminate)/i){
					print ERR "KEY $lines[0]\n\n";
					$uk=shift(@lines);
					print ERR "KEY $lines[0]\n\n";
				}
				if ($lines[0]=~/^Group \d/){
					print ERR "KEY $lines[0]\n\n";
					$uk=shift(@lines);
					print ERR "KEY $lines[0]\n\n";
				}
				if ($lines[0]=~/^SALIX Key/){
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

#foreach(@all_pars){
#if( m/^1\.
#foreach(@lines[0 .. $#lines]){
		
		########setting the indent level for the line
		#if it starts with a number followed by a period, increase the $indent_level by one and set the $indent
		if(s|^(\d+)([.])|<a href="#$genus${1}'">$1$2</a><a name="$genus$1$2"> </a>|){
			$indent_level +=1;
			$indent_level{$1}=$indent_level;
			print nowhere "$1$2\n$indent_level\n\n";
			$indent=$indent_level;
		}
		#if it starts with a number followed by a prime symbol ('), set $indent_level to $indent_level{$1} (i.e. the same as the indent level in the previous block of code
		if(s|^(\d+)(['])|<a href="#$genus${1}.">$1$2</a><a name="$genus$1$2"> </a>|){
			$indent_level = $indent_level{$1};
			print nowhere "$1$2\n$indent_level\n\n";
			$indent=$indent_level;
		}
		###NOTE: Leads beginning with "UNABRIDGED KEY LEAD: " are skipped here, and given a default indent level later on
		#############
		
		
		#indent is multiplied by 7 to give the amount of indent	
		$indent*=7;
		if(m!--&gt; *(\d*)([A-Z])\. ([a-z-]+) (nothosubsp\.|subsp\.|var\.) ([a-z-]+)!){
			$key_species=$3;
			$key_rank=$4;
			$key_infra=$5;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species $key_rank $key_infra"} || "C1";
			if($goto_code eq "C1"){
				print qq{1 >$key_genus $key_species $key_rank $key_infra< code=$goto_code\n\n};
			}
			s!--&gt; *(\d*)([A-Z])\. ([a-z-]+) (nothosubsp\.|subsp\.|var\.) ([a-z-]+)!<a href="#$goto_code">.....&nbsp;$1 $2. $3 $4 $5</a>!;
			print ERR qq{1 $key_genus $key_species $key_rank $key_infra code=$goto_code\n\n};
		}
		#1' Ann; lvs narrowly elliptic to ovate or obovate.....-> [P. ruderale var. macrocephalum]
		elsif(m!--&gt; *(\d*)\[([A-Z])\. ([a-z-]+) (nothosubsp\.|subsp\.|var\.) ([a-z-]+)\]!){
			$key_species=$3;
			$key_rank=$4;
			$key_infra=$5;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species $key_rank $key_infra"} || "C2";
			if($goto_code eq "C2"){
				print qq{2 >$key_genus $key_species $key_rank $key_infra< code=$goto_code\n\n};
			}
			s!--&gt; *(\d*)\[([A-Z])\. ([a-z-]+) (nothosubsp\.|subsp\.|var\.) ([a-z-]+)\]!<a href="#$goto_code">.....&nbsp;$1 [$2. $3 $4 $5]</a>!;
			print ERR qq{2 $key_genus $key_species $key_rank $key_infra code=$goto_code\n\n};
		}
		elsif( m!--&gt; *(most )([A-Z])\. ([&;a-z-]+)!){
			$key_species=$3;
			$goto_code=$NAME_TO_CODE{"$key_genus $key_species"} || "C3";
			if($goto_code eq "C3"){
				print qq{3 >$key_genus $key_species< code=$goto_code\n\n};
			}
			print ERR qq{3 $key_genus $key_species code=$goto_code\n\n};
			s!--&gt; *(most )([A-Z])\. ([&;a-z-]+)!<a href="#$goto_code">.....&nbsp;$1 $2. $3</a>!;
		}
		elsif( m!--&gt; *(\d*)([A-Z])\. ([&;a-z-]+)!){
			$key_species=$3;
			$goto_code=$NAME_TO_CODE{"$key_genus $key_species"} || "C4";
			if($goto_code eq "C4"){
				print qq{4 >$key_genus $key_species< code=$goto_code\n\n};
				#die;
			}
			print ERR qq{4 $key_genus $key_species code=$goto_code\n\n};
			s!--&gt; *(\d*)([A-Z])\. ([&;a-z-]+)!<a href="#$goto_code">.....&nbsp;$1 $2. $3</a>!;
		}
		elsif(m!--&gt; *(\d*)([A-Z][A-Z]+)!){
			$key_genus=ucfirst(lc($2));
			$goto_code= $NAME_TO_CODE{$key_genus} || "C5";
			if($goto_code eq "C5"){
				print qq{5 >$key_genus< code=$goto_code\n\n};
				#die;
			}
			print ERR qq{5 $key_genus code=$goto_code\n\n};
			s!--&gt; *(\d*)([A-Z][A-Z]+)!<a href="#$goto_code">.....&nbsp;$1 $2</a>!;
		}
		elsif(m!--&gt; *\[(\d*)([A-Z][A-Z]+).*\]!){
			$key_genus=ucfirst(lc($2));
			$goto_code=$NAME_TO_CODE{$key_genus} || "C6";
			if($goto_code eq "C6"){
				print qq{6 >$key_genus< code=$goto_code\n\n};
				#die;
			}
			print ERR qq{6 $key_genus code=$goto_code\n\n};
			s!--&gt; *\[(\d*)([A-Z][A-Z]+)(.*\])!<a href="#$goto_code">.....&nbsp;[$2$3</a>!;
		}
		elsif(m!--&gt; *(nothosubsp\.|subsp\.|var\.) ([a-z-]+)!){
			$key_rank=$1;
			$key_infra=$2;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species $key_rank $key_infra"} || "C7";
			if($goto_code eq "C7"){
				print qq{7 >$key_genus $key_species $key_rank $key_infra< code=$goto_code\n\n};
				#die;
			}
			print ERR qq{7 $key_genus $key_species $key_rank $key_infra code=$goto_code\n\n};
			s!--&gt; *(nothosubsp\.|subsp\.|var\.) ([a-z-]+)!<a href="#$goto_code">.....&nbsp;$1 $2</a>! ;
		}
		elsif(m!--&gt; *\[(nothosubsp\.|subsp\.|var\.) ([a-z-]+)\]!){
			$key_rank=$1;
			$key_infra=$2;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species $key_rank $key_infra"} || "C8";
			if($goto_code eq "C8"){
				print qq{8 >$key_genus $key_species $key_rank $key_infra< code=$goto_code\n\n};
				#die;
			}
			print ERR qq{8 $key_genus $key_species $key_rank $key_infra code=$goto_code\n\n};
			s!--&gt; *\[(nothosubsp\.|subsp\.|var\.) ([a-z-]+\])!<a href="#$goto_code">.....&nbsp;[$1 $2]</a>! ;
		}
		elsif( m!--&gt; *\[(\d*)([A-Z])\. ([&;a-z-]+)\]!){
			$key_species=$3;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species"} || "C9";
			if($goto_code eq "C9"){
				print qq{9 >$key_genus $key_species $key_rank $key_infra< code=$goto_code\n\n};
				#die;
			}			
			print ERR qq{9 $key_genus $key_species code=$goto_code\n\n};
			s!--&gt; *\[(\d*)([A-Z])\. ([&;a-z-]+)\]!<a href="#$goto_code">.....&nbsp;$1 [$2. $3]</a>!;
		}
		elsif( m!--&gt; *\[(\d*)([A-Z])\. ([&;a-z-]+);.*\]!){
			$key_species=$3;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species"} || "C10";
			if($goto_code eq "C10"){
				print qq{10 >$key_genus $key_species< code=$goto_code\n\n};
				#die;
			}
			print ERR qq{10 $key_genus $key_species code=$goto_code\n\n};
			s!--&gt; *\[(\d*)([A-Z])\. ([&;a-z-]+)(;.*)\]!<a href="#$goto_code">.....&nbsp;$1 [$2. $3$4]</a>!;
		}
		elsif(m!--&gt; *\[(\d*)([A-Z][a-z]+).*\]!){
			$key_genus=ucfirst(lc($2));
			$goto_code=$NAME_TO_CODE{$key_genus} || "C11";
			if($goto_code eq "C11"){
				print qq{11 >$key_genus< code=$goto_code\n\n};
				#die;
			}
			print ERR qq{11 $key_genus code=$goto_code\n\n};
			s!--&gt; *\[(\d*)([A-Z][a-z]+)(.*\])!<a href="#$goto_code">.....&nbsp;[$2$3</a>!;
		}
		elsif(m!--&gt; *(\d*)([A-Z][a-z]+) ([^ ]+) *\(.*!){
			$key_genus=ucfirst(lc($2));
			$key_species=$3;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species"} || "C12";
			if($goto_code eq "C12"){
				print qq{12 >$key_genus $key_species< code=$goto_code\n\n};
			}
			print ERR qq{12 $key_genus code=$goto_code\n\n};
			s!--&gt; *(\d*)([A-Z][a-z]+)(.*)(\(.*)!<a href="#$goto_code">.....&nbsp;$2$3</a>$4!;
		}
		elsif(m!--&gt; *(Group) (.*)!){
			print ERR qq{13 $1 $2 code=$goto_code\n\n};
			s!--&gt; *(\d*)([A-Z][a-z]+) (.*)!<a href="#Group$3">.....&nbsp;$2 $3</a>!;
		}
		elsif(m!--&gt; *(\d*)([A-Z][a-z]+) ([a-z]+) (var\.|subsp\.) ([a-z]+)(.*)!){
			$key_genus=ucfirst(lc($2));
			$target= $key_genus." $3 $4 $5";
			$goto_code= $NAME_TO_CODE{$target} || "C14";
			if($goto_code eq "C14"){
				print qq{14 >$target< code=$goto_code\n\n};
			}
			print ERR qq{14 $target code=$goto_code   $_\n\n};
			s!--&gt; *(\d*)([A-Z][a-z]+) ([a-z]+)(.*)!<a href="#$goto_code">.....&nbsp;$2 $3$4</a>!;
		}
		elsif(m!--&gt; *(\d*)([A-Z][a-z]+) ([a-z]+)(.*)!){
			$key_genus=ucfirst(lc($2));
			$target = $key_genus." $3";
			$goto_code= $NAME_TO_CODE{$target} || "C15";
			if($goto_code eq "C15"){
				print qq{15 >$target< code=$goto_code\n\n};
			}
			print ERR qq{15 $target code=$goto_code $_\n\n};
			s!--&gt; *(\d*)([A-Z][a-z]+ [a-z]+)!<a href="#$goto_code">.....&nbsp;$2</a>!;
			print ERR qq{15 $target code=$goto_code $_\n\n};

			#12b Elymus multisetus code=24122 <a href="#ALE33.">33'</a><a name="ALE33'"> </a> Per; spikelets 2(3--4) per node --&gt; Elymus multisetus
		}
		elsif(m!--&gt; *(\d*)([A-Z][a-z]+) (.*)!){
			$key_genus=ucfirst(lc($2));
			$goto_code= $NAME_TO_CODE{$key_genus} || "C16";
			if($goto_code eq "C16"){
				print qq{16 >$key_genus< code=$goto_code\n\n};
			}
			print ERR qq{16 $key_genus code=$goto_code\n\n};
			s!--&gt; *(\d*)([A-Z][a-z]+)(.*)!<a href="#$goto_code">.....&nbsp;$2$3</a>!;
		}

		#13. Pinnae fan-shaped, texture delicate, deep green; outer margins finely toothed or crenate; occurring in or very near saturated substrate .....-> sun forms of B. crenulatum(2), see also lead 9
		#6. Trophophore and sporophore joined well below mid-lf, gen at ground level.....-> small or shade pls of _Botrychium simplex_(2) or _Botrychium pumicola_(2), see lead 3 for separation of taxa
		#<a href="#AO6'">6.</a><a name="AO6."> </a> Trophophore and sporophore joined well below mid-lf, gen at ground level--&gt; small or shade pls of _Botrychium simplex_(2) or _Botrychium pumicola_(2), see lead 3 for separation of taxa
		elsif( m!--&gt;.*_([A-Z])\. ([&;a-z-]+)_!){
			$key_species=$2;
			$goto_code= $NAME_TO_CODE{"$key_genus $key_species"} || "C17";
			if($goto_code eq "C17"){
				print qq{17 >$key_genus $key_species< code=$goto_code\n\n};
			}
			print ERR qq{17 $key_genus $key_species code=$goto_code\n\n};
			s!--&gt; (.*)_([A-Z])\. ([&;a-z-]+)_!<a href="#$goto_code">.....&nbsp;$1 $2. $3</a>!;
		}
		#1. Fl radial; calyx, corolla gen inconspicuous; petals free or fused, lobes not overlapped in bud; stamens 5--many, often long-exserted; lf 2-pinnate (simple in alien _Acacia_).....-> Group 1: Mimosoideae
		elsif( m!--&gt; *Group \d+: ([^ ]+)!){
			$goto_code=$1;
			s!--&gt; *(Group \d+: )([A-Z][a-z]+) *(.*)!<a href="#$goto_code">.....&nbsp;$1 $2 $3</a>!;
		}
		elsif( m!--&gt; (see couplet \d+)!){#--&gt; see couplet 5
			s!--&gt; (.*)! .....&nbsp;$1!;
		}
		elsif( m!--&gt; \[(.*) &times;(.*)!){
		#print "HYBRID NAME==>$_\n";
			s!--&gt; *(.*)! .....&nbsp;$1!;
		}
		elsif( m!--&gt; .*see .*lead \d!){
			s!--&gt; *(.*)! .....&nbsp;$1!;
		}
		elsif( m!--&gt; .*see _[A-Z]!){
			s!--&gt; *(.*)! .....&nbsp;$1!;
		}
		else{
			print ERR "ERROR==>$_ \n\n" if m/--&gt;/;
			print "ERROR==>$_ \n\n" if m/--&gt;/;
		}
		
#foreach(@all_pars){
#if( m/^1\./ ||
#foreach(@lines[0 .. $#lines]){
		
		if(m/--[0-9]+\(--[0-9]/ || m/[0-9]--\)[0-9]+--/){
			s/(--[0-9]+\()--([0-9]+)/$1$2/g;
			s/([0-9]+)--\)([0-9]+--)/$1)$2/g;
		}
		s/--([^&])/&ndash;$1/g;
		s|\+/-|&plusmn;|g;
		s|\+-|&plusmn;|g;
		s/ > or =/ &ge;/g;
		
		
	
		########Substitute in the correct indent and styling (based on $indent, or if UNABRIDGED KEY LEAD

		if($exclude){
			s!^!\n<br><span class="inlineBlue"><div id="keyText10">!;
			#s!$!</div></div></p>!;
			s!$!</div></span>!;
			
		}
		elsif(m/UNABRIDGED KEY LEAD: /){
			s!^UNABRIDGED KEY LEAD: !\n<br><span class="inlineBlue"><div id="keyText10">!;
			s!$!</div></span>!;
		}
		else{
			s!^!\n<br><span class="inline"><div id="keyText$indent">!;
			s!$!</div></span>!;
		}
		#######

#foreach(@all_pars){
#if( m/^1\./ ||
#foreach(@lines[0 .. $#lines]){

		s/([A-Za-z])_([A-Za-z])/$1&95;$2/g;
#add underline
		while(s/_\{/<u>{/){
			s/\}_/}<\/u>/g;
		}
#add italics
		
		while(s/_/<i>/){
			s/_/<\/i>/;
		}




		s/\.\.\.\.\.&nbsp; +/.....&nbsp;/;
	}#foreach(@lines[0 .. $#lines]){


	$_=join("\n",@lines);

	$newline=join(" ",@lines);
	$newline =~ s/\v+<br><span class="inline/<br><span class="inline/g;

#foreach(@all_pars){
#if( m/^1\./ ||

	s/  +/ /g;


	if($exclude==1){
		print ERR "KEY: $name_anchor\n\n";
		print OUT $name_anchor."==><blockquote><h3>".$uk."</h3>".$_."<\/blockquote>\n##########END OF KEY\n";
		print FORMAT $name_anchor."\t<blockquote><h3>".$uk."</h3>".$newline."<\/blockquote>\n";
		#$IJM_key{$name_anchor}= "<blockquote><h3>".$uk."</h3>".$_."<\/blockquote>";
	}
	else{
		foreach($uk){
			while(s/_/<i>/){
				s/_/<\/i>/;
			}
			s/---/&mdash;/g;
			s/--/&ndash;/g;
			s|\+-|&plusmn;|g;
			s/Group (\d+[A-Z]?)/<a name=Group$1>Group $1<\/a>/;
		}
		print ERR "KEY: $name_anchor\n\n";
		print OUT $name_anchor."==><blockquote><h3>".$uk."</h3>".$_."<\/blockquote>\n##########END OF KEY\n";
		print FORMAT $name_anchor."\t<blockquote><h3>".$uk."</h3>".$newline."<\/blockquote>\n";
		#$IJM_key{$name_anchor}= "<blockquote><h3>$uk</h3>$_<\/blockquote>";
	}
	#next;
}#if( m/^1\./ ||
######################################################END OF KEY SECTION


######################################################BEGIN PROCESS FIELDS
		$exclude=0;
		#if(m/^UNABRIDGED/){$exclude=1;};
		if(s/UNABRIDGED\nURBAN WEED EXPECTED IN WILDLANDS//){
			$nativity=qq{URBAN WEED (expected in wildlands)};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\n(SPONTANEOUS HYBRID)//){
			$nativity=qq{$1};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\n(AGRICULTURAL, GARDEN, OR URBAN WEED|GARDEN WEED|GARDEN AND URBAN WEED|URBAN WEED|HISTORICAL WAIF|CULTIVATED PLANT|AGRICULTURAL WEED)//){
			$nativity=qq{$1};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\s+WAIF//){
			$nativity=qq{WAIF};
		$exclude=1;
		}
		elsif(s/^WAIF//){
			$nativity=qq{WAIF};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\nJFP-8, (.*)//){
			$nativity=qq{$1};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\nJFP-4, (URBAN WEED)//){
			$nativity=qq{$1};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\s+JFP-4//){
			$nativity=qq{AGRICULTURAL, GARDEN, OR URBAN WEED};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\nEXTIRPATED (WAIF|ALIEN)//){
			$nativity=qq{$1 (extirpated)};
		$exclude=1;
		}
		elsif(s/UNABRIDGED\nNATURALIZED\nEXTIRPATED//){
			$nativity=qq{NATURALIZED (extirpated)};
		$exclude=1;
		}
		elsif(s/NATIVE OR NATURALIZED//){
			$nativity=qq{NATIVE OR NATURALIZED};
		}
		elsif(s/NATURALIZED//){
			$nativity=qq{NATURALIZED};
		}
		elsif(s/NATIVE\nEXTIRPATED//){
			$nativity=qq{NATIVE (extirpated)};
		}
		elsif(s/NATIVE//){
			$nativity=qq{NATIVE};
		}
		elsif(s/^UNABRIDGED *\n//){
			$exclude=1;
		}
		#no else
		$nativity=qq{$nativity} if $nativity;
		

#foreach(@all_pars){


		if(s|^([A-Z]+ACEAE) \(([A-Z][a-z]+)\)$|$1 ($2)|ms){
			$key_genus=$1;
			$key_genus=ucfirst(lc($key_genus));

			if($NAME_TO_CODE{$key_genus}){
				#s/<center>/<a name="$NAME_TO_CODE{$key_genus}"> <\/a>\n\n<center>/;
				$name_anchor = $NAME_TO_CODE{$key_genus};

				#check to see if all genera have a tid
					unless ($name_anchor =~ m/^\d+$/){
						next if $name_anchor =~ m/^NULL$/i;
						print "TAXON_ID (1) non numerical or NULL: $name_anchor==>$key_genus\n";
					}

#print "2\n" if $name_anchor==76377;
				if($key_genus=~/aceae\b/){
					
					$last_family=$name_anchor;
					$last_genus="";
				#check to see if all families have a tid
					unless ($last_family =~ m/^\d+$/){
						next if $name_anchor =~ m/^NULL$/i;
						print "TAXON_ID (2) non numerical or NULL: $name_anchor==>$last_family\n";
					}
				}
				else{
					$last_genus=$name_anchor;
#$last_species="";
				}
			}			
			else {
				print ERR "$key_genus not found in lists\n\n";
				next if $name_anchor =~ m/^NULL$/i;
				print "TAXON_ID (3) non numerical or NULL: $key_genus\n";
			}
		}#if(s|^([A-Z]+ACEAE)
		
		if(s|^([A-Z]+)$|$1|ms){
			$key_genus=$1;
			$key_genus=ucfirst(lc($key_genus));
			
			if($NAME_TO_CODE{$key_genus}){
				#s/<center>/<a name="$NAME_TO_CODE{$key_genus}"> <\/a>\n\n<center>/;
				$name_anchor = $NAME_TO_CODE{$key_genus};

				#check to see if all genera have a tid
					unless ($name_anchor =~ m/^\d+$/){
					next if $name_anchor =~ m/^NULL$/i;
						print "TAXON_ID (4) non numerical or NULL: $name_anchor==>$key_genus\n";
					}

#print "4\n" if $name_anchor==76377;
				if($key_genus=~/aceae\b/){
					$last_family=$name_anchor;
					$last_genus="";
					
					#check to see if all families have a tid
					unless ($last_family =~ m/^\d+$/){
						next if $name_anchor =~ m/^NULL$/i;
						print "TAXON_ID (5) non numerical or NULL: $name_anchor==>$last_family\n";
					}
					
				}
				else{
					$last_genus=$name_anchor;
#$last_species="";
				}
			}
			else {
				print ERR "$key_genus not found in lists\n\n";
				next if $name_anchor =~ m/^NULL$/i;
				print "TAXON_ID (6) non numerical or NULL: $key_genus $_\n";

			}
		}#if(s|^([A-Z]+)$|
		
		
#foreach(@all_pars){

		if(m/UNABRIDGED SYNONYMS?: *(.+)/){
			$syns=&format_syns($1);
			s/(UNABRIDGED SYNONYMS?:).*/Unabridged synonyms: [$syns]/;
		}
		if(m/^MISAPPLIED NAMES?: *(.+)/m){
			$syns=&format_syns($1);
			s/^(MISAPPLIED NAMES?:).*/$1 [$syns]/m;
		}
		if(m/UNABRIDGED MISAPPLIED NAMES?: *(.+)/){
			$syns=&format_syns($1);
			s/(UNABRIDGED MISAPPLIED NAMES?:).*/Unabridged misapplied names: [$syns]/;
		}



#foreach(@all_pars){
############GET infra name for links
		if(m/^([A-Z][A-Z]+) +([a-z-]+).*(var\.|nothosubsp\.|subsp\.) ([a-z-]+) *\n/m){
#SAGITTARIA montevidensis Cham. & Schltdl. subsp. calycina
			$key_species=$2;
			$name_link=ucfirst(lc("$1 $2 $3 $4"));
			#$name_link=~s/ x / X /;
#print "1 NL $name_link\n";
			$name_for_hc=$name_link;

			if($NAME_TO_CODE{$name_link}){
				$name_anchor = $NAME_TO_CODE{$name_link};
#print "6\n" if $name_anchor==76377;
			}
			else{
				print ERR "2. NO $name_link\n\n";
				$name_link= "flabba0";
			}
#print "$name_link\n";
		}#if(m/^([A-Z][A-Z]+) +
		
		
		
#foreach(@all_pars){
############GET hybrid name for links
		elsif(m|^([A-Z][A-Z]+) +(&times;[a-z-]+) *\n|m){
			$trinomial="$1 $2";
			#$trinomial=~s/&times;/X /;
#print "flabba $trinomial\n";
			$epithet=$2;
			$name_link=ucfirst(lc($trinomial));
#print "2 NL $name_link\n";
			$name_for_hc=$name_link;
			
				if($NAME_TO_CODE{$name_link}){
					$name_anchor = $NAME_TO_CODE{$name_link};
					unless($name_link=~/\b(subsp\.|var\.|f\.)\b/){
						$last_species=$name_anchor;
					}
				}#if($NAME_TO_CODE
				else{
				
					if($name_link=~/Quercus x/i){
						warn "NAME_LINK==>$name_link\n";
					}
				}
		}#elsif(m|^([A-Z][A-Z]+)

#foreach(@all_pars){
############GET name for links
		elsif(m|^([A-Z][A-Z]+) +([a-z-]+) *\n|m){
			$trinomial="$1 $2";
			$key_species=$2;
#print "flabba $trinomial\n";
			$epithet=$2;
			$name_link=ucfirst(lc($trinomial));
			$name_link=~s/ x / X /;
#print "2 NL $name_link\n";
			$name_for_hc=$name_link;

				if($NAME_TO_CODE{$name_link}){
					$name_anchor = $NAME_TO_CODE{$name_link};
#print "8\n" if $name_anchor==76377;
					unless($name_link=~/\b(subsp\.|var\.|f\.)\b/){
						$last_species=$name_anchor;
					}

				$name_link= <<EOP;
<a href="/cgi-bin/get_cpn.pl?$NAME_TO_CODE{$name_link}">[Online Interchange]</a>
EOP
#print "3 NA $name_anchor\n";
				}
				else{
					print ERR "1. NO NAME_TO_CODE ${name_link}<\n\n";
					#die "Missing name in NAME_TO_CODE: $name_link. Terminating load\n";
					$name_link= "flabba2";
				}

		}#elsif(m|^([A-Z][A-Z]+)
		else{
		#print "END OF LINES==>>>$_\n";
		}
		
#foreach(@all_pars){

#foreach(@all_pars){
############GET CNPS rarity
		if(s/RARITY STATUS: (SYMBOL \d).?//){
			$rarity="$1";
		}
		else{
			$rarity="";
		}
		
		
#foreach(@all_pars){
			if(m/--[0-9]+\(--[0-9]/ || m/[0-9]--\)[0-9]+--/){
				s/(--[0-9]+\()--([0-9]+)/$1$2/g;
				s/([0-9]+)--\)([0-9]+--)/$1)$2/g;
			}

		s/([0-9])-([0-9])/$1&ndash;$2/;

		while(s/_/<i>/){
			s/_/<\/i>/;
		}

		if(m/^SYNONYMS?: *(.+)/m){
			$syns=&format_syns($1);
			s/^SYNONYMS?:.*/[$syns]/m;
		}


		if(m/NATURALIZED|NATIVE|WAIF/){
			#warn "$name_anchor name_link is $name_link\n";

		}
######end of field processing


		#print "NAME ANCHOR: $name_anchor $NAN{$name_anchor}\n";
		$sequence_string="$last_family, $last_genus";
		$nan=$CODE_TO_NAME{$name_anchor};
		#print "1: $sequence_string $nan\n";
				if($nan=~m/(.+) (nothosubsp\.|subsp\.|var\.) .+/){ #forma is skipped because no accepted names are formae as of 2020
					$nan_species=$NAME_TO_CODE{$1};
					$nan_species_name = $1;
				#print "2: $sequence_string $nan==>$nan_species\n";
					if($IJM{$nan_species_name}){
						$sequence_string .= ", $nan_species, $name_anchor";
				#print "3: $sequence_string $nan\n";
					}
					else{
						$sequence_string .= ", $name_anchor";
				#print "4: $sequence_string $nan $name_anchor\n";
						#push(@name_sequence,$name_anchor);
					}
				}
				else{
						$sequence_string .= ", $name_anchor";
				#print "5: $sequence_string $nan $name_anchor\n";
				}
			push(@name_sequence,$sequence_string);

			#$IJM{$name_anchor}= $nan."\t".$name_anchor."\t".$nativity."\t".$rarity."\t".$sequence_string."\n";
			#$IJM{$name_anchor}= $nan."\t".$name_anchor."\t".$sequence_string."\n";

				++$element;
}#foreach(@all_pars){

open(OUT, ">output/IJM_sequence.txt");
foreach(@name_sequence){
	@elements=split(/, /,$_);
	%seen=();
	foreach(@elements){
		next unless /\d/;
		next if $seen{$_}++;
		print OUT "$_, ";
	}
	print OUT "\n";
}


open(OUT, ">output/IJM_sequence_names.txt");
foreach(@name_sequence){
	@elements=split(/, /,$_);
	%seen=();
	foreach(@elements){
		next unless /\d/;
		print OUT $CODE_TO_NAME{$_}."=> ";
		next if $seen{$_}++;
		print OUT "$_, ";
	}
	print OUT "\n";
}



#untie(%IJM);
#untie(%IJM_key);

print <<EOP;
Provide a brief precis of the changes.
Default, if you provide nothing, will be "Minor corrections"
EOP
$/="\n";
$precis=<>;
$precis="Minor corrections" unless $precis=~/../;
$date=localtime();
open(HISTORY, "../eflora_keys/output/IJM_update_history_log.txt") || die;
print HISTORY <<EOP;
<br>$date: $precis
EOP
close(HISTORY);
close(ERR);
close(OUT);

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
		s/f\. ex /f._ex /;
		s/ f\. ([^ ]+)/ f. <i>$1<\/i>/;
		s/f\._ex /f. ex /;
	}
	$syns=join("; ", @syns);
	$syns=~s/^\[//;
	$syns=~s/\]//;
	#print "$syns\n";
	$syns=~s/ X_/ &#215;/g;
	#print "$syns\n";
	$syns;
}

